@interface H13FastAWB
- (H13FastAWB)initWithMetalContext:(id)a3;
- (__n128)readAWBComboGains;
- (__n128)readAWBGOCGains;
- (__n128)readAWBGains;
- (double)resetInvalidateAWBGains;
- (int)compareAWBComboGains:(H13FastAWB *)self;
- (int)configForInputFrame:(id)a3 bounds:(id)a4 processingOptions:(id)a5 staticParameters:(id)a6 registers:(id)a7;
- (int)run:(id)a3 lscGainsTex:(id)a4 hrEnabled:(BOOL)a5 auxEnabled:(BOOL)a6 updatedMetadata:(id)a7;
@end

@implementation H13FastAWB

- (H13FastAWB)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)H13FastAWB;
  v6 = [(H13FastAWB *)&v17 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_13;
  }
  [(H13FastAWB *)v6 resetInvalidateAWBGains];
  *(_OWORD *)&v7->_awbGOCGains[6] = v8;
  [(H13FastAWB *)v7 resetInvalidateAWBGains];
  *(_OWORD *)&v7->_awbComboGains[6] = v9;
  [(H13FastAWB *)v7 resetInvalidateAWBGains];
  *(_OWORD *)&v7->_awbGains[6] = v10;
  *(_WORD *)&v7->_allocatorSetupComplete = 0;
  if (!v5) {
    goto LABEL_13;
  }
  v11 = [v5 commandQueue];

  if (!v11) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v7->_metal, a3);
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    v12 = (AWBProcessor *)objc_alloc_init(MEMORY[0x263F30658]);
    AWBProcessor = v7->_AWBProcessor;
    v7->_AWBProcessor = v12;

    if (v7->_AWBProcessor)
    {
      v14 = [v5 commandQueue];
      [v7->_AWBProcessor setMetalCommandQueue:v14];

      if (![v7->_AWBProcessor setup]) {
        goto LABEL_7;
      }
      FigDebugAssert3();
    }
LABEL_13:
    FigSignalErrorAt();
    v15 = 0;
    goto LABEL_8;
  }
LABEL_7:
  v15 = v7;
LABEL_8:

  return v15;
}

- (double)resetInvalidateAWBGains
{
  return 0.0;
}

