@interface DeepFusionProcessor
- (BOOL)isIntermediateVersionCompatible;
- (DeepFusionProcessor)init;
- (DeepFusionProcessor)initWithContext:(id)a3;
- (IBPDeepFusionOutput)output;
- (IBPDeepFusionProcessorDelegate)delegate;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSString)description;
- (int)_commonInitWithContext:(id)a3;
- (int)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 type:(int)a5;
- (int)addInferenceResults:(id)a3 inferenceInputType:(int)a4;
- (int)applyOverrides;
- (int)finishProcessing;
- (int)getTuning:(id)a3;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)processingMode;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (int)setupWithOptions:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setProcessingMode:(int)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation DeepFusionProcessor

- (int)prewarm
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (DeepFusionProcessor)init
{
  v15.receiver = self;
  v15.super_class = (Class)DeepFusionProcessor;
  v2 = [(DeepFusionProcessor *)&v15 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F086E0];
    uint64_t v4 = objc_opt_class();
    v7 = objc_msgSend_bundleForClass_(v3, v5, v4, v6);
    id v8 = objc_alloc(MEMORY[0x263F2EE30]);
    inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v8, v9, (uint64_t)v7, 0);
    v2->_isShaderHarvesting = 1;
    if (objc_msgSend__commonInitWithContext_(v2, v11, (uint64_t)inited, v12))
    {
      FigDebugAssert3();
      v13 = 0;
    }
    else
    {
      v13 = v2;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (DeepFusionProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DeepFusionProcessor;
  v5 = [(DeepFusionProcessor *)&v11 init];
  id v8 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_7:
    v9 = 0;
    goto LABEL_4;
  }
  if (objc_msgSend__commonInitWithContext_(v5, v6, (uint64_t)v4, v7))
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  v9 = v8;
LABEL_4:

  return v9;
}

- (int)_commonInitWithContext:(id)a3
{
  id v5 = a3;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  objc_storeStrong((id *)&self->_metal, a3);
  if (!self->_metal) {
    goto LABEL_20;
  }
  self->_networkVersion = objc_msgSend_networkVersion(DeepFusionCommon, v6, v7, v8);
  unsigned int v12 = FigCapturePlatformSupportsUniversalLossyCompression() == 0;
  self->_allocatorForceSize = 0;
  self->_allocatorWireMemory = 0;
  *(int8x8_t *)&self->_compressionLevel = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v12), 0x1FuLL)), (int8x8_t)0x1FFFFFFFFLL, (int8x8_t)0x200000001);
  if (!self->_isShaderHarvesting)
  {
    v13 = objc_msgSend_allocator(self->_metal, v9, v10, v11);

    if (v13) {
      goto LABEL_21;
    }
    id v14 = objc_alloc(MEMORY[0x263F2EE10]);
    v18 = objc_msgSend_device(self->_metal, v15, v16, v17);
    v20 = objc_msgSend_initWithDevice_allocatorType_(v14, v19, (uint64_t)v18, self->_allocatorType);
    objc_msgSend_setAllocator_(self->_metal, v21, (uint64_t)v20, v22);

    v26 = objc_msgSend_allocator(self->_metal, v23, v24, v25);

    if (!v26) {
      goto LABEL_20;
    }
  }
  self->_allocatorSetupComplete = 0;
  v27 = [ToneMappingStage alloc];
  v29 = (ToneMappingStage *)objc_msgSend_initWithContext_mtlSuballocatorID_(v27, v28, (uint64_t)self->_metal, 0);
  toneMappingStage = self->_toneMappingStage;
  self->_toneMappingStage = v29;

  if (!self->_toneMappingStage) {
    goto LABEL_20;
  }
  v31 = [SemanticStylesStage alloc];
  v34 = (SemanticStylesStage *)objc_msgSend_initWithMetalContext_(v31, v32, (uint64_t)self->_metal, v33);
  semanticStylesStage = self->_semanticStylesStage;
  self->_semanticStylesStage = v34;

  if (!self->_semanticStylesStage) {
    goto LABEL_20;
  }
  v36 = [TextureUtils alloc];
  v39 = (TextureUtils *)objc_msgSend_initWithMetalContext_(v36, v37, (uint64_t)self->_metal, v38);
  textureUtils = self->_textureUtils;
  self->_textureUtils = v39;

  if (!self->_textureUtils) {
    goto LABEL_20;
  }
  v41 = [RegDense alloc];
  v43 = (RegDense *)objc_msgSend_initWithMetalContext_bicubicWarping_(v41, v42, (uint64_t)self->_metal, 1);
  regDense = self->_regDense;
  self->_regDense = v43;

  if (!self->_regDense) {
    goto LABEL_20;
  }
  v45 = [DeepFusionPreEspressoStage alloc];
  v47 = (DeepFusionPreEspressoStage *)objc_msgSend_initWithContext_networkVersion_(v45, v46, (uint64_t)v5, self->_networkVersion);
  preEspressoStage = self->_preEspressoStage;
  self->_preEspressoStage = v47;

  if (!self->_preEspressoStage) {
    goto LABEL_20;
  }
  v49 = [TiledFusionStage alloc];
  v51 = (TiledFusionStage *)objc_msgSend_initWithContext_preEspressoStage_networkVersion_(v49, v50, (uint64_t)v5, (uint64_t)self->_preEspressoStage, self->_networkVersion);
  tiledFusionStage = self->_tiledFusionStage;
  self->_tiledFusionStage = v51;

  v55 = self->_tiledFusionStage;
  if (!v55) {
    goto LABEL_20;
  }
  objc_msgSend_setIsHarvesting_(v55, v53, self->_isShaderHarvesting, v54);
  objc_msgSend_compileShaders(self->_tiledFusionStage, v56, v57, v58);
  v93[2] = 65792;
  v93[0] = 1;
  v93[1] = 16777217;
  v59 = [AMBNRStage alloc];
  v61 = (AMBNRStage *)objc_msgSend_initWithContext_denoisingOptions_(v59, v60, (uint64_t)self->_metal, (uint64_t)v93);
  ambnrStage = self->_ambnrStage;
  self->_ambnrStage = v61;

  v65 = self->_ambnrStage;
  if (!v65) {
    goto LABEL_20;
  }
  objc_msgSend_setInputPyramidGenerationEnabled_(v65, v63, 0, v64);
  objc_msgSend_setUpsampleOffsetEnabled_(self->_ambnrStage, v66, 0, v67);
  v68 = [OutliersRemovalStage alloc];
  v71 = (OutliersRemovalStage *)objc_msgSend_initWithMetalContext_(v68, v69, (uint64_t)self->_metal, v70);
  outliersRemovalStage = self->_outliersRemovalStage;
  self->_outliersRemovalStage = v71;

  if (!self->_outliersRemovalStage) {
    goto LABEL_20;
  }
  v73 = [SyntheticLongStage alloc];
  v76 = (SyntheticLongStage *)objc_msgSend_initWithMetalContext_(v73, v74, (uint64_t)self->_metal, v75);
  syntheticLongStage = self->_syntheticLongStage;
  self->_syntheticLongStage = v76;

  if (!self->_syntheticLongStage) {
    goto LABEL_20;
  }
  v78 = [ColorCubeCorrectionStage alloc];
  v81 = (ColorCubeCorrectionStage *)objc_msgSend_init_(v78, v79, (uint64_t)v5, v80);
  ColorCubeCorrectionStage = self->_ColorCubeCorrectionStage;
  self->_ColorCubeCorrectionStage = v81;

  if (!self->_ColorCubeCorrectionStage
    || (*(void *)&self->_applyColorCubeFixOverride = 0x200000002,
        objc_msgSend_computePipelineStateFor_constants_(v5, v83, @"copyTexture", 0),
        v84 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        copyTextureKernel = self->_copyTextureKernel,
        self->_copyTextureKernel = v84,
        copyTextureKernel,
        !self->_copyTextureKernel))
  {
LABEL_20:
    FigDebugAssert3();
LABEL_21:
    int v91 = FigSignalErrorAt();
    goto LABEL_18;
  }
  v86 = [ColorConvertStage alloc];
  v89 = (ColorConvertStage *)objc_msgSend_initWithMetalContext_(v86, v87, (uint64_t)v5, v88);
  colorConvertStage = self->_colorConvertStage;
  self->_colorConvertStage = v89;

  if (!self->_colorConvertStage) {
    goto LABEL_21;
  }
  int v91 = 0;
LABEL_18:

  return v91;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_prewarmShaders_(ToneMappingStage, v5, (uint64_t)self->_metal, v6)
    || objc_msgSend_prewarmShaders_(SubjectRelightingStage, v7, (uint64_t)self->_metal, v8)
    || objc_msgSend_prewarmShaders_(SemanticStylesStage, v9, (uint64_t)self->_metal, v10)
    || objc_msgSend_prewarmShaders_(RegDense, v11, (uint64_t)self->_metal, v12)
    || objc_msgSend_prewarmShaders_(SyntheticLongStage, v13, (uint64_t)self->_metal, v14)
    || objc_msgSend_prewarmShaders_(PyramidStage_NRF, v15, (uint64_t)self->_metal, v16)
    || objc_msgSend_prewarmShaders_tuningParameters_plistEntryName_(DenoiseRemixStage, v17, (uint64_t)self->_metal, (uint64_t)v4, @"DeepFusionParameters"))
  {
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

- (int)applyOverrides
{
  return 0;
}

- (int)setupWithOptions:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"TuningParameters", v6);
  int Tuning = objc_msgSend_getTuning_(self, v8, (uint64_t)v7, v9);

  if (Tuning) {
    goto LABEL_21;
  }
  if (objc_msgSend_applyOverrides(self, v11, v12, v13)) {
    goto LABEL_21;
  }
  p_lscGainsPlist = &self->_lscGainsPlist;
  objc_super v15 = [LSCGainsPlist alloc];
  int v18 = objc_msgSend_objectForKeyedSubscript_(v4, v16, *MEMORY[0x263F2F1E8], v17);
  v20 = (LSCGainsPlist *)objc_msgSend_initWithDictionary_metal_(v15, v19, (uint64_t)v18, (uint64_t)self->_metal);
  lscGainsPlist = self->_lscGainsPlist;
  self->_lscGainsPlist = v20;

  if (!self->_lscGainsPlist)
  {
LABEL_21:
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();
    v59 = 0;
  }
  else
  {
    id v65 = v4;
    uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v22, v23, v24);
    objc_msgSend_setStfTuningParameters_(self->_toneMappingStage, v26, (uint64_t)v25, v27);

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obj = self->_tuningParams;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v68, (uint64_t)v74, 16);
    if (v29)
    {
      uint64_t v32 = v29;
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      uint64_t v35 = 0;
      uint64_t v67 = *(void *)v69;
      do
      {
        uint64_t v36 = 0;
        v37 = v33;
        do
        {
          if (*(void *)v69 != v67) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(self->_tuningParams, v30, *(void *)(*((void *)&v68 + 1) + 8 * v36), v31);

          uint64_t v38 = v33[1];
          v34 |= *(unsigned __int8 *)(v38 + 79);
          if (*(void *)(v38 + 80))
          {
            v72 = @"DeepFusionParameters";
            uint64_t v73 = *(void *)(v33[1] + 80);
            v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v73, (uint64_t)&v72, 1);
            objc_msgSend_stfTuningParameters(p_lscGainsPlist[17], v40, v41, v42);
            v43 = self;
            v45 = v44 = p_lscGainsPlist;
            v48 = objc_msgSend_numberWithInt_(NSNumber, v46, v35, v47);
            objc_msgSend_setObject_forKey_(v45, v49, (uint64_t)v39, (uint64_t)v48);

            p_lscGainsPlist = v44;
            self = v43;
            uint64_t v35 = (v35 + 1);
          }
          ++v36;
          v37 = v33;
        }
        while (v32 != v36);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v68, (uint64_t)v74, 16);
      }
      while (v32);
    }
    else
    {
      uint64_t v33 = 0;
      BOOL v34 = 0;
    }

    objc_msgSend_setEnableSTF_(p_lscGainsPlist[17], v50, v34, v51);
    v55 = objc_msgSend_allValues(self->_tuningParams, v52, v53, v54);
    v59 = objc_msgSend_firstObject(v55, v56, v57, v58);

    if (v59)
    {
      *((_DWORD *)p_lscGainsPlist + 38) = *(_DWORD *)(v59[1] + 72);
      uint64_t v62 = *(unsigned int *)(v59[1] + 124);
    }
    else
    {
      uint64_t v62 = 0;
    }
    id v4 = v65;
    int v63 = objc_msgSend_setMaskedSkyCubeVersion_(p_lscGainsPlist[69], v60, v62, v61);
    if (v63) {
      FigDebugAssert3();
    }
  }

  return v63;
}

