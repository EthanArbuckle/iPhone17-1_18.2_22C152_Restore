@interface PIPortraitVideoDebugDetectionsRenderNode
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NSCache)labelImageCache;
- (PIPortraitVideoDebugDetectionsRenderNode)initWithInput:(id)a3 assetURL:(id)a4 cinematographyState:(id)a5 monochrome:(BOOL)a6;
- (PTCinematographyScript)cinematographyScript;
- (id)_evaluateImage:(id *)a3;
- (id)_imageByAddingDetection:(id)a3 toImage:(id)a4 isPrimary:(BOOL)a5 canvasSize:(CGSize)a6 inverseOrientation:(int64_t)a7;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (void)setCinematographyScript:(id)a3;
- (void)setLabelImageCache:(id)a3;
- (void)setRenderTime:(id *)a3;
@end

@implementation PIPortraitVideoDebugDetectionsRenderNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelImageCache, 0);
  objc_storeStrong((id *)&self->_cinematographyScript, 0);
}

- (void)setLabelImageCache:(id)a3
{
}

- (NSCache)labelImageCache
{
  return self->_labelImageCache;
}

- (void)setRenderTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_renderTime.value = *(_OWORD *)&a3->var0;
  self->_renderTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)setCinematographyScript:(id)a3
{
}

- (PTCinematographyScript)cinematographyScript
{
  return self->_cinematographyScript;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v48 = NUAssertLogger_16488();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v85 = v49;
      _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v50 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v52 = NUAssertLogger_16488();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v53)
      {
        v56 = dispatch_get_specific(*v50);
        v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        v59 = [v57 callStackSymbols];
        v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v85 = v56;
        __int16 v86 = 2114;
        v87 = v60;
        _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v53)
    {
      v54 = [MEMORY[0x1E4F29060] callStackSymbols];
      v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v85 = v55;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  id v78 = 0;
  v6 = [v5 outputImage:&v78];
  id v7 = v78;
  if (v6)
  {
    v8 = [(NURenderNode *)self settings];
    v9 = [v8 objectForKeyedSubscript:@"monochrome"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F1E080] vectorWithX:0.2125 Y:0.7154 Z:0.0721 W:0.0];
      v82[0] = @"inputRVector";
      v82[1] = @"inputGVector";
      v83[0] = v11;
      v83[1] = v11;
      v82[2] = @"inputBVector";
      v83[2] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
      uint64_t v13 = [v6 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v12];

      v6 = (void *)v13;
    }
    v14 = [(PIPortraitVideoDebugDetectionsRenderNode *)self cinematographyScript];

    if (v14)
    {
      v15 = [(NURenderNode *)self outputImageGeometry:a3];
      if (v15)
      {
        id v63 = v7;
        v64 = v5;
        v62 = v15;
        [v15 orientation];
        uint64_t v16 = NUOrientationInverse();
        [v6 extent];
        double v18 = v17;
        double v20 = v19;
        v21 = [(PIPortraitVideoDebugDetectionsRenderNode *)self cinematographyScript];
        [(PIPortraitVideoDebugDetectionsRenderNode *)self renderTime];
        v22 = [v21 frameNearestTime:v77];

        v23 = [v22 focusDetection];
        v61 = v22;
        v24 = [v22 allDetections];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v73 objects:v81 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v74 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              if ([v29 detectionType] == 100)
              {
                uint64_t v30 = -[PIPortraitVideoDebugDetectionsRenderNode _imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:](self, "_imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:", v29, v6, [v29 trackIdentifier] == objc_msgSend(v23, "trackIdentifier"), v16, v18, v20);

                v6 = (void *)v30;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v73 objects:v81 count:16];
          }
          while (v26);
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v31 = v24;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v80 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v70 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              if ([v36 detectionType] != 100)
              {
                uint64_t v37 = [v36 trackIdentifier];
                if (v37 != [v23 trackIdentifier])
                {
                  uint64_t v38 = -[PIPortraitVideoDebugDetectionsRenderNode _imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:](self, "_imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:", v36, v6, 0, v16, v18, v20);

                  v6 = (void *)v38;
                }
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v69 objects:v80 count:16];
          }
          while (v33);
        }

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v39 = v31;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v79 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v66;
          do
          {
            for (uint64_t k = 0; k != v41; ++k)
            {
              if (*(void *)v66 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v65 + 1) + 8 * k);
              if ([v44 detectionType] != 100)
              {
                uint64_t v45 = [v44 trackIdentifier];
                if (v45 == [v23 trackIdentifier])
                {
                  uint64_t v46 = -[PIPortraitVideoDebugDetectionsRenderNode _imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:](self, "_imageByAddingDetection:toImage:isPrimary:canvasSize:inverseOrientation:", v44, v6, 1, v16, v18, v20);

                  v6 = (void *)v46;
                }
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v79 count:16];
          }
          while (v41);
        }

        id v7 = v63;
        v5 = v64;
      }
      else
      {

        v6 = 0;
      }
    }
  }
  else
  {
    *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Could not get the input image" object:self underlyingError:v7];
  }

  return v6;
}

