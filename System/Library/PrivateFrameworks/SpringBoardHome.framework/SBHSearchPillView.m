@interface SBHSearchPillView
+ (id)searchPillViewWithSystemDefaultBackground;
- (BOOL)appliesSearchAffordanceCornerRadius;
- (CGRect)clientReferenceFrame;
- (CGRect)searchAffordanceReferenceFrame;
- (CGSize)intrinsicContentSize;
- (SBHSearchPillView)init;
- (SBHSearchPillView)initWithBackgroundViewProvider:(id)a3;
- (UIImageView)searchGlyphImageView;
- (UILabel)searchLabel;
- (UIView)backgroundView;
- (UIView)contentContainerView;
- (UIView)searchAffordanceReferenceBackgroundView;
- (UIView)searchAffordanceReferenceContainerView;
- (UIView)searchAffordanceReferenceView;
- (_UILegibilitySettings)legibilitySettings;
- (double)halfFloatRoundForScale:(double)a3 scale:(double)a4;
- (double)searchAffordanceCornerRadius;
- (id)_backdropGroupNameBase;
- (id)backgroundViewProvider;
- (id)makeSearchAffordanceBackgroundCapturingView;
- (int64_t)labelAlignment;
- (void)_updateBackgroundViewUserInterfaceStyle;
- (void)layoutSubviews;
- (void)setAppliesSearchAffordanceCornerRadius:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setClientReferenceFrame:(CGRect)a3;
- (void)setLabelAlignment:(int64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setSearchAffordanceCornerRadius:(double)a3;
- (void)setSearchAffordanceReferenceBackgroundView:(id)a3;
- (void)setSearchAffordanceReferenceContainerView:(id)a3;
- (void)setSearchAffordanceReferenceFrame:(CGRect)a3;
- (void)setSearchAffordanceReferenceView:(id)a3;
@end

@implementation SBHSearchPillView

- (CGSize)intrinsicContentSize
{
  v3 = [(SBHSearchPillView *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  v6 = [(SBHSearchPillView *)self searchLabel];
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v8);
  double v10 = v9;

  v11 = [(SBHSearchPillView *)self searchGlyphImageView];
  objc_msgSend(v11, "sizeThatFits:", v7, v8);
  double v13 = v10 + v12 + 3.0 + 11.5 + 11.5;

  [(SBHSearchPillView *)self halfFloatRoundForScale:v13 scale:v5];
  double v15 = 30.0;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UILabel)searchLabel
{
  return self->_searchLabel;
}

- (UIImageView)searchGlyphImageView
{
  return self->_searchGlyphImageView;
}

- (double)halfFloatRoundForScale:(double)a3 scale:(double)a4
{
  BSFloatRoundForScale();
  return v4 + v4;
}

+ (id)searchPillViewWithSystemDefaultBackground
{
  v2 = [[SBHSearchPillView alloc] initWithBackgroundViewProvider:&__block_literal_global];
  return v2;
}

uint64_t __62__SBHSearchPillView_searchPillViewWithSystemDefaultBackground__block_invoke()
{
  return [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
}

- (SBHSearchPillView)initWithBackgroundViewProvider:(id)a3
{
  double v4 = (void (**)(void))a3;
  double v5 = [(SBHSearchPillView *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id backgroundViewProvider = v5->_backgroundViewProvider;
    v5->_id backgroundViewProvider = (id)v6;

    double v8 = v4[2](v4);
    double v9 = [(SBHSearchPillView *)v5 _backdropGroupNameBase];
    [v8 setGroupNameBase:v9];

    [(SBHSearchPillView *)v5 setBackgroundView:v8];
  }

  return v5;
}

- (SBHSearchPillView)init
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)SBHSearchPillView;
  v2 = [(SBHSearchPillView *)&v31 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    searchLabel = v2->_searchLabel;
    v2->_searchLabel = v3;

    double v5 = SBHBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"SEARCH_LABEL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

    [(UILabel *)v2->_searchLabel setText:v6];
    double v7 = [MEMORY[0x1E4FB08E8] _preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8] weight:*MEMORY[0x1E4FB09D0]];
    double v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:12.0];
    [(UILabel *)v2->_searchLabel setFont:v8];
    [(UILabel *)v2->_searchLabel sizeToFit];
    double v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    searchGlyphImageView = v2->_searchGlyphImageView;
    v2->_searchGlyphImageView = v9;

    v11 = (void *)MEMORY[0x1E4FB1830];
    [v8 pointSize];
    double v12 = objc_msgSend(v11, "configurationWithPointSize:weight:scale:", 6, 1);
    double v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
    double v14 = [v13 imageByApplyingSymbolConfiguration:v12];

    [(UIImageView *)v2->_searchGlyphImageView setImage:v14];
    [(UIImageView *)v2->_searchGlyphImageView sizeToFit];
    double v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentContainerView = v2->_contentContainerView;
    v2->_contentContainerView = v15;

    v17 = [(UIView *)v2->_contentContainerView layer];
    [v17 setAllowsGroupBlending:0];

    [(SBHSearchPillView *)v2 addSubview:v2->_contentContainerView];
    [(UIView *)v2->_contentContainerView addSubview:v2->_searchGlyphImageView];
    [(UIView *)v2->_contentContainerView addSubview:v2->_searchLabel];
    [(SBHSearchPillView *)v2 intrinsicContentSize];
    BSRectWithSize();
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    -[SBHSearchPillView setBounds:](v2, "setBounds:");
    -[UIView setFrame:](v2->_contentContainerView, "setFrame:", v19, v21, v23, v25);
    v26 = self;
    v32[0] = v26;
    v27 = self;
    v32[1] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v29 = (id)[(SBHSearchPillView *)v2 registerForTraitChanges:v28 withTarget:v2 action:sel__updateBackgroundViewUserInterfaceStyle];

    [(SBHSearchPillView *)v2 _updateBackgroundViewUserInterfaceStyle];
  }
  return v2;
}