- (int)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 type:(int)a5
{
  p_EVM_EV0_motionScore = &self->_EVM_EV0_motionScore;
  id v9 = a4;
  if (CVPixelBufferIsPlanar(a3))
  {
    int v11 = objc_msgSend_fillPaddedAreaInFrame_useSeparateCommandQueue_(*((void **)p_EVM_EV0_motionScore + 27), v10, (uint64_t)a3, 0);
    if (v11)
    {
      int v90 = v11;
      FigDebugAssert3();
      goto LABEL_67;
    }
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v14 = 0;
  uint64_t v15 = 588;
  uint64_t v16 = 589;
  if (PixelFormatType <= 1278226487)
  {
    if (PixelFormatType <= 762865199)
    {
      if (PixelFormatType != 642527288)
      {
        int v17 = 645424688;
        goto LABEL_12;
      }
      goto LABEL_18;
    }
    if (PixelFormatType != 762865200)
    {
      int v17 = 796419632;
      goto LABEL_12;
    }
    int v18 = 0;
LABEL_21:
    if (!v9) {
      goto LABEL_46;
    }
    goto LABEL_22;
  }
  if (PixelFormatType > 2019963439)
  {
    int v18 = 0;
    if (PixelFormatType != 2088265264)
    {
      if (PixelFormatType != 2019963440) {
        goto LABEL_68;
      }
      int v14 = 0;
      int v18 = 0;
      uint64_t v15 = 576;
      uint64_t v16 = 578;
      if (!v9) {
        goto LABEL_46;
      }
LABEL_22:
      int v105 = v18;
      uint64_t v106 = v16;
      int v107 = v14;
      unint64_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      unint64_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      objc_msgSend_objectForKeyedSubscript_(v9, v21, @"ReferenceMetadata", v22);
      v26 = uint64_t v23 = v9;
      if (v26)
      {
        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"MotionScores", v25);
        objc_msgSend_floatValue(v27, v28, v29, v30);
        *(_DWORD *)p_EVM_EV0_motionScore = v31;

        objc_storeStrong((id *)&self->_ev0MetadataDict, v26);
        int v32 = sub_262F98A38(self->_ev0MetadataDict, (uint64_t)&self->_ev0Metadata, WidthOfPlane, HeightOfPlane, 1);
        if (v32)
        {
          int v90 = v32;
          FigDebugAssert3();

          id v9 = v23;
          goto LABEL_67;
        }
      }
      v108 = v26;
      objc_msgSend_objectForKeyedSubscript_(v23, v24, @"SifrMetadata", v25);
      v35 = id v9 = v23;
      if (v35
        && (objc_storeStrong((id *)&self->_sifrMetadataDict, v35),
            (int v36 = sub_262F98A38(self->_sifrMetadataDict, (uint64_t)&self->_sifrMetadata, WidthOfPlane, HeightOfPlane, 1)) != 0))
      {
        int v90 = v36;
        FigDebugAssert3();
      }
      else
      {
        int v104 = a5;
        v39 = objc_msgSend_objectForKeyedSubscript_(v9, v33, @"LongMetadata", v34);
        if (!v39
          || (objc_storeStrong((id *)&self->_longMetadataDict, v39),
              (int v40 = sub_262F98A38(self->_longMetadataDict, (uint64_t)&self->_longMetadata, WidthOfPlane, HeightOfPlane, 1)) == 0))
        {
          v43 = objc_msgSend_objectForKeyedSubscript_(v9, v37, @"SyntheticLong", v38);
          if (v43)
          {
            objc_storeStrong((id *)p_EVM_EV0_motionScore + 1, v43);
            v46 = objc_msgSend_objectForKeyedSubscript_(*((void **)p_EVM_EV0_motionScore + 1), v44, @"syntheticLongPedestal", v45);
            objc_msgSend_floatValue(v46, v47, v48, v49);
            *((_DWORD *)p_EVM_EV0_motionScore + 158) = v50;

            float v51 = p_EVM_EV0_motionScore[158];
            if (v51 < 0.0 || v51 > 1.0) {
              p_EVM_EV0_motionScore[158] = 0.0;
            }
          }
          v103 = v39;
          v52 = objc_msgSend_objectForKeyedSubscript_(v9, v41, @"SyntheticReference", v42);
          v55 = v52;
          if (v52)
          {
            v56 = objc_msgSend_objectForKeyedSubscript_(v52, v53, @"Mode", v54);
            *((_DWORD *)p_EVM_EV0_motionScore + 1) = objc_msgSend_intValue(v56, v57, v58, v59);

            uint64_t v62 = objc_msgSend_objectForKeyedSubscript_(v55, v60, @"syntheticReferencePedestal", v61);
            objc_msgSend_floatValue(v62, v63, v64, v65);
            *((_DWORD *)p_EVM_EV0_motionScore + 157) = v66;

            float v67 = p_EVM_EV0_motionScore[157];
            if (v67 < 0.0 || v67 > 1.0) {
              p_EVM_EV0_motionScore[157] = 0.0;
            }
          }
          long long v68 = v35;
          long long v71 = objc_msgSend_objectForKeyedSubscript_(v9, v53, *MEMORY[0x263F2F130], v54);
          if (v71) {
            objc_storeStrong((id *)&self->_nrfStatus, v71);
          }
          v72 = objc_msgSend_objectForKeyedSubscript_(v9, v69, *MEMORY[0x263F2F118], v70);

          if (v72) {
            objc_storeStrong((id *)&self->_nrfInputBracketCount, v72);
          }
          uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v9, v73, *MEMORY[0x263F2F120], v74);

          if (v75) {
            objc_storeStrong((id *)&self->_nrfRegisteredBracketCount, v75);
          }
          uint64_t v16 = v106;
          if (!self->_sensorID)
          {
            ev0MetadataDict = self->_ev0MetadataDict;
            if (ev0MetadataDict)
            {
              objc_msgSend_objectForKeyedSubscript_(ev0MetadataDict, v76, *MEMORY[0x263F2F668], v77);
              v79 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              sensorID = self->_sensorID;
              self->_sensorID = v79;

              objc_msgSend_objectForKeyedSubscript_(self->_ev0MetadataDict, v81, *MEMORY[0x263F2F5C8], v82);
              v83 = (NSString *)objc_claimAutoreleasedReturnValue();
              portType = self->_portType;
              self->_portType = v83;
            }
          }

          a5 = v104;
          int v18 = v105;
          int v14 = v107;
          goto LABEL_46;
        }
        int v90 = v40;
        FigDebugAssert3();
      }
      goto LABEL_67;
    }
    goto LABEL_21;
  }
  if (PixelFormatType == 1278226488)
  {
LABEL_18:
    uint64_t v16 = 0;
    int v18 = 0;
    int v14 = 1;
    uint64_t v15 = 10;
    if (!v9) {
      goto LABEL_46;
    }
    goto LABEL_22;
  }
  int v17 = 1885745712;
LABEL_12:
  int v18 = 0;
  if (PixelFormatType == v17) {
    goto LABEL_21;
  }
LABEL_68:
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  int v14 = 1;
  int v18 = 1;
  if (v9) {
    goto LABEL_22;
  }
LABEL_46:
  switch(a5)
  {
    case 0:
      if (!v18 && !v14)
      {
        *((void *)p_EVM_EV0_motionScore + 13) = a3;
        uint64_t v85 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v13, (uint64_t)a3, v15, 7, 0);
        v86 = (void *)*((void *)p_EVM_EV0_motionScore + 14);
        *((void *)p_EVM_EV0_motionScore + 14) = v85;

        uint64_t v88 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v87, (uint64_t)a3, v16, 7, 1);
        v89 = (void *)*((void *)p_EVM_EV0_motionScore + 15);
        *((void *)p_EVM_EV0_motionScore + 15) = v88;

        if (*((void *)p_EVM_EV0_motionScore + 14))
        {
          if (*((void *)p_EVM_EV0_motionScore + 15)) {
            goto LABEL_66;
          }
        }
      }
      goto LABEL_75;
    case 1:
      if (v18) {
        goto LABEL_75;
      }
      uint64_t v91 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v13, (uint64_t)a3, v15, 7, 0);
      v92 = (void *)*((void *)p_EVM_EV0_motionScore + 19);
      *((void *)p_EVM_EV0_motionScore + 19) = v91;

      if (!*((void *)p_EVM_EV0_motionScore + 19)) {
        goto LABEL_75;
      }
      goto LABEL_66;
    case 2:
      if (v18) {
        goto LABEL_75;
      }
      if (v14) {
        goto LABEL_75;
      }
      *((void *)p_EVM_EV0_motionScore + 16) = a3;
      uint64_t v93 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v13, (uint64_t)a3, v15, 7, 0);
      v94 = (void *)*((void *)p_EVM_EV0_motionScore + 17);
      *((void *)p_EVM_EV0_motionScore + 17) = v93;

      uint64_t v96 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v95, (uint64_t)a3, v16, 7, 1);
      v97 = (void *)*((void *)p_EVM_EV0_motionScore + 18);
      *((void *)p_EVM_EV0_motionScore + 18) = v96;

      if (!*((void *)p_EVM_EV0_motionScore + 17) || !*((void *)p_EVM_EV0_motionScore + 18)) {
        goto LABEL_75;
      }
      goto LABEL_66;
    case 3:
      if (v18) {
        goto LABEL_75;
      }
      uint64_t v98 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v13, (uint64_t)a3, v15, 7, 0);
      v99 = (void *)*((void *)p_EVM_EV0_motionScore + 20);
      *((void *)p_EVM_EV0_motionScore + 20) = v98;

      if (!*((void *)p_EVM_EV0_motionScore + 20)) {
        goto LABEL_75;
      }
      goto LABEL_66;
    case 4:
      if (v18
        || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v13, (uint64_t)a3, v15, 7, 0), uint64_t v100 = objc_claimAutoreleasedReturnValue(), v101 = (void *)*((void *)p_EVM_EV0_motionScore + 21), *((void *)p_EVM_EV0_motionScore + 21) = v100, v101, !*((void *)p_EVM_EV0_motionScore + 21)))
      {
LABEL_75:
        FigDebugAssert3();
LABEL_52:
        int v90 = FigSignalErrorAt();
      }
      else
      {
LABEL_66:
        int v90 = 0;
      }
      break;
    default:
      goto LABEL_52;
  }
LABEL_67:

  return v90;
}

- (int)addInferenceResults:(id)a3 inferenceInputType:(int)a4
{
  return 0;
}

