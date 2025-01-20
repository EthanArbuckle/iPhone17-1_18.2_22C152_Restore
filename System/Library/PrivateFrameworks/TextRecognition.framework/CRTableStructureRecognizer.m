@interface CRTableStructureRecognizer
+ (id)URLOfModelName:(id)a3;
+ (id)defaultDecoderModelName;
+ (id)defaultEncoderModelName;
+ (id)loadCodemap;
- (BOOL)loadModels;
- (BOOL)preheatWithError:(id *)a3;
- (CRTableStructureRecognizer)init;
- (CRTableStructureRecognizer)initWithComputeDeviceType:(unint64_t)a3 metalDevice:(id)a4;
- (CRTableStructureRecognizer)initWithEncoderName:(id)a3 decoderName:(id)a4 computeDeviceType:(unint64_t)a5 metalDevice:(id)a6;
- (CRTableStructureRecognizerInputFeatures)extractFeaturesFromImage:(SEL)a3 numConfigurationRegions:(id)a4 lines:(int64_t)a5;
- (CRTableStructureRecognizerResultParsed)parseResult:(SEL)a3;
- (NSArray)codemap;
- (id).cxx_construct;
- (id)_recognizeTableStructureBlock:(void *)a3 numConfigurationRegions:(int64_t)a4;
- (id)alignResult:(CRTableStructureRecognizerResultParsed *)a3 lines:(id)a4 lineIndexMap:(vector<unsigned)long;
- (id)getConfigurationStringForNumRegions:(int64_t)a3;
- (id)recognizeDetectedTableInRegion:(id)a3 filteredResults:(id)a4 tableIndex:(unint64_t)a5 image:(id)a6;
- (id)recognizeTableStructure:(void *)a3 numConfigurationRegions:(int64_t)a4;
- (id)tableGroupRegionFromResult:(id)a3 recognizedLines:(id)a4;
- (int)getEncoderEngine:(unint64_t)a3;
- (int64_t)getConfigurationNumRegions:(int64_t)a3;
- (vector<double,)readBinValuesStartingAtIndex:()vector<double tokenIndexes:(std:(SEL)a3 :(int *)a4 allocator<double>> *)self;
- (vector<float,)normalizedLineRegions:(CRTableStructureRecognizer *)self numConfigurationRegions:(SEL)a3 usingMinMaxNorm:(id)a4;
- (void)reduceMemoryByResizing;
@end

@implementation CRTableStructureRecognizer

+ (id)defaultEncoderModelName
{
  return @"tsr_encoder.mlmodelc";
}

+ (id)defaultDecoderModelName
{
  return @"tsr_decoder.mlmodelc";
}

- (CRTableStructureRecognizer)init
{
  return [(CRTableStructureRecognizer *)self initWithComputeDeviceType:0 metalDevice:0];
}

- (CRTableStructureRecognizer)initWithComputeDeviceType:(unint64_t)a3 metalDevice:(id)a4
{
  id v6 = a4;
  v7 = [(id)objc_opt_class() defaultEncoderModelName];
  v8 = [(id)objc_opt_class() defaultDecoderModelName];
  v9 = [(CRTableStructureRecognizer *)self initWithEncoderName:v7 decoderName:v8 computeDeviceType:a3 metalDevice:v6];

  return v9;
}

- (int)getEncoderEngine:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t computeDeviceType = self->_computeDeviceType;
  if (computeDeviceType == 1)
  {
    int v4 = 0;
    v5 = @"CPU";
  }
  else if (computeDeviceType == 2)
  {
    int v4 = 5;
    v5 = @"MPS";
  }
  else
  {
    int HasModernNeuralEngine = deviceHasModernNeuralEngine();
    if (HasModernNeuralEngine) {
      v5 = @"ANE";
    }
    else {
      v5 = @"MPS";
    }
    if (HasModernNeuralEngine) {
      int v4 = 10007;
    }
    else {
      int v4 = 5;
    }
  }
  v7 = CROSLogForCategory(5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEBUG, "Encoder running %@", (uint8_t *)&v9, 0xCu);
  }

  return v4;
}

- (BOOL)loadModels
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (CRTableStructureRecognizer)initWithEncoderName:(id)a3 decoderName:(id)a4 computeDeviceType:(unint64_t)a5 metalDevice:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CRTableStructureRecognizer;
  v14 = [(CRTableStructureRecognizer *)&v19 init];
  v15 = v14;
  if (v14
    && (objc_storeStrong((id *)&v14->_encoderName, a3),
        objc_storeStrong((id *)&v15->_decoderName, a4),
        v15->_unint64_t computeDeviceType = a5,
        objc_storeStrong((id *)&v15->_metalDevice, a6),
        BOOL v16 = [(CRTableStructureRecognizer *)v15 loadModels],
        v15->_modelsLoaded = v16,
        v16))
  {
    v17 = v15;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)URLOfModelName:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 pathForResource:v3 ofType:@"bundle"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "Failed to load ch_table_model", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)loadCodemap
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  int v4 = [v2 pathForResource:@"tsr_codemap" ofType:@"json.lzfse"];
  v5 = [v3 dataWithContentsOfFile:v4];

  id v6 = NSString;
  v7 = [v2 pathForResource:@"tsr_codemap" ofType:@"json.lzfse.size"];
  id v17 = 0;
  v8 = [v6 stringWithContentsOfFile:v7 encoding:4 error:&v17];
  id v9 = v17;

  if (!v9)
  {
    v10 = uncompressDataOfSize(v5, [v8 integerValue]);
    if (v10)
    {
      id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:1 error:0];
      v14 = v13;
      if (v13)
      {
        id v12 = [v13 objectForKeyedSubscript:@"codemap"];
LABEL_14:

        goto LABEL_15;
      }
      v15 = CROSLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_FAULT, "Failed to parse the JSON table structure recognition codemap", buf, 2u);
      }

      v14 = 0;
    }
    else
    {
      v14 = CROSLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_FAULT, "Failed to load table structure recognition codemap", buf, 2u);
      }
    }
    id v12 = 0;
    goto LABEL_14;
  }
  v10 = CROSLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    id v11 = [v9 localizedDescription];
    *(_DWORD *)buf = 138412290;
    objc_super v19 = v11;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Failed to load table structure recognition codemap size: %@", buf, 0xCu);
  }
  id v12 = 0;
LABEL_15:

  return v12;
}

- (int64_t)getConfigurationNumRegions:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  for (unint64_t i = 0; i < [(NSArray *)self->_modelConfigurationsNumRegions count]; ++i)
  {
    id v6 = [(NSArray *)self->_modelConfigurationsNumRegions objectAtIndexedSubscript:i];
    int64_t v7 = (int)[v6 intValue];

    if (v7 >= a3) {
      break;
    }
  }
  if (i >= [(NSArray *)self->_modelConfigurationsNumRegions count])
  {
    v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v12 = 134217984;
      int64_t v13 = a3;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Unexpected number of input regions %lu", (uint8_t *)&v12, 0xCu);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = [(NSArray *)self->_modelConfigurationsNumRegions objectAtIndexedSubscript:i];
    int64_t v9 = (int)[v8 intValue];
  }
  return v9;
}

- (id)getConfigurationStringForNumRegions:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu_regions", a3);
}

- (CRTableStructureRecognizerInputFeatures)extractFeaturesFromImage:(SEL)a3 numConfigurationRegions:(id)a4 lines:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v11 count];
  int64_t v13 = CROSLogForCategory(5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_DEBUG, "Num Regions: %d", buf, 8u);
  }

  [(CRTableStructureRecognizer *)self normalizedLineRegions:v11 numConfigurationRegions:a5 usingMinMaxNorm:_regionMinMaxNorm];
  uint64_t v14 = [v10 imageByScalingToWidth:_modelImageSize height:_modelImageSize];
  v15 = v14;
  *(_OWORD *)buf = 0u;
  long long v24 = 0u;
  if (v14) {
    [v14 createFloatBuffer];
  }
  int v18 = 0;
  std::vector<float>::vector(&__b, a5, &v18);
  memset(__b, 1, 4 * v12);
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2.var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  if (&__p != (void **)retstr) {
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)retstr, (char *)__p, (uint64_t)v22, (v22 - (unsigned char *)__p) >> 2);
  }
  if (&retstr->var1 != (vector<float, std::allocator<float>> *)&__b) {
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)&retstr->var1, (char *)__b, (uint64_t)v20, (v20 - (unsigned char *)__b) >> 2);
  }
  long long v16 = v24;
  *(_OWORD *)&retstr->var2.data = *(_OWORD *)buf;
  *(_OWORD *)&retstr->var2.width = v16;
  if (__b)
  {
    uint64_t v20 = __b;
    operator delete(__b);
  }

  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }

  return result;
}

- (BOOL)preheatWithError:(id *)a3
{
  BOOL modelsLoaded = self->_modelsLoaded;
  if (a3 && !self->_modelsLoaded)
  {
    *a3 = +[CRImageReader errorWithErrorCode:-8];
    return self->_modelsLoaded;
  }
  return modelsLoaded;
}

- (id)recognizeDetectedTableInRegion:(id)a3 filteredResults:(id)a4 tableIndex:(unint64_t)a5 image:(id)a6
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v114 = a6;
  v111 = v9;
  id v11 = [CRNormalizedQuad alloc];
  objc_msgSend(*(id *)(*objc_msgSend(v9, "tableRegions") + 8 * a5), "topLeft");
  double v13 = v12;
  double v15 = v14;
  objc_msgSend(*(id *)(*objc_msgSend(v9, "tableRegions") + 8 * a5), "topRight");
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(*(id *)(*objc_msgSend(v9, "tableRegions") + 8 * a5), "bottomRight");
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(*(id *)(*objc_msgSend(v9, "tableRegions") + 8 * a5), "bottomLeft");
  double v25 = v24;
  double v27 = v26;
  [v114 size];
  v30 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v11, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v13, v15, v17, v19, v21, v23, v25, v27, v28, v29);
  v113 = [(CRGroupRegion *)[CRTableGroupRegion alloc] initWithBoundingQuad:v30 layoutDirection:0 subregions:0];
  v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  unint64_t v32 = 0;
  __p = 0;
  v158 = 0;
  unint64_t v159 = 0;
  while (v32 < [v10 count])
  {
    v33 = [v10 objectAtIndexedSubscript:v32];
    v34 = [v33 detectedLineRegion];

    v35 = [v34 boundingQuad];
    [v35 midPoint];
    double v37 = v36;
    double v39 = v38;

    if (-[CRNormalizedQuad containsNormalizedPoint:](v30, "containsNormalizedPoint:", v37, v39))
    {
      [v31 addObject:v34];
      v40 = v158;
      if ((unint64_t)v158 >= v159)
      {
        v42 = __p;
        uint64_t v43 = ((char *)v158 - (unsigned char *)__p) >> 3;
        unint64_t v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v45 = v159 - (void)__p;
        if ((uint64_t)(v159 - (void)__p) >> 2 > v44) {
          unint64_t v44 = v45 >> 2;
        }
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v46 = v44;
        }
        if (v46)
        {
          v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v159, v46);
          v42 = __p;
          v40 = v158;
        }
        else
        {
          v47 = 0;
        }
        v48 = (unint64_t *)&v47[8 * v43];
        unint64_t *v48 = v32;
        v41 = v48 + 1;
        while (v40 != v42)
        {
          unint64_t v49 = *--v40;
          *--v48 = v49;
        }
        __p = v48;
        v158 = v41;
        unint64_t v159 = (unint64_t)&v47[8 * v46];
        if (v42) {
          operator delete(v42);
        }
      }
      else
      {
        void *v158 = v32;
        v41 = v40 + 1;
      }
      v158 = v41;
    }

    ++v32;
  }
  if (![v31 count])
  {
    v51 = CROSLogForCategory(5);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v51, OS_LOG_TYPE_DEBUG, "Rejecting table because it doesn't overlap with text.", buf, 2u);
    }
    goto LABEL_29;
  }
  int64_t v50 = -[CRTableStructureRecognizer getConfigurationNumRegions:](self, "getConfigurationNumRegions:", [v31 count]);
  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v51 = CROSLogForCategory(5);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = [v31 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_impl(&dword_1DD733000, v51, OS_LOG_TYPE_DEBUG, "Rejecting table because too many input lines: %lu", buf, 0xCu);
    }
