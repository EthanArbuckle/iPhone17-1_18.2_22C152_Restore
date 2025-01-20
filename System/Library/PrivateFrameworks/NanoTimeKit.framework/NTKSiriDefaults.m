@interface NTKSiriDefaults
+ (id)sharedInstance;
- (BOOL)hasMigratedDataSources;
- (BOOL)hasMigratedDisabledDataSources;
- (BOOL)isUpNextFaceCurrentlyActive;
- (BOOL)watchHasMigratedAvailableDataSources;
- (NSSet)disabledDataSources;
- (NSSet)phoneThirdPartyDataSources;
- (NSSet)watchThirdPartyDataSources;
- (NTKSiriDefaults)init;
- (id)_domainAccesor;
- (void)_activeDeviceDidChange:(id)a3;
- (void)_disabledDataSourcesDidChange;
- (void)_fetchNewFaceCollection;
- (void)_synchronizeDefaultsForKeys:(id)a3;
- (void)_thirdPartyDataSourcesDidChange;
- (void)faceCollectionDidLoad:(id)a3;
- (void)migrateIfNecessary;
- (void)setDisabledDataSources:(id)a3;
- (void)setPhoneThirdPartyDataSources:(id)a3;
- (void)setWatchHasMigratedAvailableDataSources:(BOOL)a3;
- (void)setWatchThirdPartyDataSources:(id)a3;
@end

@implementation NTKSiriDefaults

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NTKSiriDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_3;
  return v2;
}

void __33__NTKSiriDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v1;
}

- (NTKSiriDefaults)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSiriDefaults;
  v2 = [(NTKSiriDefaults *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(NTKSiriDefaults *)v2 _fetchNewFaceCollection];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__activeDeviceDidChange_ name:*MEMORY[0x1E4F19620] object:0];

    v5 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__NTKSiriDefaults_init__block_invoke;
    block[3] = &unk_1E62BFF20;
    v8 = v3;
    dispatch_async(v5, block);
  }
  return v3;
}

uint64_t __23__NTKSiriDefaults_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) migrateIfNecessary];
}

- (void)migrateIfNecessary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NTKSiriDefaults *)v2 _domainAccesor];
  if ([v3 BOOLForKey:@"SiriDefaultsWatchHasMigratedDisabledDataSources"])
  {
    v4 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "[Migration] Preferences have already been migrated by watch";
LABEL_7:
      v6 = v4;
      uint32_t v7 = 2;
LABEL_8:
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else if ([v3 BOOLForKey:@"SiriDefaultsPhoneHasMigratedDisabledDataSources"])
  {
    v4 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "[Migration] Preferences have already been migrated by phone";
      goto LABEL_7;
    }
  }
  else
  {
    if (![(NTKFaceCollection *)v2->_faceCollection hasLoaded])
    {
      v4 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      faceCollection = v2->_faceCollection;
      *(_DWORD *)buf = 138412290;
      v22 = faceCollection;
      v5 = "[Migration] Face collection %@ has not loaded. Will migrate once loaded";
      v6 = v4;
      uint32_t v7 = 12;
      goto LABEL_8;
    }
    v8 = [MEMORY[0x1E4F1CA80] set];
    objc_super v9 = v2->_faceCollection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__NTKSiriDefaults_migrateIfNecessary__block_invoke;
    v19[3] = &unk_1E62C26F8;
    v10 = v8;
    v20 = v10;
    [(NTKFaceCollection *)v9 enumerateFacesUsingBlock:v19];
    v11 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "[Migration] Propagating disabled data sources to all up next faces %@", buf, 0xCu);
    }

    v12 = v2->_faceCollection;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __37__NTKSiriDefaults_migrateIfNecessary__block_invoke_34;
    v17 = &unk_1E62C26F8;
    v4 = v10;
    v18 = v4;
    [(NTKFaceCollection *)v12 enumerateFacesUsingBlock:&v14];
    objc_msgSend(v3, "setBool:forKey:", 1, @"SiriDefaultsPhoneHasMigratedDisabledDataSources", v14, v15, v16, v17);
  }
LABEL_15:

  objc_sync_exit(v2);
}

void __37__NTKSiriDefaults_migrateIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 selectedOptionForCustomEditMode:16 slot:0];
  v3 = [v7 disabledBundleIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v7 disabledBundleIdentifiers];
    [v5 unionSet:v6];
  }
}

void __37__NTKSiriDefaults_migrateIfNecessary__block_invoke_34(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [v6 device];
    v5 = +[NTKUpNextDisabledDataSourcesEditOption optionWithDisabledDataSourceIdentifiers:v3 forDevice:v4];

    [v6 selectOption:v5 forCustomEditMode:16 slot:0];
  }
}

