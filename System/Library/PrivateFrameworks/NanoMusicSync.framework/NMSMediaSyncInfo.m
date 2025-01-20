@interface NMSMediaSyncInfo
+ (id)_mediaSyncInfoDirectory;
- (BOOL)_hasItemsForContainer:(id)a3;
- (BOOL)_isValid;
- (BOOL)hasContainer:(id)a3;
- (BOOL)hasDownloadableItemsWithinStorageLimitForContainer:(id)a3;
- (BOOL)hasItem:(id)a3;
- (BOOL)hasItemsOverStorageLimit;
- (BOOL)hasItemsOverStorageLimitForContainer:(id)a3;
- (BOOL)hasItemsWaitingWithoutPauseReason;
- (BOOL)hasItemsWaitingWithoutPauseReasonForContainer:(id)a3;
- (BOOL)isItemOverStorageLimit:(id)a3;
- (NMSMediaSyncInfo)initWithTarget:(unint64_t)a3;
- (NSDictionary)info;
- (float)progress;
- (float)progressForContainer:(id)a3;
- (float)progressForItem:(id)a3;
- (id)_identifiersWithKeepLocalStates:(id)a3 modelKind:(id)a4;
- (id)_initWithTarget:(unint64_t)a3 readAndObserveChanges:(BOOL)a4;
- (id)_notificationName;
- (id)_preferencesApplicationID;
- (id)_preferencesInfoKey;
- (id)_syncInfoFilePath;
- (id)_syncInfoModelKindForMPModelKind:(id)a3;
- (id)_targetIdentifier;
- (id)allAlbums;
- (id)allPlaylists;
- (id)containers;
- (id)itemsForContainer:(id)a3;
- (id)keepLocalEnabledAlbums;
- (id)keepLocalEnabledPlaylists;
- (id)userInfoForContainer:(id)a3;
- (id)userInfoForItem:(id)a3;
- (unint64_t)downloadPauseReason;
- (unint64_t)downloadPauseReasonForContainer:(id)a3;
- (unint64_t)downloadPauseReasonForItem:(id)a3;
- (unint64_t)itemCount;
- (unint64_t)numberOfItemsOverStorageLimitForContainer:(id)a3;
- (unint64_t)playabilityForContainer:(id)a3;
- (unint64_t)status;
- (unint64_t)statusForContainer:(id)a3;
- (unint64_t)statusForItem:(id)a3;
- (unint64_t)target;
- (void)_readInfo;
- (void)_registerForInfoChanged;
- (void)dealloc;
- (void)setInfo:(id)a3;
@end

@implementation NMSMediaSyncInfo

- (NMSMediaSyncInfo)initWithTarget:(unint64_t)a3
{
  return (NMSMediaSyncInfo *)[(NMSMediaSyncInfo *)self _initWithTarget:a3 readAndObserveChanges:1];
}

- (id)_initWithTarget:(unint64_t)a3 readAndObserveChanges:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaSyncInfo;
  v6 = [(NMSMediaSyncInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_target = a3;
    v6->_notifyToken = -1;
    if (v4)
    {
      [(NMSMediaSyncInfo *)v6 _registerForInfoChanged];
      [(NMSMediaSyncInfo *)v7 _readInfo];
    }
  }
  return v7;
}

- (void)_registerForInfoChanged
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_2228FD000, log, OS_LOG_TYPE_ERROR, "Failed to register for notification: %@ with status: %d", (uint8_t *)&v3, 0x12u);
}

- (id)_notificationName
{
  v2 = NSString;
  int v3 = [(NMSMediaSyncInfo *)self _targetIdentifier];
  uint64_t v4 = [v2 stringWithFormat:@"com.apple.NMSMediaSyncInfo.%@.changed", v3];

  return v4;
}

- (void)_readInfo
{
  switch([(NMSMediaSyncInfo *)self target])
  {
    case 0uLL:
      id v6 = +[NMSyncDefaults sharedDefaults];
      uint64_t v4 = [v6 musicSyncInfo];
      goto LABEL_6;
    case 1uLL:
      id v6 = +[NMSyncDefaults sharedDefaults];
      uint64_t v4 = [v6 podcastsSyncInfo];
      goto LABEL_6;
    case 2uLL:
      id v6 = +[NMSyncDefaults sharedDefaults];
      uint64_t v4 = [v6 audiobooksSyncInfo];
      goto LABEL_6;
    case 3uLL:
    case 4uLL:
      int v3 = NSDictionary;
      id v6 = [(NMSMediaSyncInfo *)self _syncInfoFilePath];
      objc_msgSend(v3, "dictionaryWithContentsOfFile:");
      uint64_t v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      info = self->_info;
      self->_info = v4;

      break;
    default:
      return;
  }
}

- (id)_preferencesInfoKey
{
  v2 = NSString;
  int v3 = [(NMSMediaSyncInfo *)self _targetIdentifier];
  uint64_t v4 = [v2 stringWithFormat:@"NMSMediaSyncInfo-%@", v3];

  return v4;
}

