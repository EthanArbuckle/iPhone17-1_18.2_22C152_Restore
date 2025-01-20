@interface H13FastRawScaleStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (BOOL)shouldCopySashimiToAuxiliary:(id)a3;
- (BOOL)shouldRunFPExtract:(id)a3;
- (FigMetalContext)metal;
- (H13FastRawScaleShaders)shaders;
- (H13FastRawScaleStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediate1DMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 length:(unint64_t)a5;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)_extractFocusPixelsForAuxType:(int)a3 config:(id)a4 inputTexture:(id)a5 arguments:(id)a6;
- (int)copySashimiTextureToAuxiliaryWithConfig:(id)a3 inputTexture:(id)a4;
- (int)getConfigFromInputFrame:(id)a3 config:(VisionParams *)a4;
- (int)preparePixelBuffer:(__CVBuffer *)a3 forRegion:(id)a4 ofImage:(id)a5 withOutputFrame:(id)a6 config:(VisionParams *)a7;
- (int)requestPixelBuffer:(__CVBuffer *)a3 forRegion:(id)a4 fromOutputFrame:(id)a5;
- (int)runABLESTWithConfig:(id *)a3 inOutTexture:(id)a4;
- (int)runFPExtractWithConfig:(id)a3 inputTexture:(id)a4;
- (int)runFaceDetectionOnPixelBuffer:(__CVBuffer *)a3 withMetadataToUpdate:(id)a4 config:(VisionParams *)a5 pts:(id *)a6;
- (int)runPDCWithArgs:(id)a3 inputTex:(id)a4 outputTex:(id)a5;
- (int)runQuadraPDCWithArgs:(id)a3 inputTex:(id *)a4 outputTex:(id *)a5;
- (int)runSyntheticThumbnailWithSensorDecodedTexture:(id)a3 thumbnailTexture:(id)a4 syntheticThumbnailConfig:(const SyntheticThumbnailConfig *)a5 processFocusPixelsConfig:(id *)a6 quadraFPGrid:(unsigned __int8)a7 isQuadra:;
- (int)runVisionWithArgs:(id)a3 inputTex:(id)a4 metadataToUpdate:(id)a5;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13FastRawScaleStage

- (H13FastRawScaleStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)H13FastRawScaleStage;
  v9 = [(H13FastRawScaleStage *)&v25 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v9->_metal, a3);
  if (!v8) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v10->_staticParameters, a4);
  v11 = [[H13FastRawScaleShaders alloc] initWithMetalContext:v7];
  shaders = v10->_shaders;
  v10->_shaders = v11;

  if (!v10->_shaders) {
    goto LABEL_12;
  }
  v13 = [(FigMetalContext *)v10->_metal device];
  uint64_t v14 = [v13 newBufferWithLength:512 options:0];
  _8to12ExpansionLUT = v10->_8to12ExpansionLUT;
  v10->_8to12ExpansionLUT = (MTLBuffer *)v14;

  v16 = v10->_8to12ExpansionLUT;
  if (!v16) {
    goto LABEL_12;
  }
  if (decompand8To12To10ToU16([(MTLBuffer *)v16 contents])) {
    goto LABEL_12;
  }
  v17 = [(FigMetalContext *)v10->_metal device];
  uint64_t v18 = [v17 newBufferWithLength:512 options:0];
  _8to10ExpansionLUT = v10->_8to10ExpansionLUT;
  v10->_8to10ExpansionLUT = (MTLBuffer *)v18;

  v20 = v10->_8to10ExpansionLUT;
  if (!v20) {
    goto LABEL_12;
  }
  if (!decompand8To10ToU16([(MTLBuffer *)v20 contents])
    && (v10->_outputDownscaleFactor = 1,
        v21 = [[ChromaticAberrationRecovery alloc] initWithMetalContext:v7], car = v10->_car, v10->_car = v21, car, v10->_car))
  {
    v23 = v10;
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    v23 = 0;
  }

  return v23;
}

- (int)runSyntheticThumbnailWithSensorDecodedTexture:(id)a3 thumbnailTexture:(id)a4 syntheticThumbnailConfig:(const SyntheticThumbnailConfig *)a5 processFocusPixelsConfig:(id *)a6 quadraFPGrid:(unsigned __int8)a7 isQuadra:
{
  int v8 = v7;
  uint64_t v9 = a7;
  id v30 = a3;
  id v14 = a4;
  v15 = [(H13FastRawScaleStage *)self metal];
  v16 = [(H13FastRawScaleStage *)self shaders];
  v17 = [v15 commandBuffer];
  uint64_t v18 = v17;
  if (v8)
  {
    if (!v17) {
      goto LABEL_16;
    }
  }
  else if (!v17)
  {
LABEL_16:
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
    v20 = 0;
    goto LABEL_17;
  }
  v19 = [v17 computeCommandEncoder];
  v20 = v19;
  if (!v19)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
LABEL_17:
    v22 = 0;
    goto LABEL_14;
  }
  [v19 setTexture:v30 atIndex:0];
  [v20 setTexture:v14 atIndex:1];
  [v20 setBytes:a5 length:64 atIndex:0];
  if (v8)
  {
    v21 = [v16 generateSyntheticThumbnailQuadra];
    [v20 setComputePipelineState:v21];

    [v20 setBytes:v9 length:112 atIndex:2];
    v22 = 0;
  }
  else
  {
    v23 = [v16 generateSyntheticThumbnail];
    [v20 setComputePipelineState:v23];

    [v20 setBytes:a6 length:552 atIndex:1];
    size_t v24 = a6[1].var0 * (unint64_t)*(&a6[1].var0 + 1);
    objc_super v25 = malloc_type_malloc(v24, 0xC4DE58AAuLL);
    v22 = v25;
    if (!v25)
    {
      FigDebugAssert3();
      int v28 = -73720;
      goto LABEL_14;
    }
    bzero(v25, v24);
    if (a6[1].var2.var2)
    {
      unint64_t v26 = 0;
      v27 = &a6[2].var0 + 1;
      do
      {
        v22[*(v27 - 1) + a6[1].var0 * (unint64_t)*v27] = 1;
        ++v26;
        v27 += 2;
      }
      while (v26 < a6[1].var2.var2);
    }
    [v20 setBytes:v22 length:v24 atIndex:3];
  }
  v33[0] = (unint64_t)([v14 width] + 1) >> 1;
  v33[1] = (unint64_t)([v14 height] + 1) >> 1;
  v33[2] = 1;
  int64x2_t v31 = vdupq_n_s64(0x10uLL);
  uint64_t v32 = 1;
  [v20 dispatchThreads:v33 threadsPerThreadgroup:&v31];
  [v20 endEncoding];
  [v15 commit];
  int v28 = 0;
LABEL_14:
  free(v22);

  return v28;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 1651926376;
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  if (a3 == 2) {
    return 875704422;
  }
  BOOL v7 = isRecognizedFPAuxType(*(uint64_t *)&a3);
  if (a3 == 3 || v7) {
    return 1278226536;
  }
  else {
    return 0;
  }
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  v38 = self;
  uint64_t v68 = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    uint64_t v7 = 3024;
    unsigned int v6 = 4224;
  }
  else if (a3 == 2)
  {
    unsigned int v6 = a5 >> 3;
    uint64_t v7 = a6 >> 3;
  }
  else if (isRecognizedFPAuxType(*(uint64_t *)&a3))
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    -[RawNightModeInputFrame pixelBuffer]((uint64_t)v38->_staticParameters);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v41)
    {
      uint64_t v51 = 0;
      unsigned int v6 = 0;
      uint64_t v40 = *(void *)v62;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v62 != v40)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            uint64_t v8 = v9;
          }
          uint64_t v42 = v8;
          v10 = *(void **)(*((void *)&v61 + 1) + 8 * v8);
          if (objc_msgSend(v10, "hasPrefix:", @"PortType", v38))
          {
            v11 = -[RawNightModeInputFrame pixelBuffer]((uint64_t)v38->_staticParameters);
            v12 = [v11 objectForKeyedSubscript:v10];

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v58;
              uint64_t v43 = *(void *)v58;
              id v44 = v13;
              do
              {
                uint64_t v17 = 0;
                uint64_t v45 = v15;
                do
                {
                  if (*(void *)v58 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  v50 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * v17)];
                  uint64_t v18 = [v50 objectForKeyedSubscript:@"ModuleConfig"];
                  if (v18)
                  {
                    id v49 = v18;
                    v19 = [v18 objectForKeyedSubscript:@"FocusPixels"];
                    if (v19)
                    {
                      id v48 = v19;
                      v20 = [v19 objectForKeyedSubscript:@"Layout"];
                      if (v20)
                      {
                        id v47 = v20;
                        v21 = [v20 objectForKeyedSubscript:@"Patterns"];
                        v22 = v21;
                        if (v21 && [v21 count] && (unint64_t)objc_msgSend(v22, "count") <= 0x10)
                        {
                          uint64_t v46 = v17;
                          long long v55 = 0u;
                          long long v56 = 0u;
                          long long v53 = 0u;
                          long long v54 = 0u;
                          id v23 = v22;
                          uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
                          if (v24)
                          {
                            uint64_t v25 = v24;
                            uint64_t v26 = *(void *)v54;
                            do
                            {
                              for (uint64_t i = 0; i != v25; ++i)
                              {
                                if (*(void *)v54 != v26) {
                                  objc_enumerationMutation(v23);
                                }
                                int v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                                v29 = [v28 objectForKeyedSubscript:@"X"];
                                if (v29)
                                {
                                  id v30 = [v28 objectForKeyedSubscript:@"Y"];
                                  if (v30)
                                  {
                                    char v52 = 0;
                                    unsigned int v31 = objc_msgSend(v29, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Count", 0, &v52);
                                    if (v52)
                                    {
                                      unsigned int v32 = v31;
                                      unsigned int v33 = objc_msgSend(v30, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Count", 0, &v52);
                                      if (v6 <= v32) {
                                        unsigned int v34 = v32;
                                      }
                                      else {
                                        unsigned int v34 = v6;
                                      }
                                      if (v51 <= v33) {
                                        unsigned int v35 = v33;
                                      }
                                      else {
                                        unsigned int v35 = v51;
                                      }
                                      if (v52) {
                                        uint64_t v36 = v35;
                                      }
                                      else {
                                        uint64_t v36 = v51;
                                      }
                                      uint64_t v51 = v36;
                                      if (v52) {
                                        unsigned int v6 = v34;
                                      }
                                    }
                                  }
                                }
                              }
                              uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
                            }
                            while (v25);
                          }

                          uint64_t v16 = v43;
                          id v13 = v44;
                          uint64_t v15 = v45;
                          uint64_t v17 = v46;
                        }

                        v20 = v47;
                      }

                      v19 = v48;
                    }

                    uint64_t v18 = v49;
                  }

                  ++v17;
                }
                while (v17 != v15);
                uint64_t v15 = [v13 countByEnumeratingWithState:&v57 objects:v66 count:16];
              }
              while (v15);
            }
          }
          uint64_t v8 = v42 + 1;
        }
        while (v42 + 1 != v41);
        uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v41);
    }
    else
    {
      uint64_t v51 = 0;
      unsigned int v6 = 0;
    }

    uint64_t v7 = v51;
  }
  else
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
  }
  return ($F61E096109CF133FD2477F48C7D0CEE7)(v6 | (unint64_t)(v7 << 32));
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = -[H13FastRawScaleStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    uint64_t v8 = [[H13FastRawScaleConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
  }
  else
  {
    FigDebugAssert3();
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  int v5 = v4 * ((unint64_t)[v3 maximumOutputDimensions] >> 32);

  return (6 * v5);
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6) {
    int v8 = 0;
  }
  else {
    int v8 = FigSignalErrorAt();
  }

  return v8;
}

- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[H13FastRawScaleStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  id v13 = [v11 desc];
  [v13 setWidth:a5];

  uint64_t v14 = [v11 desc];
  [v14 setHeight:a6];

  uint64_t v15 = [v11 desc];
  [v15 setUsage:3];

  uint64_t v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  uint64_t v17 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)createIntermediate1DMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 length:(unint64_t)a5
{
  int v8 = [(FigMetalContext *)self->_metal allocator];
  id v9 = (void *)[v8 newTextureDescriptor];

  if (!v9) {
    goto LABEL_6;
  }
  id v10 = [v9 desc];
  [v10 setTextureType:0];

  id v11 = [v9 desc];
  [v11 setWidth:a5];

  id v12 = [v9 desc];
  [v12 setUsage:3];

  id v13 = [v9 desc];
  [v13 setPixelFormat:a4];

  [v9 setLabel:0];
  uint64_t v14 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v15 = (void *)[v14 newTextureWithDescriptor:v9];

  if (!v15)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v15 = 0;
  }

  return v15;
}