- (void)setLegibilitySettings:(id)a3
{
  id v13 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    uint64_t v5 = [v13 style];
    uint64_t v6 = [v13 primaryColor];
    double v7 = [v6 colorWithAlphaComponent:0.7];

    [(UILabel *)self->_searchLabel setTextColor:v7];
    [(UIImageView *)self->_searchGlyphImageView setTintColor:v7];
    double v8 = (id *)MEMORY[0x1E4F3A2E8];
    if (v5 != 1) {
      double v8 = (id *)MEMORY[0x1E4F3A2E0];
    }
    searchLabel = self->_searchLabel;
    id v10 = *v8;
    v11 = [(UILabel *)searchLabel layer];
    [v11 setCompositingFilter:v10];

    double v12 = [(UIImageView *)self->_searchGlyphImageView layer];
    [v12 setCompositingFilter:v10];
  }
}

- (void)setBackgroundView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  double v7 = v5;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(SBHSearchPillView *)self addSubview:v7];
    [(SBHSearchPillView *)self sendSubviewToBack:v7];
    [(SBHSearchPillView *)self _updateBackgroundViewUserInterfaceStyle];
  }
}

- (void)setLabelAlignment:(int64_t)a3
{
  if (self->_labelAlignment != a3)
  {
    self->_labelAlignment = a3;
    [(SBHSearchPillView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v71.receiver = self;
  v71.super_class = (Class)SBHSearchPillView;
  [(SBHSearchPillView *)&v71 layoutSubviews];
  [(SBHSearchPillView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBHSearchPillView *)self backgroundView];
  double v64 = v8;
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  double v63 = v10;
  if ([(SBHSearchPillView *)self appliesSearchAffordanceCornerRadius]) {
    [(SBHSearchPillView *)self searchAffordanceCornerRadius];
  }
  else {
    double v12 = v10 * 0.5;
  }
  [v11 _setContinuousCornerRadius:v12];
  id v13 = [(SBHSearchPillView *)self contentContainerView];
  [v13 bounds];
  double v65 = v14;
  double v66 = v15;
  double v17 = v16;
  double v68 = v18;
  double v19 = [(SBHSearchPillView *)self traitCollection];
  [v19 displayScale];
  uint64_t v21 = v20;

  double v22 = self->_searchLabel;
  [(UILabel *)v22 sizeToFit];
  double v23 = self->_searchGlyphImageView;
  [(UIImageView *)v23 sizeToFit];
  [(UIImageView *)v23 bounds];
  double v25 = v24;
  double v27 = v26;
  double rect = v28;
  BSFloatRoundForScale();
  double v30 = v29;
  objc_super v31 = (id *)MEMORY[0x1E4FB2608];
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    double v30 = v17 - v30 - v27;
  }
  [(UILabel *)v22 bounds];
  uint64_t v32 = [*v31 userInterfaceLayoutDirection];
  double v62 = v30;
  double v33 = v30;
  CGFloat v34 = v25;
  double v35 = v25;
  double v36 = v27;
  double v37 = rect;
  if (v32 == 1) {
    CGRectGetMinX(*(CGRect *)&v33);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v33);
  }
  UIRectCenteredYInRectScale();
  CGFloat v39 = v38;
  double v61 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  BSFloatRoundForScale();
  CGFloat v47 = v46 + v41;
  v48 = [(UIImageView *)v23 image];
  [v48 baselineOffsetFromBottom];
  double v50 = v49;
  v72.origin.x = v39;
  v72.origin.y = v47;
  v72.size.double width = v43;
  v72.size.height = v45;
  double MaxY = CGRectGetMaxY(v72);
  v73.origin.x = v62;
  v73.origin.y = v34;
  v73.size.double width = v27;
  v73.size.height = rect;
  double v52 = v50 + MaxY - CGRectGetHeight(v73);
  [(UILabel *)v22 _baselineOffsetFromBottom];
  -[UIImageView setFrame:](v23, "setFrame:", v62, v52 - v53, v27, rect);
  -[UILabel setFrame:](v22, "setFrame:", v61, v47, v43, v45);
  if (v64 / v17 >= v63 / v68) {
    double v54 = v63 / v68;
  }
  else {
    double v54 = v64 / v17;
  }
  if (BSFloatEqualToFloat())
  {
    long long v55 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v70.c = v55;
    *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v13 setTransform:&v70];
    objc_msgSend(v13, "setFrame:", v65, v66, v17, v68);
  }
  else
  {
    memset(&v70, 0, sizeof(v70));
    CGAffineTransformMakeScale(&v70, v54, v54);
    CGAffineTransform v69 = v70;
    [v13 setTransform:&v69];
    UIRectGetCenter();
    double v57 = v56;
    double v59 = v58;
    if ([(SBHSearchPillView *)self labelAlignment] != 1)
    {
      CGAffineTransform v69 = v70;
      v74.origin.x = v65;
      v74.origin.y = v66;
      v74.size.double width = v17;
      v74.size.height = v68;
      CGRect v75 = CGRectApplyAffineTransform(v74, &v69);
      double width = v75.size.width;
      if (objc_msgSend(*v31, "userInterfaceLayoutDirection", v75.origin.x, v75.origin.y) == 1) {
        double v57 = v64 - width * 0.5;
      }
      else {
        double v57 = width * 0.5;
      }
    }
    objc_msgSend(v13, "setCenter:", v57, v59);
  }
}

