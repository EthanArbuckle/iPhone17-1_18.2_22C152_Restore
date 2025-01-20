@interface SFFPlist
- (int)readPlist:(id)a3;
@end

@implementation SFFPlist

- (int)readPlist:(id)a3
{
  unsigned __int8 v25 = 0;
  id v4 = a3;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v5, @"MaxFaceLength", (uint64_t)&v25, 0.0);
  int v6 = v25;
  self->maxFaceLength = v7;
  unsigned __int8 v26 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v8, @"MaxBoundsRatio", (uint64_t)&v26, 0.0);
  int v9 = v26;
  self->maxBoundsRatio = v10;
  unsigned __int8 v27 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v11, @"MaxMeanSkinMaskValue", (uint64_t)&v27, 0.0);
  int v12 = v27;
  self->maxMeanSkinMaskValue = v13;
  unsigned __int8 v28 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v14, @"FeatherRate", (uint64_t)&v28, 0.0);
  int v15 = v28;
  self->featherRate = v16;
  char v29 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v17, @"FeatherOffset", (uint64_t)&v29, 0.0);
  float v19 = v18;

  if (v29) {
    BOOL v20 = v15 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20 || v12 == 0 || v9 == 0 || v6 == 0) {
    int result = 25;
  }
  else {
    int result = 0;
  }
  self->featherOffset = v19;
  return result;
}

@end