@interface PUWallpaperPosterLegacyAsset
- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3;
- (BOOL)supportsSegmentationResourceCaching;
- (CGImage)proxyImage;
- (CGRect)acceptableCropRect;
- (CGRect)gazeAreaRect;
- (CGRect)preferredCropRect;
- (NSArray)faceRegions;
- (NSArray)petRegions;
- (NSString)localIdentifier;
- (NSURL)segmentationResourceURL;
- (PUWallpaperPosterLegacyAsset)initWithProxyImage:(CGImage *)a3;
- (int)loadMotionScore:(id)a3;
- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5;
- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4;
- (void)updateSegmentationResource:(id)a3;
@end

@implementation PUWallpaperPosterLegacyAsset

- (CGImage)proxyImage
{
  return self->_proxyImage;
}

- (int)loadMotionScore:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterMigrator.m" lineNumber:260 description:@"Migration asset does not support motion"];

  abort();
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterMigrator.m" lineNumber:255 description:@"Migration asset does not support pet regions"];

  abort();
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  v6 = (objc_class *)MEMORY[0x1E4F8CC68];
  id v7 = (void (**)(id, id, void))a5;
  id v8 = objc_alloc_init(v6);
  [v8 setType:5];
  objc_msgSend(v8, "setProxyImage:", -[PUWallpaperPosterLegacyAsset proxyImage](self, "proxyImage"));
  v7[2](v7, v8, 0);

  return 1;
}

- (void)updateSegmentationResource:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterMigrator.m" lineNumber:230 description:@"Migration asset does not support caching"];
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  return 1;
}

- (NSURL)segmentationResourceURL
{
  return 0;
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 0;
}

- (NSString)localIdentifier
{
  return (NSString *)@"LegacyAsset";
}

- (NSArray)petRegions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)faceRegions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (CGRect)gazeAreaRect
{
  double v2 = *MEMORY[0x1E4F91340];
  double v3 = *(double *)(MEMORY[0x1E4F91340] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F91340] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F91340] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2 = *MEMORY[0x1E4F91340];
  double v3 = *(double *)(MEMORY[0x1E4F91340] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F91340] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F91340] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2 = *MEMORY[0x1E4F91340];
  double v3 = *(double *)(MEMORY[0x1E4F91340] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F91340] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F91340] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (PUWallpaperPosterLegacyAsset)initWithProxyImage:(CGImage *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperPosterLegacyAsset;
  CGRect result = [(PUWallpaperPosterLegacyAsset *)&v5 init];
  if (result) {
    result->_proxyImage = a3;
  }
  return result;
}

@end