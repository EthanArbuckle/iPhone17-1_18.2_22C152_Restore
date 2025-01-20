@interface LensShadingCorrectionConfig
+ (int)getLSCMetadata:(id)a3 lscMetadata:(id *)a4 bounds:stageConfigMode:processingOptions:metalCtx:staticParameters:forAWB:;
@end

@implementation LensShadingCorrectionConfig

+ (int)getLSCMetadata:(id)a3 lscMetadata:(id *)a4 bounds:stageConfigMode:processingOptions:metalCtx:staticParameters:forAWB:
{
  v8 = v7;
  v9 = v6;
  int v196 = v5;
  v10 = v4;
  id v12 = a3;
  id v13 = v10;
  id v209 = v9;
  id v210 = v8;
  id v14 = v224;
  v198 = v12;
  if (!a4)
  {
    int v31 = FigSignalErrorAt();
    v147 = 0;
    v156 = 0;
    v182 = 0;
    id v80 = 0;
    goto LABEL_136;
  }
  v15 = -[SoftISPInputFrame metadata]((uint64_t)v12);
  id v16 = v12;
  id v17 = v15;
  id v18 = v14;
  uint64_t v212 = 0;
  char v211 = 0;
  v19 = [v18 cameraInfoForInputFrameMetadata:v17];
  id v201 = v14;
  id v202 = v13;
  if (!v19)
  {
    uint64_t v188 = v192;
    LODWORD(v187) = 0;
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_60;
  }
  id v20 = v16;
  id v21 = v17;
  [v18 cameraInfoForInputFrameMetadata:v21];
  v205 = id v203 = v16;
  id v199 = v18;
  if (!v205)
  {
    uint64_t v188 = v192;
    LODWORD(v187) = 0;
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    v30 = 0;
    goto LABEL_42;
  }
  v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263F2F508]];
  if (v22)
  {
    v194 = v19;
    id v23 = v17;
    id v24 = v14;
    id v25 = v13;
    id v26 = v22;
    v27 = (_DWORD *)[v26 bytes];
    id v193 = v26;
    uint64_t v28 = [v26 length];
    if (v27)
    {
      id v13 = v25;
      if (v28)
      {
        if (*v27 == 1)
        {
          uint64_t v29 = 24 * (int)v27[1];
          id v14 = v24;
          goto LABEL_14;
        }
        id v14 = v24;
        if (!*v27)
        {
          uint64_t v29 = 16 * (int)v27[1];
LABEL_14:
          id v17 = v23;
          v19 = v194;
          if (v28 == v29 + 8)
          {
            id v191 = v20;
            [(SoftISPInputFrame *)(uint64_t)v20 pts];
            double Seconds = CMTimeGetSeconds(&time);
            objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], 0, 0.0);
            float v34 = v33;
            objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4D0], 0, 0.0);
            float v36 = v35;
            v37 = [v205 objectForKeyedSubscript:*MEMORY[0x263F2EEF0]];
            [v37 floatValue];
            float v39 = v38;

            v40 = [v21 objectForKeyedSubscript:*MEMORY[0x263F2F5E0]];
            int v41 = [v40 intValue];

            *(float *)v42.i32 = (float)v41;
            if (!v41) {
              *(float *)v42.i32 = 1.0;
            }
            *(float *)v42.i32 = v39 * *(float *)v42.i32;
            if (*(float *)v42.i32 == 0.0)
            {
              uint64_t v188 = v192;
              LODWORD(v187) = 0;
              FigDebugAssert3();
              int v31 = FigSignalErrorAt();
            }
            else
            {
              int32x2_t v190 = v42;
              v43 = (float32x2_t *)malloc_type_malloc(8 * (int)v27[1], 0x100004000313F17uLL);
              v44 = v43;
              if ((int)v27[1] <= 0)
              {
                free(v43);
                int v31 = 0;
              }
              else
              {
                id v189 = v17;
                uint64_t v45 = 0;
                int v46 = 0;
                double v47 = (float)(v36 / 1000000.0);
                double v48 = Seconds - v34;
                float32x2_t v49 = (float32x2_t)vdup_lane_s32(v190, 0);
                double v50 = Seconds + v47;
                v51 = v27 + 5;
                float32x2_t v52 = (float32x2_t)vdup_n_s32(0x3B800000u);
                do
                {
                  if (*v27 == 1)
                  {
                    uint64_t v55 = (uint64_t)&v27[6 * v45 + 2];
                    v53 = (unsigned int *)(v55 + 8);
                    v54 = (unsigned int *)(v55 + 12);
                  }
                  else
                  {
                    if (*v27)
                    {
                      int v31 = -73541;
                      id v14 = v201;
                      id v13 = v202;
                      id v18 = v199;
                      id v16 = v203;
                      id v17 = v189;
                      v19 = v194;
                      goto LABEL_40;
                    }
                    v53 = v51 - 1;
                    v54 = v51;
                  }
                  unsigned int v56 = *v54;
                  unsigned int v57 = *v53;
                  int64_t v58 = FigHostTimeToNanoseconds();
                  CMTimeMake(&v213, v58, 1000000000);
                  double v59 = CMTimeGetSeconds(&v213);
                  if (v59 >= v48 && v59 < v50) {
                    v44[v46++] = vmul_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v56, v57)), v49), v52);
                  }
                  ++v45;
                  v51 += 4;
                }
                while (v45 < (int)v27[1]);
                float32x2_t v61 = 0;
                id v14 = v201;
                id v13 = v202;
                id v18 = v199;
                id v17 = v189;
                v19 = v194;
                if (v46 >= 1)
                {
                  uint64_t v62 = v46;
                  v63 = v44;
                  do
                  {
                    float32x2_t v64 = *v63++;
                    float32x2_t v61 = vadd_f32(v61, v64);
                    --v62;
                  }
                  while (v62);
                }
                free(v44);
                int v31 = 0;
              }
            }
            id v16 = v203;
