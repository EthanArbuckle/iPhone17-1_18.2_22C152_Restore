@interface TCMPSInstanceNormDataLoader
- (TCMPSInstanceNormDataLoader)initWithParams:(id)a3 gammaWeights:(float *)a4 betaWeights:(float *)a5 numberFeatureChannels:(unint64_t)a6 styles:(unint64_t)a7 device:(id)a8 cmd_queue:(id)a9;
- (float)beta;
- (float)betaWeights;
- (float)gamma;
- (float)gammaWeights;
- (id)label;
- (id)updateGammaAndBetaWithCommandBuffer:(id)a3 instanceNormalizationStateBatch:(id)a4;
- (unint64_t)numberOfFeatureChannels;
- (unint64_t)styleIndex;
- (unint64_t)styles;
- (void)checkpoint;
- (void)checkpointWithCommandQueue:(id)a3;
- (void)loadBeta:(float *)a3;
- (void)loadGamma:(float *)a3;
- (void)setLearningRate:(float)a3;
- (void)setNumberOfFeatureChannels:(unint64_t)a3;
- (void)setStyleIndex:(unint64_t)a3;
- (void)setStyles:(unint64_t)a3;
@end

@implementation TCMPSInstanceNormDataLoader

- (TCMPSInstanceNormDataLoader)initWithParams:(id)a3 gammaWeights:(float *)a4 betaWeights:(float *)a5 numberFeatureChannels:(unint64_t)a6 styles:(unint64_t)a7 device:(id)a8 cmd_queue:(id)a9
{
  id v81 = a3;
  id v16 = a8;
  id v80 = a9;
  v17 = [(TCMPSInstanceNormDataLoader *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    v18->_unint64_t numberOfFeatureChannels = a6;
    v18->_styles = a7;
    v18->_styleIndex = 0;
    uint64_t v19 = [MEMORY[0x263EFF990] data];
    gammaPlaceHolder = v18->_gammaPlaceHolder;
    v18->_gammaPlaceHolder = (NSMutableData *)v19;

    uint64_t v21 = [MEMORY[0x263EFF990] data];
    betaPlaceHolder = v18->_betaPlaceHolder;
    v18->_betaPlaceHolder = (NSMutableData *)v21;

    unint64_t v23 = 4 * a6 * a7;
    uint64_t v24 = [MEMORY[0x263EFF990] dataWithLength:v23];
    gamma_weights = v18->_gamma_weights;
    v18->_gamma_weights = (NSMutableData *)v24;

    uint64_t v26 = [MEMORY[0x263EFF990] dataWithLength:v23];
    beta_weights = v18->_beta_weights;
    v18->_beta_weights = (NSMutableData *)v26;

    uint64_t v28 = [MEMORY[0x263EFF990] dataWithBytes:a4 length:v23];
    v29 = v18->_gamma_weights;
    v18->_gamma_weights = (NSMutableData *)v28;

    uint64_t v30 = [MEMORY[0x263EFF990] dataWithBytes:a5 length:v23];
    v31 = v18->_beta_weights;
    v18->_beta_weights = (NSMutableData *)v30;

    objc_storeStrong((id *)&v18->_cq, a9);
    v32 = malloc_type_calloc(v18->_numberOfFeatureChannels, 4uLL, 0x100004052888210uLL);
    __b = malloc_type_malloc(4 * v18->_numberOfFeatureChannels, 0x100004052888210uLL);
    unint64_t numberOfFeatureChannels = v18->_numberOfFeatureChannels;
    if (numberOfFeatureChannels) {
      memset_pattern16(__b, &unk_2246B8370, 4 * numberOfFeatureChannels);
    }
    id v34 = objc_alloc(MEMORY[0x263F133A0]);
    LODWORD(v35) = 981668463;
    uint64_t v36 = [v34 initWithDevice:v16 learningRate:v35];
    adamGamma = v18->_adamGamma;
    v18->_adamGamma = (MPSNNOptimizerAdam *)v36;

    id v38 = objc_alloc(MEMORY[0x263F133A0]);
    LODWORD(v39) = 981668463;
    uint64_t v40 = [v38 initWithDevice:v16 learningRate:v39];
    adamBeta = v18->_adamBeta;
    v18->_adamBeta = (MPSNNOptimizerAdam *)v40;

    uint64_t v42 = [MEMORY[0x263F133F0] vectorDescriptorWithLength:v18->_numberOfFeatureChannels dataType:268435488];
    vDesc = v18->_vDesc;
    v18->_vDesc = (MPSVectorDescriptor *)v42;

    v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    style_props = v18->_style_props;
    v18->_style_props = v44;

    if (a7)
    {
      uint64_t v46 = 0;
      do
      {
        v47 = objc_alloc_init(TCMPSInstanceNormDataLoaderProps);
        unint64_t v48 = v46 * v18->_numberOfFeatureChannels;
        v49 = objc_msgSend(v16, "newBufferWithBytes:length:options:", -[NSMutableData bytes](v18->_gamma_weights, "bytes") + v48, 4 * v18->_numberOfFeatureChannels, 0);
        [(TCMPSInstanceNormDataLoaderProps *)v47 setGammaBuffer:v49];

        v50 = objc_msgSend(v16, "newBufferWithBytes:length:options:", -[NSMutableData bytes](v18->_beta_weights, "bytes") + v48, 4 * v18->_numberOfFeatureChannels, 0);
        [(TCMPSInstanceNormDataLoaderProps *)v47 setBetaBuffer:v50];

        v51 = (void *)[v16 newBufferWithBytes:v32 length:4 * v18->_numberOfFeatureChannels options:0];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setGammaMomentumBuffer:v51];

        v52 = (void *)[v16 newBufferWithBytes:v32 length:4 * v18->_numberOfFeatureChannels options:0];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setGammaVelocityBuffer:v52];

        v53 = (void *)[v16 newBufferWithBytes:v32 length:4 * v18->_numberOfFeatureChannels options:0];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setBetaMomentumBuffer:v53];

        v54 = (void *)[v16 newBufferWithBytes:v32 length:4 * v18->_numberOfFeatureChannels options:0];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setBetaVelocityBuffer:v54];

        v55 = (void *)[v16 newBufferWithBytes:v32 length:4 * v18->_numberOfFeatureChannels options:0];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setMovingMeanBuffer:v55];

        v56 = (void *)[v16 newBufferWithBytes:__b length:4 * v18->_numberOfFeatureChannels options:0];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setMovingVarianceBuffer:v56];

        id v57 = objc_alloc(MEMORY[0x263F133E8]);
        v58 = [(TCMPSInstanceNormDataLoaderProps *)v47 gammaBuffer];
        v59 = (void *)[v57 initWithBuffer:v58 descriptor:v18->_vDesc];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setGammaVector:v59];

        id v60 = objc_alloc(MEMORY[0x263F133E8]);
        v61 = [(TCMPSInstanceNormDataLoaderProps *)v47 gammaMomentumBuffer];
        v62 = (void *)[v60 initWithBuffer:v61 descriptor:v18->_vDesc];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setGammaMomentumVector:v62];

        id v63 = objc_alloc(MEMORY[0x263F133E8]);
        v64 = [(TCMPSInstanceNormDataLoaderProps *)v47 gammaVelocityBuffer];
        v65 = (void *)[v63 initWithBuffer:v64 descriptor:v18->_vDesc];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setGammaVelocityVector:v65];

        id v66 = objc_alloc(MEMORY[0x263F133E8]);
        v67 = [(TCMPSInstanceNormDataLoaderProps *)v47 betaBuffer];
        v68 = (void *)[v66 initWithBuffer:v67 descriptor:v18->_vDesc];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setBetaVector:v68];

        id v69 = objc_alloc(MEMORY[0x263F133E8]);
        v70 = [(TCMPSInstanceNormDataLoaderProps *)v47 betaMomentumBuffer];
        v71 = (void *)[v69 initWithBuffer:v70 descriptor:v18->_vDesc];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setBetaMomentumVector:v71];

        id v72 = objc_alloc(MEMORY[0x263F133E8]);
        v73 = [(TCMPSInstanceNormDataLoaderProps *)v47 betaVelocityBuffer];
        v74 = (void *)[v72 initWithBuffer:v73 descriptor:v18->_vDesc];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setBetaVelocityVector:v74];

        id v75 = objc_alloc(MEMORY[0x263F131A0]);
        v76 = [(TCMPSInstanceNormDataLoaderProps *)v47 gammaBuffer];
        v77 = [(TCMPSInstanceNormDataLoaderProps *)v47 betaBuffer];
        v78 = (void *)[v75 initWithGamma:v76 beta:v77];
        [(TCMPSInstanceNormDataLoaderProps *)v47 setState:v78];

        [(NSMutableArray *)v18->_style_props addObject:v47];
        v46 += 4;
        --a7;
      }
      while (a7);
    }
    free(v32);
    free(__b);
  }

  return v18;
}

