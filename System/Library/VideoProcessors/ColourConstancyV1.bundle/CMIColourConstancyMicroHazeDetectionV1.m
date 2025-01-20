@interface CMIColourConstancyMicroHazeDetectionV1
- (CMIColourConstancyMicroHazeDetectionV1)initWithMetalContext:(id)a3;
- (int)_encodeClassifierMasksExtraction:(id)a3 inputAmbientIntensityTexture:(id)a4 inputFlashIntensityTexture:(id)a5 inputIntensityGainMapTexture:(id)a6 outputStrongerGradientsMaskTexture:(id)a7 outputPositiveIntensityMaskTexture:(id)a8;
- (int)_encodeFusionMapExtraction:(id)a3 inputMixMapTexture:(id)a4 inputShadowEdgeMaskTexture:(id)a5 gaussianFilterSize:(int)a6 gaussianSigma:(float)a7 outputFusionMapTexture:(id)a8;
- (int)_encodeIntensityGainMapGeneration:(id)a3 inputAmbientIntensityTexture:(id)a4 inputGridTransformsTexture:(id)a5 outputIntensityGainMapTexture:(id)a6;
- (int)_encodeIntensityGainTransformsGeneration:(id)a3 inputAmbientIntensityTexture:(id)a4 inputTargetGainTexture:(id)a5 inputWeightMapTexture:(id)a6 gridRegionScale:(float)a7 bandingMinWeight:(float)a8 bandingGaussianSigmaScale:(float)a9 filterToSigmaScale:(float)a10 spatialGaussianSigmaScale:(float)a11 outputGridTransformsTexture:(id)a12;
- (int)_encodeIntensityImageGeneration:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 outputAmbientIntensityTexture:(id)a6 outputFlashIntensityTexture:(id)a7 outputTargetGainTexture:(id)a8 outputWeightMapTexture:(id)a9;
- (int)_encodeMicroHazeFusionMapExtraction:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 outputFusionMapTexture:(id)a6;
- (int)_encodeMixMapGeneration:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 inputIntensityGainMapTexture:(id)a6 inputStrongerGradientsMaskTexture:(id)a7 inputPositiveIntensityMaskTexture:(id)a8 strongGradientsMaskResponseGain:(float)a9 strongGradientsMaskResponseBias:(float)a10 strongGradientsMaskResponseExponent:(float)a11 positiveIntensityMaskResponseGain:(float)a12 positiveIntensityMaskResponseBias:(float)a13 positiveIntensityMaskResponseExponent:(float)a14 maskFusionGain:(float)a15 maskFusionMixFactor:(float)a16 ambientQualityMinGain:(float)a17 ambientQualityMaxGain:(float)a18 ambientQualityZeroThreshold:(float)a19 ambientQualityOneThreshold:(float)a20 outputMixMapTexture:(id)a21;
- (int)_encodeShadowEdgeMapExtraction:(id)a3 inputIntensityGainMapTexture:(id)a4 shadowEdgesResponseGain:(float)a5 shadowEdgesResponseExponent:(float)a6 outputShadowEdgeMaskTexture:(id)a7;
- (int)microHazeFusionMapExtraction:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 outputFusionMapTexture:(id)a6;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMIColourConstancyMicroHazeDetectionV1

