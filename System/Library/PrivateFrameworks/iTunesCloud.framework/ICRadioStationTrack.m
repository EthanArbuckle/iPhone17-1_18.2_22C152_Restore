@interface ICRadioStationTrack
+ (id)flattenedTracksWithTracks:(id)a3;
- (BOOL)hasStartTime;
- (BOOL)isSkippable;
- (ICRadioStationTrack)afterPromoContentTrack;
- (ICRadioStationTrack)beforePromoContentTrack;
- (ICRadioStationTrack)initWithResponseDictionary:(id)a3 responseVersion:(int64_t)a4 expirationDate:(id)a5;
- (ICRadioStationTrack)parentTrack;
- (ICStoreHLSAssetInfo)hlsAsset;
- (ICStorePlatformMetadata)storePlatformMetadata;
- (NSArray)fileAssets;
- (NSArray)radioStreamAssets;
- (NSDate)expirationDate;
- (NSDictionary)serverTrackInfo;
- (double)startTime;
- (id)_hlsAssetFromAssetDictionary:(id)a3;
- (id)description;
- (int64_t)likeState;
- (int64_t)storeAdamID;
- (int64_t)trackType;
@end

@implementation ICRadioStationTrack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTrack, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (ICRadioStationTrack)parentTrack
{
  return self->_parentTrack;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)_hlsAssetFromAssetDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"stream-url"];
  if (_NSIsNSString()
    && [v5 length]
    && ([MEMORY[0x1E4F1CB10] URLWithString:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = objc_alloc_init(ICStoreHLSAssetInfo);
    [(ICStoreHLSAssetInfo *)v8 setPlaylistURL:v7];
    v9 = objc_msgSend(v4, "ic_stringValueForKey:", @"key-server-protocol-type");
    [(ICStoreHLSAssetInfo *)v8 setKeyServerProtocolType:v9];
    uint64_t v10 = [v4 objectForKey:@"stream-key-cert-url"];
    if (_NSIsNSString() && [(id)v10 length])
    {
      v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      if (v11) {
        [(ICStoreHLSAssetInfo *)v8 setKeyCertificateURL:v11];
      }
    }
    uint64_t v12 = [v4 objectForKey:@"stream-key-server-url"];
    if (_NSIsNSString() && [(id)v12 length])
    {
      v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      if (v13) {
        [(ICStoreHLSAssetInfo *)v8 setKeyServerURL:v13];
      }
    }
    v14 = [v4 objectForKey:@"is-itunes-stream"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = [v14 BOOLValue];
    }
    else {
      uint64_t v15 = 1;
    }
    [(ICStoreHLSAssetInfo *)v8 setITunesStoreStream:v15];
    if ([(ICRadioStationTrack *)self storeAdamID])
    {
      v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ICRadioStationTrack storeAdamID](self, "storeAdamID"));
      [(ICStoreHLSAssetInfo *)v8 setKeyServerAdamID:v17];
    }
    else if (v10 | v12)
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        responseDictionary = self->_responseDictionary;
        int v20 = 138543618;
        v21 = self;
        __int16 v22 = 2114;
        v23 = responseDictionary;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Payload contains HLS asset without an adam ID, which is unexpected: %{public}@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)trackType
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"type"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (ICStorePlatformMetadata)storePlatformMetadata
{
  int64_t v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"metadata"];
  if (_NSIsNSDictionary())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__19204;
    int v20 = __Block_byref_object_dispose__19205;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__ICRadioStationTrack_storePlatformMetadata__block_invoke;
    v12[3] = &unk_1E5AC9688;
    uint64_t v15 = &v16;
    id v4 = v3;
    id v13 = v4;
    v14 = self;
    v5 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v12);
    ((void (**)(void, __CFString *, __CFString *))v5)[2](v5, @"album-id", @"collectionId");
    ((void (**)(void, __CFString *, __CFString *))v5)[2](v5, @"is-explicit", @"is-explicit");
    uint64_t v6 = [ICStorePlatformMetadata alloc];
    v7 = (void *)v17[5];
    v8 = [(ICRadioStationTrack *)self expirationDate];
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v4;
    }
    uint64_t v10 = [(ICStorePlatformMetadata *)v6 initWithMetadataDictionary:v9 expirationDate:v8];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __44__ICRadioStationTrack_storePlatformMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  id v9 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v10];
  if (v9) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v9 forKey:v5];
  }
}

- (NSDictionary)serverTrackInfo
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"track-info"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (int64_t)storeAdamID
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"adam-id"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (double)startTime
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"start-position-in-milliseconds"];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4 / 1000.0;
  }

  return v3;
}

- (int64_t)likeState
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"like-value"];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v3 = [v2 integerValue];
    unint64_t v4 = v3 >> 63;
    if (v3)
    {
      uint64_t v5 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  uint64_t v5 = 0;
LABEL_6:
  if (v4) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = v5;
  }

  return v6;
}

