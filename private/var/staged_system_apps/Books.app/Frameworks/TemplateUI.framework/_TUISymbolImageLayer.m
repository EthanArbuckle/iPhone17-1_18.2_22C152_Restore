@interface _TUISymbolImageLayer
- (CAFilter)contentCompositingFilter;
- (void)_updateBackdropLayer;
- (void)setContentCompositingFilter:(id)a3;
- (void)updateContentAndBoundsWithImage:(id)a3 color:(id)a4;
@end

@implementation _TUISymbolImageLayer

- (void)updateContentAndBoundsWithImage:(id)a3 color:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (!self->_contentLayer)
  {
    v7 = +[_TUIImplicitAnimationLayer layer];
    contentLayer = self->_contentLayer;
    self->_contentLayer = v7;

    [(_TUISymbolImageLayer *)self addSublayer:self->_contentLayer];
  }
  if (v22)
  {
    [v22 contentInsets];
    [v22 alignmentInsets];
    [(_TUISymbolImageLayer *)self bounds];
    UIRectInset();
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(_TUISymbolImageLayer *)self contentsScale];
    -[CALayer setContentsScale:](self->_contentLayer, "setContentsScale:");
    -[CALayer setFrame:](self->_contentLayer, "setFrame:", v10, v12, v14, v16);
    if (v6 && ![v22 isMulticolor]) {
      v17 = (id *)&kCALayerContentsSwizzleAAAA;
    }
    else {
      v17 = (id *)&kCALayerContentsSwizzleRGBA;
    }
    id v18 = *v17;
    if (v18 != (id)kCALayerContentsSwizzleRGBA
      || ([(CALayer *)self->_contentLayer contentsSwizzle],
          id v20 = (id)objc_claimAutoreleasedReturnValue(),
          v20,
          v20 == v18))
    {
      int v19 = 0;
    }
    else
    {
      +[CATransaction begin];
      int v19 = 1;
      +[CATransaction setDisableActions:1];
    }
    -[CALayer setContents:](self->_contentLayer, "setContents:", [v22 CGImage]);
    [(CALayer *)self->_contentLayer setContentsSwizzle:v18];
    if (v18 == (id)kCALayerContentsSwizzleAAAA) {
      id v21 = [v6 CGColor];
    }
    else {
      id v21 = 0;
    }
    [(CALayer *)self->_contentLayer setContentsMultiplyColor:v21];
    if (v19) {
      +[CATransaction commit];
    }
  }
  [(_TUISymbolImageLayer *)self _updateBackdropLayer];
}

- (void)setContentCompositingFilter:(id)a3
{
  id v6 = a3;
  id v4 = [(CALayer *)self->_contentLayer compositingFilter];

  v5 = v6;
  if (v4 != v6)
  {
    [(CALayer *)self->_contentLayer setCompositingFilter:v6];
    [(_TUISymbolImageLayer *)self _updateBackdropLayer];
    v5 = v6;
  }
}

- (CAFilter)contentCompositingFilter
{
  return (CAFilter *)[(CALayer *)self->_contentLayer compositingFilter];
}

- (void)_updateBackdropLayer
{
  id v9 = [(CALayer *)self->_contentLayer compositingFilter];
  unsigned int v3 = TUILayerCompositingFilterNeedsBackdropLayer(v9);
  if (v9) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1;
  }
  [(_TUISymbolImageLayer *)self setAllowsGroupBlending:v4];
  backdropLayer = self->_backdropLayer;
  if (v3)
  {
    if (!backdropLayer)
    {
      id v6 = +[CABackdropLayer layer];
      v7 = self->_backdropLayer;
      self->_backdropLayer = v6;

      [(_TUISymbolImageLayer *)self insertSublayer:self->_backdropLayer below:self->_contentLayer];
    }
  }
  else if (backdropLayer)
  {
    [(CABackdropLayer *)backdropLayer removeFromSuperlayer];
    v8 = self->_backdropLayer;
    self->_backdropLayer = 0;
  }
  [(CALayer *)self->_contentLayer frame];
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);

  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end