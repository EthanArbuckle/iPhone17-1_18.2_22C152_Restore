@interface NUCoreAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation NUCoreAssembly

uint64_t __33__NUCoreAssembly_loadInRegistry___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 fetchAppConfigurationIfNeededWithCompletion:0];
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_17(uint64_t a1, void *a2)
{
  v2 = [a2 resolveProtocol:&unk_26D4E3920];
  v3 = [v2 subscriptionList];

  return v3;
}

NUFontManager *__33__NUCoreAssembly_loadInRegistry___block_invoke_24()
{
  v0 = objc_alloc_init(NUFontManager);

  return v0;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 resolveProtocol:&unk_26D4E3168];
  v3 = [v2 appConfigurationManager];

  return v3;
}

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerClass:objc_opt_class() factory:&__block_literal_global_5];
  id v6 = (id)[v5 inScope:2];

  v7 = [v3 publicContainer];
  id v8 = (id)[v7 registerProtocol:&unk_26D4E3168 factory:&__block_literal_global_178];

  v9 = [v3 publicContainer];
  id v10 = (id)[v9 registerProtocol:&unk_26D4E3920 factory:&__block_literal_global_257];

  v11 = [v3 publicContainer];
  v12 = [v11 registerProtocol:&unk_26D4E3CD8 factory:&__block_literal_global_296];
  id v13 = (id)[v12 withConfiguration:&__block_literal_global_299];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerClass:objc_opt_class() factory:&__block_literal_global_303];

  v16 = [v3 publicContainer];
  v17 = [v16 registerClass:objc_opt_class() factory:&__block_literal_global_307];
  id v18 = (id)[v17 inScope:2];

  v19 = [v3 publicContainer];
  v20 = [v19 registerClass:objc_opt_class() factory:&__block_literal_global_311];
  id v21 = (id)[v20 inScope:2];

  v22 = [v3 publicContainer];
  v23 = [v22 registerClass:objc_opt_class() factory:&__block_literal_global_315];
  id v24 = (id)[v23 inScope:2];

  v25 = [v3 publicContainer];
  v26 = [v25 registerClass:objc_opt_class() factory:&__block_literal_global_319];
  id v27 = (id)[v26 inScope:2];

  v28 = [v3 publicContainer];
  v29 = [v28 registerClass:objc_opt_class() factory:&__block_literal_global_323];
  id v30 = (id)[v29 inScope:2];

  v31 = [v3 publicContainer];
  v32 = [v31 registerClass:objc_opt_class() factory:&__block_literal_global_327];
  id v33 = (id)[v32 inScope:2];

  v34 = [v3 publicContainer];
  v35 = [v34 registerClass:objc_opt_class() factory:&__block_literal_global_331];
  id v36 = (id)[v35 inScope:2];

  v37 = [v3 publicContainer];
  v38 = [v37 registerClass:objc_opt_class() factory:&__block_literal_global_335];
  id v39 = (id)[v38 inScope:2];

  v40 = [v3 publicContainer];
  v41 = [v40 registerProtocol:&unk_26D4E4030 factory:&__block_literal_global_372];
  id v42 = (id)[v41 inScope:2];

  v43 = [v3 publicContainer];
  v44 = [v43 registerProtocol:&unk_26D4E4370 factory:&__block_literal_global_407];
  id v45 = (id)[v44 inScope:2];

  v46 = [v3 publicContainer];
  v47 = [v46 registerClass:objc_opt_class() factory:&__block_literal_global_411];
  id v48 = (id)[v47 inScope:2];

  v49 = [v3 publicContainer];
  v50 = [v49 registerProtocol:&unk_26D4E4540 factory:&__block_literal_global_427];
  id v51 = (id)[v50 inScope:2];

  v52 = [v3 publicContainer];
  v53 = [v52 registerClass:objc_opt_class() factory:&__block_literal_global_430];
  id v54 = (id)[v53 inScope:2];

  v55 = [v3 publicContainer];
  v56 = [v55 registerProtocol:&unk_26D4E47E0 factory:&__block_literal_global_449];
  id v57 = (id)[v56 inScope:2];

  v58 = [v3 publicContainer];
  v59 = [v58 registerClass:objc_opt_class() factory:&__block_literal_global_453];
  id v60 = (id)[v59 inScope:2];

  v61 = [v3 publicContainer];
  v62 = [v61 registerProtocol:&unk_26D4E5158 factory:&__block_literal_global_536];
  id v63 = (id)[v62 inScope:2];

  v64 = [v3 publicContainer];
  v65 = [v64 registerProtocol:&unk_26D4E5228 factory:&__block_literal_global_546];
  id v66 = (id)[v65 inScope:2];

  v67 = [v3 publicContainer];
  v68 = [v67 registerProtocol:&unk_26D4BE7D8 factory:&__block_literal_global_555];
  id v69 = (id)[v68 inScope:2];

  v70 = [v3 publicContainer];
  v71 = [v70 registerProtocol:&unk_26D4C75E8 factory:&__block_literal_global_562];
  id v72 = (id)[v71 inScope:0];

  id v74 = [v3 publicContainer];

  id v73 = (id)[v74 registerProtocol:&unk_26D4C74E8 factory:&__block_literal_global_572];
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  v4 = [v3 currentIssuesChecker];

  return v4;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

