@interface DenoiseRemixStage
+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4 plistEntryName:(id)a5;
+ (void)prewarmOneShader:(id)a3 entryToParse:(id)a4 denoisingOptions:(DenoiseRemixStageOptions *)a5;
+ (void)prewarmRenderers:(id)a3;
- (BOOL)dumpIntermediateData:(id)a3 counter:(int)a4;
- (BOOL)dumpParamsToFile:(id)a3;
- (BOOL)loadParamsFromFile:(id)a3;
- (DenoiseRemixStage)initWithContext:(id)a3 options:(const DenoiseRemixStageOptions *)a4 numPyrLevels:(int)a5;
- (int)run:(id)a3 skinMask:(id)a4 skyMask:(id)a5 maskExtent:(CGRect)a6;
- (int)runShader:(const void *)a3 shader:(id)a4 desc:(id)a5 uniforms:(id)a6 uniforms2:(id)a7 uniforms3:(id)a8;
- (int)setResourcesWithOutputPyramid:(id)a3 noiseMapPyramid:(id)a4 sharpeningPyramid:(id)a5 localGainMapTex:(id)a6;
- (int)setUniforms:(AmbnrConfiguration *)a3;
@end

@implementation DenoiseRemixStage

- (BOOL)dumpIntermediateData:(id)a3 counter:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  if (self->_pyr->levels < 1)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    uint64_t v9 = 0;
    int v10 = 1;
    do
    {
      v11 = objc_msgSend_stringWithFormat_(NSString, v6, @"denoiseremix_%d_pyr_%d.420f", v7, v4, v9);
      v14 = objc_msgSend_stringByAppendingPathComponent_(v8, v12, (uint64_t)v11, v13);

      id v15 = v14;
      objc_msgSend_UTF8String(v15, v16, v17, v18);
      v10 &= WritePixelBufferToFile();

      ++v9;
    }
    while (v9 < self->_pyr->levels);
  }

  return v10;
}

- (BOOL)dumpParamsToFile:(id)a3
{
  id v191 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = objc_msgSend_numberWithInt_(NSNumber, v5, self->_pyr->levels, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"number_bands");

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v10, (uint64_t)v9, @"bands");

  if (self->_pyr->levels >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = self->_uniforms[v12];
      uint64_t v17 = objc_msgSend_contents(v13, v14, v15, v16);
      id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v21 = objc_msgSend_numberWithInt_(NSNumber, v19, v12, v20);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v22, (uint64_t)v21, @"band");

      v26 = objc_msgSend_numberWithFloat_(NSNumber, v23, v24, v25, *(double *)(v17 + 336));
      objc_msgSend_setObject_forKeyedSubscript_(v18, v27, (uint64_t)v26, @"lumaUpsamplingCoordOffset[0]");

      LODWORD(v28) = *(_DWORD *)(v17 + 340);
      v32 = objc_msgSend_numberWithFloat_(NSNumber, v29, v30, v31, v28);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v33, (uint64_t)v32, @"lumaUpsamplingCoordOffset[1]");

      v37 = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v36, *(double *)(v17 + 344));
      objc_msgSend_setObject_forKeyedSubscript_(v18, v38, (uint64_t)v37, @"chromaUpsamplingCoordOffset[0]");

      LODWORD(v39) = *(_DWORD *)(v17 + 348);
      v43 = objc_msgSend_numberWithFloat_(NSNumber, v40, v41, v42, v39);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v44, (uint64_t)v43, @"chromaUpsamplingCoordOffset[1]");

      LODWORD(v45) = *(_DWORD *)v17;
      v49 = objc_msgSend_numberWithFloat_(NSNumber, v46, v47, v48, v45);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v50, (uint64_t)v49, @"nm.lumaSigmaIntercept");

      LODWORD(v51) = *(_DWORD *)(v17 + 4);
      v55 = objc_msgSend_numberWithFloat_(NSNumber, v52, v53, v54, v51);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v56, (uint64_t)v55, @"nm.lumaSigmaSlope");

      LODWORD(v57) = *(_DWORD *)(v17 + 8);
      v61 = objc_msgSend_numberWithFloat_(NSNumber, v58, v59, v60, v57);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v62, (uint64_t)v61, @"nm.lumaSigmaMax");

      v66 = objc_msgSend_numberWithFloat_(NSNumber, v63, v64, v65, *(double *)(v17 + 16));
      objc_msgSend_setObject_forKeyedSubscript_(v18, v67, (uint64_t)v66, @"nm.chromaSigma[0]");

      LODWORD(v68) = *(_DWORD *)(v17 + 20);
      v72 = objc_msgSend_numberWithFloat_(NSNumber, v69, v70, v71, v68);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v73, (uint64_t)v72, @"nm.chromaSigma[1]");

      LODWORD(v74) = *(_DWORD *)(v17 + 116);
      v78 = objc_msgSend_numberWithFloat_(NSNumber, v75, v76, v77, v74);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v79, (uint64_t)v78, @"das.blueBoost");

      LODWORD(v80) = *(_DWORD *)(v17 + 72);
      v84 = objc_msgSend_numberWithFloat_(NSNumber, v81, v82, v83, v80);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v85, (uint64_t)v84, @"das.flatnessBoost");

      LODWORD(v86) = *(_DWORD *)(v17 + 76);
      v90 = objc_msgSend_numberWithFloat_(NSNumber, v87, v88, v89, v86);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v91, (uint64_t)v90, @"das.flatnessThreshold");

      LODWORD(v92) = *(_DWORD *)(v17 + 80);
      v96 = objc_msgSend_numberWithFloat_(NSNumber, v93, v94, v95, v92);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v97, (uint64_t)v96, @"das.gdFlatnessBoostMidtone");

      LODWORD(v98) = *(_DWORD *)(v17 + 84);
      v102 = objc_msgSend_numberWithFloat_(NSNumber, v99, v100, v101, v98);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v103, (uint64_t)v102, @"das.gdFlatnessMidtoneValue");

      LODWORD(v104) = *(_DWORD *)(v17 + 88);
      v108 = objc_msgSend_numberWithFloat_(NSNumber, v105, v106, v107, v104);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v109, (uint64_t)v108, @"das.gdFlatnessBoostShadow");

      LODWORD(v110) = *(_DWORD *)(v17 + 92);
      v114 = objc_msgSend_numberWithFloat_(NSNumber, v111, v112, v113, v110);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v115, (uint64_t)v114, @"das.gdFlatnessBoostHighlight");

      LODWORD(v116) = *(_DWORD *)(v17 + 96);
      v120 = objc_msgSend_numberWithFloat_(NSNumber, v117, v118, v119, v116);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v121, (uint64_t)v120, @"das.gdTexturenessThresholdLow");

      LODWORD(v122) = *(_DWORD *)(v17 + 100);
      v126 = objc_msgSend_numberWithFloat_(NSNumber, v123, v124, v125, v122);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v127, (uint64_t)v126, @"das.gdTexturenessThresholdHigh");

      LODWORD(v128) = *(_DWORD *)(v17 + 104);
      v132 = objc_msgSend_numberWithFloat_(NSNumber, v129, v130, v131, v128);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v133, (uint64_t)v132, @"das.gdTexturenessShadingFactor");

      LODWORD(v134) = *(_DWORD *)(v17 + 112);
      v138 = objc_msgSend_numberWithFloat_(NSNumber, v135, v136, v137, v134);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v139, (uint64_t)v138, @"das.radialSharpnessBoost");

      LODWORD(v140) = *(_DWORD *)(v17 + 108);
      v144 = objc_msgSend_numberWithFloat_(NSNumber, v141, v142, v143, v140);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v145, (uint64_t)v144, @"das.radialFlatnessBoost");

      LODWORD(v146) = *(_DWORD *)(v17 + 196);
      v150 = objc_msgSend_numberWithFloat_(NSNumber, v147, v148, v149, v146);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v151, (uint64_t)v150, @"das.bluenessCb.start");

      LODWORD(v152) = *(_DWORD *)(v17 + 200);
      v156 = objc_msgSend_numberWithFloat_(NSNumber, v153, v154, v155, v152);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v157, (uint64_t)v156, @"das.bluenessCb.end");

      LODWORD(v158) = *(_DWORD *)(v17 + 204);
      v162 = objc_msgSend_numberWithFloat_(NSNumber, v159, v160, v161, v158);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v163, (uint64_t)v162, @"das.bluenessCb.margin");

      LODWORD(v164) = *(_DWORD *)(v17 + 208);
      v168 = objc_msgSend_numberWithFloat_(NSNumber, v165, v166, v167, v164);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v169, (uint64_t)v168, @"das.bluenessCr.start");

      LODWORD(v170) = *(_DWORD *)(v17 + 212);
      v174 = objc_msgSend_numberWithFloat_(NSNumber, v171, v172, v173, v170);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v175, (uint64_t)v174, @"das.bluenessCr.end");

      LODWORD(v176) = *(_DWORD *)(v17 + 216);
      v180 = objc_msgSend_numberWithFloat_(NSNumber, v177, v178, v179, v176);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v181, (uint64_t)v180, @"das.bluenessCr.margin");

      v184 = objc_msgSend_objectForKeyedSubscript_(v4, v182, @"bands", v183, v191);
      objc_msgSend_addObject_(v184, v185, (uint64_t)v18, v186);

      ++v12;
    }
    while (v12 < self->_pyr->levels);
  }
  uint64_t v193 = 0;
  v187 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x263F08900], v11, (uint64_t)v4, 1, &v193, v191);
  char v189 = objc_msgSend_writeToFile_atomically_(v187, v188, (uint64_t)v192, 1);

  return v189;
}

