@interface DeepFusionDeferredProcessingPlist
- (id)addBackModulationBandsForModel:(int)a3;
- (id)chromaBoostBandsForModel:(int)a3 isSyntheticLongWithRealLong:(BOOL)a4;
- (id)darkEdgeSuppressionBandsForModel:(int)a3;
- (id)desaturationDataForModel:(int)a3;
- (id)fusionDataForModel:(int)a3;
- (id)haloSuppressionBandsForModel:(int)a3;
- (id)noiseTuningForModel:(int)a3;
- (int)modelForEIT:(float)a3;
- (int)readBandData:(id)a3 into:(id)a4;
- (int)readChromaBoostBandData:(id)a3 into:(id)a4 key:(id)a5;
- (int)readDarkEdgeSuppressionBandData:(id)a3 into:(id)a4;
- (int)readDesaturationData:(id)a3 into:(id)a4;
- (int)readHaloSuppressionBandData:(id)a3 into:(id)a4;
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionDeferredProcessingPlist

- (int)modelForEIT:(float)a3
{
  return self->modelSwitchEITThreshold <= a3;
}

- (id)addBackModulationBandsForModel:(int)a3
{
  if (objc_msgSend_count(self->addBackModulationBands, a2, *(uint64_t *)&a3, v3) <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->addBackModulationBands, v6, a3, v7);
  }

  return v8;
}

- (id)noiseTuningForModel:(int)a3
{
  if (objc_msgSend_count(self->noiseTuning, a2, *(uint64_t *)&a3, v3) <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->noiseTuning, v6, a3, v7);
  }

  return v8;
}

- (id)fusionDataForModel:(int)a3
{
  if (objc_msgSend_count(self->fusionData, a2, *(uint64_t *)&a3, v3) <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->fusionData, v6, a3, v7);
  }

  return v8;
}

- (id)chromaBoostBandsForModel:(int)a3 isSyntheticLongWithRealLong:(BOOL)a4
{
  unint64_t v5 = !a4 | (2 * a3);
  if (v5 >= objc_msgSend_count(self->chromaBoostMaskBands, a2, *(uint64_t *)&a3, a4))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->chromaBoostMaskBands, v6, v5, v7);
  }

  return v8;
}

- (id)desaturationDataForModel:(int)a3
{
  if (objc_msgSend_count(self->desaturationData, a2, *(uint64_t *)&a3, v3) <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->desaturationData, v6, a3, v7);
  }

  return v8;
}

- (id)haloSuppressionBandsForModel:(int)a3
{
  if (objc_msgSend_count(self->haloSuppressionBands, a2, *(uint64_t *)&a3, v3) <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->haloSuppressionBands, v6, a3, v7);
  }

  return v8;
}

- (id)darkEdgeSuppressionBandsForModel:(int)a3
{
  if (objc_msgSend_count(self->darkEdgeSupressionBands, a2, *(uint64_t *)&a3, v3) <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->darkEdgeSupressionBands, v6, a3, v7);
  }

  return v8;
}

