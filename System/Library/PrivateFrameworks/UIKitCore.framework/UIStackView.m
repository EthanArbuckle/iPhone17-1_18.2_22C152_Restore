@interface UIStackView
+ (Class)layerClass;
- (BOOL)_hasLayoutArrangements;
- (BOOL)_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged;
- (BOOL)_recordBaselineLoweringInfo;
- (BOOL)_shouldRequestTallestBaselineViewForFirst:(BOOL)a3;
- (BOOL)isBaselineRelativeArrangement;
- (BOOL)isLayoutMarginsRelativeArrangement;
- (CGFloat)customSpacingAfterView:(UIView *)arrangedSubview;
- (CGFloat)spacing;
- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 hasIntentionallyCollapsedHeight:(BOOL *)a6;
- (NSArray)arrangedSubviews;
- (UILayoutConstraintAxis)axis;
- (UIStackView)initWithArrangedSubviews:(NSArray *)views;
- (UIStackView)initWithCoder:(NSCoder *)coder;
- (UIStackView)initWithFrame:(CGRect)frame;
- (UIStackViewAlignment)alignment;
- (UIStackViewDistribution)distribution;
- (double)_calculatedIntrinsicHeight;
- (double)_proportionalFillLengthForOrderedArrangement:(id)a3 relevantParentAxis:(int64_t)a4;
- (id)_baselineViewForFirst:(BOOL)a3;
- (id)_mutableLayoutArrangements;
- (id)description;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_commonStackViewInitializationWithArrangedSubviews:(id)a3;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_vendedBaselineViewDidMoveForFirst:(BOOL)a3;
- (void)_vendedBaselineViewParametersDidChange;
- (void)addArrangedSubview:(UIView *)view;
- (void)encodeWithCoder:(id)a3;
- (void)insertArrangedSubview:(UIView *)view atIndex:(NSUInteger)stackIndex;
- (void)removeArrangedSubview:(UIView *)view;
- (void)setAlignment:(UIStackViewAlignment)alignment;
- (void)setArrangedSubviews:(id)a3;
- (void)setAxis:(UILayoutConstraintAxis)axis;
- (void)setBackgroundColor:(id)a3;
- (void)setBaselineRelativeArrangement:(BOOL)baselineRelativeArrangement;
- (void)setCustomSpacing:(CGFloat)spacing afterView:(UIView *)arrangedSubview;
- (void)setDistribution:(UIStackViewDistribution)distribution;
- (void)setLayoutMarginsRelativeArrangement:(BOOL)layoutMarginsRelativeArrangement;
- (void)setOpaque:(BOOL)a3;
- (void)setSpacing:(CGFloat)spacing;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation UIStackView

