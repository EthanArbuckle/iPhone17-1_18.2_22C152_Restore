@interface SBHWallpaperDimControl
- (BOOL)isDimmed;
- (BOOL)isPointerInteractionEnabled;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (SBHWallpaperDimControl)initWithFrame:(CGRect)a3;
- (UIView)referenceLayoutView;
- (void)_updateFilters;
- (void)_updatePackageView:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDimmed:(BOOL)a3;
- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setReferenceLayoutView:(id)a3;
@end

@implementation SBHWallpaperDimControl

- (SBHWallpaperDimControl)initWithFrame:(CGRect)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBHWallpaperDimControl;
  v3 = -[SBHWallpaperDimControl initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 URLForResource:@"Dim Icon Asset" withExtension:@"ca"];

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F4F8A0]) initWithURL:v5];
    packageView = v3->_packageView;
    v3->_packageView = (BSUICAPackageView *)v6;

    v8 = v3->_packageView;
    [(SBHWallpaperDimControl *)v3 bounds];
    -[BSUICAPackageView setFrame:](v8, "setFrame:");
    [(BSUICAPackageView *)v3->_packageView setUserInteractionEnabled:0];
    v9 = [(BSUICAPackageView *)v3->_packageView layer];
    [v9 setAllowsGroupOpacity:1];

    [(SBHWallpaperDimControl *)v3 setPointerStyleProvider:&__block_literal_global_39];
    [(SBHWallpaperDimControl *)v3 addSubview:v3->_packageView];
    v3->_isDimmed = 0;
    [(SBHWallpaperDimControl *)v3 _updatePackageView:0];
    [(SBHWallpaperDimControl *)v3 _updateFilters];
    v10 = self;
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v12 = (id)[(SBHWallpaperDimControl *)v3 registerForTraitChanges:v11 withTarget:v3 action:sel__updateFilters];
  }
  return v3;
}

id __40__SBHWallpaperDimControl_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 bounds];
  CGRect v10 = CGRectInset(v9, -8.0, -8.0);
  v5 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  uint64_t v6 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v4 shape:v5];

  return v6;
}

- (BOOL)isPointerInteractionEnabled
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHWallpaperDimControl;
  [(SBHWallpaperDimControl *)&v3 layoutSubviews];
  [(SBHWallpaperDimControl *)self bounds];
  -[BSUICAPackageView setFrame:](self->_packageView, "setFrame:");
}

- (void)setDimmed:(BOOL)a3
{
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isDimmed != a3)
  {
    BOOL v4 = a4;
    self->_isDimmed = a3;
    [(SBHWallpaperDimControl *)self sendActionsForControlEvents:4096];
    [(SBHWallpaperDimControl *)self _updatePackageView:v4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHWallpaperDimControl;
  -[SBHWallpaperDimControl setHighlighted:](&v5, sel_setHighlighted_);
  SBHUIViewAnimateHighlight(self->_packageView, v3);
}

- (void)setReferenceLayoutView:(id)a3
{
  objc_storeWeak((id *)&self->_referenceLayoutView, a3);
  [(SBHWallpaperDimControl *)self invalidateIntrinsicContentSize];
  [(SBHWallpaperDimControl *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  WeakRetained = (BSUICAPackageView *)objc_loadWeakRetained((id *)&self->_referenceLayoutView);
  packageView = WeakRetained;
  if (!WeakRetained) {
    packageView = self->_packageView;
  }
  objc_super v5 = packageView;

  [(BSUICAPackageView *)v5 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  WeakRetained = (BSUICAPackageView *)objc_loadWeakRetained((id *)&self->_referenceLayoutView);
  packageView = WeakRetained;
  if (!WeakRetained) {
    packageView = self->_packageView;
  }
  id v12 = packageView;

  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  -[BSUICAPackageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v13, v14);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)_updateFilters
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHWallpaperDimControl *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  objc_super v5 = (void *)MEMORY[0x1E4F3A2E0];
  if (v4 != 1) {
    objc_super v5 = (void *)MEMORY[0x1E4F3A2E8];
  }
  double v6 = [MEMORY[0x1E4F39BC0] filterWithType:*v5];
  double v7 = [(SBHWallpaperDimControl *)self layer];
  [v7 setCompositingFilter:v6];

  if (v4 == 1) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  double v8 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  double v9 = [v8 colorWithAlphaComponent:0.54];

  double v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A040]];
  id v11 = v9;
  objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v11, "CGColor"), @"inputColor");
  [v10 setValue:&unk_1F300F0F0 forKey:@"inputBias"];
  [v10 setValue:&unk_1F300F100 forKey:@"inputAmount"];
  id v12 = [(SBHWallpaperDimControl *)self layer];
  v14[0] = v10;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v12 setFilters:v13];
}

- (void)_updatePackageView:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isDimmed) {
    objc_super v5 = @"dim";
  }
  else {
    objc_super v5 = @"not dim";
  }
  double v6 = (void *)MEMORY[0x1E4F39CF8];
  double v7 = v5;
  [v6 begin];
  [(BSUICAPackageView *)self->_packageView setState:v7 animated:v3];

  [(SBHWallpaperDimControl *)self _updateFilters];
  double v8 = (void *)MEMORY[0x1E4F39CF8];
  [v8 commit];
}

- (BOOL)isDimmed
{
  return self->_isDimmed;
}

- (UIView)referenceLayoutView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceLayoutView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_referenceLayoutView);
  objc_storeStrong((id *)&self->_packageView, 0);
}

@end