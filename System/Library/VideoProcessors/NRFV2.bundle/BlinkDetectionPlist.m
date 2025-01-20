@interface BlinkDetectionPlist
+ (void)initialize;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation BlinkDetectionPlist

+ (void)initialize
{
  word_26B429750 = -1;
  dword_26B42975C = -1082130432;
  word_26B429748 = -1;
  dword_26B42974C = -1082130432;
  dword_26B429758 = -1082130432;
  dword_26B429754 = -1082130432;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"BlinkDetectionMode", v6);
  v11 = v7;
  if (v7) {
    self->mode = objc_msgSend_intValue(v7, v8, v9, v10);
  }

  v14 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"ConfidenceThreshold", v13);
  v18 = v14;
  if (v14) {
    self->confidenceThreshold = objc_msgSend_intValue(v14, v15, v16, v17);
  }

  v21 = objc_msgSend_objectForKeyedSubscript_(v4, v19, @"LEyePortionLeft", v20);
  v25 = v21;
  if (v21)
  {
    objc_msgSend_floatValue(v21, v22, v23, v24);
    self->lEyePortionLeft = v26;
  }

  v29 = objc_msgSend_objectForKeyedSubscript_(v4, v27, @"LEyePortionTop", v28);
  v33 = v29;
  if (v29)
  {
    objc_msgSend_floatValue(v29, v30, v31, v32);
    self->lEyePortionTop = v34;
  }

  v37 = objc_msgSend_objectForKeyedSubscript_(v4, v35, @"LEyePortionWidth", v36);
  v41 = v37;
  if (v37)
  {
    objc_msgSend_floatValue(v37, v38, v39, v40);
    self->lEyePortionWidth = v42;
  }

  v45 = objc_msgSend_objectForKeyedSubscript_(v4, v43, @"LEyePortionHeight", v44);
  v49 = v45;
  if (v45)
  {
    objc_msgSend_floatValue(v45, v46, v47, v48);
    self->lEyePortionHeight = v50;
  }

  v53 = objc_msgSend_objectForKeyedSubscript_(v4, v51, @"LEyePortionWeight", v52);
  v57 = v53;
  if (v53)
  {
    objc_msgSend_floatValue(v53, v54, v55, v56);
    self->lEyePortionWeight = v58;
  }

  v61 = objc_msgSend_objectForKeyedSubscript_(v4, v59, @"REyePortionLeft", v60);
  v65 = v61;
  if (v61)
  {
    objc_msgSend_floatValue(v61, v62, v63, v64);
    self->rEyePortionLeft = v66;
  }

  v69 = objc_msgSend_objectForKeyedSubscript_(v4, v67, @"REyePortionTop", v68);
  v73 = v69;
  if (v69)
  {
    objc_msgSend_floatValue(v69, v70, v71, v72);
    self->rEyePortionTop = v74;
  }

  v77 = objc_msgSend_objectForKeyedSubscript_(v4, v75, @"REyePortionWidth", v76);
  v81 = v77;
  if (v77)
  {
    objc_msgSend_floatValue(v77, v78, v79, v80);
    self->rEyePortionWidth = v82;
  }

  v85 = objc_msgSend_objectForKeyedSubscript_(v4, v83, @"REyePortionHeight", v84);
  v89 = v85;
  if (v85)
  {
    objc_msgSend_floatValue(v85, v86, v87, v88);
    self->rEyePortionHeight = v90;
  }

  v93 = objc_msgSend_objectForKeyedSubscript_(v4, v91, @"REyePortionWeight", v92);
  v97 = v93;
  if (v93)
  {
    objc_msgSend_floatValue(v93, v94, v95, v96);
    self->rEyePortionWeight = v98;
  }

  v101 = objc_msgSend_objectForKeyedSubscript_(v4, v99, @"MouthPortionLeft", v100);
  v105 = v101;
  if (v101)
  {
    objc_msgSend_floatValue(v101, v102, v103, v104);
    self->mouthPortionLeft = v106;
  }

  v109 = objc_msgSend_objectForKeyedSubscript_(v4, v107, @"MouthPortionTop", v108);
  v113 = v109;
  if (v109)
  {
    objc_msgSend_floatValue(v109, v110, v111, v112);
    self->mouthPortionTop = v114;
  }

  v117 = objc_msgSend_objectForKeyedSubscript_(v4, v115, @"MouthPortionWidth", v116);
  v121 = v117;
  if (v117)
  {
    objc_msgSend_floatValue(v117, v118, v119, v120);
    self->mouthPortionWidth = v122;
  }

  v125 = objc_msgSend_objectForKeyedSubscript_(v4, v123, @"MouthPortionHeight", v124);
  v129 = v125;
  if (v125)
  {
    objc_msgSend_floatValue(v125, v126, v127, v128);
    self->mouthHeight = v130;
  }

  v133 = objc_msgSend_objectForKeyedSubscript_(v4, v131, @"MouthPortionWeight", v132);
  v137 = v133;
  if (v133)
  {
    objc_msgSend_floatValue(v133, v134, v135, v136);
    self->mouthPortionWeigth = v138;
  }

  v141 = objc_msgSend_objectForKeyedSubscript_(v4, v139, @"BlinkScoreStrength", v140);
  v145 = v141;
  if (v141)
  {
    objc_msgSend_floatValue(v141, v142, v143, v144);
    self->strength = v146;
  }

  return 0;
}

- (void)applyOverrides
{
  if ((word_26B429750 & 0x80000000) == 0) {
    self->mode = word_26B429750;
  }
  if (*(float *)&dword_26B42975C >= 0.0) {
    LODWORD(self->strength) = dword_26B42975C;
  }
  if ((word_26B429748 & 0x80000000) == 0) {
    self->confidenceThreshold = word_26B429748;
  }
  if (*(float *)&dword_26B42974C >= 0.0) {
    LODWORD(self->lEyePortionWeight) = dword_26B42974C;
  }
  if (*(float *)&dword_26B429758 >= 0.0) {
    LODWORD(self->rEyePortionWeight) = dword_26B429758;
  }
  if (*(float *)&dword_26B429754 >= 0.0) {
    LODWORD(self->mouthPortionWeigth) = dword_26B429754;
  }
}

@end