- (void)setLearningRate:(float)a3
{
  -[MPSNNOptimizerAdam setLearningRate:](self->_adamGamma, "setLearningRate:");
  adamBeta = self->_adamBeta;
  *(float *)&double v6 = a3;
  [(MPSNNOptimizerAdam *)adamBeta setLearningRate:v6];
}

- (void)loadBeta:(float *)a3
{
  v5 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
  double v6 = [v5 betaVector];
  id v7 = [v6 data];
  v8 = (void *)[v7 contents];

  size_t v9 = 4 * self->_numberOfFeatureChannels * self->_styles;
  memcpy(v8, a3, v9);
}

- (float)beta
{
  [(TCMPSInstanceNormDataLoader *)self checkpointWithCommandQueue:self->_cq];
  v3 = [(NSMutableArray *)self->_style_props objectAtIndexedSubscript:self->_styleIndex];
  id v4 = [v3 betaBuffer];
  v5 = (float *)[v4 contents];

  return v5;
}

- (float)betaWeights
{
  unint64_t styleIndex = self->_styleIndex;
  [(NSMutableData *)self->_betaPlaceHolder setLength:0];
  if (self->_styles)
  {
    unint64_t v4 = 0;
    do
    {
      self->_unint64_t styleIndex = v4;
      [(TCMPSInstanceNormDataLoader *)self checkpointWithCommandQueue:self->_cq];
      v5 = [(NSMutableArray *)self->_style_props objectAtIndexedSubscript:self->_styleIndex];
      id v6 = [v5 betaBuffer];
      uint64_t v7 = [v6 contents];

      [(NSMutableData *)self->_betaPlaceHolder appendBytes:v7 length:4 * self->_numberOfFeatureChannels];
      ++v4;
    }
    while (v4 < self->_styles);
  }
  self->_unint64_t styleIndex = styleIndex;
  betaPlaceHolder = self->_betaPlaceHolder;
  return (float *)[(NSMutableData *)betaPlaceHolder bytes];
}

