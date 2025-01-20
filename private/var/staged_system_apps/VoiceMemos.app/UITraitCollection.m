@interface UITraitCollection
- (BOOL)isInAndromeda;
- (BOOL)isUserInterfaceStyleDark;
@end

@implementation UITraitCollection

- (BOOL)isUserInterfaceStyleDark
{
  return (id)[(UITraitCollection *)self userInterfaceStyle] == (id)2;
}

- (BOOL)isInAndromeda
{
  return [(UITraitCollection *)self _backlightLuminance] == (id)1;
}

@end