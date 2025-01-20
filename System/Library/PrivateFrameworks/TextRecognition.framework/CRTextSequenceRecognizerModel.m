@interface CRTextSequenceRecognizerModel
+ (id)defaultModelFileName;
+ (id)defaultURLOfModelInThisBundle;
- (BOOL)preheatWithError:(id *)a3;
- (BOOL)supportCharacterBoxes;
- (CRNeuralRecognizerConfiguration)configuration;
- (CRTextSequenceRecognizerModel)initWithConfiguration:(id)a3 error:(id *)a4;
- (NSDictionary)outputShape;
- (NSNumber)outputFormatVersion;
- (NSNumber)outputWidthDownscale;
- (NSNumber)outputWidthOffset;
- (NSURL)modelURL;
- (TextBoxesOffsets)characterBoxesOffsets;
- (TextBoxesOffsets)wordBoxesOffsets;
- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7;
- (id)populateInputBatchData:(float *)a3 lineRegions:(id)a4 image:(id)a5 batchSize:(int64_t)a6 width:(double)a7 configuration:(id)a8 rectifier:(id)a9;
- (id)predictFromInputs:(id)a3 error:(id *)a4;
- (int)codemapArray;
- (int64_t)ctcBlankLabelIndex;
- (unint64_t)codemapSize;
- (void)dealloc;
- (void)setCodemapArray:(int *)a3;
- (void)setCodemapSize:(unint64_t)a3;
- (void)setCtcBlankLabelIndex:(int64_t)a3;
- (void)setOutputFormatVersion:(id)a3;
- (void)setOutputShape:(id)a3;
- (void)setOutputWidthDownscale:(id)a3;
- (void)setOutputWidthOffset:(id)a3;
@end

@implementation CRTextSequenceRecognizerModel

- (NSDictionary)outputShape
{
  outputShape = self->_outputShape;
  if (!outputShape)
  {
    v4 = (void *)MEMORY[0x1E4F28B50];
    v5 = [(CRTextSequenceRecognizerModel *)self modelURL];
    v6 = [v4 bundleWithURL:v5];

    v7 = (void *)MEMORY[0x1E4F1C9B8];
    v8 = [v6 pathForResource:@"model.output" ofType:@"shape"];
    v9 = [v7 dataWithContentsOfFile:v8];

    if (!v9)
    {
      id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No model.output.shape in model" userInfo:0];
      objc_exception_throw(v13);
    }
    v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:0];
    v11 = self->_outputShape;
    self->_outputShape = v10;

    outputShape = self->_outputShape;
  }
  return outputShape;
}

- (NSNumber)outputWidthDownscale
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_outputWidthDownscale)
  {
    v3 = [(CRTextSequenceRecognizerModel *)v2 outputShape];
    v4 = [v3 objectForKeyedSubscript:@"w_output_shape"];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"down_scale"];
    outputWidthDownscale = v2->_outputWidthDownscale;
    v2->_outputWidthDownscale = (NSNumber *)v5;

    if (!v2->_outputWidthDownscale)
    {
      id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No w_output_shape down_scale in model.output.shape" userInfo:0];
      objc_exception_throw(v9);
    }
  }
  objc_sync_exit(v2);

  v7 = v2->_outputWidthDownscale;
  return v7;
}

- (NSNumber)outputWidthOffset
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_outputWidthOffset)
  {
    v3 = [(CRTextSequenceRecognizerModel *)v2 outputShape];
    v4 = [v3 objectForKeyedSubscript:@"w_output_shape"];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"offset"];
    outputWidthOffset = v2->_outputWidthOffset;
    v2->_outputWidthOffset = (NSNumber *)v5;

    if (!v2->_outputWidthOffset)
    {
      id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No w_output_shape offset in model.output.shape" userInfo:0];
      objc_exception_throw(v9);
    }
  }
  objc_sync_exit(v2);

  v7 = v2->_outputWidthOffset;
  return v7;
}

