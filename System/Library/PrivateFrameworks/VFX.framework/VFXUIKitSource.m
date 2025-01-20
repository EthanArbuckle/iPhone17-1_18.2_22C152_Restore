@interface VFXUIKitSource
- (BOOL)isOpaque;
- (BOOL)supportsMetal;
- (UIView)uiView;
- (UIWindow)uiWindow;
- (VFXUIKitSource)init;
- (id)prepareWindowIfNeeded;
- (id)textureSource;
- (void)dealloc;
- (void)setUiView:(id)a3;
- (void)setUiWindow:(id)a3;
@end

@implementation VFXUIKitSource

- (VFXUIKitSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXUIKitSource;
  return [(VFXUIKitSource *)&v3 init];
}

- (BOOL)supportsMetal
{
  return 1;
}

- (id)prepareWindowIfNeeded
{
  if (!self->_uiWindow && !self->_windowPreparing)
  {
    self->_windowPreparing = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v5 = sub_1B64DFA70;
    v6 = &unk_1E61422C0;
    v7 = self;
    if (pthread_main_np() == 1) {
      ((void (*)(void *))v5)(block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  return self->_uiWindow;
}

- (id)textureSource
{
  if (!objc_msgSend_prepareWindowIfNeeded(self, a2, v2, v3)) {
    return 0;
  }
  v5 = objc_alloc_init(VFXTextureUIKitSource);
  uint64_t v9 = objc_msgSend_uiView(self, v6, v7, v8);
  objc_msgSend_setUiView_(v5, v10, v9, v11);
  uint64_t v15 = objc_msgSend_uiWindow(self, v12, v13, v14);
  objc_msgSend_setUiWindow_(v5, v16, v15, v17);
  objc_msgSend_setUiWindowLayer_(v5, v18, (uint64_t)self->_uiWindowLayer, v19);
  objc_msgSend_setIsOpaque_(v5, v20, self->_isOpaque, v21);
  objc_msgSend_setSource_(v5, v22, (uint64_t)self, v23);
  objc_msgSend_setup(v5, v24, v25, v26);
  objc_msgSend_registerUIKitSource_(_VFXUIKitSourceRegistry, v27, (uint64_t)v5, v28);
  return v5;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)dealloc
{
  id uiWindow = self->_uiWindow;
  id uiView = self->_uiView;
  self->_id uiWindow = 0;
  self->_id uiView = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = sub_1B64DFD54;
  block[3] = &unk_1E6143238;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v5.receiver = self;
  v5.super_class = (Class)VFXUIKitSource;
  [(VFXUIKitSource *)&v5 dealloc];
}

- (UIView)uiView
{
  return (UIView *)self->_uiView;
}

- (void)setUiView:(id)a3
{
}

- (UIWindow)uiWindow
{
  return (UIWindow *)self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
}

@end