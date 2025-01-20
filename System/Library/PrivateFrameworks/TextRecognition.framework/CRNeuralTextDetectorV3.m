@interface CRNeuralTextDetectorV3
+ (BOOL)computeClassCount:(void *)a3 classProbabiity:(void *)a4 fromSingleTextFeature:(id)a5 map:(const void *)a6 backgroundClass:(int)a7;
+ (CGSize)scaledImageSizeForConfiguration:(id)a3 imageSize:(CGSize)a4;
+ (double)scaledImageSizeForMaxSize:(double)a3 minSize:(double)a4 inputLengthLimit:(double)a5 imageSize:(double)a6 scale:(double)a7;
+ (float64x2_t)calculateTargetOutputSize:(double)a3 adjustedInputScale:(double)a4 paddedSize:(double)a5 imageSize:(double)a6 maximumSize:(double)a7 minimumSize:(uint64_t)a8 inputLengthLimit:(float64x2_t *)a9;
+ (id)supportedTextType;
+ (uint64_t)numSupportedTextType;
+ (void)computeOrientationFromSingleTextFeature:(uint64_t)a3 map:;
+ (void)computeScriptCategoryFromSingleTextFeature:(uint64_t *)a3 map:(void *)a4 scriptRatioThresholds:;
+ (void)computeTextTypeFromSingleTextFeature:(uint64_t)a3 map:;
+ (void)createImageMap:(void *)a3 targetSize:;
+ (void)createMultiChannelImageMaps:(CGFloat)a3 size:(uint64_t)a4 channels:(void *)a5;
- (BOOL)preheatWithError:(id *)a3;
- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4;
- (CRNeuralTextDetectorV3)init;
- (CRNeuralTextDetectorV3)initWithConfiguration:(id)a3 error:(id *)a4;
- (CRTextDetectorModelV3CoreML)model;
- (id)detectInImage:(id)a3 error:(id *)a4;
- (id)detectInImage:(id)a3 trackingSession:(id)a4 error:(id *)a5;
- (id)enumerateTilesForImage:(id)a3 cachedSurface:(__IOSurface *)a4 guidedByScoreMapFullTile:(void *)a5 block:(id)a6;
- (id)processFineScaleMaps:(uint64_t *)a3 adjustedSize:(CRIntermediateDetectorResult *)a4 fullTileMaps:(int64x2_t *)a5 adjustedFullTileSize:(void *)a6 targetSize:(void *)a7 targetSizeFullTile:(double)a8 intermediateResults:(double)a9 withScaleIds:(double)a10 sourceImageSize:(double)a11 tileRects:(float64_t)a12 trackingSession:(float64_t)a13;
- (void)addIntermediateResults:(uint64_t)a3 idxLog:(void *)a4 adjustedSize:(uint64_t)a5 quadFeatures:(uint64_t)a6 nmsOutputScale:(uint64_t)a7;
- (void)computeClassificationType:(void *)a3 fromTextFeatures:(uint64_t *)a4 fineScaleMap:(uint64_t *)a5 fullTileMap:(void *)a6 withScaleIds:;
- (void)getBorderPoints:(double *)a1 sourceImageSize:(double *)a2 outP1:(unsigned __int8 *)a3 outP2:(uint64_t)a4 isHorizontal:(char)a5;
- (void)getBorderPoints:(float64x2_t *)a3 sourceImageSize:(unsigned __int8)a4 outP1:(float64_t)a5 outP2:(float64_t)a6 isHorizontal:;
- (void)runFullTileInferenceOnImage:(id)a3 cachedSurface:(__IOSurface *)a4 outputMaps:(void *)a5 inputSize:(CGSize *)a6 outputSize:(CGSize *)a7 modelContext:(id)a8 error:(id *)a9;
- (void)runNMSForDirection:(uint64_t *)a3 adjustedSize:(void *)a4 fullTileMaps:(void *)a5 adjustedFullTileSize:(void *)a6 targetSize:(int)a7 targetSizeFullTile:(id *)a8 intermediateResults:(uint64_t *)a9 withScaleIds:(unsigned __int8)a10 sourceImageSize:(unsigned __int8)a11 tileRects:isHorizontal:resultTextFeatures:quadFeatures:isFineScaleVerticalLinkActive:isFullTileVerticalLinkActive:idxLog:;
- (void)setModel:(id)a3;
- (void)updateNMS:(uint64_t)a3 andQuadFeatures:(uint64_t *)a4 inMaps:(void *)a5 tileRects:(uint64_t)a6 intermediateResult:(int)a7 isFullTile:(float)a8 isHorizontal:adjustedSize:randomPrefix:;
@end

@implementation CRNeuralTextDetectorV3

+ (void)computeScriptCategoryFromSingleTextFeature:(uint64_t *)a3 map:(void *)a4 scriptRatioThresholds:
{
  v120[16] = *MEMORY[0x1E4F143B8];
  id v99 = a2;
  id v5 = a4;
  self;
  v6 = +[CRScriptCategoryV1 supportedCategories];
  int v7 = [v6 count];

  v120[0] = 0;
  std::vector<double>::vector(v114, v7, v120);
  v120[0] = 0;
  std::vector<long>::vector(&v112, v7, v120);
  [(id)objc_opt_class() computeClassCount:&v112 classProbabiity:v114 fromSingleTextFeature:v99 map:a3 backgroundClass:0];
  id v100 = v5;
  id v97 = v5;
  self;
  v8 = v112;
  if (v112 == v113)
  {
    v10 = v112;
  }
  else
  {
    v9 = (char *)v112 + 8;
    v10 = v112;
    if ((char *)v112 + 8 != v113)
    {
      uint64_t v11 = *(void *)v112;
      v10 = v112;
      v12 = (char *)v112 + 8;
      do
      {
        uint64_t v14 = *(void *)v12;
        v12 += 8;
        uint64_t v13 = v14;
        BOOL v15 = v11 < v14;
        if (v11 <= v14) {
          uint64_t v11 = v13;
        }
        if (v15) {
          v10 = v9;
        }
        v9 = v12;
      }
      while (v12 != v113);
    }
  }
  v16 = +[CRScriptCategoryV1 supportedCategories];
  uint64_t v101 = (v10 - v8) >> 3;
  v17 = objc_msgSend(v16, "objectAtIndexedSubscript:");

  v18 = +[CRScriptCategoryV1 supportedCategories];
  v19 = +[CRScriptCategoryV1 latinCyrillic]();
  id obj = (id)[v18 indexOfObject:v19];

  v20 = +[CRScriptCategoryV1 supportedCategories];
  v21 = +[CRScriptCategoryV1 chinese]();
  uint64_t v22 = [v20 indexOfObject:v21];

  v23 = +[CRScriptCategoryV1 supportedCategories];
  v24 = +[CRScriptCategoryV1 common]();
  uint64_t v25 = [v23 indexOfObject:v24];

  v26 = +[CRScriptCategoryV1 supportedCategories];
  v27 = +[CRScriptCategoryV1 korean]();
  uint64_t v28 = [v26 indexOfObject:v27];

  v29 = +[CRScriptCategoryV1 supportedCategories];
  v30 = +[CRScriptCategoryV1 japanese]();
  uint64_t v31 = [v29 indexOfObject:v30];

  v32 = +[CRScriptCategoryV1 supportedCategories];
  v33 = +[CRScriptCategoryV1 thai]();
  uint64_t v34 = [v32 indexOfObject:v33];

  v35 = +[CRScriptCategoryV1 supportedCategories];
  v36 = +[CRScriptCategoryV1 arabic]();
  uint64_t v37 = [v35 indexOfObject:v36];

  if (*((void *)v112 + v28) <= *((void *)v112 + v22)) {
    uint64_t v38 = v22;
  }
  else {
    uint64_t v38 = v28;
  }
  if (*((void *)v112 + v38) <= *((void *)v112 + v31)) {
    uint64_t v38 = v31;
  }
  if (*((void *)v112 + v38) <= *((void *)v112 + v34)) {
    uint64_t v38 = v34;
  }
  if (*((void *)v112 + v38) <= *((void *)v112 + v37)) {
    uint64_t v39 = v37;
  }
  else {
    uint64_t v39 = v38;
  }
  v40 = +[CRScriptCategoryV1 unknown]();
  BOOL v41 = v17 == v40;

  if (!v41)
  {
    uint64_t v42 = *((void *)v112 + v25) + *((void *)v112 + (void)obj);
    if (v42 < 1
      || ([v100 objectForKeyedSubscript:@"CRScriptThresholdPreferredLatinCJK"],
          v43 = objc_claimAutoreleasedReturnValue(),
          [v43 floatValue],
          BOOL v45 = (float)(v44 * (float)*((uint64_t *)v112 + v39)) < (float)v42,
          v43,
          uint64_t v101 = (uint64_t)obj,
          !v45))
    {
      v46 = +[CRScriptCategoryV1 japanese]();
      if (v17 == v46)
      {

        uint64_t v101 = v31;
        goto LABEL_53;
      }
      uint64_t v47 = *((void *)v112 + v31);
      if (v47 < 1)
      {
      }
      else
      {
        BOOL v48 = *((void *)v112 + v39) == v47;

        uint64_t v101 = v31;
        if (v48) {
          goto LABEL_53;
        }
      }
      v49 = +[CRScriptCategoryV1 korean]();
      if (v17 == v49)
      {

        uint64_t v101 = v28;
        goto LABEL_53;
      }
      uint64_t v50 = *((void *)v112 + v28);
      if (v50 < 1)
      {
      }
      else
      {
        BOOL v51 = *((void *)v112 + v39) == v50;

        uint64_t v101 = v28;
        if (v51) {
          goto LABEL_53;
        }
      }
      v52 = +[CRScriptCategoryV1 chinese]();
      if (v17 == v52)
      {

        uint64_t v101 = v22;
        goto LABEL_53;
      }
      uint64_t v53 = *((void *)v112 + v22);
      if (v53 < 1)
      {
      }
      else
      {
        BOOL v54 = *((void *)v112 + v39) == v53;

        uint64_t v101 = v22;
        if (v54) {
          goto LABEL_53;
        }
      }
      v55 = +[CRScriptCategoryV1 thai]();
      if (v17 == v55)
      {

        uint64_t v101 = v34;
        goto LABEL_53;
      }
      uint64_t v56 = *((void *)v112 + v34);
      if (v56 < 1)
      {
      }
      else
      {
        BOOL v57 = *((void *)v112 + v39) == v56;

        uint64_t v101 = v34;
        if (v57) {
          goto LABEL_53;
        }
      }
      v58 = +[CRScriptCategoryV1 arabic]();
      if (v17 == v58)
      {

        uint64_t v101 = v37;
      }
      else
      {
        BOOL v59 = *((void *)v112 + v37) > 0;

        uint64_t v60 = (uint64_t)obj;
        if (v59) {
          uint64_t v60 = v37;
        }
        uint64_t v101 = v60;
      }
    }
  }
LABEL_53:

  __p = 0;
  v110 = 0;
  uint64_t v111 = 0;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(&__p, v112, (uint64_t)v113, (v113 - (unsigned char *)v112) >> 3);
  id v102 = v99;
  self;
  v61 = [MEMORY[0x1E4F1CA48] array];
  v62 = objc_opt_new();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v63 = +[CRScriptCategoryV1 supportedCategories];
  id obja = v63;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v115 objects:v120 count:16];
  if (v64)
  {
    LODWORD(v65) = 0;
    uint64_t v66 = *(void *)v116;
    do
    {
      uint64_t v67 = 0;
      uint64_t v65 = (int)v65;
      do
      {
        if (*(void *)v116 != v66) {
          objc_enumerationMutation(obja);
        }
        uint64_t v68 = *(void *)(*((void *)&v115 + 1) + 8 * v67);
        v69 = [CRScriptCategoryResult alloc];
        double v70 = *((double *)v114[0] + v65);
        *(float *)&double v70 = v70;
        v71 = [(CRScriptCategoryResult *)v69 initWithScriptCategory:v68 probability:v70];
        [v61 addObject:v71];

        v72 = [NSNumber numberWithLong:*((void *)__p + v65)];
        [v62 setObject:v72 forKeyedSubscript:v68];

        ++v65;
        ++v67;
      }
      while (v64 != v67);
      v63 = obja;
      uint64_t v64 = [obja countByEnumeratingWithState:&v115 objects:v120 count:16];
    }
    while (v64);
  }

  [v102 setScriptCategoryResults:v61];
  v73 = +[CRScriptCategoryV1 supportedCategories];
  v74 = [v73 objectAtIndexedSubscript:v101];
  [v102 setSelectedScriptCategory:v74];

  [v102 setScriptCounts:v62];
  if (__p)
  {
    v110 = __p;
    operator delete(__p);
  }
  uint64_t v75 = **a3;
  unint64_t v77 = *(void *)(v75 + 8);
  unint64_t v76 = *(void *)(v75 + 16);
  id v78 = v102;
  self;
  v79 = +[CRScriptCategoryV1 supportedCategories];
  v80 = +[CRScriptCategoryV1 common]();
  uint64_t v81 = [v79 indexOfObject:v80];

  v82 = [v78 selectedScriptCategory];
  v83 = +[CRScriptCategoryV1 common]();
  if ([v82 isEqual:v83]) {
    double v84 = *((double *)v114[0] + v81);
  }
  else {
    double v84 = *((double *)v114[0] + v101) + *((double *)v114[0] + v81);
  }

  objc_msgSend(v78, "sizeForImageSize:", (double)v76, (double)v77);
  float v87 = v84;
  if (v87 <= 0.79)
  {
    if (fmin(v86, v85) / fmax(v86, v85) < 0.150000006 || v87 < 0.79) {
      goto LABEL_71;
    }
LABEL_70:
    uint64_t v88 = 0;
    goto LABEL_72;
  }
  if (v87 >= 0.79) {
    goto LABEL_70;
  }
LABEL_71:
  uint64_t v88 = 1;
LABEL_72:
  [v78 setUseSequenceScriptLocale:v88];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v89 = [v78 subFeatures];
  uint64_t v90 = [v89 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v106 != v91) {
          objc_enumerationMutation(v89);
        }
        v93 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v94 = [v78 scriptCategoryResults];
        [v93 setScriptCategoryResults:v94];

        v95 = [v78 selectedScriptCategory];
        [v93 setSelectedScriptCategory:v95];

        v96 = [v78 scriptCounts];
        [v93 setScriptCounts:v96];

        objc_msgSend(v93, "setUseSequenceScriptLocale:", objc_msgSend(v78, "useSequenceScriptLocale"));
      }
      uint64_t v90 = [v89 countByEnumeratingWithState:&v105 objects:v119 count:16];
    }
    while (v90);
  }

  if (v112)
  {
    v113 = v112;
    operator delete(v112);
  }
  if (v114[0])
  {
    v114[1] = v114[0];
    operator delete(v114[0]);
  }
}

+ (uint64_t)numSupportedTextType
{
  self;
  v0 = +[CRNeuralTextDetectorV3 supportedTextType]();
  uint64_t v1 = [v0 count];

  return v1;
}

+ (id)supportedTextType
{
  self;
  if (_MergedGlobals_34 != -1) {
    dispatch_once(&_MergedGlobals_34, &__block_literal_global_35);
  }
  v0 = (void *)qword_1EB58CE08;
  return v0;
}

void __63__CRNeuralTextDetectorV3_CRDetectorTextType__supportedTextType__block_invoke()
{
  v0 = (void *)qword_1EB58CE08;
  qword_1EB58CE08 = (uint64_t)&unk_1F3935CE0;
}

+ (void)computeTextTypeFromSingleTextFeature:(uint64_t)a3 map:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  objc_opt_class();
  unint64_t v5 = (int)+[CRNeuralTextDetectorV3 numSupportedTextType]();
  __p = 0;
  std::vector<double>::vector(&v36, v5, &__p);
  uint64_t v33 = 0;
  std::vector<long>::vector(&__p, v5, &v33);
  char v6 = [(id)objc_opt_class() computeClassCount:&__p classProbabiity:&v36 fromSingleTextFeature:v4 map:a3 backgroundClass:0];
  int v7 = (char *)__p;
  if (v6)
  {
    if (__p == v35)
    {
      v9 = __p;
    }
    else
    {
      v8 = (char *)__p + 8;
      v9 = __p;
      if ((char *)__p + 8 != v35)
      {
        uint64_t v10 = *(void *)__p;
        v9 = __p;
        uint64_t v11 = (char *)__p + 8;
        do
        {
          uint64_t v13 = *(void *)v11;
          v11 += 8;
          uint64_t v12 = v13;
          BOOL v14 = v10 < v13;
          if (v10 <= v13) {
            uint64_t v10 = v12;
          }
          if (v14) {
            v9 = v8;
          }
          v8 = v11;
        }
        while (v11 != v35);
      }
    }
    BOOL v15 = (double *)v36;
    v16 = (double *)((char *)v36 + 8);
    if (v36 != v37 && v16 != (double *)v37)
    {
      double v18 = *(double *)v36;
      v19 = (double *)((char *)v36 + 8);
      do
      {
        double v20 = *v19++;
        double v21 = v20;
        if (v18 < v20)
        {
          double v18 = v21;
          BOOL v15 = v16;
        }
        v16 = v19;
      }
      while (v19 != (double *)v37);
    }
    if (*v15 > 0.5)
    {
      objc_opt_class();
      uint64_t v22 = +[CRNeuralTextDetectorV3 supportedTextType]();
      v23 = [v22 objectAtIndex:(int)((v9 - v7) >> 3)];
      uint64_t v24 = [v23 unsignedIntegerValue];

      [v4 setTextType:v24];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v25 = objc_msgSend(v4, "subFeatures", 0);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v30 != v27) {
              objc_enumerationMutation(v25);
            }
            objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "setTextType:", objc_msgSend(v4, "textType"));
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v26);
      }

      int v7 = (char *)__p;
    }
  }
  if (v7)
  {
    v35 = v7;
    operator delete(v7);
  }
  if (v36)
  {
    uint64_t v37 = (char *)v36;
    operator delete(v36);
  }
}

- (CRNeuralTextDetectorV3)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = @"CRImageReaderRevisionKey";
  v8[0] = &unk_1F3933268;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = [[CRDetectorConfiguration alloc] initWithImageReaderOptions:v3 error:0];
  unint64_t v5 = [(CRNeuralTextDetectorV3 *)self initWithConfiguration:v4 error:0];

  return v5;
}

- (CRNeuralTextDetectorV3)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRNeuralTextDetectorV3;
  int v7 = [(CRNeuralTextDetector *)&v14 init];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = [[CRTextDetectorModelV3CoreML alloc] initWithConfiguration:v6 error:a4];
  [(CRNeuralTextDetectorV3 *)v7 setModel:v8];

  v9 = [(CRNeuralTextDetectorV3 *)v7 model];

  if (v9)
  {
    [(CRNeuralTextDetector *)v7 setConfiguration:v6];
LABEL_4:
    uint64_t v10 = v7;
    goto LABEL_8;
  }
  uint64_t v11 = CROSLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_ERROR, "Could not initialize V3 detector model", v13, 2u);
  }

  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)preheatWithError:(id *)a3
{
  CVPixelBufferRef pixelBufferOut = 0;
  unint64_t v5 = [(CRNeuralTextDetector *)self configuration];
  [v5 tileSize];
  double v7 = v6;
  v8 = [(CRNeuralTextDetector *)self configuration];
  [v8 tileSize];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)v7, (unint64_t)v9, 0x42475241u, MEMORY[0x1E4F1CC08], &pixelBufferOut);

  uint64_t v10 = [(CRNeuralTextDetectorV3 *)self model];
  uint64_t v11 = [v10 predictionFromImage:pixelBufferOut error:a3];

  CVPixelBufferRelease(pixelBufferOut);
  return v11 != 0;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = [(CRNeuralTextDetector *)self configuration];
  v8 = [v7 prioritization];
  int v9 = [v8 isEqualToString:@"CRImageReaderPrioritizationPerformance"];

  double v10 = 4032.0;
  if (v9) {
    double v10 = 2800.0;
  }
  if (width <= height) {
    double v11 = height;
  }
  else {
    double v11 = width;
  }
  float v12 = v10 / v11;
  if (a3 <= 0.0)
  {
    float v19 = 1.0;
    BOOL v18 = v12 <= 1.0;
  }
  else
  {
    if (width >= height) {
      double v13 = height;
    }
    else {
      double v13 = width;
    }
    float v14 = 480.0 / v13;
    double v15 = v12;
    if (30.0 / (height * a3) < v15) {
      double v15 = 30.0 / (height * a3);
    }
    double v16 = v14;
    BOOL v17 = v15 <= v14;
    if (v15 > v14) {
      double v16 = v15;
    }
    float v12 = v15;
    if (v17) {
      float v12 = v14;
    }
    BOOL v18 = v16 <= 1.0;
    float v19 = 1.0;
  }
  if (!v18) {
    float v12 = v19;
  }
  double v20 = v12;
  float v21 = width * v12;
  double v22 = (double)(int)llroundf(v21);
  *(float *)&double v20 = height * v20;
  double v23 = (double)(int)llroundf(*(float *)&v20);
  result.double height = v23;
  result.double width = v22;
  return result;
}

+ (double)scaledImageSizeForMaxSize:(double)a3 minSize:(double)a4 inputLengthLimit:(double)a5 imageSize:(double)a6 scale:(double)a7
{
  self;
  if (a3 >= a6) {
    double v17 = a6;
  }
  else {
    double v17 = a3;
  }
  if (a4 >= a7) {
    double v18 = a7;
  }
  else {
    double v18 = a4;
  }
  double v19 = v17 / a6;
  double v20 = v18 / a7;
  if (v19 <= v20) {
    double v19 = v20;
  }
  float v21 = v19;
  float v22 = 0.0;
  if (v21 < 1.0)
  {
    double v23 = a6 <= a7 ? a7 : a6;
    float v22 = a5 / v23;
    if (v21 < v22) {
      float v22 = v21;
    }
  }
  double v24 = a1 / a6;
  if (a1 / a6 >= a2 / a7) {
    double v24 = a2 / a7;
  }
  if (v24 > 1.0) {
    double v24 = 1.0;
  }
  float v25 = v24;
  if (v22 < v25) {
    float v22 = v25;
  }
  *a9 = v22;
  return (double)(int)(a6 * v22 + 0.5);
}

+ (float64x2_t)calculateTargetOutputSize:(double)a3 adjustedInputScale:(double)a4 paddedSize:(double)a5 imageSize:(double)a6 maximumSize:(double)a7 minimumSize:(uint64_t)a8 inputLengthLimit:(float64x2_t *)a9
{
  uint64_t v21 = self;
  v22.f64[0] = +[CRNeuralTextDetectorV3 scaledImageSizeForMaxSize:minSize:inputLengthLimit:imageSize:scale:](a3, a4, a5, a6, a7, a1, a2, v21, a10);
  v22.f64[1] = v23;
  int32x2_t v24 = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vmulq_f64(v22, (float64x2_t)vdupq_n_s64(0x3FA0000000000000uLL)))));
  int32x2_t v25 = vcgt_s32((int32x2_t)0xF0000000FLL, v24);
  v26.i64[0] = v25.i32[0];
  v26.i64[1] = v25.i32[1];
  float64x2_t v27 = (float64x2_t)vbslq_s8(v26, (int8x16_t)vdupq_n_s64(0x407E000000000000uLL), (int8x16_t)vcvtq_f64_f32(vcvt_f32_s32(vshl_n_s32(v24, 5uLL))));
  *a11 = v27;
  float64x2_t v28 = vaddq_f64(v27, vsubq_f64(v22, v27));
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t result = vcvtq_f64_f32(vrndp_f32(vcvt_f32_f64(vmulq_f64(v28, _Q1))));
  *a9 = result;
  return result;
}

