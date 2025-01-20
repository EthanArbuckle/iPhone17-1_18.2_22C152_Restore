@interface UNCSettingsRemotePersistenceService
+ (id)_allowedClasses;
+ (id)clientInterface;
+ (id)serverInterface;
@end

@implementation UNCSettingsRemotePersistenceService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)clientInterface___interface;

  return v2;
}

uint64_t __54__UNCSettingsRemotePersistenceService_clientInterface__block_invoke()
{
  clientInterface___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270CFF820];

  return MEMORY[0x270F9A758]();
}

+ (id)serverInterface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UNCSettingsRemotePersistenceService_serverInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, block);
  }
  v2 = (void *)serverInterface___interface;

  return v2;
}

void __54__UNCSettingsRemotePersistenceService_serverInterface__block_invoke(uint64_t a1)
{
  v45[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270CF1A50];
  v3 = (void *)serverInterface___interface;
  serverInterface___interface = v2;

  v4 = (void *)serverInterface___interface;
  v5 = [*(id *)(a1 + 32) _allowedClasses];
  [v4 setClasses:v5 forSelector:sel_sectionInfosForSectionIDs_effective_withHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)serverInterface___interface;
  v7 = [*(id *)(a1 + 32) _allowedClasses];
  [v6 setClasses:v7 forSelector:sel_sectionInfosForSectionIDs_effective_withHandler_ argumentIndex:0 ofReply:1];

  v8 = (void *)serverInterface___interface;
  v9 = [*(id *)(a1 + 32) _allowedClasses];
  [v8 setClasses:v9 forSelector:sel_allSectionIDsWithHandler_ argumentIndex:0 ofReply:1];

  v10 = (void *)serverInterface___interface;
  v11 = [*(id *)(a1 + 32) _allowedClasses];
  [v10 setClasses:v11 forSelector:sel_allSectionInfosByIDWithHandler_ argumentIndex:0 ofReply:1];

  v12 = (void *)serverInterface___interface;
  v13 = [*(id *)(a1 + 32) _allowedClasses];
  [v12 setClasses:v13 forSelector:sel_allSortedSectionInfos_withHandler_ argumentIndex:0 ofReply:1];

  v14 = (void *)serverInterface___interface;
  v15 = [*(id *)(a1 + 32) _allowedClasses];
  [v14 setClasses:v15 forSelector:sel_allSortedActiveSections_withHandler_ argumentIndex:0 ofReply:1];

  v16 = (void *)serverInterface___interface;
  v17 = [*(id *)(a1 + 32) _allowedClasses];
  [v16 setClasses:v17 forSelector:sel_setAllSectionInfoByID_withHandler_ argumentIndex:0 ofReply:0];

  v18 = (void *)serverInterface___interface;
  v19 = [*(id *)(a1 + 32) _allowedClasses];
  [v18 setClasses:v19 forSelector:sel_clearedSectionsByIDWithHandler_ argumentIndex:0 ofReply:1];

  v20 = (void *)serverInterface___interface;
  v21 = [*(id *)(a1 + 32) _allowedClasses];
  [v20 setClasses:v21 forSelector:sel_setClearedSectionsByID_withHandler_ argumentIndex:0 ofReply:0];

  v22 = (void *)serverInterface___interface;
  v23 = [*(id *)(a1 + 32) _allowedClasses];
  [v22 setClasses:v23 forSelector:sel_readSectionInfoWithHandler_ argumentIndex:0 ofReply:1];

  v24 = (void *)serverInterface___interface;
  v25 = [*(id *)(a1 + 32) _allowedClasses];
  [v24 setClasses:v25 forSelector:sel_readSavedClearedSectionsWithHandler_ argumentIndex:0 ofReply:1];

  v26 = (void *)serverInterface___interface;
  v27 = [*(id *)(a1 + 32) _allowedClasses];
  [v26 setClasses:v27 forSelector:sel_readSectionOrderWithHandler_ argumentIndex:0 ofReply:1];

  v28 = (void *)serverInterface___interface;
  v29 = [*(id *)(a1 + 32) _allowedClasses];
  [v28 setClasses:v29 forSelector:sel_readSectionInfoLegacyFileWithHandler_ argumentIndex:0 ofReply:1];

  v30 = (void *)serverInterface___interface;
  v31 = [*(id *)(a1 + 32) _allowedClasses];
  [v30 setClasses:v31 forSelector:sel_writeClearedSections_ argumentIndex:0 ofReply:0];

  v32 = (void *)serverInterface___interface;
  v33 = [*(id *)(a1 + 32) _allowedClasses];
  [v32 setClasses:v33 forSelector:sel_writeSectionInfo_ argumentIndex:0 ofReply:0];

  v34 = (void *)serverInterface___interface;
  v35 = [*(id *)(a1 + 32) _allowedClasses];
  [v34 setClasses:v35 forSelector:sel_writeSectionOrder_ argumentIndex:0 ofReply:0];

  v36 = (void *)serverInterface___interface;
  v37 = (void *)MEMORY[0x263EFFA08];
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  v39 = [v37 setWithArray:v38];
  [v36 setClasses:v39 forSelector:sel_getEffectiveGlobalScheduledDeliveryTimesWithHandler_ argumentIndex:0 ofReply:1];

  v40 = (void *)serverInterface___interface;
  v41 = (void *)MEMORY[0x263EFFA08];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  v43 = [v41 setWithArray:v42];
  [v40 setClasses:v43 forSelector:sel_setEffectiveGlobalScheduledDeliveryTimes_withHandler_ argumentIndex:0 ofReply:0];
}

+ (id)_allowedClasses
{
  if (_allowedClasses_onceToken != -1) {
    dispatch_once(&_allowedClasses_onceToken, &__block_literal_global_136);
  }
  uint64_t v2 = (void *)_allowedClasses_allowedClasses;

  return v2;
}

void __54__UNCSettingsRemotePersistenceService__allowedClasses__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:6];
  uint64_t v1 = [MEMORY[0x263EFFA08] setWithArray:v0];
  uint64_t v2 = (void *)_allowedClasses_allowedClasses;
  _allowedClasses_allowedClasses = v1;
}

@end