- (int)configForInputFrame:(id)a3 bounds:(id)a4 processingOptions:(id)a5 staticParameters:(id)a6 registers:(id)a7
{
  v169[8] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a5;
  v18 = -[SoftISPInputFrame metadata]((uint64_t)v13);
  v19 = -[RawNightModeInputFrame pixelBuffer]((uint64_t)v15);
  self->_int awbMode = objc_msgSend(v17, "cmi_intValueForKey:defaultValue:found:", @"AWBMode", 0, 0);
  [(H13FastAWB *)self resetInvalidateAWBGains];
  *(_OWORD *)&self->_awbGOCGains[6] = v20;
  [(H13FastAWB *)self resetInvalidateAWBGains];
  *(_OWORD *)&self->_awbComboGains[6] = v21;
  [(H13FastAWB *)self resetInvalidateAWBGains];
  *(_OWORD *)&self->_awbGains[6] = v22;
  int v23 = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"AWBPurgeResources", 0, 0);

  if (v23) {
    [self->_AWBProcessor purgeResources];
  }
  id v162 = v15;
  v163 = v16;
  v161 = v19;
  if (self->_awbMode)
  {
    if (v18)
    {
      uint64_t v24 = -[SoftISPInputFrame firstPixel]((uint64_t)v13);
      if (v24 != -1)
      {
        uint64_t v25 = v24;
        BOOL v157 = v16 == 0;
        uint64_t v26 = -[SoftISPInputFrame cfaLayout]((uint64_t)v13);
        if (v26)
        {
          uint64_t v27 = v26;
          v159 = [v15 moduleConfigForInputFrameMetadata:v18];
          if (v159)
          {
            uint64_t v28 = [v15 cameraInfoForInputFrameMetadata:v18];
            if (!v28)
            {
              FigDebugAssert3();
              int v67 = FigSignalErrorAt();

              goto LABEL_58;
            }
            v29 = (void *)v28;
            v30 = [self->_AWBProcessor awbParams];
            [v30 setMetadata:v18];

            v31 = [self->_AWBProcessor awbParams];
            v155 = v29;
            [v31 setCameraInfo:v29];

            v32 = [self->_AWBProcessor awbParams];
            [v32 setModuleConfig:v159];

            v33 = [NSNumber numberWithInt:v25];
            v34 = [self->_AWBProcessor awbParams];
            [v34 setFirstPixel:v33];

            v35 = [NSNumber numberWithInt:v27];
            v36 = [self->_AWBProcessor awbParams];
            [v36 setCfaLayout:v35];

            v37 = [v18 objectForKeyedSubscript:*MEMORY[0x263F2F4E0]];
            if ([v37 BOOLValue])
            {
              char v38 = 1;
            }
            else
            {
              v68 = [v18 objectForKeyedSubscript:*MEMORY[0x263F2F358]];
              char v38 = [v68 BOOLValue];
            }
            int awbMode = self->_awbMode;
            v156 = v18;
            if (awbMode != 3)
            {
              if (awbMode == 2)
              {
                uint64_t v70 = 0;
                uint64_t v71 = 1;
                goto LABEL_44;
              }
              if (awbMode == 1)
              {
                if (v38)
                {
                  uint64_t v70 = 0;
LABEL_43:
                  uint64_t v71 = 0;
LABEL_44:
                  v92 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v71, v134, v136);
                  v93 = [self->_AWBProcessor awbParams];
                  [v93 setDigitalFlash:v92];

                  v94 = [NSNumber numberWithUnsignedInt:v70];
                  v95 = [self->_AWBProcessor awbParams];
                  [v95 setFaceAssistedBehaviorMode:v94];

                  v166[0] = @"X";
                  v166[1] = @"Y";
                  v167[0] = &unk_270E988F0;
                  v167[1] = &unk_270E988F0;
                  v166[2] = @"Width";
                  v96 = NSNumber;
                  -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v14);
                  v98 = [v96 numberWithUnsignedInt:v97];
                  v167[2] = v98;
                  v166[3] = @"Height";
                  v99 = NSNumber;
                  -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v14);
                  v101 = [v99 numberWithUnsignedInt:HIDWORD(v100)];
                  v167[3] = v101;
                  v166[4] = @"FullWidth";
                  v102 = NSNumber;
                  -[SoftISPInputFrame sensorCropRect]((uint64_t)v13);
                  v104 = [v102 numberWithUnsignedInt:v103 / -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v13)];
                  v167[4] = v104;
                  v166[5] = @"FullHeight";
                  v105 = NSNumber;
                  -[SoftISPInputFrame sensorCropRect]((uint64_t)v13);
                  id v106 = v13;
                  v108 = [v105 numberWithUnsignedInt:v107 / -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v13)];
                  v167[5] = v108;
                  v109 = [NSDictionary dictionaryWithObjects:v167 forKeys:v166 count:6];
                  v110 = [self->_AWBProcessor awbParams];
                  [v110 setValidRectInBufferCoords:v109];

                  CGFloat v111 = (double)(int)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14);
                  CGFloat v112 = (double)(int)((unint64_t)-[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14) >> 32);
                  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14);
                  CGFloat v114 = (double)v113;
                  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v14);
                  v170.size.height = (double)v115;
                  v170.origin.x = v111;
                  v170.origin.y = v112;
                  v170.size.width = v114;
                  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v170);
                  v117 = [self->_AWBProcessor awbParams];
                  [v117 setValidRectInSensorReadoutCoords:DictionaryRepresentation];

                  CGFloat v118 = (double)(int)-[SoftISPBounds awbRegionOfInterestWithinInputBufferInPixels]((uint64_t)v14);
                  CGFloat v119 = (double)(int)((unint64_t)-[SoftISPBounds awbRegionOfInterestWithinInputBufferInPixels]((uint64_t)v14) >> 32);
                  -[SoftISPBounds awbRegionOfInterestWithinInputBufferInPixels]((uint64_t)v14);
                  CGFloat v121 = (double)v120;
                  -[SoftISPBounds awbRegionOfInterestWithinInputBufferInPixels]((uint64_t)v14);
                  v171.size.height = (double)v122;
                  v171.origin.x = v118;
                  v171.origin.y = v119;
                  v171.size.width = v121;
                  CFDictionaryRef v123 = CGRectCreateDictionaryRepresentation(v171);
                  v124 = [self->_AWBProcessor awbParams];
                  [v124 setRegionOfInterestRectInBufferCoords:v123];

                  id v16 = v163;
                  if (v163)
                  {
                    v125 = [v163 objectForKeyedSubscript:@"IspStats0"];
                    id v15 = v162;
                    if (![v125 count])
                    {
                      FigDebugAssert3();
                      int v67 = FigSignalErrorAt();

                      id v13 = v106;
                      v18 = v156;
                      goto LABEL_57;
                    }
                    v126 = [self->_AWBProcessor awbParams];
                    [v126 setRegisters:v125];

                    id v13 = v106;
                  }
                  else
                  {
                    v125 = 0;
                    id v13 = v106;
                    id v15 = v162;
                  }
                  v18 = v156;
                  if (!self->_allocatorSetupComplete)
                  {
                    v127 = [(FigMetalContext *)self->_metal allocator];
                    v128 = [v127 backendAllocator];

                    if (!v128)
                    {
                      FigSignalErrorAt();

                      int v67 = 0;
                      goto LABEL_57;
                    }
                    id v129 = objc_alloc_init(MEMORY[0x263F2ED88]);
                    if (!v129)
                    {
                      FigDebugAssert3();
                      int v67 = FigSignalErrorAt();
LABEL_56:

LABEL_57:
                      v19 = v161;
                      goto LABEL_58;
                    }
                    v130 = v129;
                    v131 = [(FigMetalContext *)self->_metal allocator];
                    v132 = [v131 backendAllocator];
                    [v130 setAllocatorBackend:v132];

                    NSSelectorFromString(&cfstr_Externalmemory_0.isa);
                    if (objc_opt_respondsToSelector())
                    {
                      [self->_AWBProcessor setExternalMemoryResource:v130];
                    }
                    else
                    {
                      uint64_t v137 = v7;
                      LODWORD(v135) = 0;
                      FigDebugAssert3();
                    }
                    self->_allocatorSetupComplete = 1;
                  }
                  int v67 = -[AWBProcessor prepareToProcess:](self->_AWBProcessor, "prepareToProcess:", v157, v135, v137);
                  if (v67)
                  {
                    FigDebugAssert3();
                    FigSignalErrorAt();
                  }
                  else
                  {
                    self->_configured = 1;
                  }
                  goto LABEL_56;
                }
                uint64_t v73 = *MEMORY[0x263F2F1D8];
                v74 = [v18 objectForKeyedSubscript:*MEMORY[0x263F2F1D8]];

                if (!v74)
                {
                  uint64_t v71 = 0;
                  uint64_t v70 = 2;
                  goto LABEL_44;
                }
                v75 = [v18 objectForKeyedSubscript:v73];
                v76 = v75;
                if (!v75)
                {
                  uint64_t v70 = 2;
LABEL_42:

                  goto LABEL_43;
                }
                v77 = [v75 objectForKeyedSubscript:*MEMORY[0x263F2F220]];
                v154 = [v77 objectForKeyedSubscript:@"AwbOutputMetadata"];
                if ([v154 count])
                {
                  v152 = v77;
                  v153 = v76;
                  v78 = [self->_AWBProcessor awbParams];
                  NSSelectorFromString(&cfstr_Faceassistedsk.isa);
                  char v79 = objc_opt_respondsToSelector();

                  if (v79)
                  {
                    v168[0] = @"wpRgLogRatio";
                    v80 = NSNumber;
                    v81 = v154;
                    v151 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    [v151 floatValue];
                    v150 = objc_msgSend(v80, "numberWithFloat:");
                    v169[0] = v150;
                    v168[1] = @"wpBgLogRatio";
                    v82 = NSNumber;
                    v149 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    [v149 floatValue];
                    v148 = objc_msgSend(v82, "numberWithFloat:");
                    v169[1] = v148;
                    v168[2] = @"wpSkinRgLogRatio";
                    v83 = NSNumber;
                    v147 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    [v147 floatValue];
                    v146 = objc_msgSend(v83, "numberWithFloat:");
                    v169[2] = v146;
                    v168[3] = @"wpSkinBgLogRatio";
                    v84 = NSNumber;
                    v145 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    [v145 floatValue];
                    v144 = objc_msgSend(v84, "numberWithFloat:");
                    v169[3] = v144;
                    v168[4] = @"continuousFDTimes";
                    v85 = NSNumber;
                    v143 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    v142 = objc_msgSend(v85, "numberWithInt:", objc_msgSend(v143, "intValue"));
                    v169[4] = v142;
                    v168[5] = @"skinColorSampleNum";
                    v86 = NSNumber;
                    v141 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    v140 = objc_msgSend(v86, "numberWithInt:", objc_msgSend(v141, "intValue"));
                    v169[5] = v140;
                    v168[6] = @"skinColorSampleVariance";
                    v87 = NSNumber;
                    v138 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    [v138 floatValue];
                    v88 = objc_msgSend(v87, "numberWithFloat:");
                    v169[6] = v88;
                    v168[7] = @"minDistSkinToWhiteMapping";
                    v89 = NSNumber;
                    v90 = objc_msgSend(v154, "objectForKeyedSubscript:");
                    [v90 floatValue];
                    v91 = objc_msgSend(v89, "numberWithFloat:");
                    v169[7] = v91;
                    v139 = [NSDictionary dictionaryWithObjects:v169 forKeys:v168 count:8];

                    [self->_AWBProcessor setValue:v139 forKeyPath:@"awbParams.faceAssistedSkinGainsToMatch"];
                    uint64_t v70 = 3;
                    v77 = v152;
                    v76 = v153;
LABEL_41:

                    goto LABEL_42;
                  }
                  uint64_t v136 = v7;
                  LODWORD(v134) = 0;
                  FigDebugAssert3();
                  uint64_t v70 = 2;
                  v76 = v153;
                }
                else
                {
                  uint64_t v70 = 2;
                }
                v81 = v154;
                goto LABEL_41;
              }
              v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            uint64_t v70 = 0;
            uint64_t v71 = 2;
            goto LABEL_44;
          }
        }
      }
    }
