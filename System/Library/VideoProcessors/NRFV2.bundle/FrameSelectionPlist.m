@interface FrameSelectionPlist
- (int)_setModelWeights:(id)a3 weights:(id *)a4;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation FrameSelectionPlist

- (int)_setModelWeights:(id)a3 weights:(id *)a4
{
  id v5 = a3;
  a4->var0 = 0.0;
  a4->var1 = 0.0;
  a4->var3 = 0.0;
  a4->var4 = 0.0;
  v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"CornerWeight", v7);

  if (v8
    && (objc_msgSend_objectForKeyedSubscript_(v5, v9, @"FocusWeight", v10),
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11)
    && (objc_msgSend_objectForKeyedSubscript_(v5, v12, @"GyroWeight", v13),
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_262FCACB4;
    v19[3] = &unk_2655C37C0;
    v19[4] = a4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v15, (uint64_t)v19, v16);
    int v17 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
  }

  return v17;
}

- (int)readPlist:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v4 = a3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v56;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v56 != v10) {
        objc_enumerationMutation(v4);
      }
      v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
      if (objc_msgSend_isEqualToString_(v12, v7, @"ReferenceFrameSelection", v8))
      {
        v15 = objc_msgSend_objectForKeyedSubscript_(v4, v13, @"ReferenceFrameSelection", v14);
        self->enableReferenceSelectionWithCombinedWeight = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v15, v16, @"EnableReferenceSelectionWithCombinedWeight", 0, 0);
        self->enableReferenceSelectionWithFaceFocusScore = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v15, v17, @"EnableReferenceSelectionWithFaceFocusScore", 0, 0);
        v20 = objc_msgSend_objectForKeyedSubscript_(v15, v18, @"ReferenceSelectionRegressionWeightShortFrame", v19);
        int v22 = objc_msgSend__setModelWeights_weights_(self, v21, (uint64_t)v20, (uint64_t)&self->referenceSelectionRegressionWeightShortFrame);

        if (v22) {
          goto LABEL_21;
        }
        v25 = objc_msgSend_objectForKeyedSubscript_(v15, v23, @"ReferenceSelectionRegressionWeightLongFrame", v24);
        int v27 = objc_msgSend__setModelWeights_weights_(self, v26, (uint64_t)v25, (uint64_t)&self->referenceSelectionRegressionWeightLongFrame);

        if (v27) {
          goto LABEL_21;
        }
      }
      else
      {
        if (!objc_msgSend_isEqualToString_(v12, v13, @"BlurryFrameRejection", v14))
        {
          if (!objc_msgSend_isEqualToString_(v12, v28, @"BlinkDetection", v29)) {
            break;
          }
          v45 = (BlinkDetectionPlist *)objc_opt_new();
          blinkDetectionPlist = self->blinkDetectionPlist;
          self->blinkDetectionPlist = v45;

          v47 = self->blinkDetectionPlist;
          v50 = objc_msgSend_objectForKeyedSubscript_(v4, v48, @"BlinkDetection", v49);
          LODWORD(v47) = objc_msgSend_readPlist_(v47, v51, (uint64_t)v50, v52);

          if (v47)
          {
            FigDebugAssert3();
            int v53 = FigSignalErrorAt();
            goto LABEL_20;
          }
          goto LABEL_17;
        }
        v15 = objc_msgSend_objectForKeyedSubscript_(v4, v28, @"BlurryFrameRejection", v29);
        self->enableBlurFrameDetection = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v15, v30, @"EnableBlurFrameDetection", 0, 0);
        v33 = objc_msgSend_objectForKeyedSubscript_(v15, v31, @"BlurFrameRejectionRegressionWeightShortFrame", v32);
        int v35 = objc_msgSend__setModelWeights_weights_(self, v34, (uint64_t)v33, (uint64_t)&self->blurFrameRejectionRegressionWeightShortFrame);

        if (v35
          || (objc_msgSend_objectForKeyedSubscript_(v15, v36, @"BlurFrameRejectionRegressionWeightLongFrame", v37), v38 = objc_claimAutoreleasedReturnValue(), int v40 = objc_msgSend__setModelWeights_weights_(self, v39, (uint64_t)v38, (uint64_t)&self->blurFrameRejectionRegressionWeightLongFrame), v38, v40))
        {
LABEL_21:
          FigDebugAssert3();
          int v53 = FigSignalErrorAt();

          goto LABEL_20;
        }
        objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v15, v41, @"BlurFrameWeightAdjustmentLeftLimit", 0, 0.0);
        self->blurFrameWeightAdjustementLeftLimit = v42;
        objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v15, v43, @"BlurFrameWeightAdjustmentRightLimit", 0, 0.0);
        self->blurFrameWeightAdjustementRightLimit = v44;
      }

LABEL_17:
      if (v9 == ++v11)
      {
        uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v55, (uint64_t)v59, 16);
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  int v53 = 0;
LABEL_20:

  return v53;
}

- (void)applyOverrides
{
  blinkDetectionPlist = self->blinkDetectionPlist;
  if (blinkDetectionPlist) {
    objc_msgSend_applyOverrides(blinkDetectionPlist, a2, v2, v3);
  }
}

- (void).cxx_destruct
{
}

@end