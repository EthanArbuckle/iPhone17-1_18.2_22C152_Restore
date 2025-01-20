@interface PLPillContentView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_isAccessoryPinnedToTopLine;
- (BOOL)_isWrappingRequiredForCenterContentItemView:(id)a3 inBounds:(CGRect)a4;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isWrappingRequiredForCenterContentItem:(id)a3 inBounds:(CGRect)a4;
- (CGSize)_intrinsicContentSizeWithReferenceView:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFitsContentItem:(id)a3;
- (NSArray)centerContentItems;
- (NSString)preferredContentSizeCategory;
- (PLPillContentItem)referenceContentItemForIntrinsicContentSize;
- (PLPillContentView)init;
- (PLPillContentView)initWithLeadingAccessoryView:(id)a3;
- (PLPillContentView)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4;
- (PLPillContentView)initWithTrailingAccessoryView:(id)a3;
- (UIView)leadingAccessoryView;
- (UIView)trailingAccessoryView;
- (double)_capInsetForAccessoryView:(id)a3;
- (double)_capWidthWithAccessoryView:(id)a3;
- (id)_arrangedSubviewForContentItem:(id)a3;
- (id)_referenceContentItemView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_cleanupStackView;
- (void)_configureCenterStackViewIfNecessary;
- (void)_incomingTopWrapperView:(id *)a3 incomingBottomWrapperView:(id *)a4 outgoingWrapperViews:(id)a5 forOutgoingContentItems:(id)a6 incomingContentItems:(id)a7 existingWrapperViews:(id)a8;
- (void)_invalidateVerticalCenterConstraintsForAccessoryView:(id)a3;
- (void)_updateConstraintsForAccessoryView:(id)a3;
- (void)_updateConstraintsForWrapperView:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCenterContentItems:(id)a3;
- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3;
- (void)updateCenterContentItem:(id)a3 withContentItem:(id)a4;
- (void)updateConstraints;
@end

@implementation PLPillContentView

- (PLPillContentView)init
{
  return [(PLPillContentView *)self initWithLeadingAccessoryView:0 trailingAccessoryView:0];
}

- (PLPillContentView)initWithLeadingAccessoryView:(id)a3
{
  return [(PLPillContentView *)self initWithLeadingAccessoryView:a3 trailingAccessoryView:0];
}

- (PLPillContentView)initWithTrailingAccessoryView:(id)a3
{
  return [(PLPillContentView *)self initWithLeadingAccessoryView:0 trailingAccessoryView:a3];
}