- (int)finishProcessing
{
  objc_msgSend_waitForIdle(self->_metal, a2, v2, v3);
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -1;
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  p_originalWidth = &self->_originalWidth;
  id v6 = a4;
  unint64_t *p_originalWidth = (int)objc_msgSend_width(v6, v7, v8, v9);
  int v13 = objc_msgSend_height(v6, v10, v11, v12);

  unint64_t v17 = (*p_originalWidth + 15) & 0xFFFFFFFFFFFFFFF0;
  p_originalWidth[1] = v13;
  p_originalWidth[2] = v17;
  p_originalWidth[3] = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (!self->_allocatorSetupComplete)
  {
    int compressionLevel = self->_compressionLevel;
    int allocatorType = self->_allocatorType;
    if (allocatorType == 1 && (compressionLevel & 0x80000000) == 0) {
      goto LABEL_32;
    }
    unint64_t allocatorForceSize = self->_allocatorForceSize;
    v21 = objc_opt_new();
    uint64_t v24 = v21;
    if (!v21) {
      goto LABEL_28;
    }
    uint64_t v25 = 90177536;
    if (allocatorType == 2) {
      uint64_t v25 = 93323264;
    }
    if (compressionLevel > 0) {
      uint64_t v25 = 76546048;
    }
    if (!compressionLevel) {
      uint64_t v25 = 96122961;
    }
    if (allocatorForceSize) {
      objc_msgSend_setMemSize_(v21, v22, allocatorForceSize, v23);
    }
    else {
      objc_msgSend_setMemSize_(v21, v22, v25, v23);
    }
    objc_msgSend_setWireMemory_(v24, v26, self->_allocatorWireMemory, v27);
    objc_msgSend_setCompressionLevel_(v24, v28, self->_compressionLevel, v29);
    objc_msgSend_setLabel_(v24, v30, @"FigMetalAllocator_DeepFusion", v31);
    uint64_t v35 = objc_msgSend_allocator(self->_metal, v32, v33, v34);
    int v38 = objc_msgSend_setupWithDescriptor_(v35, v36, (uint64_t)v24, v37);

    if (v38)
    {
      FigDebugAssert3();
LABEL_30:
      FigSignalErrorAt();
      goto LABEL_31;
    }

    self->_allocatorSetupComplete = 1;
  }
  if (objc_msgSend_buffer((void *)p_originalWidth[76], v14, v15, v16))
  {
    uint64_t v42 = objc_msgSend_device(self->_metal, v39, v40, v41);
    v46 = (__CVBuffer *)objc_msgSend_buffer((void *)p_originalWidth[76], v43, v44, v45);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v46);
    uint64_t v24 = objc_msgSend_newBufferWithIOSurface_(v42, v48, (uint64_t)IOSurface, v49);

    if (v24)
    {
      uint64_t v53 = objc_msgSend_allocator(self->_metal, v50, v51, v52);
      int v38 = objc_msgSend_addExternalMetalBuffer_atSubAllocatorID_(v53, v54, (uint64_t)v24, 0);

      if (!v38)
      {

        goto LABEL_20;
      }
      goto LABEL_30;
    }
LABEL_28:
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
LABEL_31:

    return v38;
  }
LABEL_20:
  if (p_originalWidth[14]) {
    goto LABEL_23;
  }
  v55 = [ToneMappingCurves alloc];
  uint64_t v58 = objc_msgSend_initWithWithContext_(v55, v56, (uint64_t)self->_metal, v57);
  uint64_t v59 = (void *)p_originalWidth[14];
  p_originalWidth[14] = v58;

  if (p_originalWidth[14])
  {
    uint64_t v63 = objc_msgSend_enableSTF((void *)p_originalWidth[15], v60, v61, v62);
    objc_msgSend_setEnableSTF_((void *)p_originalWidth[14], v64, v63, v65);
LABEL_23:
    int ResourcesForWidth_height_srlVersion = objc_msgSend_allocateResourcesForWidth_height_srlVersion_((void *)p_originalWidth[15], v39, p_originalWidth[2], p_originalWidth[3], *((unsigned int *)p_originalWidth + 34));
    if (ResourcesForWidth_height_srlVersion)
    {
      int v38 = ResourcesForWidth_height_srlVersion;
    }
    else
    {
      int v38 = objc_msgSend_initializePyramids((void *)p_originalWidth[20], v67, v68, v69);
      if (!v38) {
        return v38;
      }
    }
    FigDebugAssert3();
    return v38;
  }
LABEL_32:
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (BOOL)isIntermediateVersionCompatible
{
  uint64_t v3 = objc_msgSend_objectForKeyedSubscript_(self->_nrfSyntheticLongIntermediateMetadataDict, a2, @"IntermediateVersion", v2);
  int v7 = objc_msgSend_intValue(v3, v4, v5, v6);

  return v7 == objc_msgSend_intermediateVersion(DeepFusionCommon, v8, v9, v10);
}