- (id)_imageByAddingDetection:(id)a3 toImage:(id)a4 isPrimary:(BOOL)a5 canvasSize:(CGSize)a6 inverseOrientation:(int64_t)a7
{
  double height = a6.height;
  double width = a6.width;
  BOOL v10 = a5;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = v13;
  uint64_t v16 = v15;
  if (v10)
  {
    double v17 = (void *)MEMORY[0x1E4F1E008];
    double v18 = 0.0;
    double v19 = 1.0;
    double v20 = 0.0;
  }
  else if ([v15 detectionType] == 100)
  {
    double v17 = (void *)MEMORY[0x1E4F1E008];
    double v18 = 0.5;
    double v19 = 0.5;
    double v20 = 0.5;
  }
  else
  {
    [v16 groupIdentifier];
    char v21 = PTGroupIDIsValid();
    double v17 = (void *)MEMORY[0x1E4F1E008];
    if (v21)
    {
      long long v70 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:0.584313725 blue:0.0];
      *(void *)&long long v74 = v70;
      long long v69 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:0.8 blue:0.0];
      *((void *)&v74 + 1) = v69;
      v22 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:0.176470588 blue:0.333333333];
      *(void *)&long long v75 = v22;
      v23 = [MEMORY[0x1E4F1E008] colorWithRed:0.68627451 green:0.321568627 blue:0.870588235];
      *((void *)&v75 + 1) = v23;
      v24 = [MEMORY[0x1E4F1E008] colorWithRed:0.352941176 green:0.784313725 blue:0.980392157];
      *(void *)&long long v76 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1E008] colorWithRed:0.345098039 green:0.337254902 blue:0.839215686];
      *((void *)&v76 + 1) = v25;
      uint64_t v26 = [MEMORY[0x1E4F1E008] colorWithRed:0.635294118 green:0.517647059 blue:0.368627451];
      v77 = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:7];

      v28 = objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v16, "groupIdentifier") % (unint64_t)objc_msgSend(v27, "count"));

      goto LABEL_9;
    }
    double v18 = 1.0;
    double v19 = 0.0;
    double v20 = 1.0;
  }
  v28 = [v17 colorWithRed:v18 green:v19 blue:v20];
