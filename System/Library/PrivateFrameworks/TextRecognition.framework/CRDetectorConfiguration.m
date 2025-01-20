@interface CRDetectorConfiguration
- (BOOL)detectTables;
- (BOOL)disableScriptDetection;
- (BOOL)disableTextTypeDetection;
- (BOOL)extractPolygons;
- (BOOL)logIntermediateResults;
- (BOOL)mergeFullTile;
- (BOOL)runFineScale;
- (BOOL)runFullTile;
- (BOOL)skipVerticalText;
- (BOOL)useScaleTraversal;
- (CGSize)maximumInputSize;
- (CGSize)minimumInputSize;
- (CGSize)tileSize;
- (CRDetectorConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4;
- (MTLDevice)metalDevice;
- (NSDictionary)scriptRatioThresholds;
- (NSString)prioritization;
- (NSURL)customModelURL;
- (double)inputLengthLimit;
- (double)minimumTextHeight;
- (double)scoreMapScaleFactor;
- (double)tileOverlap;
- (id)initV3DefaultConfig;
- (int)mergingType;
- (unint64_t)computeDeviceType;
- (unint64_t)tableMinDetectableArea;
- (void)setExtractPolygons:(BOOL)a3;
- (void)setMergeFullTile:(BOOL)a3;
- (void)setMergingType:(int)a3;
- (void)setRunFineScale:(BOOL)a3;
- (void)setRunFullTile:(BOOL)a3;
- (void)setUseScaleTraversal:(BOOL)a3;
@end

@implementation CRDetectorConfiguration

- (CRDetectorConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"CRImageReaderRevisionKey"];
    unint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    unint64_t v9 = +[CRImageReader defaultRevisionNumber];
  }

  if (v9 != 3)
  {
    if (v9 != 2)
    {
      if (v9 != 1)
      {
        if (a4)
        {
          +[CRImageReader errorWithErrorCode:-4];
          v38 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = 0;
        }
        goto LABEL_35;
      }
      v10 = CROSLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V1 detector config", buf, 2u);
      }
    }
    v11 = CROSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V2 detector config", buf, 2u);
    }
  }
  v12 = [(CRDetectorConfiguration *)self initV3DefaultConfig];
  if (v12)
  {
    v13 = [v6 objectForKeyedSubscript:@"CRImageReaderMinimumTextHeight"];

    if (v13)
    {
      v14 = [v6 objectForKeyedSubscript:@"CRImageReaderMinimumTextHeight"];
      [v14 doubleValue];
      *((void *)v12 + 7) = v15;
    }
    v16 = [v6 objectForKeyedSubscript:@"CRImageReaderDisableScriptDetection"];
    int v17 = [v16 BOOLValue];

    if (v17) {
      v12[11] = 1;
    }
    v18 = [v6 objectForKeyedSubscript:@"CRImageReaderDisableTextTypeDetection"];
    int v19 = [v18 BOOLValue];

    if (v19) {
      v12[12] = 1;
    }
    id v40 = 0;
    unint64_t v20 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:v6 mtlDevice:&v40];
    id v21 = v40;
    id v22 = v40;
    *((void *)v12 + 12) = v20;
    if (v22) {
      objc_storeStrong((id *)v12 + 11, v21);
    }
    v23 = [v6 objectForKeyedSubscript:@"CREnableLogIntermediateDetectorResult"];
    int v24 = [v23 BOOLValue];

    if (v24) {
      v12[10] = 1;
    }
    v25 = [v6 objectForKeyedSubscript:@"CRImageReaderDetectorModelPath"];
    if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v25];
      v27 = (void *)*((void *)v12 + 3);
      *((void *)v12 + 3) = v26;
    }
    v28 = [v6 objectForKeyedSubscript:@"CRImageReaderCoreMode"];
    v12[8] = [v28 BOOLValue] ^ 1;

    v29 = [v6 objectForKeyedSubscript:@"CRImageReaderSkipVerticalText"];
    v12[9] = [v29 BOOLValue];

    if (v9 >= 3)
    {
      uint64_t v30 = +[CRImageReader prioritizationForOptions:v6];
      v31 = (void *)*((void *)v12 + 5);
      *((void *)v12 + 5) = v30;

      if ([*((id *)v12 + 5) isEqualToString:@"CRImageReaderPrioritizationPerformance"])
      {
        *(int64x2_t *)(v12 + 136) = vdupq_n_s64(0x408D000000000000uLL);
        v42[0] = @"CRScriptThresholdLatinToChinese";
        v42[1] = @"CRScriptThresholdPreferredLatinCJK";
        v43[0] = &unk_1F393B130;
        v43[1] = &unk_1F393B130;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
        v33 = (void *)*((void *)v12 + 9);
        *((void *)v12 + 9) = v32;

        *((void *)v12 + 6) = 0x409E000000000000;
      }
      v34 = [v6 objectForKeyedSubscript:@"CRImageReaderDetectorMaxInputSize"];

      if (v34)
      {
        v35 = [v6 objectForKeyedSubscript:@"CRImageReaderDetectorMaxInputSize"];
        [v35 doubleValue];
        double v37 = v36;

        if (v37 > 0.0)
        {
          *((double *)v12 + 17) = v37;
          *((double *)v12 + 18) = v37;
        }
      }
      *((void *)v12 + 8) = 1000;
    }
  }
  self = v12;
  v38 = self;
