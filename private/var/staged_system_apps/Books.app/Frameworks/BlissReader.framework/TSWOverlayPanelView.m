@interface TSWOverlayPanelView
- (BOOL)allowWindowMoveForPanel;
- (BOOL)bottomHairlineEnabled;
- (BOOL)p_addBackdropWithSettings:(id)a3;
- (BOOL)p_addBackgroundViewWithColor:(id)a3;
- (BOOL)topHairlineEnabled;
- (CAGradientLayer)gradientLayer;
- (CALayer)bakedShadowLayer;
- (CALayer)bottomHairlineLayer;
- (CALayer)topHairlineLayer;
- (CGRect)p_shadowFrame;
- (NSString)backdropGroupName;
- (TSUColor)bottomHairlineColor;
- (TSUColor)topHairlineColor;
- (TSWOverlayPanelView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)additionalBackgroundInset;
- (UIEdgeInsets)additionalShadowInset;
- (UIView)backgroundView;
- (UIView)layerHostingView;
- (double)p_contentsScale;
- (double)shadowOpacity;
- (id)p_bottomHairlineColorForAppearance:(int)a3;
- (id)p_hairlineColorForAppearance:(int)a3;
- (id)p_topHairlineColorForAppearance:(int)a3;
- (int)appearance;
- (void)alphaAnimationDidEnd;
- (void)alphaAnimationWillBegin;
- (void)dealloc;
- (void)layoutSubviews;
- (void)p_layoutSublayers;
- (void)p_resetAppearance;
- (void)setAdditionalBackgroundInset:(UIEdgeInsets)a3;
- (void)setAdditionalShadowInset:(UIEdgeInsets)a3;
- (void)setAllowWindowMoveForPanel:(BOOL)a3;
- (void)setAppearance:(int)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBakedShadowLayer:(id)a3;
- (void)setBottomHairlineColor:(id)a3;
- (void)setBottomHairlineEnabled:(BOOL)a3;
- (void)setBottomHairlineLayer:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setLayerHostingView:(id)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setTopHairlineColor:(id)a3;
- (void)setTopHairlineEnabled:(BOOL)a3;
- (void)setTopHairlineLayer:(id)a3;
@end

@implementation TSWOverlayPanelView

- (TSWOverlayPanelView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSWOverlayPanelView;
  v3 = -[TSWOverlayPanelView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    float64x2_t v5 = TSDEdgeInsetsZero[1];
    *(float64x2_t *)&v3->_additionalShadowInset.top = TSDEdgeInsetsZero[0];
    *(float64x2_t *)&v3->_additionalShadowInset.bottom = v5;
    v6 = [TSWPassThroughView alloc];
    [(TSWOverlayPanelView *)v4 bounds];
    v7 = -[TSWPassThroughView initWithFrame:](v6, "initWithFrame:");
    [(TSWOverlayPanelView *)v4 setLayerHostingView:v7];
    [(TSWOverlayPanelView *)v4 addSubview:[(TSWOverlayPanelView *)v4 layerHostingView]];
    [(TSWOverlayPanelView *)v4 setAppearance:1];
  }
  return v4;
}

- (CGRect)p_shadowFrame
{
  [(TSWOverlayPanelView *)self bounds];
  double top = self->_additionalShadowInset.top;
  double left = self->_additionalShadowInset.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_additionalShadowInset.right);
  double v12 = v11 - (top + self->_additionalShadowInset.bottom);

  return CGRectInset(*(CGRect *)&v6, -4.0, -4.0);
}

