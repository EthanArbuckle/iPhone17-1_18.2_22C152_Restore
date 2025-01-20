@interface SyntheticReferencePlist
- (int)_readDeepShadowRecoveryBandData:(id)a3;
- (int)_readHighlightRecoveryBandData:(id)a3;
- (int)readPlist:(id)a3;
@end

@implementation SyntheticReferencePlist

- (int)_readHighlightRecoveryBandData:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"HighlightRecover", v3);
  v8 = v5;
  if (v5
    && (objc_msgSend_valueForKey_(v5, v6, @"Bands", v7), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    v11 = (NSMutableArray *)objc_opt_new();
    highlightRecoveryBands = self->highlightRecoveryBands;
    self->highlightRecoveryBands = v11;

    if (self->highlightRecoveryBands)
    {
      v35 = v8;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v10;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v37, (uint64_t)v41, 16);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v19 = (_DWORD *)objc_opt_new();
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v18, v20, @"Ev0SifrMatchThreshold", 0, 0.0);
            v19[2] = v21;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v18, v22, @"Ev0BrightnessSmoothStepStart", 0, 0.0);
            v19[3] = v23;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v18, v24, @"Ev0BrightnessSmoothStepEnd", 0, 0.0);
            v19[4] = v25;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v18, v26, @"SifrHighSnrSmoothStepStart", 0, 0.0);
            v19[5] = v27;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v18, v28, @"SifrHighSnrSmoothStepEnd", 0, 0.0);
            v19[6] = v29;
            objc_msgSend_addObject_(self->highlightRecoveryBands, v30, (uint64_t)v19, v31);
          }
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v37, (uint64_t)v41, 16);
        }
        while (v15);
      }

      int v33 = 0;
      v8 = v35;
    }
    else
    {
      FigDebugAssert3();

      int v33 = -1;
    }
  }
  else
  {
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();
  }

  return v33;
}

- (int)_readDeepShadowRecoveryBandData:(id)a3
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"DeepShadowRecover", v3);
  v8 = v5;
  if (v5
    && (objc_msgSend_valueForKey_(v5, v6, @"Bands", v7), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    v11 = (NSMutableArray *)objc_opt_new();
    deepShadowRecoveryBands = self->deepShadowRecoveryBands;
    self->deepShadowRecoveryBands = v11;

    if (self->deepShadowRecoveryBands)
    {
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      id obj = v10;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v148, (uint64_t)v152, 16);
      if (v14)
      {
        uint64_t v15 = v14;
        v146 = v8;
        uint64_t v16 = *(void *)v149;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v149 != v16) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v148 + 1) + 8 * i);
            v19 = (void **)objc_opt_new();
            v20 = [GainValueArray alloc];
            int v23 = objc_msgSend_objectForKeyedSubscript_(v18, v21, @"Ev0DeepShadowSmoothStepStart", v22);
            uint64_t v26 = objc_msgSend_initWithArray_(v20, v24, (uint64_t)v23, v25);
            int v27 = v19[1];
            v19[1] = (void *)v26;

            v28 = [GainValueArray alloc];
            uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v18, v29, @"Ev0DeepShadowSmoothStepEnd", v30);
            uint64_t v34 = objc_msgSend_initWithArray_(v28, v32, (uint64_t)v31, v33);
            v35 = v19[2];
            v19[2] = (void *)v34;

            v36 = [GainValueArray alloc];
            long long v39 = objc_msgSend_objectForKeyedSubscript_(v18, v37, @"EdgeMatchThresholdStart", v38);
            uint64_t v42 = objc_msgSend_initWithArray_(v36, v40, (uint64_t)v39, v41);
            v43 = v19[3];
            v19[3] = (void *)v42;

            v44 = [GainValueArray alloc];
            v47 = objc_msgSend_objectForKeyedSubscript_(v18, v45, @"EdgeMatchThresholdEnd", v46);
            uint64_t v50 = objc_msgSend_initWithArray_(v44, v48, (uint64_t)v47, v49);
            v51 = v19[4];
            v19[4] = (void *)v50;

            v52 = [GainValueArray alloc];
            v55 = objc_msgSend_objectForKeyedSubscript_(v18, v53, @"ClrMatchThresholdStart", v54);
            uint64_t v58 = objc_msgSend_initWithArray_(v52, v56, (uint64_t)v55, v57);
            v59 = v19[5];
            v19[5] = (void *)v58;

            v60 = [GainValueArray alloc];
            v63 = objc_msgSend_objectForKeyedSubscript_(v18, v61, @"ClrMatchThresholdEnd", v62);
            uint64_t v66 = objc_msgSend_initWithArray_(v60, v64, (uint64_t)v63, v65);
            v67 = v19[6];
            v19[6] = (void *)v66;

            v68 = [GainValueArray alloc];
            v71 = objc_msgSend_objectForKeyedSubscript_(v18, v69, @"ShadowSigmaCorrectionNode0", v70);
            uint64_t v74 = objc_msgSend_initWithArray_(v68, v72, (uint64_t)v71, v73);
            v75 = v19[7];
            v19[7] = (void *)v74;

            v76 = [GainValueArray alloc];
            v79 = objc_msgSend_objectForKeyedSubscript_(v18, v77, @"ShadowSigmaCorrectionNode1", v78);
            uint64_t v82 = objc_msgSend_initWithArray_(v76, v80, (uint64_t)v79, v81);
            v83 = v19[8];
            v19[8] = (void *)v82;

            v84 = [GainValueArray alloc];
            v87 = objc_msgSend_objectForKeyedSubscript_(v18, v85, @"EdgeThresholdStart", v86);
            uint64_t v90 = objc_msgSend_initWithArray_(v84, v88, (uint64_t)v87, v89);
            v91 = v19[9];
            v19[9] = (void *)v90;

            v92 = [GainValueArray alloc];
            v95 = objc_msgSend_objectForKeyedSubscript_(v18, v93, @"EdgeThresholdEnd", v94);
            uint64_t v98 = objc_msgSend_initWithArray_(v92, v96, (uint64_t)v95, v97);
            v99 = v19[10];
            v19[10] = (void *)v98;

            v100 = [GainValueArray alloc];
            v103 = objc_msgSend_objectForKeyedSubscript_(v18, v101, @"EdgeGhostBoost", v102);
            uint64_t v106 = objc_msgSend_initWithArray_(v100, v104, (uint64_t)v103, v105);
            v107 = v19[11];
            v19[11] = (void *)v106;

            if ((objc_msgSend_isValid(v19[1], v108, v109, v110) & 1) == 0
              || (objc_msgSend_isValid(v19[2], v111, v112, v113) & 1) == 0
              || (objc_msgSend_isValid(v19[3], v114, v115, v116) & 1) == 0
              || (objc_msgSend_isValid(v19[4], v117, v118, v119) & 1) == 0
              || (objc_msgSend_isValid(v19[5], v120, v121, v122) & 1) == 0
              || (objc_msgSend_isValid(v19[6], v123, v124, v125) & 1) == 0
              || (objc_msgSend_isValid(v19[7], v126, v127, v128) & 1) == 0
              || (objc_msgSend_isValid(v19[8], v129, v130, v131) & 1) == 0
              || (objc_msgSend_isValid(v19[9], v132, v133, v134) & 1) == 0
              || (objc_msgSend_isValid(v19[10], v135, v136, v137) & 1) == 0
              || (objc_msgSend_isValid(v19[11], v138, v139, v140) & 1) == 0)
            {
              FigDebugAssert3();

              int v144 = -1;
              goto LABEL_25;
            }
            objc_msgSend_addObject_(self->deepShadowRecoveryBands, v141, (uint64_t)v19, v142);
          }
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v143, (uint64_t)&v148, (uint64_t)v152, 16);
          if (v15) {
            continue;
          }
          break;
        }
        int v144 = 0;
