@interface CardAnimationManager
- (CardAnimation)cardHeightAnimation;
- (id)defaultCardHeightAnimation;
- (void)popCardHeightAnimation;
- (void)pushCardHeightAnimation:(id)a3;
@end

@implementation CardAnimationManager

- (id)defaultCardHeightAnimation
{
  if (qword_101610980 != -1) {
    dispatch_once(&qword_101610980, &stru_10131A3E0);
  }
  v2 = (void *)qword_101610978;

  return v2;
}

- (CardAnimation)cardHeightAnimation
{
  cardHeightAnimation = self->_cardHeightAnimation;
  if (cardHeightAnimation)
  {
    v3 = cardHeightAnimation;
  }
  else
  {
    v3 = [(CardAnimationManager *)self defaultCardHeightAnimation];
  }

  return v3;
}

- (void)pushCardHeightAnimation:(id)a3
{
  id v5 = a3;
  unint64_t cardHeightAnimationPushCount = self->_cardHeightAnimationPushCount;
  self->_unint64_t cardHeightAnimationPushCount = cardHeightAnimationPushCount + 1;
  if (!cardHeightAnimationPushCount)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_cardHeightAnimation, a3);
    id v5 = v7;
  }
}

- (void)popCardHeightAnimation
{
  unint64_t v2 = self->_cardHeightAnimationPushCount - 1;
  self->_unint64_t cardHeightAnimationPushCount = v2;
  if (!v2)
  {
    cardHeightAnimation = self->_cardHeightAnimation;
    self->_cardHeightAnimation = 0;
  }
}

- (void).cxx_destruct
{
}

@end