BOOL __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3 == 12 && *(unsigned char *)(a1 + 40) || (BOOL v6 = 0, a3 == 11) && *(unsigned char *)(a1 + 41))
  {
    id v7 = *(id *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      do
      {
        uint64_t v8 = [v7 superview];

        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        BOOL v10 = v7 == v5;
        BOOL v6 = v7 == v5;
        id v7 = (id)v8;
      }
      while (!v10 && (isKindOfClass & 1) != 0);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

+ (Class)layerClass
{
  if (dyld_program_sdk_at_least())
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___UIStackView;
    v3 = objc_msgSendSuper2(&v5, sel_layerClass);
  }
  else
  {
    v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
}

- (BOOL)_shouldRequestTallestBaselineViewForFirst:(BOOL)a3
{
  BOOL v3 = a3;
  UIStackViewAlignment v5 = [(UIStackView *)self alignment];
  if ([(UIStackView *)self axis]) {
    return 0;
  }
  if ((unint64_t)(v5 - 3) >= 0xFFFFFFFFFFFFFFFELL && !v3) {
    return 1;
  }
  BOOL v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 4 && v3;
  return v5 == UIStackViewAlignmentCenter || v7;
}

- (UILayoutConstraintAxis)axis
{
  return [(_UILayoutArrangement *)self->_distributionArrangement axis];
}

- (UIStackViewAlignment)alignment
{
  unsigned int v2 = [(_UIAlignedLayoutArrangement *)self->_alignmentArrangement alignment];
  if ((v2 & 0x200) != 0) {
    return 3;
  }
  if ((v2 & 0x1000) != 0) {
    return 2;
  }
  if ((v2 & 0x800) != 0) {
    return 5;
  }
  if ((v2 & 8) != 0) {
    return ~(v2 >> 4) & 1;
  }
  return 4;
}

- (UIStackViewDistribution)distribution
{
  return [(_UIOrderedLayoutArrangement *)self->_distributionArrangement distribution];
}

- (void)removeArrangedSubview:(UIView *)view
{
  distributionArrangement = self->_distributionArrangement;
  UIStackViewAlignment v5 = view;
  [(_UIOrderedLayoutArrangement *)distributionArrangement removeItem:v5];
  [(_UILayoutArrangement *)self->_alignmentArrangement removeItem:v5];
}

- (UIStackView)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)UIStackView;
  BOOL v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIStackView *)v3 _commonStackViewInitializationWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
    -[UIView setLayoutMargins:](v4, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  }
  return v4;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(UIView *)self _setHostsLayoutEngine:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIStackView;
  [(UIView *)&v5 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (void)setAlignment:(UIStackViewAlignment)alignment
{
  alignmentArrangement = self->_alignmentArrangement;
  if ((unint64_t)alignment >= (UIStackViewAlignmentBottom|UIStackViewAlignmentFirstBaseline))
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"NSLayoutFormatOptions _alignmentOptionsForStackViewAlignment(UIStackViewAlignment)"];
    [v5 handleFailureInFunction:v6 file:@"UIStackView.m" lineNumber:223 description:@"failed to convert stackAlignment to alignmentOptions"];

    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = qword_186B9DF30[alignment];
  }
  [(_UIAlignedLayoutArrangement *)alignmentArrangement setAlignment:v4];
}

- (void)setLayoutMarginsRelativeArrangement:(BOOL)layoutMarginsRelativeArrangement
{
  if (self->_layoutMarginsRelativeArrangement != layoutMarginsRelativeArrangement)
  {
    BOOL v3 = layoutMarginsRelativeArrangement;
    self->_layoutMarginsRelativeArrangement = layoutMarginsRelativeArrangement;
    [(_UIOrderedLayoutArrangement *)self->_distributionArrangement setLayoutUsesCanvasMarginsWhenFilling:"setLayoutUsesCanvasMarginsWhenFilling:"];
    alignmentArrangement = self->_alignmentArrangement;
    [(_UIAlignedLayoutArrangement *)alignmentArrangement setLayoutUsesCanvasMarginsWhenFilling:v3];
  }
}

- (id)viewForFirstBaselineLayout
{
  BOOL v3 = [(UIStackView *)self _baselineViewForFirst:1];
  uint64_t v4 = [v3 viewForFirstBaselineLayout];
  objc_super v5 = v4;
  if (!v4) {
    uint64_t v4 = self;
  }
  id v6 = v4;

  return v6;
}

- (id)viewForLastBaselineLayout
{
  BOOL v3 = [(UIStackView *)self _baselineViewForFirst:0];
  uint64_t v4 = [v3 viewForLastBaselineLayout];
  objc_super v5 = v4;
  if (!v4) {
    uint64_t v4 = self;
  }
  id v6 = v4;

  return v6;
}

- (id)_baselineViewForFirst:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = -[UIStackView _shouldRequestTallestBaselineViewForFirst:](self, "_shouldRequestTallestBaselineViewForFirst:");
  BOOL v6 = v5;
  uint64_t v7 = 5;
  if (v3) {
    uint64_t v7 = 4;
  }
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___UIStackView__mutableLayoutArrangements[v7]) = v5;
  distributionArrangement = self->_distributionArrangement;
  return [(_UIOrderedLayoutArrangement *)distributionArrangement _baselineViewVendTallest:v6 forFirstBaseline:v3];
}

