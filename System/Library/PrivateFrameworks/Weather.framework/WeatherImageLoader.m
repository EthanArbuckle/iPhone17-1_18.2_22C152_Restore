@interface WeatherImageLoader
+ (id)cachedImageNamed:(id)a3 completion:(id)a4;
+ (id)colorForImageColor:(id)a3 lighter:(BOOL)a4;
+ (id)conditionImageNameWithConditionIndex:(int64_t)a3;
+ (id)conditionImageNamed:(id)a3 size:(CGSize)a4 cloudAligned:(BOOL)a5 stroke:(BOOL)a6 strokeAlpha:(double)a7 lighterColors:(BOOL)a8;
+ (id)conditionImageNamed:(id)a3 style:(int64_t)a4;
+ (id)conditionImageWithConditionIndex:(int64_t)a3;
+ (id)conditionImageWithConditionIndex:(int64_t)a3 style:(int64_t)a4;
+ (id)sharedImageLoader;
+ (void)cacheImageIfNecessary:(id)a3;
+ (void)preloadImages;
- (CPBitmapStore)store;
- (NSCache)conditionImagesCache;
- (WeatherImageLoader)init;
- (id)cachedImageForKey:(id)a3;
- (void)setConditionImagesCache:(id)a3;
- (void)setImage:(id)a3 forKey:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation WeatherImageLoader

- (WeatherImageLoader)init
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)WeatherImageLoader;
  v2 = [(WeatherImageLoader *)&v39 init];
  if (v2)
  {
    v3 = +[WeatherPreferences sharedPreferences];
    v4 = [v3 readDefaultValueForKey:@"HasMigratedDataProtectionClassTake2"];
    char v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0)
    {
      v6 = [MEMORY[0x263F1C408] sharedApplication];
      v7 = [v6 userLibraryDirectory];
      MigrateDataProtectionClassOfPath(v7);

      v8 = [MEMORY[0x263F1C408] sharedApplication];
      v9 = [v8 userCachesDirectory];
      MigrateDataProtectionClassOfPath(v9);

      v10 = [MEMORY[0x263F1C408] sharedApplication];
      v11 = [v10 userCachesDirectory];
      v12 = [v11 stringByAppendingPathComponent:@"Weather"];
      MigrateDataProtectionClassOfPath(v12);

      v13 = _WAWeatherIconCachePath();
      v14 = [MEMORY[0x263F08850] defaultManager];
      id v38 = 0;
      [v14 removeItemAtPath:v13 error:&v38];
      id v15 = v38;
      v16 = WALogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v13;
        __int16 v42 = 2112;
        id v43 = v15;
        _os_log_impl(&dword_226D1D000, v16, OS_LOG_TYPE_DEFAULT, "Removed: %@ Error: %@", buf, 0x16u);
      }

      v17 = [MEMORY[0x263F1C408] sharedApplication];
      v18 = [v17 userCachesDirectory];
      v19 = [v18 stringByAppendingPathComponent:@"Weather/Labels"];

      id v37 = 0;
      [v14 removeItemAtPath:v19 error:&v37];
      id v20 = v37;
      v21 = WALogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v19;
        __int16 v42 = 2112;
        id v43 = v20;
        _os_log_impl(&dword_226D1D000, v21, OS_LOG_TYPE_DEFAULT, "Removed: %@ Error: %@", buf, 0x16u);
      }

      [v3 writeDefaultValue:MEMORY[0x263EFFA88] forKey:@"HasMigratedDataProtectionClassTake2"];
    }
    id v22 = objc_alloc(MEMORY[0x263F255A8]);
    v23 = _WAWeatherIconCachePath();
    uint64_t v24 = [v22 initWithPath:v23 version:13];
    store = v2->_store;
    v2->_store = (CPBitmapStore *)v24;

    int v26 = [(CPBitmapStore *)v2->_store version];
    v27 = v2->_store;
    if (v26 == 13)
    {
      if ([(CPBitmapStore *)v27 version] != -1)
      {
LABEL_13:
        v32 = [MEMORY[0x263F1C920] mainScreen];
        [v32 scale];
        v2->_scale = v33;

        v34 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
        conditionImagesCache = v2->_conditionImagesCache;
        v2->_conditionImagesCache = v34;

        [(NSCache *)v2->_conditionImagesCache setEvictsObjectsWhenApplicationEntersBackground:0];
        return v2;
      }
    }
    else
    {
      [(CPBitmapStore *)v27 purge];
      id v28 = objc_alloc(MEMORY[0x263F255A8]);
      v29 = _WAWeatherIconCachePath();
      uint64_t v30 = [v28 initWithPath:v29 version:13];
      v31 = v2->_store;
      v2->_store = (CPBitmapStore *)v30;
    }
    [(CPBitmapStore *)v2->_store setVersion:13 withOptions:0x10000000];
    goto LABEL_13;
  }
  return v2;
}

+ (void)preloadImages
{
  for (uint64_t i = 0; i != 48; ++i)
    id v3 = +[WeatherImageLoader conditionImageWithConditionIndex:i];
}

