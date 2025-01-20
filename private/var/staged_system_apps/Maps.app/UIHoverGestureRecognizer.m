@interface UIHoverGestureRecognizer
- (BOOL)_maps_isHovering;
@end

@implementation UIHoverGestureRecognizer

- (BOOL)_maps_isHovering
{
  id v3 = [(UIHoverGestureRecognizer *)self state];
  if (v3 != (id)1) {
    LOBYTE(v3) = [(UIHoverGestureRecognizer *)self state] == (id)2;
  }
  return (char)v3;
}

@end