@interface SoftISPStaticParameters
- ($F61E096109CF133FD2477F48C7D0CEE7)dimensionsForSensorInBayerPixelsInMetadata:(id)a3;
- ($F61E096109CF133FD2477F48C7D0CEE7)dimensionsForSensorInMetadata:(id)a3;
- (BOOL)gnuLSCCompensation;
- (BOOL)lscFromCameraInfoByPortType;
- (SoftISPStaticParameters)initWithCameraInfoByPortType:(id)a3 tuningParameters:(id)a4 moduleCalibrationByPortType:(id)a5 metalContext:(id)a6 deviceGeneration:(int)a7;
- (id)cameraInfoForInputFrameMetadata:(id)a3;
- (id)cameraInfoForPortType:(id)a3;
- (id)moduleConfigForInputFrameMetadata:(id)a3;
- (id)moduleConfigForPortType:(id)a3;
- (id)tuningParametersForInputFrameMetadata:(id)a3 tuningType:(int)a4;
- (int)_generateSoftISPTuningParameters;
- (int)_initModuleCalibrationByPortType:(id)a3;
- (int)firstPixelForSensorID:(unsigned __int16)a3;
- (int)tuningFlagForProcessingOption:(id)a3 tuningType:(int)a4 metadata:(id)a5;
- (uint64_t)deviceGeneration;
@end

@implementation SoftISPStaticParameters