- (CMIColourConstancyMicroHazeDetectionV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CMIColourConstancyMicroHazeDetectionV1;
  v6 = [(CMIColourConstancyMicroHazeDetectionV1 *)&v24 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  if (!v5) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::intensityImageGeneration" constants:0];
  intensityImageGenerationPipelineState = v7->_intensityImageGenerationPipelineState;
  v7->_intensityImageGenerationPipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_intensityImageGenerationPipelineState) {
    goto LABEL_12;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::intensityGainTransformsGeneration" constants:0];
  intensityGainTransformsGenerationPipelineState = v7->_intensityGainTransformsGenerationPipelineState;
  v7->_intensityGainTransformsGenerationPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_intensityGainTransformsGenerationPipelineState) {
    goto LABEL_12;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::intensityGainMapGeneration" constants:0];
  intensityGainMapGenerationPipelineState = v7->_intensityGainMapGenerationPipelineState;
  v7->_intensityGainMapGenerationPipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_intensityGainMapGenerationPipelineState) {
    goto LABEL_12;
  }
  uint64_t v14 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::classifierMasksExtraction" constants:0];
  classifierMasksExtractionPipelineState = v7->_classifierMasksExtractionPipelineState;
  v7->_classifierMasksExtractionPipelineState = (MTLComputePipelineState *)v14;

  if (!v7->_classifierMasksExtractionPipelineState) {
    goto LABEL_12;
  }
  uint64_t v16 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::mixMapGeneration" constants:0];
  mixMapGenerationPipelineState = v7->_mixMapGenerationPipelineState;
  v7->_mixMapGenerationPipelineState = (MTLComputePipelineState *)v16;

  if (!v7->_mixMapGenerationPipelineState) {
    goto LABEL_12;
  }
  uint64_t v18 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::shadowEdgeMapExtraction" constants:0];
  shadowEdgeMapExtractionPipelineState = v7->_shadowEdgeMapExtractionPipelineState;
  v7->_shadowEdgeMapExtractionPipelineState = (MTLComputePipelineState *)v18;

  if (!v7->_shadowEdgeMapExtractionPipelineState) {
    goto LABEL_12;
  }
  uint64_t v20 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::fusionMapExtraction" constants:0];
  fusionMapExtractionPipelineState = v7->_fusionMapExtractionPipelineState;
  v7->_fusionMapExtractionPipelineState = (MTLComputePipelineState *)v20;

  if (v7->_fusionMapExtractionPipelineState)
  {
    v22 = v7;
  }
  else
  {
LABEL_12:
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = 0;
  }

  return v22;
}

- (int)purgeResources
{
  return 0;
}

