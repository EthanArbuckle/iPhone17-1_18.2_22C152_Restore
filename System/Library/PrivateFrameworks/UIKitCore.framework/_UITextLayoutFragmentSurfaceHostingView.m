@interface _UITextLayoutFragmentSurfaceHostingView
- (CGPoint)_activeContainerOrigin;
- (CGRect)_activeClipRect;
- (CGRect)_activeLayoutFragmentFrame;
- (NSCustomTextSurface)surface;
- (void)_updateGeometry;
- (void)setNeedsDisplay;
- (void)teardown;
- (void)updateWithSurface:(id)a3;
@end

@implementation _UITextLayoutFragmentSurfaceHostingView

- (void)_updateGeometry
{
  if (self->_surface)
  {
    v18.receiver = self;
    v18.super_class = (Class)_UITextLayoutFragmentSurfaceHostingView;
    [(_UITextLayoutFragmentViewBase *)&v18 _updateGeometry];
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(NSCustomTextSurface *)self->_surface layer];
    objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);

    v12 = [(NSCustomTextSurface *)self->_surface layer];
    objc_msgSend(v12, "setAnchorPoint:", 0.0, 0.0);

    [(UIView *)self bounds];
    double v14 = v13;
    double v16 = v15;
    v17 = [(NSCustomTextSurface *)self->_surface layer];
    objc_msgSend(v17, "setPosition:", v14, v16);
  }
}

- (CGRect)_activeLayoutFragmentFrame
{
  double v3 = [(_UITextLayoutFragmentViewBase *)self layoutFragment];
  [v3 layoutFragmentFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  surface = self->_surface;
  if (surface)
  {
    -[NSCustomTextSurface adjustedLayoutFragmentFrame:](surface, "adjustedLayoutFragmentFrame:", v5, v7, v9, v11);
    double v5 = v13;
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGPoint)_activeContainerOrigin
{
  [(_UITextLayoutFragmentViewBase *)self containerOrigin];
  surface = self->_surface;
  if (surface)
  {
    -[NSCustomTextSurface adjustedContainerOrigin:](surface, "adjustedContainerOrigin:");
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)_activeClipRect
{
  [(_UITextLayoutFragmentViewBase *)self clipRect];
  surface = self->_surface;
  if (surface) {
    -[NSCustomTextSurface adjustedClipRect:](surface, "adjustedClipRect:");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)updateWithSurface:(id)a3
{
  double v5 = (NSCustomTextSurface *)a3;
  double v16 = v5;
  if (self->_surface != v5)
  {
    p_hostedLayer = &self->_hostedLayer;
    double v7 = [(CALayer *)self->_hostedLayer superlayer];
    double v8 = [(UIView *)self layer];

    if (v7 == v8) {
      [(CALayer *)*p_hostedLayer removeFromSuperlayer];
    }
    objc_storeStrong((id *)&self->_surface, a3);
LABEL_5:
    uint64_t v9 = [(NSCustomTextSurface *)self->_surface layer];
    double v10 = *p_hostedLayer;
    *p_hostedLayer = (CALayer *)v9;

    double v11 = [(UIView *)self layer];
    [v11 addSublayer:*p_hostedLayer];

    goto LABEL_6;
  }
  v12 = [(NSCustomTextSurface *)v5 layer];
  p_hostedLayer = &self->_hostedLayer;
  hostedLayer = self->_hostedLayer;

  if (v12 != hostedLayer)
  {
    double v14 = [(CALayer *)*p_hostedLayer superlayer];
    double v15 = [(UIView *)self layer];

    if (v14 == v15) {
      [(CALayer *)*p_hostedLayer removeFromSuperlayer];
    }
    goto LABEL_5;
  }
LABEL_6:
}

- (void)teardown
{
  double v3 = [(CALayer *)self->_hostedLayer superlayer];
  double v4 = [(UIView *)self layer];

  if (v3 == v4) {
    [(CALayer *)self->_hostedLayer removeFromSuperlayer];
  }
  hostedLayer = self->_hostedLayer;
  self->_hostedLayer = 0;

  surface = self->_surface;
  self->_surface = 0;

  v7.receiver = self;
  v7.super_class = (Class)_UITextLayoutFragmentSurfaceHostingView;
  [(_UITextLayoutFragmentViewBase *)&v7 teardown];
}

- (void)setNeedsDisplay
{
}

- (NSCustomTextSurface)surface
{
  return self->_surface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);
  objc_storeStrong((id *)&self->_hostedLayer, 0);
}

@end