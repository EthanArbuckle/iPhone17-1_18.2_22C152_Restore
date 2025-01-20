@interface BCCardStackTransitionCardMoveAnimationItem
- (BCCardStackTransitioningCard)card;
- (BCCardStackTransitioningCoverSource)coverSource;
- (BOOL)isFocusedCard;
- (CGAffineTransform)cardSuperviewToTransform;
- (CGAffineTransform)cardToTransform;
- (CGPoint)cardToCenter;
- (void)setCard:(id)a3;
- (void)setCardSuperviewToTransform:(CGAffineTransform *)a3;
- (void)setCardToCenter:(CGPoint)a3;
- (void)setCardToTransform:(CGAffineTransform *)a3;
- (void)setCoverSource:(id)a3;
- (void)setIsFocusedCard:(BOOL)a3;
@end

@implementation BCCardStackTransitionCardMoveAnimationItem

- (BCCardStackTransitioningCoverSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
}

- (BCCardStackTransitioningCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
}

- (BOOL)isFocusedCard
{
  return self->_isFocusedCard;
}

- (void)setIsFocusedCard:(BOOL)a3
{
  self->_isFocusedCard = a3;
}

- (CGPoint)cardToCenter
{
  double x = self->_cardToCenter.x;
  double y = self->_cardToCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCardToCenter:(CGPoint)a3
{
  self->_cardToCenter = a3;
}

- (CGAffineTransform)cardToTransform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setCardToTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_cardToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_cardToTransform.c = v4;
  *(_OWORD *)&self->_cardToTransform.tdouble x = v3;
}

- (CGAffineTransform)cardSuperviewToTransform
{
  long long v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setCardSuperviewToTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_cardSuperviewToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_cardSuperviewToTransform.c = v4;
  *(_OWORD *)&self->_cardSuperviewToTransform.tdouble x = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);

  objc_storeStrong((id *)&self->_coverSource, 0);
}

@end