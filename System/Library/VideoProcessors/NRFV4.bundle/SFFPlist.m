@interface SFFPlist
- (int)readPlist:(id)a3;
@end

@implementation SFFPlist

- (int)readPlist:(id)a3
{
  int v12 = 0;
  id v4 = a3;
  getFloatParameter(v4, @"MaxFaceLength", &v12);
  self->maxFaceLength = v5;
  getFloatParameter(v4, @"MaxBoundsRatio", &v12);
  self->maxBoundsRatio = v6;
  getFloatParameter(v4, @"MaxMeanSkinMaskValue", &v12);
  self->maxMeanSkinMaskValue = v7;
  getFloatParameter(v4, @"FeatherRate", &v12);
  self->featherRate = v8;
  getFloatParameter(v4, @"FeatherOffset", &v12);
  float v10 = v9;

  self->featherOffset = v10;
  return v12;
}

@end