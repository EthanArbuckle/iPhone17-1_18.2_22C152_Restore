@interface NoiseModelPlist
- (int)readPlist:(id)a3;
@end

@implementation NoiseModelPlist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BandFactorC", 0, 0.0);
  self->bandFactorC = v5;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BandFactorY", 0, 0.0);
  self->bandFactorY = v6;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BiasFactor", 0, 0.0);
  self->biasFactor = v7;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GammaC", 0, 0.0);
  self->gammaC = v8;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GammaY", 0, 0.0);
  self->gammaY = v9;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"SlopeFactor", 0, 0.0);
  self->slopeFactor = v10;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BaseSigma", 0, 0.0);
  self->baseSigma = v11;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BaseSigmaC", 0, 0.0);
  self->baseSigmaC = v12;
  v13 = [v4 objectForKeyedSubscript:@"NoiseModelVariant"];

  variant = self->variant;
  self->variant = v13;

  return 0;
}

- (void).cxx_destruct
{
}

@end