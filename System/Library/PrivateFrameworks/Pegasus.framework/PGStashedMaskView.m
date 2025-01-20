@interface PGStashedMaskView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_mainBodyBounds;
- (CGRect)tabViewBounds;
- (CGSize)minimumStashTabSize;
- (PGStashedMaskView)initWithFrame:(CGRect)a3;
- (PGStashedMaskView)initWithFrame:(CGRect)a3 minimumStashTabSize:(CGSize)a4;
- (UIView)tabShadowView;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setMinimumStashTabSize:(CGSize)a3;
- (void)setTabHidden:(BOOL)a3 left:(BOOL)a4;
- (void)setTabShadowView:(id)a3;
@end

@implementation PGStashedMaskView

- (PGStashedMaskView)initWithFrame:(CGRect)a3
{
  return -[PGStashedMaskView initWithFrame:minimumStashTabSize:](self, "initWithFrame:minimumStashTabSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (PGStashedMaskView)initWithFrame:(CGRect)a3 minimumStashTabSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v51.receiver = self;
  v51.super_class = (Class)PGStashedMaskView;
  v6 = -[PGStashedMaskView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_tabHidden = 1;
    id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    mainBody = v7->_mainBody;
    v7->_mainBody = (UIView *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tab = v7->_tab;
    v7->_tab = (UIView *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tabTopCornerFill = v7->_tabTopCornerFill;
    v7->_tabTopCornerFill = (UIView *)v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tabBottomCornerFill = v7->_tabBottomCornerFill;
    v7->_tabBottomCornerFill = (UIView *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tabLeftTopCornerDestOut = v7->_tabLeftTopCornerDestOut;
    v7->_tabLeftTopCornerDestOut = (UIView *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tabLeftBottomCornerDestOut = v7->_tabLeftBottomCornerDestOut;
    v7->_tabLeftBottomCornerDestOut = (UIView *)v23;

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tabRightTopCornerDestOut = v7->_tabRightTopCornerDestOut;
    v7->_tabRightTopCornerDestOut = (UIView *)v25;

    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    tabRightBottomCornerDestOut = v7->_tabRightBottomCornerDestOut;
    v7->_tabRightBottomCornerDestOut = (UIView *)v27;

    [(UIView *)v7->_tab setUserInteractionEnabled:0];
    [(UIView *)v7->_tabTopCornerFill setUserInteractionEnabled:0];
    [(UIView *)v7->_tabBottomCornerFill setUserInteractionEnabled:0];
    [(UIView *)v7->_tabLeftTopCornerDestOut setUserInteractionEnabled:0];
    [(UIView *)v7->_tabLeftBottomCornerDestOut setUserInteractionEnabled:0];
    [(UIView *)v7->_tabRightTopCornerDestOut setUserInteractionEnabled:0];
    [(UIView *)v7->_tabRightBottomCornerDestOut setUserInteractionEnabled:0];
    v29 = v7->_mainBody;
    v30 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v29 setBackgroundColor:v30];

    v31 = v7->_tab;
    v32 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v31 setBackgroundColor:v32];

    v33 = v7->_tabTopCornerFill;
    v34 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v33 setBackgroundColor:v34];

    v35 = v7->_tabBottomCornerFill;
    v36 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v35 setBackgroundColor:v36];

    v37 = v7->_tabLeftTopCornerDestOut;
    v38 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v37 setBackgroundColor:v38];

    v39 = v7->_tabLeftBottomCornerDestOut;
    v40 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v39 setBackgroundColor:v40];

    v41 = v7->_tabRightTopCornerDestOut;
    v42 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v41 setBackgroundColor:v42];

    v43 = v7->_tabRightBottomCornerDestOut;
    v44 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v43 setBackgroundColor:v44];

    [(UIView *)v7->_mainBody _setContinuousCornerRadius:15.0];
    [(UIView *)v7->_tab _setContinuousCornerRadius:15.0];
    [(UIView *)v7->_tabLeftTopCornerDestOut _setContinuousCornerRadius:3.0];
    [(UIView *)v7->_tabLeftBottomCornerDestOut _setContinuousCornerRadius:3.0];
    [(UIView *)v7->_tabRightTopCornerDestOut _setContinuousCornerRadius:3.0];
    [(UIView *)v7->_tabRightBottomCornerDestOut _setContinuousCornerRadius:3.0];
    v45 = [(UIView *)v7->_tabLeftTopCornerDestOut layer];
    uint64_t v46 = *MEMORY[0x1E4F3A098];
    [v45 setCompositingFilter:*MEMORY[0x1E4F3A098]];

    v47 = [(UIView *)v7->_tabRightTopCornerDestOut layer];
    [v47 setCompositingFilter:v46];

    v48 = [(UIView *)v7->_tabLeftBottomCornerDestOut layer];
    [v48 setCompositingFilter:v46];

    v49 = [(UIView *)v7->_tabRightBottomCornerDestOut layer];
    [v49 setCompositingFilter:v46];

    [(PGStashedMaskView *)v7 addSubview:v7->_mainBody];
    [(PGStashedMaskView *)v7 addSubview:v7->_tab];
    [(PGStashedMaskView *)v7 addSubview:v7->_tabTopCornerFill];
    [(PGStashedMaskView *)v7 addSubview:v7->_tabBottomCornerFill];
    [(PGStashedMaskView *)v7 addSubview:v7->_tabLeftTopCornerDestOut];
    [(PGStashedMaskView *)v7 addSubview:v7->_tabLeftBottomCornerDestOut];
    [(PGStashedMaskView *)v7 addSubview:v7->_tabRightTopCornerDestOut];
    [(PGStashedMaskView *)v7 addSubview:v7->_tabRightBottomCornerDestOut];
    -[PGStashedMaskView setMinimumStashTabSize:](v7, "setMinimumStashTabSize:", width, height);
    [(UIView *)v7 PG_setAllowsGroupBlending:0];
    [(UIView *)v7 PG_setAllowsEdgeAntialiasing:1];
  }
  return v7;
}

