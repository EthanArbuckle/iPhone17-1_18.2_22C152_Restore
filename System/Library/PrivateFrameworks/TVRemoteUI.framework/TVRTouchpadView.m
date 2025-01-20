@interface TVRTouchpadView
- (BOOL)isHighlighted;
- (TVRButtonHaptic)haptic;
- (TVRTouchProcessor)touchProcessor;
- (UIEdgeInsets)contentInsets;
- (id)_init;
- (id)configurationHandler;
- (void)_notifyConfigurationHandler:(BOOL)a3;
- (void)setConfigurationHandler:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setHaptic:(id)a3;
- (void)setTouchProcessor:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TVRTouchpadView

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)TVRTouchpadView;
  id result = -[TVRTouchpadView initWithFrame:](&v3, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (result) {
    *((unsigned char *)result + 408) = 0;
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRTouchpadView *)self _notifyConfigurationHandler:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  [WeakRetained touchesBegan:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  p_touchProcessor = &self->_touchProcessor;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_touchProcessor);
  [WeakRetained touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRTouchpadView *)self _notifyConfigurationHandler:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  [WeakRetained touchesEnded:v7 withEvent:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRTouchpadView *)self _notifyConfigurationHandler:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  [WeakRetained touchesCancelled:v7 withEvent:v6];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(TVRTouchpadView *)self setNeedsLayout];
  }
}

- (void)_notifyConfigurationHandler:(BOOL)a3
{
  self->_highlighted = a3;
  configurationHandler = (void (**)(id, BOOL))self->_configurationHandler;
  if (configurationHandler) {
    configurationHandler[2](configurationHandler, a3);
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (id)configurationHandler
{
  return self->_configurationHandler;
}

- (void)setConfigurationHandler:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (TVRTouchProcessor)touchProcessor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  return (TVRTouchProcessor *)WeakRetained;
}

- (void)setTouchProcessor:(id)a3
{
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_destroyWeak((id *)&self->_touchProcessor);
  objc_storeStrong(&self->_configurationHandler, 0);
}

@end