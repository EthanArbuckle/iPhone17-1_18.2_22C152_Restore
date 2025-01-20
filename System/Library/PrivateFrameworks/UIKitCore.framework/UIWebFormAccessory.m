@interface UIWebFormAccessory
+ (id)toolbarWithItems:(id)a3;
- (BOOL)isNextEnabled;
- (BOOL)isPreviousEnabled;
- (UIBarButtonItem)_autofill;
- (UIBarButtonItem)_clearButton;
- (UISegmentedControl)_tab;
- (UIWebFormAccessory)initWithInputAssistantItem:(id)a3;
- (UIWebFormAccessoryDelegate)delegate;
- (id)_autoFillButton;
- (void)_applyTreatmentToAutoFillLabel;
- (void)_nextTapped:(id)a3;
- (void)_previousTapped:(id)a3;
- (void)_refreshAutofillPresentation;
- (void)_setRenderConfig:(id)a3;
- (void)_updateFrame;
- (void)autoFill:(id)a3;
- (void)clear:(id)a3;
- (void)dealloc;
- (void)done:(id)a3;
- (void)hideAutoFillButton;
- (void)initForUCB:(id)a3;
- (void)layoutSubviews;
- (void)setClearVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNextEnabled:(BOOL)a3;
- (void)setNextPreviousItemsVisible:(BOOL)a3;
- (void)setPreviousEnabled:(BOOL)a3;
- (void)set_autofill:(id)a3;
- (void)set_clearButton:(id)a3;
- (void)set_tab:(id)a3;
- (void)showAutoFillButton;
- (void)showAutoFillButtonWithTitle:(id)a3;
@end

@implementation UIWebFormAccessory

+ (id)toolbarWithItems:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UIToolbar);
  [(UIToolbar *)v4 setBarStyle:0];
  [(UIToolbar *)v4 setTranslucent:1];
  [(UIView *)v4 setAutoresizingMask:18];
  [(UIToolbar *)v4 setItems:v3];

  return v4;
}

- (void)initForUCB:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  v4 = +[UIButton buttonWithType:1];
  [v4 addTarget:self action:sel_autoFill_ forControlEvents:64];
  [(UIView *)self bounds];
  double v6 = v5;
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, 0.0);
  v7 = +[UIColor labelColor];
  [v4 setTintColor:v7];

  v34 = [v4 titleLabel];
  objc_msgSend(v34, "setFrame:", 0.0, 0.0, 0.0, v6);
  [v34 setNumberOfLines:2];
  v8 = [[UIBarButtonItem alloc] initWithCustomView:v4];
  autofill = self->_autofill;
  self->_autofill = v8;

  v10 = [UIBarButtonItem alloc];
  v11 = +[UIImage kitImageNamed:@"UIButtonBarArrowUp"];
  v12 = [(UIBarButtonItem *)v10 initWithImage:v11 style:0 target:self action:sel__previousTapped_];
  previousItem = self->_previousItem;
  self->_previousItem = v12;

  v14 = +[UIColor blackColor];
  [(UIBarButtonItem *)self->_previousItem setTintColor:v14];

  [(UIBarButtonItem *)self->_previousItem setEnabled:0];
  v15 = [UIBarButtonItem alloc];
  v16 = +[UIImage kitImageNamed:@"UIButtonBarArrowDown"];
  v17 = [(UIBarButtonItem *)v15 initWithImage:v16 style:0 target:self action:sel__nextTapped_];
  nextItem = self->_nextItem;
  self->_nextItem = v17;

  v19 = +[UIColor blackColor];
  [(UIBarButtonItem *)self->_nextItem setTintColor:v19];

  [(UIBarButtonItem *)self->_nextItem setEnabled:0];
  v20 = [UIBarButtonItemGroup alloc];
  v37[0] = self->_autofill;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v22 = [(UIBarButtonItemGroup *)v20 initWithBarButtonItems:v21 representativeItem:0];
  buttonGroupAutoFill = self->_buttonGroupAutoFill;
  self->_buttonGroupAutoFill = v22;

  [(UIBarButtonItemGroup *)self->_buttonGroupAutoFill setHidden:1];
  v24 = [UIBarButtonItemGroup alloc];
  v25 = self->_nextItem;
  v36[0] = self->_previousItem;
  v36[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v27 = [(UIBarButtonItemGroup *)v24 initWithBarButtonItems:v26 representativeItem:0];
  buttonGroupNavigation = self->_buttonGroupNavigation;
  self->_buttonGroupNavigation = v27;

  id v29 = v35;
  v30 = [v29 leadingBarButtonGroups];
  v31 = (void *)[v30 mutableCopy];

  [v31 addObject:self->_buttonGroupAutoFill];
  [v29 setLeadingBarButtonGroups:v31];
  v32 = [v29 trailingBarButtonGroups];
  v33 = (void *)[v32 mutableCopy];

  [v33 addObject:self->_buttonGroupNavigation];
  [v29 setTrailingBarButtonGroups:v33];
}