- (int)runWithArgs:(id)a3
{
  v186[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v184 = 0;
  id location = 0;
  id v183 = 0;
  bzero(v170, 0x240uLL);
  long long v169 = 0u;
  memset(v168, 0, sizeof(v168));
  objc_opt_class();
  v132 = v5;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v24 = FigSignalErrorAt();
    id v47 = 0;
    v135 = 0;
    v136 = 0;
    v138 = 0;
    uint64_t v16 = 0;
    uint64_t v7 = 0;
    v130 = 0;
    v131 = 0;
    id v6 = 0;
    goto LABEL_74;
  }
  id v6 = v5;
  uint64_t v7 = [v6 inputFrame];

  if (!v7 || ([v6 bounds], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    int v24 = FigSignalErrorAt();
    id v47 = 0;
    v136 = 0;
    v138 = 0;
LABEL_81:
    uint64_t v16 = 0;
LABEL_90:
    v135 = 0;
    v130 = 0;
    v131 = 0;
    goto LABEL_74;
  }
  int v8 = [v6 bounds];
  uint64_t v9 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
  unint64_t v11 = v10;

  id v12 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v24 = FigSignalErrorAt();
    id v47 = 0;
    v136 = 0;
    v138 = 0;
    uint64_t v16 = 0;
LABEL_89:
    uint64_t v7 = 0;
    goto LABEL_90;
  }
  v138 = [v6 config];
  uint64_t v7 = [v6 inputTex];

  if (!v7 || ([v6 outputFrame], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    int v24 = FigSignalErrorAt();
    id v47 = 0;
    v136 = 0;
    goto LABEL_81;
  }
  uint64_t v14 = [v6 outputFrame];
  uint64_t v15 = [v14 metadata];
  uint64_t v16 = (void *)[v15 mutableCopy];

  if (!v16)
  {
    int v24 = FigSignalErrorAt();
LABEL_88:
    id v47 = 0;
    v136 = 0;
    goto LABEL_89;
  }
  staticParameters = self->_staticParameters;
  uint64_t v18 = [v6 inputFrame];
  v19 = -[SoftISPInputFrame metadata]((uint64_t)v18);
  uint64_t v20 = [(SoftISPStaticParameters *)staticParameters dimensionsForSensorInMetadata:v19];
  v21 = [v6 inputFrame];
  unsigned int v22 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v21);

  id v23 = [v6 inputFrame];
  int v24 = [v138 getDMAInputConfigForInputFrame:v23 dmaInputConfig:v170];

  if (v24)
  {
    uint64_t v125 = v3;
    LODWORD(v124) = v24;
LABEL_87:
    FigDebugAssert3();
    goto LABEL_88;
  }
  uint64_t v25 = [v6 inputFrame];
  int v24 = [v138 getShadingFPNRConfigForInputFrame:v25 shadingFPNRConfig:v171];

  if (v24)
  {
    uint64_t v125 = v3;
    LODWORD(v124) = v24;
    goto LABEL_87;
  }
  uint64_t v133 = v20;
  uint64_t v126 = v9;
  v137 = v16;
  LODWORD(v26) = v175;
  v27 = [NSNumber numberWithFloat:v26];
  v186[0] = v27;
  LODWORD(v28) = v176;
  v29 = [NSNumber numberWithFloat:v28];
  v186[1] = v29;
  LODWORD(v30) = v177;
  unsigned int v31 = [NSNumber numberWithFloat:v30];
  v186[2] = v31;
  LODWORD(v32) = v178;
  unsigned int v33 = [NSNumber numberWithFloat:v32];
  v186[3] = v33;
  unsigned int v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:4];
  [v16 setObject:v34 forKeyedSubscript:*MEMORY[0x263F2F1C8]];

  unsigned int v35 = [NSNumber numberWithBool:v171[0]];
  [v16 setObject:v35 forKeyedSubscript:*MEMORY[0x263F2EFC0]];

  LODWORD(v36) = v172;
  v37 = [NSNumber numberWithFloat:v36];
  [v16 setObject:v37 forKeyedSubscript:*MEMORY[0x263F2EFD8]];

  LODWORD(v38) = v173;
  v39 = [NSNumber numberWithFloat:v38];
  [v16 setObject:v39 forKeyedSubscript:*MEMORY[0x263F2EFE0]];

  uint64_t v40 = [NSNumber numberWithInt:v174];
  [v16 setObject:v40 forKeyedSubscript:*MEMORY[0x263F2EFC8]];

  LODWORD(v41) = v179;
  uint64_t v42 = [NSNumber numberWithFloat:v41];
  [v16 setObject:v42 forKeyedSubscript:*MEMORY[0x263F2EFD0]];

  uint64_t v43 = [v6 inputFrame];
  int v24 = [v138 getBlackLevelShadingConfigForInputFrame:v43 blackLevelShadingConfig:v181];

  if (v24)
  {
    uint64_t v125 = v3;
    LODWORD(v124) = v24;
    goto LABEL_87;
  }
  id v44 = [v6 inputFrame];
  int v24 = [v138 getRFPNConfigForInputFrame:v44 rFPNConfig:&v182];

  if (v24)
  {
    uint64_t v125 = v3;
    LODWORD(v124) = v24;
    goto LABEL_87;
  }
  if (!v171[0])
  {
    uint64_t v46 = 0;
    goto LABEL_17;
  }
  uint64_t v45 = [v6 inputFrame];
  uint64_t v46 = [v138 getShadingFPNCorrectionTextureForInputFrame:v45];

  if (!v46 || [v46 pixelFormat] == 30)
  {
LABEL_17:
    v131 = v46;
    if (v181[0]
      && ([v6 inputFrame],
          id v48 = objc_claimAutoreleasedReturnValue(),
          [v138 getBlackLevelShadingCorrectionTextureForInputFrame:v48],
          id v49 = objc_claimAutoreleasedReturnValue(),
          v48,
          v49))
    {
      v130 = v49;
      if ([v49 pixelFormat] != 10) {
        goto LABEL_92;
      }
    }
    else
    {
      v130 = 0;
    }
    v50 = [v6 inputFrame];
    uint64_t v51 = [v6 bounds];
    int v24 = [v138 getPDPConfigForInputFrame:v50 bounds:v51 pdpConfig:v180];

    if (v24)
    {
      uint64_t v125 = v3;
      LODWORD(v124) = v24;
      FigDebugAssert3();
LABEL_93:
      id v47 = 0;
      v136 = 0;
LABEL_111:
      uint64_t v7 = 0;
      v135 = 0;
      goto LABEL_74;
    }
    char v52 = objc_alloc_init(H13FastRawScalePDCArgs);
    if (!v52)
    {
LABEL_92:
      uint64_t v125 = v3;
      LODWORD(v124) = 0;
      FigDebugAssert3();
      int v24 = FigSignalErrorAt();
      goto LABEL_93;
    }
    long long v53 = v52;
    long long v54 = [v6 inputFrame];
    long long v55 = [v6 outputFrame];
    long long v56 = [v6 bounds];
    v136 = (int32x4_t *)v53;
    int v24 = [v138 configurePDCArgs:v53 forInputFrame:v54 forOutputFrame:v55 bounds:v56 metalCtx:self->_metal pdpConfig:v180];

    if (v24)
    {
      uint64_t v125 = v3;
      LODWORD(v124) = v24;
      FigDebugAssert3();
      goto LABEL_110;
    }
    if (!v180[320])
    {
LABEL_30:
      long long v62 = [(H13FastRawScaleStage *)self createIntermediateMetalTexture:@"scaledLinearOutputTex" pixelFormat:25 width:v11 height:HIDWORD(v11)];
      id v63 = location;
      id location = v62;

      if (location)
      {
        long long v64 = [v6 inputFrame];
        BOOL v65 = [(H13FastRawScaleStage *)self shouldRunFPExtract:v64];

        v66 = [v6 inputFrame];
        BOOL v67 = [(H13FastRawScaleStage *)self shouldCopySashimiToAuxiliary:v66];

        uint64_t v68 = [(FigMetalContext *)self->_metal commandBuffer];
        if (v68)
        {
          BOOL v128 = v65;
          v135 = v68;
          uint64_t v69 = [v68 computeCommandEncoder];
          if (!v69) {
            goto LABEL_101;
          }
          v70 = (void *)v69;
          BOOL v127 = v67;
          v71.i32[0] = v133 / v22;
          v71.i32[1] = HIDWORD(v133) / v22;
          uint32x2_t v129 = v71;
          v72 = [v6 inputFrame];
          int v134 = -[SoftISPInputFrame cfaLayout]((uint64_t)v72);

          memset(v167, 0, sizeof(v167));
          char v166 = 0;
          v73 = [v6 bounds];
          uint64_t v74 = -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v73);
          v75 = [v6 bounds];
          uint64_t v76 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v75);
          fillSensorRawDecodeConfig((uint64_t)v167, &v166, (uint64_t)v170, v136 + 2, v134 == 3, *(double *)&v74, v129, *(double *)&v76);

          v77 = [(H13FastRawScaleShaders *)self->_shaders sensorRawDecode];
          [v70 setComputePipelineState:v77];

          v78 = [v6 inputTex];
          [v70 setTexture:v78 atIndex:0];

          [v70 setTexture:location atIndex:1];
          [v70 setTexture:v131 atIndex:2];
          [v70 setTexture:v130 atIndex:3];
          [v70 setBytes:v167 length:176 atIndex:0];
          [v70 setBytes:&v166 length:1 atIndex:1];
          uint64_t v79 = 8;
          if (v170[1]) {
            uint64_t v79 = 16;
          }
          [v70 setBuffer:*(Class *)((char *)&self->super.isa + v79) offset:0 atIndex:2];
          v165[0] = v11 >> 1;
          v165[1] = v11 >> 33;
          v165[2] = 1;
          int64x2_t v163 = vdupq_n_s64(0x10uLL);
          uint64_t v164 = 1;
          [v70 dispatchThreads:v165 threadsPerThreadgroup:&v163];
          [v70 endEncoding];

          v80 = [v6 inputFrame];
          unsigned __int16 v81 = -[SoftISPInputFrame frameID]((uint64_t)v80) >> 16;

          if (*MEMORY[0x263F00E10])
          {
            int v82 = v81;
            v83 = [v135 commandQueue];
            v84 = [v83 commandBuffer];

            [v84 setLabel:@"KTRACE_MTLCMDBUF"];
            v161[0] = MEMORY[0x263EF8330];
            v161[1] = 3221225472;
            v161[2] = __36__H13FastRawScaleStage_runWithArgs___block_invoke;
            v161[3] = &__block_descriptor_52_e28_v16__0___MTLCommandBuffer__8l;
            v161[4] = v126;
            v161[5] = v11;
            int v162 = v82;
            [v84 addCompletedHandler:v161];
            [v84 commit];
            v159[0] = MEMORY[0x263EF8330];
            v159[1] = 3221225472;
            v159[2] = __36__H13FastRawScaleStage_runWithArgs___block_invoke_2;
            v159[3] = &__block_descriptor_52_e28_v16__0___MTLCommandBuffer__8l;
            v159[4] = v126;
            v159[5] = v11;
            int v160 = v82;
            [v135 addCompletedHandler:v159];
          }
          [(FigMetalContext *)self->_metal commit];
          char v158 = 0;
          v85 = [v6 inputFrame];
          int v24 = [v138 getBlackLevelEstimationEnabledForInputFrame:v85 enabled:&v158];

          if (v24)
          {
            uint64_t v125 = v3;
            LODWORD(v124) = v24;
          }
          else
          {
            char v157 = 0;
            v86 = [v6 inputFrame];
            int v24 = [v138 getABLESTEnabledForInputFrame:v86 enabled:&v157];

            if (!v24)
            {
              if (!v158 || !v157)
              {
                if (!v158)
                {
                  uint64_t v7 = 0;
                  if (!v157) {
                    goto LABEL_54;
                  }
                  goto LABEL_51;
                }
                shaders = self->_shaders;
                if (v134 == 3) {
                  [(H13FastRawScaleShaders *)shaders blackLevelEstimationQuadra];
                }
                else {
                v88 = [(H13FastRawScaleShaders *)shaders blackLevelEstimation];
                }
                *(void *)&long long v145 = 0;
                long long v143 = 0u;
                long long v144 = 0u;
                long long v141 = 0u;
                long long v142 = 0u;
                long long v139 = 0u;
                long long v140 = 0u;
                v89 = [v6 inputFrame];
                int v24 = [v138 getBlackLevelEstimationConfigForInputFrame:v89 pdpConfig:v180 blackLevelEstimationConfig:&v139];

                if (v24)
                {
                  uint64_t v125 = v3;
                  LODWORD(v124) = v24;
                  FigDebugAssert3();
                }
                else
                {
                  v90 = [(FigMetalContext *)self->_metal device];
                  v91 = (void *)[v90 newBufferWithLength:8 options:0];

                  id v92 = v91;
                  *(void *)[v92 contents] = 0;
                  v93 = [(FigMetalContext *)self->_metal commandBuffer];

                  if (v93)
                  {
                    v94 = [v93 computeCommandEncoder];
                    if (v94)
                    {
                      uint64_t v7 = v94;
                      [v94 setComputePipelineState:v88];
                      [v7 setTexture:location atIndex:0];
                      [v7 setBytes:&v139 length:104 atIndex:0];
                      [v7 setBuffer:v92 offset:0 atIndex:1];
                      v156[0] = (unsigned __int16)v144;
                      v156[1] = WORD1(v144);
                      v156[2] = 1;
                      int64x2_t v154 = vdupq_n_s64(0x10uLL);
                      uint64_t v155 = 1;
                      [v7 dispatchThreads:v156 threadsPerThreadgroup:&v154];
                      v95 = [(H13FastRawScaleShaders *)self->_shaders blackLevelCorrection];
                      [v7 setComputePipelineState:v95];

                      [v7 setImageblockWidth:32 height:32];
                      uint64_t v96 = [location width];
                      uint64_t v97 = [location height];
                      v153[0] = v96;
                      v153[1] = v97;
                      v153[2] = 1;
                      int64x2_t v151 = vdupq_n_s64(0x20uLL);
                      uint64_t v152 = 1;
                      [v7 dispatchThreads:v153 threadsPerThreadgroup:&v151];
                      [v7 endEncoding];

                      v135 = v93;
                      if (!v157) {
                        goto LABEL_54;
                      }
LABEL_51:
                      if (v134 != 3)
                      {
                        long long v147 = 0u;
                        memset(v148, 0, 28);
                        long long v145 = 0u;
                        long long v146 = 0u;
                        long long v143 = 0u;
                        long long v144 = 0u;
                        long long v141 = 0u;
                        long long v142 = 0u;
                        long long v139 = 0u;
                        long long v140 = 0u;
                        v98 = [v6 inputFrame];
                        int v24 = [v138 getABLESTConfigForInputFrame:v98 pdpConfig:v180 ablestConfig:&v139];

                        if (v24)
                        {
                          uint64_t v125 = v3;
                          LODWORD(v124) = v24;
                          goto LABEL_119;
                        }
                        int v99 = [(H13FastRawScaleStage *)self runABLESTWithConfig:&v139 inOutTexture:location];
                        if (v99)
                        {
                          int v24 = v99;
                          uint64_t v125 = v3;
                          LODWORD(v124) = v99;
                          goto LABEL_119;
                        }
                      }
LABEL_54:
                      [v6 setInputTex:0];
                      int v100 = [(H13FastRawScaleStage *)self runVisionWithArgs:v6 inputTex:location metadataToUpdate:v16];
                      if (v100)
                      {
                        int v24 = v100;
                        uint64_t v125 = v3;
                        LODWORD(v124) = v100;
                      }
                      else
                      {
                        v101 = [v6 inputFrame];
                        v102 = [v6 bounds];
                        int v24 = [v138 getSyntheticThumbnailConfigForInputFrame:v101 bounds:v102 syntheticThumbnailConfig:v168];

                        if (!v24)
                        {
                          v103 = [v6 inputFrame];
                          id v47 = -[SoftISPInputFrame processingOptions]((uint64_t)v103);

                          int v104 = objc_msgSend(v47, "cmi_BOOLValueForKey:defaultValue:found:", @"SFHR", 0, 0);
                          if (BYTE12(v169) && v104)
                          {
                            unint64_t v105 = HIDWORD(v11);
                            v106 = [(H13FastRawScaleStage *)self createIntermediateMetalTexture:@"h13f.syntheticThumbnail" pixelFormat:23 width:v11 / WORD6(v168[0]) height:HIDWORD(v11) / HIWORD(v168[0])];
                            id v183 = v106;
                            if (!v106)
                            {
                              uint64_t v125 = v3;
                              LODWORD(v124) = 0;
                              goto LABEL_121;
                            }
                            v107 = v106;
                            int v108 = [(H13FastRawScaleStage *)self runSyntheticThumbnailWithSensorDecodedTexture:location thumbnailTexture:v106 syntheticThumbnailConfig:v168 processFocusPixelsConfig:&v136[83].u64[1] quadraFPGrid:&v136[158] isQuadra:v136[165].i32[0] != 0];
                            if (v108)
                            {
                              int v24 = v108;
                              uint64_t v125 = v3;
                              LODWORD(v124) = v108;
                              goto LABEL_128;
                            }
                            [v6 setOutputSyntheticThumbnailTex:v107];
                          }
                          else
                          {
                            [v6 setOutputSyntheticThumbnailTex:0];
                            unint64_t v105 = HIDWORD(v11);
                          }
                          v109 = [(H13FastRawScaleStage *)self createIntermediateMetalTexture:@"h13p.rawScaleOut" pixelFormat:25 width:v11 height:v105];
                          id v184 = v109;
                          if (v109)
                          {
                            v110 = v109;
                            if (v128)
                            {
                              int v111 = [(H13FastRawScaleStage *)self runFPExtractWithConfig:v6 inputTexture:location];
                              if (v111)
                              {
                                int v24 = v111;
                                uint64_t v125 = v3;
                                LODWORD(v124) = v111;
                                goto LABEL_128;
                              }
                            }
                            if (v136[165].i32[0])
                            {
                              id v149 = v110;
                              id obj = location;
                              int v112 = -[H13FastRawScaleStage runQuadraPDCWithArgs:inputTex:outputTex:](self, "runQuadraPDCWithArgs:inputTex:outputTex:");
                              objc_storeStrong(&location, obj);
                              id v113 = v149;
                              id v184 = v113;

                              v110 = v113;
                              if (!v112) {
                                goto LABEL_67;
                              }
                            }
                            else
                            {
                              int v112 = -[H13FastRawScaleStage runPDCWithArgs:inputTex:outputTex:](self, "runPDCWithArgs:inputTex:outputTex:");
                              if (!v112)
                              {
LABEL_67:
                                FigMetalDecRef();
                                v114 = [v6 inputFrame];
                                v115 = -[SoftISPInputFrame processingOptions]((uint64_t)v114);
                                int v116 = objc_msgSend(v115, "cmi_BOOLValueForKey:defaultValue:found:", @"CAR", 0, 0);

                                if (!v116 || v134 == 3) {
                                  goto LABEL_131;
                                }
                                memset(v148, 0, sizeof(v148));
                                long long v146 = 0u;
                                long long v147 = 0u;
                                long long v144 = 0u;
                                long long v145 = 0u;
                                long long v142 = 0u;
                                long long v143 = 0u;
                                long long v140 = 0u;
                                long long v141 = 0u;
                                long long v139 = 0u;
                                v117 = [v6 inputFrame];
                                v118 = self->_staticParameters;
                                v119 = [v6 bounds];
                                int v24 = +[ChromaticAberrationRecoveryConfig getCARConfigForInputFrame:v117 staticParameters:v118 bounds:v119 carConfig:&v139];

                                if (v24)
                                {
                                  uint64_t v125 = v3;
                                  LODWORD(v124) = v24;
                                  FigDebugAssert3();
                                  uint64_t v16 = v137;
                                  goto LABEL_74;
                                }
                                int v120 = [(ChromaticAberrationRecovery *)self->_car runCARWithArgs:&v139 targetTexture:v110];
                                uint64_t v16 = v137;
                                if (v120)
                                {
                                  int v24 = v120;
                                  uint64_t v125 = v3;
                                  LODWORD(v124) = v120;
                                }
                                else
                                {
LABEL_131:
                                  if (!v127
                                    || (int v121 = [(H13FastRawScaleStage *)self copySashimiTextureToAuxiliaryWithConfig:v6 inputTexture:v110]) == 0)
                                  {
                                    [v6 setOutputTex:v110];
                                    v122 = [v6 outputFrame];
                                    [v122 setMetadata:v16];

                                    [(FigMetalContext *)self->_metal forceCommit];
                                    int v24 = 0;
                                    goto LABEL_74;
                                  }
                                  int v24 = v121;
                                  uint64_t v125 = v3;
                                  LODWORD(v124) = v121;
                                }
LABEL_128:
                                FigDebugAssert3();
                                goto LABEL_74;
                              }
                            }
                            uint64_t v125 = v3;
                            LODWORD(v124) = v112;
                            FigDebugAssert3();
LABEL_122:
                            int v24 = FigSignalErrorAt();
                            goto LABEL_74;
                          }
                          uint64_t v125 = v3;
                          LODWORD(v124) = 0;
LABEL_121:
                          FigDebugAssert3();
                          goto LABEL_122;
                        }
                        uint64_t v125 = v3;
                        LODWORD(v124) = v24;
                      }
LABEL_119:
                      FigDebugAssert3();
                      id v47 = 0;
                      goto LABEL_74;
                    }
                    int v24 = FigSignalErrorAt();

                    v135 = v93;
                  }
                  else
                  {
                    int v24 = FigSignalErrorAt();

                    v135 = 0;
                  }
                }

LABEL_116:
                id v47 = 0;
                uint64_t v7 = 0;
                goto LABEL_74;
              }
              uint64_t v125 = v3;
              LODWORD(v124) = 0;
              FigDebugAssert3();
LABEL_101:
              int v24 = FigSignalErrorAt();
              goto LABEL_116;
            }
            uint64_t v125 = v3;
            LODWORD(v124) = v24;
          }
          FigDebugAssert3();
          goto LABEL_116;
        }
      }
      int v24 = FigSignalErrorAt();
