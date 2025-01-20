@interface NUArticleAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation NUArticleAssembly

NUArticlePrefetcher *__36__NUArticleAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [NUArticlePrefetcher alloc];
  v4 = [v2 resolveProtocol:&unk_26D4C4370];
  v5 = [v2 resolveProtocol:&unk_26D4D5178];

  v6 = [(NUArticlePrefetcher *)v3 initWithArticleFactory:v4 articleDataProviderFactory:v5];

  return v6;
}

NUANFArticleDataProviderFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [NUANFArticleDataProviderFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D4E3168];
  v5 = [v2 resolveProtocol:&unk_26D4BE7D8];
  v6 = [v2 resolveProtocol:&unk_26D4E2648];
  v7 = [v2 resolveProtocol:&unk_26D4C4030];
  v8 = [v2 resolveClass:objc_opt_class()];

  v9 = [(NUANFArticleDataProviderFactory *)v3 initWithContentContext:v4 fontRegistration:v5 host:v6 embedDataManager:v7 linkedContentManagerFactory:v8];

  return v9;
}

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D4D5178 factory:&__block_literal_global_12];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D4C4370 factory:&__block_literal_global_198];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D4CBA18 factory:&__block_literal_global_208];

  v10 = [v3 publicContainer];
  v11 = [v10 registerProtocol:&unk_26D4C7390 factory:&__block_literal_global_216];
  id v12 = (id)[v11 inScope:3];

  v13 = [v3 publicContainer];
  v14 = [v13 registerProtocol:&unk_26D4CC658 factory:&__block_literal_global_231];
  id v15 = (id)[v14 inScope:2];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D4BB728 factory:&__block_literal_global_243];

  v18 = [v3 publicContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D4BE5D8 factory:&__block_literal_global_280];

  v20 = [v3 publicContainer];
  id v21 = (id)[v20 registerClass:objc_opt_class() factory:&__block_literal_global_304];

  v22 = [v3 publicContainer];
  id v23 = (id)[v22 registerClass:objc_opt_class() factory:&__block_literal_global_308];

  v24 = [v3 publicContainer];
  id v25 = (id)[v24 registerProtocol:&unk_26D4D45B0 factory:&__block_literal_global_322];

  v26 = [v3 publicContainer];
  id v27 = (id)[v26 registerClass:objc_opt_class() factory:&__block_literal_global_327_0];

  v28 = [v3 publicContainer];
  id v29 = (id)[v28 registerProtocol:&unk_26D4CA500 factory:&__block_literal_global_333];

  v30 = [v3 publicContainer];
  id v31 = (id)[v30 registerProtocol:&unk_26D4D4AA8 factory:&__block_literal_global_345];

  v32 = [v3 publicContainer];
  id v33 = (id)[v32 registerProtocol:&unk_26D4C35E0 factory:&__block_literal_global_349];

  v34 = [v3 publicContainer];
  id v35 = (id)[v34 registerProtocol:&unk_26D4CA418 factory:&__block_literal_global_357];

  v36 = [v3 publicContainer];
  id v37 = (id)[v36 registerClass:objc_opt_class() factory:&__block_literal_global_449_0];

  v38 = [v3 publicContainer];
  id v39 = (id)[v38 registerClass:objc_opt_class() factory:&__block_literal_global_890];

  v40 = [v3 publicContainer];
  id v41 = (id)[v40 registerProtocol:&unk_26D4C70A8 factory:&__block_literal_global_898];

  v42 = [v3 publicContainer];
  id v43 = (id)[v42 registerProtocol:&unk_26D4C42C0 factory:&__block_literal_global_923];

  v44 = [v3 publicContainer];
  id v45 = (id)[v44 registerProtocol:&unk_26D4C39E8 factory:&__block_literal_global_930];

  v46 = [v3 publicContainer];
  id v47 = (id)[v46 registerProtocol:&unk_26D4C3AE8 factory:&__block_literal_global_939];

  v48 = [v3 publicContainer];
  v49 = [v48 registerClass:objc_opt_class() factory:&__block_literal_global_942];
  id v50 = (id)[v49 withConfiguration:&__block_literal_global_945];

  v51 = [v3 publicContainer];
  id v52 = (id)[v51 registerProtocol:&unk_26D4C3FB0 factory:&__block_literal_global_951];

  v53 = [v3 publicContainer];
  v54 = [v53 registerProtocol:&unk_26D4C4030 factory:&__block_literal_global_954];
  id v55 = (id)[v54 inScope:2];

  v56 = [v3 privateContainer];
  id v57 = (id)[v56 registerProtocol:&unk_26D4CB7A8 factory:&__block_literal_global_966];

  v58 = [v3 publicContainer];
  id v59 = (id)[v58 registerProtocol:&unk_26D4C7910 factory:&__block_literal_global_973];

  v60 = [v3 publicContainer];
  id v61 = (id)[v60 registerProtocol:&unk_26D4CCB00 factory:&__block_literal_global_979];

  v62 = [v3 publicContainer];
  id v63 = (id)[v62 registerProtocol:&unk_26D4CBFD0 factory:&__block_literal_global_987];

  v64 = [v3 publicContainer];
  v65 = [v64 registerClass:objc_opt_class() factory:&__block_literal_global_990];
  id v66 = (id)[v65 withConfiguration:&__block_literal_global_993];

  v67 = [v3 publicContainer];
  id v68 = (id)[v67 registerClass:objc_opt_class() factory:&__block_literal_global_996];

  v69 = [v3 publicContainer];
  id v70 = (id)[v69 registerProtocol:&unk_26D4BEAF8 factory:&__block_literal_global_998];

  id v72 = [v3 publicContainer];

  id v71 = (id)[v72 registerProtocol:&unk_26D4C84D8 factory:&__block_literal_global_1001];
}