- (id)cachedImageForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(WeatherImageLoader *)self conditionImagesCache];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = [(CPBitmapStore *)self->_store copyImageForKey:v4 inGroup:&stru_26DADC2F0];
    if (v7)
    {
      v8 = (CGImage *)v7;
      v6 = [MEMORY[0x263F1C6B0] imageWithCGImage:v7 scale:0 orientation:self->_scale];
      v9 = [(WeatherImageLoader *)self conditionImagesCache];
      [v9 setObject:v6 forKey:v4];

      CGImageRelease(v8);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 CGImage]) {
    -[CPBitmapStore storeImageForKey:inGroup:opaque:image:](self->_store, "storeImageForKey:inGroup:opaque:image:", v7, &stru_26DADC2F0, 0, [v8 CGImage]);
  }
}

+ (id)sharedImageLoader
{
  v2 = (void *)sharedImageLoader___sharedImageLoader;
  if (!sharedImageLoader___sharedImageLoader)
  {
    id v3 = objc_alloc_init(WeatherImageLoader);
    id v4 = (void *)sharedImageLoader___sharedImageLoader;
    sharedImageLoader___sharedImageLoader = (uint64_t)v3;

    v2 = (void *)sharedImageLoader___sharedImageLoader;
  }
  return v2;
}

+ (void)cacheImageIfNecessary:(id)a3
{
  id v10 = a3;
  id v4 = +[WeatherImageLoader sharedImageLoader];
  char v5 = [v4 cachedImageForKey:v10];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x263F1C6B0];
    id v7 = [a1 conditionImageBundle];
    id v8 = [v6 imageNamed:v10 inBundle:v7];
    v9 = [v8 WAImageLoaderPreCacheImage];

    [v4 setImage:v9 forKey:v10];
  }
}

+ (id)conditionImageWithConditionIndex:(int64_t)a3
{
  id v3 = [a1 conditionImageNameWithConditionIndex:a3];
  id v4 = +[WeatherImageLoader conditionImageNamed:v3 style:4];

  return v4;
}

+ (id)conditionImageWithConditionIndex:(int64_t)a3 style:(int64_t)a4
{
  char v5 = [a1 conditionImageNameWithConditionIndex:a3];
  id v6 = +[WeatherImageLoader conditionImageNamed:v5 style:a4];

  return v6;
}

+ (id)conditionImageNamed:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = UIAccessibilityDarkerSystemColorsEnabled();
  uint64_t v8 = 0;
  double v9 = 40.0;
  double v10 = 0.58;
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  switch(a4)
  {
    case 0:
      goto LABEL_3;
    case 1:
      uint64_t v8 = 1;
      double v10 = 1.0;
LABEL_3:
      uint64_t v13 = 0;
      uint64_t v12 = v8;
      double v9 = 60.0;
      uint64_t v8 = 0;
      break;
    case 2:
      goto LABEL_5;
    case 3:
      uint64_t v8 = 1;
LABEL_5:
      uint64_t v13 = v8;
      uint64_t v8 = v7 | IsReduceTransparencyEnabled;
      double v9 = 100.0;
      uint64_t v12 = v7;
      break;
    case 5:
      uint64_t v8 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 1;
      double v9 = 40.0;
      break;
    default:
      break;
  }
  v14 = objc_msgSend(a1, "conditionImageNamed:size:cloudAligned:stroke:strokeAlpha:lighterColors:", v6, v13, v12, v8, v9, v9, v10);

  return v14;
}

