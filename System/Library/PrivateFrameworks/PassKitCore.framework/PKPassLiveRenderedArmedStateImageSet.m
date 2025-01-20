@interface PKPassLiveRenderedArmedStateImageSet
+ (BOOL)shouldCache;
+ (id)archiveName;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (PKPassLiveRenderedArmedStateImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
@end

@implementation PKPassLiveRenderedArmedStateImageSet

- (PKPassLiveRenderedArmedStateImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPassLiveRenderedArmedStateImageSet;
  v13 = [(PKPassLiveRenderedImageSet *)&v22 initWithDisplayProfile:v10 fileURL:v11 screenScale:v12 suffix:a5];
  if (v13)
  {
    v14 = (void *)MEMORY[0x192FDC630]();
    v15 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    uint64_t v16 = +[PKImage imageNamed:@"diffuseArmed" inBundle:v15 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setDiffuseMaterialPropertyImage:v16];
    uint64_t v17 = +[PKImage imageNamed:@"normalArmed" inBundle:v15 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setNormalMaterialPropertyImage:v17];
    uint64_t v18 = +[PKImage imageNamed:@"metalnessArmed" inBundle:v15 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setMetalnessMaterialPropertyImage:v18];

    if (v16 | v17 | v18) {
      v19 = v13;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  return v20;
}

+ (int64_t)imageSetType
{
  return 7;
}

+ (BOOL)shouldCache
{
  return 0;
}

+ (id)archiveName
{
  return @"LiveRenderedArmedState";
}

+ (unsigned)currentVersion
{
  return 1;
}

@end