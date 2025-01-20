@interface WFImgArrayCache
+ (id)imgArrayCacheWithArray:(id)a3;
- (WFImgArrayCache)initWithArray:(id)a3;
- (id)imageAlternativeDescriptions;
- (int64_t)numberOfKnownImagePixels;
- (int64_t)numberOfUnknownSizedImages;
- (void)dealloc;
@end

@implementation WFImgArrayCache

+ (id)imgArrayCacheWithArray:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithArray:a3];
  return v3;
}

- (WFImgArrayCache)initWithArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)WFImgArrayCache;
  v3 = [(WFImgArrayCache *)&v23 init];
  v4 = v3;
  if (v3)
  {
    v3->numberOfUnknownSizedImages = 0;
    uint64_t v5 = objc_opt_new();
    v4->numberOfKnownImagePixels = 0;
    v4->imageAlternativeDescriptions = (NSMutableString *)v5;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(a3);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = __WFDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[WFImgArrayCache initWithArray:](v16);
            }
            return v4;
          }
          uint64_t v11 = [v10 area];
          if (v11 == kWFImgDimensionUnknown) {
            p_numberOfUnknownSizedImages = &v4->numberOfUnknownSizedImages;
          }
          else {
            p_numberOfUnknownSizedImages = &v4->numberOfKnownImagePixels;
          }
          if (v11 == kWFImgDimensionUnknown) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = v11;
          }
          *p_numberOfUnknownSizedImages += v13;
          v14 = (void *)[v10 alt];
          v15 = (void *)[v10 title];
          if (v14 && ([v14 isEqualToString:&stru_26C7AC028] & 1) == 0) {
            [(NSMutableString *)v4->imageAlternativeDescriptions appendFormat:@"%@\n", v14];
          }
          if (v15
            && ([v15 isEqualToString:&stru_26C7AC028] & 1) == 0
            && (!v14 || ([v15 isEqualToString:v14] & 1) == 0))
          {
            [(NSMutableString *)v4->imageAlternativeDescriptions appendFormat:@"%@\n", v15];
          }
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  return v4;
}

- (id)imageAlternativeDescriptions
{
  return self->imageAlternativeDescriptions;
}

- (int64_t)numberOfUnknownSizedImages
{
  return self->numberOfUnknownSizedImages;
}

- (int64_t)numberOfKnownImagePixels
{
  return self->numberOfKnownImagePixels;
}

- (void)dealloc
{
  imageAlternativeDescriptions = self->imageAlternativeDescriptions;
  if (imageAlternativeDescriptions) {

  }
  v4.receiver = self;
  v4.super_class = (Class)WFImgArrayCache;
  [(WFImgArrayCache *)&v4 dealloc];
}

- (void)initWithArray:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  v2 = "-[WFImgArrayCache initWithArray:]";
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "**** Warning %{public}s array doesn't contain WFImg objects", (uint8_t *)&v1, 0xCu);
}

@end