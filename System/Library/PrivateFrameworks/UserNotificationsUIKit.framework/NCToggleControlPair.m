@interface NCToggleControlPair
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCToggleControlPair)initWithLeadingToggleControl:(id)a3 trailingToggleControl:(id)a4;
- (NSArray)toggleControls;
- (NSString)clearAllText;
- (NSString)materialGroupNameBase;
- (double)_effectiveInterControlPadding;
- (double)_effectiveValueForMinValue:(double)a3 withFont:(id)a4;
- (id)_leadingToggleControl;
- (id)_trailingToggleControl;
- (void)_handleTouchUpInside:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setClearAllText:(id)a3;
- (void)setLeadingControlExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setMaterialGroupNameBase:(id)a3;
@end

@implementation NCToggleControlPair

- (NCToggleControlPair)initWithLeadingToggleControl:(id)a3 trailingToggleControl:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCToggleControlPair;
  v8 = [(NCToggleControlPair *)&v12 init];
  if (v8)
  {
    v13[0] = v6;
    v13[1] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    toggleControls = v8->_toggleControls;
    v8->_toggleControls = (NSArray *)v9;

    objc_msgSend(v7, "setExpanded:", objc_msgSend(v6, "isExpanded") ^ 1);
    [(NCToggleControlPair *)v8 addSubview:v6];
    [(NCToggleControlPair *)v8 addSubview:v7];
    [v6 _setManagingPair:v8];
    [v7 _setManagingPair:v8];
  }

  return v8;
}

- (void)setLeadingControlExpanded:(BOOL)a3 animated:(BOOL)a4
{
  int v4 = a3;
  id v6 = [(NCToggleControlPair *)self _leadingToggleControl];
  id v7 = [(NCToggleControlPair *)self _trailingToggleControl];
  if ([v6 isExpanded] != v4)
  {
    v8 = objc_opt_class();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__NCToggleControlPair_setLeadingControlExpanded_animated___block_invoke;
    v9[3] = &unk_1E6A942B8;
    id v10 = v6;
    char v12 = v4;
    id v11 = v7;
    [v8 performWithDefaultExpansionAnimation:v9 completion:0];
  }
}

uint64_t __58__NCToggleControlPair_setLeadingControlExpanded_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExpanded:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  BOOL v3 = *(unsigned char *)(a1 + 48) == 0;

  return [v2 setExpanded:v3];
}

- (void)setClearAllText:(id)a3
{
  id v4 = a3;
  v5 = [(NCToggleControlPair *)self _leadingToggleControl];
  [v5 setClearAllText:v4];

  id v6 = [(NCToggleControlPair *)self _trailingToggleControl];
  [v6 setClearAllText:v4];
}