- (id)enumerateTilesForImage:(id)a3 cachedSurface:(__IOSurface *)a4 guidedByScoreMapFullTile:(void *)a5 block:(id)a6
{
  id v9 = a3;
  uint64_t v88 = (void (**)(id, uint64_t, float *, unsigned char *, double, double, double, double))a6;
  if (!v88)
  {
    id v55 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_83;
  }
  double v10 = [(CRNeuralTextDetector *)self configuration];
  [v10 tileOverlap];
  double v12 = v11;

  double v13 = [(CRNeuralTextDetector *)self configuration];
  [v13 tileSize];
  double rect = v14;
  double v16 = v15;

  unint64_t v17 = [v9 width];
  unint64_t v18 = [v9 height];
  double v90 = rect - v12;
  float v19 = ((double)v17 - v12) / (rect - v12);
  uint64_t v20 = vcvtps_s32_f32(v19);
  double v81 = v16 - v12;
  float v21 = ((double)v18 - v12) / (v16 - v12);
  uint64_t v83 = vcvtps_s32_f32(v21);
  v93 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v83 * v20];
  LODWORD(__p[0]) = 0;
  std::vector<float>::vector(v104, v83 * v20, __p);
  std::vector<CGRect>::vector(__p, v83 * v20);
  float v102 = 0.0;
  double v22 = 1.0;
  id v84 = v9;
  if (*(void *)a5
    && ([(CRNeuralTextDetector *)self configuration],
        float64_t v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v23 useScaleTraversal],
        v23,
        v24))
  {
    BOOL v96 = 0;
    size_t v25 = (unint64_t)(rect
                           / (double)(unint64_t)[v9 width]
                           * (double)*(unint64_t *)(*(void *)a5 + 16));
    unint64_t v26 = (unint64_t)(v16
                           / (double)(unint64_t)[v9 height]
                           * (double)*(unint64_t *)(*(void *)a5 + 8));
    double v27 = (float)((float)v25 * (float)v26) / rect / v16;
    double v22 = v27 + v27 + v27 + v27;
  }
  else
  {
    unint64_t v26 = 0;
    size_t v25 = 0;
    BOOL v96 = 1;
  }
  uint64_t v95 = v20;
  float v28 = v22;
  float v89 = v28;
  char v101 = 0;
  if (v83 < 1)
  {
    uint64_t v87 = 0;
  }
  else
  {
    unint64_t v86 = v26;
    uint64_t v87 = 0;
    uint64_t v82 = 0;
    v92 = self;
    while (v20 < 1)
    {
LABEL_37:
      if (v101) {
        goto LABEL_44;
      }
      self = v92;
      char v53 = [(CRNeuralTextDetector *)v92 shouldCancel];
      if (++v82 == v83) {
        char v54 = 1;
      }
      else {
        char v54 = v53;
      }
      if (v54) {
        goto LABEL_46;
      }
    }
    uint64_t v29 = 0;
    uint64_t v91 = v82 * v20;
    while (1)
    {
      double x = v90 * (double)(int)v29;
      if (x >= 0.0)
      {
        double height = v16;
        double width = rect;
        double y = v81 * (double)(int)v82;
      }
      else
      {
        v106.origin.double x = v90 * (double)(int)v29;
        v106.origin.double y = v81 * (double)(int)v82;
        v106.size.double width = rect;
        v106.size.double height = v16;
        CGRect v107 = CGRectOffset(v106, -x, 0.0);
        double x = v107.origin.x;
        double y = v107.origin.y;
        double width = v107.size.width;
        double height = v107.size.height;
      }
      if (width + x >= (double)(unint64_t)[v9 width])
      {
        unint64_t v34 = [v9 width];
        v108.origin.double x = x;
        v108.origin.double y = y;
        v108.size.double width = width;
        v108.size.double height = height;
        CGRect v109 = CGRectOffset(v108, (double)v34 - (width + x), 0.0);
        double x = v109.origin.x;
        double y = v109.origin.y;
        double width = v109.size.width;
        double height = v109.size.height;
      }
      if (y < 0.0)
      {
        v110.origin.double x = x;
        v110.origin.double y = y;
        v110.size.double width = width;
        v110.size.double height = height;
        CGRect v111 = CGRectOffset(v110, 0.0, -y);
        double x = v111.origin.x;
        double y = v111.origin.y;
        double width = v111.size.width;
        double height = v111.size.height;
      }
      if (height + y >= (double)(unint64_t)[v9 height])
      {
        unint64_t v35 = [v9 height];
        v112.origin.double x = x;
        v112.origin.double y = y;
        v112.size.double width = width;
        v112.size.double height = height;
        CGRect v113 = CGRectOffset(v112, 0.0, (double)v35 - (height + y));
        double x = v113.origin.x;
        double y = v113.origin.y;
        double width = v113.size.width;
        double height = v113.size.height;
      }
      uint64_t v36 = v29 + v91;
      uint64_t v37 = (double *)((char *)__p[0] + 32 * v29 + 32 * v91);
      *uint64_t v37 = x;
      v37[1] = y;
      v37[2] = width;
      v37[3] = height;
      unint64_t v38 = [v9 width];
      unint64_t v39 = [v9 height];
      unint64_t v40 = [v9 width];
      unint64_t v41 = [v9 height];
      double v42 = x / (double)v38;
      v43 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v42, y / (double)v39, width / (double)v40, height / (double)v41);
      [v93 addObject:v43];

      if (v96)
      {
        BOOL v96 = 1;
      }
      else
      {
        if (v86)
        {
          unint64_t v44 = (unint64_t)(y / (double)v39 * (double)*(unint64_t *)(*(void *)a5 + 8));
          unint64_t v45 = (unint64_t)(v42 * (double)*(unint64_t *)(*(void *)a5 + 16));
          unint64_t v46 = v86;
          do
          {
            float __C = 0.2;
            float __B = 0.0;
            uint64_t v47 = (float *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
            vDSP_Length __NHigh = 0;
            vDSP_Length __NLow = 0;
            vDSP_vclipc((const float *)(**(void **)a5 + 4 * *(void *)(*(void *)a5 + 16) * v44 + 4 * v45), 1, &__B, &__C, v47, 1, v25, &__NLow, &__NHigh);
            free(v47);
            BOOL v48 = (float *)v104[0];
            *((float *)v104[0] + v36) = *((float *)v104[0] + v36) + (float)__NHigh;
            ++v44;
            --v46;
          }
          while (v46);
          id v9 = v84;
        }
        else
        {
          BOOL v48 = (float *)v104[0];
        }
        if (v48[v36] <= 0.0)
        {
          BOOL v96 = 0;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v9, "imageByCroppingRectangle:toSurface:", a4, x, y, width, height);
          }
          else {
          v49 = objc_msgSend(v9, "imageByCroppingRectangle:", x, y, width, height);
          }
          uint64_t v50 = [v49 pixelBuffer];
          float v102 = 0.0;
          v88[2](v88, v50, &v102, &v101, x, y, width, height);
          BOOL v96 = (float)(v102 * v89) > *((float *)v104[0] + v36);
          ++v87;
        }
      }
      if (v101) {
        break;
      }
      int v51 = [(CRNeuralTextDetector *)v92 shouldCancel];
      if (++v29 >= v20) {
        int v52 = 1;
      }
      else {
        int v52 = v51;
      }
      if (v52 == 1) {
        goto LABEL_37;
      }
    }
LABEL_44:
    self = v92;
  }
LABEL_46:
  if (v96 || v87)
  {
    if (v83 >= 1 && v96) {
      goto LABEL_58;
    }
  }
  else
  {
    if (v20 >= 0) {
      uint64_t v56 = v20;
    }
    else {
      uint64_t v56 = v20 + 1;
    }
    uint64_t v57 = v83 / 2 * v20 + (v56 >> 1);
    v58 = (double *)((char *)__p[0] + 32 * v57);
    double v60 = *v58;
    double v59 = v58[1];
    double v62 = v58[2];
    double v61 = v58[3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v9, "imageByCroppingRectangle:toSurface:", a4, v60, v59, v62, v61);
    }
    else {
    v63 = objc_msgSend(v9, "imageByCroppingRectangle:", v60, v59, v62, v61);
    }
    uint64_t v64 = [v63 pixelBuffer];
    float v102 = 0.0;
    v88[2](v88, v64, &v102, &v101, *((double *)__p[0] + 4 * v57), *((double *)__p[0] + 4 * v57 + 1), *((double *)__p[0] + 4 * v57 + 2), *((double *)__p[0] + 4 * v57 + 3));
    if (v102 <= 0.0)
    {
    }
    else
    {
      *((float *)v104[0] + v57) = fmaxf(v102 * v89, 1.0);

      if (v83 > 0)
      {
LABEL_58:
        uint64_t v65 = 0;
        uint64_t v66 = 0;
        while (v95 < 1)
        {
LABEL_71:
          if (!v101)
          {
            BOOL v78 = [(CRNeuralTextDetector *)self shouldCancel];
            char v79 = ++v66 == v83 || v78;
            v65 += 4 * v95;
            if ((v79 & 1) == 0) {
              continue;
            }
          }
          goto LABEL_78;
        }
        uint64_t v67 = v65;
        uint64_t v68 = 1;
        while (1)
        {
          if (*(float *)((char *)v104[0] + v67) < v89)
          {
            v69 = (double *)((char *)__p[0] + 8 * v67);
            double v70 = *v69;
            double v71 = v69[1];
            double v72 = v69[2];
            double v73 = v69[3];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v9, "imageByCroppingRectangle:toSurface:", a4, v70, v71, v72, v73);
            }
            else {
            v74 = objc_msgSend(v9, "imageByCroppingRectangle:", v70, v71, v72, v73);
            }
            uint64_t v75 = [v74 pixelBuffer];
            float v102 = 1.0;
            v88[2](v88, v75, &v102, &v101, v70, v71, v72, v73);
          }
          if (v101) {
            break;
          }
          BOOL v76 = [(CRNeuralTextDetector *)self shouldCancel];
          char v77 = v68++ >= v95 || v76;
          v67 += 4;
          if (v77) {
            goto LABEL_71;
          }
        }
      }
    }
  }
LABEL_78:
  id v55 = v93;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v104[0])
  {
    v104[1] = v104[0];
    operator delete(v104[0]);
  }

LABEL_83:
  return v55;
}

+ (void)createImageMap:(void *)a3 targetSize:
{
  id v3 = a3;
  self;
  id v4 = [v3 shape];
  unint64_t v5 = [v4 objectAtIndexedSubscript:0];
  [v5 integerValue];

  operator new();
}

+ (void)createMultiChannelImageMaps:(CGFloat)a3 size:(uint64_t)a4 channels:(void *)a5
{
  id v9 = a5;
  self;
  double v10 = [v9 strides];
  double v11 = [v10 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 integerValue];

  double v13 = [v9 strides];
  double v14 = [v13 objectAtIndexedSubscript:1];
  int v15 = [v14 integerValue];

  v29.double width = a2;
  v29.double height = a3;
  CRDetectorOutputMaps::createMaps(a6, v29, a1);
  id v26 = v9;
  uint64_t v16 = [v26 dataPointer];
  if (a6 >= 1)
  {
    unint64_t v17 = (char *)v16;
    uint64_t v18 = 0;
    size_t v19 = vcvtd_n_u64_f64(a2, 2uLL);
    uint64_t v20 = 4 * v12;
    uint64_t v21 = 4 * v15;
    do
    {
      if (a3 > 0.0)
      {
        double v22 = **(char ***)(*a1 + 8 * v18);
        int v23 = 1;
        int v24 = v17;
        do
        {
          memcpy(v22, v24, v19);
          CGFloat v25 = (double)v23++;
          v24 += v21;
          v22 += 4 * (int)a2;
        }
        while (a3 > v25);
      }
      ++v18;
      v17 += v20;
    }
    while (v18 != a6);
  }
}

- (id)detectInImage:(id)a3 error:(id *)a4
{
  id v4 = [(CRNeuralTextDetectorV3 *)self detectInImage:a3 trackingSession:0 error:a4];
  return v4;
}

- (id)detectInImage:(id)a3 trackingSession:(id)a4 error:(id *)a5
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v55 = a4;
  v128[0] = 0;
  v128[1] = v128;
  v128[2] = 0x9812000000;
  v128[3] = __Block_byref_object_copy__20;
  v128[4] = __Block_byref_object_dispose__20;
  v128[5] = &unk_1DD8FDA7A;
  memset(&v128[6], 0, 32);
  long long v129 = 0u;
  memset(v130, 0, sizeof(v130));
  long long v131 = 0u;
  uint64_t v132 = 0;
  v123[0] = 0;
  v123[1] = (void **)v123;
  v123[2] = (void **)0x9812000000;
  v123[3] = (void **)__Block_byref_object_copy__20;
  v123[4] = (void **)__Block_byref_object_dispose__20;
  v123[5] = (void **)&unk_1DD8FDA7A;
  memset(&v123[6], 0, 32);
  long long v124 = 0u;
  memset(v125, 0, sizeof(v125));
  long long v126 = 0u;
  uint64_t v127 = 0;
  uint64_t v117 = 0;
  long long v118 = &v117;
  uint64_t v119 = 0x3032000000;
  v120 = __Block_byref_object_copy__9;
  v121 = __Block_byref_object_dispose__10;
  id v122 = 0;
  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x4012000000;
  v116[3] = __Block_byref_object_copy__11;
  v116[4] = __Block_byref_object_dispose__12;
  v116[5] = &unk_1DD8FDA7A;
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x4012000000;
  v115[3] = __Block_byref_object_copy__11;
  v115[4] = __Block_byref_object_dispose__12;
  v115[5] = &unk_1DD8FDA7A;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x4012000000;
  v114[3] = __Block_byref_object_copy__11;
  v114[4] = __Block_byref_object_dispose__12;
  v114[5] = &unk_1DD8FDA7A;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x4012000000;
  v113[3] = __Block_byref_object_copy__11;
  v113[4] = __Block_byref_object_dispose__12;
  v113[5] = &unk_1DD8FDA7A;
  v8 = [(CRNeuralTextDetector *)self configuration];
  char v9 = [v8 disableScriptDetection];

  double v10 = [(CRNeuralTextDetector *)self configuration];
  char v11 = [v10 disableTextTypeDetection];

  uint64_t v12 = [(CRNeuralTextDetector *)self configuration];
  char v13 = [v12 detectTables];
  if (v55) {
    char v14 = 0;
  }
  else {
    char v14 = v13;
  }

  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x3032000000;
  v111[3] = __Block_byref_object_copy__9;
  v111[4] = __Block_byref_object_dispose__10;
  id v112 = 0;
  int v15 = [(CRNeuralTextDetector *)self detectorStats];
  char v16 = v11 ^ 1;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke;
  v98[3] = &unk_1E6CDC478;
  char v101 = v115;
  id v54 = v53;
  id v99 = v54;
  id v100 = self;
  float v102 = &v117;
  v103 = v116;
  v104 = v123;
  long long v105 = v114;
  CGRect v106 = v113;
  CGRect v107 = v128;
  char v109 = v9 ^ 1;
  char v110 = v11 ^ 1;
  CGRect v108 = v111;
  [v15 measureBlock:v98];

  unint64_t v17 = (void *)v118[5];
  if (v17)
  {
    uint64_t v18 = 0;
    if (a5) {
      *a5 = v17;
    }
  }
  else
  {
    v96[0] = 0;
    v96[1] = (void **)v96;
    v96[2] = (void **)0x6012000000;
    v96[3] = (void **)__Block_byref_object_copy__21;
    v96[4] = (void **)__Block_byref_object_dispose__22;
    v96[5] = (void **)&unk_1DD8FDA7A;
    memset(v97, 0, sizeof(v97));
    uint64_t v90 = 0;
    uint64_t v91 = &v90;
    uint64_t v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__9;
    v94 = __Block_byref_object_dispose__10;
    id v95 = 0;
    uint64_t v83 = 0;
    id v84 = &v83;
    uint64_t v85 = 0x4812000000;
    unint64_t v86 = __Block_byref_object_copy__24;
    uint64_t v87 = __Block_byref_object_dispose__25;
    uint64_t v88 = &unk_1DD8FDA7A;
    memset(v89, 0, sizeof(v89));
    char v77 = 0;
    BOOL v78 = &v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__9;
    double v81 = __Block_byref_object_dispose__10;
    id v82 = 0;
    size_t v19 = [(CRNeuralTextDetector *)self postProcStats];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_27;
    v60[3] = &unk_1E6CDC4A0;
    v60[4] = self;
    v63 = &v90;
    uint64_t v64 = v128;
    uint64_t v65 = v116;
    uint64_t v66 = v123;
    uint64_t v67 = v114;
    uint64_t v68 = v115;
    v69 = v113;
    double v70 = &v77;
    double v71 = v96;
    id v20 = v54;
    id v61 = v20;
    double v72 = v111;
    char v74 = v9 ^ 1;
    char v75 = v14;
    id v62 = v55;
    double v73 = &v83;
    char v76 = v16;
    [v19 measureBlock:v60];

    uint64_t v21 = objc_opt_new();
    double v22 = [(CRNeuralTextDetector *)self configuration];
    int v23 = [v22 skipVerticalText];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v24 = (id)v91[5];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v133 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v57 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          if (!v23 || ([*(id *)(*((void *)&v56 + 1) + 8 * i) isVerticalLayout] & 1) == 0)
          {
            CGSize v29 = objc_opt_class();
            [v20 size];
            long long v30 = objc_msgSend(v29, "_lineRegionFromLineTextFeature:imageSize:", v28);
            [v21 addObject:v30];
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v133 count:16];
      }
      while (v25);
    }

    CRLogger = CRLogger::getCRLogger(v31);
    if (*CRLogger && (CRLogger[8] & 1) != 0)
    {
      uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCVImageBuffer:", objc_msgSend(v20, "pixelBuffer"));
      int v52 = +[CRTextFeature overlayFeaturesQuadVertices:v91[5] onImage:v33 showSubFeatures:0];
      double v34 = (float)rand();
      unint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"/tmp/%f_quad.png", *(void *)&v34);
      uint64_t v36 = [[CRImage alloc] initWithCIImage:v52 toColorSpace:1];
      [(CRImage *)v36 writeToFile:v35];
      uint64_t v37 = +[CRTextFeature overlayFeaturesPolygonVertices:v91[5] onImage:v33 showSubFeatures:0];
      unint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"/tmp/%f_polygon.png", *(void *)&v34);
      unint64_t v39 = [[CRImage alloc] initWithCIImage:v37 toColorSpace:1];
      [(CRImage *)v39 writeToFile:v38];
    }
    uint64_t v18 = [[CRDetectionResult alloc] initWithLines:v21];
    unint64_t v40 = [v78[5] pyramidPreIntraScaleNMSTextFeatures];
    [(CRDetectionResult *)v18 setPyramidPreIntraScaleNMSTextFeatures:v40];

    unint64_t v41 = [v78[5] pyramidScaleSize];
    [(CRDetectionResult *)v18 setPyramidScaleSize:v41];

    double v42 = [v78[5] pyramidScaleName];
    [(CRDetectionResult *)v18 setPyramidScaleName:v42];

    [(CRDetectionResult *)v18 setTableRegions:v84 + 6];
    _Block_object_dispose(&v77, 8);

    _Block_object_dispose(&v83, 8);
    char v77 = (void **)v89;
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100](&v77);
    _Block_object_dispose(&v90, 8);

    _Block_object_dispose(v96, 8);
    std::deque<unsigned char>::~deque[abi:ne180100](v97);
  }

  _Block_object_dispose(v111, 8);
  _Block_object_dispose(v113, 8);
  _Block_object_dispose(v114, 8);
  _Block_object_dispose(v115, 8);
  _Block_object_dispose(v116, 8);
  _Block_object_dispose(&v117, 8);

  _Block_object_dispose(v123, 8);
  v96[0] = (void **)&v126;
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v96);
  v96[0] = (void **)&v125[1];
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v96);
  v43 = (void **)v125[0];
  v125[0] = 0;
  if (v43)
  {
    if (*v43) {
      free(*v43);
    }
    MEMORY[0x1E01BF140](v43, 0x1080C40ABB4582ELL);
  }
  unint64_t v44 = (void **)*((void *)&v124 + 1);
  *((void *)&v124 + 1) = 0;
  if (v44)
  {
    if (*v44) {
      free(*v44);
    }
    MEMORY[0x1E01BF140](v44, 0x1080C40ABB4582ELL);
  }
  unint64_t v45 = (void **)v124;
  *(void *)&long long v124 = 0;
  if (v45)
  {
    if (*v45) {
      free(*v45);
    }
    MEMORY[0x1E01BF140](v45, 0x1080C40ABB4582ELL);
  }
  v96[0] = (void **)&v123[7];
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v96);
  unint64_t v46 = v123[6];
  v123[6] = 0;
  if (v46)
  {
    if (*v46) {
      free(*v46);
    }
    MEMORY[0x1E01BF140](v46, 0x1080C40ABB4582ELL);
  }
  _Block_object_dispose(v128, 8);
  v123[0] = (void **)&v131;
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v123);
  v123[0] = (void **)v130 + 1;
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v123);
  uint64_t v47 = *(void ***)&v130[0];
  *(void *)&v130[0] = 0;
  if (v47)
  {
    if (*v47) {
      free(*v47);
    }
    MEMORY[0x1E01BF140](v47, 0x1080C40ABB4582ELL);
  }
  BOOL v48 = (void **)*((void *)&v129 + 1);
  *((void *)&v129 + 1) = 0;
  if (v48)
  {
    if (*v48) {
      free(*v48);
    }
    MEMORY[0x1E01BF140](v48, 0x1080C40ABB4582ELL);
  }
  v49 = (void **)v129;
  *(void *)&long long v129 = 0;
  if (v49)
  {
    if (*v49) {
      free(*v49);
    }
    MEMORY[0x1E01BF140](v49, 0x1080C40ABB4582ELL);
  }
  v123[0] = (void **)&v128[7];
  std::vector<std::unique_ptr<CRImageBuffer>>::__destroy_vector::operator()[abi:ne180100](v123);
  uint64_t v50 = (void **)v128[6];
  v128[6] = 0;
  if (v50)
  {
    if (*v50) {
      free(*v50);
    }
    MEMORY[0x1E01BF140](v50, 0x1080C40ABB4582ELL);
  }

  return v18;
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke(uint64_t a1)
{
  p_info = CRImageSpacePolyline.info;
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v3 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  unint64_t v5 = (id)CRSignpostLog_signPostOSLog;
  double v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.f64[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "OCRDetectorTime", "", (uint8_t *)&buf, 2u);
  }

  v57[0] = 0.0;
  double v7 = *(float64x2_t **)(*(void *)(a1 + 48) + 8);
  [*(id *)(a1 + 32) size];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 40) configuration];
  [v12 maximumInputSize];
  double v14 = v13;
  double v16 = v15;
  unint64_t v17 = [*(id *)(a1 + 40) configuration];
  [v17 tileSize];
  double v19 = v18;
  double v21 = v20;
  double v22 = [*(id *)(a1 + 40) configuration];
  [v22 inputLengthLimit];
  +[CRNeuralTextDetectorV3 calculateTargetOutputSize:adjustedInputScale:paddedSize:imageSize:maximumSize:minimumSize:inputLengthLimit:](v9, v11, v14, v16, v19, v21, v23, (uint64_t)CRNeuralTextDetectorV3, v7 + 3, v57, &buf);

  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(double *)(v24 + 48) > 4.0 && *(double *)(v24 + 56) > 4.0)
  {
    if ([*(id *)(a1 + 40) shouldCancel])
    {
      uint64_t v25 = +[CRImageReader errorWithErrorCode:-3];
      uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
      double v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      return;
    }
    CFTypeRef cf = 0;
    uint64_t v28 = *(CRImage_PixelBuffer **)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGSize v29 = (CRImage_PixelBuffer *)*(id *)(a1 + 32);
    }
    else
    {
      uint64_t v28 = [CRImage_PixelBuffer alloc];
      CGSize v29 = -[CRImage_PixelBuffer initWithCVPixelBuffer:](v28, "initWithCVPixelBuffer:", [*(id *)(a1 + 32) pixelBuffer]);
    }
    long long v30 = v29;
    long long v31 = -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:](v29, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", *(void *)(*(void *)(a1 + 64) + 8) + 48, 1, 1111970369, 0, 1, v57[0], buf.f64[0], buf.f64[1]);
    id v53 = [[CRImage_PixelBuffer alloc] initWithCVPixelBuffer:v31];
    CVPixelBufferRelease(v31);
    long long v32 = [*(id *)(a1 + 40) configuration];
    if ([v32 useScaleTraversal])
    {
      int v51 = 1;
    }
    else
    {
      uint64_t v33 = [*(id *)(a1 + 40) configuration];
      int v51 = [v33 runFullTile];
    }
    double v34 = [*(id *)(a1 + 40) configuration];
    char v35 = [v34 useScaleTraversal];
    if ((v35 & 1) != 0
      || ([*(id *)(a1 + 40) configuration],
          uint64_t v28 = (CRImage_PixelBuffer *)objc_claimAutoreleasedReturnValue(),
          [(CRImage_PixelBuffer *)v28 runFineScale]))
    {
      int v52 = v30;
      unint64_t v36 = [*(id *)(a1 + 32) width];
      uint64_t v37 = [*(id *)(a1 + 40) configuration];
      [v37 tileSize];
      if (v38 >= (double)v36)
      {
        unint64_t v40 = [*(id *)(a1 + 32) height];
        unint64_t v41 = [*(id *)(a1 + 40) configuration];
        [v41 tileSize];
        BOOL v39 = v42 < (double)v40;
      }
      else
      {
        BOOL v39 = 1;
      }

      long long v30 = v52;
      p_info = (__objc2_class_ro **)(CRImageSpacePolyline + 32);
      if (v35)
      {
LABEL_27:

        if ([*(id *)(a1 + 40) shouldCancel])
        {
          uint64_t v43 = +[CRImageReader errorWithErrorCode:-3];
          uint64_t v44 = *(void *)(*(void *)(a1 + 56) + 8);
          unint64_t v45 = *(void **)(v44 + 40);
          *(void *)(v44 + 40) = v43;

LABEL_46:
          return;
        }
        if (v51)
        {
          id obj = 0;
          [*(id *)(a1 + 40) runFullTileInferenceOnImage:*(void *)(a1 + 32) cachedSurface:&cf outputMaps:*(void *)(*(void *)(a1 + 72) + 8) + 48 inputSize:*(void *)(*(void *)(a1 + 80) + 8) + 48 outputSize:*(void *)(*(void *)(a1 + 88) + 8) + 48 modelContext:0 error:&obj];
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
LABEL_33:

            goto LABEL_46;
          }
          if ([*(id *)(a1 + 40) shouldCancel])
          {
            uint64_t v46 = +[CRImageReader errorWithErrorCode:-3];
            uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
            BOOL v48 = *(void **)(v47 + 40);
            *(void *)(v47 + 40) = v46;

            goto LABEL_33;
          }

          if (!v39 || !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 48))
          {
LABEL_38:
            if (cf) {
              CFRelease(cf);
            }
            if (p_info[496] != (__objc2_class_ro *)-1) {
              dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
            }
            v49 = (id)CRSignpostLog_signPostOSLog;
            uint64_t v50 = v49;
            if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
            {
              LOWORD(obj) = 0;
              _os_signpost_emit_with_name_impl(&dword_1DD733000, v50, OS_SIGNPOST_INTERVAL_END, v4, "OCRDetectorTime", "", (uint8_t *)&obj, 2u);
            }

            goto LABEL_46;
          }
        }
        else if (!v39)
        {
          goto LABEL_38;
        }
        CRDetectorOutputMaps::init((CRDetectorOutputMaps *)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
      }
    }
    else
    {
      BOOL v39 = 0;
    }

    goto LABEL_27;
  }
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_18(uint64_t a1, uint64_t a2, float *a3, unsigned char *a4, double a5, double a6, double a7, double a8)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v16 = (void *)MEMORY[0x1E01BF820]();
  if ([*(id *)(a1 + 32) shouldCancel])
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    double v38 = __Block_byref_object_copy__9;
    BOOL v39 = __Block_byref_object_dispose__10;
    id v40 = 0;
    unint64_t v17 = [*(id *)(a1 + 32) inferenceStats];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_2;
    v34[3] = &unk_1E6CDC428;
    uint64_t v18 = *(void *)(a1 + 40);
    v34[4] = *(void *)(a1 + 32);
    v34[5] = &v35;
    v34[6] = v18;
    v34[7] = a2;
    [v17 measureBlock:v34];

    CGSize v33 = (CGSize)vdupq_n_s64(0x406E000000000000uLL);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    double v20 = *(double *)(v19 + 56);
    if ((a6 + a8) * 0.5 <= v20)
    {
      double v21 = 240.0;
    }
    else
    {
      double v21 = 240.0 - -(v20 - (a6 + a8) * 0.5);
      v33.double height = v21;
    }
    double v22 = *(double *)(v19 + 48);
    if ((a5 + a7) * 0.5 <= v22)
    {
      double v23 = 240.0;
    }
    else
    {
      double v23 = 240.0 - -(v22 - (a5 + a7) * 0.5);
      v33.double width = v23;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v26 = (CRTextDetectorModelV3Output *)v36[5];
      if (v26)
      {
        if (*a3 < 1.0)
        {
          float __C = 0.2;
          float __B = 0.0;
          size_t v27 = (unint64_t)(v21 * v23);
          uint64_t v28 = (float *)malloc_type_calloc(v27, 4uLL, 0x100004052888210uLL);
          buf.double x = 0.0;
          vDSP_Length __NHigh = 0;
          objc_msgSend((id)v36[5], "region_score");
          id v29 = objc_claimAutoreleasedReturnValue();
          vDSP_vclipc((const float *)[v29 dataPointer], 1, &__B, &__C, v28, 1, v27, (vDSP_Length *)&buf, &__NHigh);

          free(v28);
          *a3 = (float)__NHigh;
          uint64_t v26 = (CRTextDetectorModelV3Output *)v36[5];
        }
        buf.double x = a5 * 0.5;
        buf.double y = a6 * 0.5;
        CRDetectorOutputMaps::aggregateMaps((CRDetectorOutputMaps *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), v26, &v33, &buf);
      }
    }
    uint64_t v24 = CROSLogForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localizedDescription];
      LODWORD(buf.x) = 138412290;
      *(void *)((char *)&buf.x + 4) = v25;
      _os_log_impl(&dword_1DD733000, v24, OS_LOG_TYPE_FAULT, "Model prediction error: %@", (uint8_t *)&buf, 0xCu);
    }
    _Block_object_dispose(&v35, 8);
  }
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_2(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  os_signpost_id_t v4 = (id)CRSignpostLog_signPostOSLog;
  unint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)CGPoint buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRDetectorInferenceTime", "", buf, 2u);
  }

  double v6 = [*(id *)(a1 + 32) model];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 predictionFromImage:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v12 = (id)CRSignpostLog_signPostOSLog;
  double v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)double v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRDetectorInferenceTime", "", v14, 2u);
  }
}

