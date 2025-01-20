@interface _TVCollectionWrappingView
+ (void)gradientConfigForCollection:(id)a3 gradientMask:(int64_t)a4 gradientLengths:(UIEdgeInsets *)a5 gradientInset:(UIEdgeInsets *)a6 gradientBoundsInset:(UIEdgeInsets *)a7;
- (BOOL)headerCanBecomeFocused;
- (BOOL)isCentered;
- (BOOL)isHeaderAuxiliarySelecting;
- (BOOL)isHeaderFloating;
- (BOOL)isHeaderFocused;
- (BOOL)isHeaderHidden;
- (BOOL)shouldBindRowsTogether;
- (CGRect)_adjustedHeaderFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IKColor)ikBackgroundColor;
- (TVShowcaseConfig)showcaseConfig;
- (UIEdgeInsets)_adjustedPadding;
- (UIView)footerView;
- (UIView)headerView;
- (_TVCollectionView)collectionView;
- (_TVCollectionWrappingView)initWithFrame:(CGRect)a3;
- (double)_adjustedShowcaseFactor;
- (double)_showcaseContentScaleForExpectedWidth:(double)a3;
- (double)headerSelectionMargin;
- (id)_collectionRowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4 forShowcase:(BOOL)a5;
- (id)_currentHeaderView;
- (id)preferredFocusEnvironments;
- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4;
- (id)showcaseRowMetricsForExpectedWidth:(double)a3;
- (int64_t)collectionGradientMask;
- (void)_updateGradientLayer;
- (void)_updateSubviews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)reevaluateFooterFrame;
- (void)reevaluateHeaderFrame;
- (void)setCentered:(BOOL)a3;
- (void)setCollectionGradientMask:(int64_t)a3;
- (void)setCollectionView:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHeaderAuxiliarySelecting:(BOOL)a3;
- (void)setHeaderCanBecomeFocused:(BOOL)a3;
- (void)setHeaderFloating:(BOOL)a3;
- (void)setHeaderFocused:(BOOL)a3;
- (void)setHeaderHidden:(BOOL)a3;
- (void)setHeaderSelectionMargin:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setIkBackgroundColor:(id)a3;
- (void)setShowcaseConfig:(TVShowcaseConfig *)a3;
- (void)setValue:(id)a3 forTVViewStyle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)tv_setShowcaseFactor:(double)a3;
@end

@implementation _TVCollectionWrappingView