LABEL_40:
            id v20 = v191;
          }
          else
          {
            uint64_t v188 = v192;
            LODWORD(v187) = 0;
            FigDebugAssert3();
            int v31 = FigSignalErrorAt();
          }
          v30 = v193;
          goto LABEL_42;
        }
        int v31 = -73541;
        v30 = v193;
        goto LABEL_36;
      }
      int v31 = 0;
      v30 = v193;
    }
    else
    {
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
      v30 = v26;
      id v13 = v25;
    }
    id v14 = v24;
LABEL_36:
    id v17 = v23;
    v19 = v194;
    goto LABEL_42;
  }
  v30 = 0;
  int v31 = 0;
LABEL_42:

  if (!v31)
  {
    v65 = [v18 moduleConfigForInputFrameMetadata:v21];
    v66 = [v65 objectForKeyedSubscript:@"LensShading"];
    v67 = [v66 objectForKeyedSubscript:@"OISAdaptation"];
    int v68 = objc_msgSend(v67, "cmi_intValueForKey:defaultValue:found:", @"OISAdaptationMethod", 0, &v211);

    v69 = [v19 objectForKeyedSubscript:*MEMORY[0x263F2EEC0]];
    v70 = [v19 objectForKeyedSubscript:*MEMORY[0x263F2EED0]];
    if (!v69 || v68 == 1)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x263F2EEC8], v187, v188);
      id v71 = (id)objc_claimAutoreleasedReturnValue();

      if (!v71)
      {
        uint64_t v188 = v192;
        LODWORD(v187) = 0;
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();

        goto LABEL_59;
      }
      if (v70)
      {
        id v72 = v70;
        if (*(_DWORD *)[v72 bytes] != 1)
        {
          uint64_t v188 = v192;
          LODWORD(v187) = 0;
          FigDebugAssert3();
          v186 = v72;
          int v31 = FigSignalErrorAt();

LABEL_198:
          goto LABEL_59;
        }
      }
      if (v68 == 1)
      {
        int v73 = CMILSCOISAdaptation_extrapAndCropLSCLumaOnlyWithOISOffset();
        if (v73)
        {
          int v31 = v73;
          uint64_t v188 = v192;
          LODWORD(v187) = v73;
        }
        else
        {
          if (!v70) {
            goto LABEL_58;
          }
          int v74 = CMILSCOISAdaptation_extrapAndCropCICWithOISOffset();
          if (!v74) {
            goto LABEL_58;
          }
          int v31 = v74;
          uint64_t v188 = v192;
          LODWORD(v187) = v74;
        }
        goto LABEL_196;
      }
    }
    else
    {
      id v71 = v69;
      if (*(_DWORD *)[v71 bytes] != 2)
      {
        uint64_t v188 = v192;
        LODWORD(v187) = 0;
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();
LABEL_197:

        goto LABEL_198;
      }
    }
    int v75 = CMILSCOISAdaptation_convertV2LSCTableToV1LSCTableWithOISOffset();
    if (v75)
    {
      int v31 = v75;
      uint64_t v188 = v192;
      LODWORD(v187) = v75;
    }
    else
    {
      if (!v70 || (int v76 = CMILSCOISAdaptation_convertV2CICTableToV1CICTableWithOISOffset()) == 0)
      {
LABEL_58:
        *((void *)a4 + 16) = v212;

        int v31 = 0;
LABEL_59:
        id v16 = v203;
        id v18 = v199;
        goto LABEL_60;
      }
      int v31 = v76;
      uint64_t v188 = v192;
      LODWORD(v187) = v76;
    }
