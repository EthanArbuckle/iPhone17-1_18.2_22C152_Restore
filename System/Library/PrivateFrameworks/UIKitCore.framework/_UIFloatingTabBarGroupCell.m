@interface _UIFloatingTabBarGroupCell
+ (CGRect)layoutFrameForItemAtIndex:(int64_t)a3 traitCollection:(id)a4;
+ (CGSize)layoutSizeForGroupItems:(id)a3 traitCollection:(id)a4;
- (BOOL)hasSelectionHighlight;
- (BOOL)isCustomizableItem;
- (BOOL)isEditing;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)itemViews;
- (_UIFloatingTabBarGroupCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_reloadItemsView;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setHasSelectionHighlight:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setListItem:(id)a3;
@end

@implementation _UIFloatingTabBarGroupCell

+ (CGSize)layoutSizeForGroupItems:(id)a3 traitCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = _UIFloatingTabBarGetPlatformMetrics([v5 userInterfaceIdiom]);
  [v7 scaledImageSizeForTraitCollection:v5];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9 * (double)(unint64_t)[v6 count];
  [v7 groupItemSpacing];
  double v14 = v13 + v9 * -0.5;
  uint64_t v15 = [v6 count];

  [v7 imageMargins];
  double v19 = v12 + v14 * (double)(unint64_t)(v15 - 1) - (-v17 - v18);
  double v21 = v11 - (-v16 - v20);

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (CGRect)layoutFrameForItemAtIndex:(int64_t)a3 traitCollection:(id)a4
{
  id v5 = a4;
  id v6 = _UIFloatingTabBarGetPlatformMetrics([v5 userInterfaceIdiom]);
  [v6 scaledImageSizeForTraitCollection:v5];
  double v8 = v7;
  double v10 = v9;

  [v6 groupItemSpacing];
  double v12 = (v11 + v8 * 0.5) * (double)a3;
  [v6 imageMargins];
  double v14 = v13;
  double v16 = v15 + v12;

  double v17 = v16;
  double v18 = v14;
  double v19 = v8;
  double v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (_UIFloatingTabBarGroupCell)initWithFrame:(CGRect)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarGroupCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v8[0] = 0x1ED3F5A48;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v5 = [(UIView *)v3 _registerForTraitTokenChanges:v4 withTarget:v3 action:sel__updateColors];
  }
  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBarGroupCell;
  id v4 = a3;
  id v5 = [(UICollectionReusableView *)&v11 preferredLayoutAttributesFittingAttributes:v4];
  objc_msgSend(v4, "size", v11.receiver, v11.super_class);
  double v7 = v6;
  double v9 = v8;

  -[_UIFloatingTabBarGroupCell sizeThatFits:](self, "sizeThatFits:", v7, v9);
  objc_msgSend(v5, "setSize:");
  return v5;
}

- (void)setListItem:(id)a3
{
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 children];

    if (!v7)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"_UIFloatingTabBarGroupCell.m" lineNumber:121 description:@"Cannot create a group cell for an item not representing a group"];
    }
  }
  double v9 = [(_UIFloatingTabBarCell *)self listItem];
  char v10 = [v9 isEqual:v6];

  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBarGroupCell;
  [(_UIFloatingTabBarCell *)&v11 setListItem:v6];
  if ((v10 & 1) == 0) {
    [(_UIFloatingTabBarGroupCell *)self _reloadItemsView];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UICollectionViewCell *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarGroupCell;
  [(UICollectionViewCell *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(_UIFloatingTabBarGroupCell *)self _updateColors];
  }
}

- (BOOL)hasSelectionHighlight
{
  return self->_hasSelectionHighlight;
}

- (void)setHasSelectionHighlight:(BOOL)a3
{
  if (self->_hasSelectionHighlight != a3)
  {
    self->_hasSelectionHighlight = a3;
    [(_UIFloatingTabBarGroupCell *)self _updateColors];
  }
}

- (BOOL)isCustomizableItem
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = objc_opt_class();
  BOOL v5 = [(_UIFloatingTabBarCell *)self listItem];
  objc_super v6 = [v5 children];
  double v7 = [(UIView *)self traitCollection];
  [v4 layoutSizeForGroupItems:v6 traitCollection:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)_UIFloatingTabBarGroupCell;
  [(_UIFloatingTabBarCell *)&v37 layoutSubviews];
  BOOL v3 = [(UIView *)self _shouldReverseLayoutDirection];
  id v4 = [(UIView *)self traitCollection];
  BOOL v5 = _UIFloatingTabBarGetPlatformMetrics([v4 userInterfaceIdiom]);
  [v5 imageMargins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 scaledImageSizeForTraitCollection:v4];
  double v15 = v14;
  [v5 groupItemSpacing];
  double v17 = v16;
  [(UIView *)self bounds];
  remainder.origin.x = v9 + v18;
  remainder.origin.y = v7 + v19;
  remainder.size.width = v20 - (v9 + v13);
  remainder.size.height = v21 - (v7 + v11);
  CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v22;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v23 = [(_UIFloatingTabBarGroupCell *)self itemViews];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    double v27 = v17 + v15 * 0.5;
    if (v3) {
      CGRectEdge v28 = CGRectMaxXEdge;
    }
    else {
      CGRectEdge v28 = CGRectMinXEdge;
    }
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v30 = *(void **)(*((void *)&v31 + 1) + 8 * v29);
        CGRectDivide(remainder, &slice, &remainder, v27, v28);
        slice.size.width = v15;
        objc_msgSend(v30, "setFrame:", slice.origin.x, slice.origin.y, v15, slice.size.height);
        ++v29;
      }
      while (v25 != v29);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v25);
  }
}

- (void)_reloadItemsView
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v3 = [(_UIFloatingTabBarGroupCell *)self itemViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v9 = [(_UIFloatingTabBarCell *)self listItem];
  double v10 = [v9 children];
  double v11 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v10, "count"));

  double v12 = [(_UIFloatingTabBarCell *)self listItem];
  double v13 = [v12 children];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  double v19 = __46___UIFloatingTabBarGroupCell__reloadItemsView__block_invoke;
  double v20 = &unk_1E52FEC18;
  double v21 = self;
  double v14 = v11;
  CGSize v22 = v14;
  [v13 enumerateObjectsUsingBlock:&v17];

  itemViews = self->_itemViews;
  self->_itemViews = v14;
  double v16 = v14;

  [(_UIFloatingTabBarGroupCell *)self _updateColors];
}

- (void)_updateColors
{
  BOOL v3 = [(UIView *)self traitCollection];
  _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [v8 contentPaletteProvider];
  uint64_t v5 = [(UIView *)self traitCollection];
  uint64_t v6 = v4[2](v4, [v5 userInterfaceStyle]);

  uint64_t v7 = [v6 resolvedColorFromProvider:self];
  [(UIView *)self setTintColor:v7];
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (void).cxx_destruct
{
}

@end