- (void)loadGamma:(float *)a3
{
  v5 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
  id v6 = [v5 gammaVector];
  id v7 = [v6 data];
  v8 = (void *)[v7 contents];

  size_t v9 = 4 * self->_numberOfFeatureChannels * self->_styles;
  memcpy(v8, a3, v9);
}

- (float)gamma
{
  [(TCMPSInstanceNormDataLoader *)self checkpointWithCommandQueue:self->_cq];
  v3 = [(NSMutableArray *)self->_style_props objectAtIndexedSubscript:self->_styleIndex];
  id v4 = [v3 gammaBuffer];
  v5 = (float *)[v4 contents];

  return v5;
}

- (float)gammaWeights
{
  unint64_t styleIndex = self->_styleIndex;
  [(NSMutableData *)self->_gammaPlaceHolder setLength:0];
  if (self->_styles)
  {
    unint64_t v4 = 0;
    do
    {
      self->_unint64_t styleIndex = v4;
      [(TCMPSInstanceNormDataLoader *)self checkpointWithCommandQueue:self->_cq];
      v5 = [(NSMutableArray *)self->_style_props objectAtIndexedSubscript:self->_styleIndex];
      id v6 = [v5 gammaBuffer];
      uint64_t v7 = [v6 contents];

      [(NSMutableData *)self->_gammaPlaceHolder appendBytes:v7 length:4 * self->_numberOfFeatureChannels];
      ++v4;
    }
    while (v4 < self->_styles);
  }
  self->_unint64_t styleIndex = styleIndex;
  gammaPlaceHolder = self->_gammaPlaceHolder;
  return (float *)[(NSMutableData *)gammaPlaceHolder bytes];
}

