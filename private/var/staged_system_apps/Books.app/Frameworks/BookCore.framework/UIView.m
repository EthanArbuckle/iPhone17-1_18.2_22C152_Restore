@interface UIView
+ (void)bc_animateWithDelay:(double)a3 springAnimation:(id)a4 options:(unint64_t)a5 animations:(id)a6 completion:(id)a7;
- (BOOL)im_isCompactHeight;
- (BOOL)im_isCompactWidth;
- (BOOL)im_isPartialScreen;
- (BOOL)im_isStyleDark;
- (BOOL)isViewSizeFullScreenInWindow:(id)a3 ignoreInWindowCheck:(BOOL)a4;
- (CGRect)adjustRectCenter:(CGRect)a3 fromView:(id)a4;
- (CGRect)imaxFrameFromBounds:(CGRect)a3;
- (CGRect)imaxFrameToBounds:(CGRect)a3;
- (NSArray)bc_constraintsToFillSuperview;
- (NSArray)bc_constraintsToFitInSuperviewCentered;
- (UIColor)debugingBorderColor;
- (double)imaxScreenScale;
- (id)bc_ancestorOfClass:(Class)a3;
- (id)findFirstResponder;
- (id)im_snapshot;
- (id)im_snapshotAfterScreenUpdates:(BOOL)a3;
- (id)im_snapshotInContext;
- (id)imaxParentAnnotationPopoverViewController;
- (id)subviewOfClass:(Class)a3;
- (void)attachPopUpAnimation;
- (void)debugHighlightView;
- (void)debugHighlightViewBlue;
- (void)debugHighlightViewWithColor:(id)a3 width:(double)a4;
- (void)imaxSetParentAnnotationPopoverViewController:(id)a3;
- (void)printResponderChain;
- (void)setDebugingBorderColor:(id)a3;
- (void)setRoundedCorners:(int64_t)a3 radius:(double)a4;
@end

@implementation UIView

- (CGRect)imaxFrameFromBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIView *)self window];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  [v8 convertRect:0 toWindow:];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)imaxFrameToBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIView *)self window];
  [v8 convertRect:0 fromWindow:x y:y width:width height:height];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v8);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (double)imaxScreenScale
{
  v2 = [(UIView *)self window];
  v3 = [v2 screen];
  [v3 scale];
  double v5 = v4;

  return v5;
}

- (void)debugHighlightView
{
  id v3 = +[UIColor redColor];
  [(UIView *)self debugHighlightViewWithColor:v3 width:2.0];
}

- (void)debugHighlightViewBlue
{
  id v3 = +[UIColor blueColor];
  [(UIView *)self debugHighlightViewWithColor:v3 width:2.0];
}

- (void)debugHighlightViewWithColor:(id)a3 width:(double)a4
{
  id v6 = a3;
  id v7 = [v6 CGColor];
  v8 = [(UIView *)self layer];
  [v8 setBorderColor:v7];

  double v9 = [(UIView *)self layer];
  [v9 setBorderWidth:a4];

  double v10 = [(UIView *)self layer];
  [v10 setCornerRadius:4.0];

  double v11 = [v6 colorWithAlphaComponent:0.3];

  id v14 = v11;
  id v12 = [v14 CGColor];
  double v13 = [(UIView *)self layer];
  [v13 setBackgroundColor:v12];
}

- (id)im_snapshotInContext
{
  [(UIView *)self bounds];
  if (v3 <= 0.0 || (double v5 = v4, v4 <= 0.0))
  {
    double v19 = BCIMLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = (UIView *)"-[UIView(IMAdditions) im_snapshotInContext]";
      __int16 v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/UIView+IMAdditions.m";
      __int16 v26 = 1024;
      int v27 = 117;
      _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    id v7 = BCIMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "@\"Snapshotting a CGSizeZero view: %@\"", buf, 0xCu);
    }
    double v18 = 0;
  }
  else
  {
    double v6 = v3;
    id v7 = +[UIGraphicsImageRendererFormat preferredFormat];
    [v7 scale];
    double v9 = v8;
    double v10 = +[UIScreen mainScreen];
    [v10 bounds];
    double v12 = CGSizeScaleToScreen(v11);
    double v14 = v13;

    if (v12 < v6 || v14 < v5)
    {
      CGSizeScaleThatFitsInCGSize();
      double v9 = v16;
    }
    [v7 setScale:v9];
    id v17 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v7 format:v6];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_7E7C4;
    v21[3] = &unk_2C6FF0;
    v21[4] = self;
    double v18 = [v17 imageWithActions:v21];
  }

  return v18;
}

