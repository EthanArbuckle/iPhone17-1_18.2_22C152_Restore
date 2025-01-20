@interface VFXTextureSource
- (BOOL)shouldFlip;
- (BOOL)supportsMetal;
- (double)nextFrameTime;
- (double)textureSize;
- (id)MTLTextureCache;
- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)dealloc;
- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5;
- (void)setMTLTextureCache:(id)a3;
- (void)setSize:(VFXTextureSource *)self;
@end

@implementation VFXTextureSource

- (void)setSize:(VFXTextureSource *)self
{
  *(void *)self->_size = v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXTextureSource;
  [(VFXTextureSource *)&v3 dealloc];
}

- (BOOL)shouldFlip
{
  return 1;
}

- (BOOL)supportsMetal
{
  return 1;
}

- (double)textureSize
{
  uint64_t v2 = NSStringFromSelector(aSelector);
  sub_1B63F2F54(16, @"Error: VFXTextureSource abstract method invoked %@", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  __asm { FMOV            V0.2S, #1.0 }
  return result;
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  if (!sub_1B6445900((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v11, v12, v13, v14, v15, v16, (uint64_t)"CFXEngineContextGetRenderContext(engineContext)");
  }
  if (objc_msgSend_supportsMetal(self, v10, v11, v12))
  {
    id result = (id)objc_msgSend_MTLTextureCache(self, v17, v18, v19);
    if (!result)
    {
      v32 = (void *)sub_1B6445900((uint64_t)a3, v25, v26, v27, v28, v29, v30, v31);
      v36 = objc_msgSend_device(v32, v33, v34, v35);
      objc_msgSend_textureSize(self, v37, v38, v39);
      v43 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v42, 71, (unint64_t)v40, (unint64_t)v41, 0);
      objc_msgSend_setStorageMode_(v43, v44, 2, v45);
      objc_msgSend_setUsage_(v43, v46, 1, v47);
      v49 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v36, v48, (uint64_t)v43, 0, 0);
      objc_msgSend_setMTLTextureCache_(self, v50, (uint64_t)v49, v51);
      return v49;
    }
  }
  else
  {
    sub_1B63F2F54(16, @"Error: Texture source does not support Metal", v18, v19, v20, v21, v22, v23, v52);
    return 0;
  }
  return result;
}

- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t v5 = NSStringFromSelector(a2);
  sub_1B63F2F54(16, @"Error: VFXTextureSource abstract method invoked %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (double)nextFrameTime
{
  return INFINITY;
}

- (id)MTLTextureCache
{
  return self->_mtlTextureCache;
}

- (void)setMTLTextureCache:(id)a3
{
  id mtlTextureCache = self->_mtlTextureCache;
  if (mtlTextureCache != a3)
  {

    self->_id mtlTextureCache = a3;
  }
}

@end