- (id)updateGammaAndBetaWithCommandBuffer:(id)a3 instanceNormalizationStateBatch:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v34 = a4;
  NSUInteger v38 = [(MPSNNOptimizerAdam *)self->_adamGamma timeStep];
  NSUInteger v37 = [(MPSNNOptimizerAdam *)self->_adamBeta timeStep];
  id v6 = [v34 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 instanceNormalization];
  instanceNormFilter = self->_instanceNormFilter;
  self->_instanceNormFilter = v7;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v34;
  uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v39)
  {
    uint64_t v36 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(obj);
        }
        size_t v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F133E8]);
        v11 = [v9 gradientForGamma];
        v43 = (void *)[v10 initWithBuffer:v11 descriptor:self->_vDesc];

        [(MPSNNOptimizerAdam *)self->_adamGamma setTimeStep:v38];
        adamGamma = self->_adamGamma;
        v41 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        v13 = [v41 gammaVector];
        v14 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        v15 = [v14 gammaMomentumVector];
        id v16 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        v17 = [v16 gammaVelocityVector];
        v18 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        uint64_t v19 = [v18 gammaVector];
        [(MPSNNOptimizerAdam *)adamGamma encodeToCommandBuffer:v40 inputGradientVector:v43 inputValuesVector:v13 inputMomentumVector:v15 inputVelocityVector:v17 resultValuesVector:v19];

        id v20 = objc_alloc(MEMORY[0x263F133E8]);
        uint64_t v21 = [v9 gradientForBeta];
        uint64_t v42 = (void *)[v20 initWithBuffer:v21 descriptor:self->_vDesc];

        [(MPSNNOptimizerAdam *)self->_adamBeta setTimeStep:v37];
        adamBeta = self->_adamBeta;
        unint64_t v23 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        uint64_t v24 = [v23 betaVector];
        v25 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        uint64_t v26 = [v25 betaMomentumVector];
        v27 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        uint64_t v28 = [v27 betaVelocityVector];
        v29 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
        uint64_t v30 = [v29 betaVector];
        [(MPSNNOptimizerAdam *)adamBeta encodeToCommandBuffer:v40 inputGradientVector:v42 inputValuesVector:v24 inputMomentumVector:v26 inputVelocityVector:v28 resultValuesVector:v30];
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v39);
  }

  v31 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
  v32 = [v31 state];

  return v32;
}

- (void)checkpoint
{
  if (self->_instanceNormFilter)
  {
    id v6 = [(MTLCommandQueue *)self->_cq commandBuffer];
    instanceNormFilter = self->_instanceNormFilter;
    unint64_t v4 = [(NSMutableArray *)self->_style_props objectAtIndex:self->_styleIndex];
    v5 = [v4 state];
    [(MPSCNNInstanceNormalization *)instanceNormFilter reloadGammaAndBetaWithCommandBuffer:v6 gammaAndBetaState:v5];

    [v6 commit];
  }
}

- (void)checkpointWithCommandQueue:(id)a3
{
  id v4 = [a3 commandBuffer];
  v3 = [v4 blitCommandEncoder];
  [v3 endEncoding];
  [v4 commit];
  [v4 waitUntilCompleted];
}

- (id)label
{
  return self->_name;
}

- (unint64_t)numberOfFeatureChannels
{
  return self->_numberOfFeatureChannels;
}

- (void)setNumberOfFeatureChannels:(unint64_t)a3
{
  self->_unint64_t numberOfFeatureChannels = a3;
}

- (unint64_t)styleIndex
{
  return self->_styleIndex;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->_unint64_t styleIndex = a3;
}

- (unint64_t)styles
{
  return self->_styles;
}

- (void)setStyles:(unint64_t)a3
{
  self->_styles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamBeta, 0);
  objc_storeStrong((id *)&self->_adamGamma, 0);
  objc_storeStrong((id *)&self->_cq, 0);
  objc_storeStrong((id *)&self->_instanceNormFilter, 0);
  objc_storeStrong((id *)&self->_vDesc, 0);
  objc_storeStrong((id *)&self->_betaPlaceHolder, 0);
  objc_storeStrong((id *)&self->_gammaPlaceHolder, 0);
  objc_storeStrong((id *)&self->_style_props, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_beta_weights, 0);
  objc_storeStrong((id *)&self->_gamma_weights, 0);
}

@end