- (int)readBandData:(id)a3 into:(id)a4
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v8 = objc_msgSend_valueForKey_(a3, v6, @"Bands", v7);
  v9 = v8;
  if (v8)
  {
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id obj = v8;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v160, (uint64_t)v164, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      v158 = v9;
      uint64_t v13 = *(void *)v161;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v161 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          v16 = (void **)objc_opt_new();
          v17 = [GainValueArray alloc];
          v20 = objc_msgSend_objectForKeyedSubscript_(v15, v18, @"TextureFlatnessThreshold", v19);
          uint64_t v23 = objc_msgSend_initWithArray_(v17, v21, (uint64_t)v20, v22);
          v24 = v16[1];
          v16[1] = (void *)v23;

          v25 = [GainValueArray alloc];
          v28 = objc_msgSend_objectForKeyedSubscript_(v15, v26, @"DeghostingYMinValue", v27);
          uint64_t v31 = objc_msgSend_initWithArray_(v25, v29, (uint64_t)v28, v30);
          v32 = v16[2];
          v16[2] = (void *)v31;

          v33 = [GainValueArray alloc];
          v36 = objc_msgSend_objectForKeyedSubscript_(v15, v34, @"DeghostingUVMinValue", v35);
          uint64_t v39 = objc_msgSend_initWithArray_(v33, v37, (uint64_t)v36, v38);
          v40 = v16[3];
          v16[3] = (void *)v39;

          v41 = [GainValueArray alloc];
          v44 = objc_msgSend_objectForKeyedSubscript_(v15, v42, @"SkinYSlope", v43);
          uint64_t v47 = objc_msgSend_initWithArray_(v41, v45, (uint64_t)v44, v46);
          v48 = v16[4];
          v16[4] = (void *)v47;

          v49 = [GainValueArray alloc];
          v52 = objc_msgSend_objectForKeyedSubscript_(v15, v50, @"SkinUVSlope", v51);
          uint64_t v55 = objc_msgSend_initWithArray_(v49, v53, (uint64_t)v52, v54);
          v56 = v16[5];
          v16[5] = (void *)v55;

          v57 = [GainValueArray alloc];
          v60 = objc_msgSend_objectForKeyedSubscript_(v15, v58, @"SkyLumaSlope", v59);
          uint64_t v63 = objc_msgSend_initWithArray_(v57, v61, (uint64_t)v60, v62);
          v64 = v16[6];
          v16[6] = (void *)v63;

          v65 = [GainValueArray alloc];
          v68 = objc_msgSend_objectForKeyedSubscript_(v15, v66, @"YSlope", v67);
          uint64_t v71 = objc_msgSend_initWithArray_(v65, v69, (uint64_t)v68, v70);
          v72 = v16[7];
          v16[7] = (void *)v71;

          v73 = [GainValueArray alloc];
          v76 = objc_msgSend_objectForKeyedSubscript_(v15, v74, @"YAlpha", v75);
          uint64_t v79 = objc_msgSend_initWithArray_(v73, v77, (uint64_t)v76, v78);
          v80 = v16[8];
          v16[8] = (void *)v79;

          v81 = [GainValueArray alloc];
          v84 = objc_msgSend_objectForKeyedSubscript_(v15, v82, @"UVAlpha", v83);
          uint64_t v87 = objc_msgSend_initWithArray_(v81, v85, (uint64_t)v84, v86);
          v88 = v16[9];
          v16[9] = (void *)v87;

          if (!objc_msgSend_count(v5, v89, v90, v91))
          {
            v95 = [GainValueArray alloc];
            v98 = objc_msgSend_objectForKeyedSubscript_(v15, v96, @"TextureClippingThresholdLow", v97);
            uint64_t v101 = objc_msgSend_initWithArray_(v95, v99, (uint64_t)v98, v100);
            v102 = v16[10];
            v16[10] = (void *)v101;

            v103 = [GainValueArray alloc];
            v106 = objc_msgSend_objectForKeyedSubscript_(v15, v104, @"TextureClippingThresholdHigh", v105);
            uint64_t v109 = objc_msgSend_initWithArray_(v103, v107, (uint64_t)v106, v108);
            v110 = v16[11];
            v16[11] = (void *)v109;

            v111 = [GainValueArray alloc];
            v114 = objc_msgSend_objectForKeyedSubscript_(v15, v112, @"TextureShadingSuppressionInversePower", v113);
            uint64_t v117 = objc_msgSend_initWithArray_(v111, v115, (uint64_t)v114, v116);
            v118 = v16[12];
            v16[12] = (void *)v117;
          }
          if ((objc_msgSend_isValid(v16[1], v92, v93, v94) & 1) == 0
            || (objc_msgSend_isValid(v16[2], v119, v120, v121) & 1) == 0
            || (objc_msgSend_isValid(v16[3], v122, v123, v124) & 1) == 0
            || (objc_msgSend_isValid(v16[4], v125, v126, v127) & 1) == 0
            || (objc_msgSend_isValid(v16[5], v128, v129, v130) & 1) == 0
            || (objc_msgSend_isValid(v16[6], v131, v132, v133) & 1) == 0
            || (objc_msgSend_isValid(v16[7], v134, v135, v136) & 1) == 0
            || (objc_msgSend_isValid(v16[8], v137, v138, v139) & 1) == 0
            || (objc_msgSend_isValid(v16[9], v140, v141, v142) & 1) == 0
            || !objc_msgSend_count(v5, v143, v144, v145)
            && ((objc_msgSend_isValid(v16[10], v146, v147, v148) & 1) == 0
             || (objc_msgSend_isValid(v16[11], v149, v150, v151) & 1) == 0
             || (objc_msgSend_isValid(v16[12], v152, v153, v154) & 1) == 0))
          {
            FigDebugAssert3();

            int v156 = -1;
            goto LABEL_27;
          }
          objc_msgSend_addObject_(v5, v146, (uint64_t)v16, v148);
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v155, (uint64_t)&v160, (uint64_t)v164, 16);
        if (v12) {
          continue;
        }
        break;
      }
      int v156 = 0;
