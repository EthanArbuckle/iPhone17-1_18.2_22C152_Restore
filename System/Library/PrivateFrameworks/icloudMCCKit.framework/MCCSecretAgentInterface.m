@interface MCCSecretAgentInterface
+ (id)XPCInterface;
@end

@implementation MCCSecretAgentInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)XPCInterface_interface;
  return v2;
}

void __39__MCCSecretAgentInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270E0F318];
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v17, v16, v15, v14, v13, v12, v11, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(),
  v19 = 0);
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_generateCertificateWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_listCertificatesWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_listCertificatesForEmail_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_fetchSigningAndEncryptingStatusForEmailAddress_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_setSigningAndEncrytingStatusTo_forEmailAddress_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_setSignIsEnabled_forEmailAddress_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_setEncryptIsEnabled_forEmailAddress_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_updateCertificateDefaultsForEmailAddress_certInfo_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_refreshCertificateWithContext_certId_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_predictCommerceEmailWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_isModelReadyWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_invokeModelDownloadWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_syncToWeb_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_registerCategoryRulesCallbackListener_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_sendPendingRulesWithType_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_createWebRule_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_syncRecategorizationRules_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_getIABCategoryID_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_isPersonalDomain_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_getBlackPearlVersionWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v19 forSelector:sel_clearAllUserOverridesWithTimestamp_completion_ argumentIndex:0 ofReply:0];
}

@end