- (PLPillContentView)initWithLeadingAccessoryView:(id)a3 trailingAccessoryView:(id)a4
{
  v6 = (_PLPillAccessoryWrapperView *)a3;
  v7 = (_PLPillAccessoryWrapperView *)a4;
  v18.receiver = self;
  v18.super_class = (Class)PLPillContentView;
  v8 = -[PLPillContentView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    [(PLPillContentView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(PLPillContentView *)v9 traitCollection];
    uint64_t v11 = [v10 preferredContentSizeCategory];
    preferredContentSizeCategory = v9->_preferredContentSizeCategory;
    v9->_preferredContentSizeCategory = (NSString *)v11;

    int v13 = [(_PLPillAccessoryWrapperView *)v6 translatesAutoresizingMaskIntoConstraints];
    v14 = v6;
    if (v13) {
      v14 = [[_PLPillAccessoryWrapperView alloc] initWithManagedSubview:v6];
    }
    objc_storeStrong((id *)&v9->_leadingAccessoryView, v14);
    if (v13) {

    }
    if (v9->_leadingAccessoryView) {
      -[PLPillContentView addSubview:](v9, "addSubview:");
    }
    int v15 = [(_PLPillAccessoryWrapperView *)v7 translatesAutoresizingMaskIntoConstraints];
    v16 = v7;
    if (v15) {
      v16 = [[_PLPillAccessoryWrapperView alloc] initWithManagedSubview:v7];
    }
    objc_storeStrong((id *)&v9->_trailingAccessoryView, v16);
    if (v15) {

    }
    if (v9->_trailingAccessoryView) {
      -[PLPillContentView addSubview:](v9, "addSubview:");
    }
  }

  return v9;
}

- (BOOL)isWrappingRequiredForCenterContentItem:(id)a3 inBounds:(CGRect)a4
{
  if (!a3) {
    return 0;
  }
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = -[PLPillContentView _arrangedSubviewForContentItem:](self, "_arrangedSubviewForContentItem:");
  if (v9) {
    BOOL v10 = -[PLPillContentView _isWrappingRequiredForCenterContentItemView:inBounds:](self, "_isWrappingRequiredForCenterContentItemView:inBounds:", v9, x, y, width, height);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)setCenterContentItems:(id)a3
{
}

- (void)setCenterContentItems:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  if ((unint64_t)[v7 count] >= 3)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PLPillContentView.m" lineNumber:153 description:@"PLPillView view can only reason about 2 center content items."];
  }
  p_centerContentItems = &self->_centerContentItems;
  if (([v7 isEqualToArray:self->_centerContentItems] & 1) == 0)
  {
    [(PLPillContentView *)self _configureCenterStackViewIfNecessary];
    v9 = *p_centerContentItems;
    objc_storeStrong((id *)&self->_centerContentItems, a3);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [(NSArray *)*p_centerContentItems firstObject];
    if ([(NSArray *)*p_centerContentItems count] == 2
      && ([(NSArray *)*p_centerContentItems lastObject], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v13 = (void *)v12;
    }
    else
    {
      uint64_t v14 = [v11 soloItem];

      int v13 = 0;
      uint64_t v11 = (void *)v14;
    }
    id v45 = 0;
    v46[0] = 0;
    int v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v11, v13, 0);
    v16 = [(UIStackView *)self->_centerStackView arrangedSubviews];
    v31 = v9;
    [(PLPillContentView *)self _incomingTopWrapperView:v46 incomingBottomWrapperView:&v45 outgoingWrapperViews:v10 forOutgoingContentItems:v9 incomingContentItems:v15 existingWrapperViews:v16];
    id v17 = v46[0];
    id v18 = v45;

    v19 = [v10 firstObject];
    [v19 setTopConstraintBreakable:1];

    if ((unint64_t)[v10 count] >= 2)
    {
      unint64_t v20 = 1;
      do
      {
        v21 = [v10 objectAtIndexedSubscript:v20];
        [v21 setTopConstraintBreakable:0];

        ++v20;
      }
      while (v20 < [v10 count]);
    }
    [v17 setTopConstraintBreakable:v18 != 0];
    [v18 setTopConstraintBreakable:0];
    id v22 = objc_alloc_init(MEMORY[0x1E4F433A0]);
    [v22 _setContainerView:self];
    [v22 _setIsAnimated:1];
    v23 = (void *)MEMORY[0x1E4F42FF0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke;
    v38[3] = &unk_1E6B5FDC0;
    id v39 = v22;
    id v40 = v10;
    id v41 = v17;
    id v42 = v11;
    id v43 = v18;
    id v44 = v13;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke_5;
    v32[3] = &unk_1E6B5FDE8;
    id v33 = v41;
    id v34 = v43;
    id v35 = v40;
    v36 = self;
    id v37 = v39;
    id v24 = v39;
    id v25 = v40;
    id v26 = v43;
    id v27 = v41;
    id v28 = v13;
    id v29 = v11;
    [v23 _animateUsingDefaultDampedSpringWithDelay:4100 initialSpringVelocity:v38 options:v32 animations:0.0 completion:0.0];
    [(PLPillContentView *)self invalidateIntrinsicContentSize];
    [(PLPillContentView *)self needsUpdateConstraints];
    [(PLPillContentView *)self setNeedsLayout];
  }
}

void __52__PLPillContentView_setCenterContentItems_animated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke_3;
  v12[3] = &unk_1E6B5FD98;
  id v13 = *(id *)(a1 + 32);
  v2 = (void (**)(void, void, void))MEMORY[0x1D948D440](v12);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        __52__PLPillContentView_setCenterContentItems_animated___block_invoke_2(v4, *(void **)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v14 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }

  v2[2](v2, *(void *)(a1 + 48), *(void *)(a1 + 56));
  v2[2](v2, *(void *)(a1 + 64), *(void *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations", (void)v8);
}

void __52__PLPillContentView_setCenterContentItems_animated___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    [v2 setHidden:1];
    [v2 setAlpha:0.0];
    [v2 beginAppearanceTransition:0];
  }
}

