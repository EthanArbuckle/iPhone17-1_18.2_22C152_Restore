@interface CMIColourConstancyClippingRecoveryV1
- (CMIColourConstancyClippingRecoveryV1)initWithMetalContext:(id)a3;
- (id)_encodeColourAccuracyClippedRegionRecovery:(double)a3 inputAmbientLumaTexture:(double)a4 inputAmbientChromaTexture:(uint64_t)a5 inoutFlashLumaTexture:(void *)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8;
- (id)_encodeImagePyramidGeneration:(double)a3 inputAmbientLumaTexture:(double)a4 inputAmbientChromaTexture:(uint64_t)a5 inoutFlashLumaTexture:(void *)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8;
- (id)_encodeImageReconstruction:(double)a3 inputAmbientLumaTexture:(double)a4 inputAmbientChromaTexture:(uint64_t)a5 inoutFlashLumaTexture:(void *)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8;
- (id)applyClippedRegionRecovery:(void *)a1 inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:;
- (int)_encodeGradientExtraction:(id)a3 frame:(int)a4;
- (int)_encodeGradientExtraction:(id)a3 frame:(int)a4 channel:(int)a5;
- (int)_encodeGradientImageFusion:(id)a3;
- (int)_encodeGradientImageFusion:(id)a3 channel:(int)a4;
- (int)_encodeImageAccumulationOfFusedThumbnail:(id)a3 inoutFlashLumaTexture:(id)a4 inoutFlashChromaTexture:(id)a5 gamma:(float)a6;
- (int)_encodeImageAccumulationOfSecondToLastPyramidLevels:(id)a3 inoutFlashLumaTexture:(id)a4 inoutFlashChromaTexture:(id)a5 gamma:(float)a6;
- (int)_encodeSecondToLastLevelsPyramidGeneration:(id)a3 kernelRadius:(int)a4 sigma:(float)a5;
- (int)_fusionMapExtraction:(id)a3;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
- (uint64_t)_encodeFirstLevelPyramidGeneration:(__n128)a3 inputAmbientLumaTexture:(__n128)a4 inputAmbientChromaTexture:(float)a5 inoutFlashLumaTexture:(float)a6 inoutFlashChromaTexture:(float)a7 ambientToFlashRegistrationHomography:(uint64_t)a8 scalar:(void *)a9 exponent:(void *)a10 gamma:(void *)a11;
- (uint64_t)_encodeImageAccumulationOfFirstPyramidLevel:(__n128)a3 inputAmbientLumaTexture:(__n128)a4 inputAmbientChromaTexture:(float)a5 inoutFlashLumaTexture:(uint64_t)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8 gamma:(void *)a9;
@end

@implementation CMIColourConstancyClippingRecoveryV1

- (CMIColourConstancyClippingRecoveryV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CMIColourConstancyClippingRecoveryV1;
  v6 = [(CMIColourConstancyClippingRecoveryV1 *)&v32 init];
  v7 = v6;
  if (v6 && v5)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    uint64_t v8 = 0;
    imagePyramidGenerationPipelineStates = v7->_imagePyramidGenerationPipelineStates;
    char v10 = 1;
    do
    {
      char v11 = v10;
      v12 = +[NSString stringWithFormat:@"ColourConstancy::imagePyramidGeneration_stage%d", v8];
      uint64_t v13 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:v12 constants:0];
      v14 = imagePyramidGenerationPipelineStates[v8];
      imagePyramidGenerationPipelineStates[v8] = (MTLComputePipelineState *)v13;

      if (!imagePyramidGenerationPipelineStates[v8])
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        goto LABEL_20;
      }

      char v10 = 0;
      uint64_t v8 = 1;
    }
    while ((v11 & 1) != 0);
    uint64_t v15 = 0;
    while (1)
    {
      v16 = +[NSString stringWithFormat:@"ColourConstancy::gradientExtraction_stage%d", v15];
      uint64_t v17 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:v16 constants:0];
      v18 = &v7->super.isa + v15;
      Class v19 = v18[22];
      v18[22] = (Class)v17;

      if (!v18[22]) {
        break;
      }

      if (++v15 == 3)
      {
        uint64_t v20 = 0;
        while (1)
        {
          v16 = +[NSString stringWithFormat:@"ColourConstancy::gradientImageFusion_stage%d", v20];
          uint64_t v21 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:v16 constants:0];
          v22 = &v7->super.isa + v20;
          Class v23 = v22[25];
          v22[25] = (Class)v21;

          if (!v22[25]) {
            goto LABEL_19;
          }

          if (++v20 == 5)
          {
            uint64_t v24 = 0;
            while (1)
            {
              v16 = +[NSString stringWithFormat:@"ColourConstancy::imageReconstruction_stage%d", v24];
              uint64_t v25 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:v16 constants:0];
              v26 = &v7->super.isa + v24;
              Class v27 = v26[30];
              v26[30] = (Class)v25;

              if (!v26[30]) {
                goto LABEL_19;
              }

              if (++v24 == 5)
              {
                v28 = [[CMIColourConstancyMicroHazeDetectionV1 alloc] initWithMetalContext:v7->_metalContext];
                microHazeDetection = v7->_microHazeDetection;
                v7->_microHazeDetection = v28;

                if (!v7->_microHazeDetection) {
                  goto LABEL_21;
                }
                v30 = v7;
                goto LABEL_17;
              }
            }
          }
        }
      }
    }
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
LABEL_21:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_20:
  v30 = 0;
LABEL_17:

  return v30;
}

- (int)purgeResources
{
  uint64_t v3 = -24;
  do
  {
    FigMetalDecRef();
    FigMetalDecRef();
    v3 += 8;
  }
  while (v3);
  uint64_t v4 = -24;
  do
  {
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    v4 += 8;
  }
  while (v4);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  microHazeDetection = self->_microHazeDetection;
  if (microHazeDetection) {
    [(CMIColourConstancyMicroHazeDetectionV1 *)microHazeDetection purgeResources];
  }
  return 0;
}

