@interface SLDSyndicationService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (void)removeMessageGUIDFromSyndication:(id)a3 reply:(id)a4;
@end

@implementation SLDSyndicationService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC4CFD8;
}

+ (id)sharedService
{
  if (sharedService_onceToken_9 != -1) {
    dispatch_once(&sharedService_onceToken_9, &__block_literal_global_20);
  }
  v2 = (void *)sharedService_sService_9;
  return v2;
}

uint64_t __38__SLDSyndicationService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDSyndicationService);
  uint64_t v1 = sharedService_sService_9;
  sharedService_sService_9 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)removeMessageGUIDFromSyndication:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = SLDaemonLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "%s messageGUID: %@", (uint8_t *)&v12, 0x16u);
  }

  if (![v5 length])
  {
    v9 = SLDaemonLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]((uint64_t)v5, v9);
    }
    goto LABEL_14;
  }
  if (!IMCoreLibraryCore_0() || !getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc())
  {
    v9 = SLDaemonLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SLDSyndicationService removeMessageGUIDFromSyndication:reply:](v9);
    }
LABEL_14:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    v13 = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_INFO, "%s: Calling remove message guid: %@", (uint8_t *)&v12, 0x16u);
  }

  v9 = v5;
  IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc = (void (*))getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc();
  if (!IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc) {
    SLDCreateGroupPhotoImageWithGroupID_cold_1();
  }
  IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc(v9);
  uint64_t v11 = 1;
LABEL_15:

  v6[2](v6, v11);
}

- (void)removeMessageGUIDFromSyndication:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "%s: invalid messageGUID passed in: %@", (uint8_t *)&v2, 0x16u);
}

- (void)removeMessageGUIDFromSyndication:(os_log_t)log reply:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "%s: IMSPIRemoveMessageGUIDFromSyndication is unavailable.", (uint8_t *)&v1, 0xCu);
}

@end