void __52__PLPillContentView_setCenterContentItems_animated___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__PLPillContentView_setCenterContentItems_animated___block_invoke_4;
    v11[3] = &unk_1E6B5F800;
    id v8 = v5;
    id v12 = v8;
    id v9 = a3;
    [v7 performWithoutAnimation:v11];
    long long v10 = [*(id *)(a1 + 32) _transitionCoordinator];
    [v8 setContentItem:v9 transitionCoordinator:v10];

    [v8 setHidden:0];
    [v8 setAlpha:1.0];
    [v8 beginAppearanceTransition:1];
  }
}

uint64_t __52__PLPillContentView_setCenterContentItems_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) beginAppearanceTransition:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 endAppearanceTransition:0];
}

uint64_t __52__PLPillContentView_setCenterContentItems_animated___block_invoke_5(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1[4] endAppearanceTransition:1];
  [a1[5] endAppearanceTransition:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = a1[6];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "endAppearanceTransition:", 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [a1[7] _cleanupStackView];
  return [a1[8] completeTransition:1];
}

- (CGSize)sizeThatFitsContentItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPillContentView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = UIViewForPLPillContentItem(v4, v6);

  [(PLPillContentView *)self _intrinsicContentSizeWithReferenceView:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setReferenceContentItemForIntrinsicContentSize:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_referenceContentItemForIntrinsicContentSize, a3);
    referenceContentItemView = self->_referenceContentItemView;
    self->_referenceContentItemView = 0;
  }
}

- (void)updateCenterContentItem:(id)a3 withContentItem:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NSArray *)self->_centerContentItems containsObject:v9])
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2, self, @"PLPillContentView.m", 238, @"Invalid parameter not satisfying: %@", @"[_centerContentItems containsObject:referenceContentItem]" object file lineNumber description];

  if (v7) {
LABEL_3:
  }
    [v9 updateWithContentItem:v7];
LABEL_4:
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = [(PLPillContentView *)self _referenceContentItemView];
  [(PLPillContentView *)self _intrinsicContentSizeWithReferenceView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)updateConstraints
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PLPillContentView;
  [(PLPillContentView *)&v17 updateConstraints];
  [(PLPillContentView *)self _updateConstraintsForAccessoryView:self->_leadingAccessoryView];
  [(PLPillContentView *)self _updateConstraintsForAccessoryView:self->_trailingAccessoryView];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(UIStackView *)self->_centerStackView arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = objc_opt_class();
        id v10 = v8;
        if (v9)
        {
          if (objc_opt_isKindOfClass()) {
            double v11 = v10;
          }
          else {
            double v11 = 0;
          }
        }
        else
        {
          double v11 = 0;
        }
        id v12 = v11;

        [(PLPillContentView *)self _updateConstraintsForWrapperView:v12];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PLPillContentView;
  -[PLPillContentView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (PLPillContentView *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 == self) {
    uint64_t v5 = 0;
  }
  uint64_t v7 = v5;

  return v7;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_adjustsFontForContentSizeCategory)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = [(UIStackView *)self->_centerStackView arrangedSubviews];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v6 adjustsFontForContentSizeCategory] & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(PLPillContentView *)self adjustsFontForContentSizeCategory])
  {
    uint64_t v3 = [(PLPillContentView *)self traitCollection];
    uint64_t v4 = [v3 preferredContentSizeCategory];

    if ((BSEqualObjects() & 1) == 0) {
      objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(UIStackView *)self->_centerStackView arrangedSubviews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            int v8 = ([v11 adjustForContentSizeCategoryChange] | v8) & 1;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);

      if (v8)
      {
        [(PLPillContentView *)self invalidateIntrinsicContentSize];
        [(PLPillContentView *)self _invalidateVerticalCenterConstraintsForAccessoryView:self->_leadingAccessoryView];
        [(PLPillContentView *)self _invalidateVerticalCenterConstraintsForAccessoryView:self->_trailingAccessoryView];
        [(PLPillContentView *)self setNeedsUpdateConstraints];
        [(PLPillContentView *)self setNeedsLayout];
        BOOL v12 = 1;
LABEL_18:

        return v12;
      }
    }
    else
    {
    }
    BOOL v12 = 0;
    goto LABEL_18;
  }
  return 0;
}

