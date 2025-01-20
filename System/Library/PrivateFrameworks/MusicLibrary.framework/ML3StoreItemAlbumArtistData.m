@interface ML3StoreItemAlbumArtistData
- (ML3StoreItemAlbumArtistData)initWithAlbumArtistData:(id)a3;
- (ML3StoreItemAlbumArtistData)initWithLookupItems:(id)a3;
- (ML3StoreItemAlbumArtistData)initWithTrackItemImportProperties:(id)a3;
- (NSArray)parsedStoreAlbumArtistImportProperties;
- (NSData)albumArtistData;
- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems;
- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromSerializedLookupItems;
- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromTrackImportItems;
- (unint64_t)albumArtistCount;
@end

@implementation ML3StoreItemAlbumArtistData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedStoreAlbumArtistImportProperties, 0);
  objc_storeStrong((id *)&self->_trackItemImportProperties, 0);
  objc_storeStrong((id *)&self->_albumArtistData, 0);

  objc_storeStrong((id *)&self->_lookupItems, 0);
}

- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromSerializedLookupItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC0];
  v4 = MSVPropertyListDataClasses();
  albumArtistData = self->_albumArtistData;
  id v11 = 0;
  v6 = [v3 unarchivedObjectOfClasses:v4 fromData:albumArtistData error:&v11];
  id v7 = v11;

  if (!v6)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "ML3StoreItemAlbumArtistData=%p Failed to decode album artist data. err=%{public}@", buf, 0x16u);
    }
  }
  v9 = [v6 objectForKeyedSubscript:@"album_artists"];

  return v9;
}

- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromTrackImportItems
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09116E0];
  if (objc_opt_respondsToSelector())
  {
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    [v3 setObject:v5 forKeyedSubscript:&unk_1F09116E0];
  }
  v6 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09116F8];
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    [v3 setObject:v7 forKeyedSubscript:&unk_1F09116F8];
  }
  v8 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911710];
  if (objc_opt_respondsToSelector())
  {
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));
    [v3 setObject:v9 forKeyedSubscript:&unk_1F09116C8];
  }
  uint64_t v10 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911728];
  if (_NSIsNSString()) {
    [v3 setObject:v10 forKeyedSubscript:&unk_1F0911698];
  }
  v27 = (void *)v10;
  uint64_t v11 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911740];
  if (_NSIsNSString()) {
    [v3 setObject:v11 forKeyedSubscript:&unk_1F09116B0];
  }
  v26 = (void *)v11;
  v12 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911758];
  if (objc_opt_respondsToSelector())
  {
    v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
    [v3 setObject:v13 forKeyedSubscript:&unk_1F0911758];
  }
  __int16 v14 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911770];
  if (objc_opt_respondsToSelector())
  {
    id v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "longLongValue"));
    [v3 setObject:v15 forKeyedSubscript:&unk_1F0911770];
  }
  v29 = v4;
  uint64_t v16 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911788];
  if (_NSIsNSString()) {
    [v3 setObject:v16 forKeyedSubscript:&unk_1F09117A0];
  }
  v28 = v6;
  v17 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09117B8];
  if (_NSIsNSString()) {
    [v3 setObject:v17 forKeyedSubscript:&unk_1F09117D0];
  }
  v25 = v12;
  v18 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09117E8];
  if (_NSIsNSString()) {
    [v3 setObject:v18 forKeyedSubscript:&unk_1F0911800];
  }
  v19 = v8;
  v20 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911818];
  if (_NSIsNSString()) {
    [v3 setObject:v20 forKeyedSubscript:&unk_1F0911830];
  }
  v21 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911848];
  if (objc_opt_respondsToSelector())
  {
    v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v21, "longLongValue"));
    [v3 setObject:v22 forKeyedSubscript:&unk_1F0911860];
  }
  v30[0] = v3;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

  return v23;
}