void __36__NUArticleAssembly_loadInRegistry___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];

  [v4 addLinkedContentProviderFactory:v6];
}

NUANFArticleFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUANFArticleFactory alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];

  id v5 = [(NUANFArticleFactory *)v3 initWithArticleController:v4];

  return v5;
}

NUANFEmbedConfigurationLoader *__36__NUArticleAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUANFEmbedConfigurationLoader alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E3CD8];
  id v5 = [v2 resolveClass:objc_opt_class()];

  id v6 = [(NUANFEmbedConfigurationLoader *)v3 initWithAppConfigManager:v4 flintResourceManager:v5];

  return v6;
}

NUANFLinkedContentProviderFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUANFLinkedContentProviderFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E3168];

  id v5 = [(NUANFLinkedContentProviderFactory *)v3 initWithContentContext:v4];

  return v5;
}

NULinkedContentManagerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_30()
{
  v0 = objc_alloc_init(NULinkedContentManagerFactory);

  return v0;
}

NUEmbedDataManager *__36__NUArticleAssembly_loadInRegistry___block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUEmbedDataManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4CB7A8];

  id v5 = [(NUEmbedDataManager *)v3 initWithEmbedConfigurationLoader:v4];

  return v5;
}

NUDocumentSectionBlueprintProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_3()
{
  v0 = objc_alloc_init(NUDocumentSectionBlueprintProvider);

  return v0;
}

NUNoopChromeControl *__36__NUArticleAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(NUNoopChromeControl);

  return v0;
}

NUArticleViewControllerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUArticleViewControllerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4D5178];
  id v5 = [v2 resolveProtocol:&unk_26D4BBCF0];
  id v6 = [v2 resolveProtocol:&unk_26D4BEAF8];
  id v7 = [v2 resolveProtocol:&unk_26D4CBA18];
  v8 = [v2 resolveProtocol:&unk_26D4CC658];
  id v9 = [v2 resolveProtocol:&unk_26D4C84D8];
  v10 = [v2 resolveOptionalProtocol:&unk_26D4E53E8];
  v11 = [(NUArticleViewControllerFactory *)v3 initWithArticleDataProviderFactory:v4 appStateMonitor:v5 keyCommandManager:v6 headerBlueprintProvider:v7 articlePrefetcher:v8 articleScrollPositionManager:v9 spotlightManager:v10 resolver:v2];

  return v11;
}

NUArticleHostViewControllerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUArticleHostViewControllerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4BB728];
  id v5 = [v2 resolveProtocol:&unk_26D4C75E8];
  id v6 = [v2 resolveProtocol:&unk_26D4C74E8];
  id v7 = [v2 resolveProtocol:&unk_26D4CCE00];

  v8 = [(NUArticleHostViewControllerFactory *)v3 initWithArticleViewControllerFactory:v4 settings:v5 errorMessageFactory:v6 contentSizeManager:v7];

  return v8;
}

NUArticleHostViewControllerProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_8()
{
  v0 = objc_alloc_init(NUArticleHostViewControllerProvider);

  return v0;
}

NUArticleContainerViewController *__36__NUArticleAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUArticleContainerViewController alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4D45B0];
  id v5 = [v2 resolveProtocol:&unk_26D4C35E0];

  id v6 = [(NUArticleContainerViewController *)v3 initWithPagingFactory:v4 router:v5];

  return v6;
}