- (id)_referenceContentItemView
{
  referenceContentItemView = self->_referenceContentItemView;
  if (!referenceContentItemView)
  {
    referenceContentItemForIntrinsicContentSize = self->_referenceContentItemForIntrinsicContentSize;
    if (referenceContentItemForIntrinsicContentSize)
    {
      uint64_t v5 = [(PLPillContentView *)self traitCollection];
      uint64_t v6 = [v5 preferredContentSizeCategory];
      UIViewForPLPillContentItem(referenceContentItemForIntrinsicContentSize, v6);
      uint64_t v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      int v8 = self->_referenceContentItemView;
      self->_referenceContentItemView = v7;

      referenceContentItemView = self->_referenceContentItemView;
    }
    else
    {
      referenceContentItemView = 0;
    }
  }
  return referenceContentItemView;
}

- (BOOL)_isAccessoryPinnedToTopLine
{
  uint64_t v3 = [(UIStackView *)self->_centerStackView arrangedSubviews];
  BOOL v4 = (unint64_t)[v3 count] >= 2
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43778], self->_preferredContentSizeCategory) == NSOrderedAscending;

  return v4;
}

- (BOOL)_isWrappingRequiredForCenterContentItemView:(id)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  leadingAccessoryView = self->_leadingAccessoryView;
  id v10 = a3;
  [(PLPillContentView *)self _capWidthWithAccessoryView:leadingAccessoryView];
  double v12 = v11;
  [(PLPillContentView *)self _capWidthWithAccessoryView:self->_trailingAccessoryView];
  double v14 = v13;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  objc_msgSend(v10, "sizeThatFits:", CGRectGetWidth(v18) - v12 - v14, 1.79769313e308);
  double v16 = v15;

  return v16 + 24.0 > PLContentViewHeightForContentSizeCategory(self->_preferredContentSizeCategory, 1uLL, 0.0);
}

- (CGSize)_intrinsicContentSizeWithReferenceView:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIStackView *)self->_centerStackView arrangedSubviews];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 arrayByAddingObject:v4];

    uint64_t v6 = (void *)v7;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v48;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "sizeThatFits:", 1.79769313e308, 1.79769313e308, (void)v47);
        if (v14 >= v12) {
          double v12 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  [(PLPillContentView *)self _capWidthWithAccessoryView:self->_leadingAccessoryView];
  double v16 = v15;
  [(PLPillContentView *)self _capWidthWithAccessoryView:self->_trailingAccessoryView];
  double v18 = v17;
  uint64_t v19 = (void *)MEMORY[0x1E4F42D90];
  unint64_t v20 = self->_preferredContentSizeCategory;
  v21 = [v19 mainScreen];
  [v21 bounds];
  double v23 = v22;

  id v24 = [MEMORY[0x1E4F42D90] mainScreen];
  [v24 bounds];
  double v26 = v25;

  if (v23 >= v26) {
    double v27 = v26;
  }
  else {
    double v27 = v23;
  }
  double v28 = v27 + -40.0;
  double v29 = fmin(v27 + -40.0, 556.0);
  v30 = (NSString *)*MEMORY[0x1E4F437B0];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F437B0], v20) == NSOrderedAscending)
  {
    double v31 = fmax(v29, 300.0);
    if (v31 >= v28 + -100.0) {
      double v29 = v31;
    }
    else {
      double v29 = v28 + -100.0;
    }
  }
  v32 = (NSString *)*MEMORY[0x1E4F43790];
  NSComparisonResult v33 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43790], v20);

  id v34 = self->_preferredContentSizeCategory;
  NSComparisonResult v35 = UIContentSizeCategoryCompareToCategory(v30, v34);
  NSComparisonResult v36 = UIContentSizeCategoryCompareToCategory(v32, v34);

  unint64_t v37 = [(NSArray *)self->_centerContentItems count];
  double v38 = 0.0;
  if (v37 <= 1)
  {
    id v39 = [(NSArray *)self->_centerContentItems lastObject];
    id v40 = [(PLPillContentView *)self _arrangedSubviewForContentItem:v39];
    [(PLPillContentView *)self bounds];
    double v38 = (double)-[PLPillContentView _isWrappingRequiredForCenterContentItemView:inBounds:](self, "_isWrappingRequiredForCenterContentItemView:inBounds:", v40);
  }
  double v41 = fmax(v29, 400.0);
  if (v41 < v28) {
    double v41 = v28;
  }
  if (v33 != NSOrderedAscending) {
    double v41 = v29;
  }
  double v42 = 200.0;
  if (v35 == NSOrderedAscending) {
    double v42 = 250.0;
  }
  if (v36 == NSOrderedAscending) {
    double v42 = 300.0;
  }
  if (v42 < v12 + v16 + v18) {
    double v42 = v12 + v16 + v18;
  }
  if (v41 <= v42) {
    double v43 = v41;
  }
  else {
    double v43 = v42;
  }
  double v44 = PLContentViewHeightForContentSizeCategory(self->_preferredContentSizeCategory, v37, v38);

  double v45 = v43;
  double v46 = v44;
  result.CGFloat height = v46;
  result.CGFloat width = v45;
  return result;
}