- (id)im_snapshot
{
  return [(UIView *)self im_snapshotAfterScreenUpdates:1];
}

- (id)im_snapshotAfterScreenUpdates:(BOOL)a3
{
  [(UIView *)self bounds];
  if (v5 <= 0.0 || (double v7 = v6, v6 <= 0.0))
  {
    double v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v17 = (UIView *)"-[UIView(IMAdditions) im_snapshotAfterScreenUpdates:]";
      __int16 v18 = 2080;
      double v19 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/UIView+IMAdditions.m";
      __int16 v20 = 1024;
      int v21 = 143;
      _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    double v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = self;
      _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_INFO, "@\"Snapshotting a CGSizeZero view: %@\"", buf, 0xCu);
    }
    double v11 = 0;
  }
  else
  {
    double v8 = v5;
    double v9 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v10 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v9 format:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_7EA3C;
    v14[3] = &unk_2C7018;
    v14[4] = self;
    BOOL v15 = a3;
    double v11 = [v10 imageWithActions:v14];
  }

  return v11;
}

- (id)subviewOfClass:(Class)a3
{
  [(UIView *)self subviews];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v4);
      }
      double v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v9;

    if (v10) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) subviewOfClass:a3];
        if (v16)
        {
          id v10 = (id)v16;
          goto LABEL_21;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_21:

LABEL_22:

  return v10;
}

- (id)bc_ancestorOfClass:(Class)a3
{
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    id v4 = (void *)v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v4 superview];

      id v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (id)findFirstResponder
{
  if ([(UIView *)self isFirstResponder])
  {
    uint64_t v3 = self;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(UIView *)self subviews];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) findFirstResponder];
          if (v9)
          {
            uint64_t v3 = (UIView *)v9;

            goto LABEL_13;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v3 = 0;
  }
LABEL_13:

  return v3;
}

- (void)printResponderChain
{
  v2 = self;
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 1;
    do
    {
      id v5 = [v3 description];
      id v6 = (const char *)[v5 cStringUsingEncoding:30];

      printf("%lu. %s\n", v4++, v6);
      uint64_t v7 = [v3 nextResponder];

      uint64_t v3 = (void *)v7;
    }
    while (v7);
  }
}

- (void)setRoundedCorners:(int64_t)a3 radius:(double)a4
{
  char v4 = a3;
  [(UIView *)self bounds];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  CGFloat MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v31);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, MinX, MidY);
  if (v4) {
    double v16 = a4;
  }
  else {
    double v16 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, v16);
  if ((v4 & 2) != 0) {
    double v17 = a4;
  }
  else {
    double v17 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, v17);
  if ((v4 & 8) != 0) {
    double v18 = a4;
  }
  else {
    double v18 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MidX, MaxY, v18);
  if ((v4 & 4) != 0) {
    double v19 = a4;
  }
  else {
    double v19 = 0.0;
  }
  CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MidY, v19);
  CGPathCloseSubpath(Mutable);
  id v24 = objc_alloc_init((Class)CAShapeLayer);
  [v24 setPath:Mutable];
  long long v20 = [(UIView *)self layer];
  [v20 setMask:0];

  long long v21 = [(UIView *)self layer];
  [v21 setMask:v24];

  CFRelease(Mutable);
}

