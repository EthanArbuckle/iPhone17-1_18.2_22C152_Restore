@interface PIParallaxLuminanceCalculator
- (id)_imageToAnalyzeForLayerStack:(id)a3 error:(id *)a4;
- (id)calculateClockLuminanceValuesForLayerStack:(id)a3 style:(id)a4 renderer:(id)a5 error:(id *)a6;
- (id)calculateLuminanceValuesForImage:(id)a3 renderer:(id)a4 error:(id *)a5;
@end

@implementation PIParallaxLuminanceCalculator

- (id)calculateClockLuminanceValuesForLayerStack:(id)a3 style:(id)a4 renderer:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 layout];
  [v13 normalizedVisibleFrame];
  if (CGRectGetMaxY(v29) <= 1.0)
  {

    goto LABEL_6;
  }
  v14 = [v10 layout];
  int v15 = [v14 canApplyHeadroom];

  if (!v15) {
    goto LABEL_6;
  }
  if (![v11 hasHeadroomLook])
  {
    if ([v11 hasTonalityMode])
    {
      BOOL v16 = [v11 tonality] == 3;
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v17 = [(PIParallaxLuminanceCalculator *)self _imageToAnalyzeForLayerStack:v10 error:a6];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x80000];
      [v18 extent];
      uint64_t v20 = NUPixelSizeFromCGSize();
      objc_msgSend(v19, "scaleForImageSize:", v20, v21);
      NUScaleToDouble();
      CGAffineTransformMakeScale(&v27, v22, v22);
      v23 = [v18 imageByApplyingTransform:&v27];

      v24 = [(PIParallaxLuminanceCalculator *)self calculateLuminanceValuesForImage:v23 renderer:v12 error:a6];
    }
    else
    {
      v24 = 0;
    }
    goto LABEL_14;
  }
  BOOL v16 = [v11 headroomLook] == 2;
LABEL_11:
  double v25 = 0.0;
  if (v16) {
    double v25 = 1.0;
  }
  v24 = [NSNumber numberWithDouble:v25];
LABEL_14:

  return v24;
}

