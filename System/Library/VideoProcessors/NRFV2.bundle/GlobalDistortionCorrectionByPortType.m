@interface GlobalDistortionCorrectionByPortType
- (GlobalDistortionCorrectionByPortType)initWithDictionary:(id)a3;
- (id)getParamsForPortType:(id)a3;
@end

@implementation GlobalDistortionCorrectionByPortType

- (GlobalDistortionCorrectionByPortType)initWithDictionary:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v87.receiver = self;
  v87.super_class = (Class)GlobalDistortionCorrectionByPortType;
  v6 = [(GlobalDistortionCorrectionByPortType *)&v87 init];
  if (!v6)
  {
LABEL_46:
    v72 = v6;
    goto LABEL_47;
  }
  id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v11 = objc_msgSend_count(v5, v8, v9, v10);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
  gdcByPortType = v6->_gdcByPortType;
  v80 = v6;
  v6->_gdcByPortType = (NSMutableDictionary *)v14;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v76 = v5;
  id v16 = v5;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v83, (uint64_t)v89, 16);
  if (!v18)
  {
    int v81 = 0;
    goto LABEL_43;
  }
  uint64_t v21 = v18;
  int v81 = 0;
  uint64_t v22 = *(void *)v84;
  uint64_t v23 = *MEMORY[0x263F2EEE0];
  uint64_t v82 = *MEMORY[0x263F2EEB8];
  uint64_t v78 = *MEMORY[0x263F2EEE0];
  uint64_t v79 = *MEMORY[0x263F2EEF0];
  uint64_t v77 = *MEMORY[0x263F2F298];
  while (2)
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v84 != v22) {
        objc_enumerationMutation(v16);
      }
      uint64_t v25 = *(void *)(*((void *)&v83 + 1) + 8 * v24);
      objc_msgSend_objectForKeyedSubscript_(v16, v19, v25, v20, v74, v75);
      v26 = (GlobalDistortionCorrectionByPortType *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_objectForKeyedSubscript_(v26, v27, v23, v28);
      if (v31)
      {
        v32 = objc_msgSend_objectForKeyedSubscript_(v26, v29, v82, v30);

        if (v32)
        {
          uint64_t v34 = objc_opt_new();
          if (v26)
          {
            unsigned __int8 v88 = 0;
            objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v26, v33, v79, (uint64_t)&v88, 0.0);
            int v35 = v88;
            *(_DWORD *)(v34 + 80) = v36;
            v39 = objc_msgSend_objectForKeyedSubscript_(v26, v37, v23, v38);
            if (v39)
            {
              v41 = v39;
              uint64_t v42 = v21;
              uint64_t v43 = v22;
              unsigned __int8 v88 = 0;
              objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v39, v40, @"X", (uint64_t)&v88, 0.0);
              int v44 = v88;
              *(_DWORD *)(v34 + 72) = v45;
              unsigned __int8 v88 = 0;
              objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v41, v46, @"Y", (uint64_t)&v88, 0.0);
              if (v88) {
                BOOL v50 = v44 == 0;
              }
              else {
                BOOL v50 = 1;
              }
              BOOL v51 = v50 || v35 == 0;
              int v52 = v81;
              if (v51) {
                int v52 = 25;
              }
              *(_DWORD *)(v34 + 76) = v49;
              v53 = objc_msgSend_objectForKeyedSubscript_(v26, v47, v82, v48);
              if (v53)
              {
                v31 = v53;
                int v81 = v52;
                v56 = objc_msgSend_objectForKeyedSubscript_(v53, v54, v77, v55);
                if (v56)
                {
                  v60 = v56;
                  if (objc_msgSend_length(v56, v57, v58, v59) == 64)
                  {
                    id v61 = v60;
                    v65 = (_OWORD *)objc_msgSend_bytes(v61, v62, v63, v64);
                    long long v66 = v65[2];
                    long long v67 = v65[3];
                    long long v68 = v65[1];
                    *(_OWORD *)(v34 + 8) = *v65;
                    *(_OWORD *)(v34 + 56) = v67;
                    *(_OWORD *)(v34 + 40) = v66;
                    *(_OWORD *)(v34 + 24) = v68;
                    objc_msgSend_setObject_forKeyedSubscript_(v80->_gdcByPortType, v69, v34, v25);

                    LODWORD(v31) = 0;
                    int v70 = 1;
                    uint64_t v34 = (uint64_t)v41;
LABEL_23:
                    uint64_t v22 = v43;
                    uint64_t v21 = v42;
                    uint64_t v23 = v78;
LABEL_24:

                    goto LABEL_27;
                  }
                  uint64_t v75 = v3;
                  LODWORD(v74) = 0;
                  FigDebugAssert3();
                  int v81 = FigSignalErrorAt();
                }
                else
                {
                  uint64_t v75 = v3;
                  LODWORD(v74) = 0;
                  FigDebugAssert3();
                  int v81 = FigSignalErrorAt();
                }
              }
              else
              {
                uint64_t v75 = v3;
                LODWORD(v74) = 0;
                FigDebugAssert3();
                int v81 = FigSignalErrorAt();
              }

              int v70 = 0;
              LODWORD(v31) = 1;
              goto LABEL_23;
            }
            uint64_t v75 = v3;
            LODWORD(v74) = 0;
          }
          else
          {
            uint64_t v75 = v3;
            LODWORD(v74) = 0;
          }
          FigDebugAssert3();
          int v81 = FigSignalErrorAt();
          int v70 = 0;
          LODWORD(v31) = 1;
          goto LABEL_24;
        }
        LODWORD(v31) = 0;
      }
      int v70 = 1;
LABEL_27:

      if (!v70)
      {

        id v5 = v76;
        v6 = v80;
        if (v31) {
          goto LABEL_44;
        }
        goto LABEL_48;
      }
      ++v24;
    }
    while (v21 != v24);
    uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v83, (uint64_t)v89, 16);
    uint64_t v21 = v71;
    if (v71) {
      continue;
    }
    break;
  }
LABEL_43:

  id v5 = v76;
  v6 = v80;
LABEL_44:
  if (!v81) {
    goto LABEL_46;
  }
  v72 = 0;
LABEL_47:
  v26 = v72;
LABEL_48:

  return v26;
}

- (id)getParamsForPortType:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_gdcByPortType, a2, (uint64_t)a3, v3);
}

- (void).cxx_destruct
{
}

@end