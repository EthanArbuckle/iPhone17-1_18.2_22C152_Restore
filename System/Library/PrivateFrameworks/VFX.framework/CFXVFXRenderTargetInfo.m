@interface CFXVFXRenderTargetInfo
- (BOOL)vrrEnabled;
- (CFXVFXRenderTargetInfo)init;
- (MTLRenderPassDescriptor)descriptor;
- (__n128)_renderTargetSize;
- (int64_t)sampleCount;
- (uint64_t)renderTargetSize;
- (unint64_t)colorPixelFormatAtIndex:(int64_t)a3;
- (unint64_t)depthStencilPixelFormat;
- (void)setDescriptor:(id)a3;
- (void)set_renderTargetSize:(CFXVFXRenderTargetInfo *)self;
@end

@implementation CFXVFXRenderTargetInfo

- (CFXVFXRenderTargetInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CFXVFXRenderTargetInfo;
  return [(CFXVFXRenderTargetInfo *)&v3 init];
}

- (BOOL)vrrEnabled
{
  return 0;
}

- (int64_t)sampleCount
{
  v5 = objc_msgSend_descriptor(self, a2, v2, v3);
  v9 = objc_msgSend_colorAttachments(v5, v6, v7, v8);
  v12 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11);
  uint64_t v16 = objc_msgSend_texture(v12, v13, v14, v15);
  v20 = objc_msgSend_descriptor(self, v17, v18, v19);
  if (v16)
  {
    v24 = objc_msgSend_colorAttachments(v20, v21, v22, v23);
    v27 = objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26);
  }
  else
  {
    v27 = objc_msgSend_depthAttachment(v20, v21, v22, v23);
  }
  v31 = objc_msgSend_texture(v27, v28, v29, v30);

  return objc_msgSend_sampleCount(v31, v32, v33, v34);
}

- (unint64_t)depthStencilPixelFormat
{
  v4 = objc_msgSend_descriptor(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_depthAttachment(v4, v5, v6, v7);
  v12 = objc_msgSend_texture(v8, v9, v10, v11);

  return objc_msgSend_pixelFormat(v12, v13, v14, v15);
}

- (unint64_t)colorPixelFormatAtIndex:(int64_t)a3
{
  v5 = objc_msgSend_descriptor(self, a2, a3, v3);
  v9 = objc_msgSend_colorAttachments(v5, v6, v7, v8);
  v12 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, a3, v11);
  uint64_t v16 = objc_msgSend_texture(v12, v13, v14, v15);

  return objc_msgSend_pixelFormat(v16, v17, v18, v19);
}

- (uint64_t)renderTargetSize
{
  return MEMORY[0x1F4181798](a1, sel__renderTargetSize, a3, a4);
}

- (MTLRenderPassDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  self->_descriptor = (MTLRenderPassDescriptor *)a3;
}

- (__n128)_renderTargetSize
{
  return a1[1];
}

- (void)set_renderTargetSize:(CFXVFXRenderTargetInfo *)self
{
  *(_OWORD *)self->__renderTargetSize = v2;
}

@end