LABEL_29:

    v53 = 0;
    goto LABEL_100;
  }
  v54 = [(CRGroupRegion *)v113 boundingQuad];
  v110 = [v114 imageByRectifyingRegion:v54 toColorSpace:0 homography:&v154];

  v55 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v31, "count"));
  for (unint64_t i = 0; [v31 count] > i; ++i)
  {
    v57 = [v31 objectAtIndexedSubscript:i];
    v58 = (void *)[v57 mutableCopy];

    v59 = [v31 objectAtIndexedSubscript:i];
    v60 = [v59 boundingQuad];

    v61 = [CRNormalizedQuad alloc];
    float32x4_t v123 = v155;
    float32x4_t v115 = v154;
    float32x4_t v119 = v156;
    [v60 topLeft];
    float v64 = v62;
    float v65 = v63;
    float32x4_t v67 = vaddq_f32(v119, vmlaq_n_f32(vmulq_n_f32(v115, v64), v123, v65));
    double v66 = (float)(v67.f32[0] / v67.f32[2]);
    *(double *)v67.i64 = (float)(v67.f32[1] / v67.f32[2]);
    if (v67.f32[2] == 0.0) {
      double v68 = v62;
    }
    else {
      double v68 = v66;
    }
    if (v67.f32[2] == 0.0) {
      double v69 = v63;
    }
    else {
      double v69 = *(double *)v67.i64;
    }
    float32x4_t v124 = v155;
    float32x4_t v116 = v154;
    float32x4_t v120 = v156;
    [v60 topRight];
    double v71 = v70;
    double v73 = v72;
    *(float *)&double v70 = v70;
    *(float *)&double v72 = v72;
    float32x4_t v74 = vaddq_f32(v120, vmlaq_n_f32(vmulq_n_f32(v116, *(float *)&v70), v124, *(float *)&v72));
    if (v74.f32[2] != 0.0)
    {
      double v71 = (float)(v74.f32[0] / v74.f32[2]);
      double v73 = (float)(v74.f32[1] / v74.f32[2]);
    }
    float32x4_t v125 = v155;
    float32x4_t v117 = v154;
    float32x4_t v121 = v156;
    [v60 bottomRight];
    double v76 = v75;
    double v78 = v77;
    *(float *)&double v75 = v75;
    *(float *)&double v77 = v77;
    float32x4_t v79 = vaddq_f32(v121, vmlaq_n_f32(vmulq_n_f32(v117, *(float *)&v75), v125, *(float *)&v77));
    if (v79.f32[2] != 0.0)
    {
      double v76 = (float)(v79.f32[0] / v79.f32[2]);
      double v78 = (float)(v79.f32[1] / v79.f32[2]);
    }
    float32x4_t v126 = v155;
    float32x4_t v118 = v154;
    float32x4_t v122 = v156;
    [v60 bottomLeft];
    double v81 = v80;
    double v83 = v82;
    *(float *)&double v80 = v80;
    *(float *)&double v82 = v82;
    float32x4_t v84 = vaddq_f32(v122, vmlaq_n_f32(vmulq_n_f32(v118, *(float *)&v80), v126, *(float *)&v82));
    if (v84.f32[2] != 0.0)
    {
      double v81 = (float)(v84.f32[0] / v84.f32[2]);
      double v83 = (float)(v84.f32[1] / v84.f32[2]);
    }
    [v114 size];
    v87 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v61, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v68, v69, v71, v73, v76, v78, v81, v83, v85, v86);
    [v58 setBoundingQuad:v87];

    [v55 addObject:v58];
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v88 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v89 = os_signpost_id_generate(v88);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v90 = (id)CRSignpostLog_signPostOSLog;
  v91 = v90;
  if (v89 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v90))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v89, "OCRTableStructureInferenceTime", "", buf, 2u);
  }

  [(CRTableStructureRecognizer *)self extractFeaturesFromImage:v110 numConfigurationRegions:v50 lines:v55];
  v92 = [(CRTableStructureRecognizer *)self recognizeTableStructure:&v153 numConfigurationRegions:v50];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v93 = (id)CRSignpostLog_signPostOSLog;
  v94 = v93;
  if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v94, OS_SIGNPOST_INTERVAL_END, v89, "OCRTableStructureInferenceTime", "", buf, 2u);
  }

  if (!v92) {
    goto LABEL_84;
  }
  [v92 programTokenIdxs];
  uint64_t v95 = *(void *)&buf[8];
  uint64_t v96 = *(void *)buf;
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  if (v95 == v96)
  {
LABEL_84:
    v106 = CROSLogForCategory(5);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v106, OS_LOG_TYPE_DEBUG, "Rejecting table because nil or empty program.", buf, 2u);
    }

    v53 = 0;
    goto LABEL_99;
  }
  [v92 programTokenIdxs];
  uint64_t v97 = (int)**(_DWORD **)buf;
  unint64_t noTableIndex = self->_noTableIndex;
  *(void *)&buf[8] = *(void *)buf;
  operator delete(*(void **)buf);
  if (noTableIndex == v97)
  {
    v99 = CROSLogForCategory(5);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v99, OS_LOG_TYPE_DEBUG, "<NO_Table>", buf, 2u);
    }
  }
  [(CRTableStructureRecognizer *)self parseResult:v92];
  v100 = CROSLogForCategory(5);
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
  {
    v127 = [v92 programString];
    v101 = [v92 programTokens];
    uint64_t v102 = [v101 count];
    uint64_t v103 = *(void *)buf;
    uint64_t v104 = *(void *)&buf[8];
    uint64_t v105 = [v55 count];
    *(_DWORD *)v160 = 138413058;
    v161 = v127;
    __int16 v162 = 2048;
    uint64_t v163 = v102;
    __int16 v164 = 2048;
    uint64_t v165 = v104 * v103;
    __int16 v166 = 2048;
    uint64_t v167 = v105;
    _os_log_impl(&dword_1DD733000, v100, OS_LOG_TYPE_DEBUG, "Predicted program: %@, length: %lu, table-size: %lu - for table with %lu line regions", v160, 0x2Au);
  }
  if (v169)
  {
    if (*(void *)buf >= 2uLL && *(void *)&buf[8] > 1uLL)
    {
      long long v142 = *(_OWORD *)buf;
      char v143 = v169;
      v145 = 0;
      uint64_t v146 = 0;
      v144 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v144, v170, (uint64_t)v171, (v171 - (unsigned char *)v170) >> 3);
      v147 = 0;
      v148 = 0;
      uint64_t v149 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v147, v172, (uint64_t)v173, (v173 - (unsigned char *)v172) >> 3);
      v150 = 0;
      v151 = 0;
      uint64_t v152 = 0;
      std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&v150, v174, (uint64_t)v175, (v175 - (unsigned char *)v174) >> 5);
      v139 = 0;
      v140 = 0;
      uint64_t v141 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v139, __p, (uint64_t)v158, ((char *)v158 - (unsigned char *)__p) >> 3);
      v53 = [(CRTableStructureRecognizer *)self alignResult:&v142 lines:v55 lineIndexMap:&v139];
      if (v139)
      {
        v140 = v139;
        operator delete(v139);
      }
      if (v150)
      {
        v151 = v150;
        operator delete(v150);
      }
      if (v147)
      {
        v148 = v147;
        operator delete(v147);
      }
      if (v144)
      {
        v145 = v144;
        operator delete(v144);
      }
      [v53 setProgram:v92];
      [v53 setTableQuad:v30];
      long long v128 = *(_OWORD *)buf;
      char v129 = v169;
      v131 = 0;
      uint64_t v132 = 0;
      v130 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v130, v170, (uint64_t)v171, (v171 - (unsigned char *)v170) >> 3);
      v133 = 0;
      v134 = 0;
      uint64_t v135 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v133, v172, (uint64_t)v173, (v173 - (unsigned char *)v172) >> 3);
      v136 = 0;
      v137 = 0;
      uint64_t v138 = 0;
      std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&v136, v174, (uint64_t)v175, (v175 - (unsigned char *)v174) >> 5);
      [v53 setParsedProgram:&v128];
      if (v136)
      {
        v137 = v136;
        operator delete(v136);
      }
      if (v133)
      {
        v134 = v133;
        operator delete(v133);
      }
      if (v130)
      {
        v131 = v130;
        operator delete(v130);
      }
      goto LABEL_93;
    }
    v107 = CROSLogForCategory(5);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v160 = 134218240;
      v161 = *(void **)buf;
      __int16 v162 = 2048;
      uint64_t v163 = *(void *)&buf[8];
      _os_log_impl(&dword_1DD733000, v107, OS_LOG_TYPE_DEBUG, "Rejecting table because invalid size: num_rows: %lu num_cols: %lu.", v160, 0x16u);
    }
  }
  else
  {
    v107 = CROSLogForCategory(5);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      v108 = [v92 programString];
      *(_DWORD *)v160 = 138412290;
      v161 = v108;
      _os_log_impl(&dword_1DD733000, v107, OS_LOG_TYPE_DEBUG, "Rejecting table because program is invalid %@", v160, 0xCu);
    }
  }

  v53 = 0;
LABEL_93:
  if (v174)
  {
    v175 = v174;
    operator delete(v174);
  }
  if (v172)
  {
    v173 = v172;
    operator delete(v172);
  }
  if (v170)
  {
    v171 = v170;
    operator delete(v170);
  }
LABEL_99:
  CRTableStructureRecognizerInputFeatures::~CRTableStructureRecognizerInputFeatures(&v153);

LABEL_100:
  if (__p)
  {
    v158 = __p;
    operator delete(__p);
  }

  return v53;
}