- (int)_generateSoftISPTuningParameters
{
  uint64_t v170 = *MEMORY[0x263EF8340];
  p_tuningParameters = &self->_tuningParameters;
  v118 = (void *)[(NSDictionary *)self->_tuningParameters mutableCopy];
  v3 = [(NSDictionary *)*p_tuningParameters objectForKeyedSubscript:@"DefaultSensorIDs"];
  v4 = v3;
  if (v3)
  {
    locatiouint64_t n = (id *)p_tuningParameters;
    v115 = v3;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v5 = v3;
    uint64_t v119 = [v5 countByEnumeratingWithState:&v158 objects:v169 count:16];
    id v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    if (v119)
    {
      id v116 = v5;
      uint64_t v117 = *(void *)v159;
      v10 = v118;
      do
      {
        uint64_t v11 = 0;
        v12 = v9;
        do
        {
          if (*(void *)v159 != v117) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void *)(*((void *)&v158 + 1) + 8 * v11);
          context = (void *)MEMORY[0x263E64AA0]();
          uint64_t v14 = [v5 objectForKeyedSubscript:v13];
          uint64_t v121 = v13;
          v15 = [v10 objectForKeyedSubscript:v13];
          v16 = (void *)[v15 mutableCopy];

          v122 = (void *)v14;
          v17 = [v16 objectForKeyedSubscript:v14];
          v18 = (void *)[v17 mutableCopy];

          v129 = v18;
          v19 = [v18 objectForKeyedSubscript:@"SoftISPTuning"];
          v9 = (void *)[v19 mutableCopy];

          if (v9)
          {
            uint64_t v120 = v11;
            uint64_t v20 = [v9 objectForKeyedSubscript:@"Common"];

            v21 = [v9 objectForKeyedSubscript:@"WYSIWYG"];

            if (v21)
            {
              v22 = objc_msgSend(v21, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v22 forKeyedSubscript:@"WYSIWYG"];
            }
            v23 = [v9 objectForKeyedSubscript:@"WYSIWYG_Quadra2x"];

            v24 = v18;
            if (v23)
            {
              v25 = objc_msgSend(v23, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v25 forKeyedSubscript:@"WYSIWYG_Quadra2x"];
            }
            v26 = [v9 objectForKeyedSubscript:@"UB"];

            v127 = v16;
            v128 = v9;
            if (v26)
            {
              v27 = [MEMORY[0x263EFF9A0] dictionary];
              long long v154 = 0u;
              long long v155 = 0u;
              long long v156 = 0u;
              long long v157 = 0u;
              v124 = v26;
              id v28 = v26;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v154 objects:v168 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v155;
                do
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v155 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v33 = *(void *)(*((void *)&v154 + 1) + 8 * i);
                    v34 = [v28 objectForKeyedSubscript:v33];
                    v35 = objc_msgSend(v34, "cmi_dictionaryMergedWithDefaultDict:", v20);
                    [v27 setObject:v35 forKeyedSubscript:v33];
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v154 objects:v168 count:16];
                }
                while (v30);
              }

              v9 = v128;
              [v128 setObject:v27 forKeyedSubscript:@"UB"];

              v26 = v124;
              v16 = v127;
              v24 = v129;
            }
            v36 = [v9 objectForKeyedSubscript:@"UB_Quadra2x"];

            if (v36)
            {
              v37 = [MEMORY[0x263EFF9A0] dictionary];
              long long v150 = 0u;
              long long v151 = 0u;
              long long v152 = 0u;
              long long v153 = 0u;
              v125 = v36;
              id v38 = v36;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v150 objects:v167 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v151;
                do
                {
                  for (uint64_t j = 0; j != v40; ++j)
                  {
                    if (*(void *)v151 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    uint64_t v43 = *(void *)(*((void *)&v150 + 1) + 8 * j);
                    v44 = [v38 objectForKeyedSubscript:v43];
                    v45 = objc_msgSend(v44, "cmi_dictionaryMergedWithDefaultDict:", v20);
                    [v37 setObject:v45 forKeyedSubscript:v43];
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v150 objects:v167 count:16];
                }
                while (v40);
              }

              v9 = v128;
              [v128 setObject:v37 forKeyedSubscript:@"UB_Quadra2x"];

              v36 = v125;
              v16 = v127;
              v24 = v129;
            }
            v46 = [v9 objectForKeyedSubscript:@"UBLowLight"];

            if (v46)
            {
              v47 = objc_msgSend(v46, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v47 forKeyedSubscript:@"UBLowLight"];
            }
            v48 = [v9 objectForKeyedSubscript:@"UBLowLight_Quadra2x"];

            if (v48)
            {
              v49 = objc_msgSend(v48, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v49 forKeyedSubscript:@"UBLowLight_Quadra2x"];
            }
            uint64_t v50 = [v9 objectForKeyedSubscript:@"DeepFusionCommon"];
            v51 = [v9 objectForKeyedSubscript:@"DeepFusion"];

            v126 = (void *)v50;
            if (v51)
            {
              v52 = objc_msgSend(v51, "cmi_dictionaryMergedWithDefaultDict:", v50);
              v53 = (void *)[v52 mutableCopy];

              v54 = [v53 allKeys];

              long long v148 = 0u;
              long long v149 = 0u;
              long long v146 = 0u;
              long long v147 = 0u;
              id v6 = v54;
              uint64_t v55 = [v6 countByEnumeratingWithState:&v146 objects:v166 count:16];
              if (v55)
              {
                uint64_t v56 = v55;
                uint64_t v57 = *(void *)v147;
                do
                {
                  for (uint64_t k = 0; k != v56; ++k)
                  {
                    if (*(void *)v147 != v57) {
                      objc_enumerationMutation(v6);
                    }
                    uint64_t v59 = *(void *)(*((void *)&v146 + 1) + 8 * k);
                    v60 = [v53 objectForKeyedSubscript:v59];
                    v61 = objc_msgSend(v60, "cmi_dictionaryMergedWithDefaultDict:", v20);
                    [v53 setObject:v61 forKeyedSubscript:v59];
                  }
                  uint64_t v56 = [v6 countByEnumeratingWithState:&v146 objects:v166 count:16];
                }
                while (v56);
              }

              v9 = v128;
              [v128 setObject:v53 forKeyedSubscript:@"DeepFusion"];

              uint64_t v50 = (uint64_t)v126;
              v16 = v127;
              v24 = v129;
            }
            v62 = [v9 objectForKeyedSubscript:@"DeepFusion_Quadra2x"];

            if (v62)
            {
              v63 = objc_msgSend(v62, "cmi_dictionaryMergedWithDefaultDict:", v50);
              v64 = (void *)[v63 mutableCopy];

              v65 = [v64 allKeys];

              long long v144 = 0u;
              long long v145 = 0u;
              long long v142 = 0u;
              long long v143 = 0u;
              id v6 = v65;
              uint64_t v66 = [v6 countByEnumeratingWithState:&v142 objects:v165 count:16];
              if (v66)
              {
                uint64_t v67 = v66;
                uint64_t v68 = *(void *)v143;
                do
                {
                  for (uint64_t m = 0; m != v67; ++m)
                  {
                    if (*(void *)v143 != v68) {
                      objc_enumerationMutation(v6);
                    }
                    uint64_t v70 = *(void *)(*((void *)&v142 + 1) + 8 * m);
                    v71 = [v64 objectForKeyedSubscript:v70];
                    v72 = objc_msgSend(v71, "cmi_dictionaryMergedWithDefaultDict:", v20);
                    [v64 setObject:v72 forKeyedSubscript:v70];
                  }
                  uint64_t v67 = [v6 countByEnumeratingWithState:&v142 objects:v165 count:16];
                }
                while (v67);
              }

              v9 = v128;
              [v128 setObject:v64 forKeyedSubscript:@"DeepFusion_Quadra2x"];

              uint64_t v50 = (uint64_t)v126;
              v16 = v127;
              v24 = v129;
            }
            v73 = [v9 objectForKeyedSubscript:@"DeepFusion_QuadraFullRes"];

            if (v73)
            {
              v74 = objc_msgSend(v73, "cmi_dictionaryMergedWithDefaultDict:", v50);
              v75 = (void *)[v74 mutableCopy];

              v76 = [v75 allKeys];

              long long v140 = 0u;
              long long v141 = 0u;
              long long v138 = 0u;
              long long v139 = 0u;
              id v6 = v76;
              uint64_t v77 = [v6 countByEnumeratingWithState:&v138 objects:v164 count:16];
              if (v77)
              {
                uint64_t v78 = v77;
                uint64_t v79 = *(void *)v139;
                do
                {
                  for (uint64_t n = 0; n != v78; ++n)
                  {
                    if (*(void *)v139 != v79) {
                      objc_enumerationMutation(v6);
                    }
                    uint64_t v81 = *(void *)(*((void *)&v138 + 1) + 8 * n);
                    v82 = [v75 objectForKeyedSubscript:v81];
                    v83 = objc_msgSend(v82, "cmi_dictionaryMergedWithDefaultDict:", v20);
                    [v75 setObject:v83 forKeyedSubscript:v81];
                  }
                  uint64_t v78 = [v6 countByEnumeratingWithState:&v138 objects:v164 count:16];
                }
                while (v78);
              }

              v9 = v128;
              [v128 setObject:v75 forKeyedSubscript:@"DeepFusion_QuadraFullRes"];

              uint64_t v50 = (uint64_t)v126;
              v16 = v127;
              v24 = v129;
            }
            v84 = [v9 objectForKeyedSubscript:@"DeepFusion_EnhancedRes"];

            if (v84)
            {
              v85 = objc_msgSend(v84, "cmi_dictionaryMergedWithDefaultDict:", v50);
              v86 = (void *)[v85 mutableCopy];

              v87 = [v86 allKeys];

              long long v136 = 0u;
              long long v137 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              id v6 = v87;
              uint64_t v88 = [v6 countByEnumeratingWithState:&v134 objects:v163 count:16];
              if (v88)
              {
                uint64_t v89 = v88;
                uint64_t v90 = *(void *)v135;
                do
                {
                  for (iuint64_t i = 0; ii != v89; ++ii)
                  {
                    if (*(void *)v135 != v90) {
                      objc_enumerationMutation(v6);
                    }
                    uint64_t v92 = *(void *)(*((void *)&v134 + 1) + 8 * ii);
                    v93 = [v86 objectForKeyedSubscript:v92];
                    v94 = objc_msgSend(v93, "cmi_dictionaryMergedWithDefaultDict:", v20);
                    [v86 setObject:v94 forKeyedSubscript:v92];
                  }
                  uint64_t v89 = [v6 countByEnumeratingWithState:&v134 objects:v163 count:16];
                }
                while (v89);
              }

              v9 = v128;
              [v128 setObject:v86 forKeyedSubscript:@"DeepFusion_EnhancedRes"];

              v16 = v127;
              v24 = v129;
            }
            v95 = [v9 objectForKeyedSubscript:@"RawNightMode"];

            if (v95)
            {
              v96 = objc_msgSend(v95, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v96 forKeyedSubscript:@"RawNightMode"];
            }
            v97 = [v9 objectForKeyedSubscript:@"RawNightMode_Quadra2x"];

            if (v97)
            {
              v98 = objc_msgSend(v97, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v98 forKeyedSubscript:@"RawNightMode_Quadra2x"];
            }
            v99 = [v9 objectForKeyedSubscript:@"SWFR"];

            if (v99)
            {
              v100 = objc_msgSend(v99, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v100 forKeyedSubscript:@"SWFR"];
            }
            v101 = [v9 objectForKeyedSubscript:@"SWFR_Quadra2x"];

            if (v101)
            {
              v102 = objc_msgSend(v101, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v102 forKeyedSubscript:@"SWFR_Quadra2x"];
            }
            v103 = [v9 objectForKeyedSubscript:@"SWFR_DocumentScanning"];

            if (v103)
            {
              v104 = objc_msgSend(v103, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v104 forKeyedSubscript:@"SWFR_DocumentScanning"];
            }
            v105 = [v9 objectForKeyedSubscript:@"SWFR_DocumentScanning_Quadra2x"];

            if (v105)
            {
              v106 = objc_msgSend(v105, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v106 forKeyedSubscript:@"SWFR_DocumentScanning_Quadra2x"];
            }
            v7 = [v9 objectForKeyedSubscript:@"LearnedNR_QuadraFullRes"];

            if (v7)
            {
              v107 = objc_msgSend(v7, "cmi_dictionaryMergedWithDefaultDict:", v20);
              [v9 setObject:v107 forKeyedSubscript:@"LearnedNR_QuadraFullRes"];
            }
            [v24 setObject:v9 forKeyedSubscript:@"SoftISPTuning"];
            long long v132 = 0u;
            long long v133 = 0u;
            long long v130 = 0u;
            long long v131 = 0u;
            v108 = [v16 allKeys];
            uint64_t v109 = [v108 countByEnumeratingWithState:&v130 objects:v162 count:16];
            if (v109)
            {
              uint64_t v110 = v109;
              uint64_t v111 = *(void *)v131;
              do
              {
                for (juint64_t j = 0; jj != v110; ++jj)
                {
                  if (*(void *)v131 != v111) {
                    objc_enumerationMutation(v108);
                  }
                  [v16 setObject:v24 forKeyedSubscript:*(void *)(*((void *)&v130 + 1) + 8 * jj)];
                }
                uint64_t v110 = [v108 countByEnumeratingWithState:&v130 objects:v162 count:16];
              }
              while (v110);
            }

            v10 = v118;
            [v118 setObject:v16 forKeyedSubscript:v121];

            v8 = (void *)v20;
            id v5 = v116;
            uint64_t v11 = v120;
          }
          else
          {
            v10 = v118;
          }

          ++v11;
          v12 = v9;
        }
        while (v11 != v119);
        uint64_t v119 = [v5 countByEnumeratingWithState:&v158 objects:v169 count:16];
      }
      while (v119);
    }
    else
    {
      v10 = v118;
    }

    objc_storeStrong(location, v10);
    v4 = v115;
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    id v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = v118;
  }

  return 0;
}

