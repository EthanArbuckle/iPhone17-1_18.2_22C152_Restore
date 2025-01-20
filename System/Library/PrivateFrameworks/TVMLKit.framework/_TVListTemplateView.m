@interface _TVListTemplateView
- (BOOL)floatingBanner;
- (BOOL)isBackdropEnabled;
- (BOOL)shouldAdjustListForTabBar;
- (BOOL)shouldAdjustPreviewForTabBar;
- (UIView)bannerView;
- (UIView)bgImageView;
- (UIView)listView;
- (UIView)previewView;
- (_TVListTemplateView)initWithFrame:(CGRect)a3;
- (id)preferredFocusEnvironments;
- (int64_t)listAlignment;
- (void)adjustScrollForListView:(id)a3;
- (void)layoutSubviews;
- (void)setBackdropEnabled:(BOOL)a3;
- (void)setBannerView:(id)a3;
- (void)setBgImageView:(id)a3;
- (void)setFloatingBanner:(BOOL)a3;
- (void)setListView:(id)a3;
- (void)setOverlayBlurOffset:(double)a3;
- (void)setPreviewView:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShouldAdjustListForTabBar:(BOOL)a3;
- (void)setShouldAdjustPreviewForTabBar:(BOOL)a3;
@end

@implementation _TVListTemplateView

- (_TVListTemplateView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_TVListTemplateView;
  v3 = -[_TVListTemplateView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F1C638]);
    previewFocusGuide = v3->_previewFocusGuide;
    v3->_previewFocusGuide = v4;

    [(_TVListTemplateView *)v3 addLayoutGuide:v3->_previewFocusGuide];
    v6 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F1C638]);
    overallFocusGuide = v3->_overallFocusGuide;
    v3->_overallFocusGuide = v6;

    [(_TVListTemplateView *)v3 addLayoutGuide:v3->_overallFocusGuide];
    v3->_floatingBanner = 1;
  }
  return v3;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  bannerView = self->_bannerView;
  if (bannerView) {
    [(UIView *)bannerView setSemanticContentAttribute:a3];
  }
  bgImageView = self->_bgImageView;
  if (bgImageView) {
    [(UIView *)bgImageView setSemanticContentAttribute:a3];
  }
  listView = self->_listView;
  if (listView) {
    [(UIView *)listView setSemanticContentAttribute:a3];
  }
  previewView = self->_previewView;
  if (previewView) {
    [(UIView *)previewView setSemanticContentAttribute:a3];
  }
  v9.receiver = self;
  v9.super_class = (Class)_TVListTemplateView;
  [(_TVListTemplateView *)&v9 setSemanticContentAttribute:a3];
}

- (void)setBgImageView:(id)a3
{
  v5 = (UIView *)a3;
  p_bgImageView = &self->_bgImageView;
  bgImageView = self->_bgImageView;
  v8 = v5;
  if (bgImageView != v5)
  {
    [(UIView *)bgImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_bgImageView, a3);
    if (*p_bgImageView)
    {
      [(UIView *)*p_bgImageView setSemanticContentAttribute:[(_TVListTemplateView *)self semanticContentAttribute]];
      [(_TVListTemplateView *)self insertSubview:*p_bgImageView atIndex:0];
    }
  }
  [(_TVListTemplateView *)self setNeedsLayout];
}

- (void)setBannerView:(id)a3
{
  v5 = (UIView *)a3;
  p_bannerView = &self->_bannerView;
  bannerView = self->_bannerView;
  objc_super v9 = v5;
  if (bannerView != v5)
  {
    [(UIView *)bannerView removeFromSuperview];
    objc_storeStrong((id *)&self->_bannerView, a3);
    if (*p_bannerView)
    {
      [(UIView *)*p_bannerView setSemanticContentAttribute:[(_TVListTemplateView *)self semanticContentAttribute]];
      v8 = *p_bannerView;
      if (self->_bgImageView) {
        -[_TVListTemplateView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v8);
      }
      else {
        -[_TVListTemplateView insertSubview:atIndex:](self, "insertSubview:atIndex:", v8);
      }
    }
  }
  [(_TVListTemplateView *)self setNeedsLayout];
}

- (void)setFloatingBanner:(BOOL)a3
{
  self->_floatingBanner = a3;
  [(_TVListTemplateView *)self setNeedsLayout];
}

- (void)setListView:(id)a3
{
  v5 = (UIView *)a3;
  p_listView = &self->_listView;
  listView = self->_listView;
  v8 = v5;
  if (listView != v5)
  {
    [(UIView *)listView removeFromSuperview];
    objc_storeStrong((id *)&self->_listView, a3);
    if (*p_listView)
    {
      [(UIView *)*p_listView setSemanticContentAttribute:[(_TVListTemplateView *)self semanticContentAttribute]];
      [(_TVListTemplateView *)self addSubview:*p_listView];
    }
  }
  [(_TVListTemplateView *)self setNeedsLayout];
}

