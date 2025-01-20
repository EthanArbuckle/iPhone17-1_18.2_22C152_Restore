@interface THWReviewDragTargetLayout
- (Class)repClassOverride;
- (THWReviewDragTargetLayout)init;
- (THWReviewDragTargetLayout)initWithIndex:(unint64_t)a3;
- (double)distanceSquaredToPoint:(CGPoint)a3;
- (unint64_t)index;
@end

@implementation THWReviewDragTargetLayout

- (THWReviewDragTargetLayout)initWithIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewDragTargetLayout;
  result = [(THWReviewDragTargetLayout *)&v5 initWithInfo:0];
  if (result) {
    result->_index = a3;
  }
  return result;
}

- (THWReviewDragTargetLayout)init
{
  return [(THWReviewDragTargetLayout *)self initWithIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (double)distanceSquaredToPoint:(CGPoint)a3
{
  [self geometry].frame
  TSDCenterOfRect();

  TSDDistanceSquared();
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

@end