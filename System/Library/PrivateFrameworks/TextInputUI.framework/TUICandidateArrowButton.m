@interface TUICandidateArrowButton
- (BOOL)isTextEffectsButton;
- (BOOL)showsBackground;
- (CGPoint)arrowImageOffset;
- (NSString)arrowImageName;
- (NSString)originalArrowImageName;
- (TUICandidateArrowButton)initWithCoder:(id)a3;
- (TUICandidateArrowButton)initWithFrame:(CGRect)a3;
- (TUICandidateBackdropView)backdropView;
- (TUICandidateViewStyle)style;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)highlightBackgroundView;
- (double)imageViewAlpha;
- (id)rotatedImageForImage:(id)a3 scale:(double)a4;
- (int64_t)arrowDirection;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setArrowDirection:(int64_t)a3;
- (void)setArrowImageName:(id)a3;
- (void)setArrowImageOffset:(CGPoint)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setHighlightBackgroundView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOriginalArrowImageName:(id)a3;
- (void)setShowsBackground:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)udpateBackgroundColor;
- (void)updateStyle;
@end

@implementation TUICandidateArrowButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalArrowImageName, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_arrowImageName, 0);
}

- (void)setOriginalArrowImageName:(id)a3
{
}

- (NSString)originalArrowImageName
{
  return self->_originalArrowImageName;
}

- (void)setBackdropView:(id)a3
{
}

- (TUICandidateBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setHighlightBackgroundView:(id)a3
{
}

- (UIView)highlightBackgroundView
{
  return self->_highlightBackgroundView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (int64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowImageOffset:(CGPoint)a3
{
  self->_arrowImageOffset = a3;
}

- (CGPoint)arrowImageOffset
{
  double x = self->_arrowImageOffset.x;
  double y = self->_arrowImageOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)arrowImageName
{
  return self->_arrowImageName;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (void)updateStyle
{
  v3 = [(TUICandidateArrowButton *)self style];
  id v38 = [v3 textColor];

  v4 = [(TUICandidateArrowButton *)self style];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(TUICandidateArrowButton *)self style];
    uint64_t v7 = [v6 performSelector:sel_arrowButtonColor];

    id v38 = (id)v7;
  }
  v8 = [(TUICandidateArrowButton *)self style];
  if (objc_opt_respondsToSelector())
  {
    v9 = [(TUICandidateArrowButton *)self style];
    v10 = [v9 arrowButtonConfig];

    if (!v10) {
      goto LABEL_7;
    }
    v8 = [(TUICandidateArrowButton *)self style];
    v11 = [v8 arrowButtonConfig];
    [(TUICandidateArrowButton *)self setConfiguration:v11];
  }
LABEL_7:
  v12 = [(TUICandidateArrowButton *)self style];
  v13 = [(TUICandidateArrowButton *)self backdropView];
  [v13 setStyle:v12];

  [(TUICandidateArrowButton *)self setTitleColor:v38 forState:0];
  [(TUICandidateArrowButton *)self setTintColor:v38];
  BOOL v14 = [(TUICandidateArrowButton *)self isTextEffectsButton];
  v15 = (void *)MEMORY[0x1E4FB1830];
  if (v14)
  {
    v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:20.0];
    v17 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [MEMORY[0x1E4FB1910] sharedInputModeController];
      v20 = [v19 performSelector:sel_textEffectsButtonLanguageCode];

      if (v20)
      {
        v21 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v20];
        uint64_t v22 = [v16 configurationWithLocale:v21];

        v16 = (void *)v22;
      }
    }
    v23 = (void *)MEMORY[0x1E4FB1818];
    v24 = [(TUICandidateArrowButton *)self arrowImageName];
    uint64_t v25 = [v23 _systemImageNamed:v24 withConfiguration:v16];
  }
  else
  {
    v26 = [(TUICandidateArrowButton *)self style];
    v27 = [v26 candidateNumberFont];
    [v27 pointSize];
    v16 = objc_msgSend(v15, "configurationWithPointSize:weight:", 7);

    v28 = (void *)MEMORY[0x1E4FB1818];
    v29 = [(TUICandidateArrowButton *)self arrowImageName];
    v24 = [v28 systemImageNamed:v29 withConfiguration:v16];

    if (!v24)
    {
      v30 = (void *)MEMORY[0x1E4FB1818];
      v31 = [(TUICandidateArrowButton *)self arrowImageName];
      v24 = [v30 kitImageNamed:v31];
    }
    [v24 scale];
    uint64_t v25 = -[TUICandidateArrowButton rotatedImageForImage:scale:](self, "rotatedImageForImage:scale:", v24);
  }
  v32 = (void *)v25;

  v33 = [v32 imageWithTintColor:v38 renderingMode:2];
  [(TUICandidateArrowButton *)self setImage:v33 forState:0];
  v34 = [v32 imageWithTintColor:v38 renderingMode:2];

  [(TUICandidateArrowButton *)self setImage:v34 forState:2];
  [(TUICandidateArrowButton *)self imageViewAlpha];
  double v36 = v35;
  v37 = [(TUICandidateArrowButton *)self imageView];
  [v37 setAlpha:v36];

  [(TUICandidateArrowButton *)self udpateBackgroundColor];
}