- (int)prepareToProcessWithConfig:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_config = &self->_config;
    objc_storeStrong((id *)&self->_config, a3);
    v7 = [(FigMetalContext *)self->_metalContext allocator];
    id v8 = [v7 newTextureDescriptor];

    if (v8)
    {
      id v94 = v5;
      v9 = [v8 desc];
      [v9 setTextureType:2];

      char v10 = [v8 desc];
      [v10 setPixelFormat:115];

      uint64_t v11 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*p_config pyramidLastLevelWidth];
      v12 = [v8 desc];
      [v12 setWidth:v11];

      uint64_t v13 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*p_config pyramidLastLevelHeight];
      v14 = [v8 desc];
      [v14 setHeight:v13];

      v95 = &self->_config;
      int v15 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*p_config pyramidNumLevels];
      if (v15 < 1)
      {
LABEL_8:
        uint64_t v29 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*v95 pyramidLastLevelWidth];
        v30 = [v8 desc];
        [v30 setWidth:v29];

        uint64_t v31 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*v95 pyramidLastLevelHeight];
        objc_super v32 = [v8 desc];
        [v32 setHeight:v31];

        v33 = [v8 desc];
        [v33 setPixelFormat:65];

        uint64_t v34 = 0;
        while (1)
        {
          v35 = +[NSString stringWithFormat:@"ColourConstancyV1->Core->ClippingRecovery->ambientGradientsTexture%d", v34];
          [v8 setLabel:v35];

          v36 = [(FigMetalContext *)self->_metalContext allocator];
          v37 = (objc_class *)[v36 newTextureWithDescriptor:v8];
          v38 = &self->super.isa + v34;
          Class v39 = v38[9];
          v38[9] = v37;

          if (!v38[9]) {
            break;
          }
          v40 = +[NSString stringWithFormat:@"ColourConstancyV1->Core->ClippingRecovery->flashGradientsTexture%d", v34];
          [v8 setLabel:v40];

          v41 = [(FigMetalContext *)self->_metalContext allocator];
          v42 = (objc_class *)[v41 newTextureWithDescriptor:v8];
          Class v43 = v38[12];
          v38[12] = v42;

          if (!v38[12]) {
            break;
          }
          if (++v34 == 3)
          {
            v44 = [v8 desc];
            [v44 setPixelFormat:25];

            uint64_t v45 = 0;
            flashFusedThumbnailImageTextures = self->_flashFusedThumbnailImageTextures;
            while (1)
            {
              v47 = +[NSString stringWithFormat:@"ColourConstancyV1->Core->ClippingRecovery->flashFusedThumbnailImageTextures%d", v45];
              [v8 setLabel:v47];

              v48 = [(FigMetalContext *)self->_metalContext allocator];
              v49 = (MTLTexture *)[v48 newTextureWithDescriptor:v8];
              v50 = flashFusedThumbnailImageTextures[v45];
              flashFusedThumbnailImageTextures[v45] = v49;

              if (!flashFusedThumbnailImageTextures[v45]) {
                goto LABEL_39;
              }
              if (++v45 == 3)
              {
                v51 = [v8 desc];
                [v51 setPixelFormat:25];

                [v8 setLabel:@"ColourConstancyV1->Core->ClippingRecovery->fusionMapTexture"];
                v52 = [(FigMetalContext *)self->_metalContext allocator];
                v53 = (MTLTexture *)[v52 newTextureWithDescriptor:v8];
                fusionMapTexture = self->_fusionMapTexture;
                self->_fusionMapTexture = v53;

                if (self->_fusionMapTexture)
                {
                  unsigned int v55 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*v95 pyramidLastLevelWidth];
                  unsigned int v93 = 2 * v55;
                  unsigned int v56 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*v95 pyramidLastLevelHeight];
                  uint64_t v57 = 0;
                  uint64_t v58 = 4 * (int)(2 * v56 * 4 * v55);
                  uint64_t v59 = (int)(4 * v55);
                  uint64_t v96 = (int)(2 * v56);
                  while (1)
                  {
                    v60 = [(FigMetalContext *)self->_metalContext device];
                    v61 = (MTLBuffer *)[v60 newBufferWithLength:v58 options:0];
                    v62 = (id *)((char *)&self->super.isa + v57 * 8);
                    v63 = self->_scrapMemoryBuffers[v57];
                    self->_scrapMemoryBuffers[v57] = v61;

                    if (!self->_scrapMemoryBuffers[v57]) {
                      break;
                    }
                    v64 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:55 width:v59 height:v96 mipmapped:0];
                    v65 = v64;
                    if (!v64) {
                      goto LABEL_38;
                    }
                    [v64 setUsage:3];
                    objc_msgSend(v65, "setResourceOptions:", objc_msgSend(v62[36], "resourceOptions"));
                    v66 = (MTLTexture *)objc_msgSend(v62[36], "newTextureWithDescriptor:offset:bytesPerRow:", v65, 0, (objc_msgSend(v65, "width")* -[FigMetalContext getPixelSizeInBytes:](self->_metalContext, "getPixelSizeInBytes:", objc_msgSend(v65, "pixelFormat"))+ 63) & 0xFFFFFFC0);
                    v67 = self->_scrapMemoryR32Textures[v57];
                    self->_scrapMemoryR32Textures[v57] = v66;

                    if (!self->_scrapMemoryR32Textures[v57]) {
                      goto LABEL_38;
                    }

                    if (++v57 == 3)
                    {
                      uint64_t v68 = 0;
                      while (1)
                      {
                        int v69 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*v95 pyramidLastLevelWidth];
                        int v70 = v69 + 15;
                        if (v69 >= 0) {
                          int v70 = v69;
                        }
                        uint64_t v71 = (uint64_t)v70 >> 4;
                        int v72 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)*v95 pyramidLastLevelHeight];
                        int v73 = v72 + 15;
                        if (v72 >= 0) {
                          int v73 = v72;
                        }
                        v74 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:125 width:v71 height:(uint64_t)v73 >> 4 mipmapped:0];
                        v65 = v74;
                        if (!v74) {
                          break;
                        }
                        [v74 setUsage:3];
                        objc_msgSend(v65, "setResourceOptions:", -[MTLBuffer resourceOptions](self->_scrapMemoryBuffers[v68], "resourceOptions"));
                        v75 = (MTLTexture *)-[MTLBuffer newTextureWithDescriptor:offset:bytesPerRow:](self->_scrapMemoryBuffers[v68], "newTextureWithDescriptor:offset:bytesPerRow:", v65, 0, ([v65 width]* -[FigMetalContext getPixelSizeInBytes:](self->_metalContext, "getPixelSizeInBytes:", objc_msgSend(v65, "pixelFormat"))+ 63) & 0xFFFFFFC0);
                        v76 = self->_scrapMemoryRGBA32Textures[v68];
                        self->_scrapMemoryRGBA32Textures[v68] = v75;

                        if (!self->_scrapMemoryRGBA32Textures[v68]) {
                          break;
                        }

                        if (++v68 == 3)
                        {
                          v77 = [v8 desc];
                          [v77 setPixelFormat:125];

                          v78 = [v8 desc];
                          [v78 setWidth:1];

                          v79 = [v8 desc];
                          [v79 setHeight:1];

                          [v8 setLabel:@"ColourConstancyV1->Core->ClippingRecovery->offsetTextures0"];
                          v80 = [(FigMetalContext *)self->_metalContext allocator];
                          v81 = (MTLTexture *)[v80 newTextureWithDescriptor:v8];
                          v82 = self->_offsetTextures[0];
                          self->_offsetTextures[0] = v81;

                          if (!self->_offsetTextures[0]) {
                            goto LABEL_39;
                          }
                          [v8 setLabel:@"ColourConstancyV1->Core->ClippingRecovery->offsetTextures1"];
                          v83 = [(FigMetalContext *)self->_metalContext allocator];
                          v84 = (MTLTexture *)[v83 newTextureWithDescriptor:v8];
                          v85 = self->_offsetTextures[1];
                          self->_offsetTextures[1] = v84;

                          id v5 = v94;
                          if (!self->_offsetTextures[1]) {
                            goto LABEL_45;
                          }
                          v86 = [(FigMetalContext *)self->_metalContext device];
                          v87 = +[CMIFFT CMIFFT2DTransform:v86 figMetalContext:0 width:v93 height:v96 layout:0 precision:0];
                          fftTransform = self->_fftTransform;
                          self->_fftTransform = v87;

                          if (!self->_fftTransform) {
                            goto LABEL_45;
                          }
                          microHazeDetection = self->_microHazeDetection;
                          v90 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)self->_config microHazeDetectionConfig];
                          [(CMIColourConstancyMicroHazeDetectionV1 *)microHazeDetection prepareToProcessWithConfig:v90];

                          if (self->_microHazeDetection)
                          {
                            int v91 = 0;
                          }
                          else
                          {
LABEL_45:
                            fig_log_get_emitter();
                            FigDebugAssert3();
                            int v91 = 6;
                          }
                          goto LABEL_34;
                        }
                      }
