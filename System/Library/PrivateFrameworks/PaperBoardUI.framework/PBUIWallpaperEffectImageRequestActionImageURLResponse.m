@interface PBUIWallpaperEffectImageRequestActionImageURLResponse
- (NSURL)imageURL;
- (PBUIWallpaperEffectImageRequestActionImageURLResponse)initWithActualStyle:(int64_t)a3 size:(CGSize)a4 imageURL:(id)a5;
@end

@implementation PBUIWallpaperEffectImageRequestActionImageURLResponse

- (PBUIWallpaperEffectImageRequestActionImageURLResponse)initWithActualStyle:(int64_t)a3 size:(CGSize)a4 imageURL:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v9 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v10 = a5;
  id v11 = objc_alloc_init(v9);
  v12 = [NSNumber numberWithInteger:a3];
  [v11 setObject:v12 forSetting:1];

  v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  [v11 setObject:v13 forSetting:2];

  v14 = [v10 filePathURL];

  v15 = [v14 path];
  [v11 setObject:v15 forSetting:3];

  v18.receiver = self;
  v18.super_class = (Class)PBUIWallpaperEffectImageRequestActionImageURLResponse;
  v16 = [(PBUIWallpaperEffectImageRequestActionImageURLResponse *)&v18 initWithInfo:v11 error:0];

  return v16;
}

- (NSURL)imageURL
{
  v2 = [(PBUIWallpaperEffectImageRequestActionImageURLResponse *)self info];
  v3 = [v2 objectForSetting:3];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

@end