- (id)_arrangedSubviewForContentItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(UIStackView *)self->_centerStackView arrangedSubviews];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 contentItem];
        int v11 = [v10 isLikePillContentItem:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_configureCenterStackViewIfNecessary
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (!self->_centerStackView)
  {
    uint64_t v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4F42E20]);
    centerStackView = self->_centerStackView;
    self->_centerStackView = v3;

    [(UIStackView *)self->_centerStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_centerStackView setAxis:1];
    [(UIStackView *)self->_centerStackView setAlignment:3];
    [(UIStackView *)self->_centerStackView setDistribution:0];
    [(UIStackView *)self->_centerStackView setSpacing:2.0];
    [(PLPillContentView *)self insertSubview:self->_centerStackView atIndex:0];
    long long v15 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v5 = [(UIStackView *)self->_centerStackView leadingAnchor];
    id v6 = [(PLPillContentView *)self leadingAnchor];
    uint64_t v7 = [v5 constraintEqualToAnchor:v6];
    v16[0] = v7;
    id v8 = [(UIStackView *)self->_centerStackView trailingAnchor];
    uint64_t v9 = [(PLPillContentView *)self trailingAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    v16[1] = v10;
    int v11 = [(UIStackView *)self->_centerStackView centerYAnchor];
    double v12 = [(PLPillContentView *)self centerYAnchor];
    long long v13 = [v11 constraintEqualToAnchor:v12];
    v16[2] = v13;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    [v15 activateConstraints:v14];
  }
}

- (void)_cleanupStackView
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(UIStackView *)self->_centerStackView arrangedSubviews];
  uint64_t v3 = (void *)[v2 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "isHidden", (void)v10)) {
          [v9 removeFromSuperview];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (double)_capInsetForAccessoryView:(id)a3
{
  id v4 = (UIView *)a3;
  uint64_t v5 = [(PLPillContentView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F437D0]];
  id v8 = (void *)*MEMORY[0x1E4F437B0];
  if (!v7) {
    id v8 = v6;
  }
  uint64_t v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43790], v9);

  if (v10 == NSOrderedAscending) {
    double v11 = 10.0;
  }
  else {
    double v11 = 30.0;
  }

  if (v4 && (self->_leadingAccessoryView == v4 || self->_trailingAccessoryView == v4))
  {
    [(UIView *)v4 intrinsicContentSize];
    if (v12 + 15.0 + 10.0 <= 45.0) {
      double v11 = 15.0;
    }
    else {
      double v11 = 8.0;
    }
  }

  return v11;
}

- (double)_capWidthWithAccessoryView:(id)a3
{
  id v4 = (UIView *)a3;
  [(PLPillContentView *)self _capInsetForAccessoryView:v4];
  double v6 = v5;
  if (v4 && (self->_leadingAccessoryView == v4 || self->_trailingAccessoryView == v4))
  {
    [(UIView *)v4 intrinsicContentSize];
    double v8 = v6 + v7;
    double v9 = 8.0;
    if (v6 > 8.0) {
      double v9 = 10.0;
    }
    double v6 = v9 + v8;
  }

  return v6;
}

