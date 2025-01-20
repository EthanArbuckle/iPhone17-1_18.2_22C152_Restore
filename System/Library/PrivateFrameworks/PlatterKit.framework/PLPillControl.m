@interface PLPillControl
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFitsContentItem:(id)a3;
- (NSArray)centerContentItems;
- (NSString)preferredContentSizeCategory;
- (PLPillContentItem)referenceContentItemForIntrinsicContentSize;
- (PLPillControl)init;
- (PLPillControl)initWithLeadingAccessoryView:(id)a3;
- (PLPillControl)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4;
- (PLPillControl)initWithTrailingAccessoryView:(id)a3;
- (UIView)leadingAccessoryView;
- (UIView)trailingAccessoryView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_configureShadowNecessary;
- (void)_performHighlight:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCenterContentItems:(id)a3;
- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3;
@end

@implementation PLPillControl

- (PLPillControl)init
{
  return [(PLPillControl *)self initWithLeadingAccessoryView:0 trailingAccessoryView:0];
}

- (PLPillControl)initWithLeadingAccessoryView:(id)a3
{
  return [(PLPillControl *)self initWithLeadingAccessoryView:a3 trailingAccessoryView:0];
}

- (PLPillControl)initWithTrailingAccessoryView:(id)a3
{
  return [(PLPillControl *)self initWithLeadingAccessoryView:0 trailingAccessoryView:a3];
}

- (PLPillControl)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PLPillControl;
  v6 = -[PLPillControl initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_adjustsFontForContentSizeCategory = 1;
    v8 = [(PLPillControl *)v6 traitCollection];
    uint64_t v9 = [v8 preferredContentSizeCategory];
    preferredContentSizeCategory = v7->_preferredContentSizeCategory;
    v7->_preferredContentSizeCategory = (NSString *)v9;

    v11 = [MEMORY[0x1E4F428B8] whiteColor];
    [(PLPillControl *)v7 setBackgroundColor:v11];

    [(PLPillControl *)v7 _setContinuousCornerRadius:8.0];
    v12 = [[PLPillContentView alloc] initWithLeadingAccessoryView:v33 trailingAccessoryView:v34];
    contentView = v7->_contentView;
    v7->_contentView = v12;

    [(PLPillContentView *)v7->_contentView setUserInteractionEnabled:0];
    [(PLPillContentView *)v7->_contentView setAdjustsFontForContentSizeCategory:v7->_adjustsFontForContentSizeCategory];
    [(PLPillControl *)v7 addSubview:v7->_contentView];
    v32 = [(PLPillContentView *)v7->_contentView leadingAnchor];
    v31 = [(PLPillControl *)v7 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v40[0] = v30;
    v14 = [(PLPillContentView *)v7->_contentView trailingAnchor];
    v15 = [(PLPillControl *)v7 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v40[1] = v16;
    v17 = [(PLPillContentView *)v7->_contentView topAnchor];
    v18 = [(PLPillControl *)v7 topAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v40[2] = v19;
    v20 = [(PLPillContentView *)v7->_contentView bottomAnchor];
    v21 = [(PLPillControl *)v7 bottomAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v40[3] = v22;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v29];
    v23 = [MEMORY[0x1E4F42948] currentDevice];
    LODWORD(v18) = [v23 userInterfaceIdiom] == 1;

    if (v18)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v7];
      [(PLPillControl *)v7 addInteraction:v24];
    }
    objc_initWeak(&location, v7);
    v25 = self;
    v39 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__PLPillControl_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke;
    v35[3] = &unk_1E6B5FCF8;
    objc_copyWeak(&v36, &location);
    id v27 = (id)[(PLPillControl *)v7 registerForTraitChanges:v26 withHandler:v35];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __68__PLPillControl_initWithLeadingAccessoryView_trailingAccessoryView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[464])
    {
      v6 = [WeakRetained traitCollection];
      uint64_t v7 = [v6 preferredContentSizeCategory];

      v8 = (void *)v5[59];
      v5[59] = v7;

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

- (CGSize)intrinsicContentSize
{
  [(PLPillContentView *)self->_contentView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPillControl;
  [(PLPillControl *)&v3 layoutSubviews];
  [(PLPillControl *)self _configureShadowNecessary];
  [(PLPillContentView *)self->_contentView layoutIfNeeded];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLPillControl *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PLPillControl;
    [(PLPillControl *)&v7 setHighlighted:v3];
    if ([MEMORY[0x1E4F42FF0] areAnimationsEnabled]
      && ([MEMORY[0x1E4F42FF0] _isInAnimationBlock] & 1) == 0)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __32__PLPillControl_setHighlighted___block_invoke;
      v5[3] = &unk_1E6B5F828;
      v5[4] = self;
      BOOL v6 = v3;
      [MEMORY[0x1E4F42FF0] _animateUsingDefaultDampedSpringWithDelay:6 initialSpringVelocity:v5 options:0 animations:0.0 completion:0.0];
    }
    else
    {
      [(PLPillControl *)self _performHighlight:v3];
    }
  }
}

uint64_t __32__PLPillControl_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performHighlight:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory
      && [(PLPillContentView *)self->_contentView adjustsFontForContentSizeCategory];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(PLPillControl *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    BOOL v3 = [(PLPillContentView *)self->_contentView adjustForContentSizeCategoryChange];
    if (v3)
    {
      [(PLPillControl *)self invalidateIntrinsicContentSize];
      [(PLPillControl *)self setNeedsUpdateConstraints];
      [(PLPillControl *)self setNeedsLayout];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F42CF8];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  v8 = (void *)MEMORY[0x1E4F427D0];
  [v6 rect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, 8.0);
  [v7 setVisiblePath:v17];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self parameters:v7];
  v19 = [MEMORY[0x1E4F42C88] effectWithPreview:v18];
  v20 = [MEMORY[0x1E4F42CC0] styleWithEffect:v19 shape:0];

  return v20;
}

- (void)_configureShadowNecessary
{
  id v5 = [(PLPillControl *)self layer];
  [v5 shadowOpacity];
  if (fabsf(v2) < 2.2204e-16)
  {
    [v5 setShadowPathIsBounds:1];
    id v3 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v3, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", 0.0, 10.0);
    [v5 setShadowRadius:20.0];
    LODWORD(v4) = 1036831949;
    [v5 setShadowOpacity:v4];
  }
}

- (void)_performHighlight:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.94];
  }
  else {
  id v4 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [(PLPillControl *)self setBackgroundColor:v4];
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
}

@end