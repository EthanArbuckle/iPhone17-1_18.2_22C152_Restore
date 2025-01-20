@interface UIMultiscriptCandidateView
- (BOOL)requiresAlternativeCandidatesButton;
- (UIAction)alternativeCandidateAction;
- (UIAlternativeCandidatesButton)alternativeCandidatesButton;
- (UIButton)leadingButton;
- (UIButton)trailingButton;
- (UIMultiscriptCandidateView)init;
- (void)reloadArrangedSubviews:(id)a3;
- (void)setAlternativeCandidateAction:(id)a3;
- (void)setAlternativeCandidatesButton:(id)a3;
- (void)setLeadingButton:(id)a3;
- (void)setTrailingButton:(id)a3;
@end

@implementation UIMultiscriptCandidateView

- (UIMultiscriptCandidateView)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIMultiscriptCandidateView;
  v2 = [(UIView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UIStackView *)v2 setLayoutMarginsRelativeArrangement:0];
    [(UIView *)v3 setSemanticContentAttribute:3];
  }
  return v3;
}

- (void)reloadArrangedSubviews:(id)a3
{
  id v34 = a3;
  v4 = +[UIKeyboardInputModeController sharedInputModeController];
  objc_super v5 = [v4 currentInputMode];

  v6 = [v5 multiscriptSet];
  uint64_t v7 = [v5 multiscriptIndex];
  if ((unint64_t)[v6 count] < 2)
  {
    v9 = 0;
    if (v7)
    {
      BOOL v10 = 0;
      v8 = 0;
      goto LABEL_17;
    }
    v8 = 0;
    goto LABEL_13;
  }
  if (v7 == 1)
  {
    v9 = [v6 objectAtIndexedSubscript:0];
    v8 = 0;
LABEL_11:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  if (v7)
  {
    v8 = [v6 objectAtIndexedSubscript:0];
    v9 = 0;
    goto LABEL_11;
  }
  v8 = [v6 objectAtIndexedSubscript:1];
  if ((unint64_t)[v6 count] < 3)
  {
    v9 = 0;
  }
  else
  {
    v9 = [v6 objectAtIndexedSubscript:2];
  }
LABEL_13:
  v11 = +[UIKeyboardImpl activeInstance];
  v12 = [v11 textInputTraits];
  if ([v12 isSecureTextEntry])
  {
    BOOL v10 = 1;
  }
  else
  {
    v13 = +[UIKeyboardImpl activeInstance];
    v14 = [v13 textInputTraits];
    BOOL v10 = [v14 keyboardType] == 1;
  }
LABEL_17:
  BOOL v15 = [(UIMultiscriptCandidateView *)self requiresAlternativeCandidatesButton];
  BOOL v16 = v15;
  if (v8) {
    BOOL v17 = v15;
  }
  else {
    BOOL v17 = 0;
  }
  v18 = [(UIMultiscriptCandidateView *)self leadingButton];
  [(UIStackView *)self removeArrangedSubview:v18];

  v19 = [(UIMultiscriptCandidateView *)self leadingButton];
  [v19 removeFromSuperview];

  v20 = [(UIMultiscriptCandidateView *)self trailingButton];
  [(UIStackView *)self removeArrangedSubview:v20];

  v21 = [(UIMultiscriptCandidateView *)self trailingButton];
  [v21 removeFromSuperview];

  v22 = [(UIMultiscriptCandidateView *)self alternativeCandidatesButton];
  [(UIStackView *)self removeArrangedSubview:v22];

  v23 = [(UIMultiscriptCandidateView *)self alternativeCandidatesButton];
  [v23 removeFromSuperview];

  [(UIStackView *)self removeArrangedSubview:v34];
  if (v10)
  {
    [(UIStackView *)self addArrangedSubview:v34];
    goto LABEL_29;
  }
  if (v9)
  {
    v24 = _GetButtonForInputMode(v9, 1);
    [(UIMultiscriptCandidateView *)self setLeadingButton:v24];

    v25 = [(UIMultiscriptCandidateView *)self leadingButton];
    [(UIStackView *)self addArrangedSubview:v25];
  }
  else if (v17)
  {
    v26 = [(UIMultiscriptCandidateView *)self alternativeCandidateAction];
    v27 = _GetAlternativeCandidatesButton(v26, 1);
    [(UIMultiscriptCandidateView *)self setAlternativeCandidatesButton:v27];

    v28 = [(UIMultiscriptCandidateView *)self alternativeCandidatesButton];
    [(UIStackView *)self addArrangedSubview:v28];

    [(UIStackView *)self addArrangedSubview:v34];
LABEL_27:
    v29 = _GetButtonForInputMode(v8, 0);
    [(UIMultiscriptCandidateView *)self setTrailingButton:v29];

    uint64_t v30 = [(UIMultiscriptCandidateView *)self trailingButton];
LABEL_28:
    v31 = (void *)v30;
    [(UIStackView *)self addArrangedSubview:v30];

    goto LABEL_29;
  }
  [(UIStackView *)self addArrangedSubview:v34];
  if (v8) {
    goto LABEL_27;
  }
  if (v16)
  {
    v32 = [(UIMultiscriptCandidateView *)self alternativeCandidateAction];
    v33 = _GetAlternativeCandidatesButton(v32, 0);
    [(UIMultiscriptCandidateView *)self setAlternativeCandidatesButton:v33];

    uint64_t v30 = [(UIMultiscriptCandidateView *)self alternativeCandidatesButton];
    goto LABEL_28;
  }
LABEL_29:
}

- (BOOL)requiresAlternativeCandidatesButton
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  v3 = [v2 currentInputMode];

  v4 = [v3 multiscriptSet];
  uint64_t v5 = [v3 multiscriptIndex];
  BOOL v7 = (unint64_t)[v4 count] < 2 || v5 != 0;

  return v7;
}

- (UIAction)alternativeCandidateAction
{
  return self->_alternativeCandidateAction;
}

- (void)setAlternativeCandidateAction:(id)a3
{
}

- (UIButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
}

- (UIButton)trailingButton
{
  return self->_trailingButton;
}

- (void)setTrailingButton:(id)a3
{
}

- (UIAlternativeCandidatesButton)alternativeCandidatesButton
{
  return self->_alternativeCandidatesButton;
}

- (void)setAlternativeCandidatesButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeCandidatesButton, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_alternativeCandidateAction, 0);
}

@end