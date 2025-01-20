@interface BKScrubberSlider
- (BKScrubberSlider)init;
- (BKScrubberSliderContainerView)containerView;
- (BOOL)_hasSessionIndicatorView;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_createBufferedRect;
- (CGRect)_createSessionIndicatorRect;
- (CGRect)accessibilityFrame;
- (CGRect)bkaxDefaultAccessibilityFrame;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGRect)visualTrackRectForBounds:(CGRect)a3;
- (NSNumber)sessionIndicatorValue;
- (NSString)cachedAccessibleDescriptionOfSessionIndicatorPosition;
- (UIColor)bufferIndicatorColor;
- (UIColor)sessionIndicatorColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)touchInsets;
- (double)bufferedValue;
- (double)trackRectHorizontalInset;
- (id)_sessionIndicatorAccessibleDescription;
- (id)accessibilityCustomActions;
- (id)createThumbView;
- (void)_didTapSessionIndicator:(id)a3;
- (void)_updateSessionIndicatorColor;
- (void)bkaxDidTapSessionIndicator;
- (void)layoutSubviews;
- (void)setBufferIndicatorColor:(id)a3;
- (void)setBufferedValue:(double)bufferedValue;
- (void)setCachedAccessibleDescriptionOfSessionIndicatorPosition:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setSessionIndicatorColor:(id)a3;
- (void)setSessionIndicatorValue:(id)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setTrackRectHorizontalInset:(double)a3;
@end

@implementation BKScrubberSlider

- (BKScrubberSlider)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKScrubberSlider;
  v2 = [(BKScrubberSlider *)&v6 init];
  if (v2)
  {
    v3 = +[UITraitCollection bc_allAPITraits];
    id v4 = [(BKScrubberSlider *)v2 registerForTraitChanges:v3 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v2;
}

- (id)createThumbView
{
  v6.receiver = self;
  v6.super_class = (Class)BKScrubberSlider;
  id v3 = [(BKScrubberSlider *)&v6 createThumbView];
  id v4 = [(BKScrubberSlider *)self containerView];
  [v4 setThumbView:v3];

  return v3;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)BKScrubberSlider;
  [(BKScrubberSlider *)&v16 layoutSubviews];
  id v3 = [(BKScrubberSlider *)self containerView];
  id v4 = [v3 bufferedView];
  v5 = [v3 sessionIndicatorView];
  if (v4)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(BKScrubberSlider *)self _createBufferedRect];
    [v4 setFrame:];
    +[CATransaction commit];
  }
  if (v5)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(BKScrubberSlider *)self _createSessionIndicatorRect];
    [v5 setFrame:];
    objc_super v6 = [v3 subviews];
    v7 = [v6 lastObject];
    unsigned __int8 v8 = [v7 isEqual:v5];

    if ((v8 & 1) == 0) {
      [v3 bringSubviewToFront:v5];
    }
    +[CATransaction commit];
  }
  v9 = [(BKScrubberSlider *)self subviews];
  v10 = (char *)[v9 count];

  v11 = v10 - 2;
  v12 = [(BKScrubberSlider *)self subviews];
  v13 = [v12 objectAtIndexedSubscript:v11];
  unsigned __int8 v14 = [v13 isEqual:v3];

  if ((v14 & 1) == 0)
  {
    [(BKScrubberSlider *)self bringSubviewToFront:v3];
    v15 = [v3 thumbView];
    [(BKScrubberSlider *)self bringSubviewToFront:v15];
  }
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)BKScrubberSlider;
  -[BKScrubberSlider trackRectForBounds:](&v17, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6;
  double v9 = v8;
  [(BKScrubberSlider *)self trackRectHorizontalInset];
  double v11 = x + v10;
  [(BKScrubberSlider *)self trackRectHorizontalInset];
  double v13 = width + v12 * -2.0;
  double v14 = v11;
  double v15 = v7;
  double v16 = v9;
  result.size.height = v16;
  result.size.double width = v13;
  result.origin.y = v15;
  result.origin.double x = v14;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BKScrubberSlider *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(BKScrubberSlider *)self touchInsets];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;

  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left != self->_touchInsets.left
    || a3.top != self->_touchInsets.top
    || a3.right != self->_touchInsets.right
    || a3.bottom != self->_touchInsets.bottom)
  {
    self->_touchInsets = a3;
    id v10 = [(BKScrubberSlider *)self containerView];
    [v10 setThumbTouchInsets:top left:left bottom:bottom right:right];
  }
}