- (id)_parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v28 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v27 = self;
  obj = self->_lookupItems;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    unint64_t v7 = 0x1E4F28000uLL;
    uint64_t v8 = *(void *)v32;
    *(void *)&long long v5 = 134218240;
    long long v26 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "storeAdamID", v26);
        v12 = [*(id *)(v7 + 3792) numberWithLongLong:v11];
        int v13 = [v3 containsObject:v12];

        if (v13)
        {
          __int16 v14 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v36 = v27;
            __int16 v37 = 2048;
            uint64_t v38 = v11;
            _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "ML3StoreItemAlbumArtistData=%p album artist with store identifier:%lld is already imported", buf, 0x16u);
          }
        }
        else
        {
          __int16 v14 = [v10 metadataDictionary];
          id v15 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v16 = [v14 objectForKeyedSubscript:@"name"];
          if (_NSIsNSString()) {
            [v15 setObject:v16 forKeyedSubscript:&unk_1F0911698];
          }
          v17 = [v14 objectForKeyedSubscript:@"nameSortValue"];
          if (_NSIsNSString()) {
            [v15 setObject:v17 forKeyedSubscript:&unk_1F09116B0];
          }
          if (v11)
          {
            [*(id *)(v7 + 3792) numberWithLongLong:v11];
            v30 = v16;
            v18 = v3;
            uint64_t v19 = v6;
            uint64_t v20 = v8;
            v22 = unint64_t v21 = v7;
            [v15 setObject:v22 forKeyedSubscript:&unk_1F09116C8];

            unint64_t v7 = v21;
            uint64_t v8 = v20;
            uint64_t v6 = v19;
            v3 = v18;
            uint64_t v16 = v30;
          }
          [(ML3StoreItemAlbumArtistData *)v28 addObject:v15];
          v23 = [*(id *)(v7 + 3792) numberWithLongLong:v11];
          [v3 addObject:v23];
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v6);
  }

  v24 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v28;
    _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "_parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems=%{public}@", buf, 0xCu);
  }

  return v28;
}

- (NSArray)parsedStoreAlbumArtistImportProperties
{
  parsedStoreAlbumArtistImportProperties = self->_parsedStoreAlbumArtistImportProperties;
  if (!parsedStoreAlbumArtistImportProperties)
  {
    if (self->_lookupItems)
    {
      uint64_t v4 = [(ML3StoreItemAlbumArtistData *)self _parsedStoreAlbumArtistItemsImportPropertiesFromLookupItems];
LABEL_8:
      long long v5 = self->_parsedStoreAlbumArtistImportProperties;
      self->_parsedStoreAlbumArtistImportProperties = v4;

      parsedStoreAlbumArtistImportProperties = self->_parsedStoreAlbumArtistImportProperties;
      goto LABEL_9;
    }
    if (self->_trackItemImportProperties)
    {
      uint64_t v4 = [(ML3StoreItemAlbumArtistData *)self _parsedStoreAlbumArtistItemsImportPropertiesFromTrackImportItems];
      goto LABEL_8;
    }
    if (self->_albumArtistData)
    {
      uint64_t v4 = [(ML3StoreItemAlbumArtistData *)self _parsedStoreAlbumArtistItemsImportPropertiesFromSerializedLookupItems];
      goto LABEL_8;
    }
    parsedStoreAlbumArtistImportProperties = 0;
  }
LABEL_9:

  return parsedStoreAlbumArtistImportProperties;
}

- (NSData)albumArtistData
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ML3StoreItemAlbumArtistData *)self parsedStoreAlbumArtistImportProperties];
  v3 = (void *)v2;
  if (v2)
  {
    unint64_t v7 = @"album_artists";
    v8[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    long long v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  }
  else
  {
    long long v5 = 0;
  }

  return (NSData *)v5;
}

- (unint64_t)albumArtistCount
{
  uint64_t v2 = [(ML3StoreItemAlbumArtistData *)self parsedStoreAlbumArtistImportProperties];
  unint64_t v3 = [v2 count];

  return v3;
}

- (ML3StoreItemAlbumArtistData)initWithAlbumArtistData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumArtistData;
  long long v5 = [(ML3StoreItemAlbumArtistData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    albumArtistData = v5->_albumArtistData;
    v5->_albumArtistData = (NSData *)v6;
  }
  return v5;
}

- (ML3StoreItemAlbumArtistData)initWithTrackItemImportProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumArtistData;
  long long v5 = [(ML3StoreItemAlbumArtistData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    trackItemImportProperties = v5->_trackItemImportProperties;
    v5->_trackItemImportProperties = (NSDictionary *)v6;
  }
  return v5;
}

- (ML3StoreItemAlbumArtistData)initWithLookupItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumArtistData;
  long long v5 = [(ML3StoreItemAlbumArtistData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lookupItems = v5->_lookupItems;
    v5->_lookupItems = (NSArray *)v6;
  }
  return v5;
}

@end