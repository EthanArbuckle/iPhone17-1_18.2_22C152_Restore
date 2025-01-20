@interface SoftISPModuleCalibration_BlackLevelShadingCorrection
- (SoftISPModuleCalibration_BlackLevelShadingCorrection)initWithBlackLevelShadingCorrectionThumbnails:(id)a3 metalContext:(id)a4;
- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailHires;
- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailQsub2xSplitPD;
- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailQsub2xSumPD;
- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailQsum;
- (int)metadataVersion;
- (int)modelVersionMajor;
- (int)modelVersionMinor;
@end

@implementation SoftISPModuleCalibration_BlackLevelShadingCorrection

- (SoftISPModuleCalibration_BlackLevelShadingCorrection)initWithBlackLevelShadingCorrectionThumbnails:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v26 = 0;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && v7)
  {
    v8 = [v6 metadata];
    v25.receiver = self;
    v25.super_class = (Class)SoftISPModuleCalibration_BlackLevelShadingCorrection;
    v9 = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)&v25 init];
    if (v9)
    {
      v10 = v9;
      v9->_metadataVersion = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 cmi_intValueForKey:*MEMORY[0x263F2F570] defaultValue:0 found:&v26];
      v10->_modelVersionMajor = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 cmi_intValueForKey:*MEMORY[0x263F2F590] defaultValue:0 found:&v26];
      v10->_modelVersionMinor = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 cmi_intValueForKey:*MEMORY[0x263F2F598] defaultValue:0 found:&v26];
      v11 = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 objectForKeyedSubscript:*MEMORY[0x263F2F3A8]];
      uint64_t v12 = createBlackLevelShadingThumbnail(v11, v7);
      blackLevelShadingThumbnailQsum = v10->_blackLevelShadingThumbnailQsum;
      v10->_blackLevelShadingThumbnailQsum = (SoftISPModuleCalibration_BlackLevelShadingThumbnail *)v12;

      v14 = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 objectForKeyedSubscript:*MEMORY[0x263F2F390]];
      uint64_t v15 = createBlackLevelShadingThumbnail(v14, v7);
      blackLevelShadingThumbnailHires = v10->_blackLevelShadingThumbnailHires;
      v10->_blackLevelShadingThumbnailHires = (SoftISPModuleCalibration_BlackLevelShadingThumbnail *)v15;

      v17 = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 objectForKeyedSubscript:*MEMORY[0x263F2F3A0]];
      uint64_t v18 = createBlackLevelShadingThumbnail(v17, v7);
      blackLevelShadingThumbnailQsub2xSumPD = v10->_blackLevelShadingThumbnailQsub2xSumPD;
      v10->_blackLevelShadingThumbnailQsub2xSumPD = (SoftISPModuleCalibration_BlackLevelShadingThumbnail *)v18;

      v20 = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v8 objectForKeyedSubscript:*MEMORY[0x263F2F398]];
      uint64_t v21 = createBlackLevelShadingThumbnail(v20, v7);
      blackLevelShadingThumbnailQsub2xSplitPD = v10->_blackLevelShadingThumbnailQsub2xSplitPD;
      v10->_blackLevelShadingThumbnailQsub2xSplitPD = (SoftISPModuleCalibration_BlackLevelShadingThumbnail *)v21;

      self = v10;
      v23 = self;
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      v23 = 0;
      self = v8;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v23 = 0;
  }

  return v23;
}

- (int)metadataVersion
{
  return self->_metadataVersion;
}

- (int)modelVersionMajor
{
  return self->_modelVersionMajor;
}

- (int)modelVersionMinor
{
  return self->_modelVersionMinor;
}

- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailQsum
{
  return self->_blackLevelShadingThumbnailQsum;
}

- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailHires
{
  return self->_blackLevelShadingThumbnailHires;
}

- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailQsub2xSumPD
{
  return self->_blackLevelShadingThumbnailQsub2xSumPD;
}

- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)blackLevelShadingThumbnailQsub2xSplitPD
{
  return self->_blackLevelShadingThumbnailQsub2xSplitPD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackLevelShadingThumbnailQsub2xSplitPD, 0);
  objc_storeStrong((id *)&self->_blackLevelShadingThumbnailQsub2xSumPD, 0);
  objc_storeStrong((id *)&self->_blackLevelShadingThumbnailHires, 0);

  objc_storeStrong((id *)&self->_blackLevelShadingThumbnailQsum, 0);
}

@end