void __62__CRNeuralTextDetectorV3_detectInImage_trackingSession_error___block_invoke_27(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  os_signpost_id_t v4 = (id)CRSignpostLog_signPostOSLog;
  unint64_t v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)CGPoint buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRPostProcessingTime", "", buf, 2u);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  double v10 = *(double *)(v9 + 48);
  double v11 = *(double *)(v9 + 56);
  uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
  double v14 = *(double *)(v13 + 48);
  double v15 = *(double *)(v13 + 56);
  uint64_t v16 = *(void *)(*(void *)(a1 + 96) + 8);
  float64_t v17 = *(double *)(v16 + 48);
  float64_t v18 = *(double *)(v16 + 56);
  uint64_t v19 = [v7 configuration];
  int v20 = [v19 logIntermediateResults];
  if (v20)
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 112) + 8);
    double v23 = *(void **)(v21 + 40);
    double v22 = (id *)(v21 + 40);
    id obj = v23;
    p_id obj = (CRIntermediateDetectorResult **)&obj;
  }
  else
  {
    p_id obj = 0;
    double v22 = 0;
  }
  uint64_t v25 = *(int64x2_t **)(*(void *)(a1 + 120) + 8);
  [*(id *)(a1 + 40) size];
  uint64_t v28 = -[CRNeuralTextDetectorV3 processFineScaleMaps:adjustedSize:fullTileMaps:adjustedFullTileSize:targetSize:targetSizeFullTile:intermediateResults:withScaleIds:sourceImageSize:tileRects:trackingSession:](v7, (uint64_t *)(v8 + 48), (uint64_t *)(v12 + 48), p_obj, v25 + 3, *(void **)(*(void *)(*(void *)(a1 + 128) + 8) + 40), *(void **)(a1 + 48), v10, v11, v14, v15, v17, v18, v26, v27);
  if (v20) {
    objc_storeStrong(v22, obj);
  }
  uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;

  -[CRNeuralTextDetectorV3 computeClassificationType:fromTextFeatures:fineScaleMap:fullTileMap:withScaleIds:](*(void **)(a1 + 32), 1, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (uint64_t **)(*(void *)(*(void *)(a1 + 64) + 8) + 104), (uint64_t **)(*(void *)(*(void *)(a1 + 80) + 8) + 104), (void *)(*(void *)(*(void *)(a1 + 120) + 8) + 48));
  if (*(unsigned char *)(a1 + 144)) {
    -[CRNeuralTextDetectorV3 computeClassificationType:fromTextFeatures:fineScaleMap:fullTileMap:withScaleIds:](*(void **)(a1 + 32), 0, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (uint64_t **)(*(void *)(*(void *)(a1 + 64) + 8) + 56), (uint64_t **)(*(void *)(*(void *)(a1 + 80) + 8) + 56), (void *)(*(void *)(*(void *)(a1 + 120) + 8) + 48));
  }
  if (*(unsigned char *)(a1 + 145))
  {
    long long v31 = *(void **)(a1 + 32);
    uint64_t v32 = *(void *)(*(void *)(a1 + 80) + 8);
    CGSize v33 = [v31 configuration];
    int v34 = [v33 logIntermediateResults];
    if (v34)
    {
      uint64_t v35 = *(void *)(*(void *)(a1 + 112) + 8);
      uint64_t v37 = *(id **)(v35 + 40);
      unint64_t v36 = (id *)(v35 + 40);
      double v22 = v37;
    }
    else
    {
      unint64_t v36 = 0;
    }
    double v38 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [*(id *)(a1 + 40) size];
    id v39 = v38;
    if (v31)
    {
      id v40 = *(void **)(v32 + 96);
      unint64_t v41 = [v31 configuration];
      [v41 tableMinDetectableArea];
      CRDetectorPostProcessV3::extractTableBoxes(v40, v39, buf);
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v47 = 0;
    }

    if (v34) {
      objc_storeStrong(v36, v22);
    }
    uint64_t v42 = *(void *)(*(void *)(a1 + 136) + 8);
    std::vector<CRNormalizedQuad * {__strong}>::__vdeallocate((void **)(v42 + 48));
    *(_OWORD *)(v42 + 48) = *(_OWORD *)buf;
    *(void *)(v42 + 64) = v47;
    uint64_t v47 = 0;
    memset(buf, 0, sizeof(buf));
    v49 = buf;
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  }
  if (*(unsigned char *)(a1 + 146)) {
    -[CRNeuralTextDetectorV3 computeClassificationType:fromTextFeatures:fineScaleMap:fullTileMap:withScaleIds:](*(void **)(a1 + 32), 2, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (uint64_t **)(*(void *)(*(void *)(a1 + 64) + 8) + 128), (uint64_t **)(*(void *)(*(void *)(a1 + 80) + 8) + 128), (void *)(*(void *)(*(void *)(a1 + 120) + 8) + 48));
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v43 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v44 = v43;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)CGPoint buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v44, OS_SIGNPOST_INTERVAL_END, spid, "OCRPostProcessingTime", "", buf, 2u);
  }
}

