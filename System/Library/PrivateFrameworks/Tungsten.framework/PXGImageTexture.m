@interface PXGImageTexture
+ (id)_sharedCIContext;
- (CGImage)imageRepresentation;
- (CGImage)sourceCGImage;
- (PXGImageTexture)init;
- (__CVBuffer)sourceCVPixelBuffer;
- (double)orientationTransform;
- (float)alpha;
- (id)cacheKey;
- (id)copyWithOrientationTransform:(float)a3 alpha:;
- (void)dealloc;
- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9;
- (void)setCacheKey:(id)a3;
- (void)setSourceCGImage:(CGImage *)a3;
- (void)setSourceCVPixelBuffer:(__CVBuffer *)a3;
@end

@implementation PXGImageTexture

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  LODWORD(v9) = a9;
  v13 = a4;
  v14 = a3;
  if ([(PXGBaseTexture *)self spriteCount] < a9)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXGImageTexture.m", 108, @"Invalid parameter not satisfying: %@", @"count <= self.spriteCount" object file lineNumber description];
  }
  [(PXGBaseTexture *)self pixelSize];
  double v18 = v17;
  double v20 = v19;
  PXSizeScale();
  double v22 = v21;
  double v24 = v23;
  [(PXGImageTexture *)self alpha];
  int v26 = v25;
  [(PXGImageTexture *)self orientationTransform];
  if (v9)
  {
    uint64_t v9 = v9;
    float32x4_t v32 = v27;
    do
    {
      unsigned int v28 = *v13++;
      PXGCreateTextureInfo(*((unsigned __int8 *)&a6[1].var3 + 160 * v28 + 2), (uint64_t)v33, v18, v20, v22, v24, a8, 0.0, 0.0, COERCE_FLOAT(*((void *)&a5[1].var0.var0 + 4 * v28)), COERCE_FLOAT(HIDWORD(*((void *)&a5[1].var0.var0 + 4 * v28))), v27, v26);
      float32x4_t v27 = v32;
      long long v29 = v33[1];
      *(_OWORD *)&v14->var0 = v33[0];
      *(_OWORD *)&v14[4].var0 = v29;
      long long v30 = v33[3];
      *(_OWORD *)&v14[8].var0 = v33[2];
      *(_OWORD *)&v14[12].var0 = v30;
      v14 += 16;
      --v9;
    }
    while (v9);
  }
}

- (void)setSourceCGImage:(CGImage *)a3
{
  sourceCGImage = self->_sourceCGImage;
  if (sourceCGImage != a3)
  {
    CGImageRelease(sourceCGImage);
    self->_sourceCGImage = CGImageRetain(a3);
  }
}

- (PXGImageTexture)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXGImageTexture;
  v2 = [(PXGBaseTexture *)&v4 init];
  if (v2)
  {
    objc_opt_class();
    kdebug_trace();
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setCacheKey:(id)a3
{
}

- (id)cacheKey
{
  return self->_cacheKey;
}

- (CGImage)imageRepresentation
{
  if ([(PXGImageTexture *)self sourceCGImage])
  {
    return [(PXGImageTexture *)self sourceCGImage];
  }
  else
  {
    if (![(PXGImageTexture *)self sourceCVPixelBuffer]) {
      return 0;
    }
    [(PXGImageTexture *)self orientationTransform];
    int8x16_t v13 = v4;
    double v5 = *(float *)v4.i32;
    double v6 = *(float *)&v4.i32[3];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263F00650]), "initWithCVPixelBuffer:", -[PXGImageTexture sourceCVPixelBuffer](self, "sourceCVPixelBuffer"));
    int8x16_t v8 = v13;
    v8.i32[0] = vextq_s8(v8, v8, 8uLL).u32[0];
    double v14 = v5;
    float64x2_t v15 = vcvtq_f64_f32(*(float32x2_t *)v8.i8);
    double v16 = v6;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v9 = [v7 imageByApplyingTransform:&v14];

    v10 = [(id)objc_opt_class() _sharedCIContext];
    [v9 extent];
    v11 = (const void *)objc_msgSend(v10, "createCGImage:fromRect:", v9);
    if (v11) {
      v12 = (CGImage *)CFAutorelease(v11);
    }
    else {
      v12 = 0;
    }

    return v12;
  }
}

- (float)alpha
{
  return 1.0;
}

- (double)orientationTransform
{
  *(void *)&double result = 1065353216;
  return result;
}

- (id)copyWithOrientationTransform:(float)a3 alpha:
{
  double v5 = [MEMORY[0x263F08690] currentHandler];
  double v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXGImageTexture.m", 70, @"Method %s is a responsibility of subclass %@", "-[PXGImageTexture copyWithOrientationTransform:alpha:]", v7 object file lineNumber description];

  abort();
}

- (void)dealloc
{
  [(PXGBaseTexture *)self pixelSize];
  [(PXGBaseTexture *)self isOpaque];
  kdebug_trace();
  CVPixelBufferRelease(self->_sourceCVPixelBuffer);
  CGImageRelease(self->_sourceCGImage);
  v3.receiver = self;
  v3.super_class = (Class)PXGImageTexture;
  [(PXGBaseTexture *)&v3 dealloc];
}

- (__CVBuffer)sourceCVPixelBuffer
{
  double result = CVPixelBufferRetain(self->_sourceCVPixelBuffer);
  if (result)
  {
    return (__CVBuffer *)CFAutorelease(result);
  }
  return result;
}

- (void)setSourceCVPixelBuffer:(__CVBuffer *)a3
{
  sourceCVPixelBuffer = self->_sourceCVPixelBuffer;
  if (sourceCVPixelBuffer != a3)
  {
    CVPixelBufferRelease(sourceCVPixelBuffer);
    self->_sourceCVPixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (CGImage)sourceCGImage
{
  double result = CGImageRetain(self->_sourceCGImage);
  if (result)
  {
    return (CGImage *)CFAutorelease(result);
  }
  return result;
}

+ (id)_sharedCIContext
{
  if (_sharedCIContext_onceToken != -1) {
    dispatch_once(&_sharedCIContext_onceToken, &__block_literal_global_492);
  }
  v2 = (void *)_sharedCIContext_ciContext;

  return v2;
}

uint64_t __35__PXGImageTexture__sharedCIContext__block_invoke()
{
  _sharedCIContext_ciContext = (uint64_t)objc_alloc_init(MEMORY[0x263F00628]);

  return MEMORY[0x270F9A758]();
}

@end