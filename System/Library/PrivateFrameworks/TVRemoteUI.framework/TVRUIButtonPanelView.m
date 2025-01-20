@interface TVRUIButtonPanelView
- (BOOL)isPagingEnabled;
- (NSMutableArray)leftButtons;
- (NSMutableArray)rightButtons;
- (TVRUIButton)primaryButton;
- (TVRUIButtonPanelView)initWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 secondaryRightButtons:(id)a5 styleProvider:(id)a6;
- (TVRUIPagingButton)pagingButton;
- (TVRUIStyleProvider)styleProvider;
- (_TVRUIEventDelegate)buttonEventDelegate;
- (id)_processButtons:(id)a3;
- (id)_searchButton;
- (id)initPagedPanelWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 styleProvider:(id)a5;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_buttonTapped:(id)a3;
- (void)_configureButton:(id)a3;
- (void)_disableButton:(id)a3 changeAlpha:(BOOL)a4;
- (void)_enableButton:(id)a3;
- (void)_sendButtonPressed:(int64_t)a3;
- (void)_sendButtonReleased:(int64_t)a3;
- (void)_sendButtonTapped:(int64_t)a3;
- (void)disableButtons:(BOOL)a3;
- (void)disableSearchButton;
- (void)enableButtonsForDevice:(id)a3;
- (void)enableSearchButton;
- (void)layoutSubviews;
- (void)setButtonEventDelegate:(id)a3;
- (void)setLeftButtons:(id)a3;
- (void)setPagingButton:(id)a3;
- (void)setPagingEnabled:(BOOL)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setRightButtons:(id)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation TVRUIButtonPanelView

- (TVRUIButtonPanelView)initWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 secondaryRightButtons:(id)a5 styleProvider:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TVRUIButtonPanelView;
  v13 = -[TVRUIButtonPanelView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_styleProvider, a6);
    v15 = [[TVRUIButton alloc] initWithType:a3 hasTapAction:0 buttonLocation:0];
    primaryButton = v14->_primaryButton;
    v14->_primaryButton = v15;

    [(TVRUIButtonPanelView *)v14 addSubview:v14->_primaryButton];
    [(TVRUIButtonPanelView *)v14 _configureButton:v14->_primaryButton];
    uint64_t v17 = [(TVRUIButtonPanelView *)v14 _processButtons:v10];
    leftButtons = v14->_leftButtons;
    v14->_leftButtons = (NSMutableArray *)v17;

    uint64_t v19 = [(TVRUIButtonPanelView *)v14 _processButtons:v11];
    rightButtons = v14->_rightButtons;
    v14->_rightButtons = (NSMutableArray *)v19;
  }
  return v14;
}

- (id)initPagedPanelWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 styleProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TVRUIButtonPanelView;
  id v10 = -[TVRUIButtonPanelView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_styleProvider, a5);
    id v12 = [[TVRUIButton alloc] initWithType:a3 hasTapAction:0];
    primaryButton = v11->_primaryButton;
    v11->_primaryButton = v12;

    [(TVRUIButtonPanelView *)v11 addSubview:v11->_primaryButton];
    [(TVRUIButtonPanelView *)v11 _configureButton:v11->_primaryButton];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"TVRemoteUIPageButtonText" value:&stru_26DB4CAE0 table:@"Localizable"];

    unint64_t v16 = [(TVRUIStyleProvider *)v11->_styleProvider maxPagingTitleLength];
    if ([v15 length] > v16)
    {
      uint64_t v17 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[TVRUIButtonPanelView initPagedPanelWithPrimaryButtonType:secondaryLeftButtons:styleProvider:]((uint64_t)v15, v16, v17);
      }

      uint64_t v18 = objc_msgSend(v15, "substringWithRange:", 0, 4);

      v15 = (void *)v18;
    }
    uint64_t v19 = [TVRUIPagingButton alloc];
    v20 = [(TVRUIButtonPanelView *)v11 styleProvider];
    uint64_t v21 = [(TVRUIPagingButton *)v19 initWithTitle:v15 styleProvider:v20];
    pagingButton = v11->_pagingButton;
    v11->_pagingButton = (TVRUIPagingButton *)v21;

    [(TVRUIButtonPanelView *)v11 addSubview:v11->_pagingButton];
    uint64_t v23 = [(TVRUIButtonPanelView *)v11 _processButtons:v8];
    leftButtons = v11->_leftButtons;
    v11->_leftButtons = (NSMutableArray *)v23;
  }
  return v11;
}