- (BOOL)isUpNextFaceCurrentlyActive
{
  v2 = [(NTKFaceCollection *)self->_faceCollection selectedFace];
  uint64_t v3 = [v2 faceStyle];

  return v3 == 21 || v3 == 221;
}

- (BOOL)watchHasMigratedAvailableDataSources
{
  v2 = [(NTKSiriDefaults *)self _domainAccesor];
  char v3 = [v2 BOOLForKey:@"SiriDefaultsWatchHasMigratedAvailableDataSources"];

  return v3;
}

- (void)setWatchHasMigratedAvailableDataSources:(BOOL)a3
{
  BOOL v3 = a3;
  v7[1] = *MEMORY[0x1E4F143B8];
  v5 = [(NTKSiriDefaults *)self _domainAccesor];
  [v5 setBool:v3 forKey:@"SiriDefaultsWatchHasMigratedAvailableDataSources"];

  v7[0] = @"SiriDefaultsWatchHasMigratedAvailableDataSources";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(NTKSiriDefaults *)self _synchronizeDefaultsForKeys:v6];
}

- (NSSet)phoneThirdPartyDataSources
{
  BOOL v3 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v4 = [(NTKSiriDefaults *)self _domainAccesor];
  v5 = [v4 objectForKey:@"SiriDefaultsPhoneThirdPartyDataSources"];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

    BOOL v3 = (void *)v6;
  }

  return (NSSet *)v3;
}

- (void)setPhoneThirdPartyDataSources:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = @"SiriDefaultsPhoneThirdPartyDataSources";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Setting data sources for %@ - %@", buf, 0x16u);
  }

  uint64_t v6 = [(NTKSiriDefaults *)self _domainAccesor];
  id v7 = v6;
  if (v4)
  {
    v8 = [v4 allObjects];
    [v7 setObject:v8 forKey:@"SiriDefaultsPhoneThirdPartyDataSources"];
  }
  else
  {
    [v6 removeObjectForKey:@"SiriDefaultsPhoneThirdPartyDataSources"];
  }

  v10 = @"SiriDefaultsPhoneThirdPartyDataSources";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [(NTKSiriDefaults *)self _synchronizeDefaultsForKeys:v9];

  [(NTKSiriDefaults *)self _thirdPartyDataSourcesDidChange];
}

- (NSSet)watchThirdPartyDataSources
{
  BOOL v3 = [MEMORY[0x1E4F1CAD0] set];
  id v4 = [(NTKSiriDefaults *)self _domainAccesor];
  v5 = [v4 objectForKey:@"SiriDefaultsWatchThirdPartyDataSources"];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

    BOOL v3 = (void *)v6;
  }

  return (NSSet *)v3;
}

- (void)setWatchThirdPartyDataSources:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = @"SiriDefaultsWatchThirdPartyDataSources";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Setting data sources for %@ - %@", buf, 0x16u);
  }

  uint64_t v6 = [(NTKSiriDefaults *)self _domainAccesor];
  id v7 = v6;
  if (v4)
  {
    v8 = [v4 allObjects];
    [v7 setObject:v8 forKey:@"SiriDefaultsWatchThirdPartyDataSources"];
  }
  else
  {
    [v6 removeObjectForKey:@"SiriDefaultsWatchThirdPartyDataSources"];
  }

  v10 = @"SiriDefaultsWatchThirdPartyDataSources";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [(NTKSiriDefaults *)self _synchronizeDefaultsForKeys:v9];

  [(NTKSiriDefaults *)self _thirdPartyDataSourcesDidChange];
}

- (void)setDisabledDataSources:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Setting new disabled data sources %@", buf, 0xCu);
  }

  id v7 = [(NTKSiriDefaults *)v5 _domainAccesor];
  v8 = [v4 allObjects];
  [v7 setObject:v8 forKey:@"SiriDefaultsDisabledDataSources"];

  v17 = @"SiriDefaultsDisabledDataSources";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(NTKSiriDefaults *)v5 _synchronizeDefaultsForKeys:v9];

  if (([v7 BOOLForKey:@"SiriDefaultsWatchHasMigratedDisabledDataSources"] & 1) == 0)
  {
    v10 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Watch has not migrated defaults. Propagating settings to all faces", buf, 2u);
    }

    faceCollection = v5->_faceCollection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __42__NTKSiriDefaults_setDisabledDataSources___block_invoke;
    uint64_t v15 = &unk_1E62C26F8;
    id v16 = v4;
    [(NTKFaceCollection *)faceCollection enumerateFacesUsingBlock:&v12];
  }
  [(NTKSiriDefaults *)v5 _disabledDataSourcesDidChange];

  objc_sync_exit(v5);
}

