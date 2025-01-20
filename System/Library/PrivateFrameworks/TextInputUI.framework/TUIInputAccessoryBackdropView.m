@interface TUIInputAccessoryBackdropView
- (TUIInputAccessoryViewTraits)inputAccessoryViewTraits;
- (void)_setRenderConfig:(id)a3;
- (void)setInputAccessoryViewTraits:(id)a3;
- (void)updateVisualStyle;
@end

@implementation TUIInputAccessoryBackdropView

- (void).cxx_destruct
{
}

- (TUIInputAccessoryViewTraits)inputAccessoryViewTraits
{
  return self->_inputAccessoryViewTraits;
}

- (void)updateVisualStyle
{
  v3 = [(TUIInputAccessoryBackdropView *)self inputAccessoryViewTraits];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(TUIInputAccessoryBackdropView *)self inputAccessoryViewTraits];
    v6 = [v5 inputAccessoryViewBackdropColor];
    [(TUIInputAccessoryBackdropView *)self setBackgroundColor:v6];
  }
  v7 = [(TUIInputAccessoryBackdropView *)self inputAccessoryViewTraits];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v10 = [(TUIInputAccessoryBackdropView *)self inputAccessoryViewTraits];
    v9 = [v10 inputAccessoryViewBackdropEffects];
    [(TUIInputAccessoryBackdropView *)self setBackgroundEffects:v9];
  }
}

- (void)_setRenderConfig:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIInputAccessoryBackdropView;
  [(TUIInputAccessoryBackdropView *)&v4 _setRenderConfig:a3];
  [(TUIInputAccessoryBackdropView *)self updateVisualStyle];
}

- (void)setInputAccessoryViewTraits:(id)a3
{
  v5 = (TUIInputAccessoryViewTraits *)a3;
  p_inputAccessoryViewTraits = &self->_inputAccessoryViewTraits;
  if (self->_inputAccessoryViewTraits != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_inputAccessoryViewTraits, a3);
    p_inputAccessoryViewTraits = (TUIInputAccessoryViewTraits **)[(TUIInputAccessoryBackdropView *)self updateVisualStyle];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_inputAccessoryViewTraits, v5);
}

@end