- (int)process
{
  uint64_t v890 = *MEMORY[0x263EF8340];
  id v879 = 0;
  id v880 = 0;
  id v877 = 0;
  id v878 = 0;
  id v876 = 0;
  memset(v889, 0, 32);
  id v872 = 0;
  id v873 = 0;
  uint64_t v3 = objc_msgSend_objectForKeyedSubscript_(self->_tuningParams, a2, (uint64_t)self->_sensorID, v2);
  uint64_t v863 = v3;
  if (!v3 || !*(void *)(v3 + 48))
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    id v859 = 0;
    id v851 = 0;
    id v856 = 0;
    v853 = 0;
LABEL_186:
    v854 = 0;
LABEL_188:
    v240 = 0;
    v241 = 0;
    v860 = 0;
LABEL_191:
    v864 = 0;
    goto LABEL_170;
  }
  p_EVM_EV0_motionScore = &self->_EVM_EV0_motionScore;
  v854 = objc_msgSend_getTextureForPortType_(self->_lscGainsPlist, v4, (uint64_t)self->_portType, v5);
  v853 = objc_msgSend_getTextureMaxValueForPortType_(self->_lscGainsPlist, v7, (uint64_t)self->_portType, v8);
  if (!v854)
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    id v859 = 0;
    id v851 = 0;
    id v856 = 0;
    goto LABEL_186;
  }
  v860 = (id *)objc_opt_new();
  if (!v860)
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    id v859 = 0;
    id v851 = 0;
    id v856 = 0;
    goto LABEL_188;
  }
  if (!self->_referenceLumaTex) {
    goto LABEL_189;
  }
  if (!self->_referenceChromaTex) {
    goto LABEL_189;
  }
  if (!self->_ev0MetadataDict) {
    goto LABEL_189;
  }
  if (!self->_longLumaTex) {
    goto LABEL_189;
  }
  if (!self->_longChromaTex) {
    goto LABEL_189;
  }
  if (!self->_referenceFusionMapTex) {
    goto LABEL_189;
  }
  if (!self->_longFusionMapTex) {
    goto LABEL_189;
  }
  nrfSyntheticLongIntermediateMetadataDict = self->_nrfSyntheticLongIntermediateMetadataDict;
  if (!nrfSyntheticLongIntermediateMetadataDict) {
    goto LABEL_189;
  }
  sifrMetadataDict = self->_sifrMetadataDict;
  p_sifrMetadata = &self->_sifrMetadata;
  p_ev0Metadata = &self->_ev0Metadata;
  if (!sifrMetadataDict) {
    p_sifrMetadata = &self->_ev0Metadata;
  }
  v861 = p_sifrMetadata;
  BOOL v842 = sifrMetadataDict && self->_sifrMetadata.isEVMFrame;
  int v14 = objc_msgSend_objectForKeyedSubscript_(nrfSyntheticLongIntermediateMetadataDict, v9, @"SyntheticLongUsedRealLong", v10);
  int v855 = objc_msgSend_BOOLValue(v14, v15, v16, v17);

  v20 = objc_msgSend_objectForKeyedSubscript_(self->_nrfSyntheticLongIntermediateMetadataDict, v18, @"ev0count", v19);
  int v852 = objc_msgSend_intValue(v20, v21, v22, v23);

  if (v852 <= 0 || (objc_msgSend_isIntermediateVersionCompatible(self, v24, v25, v26) & 1) == 0) {
    goto LABEL_189;
  }
  if (objc_msgSend_skinMask(self->_inferenceResults, v27, v28, v29))
  {
    metal = self->_metal;
    uint64_t v34 = objc_msgSend_skinMask(self->_inferenceResults, v30, v31, v32);
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metal, v35, v34, 10, 7, 0);
    id v856 = (id)objc_claimAutoreleasedReturnValue();
    if (!v856)
    {
LABEL_189:
      FigDebugAssert3();
      int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
      id v859 = 0;
      id v851 = 0;
      id v856 = 0;
      goto LABEL_190;
    }
  }
  else
  {
    id v856 = 0;
  }
  if (objc_msgSend_personMask(self->_inferenceResults, v30, v31, v32))
  {
    v39 = self->_metal;
    uint64_t v40 = objc_msgSend_personMask(self->_inferenceResults, v36, v37, v38);
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v39, v41, v40, 25, 7, 0);
    id v851 = (id)objc_claimAutoreleasedReturnValue();
    if (!v851)
    {
      FigDebugAssert3();
      int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
      id v859 = 0;
      id v851 = 0;
LABEL_190:
      v240 = 0;
      v241 = 0;
      goto LABEL_191;
    }
  }
  else
  {
    id v851 = 0;
  }
  if (objc_msgSend_skyMask(self->_inferenceResults, v36, v37, v38))
  {
    uint64_t v49 = self->_metal;
    uint64_t v50 = objc_msgSend_skyMask(self->_inferenceResults, v46, v47, v48);
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v49, v51, v50, 10, 7, 0);
    id v859 = (id)objc_claimAutoreleasedReturnValue();
    if (!v859)
    {
      FigDebugAssert3();
      int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
      id v859 = 0;
      goto LABEL_190;
    }
  }
  else
  {
    id v859 = 0;
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v53 = (void *)v889[i];
    v889[i] = 0;
  }
  for (unint64_t j = 0; ; ++j)
  {
    uint64_t v58 = objc_msgSend_lowResPersonInstanceMasks(self->_inferenceResults, v54, v55, v56);
    unint64_t v62 = objc_msgSend_count(v58, v59, v60, v61);

    if (v62 <= j) {
      break;
    }
    int v66 = objc_msgSend_lowResPersonInstanceMasks(self->_inferenceResults, v63, v64, v65);
    uint64_t v69 = objc_msgSend_objectAtIndexedSubscript_(v66, v67, j, v68);

    if (v69)
    {
      uint64_t v71 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v70, (uint64_t)v69, 25, 1, 0);
      v72 = (void *)v889[j];
      v889[j] = v71;

      if (!v71) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v73 = (void *)v889[j];
      v889[j] = 0;
    }
  }
  uint64_t v74 = objc_msgSend_allocator(self->_metal, v63, v64, v65);
  v864 = objc_msgSend_newTextureDescriptor(v74, v75, v76, v77);

  if (!v864)
  {
LABEL_38:
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    goto LABEL_190;
  }
  if (*(unsigned char *)(*(void *)(v863 + 8) + 78) && objc_msgSend_skyMask(self->_inferenceResults, v78, v79, v80))
  {
    v81 = (__CVBuffer *)objc_msgSend_buffer(self->_output, v78, v79, v80);
    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(v81, 0);
    v86 = (__CVBuffer *)objc_msgSend_buffer(self->_output, v83, v84, v85);
    unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(v86, 0);
    inferenceResults = self->_inferenceResults;
    uint64_t v92 = *(_DWORD *)(*(void *)(*(void *)(v863 + 8) + 24) + 36)
        ? objc_msgSend_skinMask(inferenceResults, v87, v88, v89)
        : objc_msgSend_skyMask(inferenceResults, v87, v88, v89);
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_regularizeLocalToneCurves_mask_tcrParams_imageDims_(self->_toneMappingCurves, v93, (uint64_t)&v861->ltmCurves, v92, *(void *)(*(void *)(v863 + 8) + 24), COERCE_DOUBLE(__PAIR64__(HeightOfPlane, WidthOfPlane)));
    if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams)
    {
      FigDebugAssert3();
      goto LABEL_95;
    }
  }
  if (sifrMetadataDict)
  {
    if (self->_SyntheticReferenceMode != 1)
    {
      uint64_t v94 = *(void *)(v863 + 48);
      if (*p_EVM_EV0_motionScore > *(float *)(v94 + 12))
      {
        if (self->_networkVersion != 2
          || (float exposure_time = self->_ev0Metadata.exposureParams.exposure_time,
              float v95 = *p_EVM_EV0_motionScore,
              (float)(exposure_time * v95) < sub_262FCDA18(*(void *)(v94 + 16), 0.0)))
        {
          *(void *)v881 = 0;
          obunint64_t j = 0;
          unint64_t width = self->_width;
          uint64_t v98 = objc_msgSend_desc(v864, v78, v79, v80);
          objc_msgSend_setWidth_(v98, v99, width, v100);

          unint64_t height = self->_height;
          int v105 = objc_msgSend_desc(v864, v102, v103, v104);
          objc_msgSend_setHeight_(v105, v106, height, v107);

          v111 = objc_msgSend_desc(v864, v108, v109, v110);
          objc_msgSend_setPixelFormat_(v111, v112, 25, v113);

          v117 = objc_msgSend_desc(v864, v114, v115, v116);
          objc_msgSend_setUsage_(v117, v118, 7, v119);

          objc_msgSend_setLabel_(v864, v120, 0, v121);
          v125 = objc_msgSend_allocator(self->_metal, v122, v123, v124);
          *(void *)v881 = objc_msgSend_newTextureWithDescriptor_(v125, v126, (uint64_t)v864, v127);

          if (!*(void *)v881) {
            goto LABEL_229;
          }
          unint64_t v131 = self->_width;
          v132 = objc_msgSend_desc(v864, v128, v129, v130);
          objc_msgSend_setWidth_(v132, v133, v131 >> 1, v134);

          unint64_t v135 = self->_height;
          v139 = objc_msgSend_desc(v864, v136, v137, v138);
          objc_msgSend_setHeight_(v139, v140, v135 >> 1, v141);

          v145 = objc_msgSend_desc(v864, v142, v143, v144);
          objc_msgSend_setPixelFormat_(v145, v146, 65, v147);

          v151 = objc_msgSend_desc(v864, v148, v149, v150);
          objc_msgSend_setUsage_(v151, v152, 7, v153);

          objc_msgSend_setLabel_(v864, v154, 0, v155);
          v159 = objc_msgSend_allocator(self->_metal, v156, v157, v158);
          v162 = objc_msgSend_newTextureWithDescriptor_(v159, v160, (uint64_t)v864, v161);
          id v163 = obj;
          obunint64_t j = v162;

          if (!v162) {
            goto LABEL_229;
          }
          uint64_t v167 = objc_msgSend_width(self->_referenceFusionMapTex, v164, v165, v166);
          v171 = objc_msgSend_desc(v864, v168, v169, v170);
          objc_msgSend_setWidth_(v171, v172, v167, v173);

          uint64_t v177 = objc_msgSend_height(self->_referenceFusionMapTex, v174, v175, v176);
          v181 = objc_msgSend_desc(v864, v178, v179, v180);
          objc_msgSend_setHeight_(v181, v182, v177, v183);

          uint64_t v187 = objc_msgSend_pixelFormat(self->_referenceFusionMapTex, v184, v185, v186);
          v191 = objc_msgSend_desc(v864, v188, v189, v190);
          objc_msgSend_setPixelFormat_(v191, v192, v187, v193);

          v197 = objc_msgSend_desc(v864, v194, v195, v196);
          objc_msgSend_setUsage_(v197, v198, 7, v199);

          objc_msgSend_setLabel_(v864, v200, 0, v201);
          v205 = objc_msgSend_allocator(self->_metal, v202, v203, v204);
          v208 = objc_msgSend_newTextureWithDescriptor_(v205, v206, (uint64_t)v864, v207);
          id v209 = v876;
          id v876 = v208;

          if (!v208)
          {
LABEL_229:
            FigDebugAssert3();
            int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();

            goto LABEL_95;
          }
          v847 = v208;
          float v210 = sub_262F98950((uint64_t)&self->_sifrMetadata.exposureParams, (uint64_t)&self->_ev0Metadata.exposureParams, 1);
          long long v211 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
          v888[0] = *MEMORY[0x263EF89A0];
          v888[1] = v211;
          v888[2] = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
          v857 = (id *)objc_opt_new();
          objc_storeStrong(v857 + 2, self->_referenceLumaTex);
          objc_storeStrong(v857 + 3, self->_referenceChromaTex);
          v212 = (id *)objc_opt_new();
          objc_storeStrong(v212 + 2, self->_longLumaTex);
          objc_storeStrong(v212 + 3, self->_longChromaTex);
          v213 = (id *)objc_opt_new();
          objc_storeStrong(v213 + 2, *(id *)v881);
          objc_storeStrong(v213 + 3, obj);
          regDense = self->_regDense;
          uint64_t v218 = objc_msgSend_width(v857[2], v215, v216, v217);
          uint64_t v222 = objc_msgSend_height(v857[2], v219, v220, v221);
          int v224 = objc_msgSend_prepareWithImageWidth_imageHeight_(regDense, v223, v218, v222);
          int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = v224;
          if (v224)
          {
            uint64_t v834 = v839;
            LODWORD(v831) = v224;
            FigDebugAssert3();
          }
          else
          {
            *(float *)&double v226 = v210;
            int v227 = objc_msgSend_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel_(self->_regDense, v225, (uint64_t)v857, (uint64_t)v212, v213, v888, 0, 1, v226, 0, 0);
            if (!v227)
            {
              objc_storeStrong(v212 + 2, self->_longLumaTex);
              id v228 = v212[3];
              v212[3] = 0;

              objc_storeStrong(v213 + 2, *(id *)v881);
              id v229 = v213[3];
              v213[3] = 0;

              int v227 = objc_msgSend_warpAdditionalImage_warpedImage_homography_hybridReg_alwaysDense_(self->_regDense, v230, (uint64_t)self->_longFusionMapTex, (uint64_t)v847, v888, 0, 1);
              if (!v227)
              {
                longFusionMapTex = self->_longFusionMapTex;
                v232 = longFusionMapTex;
                objc_storeStrong((id *)&self->_longFusionMapTex, v208);
                v233 = v232;

                longRealLongFusionMapTex = self->_longRealLongFusionMapTex;
                if (longRealLongFusionMapTex)
                {
                  int v237 = objc_msgSend_warpAdditionalImage_warpedImage_homography_hybridReg_alwaysDense_(self->_regDense, v234, (uint64_t)longRealLongFusionMapTex, (uint64_t)v233, v888, 0, 1);
                  if (v237)
                  {
                    uint64_t v834 = v839;
                    LODWORD(v831) = v237;
                    FigDebugAssert3();
                    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
                    int v238 = 4;
                    goto LABEL_63;
                  }
                  objc_storeStrong((id *)&self->_longRealLongFusionMapTex, longFusionMapTex);
                }
                objc_msgSend_reset(self->_regDense, v234, (uint64_t)longRealLongFusionMapTex, v235);
                int v238 = 0;
                int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = 0;
LABEL_63:

                v847 = v233;
LABEL_64:

                if (v238)
                {

                  v240 = 0;
                  v241 = 0;
                  goto LABEL_170;
                }
                int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v239, *(uint64_t *)v881, (uint64_t)self->_longLumaTex);
                if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams
                  || (int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_copyTexture_outTex_(self->_textureUtils, v242, (uint64_t)obj, (uint64_t)self->_longChromaTex)) != 0)
                {
                  FigDebugAssert3();

                  goto LABEL_95;
                }
                FigMetalDecRef();
                FigMetalDecRef();

                goto LABEL_69;
              }
            }
            uint64_t v834 = v839;
            LODWORD(v831) = v227;
            FigDebugAssert3();
            int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
          }
          int v238 = 4;
          goto LABEL_64;
        }
      }
    }
  }