LABEL_110:
      id v47 = 0;
      goto LABEL_111;
    }
    long long v57 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:90 width:17 height:17 mipmapped:0];
    long long v58 = v57;
    if (v57)
    {
      [v57 setUsage:17];
      [v58 setStorageMode:0];
      [v58 setTextureType:3];
      [v58 setArrayLength:4];
      long long v59 = [(FigMetalContext *)self->_metal device];
      long long v60 = (void *)[v59 newTextureWithDescriptor:v58];

      if (v60)
      {
        long long v61 = [v6 inputFrame];
        int v24 = [v138 getPDPGainsForInputFrame:v61 pdpGainsTex:v60];

        if (!v24)
        {
          [(int32x4_t *)v136 setPdpGainTex:v60];

          goto LABEL_30;
        }
        uint64_t v125 = v3;
        LODWORD(v124) = v24;
        FigDebugAssert3();

LABEL_109:
        goto LABEL_110;
      }
      uint64_t v125 = v3;
      LODWORD(v124) = 0;
    }
    else
    {
      uint64_t v125 = v3;
      LODWORD(v124) = 0;
    }
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_109;
  }
  v131 = v46;
  uint64_t v125 = v3;
  LODWORD(v124) = 0;
  FigDebugAssert3();
  int v24 = FigSignalErrorAt();
  id v47 = 0;
  v135 = 0;
  v136 = 0;
  uint64_t v7 = 0;
  v130 = 0;
LABEL_74:
  objc_msgSend(v7, "endEncoding", v124, v125);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v24;
}

uint64_t __36__H13FastRawScaleStage_runWithArgs___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __36__H13FastRawScaleStage_runWithArgs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (H13FastRawScaleShaders)shaders
{
  return self->_shaders;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_car, 0);
  objc_storeStrong((id *)&self->_8to10ExpansionLUT, 0);

  objc_storeStrong((id *)&self->_8to12ExpansionLUT, 0);
}

- (BOOL)shouldRunFPExtract:(id)a3
{
  uint64_t v3 = -[SoftISPInputFrame processingOptions]((uint64_t)a3);
  int v4 = [v3 objectForKeyedSubscript:@"SoftISPAuxiliaryType"];
  char v5 = containsRecognizedFPAuxType(v4);

  return v5;
}

- (BOOL)shouldCopySashimiToAuxiliary:(id)a3
{
  uint64_t v3 = -[SoftISPInputFrame processingOptions]((uint64_t)a3);
  int v4 = [v3 objectForKeyedSubscript:@"SoftISPAuxiliaryType"];

  LOBYTE(v3) = [v4 containsObject:&unk_270E98920];
  return (char)v3;
}

- (int)_extractFocusPixelsForAuxType:(int)a3 config:(id)a4 inputTexture:(id)a5 arguments:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 inputFrame];
  v86 = v12;
  uint64_t v14 = [v12 outputFrame];
  uint64_t v15 = -[SoftISPInputFrame processingOptions]((uint64_t)v13);
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v16 = mapFPAuxTypeToString(v8);
  v85 = v15;
  uint64_t v17 = [v15 objectForKeyedSubscript:@"SoftISPAuxiliaryType"];
  uint64_t v18 = [NSNumber numberWithUnsignedInt:v8];
  int v19 = [v17 containsObject:v18];

  if (!v19)
  {
    int v42 = 0;
LABEL_40:
    uint64_t v43 = v85;
    id v44 = v86;
LABEL_41:
    unsigned int v22 = v10;
    goto LABEL_35;
  }
  $F61E096109CF133FD2477F48C7D0CEE7 v20 = -[H13FastRawScaleStage auxiliaryPixelBufferSizeForAuxiliaryType:inputPixelFormat:width:height:](self, "auxiliaryPixelBufferSizeForAuxiliaryType:inputPixelFormat:width:height:", v8, [v10 inputPixelFormat], objc_msgSend(v10, "maximumOutputDimensions"), (unint64_t)objc_msgSend(v10, "maximumOutputDimensions") >> 32);
  unsigned int var0 = v20.var0.var0;
  unsigned int v22 = v10;
  if (!v20.var0.var0) {
    goto LABEL_43;
  }
  uint64_t v80 = HIDWORD(*(void *)&v20);
  if (!v20.var0.var1
    || (uint64_t v23 = [v14 getAuxiliaryPixelBufferForAuxiliaryType:v8]) == 0
    || (uint64_t v24 = v23,
        [(H13FastRawScaleStage *)self metal],
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        [v25 bindPixelBufferToMTL2DTexture:v24 pixelFormat:25 usage:2 plane:0],
        double v26 = objc_claimAutoreleasedReturnValue(),
        v25,
        !v26))
  {
LABEL_43:
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    uint64_t v43 = v85;
    id v44 = v86;
    goto LABEL_35;
  }
  id v84 = v11;
  v27 = [v22 staticParameters];
  double v28 = -[SoftISPInputFrame metadata]((uint64_t)v13);
  v29 = [v27 moduleConfigForInputFrameMetadata:v28];

  if (!v29)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
LABEL_48:

    uint64_t v43 = v85;
    goto LABEL_20;
  }
  double v30 = v29;
  unsigned int v31 = [v29 objectForKeyedSubscript:@"FocusPixels"];
  if (!v31)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
LABEL_47:

    goto LABEL_48;
  }
  double v32 = v31;
  unsigned int v33 = [v31 objectForKeyedSubscript:@"Layout"];
  if (!v33)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    goto LABEL_47;
  }
  unsigned int v34 = v33;
  v83 = v26;
  id v10 = v22;
  unsigned int v35 = [v33 objectForKeyedSubscript:@"Patterns"];
  if (!v35)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_19;
  }
  double v36 = v35;
  if ((unint64_t)[v35 count] > 0x10 || !objc_msgSend(v36, "count"))
  {
LABEL_18:
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

LABEL_19:
    uint64_t v43 = v85;
    unsigned int v22 = v10;
LABEL_20:
    id v44 = v86;
    id v11 = v84;
    goto LABEL_35;
  }
  uint64_t v76 = v34;
  v77 = v32;
  v78 = v30;
  uint64_t v79 = (uint64_t)v13;
  int v82 = v14;
  uint64_t v37 = 0;
  double v38 = 0;
  v39 = 0;
  while (1)
  {
    uint64_t v40 = v39;
    v39 = [v36 objectAtIndexedSubscript:v37];

    if (!v39)
    {
      uint64_t v70 = v81;
      LODWORD(v69) = 0;
      FigDebugAssert3();
      int v42 = FigSignalErrorAt();

LABEL_39:
      id v11 = v84;
      id v13 = (void *)v79;
      uint64_t v14 = v82;
      goto LABEL_40;
    }
    double v41 = [v39 objectForKeyedSubscript:@"PixelType"];

    if (!v41)
    {
      uint64_t v70 = v81;
      LODWORD(v69) = 0;
      FigDebugAssert3();
      int v42 = FigSignalErrorAt();
LABEL_38:

      goto LABEL_39;
    }
    double v38 = v41;
    if ([v41 isEqualToString:v16]) {
      break;
    }
    if (++v37 >= (unint64_t)[v36 count])
    {

      double v30 = v78;
      id v13 = (void *)v79;
      uint64_t v14 = v82;
      unsigned int v34 = v76;
      goto LABEL_18;
    }
  }
  uint64_t v45 = [v39 objectForKeyedSubscript:@"X"];
  if (!v45)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    goto LABEL_38;
  }
  uint64_t v46 = (void *)v45;
  uint64_t v47 = [v39 objectForKeyedSubscript:@"Y"];
  uint64_t v14 = v82;
  if (!v47)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    id v11 = v84;
    id v13 = (void *)v79;
    goto LABEL_40;
  }
  id v48 = (void *)v47;
  char v90 = 0;
  __int16 v49 = objc_msgSend(v46, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Start", 0, &v90);
  uint64_t v74 = v46;
  if (!v90) {
    goto LABEL_57;
  }
  __int16 v72 = v49;
  __int16 v50 = objc_msgSend(v48, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Start", 0, &v90);
  if (!v90) {
    goto LABEL_57;
  }
  uint32x2_t v71 = self;
  __int16 v51 = v50;
  id v73 = v10;
  unsigned __int16 v52 = objc_msgSend(v46, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Step", 0, &v90);
  if (!v90
    || (unsigned __int16 v53 = v52,
        unsigned __int16 v54 = objc_msgSend(v48, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Step", 0, &v90),
        !v90))
  {
    id v10 = v73;
LABEL_57:
    id v44 = v86;
LABEL_59:
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    id v11 = v84;
    uint64_t v43 = v85;
    id v13 = (void *)v79;
    goto LABEL_41;
  }
  unsigned __int16 v55 = v54;
  __int16 v56 = objc_msgSend(v74, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Count", 0, &v90);
  if (!v90
    || (__int16 v57 = v56,
        __int16 v58 = objc_msgSend(v48, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Count", 0, &v90),
        !v90))
  {
    id v10 = v73;
    id v44 = v86;
    uint64_t v14 = v82;
    goto LABEL_59;
  }
  WORD1(v92) = v51;
  LOWORD(v92) = v72;
  WORD3(v92) = v55;
  WORD2(v92) = v53;
  WORD5(v92) = v58;
  WORD4(v92) = v57;
  LOWORD(v91) = -[SoftISPInputFrame quadraBinningFactor](v79);
  long long v59 = [v86 bounds];
  *((void *)&v91 + 1) = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v59);

  if (var0 <= v53 || v55 >= v80)
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    unsigned int v22 = v73;
    id v11 = v84;
    id v44 = v86;
    id v13 = (void *)v79;
    uint64_t v14 = v82;
    goto LABEL_34;
  }
  long long v60 = [(H13FastRawScaleStage *)v71 metal];
  long long v61 = [v60 commandBuffer];

  uint64_t v14 = v82;
  v75 = v61;
  if (v61)
  {
    uint64_t v62 = [v61 computeCommandEncoder];
    if (v62)
    {
      id v63 = (void *)v62;
      long long v64 = [(H13FastRawScaleStage *)v71 shaders];
      BOOL v65 = [v64 extractFocusPixels];
      [v63 setComputePipelineState:v65];

      [v63 setTexture:v84 atIndex:0];
      [v63 setTexture:v83 atIndex:1];
      [v63 setBytes:&v91 length:32 atIndex:0];
      v89[0] = var0;
      v89[1] = v80;
      v89[2] = 1;
      int64x2_t v87 = vdupq_n_s64(0x10uLL);
      uint64_t v88 = 1;
      uint64_t v14 = v82;
      [v63 dispatchThreads:v89 threadsPerThreadgroup:&v87];
      [v63 endEncoding];

      v66 = [(H13FastRawScaleStage *)v71 metal];
      [v66 commit];

      id v11 = v84;
      unsigned int v22 = v73;

      int v42 = 0;
      id v44 = v86;
      id v13 = (void *)v79;
LABEL_34:
      uint64_t v43 = v85;
      goto LABEL_35;
    }
    int v42 = FigSignalErrorAt();

    uint64_t v68 = v61;
  }
  else
  {
    uint64_t v70 = v81;
    LODWORD(v69) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    uint64_t v68 = v83;
  }

  id v11 = v84;
  uint64_t v43 = v85;
  id v44 = v86;
  id v13 = (void *)v79;
  unsigned int v22 = v73;
LABEL_35:
  objc_msgSend(0, "endEncoding", v69, v70);

  return v42;
}

- (int)runFPExtractWithConfig:(id)a3 inputTexture:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  uint64_t v8 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v24 = FigSignalErrorAt();
    goto LABEL_26;
  }
  double v26 = [v6 config];
  id v10 = [v6 bounds];

  if (!v10
    || ([v6 inputFrame], id v11 = objc_claimAutoreleasedReturnValue(), v11, !v11)
    || ([v6 outputFrame], id v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_25;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = [v6 inputFrame];
  uint64_t v14 = -[SoftISPInputFrame processingOptions]((uint64_t)v13);
  uint64_t v15 = [v14 objectForKeyedSubscript:@"SoftISPAuxiliaryType"];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v16)
  {
    int v24 = 0;
    goto LABEL_24;
  }
  uint64_t v17 = v16;
  id v18 = v6;
  uint64_t v19 = *(void *)v29;
LABEL_7:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v29 != v19) {
      objc_enumerationMutation(v15);
    }
    v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = [v21 unsignedIntValue];
    }
    else {
      uint64_t v22 = 0;
    }
    if (!isRecognizedFPAuxType(v22)) {
      goto LABEL_17;
    }
    if ([v7 containsObject:v21])
    {
      FigDebugAssert3();
LABEL_22:
      int v24 = 0;
      goto LABEL_23;
    }
    int v23 = [(H13FastRawScaleStage *)self _extractFocusPixelsForAuxType:v22 config:v26 inputTexture:v27 arguments:v18];
    if (v23) {
      break;
    }
    [v7 addObject:v21];
LABEL_17:
    if (v17 == ++v20)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v17) {
        goto LABEL_7;
      }
      goto LABEL_22;
    }
  }
  int v24 = v23;
  FigDebugAssert3();