- (NSString)clearAllText
{
  BOOL v3 = [(NCToggleControlPair *)self _leadingToggleControl];
  id v4 = [v3 clearAllText];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(NCToggleControlPair *)self _trailingToggleControl];
    id v6 = [v7 clearAllText];
  }

  return (NSString *)v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = [(NCToggleControlPair *)self _leadingToggleControl];
  if (v4)
  {
    v5 = [(NCToggleControlPair *)self _leadingToggleControl];
    [v5 _cachedEffectiveMaxUnexpandedSize];
  }
  else
  {
    +[NCToggleControl effectiveHeight:[(NCToggleControlPair *)self adjustsFontForContentSizeCategory]];
  }

  id v6 = [(NCToggleControlPair *)self _trailingToggleControl];
  if (v6)
  {
    id v7 = [(NCToggleControlPair *)self _trailingToggleControl];
    [v7 _cachedEffectiveMaxExpandedSize];
  }
  else
  {
    _MaxToggleControlSize(1, [(NCToggleControlPair *)self adjustsFontForContentSizeCategory]);
  }

  [(NCToggleControlPair *)self _effectiveInterControlPadding];
  _NCMainScreenScale();

  UISizeRoundToScale();
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)NCToggleControlPair;
  [(NCToggleControlPair *)&v35 layoutSubviews];
  [(NCToggleControlPair *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int v11 = [(NCToggleControlPair *)self _shouldReverseLayoutDirection];
  char v12 = [(NCToggleControlPair *)self _leadingToggleControl];
  [v12 _effectiveExpandedSize];
  BSRectWithSize();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  CGFloat v32 = v4;
  if (v11)
  {
    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    double Width = CGRectGetWidth(v36);
    v37.origin.x = v14;
    v37.origin.y = v16;
    v37.size.width = v18;
    v37.size.height = v20;
    double v14 = Width - CGRectGetWidth(v37);
  }
  objc_msgSend(v12, "setFrame:", v14, v16, v18, v20, *(void *)&v32, *(void *)&v6);
  v22 = [(NCToggleControlPair *)self _trailingToggleControl];
  [v22 _effectiveExpandedSize];
  BSRectWithSize();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  if ((v11 & 1) == 0)
  {
    v38.origin.x = v33;
    v38.origin.y = v34;
    v38.size.width = v8;
    v38.size.height = v10;
    double v31 = CGRectGetWidth(v38);
    v39.origin.x = v24;
    v39.origin.y = v26;
    v39.size.width = v28;
    v39.size.height = v30;
    double v24 = v31 - CGRectGetWidth(v39);
  }
  objc_msgSend(v22, "setFrame:", v24, v26, v28, v30);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  double v3 = [(NCToggleControlPair *)self _leadingToggleControl];
  if ([v3 adjustsFontForContentSizeCategory])
  {
    CGFloat v4 = [(NCToggleControlPair *)self _trailingToggleControl];
    char v5 = [v4 adjustsFontForContentSizeCategory];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(NCToggleControlPair *)self adjustsFontForContentSizeCategory];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CGFloat v6 = self->_toggleControls;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setAdjustsFontForContentSizeCategory:", v3, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5 != [(NCToggleControlPair *)self adjustsFontForContentSizeCategory]) {
    [(NCToggleControlPair *)self adjustForContentSizeCategoryChange];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_toggleControls;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (void)v10);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);

    if (v6)
    {
      [(NCToggleControlPair *)self setNeedsLayout];
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_materialGroupNameBase isEqualToString:v4])
  {
    uint64_t v5 = (NSString *)[v4 copy];
    materialGroupNameBase = self->_materialGroupNameBase;
    self->_materialGroupNameBase = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_toggleControls;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setMaterialGroupNameBase:", self->_materialGroupNameBase, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (id)_leadingToggleControl
{
  return [(NSArray *)self->_toggleControls firstObject];
}

- (id)_trailingToggleControl
{
  return [(NSArray *)self->_toggleControls lastObject];
}

- (double)_effectiveValueForMinValue:(double)a3 withFont:(id)a4
{
  objc_msgSend(a4, "_scaledValueForValue:");
  if (result <= a3) {
    return a3;
  }
  return result;
}

- (double)_effectiveInterControlPadding
{
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v4);

  if (IsAX) {
    double v6 = 3.0;
  }
  else {
    double v6 = 8.0;
  }
  uint64_t v7 = [(NCToggleControlPair *)self _leadingToggleControl];
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_labelFont:", -[NCToggleControlPair adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  [(NCToggleControlPair *)self _effectiveValueForMinValue:v8 withFont:v6];
  double v10 = v9;

  return v10;
}

- (void)_handleTouchUpInside:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  if (([v7 _wasExpandedPriorToControlEvent] & 1) == 0)
  {
    id v5 = [(NCToggleControlPair *)self _leadingToggleControl];
    BOOL v6 = v5 == v7;

    [(NCToggleControlPair *)self setLeadingControlExpanded:v6 animated:1];
  }
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NSArray)toggleControls
{
  return self->_toggleControls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleControls, 0);

  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end