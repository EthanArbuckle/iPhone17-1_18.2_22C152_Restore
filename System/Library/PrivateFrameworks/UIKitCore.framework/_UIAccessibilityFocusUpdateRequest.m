@interface _UIAccessibilityFocusUpdateRequest
- (BOOL)requiresNextFocusedItem;
- (BOOL)shouldPlayFocusSound;
- (int64_t)options;
- (void)setOptions:(int64_t)a3;
@end

@implementation _UIAccessibilityFocusUpdateRequest

- (BOOL)shouldPlayFocusSound
{
  return self->_options & 1;
}

- (BOOL)requiresNextFocusedItem
{
  return 1;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

@end