LABEL_23:
  id v6 = v18;
LABEL_24:

LABEL_25:
LABEL_26:

  return v24;
}

- (int)copySashimiTextureToAuxiliaryWithConfig:(id)a3 inputTexture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 bounds];

  if (!v9) {
    goto LABEL_24;
  }
  id v10 = [v7 inputFrame];

  if (!v10) {
    goto LABEL_24;
  }
  id v11 = [v7 outputFrame];

  if (!v11) {
    goto LABEL_24;
  }
  id v12 = [v7 inputFrame];
  BOOL v13 = [(H13FastRawScaleStage *)self shouldCopySashimiToAuxiliary:v12];

  if (!v13)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    FigDebugAssert3();
    goto LABEL_14;
  }
  id v44 = v8;
  uint64_t v14 = [v7 inputFrame];
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v14);
  uint64_t v16 = v15;

  uint64_t v17 = [v7 inputFrame];
  unsigned int v18 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v17);

  uint64_t v19 = [v7 bounds];
  uint64_t v20 = -[SoftISPBounds processingRegionWithinInputBufferInPixels]((uint64_t)v19);

  v21 = [v7 config];
  uint64_t v22 = [v21 inputPixelFormat];
  int v23 = [v7 config];
  uint64_t v24 = [v23 maximumOutputDimensions];
  uint64_t v25 = [v7 config];
  $F61E096109CF133FD2477F48C7D0CEE7 v26 = -[H13FastRawScaleStage auxiliaryPixelBufferSizeForAuxiliaryType:inputPixelFormat:width:height:](self, "auxiliaryPixelBufferSizeForAuxiliaryType:inputPixelFormat:width:height:", 3, v22, v24, (unint64_t)[v25 maximumOutputDimensions] >> 32);

  if (v16 / v18 > v26.var0.var0)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
    id v8 = v44;
    goto LABEL_15;
  }
  id v8 = v44;
  if (HIDWORD(v16) / v18 > v26.var0.var1)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
LABEL_23:
    FigDebugAssert3();
LABEL_25:
    int v40 = FigSignalErrorAt();
    goto LABEL_15;
  }
  if (v26.var0.var0 < (unint64_t)([v44 width] + (int)v20))
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    goto LABEL_23;
  }
  if (HIDWORD(*(void *)&v26) < (unint64_t)([v44 height] + (v20 >> 32)))
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    goto LABEL_23;
  }
  id v27 = [v7 outputFrame];
  uint64_t v28 = [v27 getAuxiliaryPixelBufferForAuxiliaryType:3];

  if (!v28
    || ([(H13FastRawScaleStage *)self metal],
        long long v29 = objc_claimAutoreleasedReturnValue(),
        [v29 bindPixelBufferToMTL2DTexture:v28 pixelFormat:25 usage:2 plane:0],
        long long v30 = objc_claimAutoreleasedReturnValue(),
        v29,
        !v30))
  {
LABEL_24:
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    FigDebugAssert3();
    goto LABEL_25;
  }
  long long v31 = [v7 inputFrame];
  v48[0] = (unsigned __int16)-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v31);

  double v32 = [v7 bounds];
  v48[1] = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v32);

  uint64_t v33 = [(H13FastRawScaleStage *)self metal];
  unsigned int v34 = [v33 commandBuffer];

  if (!v34)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
LABEL_28:

    goto LABEL_15;
  }
  uint64_t v35 = [v34 computeCommandEncoder];
  if (!v35)
  {
    int v40 = FigSignalErrorAt();

    goto LABEL_28;
  }
  double v36 = (void *)v35;
  uint64_t v37 = [(H13FastRawScaleStage *)self shaders];
  double v38 = [v37 generateSashimiCopy];
  [v36 setComputePipelineState:v38];

  [v36 setTexture:v44 atIndex:0];
  [v36 setTexture:v30 atIndex:1];
  [v36 setBytes:v48 length:16 atIndex:0];
  v47[0] = v26.var0.var0;
  v47[1] = HIDWORD(*(void *)&v26);
  v47[2] = 1;
  int64x2_t v45 = vdupq_n_s64(0x10uLL);
  uint64_t v46 = 1;
  [v36 dispatchThreads:v47 threadsPerThreadgroup:&v45];
  [v36 endEncoding];

  v39 = [(H13FastRawScaleStage *)self metal];
  [v39 commit];

LABEL_14:
  int v40 = 0;
LABEL_15:
  objc_msgSend(0, "endEncoding", v42, v43);

  return v40;
}

- (int)requestPixelBuffer:(__CVBuffer *)a3 forRegion:(id)a4 fromOutputFrame:(id)a5
{
  *a3 = (__CVBuffer *)objc_msgSend(a5, "getAuxiliaryPixelBufferForAuxiliaryType:", 2, *(void *)&a4.var0, *(void *)&a4.var1);
  return 0;
}

- (int)getConfigFromInputFrame:(id)a3 config:(VisionParams *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && a4)
  {
    a4->unsigned int var0 = -[SoftISPInputFrame cfaLayout]((uint64_t)v5) == 3;
    int v7 = 0;
    a4->var1 = -[SoftISPInputFrame firstPixel]((uint64_t)v6);
    a4->var2 = 1;
  }
  else
  {
    int v7 = FigSignalErrorAt();
  }

  return v7;
}

- (int)preparePixelBuffer:(__CVBuffer *)a3 forRegion:(id)a4 ofImage:(id)a5 withOutputFrame:(id)a6 config:(VisionParams *)a7
{
  $4964C72D48EEADA28003EDB7DB11D70A v38 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(H13FastRawScaleStage *)self metal];
  if (!a3 || !a7 || !v12)
  {
    int v30 = FigSignalErrorAt();
    goto LABEL_14;
  }
  uint64_t v35 = v13;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (!Width
    || (size_t v17 = Height, [v12 width] > 8 * Width)
    || [v12 height] > 8 * v17
    || ([v14 bindPixelBufferToMTL2DTexture:a3 pixelFormat:13 usage:23 plane:0],
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v30 = FigSignalErrorAt();
    id v13 = v35;
    goto LABEL_14;
  }
  uint64_t v19 = (void *)v18;
  uint64_t v20 = [v14 bindPixelBufferToMTL2DTexture:a3 pixelFormat:33 usage:23 plane:1];
  unsigned int v34 = v14;
  uint64_t v21 = [v14 commandBuffer];
  if (!v21)
  {
    uint64_t v33 = v7;
    LODWORD(v32) = 0;
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();

LABEL_19:
    uint64_t v14 = v34;
    id v13 = v35;
    goto LABEL_14;
  }
  uint64_t v22 = (void *)v21;
  id v23 = v12;
  BOOL var0 = a7->var0;
  uint64_t v25 = [(H13FastRawScaleStage *)self shaders];
  $F61E096109CF133FD2477F48C7D0CEE7 v26 = v25;
  if (var0) {
    [v25 downscaleQuadra];
  }
  else {
  id v27 = [v25 downscale];
  }
  id v12 = v23;

  uint64_t v28 = [v22 computeCommandEncoder];
  if (!v28)
  {
    uint64_t v33 = v7;
    LODWORD(v32) = 0;
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();

    goto LABEL_19;
  }
  long long v29 = v28;
  [v28 setComputePipelineState:v27];
  [v29 setTexture:v23 atIndex:0];
  [v29 setTexture:v19 atIndex:1];
  [v29 setTexture:v20 atIndex:2];
  [v29 setBytes:&v38 length:8 atIndex:0];
  [v29 setBytes:a7 length:8 atIndex:1];
  v37[0] = Width;
  v37[1] = v17;
  v37[2] = 1;
  v36[0] = [v27 threadExecutionWidth];
  v36[1] = (unint64_t)[v27 maxTotalThreadsPerThreadgroup] / v36[0];
  v36[2] = 1;
  id v12 = v23;
  [v29 dispatchThreads:v37 threadsPerThreadgroup:v36];
  [v29 endEncoding];

  id v13 = v35;
  [v35 addCompletionHandlerToCommandBuffer:v22];
  [v34 waitForSchedule];

  uint64_t v14 = v34;
  int v30 = 0;
LABEL_14:
  objc_msgSend(0, "endEncoding", v32, v33);

  return v30;
}

- (int)runFaceDetectionOnPixelBuffer:(__CVBuffer *)a3 withMetadataToUpdate:(id)a4 config:(VisionParams *)a5 pts:(id *)a6
{
  id v9 = a4;
  id v10 = [MEMORY[0x263EFF980] array];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [MEMORY[0x263EFF980] array];
  if (runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts__onceToken != -1) {
    dispatch_once(&runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts__onceToken, &__block_literal_global_19);
  }
  id v13 = objc_alloc_init((Class)getVNSessionClass());
  id v14 = objc_alloc((Class)getVNDetectFaceRectanglesRequestClass());
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_2;
  v53[3] = &unk_2655C82F8;
  id v15 = v12;
  id v54 = v15;
  uint64_t v16 = v11;
  unsigned __int16 v55 = v16;
  uint64_t v17 = [v14 initWithCompletionHandler:v53];
  int v40 = v13;
  uint64_t v18 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass()) initWithCVPixelBuffer:a3 orientation:a5->var2 options:MEMORY[0x263EFFA78] session:v13];
  v39 = (void *)v17;
  [v10 addObject:v17];
  uint64_t v19 = runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts__asyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_24;
  block[3] = &unk_2655C81B0;
  id v20 = v18;
  id v51 = v20;
  id v21 = v10;
  id v52 = v21;
  dispatch_async(v19, block);
  CMTime time = (CMTime)*a6;
  CMTimeConvertScale(&v49, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  uint64_t v22 = FigNanosecondsToHostTime();
  uint64_t v23 = *MEMORY[0x263F2F440];
  uint64_t v24 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F440]];
  uint64_t v25 = (void *)[v24 mutableCopy];

  if (!v25) {
    uint64_t v25 = objc_opt_new();
  }
  [v9 setObject:v25 forKeyedSubscript:v23];
  uint64_t v26 = *MEMORY[0x263F2F288];
  id v27 = [v25 objectForKeyedSubscript:*MEMORY[0x263F2F288]];
  uint64_t v28 = (void *)[v27 mutableCopy];

  if (!v28) {
    uint64_t v28 = objc_opt_new();
  }
  [v25 setObject:v28 forKeyedSubscript:v26];
  id v29 = objc_alloc(MEMORY[0x263F2ED70]);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_2_27;
  v45[3] = &unk_2655C8320;
  int v30 = v16;
  uint64_t v46 = v30;
  id v31 = v15;
  id v47 = v31;
  uint64_t v32 = (void *)[v29 initWithBlock:v45];
  [v28 setObject:v32 forKeyedSubscript:*MEMORY[0x263F2F290]];

  uint64_t v33 = [NSNumber numberWithUnsignedLongLong:v22];
  [v28 setObject:v33 forKeyedSubscript:*MEMORY[0x263F2F6C8]];

  id v34 = objc_alloc(MEMORY[0x263F2ED70]);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_3;
  v41[3] = &unk_2655C8348;
  uint64_t v42 = v30;
  id v43 = v31;
  uint64_t v44 = v22;
  id v35 = v31;
  double v36 = v30;
  uint64_t v37 = (void *)[v34 initWithBlock:v41];
  [v9 setObject:v37 forKeyedSubscript:*MEMORY[0x263F2F438]];

  return 0;
}

void __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.coremedia.softisp.visionstage", v2);
  v1 = (void *)runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts__asyncQueue;
  runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts__asyncQueue = (uint64_t)v0;
}