- (BOOL)loadParamsFromFile:(id)a3
{
  uint64_t v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], a2, (uint64_t)a3, v3);
  if (v6)
  {
    v192 = v6;
    id v193 = 0;
    uint64_t v7 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v5, (uint64_t)v6, 0, &v193);
    id v191 = v193;
    if (self->_pyr->levels >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        id v9 = self->_uniforms[v8];
        uint64_t v13 = objc_msgSend_contents(v9, v10, v11, v12);
        *(void *)&long long v14 = -1;
        *((void *)&v14 + 1) = -1;
        *(_OWORD *)uint64_t v13 = v14;
        *(_OWORD *)(v13 + 16) = v14;
        *(_OWORD *)(v13 + 32) = v14;
        *(_OWORD *)(v13 + 48) = v14;
        *(_OWORD *)(v13 + 64) = v14;
        *(_OWORD *)(v13 + 80) = v14;
        *(_OWORD *)(v13 + 96) = v14;
        *(_OWORD *)(v13 + 112) = v14;
        *(_OWORD *)(v13 + 128) = v14;
        *(_OWORD *)(v13 + 144) = v14;
        *(_OWORD *)(v13 + 160) = v14;
        *(_OWORD *)(v13 + 176) = v14;
        *(_OWORD *)(v13 + 192) = v14;
        *(_OWORD *)(v13 + 208) = v14;
        *(_OWORD *)(v13 + 224) = v14;
        *(_OWORD *)(v13 + 240) = v14;
        *(_OWORD *)(v13 + 256) = v14;
        *(_OWORD *)(v13 + 272) = v14;
        *(_OWORD *)(v13 + 288) = v14;
        *(_OWORD *)(v13 + 304) = v14;
        *(_OWORD *)(v13 + 320) = v14;
        *(_OWORD *)(v13 + 336) = v14;
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v7, v15, @"bands", v16);
        uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v17, v18, v8, v19);

        v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"lumaUpsamplingCoordOffset[0]", v22);
        objc_msgSend_floatValue(v23, v24, v25, v26);
        *(_DWORD *)(v13 + 336) = v27;

        uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v20, v28, @"lumaUpsamplingCoordOffset[1]", v29);
        objc_msgSend_floatValue(v30, v31, v32, v33);
        *(_DWORD *)(v13 + 340) = v34;

        v37 = objc_msgSend_objectForKeyedSubscript_(v20, v35, @"chromaUpsamplingCoordOffset[0]", v36);
        objc_msgSend_floatValue(v37, v38, v39, v40);
        *(_DWORD *)(v13 + 344) = v41;

        v44 = objc_msgSend_objectForKeyedSubscript_(v20, v42, @"chromaUpsamplingCoordOffset[1]", v43);
        objc_msgSend_floatValue(v44, v45, v46, v47);
        *(_DWORD *)(v13 + 348) = v48;

        double v51 = objc_msgSend_objectForKeyedSubscript_(v20, v49, @"nm.lumaSigmaIntercept", v50);
        objc_msgSend_floatValue(v51, v52, v53, v54);
        *(_DWORD *)uint64_t v13 = v55;

        v58 = objc_msgSend_objectForKeyedSubscript_(v20, v56, @"nm.lumaSigmaSlope", v57);
        objc_msgSend_floatValue(v58, v59, v60, v61);
        *(_DWORD *)(v13 + 4) = v62;

        uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v20, v63, @"nm.lumaSigmaMax", v64);
        objc_msgSend_floatValue(v65, v66, v67, v68);
        *(_DWORD *)(v13 + 8) = v69;

        v72 = objc_msgSend_objectForKeyedSubscript_(v20, v70, @"nm.chromaSigma[0]", v71);
        objc_msgSend_floatValue(v72, v73, v74, v75);
        *(_DWORD *)(v13 + 16) = v76;

        v79 = objc_msgSend_objectForKeyedSubscript_(v20, v77, @"nm.chromaSigma[1]", v78);
        objc_msgSend_floatValue(v79, v80, v81, v82);
        *(_DWORD *)(v13 + 20) = v83;

        double v86 = objc_msgSend_objectForKeyedSubscript_(v20, v84, @"das.blueBoost", v85);
        objc_msgSend_floatValue(v86, v87, v88, v89);
        *(_DWORD *)(v13 + 116) = v90;

        v93 = objc_msgSend_objectForKeyedSubscript_(v20, v91, @"das.flatnessBoost", v92);
        objc_msgSend_floatValue(v93, v94, v95, v96);
        *(_DWORD *)(v13 + 72) = v97;

        uint64_t v100 = objc_msgSend_objectForKeyedSubscript_(v20, v98, @"das.flatnessThreshold", v99);
        objc_msgSend_floatValue(v100, v101, v102, v103);
        *(_DWORD *)(v13 + 76) = v104;

        uint64_t v107 = objc_msgSend_objectForKeyedSubscript_(v20, v105, @"das.gdFlatnessBoostMidtone", v106);
        objc_msgSend_floatValue(v107, v108, v109, v110);
        *(_DWORD *)(v13 + 80) = v111;

        v114 = objc_msgSend_objectForKeyedSubscript_(v20, v112, @"das.gdFlatnessMidtoneValue", v113);
        objc_msgSend_floatValue(v114, v115, v116, v117);
        *(_DWORD *)(v13 + 84) = v118;

        v121 = objc_msgSend_objectForKeyedSubscript_(v20, v119, @"das.gdFlatnessBoostShadow", v120);
        objc_msgSend_floatValue(v121, v122, v123, v124);
        *(_DWORD *)(v13 + 88) = v125;

        double v128 = objc_msgSend_objectForKeyedSubscript_(v20, v126, @"das.gdFlatnessBoostHighlight", v127);
        objc_msgSend_floatValue(v128, v129, v130, v131);
        *(_DWORD *)(v13 + 92) = v132;

        v135 = objc_msgSend_objectForKeyedSubscript_(v20, v133, @"das.radialSharpnessBoost", v134);
        objc_msgSend_floatValue(v135, v136, v137, v138);
        *(_DWORD *)(v13 + 112) = v139;

        uint64_t v142 = objc_msgSend_objectForKeyedSubscript_(v20, v140, @"das.radialFlatnessBoost", v141);
        objc_msgSend_floatValue(v142, v143, v144, v145);
        *(_DWORD *)(v13 + 108) = v146;

        uint64_t v149 = objc_msgSend_objectForKeyedSubscript_(v20, v147, @"das.bluenessCb.start", v148);
        objc_msgSend_floatValue(v149, v150, v151, v152);
        *(_DWORD *)(v13 + 196) = v153;

        v156 = objc_msgSend_objectForKeyedSubscript_(v20, v154, @"das.bluenessCb.end", v155);
        objc_msgSend_floatValue(v156, v157, v158, v159);
        *(_DWORD *)(v13 + 200) = v160;

        v163 = objc_msgSend_objectForKeyedSubscript_(v20, v161, @"das.bluenessCb.margin", v162);
        objc_msgSend_floatValue(v163, v164, v165, v166);
        *(_DWORD *)(v13 + 204) = v167;

        double v170 = objc_msgSend_objectForKeyedSubscript_(v20, v168, @"das.bluenessCr.start", v169);
        objc_msgSend_floatValue(v170, v171, v172, v173);
        *(_DWORD *)(v13 + 208) = v174;

        v177 = objc_msgSend_objectForKeyedSubscript_(v20, v175, @"das.bluenessCr.end", v176);
        objc_msgSend_floatValue(v177, v178, v179, v180);
        *(_DWORD *)(v13 + 212) = v181;

        v184 = objc_msgSend_objectForKeyedSubscript_(v20, v182, @"das.bluenessCr.margin", v183);
        objc_msgSend_floatValue(v184, v185, v186, v187);
        *(_DWORD *)(v13 + 216) = v188;

        ++v8;
      }
      while (v8 < self->_pyr->levels);
    }

    uint64_t v6 = v192;
  }
  BOOL v189 = v6 != 0;

  return v189;
}