- (SoftISPStaticParameters)initWithCameraInfoByPortType:(id)a3 tuningParameters:(id)a4 moduleCalibrationByPortType:(id)a5 metalContext:(id)a6 deviceGeneration:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = v16;
  if (!v13 || !v14 || !v16)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_12:

    self = 0;
    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)SoftISPStaticParameters;
  v18 = [(SoftISPStaticParameters *)&v23 init];
  self = v18;
  if (!v18)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v18->_cameraInfoByPortType, a3);
  objc_storeStrong((id *)&self->_tuningParameters, a4);
  objc_storeStrong((id *)&self->_metalContext, a6);
  v19 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:@"Common"];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"NRFParameters"];
  v21 = [v20 objectForKeyedSubscript:@"Version"];
  self->_nrfVersiouint64_t n = [v21 unsignedIntegerValue];

  self->_deviceGeneratiouint64_t n = a7;
  if (!self->_nrfVersion
    || [(SoftISPStaticParameters *)self _initModuleCalibrationByPortType:v15]
    || [(SoftISPStaticParameters *)self _generateSoftISPTuningParameters])
  {
    FigDebugAssert3();
    goto LABEL_12;
  }
LABEL_8:

  return self;
}

- (int)_initModuleCalibrationByPortType:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263F2ED98]);
  if (v22 && (v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0])) != 0)
  {
    id v5 = v4;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = self->_cameraInfoByPortType;
    uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v11 hasPrefix:@"PortType"])
          {
            uint64_t v12 = [v23 objectForKeyedSubscript:v11];
            id v13 = (void *)v12;
            id v14 = v22;
            if (v12) {
              id v14 = (void *)v12;
            }
            id v15 = v14;

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (id v16 = [[SoftISPModuleCalibration alloc] initWithCMIModuleCalibration:v15 metalContext:self->_metalContext]) == 0)
            {
              FigDebugAssert3();
              int v20 = FigSignalErrorAt();

              goto LABEL_18;
            }
            v17 = v16;
            [(NSDictionary *)v5 setObject:v16 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    moduleCalibrationByPortType = self->_moduleCalibrationByPortType;
    self->_moduleCalibrationByPortType = v5;
    v19 = v5;

    int v20 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }
