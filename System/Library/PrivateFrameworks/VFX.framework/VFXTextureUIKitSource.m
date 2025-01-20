@interface VFXTextureUIKitSource
- (BOOL)isOpaque;
- (BOOL)requiresMainThreadUpdates;
- (BOOL)shouldFlip;
- (BOOL)supportsMetal;
- (CALayer)uiWindowLayer;
- (CGSize)layerSizeInPixels;
- (UIView)uiView;
- (UIWindow)uiWindow;
- (double)layerContentsScaleFactor;
- (float)clearValue;
- (id)layer;
- (id)layerToFocusForRenderedLayer:(id)a3;
- (id)source;
- (void)_layerTreeDidUpdate;
- (void)dealloc;
- (void)setIsOpaque:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setUiView:(id)a3;
- (void)setUiWindow:(id)a3;
- (void)setUiWindowLayer:(id)a3;
- (void)setup;
@end

@implementation VFXTextureUIKitSource

- (BOOL)supportsMetal
{
  return 1;
}

- (BOOL)shouldFlip
{
  return 0;
}

- (BOOL)requiresMainThreadUpdates
{
  return 1;
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  uiWindow = self->_uiWindow;
  uiView = self->_uiView;
  self->_uiWindow = 0;
  self->_uiView = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B64DFED0;
  block[3] = &unk_1E6143238;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x1E4F14428], block);

  v10.receiver = self;
  v10.super_class = (Class)VFXTextureUIKitSource;
  [(VFXTextureCoreAnimationSource *)&v10 dealloc];
}

- (void)setup
{
  uint64_t v5 = objc_msgSend_superlayer(self->_uiWindowLayer, a2, v2, v3);
  v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);

  objc_msgSend_addObserver_selector_name_object_(v9, v10, (uint64_t)self, (uint64_t)sel__layerTreeDidUpdate, @"VFXLayerTreeDidChange", v5);
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return self->_uiWindowLayer;
}

- (float)clearValue
{
  LOBYTE(v2) = self->_isOpaque;
  return (float)v2;
}

- (id)layer
{
  return (id)objc_msgSend_superlayer(self->_uiWindowLayer, a2, v2, v3);
}

- (double)layerContentsScaleFactor
{
  v4 = objc_msgSend_mainScreen(MEMORY[0x1E4FB1BA8], a2, v2, v3);

  objc_msgSend_scale(v4, v5, v6, v7);
  return result;
}

- (CGSize)layerSizeInPixels
{
  objc_msgSend_bounds(self->_uiWindowLayer, a2, v2, v3);
  double v6 = v5;
  double v8 = v7;
  objc_msgSend_layerContentsScaleFactor(self, v9, v10, v11);
  if (v12 == 0.0) {
    double v12 = 1.0;
  }
  double v13 = v8 * v12;
  double v14 = v6 * v12;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_layerTreeDidUpdate
{
  double v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  id source = self->_source;

  objc_msgSend_postNotificationName_object_(v5, v6, @"VFXUITreeDidChange", (uint64_t)source);
}

- (UIWindow)uiWindow
{
  return self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
}

- (CALayer)uiWindowLayer
{
  return self->_uiWindowLayer;
}

- (void)setUiWindowLayer:(id)a3
{
}

- (UIView)uiView
{
  return self->_uiView;
}

- (void)setUiView:(id)a3
{
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

@end