LABEL_38:
                      fig_log_get_emitter();
                      FigDebugAssert3();

                      goto LABEL_40;
                    }
                  }
                }
                goto LABEL_39;
              }
            }
          }
        }
      }
      else
      {
        rgbPyramidTextures = self->_rgbPyramidTextures;
        uint64_t v17 = self->_rgbPyramidTextures[1];
        uint64_t v18 = v15;
        while (1)
        {
          Class v19 = +[NSString stringWithFormat:@"ColourConstancyV1->Core->ClippingRecovery->ambientRGBPyramidTexture%d", --v18];
          [v8 setLabel:v19];

          uint64_t v20 = [(FigMetalContext *)self->_metalContext allocator];
          uint64_t v21 = (MTLTexture *)[v20 newTextureWithDescriptor:v8];
          v22 = (*rgbPyramidTextures)[v18];
          (*rgbPyramidTextures)[v18] = v21;

          if (!(*rgbPyramidTextures)[v18]) {
            break;
          }
          Class v23 = +[NSString stringWithFormat:@"ColourConstancyV1->Core->ClippingRecovery->flashRGBPyramidTexture%d", v18];
          [v8 setLabel:v23];

          uint64_t v24 = [(FigMetalContext *)self->_metalContext allocator];
          uint64_t v25 = (MTLTexture *)[v24 newTextureWithDescriptor:v8];
          v26 = v17[v18];
          v17[v18] = v25;

          if (!v17[v18]) {
            break;
          }
          Class v27 = [v8 desc];
          objc_msgSend(v27, "setWidth:", 2 * (void)objc_msgSend(v27, "width"));
          v28 = [v8 desc];
          objc_msgSend(v28, "setHeight:", 2 * (void)objc_msgSend(v28, "height"));

          if ((unint64_t)(v18 + 1) <= 1) {
            goto LABEL_8;
          }
        }
      }
LABEL_39:
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_40:
      int v91 = 6;
      id v5 = v94;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v91 = 7;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v8 = 0;
    int v91 = 8;
  }
LABEL_34:

  return v91;
}

