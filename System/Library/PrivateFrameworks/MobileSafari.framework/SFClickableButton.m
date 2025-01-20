@interface SFClickableButton
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)isClickEnabled;
- (void)clickInteractionDidClickDown:(id)a3;
- (void)setClickEnabled:(BOOL)a3;
@end

@implementation SFClickableButton

- (void)setClickEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  clickInteraction = self->_clickInteraction;
  if (v3)
  {
    if (!clickInteraction)
    {
      v6 = (_UIClickInteraction *)objc_alloc_init(MEMORY[0x1E4FB2030]);
      v7 = self->_clickInteraction;
      self->_clickInteraction = v6;

      [(_UIClickInteraction *)self->_clickInteraction setDelegate:self];
      v8 = self->_clickInteraction;
      [(SFClickableButton *)self addInteraction:v8];
    }
  }
  else if (clickInteraction)
  {
    -[SFClickableButton removeInteraction:](self, "removeInteraction:");
    v9 = self->_clickInteraction;
    self->_clickInteraction = 0;
  }
}

- (BOOL)isClickEnabled
{
  return self->_clickInteraction != 0;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)clickInteractionDidClickDown:(id)a3
{
}

- (void).cxx_destruct
{
}

@end