LABEL_9:

  [v16 rect];
  double v32 = width * v31;
  double v33 = height * (1.0 - v29 - v30);
  double v35 = width * v34;
  double v36 = height * v30;
  uint64_t v37 = +[PICoreImageUtilities framedRectImageWithCGRect:color:borderWidth:](PICoreImageUtilities, "framedRectImageWithCGRect:color:borderWidth:", v28, v32, v33, v35, v36, 4.0);
  uint64_t v38 = [v37 imageByCompositingOverImage:v14];

  id v39 = [(PIPortraitVideoDebugDetectionsRenderNode *)self labelImageCache];
  id v40 = v16;
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "trackIdentifier"));
  *(void *)&long long v74 = v41;
  uint64_t v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "groupIdentifier"));
  *((void *)&v74 + 1) = v42;
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "detectionType"));
  *(void *)&long long v75 = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:3];

  uint64_t v45 = [v39 objectForKey:v44];
  if (!v45)
  {
    uint64_t v46 = [v40 detectionType];
    v47 = @"Face";
    switch(v46)
    {
      case 1:
        break;
      case 2:
        v47 = @"Head";
        break;
      case 3:
        v47 = @"Torso";
        break;
      case 4:
        v47 = @"Cat Body";
        break;
      case 5:
        v47 = @"Dog Body";
        break;
      case 6:
      case 7:
      case 8:
        goto LABEL_14;
      case 9:
        v47 = @"Cat Head";
        break;
      case 10:
        v47 = @"Dog Head";
        break;
      case 11:
        v47 = @"Sports Ball";
        break;
      default:
        if (v46 == 100) {
          v47 = @"AutoFocus";
        }
        else {
LABEL_14:
        }
          v47 = @"Unknown";
        break;
    }
    [v40 trackIdentifier];
    if (PTTrackIDIsValid() && [v40 detectionType] != 100)
    {
      v48 = NSString;
      v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "trackIdentifier"));
      v47 = [v48 stringWithFormat:@"%@ %@", v47, v49];
    }
    [v40 groupIdentifier];
    if (PTGroupIDIsValid())
    {
      v50 = NSString;
      v51 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "groupIdentifier"));
      uint64_t v52 = [v50 stringWithFormat:@"%@ G:%@", v47, v51];

      v47 = (__CFString *)v52;
    }
    BOOL v53 = [MEMORY[0x1E4F1E040] textImageGeneratorFilter];
    [v53 setText:v47];
    [v53 setFontName:@"Helvetica"];
    LODWORD(v54) = 1109393408;
    [v53 setFontSize:v54];
    uint64_t v45 = [v53 outputImage];
    [v39 setObject:v45 forKey:v44];
  }
  v55 = [MEMORY[0x1E4F1E040] roundedRectangleGeneratorFilter];
  [v45 extent];
  double v57 = v56 + 4.0;
  [v45 extent];
  objc_msgSend(v55, "setExtent:", 0.0, 0.0, v57, v58 + 4.0);
  [v55 setColor:v28];
  [v55 setRadius:0.0];
  CGAffineTransformMakeTranslation(&v73, 2.0, 2.0);
  v59 = [v45 imageByApplyingTransform:&v73];

  v60 = [v55 outputImage];
  v61 = [v59 imageByCompositingOverImage:v60];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  [v61 extent];
  NUPixelSizeFromCGSize();
  NUOrientationMakeTransformWithSize();
  v72[0] = v74;
  v72[1] = v75;
  v72[2] = v76;
  v62 = [v61 imageByApplyingTransform:v72];

  switch(a7)
  {
    case 3:
      [v62 extent];
      double v32 = v32 + v35 - v64;
      goto LABEL_32;
    case 6:
LABEL_32:
      [v62 extent];
      double v33 = v33 + v36 - v65;
      break;
    case 8:
      [v62 extent];
      double v32 = v32 + v35 - v63;
      break;
  }
  CGAffineTransformMakeTranslation(&v71, v32, v33);
  long long v66 = [v62 imageByApplyingTransform:&v71];

  long long v67 = [v66 imageByCompositingOverImage:v38];

  return v67;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    double v36 = NUAssertLogger_16488();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v38 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v40 = NUAssertLogger_16488();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific(*v38);
        uint64_t v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v48;
        _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v43;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  id v13 = v12;
  v56.receiver = self;
  v56.super_class = (Class)PIPortraitVideoDebugDetectionsRenderNode;
  id v14 = [(NURenderNode *)&v56 resolvedNodeWithCachedInputs:v10 settings:v11 pipelineState:v12 error:a6];
  if (([v13 evaluationMode] & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    id v15 = [(PIPortraitVideoDebugDetectionsRenderNode *)self cinematographyScript];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      v22 = (void *)MEMORY[0x1E4F166C8];
      v23 = [v11 objectForKeyedSubscript:@"assetURL"];
      v24 = [v22 assetWithURL:v23];

      uint64_t v25 = dispatch_group_create();
      dispatch_group_enter(v25);
      id v26 = objc_alloc_init(MEMORY[0x1E4F921F8]);
      [(PIPortraitVideoDebugDetectionsRenderNode *)self setCinematographyScript:v26];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      double v58 = __Block_byref_object_copy__16579;
      v59 = __Block_byref_object_dispose__16580;
      id v60 = 0;
      uint64_t v27 = [v11 objectForKeyedSubscript:@"cinematographyState"];
      if (![v27 count])
      {

        uint64_t v27 = 0;
      }
      v28 = [(PIPortraitVideoDebugDetectionsRenderNode *)self cinematographyScript];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __102__PIPortraitVideoDebugDetectionsRenderNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke;
      v53[3] = &unk_1E5D805B8;
      v55 = buf;
      double v29 = v25;
      double v54 = v29;
      id v30 = (id)[v28 loadWithAsset:v24 changesDictionary:v27 completion:v53];

      dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      double v31 = *(void **)(*(void *)&buf[8] + 40);
      if (v31)
      {
        *a6 = v31;

        _Block_object_dispose(buf, 8);
        id v32 = 0;
        goto LABEL_15;
      }

      _Block_object_dispose(buf, 8);
    }
    double v17 = [(PIPortraitVideoDebugDetectionsRenderNode *)self labelImageCache];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      [(PIPortraitVideoDebugDetectionsRenderNode *)self setLabelImageCache:v19];

      double v20 = [NSString stringWithFormat:@"%@-labelImageCache", objc_opt_class()];
      char v21 = [(PIPortraitVideoDebugDetectionsRenderNode *)self labelImageCache];
      [v21 setName:v20];
    }
    if (v13)
    {
      [v13 time];
    }
    else
    {
      long long v51 = 0uLL;
      uint64_t v52 = 0;
    }
    long long v49 = v51;
    uint64_t v50 = v52;
    [v14 setRenderTime:&v49];
    double v33 = [(PIPortraitVideoDebugDetectionsRenderNode *)self cinematographyScript];
    [v14 setCinematographyScript:v33];

    double v34 = [(PIPortraitVideoDebugDetectionsRenderNode *)self labelImageCache];
    [v14 setLabelImageCache:v34];
  }
  id v32 = v14;