- (void)_updateConstraintsForAccessoryView:(id)a3
{
  id v4 = (UIView *)a3;
  double v5 = v4;
  if (v4 && (self->_leadingAccessoryView == v4 || self->_trailingAccessoryView == v4))
  {
    accessoryViewsToConstraints = self->_accessoryViewsToConstraints;
    id v24 = v5;
    if (!accessoryViewsToConstraints)
    {
      double v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      double v8 = self->_accessoryViewsToConstraints;
      self->_accessoryViewsToConstraints = v7;

      double v5 = v24;
      accessoryViewsToConstraints = self->_accessoryViewsToConstraints;
    }
    id v9 = [(NSMapTable *)accessoryViewsToConstraints objectForKey:v5];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMapTable *)self->_accessoryViewsToConstraints setObject:v9 forKey:v24];
    }
    [(PLPillContentView *)self _capInsetForAccessoryView:v24];
    double v11 = v10;
    leadingAccessoryView = self->_leadingAccessoryView;
    if (leadingAccessoryView == v24) {
      long long v13 = &unk_1F3358DE8;
    }
    else {
      long long v13 = &unk_1F3358E00;
    }
    long long v14 = [v9 objectForKey:v13];
    if (!v14)
    {
      if (leadingAccessoryView == v24)
      {
        uint64_t v15 = [(UIView *)v24 leadingAnchor];
        [(PLPillContentView *)self leadingAnchor];
      }
      else
      {
        uint64_t v15 = [(UIView *)v24 trailingAnchor];
        [(PLPillContentView *)self trailingAnchor];
      long long v16 = };
      long long v14 = [v15 constraintEqualToAnchor:v16];

      [v9 setObject:v14 forKey:v13];
      [v14 setActive:1];
    }
    double v17 = -v11;
    if (leadingAccessoryView == v24) {
      double v17 = v11;
    }
    [v14 setConstant:v17];
    uint64_t v18 = [v9 objectForKey:&unk_1F3358E18];
    if (!v18)
    {
      uint64_t v19 = [(PLPillContentView *)self _isAccessoryPinnedToTopLine];
      unint64_t v20 = [(UIView *)v24 centerYAnchor];
      if (v19)
      {
        v21 = [(UIStackView *)self->_centerStackView arrangedSubviews];
        double v22 = [v21 firstObject];
        double v23 = [v22 centerYAnchor];
        uint64_t v18 = [v20 constraintEqualToAnchor:v23];
      }
      else
      {
        v21 = [(PLPillContentView *)self centerYAnchor];
        uint64_t v18 = [v20 constraintEqualToAnchor:v21];
      }

      [v9 setObject:v18 forKey:&unk_1F3358E18];
      [v18 setActive:1];
    }

    double v5 = v24;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_invalidateVerticalCenterConstraintsForAccessoryView:(id)a3
{
  if (a3)
  {
    -[NSMapTable objectForKey:](self->_accessoryViewsToConstraints, "objectForKey:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v5 objectForKey:&unk_1F3358E18];
    id v4 = v3;
    if (v3)
    {
      [v3 setActive:0];
      [v5 removeObjectForKey:&unk_1F3358E18];
    }
  }
}

- (void)_updateConstraintsForWrapperView:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  if (v32)
  {
    wrapperViewsToConstraints = self->_wrapperViewsToConstraints;
    if (!wrapperViewsToConstraints)
    {
      id v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      double v6 = self->_wrapperViewsToConstraints;
      self->_wrapperViewsToConstraints = v5;

      wrapperViewsToConstraints = self->_wrapperViewsToConstraints;
    }
    id v7 = [(NSMapTable *)wrapperViewsToConstraints objectForKey:v32];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMapTable *)self->_wrapperViewsToConstraints setObject:v7 forKey:v32];
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v8 = [&unk_1F3358EA8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v36 = *(void *)v38;
      uint64_t v35 = *MEMORY[0x1E4F437D0];
      id v34 = (void *)*MEMORY[0x1E4F437B0];
      lhs = (NSString *)*MEMORY[0x1E4F43790];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v36) {
            objc_enumerationMutation(&unk_1F3358EA8);
          }
          double v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v12 = [v11 unsignedIntegerValue];
          long long v13 = [(PLPillContentView *)self traitCollection];
          long long v14 = [v13 preferredContentSizeCategory];
          int v15 = [v14 isEqualToString:v35];
          long long v16 = v34;
          if (!v15) {
            long long v16 = v14;
          }
          double v17 = v16;
          NSComparisonResult v18 = UIContentSizeCategoryCompareToCategory(lhs, v17);

          if (v18 == NSOrderedAscending) {
            double v19 = 10.0;
          }
          else {
            double v19 = 30.0;
          }

          unint64_t v20 = [v7 objectForKey:v11];
          v21 = &OBJC_IVAR___PLPillContentView__trailingAccessoryView;
          if (v12 == 2) {
            v21 = &OBJC_IVAR___PLPillContentView__leadingAccessoryView;
          }
          id v22 = *(id *)((char *)&self->super.super.super.isa + *v21);
          if (v22
            && (![(PLPillContentView *)self _isAccessoryPinnedToTopLine]
             || ([v32 contentItem],
                 double v23 = objc_claimAutoreleasedReturnValue(),
                 [(NSArray *)self->_centerContentItems firstObject],
                 id v24 = objc_claimAutoreleasedReturnValue(),
                 v24,
                 v23,
                 v23 == v24)))
          {
            if (!v20)
            {
              if (v12 == 2)
              {
                double v26 = [v32 leadingAnchor];
                [v22 trailingAnchor];
              }
              else
              {
                double v26 = [v32 trailingAnchor];
                [v22 leadingAnchor];
              double v28 = };
              unint64_t v20 = [v26 constraintEqualToAnchor:v28];
            }
            double v29 = [(NSMapTable *)self->_accessoryViewsToConstraints objectForKey:v22];
            double v25 = [v29 objectForKey:v11];

            [v25 constant];
            if (v30 < 0.0) {
              double v30 = -v30;
            }
            if (v30 <= 8.0) {
              double v19 = 8.0;
            }
            else {
              double v19 = 10.0;
            }
          }
          else
          {
            if (v20) {
              goto LABEL_37;
            }
            if (v12 == 2)
            {
              double v25 = [v32 leadingAnchor];
              [(PLPillContentView *)self leadingAnchor];
            }
            else
            {
              double v25 = [v32 trailingAnchor];
              [(PLPillContentView *)self trailingAnchor];
            double v27 = };
            unint64_t v20 = [v25 constraintEqualToAnchor:v27];
          }
