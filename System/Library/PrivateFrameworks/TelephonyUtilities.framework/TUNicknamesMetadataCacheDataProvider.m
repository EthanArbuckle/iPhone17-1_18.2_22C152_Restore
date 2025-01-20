@interface TUNicknamesMetadataCacheDataProvider
+ (TUNicknamesMetadataCacheDataProvider)sharedInstance;
+ (id)tuMetadataDestinationIDForHandleValue:(id)a3;
- (IMNicknameProvider)nicknameProvider;
- (TUNicknamesMetadataCacheDataProvider)init;
- (id)fetchNicknameForHandleValue:(id)a3;
- (id)formattedNicknameStringForHandleValue:(id)a3;
- (id)formattedNicknameStringForNickname:(id)a3;
- (void)nicknameStoreDidChange:(id)a3;
- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4;
@end

@implementation TUNicknamesMetadataCacheDataProvider

+ (TUNicknamesMetadataCacheDataProvider)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__TUNicknamesMetadataCacheDataProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_sNicknamesMetadataCacheDataProvider;

  return (TUNicknamesMetadataCacheDataProvider *)v2;
}

uint64_t __54__TUNicknamesMetadataCacheDataProvider_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sNicknamesMetadataCacheDataProvider = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (TUNicknamesMetadataCacheDataProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUNicknamesMetadataCacheDataProvider;
  v2 = [(TUMetadataCacheDataProvider *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getIMNicknameProviderClass_softClass;
    uint64_t v13 = getIMNicknameProviderClass_softClass;
    if (!getIMNicknameProviderClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getIMNicknameProviderClass_block_invoke;
      v9[3] = &unk_1E58E5F90;
      v9[4] = &v10;
      __getIMNicknameProviderClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (IMNicknameProvider *)objc_alloc_init(v4);
    nicknameProvider = v2->_nicknameProvider;
    v2->_nicknameProvider = v5;

    [(IMNicknameProvider *)v2->_nicknameProvider setNicknameListener:v2];
  }
  return v2;
}

- (id)fetchNicknameForHandleValue:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() tuMetadataDestinationIDForHandleValue:v4];
  if (v5)
  {
    v6 = [(TUMetadataCacheDataProvider *)self metadataForDestinationID:v5];
    if (!v6)
    {
      v6 = [(TUNicknamesMetadataCacheDataProvider *)self formattedNicknameStringForHandleValue:v4];
      [(TUMetadataCacheDataProvider *)self setObject:v6 forDestinationID:v5];
    }
  }
  else
  {
    v6 = [(TUNicknamesMetadataCacheDataProvider *)self formattedNicknameStringForHandleValue:v4];
  }

  return v6;
}

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "handle", (void)v16);
        v14 = [v13 normalizedValue];
        id v15 = [(TUNicknamesMetadataCacheDataProvider *)self fetchNicknameForHandleValue:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  dispatch_group_leave(v7);
}

- (void)nicknameStoreDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TUMetadataCacheDataProvider *)self invalidateCache];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [(id)objc_opt_class() tuMetadataDestinationIDForHandleValue:v9];
        uint64_t v11 = [v4 objectForKeyedSubscript:@"pendingNicknames"];
        uint64_t v12 = [v11 objectForKeyedSubscript:v9];
        if (v10)
        {
          uint64_t v13 = [(TUNicknamesMetadataCacheDataProvider *)self formattedNicknameStringForNickname:v12];
          [(TUMetadataCacheDataProvider *)self setObject:v13 forDestinationID:v10];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

+ (id)tuMetadataDestinationIDForHandleValue:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[TUHandle normalizedHandleWithDestinationID:v3];
    if (v4) {
      uint64_t v5 = [[TUMetadataDestinationID alloc] initWithHandle:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)formattedNicknameStringForHandleValue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(TUNicknamesMetadataCacheDataProvider *)self nicknameProvider];
    uint64_t v6 = [v5 nicknameForHandleID:v4];

    uint64_t v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Fetched nickname %@ for handle: %@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v8 = [(TUNicknamesMetadataCacheDataProvider *)self formattedNicknameStringForNickname:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)formattedNicknameStringForNickname:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 firstName];
    if ([v5 length])
    {

LABEL_5:
      uint64_t v8 = NSString;
      uint64_t v9 = [v4 firstName];
      int v10 = [v4 lastName];
      uint64_t v11 = [v8 stringWithFormat:@"%@ %@", v9, v10];

      __int16 v12 = NSString;
      id v13 = TUBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"MAYBE_NICKNAME_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      long long v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

      goto LABEL_7;
    }
    uint64_t v6 = [v4 lastName];
    uint64_t v7 = [v6 length];

    if (v7) {
      goto LABEL_5;
    }
  }
  long long v15 = 0;
LABEL_7:

  return v15;
}

- (IMNicknameProvider)nicknameProvider
{
  return self->_nicknameProvider;
}

- (void).cxx_destruct
{
}

@end