+ (void)gradientConfigForCollection:(id)a3 gradientMask:(int64_t)a4 gradientLengths:(UIEdgeInsets *)a5 gradientInset:(UIEdgeInsets *)a6 gradientBoundsInset:(UIEdgeInsets *)a7
{
  char v10 = a4;
  [a3 contentInset];
  double v15 = *MEMORY[0x263F1D1C0];
  if (v10)
  {
    double v18 = 90.0;
    if (v11 < 100.0)
    {
      double v19 = 100.0 - v11;
      double v20 = -(100.0 - v11);
      double v15 = v15 + v19;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v16 = v11 < 100.0;
    double v17 = -(100.0 - v11);
    if (v16) {
      double v18 = v17;
    }
    else {
      double v18 = *MEMORY[0x263F1D1C0];
    }
  }
  double v20 = *MEMORY[0x263F1D1C0];
LABEL_8:
  double v21 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  if ((v10 & 4) != 0)
  {
    double v22 = 90.0;
    if (v13 < 150.0)
    {
      double v23 = 150.0 - v13;
      double v24 = -(150.0 - v13);
      double v21 = v23 + v21;
      goto LABEL_15;
    }
  }
  else if (v13 >= 150.0)
  {
    double v22 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  }
  else
  {
    double v22 = -(150.0 - v13);
  }
  double v24 = *(double *)(MEMORY[0x263F1D1C0] + 16);
LABEL_15:
  double v25 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  if ((v10 & 8) != 0)
  {
    double v27 = 90.0;
    if (v12 < 100.0)
    {
      double v28 = 100.0 - v12;
      double v29 = -(100.0 - v12);
      double v25 = v25 + v28;
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v16 = v12 < 100.0;
    double v26 = -(100.0 - v12);
    if (v16) {
      double v27 = v26;
    }
    else {
      double v27 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    }
  }
  double v29 = *(double *)(MEMORY[0x263F1D1C0] + 8);
LABEL_22:
  double v30 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  if ((v10 & 0x10) == 0)
  {
    BOOL v16 = v14 < 100.0;
    double v31 = -(100.0 - v14);
    if (v16) {
      double v32 = v31;
    }
    else {
      double v32 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    }
LABEL_29:
    double v34 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    if (!a5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  double v32 = 90.0;
  if (v14 >= 100.0) {
    goto LABEL_29;
  }
  double v33 = 100.0 - v14;
  double v34 = -(100.0 - v14);
  double v30 = v33 + v30;
  if (a5)
  {
LABEL_30:
    a5->top = v18;
    a5->left = v27;
    a5->bottom = v22;
    a5->right = v32;
  }
LABEL_31:
  if (a6)
  {
    a6->top = v15;
    a6->left = v25;
    a6->bottom = v21;
    a6->right = v30;
  }
  if (a7)
  {
    a7->top = v20;
    a7->left = v29;
    a7->bottom = v24;
    a7->right = v34;
  }
}

- (_TVCollectionWrappingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVCollectionWrappingView;
  v3 = -[_TVCollectionWrappingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_TVShelfViewLayout defaultHeaderSelectionMargin];
    v3->_headerSelectionMargin = v4;
    v3->_headerFloating = 1;
    v3->_headerAuxiliarySelecting = 1;
  }
  return v3;
}

- (void)setHeaderFloating:(BOOL)a3
{
  if (self->_headerFloating != a3)
  {
    self->_headerFloating = a3;
    double v4 = [(_TVCollectionWrappingView *)self headerView];
    [v4 removeFromSuperview];

    [(_TVCollectionWrappingView *)self _updateSubviews];
    [(_TVCollectionWrappingView *)self setNeedsLayout];
  }
}

- (void)setHeaderHidden:(BOOL)a3
{
  BOOL headerHidden = self->_headerHidden;
  if (headerHidden != a3)
  {
    self->_BOOL headerHidden = a3;
    v5 = [(_TVCollectionWrappingView *)self headerView];
    [v5 setHidden:self->_headerHidden];

    [(_TVCollectionWrappingView *)self setNeedsLayout];
    if (headerHidden)
    {
      objc_super v6 = [(_TVCollectionWrappingView *)self window];
      v7 = [v6 screen];
      id obj = [v7 focusedView];

      v8 = [(_TVCollectionWrappingView *)self collectionView];
      LODWORD(v7) = [obj isDescendantOfView:v8];

      if (v7)
      {
        objc_storeStrong((id *)&self->_selectingView, obj);
        [(_TVCollectionWrappingView *)self reevaluateHeaderFrame];
      }
    }
  }
}

- (void)setHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v8 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    CGSize v7 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->_headerFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_headerFrame.size = v7;
    [(_TVCollectionWrappingView *)self _updateSubviews];
  }
  [(_TVCollectionWrappingView *)self setNeedsLayout];
}

- (void)setCollectionView:(id)a3
{
  v5 = (_TVCollectionView *)a3;
  collectionView = self->_collectionView;
  CGSize v7 = v5;
  if (collectionView != v5)
  {
    [(_TVCollectionView *)collectionView removeFromSuperview];
    objc_storeStrong((id *)&self->_collectionView, a3);
    self->_collectionViewFlags.respondsToAugmentedSelectionFrameForFrame = objc_opt_respondsToSelector() & 1;
    [(_TVCollectionWrappingView *)self _updateSubviews];
  }
  [(_TVCollectionWrappingView *)self setNeedsLayout];
}

- (void)setCentered:(BOOL)a3
{
  if (self->_centered != a3)
  {
    self->_centered = a3;
    [(_TVCollectionWrappingView *)self setNeedsLayout];
  }
}

- (void)setFooterView:(id)a3
{
  v5 = (UIView *)a3;
  footerView = self->_footerView;
  v8 = v5;
  if (footerView != v5)
  {
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    CGSize v7 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->_footerFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_footerFrame.size = v7;
    [(_TVCollectionWrappingView *)self _updateSubviews];
  }
  [(_TVCollectionWrappingView *)self setNeedsLayout];
}

- (void)reevaluateFooterFrame
{
  v3 = [(_TVCollectionWrappingView *)self _currentFooterView];
  CGRect v15 = CGRectIntegral(self->_footerFrame);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  [v3 frame];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  if (!CGRectEqualToRect(v16, v17))
  {
    v8 = (void *)MEMORY[0x263F1CB60];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50___TVCollectionWrappingView_reevaluateFooterFrame__block_invoke;
    v9[3] = &unk_264BA6C60;
    id v10 = v3;
    CGFloat v11 = x;
    CGFloat v12 = y;
    CGFloat v13 = width;
    CGFloat v14 = height;
    objc_msgSend(v8, "tv_performByPreventingAdditiveAnimations:", v9);
  }
}

- (void)reevaluateHeaderFrame
{
  v3 = [(_TVCollectionWrappingView *)self _currentHeaderView];
  [(_TVCollectionWrappingView *)self _adjustedHeaderFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 frame];
  v20.origin.CGFloat x = v5;
  v20.origin.CGFloat y = v7;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    CGFloat v12 = (void *)MEMORY[0x263F1CB60];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50___TVCollectionWrappingView_reevaluateHeaderFrame__block_invoke;
    v13[3] = &unk_264BA6C60;
    id v14 = v3;
    CGFloat v15 = v5;
    CGFloat v16 = v7;
    CGFloat v17 = v9;
    CGFloat v18 = v11;
    objc_msgSend(v12, "tv_performByPreventingAdditiveAnimations:", v13);
  }
}

- (void)tv_setShowcaseFactor:(double)a3
{
  if (self->_showcaseFactor != a3)
  {
    self->_showcaseFactor = a3;
    CGFloat v5 = [(_TVCollectionWrappingView *)self collectionView];
    objc_msgSend(v5, "tv_setShowcaseFactor:", a3);

    [(_TVCollectionWrappingView *)self setNeedsLayout];
  }
}

- (void)setValue:(id)a3 forTVViewStyle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVCollectionWrappingView;
  [(UIView *)&v5 setValue:a3 forTVViewStyle:a4];
  [(_TVCollectionWrappingView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(_TVCollectionWrappingView *)self _adjustedPadding];
  double v69 = v5;
  double v70 = v6;
  double v8 = v7;
  double v10 = v9;
  double v68 = v9;
  CGFloat v11 = [(_TVCollectionWrappingView *)self headerView];
  objc_msgSend(v11, "tv_margin");
  double v65 = v12;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  [(_TVCollectionWrappingView *)self _adjustedShowcaseFactor];
  double v20 = v19;
  double v67 = width;
  if (width - (v8 + v14 + v10 + v18) >= 2.22044605e-16) {
    double width = width - (v8 + v14 + v10 + v18);
  }
  double v64 = width;
  double v21 = [(_TVCollectionWrappingView *)self headerView];
  objc_msgSend(v21, "tv_sizeThatFits:", width, 0.0);
  double v23 = v22;

  double v24 = [(_TVCollectionWrappingView *)self collectionView];
  int v25 = [v24 _displaysHorizontalIndexTitleBar];

  double v26 = *MEMORY[0x263F1D880];
  if (!v25) {
    double v26 = 0.0;
  }
  double v27 = 1.0 - v20;
  double v28 = (1.0 - v20) * v23;
  double v29 = *MEMORY[0x263F1D1C0];
  double v30 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  if (v28 == 0.0) {
    double v31 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  }
  else {
    double v31 = v16;
  }
  double v32 = v65;
  if (v28 == 0.0) {
    double v32 = *MEMORY[0x263F1D1C0];
  }
  double v66 = v32;
  double v33 = v27 * v26;
  BOOL v34 = v27 * v26 == 0.0;
  double v35 = 18.0;
  if (v34) {
    double v35 = 0.0;
  }
  double v62 = v35;
  double v63 = v31;
  v36 = [(_TVCollectionWrappingView *)self footerView];
  objc_msgSend(v36, "tv_margin");
  uint64_t v58 = v38;
  uint64_t v60 = v37;
  double v40 = v39;
  double v42 = v41;

  double v43 = v8 + v40 + v68 + v42;
  if (v64 < 2.22044605e-16) {
    double v43 = 0.0;
  }
  double v44 = v67 - v43;
  v45 = [(_TVCollectionWrappingView *)self footerView];
  objc_msgSend(v45, "tv_sizeThatFits:", v44, 0.0);
  double v47 = v46;

  double v49 = v59;
  double v48 = v61;
  if (v27 * v47 == 0.0)
  {
    double v48 = v29;
    double v49 = v30;
  }
  double v50 = v70 + v49 + v27 * v47 + v48;
  v51 = [(_TVCollectionWrappingView *)self collectionView];
  objc_msgSend(v51, "tv_sizeThatFits:withContentInset:", v67, 0.0, v69 + v62 + v33 + v28 + v66 + v63, v8, v50, v68);
  double v53 = v52;
  double v55 = v54;

  double v56 = v53;
  double v57 = v55;
  result.CGFloat height = v57;
  result.double width = v56;
  return result;
}

