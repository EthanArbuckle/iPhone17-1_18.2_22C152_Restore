@interface _UIButtonBarItemLayout
- (BOOL)_shouldBeDirty;
- (BOOL)shouldHorizontallyCenterView:(id)a3;
- (BOOL)suppressSpacing;
- (BOOL)useGroupSizing;
- (_UIButtonBarItemLayout)initWithLayoutMetrics:(id)a3;
- (_UIButtonBarItemLayout)initWithLayoutMetrics:(id)a3 barButtonItem:(id)a4;
- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3;
- (id)barButtonItem;
- (id)description;
- (id)itemViewGenerator;
- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4;
- (void)_addLayoutViews:(id)a3;
- (void)_configure;
- (void)_updateCustomView;
- (void)_updateItemView;
- (void)_updateItemViewSizing;
- (void)dirtyLayoutForPlainAppearanceChange:(BOOL)a3 doneAppearanceChanged:(BOOL)a4;
- (void)setItemViewGenerator:(id)a3;
- (void)setSuppressSpacing:(BOOL)a3;
- (void)setUseGroupSizing:(BOOL)a3;
@end

@implementation _UIButtonBarItemLayout

- (void)dirtyLayoutForPlainAppearanceChange:(BOOL)a3 doneAppearanceChanged:(BOOL)a4
{
  BOOL v4 = a4;
  UIBarButtonItemStyle v7 = [(UIBarButtonItem *)self->_item style];
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = a3;
  }
  BOOL v9 = v7 == UIBarButtonItemStyleDone && v4;
  if (v8 || v9)
  {
    [(_UIButtonBarLayout *)self setDirty:1];
  }
}

- (id)barButtonItem
{
  return self->_item;
}

- (BOOL)shouldHorizontallyCenterView:(id)a3
{
  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper) {
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  }
  return itemViewWrapper == a3 && [(UIBarButtonItem *)self->_item _wantsThreeUp];
}

- (BOOL)_shouldBeDirty
{
  v2 = self;
  v3 = [(UIBarButtonItem *)self->_item view];
  LOBYTE(v2) = v3 != v2->_itemView;

  return (char)v2;
}

- (void)_addLayoutViews:(id)a3
{
  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper) {
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  }
  [a3 addObject:itemViewWrapper];
}

- (void)_updateCustomView
{
  if ([(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics allowsViewWrappers]&& +[_UITAMICAdaptorView shouldWrapView:self->_itemView])
  {
    v3 = [(_UITAMICAdaptorView *)self->_itemViewWrapper view];
    itemView = self->_itemView;

    if (v3 != itemView)
    {
      itemViewWrapper = self->_itemViewWrapper;
      self->_itemViewWrapper = 0;
    }
    if (!self->_itemViewWrapper)
    {
      UIBarButtonItemStyle v7 = [[_UITAMICAdaptorView alloc] initWithView:self->_itemView];
      BOOL v8 = self->_itemViewWrapper;
      self->_itemViewWrapper = v7;

      [(_UIButtonBarLayout *)self setDirty:1];
    }
  }
  else
  {
    [(_UIButtonBarLayout *)self setDirty:self->_itemViewWrapper != 0];
    v6 = self->_itemViewWrapper;
    self->_itemViewWrapper = 0;
  }
}

- (void)setUseGroupSizing:(BOOL)a3
{
  if (self->_useGroupSizing != a3)
  {
    self->_useGroupSizing = a3;
    [(_UIButtonBarLayout *)self setDirty:1];
  }
}

- (void)setItemViewGenerator:(id)a3
{
}

- (_UIButtonBarItemLayout)initWithLayoutMetrics:(id)a3 barButtonItem:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIButtonBarItemLayout;
  BOOL v8 = [(_UIButtonBarLayout *)&v13 initWithLayoutMetrics:a3];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_item, a4);
    uint64_t v10 = [(UIBarButtonItem *)v9->_item view];
    itemView = v9->_itemView;
    v9->_itemView = (UIView *)v10;
  }
  return v9;
}