- (id)_encodeImagePyramidGeneration:(double)a3 inputAmbientLumaTexture:(double)a4 inputAmbientChromaTexture:(uint64_t)a5 inoutFlashLumaTexture:(void *)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8
{
  id v15 = a6;
  id v16 = a1[2];
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  [v16 clippedLikelihoodScalar];
  int v22 = v21;
  [a1[2] clippedLikelihoodExponent];
  int v24 = v23;
  [a1[2] gamma];
  LODWORD(v26) = v25;
  LODWORD(v27) = v22;
  LODWORD(v28) = v24;
  id v29 = objc_msgSend(a1, "_encodeFirstLevelPyramidGeneration:inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:scalar:exponent:gamma:", v15, v20, v19, v18, v17, a2, a3, a4, v27, v28, v26);

  if (v29
    || (id v30 = [a1[2] pyramidGaussianKernelRadius],
        [a1[2] pyramidGaussianSigma],
        id v29 = objc_msgSend(a1, "_encodeSecondToLastLevelsPyramidGeneration:kernelRadius:sigma:", v15, v30),
        v29))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v29;
}

- (uint64_t)_encodeFirstLevelPyramidGeneration:(__n128)a3 inputAmbientLumaTexture:(__n128)a4 inputAmbientChromaTexture:(float)a5 inoutFlashLumaTexture:(float)a6 inoutFlashChromaTexture:(float)a7 ambientToFlashRegistrationHomography:(uint64_t)a8 scalar:(void *)a9 exponent:(void *)a10 gamma:(void *)a11
{
  v38[0] = a2;
  v38[1] = a3;
  v38[2] = a4;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  float v36 = a6;
  float v37 = a5;
  float v35 = a7;
  int v25 = [a9 computeCommandEncoder];
  double v26 = v25;
  if (v25)
  {
    [v25 setComputePipelineState:*(void *)(a1 + 160)];
    [v26 setTexture:v21 atIndex:0];
    [v26 setTexture:v22 atIndex:1];
    [v26 setTexture:v23 atIndex:2];
    [v26 setTexture:v24 atIndex:3];
    [v26 setTexture:*(void *)(a1 + 24) atIndex:4];
    [v26 setTexture:*(void *)(a1 + 48) atIndex:5];
    [v26 setBytes:&v37 length:4 atIndex:0];
    [v26 setBytes:&v36 length:4 atIndex:1];
    [v26 setBytes:&v35 length:4 atIndex:2];
    [v26 setBytes:v38 length:48 atIndex:3];
    unint64_t v27 = (unint64_t)[*(id *)(a1 + 160) threadExecutionWidth];
    unint64_t v28 = (unint64_t)[*(id *)(a1 + 160) maxTotalThreadsPerThreadgroup] / v27;
    id v29 = [*(id *)(a1 + 24) width];
    id v30 = [*(id *)(a1 + 24) height];
    v34[0] = v29;
    v34[1] = v30;
    v34[2] = 1;
    v33[0] = v27;
    v33[1] = v28;
    v33[2] = 1;
    [v26 dispatchThreads:v34 threadsPerThreadgroup:v33];
    [v26 endEncoding];
    uint64_t v31 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v31 = 10;
  }

  return v31;
}

- (int)_encodeSecondToLastLevelsPyramidGeneration:(id)a3 kernelRadius:(int)a4 sigma:(float)a5
{
  int v22 = a4;
  float v21 = a5;
  v6 = [a3 computeCommandEncoder];
  if (v6)
  {
    uint64_t v7 = 0;
    rgbPyramidTextures = self->_rgbPyramidTextures;
    v9 = self->_rgbPyramidTextures[1];
    char v10 = 1;
    do
    {
      char v11 = v10;
      [v6 setComputePipelineState:self->_imagePyramidGenerationPipelineStates[1]];
      [v6 setTexture:(*rgbPyramidTextures)[v7] atIndex:0];
      [v6 setTexture:v9[v7] atIndex:1];
      uint64_t v12 = 8 * v7 + 8;
      [v6 setTexture:*(void *)((char *)rgbPyramidTextures + v12) atIndex:2];
      [v6 setTexture:*(MTLTexture **)((char *)v9 + v12) atIndex:3];
      [v6 setBytes:&v22 length:4 atIndex:0];
      [v6 setBytes:&v21 length:4 atIndex:1];
      unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)self->_imagePyramidGenerationPipelineStates[1] threadExecutionWidth];
      unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_imagePyramidGenerationPipelineStates[1] maxTotalThreadsPerThreadgroup]/ v13;
      id v15 = [*(id *)((char *)rgbPyramidTextures + v12) width];
      id v16 = [*(id *)((char *)rgbPyramidTextures + v12) height];
      v20[0] = v15;
      v20[1] = v16;
      v20[2] = 1;
      v19[0] = v13;
      v19[1] = v14;
      v19[2] = 1;
      [v6 dispatchThreads:v20 threadsPerThreadgroup:v19];
      char v10 = 0;
      uint64_t v7 = 1;
    }
    while ((v11 & 1) != 0);
    [v6 endEncoding];
    int v17 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v17 = 10;
  }

  return v17;
}

- (int)_encodeGradientExtraction:(id)a3 frame:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned int v7 = [(CMIColourConstancyClippingRecoveryV1 *)self _encodeGradientExtraction:v6 frame:v4 channel:0];
  if (v7
    || (unsigned int v7 = [(CMIColourConstancyClippingRecoveryV1 *)self _encodeGradientExtraction:v6 frame:v4 channel:1]) != 0)
  {
    int v8 = v7;
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    goto LABEL_4;
  }
  int v8 = [(CMIColourConstancyClippingRecoveryV1 *)self _encodeGradientExtraction:v6 frame:v4 channel:2];
  if (v8)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return v8;
}