- (id)recognizeTableStructure:(void *)a3 numConfigurationRegions:(int64_t)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  double v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CRTableStructureRecognizer_recognizeTableStructure_numConfigurationRegions___block_invoke;
  v7[3] = &unk_1E6CDB2E8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __78__CRTableStructureRecognizer_recognizeTableStructure_numConfigurationRegions___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v2 = [*(id *)(a1 + 32) _recognizeTableStructureBlock:*(void *)(a1 + 48) numConfigurationRegions:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_recognizeTableStructureBlock:(void *)a3 numConfigurationRegions:(int64_t)a4
{
  id v6 = [(CRTableStructureRecognizer *)self getConfigurationStringForNumRegions:a4];
  value = self->_encoderModel.__ptr_.__value_;
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v8, "UTF8String", v8));
  char v9 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)value, buf);
  char v10 = v9;
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(buf[0].__r_.__value_.__l.__data_);
    if (v10) {
      goto LABEL_8;
    }
  }
  else if (v9)
  {
    goto LABEL_8;
  }
  id v11 = CROSLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_ERROR, "Error selecting encoder espresso configuration", (uint8_t *)buf, 2u);
  }

LABEL_8:
  double v12 = self->_decoderModel.__ptr_.__value_;
  id v13 = v8;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v13 UTF8String]);
  char v14 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)v12, buf);
  char v15 = v14;
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(buf[0].__r_.__value_.__l.__data_);
    if (v15) {
      goto LABEL_15;
    }
  }
  else if (v14)
  {
    goto LABEL_15;
  }
  double v16 = CROSLogForCategory(5);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_ERROR, "Error selecting decoder espresso configuration", (uint8_t *)buf, 2u);
  }

LABEL_15:
  double v17 = self->_encoderModel.__ptr_.__value_;
  uint64_t v18 = *(void *)a3;
  uint64_t v19 = _numRegionFeatures;
  double v20 = (int64x2_t *)operator new(0x20uLL);
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)&v20[2];
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)&v20[2];
  *double v20 = vdupq_n_s64(1uLL);
  v20[1].i64[0] = a4;
  v20[1].i64[1] = v19;
  buf[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v20;
  int v21 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v17, v18);
  if (buf[0].__r_.__value_.__r.__words[0])
  {
    buf[0].__r_.__value_.__l.__size_ = buf[0].__r_.__value_.__r.__words[0];
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  if (!v21) {
    goto LABEL_24;
  }
  double v22 = self->_encoderModel.__ptr_.__value_;
  uint64_t v23 = *((void *)a3 + 6);
  uint64_t v24 = _numChannels;
  uint64_t v25 = _modelImageSize;
  double v26 = operator new(0x20uLL);
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)(v26 + 4);
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)(v26 + 4);
  *double v26 = 1;
  v26[1] = v24;
  v26[2] = v25;
  v26[3] = v25;
  buf[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
  int v27 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v22, v23);
  if (buf[0].__r_.__value_.__r.__words[0])
  {
    buf[0].__r_.__value_.__l.__size_ = buf[0].__r_.__value_.__r.__words[0];
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  if (!v27) {
    goto LABEL_24;
  }
  uint64_t v28 = self->_encoderModel.__ptr_.__value_;
  uint64_t v29 = *((void *)a3 + 3);
  v30 = (int64x2_t *)operator new(0x20uLL);
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)&v30[2];
  buf[0].__r_.__value_.__r.__words[2] = (std::string::size_type)&v30[2];
  int64x2_t *v30 = vdupq_n_s64(1uLL);
  v30[1].i64[0] = 1;
  v30[1].i64[1] = a4;
  buf[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  char v31 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v28, v29);
  if (buf[0].__r_.__value_.__r.__words[0])
  {
    buf[0].__r_.__value_.__l.__size_ = buf[0].__r_.__value_.__r.__words[0];
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }
  if ((v31 & 1) == 0)
  {
LABEL_24:
    unint64_t v32 = CROSLogForCategory(5);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1DD733000, v32, OS_LOG_TYPE_ERROR, "Error binding encoder inputs", (uint8_t *)buf, 2u);
    }
  }
  if (!CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)buf, (uint64_t)"encoded_regions", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)v116, (uint64_t)"encoded_regions_projected", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)v115, (uint64_t)"decoder_state_h", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)v114, (uint64_t)"decoder_state_c", 1)
    || (CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_encoderModel.__ptr_.__value_, (uint64_t)__A, (uint64_t)"y", 1) & 1) == 0)
  {
    v33 = CROSLogForCategory(5);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v112.__begin_) = 0;
      _os_log_impl(&dword_1DD733000, v33, OS_LOG_TYPE_ERROR, "Error binding encoder outputs", (uint8_t *)&v112, 2u);
    }
  }
  if (!CoreRecognition::EspressoModelWrapper::execute((CoreRecognition::EspressoModelWrapper *)self->_encoderModel.__ptr_.__value_))
  {
    v34 = CROSLogForCategory(5);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v112.__begin_) = 0;
      _os_log_impl(&dword_1DD733000, v34, OS_LOG_TYPE_ERROR, "ENCODER PREDICTION ERROR", (uint8_t *)&v112, 2u);
    }
  }
  v35 = (void *)*((void *)a3 + 6);
  if (v35)
  {
    free(v35);
    *((void *)a3 + 6) = 0;
  }
  v99 = v13;
  v100 = objc_alloc_init(CRTableStructureRecognizerResultProgram);
  memset(&v112, 0, sizeof(v112));
  std::vector<int>::reserve(&v112, _maxDecodingSteps);
  double v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:_maxDecodingSteps];
  if (_maxDecodingSteps)
  {
    uint64_t v37 = 0;
    int64x2_t v102 = vdupq_n_s64(1uLL);
    while (1)
    {
      double v38 = (void *)MEMORY[0x1E01BF820]();
      double v39 = self->_decoderModel.__ptr_.__value_;
      v40 = __A[0];
      unint64_t codemapSize = self->_codemapSize;
      v42 = (int64x2_t *)operator new(0x20uLL);
      v110 = v42 + 2;
      v111 = v42 + 2;
      int64x2_t *v42 = v102;
      v42[1].i64[0] = 1;
      v42[1].i64[1] = codemapSize;
      __p = v42;
      int v43 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v39, (uint64_t)v40);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v43) {
        goto LABEL_61;
      }
      unint64_t v44 = self->_decoderModel.__ptr_.__value_;
      uint64_t v45 = v115[0];
      unint64_t v46 = (int64x2_t *)operator new(0x20uLL);
      v110 = v46 + 2;
      v111 = v46 + 2;
      *unint64_t v46 = (int64x2_t)xmmword_1DD8CE3E0;
      v46[1] = (int64x2_t)unk_1DD8CE3F0;
      __p = v46;
      int v47 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v44, v45);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v47) {
        goto LABEL_61;
      }
      v48 = self->_decoderModel.__ptr_.__value_;
      uint64_t v49 = v114[0];
      int64_t v50 = (int64x2_t *)operator new(0x20uLL);
      v110 = v50 + 2;
      v111 = v50 + 2;
      *int64_t v50 = (int64x2_t)xmmword_1DD8CE3E0;
      v50[1] = (int64x2_t)unk_1DD8CE3F0;
      __p = v50;
      int v51 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v48, v49);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v51) {
        goto LABEL_61;
      }
      uint64_t v52 = self->_decoderModel.__ptr_.__value_;
      uint64_t v53 = v116[0];
      v54 = (int64x2_t *)operator new(0x20uLL);
      v110 = v54 + 2;
      v111 = v54 + 2;
      int64x2_t *v54 = vdupq_n_s64(1uLL);
      v54[1].i64[0] = a4;
      v54[1].i64[1] = 256;
      __p = v54;
      int v55 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v52, v53);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v55) {
        goto LABEL_61;
      }
      v56 = self->_decoderModel.__ptr_.__value_;
      uint64_t v57 = buf[0].__r_.__value_.__r.__words[0];
      v58 = (int64x2_t *)operator new(0x20uLL);
      v110 = v58 + 2;
      v111 = v58 + 2;
      int64x2_t *v58 = vdupq_n_s64(1uLL);
      v58[1].i64[0] = a4;
      v58[1].i64[1] = 32;
      __p = v58;
      int v59 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v56, v57);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if (!v59) {
        goto LABEL_61;
      }
      v60 = self->_decoderModel.__ptr_.__value_;
      uint64_t v61 = *((void *)a3 + 3);
      double v62 = (int64x2_t *)operator new(0x20uLL);
      v110 = v62 + 2;
      v111 = v62 + 2;
      *double v62 = vdupq_n_s64(1uLL);
      v62[1].i64[0] = 1;
      v62[1].i64[1] = a4;
      __p = v62;
      char v63 = CoreRecognition::EspressoModelWrapper::bindInput((uint64_t)v60, v61);
      if (__p)
      {
        v110 = (int64x2_t *)__p;
        operator delete(__p);
      }
      if ((v63 & 1) == 0)
      {
LABEL_61:
        float v64 = CROSLogForCategory(5);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_1DD733000, v64, OS_LOG_TYPE_ERROR, "Error binding decoder outputs", (uint8_t *)&__p, 2u);
        }
      }
      if (!CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_decoderModel.__ptr_.__value_, (uint64_t)v115, (uint64_t)"new_decoder_state_h", 1)|| !CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_decoderModel.__ptr_.__value_, (uint64_t)v114, (uint64_t)"new_decoder_state_c", 1)|| (CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)self->_decoderModel.__ptr_.__value_, (uint64_t)__A, (uint64_t)"y", 1) & 1) == 0)
      {
        float v65 = CROSLogForCategory(5);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_1DD733000, v65, OS_LOG_TYPE_ERROR, "Error binding decoder outputs", (uint8_t *)&__p, 2u);
        }
      }
      if (!CoreRecognition::EspressoModelWrapper::execute((CoreRecognition::EspressoModelWrapper *)self->_decoderModel.__ptr_.__value_))
      {
        double v66 = CROSLogForCategory(5);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_1DD733000, v66, OS_LOG_TYPE_ERROR, "DECODER PREDICTION ERROR", (uint8_t *)&__p, 2u);
        }
      }
      __p = 0;
      float __C = -3.4028e38;
      vDSP_maxmgvi(__A[0], 1, &__C, (vDSP_Length *)&__p, self->_codemapSize);
      if (__p == (void *)-1) {
        break;
      }
      float32x4_t v67 = -[NSArray objectAtIndexedSubscript:](self->_codemap, "objectAtIndexedSubscript:");
      int v68 = (int)__p;
      std::vector<int>::pointer end = v112.__end_;
      if (v112.__end_ >= v112.__end_cap_.__value_)
      {
        std::vector<int>::pointer begin = v112.__begin_;
        int64_t v72 = v112.__end_ - v112.__begin_;
        unint64_t v73 = v72 + 1;
        if ((unint64_t)(v72 + 1) >> 62) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        int64_t v74 = (char *)v112.__end_cap_.__value_ - (char *)v112.__begin_;
        if (((char *)v112.__end_cap_.__value_ - (char *)v112.__begin_) >> 1 > v73) {
          unint64_t v73 = v74 >> 1;
        }
        if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v75 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v75 = v73;
        }
        if (v75)
        {
          double v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v112.__end_cap_, v75);
          std::vector<int>::pointer begin = v112.__begin_;
          std::vector<int>::pointer end = v112.__end_;
        }
        else
        {
          double v76 = 0;
        }
        double v77 = (int *)&v76[4 * v72];
        *double v77 = v68;
        double v70 = v77 + 1;
        while (end != begin)
        {
          int v78 = *--end;
          *--double v77 = v78;
        }
        v112.__begin_ = v77;
        v112.__end_ = v70;
        v112.__end_cap_.__value_ = (int *)&v76[4 * v75];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        *v112.__end_ = (int)__p;
        double v70 = end + 1;
      }
      v112.__end_ = v70;
      [v36 addObject:v67];
      if (__p == (void *)self->_eopIndex || __p == (void *)self->_noTableIndex) {
        goto LABEL_95;
      }
      bzero(__A[0], 4 * self->_codemapSize);
      __A[0][(void)__p] = 1.0;
      char v79 = 1;
