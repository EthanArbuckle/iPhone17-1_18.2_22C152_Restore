@interface BCCardStackTransitionCardSlideAnimationItem
- (BCCardStackTransitioningCard)card;
- (BOOL)isFocusedCard;
- (CGPoint)cardToCenter;
- (void)setCard:(id)a3;
- (void)setCardToCenter:(CGPoint)a3;
- (void)setIsFocusedCard:(BOOL)a3;
@end

@implementation BCCardStackTransitionCardSlideAnimationItem

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

- (void).cxx_destruct
{
}

@end