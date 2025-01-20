@interface SyntheticLongPlist
- (int)readBandData:(id)a3;
- (int)readPlist:(id)a3;
@end

@implementation SyntheticLongPlist

- (int)readBandData:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_valueForKey_(a3, a2, @"Bands", v3);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    bands = self->bands;
    self->bands = v6;

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id obj = v5;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v88, (uint64_t)v92, 16);
    if (v9)
    {
      uint64_t v10 = v9;
      v86 = v5;
      uint64_t v11 = *(void *)v89;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v89 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v14 = (void **)objc_opt_new();
          v15 = [GainValueArray alloc];
          v18 = objc_msgSend_objectForKeyedSubscript_(v13, v16, @"LumaCutoff", v17);
          uint64_t v21 = objc_msgSend_initWithArray_(v15, v19, (uint64_t)v18, v20);
          v22 = v14[1];
          v14[1] = (void *)v21;

          v23 = [GainValueArray alloc];
          v26 = objc_msgSend_objectForKeyedSubscript_(v13, v24, @"ChromaCutoff", v25);
          uint64_t v29 = objc_msgSend_initWithArray_(v23, v27, (uint64_t)v26, v28);
          v30 = v14[2];
          v14[2] = (void *)v29;

          v31 = [GainValueArray alloc];
          v34 = objc_msgSend_objectForKeyedSubscript_(v13, v32, @"LumaEdgeCutoff", v33);
          uint64_t v37 = objc_msgSend_initWithArray_(v31, v35, (uint64_t)v34, v36);
          v38 = v14[3];
          v14[3] = (void *)v37;

          v39 = [GainValueArray alloc];
          v42 = objc_msgSend_objectForKeyedSubscript_(v13, v40, @"ChromaEdgeCutoff", v41);
          uint64_t v45 = objc_msgSend_initWithArray_(v39, v43, (uint64_t)v42, v44);
          v46 = v14[4];
          v14[4] = (void *)v45;

          v47 = [GainValueArray alloc];
          v50 = objc_msgSend_objectForKeyedSubscript_(v13, v48, @"AdaptiveBlackFusionBoostThreshold", v49);
          uint64_t v53 = objc_msgSend_initWithArray_(v47, v51, (uint64_t)v50, v52);
          v54 = v14[5];
          v14[5] = (void *)v53;

          v55 = [GainValueArray alloc];
          v58 = objc_msgSend_objectForKeyedSubscript_(v13, v56, @"AdaptiveFusionReductionThreshold", v57);
          uint64_t v61 = objc_msgSend_initWithArray_(v55, v59, (uint64_t)v58, v60);
          v62 = v14[6];
          v14[6] = (void *)v61;

          if ((objc_msgSend_isValid(v14[1], v63, v64, v65) & 1) == 0
            || (objc_msgSend_isValid(v14[2], v66, v67, v68) & 1) == 0
            || (objc_msgSend_isValid(v14[3], v69, v70, v71) & 1) == 0
            || (objc_msgSend_isValid(v14[4], v72, v73, v74) & 1) == 0
            || (objc_msgSend_isValid(v14[5], v75, v76, v77) & 1) == 0
            || (objc_msgSend_isValid(v14[6], v78, v79, v80) & 1) == 0)
          {
            FigDebugAssert3();

            int v84 = -1;
            goto LABEL_18;
          }
          objc_msgSend_addObject_(self->bands, v81, (uint64_t)v14, v82);
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v83, (uint64_t)&v88, (uint64_t)v92, 16);
        if (v10) {
          continue;
        }
        break;
      }
      int v84 = 0;
LABEL_18:
      v5 = v86;
    }
    else
    {
      int v84 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v84 = FigSignalErrorAt();
  }

  return v84;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_readBandData_(self, v5, (uint64_t)v4, v6))
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();
  }
  else
  {
    v7 = [GainValueArray alloc];
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"ShadowThreshold", v9);
    v13 = (GainValueArray *)objc_msgSend_initWithArray_(v7, v11, (uint64_t)v10, v12);
    shadowThreshold = self->shadowThreshold;
    self->shadowThreshold = v13;

    v15 = [GainValueArray alloc];
    v18 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"BlackFusionBoost", v17);
    uint64_t v21 = (GainValueArray *)objc_msgSend_initWithArray_(v15, v19, (uint64_t)v18, v20);
    blackFusionBoost = self->blackFusionBoost;
    self->blackFusionBoost = v21;

    v23 = [GainValueArray alloc];
    v26 = objc_msgSend_objectForKeyedSubscript_(v4, v24, @"SigmaFactorR", v25);
    uint64_t v29 = (GainValueArray *)objc_msgSend_initWithArray_(v23, v27, (uint64_t)v26, v28);
    sigmaFactorR = self->sigmaFactorR;
    self->sigmaFactorR = v29;

    v31 = [GainValueArray alloc];
    v34 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"SigmaFactorG", v33);
    uint64_t v37 = (GainValueArray *)objc_msgSend_initWithArray_(v31, v35, (uint64_t)v34, v36);
    sigmaFactorG = self->sigmaFactorG;
    self->sigmaFactorG = v37;

    v39 = [GainValueArray alloc];
    v42 = objc_msgSend_objectForKeyedSubscript_(v4, v40, @"SigmaFactorB", v41);
    uint64_t v45 = (GainValueArray *)objc_msgSend_initWithArray_(v39, v43, (uint64_t)v42, v44);
    sigmaFactorB = self->sigmaFactorB;
    self->sigmaFactorB = v45;

    v47 = [GainValueArray alloc];
    v50 = objc_msgSend_objectForKeyedSubscript_(v4, v48, @"DecayRate", v49);
    uint64_t v53 = (GainValueArray *)objc_msgSend_initWithArray_(v47, v51, (uint64_t)v50, v52);
    sharpness = self->sharpness;
    self->sharpness = v53;

    if ((objc_msgSend_isValid(self->shadowThreshold, v55, v56, v57) & 1) != 0
      && (objc_msgSend_isValid(self->blackFusionBoost, v58, v59, v60) & 1) != 0
      && (objc_msgSend_isValid(self->sigmaFactorR, v61, v62, v63) & 1) != 0
      && (objc_msgSend_isValid(self->sigmaFactorG, v64, v65, v66) & 1) != 0
      && (objc_msgSend_isValid(self->sigmaFactorB, v67, v68, v69) & 1) != 0
      && (objc_msgSend_isValid(self->sharpness, v70, v71, v72) & 1) != 0)
    {
      int v73 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v73 = -1;
    }
  }

  return v73;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->syntheticLongPedestal, 0);
  objc_storeStrong((id *)&self->sharpness, 0);
  objc_storeStrong((id *)&self->sigmaFactorB, 0);
  objc_storeStrong((id *)&self->sigmaFactorG, 0);
  objc_storeStrong((id *)&self->sigmaFactorR, 0);
  objc_storeStrong((id *)&self->blackFusionBoost, 0);
  objc_storeStrong((id *)&self->shadowThreshold, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end