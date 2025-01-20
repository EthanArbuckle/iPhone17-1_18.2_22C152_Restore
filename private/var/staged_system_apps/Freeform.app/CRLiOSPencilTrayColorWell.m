@interface CRLiOSPencilTrayColorWell
- (BOOL)isForStrokeColor;
- (BOOL)isUpdatingContinuously;
- (CRLiOSPencilTrayColorWell)initWithCoder:(id)a3;
- (CRLiOSPencilTrayColorWell)initWithFrame:(CGRect)a3;
- (UIColor)selectedColor;
- (UIPointerInteraction)pointerInteraction;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)p_colorBulletOutlineColor;
- (id)p_titleForColorPicker;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)layoutSubviews;
- (void)p_commonInit;
- (void)p_installBackgroundView;
- (void)p_presentColorPicker:(id)a3;
- (void)p_presentColorPicker:(id)a3 withCompletion:(id)a4;
- (void)p_updateColorBulletView;
- (void)p_updateColorPickerIfNeeded;
- (void)p_updateStrokeHoleMask;
- (void)setForStrokeColor:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)toggleColorPickerPresentation;
@end

@implementation CRLiOSPencilTrayColorWell

- (CRLiOSPencilTrayColorWell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayColorWell;
  v3 = -[CRLiOSPencilTrayColorWell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CRLiOSPencilTrayColorWell *)v3 p_commonInit];
  }
  return v4;
}

- (CRLiOSPencilTrayColorWell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayColorWell;
  v3 = [(CRLiOSPencilTrayColorWell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CRLiOSPencilTrayColorWell *)v3 p_commonInit];
  }
  return v4;
}

- (void)p_commonInit
{
  v3 = +[UIColor clearColor];
  [(CRLiOSPencilTrayColorWell *)self setBackgroundColor:v3];

  [(CRLiOSPencilTrayColorWell *)self p_installBackgroundView];
  [(CRLiOSPencilTrayColorWell *)self p_updateColorBulletView];
  [(CRLiOSPencilTrayColorWell *)self p_updateStrokeHoleMask];
  [(CRLiOSPencilTrayColorWell *)self addTarget:self action:"p_presentColorPicker:" forControlEvents:64];
  [(CRLiOSPencilTrayColorWell *)self setShowsLargeContentViewer:1];
  id v4 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  [(CRLiOSPencilTrayColorWell *)self addInteraction:v4];

  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Show More Colors" value:0 table:0];
  [(CRLiOSPencilTrayColorWell *)self setLargeContentTitle:v6];

  id v7 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(CRLiOSPencilTrayColorWell *)self setPointerInteraction:v7];

  v8 = [(CRLiOSPencilTrayColorWell *)self pointerInteraction];
  [(CRLiOSPencilTrayColorWell *)self addInteraction:v8];

  -[CRLiOSPencilTrayColorWell setHitTestInsets:](self, "setHitTestInsets:", -12.0, -12.0, -12.0, -12.0);
  uint64_t v11 = objc_opt_class();
  v9 = +[NSArray arrayWithObjects:&v11 count:1];
  id v10 = [(CRLiOSPencilTrayColorWell *)self registerForTraitChanges:v9 withTarget:self action:"setNeedsLayout"];
}

- (void)p_installBackgroundView
{
  if (self->_rainbowBackgroundView)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D05B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F2E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D05D8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell p_installBackgroundView]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 77, 0, "expected nil value for '%{public}s'", "_rainbowBackgroundView");
  }
  objc_super v6 = +[UIImage imageNamed:@"CRLiOSPencilTray/ColorWell"];
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D05F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F250();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0618);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell p_installBackgroundView]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 79, 0, "invalid nil value for '%{public}s'", "rainbowBackgroundImage");
  }
  id v10 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
  rainbowBackgroundView = self->_rainbowBackgroundView;
  self->_rainbowBackgroundView = v10;

  [(CRLiOSPencilTrayColorWell *)self addSubview:self->_rainbowBackgroundView];
}

- (void)setSelectedColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_selectedColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_selectedColor, a3);
    [(CRLiOSPencilTrayColorWell *)self p_updateColorBulletView];
    [(CRLiOSPencilTrayColorWell *)self p_updateColorPickerIfNeeded];
    v5 = v6;
  }
}