- (DenoiseRemixStage)initWithContext:(id)a3 options:(const DenoiseRemixStageOptions *)a4 numPyrLevels:(int)a5
{
  id v9 = a3;
  if (a5 > 0)
  {
    objc_storeStrong((id *)&self->_metal, a3);
    char v13 = 0;
    uint64_t v14 = *(void *)&a4->lgaAlgorithm;
    *(_DWORD *)&self->_options.enableNoiseMap = *(_DWORD *)&a4->enableNoiseMap;
    *(void *)&self->_options.lgaAlgorithm = v14;
    char v15 = 1;
LABEL_3:
    char v16 = 0;
    char v17 = v15;
    char v18 = 1;
    while (1)
    {
      char v19 = v18;
      uint64_t v20 = objc_msgSend_sharedInstance(DenoiseRemixStageShared, v10, v11, v12);
      uint64_t v22 = objc_msgSend_getShaders_lumaFP16_chromaFP16_options_(v20, v21, (uint64_t)v9, v13 & 1, v16 & 1, a4);

      if (!v22) {
        break;
      }

      char v18 = 0;
      char v16 = 1;
      if ((v19 & 1) == 0)
      {
        char v15 = 0;
        char v13 = 1;
        if (v17) {
          goto LABEL_3;
        }
        v23 = objc_opt_new();
        uint64_t v26 = v23;
        if (v23)
        {
          objc_msgSend_setStorageMode_(v23, v24, 0, v25);
          objc_msgSend_setHazardTrackingMode_(v26, v27, 2, v28);
          objc_msgSend_setSize_(v26, v29, 20480, v30);
          int v34 = objc_msgSend_device(v9, v31, v32, v33);
          v37 = (MTLHeap *)objc_msgSend_newHeapWithDescriptor_(v34, v35, (uint64_t)v26, v36);
          uniformsHeap = self->_uniformsHeap;
          self->_uniformsHeap = v37;

          if (self->_uniformsHeap)
          {
            uint64_t v42 = 40;
            while (1)
            {
              uint64_t v43 = self->_uniformsHeap;
              uint64_t v44 = objc_msgSend_resourceOptions(v43, v39, v40, v41);
              uint64_t v46 = (objc_class *)objc_msgSend_newBufferWithLength_options_(v43, v45, 352, v44);
              uint64_t v47 = *(Class *)((char *)&self->super.isa + v42);
              *(Class *)((char *)&self->super.isa + v42) = v46;

              if (!*(Class *)((char *)&self->super.isa + v42)) {
                break;
              }
              v42 += 8;
              if (v42 == 200)
              {
                int v48 = self->_uniformsHeap;
                uint64_t v49 = objc_msgSend_resourceOptions(v48, v39, v40, v41);
                double v51 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v48, v50, 16, v49);
                roiTxUniform = self->_roiTxUniform;
                self->_roiTxUniform = v51;

                if (!self->_roiTxUniform) {
                  break;
                }

                objc_msgSend_prewarmRenderers_(DenoiseRemixStage, v53, (uint64_t)self->_metal, v54);
                goto LABEL_14;
              }
            }
          }
        }
        FigDebugAssert3();
        int v58 = FigSignalErrorAt();

        if (v58) {
          goto LABEL_16;
        }
        goto LABEL_14;
      }
    }
  }
  FigDebugAssert3();
  if (FigSignalErrorAt()) {
LABEL_16:
  }
    int v55 = 0;
  else {
LABEL_14:
  }
    int v55 = self;
  v56 = v55;

  return v56;
}