void __42__NTKSiriDefaults_setDisabledDataSources___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [v6 device];
    v5 = +[NTKUpNextDisabledDataSourcesEditOption optionWithDisabledDataSourceIdentifiers:v3 forDevice:v4];

    [v6 selectOption:v5 forCustomEditMode:16 slot:0];
  }
}

- (BOOL)hasMigratedDataSources
{
  v2 = [(NTKSiriDefaults *)self _domainAccesor];
  if ([v2 BOOLForKey:@"SiriDefaultsWatchHasMigratedDisabledDataSources"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 BOOLForKey:@"SiriDefaultsPhoneHasMigratedDisabledDataSources"];
  }

  return v3;
}

- (NSSet)disabledDataSources
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  id v18 = [MEMORY[0x1E4F1CA80] set];
  char v3 = [(NTKSiriDefaults *)self _domainAccesor];
  if ([v3 BOOLForKey:@"SiriDefaultsWatchHasMigratedDisabledDataSources"])
  {
    id v4 = [v3 objectForKey:@"SiriDefaultsDisabledDataSources"];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
      id v6 = (void *)v14[5];
      v14[5] = v5;
    }
    id v7 = (void *)[(id)v14[5] copy];
  }
  else
  {
    v8 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Watch has not migrated defaults. Fetching sum set from all up next faces", buf, 2u);
    }

    faceCollection = self->_faceCollection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__NTKSiriDefaults_disabledDataSources__block_invoke;
    v11[3] = &unk_1E62C2720;
    v11[4] = &v13;
    [(NTKFaceCollection *)faceCollection enumerateFacesUsingBlock:v11];
    id v7 = (void *)[(id)v14[5] copy];
  }

  _Block_object_dispose(&v13, 8);
  return (NSSet *)v7;
}

void __38__NTKSiriDefaults_disabledDataSources__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v6 selectedOptionForCustomEditMode:16 slot:0];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v5 = [v3 disabledBundleIdentifiers];
    [v4 unionSet:v5];
  }
}

- (void)faceCollectionDidLoad:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[Migration] Face collection %@ has loaded. Attempt migration", buf, 0xCu);
  }

  id v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NTKSiriDefaults_faceCollectionDidLoad___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(v6, block);
}

uint64_t __41__NTKSiriDefaults_faceCollectionDidLoad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) migrateIfNecessary];
}

- (void)_activeDeviceDidChange:(id)a3
{
  id v4 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "[Migration] Active device did change. Attempt migration", buf, 2u);
  }

  [(NTKSiriDefaults *)self _fetchNewFaceCollection];
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NTKSiriDefaults__activeDeviceDidChange___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __42__NTKSiriDefaults__activeDeviceDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) migrateIfNecessary];
}

- (id)_domainAccesor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
  return v2;
}

- (void)_synchronizeDefaultsForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKSiriDefaults *)self _domainAccesor];
  id v6 = (id)[v5 synchronize];

  id v8 = (id)objc_opt_new();
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  [v8 synchronizeNanoDomain:@"com.apple.NanoTimeKit" keys:v7 cloudEnabled:1];
}

- (void)_disabledDataSourcesDidChange
{
  char v3 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Disabled data sources did change. Posting notification", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.NanoTimeKit.NPS.NTKSiriDefaultsDisabledDataSourcesDidChangeNotification", self, 0, 1u);
}

- (void)_thirdPartyDataSourcesDidChange
{
  char v3 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Siri defaults did change. Posting notification", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.NanoTimeKit.NPS.NTKSiriDefaultsThirdPartyDataSourcesDidChangeNotification", self, 0, 1u);
}

- (void)_fetchNewFaceCollection
{
  faceCollection = self->_faceCollection;
  if (faceCollection)
  {
    [(NTKFaceCollection *)faceCollection removeObserver:self];
    id v4 = self->_faceCollection;
    self->_faceCollection = 0;
  }
  uint64_t v5 = [NTKPersistentFaceCollection alloc];
  id v6 = [MEMORY[0x1E4F19A30] currentDevice];
  id v7 = [v6 nrDeviceUUID];
  id v8 = [(NTKPersistentFaceCollection *)v5 initWithCollectionIdentifier:@"LibraryFaces" deviceUUID:v7];
  id v9 = self->_faceCollection;
  self->_faceCollection = v8;

  uint64_t v10 = self->_faceCollection;
  [(NTKFaceCollection *)v10 addObserver:self];
}

- (BOOL)hasMigratedDisabledDataSources
{
  return self->_hasMigratedDisabledDataSources;
}

- (void).cxx_destruct
{
}

@end