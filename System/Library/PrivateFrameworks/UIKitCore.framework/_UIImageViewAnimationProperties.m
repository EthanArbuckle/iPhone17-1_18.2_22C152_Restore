@interface _UIImageViewAnimationProperties
- (NSArray)animationImages;
- (NSArray)highlightedAnimationImages;
- (double)animationDuration;
- (int64_t)animationRepeatCount;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationImages:(id)a3;
- (void)setAnimationRepeatCount:(int64_t)a3;
- (void)setHighlightedAnimationImages:(id)a3;
@end

@implementation _UIImageViewAnimationProperties

- (NSArray)highlightedAnimationImages
{
  return self->_highlightedAnimationImages;
}

- (NSArray)animationImages
{
  return self->_animationImages;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (int64_t)animationRepeatCount
{
  return self->_animationRepeatCount;
}

- (void)setAnimationImages:(id)a3
{
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedAnimationImages, 0);
  objc_storeStrong((id *)&self->_animationImages, 0);
}

- (void)setHighlightedAnimationImages:(id)a3
{
}

- (void)setAnimationRepeatCount:(int64_t)a3
{
  self->_animationRepeatCount = a3;
}

@end