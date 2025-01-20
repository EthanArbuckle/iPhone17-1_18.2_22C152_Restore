@interface VFXMaterialPropertyTextureProviderSource
- (VFXMaterialPropertyTextureProvider)textureProvider;
- (id)cachedTextureWithURL:(id)a3 token:(id *)a4;
- (id)cachedTextureWithURL:(id)a3 token:(id *)a4 didFallbackToDefaultTexture:(BOOL *)a5;
- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)connectToProxy:(__CFXImageProxy *)a3;
- (void)dealloc;
- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5;
- (void)setTextureProvider:(id)a3;
@end

@implementation VFXMaterialPropertyTextureProviderSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMaterialPropertyTextureProviderSource;
  [(VFXTextureSource *)&v3 dealloc];
}

- (void)setTextureProvider:(id)a3
{
  if (self->_textureProvider != a3)
  {

    self->_texture = 0;
    self->_textureProvider = (VFXMaterialPropertyTextureProvider *)a3;
  }
}

- (VFXMaterialPropertyTextureProvider)textureProvider
{
  return self->_textureProvider;
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  sub_1B6451C58((uint64_t)a3, self, 0, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1F0FBAD30;
  v15[1] = *(_OWORD *)&off_1F0FBAD40;
  sub_1B6451CE4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

- (id)metalTextureWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  self->_engineContext = a3;
  uint64_t v10 = (void *)sub_1B6445900((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7);
  uint64_t v14 = (uint64_t)v10;
  if (self->_texture)
  {
    BOOL v15 = 0;
  }
  else
  {
    textureProvider = self->_textureProvider;
    uint64_t v17 = objc_msgSend_device(v10, v11, v12, v13);
    self->_texture = (MTLTexture *)objc_msgSend_newTextureForDevice_(textureProvider, v18, v17, v19);
    BOOL v15 = 1;
  }
  a6->var0 = v15;
  a6->var1 = 1;
  sub_1B6624044(self->_textureProvider, (const char *)self->_texture, (uint64_t)self, v14);
  return self->_texture;
}

- (void)renderWithEngineContext:(__CFXEngineContext *)a3 textureSampler:(__CFXTextureSampler *)a4 nextFrameTime:(double *)a5
{
  self->_engineContext = a3;
  uint64_t v9 = sub_1B6445900((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  textureProvider = self->_textureProvider;
  texture = self->_texture;

  sub_1B6624044(textureProvider, (const char *)texture, (uint64_t)self, v9);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_cachedTextureWithURL_token_didFallbackToDefaultTexture_, a3, a4);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4 didFallbackToDefaultTexture:(BOOL *)a5
{
  uint64_t v12 = sub_1B643C53C(a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  if (v12)
  {
    uint64_t v13 = v12;
    if (a4)
    {
      uint64_t v14 = 0;
LABEL_5:
      *a4 = v14;
    }
  }
  else
  {
    uint64_t v14 = (void *)sub_1B643A054(a3);
    sub_1B643C59C(v14, a3, v15, v16, v17, v18, v19, v20);
    uint64_t v13 = v14;
    if (a4) {
      goto LABEL_5;
    }
  }
  CFAutorelease(v13);
  BOOL v46 = 0;
  v28 = (void *)sub_1B6445900((uint64_t)self->_engineContext, v21, v22, v23, v24, v25, v26, v27);
  v32 = objc_msgSend_resourceManager(v28, v29, v30, v31);
  uint64_t v33 = sub_1B643DF24();
  v38 = objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(v32, v34, (uint64_t)v13, v33, 0, self->_engineContext, &v46);
  if (v46)
  {
    uint64_t v39 = objc_msgSend_resourceManagerMonitor(v28, v35, v36, v37);
    if (v39)
    {
      v42 = (void *)v39;
      uint64_t v43 = objc_msgSend_stringWithFormat_(NSString, v40, @"VFXMaterialPropertyTextureProviderHelper could not find texture for %@", v41, a3);
      objc_msgSend_renderContext_didFallbackToDefaultTextureForSource_message_(v42, v44, (uint64_t)v28, (uint64_t)a3, v43);
    }
  }
  if (a5) {
    *a5 = v46;
  }
  return v38;
}

@end