LABEL_69:
  self->_preEspressoMetaData.combo = v855 ^ 1u;
  long long v243 = *(_OWORD *)&v861->exposureParams.gain;
  long long v244 = *(_OWORD *)&v861->exposureParams.ispGainRangeExpansionFactor;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.blue_combo_float gain = *(_OWORD *)&v861->exposureParams.blue_combo_gain;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.ispGainRangeExpansionFactor = v244;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.float gain = v243;
  long long v245 = *(_OWORD *)&v861->exposureParams.exposure_time;
  long long v246 = *(_OWORD *)&v861->exposureParams.read_noise_1x;
  long long v247 = *(_OWORD *)&v861->exposureParams.lsModulationWeight;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.ltm_locked = *(_OWORD *)&v861->exposureParams.ltm_locked;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.read_noise_1x = v246;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.lsModulationWeight = v247;
  *(_OWORD *)&self->_preEspressoMetaData.refExposure.float exposure_time = v245;
  long long v248 = *(_OWORD *)&self->_ev0Metadata.exposureParams.ispGainRangeExpansionFactor;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.float exposure_time = *(_OWORD *)&self->_ev0Metadata.exposureParams.exposure_time;
  long long v249 = *(_OWORD *)&self->_ev0Metadata.exposureParams.lsModulationWeight;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.read_noise_1x = *(_OWORD *)&self->_ev0Metadata.exposureParams.read_noise_1x;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.lsModulationWeight = v249;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.ltm_locked = *(_OWORD *)&self->_ev0Metadata.exposureParams.ltm_locked;
  long long v250 = *(_OWORD *)&self->_ev0Metadata.exposureParams.blue_combo_gain;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.float gain = *(_OWORD *)&self->_ev0Metadata.exposureParams.gain;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.blue_combo_float gain = v250;
  *(_OWORD *)&self->_preEspressoMetaData.syntheticLongExposure.ispGainRangeExpansionFactor = v248;
  long long v251 = *(_OWORD *)&self->_longMetadata.exposureParams.lsModulationWeight;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.read_noise_1x = *(_OWORD *)&self->_longMetadata.exposureParams.read_noise_1x;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.lsModulationWeight = v251;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.ltm_locked = *(_OWORD *)&self->_longMetadata.exposureParams.ltm_locked;
  long long v252 = *(_OWORD *)&self->_longMetadata.exposureParams.blue_combo_gain;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.float gain = *(_OWORD *)&self->_longMetadata.exposureParams.gain;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.blue_combo_float gain = v252;
  long long v253 = *(_OWORD *)&self->_longMetadata.exposureParams.exposure_time;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.ispGainRangeExpansionFactor = *(_OWORD *)&self->_longMetadata.exposureParams.ispGainRangeExpansionFactor;
  *(_OWORD *)&self->_preEspressoMetaData.longExposure.float exposure_time = v253;
  float gain = self->_preEspressoMetaData.syntheticLongExposure.gain;
  *(float *)&long long v253 = gain * self->_preEspressoMetaData.syntheticLongExposure.exposure_time;
  unsigned int v858 = objc_msgSend_modelForEIT_(*(void **)(v863 + 48), v78, v79, v80, *(double *)&v253, v831, v834);
  p_exposureParams = &v861->exposureParams;
  v845 = &self->_ev0Metadata.exposureParams;
  v870[0] = sub_262F98950((uint64_t)&v861->exposureParams, (uint64_t)&self->_ev0Metadata.exposureParams, 2);
  *(float *)&v870[1] = gain;
  v257 = objc_msgSend_objectAtIndexedSubscript_(v853, v255, 1, v256);
  objc_msgSend_floatValue(v257, v258, v259, v260);
  v870[2] = v261;

  p_preEspressoMetaData = &self->_preEspressoMetaData;
  uint64_t v264 = objc_msgSend_noiseTuningForModel_(*(void **)(v863 + 48), v262, v858, v263);
  v265 = (void *)v264;
  if (!v264) {
    goto LABEL_195;
  }
  v266 = &OBJC_IVAR___DeepFusionNoiseTuningPlist_slEV0;
  if (v855) {
    v266 = &OBJC_IVAR___DeepFusionNoiseTuningPlist_slEV0Long;
  }
  objc_storeStrong(&v872, *(id *)(v264 + *v266));
  if (!v872)
  {
LABEL_195:
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();

LABEL_95:
    v240 = 0;
    v241 = 0;
    goto LABEL_170;
  }
  v269 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(*(void *)(v863 + 48) + 56), v267, v858, v268);
  id v270 = v873;
  id v873 = v269;

  if (self->_preEspressoMetaData.combo == 1) {
    float v271 = NAN;
  }
  else {
    float v271 = sub_262F98950((uint64_t)p_exposureParams, (uint64_t)&self->_longMetadata.exposureParams, 2);
  }
  float v874 = v271;
  v875[0] = 1065353216;
  v875[1] = sqrtf((float)v852);

  float v272 = sub_262F989D8((uint64_t)&self->_preEspressoMetaData.syntheticLongExposure, (uint64_t)&self->_preEspressoMetaData.refExposure);
  v276 = objc_msgSend_desc(v864, v273, v274, v275);
  objc_msgSend_setUsage_(v276, v277, 7, v278);

  v282 = objc_msgSend_desc(v864, v279, v280, v281);
  objc_msgSend_setPixelFormat_(v282, v283, 25, v284);

  unint64_t v285 = self->_width;
  v289 = objc_msgSend_desc(v864, v286, v287, v288);
  objc_msgSend_setWidth_(v289, v290, v285, v291);

  unint64_t v292 = self->_height;
  v296 = objc_msgSend_desc(v864, v293, v294, v295);
  objc_msgSend_setHeight_(v296, v297, v292, v298);

  objc_msgSend_setLabel_(v864, v299, 0, v300);
  v304 = objc_msgSend_allocator(self->_metal, v301, v302, v303);
  v307 = objc_msgSend_newTextureWithDescriptor_(v304, v305, (uint64_t)v864, v306);
  id v308 = v878;
  id v878 = v307;

  if (!v878) {
    goto LABEL_210;
  }
  v312 = objc_msgSend_desc(v864, v309, v310, v311);
  objc_msgSend_setPixelFormat_(v312, v313, 65, v314);

  unint64_t v315 = self->_width;
  v319 = objc_msgSend_desc(v864, v316, v317, v318);
  objc_msgSend_setWidth_(v319, v320, v315 >> 1, v321);

  unint64_t v322 = self->_height;
  v326 = objc_msgSend_desc(v864, v323, v324, v325);
  objc_msgSend_setHeight_(v326, v327, v322 >> 1, v328);

  objc_msgSend_setLabel_(v864, v329, 0, v330);
  v334 = objc_msgSend_allocator(self->_metal, v331, v332, v333);
  v337 = objc_msgSend_newTextureWithDescriptor_(v334, v335, (uint64_t)v864, v336);
  id v338 = v877;
  id v877 = v337;

  if (!v877) {
    goto LABEL_210;
  }
  *(float *)&double v341 = sub_262FCDA18(*(void *)(*(void *)(v863 + 48) + 24), gain);
  int v342 = LODWORD(v341);
  if (*(float *)&v341 > 0.0)
  {
    if (objc_msgSend_filterChroma_outChroma_alpha_(self->_preEspressoStage, v339, (uint64_t)self->_referenceChromaTex, (uint64_t)v877, v341)|| objc_msgSend_copyTexture_outTex_(self->_textureUtils, v343, (uint64_t)v877, (uint64_t)self->_referenceChromaTex)|| (LODWORD(v345) = v342, objc_msgSend_filterChroma_outChroma_alpha_(self->_preEspressoStage, v344, (uint64_t)self->_longChromaTex, (uint64_t)v877, v345))|| objc_msgSend_copyTexture_outTex_(self->_textureUtils,
                         v346,
                         (uint64_t)v877,
                         (uint64_t)self->_longChromaTex))
    {
      FigDebugAssert3();
      int v830 = FigSignalErrorAt();
      goto LABEL_211;
    }
  }
  tiledFusionStage = self->_tiledFusionStage;
  referenceLumaTex = self->_referenceLumaTex;
  location = self->_referenceChromaTex;
  referenceFusionMapTex = self->_referenceFusionMapTex;
  longChromaTex = self->_longChromaTex;
  longLumaTex = self->_longLumaTex;
  v350 = self->_longFusionMapTex;
  v351 = self->_longRealLongFusionMapTex;
  id v353 = v877;
  id v352 = v878;
  uint64_t v354 = *(void *)(v863 + 48);
  v355 = objc_msgSend_objectAtIndexedSubscript_(v853, v339, 1, v340);
  objc_msgSend_floatValue(v355, v356, v357, v358);
  *(float *)&double v359 = *p_EVM_EV0_motionScore;
  LODWORD(v360) = v870[0];
  BYTE2(v838) = v855;
  BYTE1(v838) = LOBYTE(self->_ev0Metadata.faces[1].rect.origin.y);
  LOBYTE(v838) = v842;
  LODWORD(v362) = v361;
  *(float *)&double v363 = v272;
  *(float *)&double v364 = gain;
  int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_runWithReferenceLuma_referenceChroma_longLuma_longChroma_preFusionMap_slFusionMap_slQuantBounds_longFusionMap_skinMask_skyMask_lscGains_totalGain_outLuma_outChroma_deferredProcessingPlist_lscGainGreenMax_EVM_EV0_motionScore_eitRatio_aeShutterTimeRatio_hasSIFR_isStationary_isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams_(tiledFusionStage, v365, (uint64_t)referenceLumaTex, (uint64_t)location, longLumaTex, longChromaTex, referenceFusionMapTex, v350, v364, v362, v359, v360, v363, v861->faces[0].rect.origin.x, v861->faces[0].rect.size.width, *(double *)&v861->faces[0].confidence, v875, v351, v856, v859, v854, v352, v353, v354, v838, v870, v858, self->_sidecar, &self->_intermediateEncodingParameters);

  if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams)
  {
    FigDebugAssert3();
    goto LABEL_95;
  }
  v366 = self->_referenceLumaTex;
  self->_referenceLumaTex = 0;

  referenceChromaTex = self->_referenceChromaTex;
  self->_referenceChromaTex = 0;

  v368 = self->_longLumaTex;
  self->_longLumaTex = 0;

  v369 = self->_longChromaTex;
  self->_longChromaTex = 0;

  if (!self->_referenceBuffer) {
    goto LABEL_210;
  }
  v373 = objc_msgSend_device(self->_metal, v370, v371, v372);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(self->_referenceBuffer);
  v377 = objc_msgSend_newBufferWithIOSurface_(v373, v375, (uint64_t)IOSurface, v376);

  if (!v377) {
    goto LABEL_203;
  }
  v381 = objc_msgSend_allocator(self->_metal, v378, v379, v380);
  int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_addExternalMetalBuffer_atSubAllocatorID_(v381, v382, (uint64_t)v377, 1);

  if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams)
  {
    FigSignalErrorAt();
LABEL_205:

    goto LABEL_95;
  }
  if (!self->_longBuffer)
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    goto LABEL_205;
  }
  v386 = objc_msgSend_device(self->_metal, v383, v384, v385);
  IOSurfaceRef v387 = CVPixelBufferGetIOSurface(self->_longBuffer);
  v390 = objc_msgSend_newBufferWithIOSurface_(v386, v388, (uint64_t)v387, v389);

  if (!v390)
  {
LABEL_203:
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    v377 = 0;
    goto LABEL_205;
  }
  v394 = objc_msgSend_allocator(self->_metal, v391, v392, v393);
  int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_addExternalMetalBuffer_atSubAllocatorID_(v394, v395, (uint64_t)v390, 2);

  if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams)
  {
    FigSignalErrorAt();
    v377 = v390;
    goto LABEL_205;
  }

  if (objc_msgSend_linearOutputPixelBuffer(self->_output, v396, v397, v398))
  {
    v399 = objc_msgSend_linearOutputMetadata(self->_output, v42, v43, v44);
    BOOL v400 = v399 == 0;

    if (v400) {
      goto LABEL_210;
    }
    v404 = objc_msgSend_linearOutputMetadata(self->_output, v401, v402, v403);
    objc_msgSend_setObject_forKeyedSubscript_(v404, v405, *MEMORY[0x263F04038], *MEMORY[0x263F04020]);

    v409 = objc_msgSend_linearOutputMetadata(self->_output, v406, v407, v408);
    objc_msgSend_setObject_forKeyedSubscript_(v409, v410, *MEMORY[0x263F03FE8], *MEMORY[0x263F03FC0]);

    float v411 = sub_262F98950((uint64_t)p_exposureParams, (uint64_t)v845, 2);
    ltm_soft_float gain = v861->exposureParams.ltm_soft_gain;
    isp_digital_float gain = v861->exposureParams.isp_digital_gain;
    if (!*(unsigned char *)(*(void *)(v863 + 8) + 79))
    {
      v414 = sub_262FBB3E8(&v861->ltmCurves.ltmLut.version);
      v418 = objc_msgSend_linearOutputMetadata(self->_output, v415, v416, v417);
      objc_msgSend_setObject_forKeyedSubscript_(v418, v419, (uint64_t)v414, *MEMORY[0x263F2F530]);
    }
    v420 = sub_262FBB4B8(&self->_ev0Metadata.ltmCurves.globalLtmLut.lutEntryCount);
    v424 = objc_msgSend_linearOutputMetadata(self->_output, v421, v422, v423);
    objc_msgSend_setObject_forKeyedSubscript_(v424, v425, (uint64_t)v420, *MEMORY[0x263F2F4D8]);

    v426 = sub_262FBB4B8(&self->_ev0Metadata.ltmCurves.gtcLut.lutEntryCount);
    v430 = objc_msgSend_linearOutputMetadata(self->_output, v427, v428, v429);
    objc_msgSend_setObject_forKeyedSubscript_(v430, v431, (uint64_t)v426, *MEMORY[0x263F2F4E8]);

    *(float *)&double v432 = ltm_soft_gain;
    v436 = objc_msgSend_numberWithFloat_(NSNumber, v433, v434, v435, v432);
    v440 = objc_msgSend_linearOutputMetadata(self->_output, v437, v438, v439);
    objc_msgSend_setObject_forKeyedSubscript_(v440, v441, (uint64_t)v436, *MEMORY[0x263F2F0F8]);

    *(float *)&double v442 = v411;
    v446 = objc_msgSend_numberWithFloat_(NSNumber, v443, v444, v445, v442);
    v450 = objc_msgSend_linearOutputMetadata(self->_output, v447, v448, v449);
    objc_msgSend_setObject_forKeyedSubscript_(v450, v451, (uint64_t)v446, *MEMORY[0x263F2F0F0]);

    *(float *)&double v452 = isp_digital_gain;
    v456 = objc_msgSend_numberWithFloat_(NSNumber, v453, v454, v455, v452);
    v460 = objc_msgSend_linearOutputMetadata(self->_output, v457, v458, v459);
    objc_msgSend_setObject_forKeyedSubscript_(v460, v461, (uint64_t)v456, *MEMORY[0x263F2F0D8]);

    colorConvertStage = self->_colorConvertStage;
    uint64_t v464 = (uint64_t)v877;
    uint64_t v463 = (uint64_t)v878;
    uint64_t v468 = objc_msgSend_linearOutputPixelBuffer(self->_output, v465, v466, v467);
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_extractLinearBufferWithLumaInput_chromaInput_inputIsLinear_removeChromaBias_lumaPedestal_exposureParams_ccm_output_(colorConvertStage, v469, v463, v464, 0, 0, p_exposureParams, v468, 0.0, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
    if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams) {
      goto LABEL_95;
    }
  }
  v470 = objc_msgSend_desc(v864, v42, v43, v44);
  objc_msgSend_setUsage_(v470, v471, 7, v472);

  v476 = objc_msgSend_desc(v864, v473, v474, v475);
  objc_msgSend_setPixelFormat_(v476, v477, 25, v478);

  unint64_t v479 = self->_width;
  v483 = objc_msgSend_desc(v864, v480, v481, v482);
  objc_msgSend_setWidth_(v483, v484, v479, v485);

  unint64_t v486 = self->_height;
  v490 = objc_msgSend_desc(v864, v487, v488, v489);
  objc_msgSend_setHeight_(v490, v491, v486, v492);

  objc_msgSend_setLabel_(v864, v493, 0, v494);
  v498 = objc_msgSend_allocator(self->_metal, v495, v496, v497);
  v501 = objc_msgSend_newTextureWithDescriptor_(v498, v499, (uint64_t)v864, v500);
  id v502 = v880;
  id v880 = v501;

  if (!v880) {
    goto LABEL_210;
  }
  v506 = objc_msgSend_allocator(self->_metal, v503, v504, v505);
  v509 = objc_msgSend_newTextureDescriptor_(v506, v507, 1, v508);

  if (!v509) {
    goto LABEL_208;
  }
  v513 = objc_msgSend_desc(v509, v510, v511, v512);
  objc_msgSend_setUsage_(v513, v514, 7, v515);

  v519 = objc_msgSend_desc(v509, v516, v517, v518);
  objc_msgSend_setPixelFormat_(v519, v520, 65, v521);

  unint64_t v522 = self->_width;
  v526 = objc_msgSend_desc(v509, v523, v524, v525);
  objc_msgSend_setWidth_(v526, v527, v522 >> 1, v528);

  unint64_t v529 = self->_height;
  v533 = objc_msgSend_desc(v509, v530, v531, v532);
  objc_msgSend_setHeight_(v533, v534, v529 >> 1, v535);

  objc_msgSend_setLabel_(v509, v536, 0, v537);
  v541 = objc_msgSend_allocator(self->_metal, v538, v539, v540);
  v543 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v541, v542, (uint64_t)v509, 1);
  id v544 = v879;
  id v879 = v543;

  if (!v879)
  {
LABEL_208:
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();

    goto LABEL_95;
  }
  objc_msgSend_setToneCurvesWithLTC_GTC_colorCorrectionMatrix_dump_(self->_toneMappingCurves, v545, (uint64_t)&v861->ltmCurves, (uint64_t)&self->_ev0Metadata.ltmCurves, 0, v861->faces[0].rect.origin.x, v861->faces[0].rect.size.width, *(double *)&v861->faces[0].confidence);
  v546 = objc_alloc_init(ToneMappingBuffers);
  objc_storeStrong((id *)&v546->inLumaTex, v878);
  objc_storeStrong((id *)&v546->inChromaTex, v877);
  localGainMapTex = v546->localGainMapTex;
  v546->localGainMapTex = 0;

  objc_storeStrong((id *)&v546->outLumaTex, v880);
  objc_storeStrong((id *)&v546->outChromaTex, v879);
  objc_storeStrong((id *)&v546->curves, self->_toneMappingCurves);
  objc_storeStrong((id *)&v546->skinMask, v856);
  objc_storeStrong((id *)&v546->personMask, v851);
  objc_storeStrong((id *)&v546->skyMask, v859);
  uint64_t v551 = objc_msgSend_faceLandmarks(self->_inferenceResults, v548, v549, v550);
  faceLandmarks = v546->faceLandmarks;
  v546->faceLandmarks = (NSArray *)v551;

  uint64_t v556 = objc_msgSend_skinToneClassificationsForFaces(self->_inferenceResults, v553, v554, v555);
  skinToneClassification = v546->skinToneClassification;
  v546->skinToneClassification = (NSArray *)v556;

  uint64_t v561 = objc_msgSend_lowResPersonInstanceConfidences(self->_inferenceResults, v558, v559, v560);
  maskConfidences = v546->maskConfidences;
  v546->maskConfidences = (NSArray *)v561;

  for (uint64_t k = 0; k != 4; ++k)
    objc_storeStrong((id *)&v546->instanceMasks[k], (id)v889[k]);
  BYTE4(v832) = 0;
  LODWORD(v832) = 4;
  LODWORD(v565) = 1.0;
  if (objc_msgSend_runToneMapping_bilateralGrid_bilateralGridHomography_tmPlist_darkestFrameMetadata_ev0FrameMetadata_scaleInput_colorCorrection_hasChromaBias_quality_inputIsLinear_(self->_toneMappingStage, v564, (uint64_t)v546, 0, *(void *)(v863 + 8), v861, p_ev0Metadata, 0, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v565, v861->faces[0].rect.origin.x, v861->faces[0].rect.size.width, *(double *)&v861->faces[0].confidence, v832))
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();

    goto LABEL_95;
  }

  uint64_t v569 = v863;
  uint64_t v570 = *(void *)(v863 + 16);
  if (v570)
  {
    semanticStyleProperties = self->_semanticStyleProperties;
    if (semanticStyleProperties)
    {
      semanticStylesStage = self->_semanticStylesStage;
      v573 = objc_msgSend_smartCameraSceneType(self->_inferenceResults, v566, v567, v568);
      LOBYTE(v836) = 0;
      int isLowLight = objc_msgSend_runWithStyle_tuningParams_refFrameMetadata_sceneType_lumaTex_chromaTex_gainMapTex_outputGainMapTex_personMaskTex_skinMaskTex_skyMaskTex_isLowLight_(semanticStylesStage, v574, (uint64_t)semanticStyleProperties, v570, v861, v573, v880, v879, 0, 0, v851, v856, v859, v836);

      uint64_t v569 = v863;
      if (isLowLight) {
        goto LABEL_210;
      }
    }
  }
  uint64_t v576 = *(void *)(v569 + 8);
  if (v576 && *(unsigned char *)(v576 + 120))
  {
    int applyColorCubeFixOverride = self->_applyColorCubeFixOverride;
    goto LABEL_109;
  }
  int applyColorCubeFixOverride = self->_applyColorCubeFixOverride;
  if (applyColorCubeFixOverride == 1)
  {
LABEL_109:
    BOOL v578 = applyColorCubeFixOverride != 0;
    if (!v576) {
      goto LABEL_114;
    }
    goto LABEL_112;
  }
  BOOL v578 = 0;
  if (!v576) {
    goto LABEL_114;
  }
