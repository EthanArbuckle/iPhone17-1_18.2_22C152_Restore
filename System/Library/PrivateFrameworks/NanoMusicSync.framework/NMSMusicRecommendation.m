@interface NMSMusicRecommendation
+ (id)_missingArtImage;
+ (void)_fillArtworkMutableArray:(id)a3 toCount:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (MPArtworkCatalog)artworkCatalog;
- (NMSMusicRecommendation)initWithIdentifier:(id)a3 title:(id)a4 items:(id)a5;
- (NSArray)storeRecommendationModelObjects;
- (NSDate)lastModifiedDate;
- (NSOrderedSet)items;
- (NSString)identifier;
- (NSString)title;
- (id)_tiledArtworkRequestForPlaylists:(id)a3 albums:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setSelected:(BOOL)a3;
@end

@implementation NMSMusicRecommendation

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_selected) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@:%p identifier: %@, selected: %@>", v5, self, self->_identifier, v7];

  return v8;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NMSMusicRecommendation)initWithIdentifier:(id)a3 title:(id)a4 items:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NMSMusicRecommendation;
  v12 = [(NMSMusicRecommendation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_items, a5);
    v13->_selected = 1;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendation", 0);
    serializerQueue = v13->_serializerQueue;
    v13->_serializerQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NMSMusicRecommendation *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 != self)
    {
      uint64_t v5 = v4;
      if (![(NSString *)self->_identifier isEqual:v5->_identifier])
      {
        BOOL v9 = 0;
LABEL_14:

        goto LABEL_15;
      }
      id v6 = [(NSOrderedSet *)self->_items valueForKey:@"identifiers"];
      id v7 = [(NSOrderedSet *)v5->_items valueForKey:@"identifiers"];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          BOOL v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      BOOL v9 = self->_selected == v5->_selected;
      goto LABEL_13;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (NSDate)lastModifiedDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__11;
  id v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  serializerQueue = self->_serializerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__NMSMusicRecommendation_lastModifiedDate__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serializerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __42__NMSMusicRecommendation_lastModifiedDate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  if ([v2 isEqualToString:NMSRecommendationRecentMusicIdentifier])
  {
LABEL_2:

    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) count];

  if (v3 == 1)
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 8) firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      uint64_t v5 = [v4 lastModifiedDateComponents];

      if (v5)
      {
        id v6 = objc_alloc(MEMORY[0x263EFF8F0]);
        id v7 = [v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
        uint64_t v8 = [v4 lastModifiedDateComponents];
        uint64_t v9 = [v7 dateFromComponents:v8];
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(v10 + 32);
        *(void *)(v10 + 32) = v9;
      }
      else
      {
        id v7 = NMLogForCategory(5);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __42__NMSMusicRecommendation_lastModifiedDate__block_invoke_cold_1((uint64_t)v4, v7);
        }
      }
    }
    goto LABEL_2;
  }
LABEL_7:
  v12 = *(void **)(*(void *)(a1 + 32) + 32);
  v13 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v13, v12);
}

- (MPArtworkCatalog)artworkCatalog
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  serializerQueue = self->_serializerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__NMSMusicRecommendation_artworkCatalog__block_invoke;
  v5[3] = &unk_264634248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serializerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPArtworkCatalog *)v3;
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 40))
  {
    if ([*(id *)(v2 + 8) count] == 1)
    {
      id v3 = [*(id *)(*(void *)(v1 + 32) + 8) firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v3;
        uint64_t v5 = [v4 artworkCatalog];
        uint64_t v6 = v5;
        if (!v5)
        {
          uint64_t v6 = [v4 tracksTiledArtworkCatalogWithRows:2 columns:2];
        }
        objc_storeStrong((id *)(*(void *)(v1 + 32) + 40), v6);
        if (!v5) {
      }
        }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v25 = [v3 artworkCatalog];
        uint64_t v26 = *(void *)(v1 + 32);
        id v4 = *(id *)(v26 + 40);
        *(void *)(v26 + 40) = v25;
      }

      goto LABEL_25;
    }
    id v3 = [MEMORY[0x263EFF980] array];
    [MEMORY[0x263EFF980] array];
    v28 = uint64_t v27 = v1;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = *(id *)(*(void *)(v1 + 32) + 8);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v8) {
      goto LABEL_21;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = NSNumber;
        dispatch_queue_t v14 = [v12 identifiers];
        v15 = [v14 library];
        v16 = objc_msgSend(v18, "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
        objc_super v17 = v28;
        goto LABEL_18;
      }
LABEL_19:
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (!v9)
        {
LABEL_21:

          uint64_t v1 = v27;
          v19 = [*(id *)(v27 + 32) _tiledArtworkRequestForPlaylists:v3 albums:v28];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2;
          v29[3] = &unk_264634B50;
          v29[4] = *(void *)(v27 + 32);
          [v19 setArtworkCatalogsBlock:v29];
          id v20 = objc_alloc(MEMORY[0x263F11D30]);
          v21 = [MEMORY[0x263F12308] sharedDataSource];
          uint64_t v22 = [v20 initWithToken:v19 dataSource:v21];
          uint64_t v23 = *(void *)(v27 + 32);
          v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;

          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }
    v13 = NSNumber;
    dispatch_queue_t v14 = [v12 identifiers];
    v15 = [v14 library];
    v16 = objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
    objc_super v17 = v3;
LABEL_18:
    [v17 addObject:v16];

    goto LABEL_19;
  }