- (void)layoutSubviews
{
  v147.receiver = self;
  v147.super_class = (Class)_TVCollectionWrappingView;
  [(_TVCollectionWrappingView *)&v147 layoutSubviews];
  [(_TVCollectionWrappingView *)self bounds];
  double v138 = v3;
  double v139 = v4;
  double v124 = v5;
  double v7 = v6;
  double v8 = [(_TVCollectionWrappingView *)self collectionView];
  double v9 = [(_TVCollectionWrappingView *)self _currentHeaderView];
  [(_TVCollectionWrappingView *)self _adjustedPadding];
  double v132 = v10;
  double v127 = v11;
  double v126 = v12;
  double v14 = v13;
  [(UIView *)self tv_padding];
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v9, "tv_margin");
  double v130 = v19;
  double v131 = v20;
  double v22 = v21;
  double v24 = v23;
  [(_TVCollectionWrappingView *)self _adjustedShowcaseFactor];
  double v26 = v25;
  [(_TVCollectionWrappingView *)self _showcaseContentScaleForExpectedWidth:v7];
  double v136 = v26;
  sdouble x = 1.0 - (1.0 - v27) * v26;
  double v123 = v16 + v18;
  if (v7 - (v22 + v24) - (v16 + v18) >= 2.22044605e-16) {
    double v28 = v7 - (v22 + v24) - (v16 + v18);
  }
  else {
    double v28 = v7;
  }
  uint64_t v29 = [(_TVCollectionWrappingView *)self effectiveUserInterfaceLayoutDirection];
  objc_msgSend(v9, "tv_sizeThatFits:", v28, 0.0);
  double v31 = v30;
  CGFloat v33 = v32;
  double v134 = v14;
  double v34 = v7 - (v14 + v24 + v30);
  double v125 = v16;
  if (v29 == 1) {
    double v35 = v34;
  }
  else {
    double v35 = v16 + v22;
  }
  if (v30 < v28)
  {
    uint64_t v36 = objc_msgSend(v9, "tv_alignment");
    double v37 = floor((v7 - v31) * 0.5);
    if (v36 != 2) {
      double v37 = v35;
    }
    if (v36 == 3) {
      double v35 = v34;
    }
    else {
      double v35 = v37;
    }
  }
  v148.origin.double y = v132 + v130;
  v148.origin.double x = v35;
  v148.size.double width = v31;
  v148.size.double height = v33;
  self->_headerFrame = CGRectIntegral(v148);
  [(_TVCollectionWrappingView *)self _adjustedHeaderFrame];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v46 = [v9 layer];
  [v46 anchorPoint];
  double v48 = v47;
  double v50 = v49;

  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v43, v45);
  CGFloat v117 = v41;
  CGFloat v118 = v39;
  CGFloat v115 = v45;
  CGFloat v116 = v43;
  float v51 = v39 + v43 * v48;
  float v52 = v41 + v45 * v50;
  objc_msgSend(v9, "setCenter:", roundf(v51), roundf(v52));
  int v53 = [v8 _displaysHorizontalIndexTitleBar];
  double v54 = 18.0;
  if (v53)
  {
    double v55 = *MEMORY[0x263F1D880];
  }
  else
  {
    double v54 = 0.0;
    double v55 = 0.0;
  }
  double v121 = v55;
  double v120 = v54 + v55 + v131 + v130 + self->_headerFrame.size.height;
  double v122 = floor((1.0 - v136) * v120);
  double v129 = ceil(v136 * v120);
  double v119 = ceil(v139 / sx);
  [v8 setFrame:0.0];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v138, v124, v7, v139);
  double v56 = [(_TVCollectionWrappingView *)self _currentFooterView];
  objc_msgSend(v56, "tv_margin");
  double v59 = v57;
  double v61 = v60;
  double v62 = v58;
  if (v7 - (v57 + v58) - v123 >= 2.22044605e-16) {
    double v63 = v7 - (v57 + v58) - v123;
  }
  else {
    double v63 = v7;
  }
  objc_msgSend(v56, "tv_sizeThatFits:", v63, 0.0);
  double v65 = v64;
  double v67 = v66;
  double v68 = v7 - (v134 + v62 + v64);
  if (v29 == 1) {
    double v69 = v68;
  }
  else {
    double v69 = v125 + v59;
  }
  if (v64 < v63)
  {
    uint64_t v70 = objc_msgSend(v56, "tv_alignment");
    double v71 = floor((v7 - v65) * 0.5);
    if (v70 != 2) {
      double v71 = v69;
    }
    if (v70 == 3) {
      double v69 = v68;
    }
    else {
      double v69 = v71;
    }
  }
  double v72 = v126 + v61 + v67;
  v149.origin.double y = v139 - v72;
  v149.origin.double x = v69;
  v149.size.double width = v65;
  v149.size.double height = v67;
  CGRect v150 = CGRectIntegral(v149);
  self->_footerFrame = v150;
  CGRect v151 = CGRectIntegral(v150);
  double x = v151.origin.x;
  double y = v151.origin.y;
  double width = v151.size.width;
  double height = v151.size.height;
  v77 = [v56 layer];
  [v77 anchorPoint];
  double v79 = v78;
  double v81 = v80;

  objc_msgSend(v56, "setBounds:", 0.0, 0.0, width, height);
  double v82 = x + width * v79;
  double v83 = v132 + v122;
  *(float *)&double v82 = v82;
  float v84 = y + height * v81;
  objc_msgSend(v56, "setCenter:", roundf(*(float *)&v82), roundf(v84));
  [(_TVCollectionWrappingView *)self _updateGradientLayer];
  uint64_t v85 = [(_TVCollectionWrappingView *)self effectiveUserInterfaceLayoutDirection];
  if (v85 == 1) {
    double v86 = v134;
  }
  else {
    double v86 = v127;
  }
  if (v85 == 1) {
    double v87 = v127;
  }
  else {
    double v87 = v134;
  }
  [v8 contentInset];
  if (v91 != v86 || (v88 == v83 ? (BOOL v92 = v90 == v87) : (BOOL v92 = 0), v92 ? (v93 = v89 == v72) : (v93 = 0), !v93))
  {
    [v8 contentOffset];
    double v95 = v94;
    double v97 = v96;
    [v8 contentInset];
    double v99 = v98;
    double v133 = v100;
    double v135 = v101;
    double v128 = v102;
    objc_msgSend(v8, "setContentInset:", v83, v86, v72, v87);
    double v103 = v121;
    if (v121 > 0.0) {
      objc_msgSend(v8, "_setHorizontalIndexTitleBarOffset:", 0.0, -(v120 - (v131 + v130 + self->_headerFrame.size.height)));
    }
    if ([(_TVCollectionWrappingView *)self collectionGradientMask] < 1)
    {
      objc_msgSend(v8, "_setGradientMaskLengths:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    }
    else
    {
      long long v104 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
      long long v145 = *MEMORY[0x263F1D1C0];
      long long v146 = v104;
      long long v143 = v145;
      long long v144 = v104;
      long long v141 = v145;
      long long v142 = v104;
      objc_msgSend((id)objc_opt_class(), "gradientConfigForCollection:gradientMask:gradientLengths:gradientInset:gradientBoundsInset:", v8, -[_TVCollectionWrappingView collectionGradientMask](self, "collectionGradientMask"), &v145, &v143, &v141);
      if (([(_TVCollectionWrappingView *)self collectionGradientMask] & 1) != 0
        && v9
        && [(_TVCollectionWrappingView *)self isHeaderFloating])
      {
        v152.origin.double y = v117;
        v152.origin.double x = v118;
        v152.size.double height = v115;
        v152.size.double width = v116;
        *(double *)&long long v143 = *(double *)&v143 + v131 + CGRectGetMaxY(v152);
      }
      objc_msgSend(v8, "_setGradientMaskLengths:", v145, v146);
      objc_msgSend(v8, "_setGradientMaskEdgeInsets:", v143, v144);
      objc_msgSend(v8, "_setGradientBoundsInsets:", v141, v142);
    }
    if (([v8 isDragging] & 1) == 0 && (objc_msgSend(v8, "isDecelerating") & 1) == 0)
    {
      [v8 contentSize];
      double v107 = v128 + v106 - v7;
      double v108 = v87 + v106 - v7;
      if (v95 < v107) {
        double v108 = v95;
      }
      if (v95 <= -v133) {
        double v108 = -v86;
      }
      double v109 = v135 + v105 - v119;
      double v110 = v72 + v105 - v119;
      if (v97 < v109) {
        double v110 = v97;
      }
      if (v97 <= -v99) {
        double v110 = -v83;
      }
      objc_msgSend(v8, "setContentOffset:animated:", 0, v108, v110);
    }
  }
  -[_TVCollectionWrappingView setBounds:](self, "setBounds:", v138, v129, v7, v139);
  +[TVMLUtilities _headerFadeForShowcaseFactor:v136];
  double v112 = v111;
  objc_msgSend(v9, "setAlpha:");
  v113 = [v8 _horizontalIndexTitleBar];
  [v113 setAlpha:v112];

  v114 = [(_TVCollectionWrappingView *)self layer];
  CATransform3DMakeScale(&v140, sx, sx, 1.0);
  [v114 setSublayerTransform:&v140];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  double v7 = [a3 nextFocusedView];
  double v8 = [(_TVCollectionWrappingView *)self _currentHeaderView];
  if ([(_TVCollectionWrappingView *)self headerCanBecomeFocused]) {
    -[_TVCollectionWrappingView setHeaderFocused:](self, "setHeaderFocused:", [v7 isDescendantOfView:v8]);
  }
  if (v8)
  {
    if (![(_TVCollectionWrappingView *)self isHeaderFocused])
    {
      double v9 = [(_TVCollectionWrappingView *)self collectionView];
      int v10 = [v7 isDescendantOfView:v9];

      if (v10)
      {
        [v8 frame];
        BOOL v12 = v11 < self->_headerFrame.origin.y;
        objc_storeStrong((id *)&self->_selectingView, v7);
        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        double v24 = __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
        double v25 = &unk_264BA69A0;
        double v26 = self;
        double v13 = &v22;
        double v14 = v6;
        uint64_t v15 = v12;
LABEL_9:
        objc_msgSend(v14, "addCoordinatedAnimationsForAnimation:animations:completion:", v15, v13, 0, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
        goto LABEL_10;
      }
    }
  }
  selectingView = self->_selectingView;
  if (selectingView)
  {
    self->_selectingView = 0;

    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    double v19 = __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
    double v20 = &unk_264BA69A0;
    double v21 = self;
    double v13 = &v17;
    double v14 = v6;
    uint64_t v15 = 1;
    goto LABEL_9;
  }
LABEL_10:
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  if ([(_TVCollectionWrappingView *)self headerCanBecomeFocused]
    && [(_TVCollectionWrappingView *)self isHeaderFocused])
  {
    uint64_t v3 = [(_TVCollectionWrappingView *)self _currentHeaderView];
  }
  else
  {
    uint64_t v3 = [(_TVCollectionWrappingView *)self collectionView];
  }
  double v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4
{
  v83[1] = *MEMORY[0x263EF8340];
  [(_TVCollectionWrappingView *)self _adjustedPadding];
  double v8 = v7;
  double v70 = v10;
  double v71 = v9;
  double v12 = v11;
  int64_t v81 = 0x7FFFFFFFFFFFFFFFLL;
  double v13 = [(_TVCollectionWrappingView *)self _collectionRowMetricsForExpectedWidth:&v81 firstItemRowIndex:0 forShowcase:a3];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  memset(v77, 0, sizeof(v77));
  if ([v13 count])
  {
    double v14 = [v13 firstObject];
    uint64_t v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "tv_rowMetricsValue");
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v78 = 0u;
      memset(v77, 0, sizeof(v77));
    }
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v78 = 0u;
    memset(v77, 0, sizeof(v77));
  }
  double v16 = [(_TVCollectionWrappingView *)self collectionView];
  int v17 = [v16 _displaysHorizontalIndexTitleBar];

  if (v17)
  {
    *(float64x2_t *)((char *)v77 + 8) = vaddq_f64(*(float64x2_t *)((char *)v77 + 8), (float64x2_t)vdupq_lane_s64(COERCE__INT64(*MEMORY[0x263F1D880] + 18.0), 0));
    *(void *)&long long v80 = 0;
    *(void *)&long long v79 = 0;
    *(void *)&long long v78 = 0;
  }
  uint64_t v18 = [(_TVCollectionWrappingView *)self headerView];

  if (v18)
  {
    double v20 = [(_TVCollectionWrappingView *)self headerView];
    objc_msgSend(v20, "tv_margin");
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    double v29 = a3 - (v71 + v24 + v70 + v28) >= 2.22044605e-16 ? a3 - (v71 + v24 + v70 + v28) : a3;
    double v30 = [(_TVCollectionWrappingView *)self headerView];
    objc_msgSend(v30, "tv_sizeThatFits:", v29, 0.0);
    double v32 = v31;

    CGFloat v33 = [(_TVCollectionWrappingView *)self headerView];
    objc_msgSend(v33, "tv_alignmentInsetsForExpectedWidth:", v29);
    double v35 = v34;

    double v36 = v8 + v22;
    *(float64x2_t *)((char *)v77 + 8) = vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(v26 + v36 + v32), 0), *(float64x2_t *)((char *)v77 + 8));
    *(double *)&long long v78 = v36 + v35;
    *(double *)&long long v79 = v36 + v35;
    double v19 = *(double *)&v80;
    if (*(double *)&v80 > 0.0)
    {
      [(_TVCollectionWrappingView *)self headerSelectionMargin];
      *(float *)&double v37 = fmax(v37 + *(double *)&v80 - v26, 0.0) - v36;
      double v19 = fmaxf(*(float *)&v37, 0.0);
      *(double *)&long long v80 = v19;
    }
  }
  if (objc_msgSend(v13, "count", v19))
  {
    double v38 = (void *)[v13 mutableCopy];
    long long v74 = v78;
    long long v75 = v79;
    long long v76 = v80;
    long long v72 = v77[0];
    long long v73 = v77[1];
    double v39 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v72);
    [v38 replaceObjectAtIndex:0 withObject:v39];

    uint64_t v40 = [v38 copy];
  }
  else
  {
    double v41 = *((double *)v77 + 1);
    if (*((double *)v77 + 1) <= 0.0) {
      goto LABEL_20;
    }
    long long v74 = v78;
    long long v75 = v79;
    long long v76 = v80;
    long long v72 = v77[0];
    long long v73 = v77[1];
    double v38 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v72);
    v83[0] = v38;
    uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:1];
  }
  double v42 = (void *)v40;

  double v13 = v42;