- (id)processFineScaleMaps:(uint64_t *)a3 adjustedSize:(CRIntermediateDetectorResult *)a4 fullTileMaps:(int64x2_t *)a5 adjustedFullTileSize:(void *)a6 targetSize:(void *)a7 targetSizeFullTile:(double)a8 intermediateResults:(double)a9 withScaleIds:(double)a10 sourceImageSize:(double)a11 tileRects:(float64_t)a12 trackingSession:(float64_t)a13
{
  v538 = a5;
  v533 = a3;
  double v541 = a14;
  double v542 = a15;
  float64_t v550 = a12;
  float64_t v551 = a13;
  uint64_t v605 = *MEMORY[0x1E4F143B8];
  id v531 = a6;
  id v524 = a7;
  if (!a1) {
    goto LABEL_565;
  }
  v526 = a4;
  if (a4) {
    v532 = [[CRIntermediateDetectorResult alloc] initWithNumberOfScales:4];
  }
  else {
    v532 = 0;
  }
  int v19 = 0;
  long long v581 = 0u;
  long long v582 = 0u;
  long long v580 = 0u;
  v578 = 0;
  v577 = 0;
  size_t rowBytes = 0;
  v576[1] = 0;
  char v20 = 1;
  if (*v533 && *a2)
  {
    uint64_t v21 = a2;
    double v23 = (uint64_t *)a2[4];
    double v22 = (uint64_t *)a2[5];
    uint64_t v25 = (const vImage_Buffer *)v533[4];
    uint64_t v24 = (const vImage_Buffer *)v533[5];
    memset(&v603, 0, sizeof(v603));
    CRDetectorUtils::erodeImageMap(v25, (uint64_t)&v603);
    memset(v602, 0, 32);
    CRDetectorUtils::dilateImageMap(&v603, (uint64_t)v602);
    free(v603.data);
    memset(&v592, 0, sizeof(v592));
    CRDetectorUtils::erodeImageMap(v24, (uint64_t)&v592);
    long long v588 = 0u;
    long long v589 = 0u;
    CRDetectorUtils::dilateImageMap(&v592, (uint64_t)&v588);
    free(v592.data);
    uint64_t v26 = v23[1];
    double v27 = v602[0];
    char v20 = 0;
    if (v26)
    {
      unint64_t v28 = 0;
      uint64_t height = v25->height;
      uint64_t width = v25->width;
      uint64_t v31 = v23[2];
      float v32 = (float)v26 / (float)height;
      float v33 = (float)width;
      uint64_t v34 = *v23;
      uint64_t v35 = *v22;
      uint64_t v36 = v588;
      data = (float *)v24->data;
      int v19 = 0;
      uint64_t v38 = width * height;
      uint64_t v39 = 4 * v31;
      a2 = v21;
      do
      {
        if (v31)
        {
          unint64_t v40 = 0;
          float v41 = roundf((float)v28 / v32);
          do
          {
            uint64_t v42 = (uint64_t)(float)(roundf((float)v40 / (float)((float)v31 / v33)) + (float)(v41 * v33));
            if (v38 > v42)
            {
              if (data[v42] >= 0.3) {
                char v20 = 1;
              }
              if (*(float *)(v35 + 4 * v40) >= 0.3) {
                int v19 = 1;
              }
              float v43 = *((float *)v27 + v42);
              if (v43 > 0.7)
              {
                float v44 = fmin((float)(v43 + *(float *)(v34 + 4 * v40)), 1.0);
                *(float *)(v34 + 4 * v40) = v44;
              }
              float v45 = *(float *)(v36 + 4 * v42);
              if (v45 > 0.7)
              {
                float v46 = fmin((float)(v45 + *(float *)(v35 + 4 * v40)), 1.0);
                *(float *)(v35 + 4 * v40) = v46;
              }
            }
            ++v40;
          }
          while (v31 != v40);
        }
        ++v28;
        v34 += v39;
        v35 += v39;
      }
      while (v28 != v26);
    }
    else
    {
      int v19 = 0;
      a2 = v21;
    }
    free(v27);
    free((void *)v588);
  }
  v576[0] = 0;
  int v529 = v19;
  v527 = a2;
  -[CRNeuralTextDetectorV3 runNMSForDirection:adjustedSize:fullTileMaps:adjustedFullTileSize:targetSize:targetSizeFullTile:intermediateResults:withScaleIds:sourceImageSize:tileRects:isHorizontal:resultTextFeatures:quadFeatures:isFineScaleVerticalLinkActive:isFullTileVerticalLinkActive:idxLog:](a1, a2, v533, v532, &v580, v531, 1, v576, (uint64_t *)&v577, v19 != 0, v20 != 0);
  id v530 = v576[0];
  if (&v580 != (long long *)v538)
  {
    uint64_t v47 = (uint64_t *)(*((void *)&v580 + 1) + 8 * ((unint64_t)v582 >> 12));
    if ((void)v581 == *((void *)&v580 + 1))
    {
      BOOL v48 = 0;
      uint64_t v50 = 0;
      v49 = (char *)(*((void *)&v580 + 1) + 8 * ((*((void *)&v582 + 1) + (void)v582) >> 12));
    }
    else
    {
      BOOL v48 = (char *)(*v47 + (v582 & 0xFFF));
      v49 = (char *)(*((void *)&v580 + 1) + 8 * ((*((void *)&v582 + 1) + (void)v582) >> 12));
      uint64_t v50 = (char *)(*(void *)v49 + ((WORD4(v582) + (_WORD)v582) & 0xFFF));
    }
    if (v50 == v48)
    {
      unint64_t v51 = 0;
      long long v57 = (uint64_t *)v538;
      id v53 = &v538[2].i64[1];
    }
    else
    {
      unint64_t v51 = &v50[512 * (v49 - (char *)v47)] - &v48[*(void *)v49] + *v47;
      id v53 = &v538[2].i64[1];
      unint64_t v52 = v538[2].u64[1];
      if (v52 < v51)
      {
        if (v52)
        {
          uint64_t v54 = (uint64_t)&v48[v52 - *v47];
          if (v54 < 1)
          {
            unint64_t v77 = 4095 - v54;
            id v55 = &v47[-(v77 >> 12)];
            long long v56 = (char *)(*v55 + (~(_WORD)v77 & 0xFFF));
          }
          else
          {
            id v55 = &v47[(unint64_t)v54 >> 12];
            long long v56 = (char *)(*v55 + (v54 & 0xFFF));
          }
        }
        else
        {
          long long v56 = v48;
          id v55 = (uint64_t *)(*((void *)&v580 + 1) + 8 * ((unint64_t)v582 >> 12));
        }
        uint64_t v78 = v538->i64[1];
        if (v538[1].i64[0] == v78) {
          vImagePixelCount v79 = 0;
        }
        else {
          vImagePixelCount v79 = *(void *)(v78 + 8 * ((unint64_t)v538[2].i64[0] >> 12)) + (v538[2].i64[0] & 0xFFF);
        }
        v603.data = (void *)(v78 + 8 * ((unint64_t)v538[2].i64[0] >> 12));
        v603.uint64_t height = v79;
        std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(v47, v48, v55, v56, (uint64_t)&v603);
        uint64_t v80 = v538->i64[1];
        uint64_t v81 = v538[1].i64[0];
        uint64_t v82 = ((v81 - v80) << 9) - 1;
        if (v81 == v80) {
          uint64_t v82 = 0;
        }
        uint64_t v83 = v538[2].i64[1];
        unint64_t v84 = v538[2].i64[0] + v83;
        unint64_t v85 = v82 - v84;
        if (v51 - v83 <= v85)
        {
          uint64_t v86 = v538[2].i64[1];
        }
        else
        {
          std::deque<unsigned char>::__add_back_capacity(v538, v51 - v83 - v85);
          uint64_t v86 = v538[2].i64[1];
          uint64_t v80 = v538->i64[1];
          uint64_t v81 = v538[1].i64[0];
          unint64_t v84 = v538[2].i64[0] + v86;
        }
        uint64_t v87 = (void *)(v80 + 8 * (v84 >> 12));
        if (v81 == v80) {
          uint64_t v88 = 0;
        }
        else {
          uint64_t v88 = (unsigned char *)(*v87 + (v84 & 0xFFF));
        }
        uint64_t v89 = (uint64_t)v88;
        uint64_t v90 = v87;
        if (v51 != v83)
        {
          uint64_t v91 = (uint64_t)&v88[v51 - v83 - *v87];
          if (v91 < 1)
          {
            unint64_t v92 = 4095 - v91;
            LOWORD(v91) = ~(4095 - v91);
            uint64_t v90 = &v87[-(v92 >> 12)];
          }
          else
          {
            uint64_t v90 = &v87[(unint64_t)v91 >> 12];
          }
          uint64_t v89 = *v90 + (v91 & 0xFFF);
        }
        while (v88 != (unsigned char *)v89)
        {
          uint64_t v93 = v89;
          if (v87 != v90) {
            uint64_t v93 = *v87 + 4096;
          }
          if (v88 == (unsigned char *)v93)
          {
            uint64_t v93 = (uint64_t)v88;
          }
          else
          {
            v94 = v88;
            do
            {
              char v95 = *v56++;
              *v94++ = v95;
              if (&v56[-*v55] == (char *)4096)
              {
                BOOL v96 = (char *)v55[1];
                ++v55;
                long long v56 = v96;
              }
            }
            while (v94 != (unsigned char *)v93);
            uint64_t v86 = *v53;
          }
          v86 += v93 - (void)v88;
          *id v53 = v86;
          if (v87 == v90) {
            break;
          }
          id v97 = (unsigned char *)v87[1];
          ++v87;
          uint64_t v88 = v97;
        }
        goto LABEL_87;
      }
      long long v57 = (uint64_t *)v538;
    }
    uint64_t v58 = v57[1];
    long long v59 = (void *)(v58 + 8 * ((unint64_t)v57[4] >> 12));
    if (v57[2] == v58)
    {
      vImagePixelCount v60 = 0;
      if (v51)
      {
LABEL_38:
        uint64_t v61 = (uint64_t)&v48[v51 - *v47];
        if (v61 < 1)
        {
          unint64_t v64 = 4095 - v61;
          id v62 = &v47[-(v64 >> 12)];
          v63 = (char *)(*v62 + (~(_WORD)v64 & 0xFFF));
        }
        else
        {
          id v62 = &v47[(unint64_t)v61 >> 12];
          v63 = (char *)(*v62 + (v61 & 0xFFF));
        }
        goto LABEL_43;
      }
    }
    else
    {
      vImagePixelCount v60 = *v59 + (v57[4] & 0xFFF);
      if (v51) {
        goto LABEL_38;
      }
    }
    v63 = v48;
    id v62 = (uint64_t *)(*((void *)&v580 + 1) + 8 * ((unint64_t)v582 >> 12));
LABEL_43:
    v603.data = v59;
    v603.uint64_t height = v60;
    std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(v47, v48, v62, v63, (uint64_t)&v603);
    uint64_t v65 = v538[2].i64[0];
    uint64_t v66 = v538[2].i64[1];
    uint64_t v68 = v538->i64[1];
    uint64_t v67 = v538[1].i64[0];
    v69 = (char *)(v68 + 8 * ((unint64_t)(v65 + v66) >> 12));
    if (v67 == v68) {
      uint64_t v70 = 0;
    }
    else {
      uint64_t v70 = *(void *)v69 + (((_WORD)v65 + (_WORD)v66) & 0xFFF);
    }
    if (v70 != v603.height)
    {
      int64_t v71 = v70 + ((v69 - (char *)v603.data) << 9) - v603.height - *(void *)v69 + *(void *)v603.data;
      if (v71 >= 1)
      {
        uint64_t v72 = v67 == v68 ? 0 : ((v67 - v68) << 9) - 1;
        uint64_t v73 = v66 - v71;
        *id v53 = v73;
        if ((unint64_t)(v72 - v65 - v73) >= 0x2000)
        {
          do
          {
            operator delete(*(void **)(v67 - 8));
            char v74 = (uint64_t *)v538;
            uint64_t v75 = v538->i64[1];
            uint64_t v67 = v538[1].i64[0] - 8;
            v538[1].i64[0] = v67;
            if (v67 == v75) {
              uint64_t v76 = 0;
            }
            else {
              uint64_t v76 = ((v67 - v75) << 9) - 1;
            }
          }
          while ((unint64_t)(v76 - (v74[5] + v74[4])) >> 13);
        }
      }
    }
  }
LABEL_87:
  if (v529 | v20)
  {
    long long v574 = 0u;
    long long v575 = 0u;
    long long v573 = 0u;
    double v570 = 0.0;
    v571 = 0;
    uint64_t v572 = 0;
    id v569 = 0;
    -[CRNeuralTextDetectorV3 runNMSForDirection:adjustedSize:fullTileMaps:adjustedFullTileSize:targetSize:targetSizeFullTile:intermediateResults:withScaleIds:sourceImageSize:tileRects:isHorizontal:resultTextFeatures:quadFeatures:isFineScaleVerticalLinkActive:isFullTileVerticalLinkActive:idxLog:](a1, v527, v533, v532, &v573, v531, 0, &v569, (uint64_t *)&v570, v529 != 0, v20 != 0);
    id v98 = v569;
    id v528 = v530;
    id v534 = v98;
    uint64_t v99 = *(void *)&v570;
    if (v571 != *(long long **)&v570)
    {
      unint64_t v100 = 0;
      uint64_t v101 = 140;
      do
      {
        *(_DWORD *)(v99 + v101) += 1022611261 * ((unint64_t)((char *)v578 - (char *)v577) >> 3);
        float v102 = [v534 objectAtIndexedSubscript:v100];
        objc_msgSend(v102, "setFeatureID:", objc_msgSend(v102, "featureID")+ 1022611261 * ((unint64_t)((char *)v578 - (char *)v577) >> 3));

        ++v100;
        uint64_t v99 = *(void *)&v570;
        v101 += 168;
      }
      while (v100 < 0xCF3CF3CF3CF3CF3DLL * (((uint64_t)v571 - *(void *)&v570) >> 3));
    }
    uint64_t v540 = [v528 count];
    int v103 = [v534 count];
    LOBYTE(v603.data) = 1;
    std::vector<BOOL>::vector(&v587, (int)v540, (unsigned __int8 *)&v603);
    LOBYTE(v603.data) = 1;
    std::vector<BOOL>::vector(&v586, v103, (unsigned __int8 *)&v603);
    id v104 = v528;
    id v537 = v534;
    id v525 = v104;
    CRDetectorPostProcessV3::Graph::Graph((CRDetectorPostProcessV3::Graph *)&v584, [v537 count] + objc_msgSend(v104, "count"));
    long long v593 = 0u;
    long long v594 = 0u;
    memset(&v592, 0, sizeof(v592));
    id v544 = v104;
    uint64_t v105 = [v544 countByEnumeratingWithState:&v592 objects:&v603 count:16];
    if (v105)
    {
      int v543 = 0;
      uint64_t v535 = *(void *)v592.width;
      double v549 = 3.40282347e38;
      double v548 = 0.349999994;
      double v547 = 0.100000001;
      do
      {
        uint64_t v539 = 0;
        uint64_t v536 = v105;
        do
        {
          if (*(void *)v592.width != v535) {
            objc_enumerationMutation(v544);
          }
          CGRect v106 = *(void **)(v592.height + 8 * v539);
          long long v588 = 0u;
          long long v589 = 0u;
          long long v590 = 0u;
          long long v591 = 0u;
          id v545 = v537;
          uint64_t v107 = [v545 countByEnumeratingWithState:&v588 objects:v602 count:16];
          if (v107)
          {
            uint64_t v546 = 0;
            uint64_t v108 = *(void *)v589;
            do
            {
              for (uint64_t i = 0; i != v107; ++i)
              {
                if (*(void *)v589 != v108) {
                  objc_enumerationMutation(v545);
                }
                char v110 = *(void **)(*((void *)&v588 + 1) + 8 * i);
                id v111 = v106;
                id v112 = v110;
                -[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:](v111, &v583, &v599, 1u, v550, v551);
                -[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:](v112, &v598, &v597, 0, v550, v551);
                float64x2_t v113 = v583;
                float64x2_t v114 = v599;
                float64x2_t v115 = v598;
                float64x2_t v116 = v597;
                BOOL v117 = +[CRGeometryUtilities checkIntersectionForLineThroughPoint:&v596 andPoint:*(_OWORD *)&v583 andSegmentStartingAt:*(_OWORD *)&v599 andEndingAt:*(_OWORD *)&v598 intersectAt:*(_OWORD *)&v597];
                LODWORD(v110) = +[CRGeometryUtilities checkIntersectionForLineThroughPoint:&v595 andPoint:*(_OWORD *)&v115 andSegmentStartingAt:*(_OWORD *)&v116 andEndingAt:*(_OWORD *)&v113 intersectAt:*(_OWORD *)&v114];

                id v118 = v111;
                id v119 = v112;
                [v118 topLeft];
                double v560 = v120;
                [v118 bottomLeft];
                double v559 = v121;
                [v118 topLeft];
                *(double *)&v558 = v122;
                [v118 bottomLeft];
                double v557 = v123;
                [v118 topRight];
                double v556 = v124;
                [v118 bottomRight];
                double v555 = v125;
                [v118 topRight];
                double v554 = v126;
                [v118 bottomRight];
                double v128 = v127;
                [v119 topLeft];
                double v130 = v129;
                [v119 bottomLeft];
                double v132 = v131;
                [v119 topLeft];
                double v134 = v133;
                [v119 bottomLeft];
                double v136 = v135;
                [v119 topRight];
                double v138 = v137;
                [v119 bottomRight];
                double v140 = v139;
                [v119 topRight];
                double v142 = v141;
                [v119 bottomRight];
                unsigned int v144 = v117 & v110;
                double v145 = (v560 + v559) * 0.5;
                *(double *)&v146 = (*(double *)&v558 + v557) * 0.5;
                double v147 = (v556 + v555) * 0.5;
                double v148 = (v130 + v132) * 0.5;
                double v149 = (v138 + v140) * 0.5;
                double v559 = v147;
                double v560 = (v554 + v128) * 0.5;
                double v557 = v145;
                v558 = v146;
                double v150 = (v560 - *(double *)&v146) / (v147 - v145);
                if (v145 == v147) {
                  double v150 = v549;
                }
                double v552 = v150;
                double v553 = (v130 + v132) * 0.5;
                double v555 = (v138 + v140) * 0.5;
                double v556 = (v142 + v143) * 0.5;
                double v554 = (v134 + v136) * 0.5;
                if (v148 == v149) {
                  double v151 = v549;
                }
                else {
                  double v151 = ((v142 + v143) * 0.5 - (v134 + v136) * 0.5) / (v149 - v148);
                }
                [v118 topLeft];
                double v153 = v152;
                [v118 bottomLeft];
                double v155 = v154;
                [v118 topLeft];
                double v157 = v156;
                [v118 bottomLeft];
                double v159 = v158;
                [v119 topLeft];
                double v161 = v160;
                [v119 bottomLeft];
                double v163 = v162;
                [v119 topLeft];
                double v165 = v164;
                [v119 bottomLeft];
                double v166 = vabdd_f64(v552, v151);
                float v167 = v153 - v155;
                float v168 = v157 - v159;
                float v169 = (float)(v167 * v167) + (float)(v168 * v168);
                float v170 = v161 - v163;
                *(float *)&double v171 = v165 - v171;
                double v172 = fminf(v169, (float)(v170 * v170) + (float)(*(float *)&v171 * *(float *)&v171)) * v548 * v548;
                float v173 = v557 - v553;
                float v174 = *(double *)&v558 - v554;
                BOOL v175 = v172 >= (float)((float)(v173 * v173) + (float)(v174 * v174));
                float v176 = v559 - v555;
                float v177 = v560 - v556;
                if (v172 < (float)((float)(v176 * v176) + (float)(v177 * v177))) {
                  BOOL v175 = 0;
                }
                BOOL v178 = v166 < v547 && v175;

                if ((v144 | v178) == 1) {
                  CRDetectorPostProcessV3::Graph::addEdge((CRDetectorPostProcessV3::Graph *)&v584, v543, v546 + i + [v544 count]);
                }
              }
              uint64_t v107 = [v545 countByEnumeratingWithState:&v588 objects:v602 count:16];
              uint64_t v546 = (v546 + i);
            }
            while (v107);
          }

          ++v543;
          ++v539;
        }
        while (v539 != v536);
        uint64_t v105 = [v544 countByEnumeratingWithState:&v592 objects:&v603 count:16];
      }
      while (v105);
    }

    CRDetectorPostProcessV3::Graph::connectedComponents((CRDetectorPostProcessV3::Graph *)&v584, (uint64_t *)&v583);
    float64_t v179 = v583.f64[0];
    if (*(void *)&v583.f64[1] != *(void *)&v583.f64[0])
    {
      for (unint64_t j = 0; 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v583.f64[1] - *(void *)&v179) >> 3) > j; ++j)
      {
        v182 = *(int **)(*(void *)&v179 + 24 * j);
        v181 = *(int **)(*(void *)&v179 + 24 * j + 8);
        uint64_t v183 = (char *)v181 - (char *)v182;
        if (v181 == v182)
        {
          unint64_t v188 = v183 >> 2;
          float v186 = 0.0;
          float v185 = 0.0;
          if (v183 >> 2) {
            goto LABEL_128;
          }
        }
        else
        {
          unint64_t v184 = 0;
          float v185 = 0.0;
          v181 = *(int **)(*(void *)&v179 + 24 * j);
          float v186 = 0.0;
          do
          {
            unint64_t v187 = v181[v184];
            if ([v544 count] <= v187) {
              float v185 = v185
            }
                   + *(double *)(*(void *)&v570 + 168 * ((int)v187 - (int)v540) + 112)
                   * *(double *)(*(void *)&v570 + 168 * ((int)v187 - (int)v540) + 120)
                   * *(double *)(*(void *)&v570 + 168 * ((int)v187 - (int)v540) + 128);
            else {
              float v186 = v186 + v577[21 * (int)v187 + 14] * v577[21 * (int)v187 + 15] * v577[21 * (int)v187 + 16];
            }
            ++v184;
            float64_t v179 = v583.f64[0];
            v181 = *(int **)(*(void *)&v583.f64[0] + 24 * j);
            unint64_t v188 = (uint64_t)(*(void *)(*(void *)&v583.f64[0] + 24 * j + 8) - (void)v181) >> 2;
          }
          while (v188 > v184);
          if (v188)
          {
LABEL_128:
            v189 = v587;
            v190 = v586;
            do
            {
              unint64_t v192 = *v181++;
              unint64_t v191 = v192;
              if ((int)v192 < (int)v540 && v186 < v185) {
                *(void *)&v189[(v191 >> 3) & 0x1FFFFFFFFFFFFFF8] &= ~(1 << v191);
              }
              BOOL v194 = (int)v191 < (int)v540 || v185 > v186;
              if (!v194) {
                *(void *)&v190[((unint64_t)((int)v191 - (int)v540) >> 3) & 0x1FFFFFFFFFFFFFF8] &= ~(1 << (v191 - v540));
              }
              --v188;
            }
            while (v188);
          }
        }
      }
    }
    id v195 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v196 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v593 = 0u;
    long long v594 = 0u;
    memset(&v592, 0, sizeof(v592));
    id v197 = v544;
    uint64_t v198 = [v197 countByEnumeratingWithState:&v592 objects:&v603 count:16];
    if (v198)
    {
      int v199 = 0;
      uint64_t v200 = *(void *)v592.width;
      do
      {
        uint64_t v201 = 0;
        uint64_t v202 = v199;
        v199 += v198;
        do
        {
          if (*(void *)v592.width != v200) {
            objc_enumerationMutation(v197);
          }
          if ((*(void *)&v587[((unint64_t)(v202 + v201) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v202 + v201))) {
            v203 = v195;
          }
          else {
            v203 = v196;
          }
          [v203 addObject:*(void *)(v592.height + 8 * v201++)];
        }
        while (v198 != v201);
        uint64_t v198 = [v197 countByEnumeratingWithState:&v592 objects:&v603 count:16];
      }
      while (v198);
    }

    long long v590 = 0u;
    long long v591 = 0u;
    long long v588 = 0u;
    long long v589 = 0u;
    id v204 = v537;
    uint64_t v205 = [v204 countByEnumeratingWithState:&v588 objects:v602 count:16];
    if (v205)
    {
      int v206 = 0;
      uint64_t v207 = *(void *)v589;
      do
      {
        uint64_t v208 = 0;
        uint64_t v209 = v206;
        v206 += v205;
        do
        {
          if (*(void *)v589 != v207) {
            objc_enumerationMutation(v204);
          }
          if ((*(void *)&v586[((unint64_t)(v209 + v208) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v209 + v208))) {
            v210 = v195;
          }
          else {
            v210 = v196;
          }
          [v210 addObject:*(void *)(*((void *)&v588 + 1) + 8 * v208++)];
        }
        while (v205 != v208);
        uint64_t v205 = [v204 countByEnumeratingWithState:&v588 objects:v602 count:16];
      }
      while (v205);
    }

    if ([v196 count])
    {
      id v211 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v212 = v533;
      if ((_BYTE)v529) {
        v212 = v527;
      }
      CRDetectorPostProcessV3::getSplitComponents(v195, v196, (const CRImageBuffer *)*v212, v211);
    }

    *(void *)&v599.f64[0] = &v583;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v599);
    *(void *)&v583.f64[0] = &v585;
    std::vector<std::list<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v583);
    if (v586) {
      operator delete(v586);
    }
    if (v587) {
      operator delete(v587);
    }

    uint64_t v213 = *(void *)&v570;
    v214 = v571;
    if ((uint64_t)v571 - *(void *)&v570 < 1) {
      goto LABEL_222;
    }
    uint64_t v215 = ((uint64_t)v571 - *(void *)&v570) / 168;
    unint64_t v216 = (unint64_t)v578;
    if ((uint64_t)(0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(rowBytes - (void)v578) >> 3)) < v215)
    {
      unint64_t v217 = 0xCF3CF3CF3CF3CF3DLL * (((char *)v578 - (char *)v577) >> 3);
      unint64_t v218 = v217 + v215;
      if (v217 + v215 > 0x186186186186186) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      if (0x9E79E79E79E79E7ALL * ((uint64_t)(rowBytes - (void)v577) >> 3) > v218) {
        unint64_t v218 = 0x9E79E79E79E79E7ALL * ((uint64_t)(rowBytes - (void)v577) >> 3);
      }
      if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(rowBytes - (void)v577) >> 3) >= 0xC30C30C30C30C3) {
        unint64_t v219 = 0x186186186186186;
      }
      else {
        unint64_t v219 = v218;
      }
      v604 = &rowBytes;
      if (v219) {
        v220 = std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>((uint64_t)&rowBytes, v219);
      }
      else {
        v220 = 0;
      }
      vImagePixelCount v262 = (vImagePixelCount)v220 + 168 * v217;
      v603.data = v220;
      v603.uint64_t height = v262;
      v603.uint64_t width = v262;
      v603.size_t rowBytes = (size_t)v220 + 168 * v219;
      uint64_t v263 = 168 * v215;
      vImagePixelCount v264 = v262 + 168 * v215;
      do
      {
        std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::construct[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuadFeature,CRDetectorUtils::CRTextDetectorQuadFeature&>(v262, (long long *)v213);
        v262 += 168;
        v213 += 168;
        v263 -= 168;
      }
      while (v263);
      v603.uint64_t width = v264;
      std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>,std::reverse_iterator<CRDetectorUtils::CRTextDetectorQuadFeature*>,std::reverse_iterator<CRDetectorUtils::CRTextDetectorQuadFeature*>,std::reverse_iterator<CRDetectorUtils::CRTextDetectorQuadFeature*>>((uint64_t)&rowBytes, v216, v216, (uint64_t)v577, (uint64_t)v577, v603.height, v603.height);
      vImagePixelCount v266 = (vImagePixelCount)v578;
      vImagePixelCount v267 = v603.width;
      if (v578 == (void ***)v216)
      {
        vImagePixelCount v266 = v216;
      }
      else
      {
        do
        {
          long long v268 = *(_OWORD *)v216;
          long long v269 = *(_OWORD *)(v216 + 16);
          long long v270 = *(_OWORD *)(v216 + 48);
          *(_OWORD *)(v267 + 32) = *(_OWORD *)(v216 + 32);
          *(_OWORD *)(v267 + 48) = v270;
          *(_OWORD *)vImagePixelCount v267 = v268;
          *(_OWORD *)(v267 + 16) = v269;
          *(void *)(v267 + 72) = 0;
          *(void *)(v267 + 80) = 0;
          *(void *)(v267 + 64) = 0;
          *(_OWORD *)(v267 + 64) = *(_OWORD *)(v216 + 64);
          *(void *)(v267 + 80) = *(void *)(v216 + 80);
          *(void *)(v216 + 64) = 0;
          *(void *)(v216 + 72) = 0;
          *(void *)(v216 + 80) = 0;
          long long v271 = *(_OWORD *)(v216 + 88);
          long long v272 = *(_OWORD *)(v216 + 104);
          uint64_t v273 = *(void *)(v216 + 136);
          *(_OWORD *)(v267 + 120) = *(_OWORD *)(v216 + 120);
          *(_OWORD *)(v267 + 104) = v272;
          *(_OWORD *)(v267 + 88) = v271;
          *(void *)(v267 + 136) = v273;
          *(void *)(v267 + 144) = 0;
          *(void *)(v267 + 152) = 0;
          *(void *)(v267 + 160) = 0;
          *(_OWORD *)(v267 + 144) = *(_OWORD *)(v216 + 144);
          *(void *)(v267 + 160) = *(void *)(v216 + 160);
          *(void *)(v216 + 144) = 0;
          *(void *)(v216 + 152) = 0;
          *(void *)(v216 + 160) = 0;
          v267 += 168;
          v216 += 168;
        }
        while (v216 != v266);
      }
      v274 = v577;
      size_t v275 = rowBytes;
      v577 = v265;
      v578 = (void ***)v267;
      size_t rowBytes = v603.rowBytes;
      v603.uint64_t width = v266;
      v603.size_t rowBytes = v275;
      v603.uint64_t height = (vImagePixelCount)v274;
      v603.data = v274;
      std::__split_buffer<CRDetectorUtils::CRTextDetectorQuadFeature>::~__split_buffer(&v603.data);
      goto LABEL_222;
    }
    if (v215 > 0)
    {
      v602[0] = v578;
      v592.data = v578;
      v221 = *(long long **)&v570;
      v603.data = &rowBytes;
      v603.uint64_t height = (vImagePixelCount)&v592;
      v603.uint64_t width = (vImagePixelCount)v602;
      LOBYTE(v603.rowBytes) = 0;
      v222 = v578;
      if (*(long long **)&v570 != v571)
      {
        double v559 = v570;
        do
        {
          std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::construct[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuadFeature,CRDetectorUtils::CRTextDetectorQuadFeature&>((uint64_t)v222, v221);
          v221 = (long long *)((char *)v221 + 168);
          v222 = v602[0] + 21;
          v602[0] += 21;
        }
        while (v221 != v214);
      }
      v578 = v222;
      goto LABEL_222;
    }
    *(void *)&double v559 = *(void *)&v570 + 168 * v215;
    v223 = &v578[21 * v215];
    v224 = &v578[-21 * v215];
    v225 = v578;
    if (v224 < v578)
    {
      v226 = &v578[-21 * v215];
      v225 = v578;
      do
      {
        long long v227 = *(_OWORD *)v226;
        long long v228 = *((_OWORD *)v226 + 1);
        long long v229 = *((_OWORD *)v226 + 3);
        *((_OWORD *)v225 + 2) = *((_OWORD *)v226 + 2);
        *((_OWORD *)v225 + 3) = v229;
        *(_OWORD *)v225 = v227;
        *((_OWORD *)v225 + 1) = v228;
        v225[9] = 0;
        v225[10] = 0;
        v225[8] = 0;
        *((_OWORD *)v225 + 4) = *((_OWORD *)v226 + 4);
        v225[10] = v226[10];
        v226[8] = 0;
        v226[9] = 0;
        v226[10] = 0;
        long long v230 = *(_OWORD *)(v226 + 11);
        long long v231 = *(_OWORD *)(v226 + 13);
        v232 = v226[17];
        *(_OWORD *)(v225 + 15) = *(_OWORD *)(v226 + 15);
        *(_OWORD *)(v225 + 13) = v231;
        *(_OWORD *)(v225 + 11) = v230;
        v225[17] = v232;
        v225[18] = 0;
        v225[19] = 0;
        v225[20] = 0;
        *((_OWORD *)v225 + 9) = *((_OWORD *)v226 + 9);
        v225[20] = v226[20];
        v226[18] = 0;
        v226[19] = 0;
        v226[20] = 0;
        v225 += 21;
        v226 += 21;
      }
      while ((unint64_t)v226 < v216);
    }
    v578 = v225;
    if ((void ***)v216 != v223)
    {
      unint64_t v233 = 0;
      *(void *)&double v560 = -8 * ((uint64_t)(v216 - (void)v223) >> 3);
      do
      {
        v234 = &v224[v233 / 8];
        unint64_t v235 = v216 + v233;
        long long v236 = *(_OWORD *)&v224[v233 / 8 - 21];
        long long v237 = *(_OWORD *)&v224[v233 / 8 - 19];
        long long v238 = *(_OWORD *)&v224[v233 / 8 - 17];
        *(_OWORD *)(v235 - 120) = *(_OWORD *)&v224[v233 / 8 - 15];
        *(_OWORD *)(v235 - 136) = v238;
        *(_OWORD *)(v235 - 152) = v237;
        *(_OWORD *)(v235 - 168) = v236;
        std::vector<int>::__move_assign(v216 + v233 - 104, (__n128 *)&v224[v233 / 8 - 13]);
        long long v239 = *(_OWORD *)&v224[v233 / 8 - 10];
        long long v240 = *(_OWORD *)&v224[v233 / 8 - 8];
        long long v241 = *(_OWORD *)&v224[v233 / 8 - 6];
        *(void *)(v235 - 32) = v224[v233 / 8 - 4];
        *(_OWORD *)(v235 - 64) = v240;
        *(_OWORD *)(v235 - 48) = v241;
        *(_OWORD *)(v235 - 80) = v239;
        std::vector<CRDetectorUtils::CRTextDetectorQuad>::__vdeallocate((uint64_t *)(v216 + v233 - 24));
        *(_OWORD *)(v235 - 24) = *(_OWORD *)&v224[v233 / 8 - 3];
        *(void *)(v235 - 8) = v224[v233 / 8 - 1];
        *(v234 - 3) = 0;
        *(v234 - 2) = 0;
        *(v234 - 1) = 0;
        v233 -= 168;
      }
      while (*(void *)&v560 != v233);
    }
    double v242 = v559;
    if (*(void *)&v559 == v213)
    {
LABEL_222:
      unint64_t v277 = v538[2].u64[0];
      uint64_t v276 = v538[2].i64[1];
      unint64_t v278 = v277 + v276;
      unint64_t v279 = (v277 + v276) >> 12;
      uint64_t v280 = v538->i64[1];
      uint64_t v281 = v538[1].i64[0];
      v282 = (char *)(v280 + 8 * v279);
      if (v281 == v280) {
        unint64_t v283 = 0;
      }
      else {
        unint64_t v283 = *(void *)v282 + (v278 & 0xFFF);
      }
      unint64_t v284 = *((void *)&v573 + 1) + 8 * ((unint64_t)v575 >> 12);
      if ((void)v574 == *((void *)&v573 + 1))
      {
        double v285 = 0.0;
        *(double *)&uint64_t v286 = 0.0;
        *(void *)&double v559 = *((void *)&v573 + 1) + 8 * ((*((void *)&v575 + 1) + (void)v575) >> 12);
      }
      else
      {
        *(void *)&double v285 = *(void *)v284 + (v575 & 0xFFF);
        *(void *)&double v559 = *((void *)&v573 + 1) + 8 * ((*((void *)&v575 + 1) + (void)v575) >> 12);
        uint64_t v286 = **(void **)&v559 + ((*((void *)&v575 + 1) + v575) & 0xFFF);
      }
      double v560 = *(double *)&v286;
      if (v286 == *(void *)&v285) {
        double v287 = 0.0;
      }
      else {
        *(void *)&double v287 = v286
      }
                         + ((*(void *)&v559 - v284) << 9)
                         - (*(void *)&v285
                          + **(void **)&v559)
                         + *(void *)v284;
      unint64_t v288 = v277 >> 12;
      v289 = (char *)(v280 + 8 * (v277 >> 12));
      uint64_t v290 = v281 - v280;
      if (v281 == v280) {
        unint64_t v291 = 0;
      }
      else {
        unint64_t v291 = *(void *)v289 + (v277 & 0xFFF);
      }
      if (v283 == v291) {
        double v292 = 0.0;
      }
      else {
        *(void *)&double v292 = v283 + ((v282 - v289) << 9) - v291 - *(void *)v282 + *(void *)v289;
      }
      *(double *)&v558 = v292;
      if (*(void *)&v292 < (unint64_t)(v276 - *(void *)&v292))
      {
        unint64_t v293 = *(void *)&v287 - v277;
        if (*(void *)&v287 > v277)
        {
          uint64_t v294 = (v290 << 9) - 1;
          uint64_t v295 = v281 - v280;
          if (v281 == v280)
          {
            uint64_t v294 = 0;
            ++v293;
          }
          if ((v293 & 0xFFF) != 0) {
            unint64_t v296 = (v293 >> 12) + 1;
          }
          else {
            unint64_t v296 = v293 >> 12;
          }
          unint64_t v297 = v294 - v278;
          if (v296 >= v297 >> 12) {
            unint64_t v298 = v297 >> 12;
          }
          else {
            unint64_t v298 = v296;
          }
          if (v296 <= v297 >> 12)
          {
            for (v538[2].i64[0] = v277 + (v298 << 12); v298; --v298)
            {
              v315 = (uint64_t *)v538;
              uint64_t v316 = v538[1].i64[0];
              v603.data = *(void **)(v316 - 8);
              v538[1].i64[0] = v316 - 8;
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)v315, &v603);
            }
          }
          else
          {
            unint64_t v299 = v296 - v298;
            uint64_t v300 = v538[1].i64[1] - v538->i64[0];
            if (v296 - v298 <= (v300 >> 3) - (v295 >> 3))
            {
              if (v299)
              {
                if (v280 == v538->i64[0])
                {
LABEL_281:
                  unint64_t v321 = v299;
                  do
                  {
                    v603.data = operator new(0x1000uLL);
                    std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_back(v538, &v603);
                    --v321;
                  }
                  while (v321);
                  v298 += v299;
                  v318 = (uint64_t *)v538;
                  unint64_t v277 = v538[2].u64[0];
                }
                else
                {
                  v318 = (uint64_t *)v538;
                  while (1)
                  {
                    v603.data = operator new(0x1000uLL);
                    std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)v318, &v603);
                    uint64_t v319 = v318[1];
                    uint64_t v320 = v318[2] - v319 == 8 ? 4095 : 4096;
                    unint64_t v277 = v320 + v318[4];
                    v318[4] = v277;
                    if (!--v299) {
                      break;
                    }
                    if (v319 == *v318) {
                      goto LABEL_281;
                    }
                  }
                }
              }
              else
              {
                v318 = (uint64_t *)v538;
              }
              for (v318[4] = v277 + (v298 << 12); v298; --v298)
              {
                v431 = (uint64_t *)v538;
                uint64_t v432 = v538[1].i64[0];
                v603.data = *(void **)(v432 - 8);
                v538[1].i64[0] = v432 - 8;
                std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)v431, &v603);
              }
            }
            else
            {
              BOOL v301 = v281 == v280;
              unint64_t v302 = v299 + (v295 >> 3);
              if (v300 >> 2 <= v302) {
                unint64_t v303 = v302;
              }
              else {
                unint64_t v303 = v300 >> 2;
              }
              v604 = &v538[1].u64[1];
              if (v303) {
                v304 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v538[1].i64[1], v303);
              }
              else {
                v304 = 0;
              }
              *(void *)&double v555 = (v296 << 12) - v301;
              v603.data = v304;
              v603.uint64_t height = (vImagePixelCount)v304;
              v603.uint64_t width = (vImagePixelCount)v304;
              v603.size_t rowBytes = (size_t)v304 + 8 * v303;
              do
              {
                v602[0] = (void ***)operator new(0x1000uLL);
                std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *> &>::push_back(&v603, v602);
                --v299;
              }
              while (v299);
              double v557 = *(double *)&v284;
              vImagePixelCount v394 = v538[1].u64[0];
              for (k = (char *)v603.width; v298; --v298)
              {
                if (k == (char *)v603.rowBytes)
                {
                  int64_t v396 = v603.height - (unint64_t)v603.data;
                  if ((void *)v603.height <= v603.data)
                  {
                    if (k == v603.data) {
                      unint64_t v403 = 1;
                    }
                    else {
                      unint64_t v403 = (k - (char *)v603.data) >> 2;
                    }
                    v404 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v604, v403);
                    v406 = (uint64_t *)v603.height;
                    k = &v404[8 * (v403 >> 2)];
                    int64_t v407 = v603.width - v603.height;
                    if (v603.width != v603.height)
                    {
                      k = &v404[8 * (v403 >> 2) + (v407 & 0xFFFFFFFFFFFFFFF8)];
                      uint64_t v408 = 8 * (v407 >> 3);
                      v409 = &v404[8 * (v403 >> 2)];
                      do
                      {
                        uint64_t v410 = *v406++;
                        *(void *)v409 = v410;
                        v409 += 8;
                        v408 -= 8;
                      }
                      while (v408);
                    }
                    v411 = v603.data;
                    v603.data = v404;
                    v603.uint64_t height = (vImagePixelCount)&v404[8 * (v403 >> 2)];
                    v603.uint64_t width = (vImagePixelCount)k;
                    v603.size_t rowBytes = (size_t)&v404[8 * v405];
                    if (v411)
                    {
                      operator delete(v411);
                      k = (char *)v603.width;
                    }
                  }
                  else
                  {
                    uint64_t v397 = v396 >> 3;
                    BOOL v194 = v396 >> 3 < -1;
                    uint64_t v398 = (v396 >> 3) + 2;
                    if (v194) {
                      uint64_t v399 = v398;
                    }
                    else {
                      uint64_t v399 = v397 + 1;
                    }
                    vImagePixelCount v400 = v603.height - 8 * (v399 >> 1);
                    v401 = &k[-v603.height];
                    if (k != (char *)v603.height)
                    {
                      memmove((void *)(v603.height - 8 * (v399 >> 1)), (const void *)v603.height, (size_t)&k[-v603.height]);
                      k = (char *)v603.height;
                    }
                    vImagePixelCount v402 = (vImagePixelCount)&k[-8 * (v399 >> 1)];
                    k = &v401[v400];
                    v603.uint64_t width = (vImagePixelCount)&v401[v400];
                    v603.uint64_t height = v402;
                  }
                }
                *(void *)k = *(void *)(v394 - 8);
                k = (char *)(v603.width + 8);
                v603.width += 8;
                vImagePixelCount v394 = v538[1].i64[0] - 8;
                v538[1].i64[0] = v394;
              }
              v412 = (uint64_t *)v538->i64[1];
              if (v412 == (uint64_t *)v394)
              {
                v412 = (uint64_t *)v394;
                v430 = (uint64_t *)v538;
              }
              else
              {
                do
                {
                  if (k == (char *)v603.rowBytes)
                  {
                    int64_t v413 = v603.height - (unint64_t)v603.data;
                    if ((void *)v603.height <= v603.data)
                    {
                      if (k == v603.data) {
                        unint64_t v420 = 1;
                      }
                      else {
                        unint64_t v420 = (k - (char *)v603.data) >> 2;
                      }
                      v421 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v604, v420);
                      v423 = (uint64_t *)v603.height;
                      k = &v421[8 * (v420 >> 2)];
                      int64_t v424 = v603.width - v603.height;
                      if (v603.width != v603.height)
                      {
                        k = &v421[8 * (v420 >> 2) + (v424 & 0xFFFFFFFFFFFFFFF8)];
                        uint64_t v425 = 8 * (v424 >> 3);
                        v426 = &v421[8 * (v420 >> 2)];
                        do
                        {
                          uint64_t v427 = *v423++;
                          *(void *)v426 = v427;
                          v426 += 8;
                          v425 -= 8;
                        }
                        while (v425);
                      }
                      v428 = v603.data;
                      v603.data = v421;
                      v603.uint64_t height = (vImagePixelCount)&v421[8 * (v420 >> 2)];
                      v603.uint64_t width = (vImagePixelCount)k;
                      v603.size_t rowBytes = (size_t)&v421[8 * v422];
                      if (v428)
                      {
                        operator delete(v428);
                        k = (char *)v603.width;
                      }
                    }
                    else
                    {
                      uint64_t v414 = v413 >> 3;
                      BOOL v194 = v413 >> 3 < -1;
                      uint64_t v415 = (v413 >> 3) + 2;
                      if (v194) {
                        uint64_t v416 = v415;
                      }
                      else {
                        uint64_t v416 = v414 + 1;
                      }
                      vImagePixelCount v417 = v603.height - 8 * (v416 >> 1);
                      v418 = &k[-v603.height];
                      if (k != (char *)v603.height)
                      {
                        memmove((void *)(v603.height - 8 * (v416 >> 1)), (const void *)v603.height, (size_t)&k[-v603.height]);
                        k = (char *)v603.height;
                      }
                      vImagePixelCount v419 = (vImagePixelCount)&k[-8 * (v416 >> 1)];
                      k = &v418[v417];
                      v603.uint64_t width = (vImagePixelCount)&v418[v417];
                      v603.uint64_t height = v419;
                    }
                  }
                  uint64_t v429 = *v412++;
                  *(void *)k = v429;
                  k = (char *)(v603.width + 8);
                  v603.width += 8;
                }
                while (v412 != (uint64_t *)v538[1].i64[0]);
                v430 = (uint64_t *)v538;
                vImagePixelCount v394 = v538->u64[1];
              }
              size_t v433 = v603.rowBytes;
              size_t v434 = v430[3];
              uint64_t v435 = v430[4];
              v430[2] = (uint64_t)k;
              v430[3] = v433;
              v436 = (void *)*v430;
              *(_OWORD *)v430 = *(_OWORD *)&v603.data;
              v603.data = v436;
              v603.uint64_t height = v394;
              v603.uint64_t width = (vImagePixelCount)v412;
              v603.size_t rowBytes = v434;
              v430[4] = *(void *)&v555 + v435;
              if (v412 != (uint64_t *)v394) {
                v603.uint64_t width = (vImagePixelCount)v412 + ((v394 - (void)v412 + 7) & 0xFFFFFFFFFFFFFFF8);
              }
              if (v436) {
                operator delete(v436);
              }
              *(double *)&unint64_t v284 = v557;
            }
          }
          unint64_t v277 = v538[2].u64[0];
          uint64_t v280 = v538->i64[1];
          uint64_t v281 = v538[1].i64[0];
          unint64_t v288 = v277 >> 12;
        }
        v437 = (void *)(v280 + 8 * v288);
        double v438 = *(double *)&v558;
        if (v281 == v280) {
          vImagePixelCount v439 = 0;
        }
        else {
          vImagePixelCount v439 = *v437 + (v277 & 0xFFF);
        }
        if (*(void *)&v287 > (unint64_t)v558)
        {
          if ((unint64_t)v558 >= *(void *)&v287 >> 1)
          {
            uint64_t v444 = *(void *)&v285 - *(void *)v284 + *(void *)&v287 - (void)v558;
            if (v444 < 1)
            {
              unint64_t v445 = 4095 - v444;
              v284 -= 8 * (v445 >> 12);
              uint64_t v440 = *(void *)v284 + (~(_WORD)v445 & 0xFFF);
            }
            else
            {
              v284 += 8 * ((unint64_t)v444 >> 12);
              uint64_t v440 = *(void *)v284 + (v444 & 0xFFF);
            }
          }
          else
          {
            *(double *)&uint64_t v440 = v560;
            if (*(double *)&v558 == 0.0)
            {
              *(double *)&unint64_t v284 = v559;
            }
            else
            {
              uint64_t v441 = *(void *)&v560 - (void)v558 - **(void **)&v559;
              if (v441 < 1)
              {
                unint64_t v446 = 4095 - v441;
                unint64_t v284 = *(void *)&v559 - 8 * (v446 >> 12);
                uint64_t v440 = *(void *)v284 + (~(_WORD)v446 & 0xFFF);
              }
              else
              {
                unint64_t v284 = *(void *)&v559 + 8 * ((unint64_t)v441 >> 12);
                uint64_t v440 = *(void *)v284 + (v441 & 0xFFF);
              }
              double v438 = *(double *)&v558;
            }
          }
          if (v440 == *(void *)&v285)
          {
            vImagePixelCount v442 = v439;
            v443 = v437;
            double v287 = v438;
          }
          else
          {
            v447 = (void *)v284;
            uint64_t v448 = v440;
            v443 = v437;
            vImagePixelCount v442 = v439;
            do
            {
              if (v442 == *v443)
              {
                uint64_t v449 = *--v443;
                vImagePixelCount v442 = v449 + 4096;
              }
              if (v448 == *v447)
              {
                uint64_t v450 = *--v447;
                uint64_t v448 = v450 + 4096;
              }
              char v451 = *(unsigned char *)--v448;
              *(unsigned char *)--vImagePixelCount v442 = v451;
              v538[2] = vaddq_s64(v538[2], (int64x2_t)xmmword_1DD8CEB60);
            }
            while (v448 != *(void *)&v285);
            double v287 = *(double *)&v558;
          }
          double v285 = *(double *)&v440;
          if (v287 == 0.0) {
            goto LABEL_529;
          }
          goto LABEL_480;
        }
        vImagePixelCount v442 = v439;
        v443 = v437;
        if (v287 != 0.0)
        {
LABEL_480:
          uint64_t v452 = v439 - *v437 + *(void *)&v287;
          if (v452 < 1)
          {
            unint64_t v455 = 4095 - v452;
            v453 = &v437[-(v455 >> 12)];
            v454 = (unsigned char *)(*v453 + (~(_WORD)v455 & 0xFFF));
          }
          else
          {
            v453 = &v437[(unint64_t)v452 >> 12];
            v454 = (unsigned char *)(*v453 + (v452 & 0xFFF));
          }
          if (v454 != (unsigned char *)v439)
          {
            v456 = v453;
            v457 = v454;
            do
            {
              if (v442 == *v443)
              {
                uint64_t v458 = *--v443;
                vImagePixelCount v442 = v458 + 4096;
              }
              if (v457 == (unsigned char *)*v456)
              {
                uint64_t v459 = *--v456;
                v457 = (unsigned char *)(v459 + 4096);
              }
              char v460 = *--v457;
              *(unsigned char *)--vImagePixelCount v442 = v460;
              v538[2] = vaddq_s64(v538[2], (int64x2_t)xmmword_1DD8CEB60);
            }
            while (v457 != (unsigned char *)v439);
          }
          if (*(void *)&v287 >= (unint64_t)v558)
          {
            double v462 = v560;
          }
          else
          {
            uint64_t v461 = (uint64_t)v558 + v439 - *v437;
            double v462 = v560;
            double v556 = v285;
            double v557 = *(double *)&v284;
            if (v461 < 1)
            {
              unint64_t v465 = 4095 - v461;
              *(void *)&double v463 = &v437[-(v465 >> 12)];
              *(void *)&double v464 = **(void **)&v463 + (~(_WORD)v465 & 0xFFF);
            }
            else
            {
              *(void *)&double v463 = &v437[(unint64_t)v461 >> 12];
              *(void *)&double v464 = **(void **)&v463 + (v461 & 0xFFF);
            }
            v603.data = v437;
            v603.uint64_t height = v439;
            v602[0] = (void ***)&v603;
            if (v453 != *(void **)&v463)
            {
              double v555 = v464;
              uint64_t v467 = *v453;
              v466 = v453 + 1;
              std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v602, v454, (unsigned char *)(v467 + 4096));
              if (v466 != *(uint64_t **)&v463)
              {
                v468 = (void **)v603.data;
                v469 = (char *)v603.height;
                *(double *)&v558 = v463;
                do
                {
                  uint64_t v470 = 0;
                  uint64_t v471 = *v466;
                  v473 = (char *)*v468++;
                  v472 = v473;
                  while (1)
                  {
                    uint64_t v474 = v472 - v469 + 4096;
                    if (4096 - v470 >= v474) {
                      size_t v475 = v474;
                    }
                    else {
                      size_t v475 = 4096 - v470;
                    }
                    if (v475) {
                      memmove(v469, (const void *)(v471 + v470), v475);
                    }
                    v470 += v475;
                    if (v470 == 4096) {
                      break;
                    }
                    v476 = (char *)*v468++;
                    v472 = v476;
                    v469 = v476;
                  }
                  v469 += v475;
                  if ((char *)*(v468 - 1) + 4096 == v469) {
                    v469 = (char *)*v468;
                  }
                  else {
                    --v468;
                  }
                  double v462 = v560;
                  double v463 = *(double *)&v558;
                  v603.data = v468;
                  v603.uint64_t height = (vImagePixelCount)v469;
                  ++v466;
                }
                while (v466 != v558);
              }
              v454 = **(unsigned char ***)&v463;
              double v464 = v555;
            }
            std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v602, v454, *(unsigned char **)&v464);
            v437 = v603.data;
            vImagePixelCount v439 = v603.height;
            double v285 = v556;
            *(double *)&unint64_t v284 = v557;
          }
          v603.data = v437;
          v603.uint64_t height = v439;
          v602[0] = (void ***)&v603;
          if (*(void *)&v559 != v284)
          {
            uint64_t v478 = *(void *)v284;
            v477 = (uint64_t *)(v284 + 8);
            std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v602, *(unsigned char **)&v285, (unsigned char *)(v478 + 4096));
            v479 = *(double **)&v559;
            if (v477 != *(uint64_t **)&v559)
            {
              v480 = (void **)v603.data;
              v481 = (char *)v603.height;
              do
              {
                uint64_t v482 = 0;
                uint64_t v483 = *v477;
                v485 = (char *)*v480++;
                v484 = v485;
                while (1)
                {
                  uint64_t v486 = v484 - v481 + 4096;
                  if (4096 - v482 >= v486) {
                    size_t v487 = v486;
                  }
                  else {
                    size_t v487 = 4096 - v482;
                  }
                  if (v487) {
                    memmove(v481, (const void *)(v483 + v482), v487);
                  }
                  v482 += v487;
                  if (v482 == 4096) {
                    break;
                  }
                  v488 = (char *)*v480++;
                  v484 = v488;
                  v481 = v488;
                }
                v481 += v487;
                if ((char *)*(v480 - 1) + 4096 == v481) {
                  v481 = (char *)*v480;
                }
                else {
                  --v480;
                }
                v479 = *(double **)&v559;
                v603.data = v480;
                v603.uint64_t height = (vImagePixelCount)v481;
                ++v477;
              }
              while (v477 != *(uint64_t **)&v559);
            }
            double v285 = *v479;
            double v462 = v560;
          }
          std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<unsigned char,unsigned char const*,unsigned char const&,unsigned char const* const*,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>::operator()[abi:ne180100](v602, *(unsigned char **)&v285, *(unsigned char **)&v462);
        }
