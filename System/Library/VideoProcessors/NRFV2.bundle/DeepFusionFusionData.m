@interface DeepFusionFusionData
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionFusionData

- (int)readPlist:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"EVM_EV0_motionThreshold", v6);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  v51 = self;
  self->EVM_EV0_motionThreshold = v11;

  v14 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"SIFRBands", v13);
  v50 = v4;
  v52 = objc_msgSend_objectForKeyedSubscript_(v4, v15, @"NoSIFRBands", v16);
  v17 = objc_opt_new();
  v18 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v19 = v14;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v57, (uint64_t)v62, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v58 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v26 = objc_opt_new();
        int Plist = objc_msgSend_readPlist_(v26, v27, v25, v28);
        if (Plist)
        {
          int v48 = Plist;
          FigDebugAssert3();

          noSifrBands = v19;
          goto LABEL_20;
        }
        objc_msgSend_addObject_(v17, v30, (uint64_t)v26, v31);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v32, (uint64_t)&v57, (uint64_t)v62, 16);
      if (v22) {
        continue;
      }
      break;
    }
  }

  objc_storeStrong((id *)&v51->sifrBands, v17);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  noSifrBands = v52;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(noSifrBands, v34, (uint64_t)&v53, (uint64_t)v61, 16);
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v54;
    while (2)
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(noSifrBands);
        }
        uint64_t v39 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        v40 = objc_opt_new();
        int v43 = objc_msgSend_readPlist_(v40, v41, v39, v42);
        if (v43)
        {
          int v48 = v43;
          FigDebugAssert3();

          goto LABEL_20;
        }
        objc_msgSend_addObject_(v18, v44, (uint64_t)v40, v45);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(noSifrBands, v46, (uint64_t)&v53, (uint64_t)v61, 16);
      if (v36) {
        continue;
      }
      break;
    }
  }

  v47 = v18;
  int v48 = 0;
  noSifrBands = v51->noSifrBands;
  v51->noSifrBands = v47;
LABEL_20:

  return v48;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->noSifrBands, 0);

  objc_storeStrong((id *)&self->sifrBands, 0);
}

@end