LABEL_18:

  return v20;
}

- (id)tuningParametersForInputFrameMetadata:(id)a3 tuningType:(int)a4
{
  uint64_t v6 = *MEMORY[0x263F2F5C8];
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F668]];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"0x%04X", objc_msgSend(v9, "intValue"));
  uint64_t v11 = (void *)v10;
  if (v8)
  {
    if (v9 && v10 != 0)
    {
      id v13 = self ? self->_tuningParameters : 0;
      id v14 = [(NSDictionary *)v13 objectForKeyedSubscript:v8];
      id v15 = [v14 objectForKeyedSubscript:v11];
      id v16 = [v15 objectForKeyedSubscript:@"SoftISPTuning"];

      if (v16)
      {
        if (a4 <= 119)
        {
          if (a4 <= 20)
          {
            switch(a4)
            {
              case 1:
              case 5:
              case 6:
              case 7:
              case 8:
              case 9:
                goto LABEL_22;
              case 2:
                v17 = @"UB";
                break;
              case 3:
                int v20 = @"UB";
LABEL_60:
                v21 = [v16 objectForKeyedSubscript:v20];
                id v22 = v21;
                id v23 = @"EVMinus";
                goto LABEL_61;
              case 4:
                v19 = @"UB";
                goto LABEL_52;
              case 10:
                v18 = @"UBLowLight";
                goto LABEL_58;
              default:
                if (a4 != 20) {
                  goto LABEL_22;
                }
                v17 = @"DeepFusion";
                break;
            }
LABEL_49:
            v21 = [v16 objectForKeyedSubscript:v17];
            id v22 = v21;
            id v23 = @"EVZero";
          }
          else
          {
            switch(a4)
            {
              case 'd':
                v18 = @"WYSIWYG_Quadra2x";
                goto LABEL_58;
              case 'e':
                v17 = @"UB_Quadra2x";
                goto LABEL_49;
              case 'f':
                int v20 = @"UB_Quadra2x";
                goto LABEL_60;
              case 'g':
                v19 = @"UB_Quadra2x";
                break;
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
                goto LABEL_22;
              case 'n':
                v18 = @"UBLowLight_Quadra2x";
                goto LABEL_58;
              default:
                if (a4 == 21)
                {
                  int v20 = @"DeepFusion";
                  goto LABEL_60;
                }
                if (a4 != 22) {
                  goto LABEL_22;
                }
                v19 = @"DeepFusion";
                break;
            }
LABEL_52:
            v21 = [v16 objectForKeyedSubscript:v19];
            id v22 = v21;
            id v23 = @"Long";
          }
LABEL_61:
          long long v24 = [v21 objectForKeyedSubscript:v23];

          goto LABEL_62;
        }
        if (a4 <= 149)
        {
          switch(a4)
          {
            case 120:
              v17 = @"DeepFusion_Quadra2x";
              goto LABEL_49;
            case 121:
              int v20 = @"DeepFusion_Quadra2x";
              goto LABEL_60;
            case 122:
              v19 = @"DeepFusion_Quadra2x";
              goto LABEL_52;
            case 130:
              v17 = @"DeepFusion_QuadraFullRes";
              goto LABEL_49;
            case 131:
              int v20 = @"DeepFusion_QuadraFullRes";
              goto LABEL_60;
            case 132:
              v19 = @"DeepFusion_QuadraFullRes";
              goto LABEL_52;
            case 140:
              v17 = @"DeepFusion_EnhancedRes";
              goto LABEL_49;
            case 141:
              int v20 = @"DeepFusion_EnhancedRes";
              goto LABEL_60;
            case 142:
              v19 = @"DeepFusion_EnhancedRes";
              goto LABEL_52;
            case 143:
              v21 = [v16 objectForKeyedSubscript:@"DeepFusion_EnhancedRes"];
              id v22 = v21;
              id v23 = @"Quadra48_EVZero";
              goto LABEL_61;
            default:
              goto LABEL_22;
          }
        }
        if (a4 <= 170)
        {
          switch(a4)
          {
            case 150:
              v18 = @"RawNightMode";
              goto LABEL_58;
            case 160:
              v18 = @"RawNightMode_Quadra2x";
              goto LABEL_58;
            case 170:
              v18 = @"SWFR";
              goto LABEL_58;
          }
        }
        else if (a4 > 179)
        {
          if (a4 == 180)
          {
            v18 = @"SWFR_Quadra2x";
            goto LABEL_58;
          }
          if (a4 == 190)
          {
            v18 = @"LearnedNR_QuadraFullRes";
            goto LABEL_58;
          }
        }
        else
        {
          if (a4 == 171)
          {
            v18 = @"SWFR_DocumentScanning";
            goto LABEL_58;
          }
          if (a4 == 172)
          {
            v18 = @"SWFR_DocumentScanning_Quadra2x";
LABEL_58:
            long long v24 = [v16 objectForKeyedSubscript:v18];
LABEL_62:

            goto LABEL_63;
          }
        }
LABEL_22:
        v18 = @"WYSIWYG";
        goto LABEL_58;
      }
    }
  }
  FigDebugAssert3();
  long long v24 = 0;