- (int)prepareToProcessWithConfig:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_config, a3);
    v6 = [(FigMetalContext *)self->_metalContext allocator];
    id v7 = [v6 newTextureDescriptor];

    if (v7)
    {
      uint64_t v8 = [v7 desc];
      [v8 setTextureType:2];

      v9 = [v7 desc];
      [v9 setPixelFormat:25];

      uint64_t v10 = 4 * [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config fusionMapWidth];
      v11 = [v7 desc];
      [v11 setWidth:v10];

      uint64_t v12 = 4 * [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config fusionMapHeight];
      v13 = [v7 desc];
      [v13 setHeight:v12];

      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->AmbientIntensityTexture"];
      uint64_t v14 = [(FigMetalContext *)self->_metalContext allocator];
      v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
      ambientIntensityTexture = self->_ambientIntensityTexture;
      self->_ambientIntensityTexture = v15;

      if (!self->_ambientIntensityTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->FlashIntensityTexture"];
      v17 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v18 = (MTLTexture *)[v17 newTextureWithDescriptor:v7];
      flashIntensityTexture = self->_flashIntensityTexture;
      self->_flashIntensityTexture = v18;

      if (!self->_flashIntensityTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->TargetGainTexture"];
      uint64_t v20 = [(FigMetalContext *)self->_metalContext allocator];
      v21 = (MTLTexture *)[v20 newTextureWithDescriptor:v7];
      targetGainTexture = self->_targetGainTexture;
      self->_targetGainTexture = v21;

      if (!self->_targetGainTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->WeightMapTexture"];
      v23 = [(FigMetalContext *)self->_metalContext allocator];
      objc_super v24 = (MTLTexture *)[v23 newTextureWithDescriptor:v7];
      weightMapTexture = self->_weightMapTexture;
      self->_weightMapTexture = v24;

      if (!self->_weightMapTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->StrongerGradientsMaskTexture"];
      v26 = [(FigMetalContext *)self->_metalContext allocator];
      v27 = (MTLTexture *)[v26 newTextureWithDescriptor:v7];
      strongerGradientsMaskTexture = self->_strongerGradientsMaskTexture;
      self->_strongerGradientsMaskTexture = v27;

      if (!self->_strongerGradientsMaskTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->PositiveIntensityMaskTexture"];
      v29 = [(FigMetalContext *)self->_metalContext allocator];
      v30 = (MTLTexture *)[v29 newTextureWithDescriptor:v7];
      positiveIntensityMaskTexture = self->_positiveIntensityMaskTexture;
      self->_positiveIntensityMaskTexture = v30;

      if (!self->_positiveIntensityMaskTexture) {
        goto LABEL_17;
      }
      uint64_t v32 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config fusionMapWidth];
      v33 = [v7 desc];
      [v33 setWidth:v32];

      uint64_t v34 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config fusionMapHeight];
      v35 = [v7 desc];
      [v35 setHeight:v34];

      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->MixMapTexture"];
      v36 = [(FigMetalContext *)self->_metalContext allocator];
      v37 = (MTLTexture *)[v36 newTextureWithDescriptor:v7];
      mixMapTexture = self->_mixMapTexture;
      self->_mixMapTexture = v37;

      if (!self->_mixMapTexture) {
        goto LABEL_17;
      }
      uint64_t v39 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config gainMapWidth];
      v40 = [v7 desc];
      [v40 setWidth:v39];

      uint64_t v41 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config gainMapHeight];
      v42 = [v7 desc];
      [v42 setHeight:v41];

      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->IntensityGainMapTexture"];
      v43 = [(FigMetalContext *)self->_metalContext allocator];
      v44 = (MTLTexture *)[v43 newTextureWithDescriptor:v7];
      intensityGainMapTexture = self->_intensityGainMapTexture;
      self->_intensityGainMapTexture = v44;

      if (!self->_intensityGainMapTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->ShadowEdgeMaskTexture"];
      v46 = [(FigMetalContext *)self->_metalContext allocator];
      v47 = (MTLTexture *)[v46 newTextureWithDescriptor:v7];
      shadowEdgeMaskTexture = self->_shadowEdgeMaskTexture;
      self->_shadowEdgeMaskTexture = v47;

      if (!self->_shadowEdgeMaskTexture) {
        goto LABEL_17;
      }
      v49 = [v7 desc];
      [v49 setTextureType:3];

      uint64_t v50 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config gridWidth];
      v51 = [v7 desc];
      [v51 setWidth:v50];

      uint64_t v52 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config gridHeight];
      v53 = [v7 desc];
      [v53 setHeight:v52];

      uint64_t v54 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config gridBands];
      v55 = [v7 desc];
      [v55 setArrayLength:v54];

      [v7 setLabel:@"ColourConstancyV1->Core->MicroHazeDetection->GridTransformsTexture"];
      v56 = [(FigMetalContext *)self->_metalContext allocator];
      v57 = (MTLTexture *)[v56 newTextureWithDescriptor:v7];
      gridTransformsTexture = self->_gridTransformsTexture;
      self->_gridTransformsTexture = v57;

      if (self->_gridTransformsTexture)
      {
        int v59 = 0;
      }
      else
      {
LABEL_17:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v59 = 6;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v59 = 7;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v7 = 0;
    int v59 = 8;
  }

  return v59;
}

