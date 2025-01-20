@interface QLThumbnailIOSurfaceGenerator
+ (id)sharedInstance;
- (void)ioSurfaceWithSize:(CGSize)a3 completionHandler:(id)a4;
@end

@implementation QLThumbnailIOSurfaceGenerator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __47__QLThumbnailIOSurfaceGenerator_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)ioSurfaceWithSize:(CGSize)a3 completionHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v18[4] = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *, void))a4;
  v17[0] = *MEMORY[0x1E4F2EF70];
  v7 = [NSNumber numberWithDouble:width];
  v18[0] = v7;
  v17[1] = *MEMORY[0x1E4F2EF28];
  v8 = [NSNumber numberWithDouble:height];
  uint64_t v9 = *MEMORY[0x1E4F2EF10];
  v18[1] = v8;
  v18[2] = &unk_1F39BD620;
  uint64_t v10 = *MEMORY[0x1E4F2EF30];
  v17[2] = v9;
  v17[3] = v10;
  v18[3] = &unk_1F39BD638;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F2EF78]) initWithProperties:v11];
  if (!v12)
  {
    v13 = (NSObject **)MEMORY[0x1E4F945F0];
    v14 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1DDC5E000, v14, OS_LOG_TYPE_FAULT, "Could not generate IOSurface for thumbnail generation with properties %@ #Thumbnail", (uint8_t *)&v15, 0xCu);
    }
  }
  v6[2](v6, v12, 0);
}

@end