- (void)_vendedBaselineViewParametersDidChange
{
  BOOL v3 = self->_didRequestTallestBaselineViewForFirst
    || self->_viewForFirstBaselineLayoutDidChange
    || [(UIStackView *)self _shouldRequestTallestBaselineViewForFirst:1];
  if (self->_didRequestTallestBaselineViewForLast || self->_viewForLastBaselineLayoutDidChange)
  {
    LOBYTE(v4) = 1;
LABEL_7:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke;
    aBlock[3] = &unk_1E530E528;
    BOOL v9 = v3;
    BOOL v10 = v4;
    aBlock[4] = self;
    BOOL v5 = _Block_copy(aBlock);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke_2;
    v7[3] = &unk_1E530E550;
    v7[4] = self;
    BOOL v6 = _Block_copy(v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables_block_invoke;
    v11[3] = &unk_1E530E670;
    v11[4] = self;
    v11[5] = v5;
    v11[6] = v6;
    [(UIView *)self _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:v11];
    self->_viewForFirstBaselineLayoutDidChange = 0;
    self->_viewForLastBaselineLayoutDidChange = 0;

    return;
  }
  BOOL v4 = [(UIStackView *)self _shouldRequestTallestBaselineViewForFirst:0];
  if (v3 || v4) {
    goto LABEL_7;
  }
}

- (BOOL)_hasLayoutArrangements
{
  return 1;
}

- (void)_vendedBaselineViewDidMoveForFirst:(BOOL)a3
{
  uint64_t v3 = 7;
  if (a3) {
    uint64_t v3 = 6;
  }
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___UIStackView__mutableLayoutArrangements[v3]) = 1;
}

uint64_t __66__UIStackView__commonStackViewInitializationWithArrangedSubviews___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 408);
  *(void *)(v3 + 408) = v2;

  BOOL v5 = [(_UILayoutArrangement *)[_UIOrderedLayoutArrangement alloc] initWithItems:*(void *)(a1 + 40) onAxis:0];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 416);
  *(void *)(v6 + 416) = v5;

  uint64_t v8 = [(_UILayoutArrangement *)[_UIAlignedLayoutArrangement alloc] initWithItems:*(void *)(a1 + 40) onAxis:0];
  uint64_t v9 = *(void *)(a1 + 32);
  BOOL v10 = *(void **)(v9 + 424);
  *(void *)(v9 + 424) = v8;

  [*(id *)(*(void *)(a1 + 32) + 424) setAlignment:120];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setCanvas:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setCanvas:");
  [*(id *)(*(void *)(a1 + 32) + 416) setLayoutFillsCanvas:1];
  [*(id *)(*(void *)(a1 + 32) + 424) setLayoutFillsCanvas:1];
  uint64_t result = [*(id *)(a1 + 32) translatesAutoresizingMaskIntoConstraints];
  if (result)
  {
    v12 = *(void **)(a1 + 32);
    return [v12 _setHostsLayoutEngine:1];
  }
  return result;
}

- (id)_mutableLayoutArrangements
{
  return self->_mutableLayoutArrangements;
}

