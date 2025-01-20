@interface PXPeopleSocialGroupViewGenerator
+ (id)_faceCropFetchOptionsForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5;
+ (id)generateViewForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5;
+ (id)indexesThatNeedPortraitCropsForNumberOfFaces:(unint64_t)a3;
+ (unint64_t)_numberOfFacesToShowForSocialGroup:(id)a3;
+ (void)_layoutAvatarViews:(id)a3 inFrame:(CGRect)a4;
+ (void)prefetchForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5;
+ (void)resizeThumbnailSizeForSocialGroupView:(id)a3 withSize:(CGSize)a4;
@end

@implementation PXPeopleSocialGroupViewGenerator

+ (void)_layoutAvatarViews:(id)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  a3;
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  CGRectGetWidth(v8);
  [MEMORY[0x1E4FB1BA8] mainScreen];
  [(id)objc_claimAutoreleasedReturnValue() scale];
  PXFloatFloorToPixel();
}

+ (unint64_t)_numberOfFacesToShowForSocialGroup:(id)a3
{
  unint64_t result = [a3 count];
  if (result >= 9) {
    return 9;
  }
  return result;
}

+ (id)_faceCropFetchOptionsForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v10 = +[PXPeopleSocialGroupViewGenerator _numberOfFacesToShowForSocialGroup:v8];
  v11 = +[PXPeopleSocialGroupViewGenerator indexesThatNeedPortraitCropsForNumberOfFaces:v10];
  if (v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 72 * v10 - 72;
    v14 = (char *)&yFactors + v13;
    v15 = (char *)&xFactors + v13;
    do
    {
      double v16 = width * *(double *)&v15[8 * v12];
      double v17 = height * *(double *)&v14[8 * v12];
      v18 = [PXPeopleFaceCropFetchOptions alloc];
      v19 = [v8 objectAtIndexedSubscript:v12];
      v20 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v18, "initWithPerson:targetSize:displayScale:", v19, v16, v17, a5);

      if ([v11 containsIndex:v12]) {
        [(PXPeopleFaceCropFetchOptions *)v20 setCropFactor:3];
      }
      if (v10 != 1) {
        [(PXPeopleFaceCropFetchOptions *)v20 setCornerStyle:0];
      }
      [v9 addObject:v20];

      ++v12;
    }
    while (v10 != v12);
  }

  return v9;
}

+ (id)indexesThatNeedPortraitCropsForNumberOfFaces:(unint64_t)a3
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (a3 > 9) {
    goto LABEL_11;
  }
  v7 = v6;
  if (((1 << a3) & 0x252) != 0) {
    goto LABEL_8;
  }
  if (((1 << a3) & 0xA4) == 0)
  {
    if (((1 << a3) & 0x108) != 0)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
LABEL_11:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"PXPeopleSocialGroupViewGenerator.m" lineNumber:109 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [v6 addIndex:0];
  uint64_t v8 = 1;
LABEL_7:
  [v7 addIndex:v8];
LABEL_8:
  v9 = (void *)[v7 copy];

  return v9;
}

+ (void)resizeThumbnailSizeForSocialGroupView:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [v7 frame];
  double v9 = v8;
  [v7 frame];
  [v7 setFrame:v9];
  id v10 = [v7 subviews];

  objc_msgSend(a1, "_layoutAvatarViews:inFrame:", v10, 0.0, 0.0, width, height);
}

+ (void)prefetchForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = +[PXPeopleSocialGroupViewGenerator _faceCropFetchOptionsForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "_faceCropFetchOptionsForSocialGroup:withSize:displayScale:", a3, a4.width, a4.height, a5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v11 = +[PXPeopleFaceCropManager sharedManager];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __81__PXPeopleSocialGroupViewGenerator_prefetchForSocialGroup_withSize_displayScale___block_invoke;
        v12[3] = &unk_1E5DCBFC0;
        v12[4] = v10;
        [v11 requestFaceCropForOptions:v10 resultHandler:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __81__PXPeopleSocialGroupViewGenerator_prefetchForSocialGroup_withSize_displayScale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:@"PXPeopleErrorKey"];
  if (v4)
  {
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 32) person];
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "PXPeopleSocialGroupViewGenerator: error prefetching face crop: %@ for person: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (id)generateViewForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeopleSocialGroupViewGenerator.m", 33, @"%s must be called on the main thread", "+[PXPeopleSocialGroupViewGenerator generateViewForSocialGroup:withSize:displayScale:]");
  }
  if (height != width) {
    PXAssertGetLog();
  }
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, width, height);
  uint64_t v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v11 setBackgroundColor:v12];

  long long v13 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  v25 = v10;
  +[PXPeopleSocialGroupViewGenerator _faceCropFetchOptionsForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "_faceCropFetchOptionsForSocialGroup:withSize:displayScale:", v10, width, height, a5);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v19 = objc_alloc_init(MEMORY[0x1E4FB1838]);
        [v11 addSubview:v19];
        [v19 setBackgroundColor:v13];
        [v19 setAccessibilityIgnoresInvertColors:1];
        v20 = +[PXPeopleFaceCropManager sharedManager];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __85__PXPeopleSocialGroupViewGenerator_generateViewForSocialGroup_withSize_displayScale___block_invoke;
        v27[3] = &unk_1E5DCBF98;
        id v28 = v19;
        uint64_t v29 = v18;
        id v21 = v19;
        [v20 requestFaceCropForOptions:v18 resultHandler:v27];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }
  v22 = [v11 subviews];
  +[PXPeopleSocialGroupViewGenerator _layoutAvatarViews:inFrame:](PXPeopleSocialGroupViewGenerator, "_layoutAvatarViews:inFrame:", v22, 0.0, 0.0, width, height);

  return v11;
}

void __85__PXPeopleSocialGroupViewGenerator_generateViewForSocialGroup_withSize_displayScale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  a3;
  *(id *)(a1 + 32);
  v5;
  px_dispatch_on_main_queue();
}

void __85__PXPeopleSocialGroupViewGenerator_generateViewForSocialGroup_withSize_displayScale___block_invoke_2(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  [v11 CGRectValue];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 40) layer];
  objc_msgSend(v10, "setContentsRect:", v3, v5, v7, v9);

  [*(id *)(a1 + 40) setImage:*(void *)(a1 + 48)];
}

@end