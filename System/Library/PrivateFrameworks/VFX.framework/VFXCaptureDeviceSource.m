@interface VFXCaptureDeviceSource
- (AVCaptureDevice)captureDevice;
- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)connectToProxy:(__CFXImageProxy *)a3;
- (void)dealloc;
- (void)discardVideoData;
- (void)setCaptureDevice:(id)a3;
@end

@implementation VFXCaptureDeviceSource

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
  objc_msgSend_stopRunning(self->_captureSession, a2, v2, v3);

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  objc_msgSend_discardVideoData(self, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXCaptureDeviceSource;
  [(VFXTextureSource *)&v9 dealloc];
}

- (void)setCaptureDevice:(id)a3
{
  if (self->_captureDevice != a3)
  {
    objc_msgSend_stopRunning(self->_captureSession, a2, (uint64_t)a3, v3);

    self->_captureSession = 0;
    self->_captureDevice = (AVCaptureDevice *)a3;
    self->_isFront = objc_msgSend_position(a3, v6, v7, v8) == 2;
  }
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  sub_1B6451C58((uint64_t)a3, self, 2, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1F0FBACE0;
  v15[1] = *(_OWORD *)&off_1F0FBACF0;
  sub_1B6451CE4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  v88[1] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!self->_mtlTexture)
  {
    if (!self->_captureSession)
    {
      v28 = (void *)sub_1B6445900((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
      CVMetalTextureRef image = 0;
      id v29 = objc_alloc(MEMORY[0x1E4F16450]);
      v37 = objc_msgSend_initWithDevice_error_(v29, v30, (uint64_t)self->_captureDevice, (uint64_t)&image);
      if (image)
      {
        sub_1B63F2F54(16, @"Error: Could not create AVCaptureInput with error: %@", v31, v32, v33, v34, v35, v36, (uint64_t)image);

        goto LABEL_28;
      }
      v38 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E4F16498]);
      self->_captureSession = v38;
      objc_msgSend_addInput_(v38, v39, (uint64_t)v37, v40);

      id v41 = objc_alloc_init(MEMORY[0x1E4F164C0]);
      uint64_t v87 = *MEMORY[0x1E4F24D70];
      v88[0] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v42, 875704438, v43);
      uint64_t v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v44, (uint64_t)v88, (uint64_t)&v87, 1);
      objc_msgSend_setVideoSettings_(v41, v46, v45, v47);
      uint64_t v51 = objc_msgSend_resourceQueue(v28, v48, v49, v50);
      objc_msgSend_setSampleBufferDelegate_queue_(v41, v52, (uint64_t)self, v51);
      objc_msgSend_addOutput_(self->_captureSession, v53, (uint64_t)v41, v54);
      objc_msgSend_commitConfiguration(self->_captureSession, v55, v56, v57);
      objc_msgSend_startRunning(self->_captureSession, v58, v59, v60);
    }
    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      if (!self->_textureCache)
      {
        v19 = (void *)sub_1B6445900((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
        v23 = objc_msgSend_device(v19, v20, v21, v22);
        uint64_t v85 = *MEMORY[0x1E4F24C88];
        v86 = &unk_1F103BB58;
        CFDictionaryRef v25 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)&v86, (uint64_t)&v85, 1);
        CVMetalTextureCacheCreate(0, 0, v23, v25, &self->_textureCache);
        pixelBuffer = self->_pixelBuffer;
      }
      signed int PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
      if (PixelFormatType > 1111970368)
      {
        if (PixelFormatType == 1111970369)
        {
          int v27 = 1;
          goto LABEL_21;
        }
        if (PixelFormatType == 1380410945)
        {
          int v27 = 2;
          goto LABEL_21;
        }
      }
      else
      {
        if (PixelFormatType == 875704422)
        {
          int v27 = 4;
          goto LABEL_21;
        }
        if (PixelFormatType == 875704438)
        {
          int v27 = 3;
LABEL_21:
          MTLPixelFormat v61 = *(void *)&asc_1B6E723D8[24 * v27 + 16];
          CVMetalTextureRef image = 0;
          uint64_t v62 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_textureCache, self->_pixelBuffer, 0, v61, self->_width, self->_height, 0, &image);
          if (v62)
          {
            sub_1B63F2F54(16, @"Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d", v63, v64, v65, v66, v67, v68, v62);
          }
          else
          {
            Texture = (MTLTexture *)CVMetalTextureGetTexture(image);
            self->_mtlTexture = Texture;
            v70 = Texture;
            v74 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, v71, v72, v73);
            if (v74) {
              IOSurfaceIncrementUseCount(v74);
            }
            CFRelease(image);
          }
          $96EE1C12479E9B303E9C2794B92A11A2 v16 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
          goto LABEL_3;
        }
      }
      OSType v75 = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
      LOBYTE(image) = HIBYTE(v75);
      BYTE1(image) = BYTE2(v75);
      BYTE2(image) = BYTE1(v75);
      *(_WORD *)((char *)&image + 3) = v75;
      sub_1B63F2F54(16, @"Error: Invalid pixel buffer pixel format: %s", v76, v77, v78, v79, v80, v81, (uint64_t)&image);
    }
    else
    {
      sub_1B63F2F54(16, @"Error: Could not get pixel buffer (CVPixelBufferRef)", v10, v11, v12, v13, v14, v15, (uint64_t)textureOut);
    }
LABEL_28:
    mtlTexture = 0;
    goto LABEL_29;
  }
  $96EE1C12479E9B303E9C2794B92A11A2 v16 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
LABEL_3:
  *a6 = v16;
  mtlTexture = self->_mtlTexture;
LABEL_29:
  objc_sync_exit(self);
  return mtlTexture;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  objc_sync_enter(self);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    objc_msgSend_discardVideoData(self, v7, v8, v9);
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
  }
  else
  {
    sub_1B63F2F54(16, @"Error: Could not get pixel buffer (CVPixelBufferRef)", v8, v9, v10, v11, v12, v13, v16);
  }

  objc_sync_exit(self);
}

@end