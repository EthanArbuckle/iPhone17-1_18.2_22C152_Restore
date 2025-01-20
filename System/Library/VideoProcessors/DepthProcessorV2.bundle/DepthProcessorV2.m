void *sub_262E9463C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *result;

  result = sub_262E95B3C(a1, a2, a3, a4, 11, a5);
  *result = &unk_270E21EB0;
  return result;
}

void sub_262E9467C(uint64_t a1)
{
  sub_262E95BB4(a1);

  JUMPOUT(0x263E61D10);
}

void sub_262E946B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8)
{
  if ((a6 & 3) != 0) {
    sub_262EB431C();
  }
  if (a7 < a8)
  {
    uint64_t v8 = 0;
    unint64_t v9 = a6 >> 2;
    unint64_t v10 = (a4 - 11) / 0xC;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    uint64_t v11 = v9 * (3 * a7 + 2);
    uint64_t v12 = a3 + 4 * v11 + 24;
    uint64_t v13 = a2 + 4 * v11 + 44;
    unint64_t v14 = v9 + v9 * 3 * a7;
    uint64_t v15 = a3 + 4 * v14 + 24;
    uint64_t v16 = a2 + 4 * v14 + 44;
    uint64_t v17 = 12 * v9 * a7;
    uint64_t v18 = v17 + a3 + 24;
    uint64_t v19 = v17 + a2 + 44;
    do
    {
      uint64_t v20 = 3 * a7 * v9;
      v21 = (float *)(a2 + 4 * v20);
      v22 = (float *)(a3 + 4 * v20);
      unint64_t v23 = v9 + v20;
      v24 = (float *)(a2 + 4 * v23);
      v25 = (float *)(a3 + 4 * v23);
      uint64_t v26 = (3 * a7 + 2) * v9;
      v27 = (float *)(a2 + 4 * v26);
      v28 = (float *)(a3 + 4 * v26);
      float v29 = *v21;
      float v30 = v21[6];
      float v31 = v21[7];
      float v32 = v21[8];
      float v33 = v21[9];
      float v34 = v21[10];
      float v35 = *v24;
      float v36 = v24[1];
      float v37 = v24[3];
      float v38 = v24[4];
      float v39 = v24[5];
      float v40 = v24[6];
      float v41 = v24[7];
      float v42 = v24[8];
      float v43 = v24[9];
      float v44 = v24[10];
      float v45 = *v27;
      float v46 = v27[1];
      float v47 = v27[2];
      float v48 = v27[3];
      float v50 = v27[4];
      float v49 = v27[5];
      float v51 = v27[6];
      float v52 = v27[7];
      float v178 = v21[2];
      float v179 = v21[1];
      float v176 = v21[4];
      float v177 = v21[3];
      float v174 = v24[2];
      float v175 = v21[5];
      float v53 = (float)((float)((float)((float)((float)(*v21 + v179) + v178) + v177) + v176) + v175) + 0.0;
      float v55 = v27[8];
      float v54 = v27[9];
      float v56 = v27[10];
      float *v22 = v53;
      float v173 = v36;
      float v57 = v48;
      float v58 = v54;
      float v59 = v52;
      float v60 = v56;
      float v61 = v50;
      float v62 = v51;
      float v63 = (float)((float)((float)((float)((float)(v35 + v36) + v174) + v37) + v38) + v39) + 0.0;
      float *v25 = v63;
      float v64 = (float)((float)((float)((float)((float)(v45 + v46) + v47) + v57) + v61) + v49) + 0.0;
      float *v28 = v64;
      float v65 = v30 + v53;
      v22[1] = v65;
      float v66 = v40 + v63;
      v25[1] = v66;
      float v67 = v51 + v64;
      v28[1] = v67;
      float v68 = v31 + v65;
      v22[2] = v68;
      float v69 = v41 + v66;
      v25[2] = v69;
      float v70 = v59 + v67;
      v28[2] = v70;
      float v71 = v32 + v68;
      v22[3] = v71;
      float v72 = v42 + v69;
      v25[3] = v72;
      float v73 = v55 + v70;
      v28[3] = v73;
      float v74 = v33 + v71;
      v22[4] = v74;
      float v75 = v43 + v72;
      v25[4] = v75;
      float v76 = v58 + v73;
      v28[4] = v58 + v73;
      float v77 = v34 + v74;
      v22[5] = v34 + v74;
      float v78 = v44 + v75;
      v25[5] = v44 + v75;
      float v79 = v60 + v76;
      v28[5] = v60 + v76;
      if (a4 - 11 >= 0xC)
      {
        uint64_t v86 = v8;
        unint64_t v87 = v10;
        float v184 = v59;
        float v185 = v61;
        float v182 = v49;
        float v183 = v43;
        float v181 = v62;
        float v89 = v178;
        float v88 = v179;
        float v90 = v60;
        float v91 = v58;
        float v93 = v176;
        float v92 = v177;
        float v94 = v55;
        float v96 = v174;
        float v95 = v175;
        float v97 = v173;
        do
        {
          float v98 = v79 - v45;
          v99 = (float *)(v18 + v86);
          float v180 = *(float *)(v19 + v86);
          float v100 = (float)(v77 - v29) + v180;
          float v101 = *(float *)(v16 + v86);
          float v102 = *(float *)(v13 + v86);
          float *v99 = v100;
          float v103 = v100 - v88;
          v104 = (float *)(v15 + v86);
          float v105 = (float)(v78 - v35) + v101;
          float *v104 = v105;
          float v106 = v105 - v97;
          v107 = (float *)(v12 + v86);
          float *v107 = v98 + v102;
          float v108 = (float)(v98 + v102) - v46;
          float v109 = *(float *)(v19 + v86 + 4);
          float v110 = v103 + v109;
          float v35 = *(float *)(v16 + v86 + 4);
          float v45 = *(float *)(v13 + v86 + 4);
          v99[1] = v110;
          float v111 = v110 - v89;
          float v112 = v106 + v35;
          v104[1] = v112;
          float v113 = v112 - v96;
          v107[1] = v108 + v45;
          float v114 = (float)(v108 + v45) - v47;
          float v88 = *(float *)(v19 + v86 + 8);
          float v115 = v111 + v88;
          float v97 = *(float *)(v16 + v86 + 8);
          float v46 = *(float *)(v13 + v86 + 8);
          v99[2] = v115;
          float v116 = v115 - v92;
          float v117 = v113 + v97;
          v104[2] = v117;
          float v118 = v117 - v37;
          v107[2] = v114 + v46;
          float v119 = (float)(v114 + v46) - v57;
          float v89 = *(float *)(v19 + v86 + 12);
          float v120 = v116 + v89;
          float v96 = *(float *)(v16 + v86 + 12);
          float v47 = *(float *)(v13 + v86 + 12);
          v99[3] = v120;
          float v121 = v120 - v93;
          float v122 = v118 + v96;
          v104[3] = v122;
          float v123 = v122 - v38;
          v107[3] = v119 + v47;
          float v124 = (float)(v119 + v47) - v185;
          float v92 = *(float *)(v19 + v86 + 16);
          float v125 = v121 + v92;
          float v37 = *(float *)(v16 + v86 + 16);
          float v57 = *(float *)(v13 + v86 + 16);
          v99[4] = v125;
          float v126 = v125 - v95;
          float v127 = v123 + v37;
          v104[4] = v127;
          float v128 = v127 - v39;
          v107[4] = v124 + v57;
          float v129 = (float)(v124 + v57) - v182;
          float v93 = *(float *)(v19 + v86 + 20);
          float v130 = v126 + v93;
          float v38 = *(float *)(v16 + v86 + 20);
          float v131 = *(float *)(v13 + v86 + 20);
          v99[5] = v130;
          float v132 = v130 - v30;
          v104[5] = v128 + v38;
          float v133 = (float)(v128 + v38) - v40;
          float v185 = v131;
          float v134 = v129 + v131;
          float v29 = v109;
          v107[5] = v134;
          float v135 = v134 - v181;
          float v95 = *(float *)(v19 + v86 + 24);
          float v136 = v132 + v95;
          float v39 = *(float *)(v16 + v86 + 24);
          float v137 = *(float *)(v13 + v86 + 24);
          v99[6] = v136;
          float v138 = v136 - v31;
          float v139 = v133 + v39;
          v104[6] = v139;
          float v140 = v139 - v41;
          float v182 = v137;
          v107[6] = v135 + v137;
          float v141 = (float)(v135 + v137) - v184;
          float v30 = *(float *)(v19 + v86 + 28);
          float v142 = v138 + v30;
          float v40 = *(float *)(v16 + v86 + 28);
          float v143 = *(float *)(v13 + v86 + 28);
          v99[7] = v142;
          float v144 = v142 - v32;
          float v145 = v140 + v40;
          v104[7] = v145;
          float v146 = v145 - v42;
          float v181 = v143;
          v107[7] = v141 + v143;
          float v147 = (float)(v141 + v143) - v94;
          float v31 = *(float *)(v19 + v86 + 32);
          float v148 = v144 + v31;
          float v41 = *(float *)(v16 + v86 + 32);
          float v149 = *(float *)(v13 + v86 + 32);
          v99[8] = v148;
          float v150 = v148 - v33;
          float v151 = v146 + v41;
          v104[8] = v151;
          float v152 = v151 - v183;
          float v184 = v149;
          v107[8] = v147 + v149;
          float v153 = (float)(v147 + v149) - v91;
          float v32 = *(float *)(v19 + v86 + 36);
          float v154 = v150 + v32;
          float v42 = *(float *)(v16 + v86 + 36);
          float v94 = *(float *)(v13 + v86 + 36);
          v99[9] = v154;
          float v155 = v154 - v34;
          float v156 = v152 + v42;
          v104[9] = v156;
          float v157 = v156 - v44;
          v107[9] = v153 + v94;
          float v158 = (float)(v153 + v94) - v90;
          float v33 = *(float *)(v19 + v86 + 40);
          float v159 = v155 + v33;
          float v160 = *(float *)(v16 + v86 + 40);
          float v91 = *(float *)(v13 + v86 + 40);
          v99[10] = v159;
          float v161 = v159 - v180;
          float v183 = v160;
          v104[10] = v157 + v160;
          float v162 = (float)(v157 + v160) - v101;
          v107[10] = v158 + v91;
          float v163 = (float)(v158 + v91) - v102;
          float v34 = *(float *)(v19 + v86 + 44);
          float v77 = v161 + v34;
          float v44 = *(float *)(v16 + v86 + 44);
          float v78 = v162 + v44;
          float v90 = *(float *)(v13 + v86 + 44);
          float v79 = v163 + v90;
          v99[11] = v77;
          v104[11] = v162 + v44;
          v107[11] = v79;
          v86 += 48;
          --v87;
        }
        while (v87);
        v85 = (float *)(v12 + v86);
        v82 = (float *)(v13 + v86);
        v84 = (float *)(v15 + v86);
        v81 = (float *)(v16 + v86);
        v83 = (float *)(v18 + v86);
        v80 = (float *)(v19 + v86);
      }
      else
      {
        v80 = v21 + 11;
        v81 = v24 + 11;
        v82 = v27 + 11;
        v83 = v22 + 6;
        v84 = v25 + 6;
        v85 = v28 + 6;
      }
      v164 = v80 - 11;
      v165 = v81 - 11;
      v166 = v82 - 11;
      if (12 * ((a4 - 11) / 0xC) + 6 < a4 - 5)
      {
        uint64_t v167 = 0;
        unint64_t v168 = (a4 - 11) % 0xC;
        do
        {
          float v77 = (float)(v77 - v164[v167]) + v164[v167 + 11];
          float v78 = (float)(v78 - v165[v167]) + v165[v167 + 11];
          float v79 = (float)(v79 - v166[v167]) + v166[v167 + 11];
          v83[v167] = v77;
          v84[v167] = v78;
          v85[v167++] = v79;
          --v168;
        }
        while (v168);
        v166 = (float *)((char *)v166 + v167 * 4);
        v165 = (float *)((char *)v165 + v167 * 4);
        v164 = (float *)((char *)v164 + v167 * 4);
        v85 = (float *)((char *)v85 + v167 * 4);
        v84 = (float *)((char *)v84 + v167 * 4);
        v83 = (float *)((char *)v83 + v167 * 4);
      }
      unint64_t v169 = a4 - 5;
      if (a4 >= 5)
      {
        do
        {
          float v170 = *v164++;
          float v77 = v77 - v170;
          float v171 = *v165++;
          float v78 = v78 - v171;
          float v172 = *v166++;
          float v79 = v79 - v172;
          *v83++ = v77;
          *v84++ = v78;
          *v85++ = v79;
          ++v169;
        }
        while (v169 < a4);
      }
      ++a7;
      v8 += 12 * v9;
    }
    while (a7 != a8);
  }
}

double sub_262E94CFC@<D0>(unsigned int a1@<W0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 48) = xmmword_262EB9370;
  *(_OWORD *)(a3 + 64) = unk_262EB9380;
  *(_OWORD *)(a3 + 80) = xmmword_262EB9390;
  *(_OWORD *)(a3 + 96) = unk_262EB93A0;
  *(_OWORD *)(a3 + 16) = xmmword_262EB9350;
  *(_OWORD *)(a3 + 32) = unk_262EB9360;
  *(void *)(a3 + 112) = 0xA00000010;
  *(_OWORD *)(a3 + 120) = xmmword_262EB9330;
  *(_DWORD *)(a3 + 136) = 0;
  *(void *)(a3 + 140) = 0x4120000042C80000;
  *(_DWORD *)(a3 + 148) = 1040187392;
  *(void *)&double result = 0x800000008;
  *(_OWORD *)(a3 + 152) = xmmword_262EB9340;
  *(void *)(a3 + 168) = 0x1441800000;
  *(void *)(a3 + 176) = 0;
  *(_DWORD *)(a3 + 176) = 1062836634;
  return result;
}

uint64_t sub_262E94D80(void *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  id v7 = a1;
  uint64_t v8 = v7;
  if (!a2) {
    goto LABEL_68;
  }
  *(void *)a2 = a4;
  *(void *)(a2 + 8) = a3;
  if (!sub_262E953D8(v7))
  {
    a2 = 0;
LABEL_68:
    uint64_t v13 = 0;
    goto LABEL_65;
  }
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"DepthProcessorV2", v10, v11, v12);
  if (!sub_262E953D8(v13))
  {
    a2 = 0;
    goto LABEL_65;
  }
  objc_msgSend_objectForKeyedSubscript_(v13, v14, @"SuperPixelParameters", v15, v16, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!sub_262E953D8(v18))
  {
    id v23 = 0;
LABEL_57:
    id v36 = 0;
LABEL_58:
    float v42 = 0;
LABEL_59:
    float v53 = 0;
LABEL_60:
    float v64 = 0;
LABEL_61:

    a2 = 0;
    id v74 = v18;
    goto LABEL_62;
  }
  objc_msgSend_objectForKeyedSubscript_(v18, v19, @"BrightnessCorrection", v20, v21, v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!sub_262E953D8(v23)) {
    goto LABEL_57;
  }
  sub_262E95430(v23, (uint64_t)"h", (_DWORD *)(a2 + 20));
  if (!v24) {
    goto LABEL_57;
  }
  sub_262E95430(v23, (uint64_t)"k", (_DWORD *)(a2 + 24));
  if (!v25) {
    goto LABEL_57;
  }
  sub_262E95430(v23, (uint64_t)"thres", (_DWORD *)(a2 + 28));
  if (!v26) {
    goto LABEL_57;
  }
  if (!v23) {
    goto LABEL_57;
  }
  v27 = NSString;
  id v23 = v23;
  objc_msgSend_stringWithUTF8String_(v27, v28, (uint64_t)"doBrightnessCorrection", v29, v30, v31);
  LODWORD(v27) = FigCFDictionaryGetBooleanIfPresent();

  if (!v27) {
    goto LABEL_57;
  }
  *(_DWORD *)(a2 + 16) = 0;
  objc_msgSend_objectForKeyedSubscript_(v18, v32, @"SPGeneration", v33, v34, v35);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  if (!sub_262E953D8(v36)) {
    goto LABEL_58;
  }
  sub_262E95430(v36, (uint64_t)"slicSpatialBias", (_DWORD *)(a2 + 120));
  if (!v37
    || !sub_262E954C8(v36, (uint64_t)"slicSuperPixelSize", (_DWORD *)(a2 + 112))
    || !sub_262E954C8(v36, (uint64_t)"slicMaxIters", (_DWORD *)(a2 + 116)))
  {
    goto LABEL_58;
  }
  float v42 = objc_msgSend_objectForKeyedSubscript_(v18, v38, @"SPSimilarity", v39, v40, v41);
  if (!sub_262E953D8(v42)) {
    goto LABEL_59;
  }
  sub_262E95430(v42, (uint64_t)"colorSigma", (_DWORD *)(a2 + 32));
  if (!v43) {
    goto LABEL_59;
  }
  sub_262E95430(v42, (uint64_t)"minInstanceSegmentation", (_DWORD *)(a2 + 36));
  if (!v44) {
    goto LABEL_59;
  }
  sub_262E95430(v42, (uint64_t)"maxInstanceSegmentation", (_DWORD *)(a2 + 40));
  if (!v45) {
    goto LABEL_59;
  }
  sub_262E95430(v42, (uint64_t)"minInstanceLayerConfidence", (_DWORD *)(a2 + 44));
  if (!v46) {
    goto LABEL_59;
  }
  if (!sub_262E954C8(v42, (uint64_t)"maxNumberOfInstanceLayers", (_DWORD *)(a2 + 48))) {
    goto LABEL_59;
  }
  *(float *)&double v51 = sub_262E95430(v42, (uint64_t)"minPersonSegmentation", (_DWORD *)(a2 + 68));
  if (!v52) {
    goto LABEL_59;
  }
  float v53 = objc_msgSend_objectForKeyedSubscript_(v18, v47, @"SPSolver", v48, v49, v50, v51);
  if (!sub_262E953D8(v53)) {
    goto LABEL_60;
  }
  sub_262E95430(v53, (uint64_t)"initialLocalWeight", (_DWORD *)(a2 + 72));
  if (!v54) {
    goto LABEL_60;
  }
  sub_262E95430(v53, (uint64_t)"maxLocalWeightThres", (_DWORD *)(a2 + 76));
  if (!v55) {
    goto LABEL_60;
  }
  sub_262E95430(v53, (uint64_t)"fractionValidThreshold", (_DWORD *)(a2 + 80));
  if (!v56) {
    goto LABEL_60;
  }
  sub_262E95430(v53, (uint64_t)"lambda", (_DWORD *)(a2 + 84));
  if (!v57) {
    goto LABEL_60;
  }
  *(float *)&double v62 = sub_262E95430(v53, (uint64_t)"minDataTermWeight", (_DWORD *)(a2 + 88));
  if (!v63) {
    goto LABEL_60;
  }
  float v64 = objc_msgSend_objectForKeyedSubscript_(v18, v58, @"SPConfidence", v59, v60, v61, v62);
  if (!sub_262E953D8(v64)) {
    goto LABEL_61;
  }
  sub_262E95430(v64, (uint64_t)"sigmaColor", (_DWORD *)(a2 + 92));
  if (!v65) {
    goto LABEL_61;
  }
  sub_262E95430(v64, (uint64_t)"sigmaDepth", (_DWORD *)(a2 + 96));
  if (!v66) {
    goto LABEL_61;
  }
  sub_262E95430(v64, (uint64_t)"sigamPixelColorDiff", (_DWORD *)(a2 + 100));
  if (!v67) {
    goto LABEL_61;
  }
  sub_262E95430(v64, (uint64_t)"minConfVal", (_DWORD *)(a2 + 104));
  if (!v68) {
    goto LABEL_61;
  }
  sub_262E95430(v64, (uint64_t)"minBaseConfVal", (_DWORD *)(a2 + 108));
  if ((v69 & 1) == 0) {
    goto LABEL_61;
  }

  objc_msgSend_objectForKeyedSubscript_(v13, v70, @"SetFarDistanceParameters", v71, v72, v73);
  id v74 = (id)objc_claimAutoreleasedReturnValue();
  if (sub_262E953D8(v74))
  {
    sub_262E95430(v74, (uint64_t)"distanceTransformMaxDistance", (_DWORD *)(a2 + 124));
    if (v75)
    {
      sub_262E95430(v74, (uint64_t)"setFarDistanceFurthestDisparity", (_DWORD *)(a2 + 128));
      if (v76)
      {
        sub_262E95430(v74, (uint64_t)"setFarDistanceConfidence", (_DWORD *)(a2 + 132));
        if (v77)
        {
          sub_262E95430(v74, (uint64_t)"confidenceSeedValue", (_DWORD *)(a2 + 140));
          if (v78)
          {
            if (sub_262E954C8(v74, (uint64_t)"useBestInstanceForPersonSegmentation", (_DWORD *)(a2 + 136)))
            {

              objc_msgSend_objectForKeyedSubscript_(v13, v79, @"ConfidenceFalloffParameters", v80, v81, v82);
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              if (!sub_262E953D8(v23)
                || (sub_262E95430(v23, (uint64_t)"confidenceFallOffMaxDist", (_DWORD *)(a2 + 144)), !v83)
                || (sub_262E95430(v23, (uint64_t)"confidenceFallOffSigma", (_DWORD *)(a2 + 148)), !v84))
              {
                a2 = 0;
                id v96 = v23;
LABEL_63:
                float v95 = v74;

                id v74 = v96;
                goto LABEL_64;
              }

              objc_msgSend_objectForKeyedSubscript_(v13, v85, @"FBSParameters", v86, v87, v88);
              id v36 = (id)objc_claimAutoreleasedReturnValue();
              if (sub_262E953D8(v36)
                && sub_262E954C8(v36, (uint64_t)"bilateralSolverSigmaSpace", (_DWORD *)(a2 + 152))
                && sub_262E954C8(v36, (uint64_t)"bilateralSolverSigmaLumaRange", (_DWORD *)(a2 + 156))
                && sub_262E954C8(v36, (uint64_t)"bilateralSolverSigmaChromaRange", (_DWORD *)(a2 + 160))
                && (sub_262E95430(v36, (uint64_t)"bilateralSolverLambda", (_DWORD *)(a2 + 168)), v89)
                && sub_262E954C8(v36, (uint64_t)"bilateralSolverMaxHashTableSize", (_DWORD *)(a2 + 164))
                && sub_262E954C8(v36, (uint64_t)"bilateralSolverPCFGMaxIters", (_DWORD *)(a2 + 172)))
              {

                float v42 = objc_msgSend_objectForKeyedSubscript_(v13, v90, @"SceneClassification", v91, v92, v93);
                a2 = sub_262E953D8(v42)
                  && (sub_262E95430(v42, (uint64_t)"disparityQualityThreshold", (_DWORD *)(a2 + 176)), (v94 & 1) != 0);
              }
              else
              {
                a2 = 0;
                float v42 = v36;
              }
LABEL_62:
              id v96 = v23;

              id v23 = v36;
              goto LABEL_63;
            }
          }
        }
      }
    }
  }
  a2 = 0;
  float v95 = v74;
LABEL_64:

LABEL_65:
  return a2;
}