LABEL_35:

  return v38;
}

- (id)initV3DefaultConfig
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CRDetectorConfiguration;
  v2 = [(CRDetectorConfiguration *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    int64x2_t v4 = vdupq_n_s64(0x407E000000000000uLL);
    *(int64x2_t *)(v2 + 104) = v4;
    *(_DWORD *)(v2 + 10) = 16842752;
    *((_WORD *)v2 + 7) = 1;
    v2[16] = 1;
    *(int64x2_t *)(v2 + 120) = v4;
    *(int64x2_t *)(v2 + 136) = vdupq_n_s64(0x4095800000000000uLL);
    *((void *)v2 + 6) = 0x40AFC00000000000;
    *((void *)v2 + 10) = 0x3FD0000000000000;
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 4) = 0x4040000000000000;

    *((_DWORD *)v3 + 5) = 3;
    v10[0] = @"CRScriptThresholdLatinToChinese";
    v10[1] = @"CRScriptThresholdPreferredLatinCJK";
    v11[0] = &unk_1F393B140;
    v11[1] = &unk_1F393B150;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v7 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v6;

    objc_storeStrong((id *)v3 + 5, @"CRImageReaderPrioritizationAccuracy");
    *((unsigned char *)v3 + 17) = 1;
  }
  return v3;
}

- (BOOL)detectTables
{
  return self->_detectTables;
}

- (BOOL)skipVerticalText
{
  return self->_skipVerticalText;
}

- (BOOL)logIntermediateResults
{
  return self->_logIntermediateResults;
}

- (NSURL)customModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)disableScriptDetection
{
  return self->_disableScriptDetection;
}

- (BOOL)disableTextTypeDetection
{
  return self->_disableTextTypeDetection;
}

- (BOOL)runFullTile
{
  return self->_runFullTile;
}

- (void)setRunFullTile:(BOOL)a3
{
  self->_runFullTile = a3;
}

- (BOOL)runFineScale
{
  return self->_runFineScale;
}

- (void)setRunFineScale:(BOOL)a3
{
  self->_runFineScale = a3;
}

- (BOOL)mergeFullTile
{
  return self->_mergeFullTile;
}

- (void)setMergeFullTile:(BOOL)a3
{
  self->_mergeFullTile = a3;
}

- (BOOL)useScaleTraversal
{
  return self->_useScaleTraversal;
}

- (void)setUseScaleTraversal:(BOOL)a3
{
  self->_useScaleTraversal = a3;
}

- (BOOL)extractPolygons
{
  return self->_extractPolygons;
}

- (void)setExtractPolygons:(BOOL)a3
{
  self->_extractPolygons = a3;
}

- (CGSize)tileSize
{
  objc_copyStruct(v4, &self->_tileSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)tileOverlap
{
  return self->_tileOverlap;
}

- (NSString)prioritization
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CGSize)minimumInputSize
{
  objc_copyStruct(v4, &self->_minimumInputSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumInputSize
{
  objc_copyStruct(v4, &self->_maximumInputSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)inputLengthLimit
{
  return self->_inputLengthLimit;
}

- (double)minimumTextHeight
{
  return self->_minimumTextHeight;
}

- (unint64_t)tableMinDetectableArea
{
  return self->_tableMinDetectableArea;
}

- (NSDictionary)scriptRatioThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (double)scoreMapScaleFactor
{
  return self->_scoreMapScaleFactor;
}

- (int)mergingType
{
  return self->_mergingType;
}

- (void)setMergingType:(int)a3
{
  self->_mergingType = a3;
}

- (MTLDevice)metalDevice
{
  return (MTLDevice *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)computeDeviceType
{
  return self->_computeDeviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_scriptRatioThresholds, 0);
  objc_storeStrong((id *)&self->_prioritization, 0);
  objc_storeStrong((id *)&self->_customModelURL, 0);
}

@end