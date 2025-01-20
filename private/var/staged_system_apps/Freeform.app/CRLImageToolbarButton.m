@interface CRLImageToolbarButton
+ (id)imageSymbolConfigurationWithScale:(int64_t)a3;
- (BOOL)isLandscapePhone;
- (BOOL)isOn;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldRemoveTrailingPadding;
- (BOOL)showsLargeContentViewer;
- (CRLImageToolbarButton)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImage)landscapeImagePhone;
- (double)additionalLeftPaddingForImageFrame:(CGRect)a3;
- (double)additionalRightPaddingForImageFrame:(CGRect)a3;
- (void)didChangeConfiguration;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setImage:(id)a3;
- (void)setImageNamed:(id)a3;
- (void)setLandscapePhone:(BOOL)a3;
- (void)setOn:(BOOL)a3;
- (void)setShouldRemoveTrailingPadding:(BOOL)a3;
- (void)setTintAdjustmentMode:(int64_t)a3;
- (void)tintColorDidChange;
- (void)updateBackgroundViewColor;
- (void)updateForCurrentTraitCollection;
- (void)updateForTraitCollection:(id)a3;
@end

@implementation CRLImageToolbarButton

- (CRLImageToolbarButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRLImageToolbarButton;
  v3 = -[CRLImageToolbarButton initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CRLImageToolbarButton *)v3 setExclusiveTouch:1];
    [(CRLImageToolbarButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(CRLImageToolbarButton *)v4 imageView];
    [v5 setContentMode:1];

    [(CRLImageToolbarButton *)v4 setPointerStyleProvider:&stru_1014CD210];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:v10 count:2];
    id v7 = [(CRLImageToolbarButton *)v4 registerForTraitChanges:v6 withAction:"updateForCurrentTraitCollection"];
  }
  return v4;
}

- (void)setTintAdjustmentMode:(int64_t)a3
{
  if (a3 == 1) {
    a3 = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  [(CRLImageToolbarButton *)&v3 setTintAdjustmentMode:a3];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD230);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068E80();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD250);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setImage:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:64 isFatal:0 description:"nil image is set"];
  }
  if (([v4 isSymbolImage] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD270);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068DF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD290);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setImage:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:65 isFatal:0 description:"Only vector images are supported"];
  }
  if ([v4 isSymbolImage])
  {
    v11 = +[CRLImageToolbarButton imageSymbolConfigurationWithScale:3];
    v12 = [v4 imageWithConfiguration:v11];

    image = self->_image;
    if (image != v12 && ([(UIImage *)image isEqual:v12] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, v12);
      v14 = +[CRLImageToolbarButton imageSymbolConfigurationWithScale:2];
      v15 = [v4 imageWithConfiguration:v14];
      landscapeImagePhone = self->_landscapeImagePhone;
      self->_landscapeImagePhone = v15;

      [(CRLImageToolbarButton *)self didChangeConfiguration];
    }
  }
}

- (void)setImageNamed:(id)a3
{
  id v4 = a3;
  v5 = +[UIImage systemImageNamed:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[UIImage imageNamed:v4];
  }
  v8 = v7;

  if (([v8 isSymbolImage] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD2B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068F08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD2D0);
    }
    objc_super v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setImageNamed:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:84 isFatal:0 description:"Only vector images are supported"];
  }
  [(CRLImageToolbarButton *)self setImage:v8];
}

+ (id)imageSymbolConfigurationWithScale:(int64_t)a3
{
  objc_super v3 = +[UIImageSymbolConfiguration configurationWithScale:a3];
  id v4 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryLarge];
  v5 = [v3 configurationWithTraitCollection:v4];

  return v5;
}

