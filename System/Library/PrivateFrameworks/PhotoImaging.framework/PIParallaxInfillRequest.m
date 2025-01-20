@interface PIParallaxInfillRequest
- (BOOL)shouldInfillForeground;
- (NUColorSpace)colorSpace;
- (NUImageBuffer)segmentationMatte;
- (NUPixelFormat)pixelFormat;
- (NUScalePolicy)scalePolicy;
- (PIParallaxInfillRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setColorSpace:(id)a3;
- (void)setPixelFormat:(id)a3;
- (void)setScalePolicy:(id)a3;
- (void)setSegmentationMatte:(id)a3;
- (void)setShouldInfillForeground:(BOOL)a3;
@end

@implementation PIParallaxInfillRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
}

- (void)setShouldInfillForeground:(BOOL)a3
{
  self->_shouldInfillForeground = a3;
}

- (BOOL)shouldInfillForeground
{
  return self->_shouldInfillForeground;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setPixelFormat:(id)a3
{
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setSegmentationMatte:(id)a3
{
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [PIParallaxInfillJob alloc];
  return [(PIParallaxInfillJob *)v3 initWithParallaxInfillRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PIParallaxInfillRequest;
  v4 = [(NURenderRequest *)&v14 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIParallaxInfillRequest *)self segmentationMatte];
    v6 = (void *)v4[20];
    v4[20] = v5;

    uint64_t v7 = [(PIParallaxInfillRequest *)self scalePolicy];
    v8 = (void *)v4[21];
    v4[21] = v7;

    uint64_t v9 = [(PIParallaxInfillRequest *)self pixelFormat];
    v10 = (void *)v4[22];
    v4[22] = v9;

    uint64_t v11 = [(PIParallaxInfillRequest *)self colorSpace];
    v12 = (void *)v4[23];
    v4[23] = v11;

    *((unsigned char *)v4 + 152) = [(PIParallaxInfillRequest *)self shouldInfillForeground];
  }
  return v4;
}

- (PIParallaxInfillRequest)initWithComposition:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PIParallaxInfillRequest;
  v3 = [(NURenderRequest *)&v11 initWithComposition:a3];
  uint64_t v4 = [MEMORY[0x1E4F7A478] oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  uint64_t v6 = [MEMORY[0x1E4F7A5D8] BGRA8];
  pixelFormat = v3->_pixelFormat;
  v3->_pixelFormat = (NUPixelFormat *)v6;

  uint64_t v8 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v8;

  v3->_shouldInfillForeground = 0;
  return v3;
}

@end