LABEL_63:

  return v24;
}

- (id)cameraInfoForInputFrameMetadata:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if (v4)
  {
    if (self) {
      cameraInfoByPortType = self->_cameraInfoByPortType;
    }
    else {
      cameraInfoByPortType = 0;
    }
    uint64_t v6 = [(NSDictionary *)cameraInfoByPortType objectForKeyedSubscript:v4];
  }
  else
  {
    FigDebugAssert3();
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)cameraInfoForPortType:(id)a3
{
  if (self) {
    self = (SoftISPStaticParameters *)self->_cameraInfoByPortType;
  }
  return (id)[(SoftISPStaticParameters *)self objectForKeyedSubscript:a3];
}

- (id)moduleConfigForInputFrameMetadata:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F2F5C8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F668]];

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"0x%04X", objc_msgSend(v7, "intValue"));
  uint64_t v9 = (void *)v8;
  if (!v6 || (v7 ? (BOOL v10 = v8 == 0) : (BOOL v10 = 1), v10))
  {
    FigDebugAssert3();
    id v14 = 0;
  }
  else
  {
    if (self) {
      tuningParameters = self->_tuningParameters;
    }
    else {
      tuningParameters = 0;
    }
    uint64_t v12 = [(NSDictionary *)tuningParameters objectForKeyedSubscript:v6];
    id v13 = [v12 objectForKeyedSubscript:v9];
    id v14 = [v13 objectForKeyedSubscript:@"ModuleConfig"];

    if (v14)
    {
      id v15 = [v14 objectForKeyedSubscript:@"Sensor"];
      id v16 = [v15 objectForKeyedSubscript:@"SensorID"];

      if (v16) {
        [v16 compare:v7];
      }
    }
  }

  return v14;
}

