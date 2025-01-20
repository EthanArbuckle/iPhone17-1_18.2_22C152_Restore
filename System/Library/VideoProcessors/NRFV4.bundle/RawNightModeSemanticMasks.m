@interface RawNightModeSemanticMasks
- (MTLTexture)hairMaskTexture;
- (MTLTexture)personMaskTexture;
- (MTLTexture)skinMaskTexture;
- (MTLTexture)skyMaskTexture;
- (RawNightModeSemanticMasks)initWithContext:(id)a3;
- (__CVBuffer)hairMaskPixelBuffer;
- (__CVBuffer)personMaskPixelBuffer;
- (__CVBuffer)skinMaskPixelBuffer;
- (__CVBuffer)skyMaskPixelBuffer;
- (id)bindPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
- (void)reset;
- (void)setHairMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setPersonMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setSkinMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setSkyMaskPixelBuffer:(__CVBuffer *)a3;
@end

@implementation RawNightModeSemanticMasks

- (RawNightModeSemanticMasks)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RawNightModeSemanticMasks;
  v6 = [(RawNightModeSemanticMasks *)&v10 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_skinMaskPixelBuffer);
  CVPixelBufferRelease(self->_skyMaskPixelBuffer);
  CVPixelBufferRelease(self->_personMaskPixelBuffer);
  CVPixelBufferRelease(self->_hairMaskPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)RawNightModeSemanticMasks;
  [(RawNightModeSemanticMasks *)&v3 dealloc];
}

- (id)bindPixelBuffer:(__CVBuffer *)a3
{
  if (a3)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType == 1278226536)
    {
      uint64_t v7 = 25;
    }
    else
    {
      if (PixelFormatType != 1278226488)
      {
        v8 = 0;
LABEL_8:
        return v8;
      }
      uint64_t v7 = 10;
    }
    v8 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:v7 usage:1 plane:0];
    goto LABEL_8;
  }
  v8 = 0;
  return v8;
}

- (void)setSkinMaskPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_skinMaskPixelBuffer);
  self->_skinMaskPixelBuffer = a3;
  self->_skinMaskTexture = [(RawNightModeSemanticMasks *)self bindPixelBuffer:a3];

  MEMORY[0x270F9A758]();
}

- (void)setSkyMaskPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_skyMaskPixelBuffer);
  self->_skyMaskPixelBuffer = a3;
  self->_skyMaskTexture = [(RawNightModeSemanticMasks *)self bindPixelBuffer:a3];

  MEMORY[0x270F9A758]();
}

- (void)setPersonMaskPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_personMaskPixelBuffer);
  self->_personMaskPixelBuffer = a3;
  self->_personMaskTexture = [(RawNightModeSemanticMasks *)self bindPixelBuffer:a3];

  MEMORY[0x270F9A758]();
}

- (void)setHairMaskPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_hairMaskPixelBuffer);
  self->_hairMaskPixelBuffer = a3;
  self->_hairMaskTexture = [(RawNightModeSemanticMasks *)self bindPixelBuffer:a3];

  MEMORY[0x270F9A758]();
}

- (void)reset
{
  CVPixelBufferRelease(self->_skinMaskPixelBuffer);
  CVPixelBufferRelease(self->_skyMaskPixelBuffer);
  CVPixelBufferRelease(self->_personMaskPixelBuffer);
  CVPixelBufferRelease(self->_hairMaskPixelBuffer);
  *(_OWORD *)&self->_skinMaskPixelBuffer = 0u;
  *(_OWORD *)&self->_personMaskPixelBuffer = 0u;
  skinMaskTexture = self->_skinMaskTexture;
  self->_skinMaskTexture = 0;

  skyMaskTexture = self->_skyMaskTexture;
  self->_skyMaskTexture = 0;

  personMaskTexture = self->_personMaskTexture;
  self->_personMaskTexture = 0;

  hairMaskTexture = self->_hairMaskTexture;
  self->_hairMaskTexture = 0;
}

- (__CVBuffer)skinMaskPixelBuffer
{
  return self->_skinMaskPixelBuffer;
}

- (__CVBuffer)skyMaskPixelBuffer
{
  return self->_skyMaskPixelBuffer;
}

- (__CVBuffer)personMaskPixelBuffer
{
  return self->_personMaskPixelBuffer;
}

- (__CVBuffer)hairMaskPixelBuffer
{
  return self->_hairMaskPixelBuffer;
}

- (MTLTexture)skinMaskTexture
{
  return self->_skinMaskTexture;
}

- (MTLTexture)skyMaskTexture
{
  return self->_skyMaskTexture;
}

- (MTLTexture)personMaskTexture
{
  return self->_personMaskTexture;
}

- (MTLTexture)hairMaskTexture
{
  return self->_hairMaskTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairMaskTexture, 0);
  objc_storeStrong((id *)&self->_personMaskTexture, 0);
  objc_storeStrong((id *)&self->_skyMaskTexture, 0);
  objc_storeStrong((id *)&self->_skinMaskTexture, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end