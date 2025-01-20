@interface ChromaticAberrationRecovery
- (ChromaticAberrationRecovery)initWithMetalContext:(id)a3;
- (int)runCARWithArgs:(id *)a3 targetTexture:(id)a4;
@end

@implementation ChromaticAberrationRecovery

- (ChromaticAberrationRecovery)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ChromaticAberrationRecovery;
  v6 = [(ChromaticAberrationRecovery *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    uint64_t v8 = [(FigMetalContext *)v7->_metal computePipelineStateFor:@"ChromaticAberrationRecovery::extractRedsAndBlues" constants:0];
    extractRedsAndBlues = v7->_extractRedsAndBlues;
    v7->_extractRedsAndBlues = (MTLComputePipelineState *)v8;

    uint64_t v10 = [(FigMetalContext *)v7->_metal computePipelineStateFor:@"ChromaticAberrationRecovery::extractRedsAndBluesMultiChannel" constants:0];
    extractRedsAndBluesMultichannel = v7->_extractRedsAndBluesMultichannel;
    v7->_extractRedsAndBluesMultichannel = (MTLComputePipelineState *)v10;

    uint64_t v12 = [(FigMetalContext *)v7->_metal computePipelineStateFor:@"ChromaticAberrationRecovery::computeLCAShiftsAndWarpRedBlue" constants:0];
    computeLCAShiftsAndWarpRedBlue = v7->_computeLCAShiftsAndWarpRedBlue;
    v7->_computeLCAShiftsAndWarpRedBlue = (MTLComputePipelineState *)v12;

    v14 = v7;
  }
  else
  {
    FigDebugAssert3();
  }

  return v7;
}

- (int)runCARWithArgs:(id *)a3 targetTexture:(id)a4
{
  id v6 = a4;
  id v35 = 0;
  uint64_t v7 = [v6 pixelFormat];
  BYTE1(a3[1].var1[4]) = v7 == 115;
  if (v7 == 115) {
    uint64_t v8 = 32;
  }
  else {
    uint64_t v8 = 16;
  }
  v9 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v10 = (void *)[v9 newTextureDescriptor];

  if (!v10) {
    goto LABEL_18;
  }
  v11 = [v10 desc];
  [v11 setTextureType:2];

  unint64_t v12 = (unint64_t)[v6 width] >> (BYTE1(a3[1].var1[4]) == 0);
  v13 = [v10 desc];
  [v13 setWidth:v12];

  unint64_t v14 = (unint64_t)[v6 height] >> (BYTE1(a3[1].var1[4]) == 0);
  v15 = [v10 desc];
  [v15 setHeight:v14];

  objc_super v16 = [v10 desc];
  [v16 setUsage:3];

  v17 = [v10 desc];
  [v17 setPixelFormat:65];

  [v10 setLabel:0];
  v18 = [(FigMetalContext *)self->_metal allocator];
  v19 = (void *)[v18 newTextureWithDescriptor:v10];
  id v35 = v19;

  if (!v19) {
    goto LABEL_18;
  }
  v20 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v20) {
    goto LABEL_18;
  }
  v21 = v20;
  v22 = [v20 computeCommandEncoder];
  if (!v22)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();

    goto LABEL_13;
  }
  v23 = v22;
  uint64_t v24 = 24;
  if (!BYTE1(a3[1].var1[4])) {
    uint64_t v24 = 16;
  }
  [v22 setComputePipelineState:*(Class *)((char *)&self->super.isa + v24)];
  [v23 setTexture:v6 atIndex:0];
  [v23 setTexture:v19 atIndex:1];
  [v23 setBytes:a3 length:176 atIndex:0];
  [v23 setImageblockWidth:32 height:32];
  v34[0] = [v19 width];
  v34[1] = [v19 height];
  v34[2] = 1;
  uint64_t v31 = v8;
  uint64_t v32 = v8;
  uint64_t v33 = 1;
  [v23 dispatchThreads:v34 threadsPerThreadgroup:&v31];
  [v23 endEncoding];

  [(FigMetalContext *)self->_metal commit];
  v25 = [(FigMetalContext *)self->_metal commandBuffer];

  if (!v25)
  {
LABEL_18:
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
    goto LABEL_13;
  }
  v26 = [v25 computeCommandEncoder];
  if (v26)
  {
    v27 = v26;
    [v26 setComputePipelineState:self->_computeLCAShiftsAndWarpRedBlue];
    [v27 setTexture:v6 atIndex:0];
    [v27 setTexture:v19 atIndex:1];
    [v27 setBytes:a3 length:176 atIndex:0];
    [v27 setImageblockWidth:32 height:32];
    v30[0] = [v19 width];
    v30[1] = [v19 height];
    v30[2] = 1;
    uint64_t v31 = v8;
    uint64_t v32 = v8;
    uint64_t v33 = 1;
    [v27 dispatchThreads:v30 threadsPerThreadgroup:&v31];
    [v27 endEncoding];

    [(FigMetalContext *)self->_metal commit];
    int v28 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
  }
LABEL_13:
  FigMetalDecRef();
  [0 endEncoding];

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeLCAShiftsAndWarpRedBlue, 0);
  objc_storeStrong((id *)&self->_extractRedsAndBluesMultichannel, 0);
  objc_storeStrong((id *)&self->_extractRedsAndBlues, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end