- (UIWebFormAccessory)initWithInputAssistantItem:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self init];
  if (v5)
  {
    if (UIWebCurrentUserInterfaceIdiomIsSmallScreen())
    {
      [(UIInputView *)v5 setContentRatio:1.0];
      double v6 = [MEMORY[0x1E4F1CA48] array];
      v7 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:103 target:v5 action:sel__previousTapped_];
      previousItem = v5->_previousItem;
      v5->_previousItem = v7;

      [(UIBarButtonItem *)v5->_previousItem setEnabled:0];
      [v6 addObject:v5->_previousItem];
      v9 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:6 target:0 action:0];
      nextPreviousSpacer = v5->_nextPreviousSpacer;
      v5->_nextPreviousSpacer = v9;

      [(UIBarButtonItem *)v5->_nextPreviousSpacer setWidth:6.0];
      [v6 addObject:v5->_nextPreviousSpacer];
      v11 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:104 target:v5 action:sel__nextTapped_];
      nextItem = v5->_nextItem;
      v5->_nextItem = v11;

      [(UIBarButtonItem *)v5->_nextItem setEnabled:0];
      [v6 addObject:v5->_nextItem];
      v13 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
      flexibleSpaceItem = v5->_flexibleSpaceItem;
      v5->_flexibleSpaceItem = v13;

      v15 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:6 target:0 action:0];
      autofillSpacer = v5->_autofillSpacer;
      v5->_autofillSpacer = v15;

      [(UIBarButtonItem *)v5->_autofillSpacer setWidth:6.0];
      v17 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:0 target:v5 action:sel_done_];
      doneButton = v5->_doneButton;
      v5->_doneButton = v17;

      [v6 addObject:v5->_flexibleSpaceItem];
      [v6 addObject:v5->_doneButton];
      uint64_t v19 = +[UIWebFormAccessory toolbarWithItems:v6];
      leftToolbar = v5->_leftToolbar;
      v5->_leftToolbar = (UIToolbar *)v19;

      v21 = [(UIInputView *)v5 leftContentView];
      [v21 addSubview:v5->_leftToolbar];

      uint64_t v22 = +[UIWebFormAccessory toolbarWithItems:MEMORY[0x1E4F1CBF0]];
      rightToolbar = v5->_rightToolbar;
      v5->_rightToolbar = (UIToolbar *)v22;

      v24 = [(UIInputView *)v5 rightContentView];
      [v24 addSubview:v5->_rightToolbar];

      [(UIWebFormAccessory *)v5 _updateFrame];
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 addObserver:v5 selector:sel__orientationDidChange_ name:@"UIApplicationDidChangeStatusBarOrientationNotification" object:0];

      v26 = v5;
    }
    else
    {
      v5->_usesUCB = 1;
      [(UIWebFormAccessory *)v5 initForUCB:v4];
      v27 = v5;
    }
  }

  return v5;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationDidChangeStatusBarOrientationNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIWebFormAccessory;
  [(UIView *)&v4 dealloc];
}

