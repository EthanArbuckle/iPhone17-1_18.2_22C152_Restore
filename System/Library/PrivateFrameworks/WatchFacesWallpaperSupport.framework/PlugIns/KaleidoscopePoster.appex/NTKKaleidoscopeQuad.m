@interface NTKKaleidoscopeQuad
+ (id)quadWithShaderType:(unint64_t)a3;
- (BOOL)prepareForTime:(double)a3;
- (CLKUITexture)primaryChromaTexture;
- (CLKUITexture)primaryLumaTexture;
- (CLKUITexture)secondaryTexture;
- (NTKKaleidoscopeQuad)initWithShaderType:(unint64_t)a3;
- (double)sampleCenter;
- (double)sampleRadius;
- (float)alpha;
- (float)dialRadius;
- (float)lineThickness;
- (float)rotation;
- (id)geomBuffer;
- (id)mtlPipelineBlend;
- (id)mtlPipelineOpaque;
- (unint64_t)shaderType;
- (void)dealloc;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setAlpha:(float)a3;
- (void)setDialRadius:(float)a3;
- (void)setLineThickness:(float)a3;
- (void)setPrimaryChromaTexture:(id)a3;
- (void)setPrimaryLumaTexture:(id)a3;
- (void)setRotation:(float)a3;
- (void)setSampleCenter:(NTKKaleidoscopeQuad *)self;
- (void)setSampleRadius:(NTKKaleidoscopeQuad *)self;
- (void)setSecondaryTexture:(id)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKKaleidoscopeQuad

- (NTKKaleidoscopeQuad)initWithShaderType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKKaleidoscopeQuad;
  result = [(NTKKaleidoscopeQuad *)&v10 init];
  if (result)
  {
    result->_shaderType = a3;
    result->_alpha = 1.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)result->_aspect = _D0;
    result->_lineThickness = 0.01;
  }
  return result;
}

+ (id)quadWithShaderType:(unint64_t)a3
{
  v3 = [[NTKKaleidoscopeQuad alloc] initWithShaderType:a3];
  return v3;
}

- (void)dealloc
{
  [(NTKKaleidoscopeResourceManager *)self->_loader removeClient];
  loader = self->_loader;
  self->_loader = 0;

  v4.receiver = self;
  v4.super_class = (Class)NTKKaleidoscopeQuad;
  [(NTKKaleidoscopeQuad *)&v4 dealloc];
}

