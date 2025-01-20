@interface TCRPlist
- (int)readPlist:(id)a3;
@end

@implementation TCRPlist

- (int)readPlist:(id)a3
{
  unsigned __int8 v37 = 0;
  id v4 = a3;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v5, @"GlobalAlpha", (uint64_t)&v37, 0.0);
  int v6 = v37;
  self->globalAlpha = v7;
  unsigned __int8 v38 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v8, @"LocalAlpha", (uint64_t)&v38, 0.0);
  int v9 = v38;
  self->localAlpha = v10;
  unsigned __int8 v39 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v11, @"ThresholdMask", (uint64_t)&v39, 0.0);
  int v12 = v39;
  self->thresholdMask = v13;
  unsigned __int8 v40 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v14, @"ThresholdNumMaskTiles", (uint64_t)&v40, 0.0);
  int v15 = v40;
  self->thresholdNumMaskTiles = v16;
  unsigned __int8 v41 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v17, @"EdgeMaskT0", (uint64_t)&v41, 0.0);
  int v18 = v41;
  self->edgeMaskT0 = v19;
  unsigned __int8 v42 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v20, @"EdgeMaskT1", (uint64_t)&v42, 0.0);
  int v21 = v42;
  self->edgeMaskT1 = v22;
  unsigned __int8 v43 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v23, @"ExtraMaskAlpha", (uint64_t)&v43, 0.0);
  int v24 = v43;
  self->extraMaskAlpha = v25;
  char v44 = 0;
  int v27 = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v4, v26, @"MaskType", 0, &v44);

  if (v6) {
    BOOL v28 = v9 == 0;
  }
  else {
    BOOL v28 = 1;
  }
  char v35 = v28 || v12 == 0 || v15 == 0 || v18 == 0 || v21 == 0 || v24 == 0 || v44 == 0;
  if (v35) {
    int result = 25;
  }
  else {
    int result = 0;
  }
  self->maskType = v27;
  return result;
}

@end