- (void)_setRenderConfig:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  double v5 = [off_1E52D39B8 defaultFontForTextStyle:@"UICTFontTextStyleEmphasizedSubhead"];
  uint64_t v6 = *(void *)off_1E52D2040;
  id v12 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", v5, *(void *)off_1E52D2040, 0);

  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v8 = otherButtonFont();
  v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v6, 0);

  v10 = 0;
  if (![(UIView *)self _lightStyleRenderConfig])
  {
    v10 = +[UIColor whiteColor];
    uint64_t v11 = *(void *)off_1E52D2048;
    [v12 setObject:v10 forKey:*(void *)off_1E52D2048];
    [v9 setObject:v10 forKey:v11];
  }
  [(UIView *)self setTintColor:v10];
  [(UIBarButtonItem *)self->_doneButton setTitleTextAttributes:v12 forState:0];
  [(UIBarButtonItem *)self->_clearButton setTitleTextAttributes:v9 forState:0];
}

- (void)_updateFrame
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[UIToolbar sizeThatFits:](self->_leftToolbar, "sizeThatFits:", v7, v9);
  -[UIInputView setFrame:](self, "setFrame:", v4, v6, v8, v10);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebFormAccessory;
  [(UIView *)&v5 layoutSubviews];
  if (!self->_usesUCB || ![(UIBarButtonItemGroup *)self->_buttonGroupAutoFill isHidden])
  {
    if (self->_autofill)
    {
      [(UIWebFormAccessory *)self _refreshAutofillPresentation];
      [(UIWebFormAccessory *)self _applyTreatmentToAutoFillLabel];
      double v3 = [(UIWebFormAccessory *)self _autoFillButton];
      [v3 frame];
      [(UIBarButtonItem *)self->_autofill setWidth:v4];
    }
  }
}

- (void)done:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  [WeakRetained accessoryDone];
}

- (void)_previousTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  [WeakRetained accessoryTab:0];
}

- (void)_nextTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  [WeakRetained accessoryTab:1];
}

- (void)autoFill:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  [WeakRetained accessoryAutoFill];
}

- (void)clear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  [WeakRetained accessoryClear];
}

- (id)_autoFillButton
{
  return [(UIBarButtonItem *)self->_autofill customView];
}

- (void)_refreshAutofillPresentation
{
  if (self->_autofill)
  {
    double v3 = [(UIInputView *)self leftContentView];
    [v3 frame];
    double MaxX = CGRectGetMaxX(v13);
    objc_super v5 = [(UIInputView *)self rightContentView];
    [v5 frame];
    double MinX = CGRectGetMinX(v14);

    double v7 = [(UIToolbar *)self->_leftToolbar items];
    id v11 = (id)[v7 mutableCopy];

    double v8 = [(UIToolbar *)self->_rightToolbar items];
    double v9 = (void *)[v8 mutableCopy];

    [v11 removeObject:self->_autofillSpacer];
    [v11 removeObject:self->_autofill];
    [v9 removeObject:self->_flexibleSpaceItem];
    [v9 removeObject:self->_autofill];
    if (MaxX == MinX)
    {
      uint64_t v10 = [v11 indexOfObject:self->_nextItem];
      [v11 insertObject:self->_autofillSpacer atIndex:v10 + 1];
      [v11 insertObject:self->_autofill atIndex:v10 + 2];
    }
    else
    {
      [v9 insertObject:self->_flexibleSpaceItem atIndex:0];
      [v9 addObject:self->_autofill];
    }
    [(UIToolbar *)self->_leftToolbar setItems:v11];
    [(UIToolbar *)self->_rightToolbar setItems:v9];
  }
}