- (id)_preferencesApplicationID
{
  return @"com.apple.NanoMusicSync";
}

- (id)containers
{
  v2 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"containers"];
  int v3 = [v2 allKeys];

  return v3;
}

- (unint64_t)statusForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"status"];
  v8 = v7;
  if (v7) {
    unint64_t v9 = [v7 integerValue];
  }
  else {
    unint64_t v9 = 1;
  }

  return v9;
}

- (float)progressForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"cachedProgress"];
  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_notifyToken)) {
    notify_cancel(self->_notifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)NMSMediaSyncInfo;
  [(NMSMediaSyncInfo *)&v3 dealloc];
}

- (id)itemsForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"itemsIdentifiers"];

  return v7;
}

- (BOOL)hasContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)hasItem:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (unint64_t)statusForItem:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"status"];
  float v8 = v7;
  if (v7) {
    unint64_t v9 = [v7 integerValue];
  }
  else {
    unint64_t v9 = 1;
  }

  return v9;
}

- (float)progressForItem:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"progressBytes"];
  double v8 = (double)(unint64_t)[v7 unsignedLongLongValue];
  unint64_t v9 = [v6 objectForKeyedSubscript:@"totalBytes"];
  *(float *)&double v8 = v8 / (double)(unint64_t)[v9 unsignedLongLongValue];

  return *(float *)&v8;
}

- (unint64_t)downloadPauseReasonForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"downloadPauseReason"];
  unint64_t v8 = [v7 integerValue];

  return v8;
}

- (unint64_t)downloadPauseReasonForItem:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"downloadPauseReason"];
  unint64_t v8 = [v7 integerValue];

  return v8;
}

- (BOOL)hasItemsWaitingWithoutPauseReasonForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];
  LOBYTE(v4) = [v7 BOOLValue];

  return (char)v4;
}

- (unint64_t)playabilityForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"playability"];
  unint64_t v8 = [v7 integerValue];

  return v8;
}

- (BOOL)hasItemsOverStorageLimitForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"hasItemsOverStorageLimit"];
  if (v7)
  {
    unint64_t v8 = [v6 objectForKeyedSubscript:@"hasItemsOverStorageLimit"];
    char v9 = [v8 BOOLValue];
  }
  else
  {
    unint64_t v8 = [v6 objectForKeyedSubscript:@"itemsOverStorageLimitCount"];
    char v9 = [v8 unsignedIntegerValue] != 0;
  }

  return v9;
}

- (BOOL)isItemOverStorageLimit:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"overStorageLimit"];
  LOBYTE(v4) = [v7 BOOLValue];

  return (char)v4;
}

- (BOOL)hasDownloadableItemsWithinStorageLimitForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"hasDownloadableItemsWithinStorageLimitKey"];
  LOBYTE(v4) = [v7 BOOLValue];

  return (char)v4;
}

- (unint64_t)status
{
  v2 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"status"];
  objc_super v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (float)progress
{
  v2 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"cachedProgress"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)downloadPauseReason
{
  v2 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"downloadPauseReason"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)hasItemsWaitingWithoutPauseReason
{
  v2 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"hasItemsWaitingWithoutPauseReason"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasItemsOverStorageLimit
{
  char v3 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"hasItemsOverStorageLimit"];
  info = self->_info;
  if (v3)
  {
    __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"hasItemsOverStorageLimit"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"itemsOverStorageLimitCount"];
    char v6 = [v5 unsignedIntegerValue] != 0;
  }

  return v6;
}

- (id)userInfoForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  char v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"userInfo"];

  return v7;
}

- (id)userInfoForItem:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
  char v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"userInfo"];

  return v7;
}

- (unint64_t)itemCount
{
  char v3 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"items"];

  info = self->_info;
  if (v3)
  {
    __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"items"];
    uint64_t v6 = [v5 count];
LABEL_5:
    uint64_t v7 = (void *)v6;

    return (unint64_t)v7;
  }
  uint64_t v7 = [(NSDictionary *)info objectForKeyedSubscript:@"itemCount"];

  if (v7)
  {
    __int16 v5 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"itemCount"];
    uint64_t v6 = [v5 unsignedIntegerValue];
    goto LABEL_5;
  }
  return (unint64_t)v7;
}

- (BOOL)_isValid
{
  v2 = [(NMSMediaSyncInfo *)self info];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_hasItemsForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"itemCount"];
  unint64_t v8 = v7;
  if (v7) {
    BOOL v9 = [v7 unsignedIntegerValue] != 0;
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

void __43__NMSMediaSyncInfo__registerForInfoChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _readInfo];
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"NMSMediaSyncInfoDidUpdateNotification" object:v3];

    id WeakRetained = v3;
  }
}

- (id)_targetIdentifier
{
  unint64_t target = self->_target;
  if (target > 4) {
    return 0;
  }
  else {
    return off_2646341F8[target];
  }
}

