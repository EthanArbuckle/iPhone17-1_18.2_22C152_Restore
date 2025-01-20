@interface TCRPlist
- (int)readPlist:(id)a3;
@end

@implementation TCRPlist

- (int)readPlist:(id)a3
{
  int v14 = 0;
  id v4 = a3;
  getFloatParameter(v4, @"GlobalAlpha", &v14);
  self->globalAlpha = v5;
  getFloatParameter(v4, @"LocalAlpha", &v14);
  self->localAlpha = v6;
  getFloatParameter(v4, @"ThresholdMask", &v14);
  self->thresholdMask = v7;
  getFloatParameter(v4, @"ThresholdNumMaskTiles", &v14);
  self->thresholdNumMaskTiles = v8;
  getFloatParameter(v4, @"EdgeMaskT0", &v14);
  self->edgeMaskT0 = v9;
  getFloatParameter(v4, @"EdgeMaskT1", &v14);
  self->edgeMaskT1 = v10;
  getFloatParameter(v4, @"ExtraMaskAlpha", &v14);
  self->extraMaskAlpha = v11;
  char v15 = 0;
  int v12 = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", @"MaskType", 0, &v15);

  if (v15) {
    int result = v14;
  }
  else {
    int result = -73265;
  }
  self->maskType = v12;
  return result;
}

@end