LABEL_196:
    FigDebugAssert3();
    goto LABEL_197;
  }
  uint64_t v188 = v192;
  LODWORD(v187) = v31;
  FigDebugAssert3();
LABEL_60:

  id v77 = 0;
  id v78 = 0;
  v79 = v17;
  id v80 = v78;

  if (v31)
  {
    v182 = v77;
    FigDebugAssert3();
    v147 = 0;
    v156 = 0;
    goto LABEL_136;
  }
  id v81 = v16;
  id v82 = v13;
  id v83 = v77;
  id v80 = v80;
  id v84 = v18;
  v85 = v84;
  if (!v81 || !v82)
  {
    int v31 = FigSignalErrorAt();
LABEL_178:
    v86 = 0;
    goto LABEL_101;
  }
  v86 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)v84);

  if (!v86) {
    goto LABEL_149;
  }
  *((_OWORD *)a4 + 6) = 0u;
  *((_OWORD *)a4 + 7) = 0u;
  *((_OWORD *)a4 + 4) = 0u;
  *((_OWORD *)a4 + 5) = 0u;
  *((_OWORD *)a4 + 2) = 0u;
  *((_OWORD *)a4 + 3) = 0u;
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  *((unsigned char *)a4 + 36) = -[SoftISPInputFrame cfaLayout]((uint64_t)v81) == 3;
  if ((v196 - 3) <= 1)
  {
    id v87 = v82;
    LOBYTE(time.value) = 0;
    v88 = -[SoftISPInputFrame registers]((uint64_t)v81);
    v89 = v88;
    if (v88)
    {
      v90 = [v88 objectForKeyedSubscript:@"BayerProcLSC"];
      if (v90)
      {
        v91 = v90;
        *((_DWORD *)a4 + 8) = objc_msgSend(v90, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 0x7FFFFFFFLL, &time);
        if (LOBYTE(time.value))
        {
          objc_msgSend(v91, "cmi_simdUInt2ValueForXKey:yKey:defaultValue:found:", @"GridIntervalRecipX", @"GridIntervalRecipY", &time, 0.0);
          if (LOBYTE(time.value))
          {
            *((float32x2_t *)a4 + 3) = vmul_f32(vmul_f32(vcvt_f32_u32(v92), (float32x2_t)vdup_n_s32(0x2F800000u)), (float32x2_t)0x3F0000003F000000);
            uint64_t v93 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v87);
            *((_WORD *)a4 + 3) = WORD2(v93);
            *((_WORD *)a4 + 2) = v93;

            goto LABEL_88;
          }
          uint64_t v188 = v192;
          LODWORD(v187) = 0;
        }
        else
        {
          uint64_t v188 = v192;
          LODWORD(v187) = 0;
        }
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();

LABEL_168:
        if (v31)
        {
          uint64_t v188 = v192;
          LODWORD(v187) = v31;
LABEL_177:
          FigDebugAssert3();
          goto LABEL_178;
        }
        goto LABEL_88;
      }
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
    }
    else
    {
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
    }
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_168;
  }
  id v94 = v81;
  id v197 = v82;
  id v95 = v82;
  id v96 = v85;
  id v97 = v83;
  id v200 = v80;
  v204 = v94;
  v98 = -[SoftISPInputFrame metadata]((uint64_t)v94);
  if (!v96)
  {
    uint64_t v188 = v192;
    LODWORD(v187) = 0;
LABEL_172:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_87;
  }
  if (!v97)
  {
    uint64_t v188 = v192;
    LODWORD(v187) = 0;
    goto LABEL_172;
  }
  uint64_t v195 = (uint64_t)v95;
  uint64_t v99 = [v96 cameraInfoForInputFrameMetadata:v98];
  if (v99)
  {
    v100 = (void *)v99;
    uint64_t v101 = [v97 bytes];
    if (v101)
    {
      uint64_t v102 = v101;
      int v103 = -[SoftISPInputFrame firstPixel]((uint64_t)v204);
      *((_DWORD *)a4 + 8) = v103;
      if (v103 == -1)
      {
        uint64_t v188 = v192;
        LODWORD(v187) = 0;
        FigDebugAssert3();
LABEL_186:
        int v31 = FigSignalErrorAt();

        goto LABEL_192;
      }
      __asm { FMOV            V1.2S, #1.0 }
      *((float32x2_t *)a4 + 3) = vmul_f32(vdiv_f32(_D1, vcvt_f32_u32(*(uint32x2_t *)(v102 + 12))), (float32x2_t)0x3F0000003F000000);
      int32x2_t v108 = (int32x2_t)[v96 dimensionsForSensorInMetadata:v98];
      if (!*((unsigned char *)a4 + 36))
      {
LABEL_86:
        uint64_t v130 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels](v195);
        *((_WORD *)a4 + 3) = WORD2(v130);
        *((_WORD *)a4 + 2) = v130;
        *((_WORD *)a4 + 5) = v108.i16[2];
        *((_WORD *)a4 + 4) = v108.i16[0];

        id v95 = (id)v195;
        int v31 = 0;
        goto LABEL_87;
      }
      if (v200)
      {
        id v206 = v80;
        id v109 = v83;
        id v110 = v200;
        if ([v110 bytes])
        {
          if ((unint64_t)[v110 length] <= 0x5F)
          {
            uint64_t v188 = v192;
            LODWORD(v187) = 0;
          }
          else
          {
            id v111 = v110;
            if (*(_DWORD *)[v111 bytes] == 1)
            {
              uint64_t v112 = [v111 bytes];
              uint32x2_t v113 = *(uint32x2_t *)(v112 + 12);
              if (v113.i32[0] && v113.i32[1])
              {
                int v114 = 0;
                float32x2_t v115 = vcvt_f32_u32(v113);
                float32x2_t v116 = vadd_f32(v115, v115);
                float32x2_t v117 = vadd_f32(v116, v116);
                *((float32x2_t *)a4 + 11) = vdiv_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(v108, (int32x2_t)-1)), v117);
                float32x2_t v118 = vcvt_f32_u32(*(uint32x2_t *)(v112 + 4));
                char v119 = 1;
                id v83 = v109;
                id v80 = v206;
                do
                {
                  int v120 = 0;
                  char v121 = v119;
                  int v122 = 2 * v114;
                  float v123 = (float)v114;
                  float v124 = -(float)v114;
                  char v125 = 1;
                  do
                  {
                    char v126 = v125;
                    v127.f32[0] = (float)v120;
                    v128.f32[0] = -(float)v120;
                    v127.f32[1] = v123;
                    v128.f32[1] = v124;
                    float32x2_t v129 = vmla_f32(v128, v116, vmla_f32(v118, *(float32x2_t *)((char *)a4 + 24), v127));
                    *((float32x2_t *)a4 + (*((_DWORD *)a4 + 8) ^ (v120 | v122)) + 12) = vdiv_f32(vrndm_f32(vadd_f32(v129, v129)), v117);
                    int v120 = 1;
                    char v125 = 0;
                  }
                  while ((v126 & 1) != 0);
                  char v119 = 0;
                  int v114 = 1;
                }
                while ((v121 & 1) != 0);
                goto LABEL_86;
              }
              uint64_t v188 = v192;
              LODWORD(v187) = 0;
            }
            else
            {
              uint64_t v188 = v192;
              LODWORD(v187) = 0;
            }
          }
        }
        else
        {
          uint64_t v188 = v192;
          LODWORD(v187) = 0;
        }
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();

        id v83 = v109;
        id v80 = v206;
        goto LABEL_192;
      }
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
    }
    else
    {
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
    }
    FigDebugAssert3();
    goto LABEL_186;
  }
  uint64_t v188 = v192;
  LODWORD(v187) = 0;
  FigDebugAssert3();
  int v31 = FigSignalErrorAt();
