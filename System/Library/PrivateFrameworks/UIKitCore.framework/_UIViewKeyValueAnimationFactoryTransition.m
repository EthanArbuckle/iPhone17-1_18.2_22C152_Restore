@interface _UIViewKeyValueAnimationFactoryTransition
- (CABasicAnimation)fromAnimation;
- (CABasicAnimation)toAnimation;
- (void)setFromAnimation:(id)a3;
- (void)setToAnimation:(id)a3;
@end

@implementation _UIViewKeyValueAnimationFactoryTransition

- (CABasicAnimation)fromAnimation
{
  return self->_fromAnimation;
}

- (void)setFromAnimation:(id)a3
{
}

- (CABasicAnimation)toAnimation
{
  return self->_toAnimation;
}

- (void)setToAnimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAnimation, 0);
  objc_storeStrong((id *)&self->_fromAnimation, 0);
}

@end