@interface UIKBTutorialConversationBubbleBackdropLayer
- (UIKBTutorialConversationBubbleBackdropLayer)init;
- (int64_t)userInterfaceStyle;
- (void)_updateBackgroundColor;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation UIKBTutorialConversationBubbleBackdropLayer

- (UIKBTutorialConversationBubbleBackdropLayer)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)UIKBTutorialConversationBubbleBackdropLayer;
  v2 = [(UIKBTutorialConversationBubbleBackdropLayer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(UIKBTutorialConversationBubbleBackdropLayer *)v2 _updateBackgroundColor];
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v4 setValue:@"default" forKeyPath:*MEMORY[0x1E4F3A1D0]];
    [v4 setValue:&unk_1ED3F28E8 forKeyPath:*MEMORY[0x1E4F3A1D8]];
    uint64_t v5 = MEMORY[0x1E4F1CC38];
    [v4 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1A0]];
    [v4 setValue:v5 forKeyPath:*MEMORY[0x1E4F3A1B8]];
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    [v4 setValue:MEMORY[0x1E4F1CC28] forKeyPath:*MEMORY[0x1E4F3A170]];
    [v4 setValue:v6 forKeyPath:*MEMORY[0x1E4F3A1B0]];
    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v7 setValue:&unk_1ED3F28F8 forKeyPath:*MEMORY[0x1E4F3A100]];
    v11[0] = v4;
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(UIKBTutorialConversationBubbleBackdropLayer *)v3 setFilters:v8];
  }
  return v3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(UIKBTutorialConversationBubbleBackdropLayer *)self _updateBackgroundColor];
  }
}

- (void)_updateBackgroundColor
{
  unint64_t userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle >= 2)
  {
    if (userInterfaceStyle != 2)
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    double v5 = 0.278431373;
    double v4 = 0.75;
  }
  else
  {
    double v4 = 0.9;
    double v5 = 1.0;
  }
  uint64_t v6 = +[UIColor colorWithWhite:v5 alpha:v4];
LABEL_7:
  id v7 = v6;
  -[UIKBTutorialConversationBubbleBackdropLayer setBackgroundColor:](self, "setBackgroundColor:", [v7 CGColor]);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end