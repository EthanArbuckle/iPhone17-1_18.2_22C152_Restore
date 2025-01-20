@interface VUIShelfLayoutSection
- (CGRect)firstItemFrame;
- (CGRect)itemFrameAtIndex:(int64_t)a3;
- (CGRect)itemsBoundingFrame;
- (CGRect)lastItemFrame;
- (CGRect)sectionHeaderFrame;
- (UIEdgeInsets)sectionInset;
- (double)sectionHeaderHorizontalOffset;
- (double)sectionHeaderVerticalBump;
- (int64_t)numberOfItems;
- (void)dealloc;
- (void)setItemFrame:(CGRect)a3 atIndex:(int64_t)a4;
- (void)setItemsBoundingFrame:(CGRect)a3;
- (void)setNumberOfItems:(int64_t)numberOfItems;
- (void)setSectionHeaderFrame:(CGRect)a3;
- (void)setSectionHeaderHorizontalOffset:(double)a3;
- (void)setSectionHeaderVerticalBump:(double)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
@end

@implementation VUIShelfLayoutSection

- (void)dealloc
{
  [(VUIShelfLayoutSection *)self setNumberOfItems:0];
  v3.receiver = self;
  v3.super_class = (Class)VUIShelfLayoutSection;
  [(VUIShelfLayoutSection *)&v3 dealloc];
}

- (void)setNumberOfItems:(int64_t)numberOfItems
{
  if (self->_numberOfItems != numberOfItems)
  {
    self->_numberOfItems = numberOfItems;
    itemFrames = self->_itemFrames;
    if (itemFrames)
    {
      free(itemFrames);
      self->_itemFrames = 0;
      numberOfItems = self->_numberOfItems;
    }
    if (numberOfItems) {
      self->_itemFrames = (CGRect *)malloc_type_calloc(numberOfItems, 0x20uLL, 0x1000040E0EAB150uLL);
    }
  }
}

- (CGRect)itemFrameAtIndex:(int64_t)a3
{
  objc_super v3 = &self->_itemFrames[a3];
  double x = v3->origin.x;
  double y = v3->origin.y;
  double width = v3->size.width;
  double height = v3->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setItemFrame:(CGRect)a3 atIndex:(int64_t)a4
{
  self->_itemFrames[a4] = a3;
}

- (CGRect)firstItemFrame
{
  if (self->_numberOfItems < 1) {
    itemFrames = (CGRect *)MEMORY[0x1E4F1DB28];
  }
  else {
    itemFrames = self->_itemFrames;
  }
  double width = itemFrames->size.width;
  double height = itemFrames->size.height;
  double x = itemFrames->origin.x;
  double y = itemFrames->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lastItemFrame
{
  int64_t numberOfItems = self->_numberOfItems;
  if (numberOfItems < 1) {
    objc_super v3 = (CGRect *)MEMORY[0x1E4F1DB28];
  }
  else {
    objc_super v3 = &self->_itemFrames[numberOfItems - 1];
  }
  double width = v3->size.width;
  double height = v3->size.height;
  double x = v3->origin.x;
  double y = v3->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (CGRect)itemsBoundingFrame
{
  double x = self->_itemsBoundingFrame.origin.x;
  double y = self->_itemsBoundingFrame.origin.y;
  double width = self->_itemsBoundingFrame.size.width;
  double height = self->_itemsBoundingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setItemsBoundingFrame:(CGRect)a3
{
  self->_itemsBoundingFrame = a3;
}

- (CGRect)sectionHeaderFrame
{
  double x = self->_sectionHeaderFrame.origin.x;
  double y = self->_sectionHeaderFrame.origin.y;
  double width = self->_sectionHeaderFrame.size.width;
  double height = self->_sectionHeaderFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSectionHeaderFrame:(CGRect)a3
{
  self->_sectionHeaderFrame = a3;
}

- (double)sectionHeaderHorizontalOffset
{
  return self->_sectionHeaderHorizontalOffset;
}

- (void)setSectionHeaderHorizontalOffset:(double)a3
{
  self->_sectionHeaderHorizontalOffset = a3;
}

- (double)sectionHeaderVerticalBump
{
  return self->_sectionHeaderVerticalBump;
}

- (void)setSectionHeaderVerticalBump:(double)a3
{
  self->_sectionHeaderVerticalBump = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

@end