uint64_t sub_262E953D8(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

float sub_262E95430(void *a1, uint64_t a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
  {
    v5 = NSString;
    id v6 = a1;
    objc_msgSend_stringWithUTF8String_(v5, v7, a2, v8, v9, v10);
    int Float32IfPresent = FigCFDictionaryGetFloat32IfPresent();

    if (Float32IfPresent)
    {
      float result = 0.0;
      *a3 = 0;
    }
  }
  return result;
}

BOOL sub_262E954C8(void *a1, uint64_t a2, _DWORD *a3)
{
  BOOL result = 0;
  if (a1 && a2 && a3)
  {
    id v7 = NSString;
    id v8 = a1;
    objc_msgSend_stringWithUTF8String_(v7, v9, a2, v10, v11, v12);
    int Int32IfPresent = FigCFDictionaryGetInt32IfPresent();

    BOOL result = Int32IfPresent != 0;
    if (Int32IfPresent) {
      *a3 = 0;
    }
  }
  return result;
}

void sub_262E95560(uint64_t a1, __int16 a2, __int16 a3)
{
  *(_WORD *)a1 = a2;
  *(_WORD *)(a1 + 2) = a3;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  operator new[]();
}

void sub_262E955D0(_Unwind_Exception *exception_object)
{
  v3 = *(void **)(v1 + 16);
  if (v3)
  {
    *(void *)(v1 + 24) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_262E955F0(void *a1)
{
  uint64_t v2 = a1[1];
  if (v2)
  {
    MEMORY[0x263E61CF0](v2, 0x1000C8052888210);
    a1[1] = 0;
  }
  v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

unsigned __int16 *sub_262E95648(unsigned __int16 *result, float32x4_t *a2, int32x2_t a3)
{
  if (result[1] * *result)
  {
    unsigned int v3 = 0;
    float32x4_t v4 = (float32x4_t)vdupq_lane_s32(a3, 0);
    v5 = (int32x4_t *)*((void *)result + 1);
    do
    {
      float32x4_t v6 = *a2++;
      *v5++ = vceqq_f32(v6, v4);
      v3 += 4;
    }
    while (v3 < result[1] * *result);
  }
  return result;
}

void sub_262E9568C()
{
}

unsigned __int16 *sub_262E9585C(unsigned __int16 *result, float *a2, float a3)
{
  uint64_t v3 = result[1] * *result;
  if (v3)
  {
    float32x4_t v4 = (int *)*((void *)result + 1);
    do
    {
      float v5 = *a2++;
      int v6 = *v4;
      if (v5 >= a3) {
        int v6 = -1;
      }
      *v4++ = v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_262E95890(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_262E95898()
{
}

void *sub_262E958B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_262E95978();
  }
  return operator new(4 * a2);
}

void sub_262E958E8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_262E95944(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655BF268, MEMORY[0x263F8C060]);
}

void sub_262E95930(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_262E95944(std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_262E95978()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

double sub_262E959AC()
{
  qword_26B425800 = 0;
  qword_26B425808 = 0;
  qword_26B425810 = 0;
  v0 = operator new(0x24uLL);
  qword_26B425808 = (uint64_t)v0 + 36;
  qword_26B425810 = (uint64_t)v0 + 36;
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  _OWORD *v0 = v1;
  v0[1] = v1;
  *((_DWORD *)v0 + 8) = -1;
  qword_26B425800 = (uint64_t)v0;
  word_26B425818 = 771;
  qword_26B425670 = 0;
  unk_26B425678 = 0;
  qword_26B425668 = 0;
  uint64_t v2 = operator new(0x24uLL);
  qword_26B425670 = (uint64_t)(v2 + 9);
  unk_26B425678 = v2 + 9;
  v2[8] = 0;
  *(_OWORD *)uint64_t v2 = xmmword_262EB93B0;
  *((_OWORD *)v2 + 1) = unk_262EB93C0;
  qword_26B425668 = (uint64_t)v2;
  word_26B425680 = 771;
  qword_26B425888 = 0;
  unk_26B425890 = 0;
  qword_26B425880 = 0;
  uint64_t v3 = operator new(0x64uLL);
  qword_26B425888 = (uint64_t)v3 + 100;
  unk_26B425890 = (char *)v3 + 100;
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  _OWORD *v3 = v4;
  v3[1] = v4;
  v3[2] = v4;
  v3[3] = v4;
  v3[4] = v4;
  v3[5] = v4;
  *((_DWORD *)v3 + 24) = -1;
  qword_26B425880 = (uint64_t)v3;
  word_26B425898 = 1285;
  qword_26B4256F0 = 0;
  unk_26B4256F8 = 0;
  qword_26B4256E8 = 0;
  float v5 = operator new(0x64uLL);
  qword_26B4256F0 = (uint64_t)(v5 + 25);
  unk_26B4256F8 = v5 + 25;
  v5[24] = 0;
  *((_OWORD *)v5 + 2) = xmmword_262EB93F4;
  *((_OWORD *)v5 + 3) = unk_262EB9404;
  *((_OWORD *)v5 + 4) = xmmword_262EB9414;
  *((_OWORD *)v5 + 5) = unk_262EB9424;
  *(_OWORD *)float v5 = xmmword_262EB93D4;
  *((_OWORD *)v5 + 1) = *(_OWORD *)algn_262EB93E4;
  qword_26B4256E8 = (uint64_t)v5;
  word_26B425700 = 1285;
  qword_26B425768 = 0;
  unk_26B425770 = 0;
  qword_26B425778 = 0;
  int v6 = operator new(0xC4uLL);
  qword_26B425778 = (uint64_t)(v6 + 49);
  v6[48] = 0;
  *((_OWORD *)v6 + 8) = xmmword_262EB94B8;
  *((_OWORD *)v6 + 9) = unk_262EB94C8;
  *((_OWORD *)v6 + 10) = xmmword_262EB94D8;
  *((_OWORD *)v6 + 11) = unk_262EB94E8;
  *((_OWORD *)v6 + 4) = xmmword_262EB9478;
  *((_OWORD *)v6 + 5) = unk_262EB9488;
  *((_OWORD *)v6 + 6) = xmmword_262EB9498;
  *((_OWORD *)v6 + 7) = unk_262EB94A8;
  *(_OWORD *)int v6 = xmmword_262EB9438;
  *((_OWORD *)v6 + 1) = unk_262EB9448;
  double result = NAN;
  *((_OWORD *)v6 + 2) = xmmword_262EB9458;
  *((_OWORD *)v6 + 3) = unk_262EB9468;
  qword_26B425768 = (uint64_t)v6;
  unk_26B425770 = v6 + 49;
  word_26B425780 = 1799;
  return result;
}

void *sub_262E95B3C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  *a1 = &unk_270E21F10;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = a4;
  a1[4] = a5;
  a1[5] = v11;
  a1[6] = dispatch_semaphore_create(0);
  return a1;
}

uint64_t sub_262E95BB4(uint64_t a1)
{
  return a1;
}

void sub_262E95BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8, uint64_t a9)
{
  unint64_t v9 = *(void *)(a1 + 32);
  if ((v9 & 1) == 0) {
    sub_262EB4348();
  }
  if (v9 >= a7) {
    sub_262EB43CC();
  }
  if (v9 >= a8) {
    sub_262EB43A0();
  }
  if (a8 <= 2) {
    sub_262EB4374();
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_262E95D88;
  v20[3] = &unk_2655BF2A0;
  v20[4] = a1;
  v20[5] = a8 / 3;
  v20[6] = a8 / 0xC;
  v20[7] = a8;
  v20[8] = a2;
  v20[9] = a4;
  v20[10] = a3;
  v20[11] = a5;
  v20[12] = a6;
  v20[13] = a7;
  v20[14] = a9;
  id v11 = (void *)MEMORY[0x263E62060](v20);
  uint64_t v12 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_262E96030;
  block[3] = &unk_2655BF2C8;
  uint64_t v19 = a1;
  id v13 = v11;
  id v18 = v13;
  dispatch_async(v12, block);
  uint64_t v14 = 0;
  char v15 = 1;
  do
  {
    char v16 = v15;
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v14);
    char v15 = 0;
    uint64_t v14 = 1;
  }
  while ((v16 & 1) != 0);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_262E95D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_262E95D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v8 = v5 + v7 * (a2 - 3);
  if (a2) {
    uint64_t v9 = v8 - v7;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 3 * v9;
  uint64_t v11 = 3 * v8;
  uint64_t v16 = 3 * v5;
  char v12 = 1;
  do
  {
    char v19 = v12;
    uint64_t v20 = 0;
    uint64_t v13 = *((void *)&v22 + v3);
    (*(void (**)(uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t *))(*(void *)v6 + 24))(v6, v13, *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 56), *(void *)(a1 + 112), v10, v11, &v20);
    (*(void (**)(uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t))(*(void *)v6 + 32))(v6, v13, *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 56), *(void *)(a1 + 112), v20, v10, v11);
    uint64_t v14 = *((void *)&v21 + v3);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, void, void, void, uint64_t, uint64_t))(*(void *)v6 + 40))(v6, *(void *)(a1 + 96), v14, *(void *)(a1 + 104), *(void *)(a1 + 56), *(void *)(a1 + 112), v9, v8);
    if (a2 == 3)
    {
      (*(void (**)(uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t *))(*(void *)v6 + 24))(v6, v13, *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 56), *(void *)(a1 + 112), v16, v17, &v20);
      (*(void (**)(uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t))(*(void *)v6 + 32))(v6, v13, *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 56), *(void *)(a1 + 112), v20, v16, v17);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, void, void, void, uint64_t, void))(*(void *)v6 + 48))(v6, *(void *)(a1 + 96), v14, *(void *)(a1 + 104), *(void *)(a1 + 56), *(void *)(a1 + 112), 3, *(void *)(a1 + 40));
    }
    char v12 = 0;
    uint64_t v3 = 1;
  }
  while ((v19 & 1) != 0);
  return result;
}

intptr_t sub_262E96030(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  for (uint64_t i = 2; i != 4; ++i)
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  long long v4 = *(NSObject **)(v2 + 48);

  return dispatch_semaphore_signal(v4);
}

float32x4_t *sub_262E96094(float32x4_t *result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void *a9)
{
  if (a8 > a5) {
    sub_262EB43F8();
  }
  unint64_t v9 = result[2].u64[0];
  if (v9 >= a5) {
    sub_262EB447C();
  }
  if (v9 >= a4) {
    sub_262EB4450();
  }
  if ((a6 & 3) != 0) {
    sub_262EB4424();
  }
  unint64_t v10 = (unint64_t)(double)(a4 / 0xC);
  *a9 = 12 * v10;
  if (a7 != a8)
  {
    unint64_t v11 = v9 >> 1;
    unint64_t v12 = a6 >> 2;
    unint64_t v13 = a7 + 1;
    unint64_t v14 = a7 + 1 + (v9 >> 1);
    if (v14 >= a5) {
      unint64_t v15 = a5;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v16 = 4 * v12;
    if (v10)
    {
      uint64_t v17 = 0;
      uint64_t v18 = (a7 - v11) & ~(((int)a7 - (int)v11) >> 31);
      uint64_t v19 = v12 * v18;
      unint64_t v20 = v18 + 1;
      uint64_t result = (float32x4_t *)(~v18 + v15);
      long long v21 = (float32x4_t *)(a2 + 4 * v12 * v20);
      do
      {
        long long v22 = (float32x4_t *)(a2 + 4 * (v19 + 12 * v17));
        float32x4_t v23 = *v22;
        float32x4_t v24 = v22[1];
        float32x4_t v25 = v22[2];
        int v26 = v21;
        v27 = result;
        if (v20 < v15)
        {
          do
          {
            float32x4_t v28 = *v26;
            float32x4_t v29 = v26[1];
            float32x4_t v30 = v26[2];
            int v26 = (float32x4_t *)((char *)v26 + v16);
            float32x4_t v23 = vaddq_f32(v23, v28);
            float32x4_t v24 = vaddq_f32(v24, v29);
            float32x4_t v25 = vaddq_f32(v25, v30);
            v27 = (float32x4_t *)((char *)v27 - 1);
          }
          while (v27);
        }
        uint64_t v31 = (float32x4_t *)(a3 + 4 * (12 * v17 + v12 * a7));
        *uint64_t v31 = v23;
        v31[1] = v24;
        v31[2] = v25;
        ++v17;
        v21 += 3;
      }
      while (v17 != v10);
    }
    if (v11 + 1 < a8) {
      unint64_t v32 = v11 + 1;
    }
    else {
      unint64_t v32 = a8;
    }
    if (v13 < v32)
    {
      uint64_t v33 = (float32x4_t *)(a3 + 4 * v12 * v13);
      uint64_t v34 = (float32x4_t *)(a2 + 4 * (v12 + v12 * (a7 + v11)));
      uint64_t v35 = (float32x4_t *)(a3 + 4 * a7 * v12);
      uint64_t v36 = a7 + 1;
      do
      {
        uint64_t result = v35;
        int v37 = v34;
        float v38 = v33;
        for (unint64_t i = v10; i; --i)
        {
          float32x4_t v40 = *result;
          float32x4_t v41 = result[1];
          float32x4_t v42 = result[2];
          result += 3;
          float32x4_t v43 = *v37;
          float32x4_t v44 = v37[1];
          float32x4_t v45 = v37[2];
          v37 += 3;
          *float v38 = vaddq_f32(v40, v43);
          v38[1] = vaddq_f32(v41, v44);
          v38[2] = vaddq_f32(v42, v45);
          v38 += 3;
        }
        ++v36;
        uint64_t v33 = (float32x4_t *)((char *)v33 + v16);
        uint64_t v34 = (float32x4_t *)((char *)v34 + v16);
        uint64_t v35 = (float32x4_t *)((char *)v35 + v16);
      }
      while (v36 != v32);
    }
    if (v13 > v32) {
      unint64_t v32 = v13;
    }
    unint64_t v46 = a5 - v11;
    if (a5 - v11 >= a8) {
      unint64_t v46 = a8;
    }
    if (v32 < v46)
    {
      float v47 = (float32x4_t *)(a3 + 4 * v32 * v12);
      uint64_t v48 = (float32x4_t *)(a2 + 4 * v12 * (v32 + v11));
      uint64_t v49 = (float32x4_t *)(a2 + 4 * v12 * (v32 - 1 - v11));
      uint64_t result = (float32x4_t *)(a3 + 4 * v12 * (v32 - 1));
      do
      {
        uint64_t v50 = result;
        double v51 = v49;
        int v52 = v48;
        float v53 = v47;
        for (unint64_t j = v10; j; --j)
        {
          float32x4_t v55 = *v50;
          float32x4_t v56 = v50[1];
          float32x4_t v57 = v50[2];
          v50 += 3;
          float32x4_t v58 = *v51;
          float32x4_t v59 = v51[1];
          float32x4_t v60 = v51[2];
          v51 += 3;
          float32x4_t v61 = *v52;
          float32x4_t v62 = v52[1];
          float32x4_t v63 = v52[2];
          v52 += 3;
          *float v53 = vaddq_f32(vsubq_f32(v55, v58), v61);
          v53[1] = vaddq_f32(vsubq_f32(v56, v59), v62);
          v53[2] = vaddq_f32(vsubq_f32(v57, v60), v63);
          v53 += 3;
        }
        ++v32;
        float v47 = (float32x4_t *)((char *)v47 + v16);
        uint64_t v48 = (float32x4_t *)((char *)v48 + v16);
        uint64_t v49 = (float32x4_t *)((char *)v49 + v16);
        uint64_t result = (float32x4_t *)((char *)result + v16);
      }
      while (v32 != v46);
    }
    if (v13 <= v46) {
      unint64_t v13 = v46;
    }
    if (a8 >= a5) {
      unint64_t v64 = a5;
    }
    else {
      unint64_t v64 = a8;
    }
    if (v13 < v64)
    {
      int v65 = (float32x4_t *)(a3 + 4 * v13 * v12);
      int v66 = (float32x4_t *)(a2 + 4 * v12 * (v13 - 1 - v11));
      int v67 = (float32x4_t *)(a3 + 4 * v12 * (v13 - 1));
      do
      {
        int v68 = v67;
        char v69 = v66;
        float v70 = v65;
        uint64_t result = (float32x4_t *)v10;
        if (v10)
        {
          do
          {
            float32x4_t v71 = *v68;
            float32x4_t v72 = v68[1];
            float32x4_t v73 = v68[2];
            v68 += 3;
            float32x4_t v74 = *v69;
            float32x4_t v75 = v69[1];
            float32x4_t v76 = v69[2];
            v69 += 3;
            *float v70 = vsubq_f32(v71, v74);
            v70[1] = vsubq_f32(v72, v75);
            v70[2] = vsubq_f32(v73, v76);
            v70 += 3;
            uint64_t result = (float32x4_t *)((char *)result - 1);
          }
          while (result);
        }
        ++v13;
        int v65 = (float32x4_t *)((char *)v65 + v16);
        int v66 = (float32x4_t *)((char *)v66 + v16);
        int v67 = (float32x4_t *)((char *)v67 + v16);
      }
      while (v13 != v64);
    }
  }
  return result;
}

unint64_t sub_262E96374(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  if ((a6 & 3) != 0) {
    sub_262EB4558();
  }
  if (a4 <= 4) {
    sub_262EB44A8();
  }
  unint64_t v9 = a9;
  if (a9 > a5) {
    sub_262EB44D4();
  }
  unint64_t v10 = *(void *)(result + 32);
  if (v10 >= a5) {
    sub_262EB452C();
  }
  if (v10 >= a4) {
    sub_262EB4500();
  }
  if (a8 != a9)
  {
    unint64_t v11 = v10 >> 1;
    unint64_t v12 = a6 >> 2;
    unint64_t v13 = vcvts_n_u32_f32(ceilf((float)(a4 - a7) * 0.25), 2uLL);
    unint64_t v14 = a4 - v13;
    unint64_t v15 = a8 + 1;
    if (a8 + 1 + v11 >= a5) {
      unint64_t v16 = a5;
    }
    else {
      unint64_t v16 = a8 + 1 + v11;
    }
    uint64_t v17 = 4 * v12;
    if (v14 < a4)
    {
      uint64_t v18 = (a8 - v11) & ~(((int)a8 - (int)v11) >> 31);
      uint64_t v19 = v12 * v18;
      unint64_t v20 = v18 + 1;
      uint64_t result = v12 * a8;
      unint64_t v21 = ~v18 + v16;
      long long v22 = (float32x4_t *)(a2 + 4 * (a4 + v12 * v20 - v13));
      unint64_t v23 = a4 - v13;
      do
      {
        float32x4_t v24 = *(float32x4_t *)(a2 + 4 * (v23 + v19));
        float32x4_t v25 = v22;
        unint64_t v26 = v21;
        if (v20 < v16)
        {
          do
          {
            float32x4_t v24 = vaddq_f32(v24, *v25);
            float32x4_t v25 = (float32x4_t *)((char *)v25 + v17);
            --v26;
          }
          while (v26);
        }
        *(float32x4_t *)(a3 + 4 * (v23 + result)) = v24;
        v23 += 4;
        ++v22;
      }
      while (v23 < a4);
    }
    if (v11 + 1 < a9) {
      unint64_t v27 = v11 + 1;
    }
    else {
      unint64_t v27 = a9;
    }
    if (v15 < v27)
    {
      float32x4_t v28 = (float32x4_t *)(a3 + 4 * (a4 + v12 * v15 - v13));
      float32x4_t v29 = (float32x4_t *)(a2 + 4 * (a4 + v12 + v12 * (a8 + v11) - v13));
      uint64_t result = a3 + 4 * (a4 + a8 * v12 - v13);
      uint64_t v30 = a8 + 1;
      do
      {
        uint64_t v31 = (float32x4_t *)result;
        unint64_t v32 = v29;
        uint64_t v33 = v28;
        unint64_t v34 = a4 - v13;
        if (v14 < a4)
        {
          do
          {
            float32x4_t v35 = *v31++;
            float32x4_t v36 = v35;
            float32x4_t v37 = *v32++;
            *v33++ = vaddq_f32(v36, v37);
            v34 += 4;
          }
          while (v34 < a4);
        }
        ++v30;
        float32x4_t v28 = (float32x4_t *)((char *)v28 + v17);
        float32x4_t v29 = (float32x4_t *)((char *)v29 + v17);
        result += v17;
      }
      while (v30 != v27);
    }
    if (v15 > v27) {
      unint64_t v27 = v15;
    }
    unint64_t v38 = a5 - v11;
    if (a5 - v11 >= a9) {
      unint64_t v38 = a9;
    }
    if (v27 < v38)
    {
      uint64_t v39 = (float32x4_t *)(a3 + 4 * (a4 + v27 * v12 - v13));
      uint64_t result = a2 + 4 * (a4 + v12 * (v27 + v11) - v13);
      float32x4_t v40 = (float32x4_t *)(a2 + 4 * (a4 + v12 * (v27 - 1 - v11) - v13));
      float32x4_t v41 = (float32x4_t *)(a3 + 4 * (a4 + v12 * (v27 - 1) - v13));
      do
      {
        float32x4_t v42 = v41;
        float32x4_t v43 = v40;
        float32x4_t v44 = (float32x4_t *)result;
        float32x4_t v45 = v39;
        unint64_t v46 = a4 - v13;
        if (v14 < a4)
        {
          do
          {
            float32x4_t v47 = *v42++;
            float32x4_t v48 = v47;
            float32x4_t v49 = *v43++;
            float32x4_t v50 = v49;
            float32x4_t v51 = *v44++;
            *v45++ = vaddq_f32(vsubq_f32(v48, v50), v51);
            v46 += 4;
          }
          while (v46 < a4);
        }
        ++v27;
        uint64_t v39 = (float32x4_t *)((char *)v39 + v17);
        result += v17;
        float32x4_t v40 = (float32x4_t *)((char *)v40 + v17);
        float32x4_t v41 = (float32x4_t *)((char *)v41 + v17);
      }
      while (v27 != v38);
    }
    if (v15 <= v38) {
      unint64_t v15 = v38;
    }
    if (a9 >= a5) {
      unint64_t v9 = a5;
    }
    if (v15 < v9)
    {
      int v52 = (float32x4_t *)(a3 + 4 * (a4 + v15 * v12 - v13));
      float v53 = (float32x4_t *)(a2 + 4 * (a4 + v12 * (v15 - 1 - v11) - v13));
      int v54 = (float32x4_t *)(a3 + 4 * (a4 + v12 * (v15 - 1) - v13));
      do
      {
        float32x4_t v55 = v54;
        float32x4_t v56 = v53;
        float32x4_t v57 = v52;
        for (uint64_t result = v14; result < a4; result += 4)
        {
          float32x4_t v58 = *v55++;
          float32x4_t v59 = v58;
          float32x4_t v60 = *v56++;
          *v57++ = vsubq_f32(v59, v60);
        }
        ++v15;
        int v52 = (float32x4_t *)((char *)v52 + v17);
        float v53 = (float32x4_t *)((char *)v53 + v17);
        int v54 = (float32x4_t *)((char *)v54 + v17);
      }
      while (v15 != v9);
    }
  }
  return result;
}

uint64_t sub_262E96670(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a6 & 3) != 0) {
    sub_262EB45DC();
  }
  unint64_t v8 = *(void *)(result + 32);
  if (v8 >= a4) {
    sub_262EB45B0();
  }
  if (v8 >= a5) {
    sub_262EB4584();
  }
  uint64_t v9 = a8 * a7;
  if (a8 * a7 < a5)
  {
    unint64_t v10 = v8 >> 1;
    unint64_t v11 = a4 - (v8 >> 1);
    unint64_t v12 = v9 * (a6 >> 2);
    unint64_t v13 = (float *)(a2 + 4 * v12);
    uint64_t v14 = 4 * (a6 >> 2);
    if (v8 >> 1 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v8 >> 1;
    }
    uint64_t v16 = a3 + 4 * v12 + 4;
    uint64_t v17 = 4 * (v10 + v12) + 4;
    uint64_t result = a2 + v17;
    uint64_t v18 = a3 + v17;
    unint64_t v19 = a4 + v12;
    uint64_t v20 = a2 - 8 * v10 + 4 * v19 - 4;
    unint64_t v21 = (float *)(a3 + 4 * (v19 - v10));
    do
    {
      float v22 = 0.0;
      unint64_t v23 = v13;
      uint64_t v24 = (v8 >> 1) + 1;
      do
      {
        float v25 = *v23++;
        float v22 = v22 + v25;
        --v24;
      }
      while (v24);
      *(float *)(a3 + 4 * v9 * (a6 >> 2)) = v22;
      unint64_t v26 = (float *)result;
      unint64_t v27 = (float *)v16;
      uint64_t v28 = v15;
      if (v8 >= 2)
      {
        do
        {
          float v29 = *v26++;
          float v22 = v22 + v29;
          *v27++ = v22;
          --v28;
        }
        while (v28);
      }
      if ((v8 >> 1) + 1 < v11)
      {
        uint64_t v30 = 0;
        uint64_t v31 = (2 * v10) | 1;
        do
        {
          float v22 = (float)(v22 - v13[v30]) + v13[v31];
          *(float *)(v18 + v30 * 4) = v22;
          ++v31;
          ++v30;
        }
        while (a4 != v31);
      }
      unint64_t v32 = v21;
      uint64_t v33 = (float *)v20;
      unint64_t v34 = v8 >> 1;
      if (v11 < a4)
      {
        do
        {
          float v35 = *v33++;
          float v22 = v22 - v35;
          *v32++ = v22;
          --v34;
        }
        while (v34);
      }
      ++v9;
      unint64_t v13 = (float *)((char *)v13 + v14);
      v16 += v14;
      result += v14;
      v18 += v14;
      v20 += v14;
      unint64_t v21 = (float *)((char *)v21 + v14);
    }
    while (v9 != a5);
  }
  return result;
}

void sub_262E968CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)FigStreamingDepthProcessorCPU;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_262E968FC(void *a1)
{
}

void sub_262E96BF8(_Unwind_Exception *a1)
{
  MEMORY[0x263E61D10](v1, 0xA1C40BD48D6D6);
  _Unwind_Resume(a1);
}

