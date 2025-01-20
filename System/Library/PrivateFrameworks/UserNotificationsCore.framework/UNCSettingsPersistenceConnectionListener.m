@interface UNCSettingsPersistenceConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UNCSettingsPersistenceConnectionListener)init;
- (UNCSettingsPersistenceConnectionListener)initWithPersistentStore:(id)a3;
- (void)activate;
- (void)activeSectionIDsWithHandler:(id)a3;
- (void)addActiveSectionID:(id)a3 withHandler:(id)a4;
- (void)allSectionIDsWithHandler:(id)a3;
- (void)allSectionInfosByIDWithHandler:(id)a3;
- (void)allSortedActiveSections:(BOOL)a3 withHandler:(id)a4;
- (void)allSortedSectionInfos:(BOOL)a3 withHandler:(id)a4;
- (void)clearedInfoForSectionID:(id)a3 withHandler:(id)a4;
- (void)clearedSectionsByIDWithHandler:(id)a3;
- (void)dealloc;
- (void)deleteSectionInfoFile;
- (void)deleteSectionInfoLegacyFile;
- (void)getEffectiveGlobalAnnounceCarPlaySettingWithHandler:(id)a3;
- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalAnnounceSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalContentPreviewsSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalScheduledDeliverySettingWithHandler:(id)a3;
- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:(id)a3;
- (void)getEffectiveGlobalScheduledDeliveryTimesWithHandler:(id)a3;
- (void)hasSectionInfoLegacyFileWithHandler:(id)a3;
- (void)pairedSyncDeviceCountWithHandler:(id)a3;
- (void)readSavedClearedSectionsWithHandler:(id)a3;
- (void)readSectionInfoLegacyFileWithHandler:(id)a3;
- (void)readSectionInfoWithHandler:(id)a3;
- (void)readSectionInfoWithVersionNumberForMigrationWithHandler:(id)a3;
- (void)readSectionOrderWithHandler:(id)a3;
- (void)removeSectionWithID:(id)a3 withHandler:(id)a4;
- (void)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4 withHandler:(id)a5;
- (void)sectionInfosForSectionIDs:(id)a3 effective:(BOOL)a4 withHandler:(id)a5;
- (void)setClearedInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5;
- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3 withHandler:(id)a4;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5;
- (void)sortedSectionIDsWithHandler:(id)a3;
- (void)writeClearedSections:(id)a3;
- (void)writeSectionInfo:(id)a3;
- (void)writeSectionOrder:(id)a3;
@end

@implementation UNCSettingsPersistenceConnectionListener

- (UNCSettingsPersistenceConnectionListener)init
{
  v3 = objc_alloc_init(UNCNotificationSettingsPersistentStore);
  v4 = [(UNCSettingsPersistenceConnectionListener *)self initWithPersistentStore:v3];

  return v4;
}

- (UNCSettingsPersistenceConnectionListener)initWithPersistentStore:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UNCSettingsPersistenceConnectionListener;
  v6 = [(UNCSettingsPersistenceConnectionListener *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistentSettingsStore, a3);
    uint64_t v8 = +[UNCBulletinDefaults standardDefaults];
    bulletinDefaults = v7->_bulletinDefaults;
    v7->_bulletinDefaults = (UNCBulletinDefaults *)v8;

    v10 = [[UNCEffectiveSettings alloc] initWithBulletinDefaults:v7->_bulletinDefaults];
    effectiveSettingsProvider = v7->_effectiveSettingsProvider;
    v7->_effectiveSettingsProvider = v10;

    v12 = [[UNCSectionInfoStore alloc] initWithEffectiveSettings:v7->_effectiveSettingsProvider persistence:v7->_persistentSettingsStore];
    sectionInfoStore = v7->_sectionInfoStore;
    v7->_sectionInfoStore = v12;

    v14 = *MEMORY[0x263F1E050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_2608DB000, v14, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener created %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)activate
{
  v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletinboard.settingspersistenceconnection"];
  listener = self->_listener;
  self->_listener = v3;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener activate];
  id v5 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener activated for com.apple.bulletinboard.settingspersistenceconnection", v6, 2u);
  }
}

