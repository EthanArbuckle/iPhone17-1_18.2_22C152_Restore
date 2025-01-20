@interface SUUIStorePageItemPinningConfiguration
- (BOOL)hasValidPinningContentInset;
- (BOOL)hasValidPinningGroup;
- (BOOL)hasValidPinningStyle;
- (BOOL)hasValidPinningTransitionStyle;
- (UIEdgeInsets)pinningContentInset;
- (int64_t)pinningGroup;
- (int64_t)pinningStyle;
- (int64_t)pinningTransitionStyle;
- (void)invalidatePinningContentInset;
- (void)invalidatePinningGroup;
- (void)invalidatePinningStyle;
- (void)invalidatePinningTransitionStyle;
- (void)setPinningContentInset:(UIEdgeInsets)a3;
- (void)setPinningGroup:(int64_t)a3;
- (void)setPinningStyle:(int64_t)a3;
- (void)setPinningTransitionStyle:(int64_t)a3;
@end

@implementation SUUIStorePageItemPinningConfiguration

- (void)setPinningContentInset:(UIEdgeInsets)a3
{
  self->_pinningContentInset = a3;
  self->_hasValidPinningContentInset = 1;
}

- (void)setPinningStyle:(int64_t)a3
{
  self->_pinningStyle = a3;
  self->_hasValidPinningStyle = 1;
}

- (void)setPinningGroup:(int64_t)a3
{
  self->_pinningGroup = a3;
  self->_hasValidPinningGroup = 1;
}

- (void)setPinningTransitionStyle:(int64_t)a3
{
  self->_pinningTransitionStyle = a3;
  self->_hasValidPinningTransitionStyle = 1;
}

- (void)invalidatePinningContentInset
{
  long long v2 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)&self->_pinningContentInset.top = *MEMORY[0x263F834E8];
  *(_OWORD *)&self->_pinningContentInset.bottom = v2;
  self->_hasValidPinningContentInset = 0;
}

- (void)invalidatePinningStyle
{
  self->_pinningStyle = 0;
  self->_hasValidPinningStyle = 0;
}

- (void)invalidatePinningGroup
{
  self->_pinningGroup = 0;
  self->_hasValidPinningGroup = 0;
}

- (void)invalidatePinningTransitionStyle
{
  self->_pinningTransitionStyle = 0;
  self->_hasValidPinningTransitionStyle = 0;
}

- (UIEdgeInsets)pinningContentInset
{
  double top = self->_pinningContentInset.top;
  double left = self->_pinningContentInset.left;
  double bottom = self->_pinningContentInset.bottom;
  double right = self->_pinningContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)hasValidPinningContentInset
{
  return self->_hasValidPinningContentInset;
}

- (int64_t)pinningStyle
{
  return self->_pinningStyle;
}

- (int64_t)pinningGroup
{
  return self->_pinningGroup;
}

- (BOOL)hasValidPinningStyle
{
  return self->_hasValidPinningStyle;
}

- (BOOL)hasValidPinningGroup
{
  return self->_hasValidPinningGroup;
}

- (int64_t)pinningTransitionStyle
{
  return self->_pinningTransitionStyle;
}

- (BOOL)hasValidPinningTransitionStyle
{
  return self->_hasValidPinningTransitionStyle;
}

@end