void sub_262E9771C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_262E97B00(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_262E97954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_262E97B00(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_262E97B74()
{
  v0 = (void *)MEMORY[0x263E61F00]();
  qword_26B425828 = 0;
  unk_26B425830 = 0;
  qword_26B425820 = 0;
  uint64_t v1 = operator new(0x24uLL);
  qword_26B425828 = (uint64_t)v1 + 36;
  unk_26B425830 = (char *)v1 + 36;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *uint64_t v1 = v2;
  v1[1] = v2;
  *((_DWORD *)v1 + 8) = -1;
  qword_26B425820 = (uint64_t)v1;
  word_26B425838 = 771;
  qword_26B425690 = 0;
  unk_26B425698 = 0;
  qword_26B425688 = 0;
  uint64_t v3 = operator new(0x24uLL);
  qword_26B425690 = (uint64_t)(v3 + 9);
  unk_26B425698 = v3 + 9;
  v3[8] = 0;
  *(_OWORD *)uint64_t v3 = xmmword_262EB9558;
  *((_OWORD *)v3 + 1) = unk_262EB9568;
  qword_26B425688 = (uint64_t)v3;
  word_26B4256A0 = 771;
  qword_26B4258A8 = 0;
  unk_26B4258B0 = 0;
  qword_26B4258A0 = 0;
  long long v4 = operator new(0x64uLL);
  qword_26B4258A8 = (uint64_t)v4 + 100;
  unk_26B4258B0 = (char *)v4 + 100;
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  *long long v4 = v5;
  v4[1] = v5;
  v4[2] = v5;
  v4[3] = v5;
  v4[4] = v5;
  v4[5] = v5;
  *((_DWORD *)v4 + 24) = -1;
  qword_26B4258A0 = (uint64_t)v4;
  word_26B4258B8 = 1285;
  qword_26B425710 = 0;
  unk_26B425718 = 0;
  qword_26B425708 = 0;
  uint64_t v6 = operator new(0x64uLL);
  qword_26B425710 = (uint64_t)(v6 + 25);
  unk_26B425718 = v6 + 25;
  v6[24] = 0;
  *((_OWORD *)v6 + 2) = xmmword_262EB959C;
  *((_OWORD *)v6 + 3) = unk_262EB95AC;
  *((_OWORD *)v6 + 4) = xmmword_262EB95BC;
  *((_OWORD *)v6 + 5) = unk_262EB95CC;
  *(_OWORD *)uint64_t v6 = xmmword_262EB957C;
  *((_OWORD *)v6 + 1) = *(_OWORD *)algn_262EB958C;
  qword_26B425708 = (uint64_t)v6;
  word_26B425720 = 1285;
  qword_26B425788 = 0;
  unk_26B425790 = 0;
  qword_26B425798 = 0;
  uint64_t v7 = operator new(0xC4uLL);
  qword_26B425798 = (uint64_t)(v7 + 49);
  v7[48] = 0;
  *((_OWORD *)v7 + 8) = xmmword_262EB9660;
  *((_OWORD *)v7 + 9) = unk_262EB9670;
  *((_OWORD *)v7 + 10) = xmmword_262EB9680;
  *((_OWORD *)v7 + 11) = unk_262EB9690;
  *((_OWORD *)v7 + 4) = xmmword_262EB9620;
  *((_OWORD *)v7 + 5) = unk_262EB9630;
  *((_OWORD *)v7 + 6) = xmmword_262EB9640;
  *((_OWORD *)v7 + 7) = unk_262EB9650;
  *(_OWORD *)uint64_t v7 = xmmword_262EB95E0;
  *((_OWORD *)v7 + 1) = unk_262EB95F0;
  *((_OWORD *)v7 + 2) = xmmword_262EB9600;
  *((_OWORD *)v7 + 3) = unk_262EB9610;
  qword_26B425788 = (uint64_t)v7;
  unk_26B425790 = v7 + 49;
  word_26B4257A0 = 1799;
}

void sub_262E97D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  *(void *)a1 = &unk_270E21F80;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(void *)(a1 + 24) = a4;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 128) = 0;
  sub_262E97DE4(a1, v9);
}

void sub_262E97DBC(_Unwind_Exception *a1)
{
  uint64_t v5 = *(void *)(v2 + 128);
  *(void *)(v2 + 128) = 0;
  if (v5) {
    sub_262EB4608(v5);
  }
  sub_262E9806C(v3);

  _Unwind_Resume(a1);
}

void sub_262E97DE4(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = sub_262E981D0(a1);
  if (v3 != 3)
  {
    if (v3 != 5)
    {
      if (v3 == 11) {
        operator new();
      }
      __assert_rtn("initBoxFilterInstance", "SmpFilteringImpl.mm", 89, "false");
    }
    operator new();
  }
  operator new();
}

void sub_262E97F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x263E61D10](v10, 0x1081C40EAF677CBLL);

  _Unwind_Resume(a1);
}

void sub_262E97F70(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 24);
  if ((v1 & 3) == 0)
  {
    uint64_t v3 = 0;
    unint64_t v4 = v1 & 0xFFFFFFFFFFFFFFFCLL;
    memset(v5, 0, sizeof(v5));
    do
    {
      malloc_type_posix_memalign((void **)((char *)v5 + v3), 0x10uLL, v4 * *(void *)(a1 + 16), 0x100004052888210uLL);
      v3 += 8;
    }
    while (v3 != 48);
    sub_262E98290(a1 + 32, *(uint64_t *)&v5[0]);
  }
  sub_262EB462C();
}

void *sub_262E9806C(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[11];
  if (v2) {
    sub_262E97B00(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[9];
  if (v3) {
    sub_262E97B00(v3);
  }
  unint64_t v4 = (std::__shared_weak_count *)a1[7];
  if (v4) {
    sub_262E97B00(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[5];
  if (v5) {
    sub_262E97B00(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)a1[3];
  if (v6) {
    sub_262E97B00(v6);
  }
  uint64_t v7 = (std::__shared_weak_count *)a1[1];
  if (v7) {
    sub_262E97B00(v7);
  }
  return a1;
}

void *sub_262E980DC(void *a1)
{
  *a1 = &unk_270E21F80;
  uint64_t v2 = a1[16];
  a1[16] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[15];
  if (v3) {
    sub_262E97B00(v3);
  }
  unint64_t v4 = (std::__shared_weak_count *)a1[13];
  if (v4) {
    sub_262E97B00(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[11];
  if (v5) {
    sub_262E97B00(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)a1[9];
  if (v6) {
    sub_262E97B00(v6);
  }
  uint64_t v7 = (std::__shared_weak_count *)a1[7];
  if (v7) {
    sub_262E97B00(v7);
  }
  unint64_t v8 = (std::__shared_weak_count *)a1[5];
  if (v8) {
    sub_262E97B00(v8);
  }
  return a1;
}

void sub_262E98198(void *a1)
{
  sub_262E980DC(a1);

  JUMPOUT(0x263E61D10);
}

uint64_t sub_262E981D0(uint64_t a1)
{
  long long v6 = *(_OWORD *)(a1 + 8);
  uint64_t v2 = sub_262E98AD0((uint64_t)&unk_26B4257E8, (unint64_t *)&v6);
  if (v2 == (void *)&unk_26B4257F0)
  {
    int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 8), *(int8x16_t *)(a1 + 8), 8uLL);
    uint64_t v2 = sub_262E98AD0((uint64_t)&unk_26B4257E8, (unint64_t *)&v5);
    if (v2 == (void *)&unk_26B4257F0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = &unk_270E21FC8;
      __cxa_throw(exception, (struct type_info *)&unk_270E21F90, (void (*)(void *))std::exception::~exception);
    }
  }
  return v2[6];
}

void sub_262E98290(uint64_t a1, uint64_t a2)
{
  sub_262E98B5C(&v2, a2);
}

uint64_t sub_262E982D8@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, int8x16_t *a3@<X2>, void *a4@<X8>, double a5@<D0>, float a6@<S1>)
{
  uint64_t v10 = a3;
  if (!a3) {
    uint64_t v10 = *(int8x16_t **)(a1 + 112);
  }
  sub_262E983D0(a1, a2, *(int8x16_t **)(a1 + 32), *(int8x16_t **)(a1 + 48), a5);
  __n128 v11 = ((__n128 (*)(void))***(void ***)(a1 + 128))(*(void *)(a1 + 128));
  v11.n128_f32[0] = a6;
  uint64_t result = sub_262E984C0(a1, *(float32x4_t **)(a1 + 96), *(_OWORD **)(a1 + 80), *(_OWORD **)(a1 + 32), v10, v11.n128_f64[0]);
  if (a3)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 120);
    *a4 = *(void *)(a1 + 112);
    a4[1] = v13;
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    }
  }
  return result;
}

uint64_t sub_262E983D0(uint64_t result, _OWORD *a2, int8x16_t *a3, int8x16_t *a4, double a5)
{
  uint64_t v5 = *(void *)(result + 24);
  if ((v5 & 3) != 0) {
    sub_262EB4658();
  }
  unint64_t v6 = *(void *)(result + 16) * v5;
  uint64_t v7 = (_OWORD *)((char *)a2 + 4 * (v6 >> 2));
  unint64_t v8 = (_OWORD *)((char *)v7 - 4 * ((v6 >> 2) - 12 * (v6 / 0x30)));
  if (v8 != a2)
  {
    int32x4_t v9 = vdupq_lane_s32(*(int32x2_t *)&a5, 0);
    unint64_t v10 = 48 * (v6 / 0x30);
    __asm { FMOV            V2.4S, #1.0 }
    do
    {
      int32x4_t v15 = *(int32x4_t *)a2;
      int32x4_t v16 = *((int32x4_t *)a2 + 1);
      int32x4_t v17 = *((int32x4_t *)a2 + 2);
      a2 += 3;
      int8x16_t v18 = (int8x16_t)vceqq_s32(v15, v9);
      int8x16_t v19 = (int8x16_t)vceqq_s32(v16, v9);
      int8x16_t v20 = (int8x16_t)vceqq_s32(v17, v9);
      *a3 = vbicq_s8(_Q2, v18);
      a3[1] = vbicq_s8(_Q2, v19);
      a3[2] = vbicq_s8(_Q2, v20);
      a3 += 3;
      *a4 = vbicq_s8((int8x16_t)v15, v18);
      a4[1] = vbicq_s8((int8x16_t)v16, v19);
      a4[2] = vbicq_s8((int8x16_t)v17, v20);
      a4 += 3;
      v10 -= 48;
    }
    while (v10);
    a2 = v8;
  }
  for (; a2 != v7; a4 = (int8x16_t *)((char *)a4 + 4))
  {
    unsigned int v21 = *(_DWORD *)a2;
    a2 = (_OWORD *)((char *)a2 + 4);
    float v22 = (float)v21;
    _ZF = (float)v21 == *(float *)&a5;
    if ((float)v21 == *(float *)&a5) {
      float v24 = 0.0;
    }
    else {
      float v24 = 1.0;
    }
    *(float *)a3->i32 = v24;
    a3 = (int8x16_t *)((char *)a3 + 4);
    if (_ZF) {
      float v22 = 0.0;
    }
    *(float *)a4->i32 = v22;
  }
  return result;
}

uint64_t sub_262E984C0(uint64_t result, float32x4_t *a2, _OWORD *a3, _OWORD *a4, int8x16_t *a5, double a6)
{
  uint64_t v6 = *(void *)(result + 24);
  if ((v6 & 3) != 0) {
    sub_262EB4684();
  }
  uint64_t v7 = *(void *)(result + 16) * v6;
  unint64_t v8 = (float *)((char *)a2->f32 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
  int32x4_t v9 = (float *)((char *)v8 - (v7 & 0x1C));
  if (v9 == (float *)a2)
  {
    int32x4_t v9 = (float *)a2;
  }
  else
  {
    int8x16_t v10 = (int8x16_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0);
    do
    {
      float32x4_t v11 = *a2;
      float32x4_t v12 = a2[1];
      a2 += 2;
      float32x4_t v13 = *(float32x4_t *)a3;
      float32x4_t v14 = *((float32x4_t *)a3 + 1);
      a3 += 2;
      float32x4_t v15 = *(float32x4_t *)a4;
      float32x4_t v16 = *((float32x4_t *)a4 + 1);
      a4 += 2;
      *a5 = vbslq_s8((int8x16_t)vceqzq_f32(v15), v10, (int8x16_t)vdivq_f32(v11, v13));
      a5[1] = vbslq_s8((int8x16_t)vceqzq_f32(v16), v10, (int8x16_t)vdivq_f32(v12, v14));
      a5 += 2;
    }
    while (a2 != (float32x4_t *)v9);
  }
  while (v9 != v8)
  {
    float v17 = *(float *)&a6;
    if (*(float *)a4 != 0.0) {
      float v17 = *v9 / *(float *)a3;
    }
    *(float *)a5->i32 = v17;
    a5 = (int8x16_t *)((char *)a5 + 4);
    ++v9;
    a3 = (_OWORD *)((char *)a3 + 4);
    a4 = (_OWORD *)((char *)a4 + 4);
  }
  return result;
}

void sub_262E98578(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x263E61D10);
}

uint64_t sub_262E985B0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  unint64_t v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 24 * a3;
    do
    {
      sub_262E98634((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 3;
      v6 -= 24;
    }
    while (v6);
  }
  return a1;
}

void sub_262E9861C(_Unwind_Exception *a1)
{
  sub_262E98A7C(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *sub_262E98634(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v6 = (void **)sub_262E986C4(a1, a2, &v11, &v10, a3);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    unint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x38uLL);
    v7[2] = *(_OWORD *)a4;
    *((void *)v7 + 6) = *(void *)(a4 + 16);
    sub_262E98828(a1, v11, v8, (uint64_t *)v7);
  }
  return v7;
}

void *sub_262E986C4(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  if (a1 + 1 == a2) {
    goto LABEL_3;
  }
  unint64_t v5 = *a5;
  unint64_t v6 = a2[4];
  if (*a5 < v6) {
    goto LABEL_3;
  }
  if (v6 < v5)
  {
LABEL_9:
    uint64_t v10 = a2[1];
    if (v10)
    {
      uint64_t v11 = (void *)a2[1];
      do
      {
        a4 = v11;
        uint64_t v11 = (void *)*v11;
      }
      while (v11);
    }
    else
    {
      float v17 = a2;
      do
      {
        a4 = (void *)v17[2];
        BOOL v13 = *a4 == (void)v17;
        float v17 = a4;
      }
      while (!v13);
    }
    if (a4 != a1 + 1)
    {
      unint64_t v18 = a4[4];
      if (v5 >= v18 && (v18 < v5 || a5[1] >= a4[5])) {
        return sub_262E98880((uint64_t)a1, a3, a5);
      }
    }
    if (v10)
    {
      *a3 = a4;
    }
    else
    {
      *a3 = a2;
      return a2 + 1;
    }
    return a4;
  }
  unint64_t v15 = a5[1];
  unint64_t v16 = a2[5];
  if (v15 >= v16)
  {
    if (v16 >= v15)
    {
      *a3 = a2;
      *a4 = a2;
      return a4;
    }
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v7 = *a2;
  if ((void *)*a1 == a2)
  {
    int32x4_t v9 = a2;
  }
  else
  {
    if (v7)
    {
      unint64_t v8 = (void *)*a2;
      do
      {
        int32x4_t v9 = v8;
        unint64_t v8 = (void *)v8[1];
      }
      while (v8);
    }
    else
    {
      float32x4_t v12 = a2;
      do
      {
        int32x4_t v9 = (void *)v12[2];
        BOOL v13 = *v9 == (void)v12;
        float32x4_t v12 = v9;
      }
      while (v13);
    }
    unint64_t v14 = v9[4];
    if (v14 >= *a5 && (*a5 < v14 || v9[5] >= a5[1])) {
      return sub_262E98880((uint64_t)a1, a3, a5);
    }
  }
  if (v7)
  {
    *a3 = v9;
    return v9 + 1;
  }
  else
  {
    *a3 = a2;
    return a2;
  }
}

uint64_t *sub_262E98828(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_262E988E4(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *sub_262E98880(uint64_t a1, void *a2, unint64_t *a3)
{
  unint64_t v5 = *(void **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  unint64_t v4 = v5;
  if (v5)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    while (1)
    {
      while (1)
      {
        unint64_t v8 = v4;
        unint64_t v9 = v4[4];
        if (v6 >= v9) {
          break;
        }
LABEL_4:
        unint64_t v4 = (void *)*v8;
        uint64_t result = v8;
        if (!*v8) {
          goto LABEL_12;
        }
      }
      if (v9 >= v6)
      {
        unint64_t v10 = v8[5];
        if (v7 < v10) {
          goto LABEL_4;
        }
        if (v10 >= v7) {
          goto LABEL_12;
        }
      }
      uint64_t result = v8 + 1;
      unint64_t v4 = (void *)v8[1];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }
  unint64_t v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

uint64_t *sub_262E988E4(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      long long v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      unint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            long long v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *long long v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        long long v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *long long v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_262E98A7C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_262E98A7C(a1, *a2);
    sub_262E98A7C(a1, a2[1]);
    operator delete(a2);
  }
}

void *sub_262E98AD0(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void **)(a1 + 8);
  long long v2 = (void *)(a1 + 8);
  uint64_t v3 = v4;
  if (!v4) {
    return v2;
  }
  unint64_t v6 = *a2;
  unint64_t v5 = a2[1];
  uint64_t v7 = v2;
  do
  {
    unint64_t v8 = v3[4];
    if (v8 >= v6)
    {
      if (v6 >= v8)
      {
        if (v3[5] < v5) {
          ++v3;
        }
        else {
          uint64_t v7 = v3;
        }
      }
      else
      {
        uint64_t v7 = v3;
      }
    }
    else
    {
      ++v3;
    }
    uint64_t v3 = (void *)*v3;
  }
  while (v3);
  if (v7 == v2) {
    return v2;
  }
  unint64_t v9 = v7[4];
  if (v6 < v9 || v9 >= v6 && v5 < v7[5]) {
    return v2;
  }
  return v7;
}

void sub_262E98B5C(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_262E98BC4(void *a1)
{
  __cxa_begin_catch(a1);
  free(v1);
  __cxa_rethrow();
}

void sub_262E98BD8(_Unwind_Exception *a1)
{
}

void sub_262E98BF0(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E61D10);
}

void sub_262E98C28(uint64_t a1)
{
}

uint64_t sub_262E98C30(uint64_t a1, uint64_t a2)
{
  if (sub_262E98C74(a2, (uint64_t)&unk_270E22030)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

BOOL sub_262E98C74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void sub_262E98CC4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263E61F00]();
  v1[0] = xmmword_262EB96B0;
  v1[1] = xmmword_262EB96C0;
  v1[2] = xmmword_262EB96D0;
  v1[3] = xmmword_262EB96E0;
  v1[4] = xmmword_262EB96F0;
  v1[5] = xmmword_262EB9700;
  v1[6] = xmmword_262EB9710;
  v1[7] = xmmword_262EB9720;
  v1[8] = xmmword_262EB9730;
  v1[9] = xmmword_262EB9740;
  uint64_t v2 = 3;
  sub_262E985B0((uint64_t)&unk_26B4257E8, (unint64_t *)v1, 7);
}

double sub_262E98DAC(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(vmaxq_f32(vminq_f32(a1, (float32x4_t)vdupq_n_s32(0x42B00000u)), (float32x4_t)vdupq_n_s32(0xC2B00000)), (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu));
  int32x4_t v2 = vcvtnq_s32_f32(v1);
  float32x4_t v3 = vsubq_f32(v1, vcvtq_f32_s32(v2));
  int8x16_t v4 = (int8x16_t)vmulq_f32(vmulq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x41EE6BE6u), v3, vaddq_f32(v3, (float32x4_t)vdupq_n_s32(0xC014661E))), (float32x4_t)vdupq_n_s32(0x39218489u)), vmulq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x41854D69u), v3, vaddq_f32(v3, (float32x4_t)vdupq_n_s32(0x40852007u))), vmlaq_f32((float32x4_t)vdupq_n_s32(0x41512B26u), v3, vaddq_f32(v3, (float32x4_t)vdupq_n_s32(0x40DA1261u)))));
  *(void *)&double result = vorrq_s8((int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v4, (int8x16_t)vdupq_n_s32(0x7F800000u)), vshlq_n_s32(v2, 0x17uLL)), vandq_s8(v4, (int8x16_t)vdupq_n_s32(0x807FFFFF))).u64[0];
  return result;
}

void sub_262E98E80(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  *a1 = &unk_270E22050;
  a1[1] = 0;
  operator new();
}

void sub_262E98F48(_Unwind_Exception *a1, int a2)
{
  MEMORY[0x263E61D10](v4, 0x10A1C40B685923ELL);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x262E98F2CLL);
  }
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }

  _Unwind_Resume(a1);
}

void *sub_262E98FD0(void *a1)
{
  uint64_t v2 = a1[1];
  *a1 = &unk_270E22050;
  a1[1] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_262E9903C(void *a1)
{
  uint64_t v2 = a1[1];
  *a1 = &unk_270E22050;
  a1[1] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  JUMPOUT(0x263E61D10);
}

BOOL sub_262E990C8(uint64_t a1)
{
  return *(void *)(a1 + 8) == 0;
}

uint64_t sub_262E990D8@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, int8x16_t *a3@<X2>, void *a4@<X8>, double a5@<D0>, float a6@<S1>)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return sub_262E982D8(result, a2, a3, a4, a5, a6);
  }
  *a4 = 0;
  a4[1] = 0;
  return result;
}

uint64_t sub_262E995A4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E995D8(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E99988()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E999BC(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E99DC0()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E99DF4(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

char *sub_262E99F10(unsigned int a1)
{
  uint64_t v2 = (char *)malloc_type_malloc(16 * a1 + 24, 0x929B7C33uLL);
  uint64_t v3 = v2 + 24;
  *(void *)uint64_t v2 = v2 + 24;
  *((_DWORD *)v2 + 2) = a1;
  *((void *)v2 + 2) = 0;
  if (a1)
  {
    uint64_t v4 = a1;
    do
    {
      unsigned char *v3 = 0;
      v3 += 16;
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = malloc_type_malloc(0x1D4D8uLL, 0x770615B1uLL);
  void *v5 = v5 + 3;
  v5[1] = 5000;
  v5[2] = 0;
  *((void *)v2 + 2) = v5;
  return v2;
}

void sub_262E99FA0(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[2];
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)v2[2];
        free(v2);
        uint64_t v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

void sub_262E99FF4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)(v2 + 16);
  if (v3)
  {
    do
    {
      uint64_t v4 = (void *)v3[2];
      free(v3);
      uint64_t v3 = v4;
    }
    while (v4);
  }
  *(_DWORD *)(v2 + 12) = 0;
  *(void *)(v2 + 16) = 0;
  uint64_t v5 = *(void **)a1;
  size_t v6 = 16 * *(unsigned int *)(a1 + 8);

  bzero(v5, v6);
}

uint64_t sub_262E9A05C(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v3 = BYTE2(a2) | (BYTE2(a2) << 8);
  if (!*(unsigned char *)(*(void *)a1
                 + 16
                 * ((257 * (16974593 * a2 + BYTE3(a2) + 66049 * BYTE1(a2) + v3) + BYTE4(a2) + 842144005)
                  % *(_DWORD *)(a1 + 8))))
    return 0;
  uint64_t v4 = *(void *)(*(void *)a1
                 + 16
                 * ((257 * (16974593 * a2 + BYTE3(a2) + 66049 * BYTE1(a2) + v3) + BYTE4(a2) + 842144005)
                  % *(_DWORD *)(a1 + 8))
                 + 8);
  if (!v4) {
    return 0;
  }
  while (*(void *)v4 != a2)
  {
    uint64_t v4 = *(void *)(v4 + 16);
    if (!v4) {
      return 0;
    }
  }
  *a3 = *(_DWORD *)(v4 + 8);
  return 1;
}

char *sub_262E9A0F8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = (257 * (16974593 * a2 + BYTE3(a2) + 66049 * BYTE1(a2) + (BYTE2(a2) | (BYTE2(a2) << 8)))
      + BYTE4(a2)
      + 842144005)
     % *(_DWORD *)(a1 + 8);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = (unsigned char *)(*(void *)a1 + 16 * v5);
  int v8 = *v7;
  uint64_t result = sub_262E9A1C0(a1);
  if (v8)
  {
    *((void *)result + 2) = *(void *)(v6 + 16 * v5 + 8);
  }
  else
  {
    *((void *)result + 2) = 0;
    *uint64_t v7 = 1;
  }
  *(void *)uint64_t result = a2;
  *((_DWORD *)result + 2) = a3;
  *(void *)(v6 + 16 * v5 + 8) = result;
  return result;
}

char *sub_262E9A1C0(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 16);
  unsigned int v3 = v2[3];
  if (v3 == v2[2])
  {
    uint64_t v2 = malloc_type_malloc(24 * v3 + 24, 0x770615B1uLL);
    uint64_t v4 = (char *)(v2 + 6);
    *(void *)uint64_t v2 = v2 + 6;
    v2[2] = v3;
    v2[3] = 0;
    *((void *)v2 + 2) = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v2;
    unsigned int v3 = 0;
  }
  else
  {
    uint64_t v4 = *(char **)v2;
  }
  v2[3] = v3 + 1;
  return &v4[24 * v3];
}

__CVBuffer *sub_262E9A23C(__CVBuffer *result, CVPixelBufferLockFlags a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (CVPixelBufferLockBaseAddress(result, a2) || (uint64_t result = (__CVBuffer *)CVPixelBufferGetBaseAddress(v2)) == 0)
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

BOOL sub_262E9A324(__CVBuffer *a1, uint64_t a2, uint64_t a3)
{
  return CVPixelBufferGetWidth(a1) == a2 && CVPixelBufferGetHeight(a1) == a3;
}

BOOL sub_262E9A378(__CVBuffer *a1, int a2)
{
  return CVPixelBufferGetPixelFormatType(a1) == a2;
}

void sub_262E9A3A4(uint64_t a1, int a2, int a3, int a4, float a5, float a6, float a7, float a8, float a9)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_DWORD *)(a1 + 8) = a4;
  *(float *)(a1 + 12) = a5;
  *(float *)(a1 + 16) = a6;
  *(float *)(a1 + 20) = a7;
  *(float *)(a1 + 24) = a8;
  *(float *)(a1 + 28) = a9;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  operator new[]();
}

void *sub_262E9A4C8(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    MEMORY[0x263E61CF0](v2, 0x1000C8052888210);
    a1[5] = 0;
  }
  uint64_t v3 = a1[4];
  if (v3)
  {
    MEMORY[0x263E61CF0](v3, 0x1000C8052888210);
    a1[4] = 0;
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    MEMORY[0x263E61CF0](v4, 0x1000C8052888210);
    a1[6] = 0;
  }
  uint64_t v5 = a1[7];
  if (v5)
  {
    MEMORY[0x263E61CF0](v5, 0x1000C8052888210);
    a1[7] = 0;
  }
  return a1;
}