LABEL_192:
  id v95 = (id)v195;
LABEL_87:

  id v82 = v197;
  if (v31)
  {
    uint64_t v188 = v192;
    LODWORD(v187) = v31;
    goto LABEL_177;
  }
LABEL_88:
  v86 = -[SoftISPInputFrame metadata]((uint64_t)v81);
  if (!v86)
  {
    uint64_t v188 = v192;
    LODWORD(v187) = 0;
    FigDebugAssert3();
LABEL_149:
    int v31 = FigSignalErrorAt();
    goto LABEL_101;
  }
  float LensShadingModulationWeightFromFrame = _getLensShadingModulationWeightFromFrame(v81, v85);
  id v132 = v83;
  v133 = v132;
  if (v132)
  {
    id v134 = v132;
    v135 = (_DWORD *)[v134 bytes];
    if (v135)
    {
      unsigned int v136 = (unsigned __int16)v135[5];
      *((_WORD *)a4 + 6) = v135[5];
      int v137 = v135[6];
      *((_WORD *)a4 + 7) = v137;
      *((_WORD *)a4 + 24) = v135[7] / v136;
      int v138 = v135[8] / v136;
      *((_WORD *)a4 + 25) = v138;
      *((_WORD *)a4 + 26) = v135[9] / v136;
      *((_WORD *)a4 + 27) = v135[10] / v136;
      float v139 = 1.0;
      if (v225)
      {
LABEL_99:
        *((float *)a4 + 4) = v139;

LABEL_100:
        int v31 = 0;
        goto LABEL_101;
      }
      if ((_WORD)v137)
      {
        int v140 = 0;
        uint64_t v141 = (uint64_t)&v135[(unsigned __int16)v138 * v136 + 11];
        float v142 = 0.0;
        do
        {
          unsigned int v143 = v136;
          v144 = (float *)v141;
          do
          {
            float v145 = *v144++;
            float v142 = fmaxf(v142, v145);
            --v143;
          }
          while (v143);
          v141 += 4 * (v136 - 1) + 4;
          ++v140;
        }
        while (v140 != (unsigned __int16)v137);
        if (v142 > 0.0)
        {
          float v139 = 1.0
               / (float)((float)(1.0 - LensShadingModulationWeightFromFrame)
                       + (float)(v142 * LensShadingModulationWeightFromFrame));
          goto LABEL_99;
        }
      }
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
    }
    else
    {
      uint64_t v188 = v192;
      LODWORD(v187) = 0;
    }
    FigDebugAssert3();
  }
  else
  {
    uint64_t v188 = v192;
    LODWORD(v187) = 0;
    FigDebugAssert3();
  }
  int v184 = FigSignalErrorAt();

  if (!v184) {
    goto LABEL_100;
  }
  uint64_t v188 = v192;
  LODWORD(v187) = v184;
  FigDebugAssert3();
  int v31 = v184;
