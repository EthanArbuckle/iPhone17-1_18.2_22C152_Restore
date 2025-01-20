@interface CHDAbsoluteSizeAnchor
- (CGPoint)from;
- (CGSize)size;
- (void)setFrom:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CHDAbsoluteSizeAnchor

- (CGPoint)from
{
  double x = self->mFrom.x;
  double y = self->mFrom.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFrom:(CGPoint)a3
{
  self->mFrom = a3;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

@end