- (int)_encodeGradientExtraction:(id)a3 frame:(int)a4 channel:(int)a5
{
  id v8 = a3;
  unsigned int v47 = a5;
  v9 = [v8 computeCommandEncoder];
  if (!v9)
  {
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();
    int v27 = 10;
    goto LABEL_8;
  }
  char v10 = v9;
  [v9 setComputePipelineState:self->_gradientExtractionPipelineStates[0]];
  [v10 setTexture:self->_rgbPyramidTextures[a4][2] atIndex:0];
  [v10 setTexture:self->_scrapMemoryR32Textures[0] atIndex:1];
  [v10 setBytes:&v47 length:4 atIndex:0];
  unint64_t v11 = (unint64_t)[(MTLComputePipelineState *)self->_gradientExtractionPipelineStates[0] threadExecutionWidth];
  unint64_t v12 = (unint64_t)[(MTLComputePipelineState *)self->_gradientExtractionPipelineStates[0] maxTotalThreadsPerThreadgroup]/ v11;
  unint64_t v13 = (unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] >> 1;
  id v14 = [(MTLTexture *)self->_scrapMemoryR32Textures[0] height];
  v46[0] = v13;
  v46[1] = v14;
  v46[2] = 1;
  v45[0] = v11;
  v45[1] = v12;
  v45[2] = 1;
  [v10 dispatchThreads:v46 threadsPerThreadgroup:v45];
  [v10 endEncoding];
  fftTransform = self->_fftTransform;
  id v16 = [(MTLTexture *)self->_scrapMemoryR32Textures[0] buffer];
  unsigned int v17 = [(CMIFFTTransform *)fftTransform encodeToCommandBuffer:v8 inputBuffer:v16 direction:1];

  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    int v27 = v17;
    goto LABEL_8;
  }
  id v18 = [v8 computeCommandEncoder];

  if (!v18)
  {
    fig_log_get_emitter();
    goto LABEL_15;
  }
  float v19 = floorf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] * 0.25);
  *(float *)&unsigned int v37 = v19 + v19;
  int32x2_t v44 = vcvt_s32_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(floorf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] height]* 0.5)), v37));
  float v20 = ceilf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] * 0.25);
  *(float *)&unsigned int v38 = v20 + v20;
  int32x2_t v43 = vcvt_s32_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(ceilf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] height]* 0.5)), v38));
  [v18 setComputePipelineState:self->_gradientExtractionPipelineStates[1]];
  [v18 setTexture:self->_scrapMemoryR32Textures[0] atIndex:0];
  [v18 setTexture:self->_scrapMemoryR32Textures[1] atIndex:1];
  [v18 setTexture:self->_scrapMemoryR32Textures[2] atIndex:2];
  [v18 setBytes:&v44 length:8 atIndex:0];
  [v18 setBytes:&v43 length:8 atIndex:1];
  unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_gradientExtractionPipelineStates[1] threadExecutionWidth];
  unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_gradientExtractionPipelineStates[1] maxTotalThreadsPerThreadgroup]/ v21;
  unint64_t v23 = (unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] >> 1;
  id v24 = [(MTLTexture *)self->_scrapMemoryR32Textures[0] height];
  v42[0] = v23;
  v42[1] = v24;
  v42[2] = 1;
  v41[0] = v21;
  v41[1] = v22;
  v41[2] = 1;
  [v18 dispatchThreads:v42 threadsPerThreadgroup:v41];
  [v18 endEncoding];
  int v25 = self->_fftTransform;
  double v26 = [(MTLTexture *)self->_scrapMemoryR32Textures[1] buffer];
  int v27 = [(CMIFFTTransform *)v25 encodeToCommandBuffer:v8 inputBuffer:v26 direction:-1];

  if (v27
    || (unint64_t v28 = self->_fftTransform,
        [(MTLTexture *)self->_scrapMemoryR32Textures[2] buffer],
        id v29 = objc_claimAutoreleasedReturnValue(),
        int v27 = [(CMIFFTTransform *)v28 encodeToCommandBuffer:v8 inputBuffer:v29 direction:-1], v29, v27))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_8;
  }
  id v30 = [v8 computeCommandEncoder];

  if (!v30)
  {
    fig_log_get_emitter();
    goto LABEL_15;
  }
  [v30 setComputePipelineState:self->_gradientExtractionPipelineStates[2]];
  [v30 setTexture:self->_scrapMemoryR32Textures[1] atIndex:0];
  [v30 setTexture:self->_scrapMemoryR32Textures[2] atIndex:1];
  uint64_t v31 = self->_imageGradientTextures[a4];
  [v30 setTexture:v31[v47] atIndex:2];
  unint64_t v32 = (unint64_t)[(MTLComputePipelineState *)self->_gradientExtractionPipelineStates[2] threadExecutionWidth];
  unint64_t v33 = (unint64_t)[(MTLComputePipelineState *)self->_gradientExtractionPipelineStates[2] maxTotalThreadsPerThreadgroup]/ v32;
  id v34 = [(MTLTexture *)v31[v47] width];
  id v35 = [(MTLTexture *)v31[v47] height];
  v40[0] = v34;
  v40[1] = v35;
  v40[2] = 1;
  v39[0] = v32;
  v39[1] = v33;
  v39[2] = 1;
  [v30 dispatchThreads:v40 threadsPerThreadgroup:v39];
  [v30 endEncoding];

LABEL_8:
  return v27;
}

- (int)_encodeGradientImageFusion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CMIColourConstancyClippingRecoveryV1 *)self _encodeGradientImageFusion:v4 channel:0];
  if (v5
    || (unsigned int v5 = [(CMIColourConstancyClippingRecoveryV1 *)self _encodeGradientImageFusion:v4 channel:1]) != 0)
  {
    int v6 = v5;
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    goto LABEL_4;
  }
  int v6 = [(CMIColourConstancyClippingRecoveryV1 *)self _encodeGradientImageFusion:v4 channel:2];
  if (v6)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return v6;
}

