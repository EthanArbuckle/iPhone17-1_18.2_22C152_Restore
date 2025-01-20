@interface SemanticStylesPlist
- (const)bgTuningForSceneType:(unsigned int)a3;
- (const)fgTuning;
- (const)toneBiasRemap;
- (int)readBackgroundTuning:(id)a3 forSceneType:(unsigned int)a4;
- (int)readForegroundTuning:(id)a3;
- (int)readPlist:(id)a3;
- (int)readToneBiasRemap:(id)a3;
@end

@implementation SemanticStylesPlist

- (const)toneBiasRemap
{
  return (const $E2C29196C7A5C696474C6955C5A9CE06 *)&self->_toneBiasRemap;
}

- (const)bgTuningForSceneType:(unsigned int)a3
{
  if (a3 <= 4) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  return (const $40B671914EE20BC2F0D4D9C6841CA9F5 *)&self->_bgTuning[v3];
}

- (const)fgTuning
{
  return (const $E27D735C8CFCB04042A324DC80A3B4BD *)&self->_fgTuning;
}

- (int)readToneBiasRemap:(id)a3
{
  id v4 = a3;
  v10 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"ZeroPoint", v6);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v11 = 0;
  }
  else {
    int v11 = 25;
  }
  objc_msgSend_floatValue(v10, v7, v8, v9);
  float v13 = v12;

  self->_toneBiasRemap.zeroPoint = v13;
  v19 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"NegCutoff", v15);
  if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v11 = 25;
  }
  objc_msgSend_floatValue(v19, v16, v17, v18);
  float v21 = v20;

  self->_toneBiasRemap.negCutoff = v21;
  v27 = objc_msgSend_objectForKeyedSubscript_(v4, v22, @"PosCutoff", v23);
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v11 = 25;
  }
  objc_msgSend_floatValue(v27, v24, v25, v26);
  float v29 = v28;

  self->_toneBiasRemap.posCutoff = v29;
  return v11;
}

- (int)readBackgroundTuning:(id)a3 forSceneType:(unsigned int)a4
{
  int v159 = 0;
  id v6 = a3;
  sub_262FFAFA8(a4);
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_stringByAppendingPathComponent_(@"Background", v8, (uint64_t)v7, v9);
  float v12 = sub_263008090(v6, v7, &v159, v11);

  if (v12)
  {
    bgTuning = self->_bgTuning;
    uint64_t v16 = a4;
    uint64_t v17 = objc_msgSend_stringByAppendingPathComponent_(v10, v13, @"Positive", v14);

    v19 = sub_263008090(v12, (const char *)@"Positive", &v159, v18);
    uint64_t v23 = v19;
    if (v19)
    {
      p_tide = (_DWORD *)&bgTuning[v16].pos.tide;
      float v28 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"Tide", v22);
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v28, v25, v26, v27);
      int v30 = v29;

      _DWORD *p_tide = v30;
      v36 = objc_msgSend_objectForKeyedSubscript_(v23, v31, @"Light", v32);
      if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v36, v33, v34, v35);
      int v38 = v37;

      p_tide[1] = v38;
      v44 = objc_msgSend_objectForKeyedSubscript_(v23, v39, @"Shadow", v40);
      if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v44, v41, v42, v43);
      int v46 = v45;

      p_tide[2] = v46;
      v52 = objc_msgSend_objectForKeyedSubscript_(v23, v47, @"BrightSat", v48);
      if (!v52 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v52, v49, v50, v51);
      int v54 = v53;

      p_tide[3] = v54;
      v60 = objc_msgSend_objectForKeyedSubscript_(v23, v55, @"Sat", v56);
      if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v60, v57, v58, v59);
      int v62 = v61;

      p_tide[4] = v62;
      v68 = objc_msgSend_objectForKeyedSubscript_(v23, v63, @"Exposure", v64);
      if (!v68 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v68, v65, v66, v67);
      int v70 = v69;

      p_tide[5] = v70;
      v76 = objc_msgSend_objectForKeyedSubscript_(v23, v71, @"Brightness", v72);
      if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v76, v73, v74, v75);
      int v78 = v77;

      p_tide[6] = v78;
      v84 = objc_msgSend_objectForKeyedSubscript_(v23, v79, @"Contrast", v80);
      if (!v84 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v84, v81, v82, v83);
      int v86 = v85;

      p_tide[7] = v86;
    }
    v87 = objc_msgSend_stringByDeletingLastPathComponent(v17, v20, v21, v22);

    v10 = objc_msgSend_stringByAppendingPathComponent_(v87, v88, @"Negative", v89);

    v91 = sub_263008090(v12, (const char *)@"Negative", &v159, v90);
    v94 = v91;
    if (v91)
    {
      v98 = objc_msgSend_objectForKeyedSubscript_(v91, v92, @"Tide", v93);
      if (!v98 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v98, v95, v96, v97);
      float v100 = v99;

      bgTuning[v16].neg.tide = v100;
      v106 = objc_msgSend_objectForKeyedSubscript_(v94, v101, @"Light", v102);
      if (!v106 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v106, v103, v104, v105);
      float v108 = v107;

      bgTuning[v16].neg.light = v108;
      v114 = objc_msgSend_objectForKeyedSubscript_(v94, v109, @"Shadow", v110);
      if (!v114 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v114, v111, v112, v113);
      float v116 = v115;

      bgTuning[v16].neg.shadow = v116;
      v122 = objc_msgSend_objectForKeyedSubscript_(v94, v117, @"BrightSat", v118);
      if (!v122 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v122, v119, v120, v121);
      float v124 = v123;

      bgTuning[v16].neg.brightSat = v124;
      v130 = objc_msgSend_objectForKeyedSubscript_(v94, v125, @"Sat", v126);
      if (!v130 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v130, v127, v128, v129);
      float v132 = v131;

      bgTuning[v16].neg.sat = v132;
      v138 = objc_msgSend_objectForKeyedSubscript_(v94, v133, @"Exposure", v134);
      if (!v138 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v138, v135, v136, v137);
      float v140 = v139;

      bgTuning[v16].neg.exposure = v140;
      v146 = objc_msgSend_objectForKeyedSubscript_(v94, v141, @"Brightness", v142);
      if (!v146 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v146, v143, v144, v145);
      float v148 = v147;

      bgTuning[v16].neg.brightness = v148;
      v154 = objc_msgSend_objectForKeyedSubscript_(v94, v149, @"Contrast", v150);
      if (!v154 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v159 = 25;
      }
      objc_msgSend_floatValue(v154, v151, v152, v153);
      float v156 = v155;

      bgTuning[v16].neg.contrast = v156;
    }
    int v157 = v159;
  }
  else
  {
    int v157 = v159;
  }

  return v157;
}