- (void)setTabHidden:(BOOL)a3 left:(BOOL)a4
{
  if (self->_tabHidden != a3 || self->_tabShownLeft != a4)
  {
    self->_tabHidden = a3;
    self->_BOOL tabShownLeft = a4 & ~a3;
    [(PGStashedMaskView *)self bounds];
    double v6 = 15.0;
    if (v7 >= 105.0)
    {
      [(PGStashedMaskView *)self bounds];
      double v6 = 15.0;
      if (v8 < 136.0)
      {
        [(PGStashedMaskView *)self bounds];
        double v10 = fmax((v9 + -105.0) / 31.0 + 0.0, 0.0);
        double v11 = v10 * -5.0 + 15.0;
        if (v10 >= 1.0) {
          double v11 = 10.0;
        }
        double v6 = fmin(fmax(v11, 10.0), 15.0);
      }
    }
    if (self->_tabHidden) {
      double v6 = 15.0;
    }
    [(PGStashedMaskView *)self _setContinuousCornerRadius:v6];
    if (a3)
    {
      tab = self->_tab;
      long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
      long long v28 = *(_OWORD *)&v31.a;
      *(_OWORD *)&v31.c = v29;
      *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v27 = *(_OWORD *)&v31.tx;
      [(UIView *)tab setTransform:&v31];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tabShadowView);
      *(_OWORD *)&v31.a = v28;
      *(_OWORD *)&v31.c = v29;
      *(_OWORD *)&v31.tx = v27;
      [WeakRetained setTransform:&v31];

      tabTopCornerFill = self->_tabTopCornerFill;
      *(_OWORD *)&v31.a = v28;
      *(_OWORD *)&v31.c = v29;
      *(_OWORD *)&v31.tx = v27;
      [(UIView *)tabTopCornerFill setTransform:&v31];
      tabBottomCornerFill = self->_tabBottomCornerFill;
      *(_OWORD *)&v31.a = v28;
      *(_OWORD *)&v31.c = v29;
      *(_OWORD *)&v31.tx = v27;
      [(UIView *)tabBottomCornerFill setTransform:&v31];
      id v16 = objc_loadWeakRetained((id *)&self->_tabShadowView);
      uint64_t v17 = v16;
      double v18 = 0.0;
    }
    else
    {
      BOOL tabShownLeft = self->_tabShownLeft;
      double width = self->_minimumStashTabSize.width;
      memset(&v31, 0, sizeof(v31));
      double v21 = -width;
      if (!tabShownLeft) {
        double v21 = width;
      }
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v30.c = v22;
      *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(&v31, &v30, v21, 0.0);
      uint64_t v23 = self->_tab;
      CGAffineTransform v30 = v31;
      [(UIView *)v23 setTransform:&v30];
      id v24 = objc_loadWeakRetained((id *)&self->_tabShadowView);
      CGAffineTransform v30 = v31;
      [v24 setTransform:&v30];

      uint64_t v25 = self->_tabTopCornerFill;
      CGAffineTransform v30 = v31;
      [(UIView *)v25 setTransform:&v30];
      v26 = self->_tabBottomCornerFill;
      CGAffineTransform v30 = v31;
      [(UIView *)v26 setTransform:&v30];
      id v16 = objc_loadWeakRetained((id *)&self->_tabShadowView);
      uint64_t v17 = v16;
      double v18 = 1.0;
    }
    [v16 setAlpha:v18];
  }
}