- (void)dealloc
{
  v3 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener dealloc", buf, 2u);
  }
  [(NSXPCListener *)self->_listener invalidate];
  v4.receiver = self;
  v4.super_class = (Class)UNCSettingsPersistenceConnectionListener;
  [(UNCSettingsPersistenceConnectionListener *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[UNCSettingsRemotePersistenceService clientInterface];
  [v7 setRemoteObjectInterface:v8];

  v9 = +[UNCSettingsRemotePersistenceService serverInterface];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  v10 = [MEMORY[0x263F29BE0] tokenFromNSXPCConnection:v7];
  v11 = [v10 bundleID];
  if (v11)
  {
    v12 = [v10 bundleID];
  }
  else
  {
    v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "pid"));
    v12 = [v13 stringValue];
  }
  v14 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v12;
    _os_log_impl(&dword_2608DB000, v14, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener accepting connection %@", buf, 0xCu);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v24[3] = &unk_265567728;
  id v15 = v12;
  id v25 = v15;
  [v7 setInterruptionHandler:v24];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke_10;
  v22 = &unk_265567728;
  id v16 = v15;
  id v23 = v16;
  [v7 setInvalidationHandler:&v19];
  objc_msgSend(v7, "resume", v19, v20, v21, v22);
  v17 = self->_connections;
  objc_sync_enter(v17);
  [(NSMutableArray *)self->_connections addObject:v7];
  objc_sync_exit(v17);

  return 1;
}

void __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener client connection interrupted: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __79__UNCSettingsPersistenceConnectionListener_listener_shouldAcceptNewConnection___block_invoke_10(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_DEFAULT, "SettingsPersistenceListener client connection invalidated: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a5;
  v10 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSNumber;
    v12 = v10;
    v13 = [v11 numberWithBool:v6];
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "Retrieving sectionInfo for %@ effective: %@", (uint8_t *)&v15, 0x16u);
  }
  v14 = [(UNCSectionInfoStore *)self->_sectionInfoStore sectionInfoForSectionID:v8 effective:v6];
  if (v9) {
    v9[2](v9, v14, 0);
  }
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void))a5;
  v11 = (os_log_t *)MEMORY[0x263F1E050];
  v12 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "Setting sectionInfo for ID %@: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    [(UNCSectionInfoStore *)self->_sectionInfoStore setSectionInfo:v8 forSectionID:v9];
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v13 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
  {
    -[UNCSettingsPersistenceConnectionListener setSectionInfo:forSectionID:withHandler:]((uint64_t)v9, v13);
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v10) {
LABEL_8:
  }
    v10[2](v10);
LABEL_9:
}

- (void)removeSectionWithID:(id)a3 withHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "Removing section with ID %@", (uint8_t *)&v9, 0xCu);
  }
  [(UNCSectionInfoStore *)self->_sectionInfoStore removeSectionWithID:v6];
  if (v7) {
    v7[2](v7);
  }
}

- (void)allSectionIDsWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCSectionInfoStore *)self->_sectionInfoStore allUnsortedSectionInfoIDs];
  id v6 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Reading allSectionIDs. Count: %lu", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    v4[2](v4, v5, 0);
  }
}

- (void)allSectionInfosByIDWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCSectionInfoStore *)self->_sectionInfoStore sectionInfoByID];
  id v6 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Reading allSectionInfosByID. Count %lu", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    v4[2](v4, v5, 0);
  }
}

- (void)activeSectionIDsWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCSectionInfoStore *)self->_sectionInfoStore activeSectionIDs];
  id v6 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Reading activeSectionIDs. Count %lu", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    v4[2](v4, v5, 0);
  }
}