LABEL_20:
  double v43 = [(_TVCollectionWrappingView *)self footerView];

  if (!v43) {
    goto LABEL_37;
  }
  if ([v13 count])
  {
    double v44 = [v13 lastObject];
    double v45 = v44;
    if (v44)
    {
      objc_msgSend(v44, "tv_rowMetricsValue");
    }
    else
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
    }
    long long v78 = v74;
    long long v79 = v75;
    long long v80 = v76;
    v77[0] = v72;
    v77[1] = v73;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v78 = 0u;
    memset(v77, 0, sizeof(v77));
  }
  double v46 = [(_TVCollectionWrappingView *)self footerView];
  objc_msgSend(v46, "tv_margin");
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;

  if (a3 - (v71 + v50 + v70 + v54) >= 2.22044605e-16) {
    double v55 = a3 - (v71 + v50 + v70 + v54);
  }
  else {
    double v55 = a3;
  }
  double v56 = [(_TVCollectionWrappingView *)self footerView];
  objc_msgSend(v56, "tv_sizeThatFits:", v55, 0.0);
  double v58 = v57;

  double v59 = [(_TVCollectionWrappingView *)self footerView];
  objc_msgSend(v59, "tv_alignmentInsetsForExpectedWidth:", v55);
  double v61 = v60;

  double v62 = v52 + v48 + v58;
  *((double *)v77 + 1) = v62 + *((double *)v77 + 1);
  *((double *)&v77[1] + 1) = v62 + *((double *)&v77[1] + 1);
  *((double *)&v78 + 1) = v12 + v52 + v61;
  *((double *)&v79 + 1) = *((double *)&v78 + 1);
  if (*((double *)&v80 + 1) > 0.0)
  {
    float v63 = fmax(v48 + 7.0 - *((double *)&v80 + 1), 0.0) - (v12 + v52);
    *((double *)&v80 + 1) = fmaxf(v63, 0.0);
  }
  if ([v13 count])
  {
    double v64 = (void *)[v13 mutableCopy];
    uint64_t v65 = [v13 count] - 1;
    long long v74 = v78;
    long long v75 = v79;
    long long v76 = v80;
    long long v72 = v77[0];
    long long v73 = v77[1];
    double v66 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v72);
    [v64 replaceObjectAtIndex:v65 withObject:v66];

    uint64_t v67 = [v64 copy];
  }
  else
  {
    if (*((double *)v77 + 1) <= 0.0) {
      goto LABEL_37;
    }
    long long v74 = v78;
    long long v75 = v79;
    long long v76 = v80;
    long long v72 = v77[0];
    long long v73 = v77[1];
    double v64 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v72);
    double v82 = v64;
    uint64_t v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
  }
  double v68 = (void *)v67;

  double v13 = v68;