void sub_262E9A570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void *)(a1 + 56);
  unsigned int v9 = *(_DWORD *)a1;
  int v8 = *(_DWORD *)(a1 + 4);
  if ((v8 + 4) * (*(_DWORD *)a1 + 4)) {
    bzero(*(void **)(a1 + 56), 4 * (v8 + 4) * (v9 + 4));
  }
  uint64_t v91 = v7;
  if (v8)
  {
    unsigned int v10 = 0;
    unsigned int v11 = 2 * v8 * v9;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = v12 + 4 * v11;
    uint64_t v14 = v12 + 4 * v8 * v9;
    uint64_t v15 = a3 + 4 * v11;
    uint64_t v16 = a3 + 4 * v8 * v9;
    uint64_t v17 = v7;
    do
    {
      if (v9 < 4)
      {
        unsigned int v18 = 0;
      }
      else
      {
        unsigned int v18 = 0;
        do
        {
          uint64_t v19 = 4 * v18;
          *(float32x4_t *)(v17 + v19) = vaddq_f32(vaddq_f32(vabdq_f32(*(float32x4_t *)(a3 + v19), *(float32x4_t *)(v12 + v19)), vabdq_f32(*(float32x4_t *)(v16 + v19), *(float32x4_t *)(v14 + v19))), vabdq_f32(*(float32x4_t *)(v15 + v19), *(float32x4_t *)(v13 + v19)));
          LODWORD(v19) = v18 + 7;
          v18 += 4;
          unsigned int v9 = *(_DWORD *)a1;
        }
        while (v19 < *(_DWORD *)a1);
      }
      if (v18 >= v9)
      {
        uint64_t v21 = v9;
      }
      else
      {
        uint64_t v20 = 0;
        uint64_t v21 = v9;
        uint64_t v22 = a3 + 4 * v18;
        uint64_t v23 = v12 + 4 * v18;
        uint64_t v24 = v16 + 4 * v18;
        uint64_t v25 = v14 + 4 * v18;
        uint64_t v26 = v15 + 4 * v18;
        uint64_t v27 = v13 + 4 * v18;
        uint64_t v28 = v17 + 4 * v18;
        unint64_t v29 = v9 - (unint64_t)v18;
        do
        {
          *(float *)(v28 + 4 * v20) = (float)(vabds_f32(*(float *)(v22 + 4 * v20), *(float *)(v23 + 4 * v20))
                                            + vabds_f32(*(float *)(v24 + 4 * v20), *(float *)(v25 + 4 * v20)))
                                    + vabds_f32(*(float *)(v26 + 4 * v20), *(float *)(v27 + 4 * v20));
          ++v20;
        }
        while (v29 != v20);
      }
      a3 += 4 * v21;
      v16 += 4 * v21;
      v15 += 4 * v21;
      v12 += 4 * v21;
      v14 += 4 * v21;
      v13 += 4 * v21;
      ++v10;
      unsigned int v30 = *(_DWORD *)(a1 + 4);
      v17 += 4 * v21;
    }
    while (v10 < v30);
    if (v30)
    {
      int v31 = 0;
      __asm
      {
        FMOV            V0.4S, #1.0
        FMOV            V1.4S, #-1.0
      }
      float32x4_t v93 = _Q1;
      float32x4_t v94 = _Q0;
      while (1)
      {
        unsigned int v38 = v9 * v31;
        uint64_t v39 = *(void *)(a1 + 32);
        uint64_t v40 = *(void *)(a1 + 48);
        int v92 = v31;
        unsigned int v41 = 0;
        if (v9 >= 4)
        {
          uint64_t v42 = a2 + 4 * v38;
          uint64_t v43 = a5 + 4 * v38;
          uint64_t v86 = *(void *)(a1 + 32);
          uint64_t v87 = *(void *)(a1 + 48);
          uint64_t v44 = v39 + 4 * v38;
          uint64_t v45 = v40 + 4 * v38;
          uint64_t v46 = a4 + 4 * v38;
          do
          {
            unsigned int v47 = v41;
            uint64_t v48 = 4 * v41;
            *(double *)v49.i64 = sub_262E98DAC(vmulq_n_f32(*(float32x4_t *)(v91 + 4 * v38 + v48), -*(float *)(a1 + 12)));
            float32x4_t v50 = (const float *)(a1 + 16);
            float32x4_t v51 = vld1q_dup_f32(v50);
            int8x16_t v52 = (int8x16_t)vmaxq_f32(v51, vsubq_f32(v94, v49));
            float32x4_t v53 = *(float32x4_t *)(v42 + v48);
            float32x4_t v54 = *(float32x4_t *)(v44 + v48);
            int8x16_t v55 = (int8x16_t)vcgeq_f32(v93, v53);
            int8x16_t v56 = (int8x16_t)vcgeq_f32(v93, v54);
            float32x4_t v57 = (float32x4_t)vbslq_s8(vbicq_s8(v56, v55), (int8x16_t)v94, v52);
            float32x4_t v58 = *(float32x4_t *)(v43 + v48);
            float32x4_t v59 = (const float *)(a1 + 20);
            float32x4_t v60 = vld1q_dup_f32(v59);
            int8x16_t v61 = (int8x16_t)vcgtq_f32(v49, v60);
            float32x4_t v62 = vsubq_f32(v94, v57);
            float32x4_t v63 = vmulq_f32(*(float32x4_t *)(v45 + v48), v62);
            unint64_t v64 = (const float *)(a1 + 24);
            float32x4_t v65 = vld1q_dup_f32(v64);
            int8x16_t v66 = (int8x16_t)vcgtq_f32(v49, v65);
            int v67 = (const float *)(a1 + 28);
            float32x4_t v68 = vld1q_dup_f32(v67);
            int8x16_t v69 = vbicq_s8((int8x16_t)vcgtq_f32(vabdq_f32(v53, *(float32x4_t *)(v46 + v48)), v68), (int8x16_t)vcgeq_f32(v93, *(float32x4_t *)(v46 + v48)));
            *(float32x4_t *)(v46 + v48) = v53;
            *(int8x16_t *)(v42 + v48) = vbslq_s8(v55, vbslq_s8(v61, (int8x16_t)v54, (int8x16_t)v53), vbslq_s8(v56, (int8x16_t)v53, vbslq_s8(v69, vbslq_s8(v66, (int8x16_t)v93, (int8x16_t)v53), (int8x16_t)vmlaq_f32(vmulq_f32(v54, v62), v53, v57))));
            *(int8x16_t *)(v43 + v48) = vbslq_s8(v55, vbslq_s8(v61, (int8x16_t)v63, (int8x16_t)v58), vbslq_s8(v56, (int8x16_t)v58, vbslq_s8(v69, vbicq_s8((int8x16_t)v58, v66), (int8x16_t)vmlaq_f32(v63, v58, v57))));
            unsigned int v41 = v47 + 4;
            unsigned int v9 = *(_DWORD *)a1;
          }
          while (v47 + 7 < *(_DWORD *)a1);
          uint64_t v39 = v86;
          uint64_t v40 = v87;
        }
        if (v41 < v9) {
          break;
        }
LABEL_37:
        int v31 = v92 + 1;
        if ((v92 + 1) >= *(_DWORD *)(a1 + 4)) {
          return;
        }
      }
      uint64_t v70 = 0;
      uint64_t v71 = 4 * v41 + 4 * v38;
      uint64_t v72 = a2 + v71;
      uint64_t v73 = v91 + v71;
      uint64_t v74 = v39 + v71;
      uint64_t v75 = v40 + v71;
      uint64_t v76 = a5 + v71;
      uint64_t v77 = a4 + v71;
      unint64_t v78 = v9 - (unint64_t)v41;
      while (1)
      {
        float v79 = *(float *)(v72 + 4 * v70);
        float v80 = expf(-(float)(*(float *)(a1 + 12) * *(float *)(v73 + 4 * v70)));
        float v81 = *(float *)(v74 + 4 * v70);
        float v82 = 1.0;
        float v83 = v79 + 1.0;
        if ((float)(v81 + 1.0) != 0.0 || v83 == 0.0) {
          float v82 = fmaxf(*(float *)(a1 + 16), 1.0 - v80);
        }
        if (v83 != 0.0) {
          break;
        }
        if (v80 > *(float *)(a1 + 20))
        {
          *(float *)(v72 + 4 * v70) = v81;
          float v84 = (float)(1.0 - v82) * *(float *)(v75 + 4 * v70);
LABEL_35:
          *(float *)(v76 + 4 * v70) = v84;
        }
LABEL_36:
        *(float *)(v77 + 4 * v70++) = v79;
        if (v78 == v70) {
          goto LABEL_37;
        }
      }
      float v85 = *(float *)(v77 + 4 * v70);
      if ((float)(v85 + 1.0) != 0.0 && vabds_f32(v79, v85) > *(float *)(a1 + 28))
      {
        if (v80 > *(float *)(a1 + 24))
        {
          *(_DWORD *)(v72 + 4 * v70) = -1082130432;
          *(_DWORD *)(v76 + 4 * v70) = 0;
        }
        goto LABEL_36;
      }
      *(float *)(v72 + 4 * v70) = (float)(v81 * (float)(1.0 - v82)) + (float)(v82 * v79);
      float v84 = (float)((float)(1.0 - v82) * *(float *)(v75 + 4 * v70)) + (float)(v82 * *(float *)(v76 + 4 * v70));
      goto LABEL_35;
    }
  }
}

void **sub_262E9A99C(void **result, const void *a2, void *__src, const void *a4)
{
  uint64_t v6 = result;
  unsigned int v7 = *((_DWORD *)result + 1) * *(_DWORD *)result;
  if (v7 * *((_DWORD *)result + 2))
  {
    uint64_t result = (void **)memmove(result[5], a2, 4 * v7 * *((_DWORD *)result + 2));
    unsigned int v7 = *((_DWORD *)v6 + 1) * *(_DWORD *)v6;
  }
  if (v7)
  {
    uint64_t result = (void **)memmove(v6[4], __src, 4 * v7);
    unsigned int v8 = *((_DWORD *)v6 + 1) * *(_DWORD *)v6;
    if (v8)
    {
      unsigned int v9 = v6[6];
      return (void **)memmove(v9, a4, 4 * v8);
    }
  }
  return result;
}

uint64_t sub_262E9AA40(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void *sub_262E9AA48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = sub_262E95B3C(a1, a2, a3, a4, 3, a5);
  *uint64_t result = &unk_270E22140;
  return result;
}

void sub_262E9AA88(uint64_t a1)
{
  sub_262E95BB4(a1);

  JUMPOUT(0x263E61D10);
}

void sub_262E9AAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8)
{
  if ((a6 & 3) != 0) {
    sub_262EB46B0();
  }
  if (a7 < a8)
  {
    uint64_t v8 = 0;
    unint64_t v9 = a6 >> 2;
    unint64_t v10 = a4 - 3;
    unint64_t v11 = (unint64_t)(a4 - 3) >> 2;
    if (v11 <= 1) {
      unint64_t v11 = 1;
    }
    uint64_t v12 = v9 * (3 * a7 + 2);
    uint64_t v13 = a3 + 4 * v12 + 8;
    uint64_t v14 = a2 + 4 * v12 + 12;
    unint64_t v15 = v9 + v9 * 3 * a7;
    uint64_t v16 = a3 + 4 * v15 + 8;
    uint64_t v17 = a2 + 4 * v15 + 12;
    uint64_t v18 = 12 * v9 * a7;
    uint64_t v19 = v18 + a3 + 8;
    uint64_t v20 = v18 + a2 + 12;
    do
    {
      uint64_t v21 = 3 * a7 * v9;
      uint64_t v22 = (float *)(a2 + 4 * v21);
      uint64_t v23 = (float *)(a3 + 4 * v21);
      unint64_t v24 = v9 + v21;
      uint64_t v25 = (float *)(a2 + 4 * v24);
      uint64_t v26 = (float *)(a3 + 4 * v24);
      uint64_t v27 = (3 * a7 + 2) * v9;
      uint64_t v28 = (float *)(a2 + 4 * v27);
      unint64_t v29 = (float *)(a3 + 4 * v27);
      float v30 = *v22;
      float v31 = v22[1];
      float v32 = v22[2];
      float v33 = *v25;
      float v34 = v25[1];
      float v35 = v25[2];
      float v36 = *v28;
      float v37 = v28[1];
      float v38 = v28[2];
      float v39 = (float)(*v22 + v31) + 0.0;
      *uint64_t v23 = v39;
      float v40 = (float)(v33 + v34) + 0.0;
      *uint64_t v26 = v40;
      float v41 = (float)(v36 + v37) + 0.0;
      *unint64_t v29 = v41;
      float v42 = v32 + v39;
      v23[1] = v42;
      float v43 = v35 + v40;
      v26[1] = v43;
      float v44 = v38 + v41;
      v29[1] = v44;
      if (v10 >= 4)
      {
        uint64_t v51 = v8;
        unint64_t v52 = v11;
        do
        {
          float32x4_t v53 = (float *)(v13 + v51);
          float32x4_t v54 = (float *)(v16 + v51);
          int8x16_t v55 = (float *)(v19 + v51);
          float v56 = *(float *)(v20 + v51);
          float v57 = *(float *)(v17 + v51);
          float v58 = *(float *)(v14 + v51);
          float v59 = (float)(v42 - v30) + v56;
          float v60 = (float)(v43 - v33) + v57;
          float v61 = (float)(v44 - v36) + v58;
          *int8x16_t v55 = v59;
          *float32x4_t v54 = v60;
          *float32x4_t v53 = v61;
          float v30 = *(float *)(v20 + v51 + 4);
          float v33 = *(float *)(v17 + v51 + 4);
          float v36 = *(float *)(v14 + v51 + 4);
          float v62 = (float)(v59 - v31) + v30;
          float v63 = (float)(v60 - v34) + v33;
          float v64 = (float)(v61 - v37) + v36;
          v55[1] = v62;
          v54[1] = v63;
          v53[1] = v64;
          float v31 = *(float *)(v20 + v51 + 8);
          float v34 = *(float *)(v17 + v51 + 8);
          float v37 = *(float *)(v14 + v51 + 8);
          float v65 = (float)(v62 - v32) + v31;
          float v66 = (float)(v63 - v35) + v34;
          float v67 = (float)(v64 - v38) + v37;
          v55[2] = v65;
          v54[2] = v66;
          v53[2] = v67;
          float v32 = *(float *)(v20 + v51 + 12);
          float v35 = *(float *)(v17 + v51 + 12);
          float v38 = *(float *)(v14 + v51 + 12);
          float v42 = (float)(v65 - v56) + v32;
          float v43 = (float)(v66 - v57) + v35;
          float v44 = (float)(v67 - v58) + v38;
          v55[3] = v42;
          v54[3] = v43;
          v53[3] = v44;
          v51 += 16;
          --v52;
        }
        while (v52);
        float32x4_t v50 = (float *)(v13 + v51);
        unsigned int v47 = (float *)(v14 + v51);
        float32x4_t v49 = (float *)(v16 + v51);
        uint64_t v46 = (float *)(v17 + v51);
        uint64_t v48 = (float *)(v19 + v51);
        uint64_t v45 = (float *)(v20 + v51);
      }
      else
      {
        uint64_t v45 = v22 + 3;
        uint64_t v46 = v25 + 3;
        unsigned int v47 = v28 + 3;
        uint64_t v48 = v23 + 2;
        float32x4_t v49 = v26 + 2;
        float32x4_t v50 = v29 + 2;
      }
      float32x4_t v68 = v45 - 3;
      int8x16_t v69 = v46 - 3;
      uint64_t v70 = v47 - 3;
      if (((a4 - 3) & 0xFFFFFFFFFFFFFFFCLL | 2) < a4 - 1)
      {
        uint64_t v71 = 0;
        unint64_t v72 = v10 & 3;
        do
        {
          float v42 = (float)(v42 - v68[v71]) + v68[v71 + 3];
          float v43 = (float)(v43 - v69[v71]) + v69[v71 + 3];
          float v44 = (float)(v44 - v70[v71]) + v70[v71 + 3];
          v48[v71] = v42;
          v49[v71] = v43;
          v50[v71++] = v44;
          --v72;
        }
        while (v72);
        uint64_t v70 = (float *)((char *)v70 + v71 * 4);
        int8x16_t v69 = (float *)((char *)v69 + v71 * 4);
        float32x4_t v68 = (float *)((char *)v68 + v71 * 4);
        float32x4_t v50 = (float *)((char *)v50 + v71 * 4);
        float32x4_t v49 = (float *)((char *)v49 + v71 * 4);
        uint64_t v48 = (float *)((char *)v48 + v71 * 4);
      }
      if (a4)
      {
        float v73 = v43 - *v69;
        float v74 = v44 - *v70;
        *uint64_t v48 = v42 - *v68;
        *float32x4_t v49 = v73;
        *float32x4_t v50 = v74;
      }
      ++a7;
      v8 += 12 * v9;
    }
    while (a7 != a8);
  }
}

uint64_t sub_262E9C924()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E9C958(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E9D9B4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E9D9E8(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E9E420()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E9E454(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E9F1A4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E9F1D8(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262E9F9CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_262EA0A50()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EA0A84(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262EA10B0(uint64_t a1, __int16 a2, __int16 a3, char a4, char a5, char a6, char a7)
{
  *(_WORD *)a1 = a2;
  *(_WORD *)(a1 + 2) = a3;
  *(unsigned char *)(a1 + 4) = a4;
  *(unsigned char *)(a1 + 5) = a5;
  *(unsigned char *)(a1 + 6) = a6;
  *(unsigned char *)(a1 + 7) = a7;
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0;
  operator new[]();
}

uint64_t sub_262EA1710(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    MEMORY[0x263E61CF0](v2, 0x1000C80BDFB0063);
    *(void *)(a1 + 8) = 0;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    MEMORY[0x263E61CF0](v3, 0x1000C80BDFB0063);
    *(void *)(a1 + 16) = 0;
  }
  if (*(void *)(a1 + 24))
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_12;
    }
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v7 = *(void *)(v6 + 8 * v5);
      if (v7)
      {
        MEMORY[0x263E61CF0](v7, 0x1000C8052888210);
        uint64_t v6 = *(void *)(a1 + 24);
        unsigned int v4 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v6 + 8 * v5++) = 0;
    }
    while (v5 < v4);
    if (*(void *)(a1 + 24)) {
LABEL_12:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 24) = 0;
  }
  if (*(void *)(a1 + 32))
  {
    unsigned int v8 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_21;
    }
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(v10 + 8 * v9);
      if (v11)
      {
        MEMORY[0x263E61CF0](v11, 0x1000C8052888210);
        uint64_t v10 = *(void *)(a1 + 32);
        unsigned int v8 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v10 + 8 * v9++) = 0;
    }
    while (v9 < v8);
    if (*(void *)(a1 + 32)) {
LABEL_21:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 32) = 0;
  }
  if (*(void *)(a1 + 40))
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_30;
    }
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(v14 + 8 * v13);
      if (v15)
      {
        MEMORY[0x263E61CF0](v15, 0x1000C8052888210);
        uint64_t v14 = *(void *)(a1 + 40);
        unsigned int v12 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v14 + 8 * v13++) = 0;
    }
    while (v13 < v12);
    if (*(void *)(a1 + 40)) {
LABEL_30:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 40) = 0;
  }
  if (*(void *)(a1 + 48))
  {
    unsigned int v16 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_39;
    }
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = *(void *)(v18 + 8 * v17);
      if (v19)
      {
        MEMORY[0x263E61CF0](v19, 0x1000C8052888210);
        uint64_t v18 = *(void *)(a1 + 48);
        unsigned int v16 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v18 + 8 * v17++) = 0;
    }
    while (v17 < v16);
    if (*(void *)(a1 + 48)) {
LABEL_39:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 48) = 0;
  }
  if (*(void *)(a1 + 56))
  {
    unsigned int v20 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_48;
    }
    unint64_t v21 = 0;
    do
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void *)(v22 + 8 * v21);
      if (v23)
      {
        MEMORY[0x263E61CF0](v23, 0x1000C8052888210);
        uint64_t v22 = *(void *)(a1 + 56);
        unsigned int v20 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v22 + 8 * v21++) = 0;
    }
    while (v21 < v20);
    if (*(void *)(a1 + 56)) {
LABEL_48:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 56) = 0;
  }
  if (*(void *)(a1 + 64))
  {
    unsigned int v24 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_57;
    }
    unint64_t v25 = 0;
    do
    {
      uint64_t v26 = *(void *)(a1 + 64);
      uint64_t v27 = *(void *)(v26 + 8 * v25);
      if (v27)
      {
        MEMORY[0x263E61CF0](v27, 0x1000C8052888210);
        uint64_t v26 = *(void *)(a1 + 64);
        unsigned int v24 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v26 + 8 * v25++) = 0;
    }
    while (v25 < v24);
    if (*(void *)(a1 + 64)) {
LABEL_57:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 64) = 0;
  }
  if (*(void *)(a1 + 72))
  {
    unsigned int v28 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_66;
    }
    unint64_t v29 = 0;
    do
    {
      uint64_t v30 = *(void *)(a1 + 72);
      uint64_t v31 = *(void *)(v30 + 8 * v29);
      if (v31)
      {
        MEMORY[0x263E61CF0](v31, 0x1000C8052888210);
        uint64_t v30 = *(void *)(a1 + 72);
        unsigned int v28 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v30 + 8 * v29++) = 0;
    }
    while (v29 < v28);
    if (*(void *)(a1 + 72)) {
LABEL_66:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 72) = 0;
  }
  if (*(void *)(a1 + 80))
  {
    unsigned int v32 = *(unsigned __int8 *)(a1 + 4);
    if (!*(unsigned char *)(a1 + 4)) {
      goto LABEL_75;
    }
    unint64_t v33 = 0;
    do
    {
      uint64_t v34 = *(void *)(a1 + 80);
      uint64_t v35 = *(void *)(v34 + 8 * v33);
      if (v35)
      {
        MEMORY[0x263E61CF0](v35, 0x1000C8052888210);
        uint64_t v34 = *(void *)(a1 + 80);
        unsigned int v32 = *(unsigned __int8 *)(a1 + 4);
      }
      *(void *)(v34 + 8 * v33++) = 0;
    }
    while (v33 < v32);
    if (*(void *)(a1 + 80)) {
LABEL_75:
    }
      MEMORY[0x263E61CF0]();
    *(void *)(a1 + 80) = 0;
  }
  uint64_t v36 = *(void *)(a1 + 88);
  if (v36)
  {
    MEMORY[0x263E61CF0](v36, 0x1000C8052888210);
    *(void *)(a1 + 88) = 0;
  }
  uint64_t v37 = *(void *)(a1 + 96);
  if (v37)
  {
    MEMORY[0x263E61CF0](v37, 0x1000C8052888210);
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v38 = *(void *)(a1 + 136);
  if (v38)
  {
    MEMORY[0x263E61CF0](v38, 0x1000C8077774924);
    *(void *)(a1 + 136) = 0;
  }
  uint64_t v39 = *(void *)(a1 + 112);
  if (v39)
  {
    MEMORY[0x263E61CF0](v39, 0x1000C8052888210);
    *(void *)(a1 + 112) = 0;
  }
  uint64_t v40 = *(void *)(a1 + 120);
  if (v40)
  {
    MEMORY[0x263E61CF0](v40, 0x1000C8052888210);
    *(void *)(a1 + 120) = 0;
  }
  uint64_t v41 = *(void *)(a1 + 128);
  if (v41)
  {
    MEMORY[0x263E61CF0](v41, 0x1000C8052888210);
    *(void *)(a1 + 128) = 0;
  }
  uint64_t v42 = *(void *)(a1 + 104);
  if (v42) {
    MEMORY[0x263E61CF0](v42, 0x1000C8052888210);
  }
  return a1;
}