LABEL_112:
  if (*(unsigned char *)(v576 + 121))
  {
    int applyColorCube2FixOverride = self->_applyColorCube2FixOverride;
    goto LABEL_115;
  }
LABEL_114:
  int applyColorCube2FixOverride = self->_applyColorCube2FixOverride;
  if (applyColorCube2FixOverride != 1)
  {
    BOOL v843 = 0;
    if (v578) {
      int v581 = 2;
    }
    else {
      int v581 = -1;
    }
    goto LABEL_124;
  }
LABEL_115:
  if (v578) {
    int v580 = 2;
  }
  else {
    int v580 = -1;
  }
  BOOL v843 = applyColorCube2FixOverride != 0;
  if (applyColorCube2FixOverride) {
    int v581 = 3;
  }
  else {
    int v581 = v580;
  }
LABEL_124:
  unsigned int v862 = v581;
  v582 = self->_metal;
  uint64_t v583 = objc_msgSend_buffer(self->_output, v566, v567, v568);
  v241 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v582, v584, v583, 10, 7, 0);
  if (!v241)
  {
LABEL_210:
    FigDebugAssert3();
    int v830 = FigSignalErrorAt();
LABEL_211:
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = v830;
    goto LABEL_95;
  }
  v588 = self->_metal;
  uint64_t v589 = objc_msgSend_buffer(self->_output, v585, v586, v587);
  v240 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v588, v590, v589, 30, 7, 1);
  if (!v240)
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    v240 = 0;
    goto LABEL_170;
  }
  v594 = objc_msgSend_allocator(self->_metal, v591, v592, v593);
  v597 = objc_msgSend_newTextureDescriptor_(v594, v595, 2, v596);

  if (!v597)
  {
    FigDebugAssert3();
    int v818 = FigSignalErrorAt();
    goto LABEL_168;
  }
  v601 = objc_msgSend_desc(v597, v598, v599, v600);
  objc_msgSend_setUsage_(v601, v602, 7, v603);

  v607 = objc_msgSend_desc(v597, v604, v605, v606);
  objc_msgSend_setPixelFormat_(v607, v608, 10, v609);

  unint64_t v610 = self->_width;
  v614 = objc_msgSend_desc(v597, v611, v612, v613);
  objc_msgSend_setWidth_(v614, v615, v610 >> 1, v616);

  unint64_t v617 = self->_height;
  v621 = objc_msgSend_desc(v597, v618, v619, v620);
  objc_msgSend_setHeight_(v621, v622, v617 >> 1, v623);

  objc_msgSend_setLabel_(v597, v624, 0, v625);
  id v849 = v241;
  v850 = v240;
  v629 = objc_msgSend_allocator(self->_metal, v626, v627, v628);
  *(void *)&v888[0] = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v629, v630, (uint64_t)v597, 2);

  if (!*(void *)&v888[0])
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    v631 = 0;
    v632 = 0;