- (int)_encodeGradientImageFusion:(id)a3 channel:(int)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 computeCommandEncoder];
  if (!v7)
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    int v28 = 10;
    goto LABEL_8;
  }
  id v8 = v7;
  [v7 setComputePipelineState:self->_gradientImageFusionPipelineStates[2]];
  v9 = &self->super.isa + a4;
  [v8 setTexture:v9[9] atIndex:0];
  [v8 setTexture:v9[12] atIndex:1];
  [v8 setTexture:self->_fusionMapTexture atIndex:2];
  [v8 setTexture:self->_scrapMemoryR32Textures[0] atIndex:3];
  [v8 setTexture:self->_scrapMemoryR32Textures[1] atIndex:4];
  unint64_t v10 = (unint64_t)[(MTLComputePipelineState *)self->_gradientImageFusionPipelineStates[2] threadExecutionWidth];
  unint64_t v11 = (unint64_t)[(MTLComputePipelineState *)self->_gradientImageFusionPipelineStates[2] maxTotalThreadsPerThreadgroup]/ v10;
  unint64_t v12 = (unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] >> 1;
  id v13 = [(MTLTexture *)self->_scrapMemoryR32Textures[0] height];
  v45[0] = v12;
  v45[1] = v13;
  v45[2] = 1;
  v44[0] = v10;
  v44[1] = v11;
  v44[2] = 1;
  [v8 dispatchThreads:v45 threadsPerThreadgroup:v44];
  [v8 endEncoding];
  fftTransform = self->_fftTransform;
  id v15 = [(MTLTexture *)self->_scrapMemoryR32Textures[0] buffer];
  unsigned int v16 = [(CMIFFTTransform *)fftTransform encodeToCommandBuffer:v6 inputBuffer:v15 direction:1];

  if (v16
    || (unsigned int v17 = self->_fftTransform,
        [(MTLTexture *)self->_scrapMemoryR32Textures[1] buffer],
        id v18 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [(CMIFFTTransform *)v17 encodeToCommandBuffer:v6 inputBuffer:v18 direction:1], v18, v16))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    int v28 = v16;
    goto LABEL_8;
  }
  float v19 = [v6 computeCommandEncoder];

  if (!v19)
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  float v20 = floorf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] * 0.25);
  *(float *)&unsigned int v36 = v20 + v20;
  int32x2_t v43 = vcvt_s32_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(floorf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] height]* 0.5)), v36));
  float v21 = ceilf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] * 0.25);
  *(float *)&unsigned int v37 = v21 + v21;
  int32x2_t v42 = vcvt_s32_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(ceilf((float)(unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] height]* 0.5)), v37));
  [v19 setComputePipelineState:self->_gradientImageFusionPipelineStates[3]];
  [v19 setTexture:self->_scrapMemoryR32Textures[0] atIndex:0];
  [v19 setTexture:self->_scrapMemoryR32Textures[1] atIndex:1];
  [v19 setTexture:self->_scrapMemoryR32Textures[2] atIndex:2];
  [v19 setBytes:&v43 length:8 atIndex:0];
  [v19 setBytes:&v42 length:8 atIndex:1];
  unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_gradientImageFusionPipelineStates[3] threadExecutionWidth];
  unint64_t v23 = (unint64_t)[(MTLComputePipelineState *)self->_gradientImageFusionPipelineStates[3] maxTotalThreadsPerThreadgroup]/ v22;
  unint64_t v24 = (unint64_t)[(MTLTexture *)self->_scrapMemoryR32Textures[0] width] >> 1;
  id v25 = [(MTLTexture *)self->_scrapMemoryR32Textures[0] height];
  v41[0] = v24;
  v41[1] = v25;
  v41[2] = 1;
  v40[0] = v22;
  v40[1] = v23;
  v40[2] = 1;
  [v19 dispatchThreads:v41 threadsPerThreadgroup:v40];
  [v19 endEncoding];
  double v26 = self->_fftTransform;
  int v27 = [(MTLTexture *)self->_scrapMemoryR32Textures[2] buffer];
  int v28 = [(CMIFFTTransform *)v26 encodeToCommandBuffer:v6 inputBuffer:v27 direction:-1];

  if (v28)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_8;
  }
  id v29 = [v6 computeCommandEncoder];

  if (!v29)
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  [v29 setComputePipelineState:self->_gradientImageFusionPipelineStates[4]];
  [v29 setTexture:self->_scrapMemoryR32Textures[2] atIndex:0];
  id v30 = &self->super.isa + a4;
  [v29 setTexture:v30[17] atIndex:1];
  unint64_t v31 = (unint64_t)[(MTLComputePipelineState *)self->_gradientImageFusionPipelineStates[4] threadExecutionWidth];
  unint64_t v32 = (unint64_t)[(MTLComputePipelineState *)self->_gradientImageFusionPipelineStates[4] maxTotalThreadsPerThreadgroup]/ v31;
  id v33 = [(objc_class *)v30[17] width];
  id v34 = [(objc_class *)v30[17] height];
  v39[0] = v33;
  v39[1] = v34;
  v39[2] = 1;
  v38[0] = v31;
  v38[1] = v32;
  v38[2] = 1;
  [v29 dispatchThreads:v39 threadsPerThreadgroup:v38];
  [v29 endEncoding];

LABEL_8:
  return v28;
}

