@interface VFXAVPlayerSource
- (AVPlayer)player;
- (VFXAVPlayerSource)init;
- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)connectToProxy:(__CFXImageProxy *)a3;
- (void)dealloc;
- (void)discardVideoData;
- (void)registerPlayer:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setVideoSourceFormat:(unsigned __int8)a3;
- (void)unregisterPlayer:(id)a3;
@end

@implementation VFXAVPlayerSource

- (VFXAVPlayerSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAVPlayerSource;
  result = [(VFXAVPlayerSource *)&v3 init];
  if (result) {
    result->_videoSourceFormat = 0;
  }
  return result;
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

- (void)setVideoSourceFormat:(unsigned __int8)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (self->_videoSourceFormat != a3)
  {
    v5 = &asc_1B6E723D8[24 * a3];
    uint64_t v6 = *(unsigned int *)v5;
    self->_texturePixelFormat = *((void *)v5 + 2);
    v14[0] = MEMORY[0x1E4F1CC38];
    uint64_t v7 = *MEMORY[0x1E4F24D70];
    v13[0] = *MEMORY[0x1E4F24D40];
    v13[1] = v7;
    v14[1] = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, v6, v3);
    uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v14, (uint64_t)v13, 2);

    id v10 = objc_alloc(MEMORY[0x1E4F16648]);
    self->_videoOutput = (AVPlayerItemVideoOutput *)objc_msgSend_initWithPixelBufferAttributes_(v10, v11, v9, v12);
  }
}

- (void)registerPlayer:(id)a3
{
  uint64_t v6 = objc_msgSend_currentItem(a3, a2, (uint64_t)a3, v3);
  id v10 = objc_msgSend_asset(v6, v7, v8, v9);
  v13 = objc_msgSend_tracksWithMediaCharacteristic_(v10, v11, *MEMORY[0x1E4F15B10], v12);
  if (objc_msgSend_count(v13, v14, v15, v16)) {
    objc_msgSend_setVideoSourceFormat_(self, v17, 1, v18);
  }
  else {
    objc_msgSend_setVideoSourceFormat_(self, v17, 4, v18);
  }
  v22 = objc_msgSend_currentItem(a3, v19, v20, v21);
  videoOutput = self->_videoOutput;

  objc_msgSend_addOutput_(v22, v23, (uint64_t)videoOutput, v24);
}

- (void)unregisterPlayer:(id)a3
{
  uint64_t v5 = objc_msgSend_currentItem(a3, a2, (uint64_t)a3, v3);
  videoOutput = self->_videoOutput;

  MEMORY[0x1F4181798](v5, sel_removeOutput_, videoOutput, v6);
}

- (void)dealloc
{
  objc_msgSend_unregisterPlayer_(self, a2, (uint64_t)self->_player, v2);

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  objc_msgSend_discardVideoData(self, v4, v5, v6);
  v8.receiver = self;
  v8.super_class = (Class)VFXAVPlayerSource;
  [(VFXTextureSource *)&v8 dealloc];
}

- (void)setPlayer:(id)a3
{
  player = self->_player;
  if (player != a3)
  {
    objc_msgSend_unregisterPlayer_(self, a2, (uint64_t)player, v3);

    uint64_t v7 = (AVPlayer *)a3;
    self->_player = v7;
    MEMORY[0x1F4181798](self, sel_registerPlayer_, v7, v8);
  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  sub_1B6451C58((uint64_t)a3, self, 1, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1F0FBACC0;
  v15[1] = *(_OWORD *)&off_1F0FBACD0;
  sub_1B6451CE4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  v56[1] = *MEMORY[0x1E4F143B8];
  long long v53 = 0uLL;
  uint64_t v54 = 0;
  videoOutput = self->_videoOutput;
  double v13 = sub_1B6447718((uint64_t)a3);
  if (videoOutput)
  {
    objc_msgSend_itemTimeForHostTime_(videoOutput, v10, v11, v12, v13);
  }
  else
  {
    long long v53 = 0uLL;
    uint64_t v54 = 0;
  }
  uint64_t v14 = self->_videoOutput;
  *(_OWORD *)image = v53;
  uint64_t v52 = v54;
  if (objc_msgSend_hasNewPixelBufferForItemTime_(v14, v10, (uint64_t)image, v12))
  {
    uint64_t v21 = self->_videoOutput;
    *(_OWORD *)image = v53;
    uint64_t v52 = v54;
    uint64_t v22 = objc_msgSend_copyPixelBufferForItemTime_itemTimeForDisplay_(v21, v15, (uint64_t)image, 0);
    if (v22)
    {
      v25 = (__CVBuffer *)v22;
      objc_msgSend_discardVideoData(self, v23, v24, v16);
      self->_pixelBuffer = v25;
      self->_width = CVPixelBufferGetWidth(v25);
      self->_height = CVPixelBufferGetHeight(self->_pixelBuffer);
    }
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    if (self->_mtlTexture)
    {
      $96EE1C12479E9B303E9C2794B92A11A2 v27 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
    }
    else
    {
      textureCache = self->_textureCache;
      if (!textureCache)
      {
        v30 = (void *)sub_1B6445900((uint64_t)a3, 0, (uint64_t)pixelBuffer, v16, v17, v18, v19, v20);
        v34 = objc_msgSend_device(v30, v31, v32, v33);
        uint64_t v55 = *MEMORY[0x1E4F24C88];
        v56[0] = &unk_1F103BB58;
        CFDictionaryRef v36 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v56, (uint64_t)&v55, 1);
        CVMetalTextureCacheCreate(0, 0, v34, v36, &self->_textureCache);
        textureCache = self->_textureCache;
        pixelBuffer = self->_pixelBuffer;
      }
      image[0] = 0;
      uint64_t TextureFromImage = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], textureCache, pixelBuffer, 0, (MTLPixelFormat)self->_texturePixelFormat, self->_width, self->_height, 0, image);
      if (TextureFromImage)
      {
        sub_1B63F2F54(16, @"Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d", v38, v39, v40, v41, v42, v43, TextureFromImage);
      }
      else
      {
        Texture = (MTLTexture *)CVMetalTextureGetTexture(image[0]);
        self->_mtlTexture = Texture;
        v45 = Texture;
        v49 = (__IOSurface *)objc_msgSend_iosurface(self->_mtlTexture, v46, v47, v48);
        if (v49) {
          IOSurfaceIncrementUseCount(v49);
        }
        CFRelease(image[0]);
      }
      $96EE1C12479E9B303E9C2794B92A11A2 v27 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
    }
    *a6 = v27;
    return self->_mtlTexture;
  }
  else
  {
    sub_1B63F2F54(16, @"Error: Could not get pixel buffer (CVPixelBufferRef)", 0, v16, v17, v18, v19, v20, (uint64_t)textureOut);
    return 0;
  }
}

@end