- (BOOL)suppressSpacing
{
  return self->_suppressSpacing;
}

- (void)_configure
{
  [(_UIButtonBarItemLayout *)self _updateItemView];
  [(UIBarButtonItem *)self->_item setView:self->_itemView];
  if (!self->_itemView)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UIButtonBarLayout.m" lineNumber:555 description:@"cannot configure an item layout for a nil view"];
  }
  [(_UIButtonBarItemLayout *)self _updateItemViewSizing];
  if (self->_useGroupSizing && !self->_groupSameSize)
  {
    BOOL v4 = [(UIView *)self->_itemView widthAnchor];
    v5 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics groupSizeGuide];
    v6 = [v4 constraintEqualToAnchor:v5];
    groupSameSize = self->_groupSameSize;
    self->_groupSameSize = v6;

    LODWORD(v8) = 1143111680;
    [(NSLayoutConstraint *)self->_groupSameSize setPriority:v8];
  }
  [(NSLayoutConstraint *)self->_requestedSize setIdentifier:@"UIButtonBar.requestedSize"];
  [(NSLayoutConstraint *)self->_maximumAlignmentSize setIdentifier:@"UIButtonBar.maximumAlignmentSize"];
  BOOL v9 = self->_groupSameSize;
  [(NSLayoutConstraint *)v9 setIdentifier:@"UIButtonBar.groupSize"];
}

- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(UIBarButtonItem *)self->_item _width];
  if (v7 <= 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7;
  }
  BOOL v9 = v14;
  if (v7 <= 0.0)
  {
    if (![(UIBarButtonItem *)self->_item isCustomViewItem]
      || (char v10 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics allowsViewWrappers],
          BOOL v9 = v14,
          (v10 & 1) == 0))
    {
      BOOL v9 = v6;
    }
  }
  [v9 addObject:self->_requestedSize];
  if (self->_maximumAlignmentSize) {
    objc_msgSend(v14, "addObject:");
  }
  BOOL v11 = v8 != 0.0 || !self->_useGroupSizing;
  if (v11 || [(UIBarButtonItem *)self->_item isCustomViewItem])
  {
    groupSameSize = self->_groupSameSize;
    if (!groupSameSize) {
      goto LABEL_19;
    }
    objc_super v13 = v6;
  }
  else
  {
    groupSameSize = self->_groupSameSize;
    objc_super v13 = v14;
  }
  [v13 addObject:groupSameSize];
LABEL_19:
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  [(_UIButtonBarItemLayout *)self _updateItemView];
  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper) {
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  }
  v5 = itemViewWrapper;
  [(UIView *)v5 _widthForButtonBarItemLayout];
  double v7 = v6;
  [(UIBarButtonItem *)self->_item _width];
  double v9 = v8;

  if (v9 >= v7) {
    return v9;
  }
  else {
    return v7;
  }
}

- (void)_updateItemViewSizing
{
  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper) {
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  }
  v17 = itemViewWrapper;
  [(UIBarButtonItem *)self->_item _width];
  double v5 = fmax(v4, 0.0);
  requestedSize = self->_requestedSize;
  if (requestedSize
    && ([(NSLayoutConstraint *)requestedSize firstItem],
        double v7 = (_UITAMICAdaptorView *)objc_claimAutoreleasedReturnValue(),
        v7,
        requestedSize = self->_requestedSize,
        v17 == v7))
  {
    [(NSLayoutConstraint *)requestedSize constant];
    if (vabdd_f64(v16, v5) > 2.22044605e-16) {
      [(NSLayoutConstraint *)self->_requestedSize setConstant:v5];
    }
  }
  else
  {
    [(NSLayoutConstraint *)requestedSize setActive:0];
    double v8 = [(UIView *)v17 widthAnchor];
    double v9 = [v8 constraintEqualToConstant:v5];
    char v10 = self->_requestedSize;
    self->_requestedSize = v9;

    [(UIView *)v17 _setWantsAutolayout];
    LODWORD(v11) = 1143930880;
    [(NSLayoutConstraint *)self->_requestedSize setPriority:v11];
  }
  v12 = [(UIView *)v17 heightAnchor];
  if ((![(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics allowsViewWrappers]|| ![(UIBarButtonItem *)self->_item isCustomViewItem])&& !self->_maximumAlignmentSize)
  {
    objc_super v13 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics verticalSizeGuide];
    id v14 = [v12 constraintEqualToAnchor:v13];
    maximumAlignmentSize = self->_maximumAlignmentSize;
    self->_maximumAlignmentSize = v14;
  }
}