void __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 container];
  BOOL v5 = [v4 _layoutEngine];
  if (v5 && [v3 hasBeenLowered])
  {
    uint64_t v6 = [v3 firstItem];
    uint64_t v7 = *(void **)(a1 + 32);

    if (v6 == v7) {
      uint64_t v8 = [v3 firstAttribute];
    }
    else {
      uint64_t v8 = [v3 secondAttribute];
    }
    uint64_t v9 = v8;
    double v15 = 0.0;
    BOOL v10 = -[UIView _baselineViewForConstraint:forFirstItem:withOffset:](*(void **)(a1 + 32), v3, v6 == v7, &v15);
    v11 = *(void **)(a1 + 32);
    if ((v9 - 11) > 1)
    {
      if (v10 != v11) {
        goto LABEL_8;
      }
    }
    else
    {
      v12 = [v11 _viewForLoweringBaselineLayoutAttribute:v9];

      if (v10 != v12)
      {
LABEL_8:
        [v3 _removeFromEngine:v5];
        [v3 _addToEngine:v5];
LABEL_12:

        goto LABEL_13;
      }
    }
    double v13 = v15;
    [v10 _baselineOffsetFromNearestEdgeForLayoutAttribute:v9];
    if (v13 != v14) {
      [v3 _containerGeometryDidChange];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (BOOL)_recordBaselineLoweringInfo
{
  return 1;
}

- (NSArray)arrangedSubviews
{
  id v2 = [(_UILayoutArrangement *)self->_distributionArrangement items];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addArrangedSubview:(UIView *)view
{
  distributionArrangement = self->_distributionArrangement;
  BOOL v5 = view;
  [(_UILayoutArrangement *)distributionArrangement addItem:v5];
  [(_UILayoutArrangement *)self->_alignmentArrangement addItem:v5];
}

- (void)insertArrangedSubview:(UIView *)view atIndex:(NSUInteger)stackIndex
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = view;
  uint64_t v8 = [(_UILayoutArrangement *)self->_distributionArrangement items];
  NSUInteger v9 = [v8 count];
  if (v9 < stackIndex) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"index out of bounds for arranged subview: index = %lu expected to be less than or equal to %lu", stackIndex, v9);
  }
  BOOL v10 = [(_UILayoutArrangement *)self->_alignmentArrangement items];
  uint64_t v11 = [v10 count];
  if (v9 != v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      logb = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(logb, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = (uint64_t)v8;
        __int16 v23 = 2112;
        NSUInteger v24 = (NSUInteger)v10;
        _os_log_fault_impl(&dword_1853B0000, logb, OS_LOG_TYPE_FAULT, "number of items in the arrangements for the stack view have gotten out of sync. distribution items: %@ alignment items: %@", buf, 0x16u);
      }
    }
    else
    {
      log = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D140) + 8);
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = (uint64_t)v8;
        __int16 v23 = 2112;
        NSUInteger v24 = (NSUInteger)v10;
        _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "number of items in the arrangements for the stack view have gotten out of sync. distribution items: %@ alignment items: %@", buf, 0x16u);
      }
    }
  }
  [(_UIOrderedLayoutArrangement *)self->_distributionArrangement insertItem:v7 atIndex:stackIndex];
  v12 = [(_UILayoutArrangement *)self->_alignmentArrangement items];

  NSUInteger v13 = [v12 count];
  if (v13 != v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      logc = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(logc, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v22 = v11;
        __int16 v23 = 2048;
        NSUInteger v24 = v13;
        _os_log_fault_impl(&dword_1853B0000, logc, OS_LOG_TYPE_FAULT, "number of items in the alignment arrangement changed from %lu to %lu after inserting item in the distribution arrangement", buf, 0x16u);
      }
    }
    else
    {
      loga = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D148) + 8);
      if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v22 = v11;
        __int16 v23 = 2048;
        NSUInteger v24 = v13;
        _os_log_impl(&dword_1853B0000, loga, OS_LOG_TYPE_ERROR, "number of items in the alignment arrangement changed from %lu to %lu after inserting item in the distribution arrangement", buf, 0x16u);
      }
    }
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_t logd = [MEMORY[0x1E4F28B00] currentHandler];
    [logd handleFailureInMethod:a2 object:self file:@"UIStackView.m" lineNumber:118 description:@"number of items in the alignment arrangement is NSNotFound"];
  }
  alignmentArrangement = self->_alignmentArrangement;
  if (v9 == v11 || v13 >= stackIndex) {
    [(_UILayoutArrangement *)alignmentArrangement insertItem:v7 atIndex:stackIndex];
  }
  else {
    [(_UILayoutArrangement *)alignmentArrangement addItem:v7];
  }
}

- (void)setCustomSpacing:(CGFloat)spacing afterView:(UIView *)arrangedSubview
{
}

- (void)updateConstraints
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__UIStackView_updateConstraints__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(UIView *)self _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:v2];
}

void __32__UIStackView_updateConstraints__block_invoke(uint64_t a1)
{
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)UIStackView;
  objc_msgSendSuper2(&v11, sel_updateConstraints);
  id v2 = *(id *)(a1 + 32);
  if (qword_1EB25D158 != -1) {
    dispatch_once(&qword_1EB25D158, &__block_literal_global_169_1);
  }
  if (byte_1EB25D139)
  {
    id v3 = [v2 arrangedSubviews];
    uint64_t v4 = [v3 count];

    BOOL v5 = objc_getAssociatedObject(v2, &unk_1EB25D13A);
    uint64_t v6 = v5;
    if (v4 || v5)
    {
      if (!v4 || !v5) {
        goto LABEL_11;
      }
      [v5 setActive:0];
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v7 = [v2 heightAnchor];
      uint64_t v8 = [v7 constraintEqualToConstant:0.0];

      LODWORD(v9) = 1.0;
      [v8 setPriority:v9];
      [v8 setIdentifier:@"UISV-fix-for-app-bug-ambiguity"];
      [v8 setActive:1];
      uint64_t v6 = v8;
    }
    objc_setAssociatedObject(v2, &unk_1EB25D13A, v8, (void *)1);
LABEL_11:
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 432) || *(unsigned char *)(v10 + 433)) {
    objc_msgSend(*(id *)(v10 + 416), "_didEvaluateMultilineHeightForView:");
  }
}