+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4 plistEntryName:(id)a5
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v74 = a5;
  int v88 = 0;
  uint64_t v87 = 0;
  id v9 = (void *)MEMORY[0x263E63C40]();
  uint64_t v75 = v8;
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v10, @"DefaultSensorIDs", v11);
  char v13 = v12;
  if (v12)
  {
    uint64_t v70 = v12;
    uint64_t v71 = v9;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v14 = v12;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v83, (uint64_t)v90, 16);
    if (v76)
    {
      uint64_t v73 = *(void *)v84;
      id v72 = v14;
      do
      {
        for (uint64_t i = 0; i != v76; ++i)
        {
          if (*(void *)v84 != v73) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v83 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v14, v16, v19, v17);
          v23 = objc_msgSend_objectForKeyedSubscript_(v75, v21, v19, v22);
          uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v20, v25);
          uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)v74, v28);
          uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v29, v30, @"NRFParameters", v31);
          uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v32, v33, @"DenoiseAndSharpening", v34);

          if (v35)
          {
            uint64_t v77 = v20;
            uint64_t v78 = i;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            uint64_t v39 = objc_msgSend_allKeys(v35, v36, v37, v38);
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v79, (uint64_t)v89, 16);
            if (v41)
            {
              uint64_t v45 = v41;
              uint64_t v46 = *(void *)v80;
              do
              {
                for (uint64_t j = 0; j != v45; ++j)
                {
                  if (*(void *)v80 != v46) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v48 = *(void *)(*((void *)&v79 + 1) + 8 * j);
                  uint64_t v49 = objc_msgSend_getSharedInstance(DenoiseRemixStageConfig, v42, v43, v44);
                  v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, v48, v51);

                  if (v52)
                  {
                    int v55 = objc_msgSend_objectForKeyedSubscript_(v35, v53, v48, v54);
                    LODWORD(v87) = objc_msgSend_lgaAlgorithm(v52, v56, v57, v58);
                    BYTE4(v87) = objc_msgSend_enableBandZeroDenoising(v52, v59, v60, v61);
                    LOBYTE(v88) = objc_msgSend_enableNoiseMap(v52, v62, v63, v64);
                    objc_msgSend_prewarmOneShader_entryToParse_denoisingOptions_(DenoiseRemixStage, v65, (uint64_t)v7, (uint64_t)v55, &v87);
                  }
                }
                uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v79, (uint64_t)v89, 16);
              }
              while (v45);
            }

            id v14 = v72;
            uint64_t v20 = v77;
            uint64_t i = v78;
          }
        }
        uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v83, (uint64_t)v90, 16);
      }
      while (v76);
    }

    objc_msgSend_prewarmRenderers_(DenoiseRemixStage, v66, (uint64_t)v7, v67);
    int v68 = 0;
    char v13 = v70;
    id v9 = v71;
  }
  else
  {
    FigDebugAssert3();
    int v68 = FigSignalErrorAt();
  }

  return v68;
}

