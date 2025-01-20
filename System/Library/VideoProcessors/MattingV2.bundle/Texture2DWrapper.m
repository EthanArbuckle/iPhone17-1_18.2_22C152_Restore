@interface Texture2DWrapper
- (MTLTexture)texture;
- (MTLTexture)textureArray;
- (Texture2DWrapper)initWithFigMetalContext:(id)a3 copyingPixelBuffer:(__CVBuffer *)a4 usage:(unint64_t)a5;
- (Texture2DWrapper)initWithFigMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 usage:(unint64_t)a5;
- (Texture2DWrapper)initWithFigMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 usage:(unint64_t)a5 textureArray:(BOOL)a6;
- (Texture2DWrapper)initWithTexture:(id)a3 textureArray:(BOOL)a4;
- (__CVBuffer)pixelBuffer;
- (id)initNewTextureWithFigMetalContext:(id)a3 size:(CGSize)a4 withFormat:(unint64_t)a5 usage:(unint64_t)a6;
- (id)initNewTextureWithFigMetalContext:(id)a3 size:(CGSize)a4 withFormat:(unint64_t)a5 usage:(unint64_t)a6 textureArray:(BOOL)a7;
- (unint64_t)textureFormatOfPixelBuffer:(__CVBuffer *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setTexture:(id)a3;
- (void)setTextureArray:(id)a3;
@end

@implementation Texture2DWrapper

- (Texture2DWrapper)initWithTexture:(id)a3 textureArray:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)Texture2DWrapper;
  v7 = [(Texture2DWrapper *)&v27 init];
  v9 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  if (!v6) {
    goto LABEL_6;
  }
  objc_msgSend_setTexture_(v7, v8, (uint64_t)v6);
  if (v4)
  {
    v12 = objc_msgSend_texture(v9, v10, v11);
    v15 = objc_msgSend_texture(v9, v13, v14);
    uint64_t v18 = objc_msgSend_pixelFormat(v15, v16, v17);
    v20 = objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(v12, v19, v18, 3, 0, 1, 0, 1);
    objc_msgSend_setTextureArray_(v9, v21, (uint64_t)v20);

    v24 = objc_msgSend_textureArray(v9, v22, v23);

    if (!v24)
    {
LABEL_6:
      FigDebugAssert3();
LABEL_7:
      v25 = 0;
      goto LABEL_8;
    }
  }
  v25 = v9;
LABEL_8:

  return v25;
}

- (Texture2DWrapper)initWithFigMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 usage:(unint64_t)a5 textureArray:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  if (a4
    && (objc_msgSend_setPixelBuffer_(self, v10, (uint64_t)a4), CVPixelBufferGetIOSurface(a4))
    && (uint64_t v13 = objc_msgSend_textureFormatOfPixelBuffer_(self, v12, (uint64_t)a4)) != 0)
  {
    uint64_t v16 = v13;
    uint64_t v17 = objc_msgSend_pixelBuffer(self, v14, v15);
    v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v11, v18, v17, v16, a5, 0);
    self = (Texture2DWrapper *)(id)objc_msgSend_initWithTexture_textureArray_(self, v20, (uint64_t)v19, v6);

    v21 = self;
  }
  else
  {
    FigDebugAssert3();
    v21 = 0;
  }

  return v21;
}

- (Texture2DWrapper)initWithFigMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 usage:(unint64_t)a5
{
  return (Texture2DWrapper *)objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_textureArray_(self, a2, (uint64_t)a3, a4, a5, 0);
}

- (id)initNewTextureWithFigMetalContext:(id)a3 size:(CGSize)a4 withFormat:(unint64_t)a5 usage:(unint64_t)a6 textureArray:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = (void *)MEMORY[0x263F12A50];
  unint64_t width = (unint64_t)a4.width;
  unint64_t height = (unint64_t)a4.height;
  id v14 = a3;
  uint64_t v16 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v11, v15, a5, width, height, 0);
  objc_msgSend_setUsage_(v16, v17, a6);
  v20 = objc_msgSend_device(v14, v18, v19);

  v22 = objc_msgSend_newTextureWithDescriptor_(v20, v21, (uint64_t)v16);
  v24 = objc_msgSend_initWithTexture_textureArray_(self, v23, (uint64_t)v22, v7);

  return v24;
}

- (id)initNewTextureWithFigMetalContext:(id)a3 size:(CGSize)a4 withFormat:(unint64_t)a5 usage:(unint64_t)a6
{
  return (id)objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_textureArray_(self, a2, (uint64_t)a3, a5, a6, 0, a4.width, a4.height);
}

- (Texture2DWrapper)initWithFigMetalContext:(id)a3 copyingPixelBuffer:(__CVBuffer *)a4 usage:(unint64_t)a5
{
  id v8 = a3;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  uint64_t v12 = objc_msgSend_textureFormatOfPixelBuffer_(self, v11, (uint64_t)a4);
  if (!v12
    || (self = (Texture2DWrapper *)objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_textureArray_(self, v13, (uint64_t)v8, v12, a5, 0, (float)Width, (float)Height), CVPixelBufferLockBaseAddress(a4, 1uLL)))
  {
    FigDebugAssert3();
    v20 = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend_texture(self, v14, v15);
    memset(v22, 0, 24);
    v22[3] = Width;
    v22[4] = Height;
    v22[5] = 1;
    BaseAddress = CVPixelBufferGetBaseAddress(a4);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
    objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v16, v19, (uint64_t)v22, 0, BaseAddress, BytesPerRow);

    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    self = self;
    v20 = self;
  }

  return v20;
}

- (unint64_t)textureFormatOfPixelBuffer:(__CVBuffer *)a3
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 1278226487)
  {
    if (PixelFormatType <= 1751410031)
    {
      if (PixelFormatType == 1278226488) {
        return 10;
      }
      if (PixelFormatType == 1278226534) {
        return 55;
      }
      int v4 = 1278226536;
      goto LABEL_14;
    }
    if (PixelFormatType == 1751410032) {
      return 25;
    }
    if (PixelFormatType != 2084070960)
    {
      int v4 = 1751411059;
LABEL_14:
      if (PixelFormatType == v4) {
        return 25;
      }
      return 0;
    }
    return 500;
  }
  if (PixelFormatType <= 792225327)
  {
    if (PixelFormatType == 641230384 || PixelFormatType == 758670896) {
      return 500;
    }
  }
  else
  {
    if (PixelFormatType == 792225328 || PixelFormatType == 875704422) {
      return 500;
    }
    if (PixelFormatType == 1111970369) {
      return 80;
    }
  }
  return 0;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
}

- (MTLTexture)textureArray
{
  return self->_textureArray;
}

- (void)setTextureArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureArray, 0);

  objc_storeStrong((id *)&self->_texture, 0);
}

@end