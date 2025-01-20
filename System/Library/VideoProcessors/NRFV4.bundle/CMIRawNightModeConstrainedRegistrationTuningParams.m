@interface CMIRawNightModeConstrainedRegistrationTuningParams
- (BOOL)enabled;
- (float)costLumaDownsampleGamma;
- (float)hybridBlendingMaskDownsampleGamma;
- (float)hybridBlendingMaskLumaMismatchGamma;
- (float)hybridBlendingMaskLumaMismatchSigma;
- (float)imageDownsampleGamma;
- (float)localMotionRejectionSigma;
- (float)localMotionRejectionWeightDownsampleGamma;
- (float)minimumPreviousShiftDistance;
- (float)minimumPreviousShiftUpdateDistance;
- (float)regularizationLumaSigma;
- (float)sadGamma;
- (int)readPlist:(id)a3;
- (unsigned)regularizationSharpness;
@end

@implementation CMIRawNightModeConstrainedRegistrationTuningParams

- (int)readPlist:(id)a3
{
  char v24 = 0;
  v23.receiver = self;
  v23.super_class = (Class)CMIRawNightModeConstrainedRegistrationTuningParams;
  id v4 = a3;
  [(CMITuningPlist *)&v23 readPlist:v4];
  v5 = [v4 objectForKeyedSubscript:@"Registration"];

  v6 = [v5 objectForKeyedSubscript:@"Constrained"];

  v7 = v6;
  if (!v6)
  {
    FigSignalErrorAt();
    v7 = (void *)MEMORY[0x263EFFA78];
  }
  id v8 = v7;

  self->_enabled = objc_msgSend(v8, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v24);
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v9) = 1075419546;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"ImageDownsampleGamma", &v24, v9);
  self->_imageDownsampleGamma = *(float *)&v10;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v10) = 0.5;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"CostLumaDownsampleGamma", &v24, v10);
  self->_costLumaDownsampleGamma = *(float *)&v11;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v11) = 1070386381;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"SADGamma", &v24, v11);
  self->_sadGamma = *(float *)&v12;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v12) = 981668463;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"LocalMotionRejectionSigma", &v24, v12);
  self->_localMotionRejectionSigma = *(float *)&v13;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v13) = 0.5;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"LocalMotionRejectionWeightDownsampleGamma", &v24, v13);
  self->_localMotionRejectionWeightDownsampleGamma = v14;
  if (!v24) {
    FigSignalErrorAt();
  }
  self->_regularizationSharpness = objc_msgSend(v8, "cmi_unsignedIntValueForKey:defaultValue:found:", @"RegularizationSharpness", 32, &v24);
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v15) = 1000593162;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"RegularizationLumaSigma", &v24, v15);
  self->_regularizationLumaSigma = *(float *)&v16;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v16) = 0.25;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"HybridBlendingMaskLumaMismatchGamma", &v24, v16);
  self->_hybridBlendingMaskLumaMismatchGamma = *(float *)&v17;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v17) = 1028443341;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"HybridBlendingMaskLumaMismatchSigma", &v24, v17);
  self->_hybridBlendingMaskLumaMismatchSigma = *(float *)&v18;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v18) = 1075419546;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"HybridBlendingMaskDownsampleGamma", &v24, v18);
  self->_hybridBlendingMaskDownsampleGamma = *(float *)&v19;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v19) = 2.0;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"MinimumPreviousShiftDistance", &v24, v19);
  self->_minimumPreviousShiftDistance = *(float *)&v20;
  if (!v24) {
    FigSignalErrorAt();
  }
  LODWORD(v20) = 1.0;
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", @"MinimumPreviousShiftUpdateDistance", &v24, v20);
  self->_minimumPreviousShiftUpdateDistance = v21;
  if (!v24) {
    FigSignalErrorAt();
  }

  return 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (float)imageDownsampleGamma
{
  return self->_imageDownsampleGamma;
}

- (float)costLumaDownsampleGamma
{
  return self->_costLumaDownsampleGamma;
}

- (float)sadGamma
{
  return self->_sadGamma;
}

- (float)localMotionRejectionSigma
{
  return self->_localMotionRejectionSigma;
}

- (float)localMotionRejectionWeightDownsampleGamma
{
  return self->_localMotionRejectionWeightDownsampleGamma;
}

- (unsigned)regularizationSharpness
{
  return self->_regularizationSharpness;
}

- (float)regularizationLumaSigma
{
  return self->_regularizationLumaSigma;
}

- (float)hybridBlendingMaskLumaMismatchGamma
{
  return self->_hybridBlendingMaskLumaMismatchGamma;
}

- (float)hybridBlendingMaskLumaMismatchSigma
{
  return self->_hybridBlendingMaskLumaMismatchSigma;
}

- (float)hybridBlendingMaskDownsampleGamma
{
  return self->_hybridBlendingMaskDownsampleGamma;
}

- (float)minimumPreviousShiftDistance
{
  return self->_minimumPreviousShiftDistance;
}

- (float)minimumPreviousShiftUpdateDistance
{
  return self->_minimumPreviousShiftUpdateDistance;
}

@end