LABEL_96:

      if ((v79 & 1) != 0 && ++v37 < (unint64_t)_maxDecodingSteps) {
        continue;
      }
      goto LABEL_100;
    }
    float32x4_t v67 = CROSLogForCategory(0);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v107 = 0;
      _os_log_impl(&dword_1DD733000, v67, OS_LOG_TYPE_FAULT, "Unexpected TSR decoder output", v107, 2u);
    }
LABEL_95:
    char v79 = 0;
    goto LABEL_96;
  }
LABEL_100:
  std::vector<int>::pointer v80 = v112.__begin_;
  std::vector<int>::pointer v81 = v112.__end_;
  int64_t v82 = (char *)v112.__end_ - (char *)v112.__begin_;
  if (v112.__end_ != v112.__begin_)
  {
    uint64_t v83 = v82 >> 2;
    unint64_t eopIndex = self->_eopIndex;
    if (eopIndex != v112.__begin_[(v82 >> 2) - 1])
    {
      if (v112.__end_ >= v112.__end_cap_.__value_)
      {
        unint64_t v86 = v83 + 1;
        if ((unint64_t)(v83 + 1) >> 62) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        int64_t v87 = (char *)v112.__end_cap_.__value_ - (char *)v112.__begin_;
        if (((char *)v112.__end_cap_.__value_ - (char *)v112.__begin_) >> 1 > v86) {
          unint64_t v86 = v87 >> 1;
        }
        if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v88 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v88 = v86;
        }
        if (v88)
        {
          os_signpost_id_t v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v112.__end_cap_, v88);
          std::vector<int>::pointer v80 = v112.__begin_;
          std::vector<int>::pointer v81 = v112.__end_;
        }
        else
        {
          os_signpost_id_t v89 = 0;
        }
        v90 = (int *)&v89[4 * v83];
        v91 = (int *)&v89[4 * v88];
        int *v90 = eopIndex;
        uint64_t v85 = v90 + 1;
        while (v81 != v80)
        {
          int v92 = *--v81;
          *--v90 = v92;
        }
        v112.__begin_ = v90;
        v112.__end_ = v85;
        v112.__end_cap_.__value_ = v91;
        if (v80) {
          operator delete(v80);
        }
      }
      else
      {
        *v112.__end_ = eopIndex;
        uint64_t v85 = v81 + 1;
      }
      v112.__end_ = v85;
      v93 = [(NSArray *)self->_codemap objectAtIndexedSubscript:self->_eopIndex];
      [v36 addObject:v93];
    }
  }
  [(CRTableStructureRecognizerResultProgram *)v100 setProgramTokens:v36];
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v104, v112.__begin_, (uint64_t)v112.__end_, v112.__end_ - v112.__begin_);
  [(CRTableStructureRecognizerResultProgram *)v100 setProgramTokenIdxs:&v104];
  if (v104)
  {
    uint64_t v105 = v104;
    operator delete(v104);
  }
  int64_t inferenceCount = self->_inferenceCount;
  dispatch_time_t v95 = dispatch_time(0, 2000000000);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CRTableStructureRecognizer__recognizeTableStructureBlock_numConfigurationRegions___block_invoke;
  block[3] = &unk_1E6CDB310;
  block[4] = self;
  block[5] = inferenceCount;
  dispatch_after(v95, queue, block);
  uint64_t v97 = v100;

  if (v112.__begin_)
  {
    v112.__end_ = v112.__begin_;
    operator delete(v112.__begin_);
  }

  return v97;
}

void *__84__CRTableStructureRecognizer__recognizeTableStructureBlock_numConfigurationRegions___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[9]) {
    return (void *)[result reduceMemoryByResizing];
  }
  return result;
}

- (vector<double,)readBinValuesStartingAtIndex:()vector<double tokenIndexes:(std:(SEL)a3 :(int *)a4 allocator<double>> *)self
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  int v6 = *a4;
  std::vector<int>::pointer begin = a5->__begin_;
  std::vector<int>::pointer end = a5->__end_;
  unint64_t v9 = end - a5->__begin_;
  if (v9 <= *a4) {
    return self;
  }
  double v12 = self;
  id v13 = 0;
  unint64_t v14 = 0;
  char v15 = 0;
  uint64_t v16 = v6;
  p_end_cap = &retstr->__end_cap_;
  do
  {
    unint64_t v18 = begin[v16];
    uint64_t v19 = v12[5].__begin_;
    unint64_t v20 = v18 - (void)v19;
    if (v18 < (unint64_t)v19) {
      break;
    }
    value = v12[5].__end_cap_.__value_;
    if ((unint64_t)value < v18) {
      break;
    }
    if (v14 > v20) {
      return self;
    }
    if (v14 != v20)
    {
      unint64_t v14 = v20;
LABEL_11:
      if (v13 >= p_end_cap->__value_)
      {
        self = (vector<double, std::allocator<double>> *)retstr->__begin_;
        uint64_t v23 = v13 - retstr->__begin_;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v25 = (char *)p_end_cap->__value_ - (char *)self;
        if (v25 >> 2 > v24) {
          unint64_t v24 = v25 >> 2;
        }
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        if (v26)
        {
          int v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&retstr->__end_cap_, v26);
          self = (vector<double, std::allocator<double>> *)retstr->__begin_;
          id v13 = retstr->__end_;
        }
        else
        {
          int v27 = 0;
        }
        uint64_t v28 = (double *)&v27[8 * v23];
        *uint64_t v28 = (double)v14;
        double v22 = v28 + 1;
        while (v13 != (double *)self)
        {
          uint64_t v29 = *((void *)v13-- - 1);
          *((void *)v28-- - 1) = v29;
        }
        retstr->__begin_ = v28;
        retstr->__end_ = v22;
        retstr->__end_cap_.__value_ = (double *)&v27[8 * v26];
        if (self) {
          operator delete(self);
        }
      }
      else
      {
        *id v13 = (double)v14;
        double v22 = v13 + 1;
      }
      retstr->__end_ = v22;
      int v6 = *a4;
      id v13 = v22;
      std::vector<int>::pointer begin = a5->__begin_;
      std::vector<int>::pointer end = a5->__end_;
      goto LABEL_30;
    }
    if (v15) {
      return self;
    }
    if ((double *)v14 != value)
    {
      if (v9 - 1 == v16)
      {
        char v15 = 1;
        unint64_t v14 = (unint64_t)v12[5].__end_cap_.__value_;
      }
      else
      {
        v14 += (begin[v6 + 1] - v18) >> 1;
        char v15 = 1;
      }
      goto LABEL_11;
    }
    char v15 = 1;
LABEL_30:
    *a4 = ++v6;
    uint64_t v16 = v6;
    unint64_t v9 = end - begin;
  }
  while (v9 > v6);
  if (retstr->__begin_ != v13 && *(v13 - 1) < (double)(unint64_t)v12[5].__end_cap_.__value_ * 0.9) {
    retstr->__end_ = retstr->__begin_;
  }
  return self;
}