- (id)rotatedImageForImage:(id)a3 scale:(double)a4
{
  id v6 = a3;
  int64_t v7 = [(TUICandidateArrowButton *)self arrowDirection];
  id v8 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v9 = v6;
  uint64_t v10 = [v9 CGImage];

  v11 = (void *)[v8 initWithCGImage:v10 scale:v7 orientation:a4];
  return v11;
}

- (double)imageViewAlpha
{
  v3 = [(TUICandidateArrowButton *)self style];
  [v3 foregroundOpacity];
  double v5 = v4;
  int v6 = [(TUICandidateArrowButton *)self isEnabled];
  double v7 = 0.35;
  if (v6) {
    double v7 = 1.0;
  }
  double v8 = v5 * v7;

  return v8;
}

- (void)udpateBackgroundColor
{
  double v3 = (double)[(TUICandidateArrowButton *)self showsBackground];
  double v4 = [(TUICandidateArrowButton *)self backgroundView];
  [v4 setAlpha:v3];

  double v5 = (double)[(TUICandidateArrowButton *)self showsBackground];
  int v6 = [(TUICandidateArrowButton *)self backdropView];
  [v6 setAlpha:v5];

  double v7 = (double)[(TUICandidateArrowButton *)self isHighlighted];
  double v8 = [(TUICandidateArrowButton *)self highlightBackgroundView];
  [v8 setAlpha:v7];

  id v9 = [(TUICandidateArrowButton *)self style];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(TUICandidateArrowButton *)self style];
    int v11 = [v10 arrowButtonHighlightBackgroundHidden];

    if (!v11) {
      goto LABEL_5;
    }
    id v9 = [(TUICandidateArrowButton *)self highlightBackgroundView];
    [v9 setAlpha:0.0];
  }

LABEL_5:
  v12 = [(TUICandidateArrowButton *)self style];
  v13 = [v12 highlightedBackgroundColor];
  BOOL v14 = [(TUICandidateArrowButton *)self highlightBackgroundView];
  [v14 setBackgroundColor:v13];

  id v17 = [(TUICandidateArrowButton *)self style];
  v15 = [v17 arrowButtonBackgroundColor];
  v16 = [(TUICandidateArrowButton *)self backgroundView];
  [v16 setBackgroundColor:v15];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUICandidateArrowButton;
  [(TUICandidateArrowButton *)&v4 setHighlighted:a3];
  [(TUICandidateArrowButton *)self udpateBackgroundColor];
}

- (void)setArrowDirection:(int64_t)a3
{
  if (self->_arrowDirection != a3)
  {
    self->_arrowDirection = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__TUICandidateArrowButton_setArrowDirection___block_invoke;
    v3[3] = &unk_1E55941A8;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __45__TUICandidateArrowButton_setArrowDirection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStyle];
}

- (void)setArrowImageName:(id)a3
{
  if (self->_arrowImageName != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    arrowImageName = self->_arrowImageName;
    self->_arrowImageName = v4;

    [(TUICandidateArrowButton *)self updateStyle];
  }
}