LABEL_25:
        v8 = v146;
      }
      else
      {
        int v144 = 0;
      }
    }
    else
    {
      FigDebugAssert3();

      int v144 = -1;
    }
  }
  else
  {
    FigDebugAssert3();
    int v144 = FigSignalErrorAt();
  }

  return v144;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  int HighlightRecoveryBandData = objc_msgSend__readHighlightRecoveryBandData_(self, v5, (uint64_t)v4, v6);
  if (HighlightRecoveryBandData)
  {
    int v37 = HighlightRecoveryBandData;
LABEL_8:
    FigDebugAssert3();
    goto LABEL_5;
  }
  int DeepShadowRecoveryBandData = objc_msgSend__readDeepShadowRecoveryBandData_(self, v8, (uint64_t)v4, v9);
  if (DeepShadowRecoveryBandData)
  {
    int v37 = DeepShadowRecoveryBandData;
    goto LABEL_8;
  }
  self->grayGhostingDetectionBand = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v4, v11, @"GrayGhostingDetectionBand", 0, 0);
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v12, @"GrayGhostingCutoff", 0, 0.0);
  self->grayGhostingCutoff = v13;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v14, @"GrayGhostingEV0EVMDifferenceThreshold", 0, 0.0);
  self->grayGhostingEV0EVMDifferenceThreshold = v15;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v16, @"GrayGhostingEV0WeightThreshold", 0, 0.0);
  self->grayGhostingEV0WeightThreshold = v17;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v18, @"GrayGhostingClippingThreshold", 0, 0.0);
  self->grayGhostingClippingThreshold = v19;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v20, @"MotionCutoff", 0, 0.0);
  self->motionCutoff = v21;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v22, @"MotionDetectionSifrEitCutoffHigh", 0, 0.0);
  self->motionDetectionSifrEitCutoffHigh = v23;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v24, @"MotionDetectionSifrEitCutoffLow", 0, 0.0);
  self->motionDetectionSifrEitCutoffLow = v25;
  uint64_t v26 = [GainValueArray alloc];
  int v29 = objc_msgSend_objectForKeyedSubscript_(v4, v27, @"SyntheticReferencePedestal", v28);
  v32 = (GainValueArray *)objc_msgSend_initWithArray_(v26, v30, (uint64_t)v29, v31);
  syntheticReferencePedestal = self->syntheticReferencePedestal;
  self->syntheticReferencePedestal = v32;

  int v37 = 0;
  if ((objc_msgSend_isValid(self->syntheticReferencePedestal, v34, v35, v36) & 1) == 0)
  {
    FigDebugAssert3();
    int v37 = -1;
  }
LABEL_5:

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->syntheticReferencePedestal, 0);
  objc_storeStrong((id *)&self->deepShadowRecoveryBands, 0);

  objc_storeStrong((id *)&self->highlightRecoveryBands, 0);
}

@end