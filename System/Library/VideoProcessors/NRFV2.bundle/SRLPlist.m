@interface SRLPlist
- (int)readPlist:(id)a3;
@end

@implementation SRLPlist

- (int)readPlist:(id)a3
{
  v186[0] = 0;
  id v4 = a3;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v5, @"MinFaceSizeT0", (uint64_t)v186, 0.0);
  int v185 = v186[0];
  self->minFaceSizeT0 = v6;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v7, @"MinFaceSizeT1", (uint64_t)v186, 0.0);
  int v184 = v186[0];
  self->minFaceSizeT1 = v8;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v9, @"MaxProfileFaceOrientation", (uint64_t)v186, 0.0);
  int v183 = v186[0];
  self->maxProfileFaceOrientation = v10;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v11, @"SkinMaskMaybeT", (uint64_t)v186, 0.0);
  int v182 = v186[0];
  self->skinMaskMaybeT = v12;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v13, @"SkinMaskDefinitelyT", (uint64_t)v186, 0.0);
  int v181 = v186[0];
  self->skinMaskDefinitelyT = v14;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v15, @"PersonMaskT0", (uint64_t)v186, 0.0);
  int v180 = v186[0];
  self->personMaskT0 = v16;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v17, @"PersonMaskT1", (uint64_t)v186, 0.0);
  int v179 = v186[0];
  self->personMaskT1 = v18;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v19, @"LumaSigmaMaskM", (uint64_t)v186, 0.0);
  int v178 = v186[0];
  self->lumaSigmaMaskM = v20;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v21, @"LumaSigmaMaskC", (uint64_t)v186, 0.0);
  int v177 = v186[0];
  self->lumaSigmaMaskC = v22;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v23, @"BlueSigmaMaskM", (uint64_t)v186, 0.0);
  int v176 = v186[0];
  self->blueSigmaMaskM = v24;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v25, @"BlueSigmaMaskC", (uint64_t)v186, 0.0);
  int v175 = v186[0];
  self->blueSigmaMaskC = v26;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v27, @"BrightestFaceMaxLumaT0", (uint64_t)v186, 0.0);
  int v174 = v186[0];
  self->brightestFaceMaxLumaT0 = v28;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v29, @"BrightestFaceMaxLumaT1", (uint64_t)v186, 0.0);
  int v173 = v186[0];
  self->brightestFaceMaxLumaT1 = v30;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v31, @"HazeMaxT0", (uint64_t)v186, 0.0);
  int v172 = v186[0];
  self->hazeMaxT0 = v32;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v33, @"HazeMaxT1", (uint64_t)v186, 0.0);
  int v171 = v186[0];
  self->hazeMaxT1 = v34;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v35, @"MaxWhitePointSkinRedT0", (uint64_t)v186, 0.0);
  int v170 = v186[0];
  self->maxWhitePointSkinRedT0 = v36;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v37, @"MaxWhitePointSkinRedT1", (uint64_t)v186, 0.0);
  int v169 = v186[0];
  self->maxWhitePointSkinRedT1 = v38;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v39, @"MaxWhitePointNonSkinT0", (uint64_t)v186, 0.0);
  int v168 = v186[0];
  self->maxWhitePointNonSkinT0 = v40;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v41, @"MaxWhitePointNonSkinT1", (uint64_t)v186, 0.0);
  int v167 = v186[0];
  self->maxWhitePointNonSkinT1 = v42;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v43, @"ExtraBoostRedBlueMedianSumT0", (uint64_t)v186, 0.0);
  int v166 = v186[0];
  self->extraBoostRedBlueMedianSumT0 = v44;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v45, @"ExtraBoostRedBlueMedianSumT1", (uint64_t)v186, 0.0);
  int v165 = v186[0];
  self->extraBoostRedBlueMedianSumT1 = v46;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v47, @"ExtraBoostRedMedianWeight", (uint64_t)v186, 0.0);
  int v164 = v186[0];
  self->extraBoostRedMedianWeight = v48;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v49, @"ExtraBoostBlueMedianWeight", (uint64_t)v186, 0.0);
  int v163 = v186[0];
  self->extraBoostBlueMedianWeight = v50;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v51, @"ExtraBoostRedBlackPointT0", (uint64_t)v186, 0.0);
  int v162 = v186[0];
  self->extraBoostRedBlackPointT0 = v52;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v53, @"ExtraBoostRedBlackPointT1", (uint64_t)v186, 0.0);
  int v161 = v186[0];
  self->extraBoostRedBlackPointT1 = v54;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v55, @"ExtraBoostNonSkinLumaWhitePointT0", (uint64_t)v186, 0.0);
  int v160 = v186[0];
  self->extraBoostNonSkinLumaWhitePointT0 = v56;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v57, @"ExtraBoostNonSkinLumaWhitePointT1", (uint64_t)v186, 0.0);
  int v159 = v186[0];
  self->extraBoostNonSkinLumaWhitePointT1 = v58;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v59, @"BoostModelA", (uint64_t)v186, 0.0);
  int v158 = v186[0];
  self->boostModelA = v60;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v61, @"BoostModelB", (uint64_t)v186, 0.0);
  int v157 = v186[0];
  self->boostModelB = v62;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v63, @"MinFaceSizeT0Landmarks", (uint64_t)v186, 0.0);
  int v156 = v186[0];
  self->minFaceSizeT0Landmarks = v64;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v65, @"MinFaceSizeT1Landmarks", (uint64_t)v186, 0.0);
  int v155 = v186[0];
  self->minFaceSizeT1Landmarks = v66;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v67, @"GlobalLimitT0", (uint64_t)v186, 0.0);
  int v154 = v186[0];
  self->globalLimitT0 = v68;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v69, @"GlobalLimitT1", (uint64_t)v186, 0.0);
  int v153 = v186[0];
  self->globalLimitT1 = v70;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v71, @"GlobalLimitT2", (uint64_t)v186, 0.0);
  int v152 = v186[0];
  self->globalLimitT2 = v72;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v73, @"GlobalLimitT3", (uint64_t)v186, 0.0);
  int v151 = v186[0];
  self->globalLimitT3 = v74;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v75, @"GlobalLimitStr", (uint64_t)v186, 0.0);
  int v150 = v186[0];
  self->globalLimitStr = v76;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v77, @"LocalLimitT0", (uint64_t)v186, 0.0);
  int v149 = v186[0];
  self->localLimitT0 = v78;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v79, @"LocalLimitT1", (uint64_t)v186, 0.0);
  int v80 = v186[0];
  self->localLimitT1 = v81;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v82, @"LocalLimitStr", (uint64_t)v186, 0.0);
  int v83 = v186[0];
  self->localLimitStr = v84;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v85, @"LocalExtraBoost", (uint64_t)v186, 0.0);
  int v86 = v186[0];
  self->localExtraBoost = v87;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v88, @"SaturationT0", (uint64_t)v186, 0.0);
  int v89 = v186[0];
  self->saturationT0 = v90;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v91, @"SaturationT1", (uint64_t)v186, 0.0);
  int v92 = v186[0];
  self->saturationT1 = v93;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v94, @"SaturationStr", (uint64_t)v186, 0.0);
  int v95 = v186[0];
  self->saturationStr = v96;
  self->enableHRStrength = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v97, @"EnableHRStrength", 0, 0);
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v98, @"HRBoostModelA", (uint64_t)v186, 0.0);
  int v99 = v186[0];
  self->hRboostModelA = v100;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v101, @"HRBoostModelB", (uint64_t)v186, 0.0);
  int v102 = v186[0];
  self->hRboostModelB = v103;
  v186[0] = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v104, @"AETargetGainTh", (uint64_t)v186, 0.0);
  float v106 = v105;

  if (v89) {
    BOOL v107 = v92 == 0;
  }
  else {
    BOOL v107 = 1;
  }
  BOOL v110 = v107 || v95 == 0 || v99 == 0 || v102 == 0;
  self->aETargetGainTh = v106;
  char v112 = v110 || v186[0] == 0;
  if (v153) {
    BOOL v113 = v152 == 0;
  }
  else {
    BOOL v113 = 1;
  }
  if (v113 || v151 == 0 || v150 == 0 || v149 == 0 || v80 == 0 || v83 == 0 || v86 == 0) {
    char v112 = 1;
  }
  if (v161) {
    BOOL v120 = v160 == 0;
  }
  else {
    BOOL v120 = 1;
  }
  if (v120 || v159 == 0 || v158 == 0 || v157 == 0 || v156 == 0 || v155 == 0 || v154 == 0) {
    char v112 = 1;
  }
  if (v169) {
    BOOL v127 = v168 == 0;
  }
  else {
    BOOL v127 = 1;
  }
  if (v127 || v167 == 0 || v166 == 0 || v165 == 0 || v164 == 0 || v163 == 0 || v162 == 0) {
    char v112 = 1;
  }
  if (v177) {
    BOOL v134 = v176 == 0;
  }
  else {
    BOOL v134 = 1;
  }
  if (v134 || v175 == 0 || v174 == 0 || v173 == 0 || v172 == 0 || v171 == 0 || v170 == 0) {
    char v112 = 1;
  }
  if (v185) {
    BOOL v141 = v184 == 0;
  }
  else {
    BOOL v141 = 1;
  }
  if (v141 || v183 == 0 || v182 == 0 || v181 == 0 || v180 == 0 || v179 == 0 || v178 == 0) {
    char v112 = 1;
  }
  if (v112) {
    return 25;
  }
  else {
    return 0;
  }
}

@end