- (void)_updateItemView
{
  p_itemView = &self->_itemView;
  (*((void (**)(void))self->_itemViewGenerator + 2))();
  obj = (UIView *)objc_claimAutoreleasedReturnValue();
  if (obj != *p_itemView)
  {
    double v4 = [MEMORY[0x1E4F1CA48] array];
    double v5 = v4;
    if (self->_requestedSize) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_maximumAlignmentSize) {
      objc_msgSend(v5, "addObject:");
    }
    if (self->_groupSameSize) {
      objc_msgSend(v5, "addObject:");
    }
    if (self->_popoverGuideLeading) {
      objc_msgSend(v5, "addObject:");
    }
    if (self->_popoverGuideTrailing) {
      objc_msgSend(v5, "addObject:");
    }
    [MEMORY[0x1E4F5B268] deactivateConstraints:v5];
    requestedSize = self->_requestedSize;
    self->_requestedSize = 0;

    maximumAlignmentSize = self->_maximumAlignmentSize;
    self->_maximumAlignmentSize = 0;

    groupSameSize = self->_groupSameSize;
    self->_groupSameSize = 0;

    popoverGuideLeading = self->_popoverGuideLeading;
    self->_popoverGuideLeading = 0;

    popoverGuideTrailing = self->_popoverGuideTrailing;
    self->_popoverGuideTrailing = 0;

    objc_storeStrong((id *)&self->_itemView, obj);
  }
  if ([(UIBarButtonItem *)self->_item isCustomViewItem])
  {
    [(_UIButtonBarItemLayout *)self _updateCustomView];
    [(_UIButtonBarItemLayout *)self _updateItemViewSizing];
  }
  else
  {
    itemViewWrapper = self->_itemViewWrapper;
    self->_itemViewWrapper = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemViewGenerator, 0);
  objc_storeStrong((id *)&self->_popoverGuideHeight, 0);
  objc_storeStrong((id *)&self->_popoverGuideTop, 0);
  objc_storeStrong((id *)&self->_popoverGuideTrailing, 0);
  objc_storeStrong((id *)&self->_popoverGuideLeading, 0);
  objc_storeStrong((id *)&self->_groupSameSize, 0);
  objc_storeStrong((id *)&self->_maximumAlignmentSize, 0);
  objc_storeStrong((id *)&self->_requestedSize, 0);
  objc_storeStrong((id *)&self->_itemViewWrapper, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (_UIButtonBarItemLayout)initWithLayoutMetrics:(id)a3
{
  return 0;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIButtonBarItemLayout;
  v3 = [(_UIButtonBarLayout *)&v8 description];
  double v4 = (void *)[v3 mutableCopy];

  if (self->_groupSameSize) {
    [v4 appendString:@" usesGroupSizing"];
  }
  item = self->_item;
  double v6 = [(UIBarButtonItem *)item view];
  objc_msgSend(v4, "appendFormat:", @" item=%p view=%p requestedSize=%p maximumAlignmentSize=%p groupSameSize=%p", item, v6, self->_requestedSize, self->_maximumAlignmentSize, self->_groupSameSize);

  return v4;
}

- (BOOL)useGroupSizing
{
  return self->_useGroupSizing;
}

- (void)setSuppressSpacing:(BOOL)a3
{
  self->_suppressSpacing = a3;
}

- (id)itemViewGenerator
{
  return self->_itemViewGenerator;
}

@end