LABEL_219:
    v241 = v849;
    v240 = v850;
    goto LABEL_220;
  }
  v631 = objc_opt_new();
  v632 = objc_opt_new();
  int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_allocatePyramidWithWidth_height_allocLevel0_levels_texUsage_mtlSubAllocatorID_label_lumaFormat_chromaFormat_outPyramid_metal_(PyramidStorage_NRF, v633, LOWORD(self->_width), LOWORD(self->_height), 0, 4, 7, 0, @"sharpeningInPyramid", 25, 65, v631, self->_metal);
  if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams
    || (int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_allocatePyramidWithWidth_height_allocLevel0_levels_texUsage_mtlSubAllocatorID_label_lumaFormat_chromaFormat_outPyramid_metal_(PyramidStorage_NRF, v634, LOWORD(self->_width), LOWORD(self->_height), 0, 4, 7, 2, @"sharpeningLowVarPyramid", 25, 65, v632, self->_metal)) != 0
    || (int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v631, v635, (uint64_t)v880, (uint64_t)v879, 0, self->_metal)) != 0
    || (int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = objc_msgSend_setLumaTexture_chromaTexture_level_metal_(v632, v636, (uint64_t)v878, (uint64_t)v877, 0, self->_metal)) != 0)
  {
    FigDebugAssert3();
LABEL_220:

    goto LABEL_170;
  }
  BYTE4(v835) = v855;
  LODWORD(v835) = v858;
  *(float *)&double v638 = gain;
  if (objc_msgSend_computeAMBNRDenoiseBoostMap_longFusionMap_ev0FusionMap_ev0Metadata_longMetadata_numEV0_deferredProcessingPlist_espressoModel_isSyntheticLongWithRealLong_totalGain_(self->_tiledFusionStage, v637, *(uint64_t *)&v888[0], (uint64_t)self->_longRealLongFusionMapTex, self->_longFusionMapTex, p_ev0Metadata, &self->_longMetadata, v852, v638, *(void *)(v863 + 48), v835))
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    goto LABEL_220;
  }
  objc_storeStrong(v860 + 2, v241);
  if (v862 == -1) {
    v639 = v240;
  }
  else {
    v639 = 0;
  }
  objc_storeStrong(v860 + 3, v639);
  if (objc_msgSend_setResourcesWithOutput_inputPyramid_noiseMapPyramid_sharpeningPyramid_localGainMapTex_(self->_ambnrStage, v640, (uint64_t)v860, (uint64_t)v631, 0, v632, *(void *)&v888[0])|| objc_msgSend_pyramidDownscale_(self->_syntheticLongStage, v641, (uint64_t)v631, v642)|| (uint64_t v646 = *(void *)(v863 + 40), v647 = *(void *)(v863 + 32), ambnrStage = self->_ambnrStage, v649 = *(void **)(v863 + 56), LOWORD(v837) = objc_msgSend_defringingEnabled(v649, v643, v644, v645), LOBYTE(v833) = 0, objc_msgSend_runWithExposure_staticScene_dasPlist_nmPlist_defringingTuning_greenGhostBrightLightTuning_greenGhostEnabled_skinMask_skyMask_maskExtent_faceLandMarks_ev0FrameMetadata_evmFrameMetadata_defringeEnabled_isLowLight_gainMap_(ambnrStage, v650, (uint64_t)v845, 0,
                        v646,
                        v647,
                        v649,
                        0,
                        self->_ev0Metadata.ROI.origin.x,
                        self->_ev0Metadata.ROI.origin.y,
                        self->_ev0Metadata.ROI.size.width,
                        self->_ev0Metadata.ROI.size.height,
                        v833,
                        v856,
                        v859,
                        0,
                        0,
                        0,
                        v837,
                        0)))
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
    goto LABEL_219;
  }
  objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v651, (uint64_t)v632, (uint64_t)self->_metal);
  objc_msgSend_makePyramidAliasable_metal_(PyramidStorage_NRF, v652, (uint64_t)v631, (uint64_t)self->_metal);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if (v876) {
    FigMetalDecRef();
  }

  v241 = v849;
  v240 = v850;

  v656 = objc_msgSend_allocator(self->_metal, v653, v654, v655);
  BOOL v659 = objc_msgSend_usedSize_(v656, v657, 0, v658) == 0;

  if (!v659)
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = -1;
    goto LABEL_170;
  }
  v663 = objc_msgSend_allocator(self->_metal, v660, v661, v662);
  objc_msgSend_purgeResources_(v663, v664, 0, v665);

  if (v862 != -1)
  {
    ColorCubeCorrectionStage = self->_ColorCubeCorrectionStage;
    uint64_t v670 = (uint64_t)v860[3];
    if (v843) {
      int fixed = objc_msgSend_runOnLuma_andChroma_withMask_outChroma_colorCubeFixType_(ColorCubeCorrectionStage, v666, (uint64_t)v849, v670, v859, v850, v862);
    }
    else {
      int fixed = objc_msgSend_runOnLuma_andChroma_withMask_outChroma_colorCubeFixType_(ColorCubeCorrectionStage, v666, (uint64_t)v849, v670, 0, v850, v862);
    }
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = fixed;
    if (fixed) {
      goto LABEL_170;
    }
    FigMetalDecRef();
  }
  if (!*(unsigned char *)(*(void *)(v863 + 40) + 41)) {
    goto LABEL_153;
  }
  v672 = objc_msgSend_desc(v864, v666, v667, v668);
  objc_msgSend_setUsage_(v672, v673, 7, v674);

  v678 = objc_msgSend_desc(v864, v675, v676, v677);
  objc_msgSend_setPixelFormat_(v678, v679, 10, v680);

  unint64_t v681 = self->_width;
  v685 = objc_msgSend_desc(v864, v682, v683, v684);
  objc_msgSend_setWidth_(v685, v686, v681, v687);

  unint64_t v688 = self->_height;
  v692 = objc_msgSend_desc(v864, v689, v690, v691);
  objc_msgSend_setHeight_(v692, v693, v688, v694);

  objc_msgSend_setLabel_(v864, v695, 0, v696);
  v700 = objc_msgSend_allocator(self->_metal, v697, v698, v699);
  *(void *)&v888[0] = objc_msgSend_newTextureWithDescriptor_(v700, v701, (uint64_t)v864, v702);

  if (*(void *)&v888[0]
    && (LODWORD(v704) = *(_DWORD *)(*(void *)(v863 + 40) + 44),
        objc_msgSend_runWithInput_output_gamma_(self->_outliersRemovalStage, v703, (uint64_t)v849, *(uint64_t *)&v888[0], v704), objc_msgSend_commandQueue(self->_metal, v705, v706, v707), v708 = objc_claimAutoreleasedReturnValue(), objc_msgSend_commandBuffer(v708, v709, v710, v711), v712 = objc_claimAutoreleasedReturnValue(), v708, v712))
  {
    v716 = objc_msgSend_computeCommandEncoder(v712, v713, v714, v715);
    objc_msgSend_setComputePipelineState_(v716, v717, (uint64_t)self->_copyTextureKernel, v718);
    objc_msgSend_setTexture_atIndex_(v716, v719, *(uint64_t *)&v888[0], 0);
    objc_msgSend_setTexture_atIndex_(v716, v720, (uint64_t)v849, 1);
    v868[0] = objc_msgSend_width(v849, v721, v722, v723);
    v868[1] = objc_msgSend_height(v849, v724, v725, v726);
    v868[2] = 1;
    int64x2_t v866 = vdupq_n_s64(0x20uLL);
    uint64_t v867 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v716, v727, (uint64_t)v868, (uint64_t)&v866);
    objc_msgSend_endEncoding(v716, v728, v729, v730);
    objc_msgSend_commit(v712, v731, v732, v733);
    if (*(void *)&v888[0])
    {
      FigMetalDecRef();

LABEL_153:
      objc_msgSend_waitForSchedule(self->_metal, v666, v667, v668);
      nrfStatus = self->_nrfStatus;
      if (nrfStatus)
      {
        v738 = objc_msgSend_metadata(self->_output, v734, v735, v736);
        objc_msgSend_setObject_forKeyedSubscript_(v738, v739, (uint64_t)nrfStatus, *MEMORY[0x263F2F130]);
      }
      nrfInputBracketCount = self->_nrfInputBracketCount;
      if (nrfInputBracketCount)
      {
        v741 = objc_msgSend_metadata(self->_output, v734, v735, v736);
        objc_msgSend_setObject_forKeyedSubscript_(v741, v742, (uint64_t)nrfInputBracketCount, *MEMORY[0x263F2F118]);
      }
      nrfRegisteredBracketCount = self->_nrfRegisteredBracketCount;
      if (nrfRegisteredBracketCount)
      {
        v744 = objc_msgSend_metadata(self->_output, v734, v735, v736);
        objc_msgSend_setObject_forKeyedSubscript_(v744, v745, (uint64_t)nrfRegisteredBracketCount, *MEMORY[0x263F2F120]);
      }
      uint64_t SRLStatus = objc_msgSend_getSRLStatus(self->_toneMappingStage, v734, v735, v736);
      v749 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v747, SRLStatus, v748);
      v753 = objc_msgSend_metadata(self->_output, v750, v751, v752);
      objc_msgSend_setObject_forKeyedSubscript_(v753, v754, (uint64_t)v749, *MEMORY[0x263F2F128]);

      output = self->_output;
      if (*(unsigned char *)(*(void *)(v863 + 8) + 79))
      {
        if (objc_msgSend_linearOutputPixelBuffer(output, v755, v756, v757))
        {
          v762 = objc_msgSend_getSTFLTM_asNSData(self->_toneMappingStage, v759, v760, v761);
          v766 = objc_msgSend_linearOutputMetadata(self->_output, v763, v764, v765);
          objc_msgSend_setObject_forKeyedSubscript_(v766, v767, (uint64_t)v762, *MEMORY[0x263F2F530]);
        }
        v768 = objc_msgSend_metadata(self->_output, v759, v760, v761);
        objc_msgSend_setObject_forKeyedSubscript_(v768, v769, MEMORY[0x263EFFA88], *MEMORY[0x263F2F190]);

        v770 = NSNumber;
        uint64_t v774 = objc_msgSend_stfStillApplied(self->_toneMappingStage, v771, v772, v773);
        v777 = objc_msgSend_numberWithBool_(v770, v775, v774, v776);
        v781 = objc_msgSend_metadata(self->_output, v778, v779, v780);
        objc_msgSend_setObject_forKeyedSubscript_(v781, v782, (uint64_t)v777, *MEMORY[0x263F2F180]);

        if (!objc_msgSend_stfStillApplied(self->_toneMappingStage, v783, v784, v785)) {
          goto LABEL_166;
        }
        v789 = NSNumber;
        uint64_t STFStillCorrectionStrength = objc_msgSend_getSTFStillCorrectionStrength_(self->_toneMappingStage, v786, 1, v788);
        v793 = objc_msgSend_numberWithInt_(v789, v791, STFStillCorrectionStrength, v792);
        v797 = objc_msgSend_metadata(self->_output, v794, v795, v796);
        objc_msgSend_setObject_forKeyedSubscript_(v797, v798, (uint64_t)v793, *MEMORY[0x263F2F188]);

        v799 = NSNumber;
        uint64_t v803 = objc_msgSend_stfStillAnalyticsVersion(self->_toneMappingStage, v800, v801, v802);
        v806 = objc_msgSend_numberWithUnsignedInt_(v799, v804, v803, v805);
        v810 = objc_msgSend_metadata(self->_output, v807, v808, v809);
        objc_msgSend_setObject_forKeyedSubscript_(v810, v811, (uint64_t)v806, *MEMORY[0x263F2F178]);
      }
      else
      {
        v806 = objc_msgSend_metadata(output, v755, v756, v757);
        objc_msgSend_setObject_forKeyedSubscript_(v806, v812, MEMORY[0x263EFFA80], *MEMORY[0x263F2F190]);
      }

LABEL_166:
      v813 = objc_msgSend_allocator(self->_metal, v786, v787, v788);
      BOOL v817 = objc_msgSend_usedSizeAll(v813, v814, v815, v816) == 0;

      if (v817)
      {
        int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = 0;
        goto LABEL_170;
      }
      int v818 = FigSignalErrorAt();
LABEL_168:
      int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = v818;
      goto LABEL_170;
    }
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    int isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams = FigSignalErrorAt();
  }