- (NSNumber)outputFormatVersion
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_outputFormatVersion)
  {
    v3 = [(CRTextSequenceRecognizerModel *)v2 outputShape];
    uint64_t v4 = [v3 objectForKeyedSubscript:@"output_format_version"];
    outputFormatVersion = v2->_outputFormatVersion;
    v2->_outputFormatVersion = (NSNumber *)v4;

    if (!v2->_outputFormatVersion) {
      v2->_outputFormatVersion = (NSNumber *)&unk_1F3933238;
    }
  }
  objc_sync_exit(v2);

  v6 = v2->_outputFormatVersion;
  return v6;
}

- (int)codemapArray
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_codemapArray)
  {
LABEL_2:
    objc_sync_exit(v2);

    return v2->_codemapArray;
  }
  uint64_t v4 = [(CRTextSequenceRecognizerModel *)v2 modelURL];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
    v6 = [(CRTextSequenceRecognizerModel *)v2 modelURL];
    v7 = [v5 bundleWithURL:v6];

    v8 = [v7 pathForResource:@"codemap" ofType:@"bin"];
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
      v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
      v11 = [v10 componentsSeparatedByString:@"\n"];
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 65534);
      v2->_ctcBlankLabelIndex = [v11 indexOfObject:v12];

      if (v2->_ctcBlankLabelIndex == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No blank label in codemap" userInfo:0];
        objc_exception_throw(v18);
      }
      v2->_codemapArray = (int *)malloc_type_calloc([v11 count], 4uLL, 0x100004052888210uLL);
      unint64_t v13 = 0;
      v2->_codemapSize = [v11 count];
      while ([v11 count] > v13)
      {
        v14 = [v11 objectAtIndexedSubscript:v13];
        v2->_codemapArray[v13] = [v14 intValue];

        ++v13;
      }

      goto LABEL_2;
    }
    v15 = CROSLogForCategory(3);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(CRTextSequenceRecognizerModel *)v2 modelURL];
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_ERROR, "No codemap in model: %@", buf, 0xCu);
    }
    v17 = CROSLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v17, OS_LOG_TYPE_FAULT, "Could not read codemap!", buf, 2u);
    }
  }
  else
  {
    v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "Could not find model", buf, 2u);
    }
  }

  objc_sync_exit(v2);
  return 0;
}

- (unint64_t)codemapSize
{
  unint64_t result = [(CRTextSequenceRecognizerModel *)self codemapArray];
  if (result) {
    return self->_codemapSize;
  }
  return result;
}