intptr_t __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [a2 results];
    uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v43)
    {
      uint64_t v41 = *(void *)v51;
      uint64_t v40 = *MEMORY[0x263F2F620];
      uint64_t v39 = *MEMORY[0x263F2F4A0];
      uint64_t v38 = *MEMORY[0x263F2F280];
      uint64_t v37 = *MEMORY[0x263F2F368];
      uint64_t v36 = *MEMORY[0x263F2F370];
      uint64_t v44 = 1;
      uint64_t v35 = *MEMORY[0x263F2F4A8];
      uint64_t v34 = *MEMORY[0x263F2F278];
      uint64_t v33 = *MEMORY[0x263F2F400];
      uint64_t v32 = *MEMORY[0x263F2F360];
      uint64_t v31 = *MEMORY[0x263F2F478];
      uint64_t v42 = a1;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v51 != v41) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v56[0] = v40;
          v54[0] = @"X";
          id v6 = NSNumber;
          [v5 boundingBox];
          CMTime v49 = objc_msgSend(v6, "numberWithDouble:");
          v55[0] = v49;
          v54[1] = @"Y";
          uint64_t v7 = NSNumber;
          [v5 boundingBox];
          double v9 = 1.0 - v8;
          [v5 boundingBox];
          id v48 = [v7 numberWithDouble:v9 - v10];
          v55[1] = v48;
          v54[2] = @"Width";
          dispatch_semaphore_t v11 = NSNumber;
          [v5 boundingBox];
          id v47 = [v11 numberWithDouble:v12];
          v55[2] = v47;
          v54[3] = @"Height";
          id v13 = NSNumber;
          [v5 boundingBox];
          uint64_t v46 = [v13 numberWithDouble:v14];
          v55[3] = v46;
          int64x2_t v45 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
          v57[0] = v45;
          v56[1] = v39;
          id v15 = [NSNumber numberWithInt:v44 + i];
          v57[1] = v15;
          v57[2] = &unk_270E98938;
          v56[2] = v38;
          v56[3] = v37;
          uint64_t v16 = NSNumber;
          uint64_t v17 = [v5 roll];
          [v17 floatValue];
          uint64_t v19 = [v16 numberWithInt:(int)(360.0 - (float)(v18 * 180.0) / 3.14159265)];
          v57[3] = v19;
          v56[4] = v36;
          id v20 = NSNumber;
          id v21 = [v5 yaw];
          [v21 floatValue];
          uint64_t v23 = [v20 numberWithInt:(int)((float)(v22 * 180.0) / 3.14159265)];
          v57[4] = v23;
          v57[5] = &unk_270E98950;
          v56[5] = v35;
          v56[6] = v34;
          v57[6] = &unk_270E98950;
          v57[7] = &unk_270E98950;
          v56[7] = v33;
          v56[8] = v32;
          uint64_t v24 = NSNumber;
          uint64_t v25 = [v5 pitch];
          [v25 floatValue];
          id v27 = [v24 numberWithInt:(int)(360.0 - (float)(v26 * 180.0) / 3.14159265)];
          v56[9] = v31;
          v57[8] = v27;
          v57[9] = &unk_270E98950;
          uint64_t v28 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:10];

          a1 = v42;
          [*(id *)(v42 + 32) addObject:v28];
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
        uint64_t v44 = (v44 + i);
      }
      while (v43);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_24(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = 0;
  return [v2 performRequests:v1 error:&v4];
}

id __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_2_27(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v2, v3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 40);

  return v4;
}

id __94__H13FastRawScaleStage_Vision__runFaceDetectionOnPixelBuffer_withMetadataToUpdate_config_pts___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v2, v3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFPropertyListRef *)(a1 + 40), 1uLL);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = DeepCopy;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = *MEMORY[0x263F2F6C8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_semaphore_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 48), (void)v14);
        [v11 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

- (int)runVisionWithArgs:(id)a3 inputTex:(id)a4 metadataToUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  dispatch_semaphore_t v11 = [v8 inputFrame];
  if (!v11)
  {
    int v22 = FigSignalErrorAt();
    double v12 = 0;
    goto LABEL_9;
  }
  double v12 = [v8 outputFrame];
  if (!v12) {
    goto LABEL_15;
  }
  id v13 = -[SoftISPInputFrame processingOptions]((uint64_t)v11);
  int v14 = objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"VSN", 0, 0);

  if (v14)
  {
    unsigned int v15 = [v9 width];
    unsigned int v16 = [v9 height];
    uint64_t v26 = 0;
    int v17 = [(H13FastRawScaleStage *)self getConfigFromInputFrame:v11 config:&v27];
    if (v17)
    {
      int v22 = v17;
    }
    else
    {
      unint64_t v18 = v15 | ((unint64_t)v16 << 32);
      int v19 = -[H13FastRawScaleStage requestPixelBuffer:forRegion:fromOutputFrame:](self, "requestPixelBuffer:forRegion:fromOutputFrame:", &v26, 0, v18, v12);
      if (v19)
      {
        int v22 = v19;
      }
      else
      {
        uint64_t v20 = v26;
        id v21 = [v8 outputFrame];
        int v22 = -[H13FastRawScaleStage preparePixelBuffer:forRegion:ofImage:withOutputFrame:config:](self, "preparePixelBuffer:forRegion:ofImage:withOutputFrame:config:", v20, 0, v18, v9, v21, &v27);

        if (!v22)
        {
          uint64_t v23 = v26;
          [(SoftISPInputFrame *)(uint64_t)v11 pts];
          if (![(H13FastRawScaleStage *)self runFaceDetectionOnPixelBuffer:v23 withMetadataToUpdate:v10 config:&v27 pts:v25])goto LABEL_8; {
LABEL_15:
          }
          int v22 = FigSignalErrorAt();
          goto LABEL_9;
        }
      }
    }
    FigDebugAssert3();
    goto LABEL_9;
  }
LABEL_8:
  int v22 = 0;
LABEL_9:

  return v22;
}

- (int)runABLESTWithConfig:(id *)a3 inOutTexture:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(H13FastRawScaleStage *)self metal];
  id v8 = [(H13FastRawScaleStage *)self shaders];
  id v104 = 0;
  id v105 = 0;
  if (!a3 || !v6) {
    goto LABEL_46;
  }
  id v9 = -[H13FastRawScaleStage createIntermediate1DMetalTexture:pixelFormat:length:](self, "createIntermediate1DMetalTexture:pixelFormat:length:", @"blest_hcorr", 65, [v6 width] / (unint64_t)LODWORD(a3[1].var4));
  id v105 = v9;
  if (!v9) {
    goto LABEL_45;
  }
  id v10 = v9;
  -[H13FastRawScaleStage createIntermediate1DMetalTexture:pixelFormat:length:](self, "createIntermediate1DMetalTexture:pixelFormat:length:", @"blest_vcorr", 65, [v6 height] / (unint64_t)LODWORD(a3[1].var4));
  id v104 = (id)objc_claimAutoreleasedReturnValue();
  if (!v104
    || ([v7 device],
        dispatch_semaphore_t v11 = objc_claimAutoreleasedReturnValue(),
        double v12 = (void *)[v11 newBufferWithLength:16 options:32],
        v11,
        (long long v64 = v12) == 0))
  {
LABEL_45:
    FigDebugAssert3();
LABEL_46:
    int v56 = FigSignalErrorAt();
    goto LABEL_42;
  }
  id v13 = [v7 commandBuffer];
  if (!v13)
  {
    int v56 = FigSignalErrorAt();
    __int16 v58 = v12;
LABEL_49:

    goto LABEL_42;
  }
  id v63 = v13;
  uint64_t v14 = [v13 computeCommandEncoder];
  if (!v14)
  {
    int v56 = FigSignalErrorAt();

    __int16 v58 = v63;
    goto LABEL_49;
  }
  unsigned int v15 = (void *)v14;
  uint64_t v62 = v7;
  char v16 = 0;
  int v65 = 0;
  unsigned int v17 = 0;
  unsigned int v103 = 0;
  int64x2_t v66 = vdupq_n_s64(0x10uLL);
  do
  {
    if (!a3->var0[10 * v17].var0) {
      goto LABEL_25;
    }
    id v101 = 0;
    id v102 = 0;
    id v99 = 0;
    id v100 = 0;
    id v97 = 0;
    id v98 = 0;
    unint64_t v18 = (char *)a3 + 20 * v17;
    unsigned int v20 = *((unsigned __int16 *)v18 + 9);
    int v19 = (unsigned __int16 *)(v18 + 18);
    id v21 = v19 - 1;
    int v22 = [(H13FastRawScaleStage *)self createIntermediateMetalTexture:@"blest_initial" pixelFormat:65 width:*(v19 - 1) height:v20];
    id v23 = v102;
    id v102 = v22;

    if (v102)
    {
      uint64_t v24 = [(H13FastRawScaleStage *)self createIntermediateMetalTexture:@"blest_filtered" pixelFormat:65 width:*v21 height:*v19];
      id v25 = v101;
      id v101 = v24;

      if (v101)
      {
        uint64_t v26 = [(H13FastRawScaleStage *)self createIntermediate1DMetalTexture:@"blest_hest" pixelFormat:65 length:*v21];
        id v27 = v100;
        id v100 = v26;

        if (v100)
        {
          uint64_t v28 = [(H13FastRawScaleStage *)self createIntermediate1DMetalTexture:@"blest_vest" pixelFormat:65 length:*v19];
          id v29 = v99;
          id v99 = v28;

          if (v99)
          {
            int v30 = [(H13FastRawScaleStage *)self createIntermediate1DMetalTexture:@"blest_hfest" pixelFormat:65 length:*v21];
            id v31 = v98;
            id v98 = v30;

            if (v98)
            {
              uint64_t v32 = [(H13FastRawScaleStage *)self createIntermediate1DMetalTexture:@"blest_vfest" pixelFormat:65 length:*v19];
              id v33 = v97;
              id v97 = v32;

              if (v97)
              {
                uint64_t v34 = [v8 advBLESTInitialEstimate];
                [v15 setComputePipelineState:v34];

                [v15 setTexture:v6 atIndex:0];
                [v15 setBytes:a3 length:172 atIndex:0];
                char v16 = 1;
                [v15 setBytes:&v103 length:4 atIndex:1];
                [v15 setTexture:v102 atIndex:1];
                uint64_t v35 = *v19;
                v96[0] = *v21;
                v96[1] = v35;
                v96[2] = 1;
                int64x2_t v94 = v66;
                uint64_t v95 = 1;
                [v15 dispatchThreads:v96 threadsPerThreadgroup:&v94];
                uint64_t v36 = [v8 advBLESTFilterEstimate];
                [v15 setComputePipelineState:v36];

                [v15 setTexture:v101 atIndex:2];
                uint64_t v37 = *v19;
                v93[0] = *v21;
                v93[1] = v37;
                v93[2] = 1;
                int64x2_t v91 = v66;
                uint64_t v92 = 1;
                [v15 dispatchThreads:v93 threadsPerThreadgroup:&v91];
                uint64_t v38 = [v8 advBLESTHorizontalMeanBL];
                [v15 setComputePipelineState:v38];

                [v15 setTexture:v100 atIndex:3];
                uint64_t v39 = *v21;
                uint64_t v88 = 1;
                uint64_t v89 = v39;
                int64x2_t v67 = vdupq_n_s64(1uLL);
                int64x2_t v90 = v67;
                long long v87 = xmmword_263480460;
                [v15 dispatchThreads:&v89 threadsPerThreadgroup:&v87];
                uint64_t v40 = [v8 advBLESTVerticalMeanBL];
                [v15 setComputePipelineState:v40];

                [v15 setTexture:v99 atIndex:4];
                uint64_t v41 = *v19;
                uint64_t v84 = 1;
                uint64_t v85 = v41;
                int64x2_t v86 = v67;
                long long v83 = xmmword_263480460;
                [v15 dispatchThreads:&v85 threadsPerThreadgroup:&v83];
                uint64_t v42 = [v8 advBLESTFilterMeans];
                [v15 setComputePipelineState:v42];

                [v15 setTexture:v98 atIndex:5];
                [v15 setTexture:v97 atIndex:6];
                if (*v21 <= *v19) {
                  uint64_t v43 = *v19;
                }
                else {
                  uint64_t v43 = *v21;
                }
                uint64_t v80 = 1;
                uint64_t v81 = v43;
                int64x2_t v82 = v67;
                long long v79 = xmmword_263480460;
                objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", &v81, &v79, v59, v60);
                uint64_t v44 = [v8 advBLESTUpdateCorrection];
                [v15 setComputePipelineState:v44];

                [v15 setTexture:v10 atIndex:7];
                id v45 = v104;
                [v15 setTexture:v104 atIndex:8];
                id v10 = v105;
                unint64_t v46 = [v105 width];
                if (v46 <= [v45 width]) {
                  id v47 = v45;
                }
                else {
                  id v47 = v10;
                }
                uint64_t v48 = [v47 width];
                uint64_t v76 = 1;
                uint64_t v77 = v48;
                int64x2_t v78 = v67;
                long long v75 = xmmword_263480460;
                [v15 dispatchThreads:&v77 threadsPerThreadgroup:&v75];
                FigMetalDecRef();
                FigMetalDecRef();
                FigMetalDecRef();
                FigMetalDecRef();
                FigMetalDecRef();
                FigMetalDecRef();
                int v49 = 1;
                goto LABEL_23;
              }
              uint64_t v60 = v61;
              LODWORD(v59) = 0;
            }
            else
            {
              uint64_t v60 = v61;
              LODWORD(v59) = 0;
            }
          }
          else
          {
            uint64_t v60 = v61;
            LODWORD(v59) = 0;
          }
        }
        else
        {
          uint64_t v60 = v61;
          LODWORD(v59) = 0;
        }
      }
      else
      {
        uint64_t v60 = v61;
        LODWORD(v59) = 0;
      }
    }
    else
    {
      uint64_t v60 = v61;
      LODWORD(v59) = 0;
    }
    FigDebugAssert3();
    int v65 = FigSignalErrorAt();
    int v49 = 0;
LABEL_23:

    if (!v49)
    {

      uint64_t v7 = v62;
      goto LABEL_41;
    }
    unsigned int v17 = v103;
LABEL_25:
    unsigned int v103 = ++v17;
  }
  while (v17 < 4);
  if (v16)
  {
    long long v50 = [v8 advBLESTCalcMeanCorrection];
    [v15 setComputePipelineState:v50];

    [v15 setBuffer:v64 offset:0 atIndex:2];
    [v15 setTexture:v10 atIndex:7];
    id v51 = v104;
    [v15 setTexture:v104 atIndex:8];
    id v52 = v105;
    unint64_t v53 = [v105 width];
    if (v53 <= [v51 width]) {
      id v54 = v51;
    }
    else {
      id v54 = v52;
    }
    int64x2_t v74 = vdupq_n_s64(1uLL);
    long long v71 = xmmword_263480460;
    uint64_t v72 = 1;
    uint64_t v73 = objc_msgSend(v54, "width", v59);
    [v15 dispatchThreads:&v73 threadsPerThreadgroup:&v71];
    unsigned __int16 v55 = [v8 advBLESTApplyCorrection];
    [v15 setComputePipelineState:v55];

    [v15 setImageblockWidth:32 height:32];
    [v15 setBytes:a3 length:172 atIndex:0];
    [v15 setTexture:v6 atIndex:0];
    v70[0] = [v6 width];
    v70[1] = [v6 height];
    v70[2] = 1;
    int64x2_t v68 = vdupq_n_s64(0x20uLL);
    uint64_t v69 = 1;
    [v15 dispatchThreads:v70 threadsPerThreadgroup:&v68];
  }
  objc_msgSend(v15, "endEncoding", v59);
  uint64_t v7 = v62;
  [v62 commit];
  FigMetalDecRef();
  FigMetalDecRef();

