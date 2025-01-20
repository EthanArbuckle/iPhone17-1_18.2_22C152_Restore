@interface SKUIStorePageItemPinningConfiguration
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

@implementation SKUIStorePageItemPinningConfiguration

- (void)setPinningContentInset:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIStorePageItemPinningConfiguration setPinningContentInset:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  self->_pinningContentInset.CGFloat top = top;
  self->_pinningContentInset.CGFloat left = left;
  self->_pinningContentInset.CGFloat bottom = bottom;
  self->_pinningContentInset.CGFloat right = right;
  self->_hasValidPinningContentInset = 1;
}

- (void)setPinningStyle:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIStorePageItemPinningConfiguration setPinningStyle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  self->_pinningStyle = a3;
  self->_hasValidPinningStyle = 1;
}

- (void)setPinningGroup:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIStorePageItemPinningConfiguration setPinningGroup:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  self->_pinningGroup = a3;
  self->_hasValidPinningGroup = 1;
}

- (void)setPinningTransitionStyle:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStorePageItemPinningConfiguration setPinningTransitionStyle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  self->_pinningTransitionStyle = a3;
  self->_hasValidPinningTransitionStyle = 1;
}

- (void)invalidatePinningContentInset
{
}

- (void)invalidatePinningStyle
{
}

- (void)invalidatePinningGroup
{
}

- (void)invalidatePinningTransitionStyle
{
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

- (void)setPinningContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPinningStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPinningGroup:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPinningTransitionStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end