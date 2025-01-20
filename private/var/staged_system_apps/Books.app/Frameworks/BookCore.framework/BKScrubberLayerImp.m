@interface BKScrubberLayerImp
- (BKScrubberLayerImp)initWithLayer:(id)a3 orientation:(int)a4;
- (BOOL)_isExpanded;
- (BOOL)isKnob;
- (CALayer)layer;
- (UITraitCollection)traitCollection;
- (int)orientation;
- (int64_t)themeInterfaceStyle;
- (void)displayLayer:(id)a3;
- (void)setIsKnob:(BOOL)a3;
- (void)setLayer:(id)a3;
- (void)setOrientation:(int)a3;
- (void)setThemeInterfaceStyle:(int64_t)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation BKScrubberLayerImp

- (BKScrubberLayerImp)initWithLayer:(id)a3 orientation:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKScrubberLayerImp;
  v7 = [(BKScrubberLayerImp *)&v11 init];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->_layer, v6);
    [v6 setDelegate:v8];

    v8->_orientation = a4;
  }

  return v8;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layer);
  [WeakRetained setNeedsDisplay];
}

- (void)displayLayer:(id)a3
{
  id v19 = a3;
  unsigned int v4 = [(BKScrubberLayerImp *)self orientation];
  v5 = @"Vertical";
  if (!v4) {
    v5 = @"Horizontal";
  }
  id v6 = v5;
  if (self->_themeInterfaceStyle == 2) {
    v7 = @"Dark";
  }
  else {
    v7 = @"Light";
  }
  v8 = v7;
  id v9 = [(BKScrubberLayerImp *)self traitCollection];
  if (self->_isKnob)
  {
    unsigned int v10 = [(BKScrubberLayerImp *)self _isExpanded];
    CFStringRef v11 = &stru_2CE418;
    if (v10) {
      CFStringRef v11 = @"Expanded";
    }
    v12 = +[NSString stringWithFormat:@"ScrollBarOverlay_%@Thumb_Regular_%@_%@", v11, v6, v8];
    v13 = +[UIImage _kitImageNamed:v12 withTrait:v9];
    double v14 = 0.333333333;
    double v15 = 0.0;
    if (v4) {
      double v16 = 0.0;
    }
    else {
      double v16 = 0.333333333;
    }
    if (v4)
    {
      double v15 = 0.333333333;
      double v17 = 1.0;
    }
    else
    {
      double v17 = 0.333333333;
    }
    if (!v4) {
      double v14 = 1.0;
    }
    [v19 setContentsCenter:v16, v15, v17, v14];
  }
  else
  {
    v12 = +[NSString stringWithFormat:@"ScrollBarOverlay_Track_Regular_%@_%@", v6, v8];
    v13 = +[UIImage _kitImageNamed:v12 withTrait:v9];
  }

  if (v13)
  {
    id v18 = v13;
    [v19 setContents:[v18 CGImage]];
    [v18 scale];
    [v19 setContentsScale:];
  }
}

- (BOOL)_isExpanded
{
  return 0;
}

- (CALayer)layer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layer);

  return (CALayer *)WeakRetained;
}

- (void)setLayer:(id)a3
{
}

- (int64_t)themeInterfaceStyle
{
  return self->_themeInterfaceStyle;
}

- (void)setThemeInterfaceStyle:(int64_t)a3
{
  self->_themeInterfaceStyle = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)isKnob
{
  return self->_isKnob;
}

- (void)setIsKnob:(BOOL)a3
{
  self->_isKnob = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);

  objc_destroyWeak((id *)&self->_layer);
}

@end