- (BOOL)isSkippable
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"is-skippable"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (NSArray)radioStreamAssets
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"asset-info"];
  if (_NSIsNSDictionary())
  {
    char v3 = [v2 objectForKey:@"assets"];
    if (_NSIsNSArray())
    {
      unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            v11 = [ICStoreRadioStreamAssetInfo alloc];
            uint64_t v12 = -[ICStoreRadioStreamAssetInfo initWithItemResponseDictionary:](v11, "initWithItemResponseDictionary:", v10, (void)v15);
            if (v12) {
              [v4 addObject:v12];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }

      id v13 = (void *)[v4 copy];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return (NSArray *)v13;
}

- (ICStoreHLSAssetInfo)hlsAsset
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"asset-info"];
  if (_NSIsNSDictionary())
  {
    [v3 objectForKey:@"assets"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            uint64_t v10 = objc_msgSend(v9, "objectForKey:", @"stream-protocol", (void)v13);
            if _NSIsNSString() && ([v10 isEqualToString:@"HLS"])
            {
              v11 = [(ICRadioStationTrack *)self _hlsAssetFromAssetDictionary:v9];

              goto LABEL_16;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v11 = 0;
LABEL_16:
  }
  else
  {
    v11 = 0;
  }

  return (ICStoreHLSAssetInfo *)v11;
}

- (BOOL)hasStartTime
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"start-position-in-milliseconds"];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (NSArray)fileAssets
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(ICRadioStationTrack *)self trackType] == 4)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(NSDictionary *)self->_responseDictionary objectForKey:@"asset-info"];
    if (_NSIsNSDictionary())
    {
      uint64_t v5 = [v4 objectForKey:@"drm-type"];
      if (_NSIsNSString())
      {
        if ([v5 isEqualToString:@"subscription"]) {
          uint64_t v6 = 3;
        }
        else {
          uint64_t v6 = 4;
        }
      }
      else
      {
        uint64_t v6 = 4;
      }
      uint64_t v7 = [v4 objectForKey:@"assets"];
      if (_NSIsNSArray())
      {
        uint64_t v20 = v4;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          id v3 = 0;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              if (_NSIsNSDictionary())
              {
                long long v14 = [[ICStoreFileAssetInfo alloc] initWithFileAssetResponseDictionary:v13];
                [(ICStoreFileAssetInfo *)v14 setExpectedProtectionType:v6];
                if (v14)
                {
                  if (!v3) {
                    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  [v3 addObject:v14];
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v10);
        }
        else
        {
          id v3 = 0;
        }

        id v4 = v20;
      }
      else
      {
        id v3 = 0;
      }
    }
    else
    {
      id v3 = 0;
    }
    if (![v3 count])
    {
      long long v15 = [(NSDictionary *)self->_responseDictionary objectForKey:@"asset-url"];
      if (_NSIsNSString() && [v15 length])
      {
        long long v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
        if (v16)
        {
          long long v17 = objc_alloc_init(ICStoreFileAssetInfo);
          [(ICStoreFileAssetInfo *)v17 setAssetURL:v16];
          [(ICStoreFileAssetInfo *)v17 setExpectedProtectionType:4];
          if (v17)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            [v18 addObject:v17];
            id v3 = v18;
          }
        }
      }
    }
  }

  return (NSArray *)v3;
}

- (ICRadioStationTrack)beforePromoContentTrack
{
  id v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"promo-content"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"before"];
    if (_NSIsNSDictionary())
    {
      uint64_t v5 = [[ICRadioStationTrack alloc] initWithResponseDictionary:v4 responseVersion:self->_responseVersion expirationDate:self->_expirationDate];
      objc_storeStrong((id *)&v5->_parentTrack, self);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (ICRadioStationTrack)afterPromoContentTrack
{
  id v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"promo-content"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"after"];
    if (_NSIsNSDictionary())
    {
      uint64_t v5 = [[ICRadioStationTrack alloc] initWithResponseDictionary:v4 responseVersion:self->_responseVersion expirationDate:self->_expirationDate];
      objc_storeStrong((id *)&v5->_parentTrack, self);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)description
{
  id v3 = NSString;
  int64_t v4 = [(ICRadioStationTrack *)self trackType];
  switch(v4)
  {
    case 1:
      uint64_t v5 = @"Standard";
      break;
    case 4:
      uint64_t v5 = @"Stream";
      break;
    case 2:
      uint64_t v5 = @"AudioCliip";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown-%ld", v4);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  int64_t v6 = [(ICRadioStationTrack *)self storeAdamID];
  uint64_t v7 = [(ICRadioStationTrack *)self storePlatformMetadata];
  id v8 = [v7 name];
  uint64_t v9 = [v3 stringWithFormat:@"<ICRadioStationTrack: %p type=%@ adamID=%lld name='%@'>", self, v5, v6, v8];

  return v9;
}

- (ICRadioStationTrack)initWithResponseDictionary:(id)a3 responseVersion:(int64_t)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICRadioStationTrack;
  uint64_t v10 = [(ICRadioStationTrack *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v11;

    uint64_t v13 = [v8 copy];
    responseDictionary = v10->_responseDictionary;
    v10->_responseDictionary = (NSDictionary *)v13;

    v10->_responseVersion = a4;
  }

  return v10;
}

+ (id)flattenedTracksWithTracks:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "beforePromoContentTrack", (void)v14);
        if (v11) {
          [v4 addObject:v11];
        }
        [v4 addObject:v10];
        uint64_t v12 = [v10 afterPromoContentTrack];
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end