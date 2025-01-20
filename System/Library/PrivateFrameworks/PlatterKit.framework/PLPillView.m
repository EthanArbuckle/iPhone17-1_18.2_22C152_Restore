@interface PLPillView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFitsContentItem:(id)a3;
- (NSArray)centerContentItems;
- (NSString)materialGroupNameBase;
- (NSString)preferredContentSizeCategory;
- (PLPillContentItem)referenceContentItemForIntrinsicContentSize;
- (PLPillView)init;
- (PLPillView)initWithLeadingAccessoryView:(id)a3;
- (PLPillView)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4;
- (PLPillView)initWithTrailingAccessoryView:(id)a3;
- (UIEdgeInsets)shadowOutsets;
- (UIView)leadingAccessoryView;
- (UIView)trailingAccessoryView;
- (double)_effectiveCornerRadius;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_configureShadowViewIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCenterContentItems:(id)a3;
- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3;
- (void)updateCenterContentItem:(id)a3 withContentItem:(id)a4;
@end

@implementation PLPillView

- (PLPillView)init
{
  return [(PLPillView *)self initWithLeadingAccessoryView:0 trailingAccessoryView:0];
}

- (PLPillView)initWithLeadingAccessoryView:(id)a3
{
  return [(PLPillView *)self initWithLeadingAccessoryView:a3 trailingAccessoryView:0];
}

- (PLPillView)initWithTrailingAccessoryView:(id)a3
{
  return [(PLPillView *)self initWithLeadingAccessoryView:0 trailingAccessoryView:a3];
}

- (PLPillView)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v33 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PLPillView;
  v6 = -[PLPillView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_adjustsFontForContentSizeCategory = 1;
    v8 = [(PLPillView *)v6 traitCollection];
    uint64_t v9 = [v8 preferredContentSizeCategory];
    preferredContentSizeCategory = v7->_preferredContentSizeCategory;
    v7->_preferredContentSizeCategory = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:53 options:8];
    materialView = v7->_materialView;
    v7->_materialView = (MTMaterialView *)v11;

    [(PLPillView *)v7 addSubview:v7->_materialView];
    v13 = [[PLPillContentView alloc] initWithLeadingAccessoryView:v32 trailingAccessoryView:v33];
    contentView = v7->_contentView;
    v7->_contentView = v13;

    [(PLPillContentView *)v7->_contentView setAdjustsFontForContentSizeCategory:v7->_adjustsFontForContentSizeCategory];
    [(PLPillView *)v7 addSubview:v7->_contentView];
    v31 = [(PLPillContentView *)v7->_contentView leadingAnchor];
    v30 = [(PLPillView *)v7 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v39[0] = v29;
    v15 = [(PLPillContentView *)v7->_contentView trailingAnchor];
    v16 = [(PLPillView *)v7 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v39[1] = v17;
    v18 = [(PLPillContentView *)v7->_contentView topAnchor];
    v19 = [(PLPillView *)v7 topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v39[2] = v20;
    v21 = [(PLPillContentView *)v7->_contentView bottomAnchor];
    v22 = [(PLPillView *)v7 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v39[3] = v23;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v28];
    objc_initWeak(&location, v7);
    v24 = self;
    v38 = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __65__PLPillView_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke;
    v34[3] = &unk_1E6B5FCF8;
    objc_copyWeak(&v35, &location);
    id v26 = (id)[(PLPillView *)v7 registerForTraitChanges:v25 withHandler:v34];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __65__PLPillView_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[432])
    {
      v6 = [WeakRetained traitCollection];
      uint64_t v7 = [v6 preferredContentSizeCategory];

      v8 = (void *)v5[55];
      v5[55] = v7;

      [v5 adjustForContentSizeCategoryChange];
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F42FF8], "bs_nextViewControllerForView:", v5);
    objc_msgSend(v9, "bs_traitCollectionDidChange:forManagedTraitEnvironment:", v10, v5);
  }
}

- (UIView)leadingAccessoryView
{
  return [(PLPillContentView *)self->_contentView leadingAccessoryView];
}

- (UIView)trailingAccessoryView
{
  return [(PLPillContentView *)self->_contentView trailingAccessoryView];
}

- (NSArray)centerContentItems
{
  return [(PLPillContentView *)self->_contentView centerContentItems];
}