- (int)readForegroundTuning:(id)a3
{
  id v4 = a3;
  int v85 = 0;
  v10 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"PersonMix", v6);
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v85 = 25;
  }
  objc_msgSend_floatValue(v10, v7, v8, v9);
  float v12 = v11;

  self->_fgTuning.personMix = v12;
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v4, v13, @"SkinMix", v14);
  if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v85 = 25;
  }
  objc_msgSend_floatValue(v18, v15, v16, v17);
  float v20 = v19;

  self->_fgTuning.skinMix = v20;
  uint64_t v23 = objc_msgSend_stringByAppendingPathComponent_(@"Foreground", v21, @"Warm", v22);
  uint64_t v25 = sub_263008090(v4, (const char *)@"Warm", &v85, v24);
  int v29 = v25;
  if (v25)
  {
    v33 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"FaceI", v28);
    if (!v33 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v85 = 25;
    }
    objc_msgSend_floatValue(v33, v30, v31, v32);
    float v35 = v34;

    self->_fgTuning.warm.faceI = v35;
    v41 = objc_msgSend_objectForKeyedSubscript_(v29, v36, @"FaceQ", v37);
    if (!v41 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v85 = 25;
    }
    objc_msgSend_floatValue(v41, v38, v39, v40);
    float v43 = v42;

    self->_fgTuning.warm.faceQ = v43;
    v49 = objc_msgSend_objectForKeyedSubscript_(v29, v44, @"UnderTone", v45);
    if (!v49 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v85 = 25;
    }
    objc_msgSend_floatValue(v49, v46, v47, v48);
    float v51 = v50;

    self->_fgTuning.warm.underTone = v51;
  }
  v52 = objc_msgSend_stringByDeletingLastPathComponent(v23, v26, v27, v28);

  v55 = objc_msgSend_stringByAppendingPathComponent_(v52, v53, @"Cool", v54);

  v57 = sub_263008090(v4, (const char *)@"Cool", &v85, v56);
  v60 = v57;
  if (v57)
  {
    uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v57, v58, @"FaceI", v59);
    if (!v64 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v85 = 25;
    }
    objc_msgSend_floatValue(v64, v61, v62, v63);
    float v66 = v65;

    self->_fgTuning.cool.faceI = v66;
    uint64_t v72 = objc_msgSend_objectForKeyedSubscript_(v60, v67, @"FaceQ", v68);
    if (!v72 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v85 = 25;
    }
    objc_msgSend_floatValue(v72, v69, v70, v71);
    float v74 = v73;

    self->_fgTuning.cool.faceQ = v74;
    uint64_t v80 = objc_msgSend_objectForKeyedSubscript_(v60, v75, @"UnderTone", v76);
    if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v85 = 25;
    }
    objc_msgSend_floatValue(v80, v77, v78, v79);
    float v82 = v81;

    self->_fgTuning.cool.underTone = v82;
  }
  int v83 = v85;

  return v83;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"ToneBiasRemap", v6);
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_readToneBiasRemap_(self, v7, (uint64_t)v9, v8);
    }
  }
  v10 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"Background", v8);

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = 0;
    do
    {
      int BackgroundTuning_forSceneType = objc_msgSend_readBackgroundTuning_forSceneType_(self, v11, (uint64_t)v10, v12);
      if (BackgroundTuning_forSceneType)
      {
        int ForegroundTuning = BackgroundTuning_forSceneType;
        goto LABEL_13;
      }
      uint64_t v12 = (v12 + 1);
    }
    while (v12 != 4);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"Foreground", v14);

    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int ForegroundTuning = objc_msgSend_readForegroundTuning_(self, v16, v15, v17);
      }
      else {
        int ForegroundTuning = 25;
      }
      v10 = (void *)v15;
    }
    else
    {
      v10 = 0;
      int ForegroundTuning = 25;
    }
  }
  else
  {
    int ForegroundTuning = 25;
LABEL_13:
    FigDebugAssert3();
  }

  return ForegroundTuning;
}

@end