- (void)setMinimumStashTabSize:(CGSize)a3
{
  double width = a3.width;
  if (self->_minimumStashTabSize.width != a3.width || self->_minimumStashTabSize.height != a3.height)
  {
    self->_minimumStashTabSize = a3;
    -[UIView setBounds:](self->_tabLeftTopCornerDestOut, "setBounds:", 0.0, 0.0, a3.width, a3.width);
    -[UIView setBounds:](self->_tabRightTopCornerDestOut, "setBounds:", 0.0, 0.0, width, width);
    -[UIView setBounds:](self->_tabLeftBottomCornerDestOut, "setBounds:", 0.0, 0.0, width, width);
    tabRightBottomCornerDestOut = self->_tabRightBottomCornerDestOut;
    -[UIView setBounds:](tabRightBottomCornerDestOut, "setBounds:", 0.0, 0.0, width, width);
  }
}

- (CGRect)tabViewBounds
{
  [(PGStashedMaskView *)self bounds];
  if (v6 >= 105.0) {
    double height = self->_minimumStashTabSize.height;
  }
  else {
    double height = v6;
  }
  if (v6 > self->_minimumStashTabSize.height) {
    double v6 = height;
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_mainBodyBounds
{
  [(PGStashedMaskView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PGStashedMaskView *)self tabViewBounds];
  if (v10 > v11) {
    double v11 = v10;
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  result.size.double height = v11;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)_continuousCornerRadius
{
  [(UIView *)self->_mainBody _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  tab = self->_tab;
  double v8 = [(PGStashedMaskView *)self superview];
  -[UIView convertPoint:fromView:](tab, "convertPoint:fromView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = [(UIView *)self->_tab layer];
  LOBYTE(tab) = objc_msgSend(v13, "containsPoint:", v10, v12);

  return (char)tab;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)PGStashedMaskView;
  [(PGStashedMaskView *)&v38 layoutSubviews];
  [(PGStashedMaskView *)self bounds];
  CGFloat v34 = v4;
  CGFloat v35 = v3;
  CGFloat v36 = v5;
  double v37 = v6;
  [(PGStashedMaskView *)self _mainBodyBounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(PGStashedMaskView *)self tabViewBounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  -[UIView setFrame:](self->_mainBody, "setFrame:", v8, v10, v12, v14);
  -[UIView setBounds:](self->_tab, "setBounds:", v16, v18, v20, v22);
  tab = self->_tab;
  v39.origin.double x = v35;
  v39.origin.double y = v34;
  v39.size.double width = v36;
  v39.size.double height = v37;
  double MidX = CGRectGetMidX(v39);
  v40.origin.double x = v35;
  v40.origin.double y = v34;
  v40.size.double width = v36;
  v40.size.double height = v37;
  -[UIView setPosition:](tab, "setPosition:", MidX, CGRectGetMidY(v40));
  [(UIView *)self->_tab _continuousCornerRadius];
  double v26 = v20 + v25 * -2.0;
  -[UIView setBounds:](self->_tabTopCornerFill, "setBounds:", v16, v18, v26, 5.0);
  -[UIView setBounds:](self->_tabBottomCornerFill, "setBounds:", v16, v18, v26, 5.0);
  tabTopCornerFill = self->_tabTopCornerFill;
  [(UIView *)self->_tab position];
  [(UIView *)self->_tab position];
  UIPointRoundToScale();
  -[UIView setPosition:](tabTopCornerFill, "setPosition:");
  tabBottomCornerFill = self->_tabBottomCornerFill;
  [(UIView *)self->_tab position];
  [(UIView *)self->_tab position];
  UIPointRoundToScale();
  -[UIView setPosition:](tabBottomCornerFill, "setPosition:");
  tabLeftTopCornerDestOut = self->_tabLeftTopCornerDestOut;
  [(UIView *)self->_tab position];
  UIPointRoundToScale();
  -[UIView setPosition:](tabLeftTopCornerDestOut, "setPosition:");
  tabRightTopCornerDestOut = self->_tabRightTopCornerDestOut;
  [(UIView *)self->_tabLeftTopCornerDestOut position];
  UIPointRoundToScale();
  -[UIView setPosition:](tabRightTopCornerDestOut, "setPosition:");
  tabLeftBottomCornerDestOut = self->_tabLeftBottomCornerDestOut;
  [(UIView *)self->_tab position];
  UIPointRoundToScale();
  -[UIView setPosition:](tabLeftBottomCornerDestOut, "setPosition:");
  tabRightBottomCornerDestOut = self->_tabRightBottomCornerDestOut;
  [(UIView *)self->_tabLeftBottomCornerDestOut position];
  UIPointRoundToScale();
  -[UIView setPosition:](tabRightBottomCornerDestOut, "setPosition:");
  BOOL v33 = v37 < 136.0;
  -[UIView setHidden:](self->_tabTopCornerFill, "setHidden:", v33, 136.0, v37);
  [(UIView *)self->_tabBottomCornerFill setHidden:v33];
  [(UIView *)self->_tabLeftTopCornerDestOut setHidden:v33];
  [(UIView *)self->_tabLeftBottomCornerDestOut setHidden:v33];
  [(UIView *)self->_tabRightTopCornerDestOut setHidden:v33];
  [(UIView *)self->_tabRightBottomCornerDestOut setHidden:v33];
}

- (UIView)tabShadowView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabShadowView);

  return (UIView *)WeakRetained;
}

- (void)setTabShadowView:(id)a3
{
}

- (CGSize)minimumStashTabSize
{
  double width = self->_minimumStashTabSize.width;
  double height = self->_minimumStashTabSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabShadowView);
  objc_storeStrong((id *)&self->_tabRightBottomCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabRightTopCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabLeftBottomCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabLeftTopCornerDestOut, 0);
  objc_storeStrong((id *)&self->_tabBottomCornerFill, 0);
  objc_storeStrong((id *)&self->_tabTopCornerFill, 0);
  objc_storeStrong((id *)&self->_tab, 0);

  objc_storeStrong((id *)&self->_mainBody, 0);
}

@end