- (int)_encodeIntensityImageGeneration:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 outputAmbientIntensityTexture:(id)a6 outputFlashIntensityTexture:(id)a7 outputTargetGainTexture:(id)a8 outputWeightMapTexture:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = [a3 computeCommandEncoder];
  v22 = v21;
  if (v21)
  {
    [v21 setComputePipelineState:self->_intensityImageGenerationPipelineState];
    [v22 setTexture:v15 atIndex:0];
    [v22 setTexture:v16 atIndex:1];
    [v22 setTexture:v17 atIndex:2];
    [v22 setTexture:v18 atIndex:3];
    [v22 setTexture:v19 atIndex:4];
    [v22 setTexture:v20 atIndex:5];
    unint64_t v23 = (unint64_t)[(MTLComputePipelineState *)self->_intensityImageGenerationPipelineState threadExecutionWidth];
    id v24 = v18;
    id v25 = v16;
    id v26 = v15;
    unint64_t v27 = (unint64_t)[(MTLComputePipelineState *)self->_intensityImageGenerationPipelineState maxTotalThreadsPerThreadgroup]/ v23;
    v31[0] = [v17 width];
    v31[1] = [v17 height];
    v31[2] = 1;
    v30[0] = v23;
    v30[1] = v27;
    id v15 = v26;
    id v16 = v25;
    id v18 = v24;
    v30[2] = 1;
    [v22 dispatchThreads:v31 threadsPerThreadgroup:v30];
    [v22 endEncoding];
    int v28 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v28 = 10;
  }

  return v28;
}

- (int)_encodeIntensityGainTransformsGeneration:(id)a3 inputAmbientIntensityTexture:(id)a4 inputTargetGainTexture:(id)a5 inputWeightMapTexture:(id)a6 gridRegionScale:(float)a7 bandingMinWeight:(float)a8 bandingGaussianSigmaScale:(float)a9 filterToSigmaScale:(float)a10 spatialGaussianSigmaScale:(float)a11 outputGridTransformsTexture:(id)a12
{
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  float v37 = a8;
  float v38 = a7;
  float v35 = a10;
  float v36 = a9;
  float v34 = a11;
  id v25 = a12;
  id v26 = [a3 computeCommandEncoder];
  unint64_t v27 = v26;
  if (v26)
  {
    [v26 setComputePipelineState:self->_intensityGainTransformsGenerationPipelineState];
    [v27 setTexture:v22 atIndex:0];
    [v27 setTexture:v23 atIndex:1];
    [v27 setTexture:v24 atIndex:2];
    [v27 setTexture:v25 atIndex:3];
    [v27 setBytes:&v38 length:4 atIndex:0];
    [v27 setBytes:&v37 length:4 atIndex:1];
    [v27 setBytes:&v36 length:4 atIndex:2];
    [v27 setBytes:&v35 length:4 atIndex:3];
    [v27 setBytes:&v34 length:4 atIndex:4];
    unint64_t v28 = (unint64_t)[(MTLComputePipelineState *)self->_intensityGainTransformsGenerationPipelineState threadExecutionWidth];
    unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_intensityGainTransformsGenerationPipelineState maxTotalThreadsPerThreadgroup]/ v28;
    v33[0] = [v25 width];
    v33[1] = [v25 height];
    v33[2] = 1;
    v32[0] = v28;
    v32[1] = v29;
    v32[2] = 1;
    [v27 dispatchThreads:v33 threadsPerThreadgroup:v32];
    [v27 endEncoding];
    int v30 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v30 = 10;
  }

  return v30;
}

- (int)_encodeIntensityGainMapGeneration:(id)a3 inputAmbientIntensityTexture:(id)a4 inputGridTransformsTexture:(id)a5 outputIntensityGainMapTexture:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [a3 computeCommandEncoder];
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 setComputePipelineState:self->_intensityGainMapGenerationPipelineState];
    [v14 setTexture:v10 atIndex:0];
    [v14 setTexture:v11 atIndex:1];
    [v14 setTexture:v12 atIndex:2];
    unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_intensityGainMapGenerationPipelineState threadExecutionWidth];
    unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_intensityGainMapGenerationPipelineState maxTotalThreadsPerThreadgroup]/ v15;
    v20[0] = [v12 width];
    v20[1] = [v12 height];
    v20[2] = 1;
    v19[0] = v15;
    v19[1] = v16;
    v19[2] = 1;
    [v14 dispatchThreads:v20 threadsPerThreadgroup:v19];
    [v14 endEncoding];
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