LABEL_170:
  if (dword_26B429788)
  {
    LODWORD(obj) = 0;
    v819 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v820 = obj;
    v821 = v819;
    if (os_log_type_enabled(v821, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v825 = v820;
    }
    else {
      unsigned int v825 = v820 & 0xFFFFFFFE;
    }
    if (v825)
    {
      v826 = objc_msgSend_description(self, v822, v823, v824);
      v827 = "failed";
      *(_DWORD *)v881 = 136315907;
      *(void *)&v881[4] = "-[DeepFusionProcessor process]";
      __int16 v882 = 2113;
      v883 = v826;
      if (!isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams) {
        v827 = "succeeded";
      }
      __int16 v884 = 2081;
      v885 = v827;
      __int16 v886 = 1026;
      BOOL v887 = isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams == 0;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams) {
    objc_msgSend_waitForIdle(self->_metal, v42, v43, v44);
  }

  for (uint64_t m = 3; m != -1; --m)
  return isSyntheticLongWithRealLong_colorCorrection_espressoModel_noiseEstimationParams_espressoModelForTuning_sideCar_intermediateEncodingParams;
}

- (NSString)description
{
  return (NSString *)@"DeepFusion";
}

- (int)purgeResources
{
  p_lscGainsPlist = &self->_lscGainsPlist;
  lscGainsPlist = self->_lscGainsPlist;
  self->_lscGainsPlist = 0;

  id v4 = p_lscGainsPlist[16];
  p_lscGainsPlist[16] = 0;

  return 0;
}

- (int)resetState
{
  p_nrfSyntheticLongIntermediateMetadataDict = &self->_nrfSyntheticLongIntermediateMetadataDict;
  sensorID = self->_sensorID;
  self->_sensorID = 0;

  uint64_t v5 = p_nrfSyntheticLongIntermediateMetadataDict[13];
  p_nrfSyntheticLongIntermediateMetadataDict[13] = 0;

  uint64_t v6 = p_nrfSyntheticLongIntermediateMetadataDict[14];
  p_nrfSyntheticLongIntermediateMetadataDict[14] = 0;

  int v7 = p_nrfSyntheticLongIntermediateMetadataDict[16];
  p_nrfSyntheticLongIntermediateMetadataDict[16] = 0;

  uint64_t v8 = p_nrfSyntheticLongIntermediateMetadataDict[17];
  p_nrfSyntheticLongIntermediateMetadataDict[17] = 0;

  uint64_t v9 = p_nrfSyntheticLongIntermediateMetadataDict[18];
  p_nrfSyntheticLongIntermediateMetadataDict[18] = 0;

  uint64_t v10 = p_nrfSyntheticLongIntermediateMetadataDict[19];
  p_nrfSyntheticLongIntermediateMetadataDict[19] = 0;

  uint64_t v11 = p_nrfSyntheticLongIntermediateMetadataDict[20];
  p_nrfSyntheticLongIntermediateMetadataDict[20] = 0;

  ev0MetadataDict = self->_ev0MetadataDict;
  self->_ev0MetadataDict = 0;

  bzero(&self->_ev0Metadata, 0x36A70uLL);
  sifrMetadataDict = self->_sifrMetadataDict;
  self->_sifrMetadataDict = 0;

  bzero(&self->_sifrMetadata, 0x36A70uLL);
  longMetadataDict = self->_longMetadataDict;
  self->_longMetadataDict = 0;

  bzero(&self->_longMetadata, 0x36A70uLL);
  uint64_t v15 = *p_nrfSyntheticLongIntermediateMetadataDict;
  *p_nrfSyntheticLongIntermediateMetadataDict = 0;

  uint64_t v16 = p_nrfSyntheticLongIntermediateMetadataDict[1];
  p_nrfSyntheticLongIntermediateMetadataDict[1] = 0;

  uint64_t v17 = p_nrfSyntheticLongIntermediateMetadataDict[2];
  p_nrfSyntheticLongIntermediateMetadataDict[2] = 0;

  int v18 = p_nrfSyntheticLongIntermediateMetadataDict[3];
  p_nrfSyntheticLongIntermediateMetadataDict[3] = 0;

  uint64_t v19 = p_nrfSyntheticLongIntermediateMetadataDict[4];
  p_nrfSyntheticLongIntermediateMetadataDict[4] = 0;

  v20 = p_nrfSyntheticLongIntermediateMetadataDict[21];
  p_nrfSyntheticLongIntermediateMetadataDict[21] = 0;

  objc_msgSend_reset(p_nrfSyntheticLongIntermediateMetadataDict[23], v21, v22, v23);
  uint64_t v24 = p_nrfSyntheticLongIntermediateMetadataDict[5];
  p_nrfSyntheticLongIntermediateMetadataDict[5] = 0;

  uint64_t v28 = objc_msgSend_allocator(self->_metal, v25, v26, v27);
  objc_msgSend_reset(v28, v29, v30, v31);

  uint64_t v35 = objc_msgSend_allocator(self->_metal, v32, v33, v34);
  objc_msgSend_purgeResources_(v35, v36, 0, v37);

  uint64_t v41 = objc_msgSend_allocator(self->_metal, v38, v39, v40);
  objc_msgSend_purgeResources_(v41, v42, 1, v43);

  uint64_t v47 = objc_msgSend_allocator(self->_metal, v44, v45, v46);
  objc_msgSend_purgeResources_(v47, v48, 2, v49);

  return 0;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (IBPDeepFusionOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (IBPDeepFusionProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IBPDeepFusionProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)processingMode
{
  return self->_processingMode;
}

- (void)setProcessingMode:(int)a3
{
  self->_processingMode = a3;
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return self->_semanticStyleProperties;
}

- (void)setSemanticStyleProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_copyTextureKernel, 0);
  objc_storeStrong((id *)&self->_colorConvertStage, 0);
  objc_storeStrong((id *)&self->_ColorCubeCorrectionStage, 0);
  objc_storeStrong((id *)&self->_syntheticLongStage, 0);
  objc_storeStrong((id *)&self->_outliersRemovalStage, 0);
  objc_storeStrong((id *)&self->_ambnrStage, 0);
  objc_storeStrong((id *)&self->_preEspressoStage, 0);
  objc_storeStrong((id *)&self->_tiledFusionStage, 0);
  objc_storeStrong((id *)&self->_regDense, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_semanticStylesStage, 0);
  objc_storeStrong((id *)&self->_toneMappingStage, 0);
  objc_storeStrong((id *)&self->_toneMappingCurves, 0);
  objc_storeStrong((id *)&self->_inferenceResults, 0);
  objc_storeStrong((id *)&self->_longRealLongFusionMapTex, 0);
  objc_storeStrong((id *)&self->_longFusionMapTex, 0);
  objc_storeStrong((id *)&self->_referenceFusionMapTex, 0);
  objc_storeStrong((id *)&self->_longChromaTex, 0);
  objc_storeStrong((id *)&self->_longLumaTex, 0);
  objc_storeStrong((id *)&self->_referenceChromaTex, 0);
  objc_storeStrong((id *)&self->_referenceLumaTex, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_nrfRegisteredBracketCount, 0);
  objc_storeStrong((id *)&self->_nrfInputBracketCount, 0);
  objc_storeStrong((id *)&self->_nrfStatus, 0);
  objc_storeStrong((id *)&self->_nrfInfoDict, 0);
  objc_storeStrong((id *)&self->_nrfSyntheticLongIntermediateMetadataDict, 0);
  objc_storeStrong((id *)&self->_longMetadataDict, 0);
  objc_storeStrong((id *)&self->_sifrMetadataDict, 0);
  objc_storeStrong((id *)&self->_ev0MetadataDict, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_sensorID, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_tuningParams, 0);
}

- (int)getTuning:(id)a3
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (NSMutableDictionary *)objc_opt_new();
  tuningParams = self->_tuningParams;
  v122 = self;
  self->_tuningParams = v5;

  v128 = v4;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"DefaultSensorIDs", v8);
  uint64_t v10 = v9;
  if (v9)
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v120 = v9;
    id v11 = v9;
    uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v130, (uint64_t)v135, 16);
    if (v124)
    {
      uint64_t v123 = *(void *)v131;
      uint64_t v15 = @"DefaultParameters";
      id v121 = v11;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v131 != v123) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v130 + 1) + 8 * v16);
          int v18 = objc_msgSend_objectForKeyedSubscript_(v11, v13, v17, v14, v117, v118);
          v21 = objc_msgSend_objectForKeyedSubscript_(v128, v19, v17, v20);
          uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v18, v23);
          uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"DeepFusionParameters", v26);

          if (!v27) {
            goto LABEL_29;
          }
          uint64_t v129 = (uint64_t)v18;
          id v28 = v11;
          uint64_t v29 = objc_opt_new();
          uint64_t v30 = objc_opt_new();
          uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v27, v31, @"ToneMapping", v32);
          int v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v15, v35);
          int Plist = objc_msgSend_readPlist_(v30, v37, (uint64_t)v36, v38);

          if (Plist)
          {
            FigDebugAssert3();
            FigSignalErrorAt();

            id v11 = v28;
            int v18 = (void *)v129;
LABEL_40:

            int v115 = -1;
            goto LABEL_41;
          }
          uint64_t v127 = v30;
          objc_storeStrong((id *)(v29 + 8), v30);
          uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v27, v40, @"SemanticStyles", v41);
          uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)v15, v44);

          if (v45)
          {
            uint64_t v46 = objc_opt_new();
            uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v27, v47, @"SemanticStyles", v48);
            uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)v15, v51);
            int v55 = objc_msgSend_readPlist_(v46, v53, (uint64_t)v52, v54);

            if (v55)
            {
              uint64_t v118 = v119;
              LODWORD(v117) = v55;
              FigDebugAssert3();
              FigSignalErrorAt();
              int v56 = 4;
              uint64_t v57 = v127;
              id v11 = v28;
              goto LABEL_28;
            }
          }
          else
          {
            uint64_t v46 = 0;
          }
          v126 = v46;
          objc_storeStrong((id *)(v29 + 16), v46);
          uint64_t v58 = objc_opt_new();
          uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v27, v59, @"NoiseModel", v60);
          objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v15, v63);
          v65 = uint64_t v64 = (uint64_t)v15;
          int v68 = objc_msgSend_readPlist_(v58, v66, (uint64_t)v65, v67);

          v125 = v58;
          if (v68)
          {
            uint64_t v118 = v119;
            LODWORD(v117) = v68;
            FigDebugAssert3();
            FigSignalErrorAt();
            int v56 = 4;
            uint64_t v15 = (__CFString *)v64;
            uint64_t v46 = v126;
            uint64_t v57 = v127;
            goto LABEL_27;
          }
          objc_storeStrong((id *)(v29 + 32), v58);
          uint64_t v69 = objc_opt_new();
          v72 = objc_msgSend_objectForKeyedSubscript_(v27, v70, @"DenoiseAndSharpening", v71);
          uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v72, v73, v64, v74);
          int v78 = objc_msgSend_readPlist_(v69, v76, (uint64_t)v75, v77);

          if (v78)
          {
            uint64_t v118 = v119;
            LODWORD(v117) = v78;
            FigDebugAssert3();
            FigSignalErrorAt();
            int v56 = 4;
            id v28 = v121;
            goto LABEL_26;
          }
          objc_storeStrong((id *)(v29 + 40), v69);
          uint64_t v79 = objc_opt_new();
          uint64_t v82 = objc_msgSend_objectForKeyedSubscript_(v27, v80, @"DeferredProcessing", v81);
          int v85 = objc_msgSend_readPlist_(v79, v83, (uint64_t)v82, v84);

          if (v85)
          {
            uint64_t v118 = v119;
            LODWORD(v117) = v85;
            FigDebugAssert3();
            FigSignalErrorAt();
            int v56 = 4;
            goto LABEL_25;
          }
          objc_storeStrong((id *)(v29 + 48), v79);
          uint64_t v88 = objc_msgSend_objectForKeyedSubscript_(v128, v86, v17, v87);
          uint64_t v91 = objc_msgSend_objectForKeyedSubscript_(v88, v89, v129, v90);
          uint64_t v94 = objc_msgSend_objectForKeyedSubscript_(v91, v92, @"ChromaticDefringing", v93);

          if (!v94) {
            goto LABEL_20;
          }
          v97 = [VideoDefringingTuningParameters alloc];
          uint64_t v100 = objc_msgSend_initWithTuningParameters_(v97, v98, (uint64_t)v94, v99);
          uint64_t v103 = v100;
          if (v100)
          {
            int v104 = objc_msgSend_selectParametersForTuningMode_(v100, v101, 0, v102);
            if (!v104)
            {
              int v105 = *(void **)(v29 + 56);
              *(void *)(v29 + 56) = v103;

LABEL_20:
              uint64_t v106 = v122->_tuningParams;
              unsigned int v134 = 0;
              uint64_t v107 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v95, v129, v96);
              int v110 = objc_msgSend_scanHexInt_(v107, v108, (uint64_t)&v134, v109);

              if (v110)
              {
                uint64_t v103 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v111, v134, v112);
                objc_msgSend_setObject_forKeyedSubscript_(v106, v113, v29, (uint64_t)v103);
              }
              else
              {
                uint64_t v103 = 0;
                objc_msgSend_setObject_forKeyedSubscript_(v106, v111, v29, 0);
              }
              int v56 = 0;
              goto LABEL_24;
            }
            uint64_t v118 = v119;
            LODWORD(v117) = v104;
          }
          else
          {
            uint64_t v118 = v119;
            LODWORD(v117) = 0;
          }
          FigDebugAssert3();
          int v56 = 4;
LABEL_24:

LABEL_25:
          id v28 = v121;

LABEL_26:
          uint64_t v15 = @"DefaultParameters";
          uint64_t v46 = v126;
          uint64_t v57 = v127;

LABEL_27:
          id v11 = v28;

LABEL_28:
          int v18 = (void *)v129;

          if (v56) {
            goto LABEL_40;
          }
LABEL_29:

          ++v16;
        }
        while (v124 != v16);
        uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v130, (uint64_t)v135, 16);
        uint64_t v124 = v114;
      }
      while (v114);
    }

    int v115 = 0;
LABEL_41:
    uint64_t v10 = v120;
  }
  else
  {
    FigDebugAssert3();
    int v115 = -1;
    FigSignalErrorAt();
  }

  return v115;
}

@end