- (id)moduleConfigForPortType:(id)a3
{
  id v4 = a3;
  if (self) {
    cameraInfoByPortType = self->_cameraInfoByPortType;
  }
  else {
    cameraInfoByPortType = 0;
  }
  uint64_t v6 = [(NSDictionary *)cameraInfoByPortType objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2EED8]];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"sensorID"];

    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"0x%04X", objc_msgSend(v9, "intValue"));
    uint64_t v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      FigDebugAssert3();
      id v16 = 0;
    }
    else
    {
      if (self) {
        tuningParameters = self->_tuningParameters;
      }
      else {
        tuningParameters = 0;
      }
      id v14 = [(NSDictionary *)tuningParameters objectForKeyedSubscript:v4];
      id v15 = [v14 objectForKeyedSubscript:v11];
      id v16 = [v15 objectForKeyedSubscript:@"ModuleConfig"];

      if (v16)
      {
        v17 = [v16 objectForKeyedSubscript:@"Sensor"];
        v18 = [v17 objectForKeyedSubscript:@"SensorID"];

        if (v18) {
          [v18 compare:v9];
        }
      }
    }
  }
  else
  {
    FigDebugAssert3();
    id v16 = 0;
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  id v19 = v16;

  return v19;
}

- (int)tuningFlagForProcessingOption:(id)a3 tuningType:(int)a4 metadata:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  char v20 = 0;
  uint64_t v10 = [(SoftISPStaticParameters *)self tuningParametersForInputFrameMetadata:v9 tuningType:v6];
  uint64_t v11 = v10;
  if (v10)
  {
    BOOL v12 = [v10 objectForKeyedSubscript:v8];
    if (objc_msgSend(v12, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v20))
    {
      if ([v8 isEqualToString:@"SFHR"])
      {
        LODWORD(v13) = 2139095039;
        objc_msgSend(v12, "cmi_floatValueForKey:defaultValue:found:", @"ISPDGainThreshold", 0, v13);
        float v15 = v14;
        objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, 0.0);
        if ((float)(v16 * 0.0039062) < v15) {
          int v17 = 1;
        }
        else {
          int v17 = 2;
        }
      }
      else
      {
        int v17 = 1;
      }
    }
    else
    {
      int v17 = 2;
    }
    if (v20) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v18 = 0;
  }

  return v18;
}

