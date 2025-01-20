@interface VFXCoreAnimationSource
- (BOOL)isOpaque;
- (CALayer)layer;
- (id)textureSource;
- (void)dealloc;
- (void)setLayer:(id)a3;
@end

@implementation VFXCoreAnimationSource

- (id)textureSource
{
  v3 = objc_alloc_init(VFXTextureCoreAnimationSource);
  uint64_t v7 = objc_msgSend_layer(self, v4, v5, v6);
  objc_msgSend_setLayer_(v3, v8, v7, v9);
  return v3;
}

- (BOOL)isOpaque
{
  v4 = objc_msgSend_layer(self, a2, v2, v3);

  return objc_msgSend_isOpaque(v4, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXCoreAnimationSource;
  [(VFXCoreAnimationSource *)&v3 dealloc];
}

- (void)setLayer:(id)a3
{
  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (CALayer)layer
{
  return self->_layer;
}

@end