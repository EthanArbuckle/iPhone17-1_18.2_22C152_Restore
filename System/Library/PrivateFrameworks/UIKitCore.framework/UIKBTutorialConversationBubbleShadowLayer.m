@interface UIKBTutorialConversationBubbleShadowLayer
- (CGSize)_offsetForShadowStyle:(int64_t)a3;
- (UIKBTutorialConversationBubbleShadowLayer)initWithShadowType:(int64_t)a3;
- (double)_opacityForShadowStyle:(int64_t)a3;
- (double)_radiusForShadowStyle:(int64_t)a3;
- (int64_t)_shadowStyleForShadowType:(int64_t)a3 userInterfaceStyle:(int64_t)a4;
- (int64_t)shadowType;
- (int64_t)userInterfaceStyle;
- (void)_updateShadowProperties;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation UIKBTutorialConversationBubbleShadowLayer

- (UIKBTutorialConversationBubbleShadowLayer)initWithShadowType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBTutorialConversationBubbleShadowLayer;
  v4 = [(UIKBTutorialConversationBubbleShadowLayer *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_shadowType = a3;
    v4->_userInterfaceStyle = 0;
    id v6 = +[UIColor blackColor];
    -[UIKBTutorialConversationBubbleShadowLayer setShadowColor:](v5, "setShadowColor:", [v6 CGColor]);

    [(UIKBTutorialConversationBubbleShadowLayer *)v5 _updateShadowProperties];
  }
  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(UIKBTutorialConversationBubbleShadowLayer *)self _updateShadowProperties];
  }
}

- (void)_updateShadowProperties
{
  int64_t v3 = [(UIKBTutorialConversationBubbleShadowLayer *)self _shadowStyleForShadowType:self->_shadowType userInterfaceStyle:self->_userInterfaceStyle];
  [(UIKBTutorialConversationBubbleShadowLayer *)self _opacityForShadowStyle:v3];
  *(float *)&double v4 = v4;
  [(UIKBTutorialConversationBubbleShadowLayer *)self setShadowOpacity:v4];
  [(UIKBTutorialConversationBubbleShadowLayer *)self _radiusForShadowStyle:v3];
  -[UIKBTutorialConversationBubbleShadowLayer setShadowRadius:](self, "setShadowRadius:");
  [(UIKBTutorialConversationBubbleShadowLayer *)self _offsetForShadowStyle:v3];
  -[UIKBTutorialConversationBubbleShadowLayer setShadowOffset:](self, "setShadowOffset:");
}

- (int64_t)_shadowStyleForShadowType:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  int64_t v4 = 3;
  if (a3 != 1) {
    int64_t v4 = 0;
  }
  if (!a3) {
    int64_t v4 = 1;
  }
  if (a4 != 2) {
    int64_t v4 = 0;
  }
  if ((unint64_t)a4 >= 2) {
    return v4;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (double)_opacityForShadowStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 3) {
    return dbl_186B9DC20[a3];
  }
  return result;
}

- (double)_radiusForShadowStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 3) {
    return dbl_186B9DC40[a3];
  }
  return result;
}

- (CGSize)_offsetForShadowStyle:(int64_t)a3
{
  double v3 = 0.0;
  switch(a3)
  {
    case 0:
      double v4 = 8.0;
      break;
    case 1:
      double v4 = 6.0;
      break;
    case 2:
    case 3:
      double v3 = *MEMORY[0x1E4F1DB30];
      double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
    default:
      double v4 = 0.0;
      break;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end