@interface _UIStaticScrollbarButton
- (BOOL)canBecomeFocused;
@end

@implementation _UIStaticScrollbarButton

- (BOOL)canBecomeFocused
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] != 3;

  return v3;
}

@end