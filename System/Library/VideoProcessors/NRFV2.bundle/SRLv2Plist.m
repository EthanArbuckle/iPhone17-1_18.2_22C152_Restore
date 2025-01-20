@interface SRLv2Plist
- (int)readPlist:(id)a3;
@end

@implementation SRLv2Plist

- (int)readPlist:(id)a3
{
  unsigned __int8 v89 = 0;
  id v4 = a3;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v5, @"MaskThreshold", (uint64_t)&v89, 0.0);
  int v88 = v89;
  self->maskThreshold = v6;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v7, @"MinFaceSize", (uint64_t)&v89, 0.0);
  int v87 = v89;
  self->minFaceSize = v8;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v9, @"MaxCurveBoost", (uint64_t)&v89, 0.0);
  int v86 = v89;
  self->maxCurveBoost = v10;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v11, @"MinCurveBoost", (uint64_t)&v89, 0.0);
  int v85 = v89;
  self->minCurveBoost = v12;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v13, @"MaxTargetRatioDarkening", (uint64_t)&v89, 0.0);
  int v84 = v89;
  self->maxTargetRatioDarkening = v14;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v15, @"MaxTargetRatioLimit", (uint64_t)&v89, 0.0);
  int v83 = v89;
  self->maxTargetRatioLimit = v16;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v17, @"BiasFactorSRLv2", (uint64_t)&v89, 0.0);
  int v82 = v89;
  self->biasFactorSRLv2 = v18;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v19, @"ToneSimilaritySigma", (uint64_t)&v89, 0.0);
  int v81 = v89;
  self->toneSimilaritySigma = v20;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v21, @"FaceExpDifThreshold", (uint64_t)&v89, 0.0);
  int v80 = v89;
  self->faceExpDifThreshold = v22;
  self->relightOnlyPersonMask = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v23, @"RelightOnlyPersonMask", 0, 0);
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v24, @"TargetMedian_I", (uint64_t)&v89, 0.0);
  int v79 = v89;
  self->targetMedian_I = v25;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v26, @"TargetMedian_II", (uint64_t)&v89, 0.0);
  int v78 = v89;
  self->targetMedian_II = v27;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v28, @"TargetMedian_III", (uint64_t)&v89, 0.0);
  int v77 = v89;
  self->targetMedian_III = v29;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v30, @"TargetMedian_IV", (uint64_t)&v89, 0.0);
  int v31 = v89;
  self->targetMedian_IV = v32;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v33, @"TargetMedian_V", (uint64_t)&v89, 0.0);
  int v34 = v89;
  self->targetMedian_V = v35;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v36, @"TargetMedian_VI", (uint64_t)&v89, 0.0);
  int v37 = v89;
  self->targetMedian_VI = v38;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v39, @"MaxBoost_I", (uint64_t)&v89, 0.0);
  int v40 = v89;
  self->maxBoost_I = v41;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v42, @"MaxBoost_II", (uint64_t)&v89, 0.0);
  int v43 = v89;
  self->maxBoost_II = v44;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v45, @"MaxBoost_III", (uint64_t)&v89, 0.0);
  int v46 = v89;
  self->maxBoost_III = v47;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v48, @"MaxBoost_IV", (uint64_t)&v89, 0.0);
  int v49 = v89;
  self->maxBoost_IV = v50;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v51, @"MaxBoost_V", (uint64_t)&v89, 0.0);
  int v52 = v89;
  self->maxBoost_V = v53;
  unsigned __int8 v89 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v54, @"MaxBoost_VI", (uint64_t)&v89, 0.0);
  float v56 = v55;

  if (v43) {
    BOOL v57 = v46 == 0;
  }
  else {
    BOOL v57 = 1;
  }
  char v61 = v57 || v49 == 0 || v52 == 0 || v89 == 0;
  if (v80) {
    BOOL v62 = v79 == 0;
  }
  else {
    BOOL v62 = 1;
  }
  if (v62 || v78 == 0 || v77 == 0 || v31 == 0 || v34 == 0 || v37 == 0 || v40 == 0) {
    char v61 = 1;
  }
  if (v88) {
    BOOL v69 = v87 == 0;
  }
  else {
    BOOL v69 = 1;
  }
  if (v69 || v86 == 0 || v85 == 0 || v84 == 0 || v83 == 0 || v82 == 0 || v81 == 0) {
    char v61 = 1;
  }
  if (v61) {
    int result = 25;
  }
  else {
    int result = 0;
  }
  self->maxBoost_VI = v56;
  return result;
}

@end