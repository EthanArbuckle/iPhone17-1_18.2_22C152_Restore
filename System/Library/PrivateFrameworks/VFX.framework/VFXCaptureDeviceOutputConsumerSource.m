@interface VFXCaptureDeviceOutputConsumerSource
- (BOOL)containsAlpha;
- (VFXCaptureDeviceOutputConsumerSource)init;
- (VFXCaptureDeviceOutputConsumerSource)initWithOptions:(id)a3;
- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)connectToProxy:(__CFXImageProxy *)a3;
- (void)dealloc;
- (void)discardVideoData;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3 fromDevice:(id)a4;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3 fromDevice:(id)a4;
@end

@implementation VFXCaptureDeviceOutputConsumerSource

- (VFXCaptureDeviceOutputConsumerSource)init
{
  return (VFXCaptureDeviceOutputConsumerSource *)objc_msgSend_initWithOptions_(self, a2, 0, v2);
}

- (VFXCaptureDeviceOutputConsumerSource)initWithOptions:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXCaptureDeviceOutputConsumerSource;
  v6 = [(VFXCaptureDeviceOutputConsumerSource *)&v12 init];
  if (v6)
  {
    v7 = objc_msgSend_objectForKeyedSubscript_(a3, v4, @"VFXCaptureDeviceOutputConsumerOptionContainsAlpha", v5);
    v6->_containsAlpha = objc_msgSend_BOOLValue(v7, v8, v9, v10);
  }
  return v6;
}

- (BOOL)containsAlpha
{
  return self->_containsAlpha;
}

- (void)discardVideoData
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CFRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v6 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, a2, v2, v3);
  if (v6) {
    IOSurfaceDecrementUseCount(v6);
  }

  self->_mtlTexture = 0;
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  objc_msgSend_discardVideoData(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXCaptureDeviceOutputConsumerSource;
  [(VFXTextureSource *)&v6 dealloc];
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  sub_1B6451C58((uint64_t)a3, self, 3, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1F0FBAD00;
  v15[1] = *(_OWORD *)&off_1F0FBAD10;
  sub_1B6451CE4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!self->_mtlTexture)
  {
    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      if (!self->_textureCache)
      {
        v18 = (void *)sub_1B6445900((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
        v22 = objc_msgSend_device(v18, v19, v20, v21);
        uint64_t v51 = *MEMORY[0x1E4F24C88];
        v52[0] = &unk_1F103BB58;
        CFDictionaryRef v24 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v52, (uint64_t)&v51, 1);
        CVMetalTextureCacheCreate(0, 0, v22, v24, &self->_textureCache);
        pixelBuffer = self->_pixelBuffer;
      }
      signed int PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
      if (PixelFormatType > 1111970368)
      {
        if (PixelFormatType == 1111970369)
        {
          int v26 = 1;
          goto LABEL_15;
        }
        if (PixelFormatType == 1380410945)
        {
          int v26 = 2;
          goto LABEL_15;
        }
      }
      else
      {
        if (PixelFormatType == 875704422)
        {
          int v26 = 4;
          goto LABEL_15;
        }
        if (PixelFormatType == 875704438)
        {
          int v26 = 3;
LABEL_15:
          MTLPixelFormat v27 = *(void *)&asc_1B6E723D8[24 * v26 + 16];
          CVMetalTextureRef image = 0;
          uint64_t v28 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_textureCache, self->_pixelBuffer, 0, v27, self->_width, self->_height, 0, &image);
          if (v28)
          {
            sub_1B63F2F54(16, @"Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d", v29, v30, v31, v32, v33, v34, v28);
          }
          else
          {
            Texture = (MTLTexture *)CVMetalTextureGetTexture(image);
            self->_mtlTexture = Texture;
            v36 = Texture;
            v40 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, v37, v38, v39);
            if (v40) {
              IOSurfaceIncrementUseCount(v40);
            }
            CFRelease(image);
          }
          $96EE1C12479E9B303E9C2794B92A11A2 v16 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
          goto LABEL_21;
        }
      }
      OSType v43 = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
      LOBYTE(image) = HIBYTE(v43);
      BYTE1(image) = BYTE2(v43);
      BYTE2(image) = BYTE1(v43);
      *(_WORD *)((char *)&image + 3) = v43;
      sub_1B63F2F54(16, @"Error: Invalid pixel buffer pixel format: %s", v44, v45, v46, v47, v48, v49, (uint64_t)&image);
    }
    mtlTexture = 0;
    goto LABEL_22;
  }
  $96EE1C12479E9B303E9C2794B92A11A2 v16 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
LABEL_21:
  *a6 = v16;
  mtlTexture = self->_mtlTexture;
LABEL_22:
  objc_sync_exit(self);
  return mtlTexture;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3 fromDevice:(id)a4
{
  objc_sync_enter(self);
  if (a3) {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  }
  else {
    ImageBuffer = 0;
  }
  if (ImageBuffer != self->_pixelBuffer)
  {
    objc_msgSend_discardVideoData(self, v7, v8, v9);
    if (a3)
    {
      if (ImageBuffer)
      {
        pixelBuffer = self->_pixelBuffer;
        if (pixelBuffer != ImageBuffer)
        {
          if (pixelBuffer)
          {
            CFRelease(pixelBuffer);
            self->_pixelBuffer = 0;
          }
          ImageBuffer = (__CVBuffer *)CFRetain(ImageBuffer);
          self->_pixelBuffer = ImageBuffer;
        }
        self->_width = CVPixelBufferGetWidth(ImageBuffer);
        self->_height = CVPixelBufferGetHeight(self->_pixelBuffer);
        self->_isFront = objc_msgSend_position(a4, v18, v19, v20) == 2;
      }
      else
      {
        sub_1B63F2F54(16, @"Error: Could not get pixel buffer (CVPixelBufferRef)", v11, v12, v13, v14, v15, v16, v21);
      }
    }
  }

  objc_sync_exit(self);
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
}

- (void)setPixelBuffer:(__CVBuffer *)a3 fromDevice:(id)a4
{
  objc_sync_enter(self);
  if (self->_pixelBuffer != a3)
  {
    objc_msgSend_discardVideoData(self, v7, v8, v9);
    if (a3)
    {
      uint64_t v10 = (__CVBuffer *)CFRetain(a3);
      self->_pixelBuffer = v10;
      self->_width = CVPixelBufferGetWidth(v10);
      self->_height = CVPixelBufferGetHeight(self->_pixelBuffer);
      self->_isFront = objc_msgSend_position(a4, v11, v12, v13) == 2;
      if (!CVPixelBufferGetIOSurface(self->_pixelBuffer)) {
        sub_1B63F2F54(16, @"Error: Pixel buffer (CVPixelBufferRef) must be IOSurface-backed", v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

  objc_sync_exit(self);
}

@end