LABEL_101:

  if (v31)
  {
    v182 = v83;
    FigDebugAssert3();
    v147 = 0;
LABEL_156:
    v156 = 0;
    goto LABEL_135;
  }
  v146 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:*((unsigned __int16 *)a4 + 6) height:*((unsigned __int16 *)a4 + 7) mipmapped:0];
  v147 = v146;
  if (!v146)
  {
    v182 = v83;
LABEL_155:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_156;
  }
  [v146 setUsage:23];
  [v147 setStorageMode:0];
  if (*((unsigned char *)a4 + 36)) {
    uint64_t v148 = 3;
  }
  else {
    uint64_t v148 = 2;
  }
  objc_msgSend(v147, "setTextureType:", v148, v187, v188);
  if (*((unsigned char *)a4 + 36)) {
    uint64_t v149 = 4;
  }
  else {
    uint64_t v149 = 1;
  }
  [v147 setArrayLength:v149];
  v150 = [v210 device];
  uint64_t v151 = [v150 newTextureWithDescriptor:v147];
  v152 = (void *)*((void *)a4 + 17);
  *((void *)a4 + 17) = v151;

  if (!*((void *)a4 + 17))
  {
    v182 = v83;
    goto LABEL_155;
  }
  v153 = -[SoftISPInputFrame metadata]((uint64_t)v81);
  uint64_t v154 = *MEMORY[0x263F2F4E0];
  int v155 = objc_msgSend(v153, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F4E0], 0, 0);

  v156 = 0;
  if (v155 != 1)
  {
LABEL_113:
    id v161 = v81;
    id v162 = v83;
    id v80 = v80;
    id v163 = v85;
    id v164 = v209;
    v165 = -[SoftISPInputFrame metadata]((uint64_t)v161);
    bzero(&time, 0x258uLL);
    if (v165)
    {
      char v223 = v225;
      v207 = v80;
      if (v225)
      {
        char v166 = 0;
      }
      else
      {
        LOBYTE(v213.value) = 0;
        BOOL v222 = objc_msgSend(v165, "cmi_intValueForKey:defaultValue:found:", v154, 0, &v213) == 1;
        char v166 = objc_msgSend(v165, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F338], 0, &v213);
      }
      v208 = v164;
      char v221 = v166;
      LOBYTE(v213.value) = 0;
      v167 = [v163 tuningParametersForInputFrameMetadata:v165 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v161)];
      if (!v167) {
        FigSignalErrorAt();
      }
      id v168 = v162;
      v169 = [v167 objectForKeyedSubscript:@"LSC"];
      v170 = v169;
      if (!v169)
      {
        FigSignalErrorAt();
        v170 = (void *)MEMORY[0x263EFFA78];
      }
      id v171 = v170;

      LODWORD(v172) = 9.0;
      objc_msgSend(v171, "cmi_floatValueForKey:defaultValue:found:", @"lowLightLuxHigh", &v213, v172);
      float v174 = *(float *)&v173;
      int v218 = LODWORD(v173);
      if (!LOBYTE(v213.value)) {
        FigSignalErrorAt();
      }
      LODWORD(v173) = 1.0;
      objc_msgSend(v171, "cmi_floatValueForKey:defaultValue:found:", @"lowLightLuxLow", &v213, v173);
      float v176 = *(float *)&v175;
      int v217 = LODWORD(v175);
      if (!LOBYTE(v213.value)) {
        FigSignalErrorAt();
      }
      LODWORD(v175) = 1149239296;
      objc_msgSend(v171, "cmi_floatValueForKey:defaultValue:found:", @"flashPercentageHigh", &v213, v175);
      float v178 = *(float *)&v177;
      int v219 = LODWORD(v177);
      if (!LOBYTE(v213.value)) {
        FigSignalErrorAt();
      }
      LODWORD(v177) = 1133903872;
      objc_msgSend(v171, "cmi_floatValueForKey:defaultValue:found:", @"flashPercentageLow", &v213, v177);
      float v180 = v179;
      float v220 = v179;
      if (!LOBYTE(v213.value)) {
        FigSignalErrorAt();
      }
      if (v176 >= v174 || v180 >= v178)
      {
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();

        id v162 = v168;
        id v80 = v207;
        id v164 = v208;
      }
      else
      {

        int v216 = 1065353216;
        uint64_t v215 = 0x460000003F000000;
        id v162 = v168;
        id v164 = v208;
        id v80 = v207;
        int LSCGainMapWithLSCMetadata = _generateLSCGainMapWithLSCMetadata((uint64_t)a4, v161, (float *)&time, v162, v207, v163, objc_msgSend(v208, "cmi_BOOLValueForKey:defaultValue:found:", @"Aux", 0, 0));
        int v31 = 0;
        if (LSCGainMapWithLSCMetadata)
        {
          int v185 = LSCGainMapWithLSCMetadata;
          FigDebugAssert3();
          int v31 = v185;
        }
      }
    }
    else
    {
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }

    v182 = v162;
    if (v31) {
      FigDebugAssert3();
    }
    goto LABEL_135;
  }
  v157 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:25 width:*((unsigned __int16 *)a4 + 6) height:*((unsigned __int16 *)a4 + 7) mipmapped:0];
  v156 = v157;
  if (v157)
  {
    [v157 setUsage:23];
    [v156 setStorageMode:0];
    [v156 setTextureType:2];
    v158 = [v210 device];
    uint64_t v159 = [v158 newTextureWithDescriptor:v156];
    v160 = (void *)*((void *)a4 + 18);
    *((void *)a4 + 18) = v159;

    if (*((void *)a4 + 18)) {
      goto LABEL_113;
    }
    v182 = v83;
  }
  else
  {
    v182 = v83;
  }
  FigDebugAssert3();
  int v31 = FigSignalErrorAt();
LABEL_135:
  id v14 = v201;
  id v13 = v202;
LABEL_136:

  return v31;
}

@end