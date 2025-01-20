@interface TUIInputAssistantHostView
- (BOOL)isCompact;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGAffineTransform)transformForContent;
- (NSArray)inputAccessoryBackdropConstraints;
- (NSArray)inputAssistantBackdropConstraints;
- (TUIInputAccessoryBackdropView)inputAccessoryBackdropView;
- (TUIInputAssistantBackdropView)inputAssistantBackdropView;
- (TUISystemInputAssistantView)systemInputAssistantView;
- (UIView)inputAccessoryView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)textEffectsVisibilityLevel;
- (void)ensureInputAssistantConstraints;
- (void)setCompact:(BOOL)a3;
- (void)setInputAccessoryBackdropConstraints:(id)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setInputAssistantBackdropConstraints:(id)a3;
- (void)setSystemInputAssistantView:(id)a3;
- (void)setTransformForContent:(CGAffineTransform *)a3;
- (void)updateInputAccessoryBackdrop;
- (void)updateInputAssistantBackdrop;
@end

@implementation TUIInputAssistantHostView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantBackdropConstraints, 0);
  objc_storeStrong((id *)&self->_inputAccessoryBackdropConstraints, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantView, 0);
  objc_storeStrong((id *)&self->_inputAssistantBackdropView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryBackdropView, 0);
}

- (void)setInputAssistantBackdropConstraints:(id)a3
{
}

- (NSArray)inputAssistantBackdropConstraints
{
  return self->_inputAssistantBackdropConstraints;
}

- (void)setInputAccessoryBackdropConstraints:(id)a3
{
}

- (NSArray)inputAccessoryBackdropConstraints
{
  return self->_inputAccessoryBackdropConstraints;
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (TUISystemInputAssistantView)systemInputAssistantView
{
  return self->_systemInputAssistantView;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)updateInputAssistantBackdrop
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v3 = [(TUIInputAssistantHostView *)self systemInputAssistantView];

  if (v3)
  {
    BOOL isCompact = self->_isCompact;
    v5 = [(TUIInputAssistantHostView *)self systemInputAssistantView];
    v6 = v5;
    if (isCompact)
    {
      v7 = [v5 rightButtonBar];
      v8 = [v7 centerYAnchor];
      v9 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v10 = [v9 centerYAnchor];
      v11 = [v8 constraintEqualToAnchor:v10];

      v12 = [(TUIInputAssistantHostView *)self systemInputAssistantView];
      v13 = [v12 centerXAnchor];
      v14 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v15 = [v14 centerXAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];

      v17 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v18 = [v17 heightAnchor];
      uint64_t v19 = [v18 constraintEqualToConstant:50.0];

      v20 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v21 = [v20 widthAnchor];
      uint64_t v22 = [v21 constraintEqualToConstant:65.0];

      v47[0] = v11;
      v23 = (void **)v47;
      v24 = (void *)v22;
      v25 = (void *)v19;
    }
    else
    {
      v26 = [v5 leftButtonBar];
      v27 = [v26 centerYAnchor];
      v28 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v29 = [v28 centerYAnchor];
      v11 = [v27 constraintEqualToAnchor:v29];

      v30 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v31 = [v30 leftAnchor];
      v32 = [(TUIInputAssistantHostView *)self systemInputAssistantView];
      v33 = [v32 leftButtonBar];
      v34 = [v33 leftAnchor];
      v16 = [v31 constraintEqualToAnchor:v34];

      v35 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v36 = [v35 rightAnchor];
      v37 = [(TUIInputAssistantHostView *)self systemInputAssistantView];
      v38 = [v37 rightButtonBar];
      v39 = [v38 rightAnchor];
      uint64_t v22 = [v36 constraintEqualToAnchor:v39];

      v40 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
      v41 = [v40 heightAnchor];
      uint64_t v19 = [v41 constraintEqualToConstant:50.0];

      v46 = v11;
      v23 = &v46;
      v24 = (void *)v19;
      v25 = (void *)v22;
    }
    v23[1] = v16;
    v23[2] = (void *)v22;
    v23[3] = (void *)v19;
    v42 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

    v43 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(TUIInputAssistantHostView *)self inputAssistantBackdropConstraints];
    [v43 deactivateConstraints:v44];

    [(TUIInputAssistantHostView *)self setInputAssistantBackdropConstraints:v42];
    [(TUIInputAssistantHostView *)self ensureInputAssistantConstraints];
    v45 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
    [v45 setContentCornerRadius:10.0];
  }
}

