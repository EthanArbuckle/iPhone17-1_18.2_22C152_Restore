@interface ML3ArtworkConfiguration
+ (id)systemConfiguration;
- (ML3ArtworkConfiguration)initWithConfigurationDictionaries:(id)a3;
- (NSDictionary)artworkConfigurationDictionary;
- (NSMutableDictionary)supportedSizesCache;
- (OS_dispatch_queue)accessQueue;
- (double)mainScreenScale;
- (id)_supportedSizeKeysForMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (id)description;
- (id)sizesToAutogenerateForMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (id)supportedSizesForMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (void)setAccessQueue:(id)a3;
- (void)setArtworkConfigurationDictionary:(id)a3;
- (void)setMainScreenScale:(double)a3;
- (void)setSupportedSizesCache:(id)a3;
@end

@implementation ML3ArtworkConfiguration

void __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) supportedSizesCache];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __70__ML3ArtworkConfiguration__supportedSizeKeysForMediaType_artworkType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"iPadOnly"];
  if ([v5 BOOLValue])
  {
    char v6 = MSVDeviceIsiPad();

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = 0;
      goto LABEL_19;
    }
  }
  else
  {
  }
  v8 = [v4 objectForKeyedSubscript:@"supportedArtworkTypes"];
  if ([v8 containsObject:*(void *)(a1 + 32)])
  {
    [v4 objectForKeyedSubscript:@"supportedMediaTypes"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if ((*(_DWORD *)(a1 + 40) & ML3ArtworkConfigurationMediaTypeForString(*(void **)(*((void *)&v15 + 1) + 8 * v13))) != 0)
          {
            uint64_t v7 = 1;
            goto LABEL_17;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 0;
LABEL_17:
  }
  else
  {
    uint64_t v7 = 0;
  }

LABEL_19:
  return v7;
}

void __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) supportedSizesCache];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)supportedSizesCache
{
  return self->_supportedSizesCache;
}

- (id)supportedSizesForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  char v6 = +[_ML3ArtworkConfigurationMediaArtworkTypeKey keyWithMediaType:artworkType:](_ML3ArtworkConfigurationMediaArtworkTypeKey, "keyWithMediaType:artworkType:");
  uint64_t v46 = 0;
  v47 = (id *)&v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__10730;
  v50 = __Block_byref_object_dispose__10731;
  id v51 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke;
  block[3] = &unk_1E5FB8208;
  v45 = &v46;
  block[4] = self;
  id v27 = v6;
  id v44 = v27;
  dispatch_sync(accessQueue, block);
  id v8 = v47[5];
  unint64_t v9 = 0x1E4F1C000;
  if (!v8)
  {
    uint64_t v10 = [(ML3ArtworkConfiguration *)self _supportedSizeKeysForMediaType:v5 artworkType:a4];
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(obj);
          }
          double v15 = _ML3ArtworkConfigurationCGSizeFromString(*(void **)(*((void *)&v39 + 1) + 8 * i));
          float64x2_t v38 = 0uLL;
          double v30 = v16;
          double v31 = v15;
          CGAffineTransformMakeScale(&v37, 2.0, 2.0);
          float64x2_t v38 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v37.c, v30), *(float64x2_t *)&v37.a, v31);
          float64x2_t v36 = 0uLL;
          CGAffineTransformMakeScale(&v35, 3.0, 3.0);
          float64x2_t v36 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v35.c, v30), *(float64x2_t *)&v35.a, v31);
          long long v17 = [MEMORY[0x1E4F29238] valueWithBytes:&v38 objCType:"{CGSize=dd}"];
          v52[0] = v17;
          long long v18 = [MEMORY[0x1E4F29238] valueWithBytes:&v36 objCType:"{CGSize=dd}"];
          v52[1] = v18;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
          [v11 addObjectsFromArray:v19];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v12);
    }

    uint64_t v20 = [v11 count];
    v21 = v11;
    if (!v20)
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
    }
    objc_storeStrong(v47 + 5, v21);
    if (!v20) {

    }
    v22 = self->_accessQueue;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke_2;
    v32[3] = &unk_1E5FB8208;
    v32[4] = self;
    id v33 = v27;
    v34 = &v46;
    dispatch_barrier_async(v22, v32);

    id v8 = v47[5];
    unint64_t v9 = 0x1E4F1C000uLL;
  }
  id v23 = [*(id *)(v9 + 2712) null];
  if (v8 == v23) {
    id v24 = 0;
  }
  else {
    id v24 = v47[5];
  }
  id v25 = v24;

  _Block_object_dispose(&v46, 8);

  return v25;
}