LABEL_26:
  objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40), *(id *)(*(void *)(v1 + 32) + 40));
}

id __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if (!v11)
          {
            dispatch_queue_t v14 = NMLogForCategory(5);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_1();
            }
            goto LABEL_21;
          }
          v12 = v11;
          v13 = [v11 artworkCatalog];

          if (!v13)
          {
            dispatch_queue_t v14 = NMLogForCategory(5);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_2((uint64_t)v25, (uint64_t)v12);
            }
            goto LABEL_21;
          }
          dispatch_queue_t v14 = [v12 artworkCatalog];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          id v15 = v10;
          if (!v15)
          {
            dispatch_queue_t v14 = NMLogForCategory(5);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_3();
            }
            goto LABEL_21;
          }
          v16 = v15;
          dispatch_queue_t v14 = [v15 artworkCatalog];
          if (!v14)
          {
            dispatch_queue_t v14 = [v16 tracksTiledArtworkCatalogWithRows:2 columns:2];
            if (!v14)
            {
              dispatch_queue_t v14 = NMLogForCategory(5);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_4((uint64_t)v24, (uint64_t)v16);
              }
              goto LABEL_21;
            }
          }
        }
        [v4 addObject:v14];
LABEL_21:

LABEL_22:
        if ([v4 count] >= a2) {
          goto LABEL_28;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v17 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      uint64_t v7 = v17;
    }
    while (v17);
  }
LABEL_28:

  [(id)objc_opt_class() _fillArtworkMutableArray:v4 toCount:a2];
  v18 = (void *)[v4 copy];

  return v18;
}

- (id)_tiledArtworkRequestForPlaylists:(id)a3 albums:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F12310]);
  [v8 setNumberOfRows:2];
  [v8 setNumberOfColumns:2];
  [v8 setTileSpacing:2.0];
  [v8 setEntityIdentifier:self->_identifier];
  [v8 setNamespaceIdentifier:@"com.apple.NanoMusic.Recommendation"];
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v6 = [MEMORY[0x263EFF8C0] array];
    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = [MEMORY[0x263EFF8C0] array];
LABEL_3:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v24 = v6;
  v34[0] = v6;
  v34[1] = v7;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v34, 2, v7);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v26 != v19) {
                objc_enumerationMutation(v16);
              }
              v12 += [*(id *)(*((void *)&v25 + 1) + 8 * j) hash];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v18);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  long long v21 = [NSNumber numberWithUnsignedInteger:v12];
  [v8 setRevisionIdentifier:v21];

  return v8;
}

+ (id)_missingArtImage
{
  uint64_t v2 = [MEMORY[0x263F1C550] systemGrayColor];
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v6, 1, 0.0);
  [v2 setFill];
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  id v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v3;
}

+ (void)_fillArtworkMutableArray:(id)a3 toCount:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 count] < a4)
  {
    CGSize v6 = (void *)MEMORY[0x263F11D30];
    CGRect v7 = [(id)objc_opt_class() _missingArtImage];
    id v8 = [v6 staticArtworkCatalogWithImage:v7];

    uint64_t v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218240;
      uint64_t v11 = [v5 count];
      __int16 v12 = 2048;
      unint64_t v13 = a4;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_INFO, "Filling tiled artwork catalog %tu -> %tu", (uint8_t *)&v10, 0x16u);
    }

    while ([v5 count] < a4)
      [v5 addObject:v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_identifier);
    objc_storeStrong((id *)(v5 + 8), self->_items);
    *(unsigned char *)(v5 + 56) = self->_selected;
  }
  return (id)v5;
}

- (NSArray)storeRecommendationModelObjects
{
  return [(NSOrderedSet *)self->_items array];
}

- (NSOrderedSet)items
{
  return self->_items;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializerQueue, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

void __42__NMSMusicRecommendation_lastModifiedDate__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "No lastModifiedDateComponents for playlist %@", (uint8_t *)&v2, 0xCu);
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_1()
{
  v0 = [(id)OUTLINED_FUNCTION_3_1() identifiers];
  OUTLINED_FUNCTION_2_1((uint64_t)v0, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_2228FD000, v1, v2, "The recommendation [%{public}@] is an album, but the album information is missing. This is likely to manifest as missing artwork in Music's settings in the Watch app.");
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "identifiers");
  OUTLINED_FUNCTION_2_1((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_2228FD000, v3, v4, "The recommended album [%{public}@] is missing its artwork catalog. This is likely to manifest as missing artwork in Music's settings in the Watch app.");
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_3()
{
  v0 = [(id)OUTLINED_FUNCTION_3_1() identifiers];
  OUTLINED_FUNCTION_2_1((uint64_t)v0, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_2228FD000, v1, v2, "The recommendation [%{public}@] is a playlist, but the playlist information is missing. This is likely to manifest as missing artwork in Music's settings in the Watch app.");
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "identifiers");
  OUTLINED_FUNCTION_2_1((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_2228FD000, v3, v4, "The recommended playlist [%{public}@] is missing its artwork catalog. This is likely to manifest as missing artwork in Music's settings in the Watch app.");
}

@end