- (void)dealloc
{
  codemapArray = self->_codemapArray;
  if (codemapArray)
  {
    free(codemapArray);
    self->_codemapArray = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRTextSequenceRecognizerModel;
  [(CRTextSequenceRecognizerModel *)&v4 dealloc];
}

- (id)populateInputBatchData:(float *)a3 lineRegions:(id)a4 image:(id)a5 batchSize:(int64_t)a6 width:(double)a7 configuration:(id)a8 rectifier:(id)a9
{
  v134[4] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v101 = a5;
  id v93 = a8;
  id v91 = a9;
  v96 = v15;
  unint64_t v16 = [v15 count];
  unint64_t v94 = a6;
  if (v16 >= a6) {
    int64_t v17 = a6;
  }
  else {
    int64_t v17 = v16;
  }
  v100 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v17];
  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x2020000000;
  v86 = a3;
  v133 = a3;
  v128[0] = 0;
  v128[1] = v128;
  v128[2] = 0x2810000000;
  v128[3] = &unk_1DD8FDA7A;
  int v129 = 0;
  group = dispatch_group_create();
  int64_t v95 = v17;
  if (v17 >= 1)
  {
    uint64_t v98 = 0;
    uint64_t v18 = 0;
    double v89 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v90 = *MEMORY[0x1E4F1DB28];
    double v87 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v88 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    while (1)
    {
      context = (void *)MEMORY[0x1E01BF820]();
      v19 = [v96 objectAtIndexedSubscript:v18];
      v20 = [v19 boundingQuad];
      [v20 baselineAngle];
      double v22 = v21;

      v23 = [v19 boundingQuad];
      v24 = [v23 denormalizedQuad];
      [v24 boundingBox];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;

      uint64_t v33 = [v101 width];
      uint64_t v34 = [v101 width];
      uint64_t v35 = [v101 height];
      uint64_t v36 = [v101 height];
      double v37 = round(v26);
      double v38 = round(v28);
      double v39 = round(v28 + v32);
      double v40 = fmin(fmax(v37, 0.0), (double)(unint64_t)(v33 - 1));
      double v41 = fmin(fmax(round(v26 + v30) - v37 + v40, 0.0), (double)(unint64_t)(v34 - 1)) - v40;
      double v42 = fmin(fmax(v38, 0.0), (double)(unint64_t)(v35 - 1));
      double v43 = fmin(fmax(v39 - v38 + v42, 0.0), (double)(unint64_t)(v36 - 1)) - v42;
      v136.origin.x = v40;
      v136.origin.y = v42;
      v136.size.width = v41;
      v136.size.height = v43;
      if (!CGRectIsEmpty(v136)) {
        break;
      }
LABEL_18:

      if (v95 == ++v18) {
        goto LABEL_21;
      }
    }
    v44 = (void *)MEMORY[0x1E4F29238];
    v45 = [v19 boundingQuad];
    [v45 topLeft];
    v46 = objc_msgSend(v44, "valueWithPoint:");
    v134[0] = v46;
    v47 = (void *)MEMORY[0x1E4F29238];
    v48 = [v19 boundingQuad];
    [v48 topRight];
    v49 = objc_msgSend(v47, "valueWithPoint:");
    v134[1] = v49;
    v50 = (void *)MEMORY[0x1E4F29238];
    v51 = [v19 boundingQuad];
    [v51 bottomRight];
    v52 = objc_msgSend(v50, "valueWithPoint:");
    v134[2] = v52;
    v53 = (void *)MEMORY[0x1E4F29238];
    v54 = [v19 boundingQuad];
    [v54 bottomLeft];
    v55 = objc_msgSend(v53, "valueWithPoint:");
    v134[3] = v55;
    v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:4];

    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke;
    v126[3] = &unk_1E6CDC360;
    v56 = group;
    v127 = v56;
    v57 = (void (**)(void))MEMORY[0x1E01BFAC0](v126);
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_2;
    v114[3] = &unk_1E6CDC388;
    v115 = v56;
    double v121 = a7;
    id v58 = v93;
    id v116 = v58;
    id v59 = v19;
    double v122 = v40;
    double v123 = v42;
    double v124 = v41;
    double v125 = v43;
    id v117 = v59;
    v119 = v128;
    id v118 = v100;
    v120 = &v130;
    v60 = (void (**)(void, void, void, double, double, double, double, double, double))MEMORY[0x1E01BFAC0](v114);
    v61 = [v59 polygon];
    if (v61)
    {
      v62 = [v59 polygon];
      unint64_t v63 = [v62 pointCount];
      if (v91 && v63 > 3)
      {
        int v64 = [v58 rectifyPolygons];

        if (v64)
        {
          v57[2](v57);
          v65 = [v59 polygon];
          [v58 inputHeight];
          unint64_t v67 = (unint64_t)v66;
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_3;
          v104[3] = &unk_1E6CDC3B0;
          id v105 = v101;
          double v108 = v40;
          double v109 = v42;
          double v110 = v41;
          double v111 = v43;
          id v106 = v97;
          double v112 = v22;
          v107 = v60;
          uint64_t v113 = v98;
          [v91 rectifyPolygonAsync:v65 imageHeight:v67 completionHandler:v104];

LABEL_17:
          ++v98;
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    [v58 angleThresholdForRotatedCrops];
    v68 = v57[2];
    if (fabs(v22) <= v69)
    {
      v68(v57);
      v73 = objc_msgSend(v101, "imageByCroppingRectangle:", v40, v42, v41, v43);
      ((void (**)(void, void *, uint64_t, double, double, double, double, double, double))v60)[2](v60, v73, v98, v41, v43, v90, v89, v88, v87);
    }
    else
    {
      v68(v57);
      long long v70 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v102 = *MEMORY[0x1E4F1DB28];
      long long v103 = v70;
      float v71 = v22;
      *(float *)&double v72 = -v71;
      v73 = objc_msgSend(v101, "imageByCroppingRectangle:textFeaturePoints:radians:rotatedRoi:", v97, &v102, v40, v42, v41, v43, v72);
      ((void (**)(void, void *, uint64_t, double, double, double, double, double, double))v60)[2](v60, v73, v98, *(double *)&v103, *((double *)&v103 + 1), *(double *)&v102, *((double *)&v102 + 1), *(double *)&v103, *((double *)&v103 + 1));
    }

    goto LABEL_17;
  }
  uint64_t v98 = 0;
LABEL_21:
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v74 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v95];
  if ((v98 & 0x8000000000000000) == 0)
  {
    uint64_t v75 = 0;
    do
    {
      v76 = [NSNumber numberWithInteger:v75];
      v77 = [v100 objectForKeyedSubscript:v76];

      if (v77)
      {
        v78 = [NSNumber numberWithInteger:v75];
        v79 = [v100 objectForKeyedSubscript:v78];
        [v74 addObject:v79];
      }
      ++v75;
    }
    while (v98 + 1 != v75);
  }
  if ([v74 count] < v94)
  {
    [v93 inputHeight];
    double v81 = v80;
    uint64_t v82 = [v74 count];
    int v83 = 0;
    v131[3] = (uint64_t)&v86[v82 * (unint64_t)(v81 * a7)];
    while (1)
    {
      [v93 inputHeight];
      if (v84 * a7 * (double)(v94 - [v74 count]) <= (double)v83) {
        break;
      }
      *(_DWORD *)v131[3] = 0;
      v131[3] += 4;
      ++v83;
    }
  }

  _Block_object_dispose(v128, 8);
  _Block_object_dispose(&v130, 8);

  return v74;
}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke(uint64_t a1)
{
}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v17 = a2;
  if ([v17 width] && objc_msgSend(v17, "height"))
  {
    double v39 = a7;
    *(double *)&long long v40 = a8;
    *((double *)&v40 + 1) = a9;
    double v38 = *(double *)(a1 + 80);
    unint64_t v18 = [v17 width];
    [*(id *)(a1 + 40) inputHeight];
    double v20 = v19;
    unint64_t v21 = [v17 height];
    uint64_t v22 = *(void *)(a1 + 88);
    uint64_t v23 = *(void *)(a1 + 96);
    uint64_t v24 = *(void *)(a1 + 104);
    uint64_t v25 = *(void *)(a1 + 112);
    id v26 = *(id *)(a1 + 48);
    self;
    uint64_t v27 = objc_opt_new();
    [(id)v27 setLineRegion:v26];

    if (v27)
    {
      float v28 = fmin(v38 / (double)v18, v20 / (double)v21);
      *(float *)(v27 + 8) = v28;
      *(void *)&long long src = v22;
      *((void *)&src + 1) = v23;
      *(void *)&long long v42 = v24;
      *((void *)&v42 + 1) = v25;
      objc_copyStruct((void *)(v27 + 104), &src, 32, 1, 0);
      *(double *)&long long src = a4;
      *((double *)&src + 1) = a5;
      objc_copyStruct((void *)(v27 + 88), &src, 16, 1, 0);
      *(double *)&long long src = a6;
      *((double *)&src + 1) = v39;
      long long v42 = v40;
      objc_copyStruct((void *)(v27 + 136), &src, 32, 1, 0);
      *(void *)(v27 + 24) = 0;
      objc_setProperty_atomic((id)v27, v29, 0, 40);
      objc_setProperty_atomic((id)v27, v30, 0, 48);
      objc_setProperty_atomic((id)v27, v31, 0, 56);
      *(void *)(v27 + 72) = 0;
      objc_setProperty_atomic((id)v27, v32, 0, 80);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    unint64_t v33 = (unint64_t)*(double *)(a1 + 80);
    [*(id *)(a1 + 40) inputHeight];
    uint64_t v35 = objc_msgSend(v17, "imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:", v33, (unint64_t)v34, objc_msgSend(*(id *)(a1 + 40), "paddingMode"), 0);

    long long src = 0u;
    long long v42 = 0u;
    if (v35) {
      [v35 createFloatBuffer];
    }
    uint64_t v36 = *(void **)(a1 + 56);
    double v37 = [NSNumber numberWithInteger:a3];
    [v36 setObject:v27 forKeyedSubscript:v37];

    memcpy((void *)(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 4 * *((void *)&src + 1) * v42 * a3), (const void *)src, 4 * *((void *)&src + 1) * v42);
    free((void *)src);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

    id v17 = v35;
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  [v12 size];
  double v4 = v3;
  double v6 = v5;
  *(float *)&double v3 = *(double *)(a1 + 88);
  *(float *)&double v7 = -*(float *)&v3;
  objc_msgSend(*(id *)(a1 + 32), "rotatedRoiByCroppingRectangle:textFeaturePoints:radians:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), v7);
  (*(void (**)(double, double, double, double, double, double))(*(void *)(a1 + 48) + 16))(v4, v6, v8, v9, v10, v11);
}

+ (id)defaultModelFileName
{
  v2 = CROSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1DD733000, v2, OS_LOG_TYPE_FAULT, "CRTextSequenceRecognizerModel unexpectedly called directly", v4, 2u);
  }

  return 0;
}

+ (id)defaultURLOfModelInThisBundle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 defaultModelFileName];
  if (v3
    && ([MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 pathForResource:v3 ofType:@"bundle"],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    double v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    double v5 = CROSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      double v7 = [a1 defaultModelFileName];
      int v9 = 138412290;
      double v10 = v7;
      _os_log_impl(&dword_1DD733000, v5, OS_LOG_TYPE_FAULT, "Failed to get path for model %@", (uint8_t *)&v9, 0xCu);
    }
    double v6 = 0;
  }

  return v6;
}