- (int)firstPixelForSensorID:(unsigned __int16)a3
{
  int v3 = a3;
  id v4 = self;
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (self) {
    self = (SoftISPStaticParameters *)self->_tuningParameters;
  }
  id v5 = [(SoftISPStaticParameters *)self objectForKeyedSubscript:@"DefaultSensorIDs"];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v33 = v4;
      v34 = v6;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(v7);
          }
          float v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          float v15 = [v7 objectForKeyedSubscript:v14];
          int v35 = 0;
          float v16 = [MEMORY[0x263F08B08] scannerWithString:v15];
          if (![v16 scanHexInt:&v35])
          {
            FigDebugAssert3();
            FigSignalErrorAt();

            int PixelFromBayerPhase = -1;
            uint64_t v6 = v34;
            id v19 = v10;
            goto LABEL_28;
          }
          if (v35 == v3)
          {
            id v17 = v14;

            id v18 = v15;
            uint64_t v10 = v18;
            uint64_t v11 = v17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v9) {
          continue;
        }
        break;
      }

      if (v11)
      {
        uint64_t v6 = v34;
        id v19 = v10;
        if (!v10) {
          goto LABEL_30;
        }
        tuningParameters = v33;
        if (v33) {
          tuningParameters = v33->_tuningParameters;
        }
        id v21 = tuningParameters;
        id v22 = [v21 objectForKeyedSubscript:v11];
        id v23 = [v22 objectForKeyedSubscript:v19];

        long long v24 = [v23 objectForKeyedSubscript:@"ModuleConfig"];

        if (v24)
        {
          long long v25 = [v24 objectForKeyedSubscript:@"LensShading"];
          if (v25)
          {
            long long v26 = v25;
            long long v27 = [v25 objectForKeyedSubscript:@"MapsNormal"];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = [v27 objectForKeyedSubscript:@"BayerPhase"];
              if (v29)
              {
                uint64_t v30 = v29;
                int PixelFromBayerPhase = firstPixelFromBayerPhase(v29);

                goto LABEL_28;
              }
              FigDebugAssert3();
              FigSignalErrorAt();
            }
            else
            {
              FigDebugAssert3();
              FigSignalErrorAt();
            }
          }
          else
          {
            FigDebugAssert3();
            FigSignalErrorAt();
          }
        }
        else
        {
LABEL_30:
          FigDebugAssert3();
          FigSignalErrorAt();
        }
        goto LABEL_26;
      }
      uint64_t v6 = v34;
      id v19 = v10;
    }
    else
    {

      id v19 = 0;
    }
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    id v19 = 0;
  }
  uint64_t v11 = 0;
