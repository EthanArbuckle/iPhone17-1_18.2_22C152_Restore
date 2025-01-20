@interface SoftISPModuleCalibration
- (SoftISPModuleCalibration)initWithCMIModuleCalibration:(id)a3 metalContext:(id)a4;
- (SoftISPModuleCalibration_BlackLevelShadingCorrection)blacklevelShadingCorrection;
- (SoftISPModuleCalibration_ShadingFPNCorrection)quadraShadingFPNCorrection;
- (SoftISPModuleCalibration_ShadingFPNCorrection)shadingFPNCorrection;
@end

@implementation SoftISPModuleCalibration

- (SoftISPModuleCalibration)initWithCMIModuleCalibration:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    FigDebugAssert3();
LABEL_14:
    FigSignalErrorAt();

    self = 0;
    goto LABEL_10;
  }
  v28.receiver = self;
  v28.super_class = (Class)SoftISPModuleCalibration;
  self = [(SoftISPModuleCalibration *)&v28 init];
  if (!self)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_10;
  }
  v9 = [v6 shadingFPNCorrectionImage];
  uint64_t v10 = [v9 pixelBuffer];

  if (v10)
  {
    v11 = [SoftISPModuleCalibration_ShadingFPNCorrection alloc];
    v12 = [v6 shadingFPNCorrectionImage];
    v13 = [(SoftISPModuleCalibration_ShadingFPNCorrection *)v11 initWithShadingFPNCorrectionImage:v12 metalContext:v8];
    shadingFPNCorrection = self->_shadingFPNCorrection;
    self->_shadingFPNCorrection = v13;

    if (!self->_shadingFPNCorrection) {
      goto LABEL_13;
    }
  }
  v15 = [v6 quadraShadingFPNCorrectionImage];
  uint64_t v16 = [v15 pixelBuffer];

  if (v16)
  {
    v17 = [SoftISPModuleCalibration_ShadingFPNCorrection alloc];
    v18 = [v6 quadraShadingFPNCorrectionImage];
    v19 = [(SoftISPModuleCalibration_ShadingFPNCorrection *)v17 initWithShadingFPNCorrectionImage:v18 metalContext:v8];
    quadraShadingFPNCorrection = self->_quadraShadingFPNCorrection;
    self->_quadraShadingFPNCorrection = v19;

    if (!self->_quadraShadingFPNCorrection) {
      goto LABEL_13;
    }
  }
  v21 = [v6 blacklevelShadingCorrectionThumbnails];
  v22 = [v21 metadata];

  if (v22)
  {
    v23 = [SoftISPModuleCalibration_BlackLevelShadingCorrection alloc];
    v24 = [v6 blacklevelShadingCorrectionThumbnails];
    v25 = [(SoftISPModuleCalibration_BlackLevelShadingCorrection *)v23 initWithBlackLevelShadingCorrectionThumbnails:v24 metalContext:v8];
    blacklevelShadingCorrection = self->_blacklevelShadingCorrection;
    self->_blacklevelShadingCorrection = v25;

    if (!self->_blacklevelShadingCorrection)
    {
LABEL_13:
      FigDebugAssert3();
      goto LABEL_14;
    }
  }
LABEL_10:

  return self;
}

- (SoftISPModuleCalibration_ShadingFPNCorrection)shadingFPNCorrection
{
  return self->_shadingFPNCorrection;
}

- (SoftISPModuleCalibration_ShadingFPNCorrection)quadraShadingFPNCorrection
{
  return self->_quadraShadingFPNCorrection;
}

- (SoftISPModuleCalibration_BlackLevelShadingCorrection)blacklevelShadingCorrection
{
  return self->_blacklevelShadingCorrection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklevelShadingCorrection, 0);
  objc_storeStrong((id *)&self->_quadraShadingFPNCorrection, 0);

  objc_storeStrong((id *)&self->_shadingFPNCorrection, 0);
}

@end