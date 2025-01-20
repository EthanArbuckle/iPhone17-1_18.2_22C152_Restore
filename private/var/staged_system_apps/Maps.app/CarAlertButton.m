@interface CarAlertButton
- (BOOL)cancels;
- (id)accessibilityIdentifier;
- (int64_t)index;
- (void)setCancels:(BOOL)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation CarAlertButton

- (id)accessibilityIdentifier
{
  return @"CarAlertButton";
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (BOOL)cancels
{
  return self->_cancels;
}

- (void)setCancels:(BOOL)a3
{
  self->_cancels = a3;
}

@end