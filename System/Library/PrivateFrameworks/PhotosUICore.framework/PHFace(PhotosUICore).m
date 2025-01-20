@interface PHFace(PhotosUICore)
+ (id)px_fetchKeyFaceForPerson:()PhotosUICore options:;
- (BOOL)px_isHuman;
- (double)px_cropRectWithCropFactor:()PhotosUICore bounded:;
- (uint64_t)normalizedCropRect;
- (uint64_t)px_cropRectForPortraitImage:()PhotosUICore;
- (uint64_t)px_cropRectWithCropFactor:()PhotosUICore;
- (uint64_t)px_faceTileSizeAdjustingForImageAspectRatio:()PhotosUICore;
- (uint64_t)px_normalizedCenterEyeLine;
@end

@implementation PHFace(PhotosUICore)

- (double)px_cropRectWithCropFactor:()PhotosUICore bounded:
{
  [a1 size];
  double v8 = v7;
  [a1 centerX];
  double v10 = v9;
  [a1 centerY];
  double v12 = v11;
  if (fabs(v8) < 0.00000011920929)
  {
    [a1 bodyWidth];
    double v14 = v13;
    [a1 bodyHeight];
    double v8 = fmin(v14, v15);
    [a1 bodyCenterX];
    double v10 = v16;
    [a1 bodyCenterY];
    double v12 = v17;
  }
  objc_msgSend(a1, "px_faceTileSizeAdjustingForImageAspectRatio:", v8 * a2, v8 * a2);
  CGFloat width = v18;
  CGFloat height = v20;
  double x = v10 - v18 * 0.5;
  double y = 1.0 - v12 - v20 * 0.5;
  if (a4)
  {
    if (x < 0.0)
    {
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGRect v28 = CGRectOffset(v27, -x, 0.0);
      double x = v28.origin.x;
      double y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
    }
    if (y < 0.0)
    {
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGRect v30 = CGRectOffset(v29, 0.0, -y);
      double x = v30.origin.x;
      double y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
    }
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (CGRectGetMaxX(v31) > 1.0)
    {
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      CGFloat v24 = 1.0 - CGRectGetMaxX(v32);
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGRect v34 = CGRectOffset(v33, v24, 0.0);
      double x = v34.origin.x;
      double y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
    }
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    if (CGRectGetMaxY(v35) > 1.0)
    {
      v36.origin.double x = x;
      v36.origin.double y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      CGFloat v25 = 1.0 - CGRectGetMaxY(v36);
      v37.origin.double x = x;
      v37.origin.double y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      *(void *)&double x = (unint64_t)CGRectOffset(v37, 0.0, v25);
    }
  }
  return x;
}

- (uint64_t)px_normalizedCenterEyeLine
{
  [a1 centerX];
  if (v2 == 0.0)
  {
    [a1 bodyWidth];
    double v4 = v3;
    [a1 bodyHeight];
    double v6 = fmin(v4, v5);
    objc_msgSend(a1, "px_faceTileSizeAdjustingForImageAspectRatio:", v6, v6);
    [a1 bodyCenterY];
    return [a1 bodyCenterX];
  }
  else
  {
    [a1 size];
    objc_msgSend(a1, "px_faceTileSizeAdjustingForImageAspectRatio:", v8, v8);
    [a1 centerY];
    return [a1 centerX];
  }
}

- (uint64_t)px_faceTileSizeAdjustingForImageAspectRatio:()PhotosUICore
{
  double v6 = (void *)MEMORY[0x1E4F8CCF0];
  double v7 = (double)[a1 sourceWidth];
  double v8 = (double)[a1 sourceHeight];
  return objc_msgSend(v6, "faceTileSizeAdjustingForImageAspectRatio:imgWidth:imgHeight:", a2, a3, v7, v8);
}

- (uint64_t)px_cropRectWithCropFactor:()PhotosUICore
{
  return objc_msgSend(a1, "px_cropRectWithCropFactor:bounded:", 1);
}

+ (id)px_fetchKeyFaceForPerson:()PhotosUICore options:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [a1 fetchKeyFaceForPerson:v6 options:a4];
  double v8 = v7;
  if (v6 && v7 && ![v7 count])
  {
    double v9 = [v6 photoLibrary];
    int v10 = objc_msgSend(v9, "isReadyForAnalysis_FOR_UI_USE_ONLY");

    double v11 = PLUIGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        double v13 = [v6 localIdentifier];
        int v16 = 138543362;
        double v17 = v13;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Library is ready for analysis; marking person as needing key face: %{public}@",
          (uint8_t *)&v16,
          0xCu);
      }
      [v6 markAsNeedingKeyFace];
    }
    else
    {
      if (v12)
      {
        double v14 = [v6 localIdentifier];
        int v16 = 138543362;
        double v17 = v14;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Library isn't ready for analysis; not marking person as needing key face: %{public}@",
          (uint8_t *)&v16,
          0xCu);
      }
    }
  }

  return v8;
}

- (BOOL)px_isHuman
{
  uint64_t v1 = [a1 detectionType];
  return +[PXPeopleUtilities isDetectionTypeHuman:v1];
}

- (uint64_t)normalizedCropRect
{
  return objc_msgSend(a1, "px_cropRectWithCropFactor:", 2.2);
}

- (uint64_t)px_cropRectForPortraitImage:()PhotosUICore
{
  [a1 centerX];
  if (v5 == 0.0)
  {
    [a1 bodyCenterX];
    double v7 = v6;
    [a1 bodyCenterY];
    double v9 = v8;
    [a1 bodyWidth];
    double v11 = v10;
    [a1 bodyHeight];
    double v13 = fmin(v11, v12);
  }
  else
  {
    [a1 centerX];
    double v7 = v14;
    [a1 centerY];
    double v9 = v15;
    [a1 size];
    double v13 = v16;
  }
  double v17 = (void *)MEMORY[0x1E4F8CCF0];
  double v18 = (double)[a1 sourceWidth];
  double v19 = (double)[a1 sourceHeight];
  return [v17 getCropRectForPortraitImage:a3 size:v13 imgWidth:v18 imgHeight:v19 centerX:v7 centerY:v9];
}

@end