- (void)attachPopUpAnimation
{
  uint64_t v3 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  memset(&v22, 0, sizeof(v22));
  CATransform3DMakeScale(&v22, 0.5, 0.5, 1.0);
  memset(&v21, 0, sizeof(v21));
  CATransform3DMakeScale(&v21, 1.2, 1.2, 1.0);
  memset(&v20, 0, sizeof(v20));
  CATransform3DMakeScale(&v20, 0.9, 0.9, 1.0);
  memset(&v19, 0, sizeof(v19));
  CATransform3DMakeScale(&v19, 1.0, 1.0, 1.0);
  CATransform3D v18 = v22;
  char v4 = +[NSValue valueWithCATransform3D:&v18];
  CATransform3D v18 = v21;
  id v5 = +[NSValue valueWithCATransform3D:&v18];
  CATransform3D v18 = v20;
  id v6 = +[NSValue valueWithCATransform3D:&v18];
  CATransform3D v18 = v19;
  uint64_t v7 = +[NSValue valueWithCATransform3D:&v18];
  uint64_t v8 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, v6, v7, 0);

  [v3 setValues:v8];
  uint64_t v9 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v10) = 0.5;
  long long v11 = +[NSNumber numberWithFloat:v10];
  LODWORD(v12) = 1063675494;
  long long v13 = +[NSNumber numberWithFloat:v12];
  LODWORD(v14) = 1.0;
  BOOL v15 = +[NSNumber numberWithFloat:v14];
  double v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v11, v13, v15, 0);

  [v3 setKeyTimes:v16];
  [v3 setFillMode:kCAFillModeForwards];
  [v3 setRemovedOnCompletion:0];
  [v3 setDuration:0.2];
  double v17 = [(UIView *)self layer];
  [v17 addAnimation:v3 forKey:@"popup"];
}

- (UIColor)debugingBorderColor
{
  v2 = [(UIView *)self layer];
  uint64_t v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 borderColor]);

  return (UIColor *)v3;
}

- (void)setDebugingBorderColor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 CGColor];
  id v6 = [(UIView *)self layer];
  [v6 setBorderColor:v5];

  if (v4) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = [(UIView *)self layer];
  [v8 setBorderWidth:v7];
}