LABEL_27:
      v9 = v158;
    }
    else
    {
      int v156 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v156 = FigSignalErrorAt();
  }

  return v156;
}

- (int)readChromaBoostBandData:(id)a3 into:(id)a4 key:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v71 = a4;
  v9 = objc_msgSend_objectForKeyedSubscript_(a3, v7, (uint64_t)a5, v8);
  uint64_t v12 = v9;
  if (v9
    && (objc_msgSend_valueForKey_(v9, v10, @"Bands", v11),
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v13;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v72, (uint64_t)v76, 16);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v73;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v73 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v20 = (void **)objc_opt_new();
          v21 = [GainValueArray alloc];
          v24 = objc_msgSend_objectForKeyedSubscript_(v19, v22, @"ColorMatchThresholdStart", v23);
          uint64_t v27 = objc_msgSend_initWithArray_(v21, v25, (uint64_t)v24, v26);
          v28 = v20[1];
          v20[1] = (void *)v27;

          v29 = [GainValueArray alloc];
          v32 = objc_msgSend_objectForKeyedSubscript_(v19, v30, @"ColorMatchThresholdEnd", v31);
          uint64_t v35 = objc_msgSend_initWithArray_(v29, v33, (uint64_t)v32, v34);
          v36 = v20[2];
          v20[2] = (void *)v35;

          v37 = [GainValueArray alloc];
          v40 = objc_msgSend_objectForKeyedSubscript_(v19, v38, @"EdgeMatchThresholdStart", v39);
          uint64_t v43 = objc_msgSend_initWithArray_(v37, v41, (uint64_t)v40, v42);
          v44 = v20[3];
          v20[3] = (void *)v43;

          v45 = [GainValueArray alloc];
          v48 = objc_msgSend_objectForKeyedSubscript_(v19, v46, @"EdgeMatchThresholdEnd", v47);
          uint64_t v51 = objc_msgSend_initWithArray_(v45, v49, (uint64_t)v48, v50);
          v52 = v20[4];
          v20[4] = (void *)v51;

          if ((objc_msgSend_isValid(v20[1], v53, v54, v55) & 1) == 0
            || (objc_msgSend_isValid(v20[2], v56, v57, v58) & 1) == 0
            || (objc_msgSend_isValid(v20[3], v59, v60, v61) & 1) == 0
            || (objc_msgSend_isValid(v20[4], v62, v63, v64) & 1) == 0)
          {
            FigDebugAssert3();

            int v68 = -1;
            goto LABEL_17;
          }
          objc_msgSend_addObject_(v71, v65, (uint64_t)v20, v66);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v67, (uint64_t)&v72, (uint64_t)v76, 16);
        if (v16) {
          continue;
        }
        break;
      }
      int v68 = 0;
    }
    else
    {
      int v68 = 0;
    }