void sub_262EA1BB4(unsigned __int16 *a1, void *__src, void *__dst, const void *a4, const void *a5, uint64_t a6, float a7, float a8)
{
  if (a1[1] * *a1) {
    bzero(*((void **)a1 + 11), 4 * *a1 * (unint64_t)a1[1]);
  }
  if (**((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1))
  {
    memmove(**((void ***)a1 + 5), __src, 4 * **((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1));
    if (**((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1))
    {
      memmove(**((void ***)a1 + 4), a4, 4 * **((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1));
      if (**((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1)) {
        memmove(**((void ***)a1 + 3), a5, 4 * **((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1));
      }
    }
  }
  LODWORD(v16) = *((unsigned __int8 *)a1 + 4);
  if (v16 >= 2)
  {
    uint64_t v17 = 0;
    do
    {
      sub_262EA1F54((uint64_t)a1, **((void **)a1 + 5), *(void *)(*((void *)a1 + 5) + 8 * v17 + 8), (v17 + 1), **((unsigned __int16 **)a1 + 1), **((unsigned __int16 **)a1 + 2));
      sub_262EA3698(v18, *(void *)(*((void *)a1 + 4) + 8 * v17), *(void *)(*((void *)a1 + 4) + 8 * v17 + 8), *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v17), *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v17));
      sub_262EA3354(v19, *(void *)(*((void *)a1 + 3) + 8 * v17), *(void *)(*((void *)a1 + 3) + 8 * v17 + 8), *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v17), *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v17));
      unint64_t v16 = *((unsigned __int8 *)a1 + 4);
      unint64_t v20 = v17 + 2;
      ++v17;
    }
    while (v20 < v16);
  }
  if (v16)
  {
    uint64_t v21 = v16;
    do
    {
      uint64_t v22 = v21 - 1;
      sub_262EA1FD0((uint64_t)a1, *(void *)(*((void *)a1 + 6) + 8 * (v21 - 1)), *(char **)(*((void *)a1 + 3) + 8 * (v21 - 1)), *(void *)(*((void *)a1 + 7) + 8 * (v21 - 1)), *(void *)(*((void *)a1 + 8) + 8 * (v21 - 1)), 0, *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * (v21 - 1)), *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * (v21 - 1)));
      if (v21 == *((unsigned __int8 *)a1 + 4))
      {
        unsigned int v24 = (unsigned __int16 *)*((void *)a1 + 1);
        unint64_t v25 = (unsigned __int16 *)*((void *)a1 + 2);
        if (v25[v22] * v24[v22])
        {
          uint64_t v23 = memmove(*(void **)(*((void *)a1 + 9) + 8 * v22), *(const void **)(*((void *)a1 + 5) + 8 * v22), 4 * v25[v22] * v24[v22]);
          unsigned int v24 = (unsigned __int16 *)*((void *)a1 + 1);
          unint64_t v25 = (unsigned __int16 *)*((void *)a1 + 2);
        }
        sub_262EA372C((uint64_t)v23, a6, *((void *)a1 + 14), *v24, *v25);
        sub_262EA2214(a7, a8, v26, *(float **)(*((void *)a1 + 9) + 8 * v22), *((float **)a1 + 14), *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v22), *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v22));
        sub_262EA22B4((unsigned __int8 *)a1, *(float **)(*((void *)a1 + 9) + 8 * v22), *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v22), *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v22));
      }
      else
      {
        sub_262EA24A8((float32x4_t *)a1, *(int **)(*((void *)a1 + 5) + 8 * v21), *(float32x4_t **)(*((void *)a1 + 9) + 8 * v22), *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v21), *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v21));
        uint64_t v27 = *(int8x16_t **)(*((void *)a1 + 5) + 8 * v22);
        unsigned int v28 = *(int8x16_t **)(*((void *)a1 + 9) + 8 * v22);
        unint64_t v29 = *(int32x4_t **)(*((void *)a1 + 4) + 8 * v22);
        unsigned int v30 = *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v22)
            * *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v22);
        unsigned int v31 = v30 - 3;
        if (v30 != 3)
        {
          unsigned int v32 = 0;
          do
          {
            int32x4_t v33 = *v29++;
            int32x4_t v34 = v33;
            int8x16_t v35 = *v27++;
            int8x16_t *v28 = vbslq_s8((int8x16_t)vceqzq_s32(v34), v35, *v28);
            ++v28;
            v32 += 4;
          }
          while (v32 < v31);
          unsigned int v31 = v30 & 0x7FFFFFFC;
        }
        BOOL v36 = v30 >= v31;
        unsigned int v37 = v30 - v31;
        if (v37 != 0 && v36)
        {
          do
          {
            if (v29->i32[0] != -1) {
              v28->i32[0] = v27->i32[0];
            }
            uint64_t v27 = (int8x16_t *)((char *)v27 + 4);
            unsigned int v28 = (int8x16_t *)((char *)v28 + 4);
            unint64_t v29 = (int32x4_t *)((char *)v29 + 4);
            --v37;
          }
          while (v37);
        }
      }
      sub_262EA2714((char *)a1, *(void *)(*((void *)a1 + 9) + 8 * v22), *(void *)(*((void *)a1 + 10) + 8 * v22), *((void *)a1 + 13), (v21 - 1), *((unsigned __int8 *)a1 + 5), *((unsigned char *)a1 + 6), *((unsigned char *)a1 + 7));
      if (*(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v22) * *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v22)) {
        memmove(*(void **)(*((void *)a1 + 5) + 8 * v22), *(const void **)(*((void *)a1 + 10) + 8 * v22), 4* *(unsigned __int16 *)(*((void *)a1 + 2) + 2 * v22)* *(unsigned __int16 *)(*((void *)a1 + 1) + 2 * v22));
      }
    }
    while (v21-- > 1);
  }
  unsigned int v39 = **((unsigned __int16 **)a1 + 2) * **((unsigned __int16 **)a1 + 1);
  if (v39)
  {
    uint64_t v40 = (const void *)**((void **)a1 + 5);
    memmove(__dst, v40, 4 * v39);
  }
}

void sub_262EA1F54(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  if (a4 >= 4) {
    sub_262EB4BCC();
  }
  switch(a4)
  {
    case 3u:
      sub_262EA35A4(a1, a2, a3, a5, a6);
      break;
    case 2u:
      sub_262EA34CC(a1, a2, a3, a5, a6);
      break;
    case 1u:
      sub_262EA3410(a1, a2, a3, a5, a6);
      break;
  }
}

void sub_262EA1FD0(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, unsigned int a8)
{
  uint64_t v14 = *(char **)(a1 + 112);
  uint64_t v15 = a7 + 2;
  bzero(v14, 4 * ((a8 + 2) * v15 - ((a8 + 2) * v15 != 0)) + 4);
  if (a8)
  {
    uint64_t v51 = a2;
    uint64_t v52 = a5;
    uint64_t v16 = 4 * a7;
    float32x4_t v50 = v14 + 4;
    uint64_t v17 = a8;
    uint64_t v18 = &v14[v16 + 12];
    uint64_t v19 = v17;
    do
    {
      if (a7) {
        memmove(v18, a3, 4 * a7);
      }
      v18 += v16 + 8;
      a3 += v16;
      --v19;
    }
    while (v19);
    uint64_t v20 = 0;
    uint64_t v21 = 4 * a7;
    uint64_t v22 = v21 + 8;
    float32x4_t v23 = (float32x4_t)vdupq_n_s32(0x3A800000u);
    uint64_t v24 = (uint64_t)&v14[8 * a7 + 20];
    uint64_t v25 = v52;
    uint64_t v26 = a4;
    uint64_t v27 = &v14[v21];
    do
    {
      uint64_t v28 = v20 * a7;
      ++v20;
      unint64_t v29 = (float *)(v51 + 16 * (v28 & 0x3FFFFFFF));
      if (a7 < 4)
      {
        unsigned int v37 = 0;
        uint64_t v32 = (uint64_t)&v50[4 * v20 * v15];
        int32x4_t v33 = (float *)(v32 - 4 * v15);
        int32x4_t v34 = (float *)(v32 + 4 * v15);
        int8x16_t v35 = (float *)(a4 + 4 * v28);
        BOOL v36 = (float *)(v52 + 4 * v28);
      }
      else
      {
        uint64_t v30 = 0;
        unsigned int v31 = 3;
        do
        {
          v53.val[0] = *(float32x4_t *)&v27[v30 + 16];
          v53.val[1] = *(float32x4_t *)&v14[v30 + 4];
          v53.val[2] = *(float32x4_t *)&v27[v30 + 8];
          v53.val[3] = *(float32x4_t *)(v24 + v30);
          vst4q_f32(v29, v53);
          v29 += 16;
          v53.val[0] = vaddq_f32(vaddq_f32(v53.val[0], v53.val[1]), vaddq_f32(v53.val[2], v53.val[3]));
          *(float32x4_t *)(v26 + v30) = v53.val[0];
          *(float32x4_t *)(v25 + v30) = vrecpeq_f32(vmaxq_f32(v53.val[0], v23));
          v31 += 4;
          v30 += 16;
        }
        while (v31 < a7);
        uint64_t v32 = (uint64_t)&v27[v30 + 12];
        int32x4_t v33 = (float *)&v14[v30 + 4];
        int32x4_t v34 = (float *)(v24 + v30);
        int8x16_t v35 = (float *)(v26 + v30);
        BOOL v36 = (float *)(v25 + v30);
        unsigned int v37 = a7 & 0xFFFC;
      }
      BOOL v38 = a7 >= v37;
      unsigned int v39 = a7 - v37;
      if (v39 != 0 && v38)
      {
        uint64_t v40 = (float *)(v32 + 4);
        do
        {
          float v41 = *v40;
          *unint64_t v29 = *v40;
          float v42 = *v33++;
          float v43 = v42;
          v29[1] = v42;
          float v44 = *(v40 - 2);
          v29[2] = v44;
          float v45 = *v34++;
          v29[3] = v45;
          float v46 = (float)((float)(v41 + v43) + v44) + v45;
          *v35++ = v46;
          float v47 = 1.0 / v46;
          BOOL v48 = v46 <= 0.00097656;
          float v49 = 1024.0;
          if (!v48) {
            float v49 = v47;
          }
          *v36++ = v49;
          ++v40;
          v29 += 4;
          --v39;
        }
        while (v39);
      }
      v27 += v22;
      v14 += v22;
      v24 += v22;
      v26 += v21;
      v25 += v21;
    }
    while (v20 != v17);
  }
}

void sub_262EA2214(float a1, float a2, uint64_t a3, float *a4, float *a5, unsigned int a6, unsigned int a7)
{
  if (a6)
  {
    unsigned int v7 = 0;
    uint64_t v8 = (int)(a6 * (a7 - 1));
    unint64_t v9 = a5;
    uint64_t v10 = a4;
    do
    {
      if (*v9 > a2) {
        *uint64_t v10 = a1;
      }
      if (v9[v8] > a2) {
        v10[v8] = a1;
      }
      ++v7;
      ++v10;
      ++v9;
    }
    while (v7 < a6);
  }
  if (a7)
  {
    unsigned int v11 = 0;
    uint64_t v12 = 4 * a6;
    unint64_t v13 = a5 - 1;
    uint64_t v14 = a4 - 1;
    do
    {
      if (v13[1] > a2) {
        v14[1] = a1;
      }
      if (v13[a6] > a2) {
        v14[a6] = a1;
      }
      ++v11;
      unint64_t v13 = (float *)((char *)v13 + v12);
      uint64_t v14 = (float *)((char *)v14 + v12);
    }
    while (v11 < a7);
  }
}

unsigned __int8 *sub_262EA22B4(unsigned __int8 *result, float *a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *((void *)result + 17);
  uint64_t v5 = a4 * a3;
  if (v5)
  {
    uint64_t v6 = (unsigned char *)*((void *)result + 17);
    unsigned int v7 = a2;
    do
    {
      if ((float)(*v7 + 1.0) == 0.0)
      {
        *uint64_t v6 = 1;
        *unsigned int v7 = 1.0e10;
      }
      else
      {
        *uint64_t v6 = 0;
      }
      ++v7;
      ++v6;
      --v5;
    }
    while (v5);
  }
  uint64_t v8 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v9 = v4 + 1;
    uint64_t v10 = 1;
    unsigned int v11 = a2;
    do
    {
      if (a4)
      {
        uint64_t v12 = 0;
        uint64_t v13 = a4;
        do
        {
          if (*(unsigned char *)(v9 + v12))
          {
            uint64_t v14 = &v11[v12];
            float v15 = *v14;
            if (*v14 >= v14[1]) {
              float v15 = v14[1];
            }
            v14[1] = v15;
          }
          v12 += a3;
          --v13;
        }
        while (v13);
      }
      ++v10;
      ++v11;
      ++v9;
    }
    while (v10 != a3);
    uint64_t v16 = &a2[v8];
    uint64_t v17 = v4 + v8;
    do
    {
      if (a4)
      {
        uint64_t v18 = 0;
        uint64_t v19 = a4;
        do
        {
          if (*(unsigned char *)(v17 + v18))
          {
            uint64_t v20 = &v16[v18];
            float v21 = v20[1];
            if (v21 >= *v20) {
              float v21 = *v20;
            }
            *uint64_t v20 = v21;
          }
          v18 += a3;
          --v19;
        }
        while (v19);
      }
      --v16;
      --v17;
      BOOL v22 = v8-- <= 0;
    }
    while (!v22);
  }
  if (a4 >= 2)
  {
    uint64_t v23 = 4 * a3;
    uint64_t v24 = 1;
    uint64_t v25 = a2;
    uint64_t v26 = (unsigned __int8 *)(v4 + a3);
    do
    {
      if (a3)
      {
        unint64_t v27 = 0;
        uint64_t v28 = &v25[(unint64_t)v23 / 4];
        unint64_t v29 = v26;
        do
        {
          if (*v29++)
          {
            float v31 = v25[v27 / 4];
            if (v31 >= v28[v27 / 4]) {
              float v31 = v28[v27 / 4];
            }
            v28[v27 / 4] = v31;
          }
          v27 += 4;
        }
        while (v23 != v27);
      }
      ++v24;
      v26 += a3;
      uint64_t v25 = (float *)((char *)v25 + v23);
    }
    while (v24 != a4);
    uint64_t v32 = a4 - 2;
    int32x4_t v33 = (unsigned __int8 *)(v4 + (int)(a4 - 2) * (uint64_t)(int)a3);
    int32x4_t v34 = &a2[(int)(a4 - 2) * (uint64_t)(int)a3];
    int8x16_t v35 = (float *)((char *)a2 + (int)(4 * a4 - 4) * (uint64_t)(int)a3);
    do
    {
      uint64_t v36 = a3;
      unsigned int v37 = v35;
      BOOL v38 = v34;
      uint64_t result = v33;
      if (a3)
      {
        do
        {
          if (*result++)
          {
            float v40 = *v37;
            if (*v37 >= *v38) {
              float v40 = *v38;
            }
            *BOOL v38 = v40;
          }
          ++v38;
          ++v37;
          --v36;
        }
        while (v36);
      }
      v33 -= a3;
      v34 -= a3;
      v35 -= a3;
      BOOL v22 = v32-- <= 0;
    }
    while (!v22);
  }
  return result;
}

float32x4_t *sub_262EA24A8(float32x4_t *result, int *a2, float32x4_t *__dst, unsigned int a4, int a5)
{
  uint64_t v6 = __dst;
  unsigned int v7 = (float32x4_t *)result[8].i64[0];
  size_t __len = 8 * a4;
  if (!a5)
  {
    uint64_t v20 = __dst;
    if (!a4) {
      return result;
    }
    goto LABEL_25;
  }
  int v9 = 0;
  uint64_t v10 = 2 * a4;
  signed int v11 = a4 - 7;
  signed int v12 = a4 - 1;
  int v13 = (a4 & 0xFFFC) - 4;
  __asm
  {
    FMOV            V4.4S, #0.75
    FMOV            V5.4S, #0.25
  }
  uint64_t v20 = __dst;
  float v21 = &v7->f32[v10];
  int v46 = -2 * a4;
  int v43 = v13;
  int v44 = a5;
  float32x4_t v41 = _Q5;
  float32x4_t v42 = _Q4;
  do
  {
    uint64_t result = v7;
    unsigned int v7 = (float32x4_t *)v21;
    *(_DWORD *)float v21 = *a2;
    BOOL v22 = v21 + 1;
    if (a4 < 8)
    {
      int v25 = 0;
    }
    else
    {
      signed int v23 = 0;
      do
      {
        float32x4_t v24 = *(float32x4_t *)(a2 + 1);
        v49.val[0] = vmlaq_f32(vmulq_f32(*(float32x4_t *)a2, _Q4), _Q5, v24);
        v49.val[1] = vmlaq_f32(vmulq_f32(*(float32x4_t *)a2, _Q5), _Q4, v24);
        vst2q_f32(v22, v49);
        v22 += 8;
        v23 += 4;
        a2 += 4;
      }
      while (v23 < v11);
      int v25 = v13;
    }
    if (v25 < v12)
    {
      int v26 = v12 - v25;
      do
      {
        unint64_t v27 = (float *)a2;
        float v28 = *(float *)a2;
        float v29 = *((float *)a2++ + 1);
        float *v22 = (float)(v29 * 0.25) + (float)(v28 * 0.75);
        v22[1] = (float)(*(float *)a2 * 0.75) + (float)(*v27 * 0.25);
        v22 += 2;
        --v26;
      }
      while (v26);
    }
    uint64_t v6 = (float32x4_t *)((char *)v6 + 4 * v10);
    int v30 = *a2++;
    *(_DWORD *)BOOL v22 = v30;
    if (v9)
    {
      if (a4 < 2)
      {
        int v31 = 0;
        int32x4_t v33 = v7;
        uint64_t v32 = result;
      }
      else
      {
        int v31 = 0;
        uint64_t v32 = result;
        int32x4_t v33 = v7;
        do
        {
          float32x4_t v34 = *v32++;
          float32x4_t v35 = v34;
          float32x4_t v36 = *v33++;
          *v20++ = vmlaq_f32(vmulq_f32(v35, _Q4), _Q5, v36);
          *v6++ = vmlaq_f32(vmulq_f32(v35, _Q5), _Q4, v36);
          v31 += 4;
        }
        while (v31 < (int)v10 - 3);
      }
      if (v31 < v10)
      {
        int v37 = v46 + v31;
        do
        {
          v20->f32[0] = (float)(v33->f32[0] * 0.25) + (float)(v32->f32[0] * 0.75);
          uint64_t v20 = (float32x4_t *)((char *)v20 + 4);
          float v38 = v32->f32[0];
          uint64_t v32 = (float32x4_t *)((char *)v32 + 4);
          float v39 = v38;
          float v40 = v33->f32[0];
          int32x4_t v33 = (float32x4_t *)((char *)v33 + 4);
          v6->f32[0] = (float)(v40 * 0.75) + (float)(v39 * 0.25);
          uint64_t v6 = (float32x4_t *)((char *)v6 + 4);
        }
        while (!__CFADD__(v37++, 1));
      }
    }
    else if (a4)
    {
      float v47 = result;
      memmove(v20, v7, __len);
      uint64_t result = v47;
      _Q5 = v41;
      _Q4 = v42;
      int v13 = v43;
      a5 = v44;
    }
    uint64_t v20 = (float32x4_t *)((char *)v20 + 4 * v10);
    ++v9;
    float v21 = (float *)result;
  }
  while (v9 != a5);
  if (a4)
  {
LABEL_25:
    return (float32x4_t *)memmove(v20, v7, __len);
  }
  return result;
}

char *sub_262EA2714(char *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned __int8 a7, char a8)
{
  uint64_t v8 = (uint64_t)result;
  if (result[4] - 1 == a5) {
    return sub_262EA29E0((uint64_t)result, a2, a3, 0, a4, *(void *)(*((void *)result + 4) + 8 * a5), *(void *)(*((void *)result + 6) + 8 * a5), *(char **)(*((void *)result + 7) + 8 * a5), *(void *)(*((void *)result + 8) + 8 * a5), a8 + a7, *(_WORD *)(*((void *)result + 1) + 2 * a5), *(_WORD *)(*((void *)result + 2) + 2 * a5));
  }
  if (result[5])
  {
    uint64_t v9 = a5;
    sub_262EA29E0((uint64_t)result, a2, a3, *((char **)result + 11), a4, *(void *)(*((void *)result + 4) + 8 * v9), *(void *)(*((void *)result + 6) + 8 * v9), *(char **)(*((void *)result + 7) + 8 * v9), *(void *)(*((void *)result + 8) + 8 * v9), a7, *(_WORD *)(*((void *)result + 1) + 2 * v9), *(_WORD *)(*((void *)result + 2) + 2 * v9));
    unsigned int v10 = *(unsigned __int16 *)(*(void *)(v8 + 8) + 2 * v9);
    unsigned int v11 = *(unsigned __int16 *)(*(void *)(v8 + 16) + 2 * v9);
    if (v11 * v10)
    {
      memmove(*(void **)(v8 + 112), *(const void **)(v8 + 88), 4 * v11 * v10);
      unsigned int v10 = *(unsigned __int16 *)(*(void *)(v8 + 8) + 2 * v9);
      unsigned int v11 = *(unsigned __int16 *)(*(void *)(v8 + 16) + 2 * v9);
    }
    sub_262EA2FA0(v8, *(void *)(v8 + 112), *(float32x4_t **)(v8 + 88), v10, v11);
    if (*(_WORD *)(*(void *)(v8 + 8) + 2 * v9))
    {
      if (*(_WORD *)(*(void *)(v8 + 16) + 2 * v9)) {
        operator new[]();
      }
    }
    sub_262EB4BF8();
  }
  return result;
}

char *sub_262EA29E0(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8, uint64_t a9, unsigned __int8 a10, unsigned __int16 a11, unsigned __int16 a12)
{
  uint64_t v14 = *(void **)(a1 + 112);
  uint64_t v15 = a11 + 2;
  bzero(v14, 4 * ((a12 + 2) * v15 - ((a12 + 2) * v15 != 0)) + 4);
  if (a12)
  {
    uint64_t v16 = 0;
    do
    {
      if (a11)
      {
        uint64_t v17 = v16 + 1;
        memmove((void *)(*(void *)(a1 + 112) + 4 * (v16 + 1) * v15 + 4), (const void *)(a2 + 4 * v16 * a11), 4 * a11);
        uint64_t v16 = v17;
      }
      else
      {
        ++v16;
      }
    }
    while (v16 != a12);
    uint64_t v14 = *(void **)(a1 + 112);
  }
  uint64_t result = (char *)memmove(*(void **)(a1 + 120), v14, 4 * (a12 + 2) * v15);
  if (a10)
  {
    int v19 = 0;
    uint64_t v20 = 4 * a11;
    uint64_t v21 = v20 + 8;
    float32x4_t v22 = (float32x4_t)vdupq_n_s32(0xBF4CCCCD);
    do
    {
      int v84 = v19;
      if (a12)
      {
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = a6;
        uint64_t result = a8;
        uint64_t v27 = a9;
        uint64_t v26 = a5;
        uint64_t v28 = v20 + 12;
        uint64_t v29 = 8 * a11 + 20;
        uint64_t v30 = 4 * a11;
        do
        {
          uint64_t v31 = v24 + 1;
          uint64_t v33 = *(void *)(a1 + 112);
          uint64_t v32 = *(void *)(a1 + 120);
          uint64_t v34 = v24 * a11;
          float32x4_t v35 = (const float *)(a7 + 16 * (v34 & 0x3FFFFFFF));
          if (a11 < 4u)
          {
            unsigned int v48 = 0;
            uint64_t v40 = v33 + 4 * v31 * v15 + 4;
            uint64_t v41 = v40 - 4 * v15;
            uint64_t v42 = v40 + 4 * v15;
            uint64_t v43 = v32 + 4 * v31 * v15 + 4;
            uint64_t v44 = a5 + 4 * v34;
            float v45 = &a8[4 * v34];
            uint64_t v46 = a9 + 4 * v34;
            uint64_t v47 = a6 + 4 * v34;
          }
          else
          {
            uint64_t v36 = 0;
            int v37 = 0;
            do
            {
              int8x16_t v39 = *(int8x16_t *)(v25 + v36);
              if (vmaxvq_u32((uint32x4_t)v39))
              {
                float32x4x4_t v90 = vld4q_f32(v35);
                uint64_t v38 = v33 + v30;
                *(int8x16_t *)(v32 + v28 + v36) = vbslq_s8(v39, (int8x16_t)vmlaq_f32(*(float32x4_t *)(v38 + v36 + 12), v22, vmulq_f32(vsubq_f32(vmulq_f32(*(float32x4_t *)&result[v36], vsubq_f32(*(float32x4_t *)(v38 + v36 + 12), *(float32x4_t *)(v26 + v36))), vaddq_f32(vmlaq_f32(vmulq_f32(v90.val[0], *(float32x4_t *)(v38 + v36 + 16)), *(float32x4_t *)(v33 + v23 + v36 + 4), v90.val[1]), vmlaq_f32(
                                                                         vmulq_f32(v90.val[2], *(float32x4_t *)(v38 + v36 + 8)), *(float32x4_t *)(v33 + v29 + v36), v90.val[3]))), *(float32x4_t *)(v27 + v36))), *(int8x16_t *)(v38 + v36 + 12));
              }
              v37 += 4;
              v35 += 16;
              v36 += 16;
            }
            while ((v37 | 3u) < a11);
            uint64_t v40 = v33 + v30 + v36 + 12;
            uint64_t v41 = v33 + v23 + v36 + 4;
            uint64_t v42 = v33 + v29 + v36;
            uint64_t v43 = v32 + v28 + v36;
            uint64_t v44 = v26 + v36;
            float v45 = &result[v36];
            uint64_t v46 = v27 + v36;
            uint64_t v47 = v25 + v36;
            unsigned int v48 = a11 & 0xFFFC;
          }
          if (v48 < a11)
          {
            uint64_t v49 = 0;
            float32x4_t v50 = (float *)(v35 + 2);
            do
            {
              if (*(_DWORD *)(v47 + v49)) {
                *(float *)(v43 + v49) = *(float *)(v40 + v49)
              }
                                      + (float)((float)(*(float *)(v46 + v49) * -0.8)
                                              * (float)-(float)((float)((float)((float)((float)(*(v50 - 1)
                                                                                              * *(float *)(v41 + v49))
                                                                                      + (float)(*(v50 - 2)
                                                                                              * *(float *)(v40 + v49 + 4)))
                                                                              + (float)(*v50 * *(float *)(v40 + v49 - 4)))
                                                                      + (float)(v50[1] * *(float *)(v42 + v49)))
                                                              - (float)(*(float *)&v45[v49]
                                                                      * (float)(*(float *)(v40 + v49)
                                                                              - *(float *)(v44 + v49)))));
              ++v48;
              v50 += 4;
              v49 += 4;
            }
            while (v48 < a11);
          }
          v30 += v21;
          v23 += v21;
          v29 += v21;
          v28 += v21;
          v26 += v20;
          result += v20;
          v27 += v20;
          v25 += v20;
          uint64_t v24 = v31;
        }
        while (v31 != a12);
      }
      *(int8x16_t *)(a1 + 112) = vextq_s8(*(int8x16_t *)(a1 + 112), *(int8x16_t *)(a1 + 112), 8uLL);
      int v19 = v84 + 1;
    }
    while (v84 + 1 < a10);
  }
  if (a4 && a12)
  {
    uint64_t v51 = 0;
    uint64_t v52 = 4 * a11;
    uint64_t v53 = v52 + 8;
    uint64_t v54 = 8 * a11 + 20;
    uint64_t v55 = a6;
    float v56 = a8;
    uint64_t v57 = a9;
    uint64_t v58 = a5;
    uint64_t v59 = v52;
    uint64_t result = a4;
    uint64_t v60 = 0;
    do
    {
      uint64_t v61 = *(void *)(a1 + 112);
      uint64_t v62 = v60 + 1;
      uint64_t v63 = v60 * a11;
      float v64 = (const float *)(a7 + 16 * (v63 & 0x3FFFFFFF));
      if (a11 < 4u)
      {
        unsigned int v76 = 0;
        uint64_t v69 = v61 + 4 * v62 * v15 + 4;
        uint64_t v70 = v69 - 4 * v15;
        uint64_t v71 = v69 + 4 * v15;
        uint64_t v72 = a5 + 4 * v63;
        uint64_t v73 = a9 + 4 * v63;
        float v74 = &a8[4 * v63];
        uint64_t v75 = a6 + 4 * v63;
        float32x4_t v68 = &a4[4 * v63];
      }
      else
      {
        uint64_t v65 = 0;
        int v66 = 0;
        do
        {
          int8x16_t v67 = *(int8x16_t *)(v55 + v65);
          if (vmaxvq_u32((uint32x4_t)v67))
          {
            float32x4x4_t v89 = vld4q_f32(v64);
            *(int8x16_t *)&result[v65] = vandq_s8(v67, (int8x16_t)vmulq_f32(vsubq_f32(vmulq_f32(*(float32x4_t *)&v56[v65], vsubq_f32(*(float32x4_t *)(v61 + v59 + v65 + 12), *(float32x4_t *)(v58 + v65))), vaddq_f32(vmlaq_f32(vmulq_f32(v89.val[0], *(float32x4_t *)(v61 + v59 + v65 + 16)), *(float32x4_t *)(v61 + v51 + v65 + 4), v89.val[1]), vmlaq_f32(vmulq_f32(v89.val[2], *(float32x4_t *)(v61 + v59 + v65 + 8)),
                                                              *(float32x4_t *)(v61 + v54 + v65),
                                                              v89.val[3]))),
                                                        vnegq_f32(*(float32x4_t *)(v57 + v65))));
          }
          v66 += 4;
          v64 += 16;
          v65 += 16;
        }
        while ((v66 | 3u) < a11);
        float32x4_t v68 = &result[v65];
        uint64_t v69 = v61 + v59 + v65 + 12;
        uint64_t v70 = v61 + v51 + v65 + 4;
        uint64_t v71 = v61 + v54 + v65;
        uint64_t v72 = v58 + v65;
        uint64_t v73 = v57 + v65;
        float v74 = &v56[v65];
        uint64_t v75 = v55 + v65;
        unsigned int v76 = a11 & 0xFFFC;
      }
      if (v76 < a11)
      {
        uint64_t v77 = 0;
        unint64_t v78 = (float *)(v64 + 2);
        do
        {
          if (*(_DWORD *)(v75 + v77)) {
            float v79 = -(float)(*(float *)(v73 + v77)
          }
                         * (float)-(float)((float)((float)((float)((float)(*(v78 - 1) * *(float *)(v70 + v77))
                                                                 + (float)(*(v78 - 2) * *(float *)(v69 + v77 + 4)))
                                                         + (float)(*v78 * *(float *)(v69 + v77 - 4)))
                                                 + (float)(v78[1] * *(float *)(v71 + v77)))
                                         - (float)(*(float *)&v74[v77]
                                                 * (float)(*(float *)(v69 + v77) - *(float *)(v72 + v77)))));
          else {
            float v79 = 0.0;
          }
          *(float *)&v68[v77] = v79;
          ++v76;
          v77 += 4;
          v78 += 4;
        }
        while (v76 < a11);
      }
      result += v52;
      v59 += v53;
      v51 += v53;
      v54 += v53;
      v58 += v52;
      v57 += v52;
      v56 += v52;
      v55 += v52;
      uint64_t v60 = v62;
    }
    while (v62 != a12);
  }
  if (a12)
  {
    uint64_t v80 = 0;
    do
    {
      if (a11)
      {
        float v81 = (void *)(a3 + 4 * v80 * a11);
        uint64_t result = (char *)memmove(v81, (const void *)(*(void *)(a1 + 112) + 4 * ++v80 * v15 + 4), 4 * a11);
      }
      else
      {
        ++v80;
      }
    }
    while (v80 != a12);
  }
  return result;
}