- (int)_encodeClassifierMasksExtraction:(id)a3 inputAmbientIntensityTexture:(id)a4 inputFlashIntensityTexture:(id)a5 inputIntensityGainMapTexture:(id)a6 outputStrongerGradientsMaskTexture:(id)a7 outputPositiveIntensityMaskTexture:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [a3 computeCommandEncoder];
  id v20 = v19;
  if (v19)
  {
    [v19 setComputePipelineState:self->_classifierMasksExtractionPipelineState];
    [v20 setTexture:v14 atIndex:0];
    [v20 setTexture:v15 atIndex:1];
    [v20 setTexture:v16 atIndex:2];
    [v20 setTexture:v17 atIndex:3];
    [v20 setTexture:v18 atIndex:4];
    unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_classifierMasksExtractionPipelineState threadExecutionWidth];
    unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_classifierMasksExtractionPipelineState maxTotalThreadsPerThreadgroup]/ v21;
    v26[0] = [v18 width];
    v26[1] = [v18 height];
    v26[2] = 1;
    v25[0] = v21;
    v25[1] = v22;
    v25[2] = 1;
    [v20 dispatchThreads:v26 threadsPerThreadgroup:v25];
    [v20 endEncoding];
    int v23 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v23 = 10;
  }

  return v23;
}

- (int)_encodeMixMapGeneration:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 inputIntensityGainMapTexture:(id)a6 inputStrongerGradientsMaskTexture:(id)a7 inputPositiveIntensityMaskTexture:(id)a8 strongGradientsMaskResponseGain:(float)a9 strongGradientsMaskResponseBias:(float)a10 strongGradientsMaskResponseExponent:(float)a11 positiveIntensityMaskResponseGain:(float)a12 positiveIntensityMaskResponseBias:(float)a13 positiveIntensityMaskResponseExponent:(float)a14 maskFusionGain:(float)a15 maskFusionMixFactor:(float)a16 ambientQualityMinGain:(float)a17 ambientQualityMaxGain:(float)a18 ambientQualityZeroThreshold:(float)a19 ambientQualityOneThreshold:(float)a20 outputMixMapTexture:(id)a21
{
  id v35 = a21;
  id v36 = a4;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  id v40 = a8;
  float v56 = a10;
  v57[0] = a9;
  float v54 = a12;
  float v55 = a11;
  float v52 = a14;
  float v53 = a13;
  float v50 = a16;
  float v51 = a15;
  id v41 = v35;
  v42 = [a3 computeCommandEncoder];
  v43 = v42;
  if (v42)
  {
    [v42 setComputePipelineState:self->_mixMapGenerationPipelineState];
    [v43 setTexture:v36 atIndex:0];
    [v43 setTexture:v37 atIndex:1];
    [v43 setTexture:v38 atIndex:2];
    [v43 setTexture:v39 atIndex:3];
    [v43 setTexture:v40 atIndex:4];
    [v43 setTexture:v41 atIndex:5];
    [v43 setBytes:v57 length:4 atIndex:0];
    [v43 setBytes:&v56 length:4 atIndex:1];
    [v43 setBytes:&v55 length:4 atIndex:2];
    [v43 setBytes:&v54 length:4 atIndex:3];
    [v43 setBytes:&v53 length:4 atIndex:4];
    [v43 setBytes:&v52 length:4 atIndex:5];
    [v43 setBytes:&v51 length:4 atIndex:6];
    [v43 setBytes:&v50 length:4 atIndex:7];
    [v43 setBytes:&a17 length:4 atIndex:8];
    [v43 setBytes:&a18 length:4 atIndex:9];
    [v43 setBytes:&a19 length:4 atIndex:10];
    [v43 setBytes:&a20 length:4 atIndex:11];
    unint64_t v44 = (unint64_t)[(MTLComputePipelineState *)self->_mixMapGenerationPipelineState threadExecutionWidth];
    unint64_t v45 = (unint64_t)[(MTLComputePipelineState *)self->_mixMapGenerationPipelineState maxTotalThreadsPerThreadgroup]/ v44;
    v49[0] = [v41 width];
    v49[1] = [v41 height];
    v49[2] = 1;
    v48[0] = v44;
    v48[1] = v45;
    v48[2] = 1;
    [v43 dispatchThreads:v49 threadsPerThreadgroup:v48];
    [v43 endEncoding];
    int v46 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v46 = 10;
  }

  return v46;
}