- (CRTableStructureRecognizerResultParsed)parseResult:(SEL)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = v6;
  *(_OWORD *)&retstr->rowHeights.__begin_ = 0u;
  *(_OWORD *)&retstr->rowHeights.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->columnWidths.__end_ = 0u;
  *(_OWORD *)&retstr->merges.__begin_ = 0u;
  retstr->merges.__end_cap_.__value_ = 0;
  retstr->unint64_t numRows = 0;
  retstr->numColumns = 0;
  retstr->valid = 0;
  if (!v6) {
    goto LABEL_121;
  }
  [v6 programTokenIdxs];
  id v8 = *(unsigned char **)&buf[8];
  if (*(void *)&buf[8] == *(void *)buf)
  {
    if (*(void *)&buf[8]) {
      goto LABEL_120;
    }
    goto LABEL_121;
  }
  [v7 programTokenIdxs];
  uint64_t v9 = *(int *)__p;
  unint64_t rowsIndex = self->_rowsIndex;
  int64_t v82 = __p;
  operator delete(__p);
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  if (rowsIndex != v9) {
    goto LABEL_121;
  }
  int v80 = 1;
  [v7 programTokenIdxs];
  id v11 = *(void **)buf;
  if (*(void *)&buf[8] - *(void *)buf < 5uLL)
  {
    BOOL v12 = 0;
    if (!*(void *)buf) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  [v7 programTokenIdxs];
  BOOL v12 = self->_rowsIndex == *((_DWORD *)__p + v80);
  int64_t v82 = __p;
  operator delete(__p);
  id v11 = *(void **)buf;
  if (*(void *)buf)
  {
LABEL_12:
    *(void *)&buf[8] = v11;
    operator delete(v11);
  }
LABEL_13:
  if (v12) {
    ++v80;
  }
  [v7 programTokenIdxs];
  [(CRTableStructureRecognizer *)self readBinValuesStartingAtIndex:&v80 tokenIndexes:v79];
  if (v79[0])
  {
    v79[1] = v79[0];
    operator delete(v79[0]);
  }
  id v8 = __p;
  if (__p == v82) {
    goto LABEL_118;
  }
  unint64_t v13 = v80;
  [v7 programTokenIdxs];
  unint64_t v14 = *(void **)buf;
  if (v13 < (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2)
  {
    [v7 programTokenIdxs];
    BOOL v15 = self->_colsIndex != *((int *)v77 + v80);
    int v78 = v77;
    operator delete(v77);
    unint64_t v14 = *(void **)buf;
    if (!*(void *)buf) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v15 = 1;
  if (*(void *)buf)
  {
LABEL_22:
    *(void *)&buf[8] = v14;
    operator delete(v14);
  }
LABEL_23:
  if (v15) {
    goto LABEL_117;
  }
  unint64_t v16 = ++v80;
  [v7 programTokenIdxs];
  double v17 = *(void **)buf;
  if (v16 >= (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2)
  {
    BOOL v18 = 0;
  }
  else
  {
    [v7 programTokenIdxs];
    BOOL v18 = self->_colsIndex == *((_DWORD *)v77 + v80);
    int v78 = v77;
    operator delete(v77);
    double v17 = *(void **)buf;
  }
  if (v17)
  {
    *(void *)&buf[8] = v17;
    operator delete(v17);
  }
  if (v18) {
    ++v80;
  }
  [v7 programTokenIdxs];
  [(CRTableStructureRecognizer *)self readBinValuesStartingAtIndex:&v80 tokenIndexes:v76];
  if (v76[0])
  {
    v76[1] = v76[0];
    operator delete(v76[0]);
  }
  uint64_t v19 = (char *)v77;
  uint64_t v20 = (uint64_t)v78;
  if (v77 == v78) {
    goto LABEL_115;
  }
  if (&retstr->rowHeights != (vector<double, std::allocator<double>> *)&__p)
  {
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&retstr->rowHeights, (char *)__p, (uint64_t)v82, (v82 - (unsigned char *)__p) >> 3);
    uint64_t v19 = (char *)v77;
    uint64_t v20 = (uint64_t)v78;
  }
  if (&retstr->columnWidths != (vector<double, std::allocator<double>> *)&v77)
  {
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&retstr->columnWidths, v19, v20, (v20 - (uint64_t)v19) >> 3);
    uint64_t v19 = (char *)v77;
    uint64_t v20 = (uint64_t)v78;
  }
  retstr->unint64_t numRows = (v82 - (unsigned char *)__p) >> 3;
  retstr->numColumns = (v20 - (uint64_t)v19) >> 3;
  unint64_t v21 = v80;
  [v7 programTokenIdxs];
  uint64_t v23 = *(void **)buf;
  if (v21 >= (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2)
  {
    BOOL v24 = 0;
  }
  else
  {
    [v7 programTokenIdxs];
    BOOL v24 = self->_eopIndex == v75[v80];
    operator delete(v75);
    uint64_t v23 = *(void **)buf;
  }
  if (v23)
  {
    *(void *)&buf[8] = v23;
    operator delete(v23);
  }
  if (v24)
  {
    retstr->valid = 1;
    goto LABEL_114;
  }
  unint64_t v72 = 0;
  uint64_t v25 = 0;
  unint64_t v26 = 0;
  int v27 = v80;
  uint64_t v28 = &off_1EAB67000;
  *(void *)&long long v22 = 134218752;
  long long v71 = v22;
  int64_t v74 = v7;
  while (1)
  {
    objc_msgSend(v7, "programTokenIdxs", v71);
    if (v27 >= (unint64_t)((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2)) {
      break;
    }
    [v7 programTokenIdxs];
    uint64_t v29 = v75[v80];
    unint64_t mergeIndex = self->_mergeIndex;
    operator delete(v75);
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    if (mergeIndex != v29) {
      goto LABEL_104;
    }
    uint64_t v31 = v80;
    unint64_t v32 = v28[421];
    [v7 programTokenIdxs];
    uint64_t v34 = *(void *)buf;
    uint64_t v33 = *(void *)&buf[8];
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    if ((unint64_t)&v32[v31] >= (v33 - v34) >> 2)
    {
      retstr->valid = 1;
      int64_t v7 = v74;
      goto LABEL_112;
    }
    ++v80;
    int64_t v7 = v74;
    if (v28[421])
    {
      uint64_t v35 = 0;
      while (1)
      {
        p_numColumns = (CRTableStructureRecognizerResultParsed *)&retstr->numColumns;
        if ((v35 & 1) == 0) {
          p_numColumns = retstr;
        }
        unint64_t numRows = p_numColumns->numRows;
        [v74 programTokenIdxs];
        if (self->_lowestNumberIndex > *(int *)(*(void *)buf + 4 * ((int)v35 + v80))) {
          break;
        }
        [v74 programTokenIdxs];
        unint64_t v38 = v75[(int)v35 + v80];
        operator delete(v75);
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        if (numRows < v38) {
          goto LABEL_85;
        }
        if ((unint64_t)v28[421] <= ++v35) {
          goto LABEL_62;
        }
      }
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
LABEL_85:
      [v74 programTokenIdxs];
      uint64_t v59 = *(int *)(*(void *)buf + 4 * (v80 + (int)v35));
      unint64_t v60 = self->_mergeIndex;
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
      if (v60 == v59)
      {
        int v27 = v80 + 1;
        goto LABEL_101;
      }
    }
    else
    {
LABEL_62:
      unint64_t v73 = v26;
      [v74 programTokenIdxs];
      uint64_t v39 = *(int *)(*(void *)buf + 4 * v80);
      unint64_t lowestNumberIndex = self->_lowestNumberIndex;
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
      [v74 programTokenIdxs];
      uint64_t v41 = *(int *)(*(void *)buf + 4 * v80 + 4);
      unint64_t v42 = self->_lowestNumberIndex;
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
      [v74 programTokenIdxs];
      uint64_t v43 = *(int *)(*(void *)buf + 4 * v80 + 12);
      unint64_t v44 = self->_lowestNumberIndex;
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
      [v74 programTokenIdxs];
      unint64_t v45 = v39 - lowestNumberIndex;
      unint64_t v46 = v41 - v42;
      unint64_t v47 = v43 - v44;
      unint64_t v48 = *(int *)(*(void *)buf + 4 * v80 + 8) - self->_lowestNumberIndex;
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
      unint64_t v26 = v73;
      if (v73 == v25)
      {
LABEL_74:
        if ((unint64_t)v25 >= v72)
        {
          uint64_t v55 = (v25 - v73) >> 5;
          unint64_t v56 = v55 + 1;
          if ((unint64_t)(v55 + 1) >> 59) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v72 - (void)v73) >> 4 > v56) {
            unint64_t v56 = (uint64_t)(v72 - (void)v73) >> 4;
          }
          if (v72 - (unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v57 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v57 = v56;
          }
          if (v57) {
            unint64_t v57 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTableStructureColumn>>(v57);
          }
          else {
            uint64_t v58 = 0;
          }
          char v63 = (unint64_t *)(v57 + 32 * v55);
          *char v63 = v45;
          v63[1] = v47;
          v63[2] = v46;
          v63[3] = v48;
          if (v73 == v25)
          {
            double v66 = (char *)(v57 + 32 * v55);
            int64_t v7 = v74;
            uint64_t v28 = &off_1EAB67000;
          }
          else
          {
            unint64_t v64 = v57 + 32 * v55;
            int64_t v7 = v74;
            uint64_t v28 = &off_1EAB67000;
            do
            {
              long long v65 = *((_OWORD *)v25 - 1);
              double v66 = (char *)(v64 - 32);
              *(_OWORD *)(v64 - 32) = *((_OWORD *)v25 - 2);
              *(_OWORD *)(v64 - 16) = v65;
              v25 -= 32;
              v64 -= 32;
            }
            while (v25 != v73);
          }
          unint64_t v72 = v57 + 32 * v58;
          uint64_t v25 = (char *)(v63 + 4);
          if (v73) {
            operator delete(v73);
          }
          unint64_t v26 = v66;
          goto LABEL_100;
        }
        *(void *)uint64_t v25 = v45;
        *((void *)v25 + 1) = v47;
        *((void *)v25 + 2) = v46;
        *((void *)v25 + 3) = v48;
        v25 += 32;
      }
      else
      {
        uint64_t v49 = (unint64_t *)(v73 + 16);
        while (1)
        {
          unint64_t v51 = *(v49 - 2);
          int64_t v50 = v49 - 2;
          BOOL v53 = v45 >= v51;
          unint64_t v52 = v45 - v51;
          BOOL v53 = !v53 || v52 >= *(v49 - 1);
          if (!v53 && v46 >= *v49 && v46 - *v49 < v49[1]) {
            break;
          }
          v49 += 4;
          if (v50 + 4 == (unint64_t *)v25) {
            goto LABEL_74;
          }
        }
        uint64_t v61 = CROSLogForCategory(5);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v71;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v46;
          __int16 v84 = 2048;
          unint64_t v85 = v47;
          __int16 v86 = 2048;
          unint64_t v87 = v48;
          _os_log_impl(&dword_1DD733000, v61, OS_LOG_TYPE_DEBUG, "Cell %li %li was previously merged - dropping current merge: %li %li", buf, 0x2Au);
        }
      }
      int64_t v7 = v74;
      uint64_t v28 = &off_1EAB67000;
    }
LABEL_100:
    int v27 = v80 + *((_DWORD *)v28 + 842);
LABEL_101:
    int v80 = v27;
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
LABEL_104:
  std::vector<CRTableStructureMerge>::__assign_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>((char *)&retstr->merges, v26, (uint64_t)v25, (v25 - v26) >> 5);
  unint64_t v67 = v80;
  [v7 programTokenIdxs];
  if (v67 >= (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2)
  {
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
  }
  else
  {
    [v7 programTokenIdxs];
    uint64_t v68 = v75[v80];
    unint64_t eopIndex = self->_eopIndex;
    operator delete(v75);
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    if (eopIndex == v68) {
      retstr->valid = 1;
    }
  }
LABEL_112:
  if (v26) {
    operator delete(v26);
  }
LABEL_114:
  uint64_t v19 = (char *)v77;
LABEL_115:
  if (v19)
  {
    int v78 = v19;
    operator delete(v19);
  }
LABEL_117:
  id v8 = __p;
LABEL_118:
  if (v8)
  {
    int64_t v82 = v8;
LABEL_120:
    operator delete(v8);
  }
LABEL_121:

  return result;
}

- (id)alignResult:(CRTableStructureRecognizerResultParsed *)a3 lines:(id)a4 lineIndexMap:(vector<unsigned)long
{
  id v155 = a4;
  uint64_t v165 = objc_alloc_init(CRTableStructureRecognizerResult);
  float __C = 0;
  vDSP_sveD(a3->columnWidths.__begin_, 1, (double *)&__C, a3->columnWidths.__end_ - a3->columnWidths.__begin_);
  v195 = 0;
  v196 = 0;
  unint64_t v197 = 0;
  std::vector<int>::pointer begin = a3->columnWidths.__begin_;
  std::vector<int>::pointer end = a3->columnWidths.__end_;
  id v8 = v165;
  if (begin != end)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    id v11 = 0;
    double v12 = *(end - 1);
    double v13 = 0.0;
    do
    {
      double v14 = *begin / v12 - v13;
      if ((unint64_t)v11 >= v10)
      {
        uint64_t v15 = ((char *)v11 - (char *)v9) >> 5;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v10 - (void)v9) >> 4 > v16) {
          unint64_t v16 = (uint64_t)(v10 - (void)v9) >> 4;
        }
        if (v10 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v17 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v16;
        }
        if (v17) {
          unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTableStructureColumn>>(v17);
        }
        else {
          uint64_t v18 = 0;
        }
        unint64_t v19 = v17 + 32 * v15;
        *(double *)unint64_t v19 = v13;
        *(void *)(v19 + 8) = 0;
        *(double *)(v19 + 16) = v14;
        *(void *)(v19 + 24) = 0x3FF0000000000000;
        if (v11 == v9)
        {
          long long v22 = (double *)(v17 + 32 * v15);
        }
        else
        {
          unint64_t v20 = v17 + 32 * v15;
          do
          {
            long long v21 = *((_OWORD *)v11 - 1);
            long long v22 = (double *)(v20 - 32);
            *(_OWORD *)(v20 - 32) = *((_OWORD *)v11 - 2);
            *(_OWORD *)(v20 - 16) = v21;
            v11 -= 4;
            v20 -= 32;
          }
          while (v11 != v9);
        }
        unint64_t v10 = v17 + 32 * v18;
        id v11 = (double *)(v19 + 32);
        v195 = v22;
        unint64_t v197 = v10;
        if (v9) {
          operator delete(v9);
        }
        uint64_t v9 = v22;
        id v8 = v165;
      }
      else
      {
        *id v11 = v13;
        v11[1] = 0.0;
        v11[2] = v14;
        v11[3] = 1.0;
        v11 += 4;
      }
      v196 = v11;
      double v13 = v13 + v14;
      ++begin;
    }
    while (begin != end);
  }
  [(CRTableStructureRecognizerResult *)v8 setColumns:&v195];
  if (v195)
  {
    v196 = v195;
    operator delete(v195);
  }
  float __C = 0;
  vDSP_sveD(a3->rowHeights.__begin_, 1, (double *)&__C, a3->rowHeights.__end_ - a3->rowHeights.__begin_);
  v192 = 0;
  v193 = 0;
  unint64_t v194 = 0;
  BOOL v24 = a3->rowHeights.__begin_;
  uint64_t v23 = a3->rowHeights.__end_;
  uint64_t v25 = v165;
  if (v24 != v23)
  {
    unint64_t v26 = 0;
    unint64_t v27 = 0;
    uint64_t v28 = 0;
    double v29 = *(v23 - 1);
    double v30 = 0.0;
    do
    {
      double v31 = *v24 / v29 - v30;
      if ((unint64_t)v28 >= v27)
      {
        uint64_t v32 = (v28 - v26) >> 5;
        unint64_t v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v27 - (void)v26) >> 4 > v33) {
          unint64_t v33 = (uint64_t)(v27 - (void)v26) >> 4;
        }
        if (v27 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v34 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v33;
        }
        if (v34) {
          unint64_t v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTableStructureColumn>>(v34);
        }
        else {
          uint64_t v35 = 0;
        }
        unint64_t v36 = v34 + 32 * v32;
        *(void *)unint64_t v36 = 0;
        *(double *)(v36 + 8) = v30;
        *(void *)(v36 + 16) = 0x3FF0000000000000;
        *(double *)(v36 + 24) = v31;
        if (v28 == v26)
        {
          uint64_t v39 = (char *)(v34 + 32 * v32);
        }
        else
        {
          unint64_t v37 = v34 + 32 * v32;
          do
          {
            long long v38 = *((_OWORD *)v28 - 1);
            uint64_t v39 = (char *)(v37 - 32);
            *(_OWORD *)(v37 - 32) = *((_OWORD *)v28 - 2);
            *(_OWORD *)(v37 - 16) = v38;
            v28 -= 32;
            v37 -= 32;
          }
          while (v28 != v26);
        }
        unint64_t v27 = v34 + 32 * v35;
        uint64_t v28 = (char *)(v36 + 32);
        v192 = v39;
        unint64_t v194 = v27;
        if (v26) {
          operator delete(v26);
        }
        unint64_t v26 = v39;
        uint64_t v25 = v165;
      }
      else
      {
        *(void *)uint64_t v28 = 0;
        *((double *)v28 + 1) = v30;
        *((void *)v28 + 2) = 0x3FF0000000000000;
        *((double *)v28 + 3) = v31;
        v28 += 32;
      }
      v193 = v28;
      double v30 = v30 + v31;
      ++v24;
    }
    while (v24 != v23);
  }
  [(CRTableStructureRecognizerResult *)v25 setRows:&v192];
  if (v192)
  {
    v193 = v192;
    operator delete(v192);
  }
  v189 = 0;
  v190 = 0;
  uint64_t v191 = 0;
  std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&v189, a3->merges.__begin_, (uint64_t)a3->merges.__end_, (a3->merges.__end_ - a3->merges.__begin_) >> 5);
  [(CRTableStructureRecognizerResult *)v165 setMerges:&v189];
  if (v189)
  {
    v190 = v189;
    operator delete(v189);
  }
  if (v165)
  {
    [(CRTableStructureRecognizerResult *)v165 rows];
    v40 = __C;
    CRTableStructureRecognizerInputFeatures v153 = v188;
    if (__C)
    {
      v188 = __C;
      operator delete(__C);
    }
    [(CRTableStructureRecognizerResult *)v165 columns];
    unint64_t v41 = v153 - v40;
    unint64_t v42 = __C;
    v157 = v188;
    uint64_t v43 = v188 - __C;
    if (__C)
    {
      v188 = __C;
      operator delete(__C);
    }
  }
  else
  {
    uint64_t v43 = 0;
    unint64_t v42 = 0;
    v157 = 0;
    unint64_t v41 = 0;
    v40 = 0;
    CRTableStructureRecognizerInputFeatures v153 = 0;
  }
  unint64_t v166 = v43;
  unint64_t v167 = v41;
  unint64_t v150 = v41 * v43;
  std::vector<CGRect>::vector(&__C, v41 * v43);
  std::vector<_NSRange>::vector(&v185, v188 - __C);
  float32x4_t v156 = v42;
  std::vector<_NSRange>::vector(&v183, v188 - __C);
  uint64_t v160 = 16 * v43;
  uint64_t v162 = 32 * v43;
  uint64_t v152 = v40;
  if (v153 != v40)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    if (v166 <= 1) {
      uint64_t v46 = 1;
    }
    else {
      uint64_t v46 = v166;
    }
    if (v41 <= 1) {
      unint64_t v41 = 1;
    }
    uint64_t v47 = 8;
    do
    {
      if (v157 != v156)
      {
        uint64_t v48 = 0;
        uint64_t v49 = 0;
        uint64_t v50 = v47;
        do
        {
          [(CRTableStructureRecognizerResult *)v165 columns];
          CGFloat v51 = *(double *)((char *)v181 + v48);
          CGFloat v52 = *(double *)((char *)v181 + v48 + 8);
          CGFloat v53 = *(double *)((char *)v181 + v48 + 16);
          CGFloat v54 = *(double *)((char *)v181 + v48 + 24);
          [(CRTableStructureRecognizerResult *)v165 rows];
          v202.origin.x = v51;
          v202.origin.y = v52;
          v202.size.width = v53;
          v202.size.height = v54;
          CGRect v203 = CGRectIntersection(v202, *((CGRect *)__p + v45));
          *(CGRect *)((char *)__C + v44 + v48) = v203;
          if (__p)
          {
            v180 = __p;
            operator delete(__p);
          }
          if (v181)
          {
            v182 = v181;
            operator delete(v181);
          }
          uint64_t v55 = (char *)v185 + v50;
          *(v55 - 1) = v45;
          void *v55 = 1;
          unint64_t v56 = (char *)v183 + v50;
          *(v56 - 1) = v49;
          void *v56 = 1;
          ++v49;
          v50 += 16;
          v48 += 32;
        }
        while (v46 != v49);
      }
      ++v45;
      v47 += v160;
      v44 += v162;
    }
    while (v45 != v41);
  }
  if (v165)
  {
    for (unint64_t i = 0; ; unint64_t i = v154 + 1)
    {
      [(CRTableStructureRecognizerResult *)v165 merges];
      unint64_t v58 = (v182 - (unsigned char *)v181) >> 5;
      if (v181)
      {
        v182 = v181;
        operator delete(v181);
      }
      if (i >= v58) {
        break;
      }
      [(CRTableStructureRecognizerResult *)v165 merges];
      unint64_t v154 = i;
      uint64_t v59 = (uint64_t *)((char *)v181 + 32 * i);
      uint64_t v60 = v59[1];
      uint64_t v158 = *v59;
      uint64_t v62 = v59[2];
      uint64_t v61 = v59[3];
      v182 = v181;
      operator delete(v181);
      uint64_t v159 = v60;
      if (v60)
      {
        uint64_t v63 = 0;
        uint64_t v64 = v62 + v158 * v166;
        uint64_t v163 = 16 * v64;
        uint64_t v65 = 32 * v64;
        do
        {
          if (v61)
          {
            uint64_t v66 = 0;
            uint64_t v67 = v65;
            uint64_t v68 = v163;
            do
            {
              if (v66 | v63 && v63 + v158 < v167 && v62 + v66 < v166)
              {
                CGRect v204 = CGRectUnion(__C[v64], *(CGRect *)((char *)__C + v67));
                __C[v64] = v204;
                v199.location = v63 + v158;
                v199.length = 1;
                NSRange v69 = NSUnionRange(*((NSRange *)v185 + v64), v199);
                *((NSRange *)v185 + v64) = v69;
                v200.location = v62 + v66;
                v200.length = 1;
                NSRange v70 = NSUnionRange(*((NSRange *)v183 + v64), v200);
                long long v71 = (char *)v183;
                *((NSRange *)v183 + v64) = v70;
                unint64_t v72 = (_OWORD *)((char *)&__C->origin.x + v67);
                long long v73 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
                *unint64_t v72 = *MEMORY[0x1E4F1DB28];
                v72[1] = v73;
                int64_t v74 = (char *)v185 + v68;
                unint64_t v75 = &v71[v68];
                *int64_t v74 = 0;
                v74[1] = 0;
                *(void *)unint64_t v75 = 0;
                *((void *)v75 + 1) = 0;
              }
              ++v66;
              v68 += 16;
              v67 += 32;
            }
            while (v61 != v66);
          }
          ++v63;
          v163 += v160;
          v65 += v162;
        }
        while (v63 != v159);
      }
    }
  }
  uint64_t v176 = 0;
  v177 = 0;
  uint64_t v178 = 0;
  std::vector<CGRect>::__init_with_size[abi:ne180100]<CGRect*,CGRect*>(&v176, __C, (uint64_t)v188, v188 - __C);
  [(CRTableStructureRecognizerResult *)v165 setRectForCells:&v176];
  if (v176)
  {
    v177 = v176;
    operator delete(v176);
  }
  v173 = 0;
  v174 = 0;
  uint64_t v175 = 0;
  std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(&v173, v185, (uint64_t)v186, (v186 - (unsigned char *)v185) >> 4);
  [(CRTableStructureRecognizerResult *)v165 setRowsForCells:&v173];
  if (v173)
  {
    v174 = v173;
    operator delete(v173);
  }
  v170 = 0;
  v171 = 0;
  uint64_t v172 = 0;
  std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(&v170, v183, (uint64_t)v184, (v184 - (unsigned char *)v183) >> 4);
  [(CRTableStructureRecognizerResult *)v165 setColumnsForCells:&v170];
  if (v170)
  {
    v171 = v170;
    operator delete(v170);
  }
  std::vector<std::vector<unsigned long>>::vector(&v181, v150);
  unint64_t v76 = 0;
  if (v166 <= 1) {
    uint64_t v77 = 1;
  }
  else {
    uint64_t v77 = v166;
  }
  uint64_t v164 = v77;
  uint64_t v78 = v167;
  if (v167 <= 1) {
    uint64_t v78 = 1;
  }
  uint64_t v161 = v78;
  char v79 = (double *)MEMORY[0x1E4F1DB30];
  while (v76 < objc_msgSend(v155, "count", v150))
  {
    int v80 = [v155 objectAtIndexedSubscript:v76];
    std::vector<int>::pointer v81 = [v80 boundingQuad];
    [v81 midPoint];
    double v83 = v82;
    double v85 = v84;
    unint64_t v168 = v76;

    if (v153 == v152)
    {
      uint64_t v89 = -1;
LABEL_121:
      float32x4_t v116 = CROSLogForCategory(5);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(__p) = 0;
        _os_log_impl(&dword_1DD733000, v116, OS_LOG_TYPE_DEBUG, "Mid-point of line region not within any table cell, assign to closest cell.", (uint8_t *)&__p, 2u);
      }

      float32x4_t v117 = (char *)v181 + 24 * v89;
      float32x4_t v119 = (unint64_t **)(v117 + 8);
      float32x4_t v118 = (unint64_t *)*((void *)v117 + 1);
      float32x4_t v121 = v117 + 16;
      unint64_t v120 = *((void *)v117 + 2);
      if ((unint64_t)v118 >= v120)
      {
        char v129 = *(unint64_t **)v117;
        uint64_t v130 = ((uint64_t)v118 - *(void *)v117) >> 3;
        unint64_t v131 = v130 + 1;
        if ((unint64_t)(v130 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v132 = v120 - (void)v129;
        if (v132 >> 2 > v131) {
          unint64_t v131 = v132 >> 2;
        }
        if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v133 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v133 = v131;
        }
        if (v133)
        {
          v134 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v121, v133);
          float32x4_t v118 = *v119;
          char v129 = *(unint64_t **)v117;
        }
        else
        {
          v134 = 0;
        }
        uint64_t v138 = (unint64_t *)&v134[8 * v130];
        *uint64_t v138 = v168;
        float32x4_t v122 = v138 + 1;
        while (v118 != v129)
        {
          unint64_t v139 = *--v118;
          *--uint64_t v138 = v139;
        }
        *(void *)float32x4_t v117 = v138;
        *float32x4_t v119 = v122;
        *float32x4_t v121 = &v134[8 * v133];
        if (v129) {
          operator delete(v129);
        }
      }
      else
      {
        *float32x4_t v118 = v168;
        float32x4_t v122 = v118 + 1;
      }
      *float32x4_t v119 = v122;
    }
    else
    {
      uint64_t v86 = 0;
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      uint64_t v89 = -1;
      double v90 = 1.79769313e308;
      uint64_t v91 = 16;
      while (1)
      {
        uint64_t v92 = v86;
        uint64_t v93 = v87;
        uint64_t v94 = v91;
        uint64_t v95 = v164;
        if (v157 != v156) {
          break;
        }
LABEL_116:
        ++v88;
        v91 += 24 * v166;
        v87 += v162;
        v86 += v166;
        if (v88 == v161) {
          goto LABEL_121;
        }
      }
      while (1)
      {
        [(CRTableStructureRecognizerResult *)v165 rectForCells];
        CGFloat v96 = *(double *)((char *)__p + v93);
        CGFloat v97 = *(double *)((char *)__p + v93 + 8);
        CGFloat v98 = *(double *)((char *)__p + v93 + 16);
        CGFloat v99 = *(double *)((char *)__p + v93 + 24);
        v180 = __p;
        operator delete(__p);
        v205.origin.x = v96;
        v205.origin.y = v97;
        v205.size.width = v98;
        v205.size.height = v99;
        v201.x = v83;
        v201.y = v85;
        if (CGRectContainsPoint(v205, v201)) {
          break;
        }
        v206.origin.x = v96;
        v206.origin.y = v97;
        v206.size.width = v98;
        v206.size.height = v99;
        double MidX = CGRectGetMidX(v206);
        v207.origin.x = v96;
        v207.origin.y = v97;
        v207.size.width = v98;
        v207.size.height = v99;
        double MidY = CGRectGetMidY(v207);
        double v102 = *v79;
        if (*v79 <= 0.0)
        {
          double v109 = v83;
          double v110 = v85;
        }
        else
        {
          double v103 = v79[1];
          BOOL v104 = v103 <= 0.0;
          double v105 = v83 * v102;
          double v106 = v85 * v103;
          double v107 = MidX * v102;
          double v108 = MidY * v103;
          if (v104)
          {
            double v109 = v83;
          }
          else
          {
            double MidX = v107;
            double MidY = v108;
            double v109 = v105;
          }
          if (v104) {
            double v110 = v85;
          }
          else {
            double v110 = v106;
          }
        }
        double v111 = (v110 - MidY) * (v110 - MidY) + (v109 - MidX) * (v109 - MidX);
        if (v111 < v90)
        {
          uint64_t v89 = v92;
          double v90 = v111;
        }
        v94 += 24;
        v93 += 32;
        ++v92;
        if (!--v95) {
          goto LABEL_116;
        }
      }
      std::vector<int> v112 = (char *)v181 + v94;
      v113 = *(char **)((char *)v181 + v94 - 8);
      unint64_t v114 = *(void *)((char *)v181 + v94);
      if ((unint64_t)v113 < v114)
      {
        unint64_t v115 = v168;
        *(void *)v113 = v168;
        *(v112 - 1) = v113 + 8;
        goto LABEL_156;
      }
      float32x4_t v123 = (char *)*(v112 - 2);
      uint64_t v124 = (v113 - v123) >> 3;
      if ((unint64_t)(v124 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v125 = v114 - (void)v123;
      unint64_t v126 = (uint64_t)(v114 - (void)v123) >> 2;
      if (v126 <= v124 + 1) {
        unint64_t v126 = v124 + 1;
      }
      if (v125 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v127 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v127 = v126;
      }
      if (v127)
      {
        long long v128 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v181 + v94, v127);
        float32x4_t v123 = (char *)*(v112 - 2);
        v113 = (char *)*(v112 - 1);
      }
      else
      {
        long long v128 = 0;
      }
      uint64_t v135 = (unint64_t *)&v128[8 * v124];
      *uint64_t v135 = v168;
      v136 = v135 + 1;
      while (v113 != v123)
      {
        unint64_t v137 = *((void *)v113 - 1);
        v113 -= 8;
        *--uint64_t v135 = v137;
      }
      *(v112 - 2) = v135;
      *(v112 - 1) = v136;
      *std::vector<int> v112 = &v128[8 * v127];
      if (v123) {
        operator delete(v123);
      }
      *(v112 - 1) = v136;
    }
    unint64_t v115 = v168;
LABEL_156:
    unint64_t v76 = v115 + 1;
  }
  v140 = v181;
  uint64_t v141 = (uint64_t)v182;
  unint64_t v142 = (v182 - (unsigned char *)v181) / 24;
  if (v182 != v181)
  {
    uint64_t v143 = 0;
    if (v142 <= 1) {
      uint64_t v144 = 1;
    }
    else {
      uint64_t v144 = (v182 - (unsigned char *)v181) / 24;
    }
    do
    {
      v145 = (void *)v140[3 * v143];
      uint64_t v146 = v140[3 * v143 + 1] - (void)v145;
      if (v146)
      {
        unint64_t v147 = v146 >> 3;
        v148 = a5->__begin_;
        if (v147 <= 1) {
          unint64_t v147 = 1;
        }
        do
        {
          void *v145 = v148[*v145];
          ++v145;
          --v147;
        }
        while (v147);
      }
      ++v143;
    }
    while (v143 != v144);
  }
  memset(v169, 0, sizeof(v169));
  std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(v169, (uint64_t)v140, v141, v142);
  [(CRTableStructureRecognizerResult *)v165 setTextLineIndexesForCells:v169];
  __p = v169;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  __p = &v181;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v183)
  {
    v184 = v183;
    operator delete(v183);
  }
  if (v185)
  {
    v186 = v185;
    operator delete(v185);
  }
  if (__C)
  {
    v188 = __C;
    operator delete(__C);
  }

  return v165;
}