LABEL_17:
  }
  else
  {
    FigDebugAssert3();
    int v68 = FigSignalErrorAt();
  }

  return v68;
}

- (int)readHaloSuppressionBandData:(id)a3 into:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v8 = objc_msgSend_valueForKey_(a3, v6, @"Bands", v7);
  v9 = v8;
  if (v8)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v8;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = objc_opt_new();
          uint64_t v17 = [GainValueArray alloc];
          v20 = objc_msgSend_objectForKeyedSubscript_(v15, v18, @"HaloSuppressionStrength", v19);
          uint64_t v23 = objc_msgSend_initWithArray_(v17, v21, (uint64_t)v20, v22);
          v24 = (void *)v16[1];
          v16[1] = v23;

          if (!v16[1])
          {
            FigDebugAssert3();

            int v28 = -1;
            goto LABEL_13;
          }
          objc_msgSend_addObject_(v5, v25, (uint64_t)v16, v26);
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v12) {
          continue;
        }
        break;
      }
      int v28 = 0;
    }
    else
    {
      int v28 = 0;
    }
LABEL_13:
  }
  else
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
  }

  return v28;
}

- (int)readDarkEdgeSuppressionBandData:(id)a3 into:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v46 = a4;
  uint64_t v7 = objc_msgSend_valueForKey_(a3, v5, @"Bands", v6);
  uint64_t v8 = v7;
  if (v7)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v7;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v47, (uint64_t)v51, 16);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v15 = objc_opt_new();
          uint64_t v16 = [GainValueArray alloc];
          uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v14, v17, @"DarkEdgeSuppressionLumaThresholdLow", v18);
          uint64_t v22 = objc_msgSend_initWithArray_(v16, v20, (uint64_t)v19, v21);
          uint64_t v23 = (void *)v15[2];
          v15[2] = v22;

          if (!v15[2]) {
            goto LABEL_14;
          }
          v24 = [GainValueArray alloc];
          uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v14, v25, @"DarkEdgeSuppressionLumaThresholdHigh", v26);
          uint64_t v30 = objc_msgSend_initWithArray_(v24, v28, (uint64_t)v27, v29);
          long long v31 = (void *)v15[1];
          v15[1] = v30;

          if (!v15[1]) {
            goto LABEL_14;
          }
          long long v32 = [GainValueArray alloc];
          uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v14, v33, @"DarkEdgeSuppressionLumaDiffThreshold", v34);
          uint64_t v38 = objc_msgSend_initWithArray_(v32, v36, (uint64_t)v35, v37);
          uint64_t v39 = (void *)v15[3];
          v15[3] = v38;

          if (!v15[3])
          {
LABEL_14:
            FigDebugAssert3();

            int v43 = -1;
            goto LABEL_15;
          }
          objc_msgSend_addObject_(v46, v40, (uint64_t)v15, v41);
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v47, (uint64_t)v51, 16);
        if (v11) {
          continue;
        }
        break;
      }
      int v43 = 0;
    }
    else
    {
      int v43 = 0;
    }
LABEL_15:
  }
  else
  {
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
  }

  return v43;
}