uint64_t sub_262EA2FA0(uint64_t a1, uint64_t a2, float32x4_t *a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = a4 >> 1;
  uint64_t v6 = *(float32x4_t **)(a1 + 128);
  __asm { FMOV            V0.4S, #0.375 }
  if (a5)
  {
    uint64_t v12 = 0;
    v13.i64[0] = 0x3E0000003E000000;
    v13.i64[1] = 0x3E0000003E000000;
    do
    {
      uint64_t v14 = &v6->f32[v12 * v5];
      uint64_t v15 = (float *)(a2 + 4 * v12 * a4);
      float v16 = *v15;
      float v17 = v15[2];
      float v19 = v15[1];
      uint64_t v18 = v15 + 1;
      *uint64_t v14 = (float)((float)(v19 * 0.375) + (float)(v16 * 0.5)) + (float)(v17 * 0.125);
      uint64_t v20 = (float32x4_t *)(v14 + 1);
      if (a4 < 0x12)
      {
        int v21 = 0;
      }
      else
      {
        int v21 = 0;
        do
        {
          float32x4_t v22 = v18 + 2;
          float32x4x2_t v77 = vld2q_f32(v18);
          v18 += 8;
          float32x4x2_t v78 = vld2q_f32(v22);
          *v20++ = vaddq_f32(vmlaq_f32(vmulq_f32(v77.val[0], v13), _Q0, v77.val[1]), vmlaq_f32(vmulq_f32(v78.val[0], _Q0), v13, v78.val[1]));
          v21 += 4;
        }
        while ((int)v5 - 8 > v21);
        int v21 = (unsigned __int16)v21;
      }
      while ((int)v5 - 2 > v21)
      {
        float v23 = (float)(v18[1] * 0.375) + (float)(*v18 * 0.125);
        float v24 = v18[3];
        float v25 = v18[2];
        v18 += 2;
        v20->f32[0] = (float)(v23 + (float)(v25 * 0.375)) + (float)(v24 * 0.125);
        uint64_t v20 = (float32x4_t *)((char *)v20 + 4);
        ++v21;
      }
      v20->f32[0] = (float)((float)(v18[1] * 0.375) + (float)(*v18 * 0.125)) + (float)(v18[2] * 0.5);
      ++v12;
    }
    while (v12 != a5);
  }
  signed int v26 = v5 - 3;
  uint64_t v27 = 8 * v5;
  if (a4 < 8)
  {
    unsigned int v28 = 0;
    uint64_t v33 = &v6->f32[v5];
    uint64_t v32 = v6;
    uint64_t v31 = a3;
    uint64_t v34 = &v6->f32[(2 * v5)];
  }
  else
  {
    unsigned int v28 = 0;
    v29.i64[0] = 0x3F0000003F000000;
    v29.i64[1] = 0x3F0000003F000000;
    v30.i64[0] = 0x3E0000003E000000;
    v30.i64[1] = 0x3E0000003E000000;
    uint64_t v31 = a3;
    uint64_t v32 = v6;
    do
    {
      *v31++ = vmlaq_f32(vmlaq_f32(vmulq_f32(*v32, v29), _Q0, *(float32x4_t *)((char *)v32 + 4 * v5)), v30, *(float32x4_t *)((char *)v32 + 8 * v5));
      v28 += 4;
      ++v32;
    }
    while (v26 > (int)v28);
    unsigned int v28 = (unsigned __int16)v28;
    uint64_t v33 = &v32->f32[v5];
    uint64_t v34 = &v32->f32[2 * v5];
  }
  for (uint64_t result = a5 >> 1; v28 < v5; ++v28)
  {
    float v36 = v32->f32[0];
    uint64_t v32 = (float32x4_t *)((char *)v32 + 4);
    float v37 = v36;
    float v38 = *v33++;
    float v39 = v38 * 0.375;
    float v40 = *v34++;
    v31->f32[0] = (float)(v39 + (float)(v37 * 0.5)) + (float)(v40 * 0.125);
    uint64_t v31 = (float32x4_t *)((char *)v31 + 4);
  }
  int v41 = result - 1;
  if (a5 >= 6)
  {
    if (v41 <= 2) {
      uint64_t v42 = 2;
    }
    else {
      uint64_t v42 = v41;
    }
    uint64_t v43 = &a3->i8[4 * v5];
    uint64_t v44 = &v6->i8[4 * v5];
    v45.i64[0] = 0x3E0000003E000000;
    v45.i64[1] = 0x3E0000003E000000;
    uint64_t v46 = (char *)v6 + 12 * v5;
    uint64_t result = 1;
    uint64_t v47 = (char *)v6 + 8 * v5;
    unsigned int v48 = &v6[v5];
    do
    {
      if (a4 < 8)
      {
        unsigned int v50 = 0;
        uint64_t v51 = &a3->f32[result * v5];
        uint64_t v52 = &v6->f32[(2 * result - 1) * v5];
        uint64_t v53 = &v52[v5];
        uint64_t v54 = &v53[v5];
        f32 = &v54[v5];
      }
      else
      {
        unint64_t v49 = 0;
        unsigned int v50 = 0;
        do
        {
          *(float32x4_t *)&v43[v49] = vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)&v44[v49], v45), _Q0, *(float32x4_t *)&v47[v49]), vmlaq_f32(vmulq_f32(*(float32x4_t *)&v46[v49], _Q0), v45, v48[v49 / 0x10]));
          v50 += 4;
          v49 += 16;
        }
        while (v26 > (int)v50);
        unsigned int v50 = (unsigned __int16)v50;
        uint64_t v51 = (float *)&v43[v49];
        uint64_t v52 = (float *)&v44[v49];
        uint64_t v53 = (float *)&v47[v49];
        uint64_t v54 = (float *)&v46[v49];
        f32 = v48[v49 / 0x10].f32;
      }
      while (v50 < v5)
      {
        float v56 = *v52++;
        float v57 = v56;
        float v58 = *v53++;
        float v59 = (float)(v58 * 0.375) + (float)(v57 * 0.125);
        float v60 = *v54++;
        float v61 = v60;
        float v62 = *f32++;
        *v51++ = (float)(v59 + (float)(v61 * 0.375)) + (float)(v62 * 0.125);
        ++v50;
      }
      ++result;
      v43 += 4 * v5;
      v44 += v27;
      v47 += v27;
      v46 += v27;
      unsigned int v48 = (float32x4_t *)((char *)v48 + v27);
    }
    while (result != v42);
  }
  uint64_t v63 = &a3->f32[v41 * (int)v5];
  float v64 = &v6->f32[(int)((a5 - 3) * v5)];
  uint64_t v65 = &v6->f32[(int)((a5 - 2) * v5)];
  int v66 = &v6->f32[(int)((a5 - 1) * v5)];
  if (a4 < 8)
  {
    unsigned int v71 = 0;
  }
  else
  {
    uint64_t v67 = 0;
    signed int v68 = 0;
    v69.i64[0] = 0x3E0000003E000000;
    v69.i64[1] = 0x3E0000003E000000;
    v70.i64[0] = 0x3F0000003F000000;
    v70.i64[1] = 0x3F0000003F000000;
    do
    {
      *(float32x4_t *)&v63[v67] = vmlaq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)&v64[v67], v69), _Q0, *(float32x4_t *)&v65[v67]), v70, *(float32x4_t *)&v66[v67]);
      v68 += 4;
      v67 += 4;
    }
    while (v26 > v68);
    unsigned int v71 = (unsigned __int16)v68;
    uint64_t v63 = (float *)((char *)v63 + v67 * 4);
    float v64 = (float *)((char *)v64 + v67 * 4);
    uint64_t v65 = (float *)((char *)v65 + v67 * 4);
    int v66 = (float *)((char *)v66 + v67 * 4);
  }
  for (; v71 < v5; ++v71)
  {
    float v72 = *v64++;
    float v73 = v72;
    float v74 = *v65++;
    float v75 = v74 * 0.375;
    float v76 = *v66++;
    *v63++ = (float)(v75 + (float)(v73 * 0.125)) + (float)(v76 * 0.5);
  }
  return result;
}

void sub_262EA3354(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 >= 2)
  {
    signed int v5 = 0;
    int v6 = a4 - 1;
    do
    {
      unsigned int v7 = (float32x4_t *)(a2 + 4 * v5 * a4);
      uint64_t v8 = (float32x4_t *)(a2 + 4 * (a4 + v5 * a4));
      uint64_t v9 = (float32x4_t *)(a3 + ((v5 * a4) & 0xFFFFFFFC));
      if (a4 < 8)
      {
        int v15 = 0;
      }
      else
      {
        signed int v10 = 0;
        do
        {
          float32x4_t v11 = *v7;
          float32x4_t v12 = v7[1];
          v7 += 2;
          float32x4_t v13 = *v8;
          float32x4_t v14 = v8[1];
          v8 += 2;
          *v9++ = vminq_f32(vpminq_f32(v11, v12), vpminq_f32(v13, v14));
          v10 += 8;
        }
        while ((int)(a4 - 7) > v10);
        int v15 = a4 & 0xFFF8;
      }
      if (v6 > v15)
      {
        do
        {
          float v16 = v7->f32[0];
          float v17 = v7->f32[1];
          unsigned int v7 = (float32x4_t *)((char *)v7 + 8);
          if (v16 >= v17) {
            float v16 = v17;
          }
          float v18 = v8->f32[0];
          float v19 = v8->f32[1];
          uint64_t v8 = (float32x4_t *)((char *)v8 + 8);
          if (v18 >= v19) {
            float v18 = v19;
          }
          if (v16 >= v18) {
            float v16 = v18;
          }
          v9->f32[0] = v16;
          uint64_t v9 = (float32x4_t *)((char *)v9 + 4);
          v15 += 2;
        }
        while (v6 > (unsigned __int16)v15);
      }
      signed int v5 = (unsigned __int16)(v5 + 2);
    }
    while (v5 < (int)(a5 - 1));
  }
}

void sub_262EA3410(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 >= 2)
  {
    signed int v5 = 0;
    int v6 = a4 - 1;
    do
    {
      unsigned int v7 = (float32x4_t *)(a2 + 4 * v5 * a4);
      uint64_t v8 = (float32x4_t *)(a2 + 4 * (a4 + v5 * a4));
      uint64_t v9 = (float32x4_t *)(a3 + ((v5 * a4) & 0xFFFFFFFC));
      if (a4 < 8)
      {
        int v15 = 0;
      }
      else
      {
        signed int v10 = 0;
        do
        {
          float32x4_t v11 = *v7;
          float32x4_t v12 = v7[1];
          v7 += 2;
          float32x4_t v13 = *v8;
          float32x4_t v14 = v8[1];
          v8 += 2;
          *v9++ = vmaxq_f32(vpmaxq_f32(v11, v12), vpmaxq_f32(v13, v14));
          v10 += 8;
        }
        while ((int)(a4 - 7) > v10);
        int v15 = a4 & 0xFFF8;
      }
      if (v6 > v15)
      {
        do
        {
          float v16 = v7->f32[0];
          float v17 = v7->f32[1];
          unsigned int v7 = (float32x4_t *)((char *)v7 + 8);
          if (v16 <= v17) {
            float v16 = v17;
          }
          float v18 = v8->f32[0];
          float v19 = v8->f32[1];
          uint64_t v8 = (float32x4_t *)((char *)v8 + 8);
          if (v18 <= v19) {
            float v18 = v19;
          }
          if (v16 <= v18) {
            float v16 = v18;
          }
          v9->f32[0] = v16;
          uint64_t v9 = (float32x4_t *)((char *)v9 + 4);
          v15 += 2;
        }
        while (v6 > (unsigned __int16)v15);
      }
      signed int v5 = (unsigned __int16)(v5 + 2);
    }
    while (v5 < (int)(a5 - 1));
  }
}

void sub_262EA34CC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 >= 3)
  {
    signed int v5 = 0;
    int v6 = a4 - 2;
    do
    {
      unsigned int v7 = (const float *)(a2 + 4 * (a4 + v5 * a4));
      uint64_t v8 = (const float *)(a2 + 4 * (v5 + 2) * a4);
      uint64_t v9 = (float *)(a3 + 4 * ((v5 * a4) >> 4));
      if (a4 < 0x10)
      {
        int v11 = 0;
      }
      else
      {
        uint64_t v10 = 0;
        do
        {
          float32x4x4_t v16 = vld4q_f32(v7);
          v7 += 16;
          v16.val[0] = vmaxq_f32(v16.val[1], v16.val[2]);
          *(float32x4x4_t *)((char *)&v16 + 16) = vld4q_f32(v8);
          v8 += 16;
          *(float32x4_t *)&v9[v10] = vmaxq_f32(v16.val[0], vmaxq_f32(v16.val[2], v16.val[3]));
          v10 += 4;
        }
        while ((int)(a4 - 15) > (int)(v10 * 4));
        uint64_t v9 = (float *)((char *)v9 + v10 * 4);
        int v11 = a4 & 0xFFF0;
      }
      if (v6 > v11)
      {
        float32x4_t v12 = (float *)(v7 + 2);
        float32x4_t v13 = (float *)(v8 + 2);
        do
        {
          float v14 = *(v12 - 1);
          if (v14 <= *v12) {
            float v14 = *v12;
          }
          float v15 = *(v13 - 1);
          if (v15 <= *v13) {
            float v15 = *v13;
          }
          if (v14 <= v15) {
            float v14 = v15;
          }
          *v9++ = v14;
          v11 += 4;
          v12 += 4;
          v13 += 4;
        }
        while (v6 > (unsigned __int16)v11);
      }
      signed int v5 = (unsigned __int16)(v5 + 4);
    }
    while (v5 < (int)(a5 - 2));
  }
}

void sub_262EA35A4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 >= 5)
  {
    signed int v5 = 0;
    uint64_t v6 = a2 + 12;
    int v7 = a4 - 1;
    do
    {
      uint64_t v8 = (v5 + 3) * a4;
      uint64_t v9 = (v5 + 4) * a4;
      uint64_t v10 = (float32x2_t *)(a3 + 4 * ((v5 * a4) >> 6));
      if (a4 < 0x10)
      {
        int v14 = 0;
        float32x4_t v13 = (float *)(v6 + 4 * v8);
        float v15 = (float *)(v6 + 4 * v9);
      }
      else
      {
        signed int v11 = 0;
        uint64_t v12 = a2 + 12;
        do
        {
          *v10++ = vpmax_f32(vmax_f32(*(float32x2_t *)(v12 + 4 * v8), *(float32x2_t *)(v12 + 4 * v9)), vmax_f32(*(float32x2_t *)(v12 + 4 * v8 + 32), *(float32x2_t *)(v12 + 4 * v9 + 32)));
          v11 += 16;
          v12 += 64;
        }
        while ((int)(a4 - 15) > v11);
        float32x4_t v13 = (float *)(v12 + 4 * v8);
        int v14 = a4 & 0xFFF0;
        float v15 = (float *)(v12 + 4 * v9);
      }
      if (v7 > v14)
      {
        do
        {
          float v16 = *v13;
          float v17 = v13[1];
          v13 += 8;
          if (v16 <= v17) {
            float v16 = v17;
          }
          float v18 = *v15;
          float v19 = v15[1];
          v15 += 8;
          if (v18 <= v19) {
            float v18 = v19;
          }
          if (v16 <= v18) {
            float v16 = v18;
          }
          v10->f32[0] = v16;
          uint64_t v10 = (float32x2_t *)((char *)v10 + 4);
          v14 += 8;
        }
        while (v7 > (unsigned __int16)v14);
      }
      signed int v5 = (unsigned __int16)(v5 + 8);
    }
    while (v5 < (int)(a5 - 4));
  }
}

void sub_262EA3698(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 >= 2)
  {
    signed int v5 = 0;
    int v6 = a4 - 1;
    do
    {
      int v7 = (const float *)(a2 + 4 * (a4 + v5 * a4));
      uint64_t v8 = (float *)(a3 + ((v5 * a4) & 0xFFFFFFFC));
      if (a4 < 0x10)
      {
        int v10 = 0;
      }
      else
      {
        signed int v9 = 0;
        do
        {
          float32x4x4_t v13 = vld4q_f32(v7);
          v7 += 16;
          v13.val[2] = v13.val[3];
          vst2q_f32(v8, *(float32x4x2_t *)v13.val[1].f32);
          v8 += 8;
          v9 += 16;
        }
        while ((int)(a4 - 15) > v9);
        int v10 = a4 & 0xFFF0;
      }
      if (v6 > v10)
      {
        signed int v11 = (int *)(v7 + 1);
        do
        {
          int v12 = *v11;
          v11 += 2;
          *(_DWORD *)v8++ = v12;
          v10 += 2;
        }
        while (v6 > (unsigned __int16)v10);
      }
      signed int v5 = (unsigned __int16)(v5 + 2);
    }
    while (v5 < (int)(a5 - 1));
  }
}

void sub_262EA372C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  if (a5 >= 2)
  {
    signed int v5 = 0;
    int v6 = a4 - 1;
    do
    {
      int v7 = (const float *)(a2 + 4 * (a4 + v5 * a4));
      uint64_t v8 = (_DWORD *)(a3 + 4 * ((v5 * a4) >> 4));
      if (a4 < 0x10)
      {
        int v10 = 0;
      }
      else
      {
        uint64_t v9 = 0;
        do
        {
          float32x4x4_t v13 = vld4q_f32(v7);
          v7 += 16;
          *(float32x4_t *)&v8[v9] = v13.val[1];
          v9 += 4;
        }
        while ((int)(a4 - 15) > (int)(v9 * 4));
        uint64_t v8 = (_DWORD *)((char *)v8 + v9 * 4);
        int v10 = a4 & 0xFFF0;
      }
      if (v6 > v10)
      {
        signed int v11 = (int *)(v7 + 1);
        do
        {
          int v12 = *v11;
          v11 += 4;
          *v8++ = v12;
          v10 += 4;
        }
        while (v6 > (unsigned __int16)v10);
      }
      signed int v5 = (unsigned __int16)(v5 + 4);
    }
    while (v5 < (int)(a5 - 1));
  }
}

double sub_262EA37C0()
{
  qword_26B425840 = 0;
  qword_26B425848 = 0;
  qword_26B425850 = 0;
  v0 = operator new(0x24uLL);
  qword_26B425848 = (uint64_t)v0 + 36;
  qword_26B425850 = (uint64_t)v0 + 36;
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  _OWORD *v0 = v1;
  v0[1] = v1;
  *((_DWORD *)v0 + 8) = -1;
  qword_26B425840 = (uint64_t)v0;
  word_26B425858 = 771;
  qword_26B4256B0 = 0;
  unk_26B4256B8 = 0;
  qword_26B4256A8 = 0;
  uint64_t v2 = operator new(0x24uLL);
  qword_26B4256B0 = (uint64_t)(v2 + 9);
  unk_26B4256B8 = v2 + 9;
  v2[8] = 0;
  *(_OWORD *)uint64_t v2 = xmmword_262EB98FC;
  *((_OWORD *)v2 + 1) = unk_262EB990C;
  qword_26B4256A8 = (uint64_t)v2;
  word_26B4256C0 = 771;
  qword_26B4258C8 = 0;
  unk_26B4258D0 = 0;
  qword_26B4258C0 = 0;
  uint64_t v3 = operator new(0x64uLL);
  qword_26B4258C8 = (uint64_t)v3 + 100;
  unk_26B4258D0 = (char *)v3 + 100;
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  _OWORD *v3 = v4;
  v3[1] = v4;
  v3[2] = v4;
  v3[3] = v4;
  v3[4] = v4;
  v3[5] = v4;
  *((_DWORD *)v3 + 24) = -1;
  qword_26B4258C0 = (uint64_t)v3;
  word_26B4258D8 = 1285;
  qword_26B425730 = 0;
  unk_26B425738 = 0;
  qword_26B425728 = 0;
  signed int v5 = operator new(0x64uLL);
  qword_26B425730 = (uint64_t)(v5 + 25);
  unk_26B425738 = v5 + 25;
  v5[24] = 0;
  *((_OWORD *)v5 + 2) = xmmword_262EB9940;
  *((_OWORD *)v5 + 3) = unk_262EB9950;
  *((_OWORD *)v5 + 4) = xmmword_262EB9960;
  *((_OWORD *)v5 + 5) = unk_262EB9970;
  *(_OWORD *)signed int v5 = xmmword_262EB9920;
  *((_OWORD *)v5 + 1) = unk_262EB9930;
  qword_26B425728 = (uint64_t)v5;
  word_26B425740 = 1285;
  qword_26B4257A8 = 0;
  unk_26B4257B0 = 0;
  qword_26B4257B8 = 0;
  int v6 = operator new(0xC4uLL);
  qword_26B4257B8 = (uint64_t)(v6 + 49);
  v6[48] = 0;
  *((_OWORD *)v6 + 8) = xmmword_262EB9A04;
  *((_OWORD *)v6 + 9) = unk_262EB9A14;
  *((_OWORD *)v6 + 10) = xmmword_262EB9A24;
  *((_OWORD *)v6 + 11) = unk_262EB9A34;
  *((_OWORD *)v6 + 4) = xmmword_262EB99C4;
  *((_OWORD *)v6 + 5) = unk_262EB99D4;
  *((_OWORD *)v6 + 6) = xmmword_262EB99E4;
  *((_OWORD *)v6 + 7) = unk_262EB99F4;
  *(_OWORD *)int v6 = xmmword_262EB9984;
  *((_OWORD *)v6 + 1) = unk_262EB9994;
  double result = NAN;
  *((_OWORD *)v6 + 2) = xmmword_262EB99A4;
  *((_OWORD *)v6 + 3) = unk_262EB99B4;
  qword_26B4257A8 = (uint64_t)v6;
  unk_26B4257B0 = v6 + 49;
  word_26B4257C0 = 1799;
  return result;
}