LABEL_26:
  int PixelFromBayerPhase = -1;
LABEL_28:

  return PixelFromBayerPhase;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)dimensionsForSensorInMetadata:(id)a3
{
  id v4 = a3;
  char v14 = 0;
  id v5 = [(SoftISPStaticParameters *)self cameraInfoForInputFrameMetadata:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v11 = 0;
    unsigned int v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_20;
  }
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F758]];
  uint64_t v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
LABEL_27:
    FigSignalErrorAt();
    uint64_t v11 = 0;
    unsigned int v9 = 0;
    goto LABEL_20;
  }
  unsigned int v9 = objc_msgSend(v7, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF50], 0, &v14);
  if (!v14)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = objc_msgSend(v8, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF38], 0, &v14);
  uint64_t v11 = v10;
  if (!v14)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_20;
  }
  if (v9 | v10) {
    goto LABEL_20;
  }
  int v12 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F668], 0, &v14);
  if (!v14)
  {
    FigDebugAssert3();
    goto LABEL_27;
  }
  uint64_t v11 = 0;
  if (v12 > 1811)
  {
    if (v12 == 1812)
    {
      unsigned int v9 = 4032;
      goto LABEL_19;
    }
    if (v12 == 1906)
    {
LABEL_16:
      unsigned int v9 = 4224;
LABEL_19:
      uint64_t v11 = 3024;
      goto LABEL_20;
    }
    if (v12 != 2051)
    {
LABEL_21:
      unsigned int v9 = 0;
      goto LABEL_20;
    }
    unsigned int v9 = 8448;
    uint64_t v11 = 6048;
  }
  else
  {
    if (v12 != 1587)
    {
      if (v12 != 1795 && v12 != 1811) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
    unsigned int v9 = 4224;
    uint64_t v11 = 3176;
  }
LABEL_20:

  return ($F61E096109CF133FD2477F48C7D0CEE7)(v9 | (unint64_t)(v11 << 32));
}

- ($F61E096109CF133FD2477F48C7D0CEE7)dimensionsForSensorInBayerPixelsInMetadata:(id)a3
{
  id v4 = a3;
  $F61E096109CF133FD2477F48C7D0CEE7 v5 = [(SoftISPStaticParameters *)self dimensionsForSensorInMetadata:v4];
  if (HIDWORD(*(void *)&v5)) {
    BOOL v6 = v5.var0.var0 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v8 = 0;
  }
  else
  {
    id v7 = [(SoftISPStaticParameters *)self cameraInfoForInputFrameMetadata:v4];
    uint64_t v8 = v7;
    if (v7)
    {
      unsigned int v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2EED0]];
      if (v9)
      {
        $F61E096109CF133FD2477F48C7D0CEE7 v5 = ($F61E096109CF133FD2477F48C7D0CEE7)vshr_n_u32((uint32x2_t)v5, 1uLL);
      }
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v5;
}

- (BOOL)gnuLSCCompensation
{
  if (result) {
    return *(void *)(result + 16) > 3uLL;
  }
  return result;
}

- (BOOL)lscFromCameraInfoByPortType
{
  if (result) {
    return *(void *)(result + 16) == 3;
  }
  return result;
}

- (uint64_t)deviceGeneration
{
  if (result) {
    return *(unsigned int *)(result + 24);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleCalibrationByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end