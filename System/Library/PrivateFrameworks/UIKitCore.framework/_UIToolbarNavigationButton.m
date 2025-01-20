@interface _UIToolbarNavigationButton
- (void)updateImageIfNeeded;
- (void)updateImageIfNeededWithTintColor:(id)a3;
@end

@implementation _UIToolbarNavigationButton

- (void)updateImageIfNeeded
{
}

- (void)updateImageIfNeededWithTintColor:(id)a3
{
  [(UINavigationButton *)self _setTintColor:a3];
  [(UINavigationButton *)self _updateStyle];
}

@end