LABEL_37:
  if (a4) {
    *a4 = v81;
  }
  return v13;
}

- (BOOL)shouldBindRowsTogether
{
  uint64_t v3 = [(_TVCollectionWrappingView *)self collectionView];
  if ([v3 conformsToProtocol:&unk_26E5D45B8])
  {
    double v4 = [(_TVCollectionWrappingView *)self collectionView];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return 0;
    }
    uint64_t v3 = [(_TVCollectionWrappingView *)self collectionView];
    char v6 = [v3 shouldBindRowsTogether];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)showcaseRowMetricsForExpectedWidth:(double)a3
{
  return [(_TVCollectionWrappingView *)self _collectionRowMetricsForExpectedWidth:0 firstItemRowIndex:1 forShowcase:a3];
}

- (id)_collectionRowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4 forShowcase:(BOOL)a5
{
  BOOL v5 = a5;
  v53[1] = *MEMORY[0x263EF8340];
  int64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
  [(_TVCollectionWrappingView *)self _adjustedPadding];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  int v17 = [(_TVCollectionWrappingView *)self headerView];

  if (v17) {
    double v10 = 0.0;
  }
  uint64_t v18 = [(_TVCollectionWrappingView *)self collectionView];
  int v19 = [v18 conformsToProtocol:&unk_26E5D4690];

  double v20 = [(_TVCollectionWrappingView *)self collectionView];
  double v21 = v20;
  if (v19)
  {
    char v22 = objc_opt_respondsToSelector();

    if (!v5
      || (v22 & 1) == 0
      || ([(_TVCollectionWrappingView *)self collectionView],
          double v23 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "showcaseRowMetricsForExpectedWidth:withContentInset:", a3, v10, v12, v14, v16),
          double v21 = objc_claimAutoreleasedReturnValue(),
          v23,
          !v21))
    {
      double v24 = [(_TVCollectionWrappingView *)self collectionView];
      uint64_t v25 = objc_msgSend(v24, "rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:", &v51, a3, v10, v12, v14, v16);
LABEL_10:
      double v21 = (void *)v25;
    }
  }
  else
  {

    if (v21)
    {
      memset(&v50[1], 0, 64);
      double v26 = [(_TVCollectionWrappingView *)self collectionView];
      objc_msgSend(v26, "tv_sizeThatFits:withContentInset:", a3, 0.0, v10, v12, v14, v16);
      uint64_t v28 = v27;

      *(void *)&v50[0] = 0;
      *((void *)&v50[0] + 1) = v28;
      double v24 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", v50);
      v53[0] = v24;
      uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];
      goto LABEL_10;
    }
  }
  if (v5)
  {
    [(_TVCollectionWrappingView *)self _showcaseContentScaleForExpectedWidth:a3];
    long long v44 = v29;
    if (*(double *)&v29 < 1.0)
    {
      double v30 = [MEMORY[0x263EFF980] array];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v31 = v21;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(v31);
            }
            double v36 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            memset(v50, 0, sizeof(v50));
            if (v36)
            {
              objc_msgSend(v36, "tv_rowMetricsValue");
              float64x2_t v37 = *(float64x2_t *)((char *)v50 + 8);
              float64x2_t v38 = *(float64x2_t *)((char *)&v50[1] + 8);
              float64x2_t v39 = *(float64x2_t *)((char *)&v50[2] + 8);
              float64x2_t v40 = *(float64x2_t *)((char *)&v50[3] + 8);
              double v41 = *((double *)&v50[4] + 1);
            }
            else
            {
              *(void *)&v50[0] = 0;
              float64x2_t v37 = 0uLL;
              double v41 = 0.0;
              float64x2_t v38 = 0uLL;
              float64x2_t v39 = 0uLL;
              float64x2_t v40 = 0uLL;
            }
            *(float64x2_t *)((char *)v50 + 8) = vmulq_n_f64(v37, *(double *)&v44);
            *(float64x2_t *)((char *)&v50[1] + 8) = vmulq_n_f64(v38, *(double *)&v44);
            *(float64x2_t *)((char *)&v50[2] + 8) = vmulq_n_f64(v39, *(double *)&v44);
            *(float64x2_t *)((char *)&v50[3] + 8) = vmulq_n_f64(v40, *(double *)&v44);
            *((double *)&v50[4] + 1) = *(double *)&v44 * v41;
            v45[2] = v50[2];
            v45[3] = v50[3];
            v45[4] = v50[4];
            v45[0] = v50[0];
            v45[1] = v50[1];
            double v42 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", v45, v44);
            [v30 addObject:v42];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v33);
      }

      double v21 = (void *)[v30 copy];
    }
  }
  if (a4) {
    *a4 = v51;
  }
  return v21;
}