LABEL_37:
          [v7 setObject:v20 forKey:v11];
          [v20 setActive:1];
          double v31 = -v19;
          if (v12 == 2) {
            double v31 = v19;
          }
          [v20 setConstant:v31];
        }
        uint64_t v9 = [&unk_1F3358EA8 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v9);
    }
  }
}

- (void)_incomingTopWrapperView:(id *)a3 incomingBottomWrapperView:(id *)a4 outgoingWrapperViews:(id)a5 forOutgoingContentItems:(id)a6 incomingContentItems:(id)a7 existingWrapperViews:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_35:
    double v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"PLPillContentView.m", 486, @"Invalid parameter not satisfying: %@", @"incomingBottomWrapperViewPtr" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_36;
  }
  double v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, self, @"PLPillContentView.m", 485, @"Invalid parameter not satisfying: %@", @"incomingTopWrapperViewPtr" object file lineNumber description];

  if (!a4) {
    goto LABEL_35;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_36:
  long long v47 = [MEMORY[0x1E4F28B00] currentHandler];
  [v47 handleFailureInMethod:a2, self, @"PLPillContentView.m", 487, @"Invalid parameter not satisfying: %@", @"outgoingWrapperViews" object file lineNumber description];

LABEL_4:
  uint64_t v18 = [v15 count];
  uint64_t v19 = [v16 count];
  unint64_t v20 = [v16 firstObject];
  if ([v16 count] == 2)
  {
    uint64_t v21 = [v16 lastObject];
  }
  else
  {
    uint64_t v21 = 0;
  }
  v51 = v20;
  uint64_t v52 = (void *)v21;
  if (v18 != 2 || v19 != 2)
  {
    double v30 = (PLPillContentWrapperView *)[v17 mutableCopy];
    if (!v19)
    {
      double v27 = 0;
      double v31 = 0;
LABEL_25:
      [v14 addObjectsFromArray:v30];
      goto LABEL_26;
    }
    long long v48 = a3;
    id v32 = v15;
    id v33 = v14;
    id v34 = a4;
LABEL_20:
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_3;
    v53[3] = &unk_1E6B5FE10;
    double v30 = v30;
    v54 = v30;
    long long v40 = (void (**)(void, void))MEMORY[0x1D948D440](v53);
    ((void (**)(void, void *))v40)[2](v40, v20);
    double v27 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue();
    if (v27) {
      [(UIStackView *)self->_centerStackView insertArrangedSubview:v27 atIndex:0];
    }
    ((void (**)(void, void *))v40)[2](v40, v52);
    double v31 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue();
    if (v31) {
      [(UIStackView *)self->_centerStackView addArrangedSubview:v31];
    }

    a4 = v34;
    id v14 = v33;
    id v15 = v32;
    a3 = v48;
    goto LABEL_25;
  }
  id v22 = [v15 lastObject];
  int v23 = [v22 isLikePillContentItem:v20];

  if (v23)
  {
    id v24 = [v15 firstObject];
    double v25 = [v24 wrapperView];
    [v14 addObject:v25];

    double v26 = [v15 lastObject];
    double v27 = [v26 wrapperView];

    [v20 setWrapperView:v27];
    double v28 = [(PLPillContentView *)self _arrangedSubviewForContentItem:v21];
    double v29 = (void *)v21;
    double v30 = v28;
    if (v28)
    {
      double v30 = v28;
      double v31 = v30;
    }
    else
    {
      double v41 = objc_alloc_init(PLPillContentWrapperView);
      [v29 setWrapperView:v41];
      [(PLPillContentWrapperView *)v41 setAdjustsFontForContentSizeCategory:1];
      long long v49 = (void *)MEMORY[0x1E4F42FF0];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke;
      v57[3] = &unk_1E6B5FC08;
      v57[4] = self;
      double v31 = v41;
      v58 = v31;
      [v49 performWithoutAnimation:v57];
    }
    goto LABEL_26;
  }
  if (!v21
    || ([v15 firstObject],
        uint64_t v35 = objc_claimAutoreleasedReturnValue(),
        int v36 = [v35 isLikePillContentItem:v21],
        v35,
        !v36))
  {
    long long v48 = a3;
    id v32 = v15;
    id v33 = v14;
    id v34 = a4;
    double v30 = (PLPillContentWrapperView *)[v17 mutableCopy];
    goto LABEL_20;
  }
  long long v37 = [v15 lastObject];
  long long v38 = [v37 wrapperView];
  [v14 addObject:v38];

  long long v39 = [(PLPillContentView *)self _arrangedSubviewForContentItem:v20];
  double v30 = v39;
  if (v39)
  {
    double v27 = v39;
  }
  else
  {
    uint64_t v42 = objc_alloc_init(PLPillContentWrapperView);
    [v20 setWrapperView:v42];
    [(PLPillContentWrapperView *)v42 setAdjustsFontForContentSizeCategory:1];
    double v43 = (void *)MEMORY[0x1E4F42FF0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_2;
    v55[3] = &unk_1E6B5FC08;
    v55[4] = self;
    double v27 = v42;
    v56 = v27;
    [v43 performWithoutAnimation:v55];
  }
  double v44 = [v15 firstObject];
  double v31 = [v44 wrapperView];

  [v52 setWrapperView:v31];
LABEL_26:

  if (a3) {
    *a3 = v27;
  }
  if (a4) {
    *a4 = v31;
  }
}

uint64_t __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) addArrangedSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setHidden:1];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) insertArrangedSubview:*(void *)(a1 + 40) atIndex:0];
  [*(id *)(a1 + 40) setHidden:1];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

