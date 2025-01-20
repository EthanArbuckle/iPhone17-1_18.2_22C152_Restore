@interface IMCalloutBar
- (BOOL)up;
- (CGRect)dividerLineRectForControl:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsControls:(id)a3;
- (IMCalloutBar)initWithFrame:(CGRect)a3;
- (NSArray)controls;
- (double)arrowX;
- (id)newMaskView:(int64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArrowX:(double)a3;
- (void)setBlurDisabled:(BOOL)a3;
- (void)setControls:(id)a3;
- (void)setHighlighted:(BOOL)a3 forControl:(id)a4;
- (void)setUp:(BOOL)a3;
@end

@implementation IMCalloutBar

- (IMCalloutBar)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)IMCalloutBar;
  v3 = -[IMCalloutBar initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(IMCalloutBar *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc((Class)_UIBackdropView);
    [(IMCalloutBar *)v3 bounds];
    v6 = [v5 initWithFrame:2050];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v6;

    v8 = [(_UIBackdropView *)v3->_backgroundView layer];
    [v8 setAllowsGroupOpacity:0];

    v9 = [(_UIBackdropView *)v3->_backgroundView layer];
    [v9 setAllowsGroupBlending:0];

    if (objc_opt_respondsToSelector()) {
      [(_UIBackdropView *)v3->_backgroundView performSelector:"setDisablesOccludedBackdropBlurs:" withObject:0];
    }
    [(IMCalloutBar *)v3 bounds];
    -[_UIBackdropView setFrame:](v3->_backgroundView, "setFrame:");
    [(_UIBackdropView *)v3->_backgroundView setAutoresizingMask:18];
    [(IMCalloutBar *)v3 addSubview:v3->_backgroundView];
    v10 = (_UIBackdropView *)[objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2020];
    separatorBackgroundView = v3->_separatorBackgroundView;
    v3->_separatorBackgroundView = v10;

    v12 = [(_UIBackdropView *)v3->_separatorBackgroundView layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = [(_UIBackdropView *)v3->_separatorBackgroundView layer];
    [v13 setAllowsGroupBlending:0];

    [(IMCalloutBar *)v3 bounds];
    -[_UIBackdropView setFrame:](v3->_separatorBackgroundView, "setFrame:");
    [(_UIBackdropView *)v3->_separatorBackgroundView setAutoresizingMask:18];
    [(IMCalloutBar *)v3 addSubview:v3->_separatorBackgroundView];
    v14 = [(IMCalloutBar *)v3 newMaskView:4];
    blurMaskView = v3->_blurMaskView;
    v3->_blurMaskView = v14;

    v16 = [(IMCalloutBar *)v3 newMaskView:3];
    tintMaskView = v3->_tintMaskView;
    v3->_tintMaskView = v16;

    v18 = [(IMCalloutBar *)v3 newMaskView:7];
    separatorMaskView = v3->_separatorMaskView;
    v3->_separatorMaskView = v18;
  }
  return v3;
}

- (void)dealloc
{
  [(IMCalloutBar *)self setControls:0];
  v3.receiver = self;
  v3.super_class = (Class)IMCalloutBar;
  [(IMCalloutBar *)&v3 dealloc];
}

- (id)newMaskView:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)UIImageView);
  [v4 _setBackdropMaskViewFlags:a3];
  [v4 setAutoresizingMask:18];
  return v4;
}

- (void)setBlurDisabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[_UIBackdropViewSettings settingsForPrivateStyle:2050 graphicsQuality:10];
    [(_UIBackdropView *)self->_backgroundView transitionToSettings:v4];
    +[_UIBackdropViewSettings settingsForPrivateStyle:2020 graphicsQuality:10];
  }
  else
  {
    id v4 = +[_UIBackdropViewSettings settingsForPrivateStyle:2050];
    [(_UIBackdropView *)self->_backgroundView transitionToSettings:v4];
    +[_UIBackdropViewSettings settingsForPrivateStyle:2020];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIBackdropView *)self->_separatorBackgroundView transitionToSettings:v5];
}

