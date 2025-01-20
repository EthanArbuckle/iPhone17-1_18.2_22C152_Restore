@interface SKUIStorePageItemPinningLayoutInformation
- (CGRect)availablePinningFrame;
- (CGRect)layoutAttributesFrame;
- (double)afterPinningLocationYAdditions;
- (double)beforePinningLocationYAdditions;
- (void)setAfterPinningLocationYAdditions:(double)a3;
- (void)setAvailablePinningFrame:(CGRect)a3;
- (void)setBeforePinningLocationYAdditions:(double)a3;
- (void)setLayoutAttributesFrame:(CGRect)a3;
@end

@implementation SKUIStorePageItemPinningLayoutInformation

- (CGRect)availablePinningFrame
{
  double x = self->_availablePinningFrame.origin.x;
  double y = self->_availablePinningFrame.origin.y;
  double width = self->_availablePinningFrame.size.width;
  double height = self->_availablePinningFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAvailablePinningFrame:(CGRect)a3
{
  self->_availablePinningFrame = a3;
}

- (CGRect)layoutAttributesFrame
{
  double x = self->_layoutAttributesFrame.origin.x;
  double y = self->_layoutAttributesFrame.origin.y;
  double width = self->_layoutAttributesFrame.size.width;
  double height = self->_layoutAttributesFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLayoutAttributesFrame:(CGRect)a3
{
  self->_layoutAttributesFrame = a3;
}

- (double)afterPinningLocationYAdditions
{
  return self->_afterPinningLocationYAdditions;
}

- (void)setAfterPinningLocationYAdditions:(double)a3
{
  self->_afterPinningLocationYAdditions = a3;
}

- (double)beforePinningLocationYAdditions
{
  return self->_beforePinningLocationYAdditions;
}

- (void)setBeforePinningLocationYAdditions:(double)a3
{
  self->_beforePinningLocationYAdditions = a3;
}

@end