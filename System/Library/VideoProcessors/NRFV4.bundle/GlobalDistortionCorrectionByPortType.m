@interface GlobalDistortionCorrectionByPortType
- (GlobalDistortionCorrectionByPortType)initWithDictionary:(id)a3;
- (id)getParamsForPortType:(id)a3;
@end

@implementation GlobalDistortionCorrectionByPortType

- (GlobalDistortionCorrectionByPortType)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v52 = 0;
  v51.receiver = self;
  v51.super_class = (Class)GlobalDistortionCorrectionByPortType;
  v6 = [(GlobalDistortionCorrectionByPortType *)&v51 init];
  if (!v6) {
    goto LABEL_33;
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v5, "count"));
  gdcByPortType = v6->_gdcByPortType;
  v45 = v6;
  v6->_gdcByPortType = (NSMutableDictionary *)v7;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v41 = v5;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (!v10) {
    goto LABEL_31;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v48;
  uint64_t v13 = *MEMORY[0x263F2EEE8];
  uint64_t v46 = *MEMORY[0x263F2EEB8];
  uint64_t v43 = *MEMORY[0x263F2EEE8];
  uint64_t v44 = *MEMORY[0x263F2EEF0];
  uint64_t v42 = *MEMORY[0x263F2F298];
  while (2)
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v48 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * v14);
      objc_msgSend(v9, "objectForKeyedSubscript:", v15, v39, v40);
      v16 = (GlobalDistortionCorrectionByPortType *)objc_claimAutoreleasedReturnValue();
      id v17 = [(GlobalDistortionCorrectionByPortType *)v16 objectForKeyedSubscript:v13];
      if (v17)
      {
        v18 = [(GlobalDistortionCorrectionByPortType *)v16 objectForKeyedSubscript:v46];

        if (v18)
        {
          uint64_t v19 = objc_opt_new();
          if (v16)
          {
            getFloatParameter(v16, v44, &v52);
            *(_DWORD *)(v19 + 80) = v20;
            v21 = [(GlobalDistortionCorrectionByPortType *)v16 objectForKeyedSubscript:v13];
            if (v21)
            {
              v22 = v21;
              uint64_t v23 = v11;
              uint64_t v24 = v12;
              getFloatParameter(v21, @"X", &v52);
              *(_DWORD *)(v19 + 72) = v25;
              getFloatParameter(v22, @"Y", &v52);
              *(_DWORD *)(v19 + 76) = v26;
              v27 = [(GlobalDistortionCorrectionByPortType *)v16 objectForKeyedSubscript:v46];
              if (v27)
              {
                v28 = v27;
                v29 = [v27 objectForKeyedSubscript:v42];
                if (v29)
                {
                  v30 = v29;
                  if ([v29 length] == 64)
                  {
                    id v17 = v30;
                    v31 = (_OWORD *)[v17 bytes];
                    long long v32 = v31[2];
                    long long v33 = v31[3];
                    long long v34 = v31[1];
                    *(_OWORD *)(v19 + 8) = *v31;
                    *(_OWORD *)(v19 + 56) = v33;
                    *(_OWORD *)(v19 + 40) = v32;
                    *(_OWORD *)(v19 + 24) = v34;
                    [(NSMutableDictionary *)v45->_gdcByPortType setObject:v19 forKeyedSubscript:v15];

                    LODWORD(v17) = 0;
                    int v35 = 1;
                    uint64_t v19 = (uint64_t)v22;
LABEL_15:
                    uint64_t v12 = v24;
                    uint64_t v11 = v23;
                    uint64_t v13 = v43;
LABEL_16:

                    goto LABEL_19;
                  }
                  uint64_t v40 = v3;
                  LODWORD(v39) = 0;
                  FigDebugAssert3();
                  int v52 = FigSignalErrorAt();
                }
                else
                {
                  uint64_t v40 = v3;
                  LODWORD(v39) = 0;
                  FigDebugAssert3();
                  int v52 = FigSignalErrorAt();
                }
              }
              else
              {
                uint64_t v40 = v3;
                LODWORD(v39) = 0;
                FigDebugAssert3();
                int v52 = FigSignalErrorAt();
              }

              int v35 = 0;
              LODWORD(v17) = 1;
              goto LABEL_15;
            }
            uint64_t v40 = v3;
            LODWORD(v39) = 0;
          }
          else
          {
            uint64_t v40 = v3;
            LODWORD(v39) = 0;
          }
          FigDebugAssert3();
          int v35 = 0;
          int v52 = FigSignalErrorAt();
          LODWORD(v17) = 1;
          goto LABEL_16;
        }
        LODWORD(v17) = 0;
      }
      int v35 = 1;
LABEL_19:

      if (!v35)
      {

        id v5 = v41;
        v6 = v45;
        if (!v17) {
          goto LABEL_37;
        }
        goto LABEL_33;
      }
      ++v14;
    }
    while (v11 != v14);
    uint64_t v36 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
    uint64_t v11 = v36;
    if (v36) {
      continue;
    }
    break;
  }
LABEL_31:

  id v5 = v41;
  v6 = v45;
LABEL_33:
  if (v52) {
    v37 = 0;
  }
  else {
    v37 = v6;
  }
  v16 = v37;
LABEL_37:

  return v16;
}

- (id)getParamsForPortType:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_gdcByPortType objectForKeyedSubscript:a3];
}

- (void).cxx_destruct
{
}

@end