- (void)setHighlighted:(BOOL)a3 forControl:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(IMCalloutBar *)self controls];
  v8 = (char *)[v7 indexOfObject:v6];

  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      [(IMCalloutBar *)self dividerLineRectForControl:v8];
      CGFloat v10 = v9;
      CGFloat v25 = v11;
      CGFloat v26 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v27 = v15;
      [(IMCalloutBar *)self dividerLineRectForControl:v8 - 1];
      CGFloat x = v29.origin.x;
      CGFloat y = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      CGFloat MaxX = CGRectGetMaxX(v29);
      v30.origin.CGFloat x = v10;
      v30.origin.CGFloat y = v12;
      v30.size.CGFloat width = v14;
      v30.size.CGFloat height = v27;
      double MinX = CGRectGetMinX(v30);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double v22 = MinX - CGRectGetMaxX(v31);
      v32.origin.CGFloat y = v25;
      v32.origin.CGFloat x = v26;
      v32.size.CGFloat width = v14;
      v32.size.CGFloat height = v27;
      CGFloat v23 = CGRectGetHeight(v32);
      CGFloat v24 = 0.0;
    }
    else
    {
      CGFloat MaxX = CGRectZero.origin.x;
      CGFloat v24 = CGRectZero.origin.y;
      double v22 = CGRectZero.size.width;
      CGFloat v23 = CGRectZero.size.height;
    }
    v33.origin.CGFloat x = MaxX;
    v33.origin.CGFloat y = v24;
    v33.size.CGFloat width = v22;
    v33.size.CGFloat height = v23;
    if (!CGRectEqualToRect(v33, self->_highlightRect))
    {
      self->_highlightRect.origin.CGFloat x = MaxX;
      self->_highlightRect.origin.CGFloat y = v24;
      self->_highlightRect.size.CGFloat width = v22;
      self->_highlightRect.size.CGFloat height = v23;
      [(IMCalloutBar *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v95.receiver = self;
  v95.super_class = (Class)IMCalloutBar;
  [(IMCalloutBar *)&v95 layoutSubviews];
  objc_super v3 = [(IMCalloutBar *)self controls];
  [(IMCalloutBar *)self sizeThatFitsControls:v3];
  double v5 = v4;

  [(IMCalloutBar *)self bounds];
  double Width = CGRectGetWidth(v100);
  v7 = [(IMCalloutBar *)self controls];
  id v8 = [v7 count];

  double v9 = [(IMCalloutBar *)self controls];
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    double v12 = (Width - v5) / (double)(unint64_t)(2 * (void)v8) + 6.0;
    double v13 = v12;
    do
    {
      CGFloat v14 = [(IMCalloutBar *)self controls];
      double v15 = [v14 objectAtIndex:v11];

      [v15 frame];
      double v17 = v16;
      double v18 = round(v13);
      if ([(IMCalloutBar *)self up]) {
        double v19 = 14.0;
      }
      else {
        double v19 = 0.0;
      }
      [v15 setFrame:v18, v19, v17, 38.0];
      v101.origin.CGFloat x = v18;
      v101.origin.double y = v19;
      v101.size.CGFloat width = v17;
      v101.size.CGFloat height = 38.0;
      double v20 = CGRectGetWidth(v101);
      objc_super v21 = +[UIScreen mainScreen];
      [v21 scale];
      double v13 = v13 + v20 + 1.0 / v22 + v12 * 2.0;

      ++v11;
      CGFloat v23 = [(IMCalloutBar *)self controls];
      id v24 = [v23 count];
    }
    while ((unint64_t)v24 > v11);
  }
  [(IMCalloutBar *)self bounds];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  double v30 = v29;
  CGFloat v32 = v31;
  double v33 = 0.0;
  v96.CGFloat width = v29;
  v96.CGFloat height = v31;
  UIGraphicsBeginImageContextWithOptions(v96, 0, 0.0);
  if ([(IMCalloutBar *)self up]) {
    double v33 = 14.0;
  }
  v34 = +[UIColor blackColor];
  [v34 set];

  v35 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v33, v30, 38.0, 8.0);
  [v35 fill];

  v36 = +[UIColor blackColor];
  [v36 set];

  if ([(IMCalloutBar *)self up]) {
    double v37 = 5.0;
  }
  else {
    double v37 = 38.0;
  }
  [(IMCalloutBar *)self arrowX];
  double v39 = v38;
  v102.origin.CGFloat x = v26;
  v102.origin.double y = v28;
  v102.size.CGFloat width = v30;
  v102.size.CGFloat height = v32;
  double v40 = CGRectGetWidth(v102) + -17.0;
  if (v39 < v40) {
    double v40 = v39;
  }
  double v41 = fmax(v40, 17.0);
  double v42 = round(v41 + -9.0);
  v43 = +[UIBezierPath bezierPath];
  if ([(IMCalloutBar *)self up])
  {
    [v43 moveToPoint:v41, v37];
    double v37 = v37 + 9.0;
  }
  else
  {
    [v43 moveToPoint:v41, v37 + 9.0];
  }
  [v43 addLineToPoint:v42, v37];
  [v43 addLineToPoint:v42 + 18.0, v37];
  [v43 closePath];
  [v43 fill];
  v44 = UIGraphicsGetImageFromCurrentImageContext();
  v45 = +[UIColor clearColor];
  [v45 set];

  v46 = [(IMCalloutBar *)self controls];
  v47 = (char *)[v46 count];

  if (v47 != (unsigned char *)&def_7D91C + 1)
  {
    unint64_t v48 = 0;
    do
    {
      [(IMCalloutBar *)self dividerLineRectForControl:v48];
      UIRectFillUsingBlendMode(v103, kCGBlendModeCopy);
      ++v48;
      v49 = [(IMCalloutBar *)self controls];
      v50 = (char *)[v49 count] - 1;
    }
    while (v48 < (unint64_t)v50);
  }
  v51 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v51 size];
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  [v51 scale];
  CGFloat v57 = v56;
  v97.CGFloat width = v53;
  v97.CGFloat height = v55;
  UIGraphicsBeginImageContextWithOptions(v97, 0, v57);
  double y = CGPointZero.y;
  [v51 drawAtPoint:CGPointZero.x blendMode:y alpha:1.0];
  v59 = +[UIColor blackColor];
  [v59 set];

  [v51 size];
  CGFloat v61 = v60;
  [v51 size];
  v104.size.CGFloat height = v62;
  v104.origin.CGFloat x = 0.0;
  v104.origin.double y = 0.0;
  v104.size.CGFloat width = v61;
  UIRectFillUsingBlendMode(v104, kCGBlendModeSourceOut);
  v63 = UIGraphicsGetImageFromCurrentImageContext();
  [(UIImageView *)self->_blurMaskView setImage:v63];

  [(UIImageView *)self->_blurMaskView sizeToFit];
  UIGraphicsEndImageContext();
  [(_UIBackdropView *)self->_backgroundView updateMaskViewsForView:self->_blurMaskView];
  [v51 size];
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  [v51 scale];
  CGFloat v69 = v68;
  v98.CGFloat width = v65;
  v98.CGFloat height = v67;
  UIGraphicsBeginImageContextWithOptions(v98, 0, v69);
  [v51 drawAtPoint:CGPointZero.x blendMode:y alpha:1.0];
  if (!CGRectIsEmpty(self->_highlightRect))
  {
    v70 = +[UIDevice currentDevice];
    v71 = (char *)[v70 _graphicsQuality];

    double v72 = 0.75;
    if (v71 != (unsigned char *)&dword_8 + 2) {
      double v72 = 0.4;
    }
    v73 = +[UIColor colorWithWhite:0.0 alpha:v72];
    [v73 set];

    UIRectFillUsingBlendMode(self->_highlightRect, kCGBlendModeSourceIn);
  }
  v74 = +[UIColor blackColor];
  [v74 set];

  [v51 size];
  CGFloat v76 = v75;
  [v51 size];
  v105.size.CGFloat height = v77;
  v105.origin.CGFloat x = 0.0;
  v105.origin.double y = 0.0;
  v105.size.CGFloat width = v76;
  UIRectFillUsingBlendMode(v105, kCGBlendModeSourceOut);
  v78 = UIGraphicsGetImageFromCurrentImageContext();
  [(UIImageView *)self->_tintMaskView setImage:v78];

  [(UIImageView *)self->_tintMaskView sizeToFit];
  UIGraphicsEndImageContext();
  [(_UIBackdropView *)self->_backgroundView updateMaskViewsForView:self->_tintMaskView];
  [v51 size];
  CGFloat v80 = v79;
  CGFloat v82 = v81;
  [v51 scale];
  CGFloat v84 = v83;
  v99.CGFloat width = v80;
  v99.CGFloat height = v82;
  UIGraphicsBeginImageContextWithOptions(v99, 0, v84);
  v85 = +[UIColor blackColor];
  [v85 set];

  v86 = [(IMCalloutBar *)self controls];
  v87 = (char *)[v86 count];

  if (v87 != (unsigned char *)&def_7D91C + 1)
  {
    unint64_t v88 = 0;
    do
    {
      [(IMCalloutBar *)self dividerLineRectForControl:v88];
      UIRectFillUsingBlendMode(v106, kCGBlendModeCopy);
      ++v88;
      v89 = [(IMCalloutBar *)self controls];
      v90 = (char *)[v89 count] - 1;
    }
    while (v88 < (unint64_t)v90);
  }
  [v44 drawAtPoint:CGPointZero.x blendMode:y alpha:1.0];
  [v51 size];
  CGFloat v92 = v91;
  [v51 size];
  v107.size.CGFloat height = v93;
  v107.origin.CGFloat x = 0.0;
  v107.origin.double y = 0.0;
  v107.size.CGFloat width = v92;
  UIRectFillUsingBlendMode(v107, kCGBlendModeSourceOut);
  v94 = UIGraphicsGetImageFromCurrentImageContext();
  [(UIImageView *)self->_separatorMaskView setImage:v94];

  [(UIImageView *)self->_separatorMaskView sizeToFit];
  UIGraphicsEndImageContext();
  [(_UIBackdropView *)self->_separatorBackgroundView updateMaskViewsForView:self->_separatorMaskView];
}