- (id)_encodeImageReconstruction:(double)a3 inputAmbientLumaTexture:(double)a4 inputAmbientChromaTexture:(uint64_t)a5 inoutFlashLumaTexture:(void *)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8
{
  id v15 = a6;
  id v16 = a9;
  id v17 = a10;
  id v18 = (void *)a1[2];
  id v19 = a8;
  id v20 = a7;
  [v18 gamma];
  int v22 = v21;
  LODWORD(v23) = v21;
  id v24 = objc_msgSend(a1, "_encodeImageAccumulationOfFirstPyramidLevel:inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:gamma:", v15, v20, v19, v16, v17, a2, a3, a4, v23);

  if (v24) {
    goto LABEL_7;
  }
  LODWORD(v25) = v22;
  id v26 = [a1 _encodeImageAccumulationOfSecondToLastPyramidLevels:v15 inoutFlashLumaTexture:v16 inoutFlashChromaTexture:v17 gamma:v25];
  if (v26)
  {
    id v24 = v26;
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    goto LABEL_4;
  }
  LODWORD(v27) = v22;
  id v24 = [a1 _encodeImageAccumulationOfFusedThumbnail:v15 inoutFlashLumaTexture:v16 inoutFlashChromaTexture:v17 gamma:v27];
  if (v24)
  {
LABEL_7:
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return v24;
}

- (uint64_t)_encodeImageAccumulationOfFirstPyramidLevel:(__n128)a3 inputAmbientLumaTexture:(__n128)a4 inputAmbientChromaTexture:(float)a5 inoutFlashLumaTexture:(uint64_t)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8 gamma:(void *)a9
{
  v30[0] = a2;
  v30[1] = a3;
  v30[2] = a4;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  float v29 = a5;
  int v21 = [a7 computeCommandEncoder];
  int v22 = v21;
  if (v21)
  {
    [v21 setComputePipelineState:*(void *)(a1 + 240)];
    [v22 setTexture:*(void *)(a1 + 368) atIndex:0];
    [v22 setTexture:v17 atIndex:1];
    [v22 setTexture:v18 atIndex:2];
    [v22 setTexture:*(void *)(a1 + 24) atIndex:3];
    [v22 setTexture:*(void *)(a1 + 48) atIndex:4];
    [v22 setTexture:v19 atIndex:5];
    [v22 setTexture:v20 atIndex:6];
    [v22 setBytes:&v29 length:4 atIndex:0];
    [v22 setBytes:v30 length:48 atIndex:1];
    unint64_t v23 = (unint64_t)[*(id *)(a1 + 240) threadExecutionWidth];
    unint64_t v24 = (unint64_t)[*(id *)(a1 + 240) maxTotalThreadsPerThreadgroup] / v23;
    v28[0] = [v19 width];
    v28[1] = [v19 height];
    v28[2] = 1;
    v27[0] = v23;
    v27[1] = v24;
    v27[2] = 1;
    [v22 dispatchThreads:v28 threadsPerThreadgroup:v27];
    [v22 endEncoding];
    uint64_t v25 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v25 = 10;
  }

  return v25;
}

- (int)_encodeImageAccumulationOfSecondToLastPyramidLevels:(id)a3 inoutFlashLumaTexture:(id)a4 inoutFlashChromaTexture:(id)a5 gamma:(float)a6
{
  id v10 = a4;
  id v11 = a5;
  float v24 = a6;
  unint64_t v12 = [a3 computeCommandEncoder];
  if (v12)
  {
    if ([(CMIColourConstancyClippingRecoveryConfigurationV1 *)self->_config pyramidNumLevels] >= 2)
    {
      uint64_t v13 = 0;
      do
      {
        [v12 setComputePipelineState:self->_imageReconstructionPipelineStates[1]];
        [v12 setTexture:self->_fusionMapTexture atIndex:0];
        id v14 = &self->super.isa + v13;
        [v12 setTexture:v14[3] atIndex:1];
        [v12 setTexture:v14[6] atIndex:2];
        [v12 setTexture:v14[4] atIndex:3];
        [v12 setTexture:v14[7] atIndex:4];
        [v12 setTexture:v10 atIndex:5];
        [v12 setTexture:v11 atIndex:6];
        [v12 setBytes:&v24 length:4 atIndex:0];
        unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[1] threadExecutionWidth];
        unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[1] maxTotalThreadsPerThreadgroup]/ v15;
        id v17 = [v10 width];
        id v18 = [v10 height];
        v23[0] = v17;
        v23[1] = v18;
        v23[2] = 1;
        v22[0] = v15;
        v22[1] = v16;
        v22[2] = 1;
        [v12 dispatchThreads:v23 threadsPerThreadgroup:v22];
      }
      while (v13++ < [(CMIColourConstancyClippingRecoveryConfigurationV1 *)self->_config pyramidNumLevels]- 2);
    }
    [v12 endEncoding];
    int v20 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = 10;
  }

  return v20;
}