- (id)_supportedSizeKeysForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 4) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E5FB52E0[a4 - 1];
  }
  artworkConfigurationDictionary = self->_artworkConfigurationDictionary;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ML3ArtworkConfiguration__supportedSizeKeysForMediaType_artworkType___block_invoke;
  v8[3] = &unk_1E5FB52C0;
  unint64_t v9 = v4;
  unsigned int v10 = a3;
  char v6 = [(NSDictionary *)artworkConfigurationDictionary keysOfEntriesPassingTest:v8];

  return v6;
}

void __46__ML3ArtworkConfiguration_systemConfiguration__block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MusicLibrary"];
  v0 = [v12 URLsForResourcesWithExtension:@"artworkConfig" subdirectory:0];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v0;
  uint64_t v1 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        char v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5];
        id v15 = 0;
        uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v15];
        id v8 = v15;
        if (v8)
        {
          unint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v21 = v5;
            __int16 v22 = 2114;
            id v23 = v8;
            _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "Error loading artwork configuration at %{public}@ : %{public}@", buf, 0x16u);
          }
        }
        else
        {
          [v13 addObject:v7];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v2);
  }

  unsigned int v10 = [[ML3ArtworkConfiguration alloc] initWithConfigurationDictionaries:v13];
  uint64_t v11 = (void *)systemConfiguration___systemConfiguration;
  systemConfiguration___systemConfiguration = (uint64_t)v10;
}

- (ML3ArtworkConfiguration)initWithConfigurationDictionaries:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ML3ArtworkConfiguration;
  uint64_t v5 = [(ML3ArtworkConfiguration *)&v24 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MusicLibrary.ML3ArtworkConfiguration", MEMORY[0x1E4F14430]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    supportedSizesCache = v5->_supportedSizesCache;
    v5->_supportedSizesCache = (NSMutableDictionary *)v8;

    unsigned int v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "mergeWithDictionary:", *(void *)(*((void *)&v20 + 1) + 8 * v15++), (void)v20);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }

    uint64_t v16 = [v10 copy];
    artworkConfigurationDictionary = v5->_artworkConfigurationDictionary;
    v5->_artworkConfigurationDictionary = (NSDictionary *)v16;

    MSVGetMaximumScreenScale();
    v5->_mainScreenScale = v18;
  }
  return v5;
}

+ (id)systemConfiguration
{
  if (systemConfiguration_onceToken != -1) {
    dispatch_once(&systemConfiguration_onceToken, &__block_literal_global_10750);
  }
  uint64_t v2 = (void *)systemConfiguration___systemConfiguration;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSizesCache, 0);
  objc_storeStrong((id *)&self->_artworkConfigurationDictionary, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setMainScreenScale:(double)a3
{
  self->_mainScreenScale = a3;
}

- (double)mainScreenScale
{
  return self->_mainScreenScale;
}

- (void)setSupportedSizesCache:(id)a3
{
}

- (void)setArtworkConfigurationDictionary:(id)a3
{
}

- (NSDictionary)artworkConfigurationDictionary
{
  return self->_artworkConfigurationDictionary;
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p %@>\n", objc_opt_class(), self, self->_artworkConfigurationDictionary];
}

- (id)sizesToAutogenerateForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ML3ArtworkConfiguration *)self _supportedSizeKeysForMediaType:*(void *)&a3 artworkType:a4];
  long long v21 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = [(NSDictionary *)self->_artworkConfigurationDictionary objectForKey:v11];
        uint64_t v13 = [v12 objectForKey:@"autogenerate"];
        int v14 = [v13 BOOLValue];

        if (v14)
        {
          float64x2_t v25 = 0uLL;
          float64_t v15 = _ML3ArtworkConfigurationCGSizeFromString(v11);
          double v22 = v16;
          double v23 = v15;
          v25.f64[0] = v15;
          v25.f64[1] = v16;
          CGAffineTransformMakeScale(&v24, self->_mainScreenScale, self->_mainScreenScale);
          float64x2_t v25 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, v22), *(float64x2_t *)&v24.a, v23);
          long long v17 = [MEMORY[0x1E4F29238] valueWithBytes:&v25 objCType:"{CGSize=dd}"];
          [v21 addObject:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  if ([v21 count]) {
    double v18 = v21;
  }
  else {
    double v18 = 0;
  }
  id v19 = v18;

  return v19;
}

@end