- (id)tableGroupRegionFromResult:(id)a3 recognizedLines:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v5 tableQuad];
  v100[0] = 0;
  v100[1] = 0;
  __asm { FMOV            V1.2D, #1.0 }
  long long v101 = xmmword_1DD8CE3C0;
  long long v102 = _Q1;
  long long v103 = xmmword_1DD8CE3D0;
  [v7 topLeft];
  uint64_t v92 = v13;
  uint64_t v93 = v14;
  [v7 topRight];
  uint64_t v94 = v15;
  uint64_t v95 = v16;
  [v7 bottomRight];
  uint64_t v96 = v17;
  uint64_t v97 = v18;
  [v7 bottomLeft];
  uint64_t v98 = v19;
  uint64_t v99 = v20;
  *(float32x2_t *)v21.f32 = computeHomographyMatrix((uint64_t)v100);
  simd_float3 v83 = v22;
  simd_float3 v85 = v21;
  simd_float3 v81 = v23;
  BOOL v24 = (void *)MEMORY[0x1E4F1CA48];
  if (v5)
  {
    [v5 rows];
    unint64_t v26 = __p;
    uint64_t v25 = v90;
  }
  else
  {
    unint64_t v26 = 0;
    uint64_t v25 = 0;
    __p = 0;
    double v90 = 0;
    uint64_t v91 = 0;
  }
  int v80 = [v24 arrayWithCapacity:(v25 - v26) >> 5];
  if (__p)
  {
    double v90 = __p;
    operator delete(__p);
  }
  simd_float3 v27 = v85;
  v27.i32[3] = 0;
  simd_float3 v86 = v27;
  simd_float3 v28 = v83;
  v28.i32[3] = 0;
  simd_float3 v84 = v28;
  simd_float3 v29 = v81;
  v29.i32[3] = 0;
  simd_float3 v82 = v29;
  if (v5)
  {
    [v5 rows];
    double v30 = (CGFloat *)__p;
    if (__p != v90)
    {
      do
      {
        CGFloat v31 = *v30;
        CGFloat v32 = v30[1];
        CGFloat v33 = v30[2];
        CGFloat v34 = v30[3];
        [v7 normalizationSize];
        v106.width = v35;
        v106.height = v36;
        v75.columns[1] = v84;
        v75.columns[2] = v82;
        v75.columns[0] = v86;
        v109.origin.x = v31;
        v109.origin.y = v32;
        v109.size.width = v33;
        v109.size.height = v34;
        unint64_t v37 = transformRectWithHomography(v109, v106, v75);
        [v80 addObject:v37];

        v30 += 4;
      }
      while (v30 != (CGFloat *)v90);
      double v30 = (CGFloat *)__p;
    }
    if (v30)
    {
      double v90 = v30;
      operator delete(v30);
    }
    long long v38 = (void *)MEMORY[0x1E4F1CA48];
    [v5 columns];
    v40 = __p;
    uint64_t v39 = v90;
  }
  else
  {
    v40 = 0;
    uint64_t v39 = 0;
    long long v38 = (void *)MEMORY[0x1E4F1CA48];
    __p = 0;
    double v90 = 0;
    uint64_t v91 = 0;
  }
  char v79 = [v38 arrayWithCapacity:(v39 - v40) >> 5];
  if (__p)
  {
    double v90 = __p;
    operator delete(__p);
  }
  if (v5)
  {
    [v5 columns];
    unint64_t v41 = (CGFloat *)__p;
    if (__p != v90)
    {
      do
      {
        CGFloat v42 = *v41;
        CGFloat v43 = v41[1];
        CGFloat v44 = v41[2];
        CGFloat v45 = v41[3];
        [v7 normalizationSize];
        v107.width = v46;
        v107.height = v47;
        v76.columns[1] = v84;
        v76.columns[2] = v82;
        v76.columns[0] = v86;
        v110.origin.x = v42;
        v110.origin.y = v43;
        v110.size.width = v44;
        v110.size.height = v45;
        uint64_t v48 = transformRectWithHomography(v110, v107, v76);
        [v79 addObject:v48];

        v41 += 4;
      }
      while (v41 != (CGFloat *)v90);
      unint64_t v41 = (CGFloat *)__p;
    }
    if (v41)
    {
      double v90 = v41;
      operator delete(v41);
    }
    uint64_t v49 = (void *)MEMORY[0x1E4F1CA48];
    [v5 rectForCells];
    CGFloat v51 = __p;
    uint64_t v50 = v90;
  }
  else
  {
    CGFloat v51 = 0;
    uint64_t v50 = 0;
    uint64_t v49 = (void *)MEMORY[0x1E4F1CA48];
    __p = 0;
    double v90 = 0;
    uint64_t v91 = 0;
  }
  uint64_t v78 = [v49 arrayWithCapacity:(v50 - v51) >> 5];
  if (__p)
  {
    double v90 = __p;
    operator delete(__p);
  }
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    for (unint64_t i = 0; ; ++i)
    {
      [v5 rectForCells];
      unint64_t v54 = (v90 - (unsigned char *)__p) >> 5;
      if (__p)
      {
        double v90 = __p;
        operator delete(__p);
      }
      if (v54 <= i) {
        break;
      }
      [v5 rectForCells];
      uint64_t v55 = (double *)((char *)__p + 32 * i);
      CGFloat v56 = *v55;
      CGFloat v57 = v55[1];
      CGFloat v58 = v55[2];
      CGFloat v59 = v55[3];
      double v90 = __p;
      operator delete(__p);
      v111.origin.x = v56;
      v111.origin.y = v57;
      v111.size.width = v58;
      v111.size.height = v59;
      if (!CGRectIsEmpty(v111))
      {
        [v7 normalizationSize];
        v108.width = v60;
        v108.height = v61;
        v77.columns[1] = v84;
        v77.columns[2] = v82;
        v77.columns[0] = v86;
        v112.origin.x = v56;
        v112.origin.y = v57;
        v112.size.width = v58;
        v112.size.height = v59;
        uint64_t v62 = transformRectWithHomography(v112, v108, v77);
        uint64_t v63 = [MEMORY[0x1E4F1CA48] array];
        [v5 textLineIndexesForCells];
        uint64_t v64 = (char *)__p + 24 * i;
        uint64_t v65 = (void *)*v64;
        uint64_t v66 = (void *)v64[1];
        while (v65 != v66)
        {
          uint64_t v67 = [v6 objectAtIndexedSubscript:*v65];
          [v63 addObject:v67];
          [v52 addObject:v67];

          ++v65;
        }
        uint64_t v68 = [CRTableCellGroupRegion alloc];
        [v5 rowsForCells];
        NSRange v69 = (uint64_t *)((char *)v88[0] + 16 * i);
        uint64_t v70 = *v69;
        uint64_t v71 = v69[1];
        [v5 columnsForCells];
        unint64_t v72 = -[CRTableCellGroupRegion initWithBoundingQuad:layoutDirection:subregions:rows:columns:](v68, "initWithBoundingQuad:layoutDirection:subregions:rows:columns:", v62, 0, v63, v70, v71, v87[2 * i], v87[2 * i + 1]);
        [v78 addObject:v72];

        if (v87) {
          operator delete(v87);
        }
        if (v88[0])
        {
          v88[1] = v88[0];
          operator delete(v88[0]);
        }
        v88[0] = &__p;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)v88);
      }
    }
  }
  long long v73 = [[CRTableGroupRegion alloc] initWithBoundingQuad:v7 layoutDirection:0 cells:v78 lineRegions:v52 rowQuads:v80 columnQuads:v79];

  return v73;
}

