@interface _UIImagePickerPlaceholderViewController
- (BOOL)hidesPlaceholderNavigationBar;
- (void)setHidesPlaceholderNavigationBar:(BOOL)a3;
@end

@implementation _UIImagePickerPlaceholderViewController

- (BOOL)hidesPlaceholderNavigationBar
{
  return self->_hidesPlaceholderNavigationBar;
}

- (void)setHidesPlaceholderNavigationBar:(BOOL)a3
{
  self->_hidesPlaceholderNavigationBar = a3;
}

@end