+ (id)conditionImageNamed:(id)a3 size:(CGSize)a4 cloudAligned:(BOOL)a5 stroke:(BOOL)a6 strokeAlpha:(double)a7 lighterColors:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  v16 = WASmallWeatherIconsMap();
  v17 = [v16 objectForKey:v15];

  v18 = [v17 objectForKey:@"WeatherMapColors"];
  if ([v18 count])
  {
    v52 = v17;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__0;
    v70 = __Block_byref_object_dispose__0;
    v19 = (void *)MEMORY[0x263F1C6B0];
    id v20 = NSString;
    v53 = v18;
    v21 = [v18 firstObject];
    id v22 = [v20 stringWithFormat:@"%@_%@", v15, v21];
    id v23 = a1;
    [a1 conditionImageBundle];
    v25 = BOOL v24 = v8;
    id v71 = [v19 imageNamed:v22 inBundle:v25];

    int v26 = NSString;
    uint64_t v27 = [NSNumber numberWithDouble:width];
    id v28 = (void *)v27;
    v29 = @"vert";
    if (v11) {
      v29 = @"hor";
    }
    uint64_t v30 = &stru_26DADC2F0;
    v31 = @"-stroke";
    if (!v10) {
      v31 = &stru_26DADC2F0;
    }
    if (v24) {
      uint64_t v30 = @"l";
    }
    v32 = [v26 stringWithFormat:@"%@-%@-%@%@%@", v15, v29, v27, v31, v30];

    double v33 = +[WeatherImageLoader sharedImageLoader];
    v34 = [v33 cachedImageForKey:v32];

    if (v34)
    {
      id v35 = v34;
    }
    else
    {
      [(id)v67[5] size];
      double v37 = v36;
      [(id)v67[5] size];
      double v39 = v38;
      [(id)v67[5] size];
      double v41 = v40;
      __int16 v42 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", width, height);
      double v43 = width * 0.125;
      double v44 = (width + width * 0.125 * -2.0) / v37;
      double v45 = v44 * v39;
      double v46 = v44 * v41;
      double v47 = (height - v44 * v41) * 0.5;
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __93__WeatherImageLoader_conditionImageNamed_size_cloudAligned_stroke_strokeAlpha_lighterColors___block_invoke;
      v54[3] = &unk_2647E06F0;
      BOOL v64 = v10;
      id v55 = v15;
      id v58 = v23;
      double v59 = a7;
      double v60 = v43;
      double v61 = v47;
      double v62 = v45;
      double v63 = v46;
      id v56 = v53;
      v57 = &v66;
      BOOL v65 = v24;
      v48 = [v42 imageWithActions:v54];
      v49 = [v48 WAImageLoaderPreCacheImage];

      v50 = +[WeatherImageLoader sharedImageLoader];
      [v50 setImage:v49 forKey:v32];

      id v35 = v49;
    }
    v17 = v52;

    _Block_object_dispose(&v66, 8);
    v18 = v53;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

void __93__WeatherImageLoader_conditionImageNamed_size_cloudAligned_stroke_strokeAlpha_lighterColors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v26 = a2;
  unint64_t v3 = 0x263F1C000uLL;
  unint64_t v4 = 0x263F08000uLL;
  if (*(unsigned char *)(a1 + 104))
  {
    char v5 = (void *)MEMORY[0x263F1C6B0];
    id v6 = [NSString stringWithFormat:@"%@_stroke", *(void *)(a1 + 32)];
    BOOL v7 = [*(id *)(a1 + 56) conditionImageBundle];
    BOOL v8 = [v5 imageNamed:v6 inBundle:v7];
    double v9 = [v8 imageWithRenderingMode:2];

    BOOL v10 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:*(double *)(a1 + 64)];
    [v10 set];

    objc_msgSend(v9, "drawPDFInRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v16 = v3;
        v17 = *(void **)(v3 + 1712);
        [*(id *)(v4 + 2880) stringWithFormat:@"%@_%@", *(void *)(a1 + 32), v15, v26];
        v19 = unint64_t v18 = v4;
        id v20 = [*(id *)(a1 + 56) conditionImageBundle];
        v21 = [v17 imageNamed:v19 inBundle:v20];
        uint64_t v22 = [v21 imageWithRenderingMode:2];
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
        BOOL v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        unint64_t v3 = v16;
        unint64_t v4 = v18;
        v25 = [*(id *)(a1 + 56) colorForImageColor:v15 lighter:*(unsigned __int8 *)(a1 + 105)];
        [v25 set];

        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "drawPDFInRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }
}

+ (id)colorForImageColor:(id)a3 lighter:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 containsString:@"white"])
  {
    uint64_t v6 = [MEMORY[0x263F1C550] whiteColor];
    goto LABEL_12;
  }
  if ([v5 containsString:@"blue"])
  {
    BOOL v7 = (void *)MEMORY[0x263F1C550];
    double v8 = 0.352941176;
    double v9 = 0.784313725;
    double v10 = 0.980392157;
LABEL_11:
    uint64_t v6 = [v7 colorWithRed:v8 green:v9 blue:v10 alpha:1.0];
    goto LABEL_12;
  }
  if ([v5 containsString:@"yellow"])
  {
    BOOL v7 = (void *)MEMORY[0x263F1C550];
    if (v4)
    {
      double v8 = 0.984313725;
      double v9 = 0.91372549;
      double v10 = 0.380392157;
    }
    else
    {
      double v8 = 0.996078431;
      double v9 = 0.843137255;
      double v10 = 0.192156863;
    }
    goto LABEL_11;
  }
  int v11 = [v5 containsString:@"red"];
  BOOL v7 = (void *)MEMORY[0x263F1C550];
  if (v11)
  {
    double v9 = 0.22745098;
    double v10 = 0.184313725;
    double v8 = 1.0;
    goto LABEL_11;
  }
  uint64_t v6 = [MEMORY[0x263F1C550] clearColor];
LABEL_12:
  uint64_t v12 = (void *)v6;

  return v12;
}

+ (id)cachedImageNamed:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  BOOL v7 = +[WeatherImageLoader sharedImageLoader];
  uint64_t v8 = [v7 cachedImageForKey:v5];
  double v9 = (void *)v8;
  if (v6 && !v8)
  {
    double v9 = v6[2](v6);
    [v7 setImage:v9 forKey:v5];
  }

  return v9;
}

+ (id)conditionImageNameWithConditionIndex:(int64_t)a3
{
  int64_t v3 = 44;
  if ((unint64_t)a3 <= 0x2F) {
    int64_t v3 = a3;
  }
  return *(&smallWeatherIcons + v3);
}

- (CPBitmapStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSCache)conditionImagesCache
{
  return self->_conditionImagesCache;
}

- (void)setConditionImagesCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionImagesCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end