- (void)_applyTreatmentToAutoFillLabel
{
  double v3 = [(UIWebFormAccessory *)self _autoFillButton];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__94;
  id v29 = __Block_byref_object_dispose__94;
  id v30 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __52__UIWebFormAccessory__applyTreatmentToAutoFillLabel__block_invoke;
  uint64_t v22 = &unk_1E52E3210;
  v24 = &v25;
  id v4 = v3;
  id v23 = v4;
  +[UIView performWithoutAnimation:&v19];
  objc_msgSend((id)v26[5], "frame", v19, v20, v21, v22);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = otherButtonFont();
  [(id)v26[5] setFont:v11];

  id v12 = [(UIView *)self traitCollection];
  uint64_t v13 = [v12 horizontalSizeClass];

  if (v13 == 1) {
    double v14 = 180.0;
  }
  else {
    double v14 = 200.0;
  }
  objc_msgSend((id)v26[5], "sizeThatFits:", 1.79769313e308, v10);
  if (v15 > v14)
  {
    v16 = [off_1E52D39C0 defaultFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote"];
    v17 = [off_1E52D39B8 fontWithDescriptor:v16 size:0.0];

    [(id)v26[5] setFont:v17];
  }
  objc_msgSend((id)v26[5], "sizeThatFits:", v14, 1.79769313e308);
  objc_msgSend((id)v26[5], "setFrame:", v6, v8, v18, v10);
  [v4 frame];
  objc_msgSend(v4, "setFrame:");

  _Block_object_dispose(&v25, 8);
}

void __52__UIWebFormAccessory__applyTreatmentToAutoFillLabel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) titleLabel];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)hideAutoFillButton
{
  if (self->_autofill)
  {
    uint64_t v3 = [(UIToolbar *)self->_leftToolbar items];
    id v5 = (id)[v3 mutableCopy];

    [v5 removeObject:self->_autofill];
    [(UIToolbar *)self->_leftToolbar setItems:v5];
    if (self->_usesUCB)
    {
      [(UIBarButtonItemGroup *)self->_buttonGroupAutoFill setHidden:1];
    }
    else
    {
      autofill = self->_autofill;
      self->_autofill = 0;
    }
  }
}

- (void)showAutoFillButtonWithTitle:(id)a3
{
  id v12 = a3;
  id v4 = [(UIBarButtonItem *)self->_autofill customView];
  if (!v4)
  {
    id v4 = +[UIButton buttonWithType:1];
    [v4 addTarget:self action:sel_autoFill_ forControlEvents:64];
    [(UIView *)self bounds];
    double v6 = v5;
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, 0.0);
    double v7 = [v4 titleLabel];
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, 0.0, v6);
    [v7 setNumberOfLines:2];
    double v8 = [[UIBarButtonItem alloc] initWithCustomView:v4];
    autofill = self->_autofill;
    self->_autofill = v8;
  }
  double v10 = [v4 titleForState:0];
  char v11 = [v12 isEqualToString:v10];

  if ((v11 & 1) == 0) {
    [v4 setTitle:v12 forState:0];
  }
  if (self->_usesUCB) {
    [(UIBarButtonItemGroup *)self->_buttonGroupAutoFill setHidden:0];
  }
  [(UIView *)self setNeedsLayout];
}

- (void)showAutoFillButton
{
  if (self->_usesUCB || !self->_autofill) {
    [(UIWebFormAccessory *)self showAutoFillButtonWithTitle:&stru_1ED0E84C0];
  }
}

- (void)setClearVisible:(BOOL)a3
{
  if ((((self->_clearButton == 0) ^ a3) & 1) == 0)
  {
    id v4 = [(UIToolbar *)self->_leftToolbar items];
    id v10 = (id)[v4 mutableCopy];

    if (self->_clearButton)
    {
      uint64_t v5 = objc_msgSend(v10, "indexOfObject:");
      [(UIWebFormAccessory *)self set_clearButton:0];
      [v10 removeObjectAtIndex:v5];
    }
    else
    {
      uint64_t v6 = [v10 indexOfObject:self->_doneButton];
      double v7 = _UINSLocalizedStringWithDefaultValue(@"Clear", @"Clear");
      double v8 = [[UIBarButtonItem alloc] initWithTitle:v7 style:0 target:self action:sel_clear_];
      clearButton = self->_clearButton;
      self->_clearButton = v8;

      [v10 insertObject:self->_clearButton atIndex:v6];
    }
    [(UIToolbar *)self->_leftToolbar setItems:v10];
  }
}