+ (void)prewarmOneShader:(id)a3 entryToParse:(id)a4 denoisingOptions:(DenoiseRemixStageOptions *)a5
{
  id v44 = a3;
  id v7 = a4;
  int v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"EnableBilateralRegression", v9);
  a5->enableBilateralRegression = objc_msgSend_BOOLValue(v10, v11, v12, v13);

  char v16 = objc_msgSend_objectForKeyedSubscript_(v7, v14, @"EnableLoGOffset", v15);
  a5->enableLoGOffset = objc_msgSend_BOOLValue(v16, v17, v18, v19);

  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v7, v20, @"EnableLowVarSharpening", v21);
  a5->enableLowVarSharpening = objc_msgSend_BOOLValue(v22, v23, v24, v25);

  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v7, v26, @"EnableGdFlatness", v27);
  a5->enableGdFlatness = objc_msgSend_BOOLValue(v28, v29, v30, v31);

  for (int i = 0; i != 4; ++i)
  {
    uint64_t v36 = objc_msgSend_library(v44, v32, v33, v34);
    uint64_t v39 = objc_msgSend_newFunctionWithName_(v36, v37, @"RemixDenoise_vert", v38);

    if (v39)
    {
      uint64_t v40 = [DenoiseRemixShaders alloc];
      if (i) {
        uint64_t v42 = 25;
      }
      else {
        uint64_t v42 = 10;
      }
      if ((i & 2) != 0) {
        uint64_t v43 = objc_msgSend_initWithMetal_vertFunc_pixelFormatLuma_pixelFormatChroma_options_(v40, v41, (uint64_t)v44, (uint64_t)v39, v42, 65, a5);
      }
      else {
        uint64_t v43 = objc_msgSend_initWithMetal_vertFunc_pixelFormatLuma_pixelFormatChroma_options_(v40, v41, (uint64_t)v44, (uint64_t)v39, v42, 30, a5);
      }
    }
  }
}

+ (void)prewarmRenderers:(id)a3
{
  objc_msgSend_prewarmInternalMetalShadersForFormatsList_(a3, a2, (uint64_t)&unk_270E50BF8, v3);
}

- (int)setResourcesWithOutputPyramid:(id)a3 noiseMapPyramid:(id)a4 sharpeningPyramid:(id)a5 localGainMapTex:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12 && self->_options.enableNoiseMap || !v13 && self->_options.enableLowVarSharpening)
  {
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
  }
  else
  {
    objc_storeStrong((id *)&self->_pyr, a3);
    objc_storeStrong((id *)&self->_noiseMapPyramid, a4);
    objc_storeStrong((id *)&self->_sharpeningPyramid, a5);
    objc_storeStrong((id *)&self->_localGainMapTex, a6);
    int v15 = 0;
  }

  return v15;
}

- (int)setUniforms:(AmbnrConfiguration *)a3
{
  pyr = self->_pyr;
  if (pyr)
  {
    if (pyr->levels >= 1)
    {
      uint64_t v6 = 0;
      uniforms = self->_uniforms;
      do
      {
        id v8 = uniforms[v6];
        id v12 = objc_msgSend_contents(v8, v9, v10, v11);
        memcpy(v12, a3, 0x160uLL);
        ++v6;
        a3 = (AmbnrConfiguration *)((char *)a3 + 352);
      }
      while (v6 < self->_pyr->levels);
    }
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)runShader:(const void *)a3 shader:(id)a4 desc:(id)a5 uniforms:(id)a6 uniforms2:(id)a7 uniforms3:(id)a8
{
  id v14 = (uint64_t *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v22 = objc_msgSend_colorAttachments(v15, v19, v20, v21);
  uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v22, v23, 0, v24);
  uint64_t v29 = objc_msgSend_texture(v25, v26, v27, v28);
  objc_msgSend_width(v29, v30, v31, v32);

  uint64_t v36 = objc_msgSend_colorAttachments(v15, v33, v34, v35);
  uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v36, v37, 0, v38);
  uint64_t v43 = objc_msgSend_texture(v39, v40, v41, v42);
  objc_msgSend_height(v43, v44, v45, v46);

  uint64_t v50 = objc_msgSend_commandQueue(self->_metal, v47, v48, v49);
  uint64_t v54 = objc_msgSend_commandBuffer(v50, v51, v52, v53);

  if (v54
    && (objc_msgSend_renderCommandEncoderWithDescriptor_(v54, v55, (uint64_t)v15, v56),
        (uint64_t v57 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v61 = (void *)v57;
    int v62 = objc_msgSend_fullRangeVertexBuf(self->_metal, v58, v59, v60);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v61, v63, (uint64_t)v62, 0, 0);

    objc_msgSend_setFragmentTextures_withRange_(v61, v64, (uint64_t)a3, 0, 15);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v61, v65, (uint64_t)v16, 0, 0);
    if (v17) {
      objc_msgSend_setFragmentBuffer_offset_atIndex_(v61, v66, (uint64_t)v17, 0, 1);
    }
    if (v18) {
      objc_msgSend_setFragmentBuffer_offset_atIndex_(v61, v66, (uint64_t)v18, 0, 2);
    }
    objc_msgSend_setRenderPipelineState_(v61, v66, v14[1], v67);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v61, v68, 4, 0, 4);
    objc_msgSend_endEncoding(v61, v69, v70, v71);
    objc_msgSend_commit(v54, v72, v73, v74);

    int v75 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v75 = FigSignalErrorAt();
  }

  return v75;
}

