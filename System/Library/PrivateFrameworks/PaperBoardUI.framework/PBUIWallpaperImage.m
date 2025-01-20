@interface PBUIWallpaperImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSURL)wallpaperFileURL;
- (PBUIWallpaperImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5 wallpaperFileURL:(id)a6;
- (PBUIWallpaperImage)initWithCoder:(id)a3;
- (PBUIWallpaperImage)initWithFlatColor:(id)a3;
- (PBUIWallpaperImage)initWithFlatColor:(id)a3 size:(CGSize)a4 scale:(double)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBUIWallpaperImage

- (PBUIWallpaperImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5 wallpaperFileURL:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperImage;
  v12 = [(PBUIWallpaperImage *)&v15 initWithCGImage:a3 scale:a5 orientation:a4];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_wallpaperFileURL, a6);
  }

  return v13;
}

- (PBUIWallpaperImage)initWithFlatColor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F42D90];
  id v5 = a3;
  v6 = [v4 mainScreen];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [v6 scale];
  double v12 = v11;
  v13 = PBUIWallpaperImageWithFlatColor(v5, v8, v10, v11);

  id v14 = v13;
  objc_super v15 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:wallpaperFileURL:](self, "initWithCGImage:scale:orientation:wallpaperFileURL:", [v14 CGImage], 0, 0, v12);

  return v15;
}

- (PBUIWallpaperImage)initWithFlatColor:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  PBUIWallpaperImageWithFlatColor(a3, a4.width, a4.height, a5);
  id v7 = objc_claimAutoreleasedReturnValue();
  CGFloat v8 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:wallpaperFileURL:](self, "initWithCGImage:scale:orientation:wallpaperFileURL:", [v7 CGImage], 0, 0, a5);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 wallpaperFileURL],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        (uint64_t)self->_wallpaperFileURL | v5))
  {
    unsigned __int8 v6 = BSEqualObjects();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBUIWallpaperImage;
    unsigned __int8 v6 = [(PBUIWallpaperImage *)&v8 isEqual:v4];
  }

  return v6;
}

- (unint64_t)hash
{
  if (self->_wallpaperFileURL)
  {
    wallpaperFileURL = self->_wallpaperFileURL;
    return [(NSURL *)wallpaperFileURL hash];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PBUIWallpaperImage;
    return [(PBUIWallpaperImage *)&v4 hash];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIWallpaperImage;
  id v4 = a3;
  [(PBUIWallpaperImage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_wallpaperFileURL, @"wallpaperFileURL", v5.receiver, v5.super_class);
}

- (PBUIWallpaperImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIWallpaperImage;
  objc_super v5 = [(PBUIWallpaperImage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wallpaperFileURL"];
    wallpaperFileURL = v5->_wallpaperFileURL;
    v5->_wallpaperFileURL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)wallpaperFileURL
{
  return self->_wallpaperFileURL;
}

- (void).cxx_destruct
{
}

@end