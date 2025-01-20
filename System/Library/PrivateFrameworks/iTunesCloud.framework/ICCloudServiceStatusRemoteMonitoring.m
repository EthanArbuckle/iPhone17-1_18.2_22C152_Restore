@interface ICCloudServiceStatusRemoteMonitoring
+ (id)_clientInterface;
+ (id)_serviceInterface;
+ (id)clientInterface;
+ (id)serviceInterface;
@end

@implementation ICCloudServiceStatusRemoteMonitoring

uint64_t __56__ICCloudServiceStatusRemoteMonitoring_serviceInterface__block_invoke(uint64_t a1)
{
  serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterface = [*(id *)(a1 + 32) _serviceInterface];

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__ICCloudServiceStatusRemoteMonitoring_clientInterface__block_invoke(uint64_t a1)
{
  clientInterface_sCloudServiceStatusRemoteMonitoringClientInterface = [*(id *)(a1 + 32) _clientInterface];

  return MEMORY[0x1F41817F8]();
}

+ (id)_clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF661600];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_storefrontCountryCodeDidChange_ argumentIndex:0 ofReply:0];

  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_storefrontIdentifierDidChange_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serviceInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICCloudServiceStatusRemoteMonitoring_serviceInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterfaceOnceToken != -1) {
    dispatch_once(&serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterfaceOnceToken, block);
  }
  v2 = (void *)serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterface;

  return v2;
}

+ (id)clientInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICCloudServiceStatusRemoteMonitoring_clientInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (clientInterface_sCloudServiceStatusRemoteMonitoringClientInterfaceOnceToken != -1) {
    dispatch_once(&clientInterface_sCloudServiceStatusRemoteMonitoringClientInterfaceOnceToken, block);
  }
  v2 = (void *)clientInterface_sCloudServiceStatusRemoteMonitoringClientInterface;

  return v2;
}

+ (id)_serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B780];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_beginObservingCloudServiceStatusWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_endObservingCloudServiceStatusWithToken_completionHandler_ argumentIndex:0 ofReply:0];

  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v5 forSelector:sel_requestCapabilitiesWithPrivacyPromptPolicy_completionHandler_ argumentIndex:1 ofReply:1];

  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v6 forSelector:sel_requestStorefrontCountryCodeWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v7 forSelector:sel_requestStorefrontCountryCodeWithCompletionHandler_ argumentIndex:1 ofReply:1];

  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v8 forSelector:sel_requestStorefrontIdentifierWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v9 forSelector:sel_requestStorefrontIdentifierWithCompletionHandler_ argumentIndex:1 ofReply:1];

  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v10 forSelector:sel_requestDeveloperTokenWithOptions_clientInfo_completionHandler_ argumentIndex:1 ofReply:0];

  v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v11 forSelector:sel_requestDeveloperTokenWithOptions_clientInfo_completionHandler_ argumentIndex:0 ofReply:1];

  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v12 forSelector:sel_requestDeveloperTokenWithOptions_clientInfo_completionHandler_ argumentIndex:1 ofReply:1];

  v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v13 forSelector:sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_ argumentIndex:0 ofReply:0];

  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v14 forSelector:sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_ argumentIndex:2 ofReply:0];

  v15 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v15 forSelector:sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_ argumentIndex:0 ofReply:1];

  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v16 forSelector:sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_ argumentIndex:1 ofReply:1];

  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v17 forSelector:sel_requestMusicKitTokensWithOptions_clientInfo_completionHandler_ argumentIndex:1 ofReply:0];

  v18 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v18 forSelector:sel_requestMusicKitTokensWithOptions_clientInfo_completionHandler_ argumentIndex:0 ofReply:1];

  v19 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v19 forSelector:sel_requestMusicKitTokensWithOptions_clientInfo_completionHandler_ argumentIndex:1 ofReply:1];

  return v2;
}

@end