- (id)makeSearchAffordanceBackgroundCapturingView
{
  id backgroundViewProvider = (void (**)(id, SEL))self->_backgroundViewProvider;
  if (backgroundViewProvider)
  {
    double v4 = backgroundViewProvider[2](backgroundViewProvider, a2);
    double v5 = [(SBHSearchPillView *)self _backdropGroupNameBase];
    [v4 setGroupNameBase:v5];

    [v4 setCaptureOnly:1];
    createdSearchAffordanceBackgroundCapturingViews = self->_createdSearchAffordanceBackgroundCapturingViews;
    if (!createdSearchAffordanceBackgroundCapturingViews)
    {
      double v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      double v8 = self->_createdSearchAffordanceBackgroundCapturingViews;
      self->_createdSearchAffordanceBackgroundCapturingViews = v7;

      createdSearchAffordanceBackgroundCapturingViews = self->_createdSearchAffordanceBackgroundCapturingViews;
    }
    [(NSHashTable *)createdSearchAffordanceBackgroundCapturingViews addObject:v4];
    double v9 = [(SBHSearchPillView *)self traitCollection];
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v9));
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (CGRect)searchAffordanceReferenceFrame
{
  searchAffordanceReferenceView = self->_searchAffordanceReferenceView;
  if (searchAffordanceReferenceView)
  {
    [(UIView *)self->_searchAffordanceReferenceView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchAffordanceReferenceContainerView);
    -[UIView convertRect:toView:](searchAffordanceReferenceView, "convertRect:toView:", WeakRetained, v5, v7, v9, v11);
    CGFloat x = v13;
    CGFloat y = v15;
    CGFloat width = v17;
    CGFloat height = v19;
  }
  else
  {
    CGFloat x = self->_clientReferenceFrame.origin.x;
    CGFloat y = self->_clientReferenceFrame.origin.y;
    CGFloat width = self->_clientReferenceFrame.size.width;
    CGFloat height = self->_clientReferenceFrame.size.height;
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (void)setSearchAffordanceReferenceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_clientReferenceFrame = &self->_clientReferenceFrame;
  if (!CGRectEqualToRect(self->_clientReferenceFrame, a3))
  {
    p_clientReferenceFrame->origin.CGFloat x = x;
    p_clientReferenceFrame->origin.CGFloat y = y;
    p_clientReferenceFrame->size.CGFloat width = width;
    p_clientReferenceFrame->size.CGFloat height = height;
  }
}

- (void)setAppliesSearchAffordanceCornerRadius:(BOOL)a3
{
  if (self->_appliesSearchAffordanceCornerRadius != a3)
  {
    self->_appliesSearchAffordanceCornerRadius = a3;
    [(SBHSearchPillView *)self setNeedsLayout];
  }
}

- (void)setSearchAffordanceCornerRadius:(double)a3
{
  if (self->_searchAffordanceCornerRadius != a3)
  {
    self->_searchAffordanceCornerRadius = a3;
    [(SBHSearchPillView *)self setNeedsLayout];
  }
}

- (void)setSearchAffordanceReferenceBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_searchAffordanceReferenceBackgroundView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, a3);
    [(SBHSearchPillView *)self _updateBackgroundViewUserInterfaceStyle];
    double v5 = v6;
  }
}