- (void)p_layoutSublayers
{
  [(TSWOverlayPanelView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TSWOverlayPanelView *)self p_shadowFrame];
  -[CALayer setFrame:]([(TSWOverlayPanelView *)self bakedShadowLayer], "setFrame:", v11, v12, v13, v14);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  CGRect v20 = CGRectInset(v19, -1.0, 0.0);
  -[CAGradientLayer setFrame:]([(TSWOverlayPanelView *)self gradientLayer], "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  topHairlineLayer = self->_topHairlineLayer;
  if (topHairlineLayer)
  {
    [(CALayer *)topHairlineLayer contentsScale];
    TSDRectWithOriginAndSize();
    -[CALayer setFrame:](self->_topHairlineLayer, "setFrame:");
  }
  bottomHairlineLayer = self->_bottomHairlineLayer;
  if (bottomHairlineLayer)
  {
    [(CALayer *)bottomHairlineLayer contentsScale];
    TSDRectWithOriginAndSize();
    v17 = self->_bottomHairlineLayer;
    -[CALayer setFrame:](v17, "setFrame:");
  }
}

- (void)setAdditionalShadowInset:(UIEdgeInsets)a3
{
  if (self->_additionalShadowInset.left != a3.left
    || self->_additionalShadowInset.top != a3.top
    || self->_additionalShadowInset.right != a3.right
    || self->_additionalShadowInset.bottom != a3.bottom)
  {
    self->_additionalShadowInset = a3;
    [(TSWOverlayPanelView *)self p_layoutSublayers];
  }
}

- (void)setAdditionalBackgroundInset:(UIEdgeInsets)a3
{
  if (self->_additionalBackgroundInset.left != a3.left
    || self->_additionalBackgroundInset.top != a3.top
    || self->_additionalBackgroundInset.right != a3.right
    || self->_additionalBackgroundInset.bottom != a3.bottom)
  {
    self->_additionalBackgroundInset = a3;
    [(TSWOverlayPanelView *)self layoutSubviews];
  }
}

- (double)shadowOpacity
{
  [(CALayer *)[(TSWOverlayPanelView *)self bakedShadowLayer] opacity];
  return v2;
}

- (void)setShadowOpacity:(double)a3
{
  float v3 = a3;
  CGFloat v4 = [(TSWOverlayPanelView *)self bakedShadowLayer];
  *(float *)&double v5 = v3;

  [(CALayer *)v4 setOpacity:v5];
}

- (double)p_contentsScale
{
  float v2 = +[UIScreen mainScreen];

  [(UIScreen *)v2 scale];
  return result;
}

- (void)setTopHairlineColor:(id)a3
{
  if (self->_topHairlineColor != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    topHairlineColor = (TSUColor *)a3;
    self->_topHairlineColor = topHairlineColor;
    topHairlineLayer = self->_topHairlineLayer;
    if (topHairlineColor)
    {
      if (!topHairlineLayer)
      {
        self->_topHairlineLayer = +[CALayer layer];
        [(TSWOverlayPanelView *)self p_contentsScale];
        -[CALayer setContentsScale:](self->_topHairlineLayer, "setContentsScale:");
        [(CALayer *)self->_topHairlineLayer setZPosition:1.0];
        [(CALayer *)[(UIView *)[(TSWOverlayPanelView *)self layerHostingView] layer] addSublayer:self->_topHairlineLayer];
        [(TSWOverlayPanelView *)self p_layoutSublayers];
        topHairlineColor = self->_topHairlineColor;
        if (!self->_topHairlineLayer) {
          goto LABEL_10;
        }
      }
      [(CALayer *)self->_topHairlineLayer setBackgroundColor:[(TSUColor *)topHairlineColor CGColor]];
    }
    else if (topHairlineLayer)
    {
      [(CALayer *)self->_topHairlineLayer removeFromSuperlayer];

      self->_topHairlineLayer = 0;
    }
    topHairlineColor = self->_topHairlineColor;
LABEL_10:
    self->_topHairlineEnabled = topHairlineColor != 0;
  }
}

- (void)setBottomHairlineColor:(id)a3
{
  if (self->_bottomHairlineColor != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    bottomHairlineColor = (TSUColor *)a3;
    self->_bottomHairlineColor = bottomHairlineColor;
    bottomHairlineLayer = self->_bottomHairlineLayer;
    if (bottomHairlineColor)
    {
      if (!bottomHairlineLayer)
      {
        self->_bottomHairlineLayer = +[CALayer layer];
        [(TSWOverlayPanelView *)self p_contentsScale];
        -[CALayer setContentsScale:](self->_bottomHairlineLayer, "setContentsScale:");
        [(CALayer *)self->_bottomHairlineLayer setZPosition:1.0];
        [(CALayer *)[(UIView *)[(TSWOverlayPanelView *)self layerHostingView] layer] addSublayer:self->_bottomHairlineLayer];
        [(TSWOverlayPanelView *)self p_layoutSublayers];
        bottomHairlineColor = self->_bottomHairlineColor;
        if (!self->_bottomHairlineLayer) {
          goto LABEL_10;
        }
      }
      [(CALayer *)self->_bottomHairlineLayer setBackgroundColor:[(TSUColor *)bottomHairlineColor CGColor]];
    }
    else if (bottomHairlineLayer)
    {
      [(CALayer *)self->_bottomHairlineLayer removeFromSuperlayer];

      self->_bottomHairlineLayer = 0;
    }
    bottomHairlineColor = self->_bottomHairlineColor;
LABEL_10:
    self->_bottomHairlineEnabled = bottomHairlineColor != 0;
  }
}

- (id)p_hairlineColorForAppearance:(int)a3
{
  if (!a3)
  {
    double v3 = 0.15;
    double v4 = 1.0;
    double v5 = 1.0;
    double v6 = 1.0;
    return +[TSUColor colorWithRed:v4 green:v5 blue:v6 alpha:v3];
  }
  if (a3 == 1)
  {
    double v3 = 0.3;
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    return +[TSUColor colorWithRed:v4 green:v5 blue:v6 alpha:v3];
  }
  return 0;
}

- (id)p_topHairlineColorForAppearance:(int)a3
{
  return [(TSWOverlayPanelView *)self p_hairlineColorForAppearance:*(void *)&a3];
}

- (id)p_bottomHairlineColorForAppearance:(int)a3
{
  return [(TSWOverlayPanelView *)self p_hairlineColorForAppearance:*(void *)&a3];
}

- (void)setTopHairlineEnabled:(BOOL)a3
{
  if (self->_topHairlineEnabled != a3)
  {
    if (a3) {
      id v4 = [(TSWOverlayPanelView *)self p_topHairlineColorForAppearance:[(TSWOverlayPanelView *)self appearance]];
    }
    else {
      id v4 = 0;
    }
    [(TSWOverlayPanelView *)self setTopHairlineColor:v4];
  }
}

- (void)setBottomHairlineEnabled:(BOOL)a3
{
  if (self->_bottomHairlineEnabled != a3)
  {
    if (a3) {
      id v4 = [(TSWOverlayPanelView *)self p_bottomHairlineColorForAppearance:[(TSWOverlayPanelView *)self appearance]];
    }
    else {
      id v4 = 0;
    }
    [(TSWOverlayPanelView *)self setBottomHairlineColor:v4];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TSWOverlayPanelView;
  [(TSWOverlayPanelView *)&v15 layoutSubviews];
  [(TSWOverlayPanelView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TSWOverlayPanelView *)self additionalBackgroundInset];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  [(TSWOverlayPanelView *)self p_layoutSublayers];
}

- (NSString)backdropGroupName
{
  objc_opt_class();
  float v2 = (void *)TSUDynamicCast();

  return (NSString *)[v2 groupName];
}

- (void)setBackdropGroupName:(id)a3
{
  objc_opt_class();
  double v4 = (void *)TSUDynamicCast();

  [v4 setGroupName:a3];
}

- (void)dealloc
{
  self->_layerHostingView = 0;
  self->_backgroundView = 0;

  self->mGradientLayer = 0;
  self->mBakedShadowLayer = 0;

  self->_topHairlineColor = 0;
  self->_bottomHairlineColor = 0;

  self->_topHairlineLayer = 0;
  self->_bottomHairlineLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWOverlayPanelView;
  [(TSWOverlayPanelView *)&v3 dealloc];
}

- (void)p_resetAppearance
{
  [(CAGradientLayer *)[(TSWOverlayPanelView *)self gradientLayer] setColors:0];
  [(CAGradientLayer *)[(TSWOverlayPanelView *)self gradientLayer] setBackgroundColor:0];
  [(CAGradientLayer *)[(TSWOverlayPanelView *)self gradientLayer] setBorderColor:0];
  [(CAGradientLayer *)[(TSWOverlayPanelView *)self gradientLayer] setBorderWidth:0.0];
  objc_super v3 = [(TSWOverlayPanelView *)self bakedShadowLayer];
  LODWORD(v4) = 1.0;
  [(CALayer *)v3 setOpacity:v4];
  backgroundView = self->_backgroundView;

  [(UIView *)backgroundView removeFromSuperview];
}

- (BOOL)p_addBackgroundViewWithColor:(id)a3
{
  if (!self->_backgroundView)
  {
    id v5 = objc_alloc((Class)UIView);
    [(TSWOverlayPanelView *)self bounds];
    TSDRectWithSize();
    double v6 = (UIView *)[v5 initWithFrame:];
    self->_backgroundView = v6;
    [(UIView *)v6 setAutoresizingMask:18];
  }
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", [a3 UIColor]);
  if (![(UIView *)self->_backgroundView superview])
  {
    [(TSWOverlayPanelView *)self addSubview:self->_backgroundView];
    [(TSWOverlayPanelView *)self sendSubviewToBack:self->_backgroundView];
  }
  return 1;
}

- (BOOL)p_addBackdropWithSettings:(id)a3
{
  if (!self->_backgroundView)
  {
    id v5 = (UIView *)[objc_alloc((Class)_UIBackdropView) initWithSettings:a3];
    if ([(UIView *)v5 effectView]) {
      self->_backgroundView = v5;
    }
    else {
  }
    }
  objc_opt_class();
  double v6 = (void *)TSUDynamicCast();
  double v7 = v6;
  if (v6)
  {
    [v6 transitionToSettings:a3];
    if (![v7 superview])
    {
      [(TSWOverlayPanelView *)self addSubview:self->_backgroundView];
      [(TSWOverlayPanelView *)self sendSubviewToBack:self->_backgroundView];
    }
  }
  return v7 != 0;
}

- (void)alphaAnimationWillBegin
{
  id v2 = [(TSWOverlayPanelView *)self layer];

  [v2 setAllowsGroupOpacity:0];
}

- (void)alphaAnimationDidEnd
{
  id v2 = [(TSWOverlayPanelView *)self layer];

  [v2 setAllowsGroupOpacity:1];
}

- (void)setAppearance:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TSWOverlayPanelView *)self p_resetAppearance];
  if (v3 == 2)
  {
    [(CAGradientLayer *)[(TSWOverlayPanelView *)self gradientLayer] setColors:0];
    [(CAGradientLayer *)[(TSWOverlayPanelView *)self gradientLayer] setBackgroundColor:[+[TSUColor colorWithWhite:0.0 alpha:0.0] CGColor]];
    [(CALayer *)[(TSWOverlayPanelView *)self bakedShadowLayer] setOpacity:0.0];
    int v6 = 2;
LABEL_11:
    self->mAppearance = v6;
    goto LABEL_13;
  }
  if (v3 == 1)
  {
    double v7 = +[TSUColor colorWithWhite:0.980392157 alpha:0.9];
    if (![(TSWOverlayPanelView *)self p_addBackdropWithSettings:+[_UIBackdropViewSettings settingsForPrivateStyle:2020]])[(TSWOverlayPanelView *)self p_addBackgroundViewWithColor:v7]; {
    int v6 = 1;
    }
    goto LABEL_11;
  }
  if (v3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWOverlayPanelView setAppearance:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/TSWOverlayPanelView.m") lineNumber:482 description:@"Unrecognized TSWOverlayAppearance value %u" v3];
  }
  else
  {
    id v5 = +[TSUColor colorWithWhite:0.0 alpha:0.8];
    if (![(TSWOverlayPanelView *)self p_addBackdropWithSettings:+[_UIBackdropViewSettings settingsForPrivateStyle:2030]])[(TSWOverlayPanelView *)self p_addBackgroundViewWithColor:v5]; {
    self->mAppearance = 0;
    }
  }