- (void)setNextPreviousItemsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_usesUCB)
  {
    BOOL v5 = !a3;
    buttonGroupNavigation = self->_buttonGroupNavigation;
    [(UIBarButtonItemGroup *)buttonGroupNavigation setHidden:v5];
    return;
  }
  id v14 = [(UIToolbar *)self->_leftToolbar items];
  int v7 = [v14 containsObject:self->_previousItem];
  int v8 = [v14 containsObject:self->_nextPreviousSpacer];
  int v9 = [v14 containsObject:self->_nextItem];
  int v10 = v9;
  if (!v3 || (v7 ? (BOOL v11 = v8 == 0) : (BOOL v11 = 1), v11 || (v9 & 1) == 0))
  {
    if ((v3 | v7 | v8 | v9) == 1)
    {
      id v12 = (void *)[v14 mutableCopy];
      uint64_t v13 = v12;
      if (v3)
      {
        if (v10)
        {
          if (v8) {
            goto LABEL_15;
          }
        }
        else
        {
          [v12 insertObject:self->_nextItem atIndex:0];
          if (v8)
          {
LABEL_15:
            if (v7) {
              goto LABEL_27;
            }
            goto LABEL_23;
          }
        }
        [v13 insertObject:self->_nextPreviousSpacer atIndex:0];
        if (v7)
        {
LABEL_27:
          [(UIToolbar *)self->_leftToolbar setItems:v13];
          [(UIView *)self setNeedsLayout];

          goto LABEL_28;
        }
LABEL_23:
        [v13 insertObject:self->_previousItem atIndex:0];
        goto LABEL_27;
      }
      if (v7)
      {
        [v12 removeObject:self->_previousItem];
        if (!v8)
        {
LABEL_19:
          if (!v10) {
            goto LABEL_27;
          }
          goto LABEL_26;
        }
      }
      else if (!v8)
      {
        goto LABEL_19;
      }
      [v13 removeObject:self->_nextPreviousSpacer];
      if (!v10) {
        goto LABEL_27;
      }
LABEL_26:
      [v13 removeObject:self->_nextItem];
      goto LABEL_27;
    }
  }
LABEL_28:
}

- (void)setNextEnabled:(BOOL)a3
{
}

- (BOOL)isNextEnabled
{
  return [(UIBarButtonItem *)self->_nextItem isEnabled];
}

- (void)setPreviousEnabled:(BOOL)a3
{
}

- (BOOL)isPreviousEnabled
{
  return [(UIBarButtonItem *)self->_previousItem isEnabled];
}

- (UISegmentedControl)_tab
{
  return self->_tab;
}

- (void)set_tab:(id)a3
{
}

- (UIBarButtonItem)_autofill
{
  return self->_autofill;
}

- (void)set_autofill:(id)a3
{
}

- (UIBarButtonItem)_clearButton
{
  return self->_clearButton;
}

- (void)set_clearButton:(id)a3
{
}

- (UIWebFormAccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (UIWebFormAccessoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_autofill, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_buttonGroupNavigation, 0);
  objc_storeStrong((id *)&self->_buttonGroupAutoFill, 0);
  objc_storeStrong((id *)&self->_autofillSpacer, 0);
  objc_storeStrong((id *)&self->_nextPreviousSpacer, 0);
  objc_storeStrong((id *)&self->_nextItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_rightToolbar, 0);
  objc_storeStrong((id *)&self->_leftToolbar, 0);
}

@end