- (CGRect)visualTrackRectForBounds:(CGRect)a3
{
  -[BKScrubberSlider trackRectForBounds:](self, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return CGRectInset(*(CGRect *)&v3, 1.0, 0.0);
}

- (BKScrubberSliderContainerView)containerView
{
  containerView = self->_containerView;
  if (!containerView)
  {
    double v4 = [BKScrubberSliderContainerView alloc];
    [(BKScrubberSlider *)self bounds];
    double v5 = -[BKScrubberSliderContainerView initWithFrame:](v4, "initWithFrame:");
    double v6 = self->_containerView;
    self->_containerView = v5;

    double v7 = +[UIColor clearColor];
    [(BKScrubberSliderContainerView *)self->_containerView setBackgroundColor:v7];

    double v8 = [(BKScrubberSliderContainerView *)self->_containerView layer];
    [v8 setAllowsGroupBlending:0];

    [(BKScrubberSliderContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKScrubberSlider *)self addSubview:self->_containerView];
    double v22 = [(BKScrubberSliderContainerView *)self->_containerView topAnchor];
    double v21 = [(BKScrubberSlider *)self topAnchor];
    double v20 = [v22 constraintEqualToAnchor:v21];
    v23[0] = v20;
    double v19 = [(BKScrubberSliderContainerView *)self->_containerView leadingAnchor];
    double v18 = [(BKScrubberSlider *)self leadingAnchor];
    double v9 = [v19 constraintEqualToAnchor:v18];
    v23[1] = v9;
    id v10 = [(BKScrubberSliderContainerView *)self->_containerView trailingAnchor];
    double v11 = [(BKScrubberSlider *)self trailingAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    v23[2] = v12;
    double v13 = [(BKScrubberSliderContainerView *)self->_containerView bottomAnchor];
    double v14 = [(BKScrubberSlider *)self bottomAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v23[3] = v15;
    double v16 = +[NSArray arrayWithObjects:v23 count:4];
    +[NSLayoutConstraint activateConstraints:v16];

    containerView = self->_containerView;
  }

  return containerView;
}

- (void)setBufferedValue:(double)bufferedValue
{
  if (self->_bufferedValue == bufferedValue) {
    return;
  }
  self->_bufferedValue = bufferedValue;
  if (bufferedValue > 0.0)
  {
    double v4 = [(BKScrubberSlider *)self containerView];
    double v5 = [v4 bufferedView];

    if (!v5)
    {
      [(BKScrubberSlider *)self bounds];
      -[BKScrubberSlider visualTrackRectForBounds:](self, "visualTrackRectForBounds:");
      double v10 = v9;
      double v8 = objc_opt_new();
      double v11 = [(BKScrubberSlider *)self bufferIndicatorColor];
      if (v11)
      {
        [v8 setBackgroundColor:v11];
      }
      else
      {
        double v12 = +[UIColor systemGray2Color];
        [v8 setBackgroundColor:v12];
      }
      double v13 = [v8 layer];
      [v13 setCornerRadius:v10 * 0.5];

      double v14 = [v8 layer];
      [v14 setMaskedCorners:10];

      double v15 = [(BKScrubberSlider *)self containerView];
      [v15 addSubview:v8];

      double v16 = [(BKScrubberSlider *)self containerView];
      [v16 setBufferedView:v8];

      goto LABEL_12;
    }
    bufferedValue = self->_bufferedValue;
  }
  if (bufferedValue <= 0.0)
  {
    double v6 = [(BKScrubberSlider *)self containerView];
    double v7 = [v6 bufferedView];
    [v7 removeFromSuperview];

    double v8 = [(BKScrubberSlider *)self containerView];
    [v8 setBufferedView:0];
LABEL_12:
  }

  [(BKScrubberSlider *)self setNeedsLayout];
}

- (void)setBufferIndicatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_bufferIndicatorColor, a3);
  id v5 = a3;
  id v7 = [(BKScrubberSlider *)self containerView];
  double v6 = [v7 bufferedView];
  [v6 setBackgroundColor:v5];
}

- (void)setSessionIndicatorColor:(id)a3
{
  id v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_sessionIndicatorColor != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_sessionIndicatorColor, a3);
      [(BKScrubberSlider *)self _updateSessionIndicatorColor];
      double v6 = v8;
    }
  }
}