- (CGRect)_adjustedHeaderFrame
{
  p_headerFrame = &self->_headerFrame;
  CGFloat x = self->_headerFrame.origin.x;
  double y = self->_headerFrame.origin.y;
  CGFloat width = self->_headerFrame.size.width;
  double height = self->_headerFrame.size.height;
  if (self->_selectingView
    && [(_TVCollectionWrappingView *)self isHeaderAuxiliarySelecting]
    && [(_TVCollectionWrappingView *)self isHeaderFloating])
  {
    double v8 = [(_TVCollectionWrappingView *)self collectionView];
    [(UIView *)self tv_padding];
    double v69 = v9;
    double v66 = v10;
    [(UIView *)self->_selectingView frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    int v19 = [(UIView *)self->_selectingView conformsToProtocol:&unk_26E5AEAA8];
    selectingView = self->_selectingView;
    if (v19) {
      -[UIView selectionMarginsForSize:](selectingView, "selectionMarginsForSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    }
    else {
      [(UIView *)selectingView tv_focusMargin];
    }
    double v30 = v12 - v22;
    double v31 = v14 - v21;
    double v32 = v16 + v22 + v24;
    double v33 = v18 + v21 + v23;
    uint64_t v34 = [(UIView *)self->_selectingView superview];
    objc_msgSend(v8, "convertRect:fromView:", v34, v30, v31, v32, v33);
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;

    double v65 = x;
    if (self->_collectionViewFlags.respondsToAugmentedSelectionFrameForFrame)
    {
      double v43 = [(_TVCollectionWrappingView *)self collectionView];
      objc_msgSend(v43, "tv_augmentedSelectionFrameForFrame:", v36, v38, v40, v42);
      double v36 = v44;
      double v38 = v45;
      double v40 = v46;
      double v42 = v47;
    }
    long long v48 = [(_TVCollectionWrappingView *)self collectionView];
    -[_TVCollectionWrappingView convertRect:fromView:](self, "convertRect:fromView:", v48, v36, v38, v40, v42);
    double v50 = v49;
    CGFloat v67 = v52;
    double v68 = v51;
    double v54 = v53;

    double v55 = v69;
    if (v50 >= v69)
    {
      [(_TVCollectionWrappingView *)self bounds];
      double v55 = v50;
      if (v50 + v54 > v56 - v66)
      {
        [(_TVCollectionWrappingView *)self bounds];
        double v55 = v57 - v66 - v54;
      }
    }
    CGFloat v59 = p_headerFrame->origin.x;
    CGFloat v58 = p_headerFrame->origin.y;
    CGFloat v61 = p_headerFrame->size.width;
    double v60 = p_headerFrame->size.height;
    [(_TVCollectionWrappingView *)self headerSelectionMargin];
    v72.size.double height = v60 + v62;
    v72.origin.CGFloat x = v59;
    v72.origin.double y = v58;
    v72.size.CGFloat width = v61;
    v73.origin.CGFloat x = v55;
    v73.size.double height = v67;
    v73.origin.double y = v68;
    v73.size.CGFloat width = v54;
    if (CGRectIntersectsRect(v72, v73))
    {
      CGFloat x = p_headerFrame->origin.x;
      [(_TVCollectionWrappingView *)self headerSelectionMargin];
      CGFloat width = p_headerFrame->size.width;
      double height = p_headerFrame->size.height;
      double y = v68 - v63 - height;
    }
    else
    {
      CGFloat width = v64;
      CGFloat x = v65;
    }
  }
  else
  {
    if ([(_TVCollectionWrappingView *)self isHeaderFloating]) {
      goto LABEL_9;
    }
    double v8 = [(_TVCollectionWrappingView *)self collectionView];
    [v8 contentInset];
    double y = y - v25;
  }

LABEL_9:
  CGFloat v26 = x;
  double v27 = y;
  CGFloat v28 = width;
  double v29 = height;
  return CGRectIntegral(*(CGRect *)&v26);
}

- (UIEdgeInsets)_adjustedPadding
{
  [(UIView *)self tv_padding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(_TVCollectionWrappingView *)self isCentered])
  {
    [(_TVCollectionWrappingView *)self bounds];
    double v12 = v11 - (v6 + v10);
    double v13 = [(_TVCollectionWrappingView *)self collectionView];
    double v14 = [v13 collectionViewLayout];

    [v14 prepareLayout];
    [v14 collectionViewContentSize];
    if (v15 < v12)
    {
      double v16 = v15;
      [(_TVCollectionWrappingView *)self bounds];
      double v10 = (v17 - v16) * 0.5;
      double v6 = v10;
    }
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)_adjustedShowcaseFactor
{
  [(_TVCollectionWrappingView *)self showcaseConfig];
  if (v4) {
    return self->_showcaseFactor;
  }
  else {
    return 0.0;
  }
}

- (double)_showcaseContentScaleForExpectedWidth:(double)a3
{
  [(_TVCollectionWrappingView *)self _adjustedPadding];
  double v6 = v5;
  double v8 = v7;
  [(_TVCollectionWrappingView *)self showcaseConfig];
  return fmin((a3 + 0.0 * -2.0) / (a3 - (v6 + v8)), 1.0);
}

- (id)_currentHeaderView
{
  if ([(_TVCollectionWrappingView *)self isHeaderHidden])
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(_TVCollectionWrappingView *)self headerView];
  }
  return v3;
}

- (void)setIkBackgroundColor:(id)a3
{
  id v10 = a3;
  if ((-[IKColor isEqual:](self->_ikBackgroundColor, "isEqual:") & 1) == 0)
  {
    [(CAGradientLayer *)self->_gradientLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_ikBackgroundColor, a3);
    double v5 = [MEMORY[0x263F1C550] clearColor];
    if (v10)
    {
      double v6 = [v10 color];

      if ([v10 colorType] == 3)
      {
        double v7 = [MEMORY[0x263F157D0] layer];
        gradientLayer = self->_gradientLayer;
        self->_gradientLayer = v7;

        [(_TVCollectionWrappingView *)self _updateGradientLayer];
        double v9 = [(_TVCollectionWrappingView *)self layer];
        [v9 insertSublayer:self->_gradientLayer atIndex:0];
      }
    }
    else
    {
      double v6 = v5;
    }
    [(_TVCollectionWrappingView *)self setBackgroundColor:v6];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(_TVCollectionWrappingView *)self traitCollection];
  if ([v4 userInterfaceStyle])
  {
    uint64_t v5 = [v8 userInterfaceStyle];
    double v6 = [(_TVCollectionWrappingView *)self traitCollection];
    uint64_t v7 = [v6 userInterfaceStyle];

    if (v5 != v7) {
      [(_TVCollectionWrappingView *)self _updateGradientLayer];
    }
  }
  else
  {
  }
}

- (void)_updateGradientLayer
{
  if (self->_gradientLayer)
  {
    double v3 = [(IKColor *)self->_ikBackgroundColor gradientColors];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x263EFF980];
      double v6 = [(IKColor *)self->_ikBackgroundColor gradientColors];
      uint64_t v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

      id v8 = [(IKColor *)self->_ikBackgroundColor gradientColors];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __49___TVCollectionWrappingView__updateGradientLayer__block_invoke;
      v12[3] = &unk_264BA7978;
      id v13 = v7;
      id v9 = v7;
      [v8 enumerateObjectsUsingBlock:v12];

      [(CAGradientLayer *)self->_gradientLayer setColors:v9];
      gradientLayer = self->_gradientLayer;
      double v11 = [(IKColor *)self->_ikBackgroundColor gradientPoints];
      [(CAGradientLayer *)gradientLayer setLocations:v11];
    }
  }
}

