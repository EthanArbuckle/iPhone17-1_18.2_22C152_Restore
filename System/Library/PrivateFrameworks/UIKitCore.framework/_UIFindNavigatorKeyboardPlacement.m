@interface _UIFindNavigatorKeyboardPlacement
- (BOOL)asInputAccessoryView;
- (void)setAsInputAccessoryView:(BOOL)a3;
@end

@implementation _UIFindNavigatorKeyboardPlacement

- (BOOL)asInputAccessoryView
{
  return *(&self->super._showing + 1);
}

- (void)setAsInputAccessoryView:(BOOL)a3
{
  *(&self->super._showing + 1) = a3;
}

@end