LABEL_529:
        v603.data = &v570;
        std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)&v603);
        std::deque<unsigned char>::~deque[abi:ne180100](&v573);

        goto LABEL_530;
      }
      uint64_t v305 = (v290 << 9) - 1;
      if (v281 == v280) {
        uint64_t v305 = 0;
      }
      unint64_t v306 = v305 - v278;
      if (*(void *)&v287 > v306)
      {
        std::deque<unsigned char>::__add_back_capacity(v538, *(void *)&v287 - v306);
        uint64_t v276 = v538[2].i64[1];
        uint64_t v280 = v538->i64[1];
        uint64_t v281 = v538[1].i64[0];
        unint64_t v278 = v538[2].i64[0] + v276;
        unint64_t v279 = v278 >> 12;
      }
      v307 = (void *)(v280 + 8 * v279);
      if (v281 == v280) {
        v308 = 0;
      }
      else {
        v308 = (char *)(*v307 + (v278 & 0xFFF));
      }
      *(void *)&double v309 = v276 - (void)v558;
      if (*(void *)&v309 >= *(void *)&v287)
      {
        v313 = v308;
        v314 = (void *)(v280 + 8 * v279);
        if (v287 == 0.0) {
          goto LABEL_529;
        }
LABEL_297:
        uint64_t v328 = (uint64_t)&v308[-*(void *)&v287 - *v307];
        if (v328 < 1)
        {
          unint64_t v331 = 4095 - v328;
          *(void *)&double v329 = &v307[-(v331 >> 12)];
          v330 = (char *)(**(void **)&v329 + (~(_WORD)v331 & 0xFFF));
        }
        else
        {
          *(void *)&double v329 = &v307[(unint64_t)v328 >> 12];
          v330 = (char *)(**(void **)&v329 + (v328 & 0xFFF));
        }
        if (v330 != v308)
        {
          double v332 = v329;
          v333 = v330;
          v334 = (uint64_t *)v538;
          do
          {
            *v313++ = *v333;
            if (&v313[-*v314] == (char *)4096)
            {
              v335 = (char *)v314[1];
              ++v314;
              v313 = v335;
            }
            if (&(++v333)[-**(void **)&v332] == (char *)4096)
            {
              v336 = *(char **)(*(void *)&v332 + 8);
              *(void *)&v332 += 8;
              v333 = v336;
            }
            ++v334[5];
          }
          while (v333 != v308);
        }
        if (*(void *)&v287 >= *(void *)&v309)
        {
          double v342 = v559;
          double v343 = v560;
          goto LABEL_358;
        }
        double v337 = v285;
        v338 = (unsigned char *)*v307;
        uint64_t v339 = (uint64_t)&v308[-*(void *)&v309 - *v307];
        if (v339 < 1)
        {
          unint64_t v344 = 4095 - v339;
          *(void *)&double v340 = &v307[-(v344 >> 12)];
          v341 = (char *)(**(void **)&v340 + (~(_WORD)v344 & 0xFFF));
        }
        else
        {
          *(void *)&double v340 = &v307[(unint64_t)v339 >> 12];
          v341 = (char *)(**(void **)&v340 + (v339 & 0xFFF));
        }
        if (*(void *)&v340 == *(void *)&v329)
        {
          if (v341 == v330)
          {
LABEL_357:
            double v342 = v559;
            double v343 = v560;
            double v285 = v337;
LABEL_358:
            if (v284 == *(void *)&v342)
            {
              if (*(void *)&v285 != *(void *)&v343)
              {
                v388 = (unsigned char *)*v307;
                v387 = v307 - 1;
                uint64_t v386 = (uint64_t)v388;
                while (1)
                {
                  v389 = &v308[-v386];
                  if (*(void *)&v560 - *(void *)&v285 >= (uint64_t)v389) {
                    size_t v390 = (size_t)v389;
                  }
                  else {
                    size_t v390 = *(void *)&v560 - *(void *)&v285;
                  }
                  *(void *)&double v391 = *(void *)&v560 - v390;
                  if (v390) {
                    memmove(&v308[-v390], (const void *)(*(void *)&v560 - v390), v390);
                  }
                  double v560 = v391;
                  if (*(void *)&v391 == *(void *)&v285) {
                    break;
                  }
                  uint64_t v392 = *v387--;
                  uint64_t v386 = v392;
                  v308 = (char *)(v392 + 4096);
                }
              }
            }
            else
            {
              uint64_t v365 = **(void **)&v342;
              if (**(void **)&v342 != *(void *)&v343)
              {
                uint64_t v366 = *v307;
                while (1)
                {
                  v367 = &v308[-v366];
                  if (*(void *)&v343 - v365 >= (uint64_t)v367) {
                    size_t v368 = (size_t)v367;
                  }
                  else {
                    size_t v368 = *(void *)&v343 - v365;
                  }
                  *(void *)&v343 -= v368;
                  v308 -= v368;
                  if (v368) {
                    memmove(v308, *(const void **)&v343, v368);
                  }
                  if (*(void *)&v343 == v365) {
                    break;
                  }
                  uint64_t v369 = *--v307;
                  uint64_t v366 = v369;
                  v308 = (char *)(v369 + 4096);
                }
                if ((char *)(*v307 + 4096) == v308)
                {
                  v370 = (char *)v307[1];
                  ++v307;
                  v308 = v370;
                }
                double v342 = v559;
              }
              v371 = (void *)(*(void *)&v342 - 8);
              if (*(void *)&v342 - 8 != v284)
              {
                v372 = (unsigned char *)*v307;
                do
                {
                  v373 = (unsigned char *)*v371;
                  v374 = (char *)(*v371 + 4096);
                  while (1)
                  {
                    v375 = (char *)(v308 - v372);
                    if (v374 - v373 >= (uint64_t)v375) {
                      size_t v376 = (size_t)v375;
                    }
                    else {
                      size_t v376 = v374 - v373;
                    }
                    v374 -= v376;
                    v308 -= v376;
                    if (v376) {
                      memmove(v308, v374, v376);
                    }
                    if (v374 == v373) {
                      break;
                    }
                    v377 = (unsigned char *)*--v307;
                    v372 = v377;
                    v308 = v377 + 4096;
                  }
                  v372 = (unsigned char *)*v307;
                  if ((char *)(*v307 + 4096) == v308)
                  {
                    v378 = (unsigned char *)v307[1];
                    ++v307;
                    v372 = v378;
                    v308 = v378;
                  }
                  --v371;
                }
                while (v371 != (void *)v284);
              }
              v379 = (char *)(*(void *)v284 + 4096);
              if (v379 != *(char **)&v285)
              {
                uint64_t v382 = *v307;
                v381 = v307 - 1;
                uint64_t v380 = v382;
                while (1)
                {
                  v383 = &v308[-v380];
                  if ((uint64_t)&v379[-*(void *)&v285] >= (uint64_t)v383) {
                    size_t v384 = (size_t)v383;
                  }
                  else {
                    size_t v384 = (size_t)&v379[-*(void *)&v285];
                  }
                  v379 -= v384;
                  if (v384) {
                    memmove(&v308[-v384], v379, v384);
                  }
                  if (v379 == *(char **)&v285) {
                    break;
                  }
                  uint64_t v385 = *v381--;
                  uint64_t v380 = v385;
                  v308 = (char *)(v385 + 4096);
                }
              }
            }
            goto LABEL_529;
          }
          while (1)
          {
            if (v330 - v341 >= v308 - v338) {
              size_t v362 = v308 - v338;
            }
            else {
              size_t v362 = v330 - v341;
            }
            v330 -= v362;
            v308 -= v362;
            if (v362) {
              memmove(v308, v330, v362);
            }
            if (v330 == v341) {
              break;
            }
            v363 = (unsigned char *)*--v307;
            v338 = v363;
            v308 = v363 + 4096;
          }
        }
        else
        {
          v345 = **(unsigned char ***)&v329;
          BOOL v346 = **(void **)&v329 == (void)v330;
          double v556 = v337;
          double v557 = *(double *)&v284;
          if (!v346)
          {
            double v555 = v329;
            *(double *)&v558 = v340;
            while (1)
            {
              if (v330 - v345 >= v308 - v338) {
                size_t v347 = v308 - v338;
              }
              else {
                size_t v347 = v330 - v345;
              }
              v330 -= v347;
              v308 -= v347;
              if (v347) {
                memmove(v308, v330, v347);
              }
              if (v330 == v345) {
                break;
              }
              v348 = (unsigned char *)*--v307;
              v338 = v348;
              v308 = v348 + 4096;
            }
            v338 = (unsigned char *)*v307;
            if ((char *)(*v307 + 4096) == v308)
            {
              v349 = (unsigned char *)v307[1];
              ++v307;
              v338 = v349;
              v308 = v349;
            }
            double v340 = *(double *)&v558;
            double v329 = v555;
          }
          for (m = (void *)(*(void *)&v329 - 8); m != *(void **)&v340; --m)
          {
            double v351 = v340;
            v352 = (unsigned char *)*m;
            v353 = (char *)(*m + 4096);
            while (1)
            {
              if (v353 - v352 >= v308 - v338) {
                size_t v354 = v308 - v338;
              }
              else {
                size_t v354 = v353 - v352;
              }
              v353 -= v354;
              v308 -= v354;
              if (v354) {
                memmove(v308, v353, v354);
              }
              if (v353 == v352) {
                break;
              }
              v355 = (unsigned char *)*--v307;
              v338 = v355;
              v308 = v355 + 4096;
            }
            v338 = (unsigned char *)*v307;
            if ((char *)(*v307 + 4096) == v308)
            {
              v356 = (unsigned char *)v307[1];
              ++v307;
              v338 = v356;
              v308 = v356;
            }
            double v340 = v351;
          }
          v357 = (char *)(**(void **)&v340 + 4096);
          double v337 = v556;
          *(double *)&unint64_t v284 = v557;
          if (v357 == v341) {
            goto LABEL_357;
          }
          uint64_t v358 = *v307;
          while (1)
          {
            v359 = &v308[-v358];
            if (v357 - v341 >= (uint64_t)v359) {
              size_t v360 = (size_t)v359;
            }
            else {
              size_t v360 = v357 - v341;
            }
            v357 -= v360;
            v308 -= v360;
            if (v360) {
              memmove(v308, v357, v360);
            }
            if (v357 == v341) {
              break;
            }
            uint64_t v361 = *--v307;
            uint64_t v358 = v361;
            v308 = (char *)(v361 + 4096);
          }
        }
        if ((char *)(*v307 + 4096) == v308)
        {
          v364 = (char *)v307[1];
          ++v307;
          v308 = v364;
        }
        goto LABEL_357;
      }
      if (*(void *)&v309 >= *(void *)&v287 >> 1)
      {
        uint64_t v317 = *(void *)&v560 + *(void *)&v309 - (*(void *)&v287 + **(void **)&v559);
        if (v317 < 1)
        {
          unint64_t v322 = 4095 - v317;
          *(void *)&v559 -= 8 * (v322 >> 12);
          *(void *)&double v312 = **(void **)&v559 + (~(_WORD)v322 & 0xFFF);
        }
        else
        {
          *(void *)&v559 += 8 * ((unint64_t)v317 >> 12);
          *(void *)&double v312 = **(void **)&v559 + (v317 & 0xFFF);
        }
      }
      else
      {
        if (v309 != 0.0)
        {
          uint64_t v310 = *(void *)&v285 - *(void *)v284 + *(void *)&v309;
          uint64_t v311 = *(void *)&v560;
          if (v310 < 1)
          {
            unint64_t v393 = 4095 - v310;
            *(void *)&double v559 = v284 - 8 * (v393 >> 12);
            *(void *)&double v312 = **(void **)&v559 + (~(_WORD)v393 & 0xFFF);
          }
          else
          {
            *(void *)&double v559 = v284 + 8 * ((unint64_t)v310 >> 12);
            *(void *)&double v312 = **(void **)&v559 + (v310 & 0xFFF);
          }
LABEL_287:
          if (*(void *)&v312 == v311)
          {
            v313 = v308;
            v314 = v307;
          }
          else
          {
            double v323 = v559;
            double v324 = v312;
            v314 = v307;
            v313 = v308;
            v325 = (uint64_t *)v538;
            do
            {
              *v313++ = **(unsigned char **)&v324;
              if (&v313[-*v314] == (char *)4096)
              {
                v326 = (char *)v314[1];
                ++v314;
                v313 = v326;
              }
              if (++*(void *)&v324 - **(void **)&v323 == 4096)
              {
                v327 = *(unsigned char **)(*(void *)&v323 + 8);
                *(void *)&v323 += 8;
                double v324 = *(double *)&v327;
              }
              ++v325[5];
            }
            while (*(void *)&v324 != v311);
          }
          double v287 = v309;
          double v560 = v312;
          if (v309 == 0.0) {
            goto LABEL_529;
          }
          goto LABEL_297;
        }
        double v559 = *(double *)&v284;
        double v312 = v285;
      }
      uint64_t v311 = *(void *)&v560;
      goto LABEL_287;
    }
    while (1)
    {
      long long v243 = *(_OWORD *)v213;
      long long v244 = *(_OWORD *)(v213 + 16);
      long long v245 = *(_OWORD *)(v213 + 48);
      *(_OWORD *)(v216 + 32) = *(_OWORD *)(v213 + 32);
      *(_OWORD *)(v216 + 48) = v245;
      *(_OWORD *)unint64_t v216 = v243;
      *(_OWORD *)(v216 + 16) = v244;
      if (v216 != v213) {
        break;
      }
LABEL_212:
      v213 += 168;
      v216 += 168;
      if (v213 == *(void *)&v242) {
        goto LABEL_222;
      }
    }
    std::vector<_NSRange>::__assign_with_size[abi:ne180100]<_NSRange*,_NSRange*>((char *)(v216 + 64), *(char **)(v213 + 64), *(void *)(v213 + 72), (uint64_t)(*(void *)(v213 + 72) - *(void *)(v213 + 64)) >> 4);
    long long v246 = *(_OWORD *)(v213 + 88);
    long long v247 = *(_OWORD *)(v213 + 104);
    long long v248 = *(_OWORD *)(v213 + 120);
    v250 = (void *)(v216 + 144);
    uint64_t v249 = *(void *)(v216 + 144);
    *(void *)(v216 + 136) = *(void *)(v213 + 136);
    *(_OWORD *)(v216 + 120) = v248;
    *(_OWORD *)(v216 + 104) = v247;
    *(_OWORD *)(v216 + 88) = v246;
    v252 = *(long long **)(v213 + 144);
    v251 = *(long long **)(v213 + 152);
    unint64_t v253 = 0x8E38E38E38E38E39 * (v251 - v252);
    v254 = (void *)(v216 + 160);
    if (0x8E38E38E38E38E39 * ((*(void *)(v216 + 160) - v249) >> 4) >= v253)
    {
      if (0x8E38E38E38E38E39 * ((*(void *)(v216 + 152) - v249) >> 4) >= v253)
      {
        uint64_t v259 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *>(*(void *)(v213 + 144), *(void *)(v213 + 152), v249);
        for (uint64_t n = *(void *)(v216 + 152); n != v259; n -= 144)
        {
          v261 = *(void **)(n - 80);
          if (v261)
          {
            *(void *)(n - 72) = v261;
            operator delete(v261);
          }
        }
        *(void *)(v216 + 152) = v259;
        goto LABEL_211;
      }
      v258 = &v252[(*(void *)(v216 + 152) - v249) >> 4];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *,CRDetectorUtils::CRTextDetectorQuad *>(*(void *)(v213 + 144), (uint64_t)v258, v249);
      uint64_t v257 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CRDetectorUtils::CRTextDetectorQuad>,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*>(v216 + 160, v258, v251, *(void *)(v216 + 152));
    }
    else
    {
      std::vector<CRDetectorUtils::CRTextDetectorQuad>::__vdeallocate((uint64_t *)(v216 + 144));
      if (v253 > 0x1C71C71C71C71C7) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v255 = 0x1C71C71C71C71C72 * ((uint64_t)(*v254 - *v250) >> 4);
      if (v255 <= v253) {
        unint64_t v255 = 0x8E38E38E38E38E39 * (v251 - v252);
      }
      if (0x8E38E38E38E38E39 * ((uint64_t)(*v254 - *v250) >> 4) >= 0xE38E38E38E38E3) {
        unint64_t v256 = 0x1C71C71C71C71C7;
      }
      else {
        unint64_t v256 = v255;
      }
      std::vector<CRDetectorUtils::CRTextDetectorQuad>::__vallocate[abi:ne180100]((void *)(v216 + 144), v256);
      uint64_t v257 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<CRDetectorUtils::CRTextDetectorQuad>,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*>(v216 + 160, v252, v251, *(void *)(v216 + 152));
    }
    *(void *)(v216 + 152) = v257;