LABEL_66:
    FigDebugAssert3();
    int v67 = FigSignalErrorAt();
    goto LABEL_58;
  }
  if (!v18) {
    goto LABEL_66;
  }
  objc_storeStrong((id *)&self->_metadata, v18);
  self->_configured = 1;
  v39 = [v15 moduleConfigForInputFrameMetadata:v18];
  if (v39)
  {
    v40 = [v15 cameraInfoForInputFrameMetadata:v18];
    if (v40)
    {
      v41 = [self->_AWBProcessor awbParams];
      [v41 setCameraInfo:v40];

      v42 = [self->_AWBProcessor awbParams];
      v158 = v39;
      [v42 setModuleConfig:v39];

      v164[0] = @"X";
      v164[1] = @"Y";
      v165[0] = &unk_270E988F0;
      v165[1] = &unk_270E988F0;
      v164[2] = @"Width";
      v43 = NSNumber;
      -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v14);
      v45 = [v43 numberWithUnsignedInt:v44];
      v165[2] = v45;
      v164[3] = @"Height";
      v46 = NSNumber;
      id v160 = v14;
      -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v14);
      [v46 numberWithUnsignedInt:HIDWORD(v47)];
      v48 = v18;
      v50 = uint64_t v49 = (uint64_t)v13;
      v165[3] = v50;
      v164[4] = @"FullWidth";
      v51 = NSNumber;
      -[SoftISPInputFrame sensorCropRect](v49);
      v53 = [v51 numberWithUnsignedInt:v52 / -[SoftISPInputFrame quadraBinningFactor](v49)];
      v165[4] = v53;
      v164[5] = @"FullHeight";
      v54 = NSNumber;
      -[SoftISPInputFrame sensorCropRect](v49);
      v55 = (void *)v49;
      v57 = [v54 numberWithUnsignedInt:v56 / -[SoftISPInputFrame quadraBinningFactor](v49)];
      v165[5] = v57;
      v58 = [NSDictionary dictionaryWithObjects:v165 forKeys:v164 count:6];
      v59 = [self->_AWBProcessor awbParams];
      [v59 setValidRectInBufferCoords:v58];

      v18 = v48;
      uint64_t v60 = *MEMORY[0x263F2F1D8];
      v61 = [v48 objectForKeyedSubscript:*MEMORY[0x263F2F1D8]];

      if (v61)
      {
        v62 = [v48 objectForKeyedSubscript:v60];
        v63 = v62;
        id v13 = v55;
        id v15 = v162;
        id v16 = v163;
        id v14 = v160;
        v19 = v161;
        if (v62)
        {
          v64 = [v62 objectForKeyedSubscript:*MEMORY[0x263F2F220]];
          if (v64)
          {
            v65 = [self->_AWBProcessor awbParams];
            [v65 setSecondaryModuleConfig:0];

            v66 = [self->_AWBProcessor awbParams];
            [v66 setSecondaryCameraInfo:0];

            id v16 = v163;
          }
        }
        int v67 = 0;
      }
      else
      {
        int v67 = 0;
        id v13 = v55;
        id v15 = v162;
        id v16 = v163;
        id v14 = v160;
        v19 = v161;
      }
      v39 = v158;
    }
    else
    {
      FigDebugAssert3();
      int v67 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v67 = FigSignalErrorAt();
    v40 = 0;
  }

