@interface MSTMv2Plist
- (int)readPlist:(id)a3;
@end

@implementation MSTMv2Plist

- (int)readPlist:(id)a3
{
  int v20 = 0;
  id v4 = a3;
  getFloatParameter(v4, @"MinGainRatio", &v20);
  self->minGainRatio = v5;
  getFloatParameter(v4, @"MaxGainRatio", &v20);
  self->maxGainRatio = v6;
  getFloatParameter(v4, @"MaskedAlpha", &v20);
  self->maskedAlpha = v7;
  getFloatParameter(v4, @"UnmaskedAlpha", &v20);
  self->unmaskedAlpha = v8;
  getFloatParameter(v4, @"SkyMaskedAlpha", &v20);
  self->skyMaskedAlpha = v9;
  getFloatParameter(v4, @"MaskedLambda", &v20);
  self->maskedLambda = v10;
  getFloatParameter(v4, @"UnmaskedLambda", &v20);
  self->unmaskedLambda = v11;
  getFloatParameter(v4, @"SkyMaskedLambda", &v20);
  self->skyMaskedLambda = v12;
  getFloatParameter(v4, @"MaskedDetailMix", &v20);
  self->maskedDetailMix = v13;
  getFloatParameter(v4, @"UnmaskedDetailMix", &v20);
  self->unmaskedDetailMix = v14;
  getFloatParameter(v4, @"SkyMaskedDetailMix", &v20);
  self->skyMaskedDetailMix = v15;
  getFloatParameter(v4, @"LimitMaxGainForeground", &v20);
  self->limitMaxGainForeground = v16;
  getFloatParameter(v4, @"LimitMaxGainBackground", &v20);
  float v18 = v17;

  self->limitMaxGainBackground = v18;
  if (self->minGainRatio != 0.0
    && self->maskedLambda != 0.0
    && self->unmaskedLambda != 0.0
    && self->skyMaskedLambda != 0.0)
  {
    return v20;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

@end