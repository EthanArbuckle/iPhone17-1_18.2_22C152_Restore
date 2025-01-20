@interface _PLViewControllerOneToOneTransitionContext
- (CGAffineTransform)targetTransform;
- (void)setTargetTransform:(CGAffineTransform *)a3;
@end

@implementation _PLViewControllerOneToOneTransitionContext

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].ty;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_targetTransform.c = v4;
  *(_OWORD *)&self->_targetTransform.tx = v3;
}

@end