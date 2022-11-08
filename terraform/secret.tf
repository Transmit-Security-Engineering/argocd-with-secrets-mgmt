resource "kubernetes_secret" "vault_secret" {
  metadata {
    name      = "argocd-vault-plugin-credentials"
    namespace = "argocd"
  }
  data = {
    AVP_AUTH_TYPE = "approle"
    AVP_ROLE_ID = var.vault_plugin_role_id
    AVP_SECRET_ID = var.vault_plugin_secret_id
    AVP_TYPE = "vault"
    VAULT_ADDR = "PATH_TO_VAULT_SERVER"
  }
  depends_on = [module.eks]
}