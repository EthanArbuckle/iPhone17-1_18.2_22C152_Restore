@interface _UIScrollViewGradientMaskView
+ (Class)layerClass;
- (UIEdgeInsets)gradientEndInsets;
- (UIEdgeInsets)gradientIntensities;
- (UIEdgeInsets)gradientStartInsets;
- (_UIScrollViewGradientMaskView)initWithFrame:(CGRect)a3;
- (int64_t)gradientDirection;
- (void)setGradientDirection:(int64_t)a3;
- (void)setGradientEndInsets:(UIEdgeInsets)a3;
- (void)setGradientIntensities:(UIEdgeInsets)a3;
- (void)setGradientStartInsets:(UIEdgeInsets)a3;
- (void)updateWithFrame:(double)a3 gradientStartInsets:(double)a4 gradientEndInsets:(double)a5 gradientIntensities:(double)a6;
@end

@implementation _UIScrollViewGradientMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIScrollViewGradientMaskView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIScrollViewGradientMaskView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UIView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)updateWithFrame:(double)a3 gradientStartInsets:(double)a4 gradientEndInsets:(double)a5 gradientIntensities:(double)a6
{
  uint64_t v31 = a1[51];
  [a1 frame];
  double v107 = a6;
  BOOL v41 = v33 == a6;
  double v34 = a5;
  int v35 = !v41;
  if (v31) {
    BOOL v36 = v32 != a5;
  }
  else {
    BOOL v36 = v35;
  }
  [a1 gradientStartInsets];
  double v105 = a9;
  BOOL v41 = a8 == v40 && a7 == v37;
  double v106 = a10;
  if (!v41 || a10 != v39 || a9 != v38)
  {
    double v44 = a11;
    double v45 = a13;
    double v46 = a12;
    int v47 = 1;
    double v48 = a14;
LABEL_29:
    double v56 = a18;
    goto LABEL_37;
  }
  [a1 gradientEndInsets];
  double v46 = a12;
  double v44 = a11;
  BOOL v54 = a12 == v52 && a11 == v49 && a14 == v51;
  double v45 = a13;
  BOOL v55 = v54 && a13 == v50;
  double v48 = a14;
  if (!v55)
  {
    int v47 = 1;
    goto LABEL_29;
  }
  objc_msgSend(a1, "gradientIntensities", a14);
  BOOL v60 = a17 != v59;
  double v56 = a18;
  if (a18 != v61) {
    BOOL v60 = 1;
  }
  if (a15 != v57) {
    BOOL v60 = 1;
  }
  int v47 = a16 != v58 || v60;
LABEL_37:
  objc_msgSend(a1, "setFrame:", a3, a4, v34, v107);
  objc_msgSend(a1, "setGradientStartInsets:", a7, a8, v105, v106);
  objc_msgSend(a1, "setGradientEndInsets:", v44, v46, v45, v48);
  objc_msgSend(a1, "setGradientIntensities:", a15, a16, a17, v56);
  if ((v36 | v47) == 1)
  {
    double v62 = v34;
    BOOL v63 = v45 <= 0.0 && v44 <= 0.0;
    a1[51] = v63;
    if (!v63 && (v46 > 0.0 || v48 > 0.0)) {
      NSLog(&cfstr_Uiscrollviewgr.isa);
    }
    v64 = objc_opt_new();
    v65 = objc_opt_new();
    [a1 gradientIntensities];
    double v67 = v66;
    [a1 gradientIntensities];
    double v69 = v68;
    [a1 gradientStartInsets];
    double v71 = v70;
    [a1 gradientEndInsets];
    double v73 = v72;
    [a1 gradientStartInsets];
    double v75 = v74;
    [a1 gradientEndInsets];
    double v77 = v107;
    if (a1[51])
    {
      [a1 gradientIntensities];
      double v67 = v78;
      [a1 gradientIntensities];
      double v69 = v79;
      [a1 gradientStartInsets];
      double v71 = v80;
      [a1 gradientEndInsets];
      double v73 = v81;
      [a1 gradientStartInsets];
      double v75 = v82;
      [a1 gradientEndInsets];
      double v84 = v83;
      double v77 = v62;
    }
    else
    {
      double v84 = v76;
    }
    id v85 = +[UIColor blackColor];
    v86 = [v85 CGColor];

    id v87 = +[UIColor colorWithWhite:0.0 alpha:0.0];
    v88 = [v87 CGColor];

    id v89 = +[UIColor colorWithWhite:0.0 alpha:1.0 - v67];
    v90 = [v89 CGColor];

    id v91 = +[UIColor colorWithWhite:0.0 alpha:1.0 - v69];
    v92 = [v91 CGColor];

    if (v77 > 0.0)
    {
      if (v73 <= 0.0)
      {
        [v64 addObject:&unk_1ED3F74B8];
      }
      else
      {
        [v64 addObject:&unk_1ED3F74B8];
        if (v71 > 0.0)
        {
          [v65 addObject:v88];
          v93 = [NSNumber numberWithDouble:v71 / v77];
          [v64 addObject:v93];
        }
        [v65 addObject:v90];
        v94 = [NSNumber numberWithDouble:v73 / v77];
        [v64 addObject:v94];
      }
      [v65 addObject:v86];
      v95 = v86;
      if (v84 > 0.0)
      {
        v96 = [NSNumber numberWithDouble:(v77 - v84) / v77];
        [v64 addObject:v96];

        [v65 addObject:v86];
        v95 = v92;
        if (v75 > 0.0)
        {
          v97 = [NSNumber numberWithDouble:(v77 - v75) / v77];
          [v64 addObject:v97];

          [v65 addObject:v92];
          v95 = v88;
        }
      }
      [v64 addObject:&unk_1ED3F74D0];
      [v65 addObject:v95];
    }
    uint64_t v98 = [v64 count];
    if (v98 != [v65 count])
    {
      v101 = [MEMORY[0x1E4F28B00] currentHandler];
      [v101 handleFailureInMethod:a2 object:a1 file:@"_UIScrollViewGradientMaskView.m" lineNumber:147 description:@"Bug in _UIScrollViewGradientMaskView: different number of gradient stops and colors"];
    }
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __107___UIScrollViewGradientMaskView_updateWithFrame_gradientStartInsets_gradientEndInsets_gradientIntensities___block_invoke;
    v108[3] = &unk_1E52DCB30;
    v108[4] = a1;
    id v109 = v65;
    id v110 = v64;
    id v99 = v64;
    id v100 = v65;
    +[UIView performWithoutAnimation:v108];
  }
}

- (UIEdgeInsets)gradientStartInsets
{
  double top = self->_gradientStartInsets.top;
  double left = self->_gradientStartInsets.left;
  double bottom = self->_gradientStartInsets.bottom;
  double right = self->_gradientStartInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientStartInsets:(UIEdgeInsets)a3
{
  self->_gradientStartInsets = a3;
}

- (UIEdgeInsets)gradientEndInsets
{
  double top = self->_gradientEndInsets.top;
  double left = self->_gradientEndInsets.left;
  double bottom = self->_gradientEndInsets.bottom;
  double right = self->_gradientEndInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientEndInsets:(UIEdgeInsets)a3
{
  self->_gradientEndInsets = a3;
}

- (UIEdgeInsets)gradientIntensities
{
  double top = self->_gradientIntensities.top;
  double left = self->_gradientIntensities.left;
  double bottom = self->_gradientIntensities.bottom;
  double right = self->_gradientIntensities.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientIntensities:(UIEdgeInsets)a3
{
  self->_gradientIntensities = a3;
}

- (int64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (void)setGradientDirection:(int64_t)a3
{
  self->_gradientDirection = a3;
}

@end