void sub_262EA3950(uint64_t a1, int a2, int a3, int a4, float a5, float a6, float a7, float a8)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_DWORD *)(a1 + 8) = a4;
  *(float *)(a1 + 12) = a5;
  *(float *)(a1 + 16) = a6;
  *(float *)(a1 + 20) = a7;
  *(float *)(a1 + 24) = a8;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  operator new[]();
}

void *sub_262EA3B8C(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    MEMORY[0x263E61CF0](v2, 0x1000C8052888210);
    a1[4] = 0;
  }
  uint64_t v3 = a1[5];
  if (v3)
  {
    MEMORY[0x263E61CF0](v3, 0x1000C8052888210);
    a1[5] = 0;
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    MEMORY[0x263E61CF0](v4, 0x1000C8052888210);
    a1[6] = 0;
  }
  uint64_t v5 = a1[9];
  if (v5)
  {
    MEMORY[0x263E61CF0](v5, 0x1000C8052888210);
    a1[9] = 0;
  }
  uint64_t v6 = a1[10];
  if (v6)
  {
    MEMORY[0x263E61CF0](v6, 0x1000C8052888210);
    a1[10] = 0;
  }
  uint64_t v7 = a1[8];
  if (v7)
  {
    MEMORY[0x263E61CF0](v7, 0x1000C80451B5BE8);
    a1[8] = 0;
  }
  uint64_t v8 = a1[7];
  if (v8)
  {
    MEMORY[0x263E61CF0](v8, 0x1000C8052888210);
    a1[7] = 0;
  }
  uint64_t v9 = a1[11];
  if (v9)
  {
    MEMORY[0x263E61CF0](v9, 0x1000C8052888210);
    a1[11] = 0;
  }
  return a1;
}

unsigned int *sub_262EA3CB4(unsigned int *result, uint64_t a2)
{
  uint64_t v3 = result;
  unsigned int v4 = *result;
  uint64_t v5 = result[1] - 4;
  if (v5 >= 4)
  {
    for (uint64_t i = 3; i != v5; ++i)
    {
      unsigned int v7 = 4;
      uint64_t v8 = (_DWORD *)(a2 + 4 * v4 * i);
      do
      {
        *v8++ = *(_DWORD *)(a2 + 4 * v4 * i + 12);
        --v7;
      }
      while (v7 > 1);
    }
    unsigned int v9 = 4 * v4 - 5;
    uint64_t v10 = 3;
    do
    {
      signed int v11 = (_DWORD *)(a2 + 4 + 4 * v9);
      ++v10;
      for (unsigned int j = 5; j > 1; --j)
        *v11++ = *(_DWORD *)(a2 + 4 * (v4 * v10 - 5));
      v9 += v4;
    }
    while (v10 != v5);
  }
  int v13 = 0;
  int v14 = (const void *)(a2 + 12 * v4);
  do
  {
    uint64_t v15 = *v3;
    if (v15) {
      double result = (unsigned int *)memmove((void *)(a2 + 4 * (v15 * v13)), v14, 4 * v15);
    }
    ++v13;
  }
  while (v13 != 3);
  unsigned int v16 = *v3;
  float v17 = (const void *)(a2 + 4 * (v3[1] - 5) * *v3);
  int v18 = -1;
  if (*v3) {
LABEL_15:
  }
    double result = (unsigned int *)memmove((void *)(a2 + 4 * (v18 + v3[1]) * v16), v17, 4 * v16);
  while (v18 != -4)
  {
    unsigned int v16 = *v3;
    --v18;
    if (*v3) {
      goto LABEL_15;
    }
  }
  return result;
}

uint64_t sub_262EA3DE8(unsigned int *a1, int8x16_t *a2, float32x4_t *a3)
{
  unsigned int v4 = a2;
  histogram[256] = *MEMORY[0x263EF8340];
  vImagePixelCount v6 = *a1;
  vImagePixelCount v7 = a1[1];
  uint64_t v8 = (float32x4_t *)((char *)a2 + 4 * (v7 * v6));
  float v9 = 0.0;
  if (v7 * v6)
  {
    uint64_t v10 = (float32x4_t *)a2;
    do
    {
      float32x4_t v11 = *v10++;
      float v12 = vmaxvq_f32(v11);
      if (v9 < v12) {
        float v9 = v12;
      }
    }
    while (v10 < v8);
  }
  else
  {
    uint64_t v10 = (float32x4_t *)a2;
  }
  while (v10 < v8)
  {
    float v13 = v10->f32[0];
    uint64_t v10 = (float32x4_t *)((char *)v10 + 4);
    float v14 = v13;
    if (v9 < v13) {
      float v9 = v14;
    }
  }
  src.data = a2;
  src.height = v7;
  src.width = v6;
  src.rowBytes = 4 * v6;
  vImageHistogramCalculation_PlanarF(&src, histogram, 0x100u, -1.0, v9, 0);
  double v15 = (double)(a1[1] * *a1 - histogram[0]) * 0.05;
  float v16 = 1.0;
  if ((unint64_t)v15)
  {
    unint64_t v17 = 0;
    unint64_t v18 = 1;
    do
    {
      unsigned int v19 = v18 + 1;
      if (v18 > 0xFE) {
        break;
      }
      v17 += histogram[v18++];
    }
    while (v17 < (unint64_t)v15);
    float v16 = (float)v19;
  }
  *(float *)&double v15 = (float)((float)((float)((float)(v9 + 1.0) + 1.0) * v16) * 0.0039062) + -1.0;
  if (*(float *)&v15 >= *((float *)a1 + 3)) {
    LODWORD(v15) = a1[3];
  }
  int32x2_t v31 = *(int32x2_t *)&v15;
  sub_262EA4000(a1, (uint64_t)v4, (uint64_t)a3);
  unsigned int v20 = a1[1] * *a1;
  if (v20 < 4)
  {
    unsigned int v21 = 0;
    __int32 v24 = v31.i32[0];
  }
  else
  {
    unsigned int v21 = 0;
    float32x4_t v22 = (const float *)(a1 + 4);
    float32x4_t v23 = vld1q_dup_f32(v22);
    __int32 v24 = v31.i32[0];
    int8x16_t v25 = (int8x16_t)vdupq_lane_s32(v31, 0);
    do
    {
      float32x4_t v26 = *a3++;
      *unsigned int v4 = vbslq_s8((int8x16_t)vcgtq_f32(v26, v23), v25, *v4);
      ++v4;
      unsigned int v27 = v21 + 7;
      v21 += 4;
      unsigned int v20 = a1[1] * *a1;
    }
    while (v27 < v20);
  }
  BOOL v28 = v20 >= v21;
  unsigned int v29 = v20 - v21;
  if (v29 != 0 && v28)
  {
    do
    {
      if (a3->f32[0] > *((float *)a1 + 4)) {
        v4->i32[0] = v24;
      }
      unsigned int v4 = (int8x16_t *)((char *)v4 + 4);
      a3 = (float32x4_t *)((char *)a3 + 4);
      --v29;
    }
    while (v29);
  }
  return 1;
}

uint64_t sub_262EA4000(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  if (a1[1])
  {
    unsigned int v3 = 0;
    unsigned int v4 = *a1;
    __asm { FMOV            V0.4S, #-1.0 }
    int8x16_t v10 = (int8x16_t)vdupq_n_s32(0x65A96816u);
    do
    {
      float32x4_t v11 = (float32x4_t *)(a2 + 4 * v4 * v3);
      float v12 = (int8x16_t *)(a3 + 4 * v4 * v3);
      if (v4 < 4)
      {
        unsigned int v13 = 0;
      }
      else
      {
        unsigned int v13 = 0;
        do
        {
          float32x4_t v14 = *v11++;
          *v12++ = vandq_s8(v10, (int8x16_t)vcgeq_f32(_Q0, v14));
          unsigned int v15 = v13 + 7;
          v13 += 4;
          unsigned int v4 = *a1;
        }
        while (v15 < *a1);
      }
      _CF = v4 >= v13;
      unsigned int v16 = v4 - v13;
      if (v16 != 0 && _CF)
      {
        do
        {
          float v17 = v11->f32[0];
          float32x4_t v11 = (float32x4_t *)((char *)v11 + 4);
          if ((float)(v17 + 1.0) == 0.0) {
            float v18 = 1.0e23;
          }
          else {
            float v18 = 0.0;
          }
          *(float *)v12->i32 = v18;
          float v12 = (int8x16_t *)((char *)v12 + 4);
          --v16;
        }
        while (v16);
      }
      ++v3;
    }
    while (v3 < a1[1]);
  }
  return sub_262EA40B0((uint64_t)a1, a3);
}

uint64_t sub_262EA40B0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 64);
  int v3 = *(_DWORD *)result;
  unint64_t v4 = *(unsigned int *)(result + 4);
  if (*(_DWORD *)result)
  {
    unsigned int v5 = 0;
    vImagePixelCount v6 = *(_DWORD **)(result + 56);
    do
    {
      unint64_t v7 = v4;
      unsigned int v8 = v5;
      float v9 = v6;
      if (v4)
      {
        do
        {
          *v9++ = *(_DWORD *)(a2 + 4 * v8);
          v8 += v3;
          --v7;
        }
        while (v7);
        unint64_t v7 = 0;
        while (*(float *)&v6[v7] > 1.0)
        {
          if (v4 == ++v7) {
            goto LABEL_20;
          }
        }
        unint64_t v7 = v7;
      }
      if (v7 < v4)
      {
        int v10 = 0;
        int v11 = -1;
        unint64_t v12 = v7;
        do
        {
          if (*(float *)&v6[v12] <= 1.0)
          {
            if ((int)v12 >= 1)
            {
              int v13 = 1;
              int v14 = v11;
              do
              {
                uint64_t v15 = (v7 + v14);
                float v16 = (float)(v13 * v13);
                if (*(float *)&v6[v15] <= v16) {
                  break;
                }
                *(float *)&v6[v15] = v16;
                --v14;
                ++v13;
              }
              while ((int)v7 + v14 + 2 > 1);
            }
            int v10 = 0;
          }
          else
          {
            ++v10;
            *(float *)&v6[v12] = (float)(v10 * v10);
          }
          ++v12;
          ++v11;
        }
        while (v4 != v12);
      }
LABEL_20:
      unint64_t v17 = v4;
      float v18 = v6;
      for (unsigned int i = v5; v17; --v17)
      {
        int v20 = *v18++;
        *(_DWORD *)(a2 + 4 * i) = v20;
        i += v3;
      }
      ++v5;
    }
    while (v5 != v3);
  }
  if (v4)
  {
    unsigned int v21 = 0;
    do
    {
      unsigned int v22 = v3 * v21;
      uint64_t v23 = a2 + 4 * v3 * v21;
      int8x16_t v25 = *(_DWORD **)(result + 72);
      __int32 v24 = *(float **)(result + 80);
      uint64_t v26 = *(void *)(result + 64);
      _DWORD *v25 = 0;
      *(void *)__int32 v24 = 0x65A96816E5A96816;
      if (v3 < 2) {
        goto LABEL_39;
      }
      uint64_t v27 = 0;
      int v28 = 0;
      float v29 = -1.0e23;
      for (uint64_t j = 1; j != v3; ++j)
      {
        uint64_t v31 = v27 + 1;
        float v32 = *(float *)(v23 + 4 * j) + (float)(v31 * v31);
        float v33 = (float)(v27 + 1);
        float v34 = v32 - (float)(*(float *)(v23 + 4 * v27) + (float)(v27 * v27));
        float v35 = v29 + v29;
        float v36 = v33 - (float)(int)v27;
        if (v34 <= (float)(v35 * v36))
        {
          float v37 = &v24[v28 - 1];
          float v38 = &v25[v28 - 1];
          do
          {
            uint64_t v40 = *v38--;
            int v39 = v40;
            float v34 = v32 - (float)(*(float *)(v23 + 4 * v40) + (float)(v39 * v39));
            *(float *)&uint64_t v40 = *v37--;
            float v36 = v33 - (float)v39;
            --v28;
          }
          while (v34 <= (float)(v36 * (float)(*(float *)&v40 + *(float *)&v40)));
        }
        float v29 = v34 / (float)(v36 + v36);
        uint64_t v41 = v28 + 1;
        v25[v41] = v31;
        v24[v41] = v29;
        v24[v28 + 2] = 1.0e23;
        uint64_t v27 = v31;
        ++v28;
      }
      if (v3 < 4)
      {
LABEL_39:
        uint64_t v43 = 0;
        LODWORD(v42) = 0;
      }
      else
      {
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        int v44 = 3;
        do
        {
          int v45 = 0;
          v46.i32[0] = v42;
          v46.i32[1] = v42 | 1;
          v46.i32[2] = v42 | 2;
          v46.i32[3] = v44;
          float32x4_t v47 = 0uLL;
          do
          {
            uint64_t v48 = (int)v43;
            uint64_t v49 = (v43 << 32) - 0x100000000;
            do
            {
              uint64_t v50 = v48 + 1;
              float v51 = v24[v48 + 1];
              v49 += 0x100000000;
              ++v48;
            }
            while (v51 < (float)(v45 + v42));
            uint64_t v52 = *(int *)((char *)v25 + (v49 >> 30));
            int32x4_t v71 = v46;
            *(_DWORD *)((unint64_t)&v71 & 0xFFFFFFFFFFFFFFF3 | (4 * (v45 & 3))) -= v52;
            int32x4_t v46 = v71;
            int v53 = *(_DWORD *)(v23 + 4 * v52);
            float32x4_t v72 = v47;
            *(_DWORD *)((unint64_t)&v72 & 0xFFFFFFFFFFFFFFF3 | (4 * (v45 & 3))) = v53;
            float32x4_t v47 = v72;
            ++v45;
            uint64_t v43 = v50 - 1;
          }
          while (v45 != 4);
          float32x4_t v54 = vcvtq_f32_s32(v46);
          *(float32x4_t *)(v26 + 4 * v42) = vmlaq_f32(v72, v54, v54);
          v42 += 4;
          int v44 = v42 | 3;
        }
        while ((v42 | 3uLL) < v3);
      }
      if ((int)v42 < v3)
      {
        uint64_t v55 = v42;
        float v56 = (char *)(v24 + 1);
        do
        {
          uint64_t v57 = (int)v43;
          uint64_t v58 = (v43 << 32) - 0x100000000;
          do
          {
            uint64_t v59 = v57 + 1;
            float v60 = *(float *)&v56[4 * v57];
            v58 += 0x100000000;
            ++v57;
          }
          while (v60 < (float)(int)v55);
          *(float *)(v26 + 4 * v55) = *(float *)(v23 + 4 * *(int *)((char *)v25 + (v58 >> 30)))
                                    + (float)((v55 - *(_DWORD *)((char *)v25 + (v58 >> 30)))
                                            * (v55 - *(_DWORD *)((char *)v25 + (v58 >> 30))));
          ++v55;
          uint64_t v43 = v59 - 1;
        }
        while (v55 != v3);
      }
      int v3 = *(_DWORD *)result;
      if (*(_DWORD *)result < 4u)
      {
        unsigned int v61 = 0;
      }
      else
      {
        unsigned int v61 = 0;
        do
        {
          uint64_t v62 = 4 * v61;
          float32x4_t v63 = *(float32x4_t *)(v2 + v62);
          float32x4_t v64 = vrsqrteq_f32(v63);
          float32x4_t v65 = vmulq_f32(v64, vrsqrtsq_f32(vmulq_f32(v63, v64), v64));
          *(int8x16_t *)(v23 + v62) = vbicq_s8((int8x16_t)vmulq_f32(v63, vmulq_f32(vrsqrtsq_f32(vmulq_f32(v63, v65), v65), v65)), (int8x16_t)vclezq_f32(v63));
          unsigned int v66 = v61 + 7;
          v61 += 4;
          int v3 = *(_DWORD *)result;
        }
        while (v66 < *(_DWORD *)result);
      }
      if (v61 < v3)
      {
        uint64_t v67 = (float *)(v2 + 4 * v61);
        signed int v68 = (float *)(a2 + 4 * v61 + 4 * v22);
        unint64_t v69 = v3 - (unint64_t)v61;
        do
        {
          float v70 = *v67++;
          *v68++ = sqrtf(v70);
          --v69;
        }
        while (v69);
      }
      ++v21;
    }
    while (v21 < *(_DWORD *)(result + 4));
  }
  return result;
}

void sub_262EA44F8()
{
}

uint64_t sub_262EA4608(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(result + 8))
  {
    sub_262EA4C58(a2, *(_DWORD *)result, *(void *)(result + 32), *(_DWORD *)(result + 4) + 4, *(_DWORD *)result + 4);
    sub_262EA44F8();
  }
  return result;
}

void *sub_262EA4C58(uint64_t a1, unsigned int a2, uint64_t a3, int a4, unsigned int a5)
{
  unsigned int v5 = a5;
  uint64_t v6 = 0;
  size_t v7 = 4 * a2;
  uint64_t v8 = a5 - 5;
  uint64_t v9 = a5 - 1;
  uint64_t v10 = a5 - 4;
  uint64_t v11 = a5 - 2;
  char v12 = 1;
  uint64_t v13 = a5;
  unsigned int v33 = a2;
  do
  {
    char v14 = v12;
    uint64_t v15 = a3 + 4 * v6 * v13;
    uint64_t v16 = a1;
    size_t v17 = v7;
    uint64_t v18 = v8;
    uint64_t v19 = v9;
    uint64_t v20 = v10;
    uint64_t v21 = v11;
    memcpy((void *)(v15 + 8), (const void *)(a1 + 4 * (2 - v6) * a2), v7);
    uint64_t v11 = v21;
    uint64_t v10 = v20;
    uint64_t v9 = v19;
    uint64_t v8 = v18;
    size_t v7 = v17;
    a1 = v16;
    a2 = v33;
    char v12 = 0;
    *(int32x2_t *)uint64_t v15 = vrev64_s32(*(int32x2_t *)(v15 + 12));
    *(_DWORD *)(v15 + 4 * v19) = *(_DWORD *)(v15 + 4 * v18);
    *(_DWORD *)(v15 + 4 * v21) = *(_DWORD *)(v15 + 4 * v20);
    uint64_t v6 = 1;
  }
  while ((v14 & 1) != 0);
  uint64_t v29 = v13;
  uint64_t v30 = (a4 - 2);
  uint64_t v22 = a3;
  if (v30 >= 3)
  {
    unsigned int v23 = 0;
    unsigned int v24 = 2 * v5;
    uint64_t v25 = v30 - 2;
    unsigned int v32 = v5;
    do
    {
      uint64_t v26 = v22 + 4 * v24;
      memcpy((void *)(v26 + 8), (const void *)(a1 + 4 * v23), v17);
      a1 = v16;
      *(int32x2_t *)uint64_t v26 = vrev64_s32(*(int32x2_t *)(v26 + 12));
      *(_DWORD *)(v26 + 4 * v19) = *(_DWORD *)(v26 + 4 * v18);
      uint64_t v22 = a3;
      *(_DWORD *)(v26 + 4 * v21) = *(_DWORD *)(v26 + 4 * v20);
      unsigned int v5 = v32;
      v24 += v32;
      v23 += v33;
      --v25;
    }
    while (v25);
  }
  uint64_t v27 = v22;
  memcpy((void *)(v22 + 4 * (a4 - 1) * v5), (const void *)(v22 + 4 * (a4 - 5) * v5), 4 * v29);

  return memcpy((void *)(v27 + 4 * v30 * v5), (const void *)(v27 + 4 * (a4 - 4) * v5), 4 * v29);
}

_DWORD *sub_262EA4E34(_DWORD *result, float *a2, float *a3, float a4, float a5, float a6)
{
  if ((float)(a5 - a4) <= 1.0) {
    sub_262EB4C24();
  }
  unsigned int v6 = result[1] * *result;
  if (v6)
  {
    size_t v7 = &a2[v6];
    do
    {
      float v8 = *a3;
      if (*a3 <= a4)
      {
        float v10 = *a2;
        float v12 = 0.0;
      }
      else
      {
        if (v8 >= a5)
        {
          float v10 = *a2;
          float v11 = 1.0 - *a2;
        }
        else
        {
          float v9 = (float)(1.0 / (float)(a5 - a4)) * (float)(v8 - a4);
          float v10 = *a2;
          float v11 = v9 * (float)(1.0 - *a2);
        }
        float v12 = v11 * a6;
      }
      *a2++ = v12 + v10;
      ++a3;
    }
    while (a2 < v7);
  }
  return result;
}

void *sub_262EA4ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(int8x16_t **)(a1 + 32);
  double result = sub_262EA4C58(a3, *(_DWORD *)a1, (uint64_t)v6, *(_DWORD *)(a1 + 4) + 4, *(_DWORD *)a1 + 4);
  unsigned int v8 = (*(_DWORD *)a1 + 4) * (*(_DWORD *)(a1 + 4) + 4);
  unint64_t v9 = (unint64_t)v6 + 4 * v8;
  if (v8 >= 4)
  {
    __asm { FMOV            V0.4S, #-1.0 }
    uint64_t v15 = (float32x4_t *)v6;
    do
    {
      float32x4_t v16 = *v15++;
      *unsigned int v6 = vbicq_s8((int8x16_t)v16, (int8x16_t)vcgeq_f32(_Q0, v16));
      _CF = (unint64_t)&v6[1].u64[1] + 4 >= v9;
      unsigned int v6 = (int8x16_t *)v15;
    }
    while (!_CF);
    unsigned int v6 = (int8x16_t *)v15;
  }
  for (; (unint64_t)v6 < v9; unsigned int v6 = (int8x16_t *)((char *)v6 + 4))
  {
    if ((float)(*(float *)v6->i32 + 1.0) == 0.0) {
      v6->i32[0] = 0;
    }
  }
  if (*(_DWORD *)(a1 + 4))
  {
    unsigned int v17 = 0;
    unsigned int v18 = *(_DWORD *)a1;
    __asm
    {
      FMOV            V0.4S, #-1.0
      FMOV            V1.4S, #1.0
    }
    do
    {
      unsigned int v21 = v18 * v17;
      if (v18 < 4)
      {
        unsigned int v22 = 0;
      }
      else
      {
        unsigned int v22 = 0;
        do
        {
          *(int8x16_t *)(a2 + 4 * v21 + 4 * v22) = vbicq_s8(_Q1, (int8x16_t)vcgeq_f32(_Q0, *(float32x4_t *)(a3 + 4 * v21 + 4 * v22)));
          unsigned int v23 = v22 + 7;
          v22 += 4;
          unsigned int v18 = *(_DWORD *)a1;
        }
        while (v23 < *(_DWORD *)a1);
      }
      if (v22 < v18)
      {
        uint64_t v24 = 4 * v22 + 4 * v21;
        uint64_t v25 = (float *)(a3 + v24);
        uint64_t v26 = (float *)(a2 + v24);
        unint64_t v27 = v18 - (unint64_t)v22;
        do
        {
          float v28 = *v25++;
          if ((float)(v28 + 1.0) == 0.0) {
            float v29 = 0.0;
          }
          else {
            float v29 = 1.0;
          }
          *v26++ = v29;
          --v27;
        }
        while (v27);
      }
      ++v17;
    }
    while (v17 < *(_DWORD *)(a1 + 4));
  }
  return result;
}

uint64_t sub_262EA88E8()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EA891C(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262EADE1C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = 0;
  int v2 = *(_DWORD *)(a2 + 4);
  *(_WORD *)(a1 + 4) = *(_DWORD *)a2;
  *(_WORD *)(a1 + 6) = v2;
  *(unsigned char *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 12);
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 28) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 60);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 66);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 67);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 68);
  int v3 = *(_DWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 184) = 0u;
  *(_DWORD *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(void *)(a1 + 168) = 0;
  *(unsigned char *)(a1 + 176) = 1;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  operator new[]();
}

void sub_262EAE188(_Unwind_Exception *a1)
{
  MEMORY[0x263E61D10](v1, 0x1090C408851B61ELL);
  _Unwind_Resume(a1);
}

void *sub_262EAE1FC(void *a1)
{
  uint64_t v2 = a1[15];
  if (v2)
  {
    MEMORY[0x263E61CF0](v2, 0x1000C8052888210);
    a1[15] = 0;
  }
  uint64_t v3 = a1[16];
  if (v3)
  {
    MEMORY[0x263E61CF0](v3, 0x1000C8052888210);
    a1[16] = 0;
  }
  uint64_t v4 = a1[17];
  if (v4)
  {
    MEMORY[0x263E61CF0](v4, 0x1000C8052888210);
    a1[17] = 0;
  }
  uint64_t v5 = a1[18];
  if (v5)
  {
    MEMORY[0x263E61CF0](v5, 0x1000C8052888210);
    a1[18] = 0;
  }
  uint64_t v6 = a1[19];
  if (v6)
  {
    MEMORY[0x263E61CF0](v6, 0x1000C8052888210);
    a1[19] = 0;
  }
  uint64_t v7 = a1[20];
  if (v7)
  {
    MEMORY[0x263E61CF0](v7, 0x1000C8052888210);
    a1[20] = 0;
  }
  uint64_t v8 = a1[21];
  if (v8)
  {
    MEMORY[0x263E61CF0](v8, 0x1000C8052888210);
    a1[21] = 0;
  }
  uint64_t v9 = (void *)a1[11];
  if (v9)
  {
    uint64_t v10 = sub_262EA3CB0(v9);
    MEMORY[0x263E61D10](v10, 0x1090C406EB7B2EALL);
    a1[11] = 0;
  }
  uint64_t v11 = (void *)a1[12];
  if (v11)
  {
    float v12 = sub_262E9A56C(v11);
    MEMORY[0x263E61D10](v12, 0x1080C40583CFBB1);
    a1[12] = 0;
  }
  if (a1[13])
  {
    uint64_t v13 = sub_262E95644();
    MEMORY[0x263E61D10](v13, 0x1010C40198E3B44);
    a1[13] = 0;
  }
  uint64_t v14 = a1[14];
  if (v14)
  {
    uint64_t v15 = sub_262EA1BB0(v14);
    MEMORY[0x263E61D10](v15, 0x1090C408851B61ELL);
    a1[14] = 0;
  }
  return a1;
}

