@interface VFXRenderToTextureFinalAttachmentProvider
- (VFXDrawableDescriptor)drawableDescriptor;
- (VFXRenderToTextureFinalAttachmentProvider)initWithTexture:(id)a3;
- (id)textureForAttachment:(id)a3 withDescriptor:(id)a4;
- (void)dealloc;
@end

@implementation VFXRenderToTextureFinalAttachmentProvider

- (VFXRenderToTextureFinalAttachmentProvider)initWithTexture:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)VFXRenderToTextureFinalAttachmentProvider;
  v4 = [(VFXRenderToTextureFinalAttachmentProvider *)&v25 init];
  if (v4)
  {
    v5 = (CFX::RG::ResourceIdentifier *)a3;
    v4->_texture = v5;
    v4->_finalAttachementIdentifier = RGResourceIdentifierFinalColor(v5);
    v4->_drawableDescriptor = objc_alloc_init(VFXDrawableDescriptor);
    uint64_t v9 = objc_msgSend_width(v4->_texture, v6, v7, v8);
    objc_msgSend_setWidth_(v4->_drawableDescriptor, v10, v9, v11);
    uint64_t v15 = objc_msgSend_height(v4->_texture, v12, v13, v14);
    objc_msgSend_setHeight_(v4->_drawableDescriptor, v16, v15, v17);
    uint64_t v21 = objc_msgSend_pixelFormat(v4->_texture, v18, v19, v20);
    objc_msgSend_setPixelFormat_(v4->_drawableDescriptor, v22, v21, v23);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXRenderToTextureFinalAttachmentProvider;
  [(VFXRenderToTextureFinalAttachmentProvider *)&v3 dealloc];
}

- (VFXDrawableDescriptor)drawableDescriptor
{
  return self->_drawableDescriptor;
}

- (id)textureForAttachment:(id)a3 withDescriptor:(id)a4
{
  unint64_t finalAttachementIdentifier = self->_finalAttachementIdentifier;
  uint64_t v6 = RGResourceIdentifierMake((NSString *)a3);
  if (RGResourceIdentifierMatch(finalAttachementIdentifier, v6)) {
    return self->_texture;
  }
  else {
    return 0;
  }
}

@end