LABEL_41:
  int v56 = v65;
LABEL_42:

  return v56;
}

- (int)runPDCWithArgs:(id)a3 inputTex:(id)a4 outputTex:(id)a5
{
  v199[4] = *MEMORY[0x263EF8340];
  id v8 = (char *)a3;
  id v9 = a4;
  id v137 = a5;
  id v10 = [(H13FastRawScaleStage *)self metal];
  uint64_t v11 = [(H13FastRawScaleStage *)self shaders];
  id v175 = 0;
  unint64_t v133 = *((unsigned int *)v8 + 5);
  v136 = v8 + 144;
  long long v140 = v10;
  v138 = (void *)v11;
  unint64_t v130 = *((unsigned int *)v8 + 4);
  if (!v8[147])
  {
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  double v12 = (void *)v11;
  id v13 = [v10 commandBuffer];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    v135 = 0;
    unsigned int v15 = 0;
    goto LABEL_91;
  }
  unsigned int v15 = [v13 computeCommandEncoder];
  if (!v15)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    v135 = 0;
    goto LABEL_91;
  }
  long long v143 = v14;
  id v132 = v9;
  if (v8[2089])
  {
    if (v8[2097])
    {
      char v16 = [v138 processFocusPixelBlockPairsFixedCenterIndex];
      v198[0] = @"hasRedBlueFocusPixels";
      unsigned int v17 = [NSNumber numberWithBool:v8[2088]];
      v199[0] = v17;
      v198[1] = @"hasCommonPdpGainAdjustment";
      unint64_t v18 = [NSNumber numberWithBool:v8[2096]];
      v199[1] = v18;
      v198[2] = @"horizontalCenterPairIndex";
      int v19 = [NSNumber numberWithInt:*((unsigned int *)v8 + 525)];
      v199[2] = v19;
      v198[3] = @"verticalCenterPairIndex";
      unsigned int v20 = [NSNumber numberWithInt:*((unsigned int *)v8 + 526)];
      v199[3] = v20;
      id v21 = [NSDictionary dictionaryWithObjects:v199 forKeys:v198 count:4];
      uint64_t v22 = [v16 getPipelineStateWithParams:v21];
    }
    else
    {
      id v29 = [v138 processFocusPixelBlockPairs];
      v196[0] = @"hasRedBlueFocusPixels";
      int v30 = [NSNumber numberWithBool:v8[2088]];
      v196[1] = @"hasCommonPdpGainAdjustment";
      v197[0] = v30;
      id v31 = [NSNumber numberWithBool:v8[2096]];
      v197[1] = v31;
      uint64_t v32 = [NSDictionary dictionaryWithObjects:v197 forKeys:v196 count:2];
      uint64_t v22 = [v29 getPipelineStateWithParams:v32];
    }
    BOOL v28 = 0;
  }
  else
  {
    id v23 = [v12 processFocusPixelBlock];
    v194[0] = @"hasRedBlueFocusPixels";
    uint64_t v24 = [NSNumber numberWithBool:v8[2088]];
    v195[0] = v24;
    v194[1] = @"commonBayer";
    id v25 = [NSNumber numberWithInt:*((unsigned int *)v8 + 523)];
    v195[1] = v25;
    v194[2] = @"hasCommonPdpGainAdjustment";
    uint64_t v26 = [NSNumber numberWithBool:v8[2096]];
    v195[2] = v26;
    id v27 = [NSDictionary dictionaryWithObjects:v195 forKeys:v194 count:3];
    uint64_t v22 = [v23 getPipelineStateWithParams:v27];

    BOOL v28 = v8[2088] != 0;
  }
  id v10 = v140;
  uint64_t v14 = v143;
  long long v141 = (void *)v22;
  if (!v22)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
LABEL_105:
    FigDebugAssert3();
    id v9 = v132;
LABEL_114:
    int v121 = FigSignalErrorAt();

    v135 = 0;
    goto LABEL_115;
  }
  id v33 = [v8 pdpGainTex];

  if (!v33)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    goto LABEL_105;
  }
  uint64_t v34 = [v8 xtalkLutTex];

  id v9 = v132;
  if (!v34)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
LABEL_113:
    FigDebugAssert3();
    goto LABEL_114;
  }
  uint64_t v35 = [v8 flatThdLutTex];

  if (!v35)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    goto LABEL_113;
  }
  if (v28 && *((int *)v8 + 661) >= 1)
  {
    uint64_t v36 = [v8 staticDefectTable];

    if (v36)
    {
      uint64_t v37 = [v138 pdcMarkStaticDefects];
      [v15 setComputePipelineState:v37];

      uint64_t v38 = [v8 staticDefectTable];
      [v15 setBuffer:v38 offset:0 atIndex:0];

      [v15 setTexture:v132 atIndex:0];
      uint64_t v173 = *((int *)v8 + 661);
      int64x2_t v174 = vdupq_n_s64(1uLL);
      long long v171 = xmmword_263480460;
      uint64_t v172 = 1;
      [v15 dispatchThreads:&v173 threadsPerThreadgroup:&v171];
      goto LABEL_19;
    }
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    goto LABEL_113;
  }
LABEL_19:
  uint64_t v39 = v141;
  [v15 setComputePipelineState:v141];
  [v15 setTexture:v132 atIndex:0];
  uint64_t v40 = [v8 pdpGainTex];
  [v15 setTexture:v40 atIndex:1];

  uint64_t v41 = [v8 xtalkLutTex];
  [v15 setTexture:v41 atIndex:2];

  uint64_t v42 = [v8 flatThdLutTex];
  [v15 setTexture:v42 atIndex:3];

  [v15 setBytes:v8 + 1336 length:552 atIndex:0];
  [v15 setBytes:v8 + 1888 length:200 atIndex:1];
  if (v8[2089])
  {
    unint64_t v43 = ((unint64_t)*((unsigned __int16 *)v8 + 673) + 3) >> 2;
    *(void *)&long long v176 = ((unint64_t)*((unsigned __int16 *)v8 + 672) + 7) >> 3;
    *((void *)&v176 + 1) = v43;
    *(void *)&long long v177 = 1;
    long long v169 = xmmword_263380150;
    uint64_t v170 = 1;
    [v15 dispatchThreadgroups:&v176 threadsPerThreadgroup:&v169];
  }
  else
  {
    unint64_t v44 = *((unsigned __int16 *)v8 + 672) * (unint64_t)*((unsigned __int16 *)v8 + 673);
    v168[0] = *((unsigned __int16 *)v8 + 681);
    v168[1] = v44;
    uint64_t v39 = v141;
    v168[2] = 1;
    v167[0] = v168[0];
    v167[1] = (unint64_t)[v141 maxTotalThreadsPerThreadgroup] / v168[0];
    v167[2] = 1;
    [v15 dispatchThreads:v168 threadsPerThreadgroup:v167];
  }
  [v15 endEncoding];

  [v140 commit];
LABEL_23:
  id v45 = [v10 allocator];
  unint64_t v46 = (void *)[v45 newBufferDescriptor];

  if (!v46)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    v135 = 0;
LABEL_109:
    unsigned int v15 = 0;
    goto LABEL_115;
  }
  uint64_t v47 = *((int *)v8 + 661);
  if (v47) {
    uint64_t v48 = 4 * v47;
  }
  else {
    uint64_t v48 = 4;
  }
  [v46 setLength:v48];
  [v46 setOptions:0];
  [v46 setLabel:0];
  int v49 = [v10 allocator];
  long long v50 = (void *)[v49 newBufferWithDescriptor:v46];
  id v175 = v50;

  v135 = v46;
  if (!v50) {
    goto LABEL_108;
  }
  long long v139 = v8;
  if (*((int *)v8 + 661) < 1)
  {
    uint64_t v72 = v14;
    double v12 = v138;
    goto LABEL_37;
  }
  id v51 = [v8 staticDefectTable];

  if (!v51)
  {
LABEL_108:
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    goto LABEL_109;
  }
  id v52 = [v10 commandBuffer];

  if (!v52)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    unsigned int v15 = 0;
    uint64_t v14 = 0;
    goto LABEL_115;
  }
  uint64_t v53 = [v52 computeCommandEncoder];
  double v12 = v138;
  if (!v53)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    unsigned int v15 = 0;
    uint64_t v14 = v52;
    id v10 = v140;
    goto LABEL_91;
  }
  id v54 = (void *)v53;
  v131 = v52;
  unsigned __int16 v55 = [v138 pdcMarkStaticDefects];
  [v54 setComputePipelineState:v55];

  int v56 = [v8 staticDefectTable];
  [v54 setBuffer:v56 offset:0 atIndex:0];

  [v54 setTexture:v9 atIndex:0];
  uint64_t v57 = *((int *)v8 + 661);
  uint64_t v164 = 1;
  uint64_t v165 = v57;
  int64x2_t v166 = vdupq_n_s64(1uLL);
  long long v163 = xmmword_263480460;
  [v54 dispatchThreads:&v165 threadsPerThreadgroup:&v163];
  id v58 = v9;
  if (*((_DWORD *)v8 + 662))
  {
    unint64_t v59 = 0;
    uint64_t v60 = 0;
    int64x2_t v142 = vdupq_n_s64(1uLL);
    do
    {
      uint64_t v61 = *(int *)&v8[4 * v59 + 2652];
      uint64_t v62 = [v138 pdcStaticDefectReplace];
      [v54 setComputePipelineState:v62];

      [v54 setTexture:v58 atIndex:0];
      id v63 = [v8 staticDefectTable];
      [v54 setBuffer:v63 offset:0 atIndex:1];

      [v54 setBuffer:v50 offset:0 atIndex:2];
      long long v64 = [v8 staticDefectProcessIndexList];
      [v54 setBuffer:v64 offset:4 * v60 atIndex:3];

      uint64_t v161 = v61;
      int64x2_t v162 = v142;
      long long v159 = xmmword_263480460;
      uint64_t v160 = 1;
      [v54 dispatchThreads:&v161 threadsPerThreadgroup:&v159];
      int v65 = [v138 pdcWriteStaticDefectReplace];
      [v54 setComputePipelineState:v65];

      int64x2_t v66 = [v8 staticDefectTable];
      [v54 setBuffer:v66 offset:0 atIndex:1];

      [v54 setBuffer:v50 offset:0 atIndex:2];
      int64x2_t v67 = [v8 staticDefectProcessIndexList];
      [v54 setBuffer:v67 offset:4 * v60 atIndex:3];

      [v54 setTexture:v58 atIndex:0];
      uint64_t v156 = 1;
      uint64_t v157 = v61;
      int64x2_t v158 = v142;
      long long v155 = xmmword_263480460;
      [v54 dispatchThreads:&v157 threadsPerThreadgroup:&v155];
      v60 += v61;
      ++v59;
    }
    while (v59 < *((int *)v8 + 662));
  }
  int64x2_t v68 = [v138 pdcWriteStaticDefectLookup];
  [v54 setComputePipelineState:v68];

  uint64_t v69 = [v8 staticDefectTable];
  [v54 setBuffer:v69 offset:0 atIndex:0];

  uint64_t v70 = [v8 staticDefectPerLineIndexBase];
  [v54 setBuffer:v70 offset:0 atIndex:1];

  [v54 setTexture:v58 atIndex:0];
  uint64_t v71 = *((int *)v8 + 661);
  uint64_t v152 = 1;
  uint64_t v153 = v71;
  int64x2_t v154 = vdupq_n_s64(1uLL);
  long long v151 = xmmword_263480460;
  [v54 dispatchThreads:&v153 threadsPerThreadgroup:&v151];
  [v54 endEncoding];

  id v10 = v140;
  [v140 commit];
  id v9 = v58;
  uint64_t v72 = v131;