- (void)setCenterContentItems:(id)a3
{
}

- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4
{
}

- (CGSize)sizeThatFitsContentItem:(id)a3
{
  [(PLPillContentView *)self->_contentView sizeThatFitsContentItem:a3];
  result.height = v4;
  result.width = v3;
  return result;
}

- (PLPillContentItem)referenceContentItemForIntrinsicContentSize
{
  return [(PLPillContentView *)self->_contentView referenceContentItemForIntrinsicContentSize];
}

- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3
{
}

- (UIEdgeInsets)shadowOutsets
{
  [(PLPillView *)self _configureShadowViewIfNecessary];
  shadowView = self->_shadowView;
  [(MTShadowView *)shadowView shadowOutsets];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)updateCenterContentItem:(id)a3 withContentItem:(id)a4
{
}

- (CGSize)intrinsicContentSize
{
  [(PLPillContentView *)self->_contentView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PLPillView;
  [(PLPillView *)&v16 layoutSubviews];
  [(PLPillView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PLPillView *)self _effectiveCornerRadius];
  double v12 = v11;
  [(MTMaterialView *)self->_materialView _continuousCornerRadius];
  if (v13 != v12)
  {
    [(MTShadowView *)self->_shadowView removeFromSuperview];
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    [(PLPillView *)self _configureShadowViewIfNecessary];
    [(MTMaterialView *)self->_materialView _setContinuousCornerRadius:v12];
  }
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v4, v6, v8, v10);
  v15 = self->_shadowView;
  -[MTShadowView frameWithContentWithFrame:](v15, "frameWithContentWithFrame:", v4, v6, v8, v10);
  -[MTShadowView setFrame:](v15, "setFrame:");
  [(PLPillContentView *)self->_contentView layoutIfNeeded];
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (NSString)materialGroupNameBase
{
  return (NSString *)[(MTMaterialView *)self->_materialView groupNameBase];
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return (id)[(MTMaterialView *)self->_materialView visualStylingProviderForCategory:a3];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory
      && [(PLPillContentView *)self->_contentView adjustsFontForContentSizeCategory];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(PLPillView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    BOOL v3 = [(PLPillContentView *)self->_contentView adjustForContentSizeCategoryChange];
    if (v3)
    {
      [(PLPillView *)self invalidateIntrinsicContentSize];
      [(PLPillView *)self setNeedsUpdateConstraints];
      [(PLPillView *)self setNeedsLayout];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (double)_effectiveCornerRadius
{
  uint64_t v3 = 424;
  double v4 = [(PLPillContentView *)self->_contentView centerContentItems];
  unint64_t v5 = [v4 count];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (v5 > 1)
  {
    double v8 = 1.0;
  }
  else
  {
    contentView = self->_contentView;
    uint64_t v3 = [v4 lastObject];
    [(PLPillView *)self bounds];
    double v8 = (double)-[PLPillContentView isWrappingRequiredForCenterContentItem:inBounds:](contentView, "isWrappingRequiredForCenterContentItem:inBounds:", v3);
  }
  uint64_t v9 = *MEMORY[0x1E4F437D0];
  double v10 = preferredContentSizeCategory;
  BOOL v11 = [(NSString *)v10 isEqualToString:v9];
  double v12 = (NSString *)*MEMORY[0x1E4F437B0];
  if (!v11) {
    double v12 = v10;
  }
  double v13 = v12;

  if ((v5 > 1 || v8 != 0.0)
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43790], v13) == NSOrderedAscending)
  {
    double v14 = 20.0;
  }
  else
  {
    double v14 = floor(PLContentViewHeightForContentSizeCategory(v13, v5, v8) * 0.5);
  }

  if (v5 <= 1) {
  return v14;
  }
}

- (void)_configureShadowViewIfNecessary
{
  if (!self->_shadowView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F743D0]);
    [(PLPillView *)self _effectiveCornerRadius];
    uint64_t v6 = 1065353216;
    long long v7 = xmmword_1D9406CD0;
    uint64_t v8 = 0x4039000000000000;
    double v4 = (MTShadowView *)objc_msgSend(v3, "initWithShadowAttributes:maskCornerRadius:", &v6);
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    [(PLPillView *)self insertSubview:self->_shadowView atIndex:0];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end