- (int)_encodeShadowEdgeMapExtraction:(id)a3 inputIntensityGainMapTexture:(id)a4 shadowEdgesResponseGain:(float)a5 shadowEdgesResponseExponent:(float)a6 outputShadowEdgeMaskTexture:(id)a7
{
  id v12 = a4;
  float v22 = a6;
  float v23 = a5;
  id v13 = a7;
  id v14 = [a3 computeCommandEncoder];
  id v15 = v14;
  if (v14)
  {
    [v14 setComputePipelineState:self->_shadowEdgeMapExtractionPipelineState];
    [v15 setTexture:v12 atIndex:0];
    [v15 setTexture:v13 atIndex:1];
    [v15 setBytes:&v23 length:4 atIndex:0];
    [v15 setBytes:&v22 length:4 atIndex:1];
    unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_shadowEdgeMapExtractionPipelineState threadExecutionWidth];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_shadowEdgeMapExtractionPipelineState maxTotalThreadsPerThreadgroup]/ v16;
    v21[0] = [v13 width];
    v21[1] = [v13 height];
    v21[2] = 1;
    v20[0] = v16;
    v20[1] = v17;
    v20[2] = 1;
    [v15 dispatchThreads:v21 threadsPerThreadgroup:v20];
    [v15 endEncoding];
    int v18 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v18 = 10;
  }

  return v18;
}

- (int)_encodeFusionMapExtraction:(id)a3 inputMixMapTexture:(id)a4 inputShadowEdgeMaskTexture:(id)a5 gaussianFilterSize:(int)a6 gaussianSigma:(float)a7 outputFusionMapTexture:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  int v26 = a6;
  float v25 = a7;
  id v16 = a8;
  unint64_t v17 = [a3 computeCommandEncoder];
  int v18 = v17;
  if (v17)
  {
    [v17 setComputePipelineState:self->_fusionMapExtractionPipelineState];
    [v18 setTexture:v14 atIndex:0];
    [v18 setTexture:v15 atIndex:1];
    [v18 setTexture:v16 atIndex:2];
    [v18 setBytes:&v26 length:4 atIndex:0];
    [v18 setBytes:&v25 length:4 atIndex:1];
    unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_fusionMapExtractionPipelineState threadExecutionWidth];
    unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)self->_fusionMapExtractionPipelineState maxTotalThreadsPerThreadgroup]/ v19;
    v24[0] = [v16 width];
    v24[1] = [v16 height];
    v24[2] = 1;
    v23[0] = v19;
    v23[1] = v20;
    v23[2] = 1;
    [v18 dispatchThreads:v24 threadsPerThreadgroup:v23];
    [v18 endEncoding];
    int v21 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = 10;
  }

  return v21;
}