- (void)setForStrokeColor:(BOOL)a3
{
  if (self->_isForStrokeColor != a3)
  {
    self->_isForStrokeColor = a3;
    [(CRLiOSPencilTrayColorWell *)self p_updateStrokeHoleMask];
    [(CRLiOSPencilTrayColorWell *)self p_updateColorPickerIfNeeded];
  }
}

- (void)toggleColorPickerPresentation
{
  v3 = [(CRLiOSPencilTrayColorWell *)self window];
  id v4 = [v3 rootViewController];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0638);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F40C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0658);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    objc_super v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell toggleColorPickerPresentation]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 106, 0, "invalid nil value for '%{public}s'", "rootVC");
  }
  v8 = [v4 presentedViewController];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0678);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106F378();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0698);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell toggleColorPickerPresentation]");
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:110 isFatal:0 description:"PencilKit should handle dismissing other presented view controllers before we get here."];
    }
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    [(CRLiOSPencilTrayColorWell *)self p_presentColorPicker:0];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSPencilTrayColorWell;
  -[CRLiOSPencilTrayColorWell hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (CRLiOSPencilTrayColorWell *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 && [(CRLiOSPencilTrayColorWell *)v5 isDescendantOfView:self])
  {
    id v7 = self;

    objc_super v6 = v7;
  }

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayColorWell;
  -[CRLiOSPencilTrayColorWell setHighlighted:](&v6, "setHighlighted:");
  double v5 = 1.0;
  if (v3) {
    double v5 = 0.5;
  }
  [(CRLiOSPencilTrayColorWell *)self setAlpha:v5];
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CRLiOSPencilTrayColorWell;
  [(CRLiOSPencilTrayColorWell *)&v34 layoutSubviews];
  [(CRLiOSPencilTrayColorWell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_rainbowBackgroundView, "setFrame:");
  v35.origin.CGFloat x = v4;
  v35.origin.CGFloat y = v6;
  v35.size.CGFloat width = v8;
  v35.size.CGFloat height = v10;
  CGFloat v11 = CGRectGetWidth(v35) * 0.5;
  v12 = [(UIView *)self->_rainbowBackgroundView layer];
  [v12 setCornerRadius:v11];

  v13 = [(CRLiOSPencilTrayColorWell *)self layer];
  [v13 setCornerRadius:v11];

  if (self->_colorBulletView)
  {
    v36.origin.CGFloat x = v4;
    v36.origin.CGFloat y = v6;
    v36.size.CGFloat width = v8;
    v36.size.CGFloat height = v10;
    CGFloat v14 = round(CGRectGetWidth(v36) * 0.13);
    v37.origin.CGFloat x = v4;
    v37.origin.CGFloat y = v6;
    v37.size.CGFloat width = v8;
    v37.size.CGFloat height = v10;
    CGFloat v15 = round(CGRectGetHeight(v37) * 0.13);
    v38.origin.CGFloat x = v4;
    v38.origin.CGFloat y = v6;
    v38.size.CGFloat width = v8;
    v38.size.CGFloat height = v10;
    CGRect v39 = CGRectInset(v38, v14, v15);
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    -[UIView setFrame:](self->_colorBulletView, "setFrame:");
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGFloat v20 = CGRectGetWidth(v40) * 0.5;
    v21 = [(UIView *)self->_colorBulletView layer];
    [v21 setCornerRadius:v20];

    v22 = [(UIView *)self->_colorBulletView layer];
    [v22 setBorderWidth:0.5];

    id v23 = [(CRLiOSPencilTrayColorWell *)self p_colorBulletOutlineColor];
    id v24 = [v23 CGColor];
    v25 = [(UIView *)self->_colorBulletView layer];
    [v25 setBorderColor:v24];
  }
  strokeHoleMask = self->_strokeHoleMask;
  if (strokeHoleMask)
  {
    -[CAShapeLayer setFrame:](strokeHoleMask, "setFrame:", v4, v6, v8, v10);
    v41.origin.CGFloat x = v4;
    v41.origin.CGFloat y = v6;
    v41.size.CGFloat width = v8;
    v41.size.CGFloat height = v10;
    CGFloat v27 = round(CGRectGetWidth(v41) * 0.29);
    v42.origin.CGFloat x = v4;
    v42.origin.CGFloat y = v6;
    v42.size.CGFloat width = v8;
    v42.size.CGFloat height = v10;
    CGFloat v28 = round(CGRectGetHeight(v42) * 0.29);
    v43.origin.CGFloat x = v4;
    v43.origin.CGFloat y = v6;
    v43.size.CGFloat width = v8;
    v43.size.CGFloat height = v10;
    CGRect v44 = CGRectInset(v43, v27, v28);
    CGFloat v29 = v44.origin.x;
    CGFloat v30 = v44.origin.y;
    CGFloat v31 = v44.size.width;
    CGFloat v32 = v44.size.height;
    Mutable = CGPathCreateMutable();
    v45.origin.CGFloat x = v4;
    v45.origin.CGFloat y = v6;
    v45.size.CGFloat width = v8;
    v45.size.CGFloat height = v10;
    CGPathAddRect(Mutable, 0, v45);
    v46.origin.CGFloat x = v29;
    v46.origin.CGFloat y = v30;
    v46.size.CGFloat width = v31;
    v46.size.CGFloat height = v32;
    CGPathAddEllipseInRect(Mutable, 0, v46);
    [(CAShapeLayer *)self->_strokeHoleMask setPath:Mutable];
    CGPathRelease(Mutable);
  }
}

- (id)p_colorBulletOutlineColor
{
  v2 = [(CRLiOSPencilTrayColorWell *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  if (v3 == (id)2)
  {
    double v4 = +[UIColor whiteColor];
    double v5 = v4;
    double v6 = 0.16;
  }
  else
  {
    double v4 = +[UIColor blackColor];
    double v5 = v4;
    double v6 = 0.08;
  }
  double v7 = [v4 colorWithAlphaComponent:v6];

  return v7;
}

- (void)p_updateColorBulletView
{
  id v3 = [(CRLiOSPencilTrayColorWell *)self selectedColor];

  colorBulletView = self->_colorBulletView;
  if (v3 && !colorBulletView)
  {
    double v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v6 = self->_colorBulletView;
    self->_colorBulletView = v5;

    [(CRLiOSPencilTrayColorWell *)self addSubview:self->_colorBulletView];
LABEL_10:
    double v8 = [(CRLiOSPencilTrayColorWell *)self selectedColor];
    double v9 = [v8 colorWithAlphaComponent:1.0];
    [(UIView *)self->_colorBulletView setBackgroundColor:v9];

    [(CRLiOSPencilTrayColorWell *)self setNeedsLayout];
    return;
  }
  if (v3 || !colorBulletView)
  {
    if (!v3) {
      return;
    }
    goto LABEL_10;
  }
  [(UIView *)colorBulletView removeFromSuperview];
  double v7 = self->_colorBulletView;
  self->_colorBulletView = 0;
}

- (void)p_updateStrokeHoleMask
{
  unsigned int v3 = [(CRLiOSPencilTrayColorWell *)self isForStrokeColor];
  unsigned int v4 = v3;
  strokeHoleMask = self->_strokeHoleMask;
  if (v3 && !strokeHoleMask)
  {
    double v6 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    double v7 = self->_strokeHoleMask;
    self->_strokeHoleMask = v6;

    id v8 = +[UIColor blackColor];
    -[CAShapeLayer setFillColor:](self->_strokeHoleMask, "setFillColor:", [v8 CGColor]);

    [(CAShapeLayer *)self->_strokeHoleMask setFillRule:kCAFillRuleEvenOdd];
    double v9 = self->_strokeHoleMask;
    double v10 = [(CRLiOSPencilTrayColorWell *)self layer];
    [v10 setMask:v9];
LABEL_9:

    goto LABEL_10;
  }
  if (strokeHoleMask) {
    char v11 = v3;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    v12 = [(CRLiOSPencilTrayColorWell *)self layer];
    [v12 setMask:0];

    double v10 = self->_strokeHoleMask;
    self->_strokeHoleMask = 0;
    goto LABEL_9;
  }
LABEL_10:
  if (v4)
  {
    [(CRLiOSPencilTrayColorWell *)self setNeedsLayout];
  }
}

- (void)p_presentColorPicker:(id)a3
{
}

- (void)p_presentColorPicker:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  double v6 = [(CRLiOSPencilTrayColorWell *)self window];
  double v7 = [v6 rootViewController];

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D06B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F4A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D06D8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell p_presentColorPicker:withCompletion:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 250, 0, "invalid nil value for '%{public}s'", "rootVC");
  }
  char v11 = [v7 presentedViewController];
  if (!v11)
  {
    if (!self->_colorPicker)
    {
      v12 = (UIColorPickerViewController *)objc_alloc_init((Class)UIColorPickerViewController);
      colorPicker = self->_colorPicker;
      self->_colorPicker = v12;

      [(UIColorPickerViewController *)self->_colorPicker setDelegate:self];
      [(UIColorPickerViewController *)self->_colorPicker setSupportsAlpha:1];
      [(UIColorPickerViewController *)self->_colorPicker setModalPresentationStyle:7];
    }
    [(CRLiOSPencilTrayColorWell *)self p_updateColorPickerIfNeeded];
    CGFloat v14 = [(UIColorPickerViewController *)self->_colorPicker popoverPresentationController];
    [v14 setSourceView:self];

    CGFloat v15 = [(CRLiOSPencilTrayColorWell *)self window];
    v16 = [v15 rootViewController];
    [v16 presentViewController:self->_colorPicker animated:1 completion:v5];
  }
}