- (void)reduceMemoryByResizing
{
  value = self->_encoderModel.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(NSString *)self->_modelSmallestConfig UTF8String]);
  int v4 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)value, &__p);
  int v5 = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v5) {
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
    goto LABEL_9;
  }
  id v6 = self->_decoderModel.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(NSString *)self->_modelSmallestConfig UTF8String]);
  char v7 = CoreRecognition::EspressoModelWrapper::selectConfiguration((uint64_t)v6, &__p);
  char v8 = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v8) {
      return;
    }
  }
  else if (v7)
  {
    return;
  }
LABEL_9:
  uint64_t v9 = CROSLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_FAULT, "Error selecting smallest configuration for TSR model", (uint8_t *)&__p, 2u);
  }
}

- (vector<float,)normalizedLineRegions:(CRTableStructureRecognizer *)self numConfigurationRegions:(SEL)a3 usingMinMaxNorm:(id)a4
{
  BOOL v6 = a6;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v60 = [v9 count];
  int v68 = 0;
  std::vector<float>::vector(retstr, 8 * a5, &v68);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v11)
  {
    int v13 = 0;
    uint64_t v14 = *(void *)v65;
    LODWORD(v12) = 2.0;
    long long v63 = v12;
    float v62 = -1.0;
    float v15 = -1.0;
    LODWORD(v12) = 2.0;
    long long v61 = v12;
    do
    {
      uint64_t v16 = 0;
      int v17 = v13;
      uint64_t v18 = v13;
      do
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = [*(id *)(*((void *)&v64 + 1) + v16) boundingQuad];
        [v19 boundingBox];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        [v19 topLeft];
        *(float *)&double v28 = v28;
        retstr->var0[v18 + v16] = *(float *)&v28;
        [v19 topLeft];
        float v30 = v29;
        retstr->var0[v18 + 1 + v16] = v30;
        [v19 topRight];
        *(float *)&double v31 = v31;
        retstr->var0[v18 + 2 + v16] = *(float *)&v31;
        [v19 topRight];
        float v33 = v32;
        retstr->var0[v18 + 3 + v16] = v33;
        [v19 bottomRight];
        *(float *)&double v34 = v34;
        retstr->var0[v18 + 4 + v16] = *(float *)&v34;
        [v19 bottomRight];
        float v36 = v35;
        retstr->var0[v18 + 5 + v16] = v36;
        [v19 bottomLeft];
        *(float *)&double v37 = v37;
        retstr->var0[v18 + 6 + v16] = *(float *)&v37;
        [v19 bottomLeft];
        float v39 = v38;
        retstr->var0[v18 + 7 + v16] = v39;
        if (v6)
        {
          v73.origin.x = v21;
          v73.origin.y = v23;
          v73.size.width = v25;
          v73.size.height = v27;
          double MinX = CGRectGetMinX(v73);
          v74.origin.x = v21;
          v74.origin.y = v23;
          v74.size.width = v25;
          v74.size.height = v27;
          double MinY = CGRectGetMinY(v74);
          v75.origin.x = v21;
          v75.origin.y = v23;
          v75.size.width = v25;
          v75.size.height = v27;
          double MaxX = CGRectGetMaxX(v75);
          v76.origin.x = v21;
          v76.origin.y = v23;
          v76.size.width = v25;
          v76.size.height = v27;
          CGFloat MaxY = CGRectGetMaxY(v76);
          float v44 = MinX;
          float v47 = MaxY;
          long long v48 = v63;
          if (*(float *)&v63 >= v44) {
            *(float *)&long long v48 = MinX;
          }
          long long v63 = v48;
          float v49 = v62;
          float v46 = MaxX;
          if (v62 <= v46) {
            float v49 = MaxX;
          }
          float v62 = v49;
          long long v50 = v61;
          float v45 = MinY;
          if (*(float *)&v61 >= v45) {
            *(float *)&long long v50 = MinY;
          }
          long long v61 = v50;
          if (v15 <= v47) {
            float v15 = v47;
          }
        }

        v16 += 8;
        --v11;
      }
      while (v11);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v69 count:16];
      int v13 = v17 + v16;
    }
    while (v11);
  }
  else
  {
    LODWORD(v12) = 2.0;
    *(void *)&long long v63 = v12;
    float v62 = -1.0;
    float v15 = -1.0;
    LODWORD(v12) = 2.0;
    *(void *)&long long v61 = v12;
  }

  if (v6)
  {
    uint64_t v53 = 4 * v60;
    if (4 * v60 >= 1)
    {
      *(float *)v52.i32 = v15 - *(float *)&v61;
      *(float *)v51.i32 = v62 - *(float *)&v63;
      var0 = retstr->var0;
      float32x4_t v55 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v63, 0);
      float32x4_t v56 = (float32x4_t)vdupq_lane_s32(v51, 0);
      float32x4_t v57 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v61, 0);
      float32x4_t v58 = (float32x4_t)vdupq_lane_s32(v52, 0);
      do
      {
        float32x4x2_t v71 = vld2q_f32(var0);
        v72.val[0] = vdivq_f32(vsubq_f32(v71.val[0], v55), v56);
        v72.val[1] = vdivq_f32(vsubq_f32(v71.val[1], v57), v58);
        vst2q_f32(var0, v72);
        var0 += 8;
        v53 -= 4;
      }
      while (v53);
    }
  }

  return result;
}

- (NSArray)codemap
{
  return self->_codemap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codemap, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_decoderName, 0);
  objc_storeStrong((id *)&self->_encoderName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modelSmallestConfig, 0);
  objc_storeStrong((id *)&self->_modelConfigurationsNumRegions, 0);
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_decoderModel, 0);
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_encoderModel, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end