- (int)run:(id)a3 skinMask:(id)a4 skyMask:(id)a5 maskExtent:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat x = a6.origin.x;
  long long v333 = *(_OWORD *)&a6.origin.y;
  v344[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = (char *)a3;
  obuint64_t j = a4;
  id v10 = a4;
  id v314 = a5;
  id v11 = a5;
  v344[0] = 0;
  long long v342 = 0u;
  long long v343 = 0u;
  long long v340 = 0u;
  long long v341 = 0u;
  long long v339 = 0u;
  memset(location, 0, sizeof(location));
  uint64_t levels = self->_pyr->levels;
  id v16 = objc_msgSend_allocator(self->_metal, v13, v14, v15);
  uint64_t v20 = objc_msgSend_newTextureDescriptor(v16, v17, v18, v19);

  v306 = v11;
  if (!v20) {
    goto LABEL_102;
  }
  uint64_t v24 = objc_msgSend_desc(v20, v21, v22, v23);
  objc_msgSend_setUsage_(v24, v25, 7, v26);

  v308 = v20;
  uint64_t v30 = objc_msgSend_desc(v20, v27, v28, v29);
  objc_msgSend_setPixelFormat_(v30, v31, 30, v32);

  pyr = self->_pyr;
  if (*((_DWORD *)v9 + 2) != pyr->levels) {
    goto LABEL_102;
  }
  if (v10 && v11)
  {
    uint64_t v37 = objc_msgSend_width(v10, v33, v34, v35);
    if (v37 != objc_msgSend_width(v11, v38, v39, v40)) {
      goto LABEL_102;
    }
    uint64_t v44 = objc_msgSend_height(v10, v41, v42, v43);
    if (v44 != objc_msgSend_height(v11, v45, v46, v47)) {
      goto LABEL_102;
    }
    pyr = self->_pyr;
  }
  if (!pyr->textureY[0])
  {
LABEL_102:
    FigDebugAssert3();
    int v301 = FigSignalErrorAt();
    v302 = 0;
    goto LABEL_88;
  }
  id v305 = v10;
  uint64_t v317 = levels;
  uint64_t v48 = (int)levels - 1;
  uint64_t v49 = (float32x4_t *)objc_msgSend_contents(self->_roiTxUniform, v33, v34, v35);
  uint64_t v53 = objc_msgSend_width(*((void **)v9 + 42), v50, v51, v52);
  v54.f64[0] = width;
  v54.f64[1] = height;
  float32x4_t v328 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54), v54);
  uint64_t v58 = objc_msgSend_height(*((void **)v9 + 42), v55, v56, v57);
  v59.i64[0] = v53;
  v59.i64[1] = v58;
  v61.f64[0] = x;
  v60.i64[1] = *((void *)&v333 + 1);
  *(void *)&v61.f64[1] = v333;
  *(float32x2_t *)v60.f32 = vcvt_f32_f64(v61);
  float32x4_t *v49 = vdivq_f32(vcvt_hight_f32_f64((int32x2_t)*(_OWORD *)&vnegq_f32(v60), vcvtq_f64_u64(v59)), v328);
  uint64_t v65 = objc_msgSend_sharedInstance(DenoiseRemixStageShared, v62, v63, v64);
  uint64_t v66 = self->_pyr->isFP16[v48];
  p_options = &self->_options;
  objc_msgSend_getShaders_lumaFP16_chromaFP16_options_(v65, v67, (uint64_t)self->_metal, v66, v66);
  int v68 = (id *)objc_claimAutoreleasedReturnValue();

  id v72 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v69, v70, v71);
  if (!v72)
  {
    FigDebugAssert3();
    int v301 = FigSignalErrorAt();

    v302 = 0;
    id v10 = v305;
    goto LABEL_88;
  }
  uint64_t v76 = v72;
  uint64_t v331 = (int)levels;
  uint64_t v77 = self->_pyr->textureUV[v48];
  uint64_t v78 = objc_msgSend_colorAttachments(v72, v73, v74, v75);
  long long v81 = objc_msgSend_objectAtIndexedSubscript_(v78, v79, 0, v80);
  objc_msgSend_setTexture_(v81, v82, (uint64_t)v77, v83);

  uint64_t v87 = objc_msgSend_colorAttachments(v76, v84, v85, v86);
  int v90 = objc_msgSend_objectAtIndexedSubscript_(v87, v88, 0, v89);
  objc_msgSend_setLoadAction_(v90, v91, 0, v92);

  objc_storeStrong(location, *(id *)&v9[8 * v48 + 336]);
  id v93 = location[2];
  *(_OWORD *)&location[1] = 0u;

  objc_storeStrong(&location[3], *(id *)&v9[8 * v48 + 496]);
  uint64_t v94 = (void *)*((void *)&v339 + 1);
  long long v339 = 0u;

  uint64_t v95 = (void *)v340;
  *(void *)&long long v340 = 0;

  objc_storeStrong((id *)&v341, self->_localGainMapTex);
  objc_storeStrong((id *)&v341 + 1, obj);
  objc_storeStrong(v344, v314);
  if (self->_options.enableNoiseMap) {
    uint64_t v96 = self->_noiseMapPyramid->textureY[v48];
  }
  else {
    uint64_t v96 = 0;
  }
  objc_storeStrong((id *)&v342, v96);
  if (self->_options.enableNoiseMap) {
    int v97 = self->_noiseMapPyramid->textureUV[v48];
  }
  else {
    int v97 = 0;
  }
  objc_storeStrong((id *)&v342 + 1, v97);
  double v98 = (void *)v343;
  *(void *)&long long v343 = 0;

  id v320 = v68[1];
  objc_msgSend_runShader_shader_desc_uniforms_uniforms2_uniforms3_(self, v99, (uint64_t)location, (uint64_t)v320, v76, self->_uniforms[v48], 0, self->_roiTxUniform);

  if ((int)v317 < 1)
  {
LABEL_86:
    int v301 = 0;
    goto LABEL_87;
  }
  uint64_t v103 = 0;
  v307 = (void **)(v9 + 8);
  unint64_t v321 = 8 * (v331 - 2);
  uint64_t v322 = v331 - 2;
  v311 = &v9[v321];
  uint64_t v104 = -8;
  int64x2_t v309 = vdupq_n_s64(0x10uLL);
  v332 = v9;
  uint64_t v319 = v317;
  v315 = &v9[8 * v317];
  p_localGainMapTeCGFloat x = &self->_localGainMapTex;
  v312 = &self->_localGainMapTex + v317;
  uint64_t v105 = v317;
  uint64_t v326 = v317;
  v310 = v9;
  while (1)
  {
    uint64_t v106 = v105 + v103;
    uint64_t v107 = self->_pyr->levels;
    if (v105 + v103 > v107) {
      sub_2630117F8();
    }
    uint64_t v324 = v104;
    uint64_t v108 = v322 + v103;
    uint64_t v109 = v106 - 1;
    if (v106 != 1 && v108 < 0) {
      sub_263011824();
    }
    uint64_t v318 = v105 + v103;
    uint64_t v110 = objc_msgSend_sharedInstance(DenoiseRemixStageShared, v100, v101, v102);
    uint64_t v112 = v110;
    int v113 = self->_options.enableLowVarSharpening
         ? 1
         : *((unsigned __int8 *)&self->_pyr->textureUV[20] + v105 + v103 + 7);
    BOOL v114 = !v109 || self->_pyr->isFP16[v322 + v103];
    objc_msgSend_getShaders_lumaFP16_chromaFP16_options_(v110, v111, (uint64_t)self->_metal, v113 != 0, v114, p_options);
    v329 = (id *)objc_claimAutoreleasedReturnValue();

    v334 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v115, v116, v117);
    if (!v334) {
      break;
    }
    if (!v108 && (FigMetalIsValid() & 1) == 0)
    {
      uint64_t v121 = objc_msgSend_width(v307[42], v118, v119, v120);
      int v125 = objc_msgSend_desc(v308, v122, v123, v124);
      objc_msgSend_setWidth_(v125, v126, v121, v127);

      uint64_t v131 = objc_msgSend_height(v307[42], v128, v129, v130);
      v135 = objc_msgSend_desc(v308, v132, v133, v134);
      objc_msgSend_setHeight_(v135, v136, v131, v137);

      uint64_t v141 = self->_pyr->isFP16[0] ? 65 : 30;
      uint64_t v142 = objc_msgSend_desc(v308, v138, v139, v140);
      objc_msgSend_setPixelFormat_(v142, v143, v141, v144);

      objc_msgSend_setLabel_(v308, v145, 0, v146);
      v150 = objc_msgSend_allocator(self->_metal, v147, v148, v149);
      uint64_t v153 = objc_msgSend_newTextureWithDescriptor_(v150, v151, (uint64_t)v308, v152);
      uint64_t v154 = self->_pyr;
      uint64_t v155 = v154->textureUV[0];
      v154->textureUV[0] = (MTLTexture *)v153;

      if (!self->_pyr->textureUV[0]) {
        break;
      }
    }
    if (self->_options.enableLowVarSharpening && (FigMetalIsValid() & 1) == 0)
    {
      uint64_t v156 = objc_msgSend_width(*(void **)&v315[8 * v103 + 328], v118, v119, v120);
      int v160 = objc_msgSend_desc(v308, v157, v158, v159);
      objc_msgSend_setWidth_(v160, v161, v156, v162);

      uint64_t v166 = objc_msgSend_height(*(void **)&v315[8 * v103 + 328], v163, v164, v165);
      double v170 = objc_msgSend_desc(v308, v167, v168, v169);
      objc_msgSend_setHeight_(v170, v171, v166, v172);

      uint64_t v176 = objc_msgSend_desc(v308, v173, v174, v175);
      objc_msgSend_setPixelFormat_(v176, v177, 25, v178);

      objc_msgSend_setLabel_(v308, v179, 0, v180);
      v184 = objc_msgSend_allocator(self->_metal, v181, v182, v183);
      uint64_t v187 = objc_msgSend_newTextureWithDescriptor_(v184, v185, (uint64_t)v308, v186);
      int v188 = &self->_sharpeningPyramid->textureY[v326] + v103;
      BOOL v189 = *(v188 - 1);
      *(v188 - 1) = (MTLTexture *)v187;

      if (!*((void *)&self->_sharpeningPyramid->pixelBuffer2[v103 + 19] + v326)) {
        break;
      }
    }
    uint64_t v190 = 24;
    if (!self->_options.enableLowVarSharpening) {
      uint64_t v190 = 8;
    }
    id v191 = (uint64_t *)(*(char **)((char *)&self->super.isa + v190) + 336);
    if (v109)
    {
      uint64_t v192 = v191[v326 - 1 + v103];
      id v193 = objc_msgSend_colorAttachments(v334, v118, v119, v120);
      v196 = objc_msgSend_objectAtIndexedSubscript_(v193, v194, 0, v195);
      objc_msgSend_setTexture_(v196, v197, v192, v198);

      v202 = objc_msgSend_colorAttachments(v334, v199, v200, v201);
      v205 = objc_msgSend_objectAtIndexedSubscript_(v202, v203, 0, v204);
      objc_msgSend_setLoadAction_(v205, v206, 0, v207);

      uint64_t v208 = *((void *)&self->_pyr->textureUV[v321 / 8] + v103);
      v212 = objc_msgSend_colorAttachments(v334, v209, v210, v211);
      v215 = objc_msgSend_objectAtIndexedSubscript_(v212, v213, 1, v214);
      objc_msgSend_setTexture_(v215, v216, v208, v217);

      v221 = objc_msgSend_colorAttachments(v334, v218, v219, v220);
      objc_msgSend_objectAtIndexedSubscript_(v221, v222, 1, v223);
    }
    else
    {
      uint64_t v224 = *v191;
      v225 = objc_msgSend_colorAttachments(v334, v118, v119, v120);
      v228 = objc_msgSend_objectAtIndexedSubscript_(v225, v226, 0, v227);
      objc_msgSend_setTexture_(v228, v229, v224, v230);

      v221 = objc_msgSend_colorAttachments(v334, v231, v232, v233);
      objc_msgSend_objectAtIndexedSubscript_(v221, v234, 0, v235);
    v236 = };
    uint64_t v237 = (v107 - 1);
    objc_msgSend_setLoadAction_(v236, v238, 0, v239);

    objc_storeStrong(location, *(id *)&v315[8 * v103 + 328]);
    if (v109 == v237)
    {
      id v240 = location[1];
      location[1] = 0;

      v241 = 0;
      unint64_t v242 = v321;
      uint64_t v243 = v317;
    }
    else
    {
      uint64_t v243 = v317;
      objc_storeStrong(&location[1], *((id *)&self->_pyr->textureY[v326] + v103));
      v241 = *(void **)&v315[8 * v103 + 336];
      unint64_t v242 = v321;
    }
    objc_storeStrong(&location[2], v241);
    v244 = (id *)&v332[v242];
    if (!v109) {
      v244 = (id *)v9;
    }
    objc_storeStrong(&location[3], v244[62]);
    if (v109)
    {
      objc_storeStrong((id *)&v339, *(id *)((char *)&self->_pyr->textureUV[v103 + 1] + v242));
      v245 = *(void **)&v311[8 * v103 + 504];
    }
    else
    {
      v246 = (void *)v339;
      *(void *)&long long v339 = 0;

      v245 = 0;
    }
    objc_storeStrong((id *)&v339 + 1, v245);
    v247 = (void *)v340;
    *(void *)&long long v340 = 0;

    objc_storeStrong((id *)&v341, self->_localGainMapTex);
    objc_storeStrong((id *)&v341 + 1, obj);
    objc_storeStrong(v344, v314);
    if (self->_options.enableNoiseMap) {
      v248 = (void *)*((void *)&self->_noiseMapPyramid->pixelBuffer2[v103 + 19] + v243);
    }
    else {
      v248 = 0;
    }
    objc_storeStrong((id *)&v342, v248);
    v249 = 0;
    if (v109 && self->_options.enableNoiseMap) {
      v249 = *(MTLTexture **)((char *)&self->_noiseMapPyramid->textureUV[v103] + v242);
    }
    objc_storeStrong((id *)&v342 + 1, v249);
    uint64_t v250 = 24;
    if (!self->_options.enableLowVarSharpening) {
      uint64_t v250 = 8;
    }
    objc_storeStrong((id *)&v343, *(id *)(*(char **)((char *)&self->super.isa + v250) + 8 * v103 + v243 * 8 + 328));
    v251 = self->_options.enableLowVarSharpening
         ? (void *)*((void *)&self->_pyr->pixelBuffer2[v103 + 19] + v243)
         : 0;
    objc_storeStrong((id *)&v343 + 1, v251);
    if (location[0] == (id)v343) {
      break;
    }
    uint64_t v252 = --v319;
    if (v109 == v237)
    {
      id v253 = v329[2];

      v255 = v312[v103];
      if (v109)
      {
        uniforms = &self->_uniforms[v252];
LABEL_67:
        uint64_t v257 = *((void *)&self->_uniforms[v321 / 8] + v103);
        goto LABEL_72;
      }
      uint64_t v257 = 0;
      uniforms = &p_localGainMapTex[v243];
    }
    else
    {
      if (v109)
      {
        id v253 = v329[3];

        uniforms = &p_localGainMapTex[v243];
        v255 = v312[v103];
        goto LABEL_67;
      }
      uint64_t v258 = 5;
      if (!self->_options.enableBandZeroDenoising) {
        uint64_t v258 = 4;
      }
      id v253 = v329[v258];

      uint64_t v257 = 0;
      v255 = self->_uniforms[0];
      uniforms = self->_uniforms;
    }