LABEL_13:
  if (self->_topHairlineEnabled) {
    [(TSWOverlayPanelView *)self setTopHairlineColor:[(TSWOverlayPanelView *)self p_topHairlineColorForAppearance:[(TSWOverlayPanelView *)self appearance]]];
  }
  if (self->_bottomHairlineEnabled)
  {
    id v8 = [(TSWOverlayPanelView *)self p_bottomHairlineColorForAppearance:[(TSWOverlayPanelView *)self appearance]];
    [(TSWOverlayPanelView *)self setBottomHairlineColor:v8];
  }
}

- (CAGradientLayer)gradientLayer
{
  return self->mGradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (CALayer)bakedShadowLayer
{
  return self->mBakedShadowLayer;
}

- (void)setBakedShadowLayer:(id)a3
{
}

- (int)appearance
{
  return self->mAppearance;
}

- (UIEdgeInsets)additionalShadowInset
{
  double top = self->_additionalShadowInset.top;
  double left = self->_additionalShadowInset.left;
  double bottom = self->_additionalShadowInset.bottom;
  double right = self->_additionalShadowInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)additionalBackgroundInset
{
  double top = self->_additionalBackgroundInset.top;
  double left = self->_additionalBackgroundInset.left;
  double bottom = self->_additionalBackgroundInset.bottom;
  double right = self->_additionalBackgroundInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)allowWindowMoveForPanel
{
  return self->_allowWindowMoveForPanel;
}

- (void)setAllowWindowMoveForPanel:(BOOL)a3
{
  self->_allowWindowMoveForPanel = a3;
}

- (TSUColor)topHairlineColor
{
  return self->_topHairlineColor;
}

- (TSUColor)bottomHairlineColor
{
  return self->_bottomHairlineColor;
}

- (BOOL)topHairlineEnabled
{
  return self->_topHairlineEnabled;
}

- (BOOL)bottomHairlineEnabled
{
  return self->_bottomHairlineEnabled;
}

- (UIView)layerHostingView
{
  return self->_layerHostingView;
}

- (void)setLayerHostingView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (CALayer)topHairlineLayer
{
  return self->_topHairlineLayer;
}

- (void)setTopHairlineLayer:(id)a3
{
}

- (CALayer)bottomHairlineLayer
{
  return self->_bottomHairlineLayer;
}

- (void)setBottomHairlineLayer:(id)a3
{
}

@end