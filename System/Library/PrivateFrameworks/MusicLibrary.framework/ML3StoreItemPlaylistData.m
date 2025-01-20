@interface ML3StoreItemPlaylistData
- (ML3StoreItemPlaylistData)initWithLookupItems:(id)a3;
- (ML3StoreItemPlaylistData)initWithPlaylistsData:(id)a3;
- (NSArray)parsedStorePlaylistsImportProperties;
- (NSData)playlistsData;
- (id)_bestArtworkImageURLFromStoreArtworkVariants:(id)a3 cropStyle:(id)a4;
- (id)_bestPlaylistArtworkImageURLFromStoreArtworkVariants:(id)a3;
- (id)_playlistPropertiesForLookupItems:(id)a3;
- (id)_playlistPropertiesFromPlaylistData:(id)a3;
- (unint64_t)playlistCount;
@end

@implementation ML3StoreItemPlaylistData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedPlaylistsImportProperties, 0);
  objc_storeStrong((id *)&self->_playlistData, 0);

  objc_storeStrong((id *)&self->_lookupItems, 0);
}

- (id)_bestArtworkImageURLFromStoreArtworkVariants:(id)a3 cropStyle:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v58 count:16];
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v11 = 0;
  if (v8)
  {
    uint64_t v12 = *(void *)v46;
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v14 = *MEMORY[0x1E4F1DB30];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v17 = [v16 sizeInfo];
        [v17 maxSupportedSize];
        double v19 = v18;
        double v21 = v20;

        if (v19 > v14 || v21 > v13)
        {
          id v23 = v16;

          double v13 = v21;
          double v14 = v19;
          v11 = v23;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v8);
  }

  MSVGetMaximumScreenSize();
  double v25 = v24;
  double v27 = v26;
  v28 = [v11 sizeInfo];
  [v28 maxSupportedSize];
  double v30 = v29;
  double v32 = v31;

  if (v30 != v9 || v32 != v10)
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    double v25 = v34;
    double v27 = v35;
  }
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  v36 = (id *)getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr;
  uint64_t v57 = getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr;
  if (!getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr)
  {
    uint64_t v49 = MEMORY[0x1E4F143A8];
    uint64_t v50 = 3221225472;
    v51 = __getICStoreArtworkInfoImageFormatJPEGSymbolLoc_block_invoke;
    v52 = &unk_1E5FB7330;
    v53 = &v54;
    v37 = iTunesCloudLibrary();
    v38 = dlsym(v37, "ICStoreArtworkInfoImageFormatJPEG");
    *(void *)(v53[1] + 24) = v38;
    getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr = *(void *)(v53[1] + 24);
    v36 = (id *)v55[3];
  }
  _Block_object_dispose(&v54, 8);
  if (!v36)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = [NSString stringWithUTF8String:"NSString *getICStoreArtworkInfoImageFormatJPEG(void)"];
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"ML3StoreItemPlaylistData.m", 23, @"%s", dlerror());

    __break(1u);
  }
  id v39 = *v36;
  v40 = objc_msgSend(v11, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", v6, v39, MSVDeviceSupportsExtendedColorDisplay(), v25, v27);

  v41 = [v40 absoluteString];

  return v41;
}

- (id)_bestPlaylistArtworkImageURLFromStoreArtworkVariants:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (void *)getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr;
  uint64_t v14 = getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr;
  if (!getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary();
    v12[3] = (uint64_t)dlsym(v6, "ICStoreArtworkInfoCropStyleSquareCenterCrop");
    getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr = v12[3];
    id v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    id v7 = [(ML3StoreItemPlaylistData *)self _bestArtworkImageURLFromStoreArtworkVariants:v4 cropStyle:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStoreArtworkInfoCropStyleSquareCenterCrop(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemPlaylistData.m", 22, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)_playlistPropertiesFromPlaylistData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v5 = MSVPropertyListDataClasses();
  id v11 = 0;
  id v6 = [v3 unarchivedObjectOfClasses:v5 fromData:v4 error:&v11];

  id v7 = v11;
  if (!v6)
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Failed to decode playlist data. err=%{public}@", buf, 0xCu);
    }
  }
  double v9 = [v6 objectForKeyedSubscript:@"playlist"];

  return v9;
}