uint64_t __33__NUCoreAssembly_loadInRegistry___block_invoke_22()
{
  return [MEMORY[0x263F59350] sharedAccount];
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 userEventHistory];
  v4 = [v3 storage];

  return v4;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 shortcutList];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 audioPlaylist];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 puzzleHistory];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 shortcutCategoryList];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 readingList];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 issueReadingHistory];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 puzzleTypeSettings];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 readingHistory];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 tagSettings];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3920];
  id v3 = [v2 userInfo];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3168];
  id v3 = [v2 flintResourceManager];

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F59408];
  id v3 = a2;
  v4 = [v2 defaultConfiguration];
  v5 = FCURLForContainerizedUserAccountCachesDirectory();
  id v6 = objc_alloc(MEMORY[0x263F593F8]);
  v7 = [MEMORY[0x263F594B8] sharedInstance];
  id v8 = (void *)[v6 initWithContextConfiguration:v4 contentHostDirectoryFileURL:v5 feldsparIDProvider:v7];

  id v9 = objc_alloc(MEMORY[0x263F593E0]);
  id v10 = FCURLForContainerizedUserAccountDocumentDirectory();
  v11 = [MEMORY[0x263F59548] sharedNetworkReachability];
  v12 = [v3 resolveProtocol:&unk_26D4BBAF0];

  id v13 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v14 = [v13 userInterfaceIdiom] == 1;
  id v15 = [MEMORY[0x263F595E0] defaultAvailability];
  LOBYTE(v18) = v14;
  v16 = (void *)[v9 initWithConfiguration:v4 configurationManager:v8 contentHostDirectory:v5 privateDataHostDirectory:v10 privateDataActionProvider:0 networkBehaviorMonitor:0 networkReachability:v11 appActivityMonitor:v12 desiredHeadlineFieldOptions:0xF87FFFFC1 feedUsage:6 deviceIsiPad:v18 backgroundTaskable:0 privateDataSyncAvailability:v15 pptContext:0 options:0];

  return v16;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D4E3168];
  id v3 = [v2 articleController];

  return v3;
}

uint64_t __33__NUCoreAssembly_loadInRegistry___block_invoke_19()
{
  return [MEMORY[0x263F59548] sharedNetworkReachability];
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

NUSettings *__33__NUCoreAssembly_loadInRegistry___block_invoke_25()
{
  v0 = objc_alloc_init(NUSettings);

  return v0;
}

NUErrorMessageFactory *__33__NUCoreAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NUErrorMessageFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D4E47E0];

  v5 = [(NUErrorMessageFactory *)v3 initWithNetworkReachability:v4];

  return v5;
}

@end