- (UIStackView)initWithCoder:(NSCoder *)coder
{
  uint64_t v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)UIStackView;
  BOOL v5 = [(UIView *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"UIStackViewArrangedSubviews"];
    uint64_t v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = MEMORY[0x1E4F1CBF0];
    }
    [(UIStackView *)v5 _commonStackViewInitializationWithArrangedSubviews:v8];
    [(UIStackView *)v5 setAxis:[(NSCoder *)v4 decodeIntegerForKey:@"UIStackViewAxis"]];
    [(UIStackView *)v5 setDistribution:[(NSCoder *)v4 decodeIntegerForKey:@"UIStackViewDistribution"]];
    [(UIStackView *)v5 setAlignment:[(NSCoder *)v4 decodeIntegerForKey:@"UIStackViewAlignment"]];
    [(NSCoder *)v4 decodeDoubleForKey:@"UIStackViewSpacing"];
    -[UIStackView setSpacing:](v5, "setSpacing:");
    [(UIStackView *)v5 setBaselineRelativeArrangement:[(NSCoder *)v4 decodeBoolForKey:@"UIStackViewBaselineRelative"]];
    [(UIStackView *)v5 setLayoutMarginsRelativeArrangement:[(NSCoder *)v4 decodeBoolForKey:@"UIStackViewLayoutMarginsRelative"]];
  }
  return v5;
}

- (void)_commonStackViewInitializationWithArrangedSubviews:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__UIStackView__commonStackViewInitializationWithArrangedSubviews___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[UIView performWithoutAnimation:v6];
}

- (void)setAxis:(UILayoutConstraintAxis)axis
{
  -[_UIOrderedLayoutArrangement setAxis:](self->_distributionArrangement, "setAxis:");
  alignmentArrangement = self->_alignmentArrangement;
  [(_UIAlignedLayoutArrangement *)alignmentArrangement setAxis:axis];
}

- (void)setSpacing:(CGFloat)spacing
{
}

- (void)setBaselineRelativeArrangement:(BOOL)baselineRelativeArrangement
{
}

- (void)setDistribution:(UIStackViewDistribution)distribution
{
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  if (dyld_program_sdk_at_least())
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStackView;
    [(UIView *)&v5 setOpaque:v3];
  }
}

- (UIStackView)initWithArrangedSubviews:(NSArray *)views
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = views;
  objc_super v5 = -[UIStackView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          -[UIStackView addArrangedSubview:](v5, "addArrangedSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (double)_calculatedIntrinsicHeight
{
  [(_UIOrderedLayoutArrangement *)self->_distributionArrangement _calculatedIntrinsicHeight];
  return result;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 hasIntentionallyCollapsedHeight:(BOOL *)a6
{
  double height = a3.height;
  double width = a3.width;
  BOOL v12 = [(UIView *)self _isInAnimatedLayout];
  if (!v12
    && +[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    [(UIView *)self _setInAnimatedLayout:1];
    [(UIView *)self _setNeedsUpdateConstraintsNeedingLayout:0];
  }
  v21.receiver = self;
  v21.super_class = (Class)UIStackView;
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](&v21, sel__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_hasIntentionallyCollapsedHeight_, a6, width, height, v13, v14);
  double v16 = v15;
  double v18 = v17;
  [(UIView *)self _setInAnimatedLayout:v12];
  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (BOOL)_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(UIView *)self _ola_shouldUseImprovedMultilineTextDisambiguation])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v3 = [(_UILayoutArrangement *)self->_distributionArrangement items];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged"))
          {

            return 1;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIStackView;
    return [(UIView *)&v9 _ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentArrangement, 0);
  objc_storeStrong((id *)&self->_distributionArrangement, 0);
  objc_storeStrong((id *)&self->_mutableLayoutArrangements, 0);
}

- (void)setArrangedSubviews:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIStackView *)self arrangedSubviews];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([v6 containsObject:v12] & 1) == 0) {
          [(UIStackView *)self removeArrangedSubview:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__UIStackView_setArrangedSubviews___block_invoke;
  v13[3] = &unk_1E52DA8E8;
  v13[4] = self;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v13];
}

