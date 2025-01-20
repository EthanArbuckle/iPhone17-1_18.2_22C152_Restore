@interface SearchUIRequestButton
- (BOOL)shouldTopAlignForAccessibilityContentSizes;
- (SFCommand)command;
- (TLKImageView)imageView;
- (TLKStackView)stackView;
- (TLKStoreButton)viewButton;
- (id)imageWithSymbolName:(id)a3 accessibilityDescription:(id)a4;
- (id)setupView;
- (int)lastState;
- (void)_updateButtonState:(int)a3;
- (void)buttonPressed;
- (void)setCommand:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLastState:(int)a3;
- (void)setStackView:(id)a3;
- (void)setViewButton:(id)a3;
- (void)updateButtonState:(BOOL)a3 withState:(int)a4;
@end

@implementation SearchUIRequestButton

- (BOOL)shouldTopAlignForAccessibilityContentSizes
{
  return 1;
}

- (void)buttonPressed
{
  v3 = [(SearchUIAccessoryViewController *)self feedbackDelegate];
  id v9 = +[SearchUIUtilities environmentForDelegate:v3];

  v4 = [(SearchUIAccessoryViewController *)self rowModel];
  v5 = [v4 buttonItems];
  v6 = [v5 firstObject];
  v7 = [(SearchUIAccessoryViewController *)self rowModel];
  v8 = +[SearchUICommandHandler handlerForButton:v6 rowModel:v7 environment:v9];
  [v8 executeWithTriggerEvent:2];
}

- (id)setupView
{
  v13[2] = *MEMORY[0x1E4F143B8];
  [(SearchUIRequestButton *)self setLastState:0];
  v3 = objc_opt_new();
  [v3 addTarget:self action:sel_buttonPressed forControlEvents:64];
  [(SearchUIRequestButton *)self setViewButton:v3];
  id v4 = objc_alloc_init(MEMORY[0x1E4FAE0C8]);
  [(SearchUIRequestButton *)self setImageView:v4];

  v5 = [(SearchUIRequestButton *)self imageView];
  [v5 setProminence:0];

  v6 = (void *)MEMORY[0x1E4FAE158];
  v7 = [(SearchUIRequestButton *)self viewButton];
  v13[0] = v7;
  v8 = [(SearchUIRequestButton *)self imageView];
  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v10 = [v6 verticalContainerStackViewWithArrangedSubviews:v9];
  [(SearchUIRequestButton *)self setStackView:v10];

  v11 = [(SearchUIRequestButton *)self stackView];

  return v11;
}

- (id)imageWithSymbolName:(id)a3 accessibilityDescription:(id)a4
{
  id v5 = a4;
  v6 = +[SearchUISymbolImage uiImageWithSymbolName:a3];
  [v6 setAccessibilityLabel:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FAE0C0]) initWithImage:v6];
  return v7;
}

- (void)_updateButtonState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(SearchUIRequestButton *)self lastState] == a3) {
    return;
  }
  [(SearchUIRequestButton *)self setLastState:v3];
  if (v3 == 3)
  {
    v8 = [(SearchUIRequestButton *)self viewButton];
    [v8 setHidden:1];

    v6 = +[SearchUIUtilities localizedStringForKey:@"DENIED"];
    v7 = @"x.circle";
  }
  else
  {
    if (v3 != 2)
    {
      v13 = [(SearchUIRequestButton *)self viewButton];
      [v13 setHidden:0];

      v11 = [(SearchUIRequestButton *)self imageView];
      id v14 = v11;
      uint64_t v12 = 1;
      goto LABEL_8;
    }
    id v5 = [(SearchUIRequestButton *)self viewButton];
    [v5 setHidden:1];

    v6 = +[SearchUIUtilities localizedStringForKey:@"APPROVED"];
    v7 = @"checkmark.circle";
  }
  id v9 = [(SearchUIRequestButton *)self imageWithSymbolName:v7 accessibilityDescription:v6];
  v10 = [(SearchUIRequestButton *)self imageView];
  [v10 setTlkImage:v9];

  v11 = [(SearchUIRequestButton *)self imageView];
  id v14 = v11;
  uint64_t v12 = 0;
LABEL_8:
  [v11 setHidden:v12];
}

- (void)updateButtonState:(BOOL)a3 withState:(int)a4
{
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__SearchUIRequestButton_updateButtonState_withState___block_invoke;
    v5[3] = &unk_1E6E74280;
    v5[4] = self;
    int v6 = a4;
    +[SearchUIUtilities performAnimatableChanges:v5];
  }
  else
  {
    [(SearchUIRequestButton *)self _updateButtonState:*(void *)&a4];
  }
}

uint64_t __53__SearchUIRequestButton_updateButtonState_withState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonState:*(unsigned int *)(a1 + 40)];
}

- (TLKStoreButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (int)lastState
{
  return self->_lastState;
}

- (void)setLastState:(int)a3
{
  self->_lastState = a3;
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
}

@end