- (void)setSessionIndicatorValue:(id)a3
{
  id v5 = a3;
  p_sessionIndicatorValue = &self->_sessionIndicatorValue;
  sessionIndicatorValue = self->_sessionIndicatorValue;
  id v20 = v5;
  if (v5)
  {
    if ([(NSNumber *)sessionIndicatorValue isEqualToNumber:v5]) {
      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_sessionIndicatorValue, a3);
    if (!*p_sessionIndicatorValue) {
      goto LABEL_9;
    }
    double v8 = [(BKScrubberSlider *)self containerView];
    double v9 = [v8 sessionIndicatorView];

    if (v9) {
      goto LABEL_9;
    }
    double v10 = objc_opt_new();
    [(BKScrubberSlider *)self _createSessionIndicatorRect];
    [v10 setFrame:];
    id v11 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTapSessionIndicator:"];
    [v10 addGestureRecognizer:v11];

    double v12 = [(BKScrubberSlider *)self containerView];
    [v12 addSubview:v10];

    double v13 = [(BKScrubberSlider *)self containerView];
    [v13 setSessionIndicatorView:v10];

    double v14 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 8.0, 7.5, 6.0, 6.0);
    double v15 = +[CAShapeLayer layer];
    id v16 = v14;
    [v15 setPath:[v16 CGPath]];
    double v17 = [v10 layer];
    [v17 addSublayer:v15];

    [(BKScrubberSlider *)self _updateSessionIndicatorColor];
  }
  else
  {
    if (!sessionIndicatorValue) {
      goto LABEL_10;
    }
    *p_sessionIndicatorValue = 0;

    double v18 = [(BKScrubberSlider *)self containerView];
    double v19 = [v18 sessionIndicatorView];
    [v19 removeFromSuperview];

    double v10 = [(BKScrubberSlider *)self containerView];
    [v10 setSessionIndicatorView:0];
  }

LABEL_9:
  [(BKScrubberSlider *)self setNeedsLayout];
LABEL_10:
  [(BKScrubberSlider *)self setCachedAccessibleDescriptionOfSessionIndicatorPosition:0];
}