- (BOOL)isViewSizeFullScreenInWindow:(id)a3 ignoreInWindowCheck:(BOOL)a4
{
  id v6 = a3;
  [(UIView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  if (v6)
  {
    double v13 = v7;
    double v14 = v8;
    BOOL v15 = [(UIView *)self window];

    if (v15)
    {
      -[UIView convertRect:toView:](self, "convertRect:toView:", v6, v13, v14, v10, v12);
      [v6 convertRect:0 toWindow:0];
      double v10 = v16;
      double v12 = v17;
    }
    CATransform3D v18 = [v6 screen];
  }
  else
  {
    CATransform3D v18 = +[UIScreen mainScreen];
  }
  CATransform3D v19 = v18;
  [v18 bounds];
  double v21 = v20;
  double v23 = v22;

  BOOL v24 = v12 == v23 && v10 == v21;
  if (v24 || a4)
  {
    if (v24)
    {
      char v26 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    long long v25 = [(UIView *)self window];

    if (v25)
    {
      char v26 = 0;
      goto LABEL_18;
    }
  }
  char v26 = v10 == v23 && v12 == v21;
LABEL_18:

  return v26;
}

- (BOOL)im_isCompactWidth
{
  [(UIView *)self traitCollection];

  uint64_t v3 = [(UIView *)self traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] == (char *)&def_7D91C + 1;

  return v4;
}

- (BOOL)im_isCompactHeight
{
  [(UIView *)self traitCollection];

  uint64_t v3 = [(UIView *)self traitCollection];
  BOOL v4 = [v3 verticalSizeClass] == (char *)&def_7D91C + 1;

  return v4;
}

- (BOOL)im_isPartialScreen
{
  v2 = [(UIView *)self window];
  if (!v2)
  {
    v2 = +[UIWindow _applicationKeyWindow];
    if (!v2) {
      return 0;
    }
  }
  uint64_t v3 = [v2 screen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [v2 screen];
  [v8 bounds];
  double v10 = v9;

  double v11 = [v2 screen];
  [v11 bounds];
  double v13 = v12;

  [v2 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [v2 screen];
  [v22 bounds];
  if (vabdd_f64(v15, v26) >= 0.00999999978
    || vabdd_f64(v17, v23) >= 0.00999999978
    || vabdd_f64(v19, v24) >= 0.00999999978
    || vabdd_f64(v21, v25) >= 0.00999999978)
  {
    [v2 bounds];
    BOOL v27 = vabdd_f64(v31, v5) >= 0.00999999978
       || vabdd_f64(v28, v7) >= 0.00999999978
       || vabdd_f64(v29, v10) >= 0.00999999978
       || vabdd_f64(v30, v13) >= 0.00999999978;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (NSArray)bc_constraintsToFillSuperview
{
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [(UIView *)self superview];
  double v17 = [(UIView *)self topAnchor];
  double v16 = [v3 topAnchor];
  double v15 = [v17 constraintEqualToAnchor:v16];
  v18[0] = v15;
  double v4 = [(UIView *)self bottomAnchor];
  double v5 = [v3 bottomAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];
  v18[1] = v6;
  double v7 = [(UIView *)self leadingAnchor];
  double v8 = [v3 leadingAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  v18[2] = v9;
  double v10 = [(UIView *)self trailingAnchor];
  double v11 = [v3 trailingAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v18[3] = v12;
  id v14 = +[NSArray arrayWithObjects:v18 count:4];

  return (NSArray *)v14;
}

- (NSArray)bc_constraintsToFitInSuperviewCentered
{
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [(UIView *)self superview];
  double v31 = [(UIView *)self topAnchor];
  double v30 = [v3 topAnchor];
  double v29 = [v31 constraintLessThanOrEqualToAnchor:v30];
  v39[0] = v29;
  double v4 = [(UIView *)self bottomAnchor];
  double v5 = [v3 bottomAnchor];
  double v6 = [v4 constraintLessThanOrEqualToAnchor:v5];
  v39[1] = v6;
  double v7 = [(UIView *)self leadingAnchor];
  double v8 = [v3 leadingAnchor];
  double v9 = [v7 constraintLessThanOrEqualToAnchor:v8];
  v39[2] = v9;
  double v10 = [(UIView *)self trailingAnchor];
  v32 = v3;
  double v11 = [v3 trailingAnchor];
  double v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
  v39[3] = v12;
  double v28 = +[NSArray arrayWithObjects:v39 count:4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = v28;
  id v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    id v16 = v14;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v13);
        }
        LODWORD(v15) = 1147207680;
        [*(id *)(*((void *)&v33 + 1) + 8 * i) setPriority:v15];
      }
      id v16 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v16);
  }

  double v19 = [(UIView *)self centerXAnchor];
  double v20 = [v32 centerXAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  v37[0] = v21;
  double v22 = [(UIView *)self centerYAnchor];
  double v23 = [v32 centerYAnchor];
  double v24 = [v22 constraintEqualToAnchor:v23];
  v37[1] = v24;
  double v25 = +[NSArray arrayWithObjects:v37 count:2];
  double v26 = [v13 arrayByAddingObjectsFromArray:v25];

  return (NSArray *)v26;
}

- (CGRect)adjustRectCenter:(CGRect)a3 fromView:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v22);
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, MidX, MidY);
  double v13 = v12;
  double v15 = v14;

  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;

  return CGRectOffset(*(CGRect *)&v16, v13 - MidX, v15 - MidY);
}

- (BOOL)im_isStyleDark
{
  v2 = [(UIView *)self traitCollection];
  unsigned __int8 v3 = [v2 bc_userInterfaceStyleDark];

  return v3;
}

+ (void)bc_animateWithDelay:(double)a3 springAnimation:(id)a4 options:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  CGFloat v16 = objc_alloc_init(_BCCustomAnimationCurveFactory);
  [(_BCCustomAnimationCurveFactory *)v16 setSpringAnimation:v13];
  [v13 settlingDuration];
  double v15 = v14;

  +[UIView _animateWithDuration:a5 | 0x60000 delay:v16 options:v12 factory:v11 animations:v15 completion:a3];
}

- (id)imaxParentAnnotationPopoverViewController
{
  return __IMAccessibilityGetAssociatedObject(self, &unk_349600);
}

- (void)imaxSetParentAnnotationPopoverViewController:(id)a3
{
}

@end