@interface _UIFloatingTabBarCell
+ (BOOL)_isInternalCell;
- (BOOL)hasSelectionHighlight;
- (_UIFloatingTabBarListItem)listItem;
- (void)layoutSubviews;
- (void)setListItem:(id)a3;
@end

@implementation _UIFloatingTabBarCell

+ (BOOL)_isInternalCell
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarCell;
  [(UICollectionViewCell *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  [(UIView *)self _setContinuousCornerRadius:CGRectGetHeight(v4) * 0.5];
}

- (BOOL)hasSelectionHighlight
{
  return 0;
}

- (_UIFloatingTabBarListItem)listItem
{
  return self->_listItem;
}

- (void)setListItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end