- (CGRect)_createSessionIndicatorRect
{
  uint64_t v3 = [(BKScrubberSlider *)self containerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[BKScrubberSlider trackRectForBounds:](self, "trackRectForBounds:", v5, v7, v9, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(NSNumber *)self->_sessionIndicatorValue floatValue];
  LODWORD(v28) = v20;
  -[BKScrubberSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v5, v7, v9, v11, v13, v15, v17, v19, v28);
  CGRectGetCenter();
  double v22 = v21;
  CGRectGetCenter();
  double v23 = v22 + -11.0;
  double v25 = v24 + -11.0;
  double v26 = 22.0;
  double v27 = 22.0;
  result.size.height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)_createBufferedRect
{
  [(BKScrubberSlider *)self bufferedValue];
  double v4 = v3;
  [(BKScrubberSlider *)self value];
  if (v4 <= v5)
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  else
  {
    double v6 = [(BKScrubberSlider *)self containerView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    -[BKScrubberSlider visualTrackRectForBounds:](self, "visualTrackRectForBounds:", v8, v10, v12, v14);
    double v16 = v15;
    double y = v17;
    double v32 = v4;
    double v20 = v19;
    double height = v21;
    [(BKScrubberSlider *)self value];
    LODWORD(v31) = v23;
    -[BKScrubberSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v8, v10, v12, v14, v16, y, v20, height, v31);
    double x = CGRectGetMaxX(v33);
    double v25 = fmax(v16 + v32 * v20 - x, 0.0);
    v34.origin.double x = v16;
    v34.origin.double y = y;
    v34.size.double width = v20;
    v34.size.double height = height;
    double v26 = CGRectGetMaxX(v34) - x;
    if (v25 >= v26) {
      double width = v26;
    }
    else {
      double width = v25;
    }
  }
  double v28 = x;
  double v29 = y;
  double v30 = height;
  result.size.double height = v30;
  result.size.double width = width;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (BOOL)_hasSessionIndicatorView
{
  double v2 = [(BKScrubberSlider *)self containerView];
  double v3 = [v2 sessionIndicatorView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_sessionIndicatorAccessibleDescription
{
  double v3 = [(BKScrubberSlider *)self cachedAccessibleDescriptionOfSessionIndicatorPosition];
  if (!v3 && [(BKScrubberSlider *)self _hasSessionIndicatorView])
  {
    BOOL v4 = [(BKScrubberSlider *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    double v3 = [(BKScrubberSlider *)self delegate];
    double v6 = [v3 accessibleDescriptionOfSessionIndicatorPosition];
    [(BKScrubberSlider *)self setCachedAccessibleDescriptionOfSessionIndicatorPosition:v6];
  }
LABEL_6:

  return [(BKScrubberSlider *)self cachedAccessibleDescriptionOfSessionIndicatorPosition];
}

- (void)_didTapSessionIndicator:(id)a3
{
  id v4 = [(BKScrubberSlider *)self delegate];
  [v4 didTapSessionIndicator:self];
}

- (void)_updateSessionIndicatorColor
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v3 = [(BKScrubberSlider *)self containerView];
  id v4 = [v3 sessionIndicatorView];
  char v5 = [v4 layer];
  double v6 = [v5 sublayers];

  id obj = v6;
  double v7 = (char *)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    double v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [(BKScrubberSlider *)self sessionIndicatorColor];
        id v12 = [v11 CGColor];
        id v13 = v12;
        if (!v12)
        {
          id v4 = +[UIColor bc_booksOpaqueSecondaryLabelColor];
          id v13 = [v4 CGColor];
        }
        objc_opt_class();
        double v14 = BUDynamicCast();
        [v14 setFillColor:v13];

        if (!v12) {
      }
        }
      double v8 = (char *)[obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v14.receiver = self;
  v14.super_class = (Class)BKScrubberSlider;
  id v4 = [(BKScrubberSlider *)&v14 accessibilityCustomActions];
  id v5 = [v3 initWithArray:v4];

  if ([(BKScrubberSlider *)self _hasSessionIndicatorView])
  {
    double v6 = [(BKScrubberSlider *)self _sessionIndicatorAccessibleDescription];
    double v7 = +[NSBundle mainBundle];
    if (v6)
    {
      double v8 = [v7 localizedStringForKey:@"Scrub to start of playback at %@" value:&stru_100A70340 table:0];
      uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);
    }
    else
    {
      uint64_t v9 = [v7 localizedStringForKey:@"Scrub to start of playback" value:&stru_100A70340 table:0];
    }

    id v10 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v9 target:self selector:"bkaxDidTapSessionIndicator"];
    [v5 addObject:v10];
  }
  if ([v5 count]) {
    id v11 = v5;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (CGRect)accessibilityFrame
{
  v22.receiver = self;
  v22.super_class = (Class)BKScrubberSlider;
  [(BKScrubberSlider *)&v22 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(BKScrubberSlider *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(BKScrubberSlider *)self delegate];
    [v13 alternateAccessibilityFrameFor:self];
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)bkaxDefaultAccessibilityFrame
{
  v6.receiver = self;
  v6.super_class = (Class)BKScrubberSlider;
  [(BKScrubberSlider *)&v6 accessibilityFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)bkaxDidTapSessionIndicator
{
}

- (double)trackRectHorizontalInset
{
  return self->_trackRectHorizontalInset;
}

- (void)setTrackRectHorizontalInset:(double)a3
{
  self->_trackRectHorizontalInset = a3;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)bufferedValue
{
  return self->_bufferedValue;
}

- (UIColor)bufferIndicatorColor
{
  return self->_bufferIndicatorColor;
}

- (UIColor)sessionIndicatorColor
{
  return self->_sessionIndicatorColor;
}

- (NSNumber)sessionIndicatorValue
{
  return self->_sessionIndicatorValue;
}

- (void)setContainerView:(id)a3
{
}

- (NSString)cachedAccessibleDescriptionOfSessionIndicatorPosition
{
  return self->_cachedAccessibleDescriptionOfSessionIndicatorPosition;
}

- (void)setCachedAccessibleDescriptionOfSessionIndicatorPosition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAccessibleDescriptionOfSessionIndicatorPosition, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_sessionIndicatorValue, 0);
  objc_storeStrong((id *)&self->_sessionIndicatorColor, 0);

  objc_storeStrong((id *)&self->_bufferIndicatorColor, 0);
}

@end