@interface EDAbsoluteAnchor
- (CGPoint)position;
- (CGRect)bounds;
- (CGSize)size;
- (void)setBounds:(CGRect)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation EDAbsoluteAnchor

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)bounds
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->mPosition.double x = a3.origin.x;
  self->mPosition.double y = a3.origin.y;
  self->mSize.double width = a3.size.width;
  self->mSize.double height = a3.size.height;
}

@end