- (CGRect)dividerLineRectForControl:(int64_t)a3
{
  double v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  if (a3 < 0)
  {
    double v15 = 0.0;
  }
  else
  {
    id v8 = [(IMCalloutBar *)self controls];
    double v9 = (char *)[v8 count] - 1;

    if ((unint64_t)v9 <= a3)
    {
      [(IMCalloutBar *)self bounds];
      double v15 = v16;
    }
    else
    {
      id v10 = [(IMCalloutBar *)self controls];
      unint64_t v11 = [v10 objectAtIndex:a3];

      double v12 = [(IMCalloutBar *)self controls];
      double v13 = [v12 objectAtIndex:a3 + 1];

      [v13 frame];
      double MinX = CGRectGetMinX(v21);
      [v11 frame];
      double v15 = round((MinX + CGRectGetMaxX(v22) + -1.0) * 0.5);
    }
  }
  double v17 = 1.0 / v7;
  double v18 = 52.0;
  double v19 = v15;
  double v20 = 0.0;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = [(IMCalloutBar *)self controls];
  [(IMCalloutBar *)self sizeThatFitsControls:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)setControls:(id)a3
{
  double v5 = (NSArray *)a3;
  p_controls = &self->_controls;
  controls = self->_controls;
  if (controls != v5)
  {
    CGFloat v23 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v8 = controls;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v13 removeFromSuperview];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v13 setBar:0];
          }
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_controls, a3);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    CGFloat v14 = *p_controls;
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            [v20 setBar:self];
            CGRect v21 = [(NSArray *)*p_controls indexOfObject:v20];
            if (v21)
            {
              if (v21 == (char *)[(NSArray *)*p_controls count] - 1) {
                uint64_t v22 = 2;
              }
              else {
                uint64_t v22 = 1;
              }
            }
            else
            {
              uint64_t v22 = 0;
            }
            [v20 setPosition:v22];
          }
          [(IMCalloutBar *)self addSubview:v19];
        }
        id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }

    [(IMCalloutBar *)self setNeedsDisplay];
    double v5 = v23;
  }
}

- (CGSize)sizeThatFitsControls:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 12.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) frame];
        double v7 = v7 + CGRectGetWidth(v18);
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 12.0;
  }
  id v9 = [v3 count];

  double v10 = v7 + (double)((unint64_t)v9 - 1) * 13.0;
  double v11 = 52.0;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (double)arrowX
{
  return self->_arrowX;
}

- (void)setArrowX:(double)a3
{
  self->_arrowX = a3;
}

- (BOOL)up
{
  return self->_up;
}

- (void)setUp:(BOOL)a3
{
  self->_up = a3;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorMaskView, 0);
  objc_storeStrong((id *)&self->_tintMaskView, 0);
  objc_storeStrong((id *)&self->_blurMaskView, 0);
  objc_storeStrong((id *)&self->_separatorBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_controls, 0);
}

@end