uint64_t sub_262EAE394(uint64_t a1, const void *a2, int8x16_t *a3)
{
  if (*(unsigned char *)(a1 + 9))
  {
    uint64_t v6 = MEMORY[0x263E61C10]();
    uint64_t v7 = sub_262EA3CB4(*(unsigned int **)(a1 + 88), (uint64_t)a3);
    *(void *)(a1 + 192) += MEMORY[0x263E61C10](v7) - v6;
  }
  uint64_t v8 = MEMORY[0x263E61C10]();
  uint64_t v9 = sub_262EA3DE8(*(unsigned int **)(a1 + 88), a3, *(float32x4_t **)(a1 + 144));
  *(void *)(a1 + 200) += MEMORY[0x263E61C10](v9) - v8;
  uint64_t v10 = MEMORY[0x263E61C10]();
  sub_262EA4608(*(void *)(a1 + 88), (uint64_t)a2);
  uint64_t v11 = sub_262EA4E34(*(_DWORD **)(a1 + 88), *(float **)(a1 + 160), *(float **)(a1 + 144), 3.0, 10.0, 0.2);
  *(void *)(a1 + 216) += MEMORY[0x263E61C10](v11) - v10;
  uint64_t v12 = MEMORY[0x263E61C10]();
  uint64_t v13 = sub_262EA4ECC(*(void *)(a1 + 88), *(void *)(a1 + 136), (uint64_t)a3);
  *(void *)(a1 + 224) += MEMORY[0x263E61C10](v13) - v12;
  if (*(unsigned char *)(a1 + 36))
  {
    uint64_t v14 = (void *)MEMORY[0x263E61C10]();
    uint64_t v15 = v14;
    if (*(_DWORD *)a1)
    {
      sub_262E9A570(*(void *)(a1 + 96), (uint64_t)a3, (uint64_t)a2, *(void *)(a1 + 64), *(void *)(a1 + 136));
    }
    else
    {
      int v16 = *(unsigned __int16 *)(a1 + 6);
      if (v16 * *(unsigned __int16 *)(a1 + 4)) {
        uint64_t v14 = memmove(*(void **)(a1 + 168), a3, 4 * v16 * *(unsigned __int16 *)(a1 + 4));
      }
    }
    *(void *)(a1 + 232) += MEMORY[0x263E61C10](v14) - (void)v15;
  }
  uint64_t v17 = MEMORY[0x263E61C10]();
  uint64_t v19 = *(unsigned __int16 **)(a1 + 104);
  if (*(unsigned char *)(a1 + 72))
  {
    v18.i32[0] = -1.0;
    uint64_t v20 = sub_262E95648(v19, (float32x4_t *)a3, v18);
    if (*(unsigned char *)(a1 + 74)) {
      uint64_t v20 = sub_262E9585C(*(unsigned __int16 **)(a1 + 104), *(float **)(a1 + 160), *(float *)(a1 + 76));
    }
    if (*(unsigned char *)(a1 + 73))
    {
      memset(__p, 0, sizeof(__p));
      sub_262EAE6B0(__p, (const void *)qword_26B425748, qword_26B425750, (qword_26B425750 - qword_26B425748) >> 2);
      __int16 v29 = word_26B425760;
      sub_262E9568C();
    }
  }
  else
  {
    uint64_t v20 = (void *)sub_262E95890((uint64_t)v19);
    if (*(unsigned __int16 *)(a1 + 6) * *(unsigned __int16 *)(a1 + 4)) {
      uint64_t v20 = memset(v20, 255, 4 * *(unsigned __int16 *)(a1 + 4) * (unint64_t)*(unsigned __int16 *)(a1 + 6));
    }
  }
  unsigned int v21 = (char *)MEMORY[0x263E61C10](v20);
  *(void *)(a1 + 208) += &v21[-v17];
  if (*(unsigned char *)(a1 + 176)) {
    unsigned int v21 = (char *)memcpy(*(void **)(a1 + 152), a3, 4 * *(unsigned __int16 *)(a1 + 4) * (unint64_t)*(unsigned __int16 *)(a1 + 6));
  }
  uint64_t v22 = MEMORY[0x263E61C10](v21);
  unsigned int v23 = *(unsigned __int16 **)(a1 + 112);
  uint64_t v24 = (const void *)sub_262E95890(*(void *)(a1 + 104));
  sub_262EA1BB4(v23, a3, a3, v24, *(const void **)(a1 + 160), *(void *)(a1 + 144), 0.4, *(float *)(a1 + 20));
  uint64_t result = MEMORY[0x263E61C10]();
  *(void *)(a1 + 264) += result - v22;
  if (*(unsigned char *)(a1 + 36))
  {
    uint64_t v26 = MEMORY[0x263E61C10]();
    unint64_t v27 = sub_262E9A99C(*(void ***)(a1 + 96), a2, a3, *(const void **)(a1 + 136));
    uint64_t result = MEMORY[0x263E61C10](v27);
    *(void *)(a1 + 272) += result - v26;
  }
  ++*(_DWORD *)a1;
  return result;
}

void sub_262EAE694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_262EAE6B0(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_262EAE72C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_262EAE710(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_262EAE72C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_262E95898();
  }
  uint64_t result = (char *)sub_262E958B0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

double sub_262EAE770()
{
  qword_26B425860 = 0;
  qword_26B425868 = 0;
  qword_26B425870 = 0;
  v0 = operator new(0x24uLL);
  qword_26B425868 = (uint64_t)v0 + 36;
  qword_26B425870 = (uint64_t)v0 + 36;
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  _OWORD *v0 = v1;
  v0[1] = v1;
  *((_DWORD *)v0 + 8) = -1;
  qword_26B425860 = (uint64_t)v0;
  word_26B425878 = 771;
  qword_26B4256D0 = 0;
  unk_26B4256D8 = 0;
  qword_26B4256C8 = 0;
  uint64_t v2 = operator new(0x24uLL);
  qword_26B4256D0 = (uint64_t)(v2 + 9);
  unk_26B4256D8 = v2 + 9;
  v2[8] = 0;
  *(_OWORD *)uint64_t v2 = xmmword_262EB9AD0;
  *((_OWORD *)v2 + 1) = unk_262EB9AE0;
  qword_26B4256C8 = (uint64_t)v2;
  word_26B4256E0 = 771;
  qword_26B4258E8 = 0;
  unk_26B4258F0 = 0;
  qword_26B4258E0 = 0;
  uint64_t v3 = operator new(0x64uLL);
  qword_26B4258E8 = (uint64_t)v3 + 100;
  unk_26B4258F0 = (char *)v3 + 100;
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  _OWORD *v3 = v4;
  v3[1] = v4;
  v3[2] = v4;
  v3[3] = v4;
  v3[4] = v4;
  v3[5] = v4;
  *((_DWORD *)v3 + 24) = -1;
  qword_26B4258E0 = (uint64_t)v3;
  word_26B4258F8 = 1285;
  qword_26B425750 = 0;
  unk_26B425758 = 0;
  qword_26B425748 = 0;
  uint64_t v5 = operator new(0x64uLL);
  qword_26B425750 = (uint64_t)(v5 + 25);
  unk_26B425758 = v5 + 25;
  v5[24] = 0;
  *((_OWORD *)v5 + 2) = xmmword_262EB9B14;
  *((_OWORD *)v5 + 3) = unk_262EB9B24;
  *((_OWORD *)v5 + 4) = xmmword_262EB9B34;
  *((_OWORD *)v5 + 5) = unk_262EB9B44;
  *(_OWORD *)uint64_t v5 = xmmword_262EB9AF4;
  *((_OWORD *)v5 + 1) = *(_OWORD *)algn_262EB9B04;
  qword_26B425748 = (uint64_t)v5;
  word_26B425760 = 1285;
  qword_26B4257C8 = 0;
  unk_26B4257D0 = 0;
  qword_26B4257D8 = 0;
  uint64_t v6 = operator new(0xC4uLL);
  qword_26B4257D8 = (uint64_t)(v6 + 49);
  v6[48] = 0;
  *((_OWORD *)v6 + 8) = xmmword_262EB9BD8;
  *((_OWORD *)v6 + 9) = unk_262EB9BE8;
  *((_OWORD *)v6 + 10) = xmmword_262EB9BF8;
  *((_OWORD *)v6 + 11) = unk_262EB9C08;
  *((_OWORD *)v6 + 4) = xmmword_262EB9B98;
  *((_OWORD *)v6 + 5) = unk_262EB9BA8;
  *((_OWORD *)v6 + 6) = xmmword_262EB9BB8;
  *((_OWORD *)v6 + 7) = unk_262EB9BC8;
  *(_OWORD *)uint64_t v6 = xmmword_262EB9B58;
  *((_OWORD *)v6 + 1) = unk_262EB9B68;
  double result = NAN;
  *((_OWORD *)v6 + 2) = xmmword_262EB9B78;
  *((_OWORD *)v6 + 3) = unk_262EB9B88;
  qword_26B4257C8 = (uint64_t)v6;
  unk_26B4257D0 = v6 + 49;
  word_26B4257E0 = 1799;
  return result;
}

unint64_t sub_262EAE900(uint64_t a1, int a2)
{
  unint64_t result = *(unsigned __int8 *)(a1 + a2 - 1);
  uint64_t v4 = (a2 - 2);
  if (a2 >= 2)
  {
    do
      unint64_t result = *(unsigned __int8 *)(a1 + v4--) | (result << 8);
    while (v4 != -1);
  }
  return result;
}

uint64_t sub_262EAE92C(uint64_t a1, unsigned int a2, int a3)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a1;
  unsigned int v3 = *((unsigned __int8 *)v5 + a2) + a3;
  if (v3 > 0xFF) {
    return -1;
  }
  *((unsigned char *)v5 + a2) = v3;
  return v5[0];
}

unint64_t sub_262EAE968(int a1)
{
  return ((unint64_t)(a1 & 0x80) << 49) | ((((unint64_t)(a1 & 0x40) >> 6) & 1) << 48) | ((((unint64_t)(a1 & 0x20) >> 5) & 1) << 40) | ((((unint64_t)(a1 & 0x10) >> 4) & 1) << 32) | (a1 << 21) & 0x1000000 | (unint64_t)((a1 << 14) & 0x10000) | (a1 << 7) & 0x100 | (unint64_t)(a1 & 1);
}

uint64_t sub_262EAF704()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EAF738(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262EAFD84()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EAFDB8(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262EB06DC()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EB0710(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262EB1088()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EB10BC(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262EB1618()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EB164C(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262EB1DF4()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EB1E28(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262EB2A70()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262EB2AA4(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void *sub_262EB3EB0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = sub_262E95B3C(a1, a2, a3, a4, 5, a5);
  *uint64_t result = &unk_270E22510;
  return result;
}

void sub_262EB3EF0(uint64_t a1)
{
  sub_262E95BB4(a1);

  JUMPOUT(0x263E61D10);
}

void sub_262EB3F28(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8)
{
  if ((a6 & 3) != 0) {
    sub_262EB4C50();
  }
  if (a7 < a8)
  {
    uint64_t v8 = 0;
    unint64_t v9 = a6 >> 2;
    unint64_t v10 = (a4 - 5) / 6;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    uint64_t v11 = v9 * (3 * a7 + 2);
    uint64_t v12 = a3 + 4 * v11 + 12;
    uint64_t v13 = a2 + 4 * v11 + 20;
    unint64_t v14 = v9 + v9 * 3 * a7;
    uint64_t v15 = a3 + 4 * v14 + 12;
    uint64_t v16 = a2 + 4 * v14 + 20;
    uint64_t v17 = 12 * v9 * a7;
    uint64_t v18 = v17 + a3 + 12;
    uint64_t v19 = v17 + a2 + 20;
    do
    {
      uint64_t v20 = 3 * a7 * v9;
      unsigned int v21 = (float *)(a2 + 4 * v20);
      uint64_t v22 = (float *)(a3 + 4 * v20);
      unint64_t v23 = v9 + v20;
      uint64_t v24 = (float *)(a2 + 4 * v23);
      uint64_t v25 = (float *)(a3 + 4 * v23);
      uint64_t v26 = (3 * a7 + 2) * v9;
      unint64_t v27 = (float *)(a2 + 4 * v26);
      float v28 = (float *)(a3 + 4 * v26);
      float v29 = *v21;
      float v30 = v21[1];
      float v31 = v21[2];
      float v32 = v21[3];
      float v33 = v21[4];
      float v34 = *v24;
      float v35 = v24[1];
      float v36 = v24[2];
      float v37 = v24[3];
      float v38 = v24[4];
      float v39 = *v27;
      float v40 = v27[1];
      float v41 = v27[2];
      float v42 = v27[3];
      float v43 = v27[4];
      float v44 = (float)((float)(*v21 + v30) + v31) + 0.0;
      float *v22 = v44;
      float v45 = (float)((float)(v34 + v35) + v36) + 0.0;
      float *v25 = v45;
      float v46 = (float)((float)(v39 + v40) + v41) + 0.0;
      float *v28 = v46;
      float v47 = v32 + v44;
      v22[1] = v47;
      float v48 = v37 + v45;
      v25[1] = v48;
      float v49 = v42 + v46;
      v28[1] = v49;
      float v50 = v33 + v47;
      v22[2] = v50;
      float v51 = v38 + v48;
      v25[2] = v51;
      float v52 = v43 + v49;
      v28[2] = v52;
      if (a4 - 5 >= 6)
      {
        uint64_t v59 = v8;
        unint64_t v60 = v10;
        do
        {
          unsigned int v61 = (float *)(v12 + v59);
          uint64_t v62 = (float *)(v15 + v59);
          float32x4_t v63 = (float *)(v18 + v59);
          float v64 = *(float *)(v19 + v59);
          float v65 = *(float *)(v16 + v59);
          float v66 = *(float *)(v13 + v59);
          float v67 = (float)(v50 - v29) + v64;
          float v68 = (float)(v51 - v34) + v65;
          float v69 = (float)(v52 - v39) + v66;
          *float32x4_t v63 = v67;
          *uint64_t v62 = v68;
          *unsigned int v61 = v69;
          float v29 = *(float *)(v19 + v59 + 4);
          float v34 = *(float *)(v16 + v59 + 4);
          float v39 = *(float *)(v13 + v59 + 4);
          float v70 = (float)(v67 - v30) + v29;
          float v71 = (float)(v68 - v35) + v34;
          float v72 = (float)(v69 - v40) + v39;
          v63[1] = v70;
          v62[1] = v71;
          v61[1] = v72;
          float v30 = *(float *)(v19 + v59 + 8);
          float v35 = *(float *)(v16 + v59 + 8);
          float v40 = *(float *)(v13 + v59 + 8);
          float v73 = (float)(v70 - v31) + v30;
          float v74 = (float)(v71 - v36) + v35;
          float v75 = (float)(v72 - v41) + v40;
          v63[2] = v73;
          v62[2] = v74;
          v61[2] = v75;
          float v31 = *(float *)(v19 + v59 + 12);
          float v36 = *(float *)(v16 + v59 + 12);
          float v41 = *(float *)(v13 + v59 + 12);
          float v76 = (float)(v73 - v32) + v31;
          float v77 = (float)(v74 - v37) + v36;
          float v78 = (float)(v75 - v42) + v41;
          v63[3] = v76;
          v62[3] = v77;
          v61[3] = v78;
          float v32 = *(float *)(v19 + v59 + 16);
          float v37 = *(float *)(v16 + v59 + 16);
          float v42 = *(float *)(v13 + v59 + 16);
          float v79 = (float)(v76 - v33) + v32;
          float v80 = (float)(v77 - v38) + v37;
          float v81 = (float)(v78 - v43) + v42;
          v63[4] = v79;
          v62[4] = v80;
          v61[4] = v81;
          float v33 = *(float *)(v19 + v59 + 20);
          float v38 = *(float *)(v16 + v59 + 20);
          float v43 = *(float *)(v13 + v59 + 20);
          float v50 = (float)(v79 - v64) + v33;
          float v51 = (float)(v80 - v65) + v38;
          float v52 = (float)(v81 - v66) + v43;
          v63[5] = v50;
          v62[5] = v51;
          v61[5] = v52;
          v59 += 24;
          --v60;
        }
        while (v60);
        uint64_t v58 = (float *)(v12 + v59);
        uint64_t v55 = (float *)(v13 + v59);
        uint64_t v57 = (float *)(v15 + v59);
        float32x4_t v54 = (float *)(v16 + v59);
        float v56 = (float *)(v18 + v59);
        int v53 = (float *)(v19 + v59);
      }
      else
      {
        int v53 = v21 + 5;
        float32x4_t v54 = v24 + 5;
        uint64_t v55 = v27 + 5;
        float v56 = v22 + 3;
        uint64_t v57 = v25 + 3;
        uint64_t v58 = v28 + 3;
      }
      float v82 = v53 - 5;
      float v83 = v54 - 5;
      int v84 = v55 - 5;
      if (6 * ((a4 - 5) / 6) + 3 < a4 - 2)
      {
        uint64_t v85 = 0;
        unint64_t v86 = (a4 - 5) % 6;
        do
        {
          float v50 = (float)(v50 - v82[v85]) + v82[v85 + 5];
          float v51 = (float)(v51 - v83[v85]) + v83[v85 + 5];
          float v52 = (float)(v52 - v84[v85]) + v84[v85 + 5];
          v56[v85] = v50;
          v57[v85] = v51;
          v58[v85++] = v52;
          --v86;
        }
        while (v86);
        int v84 = (float *)((char *)v84 + v85 * 4);
        float v83 = (float *)((char *)v83 + v85 * 4);
        float v82 = (float *)((char *)v82 + v85 * 4);
        uint64_t v58 = (float *)((char *)v58 + v85 * 4);
        uint64_t v57 = (float *)((char *)v57 + v85 * 4);
        float v56 = (float *)((char *)v56 + v85 * 4);
      }
      unint64_t v87 = a4 - 2;
      if (a4 >= 2)
      {
        do
        {
          float v88 = *v82++;
          float v50 = v50 - v88;
          float v89 = *v83++;
          float v51 = v51 - v89;
          float v90 = *v84++;
          float v52 = v52 - v90;
          *v56++ = v50;
          *v57++ = v51;
          *v58++ = v52;
          ++v87;
        }
        while (v87 < a4);
      }
      ++a7;
      v8 += 12 * v9;
    }
    while (a7 != a8);
  }
}

void sub_262EB431C()
{
  __assert_rtn("boxFilter_Horizontal_1xN_LoopUnrollStage", "SmpOptimized11x11BoxFilter.mm", 53, "BYTES_PER_ROW % sizeof(float) == 0");
}

void sub_262EB4348()
{
  __assert_rtn("boxFilter_TwoImages_Multithreaded", "BaseSmpOptimizedBoxFilter.mm", 46, "m_N % 2 == 1");
}

void sub_262EB4374()
{
  __assert_rtn("boxFilter_TwoImages_Multithreaded", "BaseSmpOptimizedBoxFilter.mm", 50, "H >= HORIZONTAL_ROWS_PER_ITERATION");
}

void sub_262EB43A0()
{
}

void sub_262EB43CC()
{
}

void sub_262EB43F8()
{
  __assert_rtn("boxFilter_Vertical_Nx1_UnrollStage", "BaseSmpOptimizedBoxFilter.mm", 194, "endRowIndexExclusive <= H");
}

void sub_262EB4424()
{
  __assert_rtn("boxFilter_Vertical_Nx1_UnrollStage", "BaseSmpOptimizedBoxFilter.mm", 197, "BYTES_PER_ROW % sizeof(float) == 0");
}

void sub_262EB4450()
{
}

void sub_262EB447C()
{
}

void sub_262EB44A8()
{
}

void sub_262EB44D4()
{
  __assert_rtn("boxFilter_Vertical_Nx1_LeftoverStage", "BaseSmpOptimizedBoxFilter.mm", 353, "endRowIndexExclusive <= H");
}

void sub_262EB4500()
{
}

void sub_262EB452C()
{
}

void sub_262EB4558()
{
  __assert_rtn("boxFilter_Vertical_Nx1_LeftoverStage", "BaseSmpOptimizedBoxFilter.mm", 350, "BYTES_PER_ROW % sizeof(float) == 0");
}

void sub_262EB4584()
{
}

void sub_262EB45B0()
{
}

void sub_262EB45DC()
{
  __assert_rtn("boxFilter_Horizontal_1xN_LeftoverRowsStage", "BaseSmpOptimizedBoxFilter.mm", 466, "BYTES_PER_ROW % sizeof(float) == 0");
}

uint64_t sub_262EB4608(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

void sub_262EB462C()
{
  __assert_rtn("initSmpFilteringIntermediateBuffers", "SmpFilteringImpl.mm", 122, "m_bytesPerRow % sizeof(float) == 0");
}

void sub_262EB4658()
{
  __assert_rtn("createMaskAndMaskedInput", "SmpFilteringImpl.mm", 249, "m_bytesPerRow % sizeof(float) == 0");
}

void sub_262EB4684()
{
  __assert_rtn("divideAndApplyMaskFloatImages", "SmpFilteringImpl.mm", 336, "m_bytesPerRow % sizeof(float) == 0");
}

void sub_262EB46B0()
{
  __assert_rtn("boxFilter_Horizontal_1xN_LoopUnrollStage", "SmpOptimized3x3BoxFilter.mm", 53, "BYTES_PER_ROW % sizeof(float) == 0");
}

void sub_262EB46DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_262EB4764()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", v0, 2u);
}

void sub_262EB47AC()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  long long v1 = "Factored";
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s does not hold a completed matrix factorization.\n", (uint8_t *)&v0, 0xCu);
}

void sub_262EB4834(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld for SparseSolve().\n", (uint8_t *)&v1, 0xCu);
}

void sub_262EB48B4()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136316162;
  sub_262E9F9E8();
  sub_262E9F9B0();
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", (uint8_t *)v0, 0x28u);
}

void sub_262EB4948()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136316162;
  sub_262E9F9E8();
  sub_262E9F9B0();
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", (uint8_t *)v0, 0x28u);
}

void sub_262EB49DC()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot perform symmetric matrix factorization of non-square matrix.\n", v0, 2u);
}

void sub_262EB4A24(int a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = 136316162;
  uint64_t v3 = "Matrix.structure";
  __int16 v4 = 2080;
  uint64_t v5 = "Matrix.structure";
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 2080;
  unint64_t v9 = "Matrix.structure";
  __int16 v10 = 1024;
  int v11 = a2;
  _os_log_error_impl(&dword_262E93000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s.attributes.kind=SparseSymmetric, but %s.rowCount (%d) != %s.columnCount (%d).\n", (uint8_t *)&v2, 0x2Cu);
}

void sub_262EB4AD4()
{
  sub_262E9FA00();
  sub_262E9F9CC(&dword_262E93000, &_os_log_internal, v0, "%s.columnCount must be > 0, but is %d.\n", v1, v2, v3, v4, 2u);
}

void sub_262EB4B50()
{
  sub_262E9FA00();
  sub_262E9F9CC(&dword_262E93000, &_os_log_internal, v0, "%s.rowCount must be > 0, but is %d.\n", v1, v2, v3, v4, 2u);
}

void sub_262EB4BCC()
{
  __assert_rtn("imDownscaleMax_2x2_32f", "FMGsolverV2.cpp", 475, "factor <=3");
}

void sub_262EB4BF8()
{
}

void sub_262EB4C24()
{
}

void sub_262EB4C50()
{
  __assert_rtn("boxFilter_Horizontal_1xN_LoopUnrollStage", "SmpOptimized5x5BoxFilter.mm", 53, "BYTES_PER_ROW % sizeof(float) == 0");
}

void CFRelease(CFTypeRef cf)
{
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x270F12DB8]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x270EE8030]();
}

uint64_t FigCFDictionaryGetFloat32IfPresent()
{
  return MEMORY[0x270EE8060]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x270EE8068]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x270EE8250]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

void _SparseDestroyOpaqueNumeric_Float(SparseOpaqueFactorization_Float *toFree)
{
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorSymmetric_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x270EDE228](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseSymbolicFactorOptions *__cdecl _SparseGetOptionsFromSymbolicFactor(SparseSymbolicFactorOptions *__return_ptr retstr, SparseOpaqueSymbolicFactorization *factor)
{
  return (SparseSymbolicFactorOptions *)MEMORY[0x270EDE240](retstr, factor);
}

void _SparseSolveOpaque_Float(const SparseOpaqueFactorization_Float *Factored, const DenseMatrix_Float *RHS, const DenseMatrix_Float *Soln, void *workspace)
{
}

void _SparseTrap(void)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

vImage_Error vImageConvolve_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const float *kernel, uint32_t kernel_height, uint32_t kernel_width, Pixel_F backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF198](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageHistogramCalculation_PlanarF(const vImage_Buffer *src, vImagePixelCount *histogram, unsigned int histogram_entries, Pixel_F minVal, Pixel_F maxVal, vImage_Flags flags)
{
  return MEMORY[0x270EDF208](src, histogram, *(void *)&histogram_entries, *(void *)&flags, minVal, maxVal);
}