- (id)_processButtons:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue", (void)v14);
        id v12 = [[TVRUIButton alloc] initWithType:v11 hasTapAction:+[TVRUIButton buttonTypeHasTapAction:v11] buttonLocation:0];
        [(TVRUIButtonPanelView *)self addSubview:v12];
        [(TVRUIButtonPanelView *)self _configureButton:v12];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)TVRUIButtonPanelView;
  [(TVRUIButtonPanelView *)&v52 layoutSubviews];
  v3 = [(TVRUIButtonPanelView *)self styleProvider];
  [v3 primaryButtonSize];
  double v5 = v4;

  [(TVRUIButtonPanelView *)self bounds];
  CGFloat v6 = CGRectGetWidth(v53) * 0.5 - v5 * 0.5;
  [(TVRUIButtonPanelView *)self bounds];
  CGFloat v7 = CGRectGetHeight(v54) * 0.5 - v5 * 0.5;
  uint64_t v8 = [(TVRUIButtonPanelView *)self primaryButton];
  objc_msgSend(v8, "setFrame:", v6, v7, v5, v5);

  uint64_t v9 = [(TVRUIButtonPanelView *)self styleProvider];
  [v9 secondaryButtonSize];
  double v11 = v10;

  id v12 = [(TVRUIButtonPanelView *)self styleProvider];
  [v12 controlPanelInsets];
  double v14 = v13;

  [(TVRUIButtonPanelView *)self bounds];
  double v16 = (v15 - v5) * 0.5;
  long long v17 = [(TVRUIButtonPanelView *)self pagingButton];

  if (v17)
  {
    [(TVRUIButtonPanelView *)self bounds];
    CGFloat v18 = CGRectGetWidth(v55) - v14 - v11;
    uint64_t v19 = [(TVRUIButtonPanelView *)self pagingButton];
    objc_msgSend(v19, "setFrame:", v18, v16, v11, v5);
  }
  v20 = [(TVRUIButtonPanelView *)self rightButtons];
  uint64_t v21 = [v20 count];

  if (v21 == 1)
  {
    objc_super v22 = [(TVRUIButtonPanelView *)self primaryButton];
    [v22 frame];
    double v24 = v14 + v5 + v23;
    [(TVRUIButtonPanelView *)self bounds];
    double v26 = (v25 - v11) * 0.5;

    v27 = [(TVRUIButtonPanelView *)self rightButtons];
    v28 = v27;
    uint64_t v29 = 0;
  }
  else
  {
    v30 = [(TVRUIButtonPanelView *)self rightButtons];
    uint64_t v31 = [v30 count];

    if (v31 != 2) {
      goto LABEL_8;
    }
    [(TVRUIButtonPanelView *)self bounds];
    CGFloat v32 = CGRectGetWidth(v56) - v14 - v11;
    v33 = [(TVRUIButtonPanelView *)self rightButtons];
    v34 = [v33 objectAtIndexedSubscript:0];
    objc_msgSend(v34, "setFrame:", v32, v16, v11, v11);

    [(TVRUIButtonPanelView *)self bounds];
    double v24 = CGRectGetWidth(v57) - v14 - v11;
    [(TVRUIButtonPanelView *)self bounds];
    double v26 = v35 - v16 - v11;
    v27 = [(TVRUIButtonPanelView *)self rightButtons];
    v28 = v27;
    uint64_t v29 = 1;
  }
  v36 = [v27 objectAtIndexedSubscript:v29];
  objc_msgSend(v36, "setFrame:", v24, v26, v11, v11);

LABEL_8:
  v37 = [(TVRUIButtonPanelView *)self leftButtons];
  uint64_t v38 = [v37 count];

  if (v38 == 1)
  {
    v39 = [(TVRUIButtonPanelView *)self primaryButton];
    [v39 frame];
    double v14 = v40 - v14 - v11;
    [(TVRUIButtonPanelView *)self bounds];
    double v42 = (v41 - v11) * 0.5;

    v43 = [(TVRUIButtonPanelView *)self leftButtons];
    v44 = v43;
    uint64_t v45 = 0;
  }
  else
  {
    v46 = [(TVRUIButtonPanelView *)self leftButtons];
    uint64_t v47 = [v46 count];

    if (v47 != 2) {
      return;
    }
    v48 = [(TVRUIButtonPanelView *)self leftButtons];
    v49 = [v48 objectAtIndexedSubscript:0];
    objc_msgSend(v49, "setFrame:", v14, v16, v11, v11);

    [(TVRUIButtonPanelView *)self bounds];
    double v42 = v50 - v16 - v11;
    v43 = [(TVRUIButtonPanelView *)self leftButtons];
    v44 = v43;
    uint64_t v45 = 1;
  }
  v51 = [v43 objectAtIndexedSubscript:v45];
  objc_msgSend(v51, "setFrame:", v14, v42, v11, v11);
}

- (void)setButtonEventDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_buttonEventDelegate, obj);
    pagingButton = self->_pagingButton;
    id v7 = v5;
    [(TVRUIPagingButton *)pagingButton setButtonEventDelegate:obj];
  }
}

- (void)_configureButton:(id)a3
{
  id v5 = a3;
  [v5 addTarget:self action:sel__buttonPressed_ forControlEvents:1];
  [v5 addTarget:self action:sel__buttonReleased_ forControlEvents:448];
  if ([v5 hasTapAction])
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__buttonTapped_];
    [v4 setCancelsTouchesInView:0];
    [v5 addGestureRecognizer:v4];
  }
}

- (void)setPagingEnabled:(BOOL)a3
{
  self->_pagingEnabled = a3;
  -[TVRUIPagingButton setEnabled:](self->_pagingButton, "setEnabled:");
}