- (void)ensureInputAssistantConstraints
{
  if (self->_inputAssistantBackdropView)
  {
    uint64_t v3 = [(TUISystemInputAssistantView *)self->_systemInputAssistantView window];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = [(TUIInputAssistantBackdropView *)self->_inputAssistantBackdropView window];
      v6 = [(TUISystemInputAssistantView *)self->_systemInputAssistantView window];

      if (v5 == v6)
      {
        [MEMORY[0x1E4F28DC8] activateConstraints:self->_inputAssistantBackdropConstraints];
        uint64_t v7 = [(TUISystemInputAssistantView *)self->_systemInputAssistantView isHidden];
        inputAssistantBackdropView = self->_inputAssistantBackdropView;
        [(TUIInputAssistantBackdropView *)inputAssistantBackdropView setHidden:v7];
      }
    }
  }
}

- (TUIInputAssistantBackdropView)inputAssistantBackdropView
{
  inputAssistantBackdropView = self->_inputAssistantBackdropView;
  if (!inputAssistantBackdropView)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__TUIInputAssistantHostView_inputAssistantBackdropView__block_invoke;
    v5[3] = &unk_1E55941A8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
    [(TUIInputAssistantBackdropView *)self->_inputAssistantBackdropView setTranslatesAutoresizingMaskIntoConstraints:0];
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
  }
  return inputAssistantBackdropView;
}

uint64_t __55__TUIInputAssistantHostView_inputAssistantBackdropView__block_invoke(uint64_t a1)
{
  v2 = [TUIInputAssistantBackdropView alloc];
  uint64_t v3 = -[TUIInputAssistantBackdropView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 424);
  *(void *)(v4 + 424) = v3;

  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[53];
  return [v6 addSubview:v7];
}

- (void)updateInputAccessoryBackdrop
{
  v40[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUIInputAssistantHostView *)self inputAccessoryView];

  if (v3)
  {
    uint64_t v4 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropConstraints];

    if (!v4)
    {
      v5 = [(TUIInputAssistantHostView *)self inputAccessoryView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v7 = [(TUIInputAssistantHostView *)self inputAccessoryView];
      v8 = v7;
      if (isKindOfClass) {
        [v7 topAnchor];
      }
      else {
      v35 = [v7 bottomAnchor];
      }

      v39 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropView];
      v38 = [v39 topAnchor];
      v37 = [v38 constraintEqualToAnchor:v35];
      v40[0] = v37;
      v36 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropView];
      v34 = [v36 bottomAnchor];
      v33 = [(TUIInputAssistantHostView *)self bottomAnchor];
      v32 = [v34 constraintEqualToAnchor:v33];
      v40[1] = v32;
      v31 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropView];
      v30 = [v31 leadingAnchor];
      v9 = [(TUIInputAssistantHostView *)self inputAccessoryView];
      v10 = [v9 leadingAnchor];
      v11 = [v30 constraintEqualToAnchor:v10];
      v40[2] = v11;
      v12 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropView];
      v13 = [v12 trailingAnchor];
      v14 = [(TUIInputAssistantHostView *)self inputAccessoryView];
      v15 = [v14 trailingAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];
      v40[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
      [(TUIInputAssistantHostView *)self setInputAccessoryBackdropConstraints:v17];
    }
    v18 = [(TUIInputAssistantHostView *)self inputAccessoryView];
    int v19 = [v18 conformsToProtocol:&unk_1EDCA31E8];

    v20 = [(TUIInputAssistantHostView *)self inputAccessoryView];
    v21 = v20;
    if (!v19)
    {
      if (![v20 isHidden])
      {
        uint64_t v22 = [(TUIInputAssistantHostView *)self inputAccessoryView];
        [v22 alpha];
      }
      v21 = objc_opt_new();
    }
    v23 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropView];
    [v23 setInputAccessoryViewTraits:v21];

    v24 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropView];
    v25 = [v24 window];
    v26 = [(TUIInputAssistantHostView *)self inputAccessoryView];
    v27 = [v26 window];

    if (v25 == v27)
    {
      v28 = (void *)MEMORY[0x1E4F28DC8];
      v29 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropConstraints];
      [v28 activateConstraints:v29];
    }
  }
}