LABEL_211:
    double v242 = v559;
    goto LABEL_212;
  }
  id v195 = v530;
LABEL_530:
  long long v567 = 0u;
  long long v568 = 0u;
  long long v565 = 0u;
  long long v566 = 0u;
  double v552 = COERCE_DOUBLE(v195);
  double v489 = COERCE_DOUBLE([*(id *)&v552 countByEnumeratingWithState:&v565 objects:v601 count:16]);
  if (v489 != 0.0)
  {
    int v490 = 0;
    double v553 = *(double *)v566;
    do
    {
      *(void *)&double v555 = v490;
      double v556 = 0.0;
      double v554 = v489;
      *(void *)&float64_t v551 = *(void *)&v489 + v490;
      do
      {
        if (*(void *)v566 != *(void *)&v553) {
          objc_enumerationMutation(*(id *)&v552);
        }
        unint64_t v491 = v538[2].u64[1];
        if (v491
          && (v491 <= *(void *)&v555
           || !*(unsigned char *)(*(void *)(v538->i64[1]
                                    + (((unint64_t)(v538[2].i64[0] + *(void *)&v555) >> 9) & 0x7FFFFFFFFFFFF8))
                        + ((v538[2].i64[0] + *(void *)&v555) & 0xFFF))))
        {
          uint64_t v492 = 1;
        }
        else
        {
          uint64_t v492 = 2;
        }
        v493 = *(void **)(*((void *)&v565 + 1) + 8 * *(void *)&v556);
        double v559 = *(double *)&v492;
        objc_msgSend(v493, "setNmsOutputScale:");
        uint64_t v494 = [v493 featureID];
        unint64_t v495 = *(void *)&v577[21 * (int)v494 + 9] - *(void *)&v577[21 * (int)v494 + 8];
        if ((int)(v495 >> 4) < 1)
        {
          [v493 setPolygon:0];
        }
        else
        {
          uint64_t v496 = (v495 >> 4);
          MEMORY[0x1F4188790](v494);
          uint64_t v497 = 0;
          do
          {
            int v498 = [v493 featureID];
            uint64_t v499 = *(void *)(*(void *)&v577[21 * v498 + 8] + v497);
            int v500 = [v493 featureID];
            uint64_t v501 = *(void *)(*(void *)&v577[21 * v500 + 8] + v497 + 8);
            v502 = (uint64_t *)((char *)&v523 + v497 + -16 * v496);
            void *v502 = v499;
            v502[1] = v501;
            v497 += 16;
          }
          while (16 * v496 != v497);
          v503 = [CRNormalizedPolyline alloc];
          v504 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v503, "initWithNormalizedPoints:count:size:", &v523 - 2 * v496, v496, v541, v542);
          [v493 setPolygon:v504];
        }
        long long v563 = 0u;
        long long v564 = 0u;
        long long v561 = 0u;
        long long v562 = 0u;
        double v557 = [v493 subFeatures];
        *(double *)&uint64_t v505 = COERCE_DOUBLE([*(id *)&v557 countByEnumeratingWithState:&v561 objects:v600 count:16]);
        if (*(double *)&v505 != 0.0)
        {
          v558 = *(uint64_t **)v562;
          do
          {
            double v560 = *(double *)&v505;
            uint64_t v506 = 0;
            do
            {
              if (*(uint64_t **)v562 != v558) {
                objc_enumerationMutation(*(id *)&v557);
              }
              v507 = *(void **)(*((void *)&v561 + 1) + 8 * v506);
              uint64_t v508 = [v493 featureID];
              unint64_t v509 = *(void *)&v577[21 * (int)v508 + 9] - *(void *)&v577[21 * (int)v508 + 8];
              if ((int)(v509 >> 4) < 1)
              {
                [v507 setPolygon:0];
              }
              else
              {
                uint64_t v510 = (v509 >> 4);
                MEMORY[0x1F4188790](v508);
                uint64_t v511 = 0;
                do
                {
                  int v512 = [v493 featureID];
                  uint64_t v513 = *(void *)(*(void *)&v577[21 * v512 + 8] + v511);
                  int v514 = [v493 featureID];
                  uint64_t v515 = *(void *)(*(void *)&v577[21 * v514 + 8] + v511 + 8);
                  v516 = (uint64_t *)((char *)&v523 + v511 + -16 * v510);
                  void *v516 = v513;
                  v516[1] = v515;
                  v511 += 16;
                }
                while (16 * v510 != v511);
                v517 = [CRNormalizedPolyline alloc];
                v518 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v517, "initWithNormalizedPoints:count:size:", &v523 - 2 * v510, v510, v541, v542);
                [v507 setPolygon:v518];
              }
              [v507 setNmsOutputScale:*(void *)&v559];
              ++v506;
            }
            while (v506 != *(void *)&v560);
            *(double *)&uint64_t v505 = COERCE_DOUBLE([*(id *)&v557 countByEnumeratingWithState:&v561 objects:v600 count:16]);
          }
          while (*(double *)&v505 != 0.0);
        }

        ++*(void *)&v555;
        ++*(void *)&v556;
      }
      while (*(void *)&v556 != *(void *)&v554);
      double v489 = COERCE_DOUBLE([*(id *)&v552 countByEnumeratingWithState:&v565 objects:v601 count:16]);
      int v490 = LODWORD(v551);
    }
    while (v489 != 0.0);
  }

  uint64_t v519 = (uint64_t)v578;
  v520 = v577;
  while ((double *)v519 != v520)
  {
    v519 -= 168;
    std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::destroy[abi:ne180100]((uint64_t)&rowBytes, v519);
  }
  v578 = (void ***)v520;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::shrink_to_fit((void **)&v577);
  if (v526 && v532)
  {
    v521 = v532;
    *v526 = v521;
  }
  v603.data = &v577;
  a1 = *(id *)&v552;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)&v603);
  std::deque<unsigned char>::~deque[abi:ne180100](&v580);

LABEL_565:
  return a1;
}

