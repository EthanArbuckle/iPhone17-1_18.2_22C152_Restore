@interface ToneMapSmoothingPlist
- (ToneMapSmoothingPlist)init;
- (int)readPlist:(id)a3;
@end

@implementation ToneMapSmoothingPlist

- (ToneMapSmoothingPlist)init
{
  v6.receiver = self;
  v6.super_class = (Class)ToneMapSmoothingPlist;
  v2 = [(ToneMapSmoothingPlist *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bands = v2->bands;
    v2->bands = v3;
  }
  return v2;
}

- (int)readPlist:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"Bands", v6);
  if (!v10)
  {
    FigDebugAssert3();
    int v41 = 25;
    goto LABEL_37;
  }
  if (objc_msgSend_count(self->bands, v7, v8, v9))
  {
    FigDebugAssert3();
    int v41 = -12782;
    goto LABEL_37;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v11 = v10;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v83, (uint64_t)v88, 16);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v84;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v84 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        v18 = objc_alloc_init(ToneMapSmoothingBandData);
        int Plist = objc_msgSend_readPlist_(v18, v19, v17, v20);
        if (Plist)
        {
          int v41 = Plist;
          FigDebugAssert3();

          goto LABEL_37;
        }
        objc_msgSend_addObject_(self->bands, v22, (uint64_t)v18, v23);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v24, (uint64_t)&v83, (uint64_t)v88, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }

  unsigned __int8 v87 = 0;
  int v26 = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v4, v25, @"BaseIterations", 0, &v87);
  int v27 = v87;
  self->baseIterations = v26;
  unsigned __int8 v87 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v28, @"MaskedAlpha", (uint64_t)&v87, 0.0);
  int v29 = v87;
  self->maskedAlpha = v30;
  unsigned __int8 v87 = 0;
  objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v31, @"UnmaskedAlpha", (uint64_t)&v87, 0.0);
  if (v87) {
    BOOL v35 = v29 == 0;
  }
  else {
    BOOL v35 = 1;
  }
  if (v35 || v27 == 0) {
    int v37 = 25;
  }
  else {
    int v37 = 0;
  }
  self->unmaskedAlpha = v34;
  v38 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"Feature1MaskedAlpha", v33);

  unsigned __int8 v87 = 0;
  if (v38) {
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v39, @"Feature1MaskedAlpha", (uint64_t)&v87, 0.0);
  }
  else {
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v39, @"SkyMaskedAlpha", (uint64_t)&v87, 0.0);
  }
  if (v87) {
    int v41 = v37;
  }
  else {
    int v41 = 25;
  }
  self->skyMaskedAlpha = v40;
  v42 = [GainValueArray alloc];
  v45 = objc_msgSend_objectForKeyedSubscript_(v4, v43, @"MinGainRatio", v44);
  v48 = (GainValueArray *)objc_msgSend_initWithArray_(v42, v46, (uint64_t)v45, v47);
  minGainRatio = self->minGainRatio;
  self->minGainRatio = v48;

  v50 = [GainValueArray alloc];
  v53 = objc_msgSend_objectForKeyedSubscript_(v4, v51, @"MaskedLambda", v52);
  v56 = (GainValueArray *)objc_msgSend_initWithArray_(v50, v54, (uint64_t)v53, v55);
  maskedLambda = self->maskedLambda;
  self->maskedLambda = v56;

  v58 = [GainValueArray alloc];
  v61 = objc_msgSend_objectForKeyedSubscript_(v4, v59, @"UnmaskedLambda", v60);
  v64 = (GainValueArray *)objc_msgSend_initWithArray_(v58, v62, (uint64_t)v61, v63);
  unmaskedLambda = self->unmaskedLambda;
  self->unmaskedLambda = v64;

  v68 = objc_msgSend_objectForKeyedSubscript_(v4, v66, @"SkyMaskedLambda", v67);

  if (v68)
  {
    v71 = [GainValueArray alloc];
    objc_msgSend_objectForKeyedSubscript_(v4, v72, @"SkyMaskedLambda", v73);
    v77 = LABEL_30:;
    v80 = (GainValueArray *)objc_msgSend_initWithArray_(v71, v78, (uint64_t)v77, v79);
    skyMaskedLambda = self->skyMaskedLambda;
    self->skyMaskedLambda = v80;

    goto LABEL_31;
  }
  v74 = objc_msgSend_objectForKeyedSubscript_(v4, v69, @"Feature1MaskedLambda", v70);

  if (v74)
  {
    v71 = [GainValueArray alloc];
    objc_msgSend_objectForKeyedSubscript_(v4, v75, @"Feature1MaskedLambda", v76);
    goto LABEL_30;
  }
LABEL_31:
  if (!self->minGainRatio || !self->maskedLambda || !self->unmaskedLambda || !self->skyMaskedLambda)
  {
    FigDebugAssert3();
    int v41 = FigSignalErrorAt();
  }
LABEL_37:

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->minGainRatio, 0);
  objc_storeStrong((id *)&self->skyMaskedLambda, 0);
  objc_storeStrong((id *)&self->unmaskedLambda, 0);
  objc_storeStrong((id *)&self->maskedLambda, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end