LABEL_58:
  return v67;
}

- (int)run:(id)a3 lscGainsTex:(id)a4 hrEnabled:(BOOL)a5 auxEnabled:(BOOL)a6 updatedMetadata:(id)a7
{
  BOOL v8 = a6;
  LODWORD(v9) = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v89 = v14;
  [(H13FastAWB *)self resetInvalidateAWBGains];
  *(_OWORD *)&self->_awbGOCGains[6] = v15;
  [(H13FastAWB *)self resetInvalidateAWBGains];
  *(_OWORD *)&self->_awbComboGains[6] = v16;
  [(H13FastAWB *)self resetInvalidateAWBGains];
  *(_OWORD *)&self->_awbGains[6] = v17;
  if (!self->_configured)
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    goto LABEL_31;
  }
  if (!self->_awbMode) {
    goto LABEL_9;
  }
  [v12 width];
  [v12 height];
  [(FigMetalContext *)self->_metal forceCommit];
  v18 = [self->_AWBProcessor awbParams];
  [v18 setImageTex:v12];

  v19 = [self->_AWBProcessor awbParams];
  [v19 setLscGainsTex:v13];

  long long v20 = [self->_AWBProcessor awbParams];
  [v20 setOutputMetadata:v14];

  int v21 = [self->_AWBProcessor process];
  long long v22 = [self->_AWBProcessor awbParams];
  [v22 setImageTex:0];

  int v23 = [self->_AWBProcessor awbParams];
  [v23 setLscGainsTex:0];

  if (v21)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_31;
  }
  BOOL v81 = v8;
  id v24 = v12;
  id v25 = v13;
  uint64_t v26 = [self->_AWBProcessor awbParams];
  [v26 setMetadata:0];

  uint64_t v27 = [self->_AWBProcessor awbParams];
  [v27 setOutputMetadata:0];

  uint64_t v28 = [self->_AWBProcessor awbParams];
  v29 = v28;
  char v30 = v9;
  if (v9)
  {
    unsigned int v31 = [v28 awbComboGainsNormalized];
    v32 = [self->_AWBProcessor awbParams];
    unsigned int v33 = (unint64_t)[v32 awbComboGainsNormalized] >> 32;
    v34 = [self->_AWBProcessor awbParams];
    [v34 awbComboGainsNormalized];
  }
  else
  {
    unsigned int v31 = [v28 awbComboGains];
    v32 = [self->_AWBProcessor awbParams];
    unsigned int v33 = (unint64_t)[v32 awbComboGains] >> 32;
    v34 = [self->_AWBProcessor awbParams];
    [v34 awbComboGains];
  }
  *(void *)&long long v36 = __PAIR64__(v33, v31);
  DWORD2(v36) = v35;
  long long v80 = v36;

  *(_OWORD *)&self->_awbGOCGains[6] = v80;
  v37 = [self->_AWBProcessor awbParams];
  unsigned int v38 = [v37 awbComboGains];
  v39 = [self->_AWBProcessor awbParams];
  unint64_t v40 = (unint64_t)[v39 awbComboGains] >> 32;
  v41 = [self->_AWBProcessor awbParams];
  [v41 awbComboGains];
  *(void *)&long long v42 = __PAIR64__(v40, v38);
  DWORD2(v42) = v43;
  *(_OWORD *)&self->_awbComboGains[6] = v42;

  uint64_t v44 = [self->_AWBProcessor awbParams];
  unsigned int v45 = [v44 awbGains];
  v46 = [self->_AWBProcessor awbParams];
  unint64_t v9 = (unint64_t)[v46 awbGains] >> 32;
  unint64_t v47 = [self->_AWBProcessor awbParams];
  [v47 awbGains];
  *(void *)&long long v48 = __PAIR64__(v9, v45);
  DWORD2(v48) = v49;
  *(_OWORD *)&self->_awbGains[6] = v48;

  id v13 = v25;
  id v12 = v24;
  BOOL v8 = v81;
  LOBYTE(v9) = v30;
  if (!self->_awbMode)
  {
LABEL_9:
    char v88 = 0;
    [(NSDictionary *)self->_metadata cmi_floatValueForKey:*MEMORY[0x263F2F2E0] defaultValue:&v88 found:0.0];
    *(_DWORD *)&self->_awbComboGains[6] = v50;
    if (!v88) {
      goto LABEL_34;
    }
    [(NSDictionary *)self->_metadata cmi_floatValueForKey:*MEMORY[0x263F2F2D8] defaultValue:&v88 found:0.0];
    *(_DWORD *)&self->_awbComboGains[10] = v51;
    if (!v88) {
      goto LABEL_34;
    }
    [(NSDictionary *)self->_metadata cmi_floatValueForKey:*MEMORY[0x263F2F2D0] defaultValue:&v88 found:0.0];
    *(_DWORD *)&self->_awbComboGains[14] = v52;
    if (!v88) {
      goto LABEL_34;
    }
    [(NSDictionary *)self->_metadata cmi_floatValueForKey:*MEMORY[0x263F2F308] defaultValue:&v88 found:0.0];
    *(_DWORD *)&self->_awbGains[6] = v53;
    if (!v88) {
      goto LABEL_34;
    }
    [(NSDictionary *)self->_metadata cmi_floatValueForKey:*MEMORY[0x263F2F300] defaultValue:&v88 found:0.0];
    *(_DWORD *)&self->_awbGains[10] = v54;
    if (!v88) {
      goto LABEL_34;
    }
    [(NSDictionary *)self->_metadata cmi_floatValueForKey:*MEMORY[0x263F2F2C8] defaultValue:&v88 found:0.0];
    *(_DWORD *)&self->_awbGains[14] = v55;
    if (!v88) {
      goto LABEL_34;
    }
    int32x4_t v56 = *(int32x4_t *)&self->_awbComboGains[6];
    if ((v9 & 1) != 0 || v8)
    {
      unsigned __int32 v57 = *(void *)&self->_awbComboGains[14];
      int32x4_t v58 = vshlq_n_s32(v56, 0xCuLL);
      if (v56.i32[2] <= (unsigned __int32)v56.i32[0]) {
        unsigned __int32 v57 = *(_OWORD *)&self->_awbComboGains[6];
      }
      if (v56.i32[1] > v57) {
        unsigned __int32 v57 = HIDWORD(*(void *)&self->_awbComboGains[6]);
      }
      int32x4_t v56 = vaddq_s32(vdupq_n_s32(v57 >> 1), v58);
      v56.i32[0] /= v57;
      v56.i32[1] /= v57;
      v56.i32[2] /= v57;
    }
    *(int32x4_t *)&self->_awbGOCGains[6] = v56;
    v59 = [self->_AWBProcessor awbParams];
    uint64_t v60 = [v59 moduleConfig];

    if (!v60
      || ([self->_AWBProcessor awbParams],
          v61 = objc_claimAutoreleasedReturnValue(),
          [v61 cameraInfo],
          v62 = objc_claimAutoreleasedReturnValue(),
          v62,
          v61,
          !v62))
    {
LABEL_34:
      FigDebugAssert3();
      int v21 = FigSignalErrorAt();
      goto LABEL_30;
    }
    SEL v63 = NSSelectorFromString(&cfstr_Getinternalawb.isa);
    SEL v64 = NSSelectorFromString(&cfstr_Getinternalawb_0.isa);
    if (objc_opt_respondsToSelector())
    {
      LODWORD(v83) = 0;
      v65 = [self->_AWBProcessor awbParams];
      id v87 = [v65 moduleConfig];

      v66 = [self->_AWBProcessor awbParams];
      id v86 = [v66 cameraInfo];

      int v67 = [self->_AWBProcessor awbParams];
      id v85 = [v67 validRectInBufferCoords];

      v68 = (void *)MEMORY[0x263EFF958];
      v69 = [MEMORY[0x263F30658] methodSignatureForSelector:v63];
      uint64_t v70 = [v68 invocationWithMethodSignature:v69];

      [v70 setSelector:v63];
      [v70 setTarget:objc_opt_class()];
      [v70 setArgument:&v87 atIndex:2];
      [v70 setArgument:&v86 atIndex:3];
      [v70 setArgument:&v89 atIndex:4];
      [v70 setArgument:&v85 atIndex:5];
      [v70 invoke];
      [v70 getReturnValue:&v83];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_29:
        int v21 = 0;
LABEL_30:
        id v14 = v89;
        goto LABEL_31;
      }
      int v84 = 0;
      uint64_t v71 = [self->_AWBProcessor awbParams];
      id v87 = [v71 moduleConfig];

      v72 = [self->_AWBProcessor awbParams];
      id v86 = [v72 cameraInfo];

      uint64_t v73 = [self->_AWBProcessor awbParams];
      id v85 = [v73 validRectInBufferCoords];

      v74 = [self->_AWBProcessor awbParams];
      id v83 = [v74 secondaryModuleConfig];

      v75 = [self->_AWBProcessor awbParams];
      id v82 = [v75 secondaryCameraInfo];

      v76 = (void *)MEMORY[0x263EFF958];
      v77 = [MEMORY[0x263F30658] methodSignatureForSelector:v64];
      v78 = [v76 invocationWithMethodSignature:v77];

      [v78 setSelector:v64];
      [v78 setTarget:objc_opt_class()];
      [v78 setArgument:&v87 atIndex:2];
      [v78 setArgument:&v86 atIndex:3];
      [v78 setArgument:&v89 atIndex:4];
      [v78 setArgument:&v85 atIndex:5];
      [v78 setArgument:&v83 atIndex:6];
      [v78 setArgument:&v82 atIndex:7];
      [v78 invoke];
      [v78 getReturnValue:&v84];
    }
    goto LABEL_29;
  }
  int v21 = 0;
LABEL_31:

  return v21;
}

- (__n128)readAWBGOCGains
{
  return a1[3];
}

- (__n128)readAWBComboGains
{
  return a1[4];
}

- (__n128)readAWBGains
{
  return a1[5];
}

- (int)compareAWBComboGains:(H13FastAWB *)self
{
  uint32x4_t v3 = (uint32x4_t)vceqq_s32(*(int32x4_t *)&self->_awbComboGains[6], v2);
  v3.i32[3] = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) == 0)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awbBundle, 0);
  objc_storeStrong((id *)&self->_AWBProcessor, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end