- (int)readDesaturationData:(id)a3 into:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void **)a4;
  if (v5)
  {
    uint64_t v7 = [GainValueArray alloc];
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v8, @"YThresh", v9);
    uint64_t v13 = objc_msgSend_initWithArray_(v7, v11, (uint64_t)v10, v12);
    v14 = v6[1];
    v6[1] = (void *)v13;

    uint64_t v15 = [GainValueArray alloc];
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v5, v16, @"Sigma", v17);
    uint64_t v21 = objc_msgSend_initWithArray_(v15, v19, (uint64_t)v18, v20);
    uint64_t v22 = v6[2];
    v6[2] = (void *)v21;

    uint64_t v23 = [GainValueArray alloc];
    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v5, v24, @"Strength", v25);
    uint64_t v29 = objc_msgSend_initWithArray_(v23, v27, (uint64_t)v26, v28);
    uint64_t v30 = v6[3];
    v6[3] = (void *)v29;

    if ((objc_msgSend_isValid(v6[1], v31, v32, v33) & 1) != 0
      && (objc_msgSend_isValid(v6[2], v34, v35, v36) & 1) != 0
      && (objc_msgSend_isValid(v6[3], v37, v38, v39) & 1) != 0)
    {
      int v40 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v40 = -1;
    }
  }
  else
  {
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
  }

  return v40;
}

- (int)readPlist:(id)a3
{
  v172[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v172[0] = @"ModelLowEIT";
  v172[1] = @"ModelHighEIT";
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v172, 2);
  id obj = (id)objc_opt_new();
  id v165 = (id)objc_opt_new();
  id v154 = (id)objc_opt_new();
  id v153 = (id)objc_opt_new();
  id v152 = (id)objc_opt_new();
  id v151 = (id)objc_opt_new();
  id v150 = (id)objc_opt_new();
  id v149 = (id)objc_opt_new();
  if (!v4 || objc_msgSend_count(v6, v7, v8, v9) != 2)
  {
    FigDebugAssert3();
    int v145 = FigSignalErrorAt();
    v92 = 0;
    v102 = 0;
    uint64_t v147 = 0;
    v146 = 0;
    uint64_t v101 = 0;
    uint64_t v12 = 0;
    goto LABEL_36;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v14 = 0;
  long long v163 = 0;
  v164 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  char v17 = 1;
  long long v161 = v6;
  long long v162 = v4;
  uint64_t v18 = v4;
  do
  {
    v159 = v15;
    long long v160 = v14;
    v158 = v16;
    char v19 = v17;
    uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v6, v10, v13, v11);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v18, v21, (uint64_t)v20, v22);
    id v4 = v18;
    if (!v23)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();
LABEL_39:
      uint64_t v147 = v163;
      v146 = v164;
      goto LABEL_35;
    }
    char v156 = v19;
    uint64_t v24 = objc_opt_new();

    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v23, v25, @"AddBackModulation", v26);
    int BandData_into = objc_msgSend_readBandData_into_(self, v28, (uint64_t)v27, v24);

    if (BandData_into)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();
      uint64_t v12 = (void *)v24;
      goto LABEL_39;
    }
    v157 = v20;
    objc_msgSend_addObject_(obj, v30, v24, v31);
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    v170[0] = @"SL_EV0_LONG";
    v170[1] = @"SL_EV0";
    uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)v170, 2);
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v166, (uint64_t)v171, 16);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v167;
      uint64_t v12 = (void *)v24;
LABEL_8:
      uint64_t v38 = 0;
      uint64_t v39 = v12;
      while (1)
      {
        if (*(void *)v167 != v37) {
          objc_enumerationMutation(v33);
        }
        uint64_t v40 = *(void *)(*((void *)&v166 + 1) + 8 * v38);
        uint64_t v12 = objc_opt_new();

        int v43 = objc_msgSend_objectForKeyedSubscript_(v23, v41, @"ChromaBoost", v42);
        LODWORD(v40) = objc_msgSend_readChromaBoostBandData_into_key_(self, v44, (uint64_t)v43, (uint64_t)v12, v40);

        if (v40) {
          break;
        }
        objc_msgSend_addObject_(v165, v45, (uint64_t)v12, v46);
        ++v38;
        uint64_t v39 = v12;
        if (v36 == v38)
        {
          uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v47, (uint64_t)&v166, (uint64_t)v171, 16);
          if (v36) {
            goto LABEL_8;
          }
          goto LABEL_16;
        }
      }