- (void)setupForQuadView:(id)a3
{
  id v20 = a3;
  [v20 bounds];
  float v5 = v4;
  float v7 = v6;
  __asm { FMOV            V5.2S, #1.0 }
  LODWORD(v13) = LODWORD(_D5);
  if (v6 >= v4)
  {
    *(float *)&_D5 = v7 / v5;
    double v14 = _D5;
  }
  else
  {
    *((float *)&v13 + 1) = v5 / v7;
    double v14 = v13;
  }
  *(double *)self->_aspect = v14;
  +[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:](NTKKaleidoscopeResourceManager, "sharedInstanceWithPixelFormat:", [v20 colorPixelFormat]);
  v15 = (NTKKaleidoscopeResourceManager *)objc_claimAutoreleasedReturnValue();
  loader = self->_loader;
  self->_loader = v15;

  [(NTKKaleidoscopeResourceManager *)self->_loader addClient];
  geomBuffer = self->_geomBuffer;
  self->_geomBuffer = 0;

  mtlPipelineOpaque = self->_mtlPipelineOpaque;
  self->_mtlPipelineOpaque = 0;

  mtlPipelineBlend = self->_mtlPipelineBlend;
  self->_mtlPipelineBlend = 0;
}

- (id)geomBuffer
{
  geomBuffer = self->_geomBuffer;
  if (!geomBuffer)
  {
    double v4 = [(NTKKaleidoscopeResourceManager *)self->_loader getGeometryBuffer];
    float v5 = self->_geomBuffer;
    self->_geomBuffer = v4;

    geomBuffer = self->_geomBuffer;
  }
  return geomBuffer;
}

- (id)mtlPipelineOpaque
{
  mtlPipelineOpaque = self->_mtlPipelineOpaque;
  if (!mtlPipelineOpaque)
  {
    double v4 = [(NTKKaleidoscopeResourceManager *)self->_loader getPipelineForShaderType:self->_shaderType blending:0];
    float v5 = self->_mtlPipelineOpaque;
    self->_mtlPipelineOpaque = v4;

    mtlPipelineOpaque = self->_mtlPipelineOpaque;
  }
  return mtlPipelineOpaque;
}

- (id)mtlPipelineBlend
{
  mtlPipelineBlend = self->_mtlPipelineBlend;
  if (!mtlPipelineBlend)
  {
    double v4 = [(NTKKaleidoscopeResourceManager *)self->_loader getPipelineForShaderType:self->_shaderType blending:1];
    float v5 = self->_mtlPipelineBlend;
    self->_mtlPipelineBlend = v4;

    mtlPipelineBlend = self->_mtlPipelineBlend;
  }
  return mtlPipelineBlend;
}

- (void)setPrimaryLumaTexture:(id)a3
{
}

- (void)setPrimaryChromaTexture:(id)a3
{
}

- (void)setSecondaryTexture:(id)a3
{
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(NTKKaleidoscopeQuad *)self alpha];
  float v6 = v5;
  float v32 = v5;
  if (([(NTKKaleidoscopeQuad *)self isOpaque] & 1) != 0 || v6 >= 1.0)
  {
    v8 = [(NTKKaleidoscopeQuad *)self mtlPipelineOpaque];
    [v4 setRenderPipelineState:v8];
  }
  else
  {
    float v7 = [(NTKKaleidoscopeQuad *)self mtlPipelineBlend];
    [v4 setRenderPipelineState:v7];

    [v4 setFragmentBytes:&v32 length:4 atIndex:1];
  }
  v9 = [(NTKKaleidoscopeQuad *)self geomBuffer];
  [v4 setVertexBuffer:v9 offset:0 atIndex:0];

  objc_super v10 = [(NTKKaleidoscopeQuad *)self primaryLumaTexture];
  [v10 rect];
  [(NTKKaleidoscopeQuad *)self sampleRadius];
  uint64_t v27 = v13;
  [(NTKKaleidoscopeQuad *)self sampleCenter];
  uint64_t v28 = v14;
  [(NTKKaleidoscopeQuad *)self rotation];
  int v29 = v15;
  [(NTKKaleidoscopeQuad *)self dialRadius];
  int v30 = v16;
  [(NTKKaleidoscopeQuad *)self lineThickness];
  uint64_t v31 = v17;

  [v4 setFragmentBytes:&v26 length:48 atIndex:0];
  v18 = [(NTKKaleidoscopeQuad *)self primaryLumaTexture];
  v19 = [v18 atlas];
  [v19 bind:v4 slot:0];

  id v20 = [(NTKKaleidoscopeQuad *)self primaryChromaTexture];
  v21 = [v20 atlas];
  [v21 bind:v4 slot:1];

  if (self->_secondaryTexture)
  {
    v22 = [(NTKKaleidoscopeQuad *)self secondaryTexture];
    v23 = [v22 atlas];
    [v23 bind:v4 slot:2];
  }
  [v4 setVertexBytes:self->_aspect length:8 atIndex:1];
  [v4 setVertexBytes:&self->_dialRadius length:4 atIndex:2];
  if (self->_shaderType == 3)
  {
    uint64_t v24 = 0;
    uint64_t v25 = 4;
  }
  else
  {
    uint64_t v24 = 4;
    uint64_t v25 = 12;
  }
  [v4 drawPrimitives:4 vertexStart:v24 vertexCount:v25];
  kdebug_trace();
}

- (BOOL)prepareForTime:(double)a3
{
  return 1;
}

- (CLKUITexture)primaryLumaTexture
{
  return self->_primaryLumaTexture;
}

- (CLKUITexture)primaryChromaTexture
{
  return self->_primaryChromaTexture;
}

- (CLKUITexture)secondaryTexture
{
  return self->_secondaryTexture;
}

- (unint64_t)shaderType
{
  return self->_shaderType;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (double)sampleCenter
{
  return *(double *)(a1 + 96);
}

- (void)setSampleCenter:(NTKKaleidoscopeQuad *)self
{
  *(void *)self->_sampleCenter = v2;
}

- (double)sampleRadius
{
  return *(double *)(a1 + 104);
}

- (void)setSampleRadius:(NTKKaleidoscopeQuad *)self
{
  *(void *)self->_sampleRadius = v2;
}

- (float)rotation
{
  return self->_rotation;
}

- (void)setRotation:(float)a3
{
  self->_rotation = a3;
}

- (float)dialRadius
{
  return self->_dialRadius;
}

- (void)setDialRadius:(float)a3
{
  self->_dialRadius = a3;
}

- (float)lineThickness
{
  return self->_lineThickness;
}

- (void)setLineThickness:(float)a3
{
  self->_lineThickness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTexture, 0);
  objc_storeStrong((id *)&self->_primaryChromaTexture, 0);
  objc_storeStrong((id *)&self->_primaryLumaTexture, 0);
  objc_storeStrong((id *)&self->_mtlPipelineBlend, 0);
  objc_storeStrong((id *)&self->_mtlPipelineOpaque, 0);
  objc_storeStrong((id *)&self->_geomBuffer, 0);
  objc_storeStrong((id *)&self->_loader, 0);
}

@end