- (void)addActiveSectionID:(id)a3 withHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  int v8 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "Adding activeSectionID %@", (uint8_t *)&v9, 0xCu);
  }
  [(UNCSectionInfoStore *)self->_sectionInfoStore addActiveSectionID:v6];
  if (v7) {
    v7[2](v7);
  }
}

- (void)allSortedActiveSections:(BOOL)a3 withHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(UNCSectionInfoStore *)self->_sectionInfoStore allSortedActiveSections:v4];
  int v8 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    int v10 = 134217984;
    uint64_t v11 = [v7 count];
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "Reading allSortedActiveSections. Count %lu", (uint8_t *)&v10, 0xCu);
  }
  if (v6) {
    v6[2](v6, v7, 0);
  }
}

- (void)allSortedSectionInfos:(BOOL)a3 withHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(UNCSectionInfoStore *)self->_sectionInfoStore allSortedSectionInfo:v4];
  int v8 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    int v10 = 134217984;
    uint64_t v11 = [v7 count];
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "Reading allSortedSectionInfos. Count %lu", (uint8_t *)&v10, 0xCu);
  }
  if (v6) {
    v6[2](v6, v7, 0);
  }
}

- (void)clearedInfoForSectionID:(id)a3 withHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  int v8 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "Reading clearedInfo for sectionID %@", (uint8_t *)&v10, 0xCu);
  }
  int v9 = [(UNCSectionInfoStore *)self->_sectionInfoStore clearedInfoForSectionID:v6];
  if (v7) {
    v7[2](v7, v9, 0);
  }
}

- (void)clearedSectionsByIDWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCSectionInfoStore *)self->_sectionInfoStore clearedSectionsByID];
  id v6 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Reading clearedSectionsByID. Count %lu", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    v4[2](v4, v5, 0);
  }
}

- (void)sectionInfosForSectionIDs:(id)a3 effective:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  uint64_t v10 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_2608DB000, v10, OS_LOG_TYPE_DEFAULT, "Reading sectionInfosForSectionIDs %@", (uint8_t *)&v12, 0xCu);
  }
  id v11 = [(UNCSectionInfoStore *)self->_sectionInfoStore sortedSectionInfoForSectionIDs:v8 effective:v6];
  if (v9) {
    v9[2](v9, v11, 0);
  }
}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  id v11 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl(&dword_2608DB000, v11, OS_LOG_TYPE_DEFAULT, "Setting clearedInfo for sectionID %@", (uint8_t *)&v12, 0xCu);
  }
  [(UNCSectionInfoStore *)self->_sectionInfoStore setClearedInfo:v8 forSectionID:v9];
  if (v10) {
    v10[2](v10);
  }
}

- (void)sortedSectionIDsWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCSectionInfoStore *)self->_sectionInfoStore sortedSectionIDs];
  BOOL v6 = (void *)*MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Reading sortedSectionIDs. Count %lu", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    v4[2](v4, v5, 0);
  }
}

- (void)readSavedClearedSectionsWithHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore readClearedSections];
  BOOL v6 = (os_log_t *)MEMORY[0x263F1E050];
  id v7 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSavedCleared: %@", (uint8_t *)&v9, 0xCu);
  }
  if (v4)
  {
    int v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSavedCleared invoking handler", (uint8_t *)&v9, 2u);
    }
    v4[2](v4, v5, 0);
  }
}

- (void)readSectionInfoWithHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore readSectionInfo];
  BOOL v6 = (os_log_t *)MEMORY[0x263F1E050];
  id v7 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSectionInfo %@", (uint8_t *)&v9, 0xCu);
  }
  if (v4)
  {
    int v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSectionInfo invoking handler", (uint8_t *)&v9, 2u);
    }
    v4[2](v4, v5, 0);
  }
}

- (void)readSectionOrderWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore readSectionOrder];
  BOOL v6 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener readSectionOrder %@", (uint8_t *)&v7, 0xCu);
  }
  if (v4) {
    v4[2](v4, v5, 0);
  }
}