- (void)setPreviewView:(id)a3
{
  v5 = (UIView *)a3;
  previewView = self->_previewView;
  if (previewView != v5)
  {
    v7 = previewView;
    objc_storeStrong((id *)&self->_previewView, a3);
    [(UIView *)v5 setAlpha:0.0];
    v8 = (void *)MEMORY[0x263F1CB60];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38___TVListTemplateView_setPreviewView___block_invoke;
    v16[3] = &unk_264BA69A0;
    v17 = v7;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __38___TVListTemplateView_setPreviewView___block_invoke_2;
    v14 = &unk_264BA6D78;
    objc_super v9 = v17;
    v15 = v9;
    [v8 animateWithDuration:v16 animations:&v11 completion:0.2];
    v10 = self->_previewView;
    if (v10) {
      [(UIView *)v10 setSemanticContentAttribute:[(_TVListTemplateView *)self semanticContentAttribute]];
    }
  }
  [(_TVListTemplateView *)self setNeedsLayout];
}

- (void)setBackdropEnabled:(BOOL)a3
{
  if (self->_backdropEnabled != a3)
  {
    self->_backdropEnabled = a3;
    backdropView = self->_backdropView;
    if (a3)
    {
      if (!backdropView)
      {
        id v5 = objc_alloc(MEMORY[0x263F1CB98]);
        v6 = [MEMORY[0x263F1C480] effectWithStyle:5003];
        v7 = (UIVisualEffectView *)[v5 initWithEffect:v6];
        v8 = self->_backdropView;
        self->_backdropView = v7;
      }
      [(_TVListTemplateView *)self setNeedsLayout];
    }
    else
    {
      [(UIVisualEffectView *)backdropView removeFromSuperview];
      objc_super v9 = self->_backdropView;
      self->_backdropView = 0;
    }
  }
}

