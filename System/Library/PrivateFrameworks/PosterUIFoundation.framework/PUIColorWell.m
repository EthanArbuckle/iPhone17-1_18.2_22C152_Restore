@interface PUIColorWell
- (CGSize)intrinsicContentSize;
@end

@implementation PUIColorWell

- (CGSize)intrinsicContentSize
{
  v2 = [(UIColorWell *)self selectedColor];

  double v3 = 44.0;
  if (!v2) {
    double v3 = 34.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end