- (int)_encodeMicroHazeFusionMapExtraction:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 outputFusionMapTexture:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v67 = 10;
    goto LABEL_9;
  }
  unsigned int v14 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeIntensityImageGeneration:v10 inputAmbientTexture:v11 inputFlashTexture:v12 outputAmbientIntensityTexture:self->_ambientIntensityTexture outputFlashIntensityTexture:self->_flashIntensityTexture outputTargetGainTexture:self->_targetGainTexture outputWeightMapTexture:self->_weightMapTexture];
  if (v14) {
    goto LABEL_11;
  }
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config gridRegionScale];
  int v16 = v15;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config bandingMinWeight];
  int v18 = v17;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config bandingGaussianSigmaScale];
  int v20 = v19;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config filterToSigmaScale];
  int v22 = v21;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config spatialGaussianSigmaScale];
  LODWORD(v24) = v23;
  LODWORD(v25) = v16;
  LODWORD(v26) = v18;
  LODWORD(v27) = v20;
  LODWORD(v28) = v22;
  unsigned int v14 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeIntensityGainTransformsGeneration:v10 inputAmbientIntensityTexture:self->_ambientIntensityTexture inputTargetGainTexture:self->_targetGainTexture inputWeightMapTexture:self->_weightMapTexture gridRegionScale:self->_gridTransformsTexture bandingMinWeight:v25 bandingGaussianSigmaScale:v26 filterToSigmaScale:v27 spatialGaussianSigmaScale:v28 outputGridTransformsTexture:v24];
  if (v14) {
    goto LABEL_11;
  }
  unsigned int v14 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeIntensityGainMapGeneration:v10 inputAmbientIntensityTexture:self->_ambientIntensityTexture inputGridTransformsTexture:self->_gridTransformsTexture outputIntensityGainMapTexture:self->_intensityGainMapTexture];
  if (v14) {
    goto LABEL_11;
  }
  unsigned int v14 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeClassifierMasksExtraction:v10 inputAmbientIntensityTexture:self->_ambientIntensityTexture inputFlashIntensityTexture:self->_flashIntensityTexture inputIntensityGainMapTexture:self->_intensityGainMapTexture outputStrongerGradientsMaskTexture:self->_strongerGradientsMaskTexture outputPositiveIntensityMaskTexture:self->_positiveIntensityMaskTexture];
  if (v14) {
    goto LABEL_11;
  }
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config strongGradientsMaskResponseGain];
  int v72 = v29;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config strongGradientsMaskResponseBias];
  int v71 = v30;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config strongGradientsMaskResponseExponent];
  int v70 = v31;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config positiveIntensityMaskResponseGain];
  int v33 = v32;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config positiveIntensityMaskResponseBias];
  int v35 = v34;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config positiveIntensityMaskResponseExponent];
  int v37 = v36;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config maskFusionGain];
  int v39 = v38;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config maskFusionMixFactor];
  int v41 = v40;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config ambientQualityMinGain];
  unsigned int v43 = v42;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config ambientQualityMaxGain];
  unsigned int v45 = v44;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config ambientQualityZeroThreshold];
  unsigned int v47 = v46;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config ambientQualityOneThreshold];
  unint64_t v69 = __PAIR64__(v48, v47);
  LODWORD(v50) = v71;
  LODWORD(v49) = v72;
  LODWORD(v51) = v70;
  LODWORD(v52) = v33;
  LODWORD(v53) = v35;
  LODWORD(v54) = v37;
  LODWORD(v55) = v39;
  LODWORD(v56) = v41;
  unsigned int v14 = -[CMIColourConstancyMicroHazeDetectionV1 _encodeMixMapGeneration:inputAmbientTexture:inputFlashTexture:inputIntensityGainMapTexture:inputStrongerGradientsMaskTexture:inputPositiveIntensityMaskTexture:strongGradientsMaskResponseGain:strongGradientsMaskResponseBias:strongGradientsMaskResponseExponent:positiveIntensityMaskResponseGain:positiveIntensityMaskResponseBias:positiveIntensityMaskResponseExponent:maskFusionGain:maskFusionMixFactor:ambientQualityMinGain:ambientQualityMaxGain:ambientQualityZeroThreshold:ambientQualityOneThreshold:outputMixMapTexture:](self, "_encodeMixMapGeneration:inputAmbientTexture:inputFlashTexture:inputIntensityGainMapTexture:inputStrongerGradientsMaskTexture:inputPositiveIntensityMaskTexture:strongGradientsMaskResponseGain:strongGradientsMaskResponseBias:strongGradientsMaskResponseExponent:positiveIntensityMaskResponseGain:positiveIntensityMaskResponseBias:positiveIntensityMaskResponseExponent:maskFusionGain:maskFusionMixFactor:ambientQualityMinGain:ambientQualityMaxGain:ambientQualityZeroThreshold:ambientQualityOneThreshold:outputMixMapTexture:", v10, v11, v12, self->_intensityGainMapTexture, self->_strongerGradientsMaskTexture, self->_positiveIntensityMaskTexture, v49, v50, v51, v52, v53, v54, v55,
          v56,
          __PAIR64__(v45, v43),
          v69,
          self->_mixMapTexture);
  if (v14
    || ([(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config shadowEdgesResponseGain], v58 = v57, [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config shadowEdgesResponseExponent], LODWORD(v60) = v59, LODWORD(v61) = v58, (unsigned int v14 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeShadowEdgeMapExtraction:v10 inputIntensityGainMapTexture:self->_intensityGainMapTexture shadowEdgesResponseGain:self->_shadowEdgeMaskTexture shadowEdgesResponseExponent:v61 outputShadowEdgeMaskTexture:v60]) != 0))
  {
LABEL_11:
    int v67 = v14;
    fig_log_get_emitter();
LABEL_16:
    FigDebugAssert3();
    goto LABEL_9;
  }
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config fusionDiffuseGaussianSigma];
  float v63 = v62;
  [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)self->_config fusionDiffuseSigmaToHalfFilterScale];
  uint64_t v65 = (2 * llroundf(v63 * v64)) | 1;
  *(float *)&double v66 = v63;
  int v67 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeFusionMapExtraction:v10 inputMixMapTexture:self->_mixMapTexture inputShadowEdgeMaskTexture:self->_shadowEdgeMaskTexture gaussianFilterSize:v65 gaussianSigma:v13 outputFusionMapTexture:v66];
  if (v67)
  {
    fig_log_get_emitter();
    goto LABEL_16;
  }