- (int)_encodeImageAccumulationOfFusedThumbnail:(id)a3 inoutFlashLumaTexture:(id)a4 inoutFlashChromaTexture:(id)a5 gamma:(float)a6
{
  id v10 = a4;
  id v11 = a5;
  float v32 = a6;
  unint64_t v12 = [a3 computeCommandEncoder];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 setComputePipelineState:self->_imageReconstructionPipelineStates[2]];
    [v13 setTexture:self->_rgbPyramidTextures[1][2] atIndex:0];
    [v13 setTexture:self->_flashFusedThumbnailImageTextures[0] atIndex:1];
    [v13 setTexture:self->_flashFusedThumbnailImageTextures[1] atIndex:2];
    [v13 setTexture:self->_flashFusedThumbnailImageTextures[2] atIndex:3];
    [v13 setTexture:self->_fusionMapTexture atIndex:4];
    [v13 setTexture:self->_scrapMemoryRGBA32Textures[0] atIndex:5];
    [v13 setTexture:self->_scrapMemoryRGBA32Textures[1] atIndex:6];
    [v13 setTexture:self->_scrapMemoryRGBA32Textures[2] atIndex:7];
    unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[2] threadExecutionWidth];
    unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[2] maxTotalThreadsPerThreadgroup]/ v14;
    id v16 = [(MTLTexture *)self->_scrapMemoryRGBA32Textures[0] width];
    id v17 = [(MTLTexture *)self->_scrapMemoryRGBA32Textures[0] height];
    v31[0] = v16;
    v31[1] = v17;
    v31[2] = 1;
    v30[0] = v14;
    v30[1] = v15;
    v30[2] = 1;
    [v13 dispatchThreads:v31 threadsPerThreadgroup:v30];
    [v13 setComputePipelineState:self->_imageReconstructionPipelineStates[3]];
    [v13 setTexture:self->_scrapMemoryRGBA32Textures[0] atIndex:0];
    [v13 setTexture:self->_scrapMemoryRGBA32Textures[1] atIndex:1];
    [v13 setTexture:self->_scrapMemoryRGBA32Textures[2] atIndex:2];
    [v13 setTexture:self->_offsetTextures[0] atIndex:3];
    [v13 setTexture:self->_offsetTextures[1] atIndex:4];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[3] threadExecutionWidth];
    unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[3] maxTotalThreadsPerThreadgroup]/ v18;
    id v20 = [(MTLTexture *)self->_offsetTextures[0] width];
    id v21 = [(MTLTexture *)self->_offsetTextures[0] height];
    v29[0] = v20;
    v29[1] = v21;
    v29[2] = 1;
    v28[0] = v18;
    v28[1] = v19;
    v28[2] = 1;
    [v13 dispatchThreads:v29 threadsPerThreadgroup:v28];
    [v13 setComputePipelineState:self->_imageReconstructionPipelineStates[4]];
    [v13 setTexture:self->_rgbPyramidTextures[1][2] atIndex:0];
    [v13 setTexture:self->_flashFusedThumbnailImageTextures[0] atIndex:1];
    [v13 setTexture:self->_flashFusedThumbnailImageTextures[1] atIndex:2];
    [v13 setTexture:self->_flashFusedThumbnailImageTextures[2] atIndex:3];
    [v13 setTexture:self->_fusionMapTexture atIndex:4];
    [v13 setTexture:self->_offsetTextures[0] atIndex:5];
    [v13 setTexture:self->_offsetTextures[1] atIndex:6];
    [v13 setTexture:v10 atIndex:7];
    [v13 setTexture:v11 atIndex:8];
    [v13 setBytes:&v32 length:4 atIndex:0];
    unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[4] threadExecutionWidth];
    unint64_t v23 = (unint64_t)[(MTLComputePipelineState *)self->_imageReconstructionPipelineStates[4] maxTotalThreadsPerThreadgroup]/ v22;
    v27[0] = [v10 width];
    v27[1] = [v10 height];
    v27[2] = 1;
    v26[0] = v22;
    v26[1] = v23;
    v26[2] = 1;
    [v13 dispatchThreads:v27 threadsPerThreadgroup:v26];
    [v13 endEncoding];
    int v24 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v24 = 10;
  }

  return v24;
}

- (int)_fusionMapExtraction:(id)a3
{
  int v3 = [(CMIColourConstancyMicroHazeDetectionV1 *)self->_microHazeDetection microHazeFusionMapExtraction:a3 inputAmbientTexture:self->_rgbPyramidTextures[0][0] inputFlashTexture:self->_rgbPyramidTextures[1][0] outputFusionMapTexture:self->_fusionMapTexture];
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

- (id)_encodeColourAccuracyClippedRegionRecovery:(double)a3 inputAmbientLumaTexture:(double)a4 inputAmbientChromaTexture:(uint64_t)a5 inoutFlashLumaTexture:(void *)a6 inoutFlashChromaTexture:(void *)a7 ambientToFlashRegistrationHomography:(void *)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v21 = &dword_8 + 2;
    goto LABEL_8;
  }
  id v20 = objc_msgSend(a1, "_encodeImagePyramidGeneration:inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:", v15, v16, v17, v18, v19, a2, a3, a4);
  if (v20
    || (id v20 = [a1 _fusionMapExtraction:v15], v20)
    || (id v20 = [a1 _encodeGradientExtraction:v15 frame:0], v20)
    || (id v20 = [a1 _encodeGradientExtraction:v15 frame:1], v20)
    || (id v20 = [a1 _encodeGradientImageFusion:v15], v20))
  {
    id v21 = v20;
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    goto LABEL_8;
  }
  id v21 = objc_msgSend(a1, "_encodeImageReconstruction:inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:", v15, v16, v17, v18, v19, a2, a3, a4);
  if (v21)
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
LABEL_8:

  return v21;
}

- (id)applyClippedRegionRecovery:(void *)a1 inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:
{
  id v1 = objc_msgSend(a1, "_encodeColourAccuracyClippedRegionRecovery:inputAmbientLumaTexture:inputAmbientChromaTexture:inoutFlashLumaTexture:inoutFlashChromaTexture:ambientToFlashRegistrationHomography:");
  if (v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionMapTexture, 0);
  objc_storeStrong((id *)&self->_microHazeDetection, 0);
  for (uint64_t i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_scrapMemoryRGBA32Textures[i + 2], 0);
  for (uint64_t j = 0; j != -3; --j)
    objc_storeStrong((id *)&self->_scrapMemoryR32Textures[j + 2], 0);
  for (uint64_t k = 0; k != -3; --k)
    objc_storeStrong((id *)&self->_scrapMemoryBuffers[k + 2], 0);
  objc_storeStrong((id *)&self->_fftTransform, 0);
  for (uint64_t m = 0; m != -5; --m)
    objc_storeStrong((id *)&self->_imageReconstructionPipelineStates[m + 4], 0);
  for (uint64_t n = 0; n != -5; --n)
    objc_storeStrong((id *)&self->_gradientImageFusionPipelineStates[n + 4], 0);
  for (iuint64_t i = 0; ii != -3; --ii)
    objc_storeStrong((id *)&self->_gradientExtractionPipelineStates[ii + 2], 0);
  for (juint64_t j = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_imagePyramidGenerationPipelineStates[jj + 1], 0);
  for (kuint64_t k = 0; kk != -3; --kk)
    objc_storeStrong((id *)&self->_flashFusedThumbnailImageTextures[kk + 2], 0);
  for (muint64_t m = 0; mm != -2; --mm)
    objc_storeStrong((id *)&self->_offsetTextures[mm + 1], 0);
  for (nuint64_t n = 112; nn != 64; nn -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + nn), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + nn), 0);
    nn -= 8;
  }
  while (nn != 16);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end