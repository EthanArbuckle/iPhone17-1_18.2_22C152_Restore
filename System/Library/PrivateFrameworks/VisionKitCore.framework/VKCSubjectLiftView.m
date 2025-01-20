@interface VKCSubjectLiftView
- (BOOL)shadowsVisible;
- (CALayer)diffuseShadowLayer;
- (CALayer)rimShadowLayer;
- (void)setDiffuseShadowLayer:(id)a3;
- (void)setRimShadowLayer:(id)a3;
- (void)setShadowsVisible:(BOOL)a3;
@end

@implementation VKCSubjectLiftView

- (void)setShadowsVisible:(BOOL)a3
{
  if (self->_shadowsVisible != a3)
  {
    self->_shadowsVisible = a3;
    if (a3) {
      float v4 = 0.2;
    }
    else {
      float v4 = 0.0;
    }
    v5 = [(VKCSubjectLiftView *)self diffuseShadowLayer];
    *(float *)&double v6 = v4;
    [v5 setShadowOpacity:v6];

    if (self->_shadowsVisible) {
      float v7 = 0.1;
    }
    else {
      float v7 = 0.0;
    }
    id v9 = [(VKCSubjectLiftView *)self rimShadowLayer];
    *(float *)&double v8 = v7;
    [v9 setShadowOpacity:v8];
  }
}

- (CALayer)diffuseShadowLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diffuseShadowLayer);
  return (CALayer *)WeakRetained;
}

- (void)setDiffuseShadowLayer:(id)a3
{
}

- (CALayer)rimShadowLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rimShadowLayer);
  return (CALayer *)WeakRetained;
}

- (void)setRimShadowLayer:(id)a3
{
}

- (BOOL)shadowsVisible
{
  return self->_shadowsVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rimShadowLayer);
  objc_destroyWeak((id *)&self->_diffuseShadowLayer);
}

@end