uint64_t __35__UIStackView_setArrangedSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertArrangedSubview:a2 atIndex:0];
}

- (CGFloat)customSpacingAfterView:(UIView *)arrangedSubview
{
  [(_UIOrderedLayoutArrangement *)self->_distributionArrangement customSpacingAfterItem:arrangedSubview];
  return result;
}

- (CGFloat)spacing
{
  [(_UIOrderedLayoutArrangement *)self->_distributionArrangement spacing];
  return result;
}

- (BOOL)isBaselineRelativeArrangement
{
  return [(_UIOrderedLayoutArrangement *)self->_distributionArrangement isBaselineRelativeArrangement];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIStackView;
  [(UIView *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(UIStackView *)self arrangedSubviews];
  if ([v5 count]) {
    [v4 encodeObject:v5 forKey:@"UIStackViewArrangedSubviews"];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStackView axis](self, "axis"), @"UIStackViewAxis");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStackView distribution](self, "distribution"), @"UIStackViewDistribution");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStackView alignment](self, "alignment"), @"UIStackViewAlignment");
  [(UIStackView *)self spacing];
  objc_msgSend(v4, "encodeDouble:forKey:", @"UIStackViewSpacing");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIStackView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement"), @"UIStackViewBaselineRelative");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIStackView isLayoutMarginsRelativeArrangement](self, "isLayoutMarginsRelativeArrangement"), @"UIStackViewLayoutMarginsRelative");
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    if (qword_1EB25D150 != -1) {
      dispatch_once(&qword_1EB25D150, &__block_literal_global_631);
    }
    if (!_MergedGlobals_17_6)
    {
      v5.receiver = self;
      v5.super_class = (Class)UIStackView;
      [(UIView *)&v5 setBackgroundColor:v4];
    }
  }
}

void __34__UIStackView_setBackgroundColor___block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_17_6 = [v0 isEqualToString:@"com.apple.CarPlayApp"];
}

- (double)_proportionalFillLengthForOrderedArrangement:(id)a3 relevantParentAxis:(int64_t)a4
{
  objc_super v6 = [a3 canvas];
  id v7 = v6;
  if (a4 == 1 && ![v6 alignment])
  {
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (([v7 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
    {
      long long v16 = [v7 _layoutEngine];

      if (v16)
      {
        objc_msgSend(v7, "_nsis_bounds");
        double v12 = v17;
        double v13 = v18;
        double v14 = v19;
        double v15 = v20;
      }
    }
    double v21 = *MEMORY[0x1E4F1DB30];
    double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*MEMORY[0x1E4F1DB30] == v14 && v22 == v15)
    {
      objc_msgSend(v7, "bounds", v21, v22);
      double v12 = v21;
      double v13 = v22;
      double v14 = v24;
      double v15 = v25;
    }
    if (objc_msgSend(v7, "isLayoutMarginsRelativeArrangement", v21, v22))
    {
      [v7 layoutMargins];
      double v12 = v12 + v26;
      double v13 = v13 + v27;
      double v14 = v14 - (v26 + v28);
      double v15 = v15 - (v27 + v29);
    }
    v30 = [(UIView *)self _layoutEngine];
    -[NSISEngine _UIKitPerformPendingChangeNotifications]((uint64_t)v30);

    v34.origin.x = v12;
    v34.origin.y = v13;
    v34.size.double width = v14;
    v34.size.double height = v15;
    CGFloat Width = CGRectGetWidth(v34);
    LODWORD(v32) = 1148846080;
    LODWORD(v33) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v32, v33);
  }
  else
  {
    -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", 0.0, 0.0);
  }
  if (a4) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }

  return v10;
}