PLPillContentWrapperView *__158__PLPillContentView__incomingTopWrapperView_incomingBottomWrapperView_outgoingWrapperViews_forOutgoingContentItems_incomingContentItems_existingWrapperViews___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 wrapperView];
  id v5 = (PLPillContentWrapperView *)v4;
  if (v3)
  {
    if (v4
      || [*(id *)(a1 + 32) count]
      && ([*(id *)(a1 + 32) firstObject],
          (id v5 = (PLPillContentWrapperView *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      [*(id *)(a1 + 32) removeObject:v5];
    }
    else
    {
      id v5 = objc_alloc_init(PLPillContentWrapperView);
      [(PLPillContentWrapperView *)v5 setAdjustsFontForContentSizeCategory:1];
    }
    [v3 setWrapperView:v5];
  }

  return v5;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (NSArray)centerContentItems
{
  return self->_centerContentItems;
}

- (PLPillContentItem)referenceContentItemForIntrinsicContentSize
{
  return self->_referenceContentItemForIntrinsicContentSize;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategorCGFloat y = a3;
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
  objc_storeStrong((id *)&self->_referenceContentItemForIntrinsicContentSize, 0);
  objc_storeStrong((id *)&self->_centerContentItems, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryViewsToConstraints, 0);
  objc_storeStrong((id *)&self->_wrapperViewsToConstraints, 0);
  objc_storeStrong((id *)&self->_referenceContentItemView, 0);
  objc_storeStrong((id *)&self->_centerStackView, 0);
}

@end