- (void)computeClassificationType:(void *)a3 fromTextFeatures:(uint64_t *)a4 fineScaleMap:(uint64_t *)a5 fullTileMap:(void *)a6 withScaleIds:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v25 = a1;
  if (a1)
  {
    uint64_t v26 = a6;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = v11;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      int v13 = 0;
      uint64_t v29 = *(void *)v31;
      do
      {
        uint64_t v14 = 0;
        uint64_t v28 = v13;
        do
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(obj);
          }
          double v15 = a5[1];
          BOOL v16 = v15 != *a5;
          float64_t v17 = a4[1];
          if (v17 != *a4) {
            BOOL v16 = 0;
          }
          if (v15 != *a5 && !v16 && v17 != *a4) {
            BOOL v16 = v26[5] > (unint64_t)(v28 + v14)
          }
               && *(unsigned __int8 *)(*(void *)(v26[1]
                                                 + (((unint64_t)(v28 + v14 + v26[4]) >> 9) & 0x7FFFFFFFFFFFF8))
                                     + ((v28 + v14 + v26[4]) & 0xFFF)) != 0;
          float64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
          if (a2)
          {
            if (a2 == 1)
            {
              if (v16) {
                uint64_t v20 = (uint64_t)a5;
              }
              else {
                uint64_t v20 = (uint64_t)a4;
              }
              +[CRNeuralTextDetectorV3 computeOrientationFromSingleTextFeature:map:]((uint64_t)CRNeuralTextDetectorV3, *(void **)(*((void *)&v30 + 1) + 8 * v14), v20);
            }
            else if (a2 == 2)
            {
              if (v16) {
                uint64_t v19 = (uint64_t)a5;
              }
              else {
                uint64_t v19 = (uint64_t)a4;
              }
              +[CRNeuralTextDetectorV3 computeTextTypeFromSingleTextFeature:map:]((uint64_t)CRNeuralTextDetectorV3, *(void **)(*((void *)&v30 + 1) + 8 * v14), v19);
            }
          }
          else
          {
            if (v16) {
              uint64_t v21 = a5;
            }
            else {
              uint64_t v21 = a4;
            }
            double v22 = objc_msgSend(v25, "configuration", v24);
            double v23 = [v22 scriptRatioThresholds];
            +[CRNeuralTextDetectorV3 computeScriptCategoryFromSingleTextFeature:map:scriptRatioThresholds:]((uint64_t)CRNeuralTextDetectorV3, v18, v21, v23);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        int v13 = v28 + v14;
      }
      while (v12);
    }

    id v11 = v24;
  }
}

- (void)runFullTileInferenceOnImage:(id)a3 cachedSurface:(__IOSurface *)a4 outputMaps:(void *)a5 inputSize:(CGSize *)a6 outputSize:(CGSize *)a7 modelContext:(id)a8 error:(id *)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  context = (void *)MEMORY[0x1E01BF820]();
  uint64_t v14 = [(CRNeuralTextDetector *)self configuration];
  [v14 disableScriptDetection];

  double v15 = [(CRNeuralTextDetector *)self configuration];
  [v15 disableTextTypeDetection];

  double v40 = 0.0;
  [v13 size];
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(CRNeuralTextDetector *)self configuration];
  [v20 tileSize];
  +[CRNeuralTextDetectorV3 calculateTargetOutputSize:adjustedInputScale:paddedSize:imageSize:maximumSize:minimumSize:inputLengthLimit:](v17, v19, v21, v22, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0, (uint64_t)CRNeuralTextDetectorV3, (float64x2_t *)a7, &v40, &v39);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v23 = (CRImage_PixelBuffer *)v13;
  }
  else {
    double v23 = -[CRImage_PixelBuffer initWithCVPixelBuffer:]([CRImage_PixelBuffer alloc], "initWithCVPixelBuffer:", [v13 pixelBuffer]);
  }
  id v24 = v23;
  uint64_t v25 = -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:toSurface:](v23, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:toSurface:", a6, 1, 1111970369, 0, a4, v40, v39.f64[0], v39.f64[1]);
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__9;
  uint64_t v37 = __Block_byref_object_dispose__10;
  id v38 = 0;
  uint64_t v26 = [(CRNeuralTextDetector *)self inferenceStats];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __119__CRNeuralTextDetectorV3_runFullTileInferenceOnImage_cachedSurface_outputMaps_inputSize_outputSize_modelContext_error___block_invoke;
  v32[3] = &unk_1E6CDC4C8;
  v32[4] = self;
  v32[5] = &v33;
  v32[6] = v25;
  v32[7] = a9;
  [v26 measureBlock:v32];

  CVPixelBufferRelease(v25);
  if (a9)
  {
    if (*a9 || !v34[5])
    {
      double v27 = CROSLogForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        uint64_t v28 = [*a9 localizedDescription];
        *(_DWORD *)CGPoint buf = 138412290;
        *(void *)&buf[4] = v28;
        _os_log_impl(&dword_1DD733000, v27, OS_LOG_TYPE_FAULT, "Model prediction error for full tile: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
  else if (!v34[5])
  {
    double v27 = CROSLogForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)CGPoint buf = 0;
      _os_log_impl(&dword_1DD733000, v27, OS_LOG_TYPE_FAULT, "Model prediction error for full tile with error == nullptr.", buf, 2u);
    }
    goto LABEL_15;
  }
  if (![(CRNeuralTextDetector *)self shouldCancel])
  {
    long long v30 = objc_msgSend((id)v34[5], "region_score");
    +[CRNeuralTextDetectorV3 createImageMap:targetSize:]((uint64_t)buf, (uint64_t)CRNeuralTextDetectorV3, v30);
  }
  if (a9)
  {
    uint64_t v29 = +[CRImageReader errorWithErrorCode:-3];
    double v27 = *a9;
    *a9 = v29;
LABEL_15:
  }
  _Block_object_dispose(&v33, 8);
}

void __119__CRNeuralTextDetectorV3_runFullTileInferenceOnImage_cachedSurface_outputMaps_inputSize_outputSize_modelContext_error___block_invoke(uint64_t a1)
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v2 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  os_signpost_id_t v4 = (id)CRSignpostLog_signPostOSLog;
  unint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)CGPoint buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRDetectorInferenceTime", "", buf, 2u);
  }

  unint64_t v6 = [*(id *)(a1 + 32) model];
  uint64_t v7 = *(void *)(a1 + 48);
  id v17 = 0;
  uint64_t v8 = [v6 predictionFromImage:v7 error:&v17];
  id v9 = v17;
  id v10 = v17;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;

  if (v10)
  {
    id v13 = *(id **)(a1 + 56);
    if (v13) {
      objc_storeStrong(v13, v9);
    }
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v14 = (id)CRSignpostLog_signPostOSLog;
  double v15 = v14;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)double v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v15, OS_SIGNPOST_INTERVAL_END, v3, "OCRDetectorInferenceTime", "", v16, 2u);
  }
}

- (void)addIntermediateResults:(uint64_t)a3 idxLog:(void *)a4 adjustedSize:(uint64_t)a5 quadFeatures:(uint64_t)a6 nmsOutputScale:(uint64_t)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = objc_msgSend(v12, "pyramidScaleSize", 0x3F8000003F800000, v21);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", a1, a2);
  [v13 insertObject:v14 atIndex:a5];

  double v15 = [v12 pyramidScaleName];
  double v16 = [NSNumber numberWithInteger:a7];
  [v15 insertObject:v16 atIndex:a5];

  id v17 = [v12 pyramidPreIntraScaleNMSTextFeatures];
  double v18 = [v17 objectAtIndexedSubscript:a5];
  double v19 = [(id)objc_opt_class() textFeaturesFromPolygons:a6 withScale:&v20 withNMSOutputScale:0];
  [v18 addObjectsFromArray:v19];
}

- (void)updateNMS:(uint64_t)a3 andQuadFeatures:(uint64_t *)a4 inMaps:(void *)a5 tileRects:(uint64_t)a6 intermediateResult:(int)a7 isFullTile:(float)a8 isHorizontal:adjustedSize:randomPrefix:
{
  a2;
  id v27 = a5;
  uint64_t v14 = *a4;
  if (a7) {
    double v15 = (float **)a4[4];
  }
  else {
    double v15 = (float **)a4[5];
  }
  if (a7) {
    uint64_t v16 = a4[5];
  }
  else {
    uint64_t v16 = a4[4];
  }
  id v17 = [a1 configuration];
  [v17 scoreMapScaleFactor];

  double v18 = malloc_type_calloc(*(void *)(v14 + 8) * *(void *)(v14 + 16), 4uLL, 0x100004052888210uLL);
  double v19 = *(void **)(v14 + 8);
  uint64_t v20 = *(void **)(v14 + 16);
  v31[0] = v18;
  v31[1] = v19;
  v31[2] = v20;
  v31[3] = (void *)(4 * (void)v20);
  if (a7) {
    uint64_t v21 = @"hor";
  }
  else {
    uint64_t v21 = @"ver";
  }
  uint64_t v29 = [NSString stringWithFormat:@"%f_%@", a8, v21, v27];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v22 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v23 = os_signpost_id_generate(v22);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v24 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)CGPoint buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "OCRDetectorPostprocessingExtractTextBoxes", "", buf, 2u);
  }

  uint64_t v26 = [a1 configuration];
  CRDetectorPostProcessV3::extractTextBoxes(v14, v15, v16, a3, (float **)v31, a6, v26, v29);
}

- (void)runNMSForDirection:(uint64_t *)a3 adjustedSize:(void *)a4 fullTileMaps:(void *)a5 adjustedFullTileSize:(void *)a6 targetSize:(int)a7 targetSizeFullTile:(id *)a8 intermediateResults:(uint64_t *)a9 withScaleIds:(unsigned __int8)a10 sourceImageSize:(unsigned __int8)a11 tileRects:isHorizontal:resultTextFeatures:quadFeatures:isFineScaleVerticalLinkActive:isFullTileVerticalLinkActive:idxLog:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v50 = a4;
  id v17 = a6;
  v49 = v17;
  unint64_t v51 = 0;
  BOOL v18 = *a3 != 0;
  if (*a2) {
    int v19 = a10;
  }
  else {
    int v19 = 0;
  }
  if (*a3) {
    int v20 = a11;
  }
  else {
    int v20 = 0;
  }
  if (a7) {
    BOOL v21 = *a2 != 0;
  }
  else {
    BOOL v21 = v19;
  }
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  if (a7) {
    int v20 = v18;
  }
  uint64_t v67 = 0;
  id v62 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  int v53 = v20;
  int v57 = v20 & v21;
  if ((v20 & v21) == 1)
  {
    id v17 = -[CRNMS initForRevision:]([CRNMS alloc], "initForRevision:", 3, v17, v50, 0);
    unint64_t v51 = v17;
  }
  CRLogger = CRLogger::getCRLogger((CRLogger *)v17);
  if (*CRLogger && (CRLogger[8] & 1) != 0) {
    int v23 = rand();
  }
  else {
    int v23 = 0;
  }
  float v24 = (float)v23;
  if (v21) {
    -[CRNeuralTextDetectorV3 updateNMS:andQuadFeatures:inMaps:tileRects:intermediateResult:isFullTile:isHorizontal:adjustedSize:randomPrefix:](a1, v51, (uint64_t)&v62, a2, 0, 0, a7, v24);
  }
  if (v53) {
    -[CRNeuralTextDetectorV3 updateNMS:andQuadFeatures:inMaps:tileRects:intermediateResult:isFullTile:isHorizontal:adjustedSize:randomPrefix:](a1, v51, (uint64_t)&v65, a3, v49, 1, a7, v24);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = *a8;
  uint64_t v25 = [obj countByEnumeratingWithState:&v58 objects:v78 count:16];
  if (v25)
  {
    uint64_t v26 = 0;
    int v52 = 0;
    uint64_t v56 = *(void *)v59;
    do
    {
      uint64_t v27 = 0;
      uint64_t v28 = v52;
      v52 += v25;
      uint64_t v29 = v28;
      do
      {
        if (*(void *)v59 != v56) {
          objc_enumerationMutation(obj);
        }
        if (v57
          && ((unint64_t v30 = a5[5]) == 0
           || v30 > v28 + v27
           && *(unsigned char *)(*(void *)(a5[1] + (((unint64_t)(v28 + v27 + a5[4]) >> 9) & 0x7FFFFFFFFFFFF8))
                       + ((v28 + v27 + a5[4]) & 0xFFF))))
        {
          int v31 = 1;
          uint64_t v32 = 2;
        }
        else
        {
          int v31 = 0;
          uint64_t v32 = 1;
        }
        uint64_t v33 = *(void **)(*((void *)&v58 + 1) + 8 * v27);
        objc_msgSend(v33, "setNmsOutputScale:", v32, v49);
        int v34 = [v33 featureID];
        if (v31) {
          uint64_t v35 = v65;
        }
        else {
          uint64_t v35 = v62;
        }
        uint64_t v36 = &v35[168 * v34];
        long long v37 = *(_OWORD *)v36;
        long long v38 = *((_OWORD *)v36 + 1);
        long long v39 = *((_OWORD *)v36 + 3);
        v69[2] = *((_OWORD *)v36 + 2);
        v69[3] = v39;
        v69[0] = v37;
        v69[1] = v38;
        int64_t v71 = 0;
        uint64_t v72 = 0;
        __p = 0;
        std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&__p, *((const void **)v36 + 8), *((void *)v36 + 9), (uint64_t)(*((void *)v36 + 9) - *((void *)v36 + 8)) >> 4);
        long long v40 = *(_OWORD *)(v36 + 88);
        long long v41 = *(_OWORD *)(v36 + 104);
        long long v42 = *(_OWORD *)(v36 + 120);
        uint64_t v76 = *((void *)v36 + 17);
        long long v74 = v41;
        long long v75 = v42;
        long long v73 = v40;
        memset(v77, 0, 24);
        std::vector<CRDetectorUtils::CRTextDetectorQuad>::__init_with_size[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuad*,CRDetectorUtils::CRTextDetectorQuad*>(v77, *((long long **)v36 + 18), *((long long **)v36 + 19), 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)v36 + 19) - *((void *)v36 + 18)) >> 4));
        [v33 setFeatureID:v26 + v27];
        HIDWORD(v76) = v26 + v27;
        unint64_t v43 = a9[1];
        if (v43 >= a9[2])
        {
          uint64_t v44 = std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__push_back_slow_path<CRDetectorUtils::CRTextDetectorQuadFeature const&>(a9, v69);
          uint64_t v28 = v29;
        }
        else
        {
          std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::construct[abi:ne180100]<CRDetectorUtils::CRTextDetectorQuadFeature,CRDetectorUtils::CRTextDetectorQuadFeature const&>((uint64_t)(a9 + 2), a9[1], v69);
          uint64_t v28 = v29;
          uint64_t v44 = v43 + 168;
          a9[1] = v43 + 168;
        }
        a9[1] = v44;
        uint64_t v68 = (void **)v77;
        std::vector<CRDetectorUtils::CRTextDetectorQuad>::__destroy_vector::operator()[abi:ne180100](&v68);
        if (__p)
        {
          int64_t v71 = __p;
          operator delete(__p);
        }
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [obj countByEnumeratingWithState:&v58 objects:v78 count:16];
      uint64_t v26 = (v26 + v27);
    }
    while (v25);
  }

  float v45 = v65;
  for (uint64_t i = v66;
        (char *)i != v45;
        std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::destroy[abi:ne180100]((uint64_t)&v67, i))
  {
    i -= 168;
  }
  uint64_t v66 = (uint64_t)v45;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::shrink_to_fit((void **)&v65);
  uint64_t v47 = v62;
  for (uint64_t j = v63;
        (char *)j != v47;
        std::allocator<CRDetectorUtils::CRTextDetectorQuadFeature>::destroy[abi:ne180100]((uint64_t)&v64, j))
  {
    j -= 168;
  }
  uint64_t v63 = (uint64_t)v47;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::shrink_to_fit((void **)&v62);

  *(void *)&v69[0] = &v62;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)v69);
  *(void *)&v69[0] = &v65;
  std::vector<CRDetectorUtils::CRTextDetectorQuadFeature>::__destroy_vector::operator()[abi:ne180100]((void ***)v69);
}