LABEL_37:
  uint64_t v14 = [v10 commandBuffer];

  if (!v14)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    unsigned int v15 = 0;
    id v8 = v139;
    goto LABEL_91;
  }
  unsigned int v15 = [v14 computeCommandEncoder];
  id v8 = v139;
  if (!v15)
  {
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
    goto LABEL_91;
  }
  long long v144 = v14;
  uint64_t v73 = [v12 pdcDetectionCorrectionScan];
  v192[0] = @"hasCommonDynDesp0";
  int64x2_t v74 = [NSNumber numberWithBool:v139[2216]];
  v193[0] = v74;
  v192[1] = @"highlightDetectionEnabled";
  long long v75 = [NSNumber numberWithBool:v139[2217]];
  v193[1] = v75;
  v192[2] = @"dirIntEnDP";
  uint64_t v76 = [NSNumber numberWithBool:v139[191]];
  v193[2] = v76;
  v192[3] = @"commonBayer";
  uint64_t v77 = [NSNumber numberWithInt:*((unsigned int *)v139 + 523)];
  v193[3] = v77;
  int64x2_t v78 = [NSDictionary dictionaryWithObjects:v193 forKeys:v192 count:4];
  long long v79 = [v73 getPipelineStateWithParams:v78];

  if (v79)
  {
    [v15 setComputePipelineState:v79];
    [v15 setTexture:v9 atIndex:0];
    [v15 setTexture:v137 atIndex:1];
    uint64_t v80 = [v139 detectionDynDesp0LutTex];
    [v15 setTexture:v80 atIndex:2];

    uint64_t v81 = [v139 detectionDynDesp12LutTex];
    [v15 setTexture:v81 atIndex:3];

    int64x2_t v82 = [v139 detectionHighlightLutTex];
    [v15 setTexture:v82 atIndex:4];

    long long v83 = [v139 flatThdLutTex];
    [v15 setTexture:v83 atIndex:5];

    [v15 setBytes:v139 + 2112 length:104 atIndex:0];
    [v15 setBytes:v139 + 2218 length:200 atIndex:1];
    [v15 setBytes:v136 length:192 atIndex:2];
    [v15 setBytes:v139 + 1336 length:552 atIndex:3];
    [v15 setBytes:v139 + 1888 length:200 atIndex:4];
    LOWORD(v169) = 160;
    [v15 setBytes:&v169 length:2 atIndex:5];
    unint64_t v84 = ([v9 width] + 183) / 0xB8uLL;
    uint64_t v85 = [v140 device];
    int64x2_t v86 = (void *)[v85 newBufferWithLength:4128 * v84 options:0];

    if (v86)
    {
      id v87 = v86;
      uint64_t v88 = [v87 contents];
      uint64_t v89 = v139 + 1336;
      *(void *)&long long v90 = -1;
      *((void *)&v90 + 1) = -1;
      long long v190 = v90;
      long long v191 = v90;
      long long v188 = v90;
      long long v189 = v90;
      long long v186 = v90;
      long long v187 = v90;
      long long v184 = v90;
      long long v185 = v90;
      long long v182 = v90;
      long long v183 = v90;
      long long v180 = v90;
      long long v181 = v90;
      long long v178 = v90;
      long long v179 = v90;
      long long v176 = v90;
      long long v177 = v90;
      int v91 = *((unsigned __int16 *)v139 + 677);
      if (*((_WORD *)v139 + 677))
      {
        int v92 = 0;
        unsigned int v93 = 0;
        uint64_t v94 = *((unsigned __int16 *)v139 + 681);
        do
        {
          if (v94)
          {
            uint64_t v95 = 0;
            int v96 = 0;
            char v97 = 0;
            id v98 = (unsigned __int16 *)(v139 + 1370);
            do
            {
              int v99 = *v98;
              v98 += 2;
              if (v92 == v99)
              {
                *((unsigned char *)&v176 + 16 * v96++ + v93) = v95;
                char v97 = 1;
              }
              ++v95;
            }
            while (v94 != v95);
          }
          else
          {
            char v97 = 0;
          }
          v93 += v97 & 1;
          ++v92;
        }
        while (v92 != v91);
      }
      id v100 = v9;
      if ((int)v84 >= 1)
      {
        uint64_t v101 = 0;
        int v102 = 0;
        unsigned int v103 = *((unsigned __int16 *)v139 + 680);
        unsigned int v104 = v103;
        do
        {
          if (v104)
          {
            unint64_t v105 = 0;
            int v106 = *((unsigned __int16 *)v139 + 670);
            int v107 = *((unsigned __int16 *)v139 + 676);
            int v108 = (v102 - 4 - v106) / v107;
            unsigned int v109 = (v102 - v106 + 187) / v107 - v108;
            if ((int)(v109 + 1) > 1) {
              int v110 = v109 + 1;
            }
            else {
              int v110 = 1;
            }
            do
            {
              if (v109 <= 0x7FFFFFFE)
              {
                int v111 = 0;
                int v112 = 0;
                while (2)
                {
                  uint64_t v113 = 0;
                  int v114 = *((unsigned __int16 *)v139 + 670) + (v111 + v108) * *((unsigned __int16 *)v139 + 676);
                  do
                  {
                    uint64_t v115 = *((unsigned __int8 *)&v176 + v105 + v113);
                    if (v115 == 255) {
                      break;
                    }
                    if (*((unsigned __int16 *)v139 + 681) <= v115)
                    {
                      uint64_t v129 = v134;
                      LODWORD(v128) = 0;
LABEL_81:
                      FigDebugAssert3();
                      int v121 = FigSignalErrorAt();

                      id v9 = v100;
                      id v8 = v139;
                      goto LABEL_82;
                    }
                    int v116 = v114 + *(unsigned __int16 *)&v89[4 * *((unsigned __int8 *)&v176 + v105 + v113) + 32];
                    BOOL v117 = v116 >= v102 - 4 && v116 < v102 + 188;
                    if (v117 && v116 >= *((unsigned __int16 *)v139 + 670) && v116 < *((unsigned __int16 *)v139 + 674))
                    {
                      if (v112 >= 64)
                      {
                        uint64_t v129 = v134;
                        LODWORD(v128) = 0;
                        goto LABEL_81;
                      }
                      if (v105 >= 0x20)
                      {
                        uint64_t v129 = v134;
                        LODWORD(v128) = 0;
                        goto LABEL_81;
                      }
                      __int16 v118 = v116 - v102 + 4;
                      if ((v118 & 0xFC00) != 0)
                      {
                        uint64_t v129 = v134;
                        LODWORD(v128) = 0;
                        goto LABEL_81;
                      }
                      *(_WORD *)(v88 + 4128 * v101 + ((uint64_t)v112++ << 6) + 2 * v105) = ((v89[v115 + 96] & 3) << 10) & 0xCC00 | ((v89[v115 + 112] & 3) << 12) | v118 & 0x3FF;
                    }
                    v113 += 16;
                  }
                  while (v113 != 256);
                  *(unsigned char *)(v88 + 4128 * v101 + v105 + 4096) = v112;
                  if (++v111 != v110) {
                    continue;
                  }
                  break;
                }
                unsigned int v103 = *((unsigned __int16 *)v139 + 680);
                id v9 = v100;
              }
              ++v105;
              unsigned int v104 = v103;
            }
            while (v105 < v103);
          }
          v102 += 184;
          ++v101;
        }
        while (v101 != v84);
      }
      [v15 setBuffer:v87 offset:0 atIndex:6];
      [v15 setBuffer:v175 offset:0 atIndex:7];
      v119 = [v139 staticDefectPerLineIndexBase];

      if (v119)
      {
        int v120 = [v139 staticDefectPerLineIndexBase];
        [v15 setBuffer:v120 offset:0 atIndex:8];
      }
      else
      {
        LODWORD(v176) = 0;
        [v15 setBytes:&v176 length:4 atIndex:8];
      }
      uint64_t v14 = v144;
      v150[0] = v84;
      v150[1] = ((v133 + 159) * (unsigned __int128)0x19999999999999AuLL) >> 64;
      v150[2] = 1;
      long long v148 = xmmword_263482230;
      uint64_t v149 = 1;
      [v15 dispatchThreadgroups:v150 threadsPerThreadgroup:&v148];
      [v15 endEncoding];

      id v10 = v140;
      [v140 commit];

      if (v136[5] && v139[2492])
      {
        v122 = [v140 commandBuffer];

        if (v122)
        {
          uint64_t v123 = [v122 computeCommandEncoder];
          if (v123)
          {
            uint64_t v124 = (void *)v123;
            uint64_t v125 = [v138 hoclXtalkCorrectionKernel];
            [v124 setComputePipelineState:v125];

            [v124 setTexture:v137 atIndex:0];
            uint64_t v126 = [v139 hoclStaticXtalkLutTex];
            [v124 setTexture:v126 atIndex:1];

            [v124 setBytes:v139 + 2420 length:96 atIndex:0];
            v147[0] = v130 >> 1;
            v147[1] = v133 >> 1;
            v147[2] = 1;
            int64x2_t v145 = vdupq_n_s64(0x20uLL);
            uint64_t v146 = 1;
            id v9 = v100;
            id v8 = v139;
            [v124 dispatchThreads:v147 threadsPerThreadgroup:&v145];
            [v124 endEncoding];

            id v10 = v140;
            [v140 commit];
            unsigned int v15 = 0;
            int v121 = 0;
            uint64_t v14 = v122;
            double v12 = v138;
            goto LABEL_91;
          }
          uint64_t v129 = v134;
          LODWORD(v128) = 0;
          FigDebugAssert3();
          int v121 = FigSignalErrorAt();
          unsigned int v15 = 0;
          uint64_t v14 = v122;
          id v8 = v139;
          id v10 = v140;
LABEL_115:
          double v12 = v138;
          goto LABEL_91;
        }
        uint64_t v129 = v134;
        LODWORD(v128) = 0;
        FigDebugAssert3();
        int v121 = FigSignalErrorAt();
        unsigned int v15 = 0;
        uint64_t v14 = 0;
      }
      else
      {
        unsigned int v15 = 0;
        int v121 = 0;
      }
      double v12 = v138;
      id v8 = v139;
      goto LABEL_91;
    }
    uint64_t v129 = v134;
    LODWORD(v128) = 0;
    FigDebugAssert3();
    int v121 = FigSignalErrorAt();
  }
  else
  {
    int v121 = FigSignalErrorAt();
  }
LABEL_82:
  id v10 = v140;
  double v12 = v138;
  uint64_t v14 = v144;
LABEL_91:
  objc_msgSend(v15, "endEncoding", v128, v129);
  FigMetalDecRef();

  return v121;
}

- (int)runQuadraPDCWithArgs:(id)a3 inputTex:(id *)a4 outputTex:(id *)a5
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v110 = [(H13FastRawScaleStage *)self metal];
  int v106 = [(H13FastRawScaleStage *)self shaders];
  id v7 = *a4;
  id v142 = 0;
  id v103 = *a5;
  id v141 = 0;
  id v140 = 0;
  id v139 = 0;
  uint64_t v8 = [v7 width];
  unint64_t v105 = v7;
  uint64_t v9 = [v7 height];
  id v10 = [v110 allocator];
  uint64_t v11 = (void *)[v10 newTextureDescriptor];

  int v107 = v11;
  if (!v11)
  {
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    goto LABEL_66;
  }
  double v12 = [v11 desc];
  [v12 setTextureType:2];

  id v13 = [v11 desc];
  [v13 setWidth:v8];

  uint64_t v14 = [v11 desc];
  [v14 setHeight:v9];

  unsigned int v15 = [v11 desc];
  [v15 setUsage:3];

  long long v16 = v6[11];
  long long v18 = v6[9];
  long long v17 = v6[10];
  v138[3] = v6[12];
  v138[2] = v16;
  v138[0] = v18;
  v138[1] = v17;
  long long v19 = v6[15];
  long long v21 = v6[13];
  long long v20 = v6[14];
  v138[7] = v6[16];
  v138[6] = v19;
  v138[4] = v21;
  v138[5] = v20;
  long long v22 = v6[19];
  long long v24 = v6[17];
  long long v23 = v6[18];
  v138[11] = v6[20];
  v138[10] = v22;
  v138[8] = v24;
  v138[9] = v23;
  memcpy(__dst, v6 + 21, sizeof(__dst));
  long long v26 = v6[159];
  long long v25 = v6[160];
  v136[0] = v6[158];
  v136[1] = v26;
  v136[2] = v25;
  long long v27 = v6[163];
  long long v29 = v6[161];
  long long v28 = v6[162];
  v136[6] = v6[164];
  v136[5] = v27;
  v136[3] = v29;
  v136[4] = v28;
  uint64_t v30 = *((void *)v6 + 230);
  long long v134 = v6[114];
  uint64_t v135 = v30;
  if (*((int *)v6 + 661) >= 1)
  {
    id v31 = [v110 allocator];
    uint64_t v32 = (void *)[v31 newBufferDescriptor];

    if (v32)
    {
      [v32 setLength:8 * *((int *)v6 + 661)];
      [v32 setOptions:0];
      [v32 setLabel:0];
      id v33 = [v110 allocator];
      uint64_t v34 = (void *)[v33 newBufferWithDescriptor:v32];
      id v140 = v34;

      uint64_t v35 = [v6 staticDefectTable];
      uint64_t v36 = (void *)v35;
      if (v34)
      {
        if (v35)
        {
          uint64_t v37 = [v110 commandBuffer];
          unsigned int v109 = v37;
          if (v37)
          {
            uint64_t v38 = [v37 computeCommandEncoder];
            if (v38)
            {
              uint64_t v39 = [v106 qpdcReplaceStaticDefectsKernel];
              [v38 setComputePipelineState:v39];

              [v38 setTexture:v105 atIndex:0];
              [v38 setBytes:v138 length:192 atIndex:2];
              [v38 setBuffer:v36 offset:0 atIndex:0];
              [v38 setBuffer:v140 offset:0 atIndex:1];
              uint64_t v132 = *((int *)v6 + 661);
              int64x2_t v133 = vdupq_n_s64(1uLL);
              long long v130 = xmmword_263480460;
              uint64_t v131 = 1;
              [v38 dispatchThreads:&v132 threadsPerThreadgroup:&v130];
              uint64_t v40 = [v106 qpdcWriteCorrectedStaticDefectsKernel];
              [v38 setComputePipelineState:v40];

              [v38 setTexture:v105 atIndex:0];
              [v38 setBuffer:v36 offset:0 atIndex:0];
              [v38 setBuffer:v140 offset:0 atIndex:1];
              uint64_t v128 = *((int *)v6 + 661);
              int64x2_t v129 = vdupq_n_s64(1uLL);
              long long v126 = xmmword_263480460;
              uint64_t v127 = 1;
              [v38 dispatchThreads:&v128 threadsPerThreadgroup:&v126];
              [v38 endEncoding];
              [v110 commit];
              FigMetalDecRef();

              uint64_t v41 = v109;
              goto LABEL_10;
            }
            uint64_t v98 = v99;
            LODWORD(v97) = 0;
            FigDebugAssert3();
LABEL_74:
            int v94 = FigSignalErrorAt();

LABEL_75:
            unsigned int v104 = 0;
            uint64_t v77 = 0;
            id v108 = 0;
            goto LABEL_54;
          }
          uint64_t v98 = v99;
          LODWORD(v97) = 0;
        }
        else
        {
          uint64_t v98 = v99;
          LODWORD(v97) = 0;
        }
        FigDebugAssert3();
        unsigned int v109 = 0;
        goto LABEL_74;
      }
      uint64_t v98 = v99;
      LODWORD(v97) = 0;
      FigDebugAssert3();
      unsigned int v109 = 0;
      goto LABEL_74;
    }
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
LABEL_66:
    FigDebugAssert3();
    int v94 = FigSignalErrorAt();
    unsigned int v104 = 0;
    uint64_t v77 = 0;
    id v108 = 0;
LABEL_67:
    uint64_t v38 = 0;
    goto LABEL_79;
  }
  uint64_t v38 = 0;
  uint64_t v41 = 0;
