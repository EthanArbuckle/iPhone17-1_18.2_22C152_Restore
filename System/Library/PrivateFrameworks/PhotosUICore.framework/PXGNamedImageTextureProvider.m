@interface PXGNamedImageTextureProvider
- (NSBundle)bundle;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForImageWithName:(id)a3 inBundle:(id)a4 isSystemImage:(BOOL)a5 tintColor:(id)a6 imageConfiguration:(id)a7 userInterfaceDirection:(unint64_t)a8 screenScale:(double)a9 requestID:(int)a10;
- (void)setBundle:(id)a3;
@end

@implementation PXGNamedImageTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  unsigned int length = a3.length;
  id v13 = a7;
  v55.receiver = self;
  v55.super_class = (Class)PXGNamedImageTextureProvider;
  id v14 = [(PXGTextureProvider *)&v55 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v37 = v15;
  NSUInteger v38 = (NSUInteger)v14;
  v40 = [v13 contentSource];
  val = self;
  v39 = [(PXGNamedImageTextureProvider *)self bundle];
  v41 = v13;
  [v13 displayScale];
  if (length)
  {
    v17 = v16;
    int v18 = v38;
    do
    {
      unsigned int v44 = length;
      v19 = [v40 imageConfigurationAtIndex:v10 inLayout:v41];
      v20 = [v19 imageConfiguration];
      v42 = (void *)[v41 userInterfaceDirection];
      v21 = [v19 imageName];
      char v22 = [v19 isSystemImage];
      v23 = [v19 tintColor];
      v24 = [(PXGTextureProvider *)val viewEnvironment];
      uint64_t v25 = [v24 traitCollection];

      v43 = (void *)v25;
      v26 = [v23 resolvedColorWithTraitCollection:v25];

      id v27 = v39;
      v28 = [v19 bundle];

      if (v28)
      {
        uint64_t v29 = [v19 bundle];

        id v27 = (id)v29;
      }
      objc_initWeak(&location, val);
      v30 = [(PXGTextureProvider *)val requestQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__PXGNamedImageTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DCC338;
      objc_copyWeak(v51, &location);
      id v47 = v21;
      id v48 = v27;
      char v53 = v22;
      id v49 = v26;
      id v50 = v20;
      v51[1] = v42;
      v51[2] = v17;
      int v52 = v18;
      id v31 = v20;
      id v32 = v26;
      id v33 = v27;
      id v34 = v21;
      dispatch_async(v30, block);

      objc_destroyWeak(v51);
      objc_destroyWeak(&location);

      ++v18;
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      unsigned int length = v44 - 1;
    }
    while (v44 != 1);
  }

  NSUInteger v36 = v37;
  NSUInteger v35 = v38;
  result.unsigned int length = v36;
  result.id location = v35;
  return result;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

void __98__PXGNamedImageTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  LODWORD(v2) = *(_DWORD *)(a1 + 88);
  [WeakRetained _requestTextureForImageWithName:*(void *)(a1 + 32) inBundle:*(void *)(a1 + 40) isSystemImage:*(unsigned __int8 *)(a1 + 92) tintColor:*(void *)(a1 + 48) imageConfiguration:*(void *)(a1 + 56) userInterfaceDirection:*(void *)(a1 + 72) screenScale:*(double *)(a1 + 80) requestID:v2];
}

- (void)_requestTextureForImageWithName:(id)a3 inBundle:(id)a4 isSystemImage:(BOOL)a5 tintColor:(id)a6 imageConfiguration:(id)a7 userInterfaceDirection:(unint64_t)a8 screenScale:(double)a9 requestID:(int)a10
{
  BOOL v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  objc_initWeak(location, self);
  id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
  char v22 = [NSNumber numberWithBool:v14];
  v23 = [NSNumber numberWithDouble:a9];
  v24 = objc_msgSend(v21, "initWithObjects:", v17, v22, v23, 0);

  if (v19)
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    if ([v19 getRed:&v49 green:&v48 blue:&v47 alpha:&v46])
    {
      id v25 = [NSString alloc];
      v26 = (void *)[v25 initWithFormat:@"%.2f-%.2f-%.2f-%.2f", v49, v48, v47, v46];
      [v24 addObject:v26];
    }
  }
  if (v20) {
    [v24 addObject:v20];
  }
  id v27 = (void *)[objc_alloc((Class)off_1E5DA9660) initWithObjects:v24];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke;
  v37[3] = &unk_1E5DCC360;
  id v28 = v17;
  id v38 = v28;
  id v29 = v18;
  id v39 = v29;
  BOOL v45 = v14;
  id v30 = v19;
  id v40 = v30;
  id v31 = v20;
  id v41 = v31;
  v44[1] = *(id *)&a9;
  v44[2] = (id)a8;
  objc_copyWeak(v44, location);
  id v32 = v27;
  v44[3] = (id)a2;
  id v42 = v32;
  v43 = self;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke_16;
  v34[3] = &unk_1E5DCC388;
  v35[1] = (id)a8;
  objc_copyWeak(v35, location);
  int v36 = a10;
  [(PXGCGImageTextureProvider *)self requestCGImageAndAdditionalInfoWithCacheKey:v32 imageProvider:v37 resultHandler:v34];
  objc_destroyWeak(v35);

  objc_destroyWeak(v44);
  objc_destroyWeak(location);
}

void __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + 40) == 1)
  {
    v3 = [a3 objectForKeyedSubscript:@"PXGNamedImageTextureProviderImageOrientationKey"];
    [v3 unsignedIntegerValue];
  }
  PXGSpriteTextureInfoOrientationFromCGOrientation();
}

CGImageRef __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v8 = 0;
  uint64_t v2 = PXGCGImageForImageNamedInBundle(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 112), *(void **)(a1 + 48), *(void **)(a1 + 56), &v8);
  CGImageRef v3 = CGImageRetain(v2);
  if (*(void *)(a1 + 96) == 1 && v8 != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v9 = @"PXGNamedImageTextureProviderImageOrientationKey";
    v10[0] = &unk_1F02D9BE0;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [WeakRetained cacheAdditionalInfo:v6 withKey:*(void *)(a1 + 64)];
  }
  if (!v3) {
    PXAssertGetLog();
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end