- (void)writeClearedSections:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener writeClearedSections %@", (uint8_t *)&v6, 0xCu);
  }
  [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore writeClearedSections:v4];
}

- (void)writeSectionInfo:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener writeSectionInfo %@", (uint8_t *)&v6, 0xCu);
  }
  [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore writeSectionInfo:v4];
}

- (void)writeSectionOrder:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "UNCSettingsListener writeSectionOrder %@", (uint8_t *)&v6, 0xCu);
  }
  [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore writeSectionOrder:v4];
}

- (void)deleteSectionInfoFile
{
}

- (void)deleteSectionInfoLegacyFile
{
}

- (void)hasSectionInfoLegacyFileWithHandler:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore hasSectionInfoLegacyFile];
  uint64_t v5 = v6;
  if (v6)
  {
    (*((void (**)(id, BOOL, void))v6 + 2))(v6, v4, 0);
    uint64_t v5 = v6;
  }
}

- (void)readSectionInfoLegacyFileWithHandler:(id)a3
{
  uint64_t v5 = (void (**)(id, void *, void))a3;
  BOOL v4 = [(UNCNotificationSettingsPersistentStore *)self->_persistentSettingsStore readSectionInfoLegacy];
  if (v5) {
    v5[2](v5, v4, 0);
  }
}

- (void)readSectionInfoWithVersionNumberForMigrationWithHandler:(id)a3
{
  if (a3)
  {
    persistentSettingsStore = self->_persistentSettingsStore;
    BOOL v4 = (void (**)(id, id, void))a3;
    id v5 = [(UNCNotificationSettingsPersistentStore *)persistentSettingsStore readSectionInfoWithVersionNumberForMigration];
    v4[2](v4, v5, 0);
  }
}

- (void)getEffectiveGlobalAnnounceCarPlaySettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalAnnounceCarPlaySetting], 0);
  }
}

- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalAnnounceHeadphoneSetting], 0);
  }
}

- (void)getEffectiveGlobalAnnounceSettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalAnnounceSetting], 0);
  }
}

- (void)getEffectiveGlobalContentPreviewsSettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalContentPreviewSetting], 0);
  }
}

- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalNotificationListDisplayStyleSetting], 0);
  }
}

- (void)getEffectiveGlobalScheduledDeliverySettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalScheduledDeliverySetting], 0);
  }
}

- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    (*((void (**)(id, int64_t, void))a3 + 2))(v5, [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalScheduledDeliveryShowNextSummarySetting], 0);
  }
}

- (void)getEffectiveGlobalScheduledDeliveryTimesWithHandler:(id)a3
{
  if (a3)
  {
    effectiveSettingsProvider = self->_effectiveSettingsProvider;
    id v5 = a3;
    id v6 = [(UNCEffectiveSettings *)effectiveSettingsProvider effectiveGlobalScheduledDeliveryTimes];
    (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
  }
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalAnnounceCarPlaySetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalAnnounceHeadphoneSetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalAnnounceSetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalContentPreviewSetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalNotificationListDisplayStyleSetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalScheduledDeliverySetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalScheduledDeliveryShowNextSummarySetting:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3 withHandler:(id)a4
{
  id v7 = a4;
  [(UNCEffectiveSettings *)self->_effectiveSettingsProvider setGlobalScheduledDeliveryTimes:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)pairedSyncDeviceCountWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfoStore, 0);
  objc_storeStrong((id *)&self->_effectiveSettingsProvider, 0);
  objc_storeStrong((id *)&self->_bulletinDefaults, 0);
  objc_storeStrong((id *)&self->_persistentSettingsStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)setSectionInfo:(uint64_t)a1 forSectionID:(NSObject *)a2 withHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "-setSectionInfo:forSectionID: called with nil section info for ID %@. Use -removeSectionWithID instead", (uint8_t *)&v2, 0xCu);
}

@end