LABEL_9:

  return v67;
}

- (int)microHazeFusionMapExtraction:(id)a3 inputAmbientTexture:(id)a4 inputFlashTexture:(id)a5 outputFusionMapTexture:(id)a6
{
  int v6 = [(CMIColourConstancyMicroHazeDetectionV1 *)self _encodeMicroHazeFusionMapExtraction:a3 inputAmbientTexture:a4 inputFlashTexture:a5 outputFusionMapTexture:a6];
  if (v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionMapExtractionPipelineState, 0);
  objc_storeStrong((id *)&self->_shadowEdgeMapExtractionPipelineState, 0);
  objc_storeStrong((id *)&self->_mixMapGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_classifierMasksExtractionPipelineState, 0);
  objc_storeStrong((id *)&self->_intensityGainMapGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_intensityGainTransformsGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_intensityImageGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_shadowEdgeMaskTexture, 0);
  objc_storeStrong((id *)&self->_mixMapTexture, 0);
  objc_storeStrong((id *)&self->_positiveIntensityMaskTexture, 0);
  objc_storeStrong((id *)&self->_strongerGradientsMaskTexture, 0);
  objc_storeStrong((id *)&self->_gridTransformsTexture, 0);
  objc_storeStrong((id *)&self->_intensityGainMapTexture, 0);
  objc_storeStrong((id *)&self->_weightMapTexture, 0);
  objc_storeStrong((id *)&self->_targetGainTexture, 0);
  objc_storeStrong((id *)&self->_flashIntensityTexture, 0);
  objc_storeStrong((id *)&self->_ambientIntensityTexture, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end