LABEL_10:
  if (*((unsigned char *)v6 + 148))
  {
    unsigned int v109 = v41;
    uint64_t v42 = [(H13FastRawScaleStage *)self createIntermediateMetalTexture:@"h13f.replacedRBfpTex" pixelFormat:25 width:v8 height:v9];
    id v142 = v42;
    if (!v42)
    {
      int v96 = FigSignalErrorAt();
      goto LABEL_81;
    }
    uint64_t v41 = [v110 commandBuffer];

    if (!v41) {
      goto LABEL_78;
    }
    unint64_t v43 = [v41 blitCommandEncoder];
    [v43 copyFromTexture:v105 toTexture:v42];
    [v43 endEncoding];
    [v110 commit];
  }
  if (!BYTE3(v138[0])) {
    goto LABEL_24;
  }
  unint64_t v44 = [v6 xtalkLutTex];
  BOOL v45 = v44 == 0;

  if (v45
    || ([v6 xtalkLutTex],
        unint64_t v46 = objc_claimAutoreleasedReturnValue(),
        BOOL v47 = [v46 arrayLength] == 128,
        v46,
        !v47))
  {
    int v94 = FigSignalErrorAt();
    unsigned int v104 = 0;
    uint64_t v77 = 0;
    id v108 = 0;
    goto LABEL_56;
  }
  unsigned int v109 = [v110 commandBuffer];

  if (!v109)
  {
LABEL_78:
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    FigDebugAssert3();
    int v94 = FigSignalErrorAt();
    unsigned int v104 = 0;
    uint64_t v77 = 0;
    id v108 = 0;
    goto LABEL_79;
  }
  uint64_t v48 = [v109 computeCommandEncoder];

  if (!v48)
  {
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    FigDebugAssert3();
    int v94 = FigSignalErrorAt();
    goto LABEL_75;
  }
  uint64_t v168 = 0;
  id v49 = v105;
  id v169 = v49;
  long long v170 = xmmword_263482240;
  id v171 = v142;
  long long v172 = xmmword_263481E30;
  uint64_t v50 = [v6 xtalkLutTex];
  long long v174 = xmmword_263481600;
  uint64_t v173 = v50;
  uint64_t v175 = 0;
  uint64_t v176 = -1;
  uint64_t v145 = 0;
  LOBYTE(v146) = 0;
  v147.i64[0] = 192;
  v147.i64[1] = (uint64_t)v138;
  id v148 = 0;
  int64x2_t v149 = vdupq_n_s64(1uLL);
  LOBYTE(v150) = 0;
  *(void *)&long long v151 = 400;
  *((void *)&v151 + 1) = __dst;
  uint64_t v152 = 0;
  long long v153 = xmmword_2634804A0;
  LOBYTE(v154) = 0;
  *(void *)&long long v155 = 112;
  *((void *)&v155 + 1) = v136;
  uint64_t v156 = 0;
  long long v157 = xmmword_2634804B0;
  char v158 = 0;
  uint64_t v159 = 24;
  uint64_t v160 = &v134;
  uint64_t v161 = 0;
  long long v162 = xmmword_263481600;
  char v163 = 0;
  uint64_t v164 = -1;
  uint64_t v165 = 0;
  uint64_t v166 = 0;
  uint64_t v167 = -1;
  id v51 = [v106 qpdcFocusPixelCorrectionKernel];
  [v48 setComputePipelineState:v51];

  +[SoftISPArgsTools setAllArgumentsOnEncoder:v48 textures:&v168 argIdentifiers:&v145];
  v125[0] = (unint64_t)[v49 width] >> 3;
  v125[1] = (unint64_t)[v49 height] >> 3;
  v125[2] = 1;
  int64x2_t v123 = vdupq_n_s64(0x10uLL);
  uint64_t v124 = 1;
  [v48 dispatchThreads:v125 threadsPerThreadgroup:&v123];
  [v48 endEncoding];

  [v110 commit];
  for (uint64_t i = 224; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v145 + i));
  for (uint64_t j = 80; j != -16; j -= 24)

  uint64_t v38 = 0;
  uint64_t v41 = v109;
LABEL_24:
  if (*((int *)v6 + 661) >= 1)
  {
    unsigned int v109 = v41;
    id v54 = [v110 allocator];
    unsigned __int16 v55 = (void *)[v54 newBufferDescriptor];

    if (v55)
    {
      [v55 setLength:8 * *((int *)v6 + 661)];
      [v55 setOptions:0];
      [v55 setLabel:0];
      int v56 = [v110 allocator];
      uint64_t v57 = (void *)[v56 newBufferWithDescriptor:v55];
      id v58 = v141;
      id v141 = v57;

      uint64_t v59 = [v6 staticDefectTable];
      uint64_t v60 = (void *)v59;
      if (v141 && v59)
      {
        uint64_t v41 = [v110 commandBuffer];

        if (v41)
        {
          uint64_t v61 = [v41 computeCommandEncoder];

          if (v61)
          {
            uint64_t v62 = [v106 qpdcCorrectStaticDefectsKernel];
            [v61 setComputePipelineState:v62];

            [v61 setTexture:v105 atIndex:0];
            [v61 setBytes:v138 length:192 atIndex:2];
            [v61 setBytes:__dst length:400 atIndex:3];
            [v61 setBuffer:v60 offset:0 atIndex:0];
            [v61 setBuffer:v141 offset:0 atIndex:1];
            uint64_t v121 = *((int *)v6 + 661);
            int64x2_t v122 = vdupq_n_s64(1uLL);
            long long v119 = xmmword_263480460;
            uint64_t v120 = 1;
            [v61 dispatchThreads:&v121 threadsPerThreadgroup:&v119];
            id v63 = [v106 qpdcWriteCorrectedStaticDefectsKernel];
            [v61 setComputePipelineState:v63];

            [v61 setTexture:v105 atIndex:0];
            [v61 setBuffer:v60 offset:0 atIndex:0];
            [v61 setBuffer:v141 offset:0 atIndex:1];
            uint64_t v117 = *((int *)v6 + 661);
            int64x2_t v118 = vdupq_n_s64(1uLL);
            long long v115 = xmmword_263480460;
            uint64_t v116 = 1;
            [v61 dispatchThreads:&v117 threadsPerThreadgroup:&v115];
            [v61 endEncoding];

            [v110 commit];
            FigMetalDecRef();

            uint64_t v38 = 0;
            goto LABEL_31;
          }
          uint64_t v98 = v99;
          LODWORD(v97) = 0;
          FigDebugAssert3();
          uint64_t v38 = 0;
          unsigned int v109 = v41;
        }
        else
        {
          uint64_t v98 = v99;
          LODWORD(v97) = 0;
          FigDebugAssert3();
          unsigned int v109 = 0;
        }
      }
      else
      {
        uint64_t v98 = v99;
        LODWORD(v97) = 0;
        FigDebugAssert3();
      }
      int v94 = FigSignalErrorAt();

LABEL_88:
      unsigned int v104 = 0;
      uint64_t v77 = 0;
      id v108 = 0;
      goto LABEL_57;
    }
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    FigDebugAssert3();
    int v96 = FigSignalErrorAt();
LABEL_81:
    int v94 = v96;
    goto LABEL_88;
  }
LABEL_31:
  id v108 = v105;
  [v107 setLabel:0];
  long long v64 = [v107 desc];
  [v64 setPixelFormat:13];

  int v65 = [v110 allocator];
  int64x2_t v66 = (void *)[v65 newTextureWithDescriptor:v107];
  id v67 = v139;
  id v139 = v66;

  if (!v66)
  {
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    FigDebugAssert3();
    int v94 = FigSignalErrorAt();
    unsigned int v104 = 0;
    uint64_t v77 = 0;
    goto LABEL_56;
  }
  unsigned int v109 = [v110 commandBuffer];

  if (!v109)
  {
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    FigDebugAssert3();
    int v94 = FigSignalErrorAt();
    unsigned int v104 = 0;
    uint64_t v77 = 0;
LABEL_79:
    unsigned int v109 = 0;
    goto LABEL_57;
  }
  int64x2_t v68 = [v109 computeCommandEncoder];

  if (v68)
  {
    memcpy(v114, v6 + 46, sizeof(v114));
    v143[0] = @"dpMaxOuterCenter";
    uint64_t v69 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 163)];
    v144[0] = v69;
    v143[1] = @"dpMaxOuterCorner";
    uint64_t v70 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 164)];
    v144[1] = v70;
    v143[2] = @"dpMaxOuterEdge";
    uint64_t v71 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 165)];
    v144[2] = v71;
    v143[3] = @"popMaxOuterCenter";
    uint64_t v72 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 160)];
    v144[3] = v72;
    v143[4] = @"popMaxOuterCorner";
    uint64_t v73 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 161)];
    v144[4] = v73;
    v143[5] = @"popMaxOuterEdge";
    int64x2_t v74 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 162)];
    v144[5] = v74;
    v143[6] = @"popMaxInner";
    long long v75 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v6 + 158)];
    v144[6] = v75;
    unsigned int v104 = [NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:7];

    uint64_t v76 = [v106 qpdcDynamicDetectKernel];
    uint64_t v77 = [v76 getPipelineStateWithParams:v104];

    if (!v77)
    {
      int v94 = FigSignalErrorAt();
      uint64_t v77 = 0;
      uint64_t v38 = v68;
      goto LABEL_57;
    }
    [v68 setComputePipelineState:v77];
    uint64_t v168 = 0;
    id v108 = v108;
    id v169 = v108;
    int64x2_t v100 = vdupq_n_s64(1uLL);
    long long v170 = (__int128)v100;
    id v78 = v139;
    long long v172 = xmmword_263480490;
    id v171 = v78;
    uint64_t v173 = 0;
    *(void *)&long long v174 = -1;
    uint64_t v145 = 0;
    LOBYTE(v146) = 0;
    v147.i64[0] = 192;
    v147.i64[1] = (uint64_t)v138;
    id v148 = 0;
    int64x2_t v149 = v100;
    LOBYTE(v150) = 0;
    *(void *)&long long v151 = 600;
    *((void *)&v151 + 1) = v114;
    uint64_t v152 = 0;
    long long v153 = xmmword_2634804A0;
    LOBYTE(v154) = 0;
    *(void *)&long long v155 = 112;
    *((void *)&v155 + 1) = v136;
    uint64_t v156 = 0;
    long long v157 = xmmword_263481600;
    char v158 = 0;
    uint64_t v159 = -1;
    uint64_t v160 = 0;
    uint64_t v161 = 0;
    *(void *)&long long v162 = -1;
    +[SoftISPArgsTools setAllArgumentsOnEncoder:v68 textures:&v168 argIdentifiers:&v145];
    v113[0] = (unint64_t)[v78 width] >> 1;
    v113[1] = (unint64_t)[v78 height] >> 1;
    v113[2] = 1;
    int64x2_t v123 = vdupq_n_s64(0x10uLL);
    uint64_t v124 = 1;
    [v68 dispatchThreads:v113 threadsPerThreadgroup:&v123];
    [v68 endEncoding];

    [v110 commit];
    for (uint64_t k = 176; k != -16; k -= 48)
      objc_destroyWeak((id *)((char *)&v145 + k));
    for (uint64_t m = 56; m != -16; m -= 24)

    uint64_t v41 = [v110 commandBuffer];

    if (v41)
    {
      uint64_t v81 = [v41 computeCommandEncoder];
      if (v81)
      {
        int64x2_t v82 = [v106 qpdcDynamicCorrectKernel];
        [v81 setComputePipelineState:v82];

        uint64_t v168 = 0;
        id v108 = v108;
        id v169 = v108;
        long long v170 = xmmword_2634804A0;
        id v83 = v103;
        id v171 = v83;
        long long v172 = xmmword_263482250;
        id v84 = v139;
        long long v174 = xmmword_263481600;
        uint64_t v173 = (uint64_t)v84;
        uint64_t v175 = 0;
        uint64_t v176 = -1;
        uint64_t v145 = 0;
        LOBYTE(v146) = 0;
        v147.i64[0] = 192;
        v147.i64[1] = (uint64_t)v138;
        id v148 = 0;
        int64x2_t v149 = vdupq_n_s64(1uLL);
        LOBYTE(v150) = 0;
        *(void *)&long long v151 = 400;
        *((void *)&v151 + 1) = __dst;
        uint64_t v152 = 0;
        long long v153 = xmmword_263481600;
        LOBYTE(v154) = 0;
        long long v155 = 0xFFFFFFFFFFFFFFFFLL;
        uint64_t v156 = 0;
        *(void *)&long long v157 = -1;
        +[SoftISPArgsTools setAllArgumentsOnEncoder:v81 textures:&v168 argIdentifiers:&v145];
        v112[0] = (unint64_t)[v83 width] >> 1;
        v112[1] = (unint64_t)[v83 height] >> 1;
        v112[2] = 1;
        int64x2_t v123 = vdupq_n_s64(0x10uLL);
        uint64_t v124 = 1;
        [v81 dispatchThreads:v112 threadsPerThreadgroup:&v123];
        [v81 endEncoding];

        [v110 commit];
        for (uint64_t n = 128; n != -16; n -= 48)
          objc_destroyWeak((id *)((char *)&v145 + n));
        for (iuint64_t i = 80; ii != -16; ii -= 24)

        if (*((unsigned char *)v6 + 148))
        {
          id v108 = v108;
          unsigned int v109 = [v110 commandBuffer];

          if (v109
            && ([v109 computeCommandEncoder], (id v87 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v88 = [v106 qhoclXtalkCorrectionKernel];
            [v87 setComputePipelineState:v88];

            uint64_t v145 = 0;
            id v89 = v83;
            id v146 = v89;
            int64x2_t v147 = vdupq_n_s64(1uLL);
            id v148 = v142;
            int64x2_t v149 = (int64x2_t)xmmword_2634804A0;
            id v90 = v108;
            id v150 = v90;
            long long v151 = xmmword_2634804B0;
            uint64_t v152 = [v6 hoclXtalkLutTex];
            long long v153 = xmmword_2634804C0;
            uint64_t v91 = [v6 hoclStaticXtalkLutTex];
            long long v155 = xmmword_263481600;
            uint64_t v154 = v91;
            uint64_t v156 = 0;
            *(void *)&long long v157 = -1;
            uint64_t v168 = 0;
            LOBYTE(v169) = 0;
            *(void *)&long long v170 = 96;
            *((void *)&v170 + 1) = (char *)v6 + 2420;
            id v171 = 0;
            long long v172 = xmmword_263481600;
            LOBYTE(v173) = 0;
            long long v174 = 0xFFFFFFFFFFFFFFFFLL;
            uint64_t v175 = 0;
            uint64_t v176 = -1;
            +[SoftISPArgsTools setAllArgumentsOnEncoder:v87 textures:&v145 argIdentifiers:&v168];
            v111[0] = (unint64_t)[v90 width] >> 1;
            v111[1] = (unint64_t)[v90 height] >> 1;
            v111[2] = 1;
            int64x2_t v123 = vdupq_n_s64(0x10uLL);
            uint64_t v124 = 1;
            [v87 dispatchThreads:v111 threadsPerThreadgroup:&v123];
            [v87 endEncoding];

            [v110 commit];
            for (juint64_t j = 80; jj != -16; jj -= 48)
              objc_destroyWeak((id *)((char *)&v168 + jj));
            for (kuint64_t k = 128; kk != -16; kk -= 24)

            *a4 = v89;
            int v94 = 0;
            *a5 = v90;
          }
          else
          {
            uint64_t v98 = v99;
            LODWORD(v97) = 0;
            FigDebugAssert3();
            int v94 = FigSignalErrorAt();
          }

          goto LABEL_54;
        }
        uint64_t v38 = 0;
        int v94 = 0;
      }
      else
      {
        uint64_t v98 = v99;
        LODWORD(v97) = 0;
        FigDebugAssert3();
        int v94 = FigSignalErrorAt();
        uint64_t v38 = 0;
      }
LABEL_56:
      unsigned int v109 = v41;
      goto LABEL_57;
    }
    uint64_t v98 = v99;
    LODWORD(v97) = 0;
    FigDebugAssert3();
    int v94 = FigSignalErrorAt();
    goto LABEL_67;
  }
  uint64_t v98 = v99;
  LODWORD(v97) = 0;
  FigDebugAssert3();
  int v94 = FigSignalErrorAt();
  unsigned int v104 = 0;
  uint64_t v77 = 0;
LABEL_54:
  uint64_t v38 = 0;
LABEL_57:
  objc_msgSend(v38, "endEncoding", v97, v98);
  FigMetalDecRef();
  FigMetalDecRef();

  return v94;
}

@end