- (id)_syncInfoFilePath
{
  id v3 = [(id)objc_opt_class() _mediaSyncInfoDirectory];
  id v4 = [(NMSMediaSyncInfo *)self _targetIdentifier];
  __int16 v5 = [v4 stringByAppendingString:@".plist"];
  uint64_t v6 = [v3 stringByAppendingPathComponent:v5];

  return v6;
}

+ (id)_mediaSyncInfoDirectory
{
  if (_mediaSyncInfoDirectory_onceToken != -1) {
    dispatch_once(&_mediaSyncInfoDirectory_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_mediaSyncInfoDirectory_path;

  return v2;
}

void __43__NMSMediaSyncInfo__mediaSyncInfoDirectory__block_invoke()
{
  uint64_t v0 = +[NMSPathUtil mediaSyncInfoDirectory];
  v1 = (void *)_mediaSyncInfoDirectory_path;
  _mediaSyncInfoDirectory_path = v0;

  id v2 = [MEMORY[0x263F08850] defaultManager];
  [v2 createDirectoryAtPath:_mediaSyncInfoDirectory_path withIntermediateDirectories:1 attributes:0 error:0];
}

- (unint64_t)numberOfItemsOverStorageLimitForContainer:(id)a3
{
  info = self->_info;
  id v4 = a3;
  __int16 v5 = [(NSDictionary *)info objectForKeyedSubscript:@"containers"];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"itemsOverStorageLimitCount"];
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (unint64_t)target
{
  return self->_target;
}

- (void).cxx_destruct
{
}

- (id)keepLocalEnabledPlaylists
{
  id v3 = [MEMORY[0x263F11FB8] identityKind];
  id v4 = [(NMSMediaSyncInfo *)self _identifiersWithKeepLocalStates:&unk_26D51CE30 modelKind:v3];

  return v4;
}

- (id)keepLocalEnabledAlbums
{
  id v3 = [MEMORY[0x263F11E88] identityKind];
  id v4 = [(NMSMediaSyncInfo *)self _identifiersWithKeepLocalStates:&unk_26D51CE48 modelKind:v3];

  return v4;
}

- (id)allPlaylists
{
  id v3 = [MEMORY[0x263F11FB8] identityKind];
  id v4 = [(NMSMediaSyncInfo *)self _identifiersWithKeepLocalStates:&unk_26D51CE60 modelKind:v3];

  return v4;
}

- (id)allAlbums
{
  id v3 = [MEMORY[0x263F11E88] identityKind];
  id v4 = [(NMSMediaSyncInfo *)self _identifiersWithKeepLocalStates:&unk_26D51CE78 modelKind:v3];

  return v4;
}

- (id)_identifiersWithKeepLocalStates:(id)a3 modelKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x263EFF9C0] set];
  BOOL v9 = [(NMSMediaSyncInfo *)self containers];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke;
  v18 = &unk_264634698;
  v19 = self;
  id v20 = v6;
  id v21 = v7;
  id v22 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  [v9 enumerateObjectsUsingBlock:&v15];

  v13 = objc_msgSend(v10, "copy", v15, v16, v17, v18, v19);

  return v13;
}

void __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) userInfoForContainer:a2];
  id v4 = *(void **)(a1 + 40);
  __int16 v5 = [v3 objectForKeyedSubscript:@"keepLocal"];
  if (([v4 containsObject:v5] & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  id v6 = [*(id *)(a1 + 32) _syncInfoModelKindForMPModelKind:*(void *)(a1 + 48)];
  id v7 = [v3 objectForKeyedSubscript:@"modelKind"];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    BOOL v9 = (void *)MEMORY[0x263F573E8];
    id v10 = [v3 objectForKey:@"midData"];
    __int16 v5 = [v9 pidFromMIDData:v10];

    if (v5)
    {
      [*(id *)(a1 + 56) addObject:v5];
    }
    else
    {
      id v11 = NMLogForCategory(5);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke_cold_1((uint64_t)v3, v11);
      }
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_syncInfoModelKindForMPModelKind:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 identityKind];
  __int16 v5 = [MEMORY[0x263F11E88] identityKind];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = &unk_26D51D178;
  }
  else
  {
    int v8 = [v3 identityKind];
    BOOL v9 = [MEMORY[0x263F11FB8] identityKind];
    char v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      id v12 = (void *)MEMORY[0x263EFF940];
      uint64_t v13 = *MEMORY[0x263EFF498];
      v17 = @"modelKind";
      v14 = [v3 identityKind];
      v18[0] = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v16 = [v12 exceptionWithName:v13 reason:@"Unsupported modelKind." userInfo:v15];

      objc_exception_throw(v16);
    }
    id v7 = &unk_26D51D190;
  }

  return v7;
}

void __73__NMSMediaSyncInfo_NanoMusic___identifiersWithKeepLocalStates_modelKind___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "UserInfo is missing MID data: %@", (uint8_t *)&v2, 0xCu);
}

@end