- (void)setLandscapePhone:(BOOL)a3
{
  if (self->_landscapePhone != a3)
  {
    self->_landscapePhone = a3;
    [(CRLImageToolbarButton *)self didChangeConfiguration];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  [(CRLImageToolbarButton *)&v3 didMoveToWindow];
  [(CRLImageToolbarButton *)self updateForCurrentTraitCollection];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  [(CRLImageToolbarButton *)&v3 didMoveToSuperview];
  [(CRLImageToolbarButton *)self updateForCurrentTraitCollection];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  [(CRLImageToolbarButton *)&v3 tintColorDidChange];
  if (self->_onBackgroundView) {
    [(CRLImageToolbarButton *)self updateBackgroundViewColor];
  }
}

- (void)updateForCurrentTraitCollection
{
  id v3 = [(CRLImageToolbarButton *)self traitCollection];
  [(CRLImageToolbarButton *)self updateForTraitCollection:v3];
}

- (void)updateForTraitCollection:(id)a3
{
  id v5 = a3;
  if ([v5 userInterfaceIdiom]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [v5 verticalSizeClass] == (id)1;
  }
  [(CRLImageToolbarButton *)self setLandscapePhone:v4];
}

- (void)didChangeConfiguration
{
  if (self->_landscapePhone)
  {
    id v3 = self->_landscapeImagePhone;
    double v4 = 32.0;
    if (v3) {
      goto LABEL_16;
    }
  }
  else
  {
    double v4 = 44.0;
  }
  image = self->_image;
  if (!image)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD2F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101069018();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD310);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton didChangeConfiguration]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:141 isFatal:0 description:"Don't have an image to use"];

    image = self->_image;
  }
  id v3 = image;
LABEL_16:
  [(UIImage *)v3 size];
  double v10 = v9;
  double v12 = v11;
  double v13 = v9 + 11.0 + 11.0;
  double v14 = (v4 - v11) * 0.5;
  if (!self->_on) {
    goto LABEL_29;
  }
  if (!self->_landscapePhone) {
    goto LABEL_52;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CD330);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101068F90();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CD350);
  }
  v15 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v15);
  }
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton didChangeConfiguration]");
  v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"];

  if (self->_on)
  {
LABEL_52:
    if (self->_onBackgroundView) {
      goto LABEL_32;
    }
    +[UIPointerInteraction crl_toolbarRoundedRectWidth];
    double v19 = v18;
    +[UIPointerInteraction crl_toolbarRoundedRectHeight];
    double v21 = v20;
    +[UIPointerInteraction crl_toolbarRoundedRectCornerRadius];
    double v23 = v22;
    v24 = (UIView *)objc_opt_new();
    onBackgroundView = self->_onBackgroundView;
    self->_onBackgroundView = v24;

    [(UIView *)self->_onBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_onBackgroundView setUserInteractionEnabled:0];
    v26 = [(UIView *)self->_onBackgroundView layer];
    [v26 setCornerRadius:v23];

    [(CRLImageToolbarButton *)self updateBackgroundViewColor];
    v27 = [(CRLImageToolbarButton *)self imageView];
    [(CRLImageToolbarButton *)self insertSubview:self->_onBackgroundView belowSubview:v27];
    v58 = [(UIView *)self->_onBackgroundView widthAnchor];
    v57 = [v58 constraintEqualToConstant:v19];
    v61[0] = v57;
    v56 = [(UIView *)self->_onBackgroundView heightAnchor];
    v55 = [v56 constraintEqualToConstant:v21];
    v61[1] = v55;
    v28 = [(UIView *)self->_onBackgroundView centerXAnchor];
    v29 = [(CRLImageToolbarButton *)self centerXAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-0.5];
    v61[2] = v30;
    v31 = [(UIView *)self->_onBackgroundView centerYAnchor];
    v32 = [(CRLImageToolbarButton *)self centerYAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:-0.5];
    v61[3] = v33;
    v34 = +[NSArray arrayWithObjects:v61 count:4];
    +[NSLayoutConstraint activateConstraints:v34];
  }
  else
  {
LABEL_29:
    v35 = self->_onBackgroundView;
    if (!v35) {
      goto LABEL_32;
    }
    [(UIView *)v35 removeFromSuperview];
    v27 = self->_onBackgroundView;
    self->_onBackgroundView = 0;
  }