- (TUIInputAccessoryBackdropView)inputAccessoryBackdropView
{
  inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
  if (!inputAccessoryBackdropView)
  {
    uint64_t v4 = [TUIInputAccessoryBackdropView alloc];
    v5 = -[TUIInputAccessoryBackdropView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_inputAccessoryBackdropView;
    self->_inputAccessoryBackdropView = v5;

    [(TUIInputAssistantHostView *)self insertSubview:self->_inputAccessoryBackdropView atIndex:0];
    [(TUIInputAccessoryBackdropView *)self->_inputAccessoryBackdropView setTranslatesAutoresizingMaskIntoConstraints:0];
    inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
  }
  return inputAccessoryBackdropView;
}

- (void)setCompact:(BOOL)a3
{
  if (self->_isCompact == a3)
  {
    [(TUIInputAssistantHostView *)self ensureInputAssistantConstraints];
  }
  else
  {
    self->_BOOL isCompact = a3;
    [(TUIInputAssistantHostView *)self updateInputAssistantBackdrop];
  }
}

- (CGAffineTransform)transformForContent
{
  if (*(void *)&self[8].ty)
  {
    uint64_t v4 = [(CGAffineTransform *)self inputAssistantBackdropView];
    if (v4)
    {
      uint64_t v7 = v4;
      [v4 transform];
      uint64_t v4 = v7;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }
  return self;
}

- (void)setTransformForContent:(CGAffineTransform *)a3
{
  if (self->_inputAssistantBackdropView)
  {
    uint64_t v3 = [(TUIInputAssistantHostView *)self inputAssistantBackdropView];
    [v3 setTransform:&v4];
  }
}

- (void)setInputAccessoryView:(id)a3
{
  uint64_t v7 = (UIView *)a3;
  if (self->_inputAccessoryView != v7)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
    long long v6 = [(TUIInputAssistantHostView *)self inputAccessoryBackdropConstraints];
    [v5 deactivateConstraints:v6];

    [(TUIInputAssistantHostView *)self setInputAccessoryBackdropConstraints:0];
    objc_storeStrong((id *)&self->_inputAccessoryView, a3);
  }
  [(TUIInputAssistantHostView *)self updateInputAccessoryBackdrop];
}

- (void)setSystemInputAssistantView:(id)a3
{
  uint64_t v5 = (TUISystemInputAssistantView *)a3;
  if (self->_systemInputAssistantView == v5)
  {
    [(TUIInputAssistantHostView *)self ensureInputAssistantConstraints];
  }
  else
  {
    objc_storeStrong((id *)&self->_systemInputAssistantView, a3);
    [(TUIInputAssistantHostView *)self updateInputAssistantBackdrop];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TUIInputAssistantHostView;
  -[TUIInputAssistantHostView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (TUIInputAssistantHostView *)objc_claimAutoreleasedReturnValue();
  long long v6 = v5;
  if (v5 == self)
  {
    v8 = [(TUIInputAssistantHostView *)self layer];
    v9 = [v8 animationKeys];
    if ([v9 count]) {
      uint64_t v7 = self;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = v5;
  }

  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(TUIInputAssistantHostView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 isUserInteractionEnabled])
        {
          -[TUIInputAssistantHostView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          if (objc_msgSend(v13, "pointInside:withEvent:", v7))
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (int)textEffectsVisibilityLevel
{
  return *MEMORY[0x1E4FB2FF0];
}

@end