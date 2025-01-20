@interface SoftISPModuleCalibration_ShadingFPNCorrection
- (MTLTexture)correctionImage;
- (SoftISPModuleCalibration_ShadingFPNCorrection)initWithShadingFPNCorrectionImage:(id)a3 metalContext:(id)a4;
- (__n128)blackLevelResidualReference;
- (__n128)blackLevelResidualZero;
- (__n128)dcOffsetReference;
- (__n128)dcOffsetZero;
- (float)calibrationSpatialStdDev;
- (float)calibrationTemporalStdDev;
- (float)dcOffsetTemperatureGrowthFactor;
- (float)fpnMaxValue;
- (float)fpnMinValue;
- (float)fpnTemperatureGrowthFactor;
- (float)opbTemperatureGrowthFactor;
- (float)referenceAnalogGain;
- (float)referenceExposureTime;
- (float)referenceTemperature;
- (float)shadingMaxValue;
- (float)shadingMinValue;
- (float)shadingTemperatureGrowthFactor;
- (int)metadataVersion;
- (int)modelVersionMajor;
- (int)modelVersionMinor;
- (int)nDarkFramesUsedInCalibration;
@end

@implementation SoftISPModuleCalibration_ShadingFPNCorrection

- (SoftISPModuleCalibration_ShadingFPNCorrection)initWithShadingFPNCorrectionImage:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v32 = 0;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !v7)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_29:
    v29 = 0;
    goto LABEL_25;
  }
  v8 = [v6 metadata];
  v31.receiver = self;
  v31.super_class = (Class)SoftISPModuleCalibration_ShadingFPNCorrection;
  v9 = [(SoftISPModuleCalibration_ShadingFPNCorrection *)&v31 init];
  if (!v9)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v29 = 0;
    self = v8;
    goto LABEL_25;
  }
  self = v9;
  v9->_metadataVersion = [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_intValueForKey:*MEMORY[0x263F2F570] defaultValue:0 found:&v32];
  self->_modelVersionMajor = [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_intValueForKey:*MEMORY[0x263F2F590] defaultValue:0 found:&v32];
  self->_modelVersionMinor = [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_intValueForKey:*MEMORY[0x263F2F598] defaultValue:0 found:&v32];
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F490] defaultValue:&v32 found:0.0];
  self->_fpnTemperatureGrowthFactor = v10;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F6A0] defaultValue:&v32 found:0.0];
  self->_shadingTemperatureGrowthFactor = v11;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F420] defaultValue:&v32 found:0.0];
  self->_dcOffsetTemperatureGrowthFactor = v12;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F3B8] defaultValue:&v32 found:0.0];
  self->_opbTemperatureGrowthFactor = v13;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F588] defaultValue:&v32 found:0.0];
  self->_referenceTemperature = v14;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F580] defaultValue:&v32 found:0.0];
  self->_referenceExposureTime = v15;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F578] defaultValue:&v32 found:0.0];
  self->_referenceAnalogGain = v16;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F488] defaultValue:&v32 found:0.0];
  self->_fpnMinValue = v17;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F480] defaultValue:&v32 found:0.0];
  self->_fpnMaxValue = v18;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F698] defaultValue:&v32 found:0.0];
  self->_shadingMinValue = v19;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F690] defaultValue:&v32 found:0.0];
  self->_shadingMaxValue = v20;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_simdFloat4ValueForKey:*MEMORY[0x263F2F428] defaultValue:&v32 found:0.0];
  *(_OWORD *)self->_dcOffsetZero = v21;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_simdFloat4ValueForKey:*MEMORY[0x263F2F418] defaultValue:&v32 found:0.0];
  *(_OWORD *)self->_dcOffsetReference = v22;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_simdFloat4ValueForKey:*MEMORY[0x263F2F3C0] defaultValue:&v32 found:0.0];
  *(_OWORD *)self->_blackLevelResidualZero = v23;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_simdFloat4ValueForKey:*MEMORY[0x263F2F3B0] defaultValue:&v32 found:0.0];
  *(_OWORD *)self->_blackLevelResidualReference = v24;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F3E8] defaultValue:&v32 found:0.0];
  self->_calibrationTemporalStdDev = v25;
  if (!v32) {
    goto LABEL_28;
  }
  [(SoftISPModuleCalibration_ShadingFPNCorrection *)v8 cmi_floatValueForKey:*MEMORY[0x263F2F3E0] defaultValue:&v32 found:0.0];
  self->_calibrationSpatialStdDev = v26;
  if (!v32
    || (self->_nDarkFramesUsedInCalibration = -[SoftISPModuleCalibration_ShadingFPNCorrection cmi_intValueForKey:defaultValue:found:](v8, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F5A0], 0, &v32), !v32)|| (objc_msgSend(v7, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", objc_msgSend(v6, "pixelBuffer"), 30, 1, 0), v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), correctionImage = self->_correctionImage, self->_correctionImage = v27, correctionImage, !self->_correctionImage))
  {
LABEL_28:
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_29;
  }
  self = self;

  v29 = self;
LABEL_25:

  return v29;
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

- (float)fpnTemperatureGrowthFactor
{
  return self->_fpnTemperatureGrowthFactor;
}

- (float)shadingTemperatureGrowthFactor
{
  return self->_shadingTemperatureGrowthFactor;
}

- (float)dcOffsetTemperatureGrowthFactor
{
  return self->_dcOffsetTemperatureGrowthFactor;
}

- (float)opbTemperatureGrowthFactor
{
  return self->_opbTemperatureGrowthFactor;
}

- (float)referenceTemperature
{
  return self->_referenceTemperature;
}

- (float)referenceExposureTime
{
  return self->_referenceExposureTime;
}

- (float)referenceAnalogGain
{
  return self->_referenceAnalogGain;
}

- (float)fpnMinValue
{
  return self->_fpnMinValue;
}

- (float)fpnMaxValue
{
  return self->_fpnMaxValue;
}

- (float)shadingMinValue
{
  return self->_shadingMinValue;
}

- (float)shadingMaxValue
{
  return self->_shadingMaxValue;
}

- (__n128)dcOffsetZero
{
  return a1[6];
}

- (__n128)dcOffsetReference
{
  return a1[7];
}

- (__n128)blackLevelResidualZero
{
  return a1[8];
}

- (__n128)blackLevelResidualReference
{
  return a1[9];
}

- (float)calibrationTemporalStdDev
{
  return self->_calibrationTemporalStdDev;
}

- (float)calibrationSpatialStdDev
{
  return self->_calibrationSpatialStdDev;
}

- (int)nDarkFramesUsedInCalibration
{
  return self->_nDarkFramesUsedInCalibration;
}

- (MTLTexture)correctionImage
{
  return self->_correctionImage;
}

- (void).cxx_destruct
{
}

@end