NUPagingEngine *__36__NUArticleAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUPagingEngine alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];

  id v5 = [(NUPagingEngine *)v3 initWithArticlePageFactory:v4];

  return v5;
}

NUArticlePageFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUArticlePageFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4C4370];
  id v5 = [v2 resolveProtocol:&unk_26D4CA500];
  id v6 = [v2 resolveProtocol:&unk_26D4BE5D8];

  id v7 = [(NUArticlePageFactory *)v3 initWithArticleFactory:v4 articleActivityFactory:v5 articleHostViewControllerFactory:v6];

  return v7;
}

NUArticleActivityManagerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D4CB6B0];
  id v7 = [v2 resolveProtocol:&unk_26D4D4AA8];

  v8 = [[NUArticleActivityManagerFactory alloc] initWithReadingHistory:v4 readingList:v3 subscriptionList:v5 URLHandler:v6 optionsProvider:v7];

  return v8;
}

NUArticleActivityDefaultOptionsProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_13()
{
  v0 = objc_alloc_init(NUArticleActivityDefaultOptionsProvider);

  return v0;
}

NURouter *__36__NUArticleAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NURouter alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4CB6B0];

  id v5 = [(NURouter *)v3 initWithURLHandler:v4];

  return v5;
}

NUStoreFrontProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUStoreFrontProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E5158];

  id v5 = [(NUStoreFrontProvider *)v3 initWithAppleAccount:v4];

  return v5;
}

NUMediaSharingPolicyProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUMediaSharingPolicyProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E2540];
  id v5 = [v2 resolveProtocol:&unk_26D4E3CD8];

  id v6 = [(NUMediaSharingPolicyProvider *)v3 initWithHeadline:v4 appConfigurationManager:v5];

  return v6;
}

NUWebContentLoadingPolicyProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUWebContentLoadingPolicyProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E2540];

  id v5 = [(NUWebContentLoadingPolicyProvider *)v3 initWithHeadline:v4];

  return v5;
}

NUReachabilityProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUReachabilityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E47E0];

  id v5 = [(NUReachabilityProvider *)v3 initWithNetworkReachability:v4];

  return v5;
}

NUANFDebugSettingsProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_19()
{
  v0 = objc_alloc_init(NUANFDebugSettingsProvider);

  return v0;
}

id __36__NUArticleAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __36__NUArticleAssembly_loadInRegistry___block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

NUURLHandler *__36__NUArticleAssembly_loadInRegistry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveProtocol:&unk_26D4E3CD8];
  id v4 = [v3 appConfiguration];
  id v5 = [NUURLHandler alloc];
  id v6 = [v2 resolveProtocol:&unk_26D4CB6B0];

  id v7 = -[NUURLHandler initWithURLHandling:universalLinksEnabled:](v5, "initWithURLHandling:universalLinksEnabled:", v6, [v4 universalLinksEnabled]);

  return v7;
}

void __36__NUArticleAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v7 = objc_alloc_init(NUDeepLinkURLModifier);
  [v4 addModifier:v7];
  id v6 = [v5 resolveProtocol:&unk_26D4BC3A0];

  [v4 setWebViewControllerFactory:v6];
}

uint64_t __36__NUArticleAssembly_loadInRegistry___block_invoke_24(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D4C4030];
}

NUWebContentContentRuleProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUWebContentContentRuleProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E3CD8];
  id v5 = [v2 resolveProtocol:&unk_26D4E2540];

  id v6 = [(NUWebContentContentRuleProvider *)v3 initWithAppConfigurationManager:v4 headline:v5];

  return v6;
}

NUWebContentComponentDeveloperSettingsProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUWebContentComponentDeveloperSettingsProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E2540];

  id v5 = [(NUWebContentComponentDeveloperSettingsProvider *)v3 initWithHeadline:v4];

  return v5;
}

NUANFRenderingConfigurationProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUANFRenderingConfigurationProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D4E3CD8];

  id v5 = [(NUANFRenderingConfigurationProvider *)v3 initWithAppConfigurationManager:v4];

  return v5;
}

NUArticleKeyCommandManager *__36__NUArticleAssembly_loadInRegistry___block_invoke_33()
{
  v0 = objc_alloc_init(NUArticleKeyCommandManager);

  return v0;
}

NUArticleScrollPositionManager *__36__NUArticleAssembly_loadInRegistry___block_invoke_34()
{
  v0 = objc_alloc_init(NUArticleScrollPositionManager);

  return v0;
}

@end