- (void)setOverlayBlurOffset:(double)a3
{
  self->_bgVisualEffectOffset = a3;
  bgVisualEffectView = self->_bgVisualEffectView;
  if (a3 == 0.0)
  {
    [(UIVisualEffectView *)bgVisualEffectView removeFromSuperview];
    v10 = self->_bgVisualEffectView;
    self->_bgVisualEffectView = 0;
  }
  else
  {
    if (!bgVisualEffectView)
    {
      id v5 = objc_alloc(MEMORY[0x263F1CB98]);
      v6 = [MEMORY[0x263F1C480] effectWithStyle:5000];
      v7 = (UIVisualEffectView *)[v5 initWithEffect:v6];
      v8 = self->_bgVisualEffectView;
      self->_bgVisualEffectView = v7;

      objc_super v9 = self->_bgVisualEffectView;
      if (self->_bgImageView) {
        -[_TVListTemplateView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v9);
      }
      else {
        -[_TVListTemplateView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9);
      }
    }
    [(_TVListTemplateView *)self bounds];
    uint64_t v11 = self->_bgVisualEffectView;
    -[UIVisualEffectView setFrame:](v11, "setFrame:");
  }
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_listView)
  {
    v4[0] = self->_listView;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (void)adjustScrollForListView:(id)a3
{
  if (!self->_floatingBanner)
  {
    bannerView = self->_bannerView;
    id v5 = a3;
    [(UIView *)bannerView tv_margin];
    double v7 = v6;
    [(UIView *)self->_bannerView frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v5 contentOffset];
    double v15 = v14;
    [v5 contentInset];
    double v17 = v16;

    v18 = self->_bannerView;
    -[UIView setFrame:](v18, "setFrame:", v9, v7 - (v15 + v17), v11, v13);
  }
}

- (int64_t)listAlignment
{
  v2 = [(_TVListTemplateView *)self listView];
  int64_t v3 = objc_msgSend(v2, "tv_alignment");

  if ((v3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    return v3;
  }
  else {
    return 3;
  }
}

- (void)layoutSubviews
{
  v117.receiver = self;
  v117.super_class = (Class)_TVListTemplateView;
  [(_TVListTemplateView *)&v117 layoutSubviews];
  [(_TVListTemplateView *)self bounds];
  double v4 = v3;
  double v111 = v5;
  double v6 = [(_TVListTemplateView *)self bannerView];
  objc_msgSend(v6, "tv_margin");
  double v8 = v7;
  double v10 = v9;
  double v113 = v11;
  double v13 = v12;
  double v14 = v7;

  bgImageView = self->_bgImageView;
  [(_TVListTemplateView *)self bounds];
  -[UIView setFrame:](bgImageView, "setFrame:");
  overallFocusGuide = self->_overallFocusGuide;
  [(_TVListTemplateView *)self bounds];
  [(UIFocusContainerGuide *)overallFocusGuide _setManualLayoutFrame:"_setManualLayoutFrame:"];
  double v17 = v4;
  if (v4 - (v10 + v13) >= 0.0) {
    double v18 = v4 - (v10 + v13);
  }
  else {
    double v18 = 0.0;
  }
  v19 = [(_TVListTemplateView *)self bannerView];
  objc_msgSend(v19, "sizeThatFits:", v18, 0.0);
  double v21 = v20;

  if (!self->_floatingBanner)
  {
    v22 = [(_TVListTemplateView *)self listView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v24 = [(_TVListTemplateView *)self listView];
      v25 = [v24 collectionView];

      [v25 contentOffset];
      double v27 = v26;
      [v25 contentInset];
      double v14 = v8 - (v27 + v28);
    }
  }
  v29 = [(_TVListTemplateView *)self bannerView];
  objc_msgSend(v29, "setFrame:", v10, v14, v18, v21);

  v30 = [(_TVListTemplateView *)self listView];
  objc_msgSend(v30, "tv_margin");
  double v32 = v31;
  double v34 = v33;
  double v110 = v35;
  double v115 = v36;

  int64_t v37 = [(_TVListTemplateView *)self listAlignment];
  double bgVisualEffectOffset = self->_bgVisualEffectOffset;
  if (bgVisualEffectOffset == 0.0) {
    double v39 = v113;
  }
  else {
    double v39 = -0.0;
  }
  double v40 = v8 + v21;
  if (bgVisualEffectOffset == 0.0) {
    double v41 = v8 + v21;
  }
  else {
    double v41 = self->_bgVisualEffectOffset;
  }
  if ([(_TVListTemplateView *)self shouldAdjustListForTabBar])
  {
    [(_TVListTemplateView *)self safeAreaInsets];
    double v43 = v42 + 17.0;
  }
  else
  {
    double v43 = v41 + v32 + v39;
  }
  double v44 = v17;
  v45 = [(_TVListTemplateView *)self listView];
  objc_msgSend(v45, "tv_itemWidth");
  double Width = v46;

  if (Width == 0.0)
  {
    [(_TVListTemplateView *)self bounds];
    double Width = CGRectGetWidth(v118);
  }
  if (v37 == 1) {
    double v48 = v34;
  }
  else {
    double v48 = v44 - Width - v115;
  }
  v49 = [(_TVListTemplateView *)self listView];
  double v112 = v48;
  objc_msgSend(v49, "setFrame:", v48, v43, Width, v111 - (v110 + v43));

  v50 = [(UIVisualEffectView *)self->_backdropView layer];
  [v50 setCornerRadius:40.0];

  v51 = [(UIVisualEffectView *)self->_backdropView layer];
  [v51 setMasksToBounds:1];

  double v109 = Width;
  if (v37 == 3)
  {
    [(UIView *)self->_listView frame];
    double MinX = CGRectGetMinX(v119) - v34;
    backdropView = self->_backdropView;
    double v54 = v44 - MinX - v115;
LABEL_25:
    -[UIVisualEffectView setFrame:](backdropView, "setFrame:", MinX, v43, v54, v111 - v43 - v110);
    uint64_t v55 = 0;
    goto LABEL_27;
  }
  if (v37 == 1)
  {
    [(UIView *)self->_listView frame];
    double MinX = CGRectGetMinX(v120);
    backdropView = self->_backdropView;
    [(UIView *)self->_listView frame];
    double v54 = v115 + CGRectGetMaxX(v121) - v34;
    goto LABEL_25;
  }
  uint64_t v55 = 1;
LABEL_27:
  [(UIVisualEffectView *)self->_backdropView setHidden:v55];
  v56 = [(_TVListTemplateView *)self previewView];
  objc_msgSend(v56, "tv_margin");
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;

  v65 = [(_TVListTemplateView *)self previewView];
  objc_msgSend(v65, "tv_itemWidth");
  double v67 = v66;

  double v68 = self->_bgVisualEffectOffset;
  double v69 = -0.0;
  if (v68 == 0.0) {
    double v69 = v113;
  }
  double v70 = v58 + v69;
  double v71 = v44 - (v64 + v34 + v109 + fmax(v115, v60));
  double v114 = fmax(v64, v34);
  if (v37 == 3) {
    double v72 = v112 - (v60 + v114);
  }
  else {
    double v72 = v71;
  }
  if (v68 == 0.0) {
    double v68 = v108;
  }
  double v73 = v68 + v70;
  double v74 = v111 - (v62 + v68 + v70);
  if (v74 > 0.0) {
    double v75 = v74;
  }
  else {
    double v75 = 0.0;
  }
  v76 = [(_TVListTemplateView *)self previewView];
  v77 = v76;
  if (v67 >= v72 || v67 <= 0.0) {
    double v79 = v72;
  }
  else {
    double v79 = v67;
  }
  objc_msgSend(v76, "sizeThatFits:", v79, 0.0);
  double v81 = v80;
  double v83 = v82;

  double v84 = fmin(v81, v72);
  if (v81 > 0.0) {
    double v85 = v84;
  }
  else {
    double v85 = v72;
  }
  double v86 = fmin(v83, v75);
  if (v83 > 0.0) {
    double v87 = v86;
  }
  else {
    double v87 = v75;
  }
  if (v87 < v75)
  {
    v88 = [(_TVListTemplateView *)self previewView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v89 = [(_TVListTemplateView *)self previewView];
      v90 = [v89 collectionView];
      objc_opt_class();
      char v91 = objc_opt_isKindOfClass();

      if (v91) {
        double v87 = v75;
      }
    }
    else
    {
    }
  }
  v92 = [(_TVListTemplateView *)self previewView];
  uint64_t v93 = objc_msgSend(v92, "tv_alignment");

  if (v93 == 2)
  {
    float v94 = (v72 - v85) * 0.5;
    double v95 = floorf(v94);
    if (v37 == 3) {
      double v60 = v112 - v85 - v114 - v95;
    }
    else {
      double v60 = v109 + v112 + fmax(v60, v115) + v95;
    }
  }
  else
  {
    double v96 = fmax(v60, v115);
    if (v37 != 3) {
      double v60 = v109 + v112 + v96;
    }
  }
  if ([(_TVListTemplateView *)self shouldAdjustPreviewForTabBar])
  {
    [(_TVListTemplateView *)self safeAreaInsets];
    if (v73 < v97) {
      double v73 = v97;
    }
    double v87 = v87 - v73;
  }
  v98 = [(_TVListTemplateView *)self previewView];
  objc_msgSend(v98, "setFrame:", v60, v73, v85, v87);

  -[UIFocusContainerGuide _setManualLayoutFrame:](self->_previewFocusGuide, "_setManualLayoutFrame:", v60, 0.0, v85, v111);
  v99 = [(_TVListTemplateView *)self listView];

  if (v99)
  {
    v100 = self->_backdropView;
    if (v100)
    {
      v101 = [(UIVisualEffectView *)v100 superview];

      if (v101 != self)
      {
        v102 = self->_backdropView;
        v103 = [(_TVListTemplateView *)self listView];
        [(_TVListTemplateView *)self insertSubview:v102 belowSubview:v103];
      }
    }
    previewView = self->_previewView;
    if (previewView)
    {
      v105 = [(UIView *)previewView superview];

      if (v105 != self)
      {
        v106 = self->_previewView;
        if (self->_backdropView) {
          -[_TVListTemplateView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v106);
        }
        else {
          [(_TVListTemplateView *)self insertSubview:v106 above:self->_listView];
        }
        [(UIView *)self->_previewView alpha];
        if (v107 < 1.0)
        {
          v116[0] = MEMORY[0x263EF8330];
          v116[1] = 3221225472;
          v116[2] = __37___TVListTemplateView_layoutSubviews__block_invoke;
          v116[3] = &unk_264BA69A0;
          v116[4] = self;
          [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v116 options:0 animations:0.2 completion:0.0];
        }
      }
    }
  }
}

- (UIView)bgImageView
{
  return self->_bgImageView;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (UIView)listView
{
  return self->_listView;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (BOOL)isBackdropEnabled
{
  return self->_backdropEnabled;
}

- (BOOL)floatingBanner
{
  return self->_floatingBanner;
}

- (BOOL)shouldAdjustListForTabBar
{
  return self->_shouldAdjustListForTabBar;
}

- (void)setShouldAdjustListForTabBar:(BOOL)a3
{
  self->_shouldAdjustListForTabBar = a3;
}

- (BOOL)shouldAdjustPreviewForTabBar
{
  return self->_shouldAdjustPreviewForTabBar;
}

- (void)setShouldAdjustPreviewForTabBar:(BOOL)a3
{
  self->_shouldAdjustPreviewForTabBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_overallFocusGuide, 0);
  objc_storeStrong((id *)&self->_previewFocusGuide, 0);
  objc_storeStrong((id *)&self->_bgVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end