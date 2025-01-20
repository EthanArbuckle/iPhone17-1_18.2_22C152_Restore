@interface CHDRelativeSizeAnchor
- (CGPoint)from;
- (CGPoint)to;
- (void)setFrom:(CGPoint)a3;
- (void)setTo:(CGPoint)a3;
@end

@implementation CHDRelativeSizeAnchor

- (void)setFrom:(CGPoint)a3
{
  self->mFrom = a3;
}

- (void)setTo:(CGPoint)a3
{
  self->mTo = a3;
}

- (CGPoint)from
{
  double x = self->mFrom.x;
  double y = self->mFrom.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)to
{
  double x = self->mTo.x;
  double y = self->mTo.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end