- (void)_updateSubviews
{
  uint64_t v3 = [(_TVCollectionWrappingView *)self collectionView];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(_TVCollectionWrappingView *)self collectionView];
    double v6 = [v5 superview];

    if (!v6)
    {
      uint64_t v7 = [(_TVCollectionWrappingView *)self headerView];
      id v8 = [v7 superview];

      id v9 = [(_TVCollectionWrappingView *)self collectionView];
      if (v8 == self)
      {
        id v10 = [(_TVCollectionWrappingView *)self headerView];
        [(_TVCollectionWrappingView *)self insertSubview:v9 below:v10];
      }
      else
      {
        [(_TVCollectionWrappingView *)self addSubview:v9];
      }
    }
  }
  uint64_t v11 = [(_TVCollectionWrappingView *)self headerView];
  if (v11)
  {
    double v12 = (void *)v11;
    id v13 = [(_TVCollectionWrappingView *)self headerView];
    double v14 = [v13 superview];

    if (!v14)
    {
      BOOL v15 = [(_TVCollectionWrappingView *)self isHeaderFloating];
      double v16 = [(_TVCollectionWrappingView *)self collectionView];
      double v17 = v16;
      if (v15)
      {
        double v18 = [v16 superview];

        double v19 = [(_TVCollectionWrappingView *)self headerView];
        if (v18 != self)
        {
          [(_TVCollectionWrappingView *)self addSubview:v19];
LABEL_16:

          goto LABEL_17;
        }
        double v20 = [(_TVCollectionWrappingView *)self collectionView];
        [(_TVCollectionWrappingView *)self insertSubview:v19 above:v20];
LABEL_15:

        goto LABEL_16;
      }

      if (v17)
      {
        double v19 = [(_TVCollectionWrappingView *)self collectionView];
        double v20 = [(_TVCollectionWrappingView *)self headerView];
        [v19 addSubview:v20];
        goto LABEL_15;
      }
    }
  }