LABEL_31:
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      uint64_t v6 = v161;
      id v4 = v162;
LABEL_32:
      v146 = v164;
LABEL_33:
      uint64_t v147 = v163;
LABEL_34:
      uint64_t v20 = v157;
LABEL_35:

      v92 = v158;
      v102 = v159;
      uint64_t v101 = v160;
      goto LABEL_36;
    }
    uint64_t v12 = (void *)v24;
LABEL_16:

    uint64_t v33 = objc_opt_new();
    long long v50 = objc_msgSend_objectForKeyedSubscript_(v23, v48, @"Desaturation", v49);
    int DesaturationData_into = objc_msgSend_readDesaturationData_into_(self, v51, (uint64_t)v50, (uint64_t)v33);

    if (DesaturationData_into) {
      goto LABEL_31;
    }
    objc_msgSend_addObject_(v154, v53, (uint64_t)v33, v54);
    uint64_t v55 = objc_opt_new();

    uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v23, v56, @"NoiseTuning", v57);
    int Plist = objc_msgSend_readPlist_(v55, v59, (uint64_t)v58, v60);

    objc_msgSend_addObject_(v153, v62, (uint64_t)v55, v63);
    uint64_t v6 = v161;
    id v4 = v162;
    if (Plist)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      long long v160 = v55;
      goto LABEL_32;
    }
    uint64_t v64 = objc_opt_new();

    if (!v64)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      v146 = 0;
      long long v160 = v55;
      goto LABEL_33;
    }
    uint64_t v67 = v55;
    uint64_t v68 = (uint64_t)v64;
    v69 = objc_msgSend_objectForKeyedSubscript_(v23, v65, @"Fusion", v66);
    int v72 = objc_msgSend_readPlist_(v64, v70, (uint64_t)v69, v71);

    v164 = (void *)v68;
    objc_msgSend_addObject_(v152, v73, v68, v74);
    if (v72) {
      goto LABEL_45;
    }
    long long v75 = objc_opt_new();

    if (!v75)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      uint64_t v147 = 0;
      long long v160 = v67;
      v146 = v164;
      goto LABEL_49;
    }
    uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v23, v76, @"HighlightTuning", v77);
    int v81 = objc_msgSend_readPlist_(v75, v79, (uint64_t)v78, v80);

    long long v163 = v75;
    objc_msgSend_addObject_(v151, v82, (uint64_t)v75, v83);
    if (v81)
    {
LABEL_45:
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      goto LABEL_48;
    }
    uint64_t v84 = objc_opt_new();

    uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v23, v85, @"HaloSuppression", v86);
    HaloSuppressionint BandData_into = objc_msgSend_readHaloSuppressionBandData_into_(self, v88, (uint64_t)v87, v84);

    if (HaloSuppressionBandData_into)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      v159 = (void *)v84;
LABEL_48:
      long long v160 = v67;
      uint64_t v147 = v163;
      v146 = v164;
