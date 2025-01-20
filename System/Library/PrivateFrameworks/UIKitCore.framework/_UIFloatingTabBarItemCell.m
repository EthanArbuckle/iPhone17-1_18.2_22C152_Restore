@interface _UIFloatingTabBarItemCell
+ (Class)_contentViewClass;
- (BOOL)groupItemMinimized;
- (BOOL)hasSelectionHighlight;
- (BOOL)isHighlighted;
- (UIEdgeInsets)_contentViewInset;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setGroupItemMinimized:(BOOL)a3;
- (void)setHasSelectionHighlight:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setListItem:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation _UIFloatingTabBarItemCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_UIFloatingTabBarItemCell;
  v4 = [(UICollectionReusableView *)&v20 preferredLayoutAttributesFittingAttributes:a3];
  [(_UIFloatingTabBarItemCell *)self _contentViewInset];
  double v6 = v5;
  double v8 = v7;
  v9 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v4 size];
  objc_msgSend(v9, "sizeThatFits:");
  double v11 = v10;

  [v4 size];
  [v4 setSize:v6 + v8 + v11];
  v12 = [(_UIFloatingTabBarCell *)self listItem];
  uint64_t v13 = [v12 itemIndex];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [(_UIFloatingTabBarCell *)self listItem];
    v15 = [v14 parent];
    v16 = [v15 children];
    uint64_t v17 = [v16 count];
    v18 = [(_UIFloatingTabBarCell *)self listItem];
    objc_msgSend(v4, "setZIndex:", v17 - objc_msgSend(v18, "itemIndex"));
  }
  [v4 setGroupItemMinimized:0];
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemCell;
  id v4 = a3;
  [(UICollectionReusableView *)&v6 applyLayoutAttributes:v4];
  uint64_t v5 = objc_msgSend(v4, "isGroupItemMinimized", v6.receiver, v6.super_class);

  [(_UIFloatingTabBarItemCell *)self setGroupItemMinimized:v5];
}

- (UIEdgeInsets)_contentViewInset
{
  v3 = [(UIView *)self traitCollection];
  id v4 = _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);

  uint64_t v5 = [(_UIFloatingTabBarItemCell *)self _itemView];
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if ([v5 isCustomizableItem])
  {
    double v10 = [(UICollectionViewCell *)self configurationState];
    if ([v10 isEditing])
    {
      [v4 editModeItemMargins];
      double v9 = v11;
      double v8 = v12;
      double v7 = v13;
      double v6 = v14;
    }
  }
  double v15 = v9;
  double v16 = v8;
  double v17 = v7;
  double v18 = v6;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingTabBarItemCell;
  [(UICollectionViewCell *)&v4 prepareForReuse];
  v3 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v3 setHidden:0];
}

- (void)setListItem:(id)a3
{
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 contentTab];

    if (!v7)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIFloatingTabBarItemCell.m", 71, @"listItem must represent a single item, not a group." object file lineNumber description];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBarItemCell;
  [(_UIFloatingTabBarCell *)&v11 setListItem:v6];
  double v9 = [v6 contentTab];
  double v10 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v10 setItem:v9];
}

- (void)updateConfigurationUsingState:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIFloatingTabBarItemCell;
  id v4 = a3;
  [(UICollectionViewCell *)&v9 updateConfigurationUsingState:v4];
  uint64_t v5 = objc_msgSend(v4, "isEditing", v9.receiver, v9.super_class);
  double v6 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v6 setEditing:v5];

  uint64_t v7 = [v4 cellDragState];
  double v8 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v8 setDragged:v7 != 0];
}

- (BOOL)isHighlighted
{
  v2 = [(_UIFloatingTabBarItemCell *)self _itemView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemCell;
  -[UICollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  uint64_t v5 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v5 setHighlighted:v3];
}

- (BOOL)hasSelectionHighlight
{
  v2 = [(_UIFloatingTabBarItemCell *)self _itemView];
  char v3 = [v2 hasSelectionHighlight];

  return v3;
}

- (void)setHasSelectionHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v4 setHasSelectionHighlight:v3];
}

- (void)setGroupItemMinimized:(BOOL)a3
{
  BOOL v4 = a3;
  self->_groupItemMinimized = a3;
  if (a3)
  {
    id v8 = [(_UIFloatingTabBarCell *)self listItem];
    BOOL v3 = [v8 parent];
    if (v3) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
  }
  else
  {
    double v6 = 1.0;
  }
  uint64_t v7 = [(_UIFloatingTabBarItemCell *)self _itemView];
  [v7 setTitleOpacity:v6];

  if (v4)
  {
  }
}

- (BOOL)groupItemMinimized
{
  return self->_groupItemMinimized;
}

@end