LABEL_17:
  uint64_t v21 = [(_TVCollectionWrappingView *)self footerView];
  if (v21)
  {
    double v22 = (void *)v21;
    double v23 = [(_TVCollectionWrappingView *)self footerView];
    double v24 = [v23 superview];

    if (!v24)
    {
      double v25 = [(_TVCollectionWrappingView *)self collectionView];
      CGFloat v26 = [v25 superview];

      id v28 = [(_TVCollectionWrappingView *)self footerView];
      if (v26 == self)
      {
        double v27 = [(_TVCollectionWrappingView *)self collectionView];
        [(_TVCollectionWrappingView *)self insertSubview:v28 above:v27];
      }
      else
      {
        [(_TVCollectionWrappingView *)self addSubview:v28];
      }
    }
  }
}

- (UIView)headerView
{
  return self->_headerView;
}

- (_TVCollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (BOOL)headerCanBecomeFocused
{
  return self->_headerCanBecomeFocused;
}

- (void)setHeaderCanBecomeFocused:(BOOL)a3
{
  self->_headerCanBecomeFocused = a3;
}

- (double)headerSelectionMargin
{
  return self->_headerSelectionMargin;
}

- (void)setHeaderSelectionMargin:(double)a3
{
  self->_headerSelectionMargin = a3;
}

- (TVShowcaseConfig)showcaseConfig
{
  *retstr = self[23];
  return self;
}

- (void)setShowcaseConfig:(TVShowcaseConfig *)a3
{
  double inset = a3->inset;
  *(_OWORD *)&self->_showcaseConfig.flavor = *(_OWORD *)&a3->flavor;
  self->_showcaseConfig.double inset = inset;
}

- (BOOL)isHeaderAuxiliarySelecting
{
  return self->_headerAuxiliarySelecting;
}

- (void)setHeaderAuxiliarySelecting:(BOOL)a3
{
  self->_headerAuxiliarySelecting = a3;
}

- (BOOL)isHeaderFloating
{
  return self->_headerFloating;
}

- (BOOL)isHeaderHidden
{
  return self->_headerHidden;
}

- (int64_t)collectionGradientMask
{
  return self->_collectionGradientMask;
}

- (void)setCollectionGradientMask:(int64_t)a3
{
  self->_collectionGradientMask = a3;
}

- (IKColor)ikBackgroundColor
{
  return self->_ikBackgroundColor;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)isHeaderFocused
{
  return self->_headerFocused;
}

- (void)setHeaderFocused:(BOOL)a3
{
  self->_headerFocused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ikBackgroundColor, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_selectingView, 0);
}

@end