LABEL_15:

  return v32;
}

void __102__PIPortraitVideoDebugDetectionsRenderNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v3 = a3;
  [v3 scale];
  NUScaleToDouble();
  if (v4 >= 0.15)
  {
    unint64_t v6 = [v3 evaluationMode];
    if (v6 <= 3) {
      unsigned int v5 = (0xBu >> (v6 & 0xF)) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (PIPortraitVideoDebugDetectionsRenderNode)initWithInput:(id)a3 assetURL:(id)a4 cinematographyState:(id)a5 monochrome:(BOOL)a6
{
  BOOL v6 = a6;
  v24[3] = *MEMORY[0x1E4F143B8];
  id v10 = (id)MEMORY[0x1E4F1CC08];
  if (a5) {
    id v10 = a5;
  }
  v24[0] = v10;
  v23[0] = @"cinematographyState";
  v23[1] = @"monochrome";
  id v11 = NSNumber;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v11 numberWithBool:v6];
  v23[2] = @"assetURL";
  v24[1] = v15;
  v24[2] = v13;
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  uint64_t v21 = *MEMORY[0x1E4F1E480];
  id v22 = v14;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v20.receiver = self;
  v20.super_class = (Class)PIPortraitVideoDebugDetectionsRenderNode;
  BOOL v18 = [(NURenderNode *)&v20 initWithSettings:v16 inputs:v17];

  return v18;
}

@end