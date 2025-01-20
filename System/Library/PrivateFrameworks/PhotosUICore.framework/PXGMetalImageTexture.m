@interface PXGMetalImageTexture
- (BOOL)isAtlas;
- (BOOL)isCaptureTexture;
- (BOOL)isOpaque;
- (CGSize)pixelSize;
- (MTLTexture)chromaTexture;
- (MTLTexture)texture;
- (NSString)description;
- (PXGColorProgram)colorProgram;
- (PXGMetalImageTexture)init;
- (PXGMetalImageTexture)initWithTexture:(id)a3 chromaTexture:(id)a4 colorProgram:(id)a5 isOpaque:(BOOL)a6 shaderFlags:(int)a7 orientationTransform:(float)a8 alpha:(unsigned __int8)a9 presentationType:;
- (PXGMetalImageTexture)initWithTexture:(id)a3 colorProgram:(id)a4 isOpaque:(BOOL)a5 shaderFlags:(int)a6 orientationTransform:(float)a7 alpha:(unsigned __int8)a8 presentationType:;
- (PXGMetalTextureCache)textureCache;
- (__n128)orientationTransform;
- (float)alpha;
- (id)copyWithOrientationTransform:(float)a3 alpha:;
- (int)shaderFlags;
- (int64_t)estimatedByteSize;
- (int64_t)renderPipelineIndex;
- (unsigned)presentationType;
- (void)dealloc;
- (void)setRenderPipelineIndex:(int64_t)a3;
- (void)setTextureCache:(id)a3;
@end

@implementation PXGMetalImageTexture

- (__n128)orientationTransform
{
  return a1[9];
}

- (PXGMetalImageTexture)initWithTexture:(id)a3 chromaTexture:(id)a4 colorProgram:(id)a5 isOpaque:(BOOL)a6 shaderFlags:(int)a7 orientationTransform:(float)a8 alpha:(unsigned __int8)a9 presentationType:
{
  float v11 = v9;
  long long v26 = *(_OWORD *)&a8;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PXGMetalImageTexture;
  v21 = [(PXGImageTexture *)&v27 init];
  if (v21)
  {
    if (!v18)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v21, @"PXGMetalImageTexture.m", 40, @"Invalid parameter not satisfying: %@", @"texture != nil" object file lineNumber description];
    }
    if (a7 >= 0x10000)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      objc_claimAutoreleasedReturnValue();
      PXGShaderFlagsDescription();
    }
    if (v19 && ((a7 & 0xF00) == 0 || (a7 & 0x3000) == 0))
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v21, @"PXGMetalImageTexture.m", 42, @"Invalid parameter not satisfying: %@", @"!chromaTexture || ((shaderFlags & PXGShaderFlagYCbCrMatrixMask) != 0 && (shaderFlags & PXGShaderFlagYCbCrBitDepthMask) != 0)" object file lineNumber description];
    }
    objc_storeStrong((id *)&v21->_texture, a3);
    objc_storeStrong((id *)&v21->_chromaTexture, a4);
    objc_storeStrong((id *)&v21->_colorProgram, a5);
    *(_OWORD *)v21->_orientationTransform = v26;
    v21->_alpha = v11;
    v21->_isContentOpaque = a6;
    v21->_shaderFlags = a7;
    v21->_presentationType = a9;
  }

  return v21;
}

- (int64_t)renderPipelineIndex
{
  return self->_renderPipelineIndex;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  self->_renderPipelineIndex = a3;
}

- (PXGColorProgram)colorProgram
{
  return self->_colorProgram;
}

- (CGSize)pixelSize
{
  double v3 = (double)(unint64_t)[(MTLTexture *)self->_texture width];
  double v4 = (double)(unint64_t)[(MTLTexture *)self->_texture height];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (MTLTexture)chromaTexture
{
  return self->_chromaTexture;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (BOOL)isOpaque
{
  return self->_isContentOpaque && self->_alpha >= 1.0;
}

- (float)alpha
{
  return self->_alpha;
}

- (int)shaderFlags
{
  return self->_shaderFlags;
}

- (BOOL)isAtlas
{
  return 0;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (BOOL)isCaptureTexture
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textureCache);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_storeStrong((id *)&self->_chromaTexture, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

- (void)setTextureCache:(id)a3
{
}

- (PXGMetalTextureCache)textureCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textureCache);
  return (PXGMetalTextureCache *)WeakRetained;
}

- (id)copyWithOrientationTransform:(float)a3 alpha:
{
  float v4 = v3;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_orientationTransform, *(float32x4_t *)&a3)))) & 1) != 0|| self->_alpha != v3)
  {
    double v9 = *(double *)&a3;
    id v5 = objc_alloc((Class)objc_opt_class());
    *(float *)&double v6 = v4;
    v7 = (void *)[v5 initWithTexture:self->_texture chromaTexture:self->_chromaTexture colorProgram:self->_colorProgram isOpaque:self->_isContentOpaque shaderFlags:self->_shaderFlags orientationTransform:self->_presentationType alpha:v9 presentationType:v6];
    objc_msgSend(v7, "setSourceCGImage:", -[PXGImageTexture sourceCGImage](self, "sourceCGImage"));
    objc_msgSend(v7, "setSourceCVPixelBuffer:", -[PXGImageTexture sourceCVPixelBuffer](self, "sourceCVPixelBuffer"));
    return v7;
  }
  else
  {
    return self;
  }
}

- (int64_t)estimatedByteSize
{
  return [(MTLTexture *)self->_texture allocatedSize];
}

- (NSString)description
{
  float v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PXGMetalImageTexture;
  float v4 = [(PXGBaseTexture *)&v7 description];
  id v5 = [v3 stringWithFormat:@"<%@ memory:%.2fMB texture:%p>", v4, (double)(unint64_t)-[MTLTexture allocatedSize](self->_texture, "allocatedSize") * 0.0009765625 * 0.0009765625, self->_texture];

  return (NSString *)v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textureCache);
  [WeakRetained recycleTexture:self->_texture];

  v4.receiver = self;
  v4.super_class = (Class)PXGMetalImageTexture;
  [(PXGImageTexture *)&v4 dealloc];
}

- (PXGMetalImageTexture)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGMetalImageTexture.m", 56, @"%s is not available as initializer", "-[PXGMetalImageTexture init]");

  abort();
}

- (PXGMetalImageTexture)initWithTexture:(id)a3 colorProgram:(id)a4 isOpaque:(BOOL)a5 shaderFlags:(int)a6 orientationTransform:(float)a7 alpha:(unsigned __int8)a8 presentationType:
{
  return -[PXGMetalImageTexture initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:](self, "initWithTexture:chromaTexture:colorProgram:isOpaque:shaderFlags:orientationTransform:alpha:presentationType:", a3, 0, a4, a5, *(void *)&a6, a8);
}

@end