- (id)_imageToAnalyzeForLayerStack:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 layout];
  v7 = [v6 clockLayerOrder];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F8D098]];

  int v9 = [v5 hasMainLayers];
  if (v9) {
    [v5 backgroundLayer];
  }
  else {
  id v10 = [v5 backgroundBackfillLayer];
  }
  if (v10)
  {
    id v11 = +[PISegmentationHelper imageFromImageLayer:v10];
    if (v9) {
      [v5 foregroundLayer];
    }
    else {
    v13 = [v5 foregroundBackfillLayer];
    }
    if (v13) {
      int v14 = v8;
    }
    else {
      int v14 = 0;
    }
    if (v14 == 1)
    {
      int v15 = +[PISegmentationHelper imageFromImageLayer:v13];
      uint64_t v16 = [v15 imageByCompositingOverImage:v11];

      id v11 = (id)v16;
    }
    [v6 parallaxVisibleFrame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [v6 parallaxInactiveFrame];
    v75.origin.x = v25;
    v75.origin.y = v26;
    v75.size.width = v27;
    v75.size.height = v28;
    v71.origin.x = v18;
    v71.origin.y = v20;
    v71.size.width = v22;
    v71.size.height = v24;
    CGRectUnion(v71, v75);
    [v6 timeFrame];
    if (!v9)
    {
      [v6 extendedImageExtent];
      NURectNormalize();
      NURectDenormalize();
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      [v6 extendedImageSize];
      double v38 = v37;
      [v6 imageSize];
      double v40 = v38 - v39;
      [v6 extendedImageSize];
      double v42 = v41;
      [v6 imageSize];
      double v44 = v42 - v43;
      [v6 parallaxPadding];
      CGFloat v46 = -(v44 - v45);
      v72.origin.x = v30;
      v72.origin.y = v32;
      v72.size.width = v34;
      v72.size.height = v36;
      CGRectOffset(v72, -v40, v46);
    }
    NURectNormalize();
    [v11 extent];
    NURectDenormalize();
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    [v11 extent];
    double v58 = v50 + v54;
    double v60 = v55 + v59;
    if (v48 + v52 >= v60) {
      double v61 = v60;
    }
    else {
      double v61 = v48 + v52;
    }
    if (v55 >= v61) {
      double v61 = v55;
    }
    double v62 = v56 + v57;
    if (v58 >= v62) {
      double v63 = v62;
    }
    else {
      double v63 = v50 + v54;
    }
    if (v56 >= v63) {
      double v63 = v56;
    }
    double v64 = v50 + v63 - v58;
    if (v48 + v61 - (v48 + v52) < v60) {
      double v60 = v48 + v61 - (v48 + v52);
    }
    if (v55 >= v60) {
      double v65 = v55;
    }
    else {
      double v65 = v60;
    }
    if (v64 >= v62) {
      double v66 = v62;
    }
    else {
      double v66 = v64;
    }
    if (v56 >= v66) {
      double v67 = v56;
    }
    else {
      double v67 = v66;
    }
    v73.origin.x = v65;
    v73.origin.y = v67;
    v73.size.width = v52;
    v73.size.height = v54;
    if (CGRectIsEmpty(v73))
    {
      [MEMORY[0x1E4F7A438] invalidError:@"clockArea is empty after mapping to image extent" object:v11];
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v68 = objc_msgSend(v11, "imageByCroppingToRect:", v65, v67, v52, v54);

      [v68 extent];
      if (CGRectIsEmpty(v74))
      {
        [MEMORY[0x1E4F7A438] invalidError:@"image extent is empty after cropping to text area" object:v68];
        id v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v68;
      }
      else
      {
        id v11 = v68;
        id v12 = v11;
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] missingError:@"layer stack has no background layer" object:v5];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)calculateLuminanceValuesForImage:(id)a3 renderer:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F7A5D8] BGRA8];
  int v9 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  long long v64 = 0u;
  long long v63 = 0u;
  [v6 extent];
  NUPixelRectFromCGRect();
  id v10 = [MEMORY[0x1E4F7A448] sharedFactory];
  id v11 = [v10 surfaceStoragePool];

  id v12 = objc_msgSend(v11, "newStorageWithSize:format:", 0, 0, v8);
  uint64_t v57 = 0;
  double v58 = &v57;
  uint64_t v59 = 0x3032000000;
  double v60 = __Block_byref_object_copy__13883;
  double v61 = __Block_byref_object_dispose__13884;
  id v62 = 0;
  uint64_t v51 = 0;
  double v52 = &v51;
  uint64_t v53 = 0x3032000000;
  double v54 = __Block_byref_object_copy__13883;
  double v55 = __Block_byref_object_dispose__13884;
  id v56 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke;
  v43[3] = &unk_1E5D801C8;
  id v13 = v9;
  id v44 = v13;
  double v47 = &v51;
  id v14 = v7;
  id v45 = v14;
  id v15 = v6;
  long long v49 = v63;
  long long v50 = v64;
  id v46 = v15;
  double v48 = &v57;
  [v12 useAsCIRenderDestinationWithRenderer:v14 block:v43];
  uint64_t v16 = (void *)v52[5];
  double v17 = (id *)(v58 + 5);
  if (v16)
  {
    id obj = (id)v58[5];
    CGFloat v18 = [v16 waitUntilCompletedAndReturnError:&obj];
    objc_storeStrong(v17, obj);

    if (v18)
    {
      uint64_t v36 = 0;
      double v37 = &v36;
      uint64_t v38 = 0x3032000000;
      double v39 = __Block_byref_object_copy__13883;
      double v40 = __Block_byref_object_dispose__13884;
      id v41 = 0;
      id v19 = objc_alloc_init(MEMORY[0x1E4F7A4A8]);
      v34[0] = 0;
      v34[1] = 0;
      long long v35 = 0u;
      CGFloat v20 = [MEMORY[0x1E4F7A5F8] regionWithRect:v34];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke_2;
      v30[3] = &unk_1E5D801F0;
      CGFloat v32 = &v36;
      id v21 = v19;
      id v31 = v21;
      double v33 = &v57;
      [v12 readBufferInRegion:v20 block:v30];

      CGFloat v22 = (void *)v37[5];
      if (v22)
      {
        double v23 = [v22 luminance];
        [v23 median];
        double v25 = v24;

        CGFloat v26 = [NSNumber numberWithDouble:v25];
      }
      else
      {
        CGFloat v26 = 0;
        *a5 = (id) v58[5];
      }

      _Block_object_dispose(&v36, 8);
      goto LABEL_10;
    }
    CGFloat v27 = (void *)v58[5];
  }
  else
  {
    CGFloat v27 = (void *)v58[5];
  }
  CGFloat v26 = 0;
  *a5 = v27;
LABEL_10:

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v26;
}

BOOL __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  [v4 setClamped:1];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  long long v8 = *(_OWORD *)(a1 + 88);
  v13[0] = *(_OWORD *)(a1 + 72);
  v13[1] = v8;
  uint64_t v9 = objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v6, v13, v4, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), &obj);

  objc_storeStrong(v7, obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

void __81__PIParallaxLuminanceCalculator_calculateLuminanceValuesForImage_renderer_error___block_invoke_2(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  id v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v3 computeHistogramFromBuffer:a2 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end