- (void)p_updateColorPickerIfNeeded
{
  colorPicker = self->_colorPicker;
  if (colorPicker)
  {
    [(UIColorPickerViewController *)colorPicker crl_ifVisuallyDifferentSetSelectedColor:self->_selectedColor];
    unsigned int v4 = self->_colorPicker;
    id v5 = [(CRLiOSPencilTrayColorWell *)self p_titleForColorPicker];
    [(UIColorPickerViewController *)v4 setTitle:v5];
  }
}

- (id)p_titleForColorPicker
{
  BOOL isForStrokeColor = self->_isForStrokeColor;
  unsigned int v3 = +[NSBundle mainBundle];
  unsigned int v4 = v3;
  if (isForStrokeColor) {
    CFStringRef v5 = @"Stroke Color";
  }
  else {
    CFStringRef v5 = @"Fill Color";
  }
  double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UITargetedPreview);
  double v6 = [v4 view];
  id v7 = [v5 initWithView:v6];

  id v8 = +[UIPointerHighlightEffect effectWithPreview:v7];
  double v9 = [v4 view];

  [v9 bounds];
  double v10 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  char v11 = +[UIPointerShape shapeWithPath:v10];

  v12 = +[UIPointerStyle styleWithEffect:v8 shape:v11];

  return v12;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [a5 rect:a3, a4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(CRLiOSPencilTrayColorWell *)self hitTestInsets];
  CGFloat v15 = v14;
  [(CRLiOSPencilTrayColorWell *)self hitTestInsets];
  CGFloat v17 = v16;
  v20.origin.CGFloat x = v7;
  v20.origin.CGFloat y = v9;
  v20.size.CGFloat width = v11;
  v20.size.CGFloat height = v13;
  CGRect v21 = CGRectInset(v20, v15, v17);

  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  double v8 = (UIColor *)a4;
  if (self->_colorPicker != a3)
  {
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D06F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F534(v9);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0718);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    CGFloat v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell colorPickerViewController:didSelectColor:continuously:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 310, 0, "expected equality between %{public}s and %{public}s", "viewController", "_colorPicker");
  }
  selectedColor = self->_selectedColor;
  self->_selectedColor = v8;

  self->_isUpdatingContinuouslCGFloat y = a5;
  [(CRLiOSPencilTrayColorWell *)self p_updateColorBulletView];
  [(CRLiOSPencilTrayColorWell *)self sendActionsForControlEvents:4096];
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v4 = (UIColorPickerViewController *)a3;
  if (self->_colorPicker != v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0738);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F688(v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0758);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    CGFloat v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell colorPickerViewControllerDidFinish:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 322, 0, "expected equality between %{public}s and %{public}s", "viewController", "_colorPicker");
  }
  if (self->_isUpdatingContinuously)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0778);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F5F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0798);
    }
    int v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell colorPickerViewControllerDidFinish:]");
    CGFloat v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:325 isFatal:0 description:"Color picker should not tell us it finished before telling us about the final color."];

    self->_isUpdatingContinuouslCGFloat y = 0;
    [(CRLiOSPencilTrayColorWell *)self sendActionsForControlEvents:4096];
  }
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (BOOL)isForStrokeColor
{
  return self->_isForStrokeColor;
}

- (BOOL)isUpdatingContinuously
{
  return self->_isUpdatingContinuously;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_strokeHoleMask, 0);
  objc_storeStrong((id *)&self->_colorBulletView, 0);

  objc_storeStrong((id *)&self->_rainbowBackgroundView, 0);
}

@end