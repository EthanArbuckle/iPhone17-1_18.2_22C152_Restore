@interface BCCardStackTransitionCoverMoveAnimationItem
- (BCCardStackTransitioningCoverSource)cardCoverSource;
- (BCCardStackTransitioningCoverSource)coverSource;
- (BOOL)animatesInInnerContainerView;
- (BOOL)isFocusedCover;
- (BOOL)needsFadeInOnDismiss;
- (CGAffineTransform)coverToTransform;
- (CGPoint)coverToCenter;
- (void)setAnimatesInInnerContainerView:(BOOL)a3;
- (void)setCardCoverSource:(id)a3;
- (void)setCoverSource:(id)a3;
- (void)setCoverToCenter:(CGPoint)a3;
- (void)setCoverToTransform:(CGAffineTransform *)a3;
- (void)setIsFocusedCover:(BOOL)a3;
- (void)setNeedsFadeInOnDismiss:(BOOL)a3;
@end

@implementation BCCardStackTransitionCoverMoveAnimationItem

- (BCCardStackTransitioningCoverSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
}

- (BCCardStackTransitioningCoverSource)cardCoverSource
{
  return self->_cardCoverSource;
}

- (void)setCardCoverSource:(id)a3
{
}

- (BOOL)isFocusedCover
{
  return self->_isFocusedCover;
}

- (void)setIsFocusedCover:(BOOL)a3
{
  self->_isFocusedCover = a3;
}

- (BOOL)needsFadeInOnDismiss
{
  return self->_needsFadeInOnDismiss;
}

- (void)setNeedsFadeInOnDismiss:(BOOL)a3
{
  self->_needsFadeInOnDismiss = a3;
}

- (BOOL)animatesInInnerContainerView
{
  return self->_animatesInInnerContainerView;
}

- (void)setAnimatesInInnerContainerView:(BOOL)a3
{
  self->_animatesInInnerContainerView = a3;
}

- (CGPoint)coverToCenter
{
  double x = self->_coverToCenter.x;
  double y = self->_coverToCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCoverToCenter:(CGPoint)a3
{
  self->_coverToCenter = a3;
}

- (CGAffineTransform)coverToTransform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setCoverToTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_coverToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_coverToTransform.c = v4;
  *(_OWORD *)&self->_coverToTransform.tdouble x = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardCoverSource, 0);

  objc_storeStrong((id *)&self->_coverSource, 0);
}

@end