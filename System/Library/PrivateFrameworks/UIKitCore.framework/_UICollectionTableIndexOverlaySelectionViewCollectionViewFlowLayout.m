@interface _UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (CGRect)frameForDoneButton;
- (double)rightMarginForDoneButton;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)setFrameForDoneButton:(CGRect)a3;
- (void)setRightMarginForDoneButton:(double)a3;
@end

@implementation _UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v5 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"ExternalDoneKind" withIndexPath:a4];
  objc_msgSend(v5, "setFrame:", self->_frameForDoneButton.origin.x, self->_frameForDoneButton.origin.y, self->_frameForDoneButton.size.width, self->_frameForDoneButton.size.height);
  [(_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout *)self rightMarginForDoneButton];
  objc_msgSend(v5, "setRightMargin:");
  return v5;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (CGRect)frameForDoneButton
{
  double x = self->_frameForDoneButton.origin.x;
  double y = self->_frameForDoneButton.origin.y;
  double width = self->_frameForDoneButton.size.width;
  double height = self->_frameForDoneButton.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameForDoneButton:(CGRect)a3
{
  self->_frameForDoneButton = a3;
  [(UICollectionViewLayout *)self invalidateLayout];
}

- (double)rightMarginForDoneButton
{
  return self->_rightMarginForDoneButton;
}

- (void)setRightMarginForDoneButton:(double)a3
{
  self->_rightMarginForDoneButton = a3;
  [(UICollectionViewLayout *)self invalidateLayout];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout;
  v8 = [(UICollectionViewFlowLayout *)&v14 layoutAttributesForElementsInRect:sel_layoutAttributesForElementsInRect_];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  if (CGRectIntersectsRect(v17, self->_frameForDoneButton))
  {
    v9 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    v10 = [(_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout *)self layoutAttributesForSupplementaryViewOfKind:@"ExternalDoneKind" atIndexPath:v9];
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    uint64_t v12 = [v8 arrayByAddingObjectsFromArray:v11];

    v8 = (void *)v12;
  }
  return v8;
}

@end