LABEL_49:
      uint64_t v6 = v161;
      id v4 = v162;
      goto LABEL_34;
    }
    objc_msgSend_addObject_(v150, v90, v84, v91);
    v92 = objc_opt_new();

    objc_msgSend_objectForKeyedSubscript_(v23, v93, @"DarkEdgeSuppression", v94);
    v96 = v95 = (void *)v84;
    DarkEdgeSuppressionint BandData_into = objc_msgSend_readDarkEdgeSuppressionBandData_into_(self, v97, (uint64_t)v96, (uint64_t)v92);

    if (DarkEdgeSuppressionBandData_into)
    {
      FigDebugAssert3();
      int v145 = FigSignalErrorAt();

      v158 = v92;
      v159 = v95;
      goto LABEL_48;
    }
    objc_msgSend_addObject_(v149, v99, (uint64_t)v92, v100);

    char v17 = 0;
    uint64_t v13 = 1;
    uint64_t v101 = v67;
    v14 = v67;
    uint64_t v15 = v95;
    uint64_t v16 = v92;
    uint64_t v6 = v161;
    uint64_t v18 = v162;
  }
  while ((v156 & 1) != 0);
  v102 = v95;
  objc_storeStrong((id *)&self->addBackModulationBands, obj);
  objc_storeStrong((id *)&self->noiseTuning, v153);
  objc_storeStrong((id *)&self->fusionData, v152);
  objc_storeStrong((id *)&self->highlightTuning, v151);
  objc_storeStrong((id *)&self->chromaBoostMaskBands, v165);
  objc_storeStrong((id *)&self->desaturationData, v154);
  objc_storeStrong((id *)&self->haloSuppressionBands, v150);
  objc_storeStrong((id *)&self->darkEdgeSupressionBands, v149);
  uint64_t v105 = objc_msgSend_objectForKeyedSubscript_(v162, v103, @"ModelSwitchEITThreshold", v104);

  id v4 = v162;
  if (!v105) {
    goto LABEL_51;
  }
  uint64_t v108 = objc_msgSend_objectForKeyedSubscript_(v162, v106, @"ModelSwitchEITThreshold", v107);
  objc_msgSend_floatValue(v108, v109, v110, v111);
  self->modelSwitchEITThreshold = v112;

  v115 = objc_msgSend_objectForKeyedSubscript_(v162, v113, @"DenseRegistrationMotionScoreThreshold", v114);

  if (!v115) {
    goto LABEL_51;
  }
  v118 = objc_msgSend_objectForKeyedSubscript_(v162, v116, @"DenseRegistrationMotionScoreThreshold", v117);
  objc_msgSend_floatValue(v118, v119, v120, v121);
  self->denseRegistrationMotionScoreThreshold = v122;

  uint64_t v123 = [GainValueArray alloc];
  uint64_t v126 = objc_msgSend_objectForKeyedSubscript_(v162, v124, @"EV0BlurThreshold", v125);
  uint64_t v129 = (GainValueArray *)objc_msgSend_initWithArray_(v123, v127, (uint64_t)v126, v128);
  EV0BlurThreshold = self->EV0BlurThreshold;
  self->EV0BlurThreshold = v129;

  if ((objc_msgSend_isValid(self->EV0BlurThreshold, v131, v132, v133) & 1) == 0) {
    goto LABEL_51;
  }
  v134 = [GainValueArray alloc];
  v137 = objc_msgSend_objectForKeyedSubscript_(v162, v135, @"FilteredChromaAlpha", v136);
  v140 = (GainValueArray *)objc_msgSend_initWithArray_(v134, v138, (uint64_t)v137, v139);
  filteredChromaAlpha = self->filteredChromaAlpha;
  self->filteredChromaAlpha = v140;

  if (objc_msgSend_isValid(self->filteredChromaAlpha, v142, v143, v144))
  {
    int v145 = 0;
  }
  else
  {
LABEL_51:
    FigDebugAssert3();
    int v145 = FigSignalErrorAt();
  }
  uint64_t v147 = v163;
  v146 = v164;
LABEL_36:

  return v145;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->darkEdgeSupressionBands, 0);
  objc_storeStrong((id *)&self->haloSuppressionBands, 0);
  objc_storeStrong((id *)&self->desaturationData, 0);
  objc_storeStrong((id *)&self->chromaBoostMaskBands, 0);
  objc_storeStrong((id *)&self->highlightTuning, 0);
  objc_storeStrong((id *)&self->fusionData, 0);
  objc_storeStrong((id *)&self->noiseTuning, 0);
  objc_storeStrong((id *)&self->addBackModulationBands, 0);
  objc_storeStrong((id *)&self->filteredChromaAlpha, 0);

  objc_storeStrong((id *)&self->EV0BlurThreshold, 0);
}

@end