- (void)setStyle:(id)a3
{
  id v16 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    uint64_t v5 = [v16 arrowButtonImageName];
    if (!v5) {
      goto LABEL_4;
    }
    int v6 = (void *)v5;
    double v7 = [(TUICandidateArrowButton *)self arrowImageName];
    double v8 = [v16 arrowButtonImageName];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      if ([(TUICandidateArrowButton *)self isTextEffectsButton])
      {
        int v11 = [(TUICandidateArrowButton *)self originalArrowImageName];

        if (!v11)
        {
          v12 = [(TUICandidateArrowButton *)self arrowImageName];
          [(TUICandidateArrowButton *)self setOriginalArrowImageName:v12];
        }
      }
      v13 = [v16 arrowButtonImageName];
      [(TUICandidateArrowButton *)self setArrowImageName:v13];
    }
    else
    {
LABEL_4:
      uint64_t v10 = [v16 arrowButtonImageName];
      if (v10)
      {
      }
      else
      {
        BOOL v14 = [(TUICandidateArrowButton *)self originalArrowImageName];

        if (v14)
        {
          v15 = [(TUICandidateArrowButton *)self originalArrowImageName];
          [(TUICandidateArrowButton *)self setArrowImageName:v15];

          [(TUICandidateArrowButton *)self setOriginalArrowImageName:0];
        }
      }
    }
    [(TUICandidateArrowButton *)self updateStyle];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)TUICandidateArrowButton;
  [(TUICandidateArrowButton *)&v36 layoutSubviews];
  contentView = self->_contentView;
  objc_super v4 = [(TUICandidateArrowButton *)self highlightBackgroundView];
  [(UIView *)contentView sendSubviewToBack:v4];

  uint64_t v5 = self->_contentView;
  int v6 = [(TUICandidateArrowButton *)self backgroundView];
  [(UIView *)v5 sendSubviewToBack:v6];

  double v7 = self->_contentView;
  double v8 = [(TUICandidateArrowButton *)self backdropView];
  [(UIView *)v7 sendSubviewToBack:v8];

  char v9 = [(TUICandidateArrowButton *)self contentView];
  [(TUICandidateArrowButton *)self sendSubviewToBack:v9];

  [(TUICandidateArrowButton *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  char v18 = [(TUICandidateArrowButton *)self style];
  [v18 arrowButtonPadding];
  double v20 = v11 + v19;
  double v22 = v13 + v21;
  double v24 = v15 - (v19 + v23);
  double v26 = v17 - (v21 + v25);

  [(TUICandidateArrowButton *)self bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v20, v22, v24, v26);
  -[UIView setFrame:](self->_highlightBackgroundView, "setFrame:", v20, v22, v24, v26);
  if ([(TUICandidateArrowButton *)self isTextEffectsButton]) {
    double v27 = 4.0;
  }
  else {
    double v27 = 0.0;
  }
  [(TUICandidateArrowButton *)self arrowImageOffset];
  double v29 = v20 + v24 * 0.5 + v28;
  [(TUICandidateArrowButton *)self arrowImageOffset];
  double v31 = v27 + v22 + v26 * 0.5 + v30;
  v32 = [(TUICandidateArrowButton *)self imageView];
  objc_msgSend(v32, "setCenter:", v29, v31);

  [(TUICandidateArrowButton *)self imageViewAlpha];
  double v34 = v33;
  double v35 = [(TUICandidateArrowButton *)self imageView];
  [v35 setAlpha:v34];
}

- (BOOL)isTextEffectsButton
{
  v2 = [(TUICandidateArrowButton *)self style];
  double v3 = [v2 arrowButtonImageName];
  char v4 = [v3 hasPrefix:@"character.motion"];

  return v4;
}

- (void)setShowsBackground:(BOOL)a3
{
  if (self->_showsBackground != a3)
  {
    self->_showsBackground = a3;
    [(TUICandidateArrowButton *)self updateStyle];
  }
}

- (TUICandidateArrowButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateArrowButton;
  double v3 = [(TUICandidateArrowButton *)&v6 initWithCoder:a3];
  char v4 = v3;
  if (v3) {
    [(TUICandidateArrowButton *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateArrowButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateArrowButton;
  double v3 = -[TUICandidateArrowButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3) {
    [(TUICandidateArrowButton *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(TUICandidateArrowButton *)self bounds];
  char v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v4;

  [(UIView *)self->_contentView setUserInteractionEnabled:0];
  id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(TUICandidateArrowButton *)self bounds];
  double v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(TUICandidateArrowButton *)self bounds];
  double v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  highlightBackgroundView = self->_highlightBackgroundView;
  self->_highlightBackgroundView = v10;

  [(UIView *)self->_highlightBackgroundView setUserInteractionEnabled:0];
  double v12 = [TUICandidateBackdropView alloc];
  [(TUICandidateArrowButton *)self bounds];
  double v13 = -[TUICandidateBackdropView initWithFrame:](v12, "initWithFrame:");
  backdropView = self->_backdropView;
  self->_backdropView = v13;

  [(TUICandidateBackdropView *)self->_backdropView setUserInteractionEnabled:0];
  [(TUICandidateBackdropView *)self->_backdropView setAutoresizingMask:18];
  arrowImageName = self->_arrowImageName;
  self->_arrowImageName = (NSString *)@"kb-extend-arrow";

  [(TUICandidateArrowButton *)self setArrowDirection:0];
  [(TUICandidateArrowButton *)self setShowsBackground:1];
  [(UIView *)self->_contentView insertSubview:self->_highlightBackgroundView atIndex:0];
  [(UIView *)self->_contentView insertSubview:self->_backgroundView atIndex:0];
  [(UIView *)self->_contentView insertSubview:self->_backdropView atIndex:0];
  double v16 = self->_contentView;
  [(TUICandidateArrowButton *)self insertSubview:v16 atIndex:0];
}

@end