LABEL_72:
    id v320 = v253;
    objc_msgSend_runShader_shader_desc_uniforms_uniforms2_uniforms3_(self, v254, (uint64_t)location, (uint64_t)v253, v334, v255, v257, self->_roiTxUniform);
    if (self->_options.enableLowVarSharpening)
    {
      id v259 = *((id *)&v343 + 1);
      unsigned int v263 = objc_msgSend_width(v259, v260, v261, v262);
      unsigned int v267 = objc_msgSend_height(v259, v264, v265, v266);
      if ((void)v343 == *((void *)&v343 + 1))
      {
        FigDebugAssert3();
        int v301 = FigSignalErrorAt();

        goto LABEL_97;
      }
      unsigned int v271 = v267;
      v272 = objc_msgSend_sharedInstance(DenoiseRemixStageShared, v268, v269, v270);
      objc_msgSend_getShaders_lumaFP16_chromaFP16_options_(v272, v273, (uint64_t)self->_metal, *((unsigned __int8 *)&self->_pyr->textureUV[20] + v317 + v103 + 7), 1, p_options);
      v274 = (uint64_t *)objc_claimAutoreleasedReturnValue();

      v278 = objc_msgSend_commandQueue(self->_metal, v275, v276, v277);
      v282 = objc_msgSend_commandBuffer(v278, v279, v280, v281);

      if (!v282)
      {
        FigDebugAssert3();
        int v301 = FigSignalErrorAt();
        goto LABEL_96;
      }
      v286 = objc_msgSend_computeCommandEncoder(v282, v283, v284, v285);
      v289 = v286;
      if (!v286)
      {
        FigDebugAssert3();
        int v301 = FigSignalErrorAt();

LABEL_96:
        v329 = (id *)v274;
LABEL_97:
        uint64_t v9 = v310;
        goto LABEL_101;
      }
      objc_msgSend_setComputePipelineState_(v286, v287, v274[6], v288);
      objc_msgSend_setTextures_withRange_(v289, v290, (uint64_t)location, 0, 15);
      objc_msgSend_setBuffer_offset_atIndex_(v289, v291, (uint64_t)*uniforms, 0, 0);
      objc_msgSend_setBuffer_offset_atIndex_(v289, v292, (uint64_t)self->_roiTxUniform, 0, 2);
      objc_msgSend_setImageblockWidth_height_(v289, v293, 16, 16);
      v337[0] = ((v263 >> 1) + 13) / 0xEuLL;
      v337[1] = ((v271 >> 1) + 13) / 0xEuLL;
      v337[2] = 1;
      int64x2_t v335 = v309;
      uint64_t v336 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v289, v294, (uint64_t)v337, (uint64_t)&v335);
      objc_msgSend_endEncoding(v289, v295, v296, v297);
      objc_msgSend_commit(v282, v298, v299, v300);
      FigMetalDecRef();

      uint64_t v9 = v310;
    }
    else
    {
      v274 = (uint64_t *)v329;
    }
    uint64_t v105 = v317;
    if (v318 < self->_pyr->levels) {
      FigMetalDecRef();
    }
    if (v109 && v322 + v103 + 1 < self->_pyr->levels) {
      FigMetalDecRef();
    }
    if (self->_options.enableNoiseMap)
    {
      FigMetalDecRef();
      FigMetalDecRef();
    }

    --v103;
    uint64_t v104 = v324 - 8;
    v332 -= 8;
    --p_localGainMapTex;
    if ((unint64_t)(v317 + v103 + 1) <= 1) {
      goto LABEL_86;
    }
  }
  FigDebugAssert3();
  int v301 = FigSignalErrorAt();
LABEL_101:

LABEL_87:
  id v10 = v305;
  uint64_t v20 = v308;
  v302 = v320;
LABEL_88:

  for (uint64_t i = 14; i != -1; --i)
  return v301;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformsHeap, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_roiTxUniform, 0);
  for (uint64_t i = 192; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_localGainMapTex, 0);
  objc_storeStrong((id *)&self->_sharpeningPyramid, 0);
  objc_storeStrong((id *)&self->_noiseMapPyramid, 0);

  objc_storeStrong((id *)&self->_pyr, 0);
}

@end