- (void)enableButtonsForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF980];
  CGFloat v6 = [(TVRUIButtonPanelView *)self primaryButton];
  id v7 = [v5 arrayWithObject:v6];

  uint64_t v8 = [(TVRUIButtonPanelView *)self leftButtons];
  [v7 addObjectsFromArray:v8];

  uint64_t v9 = [(TVRUIButtonPanelView *)self rightButtons];
  [v7 addObjectsFromArray:v9];

  double v10 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__TVRUIButtonPanelView_enableButtonsForDevice___block_invoke;
  v15[3] = &unk_2648007C0;
  id v16 = v7;
  long long v17 = self;
  id v18 = v4;
  id v11 = v4;
  id v12 = v7;
  [v10 animateWithDuration:v15 animations:0.24];
  double v13 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Enabled panel buttons", v14, 2u);
  }
}

void __47__TVRUIButtonPanelView_enableButtonsForDevice___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(a1[5], "_enableButton:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  id v7 = [a1[5] pagingButton];
  objc_msgSend(v7, "setEnabled:", objc_msgSend(a1[6], "supportsPaging"));
}

- (void)_enableButton:(id)a3
{
  id v3 = a3;
  [v3 setEnabled:1];
  [v3 setAlpha:1.0];
}

- (void)disableButtons:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TVRUIButtonPanelView *)self primaryButton];
  [(TVRUIButtonPanelView *)self _disableButton:v5 changeAlpha:v3];

  [(TVRUIPagingButton *)self->_pagingButton setEnabled:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [(TVRUIButtonPanelView *)self leftButtons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TVRUIButtonPanelView *)self _disableButton:*(void *)(*((void *)&v21 + 1) + 8 * v10++) changeAlpha:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v11 = [(TVRUIButtonPanelView *)self rightButtons];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [(TVRUIButtonPanelView *)self _disableButton:*(void *)(*((void *)&v17 + 1) + 8 * v15++) changeAlpha:v3];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v13);
  }

  id v16 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v26 = v3;
    _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "Disabled panel buttons. shouldChangeAlpha=%d", buf, 8u);
  }
}

- (void)_disableButton:(id)a3 changeAlpha:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = [(TVRUIButtonPanelView *)self styleProvider];
  [v6 disabledButtonAlpha];
  double v8 = v7;

  [v9 setEnabled:0];
  if (v4) {
    [v9 setAlpha:v8];
  }
}

- (void)disableSearchButton
{
  id v3 = [(TVRUIButtonPanelView *)self _searchButton];
  [(TVRUIButtonPanelView *)self _disableButton:v3 changeAlpha:1];
}

- (void)enableSearchButton
{
  id v3 = [(TVRUIButtonPanelView *)self _searchButton];
  [(TVRUIButtonPanelView *)self _enableButton:v3];
}

- (id)_searchButton
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(TVRUIButtonPanelView *)self rightButtons];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 buttonType] == 9998)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_buttonPressed:(id)a3
{
  id v4 = a3;
  if (([v4 hasTapAction] & 1) == 0) {
    -[TVRUIButtonPanelView _sendButtonPressed:](self, "_sendButtonPressed:", [v4 buttonType]);
  }
}

- (void)_buttonReleased:(id)a3
{
  id v4 = a3;
  if (([v4 hasTapAction] & 1) == 0) {
    -[TVRUIButtonPanelView _sendButtonReleased:](self, "_sendButtonReleased:", [v4 buttonType]);
  }
}

- (void)_buttonTapped:(id)a3
{
  id v4 = [a3 view];
  -[TVRUIButtonPanelView _sendButtonTapped:](self, "_sendButtonTapped:", [v4 buttonType]);
}

- (void)_sendButtonPressed:(int64_t)a3
{
  id v9 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:a3];
  uint64_t v4 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      long long v8 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_sendButtonReleased:(int64_t)a3
{
  id v9 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:a3];
  uint64_t v4 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      long long v8 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_sendButtonTapped:(int64_t)a3
{
  id v9 = +[TVRUIButtonEvent createButtonEvent:0 buttonType:a3];
  uint64_t v4 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      long long v8 = [(TVRUIButtonPanelView *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (BOOL)isPagingEnabled
{
  return self->_pagingEnabled;
}

- (TVRUIButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (TVRUIPagingButton)pagingButton
{
  return self->_pagingButton;
}

- (void)setPagingButton:(id)a3
{
}

- (NSMutableArray)leftButtons
{
  return self->_leftButtons;
}

- (void)setLeftButtons:(id)a3
{
}

- (NSMutableArray)rightButtons
{
  return self->_rightButtons;
}

- (void)setRightButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButtons, 0);
  objc_storeStrong((id *)&self->_leftButtons, 0);
  objc_storeStrong((id *)&self->_pagingButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

- (void)initPagedPanelWithPrimaryButtonType:(uint64_t)a1 secondaryLeftButtons:(uint64_t)a2 styleProvider:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_fault_impl(&dword_227326000, log, OS_LOG_TYPE_FAULT, "Paging button title was longer than max allowable length of (%ld), title is %{public}@", (uint8_t *)&v3, 0x16u);
}

@end