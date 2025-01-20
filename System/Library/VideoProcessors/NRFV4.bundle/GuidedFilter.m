@interface GuidedFilter
+ (int)prewarmShaders:(id)a3;
- (GuidedFilter)initWithMetalContext:(id)a3;
- (id)createIntermediateTextureWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7;
- (int)encodeToCommandBuffer:(id)a3 inputTexture:(id)a4 guideTexture:(id)a5 outputTexture:(id)a6 kernelRadius:(unint64_t)a7 epsilon:(float)a8;
@end

@implementation GuidedFilter

- (GuidedFilter)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)GuidedFilter;
  v6 = [(GuidedFilter *)&v11 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v7 = +[GuidedFilterShared sharedInstance];
  v8 = [v7 getShaders:self->_metalContext];
  shaders = self->_shaders;
  self->_shaders = v8;

  if (!self->_shaders)
  {
LABEL_7:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_4:

  return self;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [[GuidedFilterShaders alloc] initWithMetalContext:v3];
    if (v4)
    {
      int v5 = 0;
    }
    else
    {
      FigDebugAssert3();
      v4 = 0;
      int v5 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (id)createIntermediateTextureWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7
{
  v12 = [(FigMetalContext *)self->_metalContext allocator];
  v13 = (void *)[v12 newTextureDescriptor];

  if (!v13) {
    goto LABEL_6;
  }
  [v13 setLabel:0];
  v14 = [v13 desc];
  [v14 setTextureType:2];

  v15 = [v13 desc];
  [v15 setPixelFormat:a3];

  v16 = [v13 desc];
  [v16 setWidth:a4];

  v17 = [v13 desc];
  [v17 setHeight:a5];

  v18 = [v13 desc];
  [v18 setDepth:1];

  v19 = [v13 desc];
  [v19 setUsage:a6];

  v20 = [(FigMetalContext *)self->_metalContext allocator];
  v21 = (void *)[v20 newTextureWithDescriptor:v13];

  if (!v21)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v21 = 0;
  }

  return v21;
}

- (int)encodeToCommandBuffer:(id)a3 inputTexture:(id)a4 guideTexture:(id)a5 outputTexture:(id)a6 kernelRadius:(unint64_t)a7 epsilon:(float)a8
{
  unsigned __int16 v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = v18;
  id v58 = 0;
  id v59 = 0;
  id v57 = 0;
  if (!v15)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
LABEL_15:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    v20 = 0;
    goto LABEL_10;
  }
  if (!v16)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
    goto LABEL_15;
  }
  if (!v17)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
    goto LABEL_15;
  }
  if (!v18)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
    goto LABEL_15;
  }
  v56[0] = v10;
  *(float *)&v56[1] = a8;
  v20 = [v15 computeCommandEncoder];
  if (!v20)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
LABEL_18:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v21 = -[GuidedFilter createIntermediateTextureWithFormat:width:height:usage:label:](self, "createIntermediateTextureWithFormat:width:height:usage:label:", 65, [v16 width], objc_msgSend(v16, "height"), 3, @"gf_small_tex");
  id v59 = v21;
  if (!v21)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
    goto LABEL_18;
  }
  v22 = v21;
  v23 = self->_shaders->_gfDownsampleGuide;
  [v20 setComputePipelineState:v23];
  [v20 setTexture:v16 atIndex:0];
  [v20 setTexture:v17 atIndex:1];
  [v20 setTexture:v22 atIndex:2];
  [v20 setImageblockWidth:32 height:32];
  uint64_t v24 = [v22 width];
  uint64_t v25 = [v22 height];

  v55[0] = v24;
  v55[1] = v25;
  v55[2] = 1;
  int64x2_t v53 = vdupq_n_s64(0x20uLL);
  uint64_t v54 = 1;
  [v20 dispatchThreads:v55 threadsPerThreadgroup:&v53];
  uint64_t v26 = [v59 width];
  v27 = -[GuidedFilter createIntermediateTextureWithFormat:width:height:usage:label:](self, "createIntermediateTextureWithFormat:width:height:usage:label:", 65, v26, [v59 height], 3, @"gf_coeff_tex");
  id v28 = v58;
  id v58 = v27;

  if (!v58)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
LABEL_21:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v29 = self->_shaders->_gfCalculateCoefficients;
  [v20 setComputePipelineState:v29];
  [v20 setTexture:v59 atIndex:2];
  [v20 setTexture:v58 atIndex:3];
  [v20 setBytes:v56 length:8 atIndex:0];
  [v20 setImageblockWidth:32 height:32];
  uint64_t v30 = [v58 width];
  uint64_t v31 = [v58 height];

  v52[0] = v30;
  v52[1] = v31;
  v52[2] = 1;
  int64x2_t v50 = vdupq_n_s64(0x20uLL);
  uint64_t v51 = 1;
  [v20 dispatchThreads:v52 threadsPerThreadgroup:&v50];
  FigMetalDecRef();
  uint64_t v32 = [v58 width];
  v33 = -[GuidedFilter createIntermediateTextureWithFormat:width:height:usage:label:](self, "createIntermediateTextureWithFormat:width:height:usage:label:", 65, v32, [v58 height], 3, @"gf_cmean_tex");
  id v34 = v57;
  id v57 = v33;

  if (!v57)
  {
    uint64_t v42 = v8;
    LODWORD(v41) = 0;
    goto LABEL_21;
  }
  v35 = self->_shaders->_gfFilterCoefficients;
  [v20 setComputePipelineState:v35];
  [v20 setTexture:v58 atIndex:3];
  [v20 setTexture:v57 atIndex:4];
  [v20 setBytes:v56 length:8 atIndex:0];
  [v20 setImageblockWidth:32 height:32];
  uint64_t v36 = [v58 width];
  uint64_t v37 = [v58 height];

  v49[0] = v36;
  v49[1] = v37;
  v49[2] = 1;
  int64x2_t v43 = vdupq_n_s64(0x20uLL);
  int64x2_t v47 = v43;
  uint64_t v48 = 1;
  [v20 dispatchThreads:v49 threadsPerThreadgroup:&v47];
  FigMetalDecRef();
  v38 = self->_shaders->_gfApplyCoefficients;
  [v20 setComputePipelineState:v38];
  [v20 setTexture:v17 atIndex:1];
  [v20 setTexture:v57 atIndex:4];

  [v20 setTexture:v19 atIndex:5];
  [v20 setImageblockWidth:32 height:32];
  v46[0] = [v19 width];
  v46[1] = [v19 height];
  v46[2] = 1;
  int64x2_t v44 = v43;
  uint64_t v45 = 1;
  [v20 dispatchThreads:v46 threadsPerThreadgroup:&v44];
  FigMetalDecRef();
  int v39 = 0;
LABEL_10:
  objc_msgSend(v20, "endEncoding", v41, v42);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v39;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end