LABEL_32:
  +[UIScreen crl_screenScale];
  double v37 = v36;
  double v38 = sub_1000674C4(11.0, v36);
  double v39 = sub_1000674C4(v14, v37);
  -[CRLImageToolbarButton additionalLeftPaddingForImageFrame:](self, "additionalLeftPaddingForImageFrame:", v38, v39, v10, v12);
  double v41 = v40;
  -[CRLImageToolbarButton additionalRightPaddingForImageFrame:](self, "additionalRightPaddingForImageFrame:", v38, v39, v10, v12);
  double v43 = v13 + v41 + v42;
  double v44 = v38 + v41;
  v62.origin.x = v44;
  v62.origin.y = v39;
  v62.size.width = v10;
  v62.size.height = v12;
  double MaxY = CGRectGetMaxY(v62);
  v63.origin.x = v44;
  v63.origin.y = v39;
  v63.size.width = v10;
  v63.size.height = v12;
  double v46 = v43 - CGRectGetMaxX(v63);
  if (self->_shouldRemoveTrailingPadding)
  {
    if ([(CRLImageToolbarButton *)self effectiveUserInterfaceLayoutDirection]) {
      double v44 = v44 + -11.0;
    }
    else {
      double v46 = v46 + -11.0;
    }
  }
  v47 = [(CRLImageToolbarButton *)self imageForState:0];

  if (v3 != v47)
  {
    v60.receiver = self;
    v60.super_class = (Class)CRLImageToolbarButton;
    [(CRLImageToolbarButton *)&v60 setImage:v3 forState:0];
  }
  [(CRLImageToolbarButton *)self crl_deprecatedContentEdgeInsets];
  if (v44 != v51 || v39 != v48 || v46 != v50 || v4 - MaxY != v49)
  {
    v59.receiver = self;
    v59.super_class = (Class)CRLImageToolbarButton;
    -[CRLImageToolbarButton setContentEdgeInsets:](&v59, "setContentEdgeInsets:", v39, v44, v4 - MaxY, v46);
  }
}

- (void)updateBackgroundViewColor
{
  id v6 = [(CRLImageToolbarButton *)self tintColor];
  id v3 = [v6 colorWithAlphaComponent:0.3];
  id v4 = [v3 CGColor];
  id v5 = [(UIView *)self->_onBackgroundView layer];
  [v5 setBackgroundColor:v4];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CD370);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v13 = v3;
    __int16 v14 = 2082;
    v15 = "-[CRLImageToolbarButton setContentEdgeInsets:]";
    __int16 v16 = 2082;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m";
    __int16 v18 = 1024;
    int v19 = 234;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CD390);
  }
  id v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    id v7 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v13 = v3;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setContentEdgeInsets:]");
  double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"];
  +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:234 isFatal:0 description:"Do not call method"];

  double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLImageToolbarButton setContentEdgeInsets:]");
  id v11 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003C7BC;
    v3[3] = &unk_1014CD3B8;
    v3[4] = self;
    BOOL v4 = a3;
    +[UIView performWithoutAnimation:v3];
  }
}

- (double)additionalLeftPaddingForImageFrame:(CGRect)a3
{
  return 0.0;
}

- (double)additionalRightPaddingForImageFrame:(CGRect)a3
{
  return 0.0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CRLImageToolbarButton *)self bounds];
  double v8 = v7 + -4.0;
  double v10 = v9 + 0.0;
  double v12 = v11 + 8.0;
  CGFloat v13 = x;
  CGFloat v14 = y;

  return CGRectContainsPoint(*(CGRect *)&v8, *(CGPoint *)&v13);
}

- (void)setShouldRemoveTrailingPadding:(BOOL)a3
{
  if (self->_shouldRemoveTrailingPadding != a3)
  {
    self->_shouldRemoveTrailingPadding = a3;
    [(CRLImageToolbarButton *)self didChangeConfiguration];
  }
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)landscapeImagePhone
{
  return self->_landscapeImagePhone;
}

- (BOOL)isLandscapePhone
{
  return self->_landscapePhone;
}

- (BOOL)isOn
{
  return self->_on;
}

- (BOOL)shouldRemoveTrailingPadding
{
  return self->_shouldRemoveTrailingPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeImagePhone, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_onBackgroundView, 0);
}

@end