- (id)_backdropGroupNameBase
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SBHSearchPillView::%p", self);
}

- (void)_updateBackgroundViewUserInterfaceStyle
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [(SBHSearchPillView *)self traitCollection];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v3);
  double v5 = [(SBHSearchPillView *)self backgroundView];
  [v5 setOverrideUserInterfaceStyle:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v6 = self->_createdSearchAffordanceBackgroundCapturingViews;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "setOverrideUserInterfaceStyle:", v4, (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  double v11 = [(SBHSearchPillView *)self searchAffordanceReferenceBackgroundView];
  [v11 setOverrideUserInterfaceStyle:v4];
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)labelAlignment
{
  return self->_labelAlignment;
}

- (UIView)searchAffordanceReferenceView
{
  return self->_searchAffordanceReferenceView;
}

- (void)setSearchAffordanceReferenceView:(id)a3
{
}

- (UIView)searchAffordanceReferenceBackgroundView
{
  return self->_searchAffordanceReferenceBackgroundView;
}

- (UIView)searchAffordanceReferenceContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchAffordanceReferenceContainerView);
  return (UIView *)WeakRetained;
}

- (void)setSearchAffordanceReferenceContainerView:(id)a3
{
}

- (BOOL)appliesSearchAffordanceCornerRadius
{
  return self->_appliesSearchAffordanceCornerRadius;
}

- (double)searchAffordanceCornerRadius
{
  return self->_searchAffordanceCornerRadius;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (CGRect)clientReferenceFrame
{
  double x = self->_clientReferenceFrame.origin.x;
  double y = self->_clientReferenceFrame.origin.y;
  double width = self->_clientReferenceFrame.size.width;
  double height = self->_clientReferenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClientReferenceFrame:(CGRect)a3
{
  self->_clientReferenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_searchGlyphImageView, 0);
  objc_storeStrong((id *)&self->_searchLabel, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_destroyWeak((id *)&self->_searchAffordanceReferenceContainerView);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchAffordanceReferenceView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_createdSearchAffordanceBackgroundCapturingViews, 0);
}

@end