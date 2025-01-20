@interface THWGutterObjectPositioning
- (CGSize)offset;
- (unint64_t)bodyCharIndex;
- (void)setBodyCharIndex:(unint64_t)a3;
- (void)setOffset:(CGSize)a3;
@end

@implementation THWGutterObjectPositioning

- (CGSize)offset
{
  double width = self->mOffset.width;
  double height = self->mOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(THWGutterObjectPositioning *)self willModify];
  self->mOffset.CGFloat width = width;
  self->mOffset.CGFloat height = height;
}

- (unint64_t)bodyCharIndex
{
  return self->mBodyCharIndex;
}

- (void)setBodyCharIndex:(unint64_t)a3
{
  self->mBodyCharIndex = a3;
}

@end