- (id)description
{
  v32.receiver = self;
  v32.super_class = (Class)UIStackView;
  BOOL v3 = [(UIView *)&v32 description];
  UILayoutConstraintAxis v4 = [(UIStackView *)self axis];
  objc_super v5 = @"vert";
  if (v4 == UILayoutConstraintAxisHorizontal) {
    objc_super v5 = @"horiz";
  }
  objc_super v6 = v5;
  UIStackViewDistribution v7 = [(UIStackView *)self distribution];
  if ((unint64_t)v7 > UIStackViewDistributionEqualCentering) {
    double v8 = @"unknown";
  }
  else {
    double v8 = off_1E530E570[v7];
  }
  UIStackViewAlignment v9 = [(UIStackView *)self alignment];
  UILayoutConstraintAxis v10 = [(UIStackView *)self axis];
  long long v11 = @"fill";
  switch(v9)
  {
    case UIStackViewAlignmentFill:
      break;
    case UIStackViewAlignmentLeading:
      double v12 = @"leading";
      double v13 = @"top";
      goto LABEL_12;
    case UIStackViewAlignmentFirstBaseline:
      long long v11 = @"firstBaseline";
      break;
    case UIStackViewAlignmentCenter:
      long long v11 = @"center";
      break;
    case UIStackViewAlignmentTrailing:
      double v12 = @"trailing";
      double v13 = @"bottom";
LABEL_12:
      if (v10 == UILayoutConstraintAxisHorizontal) {
        double v12 = v13;
      }
      long long v11 = v12;
      break;
    case UIStackViewAlignmentLastBaseline:
      long long v11 = @"lastBaseline";
      break;
    default:
      long long v11 = @"unknown";
      break;
  }
  double v14 = [v3 stringByAppendingFormat:@" axis=%@ distribution=%@ alignment=%@", v6, v8, v11];

  if ([(UIStackView *)self axis] == UILayoutConstraintAxisVertical
    && [(UIStackView *)self isBaselineRelativeArrangement])
  {
    uint64_t v15 = [v14 stringByAppendingString:@" baselineRelative"];

    double v14 = (void *)v15;
  }
  if ([(UIStackView *)self isLayoutMarginsRelativeArrangement])
  {
    uint64_t v16 = [v14 stringByAppendingString:@" layoutMarginsRelative"];

    double v14 = (void *)v16;
  }
  if (!os_variant_has_internal_diagnostics())
  {
    double v17 = [(UIStackView *)self arrangedSubviews];
    uint64_t v18 = [v17 count];

    if (v18) {
      goto LABEL_25;
    }
    double v19 = @" NO ARRANGED SUBVIEWS";
    goto LABEL_24;
  }
  double v22 = [(_UILayoutArrangement *)self->_distributionArrangement _mutableItems];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    double v24 = [(_UILayoutArrangement *)self->_distributionArrangement _mutableItems];
    uint64_t v25 = objc_msgSend(v14, "stringByAppendingFormat:", @" arrangedSubviews=%p distributionArrangement=%p alignmentArrangement=%p", v24, self->_distributionArrangement, self->_alignmentArrangement);

    double v14 = (void *)v25;
  }
  else
  {
    double v24 = [v14 stringByAppendingString:@" NO ARRANGED SUBVIEWS"];

    double v26 = [(_UILayoutArrangement *)self->_distributionArrangement _mutableItems];
    double v27 = [(_UILayoutArrangement *)self->_alignmentArrangement _mutableItems];
    char v28 = UIEqual(v26, v27);

    if (v28)
    {
      double v14 = v24;
      goto LABEL_34;
    }
    double v14 = objc_msgSend(v24, "stringByAppendingFormat:", @" distributionArrangement=%p alignmentArrangement=%p", self->_distributionArrangement, self->_alignmentArrangement);
  }

LABEL_34:
  double v29 = [(_UILayoutArrangement *)self->_distributionArrangement _mutableItems];
  v30 = [(_UILayoutArrangement *)self->_alignmentArrangement _mutableItems];
  char v31 = UIEqual(v29, v30);

  if ((v31 & 1) == 0)
  {
    double v19 = @" ERROR: arrangement mismatch";
LABEL_24:
    uint64_t v20 = [v14 stringByAppendingString:v19];

    double v14 = (void *)v20;
  }
LABEL_25:
  return v14;
}

- (BOOL)isLayoutMarginsRelativeArrangement
{
  return self->_layoutMarginsRelativeArrangement;
}

@end