- (id)_playlistPropertiesForLookupItems:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v40 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v3;
  uint64_t v45 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v48 != v44) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v6 = [v5 kind];
        uint64_t v56 = 0;
        uint64_t v57 = &v56;
        uint64_t v58 = 0x2020000000;
        id v7 = (void *)getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr;
        uint64_t v59 = getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr;
        if (!getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr)
        {
          uint64_t v51 = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          v53 = __getICStorePlatformMetadataKindPlaylistSymbolLoc_block_invoke;
          uint64_t v54 = &unk_1E5FB7330;
          v55 = &v56;
          uint64_t v8 = iTunesCloudLibrary();
          double v9 = dlsym(v8, "ICStorePlatformMetadataKindPlaylist");
          *(void *)(v55[1] + 24) = v9;
          getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr = *(void *)(v55[1] + 24);
          id v7 = (void *)v57[3];
        }
        _Block_object_dispose(&v56, 8);
        if (!v7)
        {
          v38 = [MEMORY[0x1E4F28B00] currentHandler];
          id v39 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindPlaylist(void)"];
          objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"ML3StoreItemPlaylistData.m", 21, @"%s", dlerror());

          __break(1u);
        }
        int v10 = [v6 isEqualToString:*v7];

        if (v10)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v12 = [v5 metadataDictionary];
          id v13 = [v12 objectForKeyedSubscript:@"name"];

          if (v13)
          {
            uint64_t v14 = [v12 objectForKeyedSubscript:@"name"];
            [v11 setObject:v14 forKeyedSubscript:&unk_1F0911878];
          }
          v15 = [v12 objectForKeyedSubscript:@"playlistId"];

          if (v15)
          {
            v16 = [v12 objectForKeyedSubscript:@"playlistId"];
            [v11 setObject:v16 forKeyedSubscript:&unk_1F0911890];
          }
          v17 = [v12 objectForKeyedSubscript:@"curatorName"];

          if (v17)
          {
            double v18 = [v12 objectForKeyedSubscript:@"curatorName"];
            [v11 setObject:v18 forKeyedSubscript:&unk_1F09118A8];
          }
          double v19 = [v12 objectForKeyedSubscript:@"versionHash"];

          if (v19)
          {
            double v20 = [v12 objectForKeyedSubscript:@"versionHash"];
            [v11 setObject:v20 forKeyedSubscript:&unk_1F09118C0];
          }
          double v21 = [v12 objectForKeyedSubscript:@"isChart"];

          if (v21)
          {
            v22 = [v12 objectForKeyedSubscript:@"isChart"];
            [v11 setObject:v22 forKeyedSubscript:&unk_1F09118D8];
          }
          long long v46 = [v12 objectForKeyedSubscript:@"description"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v46;
            if (!v23) {
              goto LABEL_26;
            }
LABEL_25:
            v43 = v23;
            [v11 setObject:v23 forKeyedSubscript:&unk_1F09118F0];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v24 = [v46 allValues];
              uint64_t v25 = [v24 firstObject];

              id v23 = (id)v25;
              if (v25) {
                goto LABEL_25;
              }
            }
LABEL_26:
            v43 = 0;
          }
          double v26 = [v5 artworkInfos];
          double v27 = [(ML3StoreItemPlaylistData *)self _bestPlaylistArtworkImageURLFromStoreArtworkVariants:v26];
          if (v27) {
            [v11 setObject:v27 forKeyedSubscript:&unk_1F0911908];
          }
          [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F0911920];
          v28 = NSNumber;
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v29 = objc_msgSend(v28, "numberWithDouble:");
          [v11 setObject:v29 forKeyedSubscript:&unk_1F0911938];
          [v11 setObject:v29 forKeyedSubscript:&unk_1F0911950];
          double v30 = [v12 objectForKey:@"lastModifiedDate"];
          if (v30)
          {
            id v31 = objc_alloc_init(MEMORY[0x1E4F28C10]);
            double v32 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
            [v31 setLocale:v32];

            [v31 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
            v33 = [v31 dateFromString:v30];
            double v34 = NSNumber;
            [v33 timeIntervalSinceReferenceDate];
            double v35 = objc_msgSend(v34, "numberWithDouble:");
            [v11 setObject:v35 forKeyedSubscript:&unk_1F0911950];
          }
          v36 = [v12 objectForKeyedSubscript:@"childrenIds"];
          if (v36) {
            [v11 setObject:v36 forKeyedSubscript:@"childrenIds"];
          }

          if (v11)
          {
            [v40 addObject:v11];
          }
          continue;
        }
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v45);
  }

  return v40;
}

- (unint64_t)playlistCount
{
  v2 = [(ML3StoreItemPlaylistData *)self parsedStorePlaylistsImportProperties];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)parsedStorePlaylistsImportProperties
{
  parsedPlaylistsImportProperties = self->_parsedPlaylistsImportProperties;
  if (!parsedPlaylistsImportProperties)
  {
    if (self->_lookupItems)
    {
      -[ML3StoreItemPlaylistData _playlistPropertiesForLookupItems:](self, "_playlistPropertiesForLookupItems:");
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      id v5 = self->_parsedPlaylistsImportProperties;
      self->_parsedPlaylistsImportProperties = v4;

      parsedPlaylistsImportProperties = self->_parsedPlaylistsImportProperties;
      goto LABEL_7;
    }
    if (self->_playlistData)
    {
      -[ML3StoreItemPlaylistData _playlistPropertiesFromPlaylistData:](self, "_playlistPropertiesFromPlaylistData:");
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    parsedPlaylistsImportProperties = 0;
  }
LABEL_7:

  return parsedPlaylistsImportProperties;
}

- (NSData)playlistsData
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ML3StoreItemPlaylistData *)self parsedStorePlaylistsImportProperties];
  unint64_t v3 = (void *)v2;
  if (v2)
  {
    id v7 = @"playlist";
    v8[0] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (ML3StoreItemPlaylistData)initWithPlaylistsData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemPlaylistData;
  id v5 = [(ML3StoreItemPlaylistData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playlistData = v5->_playlistData;
    v5->_playlistData = (NSData *)v6;
  }
  return v5;
}

- (ML3StoreItemPlaylistData)initWithLookupItems:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ML3StoreItemPlaylistData;
  id v5 = [(ML3StoreItemPlaylistData *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lookupItems = v5->_lookupItems;
    v5->_lookupItems = (NSArray *)v6;

    parsedPlaylistsImportProperties = v5->_parsedPlaylistsImportProperties;
    v5->_parsedPlaylistsImportProperties = 0;
  }
  return v5;
}

@end