- (void)getBorderPoints:(float64x2_t *)a3 sourceImageSize:(unsigned __int8)a4 outP1:(float64_t)a5 outP2:(float64_t)a6 isHorizontal:
{
  id v34 = a1;
  [v34 topLeft];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [v34 topRight];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  [v34 bottomRight];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  [v34 bottomLeft];
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v25 = operator new(0x40uLL);
  *(void *)uint64_t v25 = v10;
  *((void *)v25 + 1) = v12;
  *((void *)v25 + 2) = v14;
  *((void *)v25 + 3) = v16;
  *((void *)v25 + 4) = v18;
  *((void *)v25 + 5) = v20;
  *((void *)v25 + 6) = v22;
  *((void *)v25 + 7) = v24;
  unsigned __int8 v35 = a4;
  std::__introsort<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *,false>((double *)v25, (double *)v25 + 8, &v35, 4, 1);
  v26.f64[0] = a5;
  v26.f64[1] = a6;
  __asm { FMOV            V1.2D, #0.5 }
  *a2 = vmulq_f64(vmulq_f64(v26, vaddq_f64(*(float64x2_t *)v25, *((float64x2_t *)v25 + 1))), _Q1);
  *a3 = vmulq_f64(vmulq_f64(v26, vaddq_f64(*((float64x2_t *)v25 + 2), *((float64x2_t *)v25 + 3))), _Q1);
  operator delete(v25);
}

+ (CGSize)scaledImageSizeForConfiguration:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [v7 maximumInputSize];
  double v9 = v8;
  double v11 = v10;
  [v7 tileSize];
  double v13 = v12;
  double v15 = v14;
  [v7 inputLengthLimit];
  double v17 = +[CRNeuralTextDetectorV3 scaledImageSizeForMaxSize:minSize:inputLengthLimit:imageSize:scale:](v9, v11, v13, v15, v16, width, height, (uint64_t)a1, &v22);
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

+ (BOOL)computeClassCount:(void *)a3 classProbabiity:(void *)a4 fromSingleTextFeature:(id)a5 map:(const void *)a6 backgroundClass:(int)a7
{
  v106[8] = *(double *)MEMORY[0x1E4F143B8];
  id v10 = a5;
  unint64_t v100 = a3;
  double v13 = a3;
  uint64_t v12 = *(void *)a3;
  uint64_t v11 = v13[1];
  uint64_t v14 = **(void **)a6;
  unint64_t v16 = *(void *)(v14 + 8);
  unint64_t v15 = *(void *)(v14 + 16);
  [v10 topLeft];
  double v18 = v17;
  [v10 topLeft];
  v106[0] = v18 * (double)v15;
  v106[1] = v19 * (double)v16;
  [v10 topRight];
  double v21 = v20;
  [v10 topRight];
  v106[2] = v21 * (double)v15;
  v106[3] = v22 * (double)v16;
  [v10 bottomRight];
  double v24 = v23;
  [v10 bottomRight];
  v106[4] = v24 * (double)v15;
  v106[5] = v25 * (double)v16;
  [v10 bottomLeft];
  double v27 = v26;
  [v10 bottomLeft];
  v106[6] = v27 * (double)v15;
  v106[7] = v28 * (double)v16;
  double CenterPoint = CRDetectorUtils::makeCenterPoint((CRDetectorUtils *)v106, v29);
  v104.double x = CenterPoint;
  double v101 = v31;
  v104.double y = v31;
  [v10 baselineAngle];
  double v98 = *(double *)&v16;
  unint64_t v32 = v11 - v12;
  unint64_t v33 = v32 >> 3;
  CRDetectorUtils::rotatePolygon((CRDetectorUtils *)v106, &v104, &v105, v34, v35);
  uint64_t v37 = CRDetectorUtils::convertPointToRect((uint64_t)&v105, v36);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  uint64_t v46 = (v32 >> 3);
  MEMORY[0x1F4188790](v37);
  BOOL v48 = (char *)v96 - ((v47 + 15) & 0xFFFFFFFF0);
  if (v47 >= 0x200) {
    size_t v49 = 512;
  }
  else {
    size_t v49 = v47;
  }
  bzero((char *)v96 - ((v47 + 15) & 0xFFFFFFFF0), v49);
  if ((int)v33 >= 1)
  {
    id v50 = *(uint64_t **)a6;
    unint64_t v51 = v48;
    uint64_t v52 = (v32 >> 3);
    do
    {
      int v53 = (void *)*v50++;
      *v51++ = *v53;
      --v52;
    }
    while (v52);
  }
  int v54 = (int)v41;
  double v55 = (double)(int)v41;
  double v99 = v41 + v45;
  if (v41 + v45 <= v55)
  {
    BOOL v94 = 0;
  }
  else
  {
    v96[1] = v96;
    int v56 = 0;
    int v97 = (int)v39;
    double v57 = (double)(int)v39;
    double v58 = v39 + v43;
    double v59 = (double)(unint64_t)(*(void *)&v98 - 1);
    unint64_t v60 = (int)((uint64_t)v32 >> 3);
    double v98 = v57;
    do
    {
      if (v58 > v57)
      {
        double v61 = v55 - v101;
        double v62 = -(v55 - v101);
        int v63 = v97;
        do
        {
          [v10 baselineAngle];
          __float2 v65 = __sincosf_stret(v64);
          double v66 = (float)-v65.__sinval;
          double v67 = CenterPoint + v62 * v66 + (v57 - CenterPoint) * v65.__cosval;
          double v68 = v101 + v61 * v65.__cosval + (v57 - CenterPoint) * v66;
          double v69 = fmax(v67, 0.0);
          if (v69 >= (double)(v15 - 1)) {
            double v70 = (double)(v15 - 1);
          }
          else {
            double v70 = v69;
          }
          double v71 = fmax(v68, 0.0);
          if (v71 >= v59) {
            double v72 = v59;
          }
          else {
            double v72 = v71;
          }
          std::vector<double>::vector(&v102, v60);
          unint64_t v73 = v15 * (int)v72 + (int)v70;
          long long v74 = *(double **)a4;
          long long v75 = v102;
          uint64_t v76 = *((void *)a4 + 1) - *(void *)a4;
          if (v76)
          {
            unint64_t v77 = v76 >> 3;
            if (v77 <= 1) {
              unint64_t v77 = 1;
            }
            uint64_t v78 = (uint64_t *)v48;
            uint64_t v79 = v102;
            do
            {
              uint64_t v80 = *v78++;
              *v79++ = *(float *)(v80 + 4 * v73);
              --v77;
            }
            while (v77);
          }
          uint64_t v81 = v75 + 1;
          BOOL v82 = v75 == v103 || v81 == v103;
          uint64_t v83 = v75;
          if (!v82)
          {
            double v84 = *v75;
            uint64_t v83 = v75;
            unint64_t v85 = v75 + 1;
            do
            {
              double v86 = *v85++;
              double v87 = v86;
              if (v84 < v86)
              {
                double v84 = v87;
                uint64_t v83 = v81;
              }
              uint64_t v81 = v85;
            }
            while (v85 != v103);
          }
          int64_t v88 = (char *)v83 - (char *)v75;
          if ((((char *)v83 - (char *)v75) & 0x7FFFFFFF8) != 0)
          {
            uint64_t v89 = (uint64_t *)v48;
            uint64_t v90 = v46;
            if ((int)v33 >= 1)
            {
              do
              {
                uint64_t v91 = *v89++;
                double *v74 = *v74 + *(float *)(v91 + 4 * v73);
                ++v74;
                --v90;
              }
              while (v90);
            }
            ++*(void *)(*v100 + (v88 << 29 >> 29));
            ++v56;
          }
          if (v75)
          {
            int v103 = v75;
            operator delete(v75);
          }
          double v57 = (double)++v63;
        }
        while (v58 > (double)v63);
      }
      double v55 = (double)++v54;
      double v57 = v98;
    }
    while (v99 > (double)v54);
    if (v56 <= 0)
    {
      BOOL v94 = 0;
    }
    else
    {
      unint64_t v92 = *(double **)a4;
      uint64_t v93 = (double *)*((void *)a4 + 1);
      if (*(double **)a4 != v93)
      {
        do
        {
          double *v92 = *v92 / (double)v56;
          ++v92;
        }
        while (v92 != v93);
      }
      BOOL v94 = 1;
    }
  }

  return v94;
}

- (CRTextDetectorModelV3CoreML)model
{
  return (CRTextDetectorModelV3CoreML *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getBorderPoints:(double *)a1 sourceImageSize:(double *)a2 outP1:(unsigned __int8 *)a3 outP2:(uint64_t)a4 isHorizontal:(char)a5
{
  while (2)
  {
    uint64_t v12 = a2 - 2;
    double v13 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v13;
          uint64_t v14 = (char *)a2 - (char *)v13;
          unint64_t v15 = ((char *)a2 - (char *)v13) >> 4;
          if (v6 || !v5)
          {
            switch(v15)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if (*a3) {
                  id v50 = a2 - 2;
                }
                else {
                  id v50 = a2 - 1;
                }
                double v51 = *v50;
                if (*a3) {
                  uint64_t v52 = v13;
                }
                else {
                  uint64_t v52 = v13 + 1;
                }
                if (v51 < *v52)
                {
                  long long v137 = *(_OWORD *)v13;
                  *(_OWORD *)double v13 = *(_OWORD *)v12;
                  *(_OWORD *)uint64_t v12 = v137;
                }
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(v13, v13 + 2, a2 - 2, a3);
                break;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(v13, v13 + 2, v13 + 4, (unint64_t *)a2 - 2, a3);
                break;
              case 5uLL:
                int v53 = (long long *)(v13 + 2);
                int v54 = (long long *)(v13 + 4);
                double v55 = (long long *)(v13 + 6);
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(v13, v13 + 2, v13 + 4, (unint64_t *)v13 + 6, a3);
                int v56 = v13 + 7;
                if (*a3) {
                  double v57 = a2 - 2;
                }
                else {
                  double v57 = a2 - 1;
                }
                double v58 = *v57;
                if (*a3) {
                  double v59 = v13 + 6;
                }
                else {
                  double v59 = v13 + 7;
                }
                if (v58 < *v59)
                {
                  long long v60 = *v55;
                  long long *v55 = *(_OWORD *)v12;
                  *(_OWORD *)uint64_t v12 = v60;
                  double v61 = v13 + 5;
                  if (*a3) {
                    int v56 = v13 + 6;
                  }
                  double v62 = *v56;
                  if (*a3) {
                    int v63 = v13 + 4;
                  }
                  else {
                    int v63 = v13 + 5;
                  }
                  if (v62 < *v63)
                  {
                    long long v64 = *v54;
                    *int v54 = *v55;
                    long long *v55 = v64;
                    __float2 v65 = v13 + 2;
                    if (*a3) {
                      double v61 = v13 + 4;
                    }
                    double v66 = *v61;
                    if (*a3) {
                      double v67 = v13 + 2;
                    }
                    else {
                      double v67 = v13 + 3;
                    }
                    if (v66 < *v67)
                    {
                      long long v68 = *v53;
                      *int v53 = *v54;
                      *int v54 = v68;
                      if (!*a3) {
                        __float2 v65 = v13 + 3;
                      }
                      double v69 = *v65;
                      if (*a3) {
                        double v70 = v13;
                      }
                      else {
                        double v70 = v13 + 1;
                      }
                      if (v69 < *v70)
                      {
                        long long v138 = *(_OWORD *)v13;
                        *(_OWORD *)double v13 = *v53;
                        *int v53 = v138;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v14 <= 383)
          {
            double v71 = v13 + 2;
            BOOL v73 = v13 == a2 || v71 == a2;
            if (a5)
            {
              if (!v73)
              {
                uint64_t v74 = 0;
                long long v75 = v13;
                do
                {
                  double v77 = v75[2];
                  double v76 = v75[3];
                  if (*a3) {
                    uint64_t v78 = v75;
                  }
                  else {
                    uint64_t v78 = v75 + 1;
                  }
                  long long v75 = v71;
                  if (*a3) {
                    double v79 = v77;
                  }
                  else {
                    double v79 = v76;
                  }
                  if (v79 < *v78)
                  {
                    uint64_t v80 = v74;
                    while (1)
                    {
                      uint64_t v81 = (char *)v13 + v80;
                      *(_OWORD *)((char *)v13 + v80 + 16) = *(_OWORD *)((char *)v13 + v80);
                      if (!v80) {
                        break;
                      }
                      BOOL v82 = (double *)(v81 - 16);
                      uint64_t v83 = (double *)(v81 - 8);
                      if (*a3) {
                        double v84 = v77;
                      }
                      else {
                        double v84 = v76;
                      }
                      if (*a3) {
                        uint64_t v83 = v82;
                      }
                      v80 -= 16;
                      if (v84 >= *v83)
                      {
                        unint64_t v85 = (double *)((char *)v13 + v80 + 16);
                        goto LABEL_157;
                      }
                    }
                    unint64_t v85 = v13;
LABEL_157:
                    *unint64_t v85 = v77;
                    v85[1] = v76;
                  }
                  double v71 = v75 + 2;
                  v74 += 16;
                }
                while (v75 + 2 != a2);
              }
            }
            else if (!v73)
            {
              int v126 = *a3;
              do
              {
                double v127 = a1 + 1;
                double v129 = a1[2];
                double v128 = a1[3];
                if (v126) {
                  double v127 = a1;
                }
                a1 = v71;
                if (v126) {
                  double v130 = v129;
                }
                else {
                  double v130 = v128;
                }
                if (v130 < *v127)
                {
                  do
                  {
                    *(_OWORD *)double v71 = *((_OWORD *)v71 - 1);
                    double v131 = v71 - 4;
                    double v132 = v71 - 3;
                    v71 -= 2;
                    int v126 = *a3;
                    if (*a3) {
                      double v133 = v129;
                    }
                    else {
                      double v133 = v128;
                    }
                    if (!*a3) {
                      double v131 = v132;
                    }
                  }
                  while (v133 < *v131);
                  double *v71 = v129;
                  v71[1] = v128;
                }
                double v71 = a1 + 2;
              }
              while (a1 + 2 != a2);
            }
            return;
          }
          if (!a4)
          {
            if (v13 != a2)
            {
              int64_t v86 = (v15 - 2) >> 1;
              int64_t v87 = v86;
              do
              {
                int64_t v88 = v87;
                if (v86 >= v87)
                {
                  uint64_t v89 = (2 * v87) | 1;
                  uint64_t v90 = &v13[2 * v89];
                  if (2 * v88 + 2 < (uint64_t)v15)
                  {
                    uint64_t v91 = v90 + 1;
                    if (*a3) {
                      uint64_t v91 = &v13[2 * v89];
                    }
                    double v92 = *v91;
                    if (*a3) {
                      uint64_t v93 = v90 + 2;
                    }
                    else {
                      uint64_t v93 = v90 + 3;
                    }
                    if (v92 < *v93)
                    {
                      v90 += 2;
                      uint64_t v89 = 2 * v88 + 2;
                    }
                  }
                  BOOL v94 = &v13[2 * v88];
                  if (*a3) {
                    char v95 = v90;
                  }
                  else {
                    char v95 = v90 + 1;
                  }
                  long long v96 = *(_OWORD *)v94;
                  double v97 = v94[1];
                  if (*a3) {
                    double v98 = *v94;
                  }
                  else {
                    double v98 = v94[1];
                  }
                  if (*v95 >= v98)
                  {
                    do
                    {
                      double v99 = v94;
                      BOOL v94 = v90;
                      *(_OWORD *)double v99 = *(_OWORD *)v90;
                      if (v86 < v89) {
                        break;
                      }
                      uint64_t v100 = 2 * v89;
                      uint64_t v89 = (2 * v89) | 1;
                      uint64_t v90 = &v13[2 * v89];
                      if (v100 + 2 < (uint64_t)v15)
                      {
                        double v101 = v90 + 1;
                        if (*a3) {
                          double v101 = &v13[2 * v89];
                        }
                        double v102 = *v101;
                        if (*a3) {
                          int v103 = v90 + 2;
                        }
                        else {
                          int v103 = v90 + 3;
                        }
                        if (v102 < *v103)
                        {
                          v90 += 2;
                          uint64_t v89 = v100 + 2;
                        }
                      }
                      CGPoint v104 = *a3 ? v90 : v90 + 1;
                      double v105 = *a3 ? *(double *)&v96 : v97;
                    }
                    while (*v104 >= v105);
                    *(_OWORD *)BOOL v94 = v96;
                  }
                }
                int64_t v87 = v88 - 1;
              }
              while (v88);
              uint64_t v106 = (unint64_t)v14 >> 4;
              do
              {
                uint64_t v107 = 0;
                long long v139 = *(_OWORD *)v13;
                uint64_t v108 = v13;
                do
                {
                  char v109 = v108;
                  v108 += 2 * v107 + 2;
                  uint64_t v110 = 2 * v107;
                  uint64_t v107 = (2 * v107) | 1;
                  uint64_t v111 = v110 + 2;
                  if (v111 < v106)
                  {
                    id v112 = *a3 ? v108 : v108 + 1;
                    double v113 = *v112;
                    float64x2_t v114 = *a3 ? v108 + 2 : v108 + 3;
                    if (v113 < *v114)
                    {
                      v108 += 2;
                      uint64_t v107 = v111;
                    }
                  }
                  *(_OWORD *)char v109 = *(_OWORD *)v108;
                }
                while (v107 <= (uint64_t)((unint64_t)(v106 - 2) >> 1));
                a2 -= 2;
                if (v108 == a2)
                {
                  *(_OWORD *)uint64_t v108 = v139;
                }
                else
                {
                  *(_OWORD *)uint64_t v108 = *(_OWORD *)a2;
                  *(_OWORD *)a2 = v139;
                  uint64_t v115 = (char *)v108 - (char *)v13 + 16;
                  if (v115 >= 17)
                  {
                    unint64_t v116 = (((unint64_t)v115 >> 4) - 2) >> 1;
                    BOOL v117 = &v13[2 * v116];
                    id v118 = *a3 ? &v13[2 * v116] : v117 + 1;
                    double v120 = *v108;
                    double v119 = v108[1];
                    double v121 = *a3 ? *v108 : v108[1];
                    if (*v118 < v121)
                    {
                      do
                      {
                        double v122 = v108;
                        uint64_t v108 = v117;
                        *(_OWORD *)double v122 = *(_OWORD *)v117;
                        if (!v116) {
                          break;
                        }
                        unint64_t v116 = (v116 - 1) >> 1;
                        BOOL v117 = &v13[2 * v116];
                        double v123 = *a3 ? &v13[2 * v116] : v117 + 1;
                        double v124 = *a3 ? v120 : v119;
                      }
                      while (*v123 < v124);
                      *uint64_t v108 = v120;
                      v108[1] = v119;
                    }
                  }
                }
              }
              while (v106-- > 2);
            }
            return;
          }
          unint64_t v16 = v15 >> 1;
          double v17 = &v13[2 * (v15 >> 1)];
          if ((unint64_t)v14 >= 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(a1, &a1[2 * (v15 >> 1)], a2 - 2, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(a1 + 2, v17 - 2, a2 - 4, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(a1 + 4, &a1[2 * v16 + 2], a2 - 6, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(v17 - 2, v17, &a1[2 * v16 + 2], a3);
            long long v134 = *(_OWORD *)a1;
            *(_OWORD *)a1 = *(_OWORD *)v17;
            *(_OWORD *)double v17 = v134;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>(&a1[2 * (v15 >> 1)], a1, a2 - 2, a3);
          }
          --a4;
          double v18 = *a1;
          if (a5)
          {
            double v19 = a1[1];
            int v20 = *a3;
            break;
          }
          double v21 = a1 - 2;
          int v20 = *a3;
          if (!*a3) {
            double v21 = a1 - 1;
          }
          double v19 = a1[1];
          double v22 = *a3 ? *a1 : a1[1];
          if (*v21 < v22) {
            break;
          }
          double v38 = a2 - 1;
          if (*a3) {
            double v38 = a2 - 2;
          }
          if (v22 >= *v38)
          {
            double v41 = a1 + 2;
            do
            {
              double v13 = v41;
              if (v41 >= a2) {
                break;
              }
              double v42 = v41 + 1;
              if (*a3) {
                double v42 = v13;
              }
              double v43 = *v42;
              double v41 = v13 + 2;
            }
            while (v22 >= v43);
          }
          else
          {
            double v39 = a1;
            do
            {
              double v13 = v39 + 2;
              double v40 = v39 + 3;
              if (*a3) {
                double v40 = v13;
              }
              BOOL v30 = v22 < *v40;
              double v39 = v13;
            }
            while (!v30);
          }
          double v44 = a2;
          if (v13 < a2)
          {
            double v45 = a2;
            do
            {
              double v44 = v45 - 2;
              uint64_t v46 = v45 - 1;
              if (*a3) {
                uint64_t v46 = v44;
              }
              BOOL v30 = v22 < *v46;
              double v45 = v44;
            }
            while (v30);
          }
          while (v13 < v44)
          {
            long long v136 = *(_OWORD *)v13;
            *(_OWORD *)double v13 = *(_OWORD *)v44;
            *(_OWORD *)double v44 = v136;
            if (*a3) {
              double v47 = v18;
            }
            else {
              double v47 = v19;
            }
            do
            {
              BOOL v48 = v13 + 3;
              v13 += 2;
              if (*a3) {
                BOOL v48 = v13;
              }
            }
            while (v47 >= *v48);
            do
            {
              size_t v49 = v44 - 1;
              v44 -= 2;
              if (*a3) {
                size_t v49 = v44;
              }
            }
            while (v47 < *v49);
          }
          BOOL v5 = v13 - 2 >= a1;
          BOOL v6 = v13 - 2 == a1;
          if (v13 - 2 != a1) {
            *(_OWORD *)a1 = *((_OWORD *)v13 - 1);
          }
          a5 = 0;
          *(v13 - 2) = v18;
          *(v13 - 1) = v19;
        }
        uint64_t v23 = 0;
        double v24 = v20 ? *a1 : v19;
        do
        {
          double v25 = &a1[v23 + 3];
          if (v20) {
            double v25 = &a1[v23 + 2];
          }
          v23 += 2;
        }
        while (*v25 < v24);
        double v26 = &a1[v23];
        double v27 = a2;
        if (v23 == 2)
        {
          double v31 = a2;
          while (v26 < v31)
          {
            double v28 = v31 - 2;
            unint64_t v32 = v31 - 1;
            if (v20) {
              unint64_t v32 = v28;
            }
            BOOL v30 = *v32 < v24;
            double v31 = v28;
            if (v30) {
              goto LABEL_37;
            }
          }
          double v28 = v31;
        }
        else
        {
          do
          {
            double v28 = v27 - 2;
            uint64_t v29 = v27 - 1;
            if (v20) {
              uint64_t v29 = v28;
            }
            BOOL v30 = *v29 < v24;
            double v27 = v28;
          }
          while (!v30);
        }
LABEL_37:
        double v13 = v26;
        if (v26 < v28)
        {
          unint64_t v33 = v28;
          do
          {
            long long v135 = *(_OWORD *)v13;
            *(_OWORD *)double v13 = *(_OWORD *)v33;
            *(_OWORD *)unint64_t v33 = v135;
            if (*a3) {
              double v34 = v18;
            }
            else {
              double v34 = v19;
            }
            do
            {
              unsigned __int8 v35 = v13 + 3;
              v13 += 2;
              if (*a3) {
                unsigned __int8 v35 = v13;
              }
            }
            while (*v35 < v34);
            do
            {
              uint64_t v36 = v33 - 1;
              v33 -= 2;
              if (*a3) {
                uint64_t v36 = v33;
              }
            }
            while (*v36 >= v34);
          }
          while (v13 < v33);
        }
        if (v13 - 2 != a1) {
          *(_OWORD *)a1 = *((_OWORD *)v13 - 1);
        }
        *(v13 - 2) = v18;
        *(v13 - 1) = v19;
        if (v26 >= v28) {
          break;
        }
LABEL_54:
        std::__introsort<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *,false>(a1, v13 - 2, a3, a4, a5 & 1);
        a5 = 0;
      }
      BOOL v37 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>((long long *)a1, v13 - 2, a3);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRNeuralTextDetectorV3 getBorderPoints:sourceImageSize:outP1:outP2:isHorizontal:]::$_0 &,CGPoint *>((long long *)v13, a2, a3))
      {
        break;
      }
      if (!v37) {
        goto LABEL_54;
      }
    }
    a2 = v13 - 2;
    if (!v37) {
      continue;
    }
    break;
  }
}

+ (void)computeOrientationFromSingleTextFeature:(uint64_t)a3 map:
{
  v67[16] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  objc_opt_class();
  self;
  v67[0] = 0;
  std::vector<double>::vector(&v60, 9uLL, v67);
  v67[0] = 0;
  std::vector<long>::vector(&__p, 9uLL, v67);
  if ([(id)objc_opt_class() computeClassCount:&__p classProbabiity:&v60 fromSingleTextFeature:v4 map:a3 backgroundClass:0])
  {
    id v5 = v4;
    self;
    BOOL v6 = __p;
    if (__p == v59)
    {
      double v8 = __p;
    }
    else
    {
      id v7 = (char *)__p + 8;
      double v8 = __p;
      if ((char *)__p + 8 != v59)
      {
        uint64_t v9 = *(void *)__p;
        double v8 = __p;
        id v10 = (char *)__p + 8;
        do
        {
          uint64_t v12 = *(void *)v10;
          v10 += 8;
          uint64_t v11 = v12;
          BOOL v13 = v9 < v12;
          if (v9 <= v12) {
            uint64_t v9 = v11;
          }
          if (v13) {
            double v8 = v7;
          }
          id v7 = v10;
        }
        while (v10 != v59);
      }
    }
    double v18 = (double *)v60;
    double v19 = (double *)((char *)v60 + 8);
    if (v60 != v61 && v19 != (double *)v61)
    {
      double v21 = *(double *)v60;
      double v22 = (double *)((char *)v60 + 8);
      do
      {
        double v23 = *v22++;
        double v24 = v23;
        if (v21 < v23)
        {
          double v21 = v24;
          double v18 = v19;
        }
        double v19 = v22;
      }
      while (v22 != (double *)v61);
    }
    double v25 = *v18;
    [v5 baselineAngle];
    float v27 = v26;
    self;
    objc_opt_class();
    self;
    objc_opt_class();
    self;
    double v28 = (float)((float)(int)(((unint64_t)(v8 - v6) >> 3) - 1) * 0.7854) + -0.3926991;
    if (v28 <= 3.14159265)
    {
      if (v28 > -3.14159265) {
        goto LABEL_33;
      }
      double v29 = 6.28318531;
    }
    else
    {
      double v29 = -6.28318531;
    }
    double v28 = v28 + v29;
LABEL_33:
    float v30 = v28;
    double v31 = (float)(v30 + 0.7854);
    if (v31 <= 3.14159265)
    {
      if (v31 > -3.14159265) {
        goto LABEL_38;
      }
      double v32 = 6.28318531;
    }
    else
    {
      double v32 = -6.28318531;
    }
    double v31 = v31 + v32;
LABEL_38:
    float v33 = v31;
    double v34 = (float)(v27 - v30);
    if (v34 <= 3.14159265)
    {
      if (v34 > -3.14159265) {
        goto LABEL_43;
      }
      double v35 = 6.28318531;
    }
    else
    {
      double v35 = -6.28318531;
    }
    double v34 = v34 + v35;
LABEL_43:
    double v36 = (float)(v27 - v33);
    if (v36 <= 3.14159265)
    {
      if (v36 > -3.14159265)
      {
LABEL_48:
        float v38 = v34;
        float v39 = v36;
        float v40 = fabsf(v38);
        float v41 = fabsf(v39);
        float v42 = fminf(v40, v41);
        float v43 = fmaxf(v40, v41);
        BOOL v44 = v43 > 1.5708 && v42 < 1.5708;
        if (v44 && v27 < 0.0) {
          BOOL v45 = 1;
        }
        else {
          BOOL v45 = (v43 <= 0.7854 || v42 >= 2.3562) && v27 < 1.57079633 && v27 > -1.57079633;
        }
        [v5 setUseSequenceOrientation:1];
        if (v44)
        {
          [v5 setIsVerticalLayout:1];
          if (v45) {
            double v46 = 0.75;
          }
          else {
            double v46 = 0.55;
          }
          BOOL v44 = v41 < v40;
        }
        else if (v45)
        {
          double v46 = 0.75;
        }
        else
        {
          double v46 = 0.55;
        }
        if (v42 >= 2.3562 && v25 > v46)
        {
          [v5 setShouldRotate180:1];
          if (v25 > 0.9) {
            [v5 setUseSequenceOrientation:0];
          }
        }
        if (v44 && v25 > v46)
        {
          [v5 setShouldRotate180:1];
          if (v25 > 0.9) {
            [v5 setUseSequenceOrientation:0];
          }
        }
        [v5 setShouldRotate180DetectorOrientationFallBack:0];
        BOOL v48 = !v44;
        if (v42 >= 2.3562) {
          BOOL v48 = 0;
        }
        if (!v48) {
          objc_msgSend(v5, "setShouldRotate180DetectorOrientationFallBack:", objc_msgSend(v5, "shouldRotate180") ^ 1);
        }
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        size_t v49 = [v5 subFeatures];
        uint64_t v50 = [v49 countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (v50)
        {
          uint64_t v51 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v63 != v51) {
                objc_enumerationMutation(v49);
              }
              int v53 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              objc_msgSend(v53, "setShouldRotate180:", objc_msgSend(v5, "shouldRotate180"));
              objc_msgSend(v53, "setShouldRotate180DetectorOrientationFallBack:", objc_msgSend(v5, "shouldRotate180DetectorOrientationFallBack"));
              objc_msgSend(v53, "setIsVerticalLayout:", objc_msgSend(v5, "isVerticalLayout"));
              objc_msgSend(v53, "setUseSequenceOrientation:", objc_msgSend(v5, "useSequenceOrientation"));
            }
            uint64_t v50 = [v49 countByEnumeratingWithState:&v62 objects:v67 count:16];
          }
          while (v50);
        }

        goto LABEL_89;
      }
      double v37 = 6.28318531;
    }
    else
    {
      double v37 = -6.28318531;
    }
    double v36 = v36 + v37;
    goto LABEL_48;
  }
  [v4 setUseSequenceOrientation:1];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v14 = objc_msgSend(v4, "subFeatures", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * j), "setUseSequenceOrientation:", objc_msgSend(v4, "useSequenceOrientation"));
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v15);
  }

LABEL_89:
  if (__p)
  {
    double v59 = (char *)__p;
    operator delete(__p);
  }
  if (v60)
  {
    double v61 = (char *)v60;
    operator delete(v60);
  }
}

@end