- (NSURL)modelURL
{
  double v3 = [(CRTextSequenceRecognizerModel *)self configuration];
  double v4 = [v3 customModelURL];

  if (v4)
  {
    double v5 = [(CRTextSequenceRecognizerModel *)self configuration];
    double v6 = [v5 customModelURL];
  }
  else
  {
    double v6 = [(id)objc_opt_class() defaultURLOfModelInThisBundle];
  }
  return (NSURL *)v6;
}

- (BOOL)supportCharacterBoxes
{
  return 0;
}

- (TextBoxesOffsets)characterBoxesOffsets
{
  double v2 = 0.0;
  double v3 = 4.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  double v2 = 0.0;
  double v3 = 4.0;
  double v4 = 2.0;
  double v5 = -2.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (CRTextSequenceRecognizerModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRTextSequenceRecognizerModel;
  return [(CRTextSequenceRecognizerModel *)&v5 init];
}

- (id)predictFromInputs:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7
{
  return 0;
}

- (BOOL)preheatWithError:(id *)a3
{
  return 0;
}

- (void)setCodemapArray:(int *)a3
{
  self->_codemapArray = a3;
}

- (void)setCodemapSize:(unint64_t)a3
{
  self->_codemapSize = a3;
}

- (int64_t)ctcBlankLabelIndex
{
  return self->_ctcBlankLabelIndex;
}

- (void)setCtcBlankLabelIndex:(int64_t)a3
{
  self->_ctcBlankLabelIndex = a3;
}

- (void)setOutputShape:(id)a3
{
}

- (void)setOutputWidthDownscale:(id)a3
{
}

- (void)setOutputWidthOffset:(id)a3
{
}

- (void)setOutputFormatVersion:(id)a3
{
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputFormatVersion, 0);
  objc_storeStrong((id *)&self->_outputWidthOffset, 0);
  objc_storeStrong((id *)&self->_outputWidthDownscale, 0);
  objc_storeStrong((id *)&self->_outputShape, 0);
}

@end