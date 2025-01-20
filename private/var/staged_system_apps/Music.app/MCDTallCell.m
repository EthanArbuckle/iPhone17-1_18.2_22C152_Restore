@interface MCDTallCell
- (CGSize)sizeForArtwork;
- (CGSize)sizeThatFits:(CGSize)result;
@end

@implementation MCDTallCell

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 56.0;
  result.height = v3;
  return result;
}

- (CGSize)sizeForArtwork
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end