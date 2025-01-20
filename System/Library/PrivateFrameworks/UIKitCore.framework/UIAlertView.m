@interface UIAlertView
+ (id)_alertViewForSessionWithRemoteViewController:(id)a3;
+ (id)_alertViewForWindow:(id)a3;
+ (id)_remoteAlertViewWithBlock:(id)a3;
- (BOOL)_isAnimating;
- (BOOL)_prepareToDismissForTappedIndex:(int64_t)a3;
- (BOOL)groupsTextFields;
- (BOOL)isVisible;
- (CGSize)backgroundSize;
- (NSInteger)addButtonWithTitle:(NSString *)title;
- (NSInteger)cancelButtonIndex;
- (NSInteger)firstOtherButtonIndex;
- (NSInteger)numberOfButtons;
- (NSString)buttonTitleAtIndex:(NSInteger)buttonIndex;
- (NSString)message;
- (NSString)subtitle;
- (NSString)title;
- (UIAlertView)initWithCoder:(NSCoder *)coder;
- (UIAlertView)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;
- (UIAlertView)initWithTitle:(id)a3 buttons:(id)a4 defaultButtonIndex:(int)a5 delegate:(id)a6 context:(id)a7;
- (UIAlertView)initWithTitle:(id)a3 message:(id)a4 delegate:(id)a5 cancelButtonTitle:(id)a6;
- (UIAlertView)initWithTitle:(id)a3 message:(id)a4 delegate:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButtons:(id)a8;
- (UIAlertViewStyle)alertViewStyle;
- (UITextField)textFieldAtIndex:(NSInteger)textFieldIndex;
- (UIViewController)_externalViewControllerForPresentation;
- (id)_addButtonWithTitle:(id)a3;
- (id)_addTextFieldWithValue:(id)a3 label:(id)a4;
- (id)_alertController;
- (id)_preparedAlertActionAtIndex:(unint64_t)a3;
- (id)addButtonWithTitle:(id)a3 buttonClass:(Class)a4;
- (id)addButtonWithTitle:(id)a3 label:(id)a4;
- (id)context;
- (id)delegate;
- (id)initWithFrame:(CGRect)frame;
- (id)keyboard;
- (id)tableView;
- (id)textField;
- (id)titleLabel;
- (id)window;
- (int)buttonCount;
- (int)textFieldCount;
- (int64_t)_maximumNumberOfTextFieldsForCurrentStyle;
- (int64_t)defaultButtonIndex;
- (int64_t)numberOfRows;
- (void)_dismissForTappedIndex:(int64_t)a3;
- (void)_performPresentationDismissalWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_prepareAlertActions;
- (void)_setAccessoryView:(id)a3;
- (void)_setExternalViewControllerForPresentation:(id)a3;
- (void)_setFirstOtherButtonIndex:(int64_t)a3;
- (void)_setIsPresented:(BOOL)a3;
- (void)_showAnimated:(BOOL)a3;
- (void)_updateButtonTitle:(id)a3 buttonIndex:(unint64_t)a4;
- (void)_updateFirstOtherButtonEnabledState;
- (void)_updateMessageAndSubtitle;
- (void)dealloc;
- (void)dismiss;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
- (void)setAlertViewStyle:(UIAlertViewStyle)alertViewStyle;
- (void)setCancelButtonIndex:(NSInteger)cancelButtonIndex;
- (void)setContext:(id)a3;
- (void)setDefaultButtonIndex:(int64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setMessage:(NSString *)message;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)show;
@end

@implementation UIAlertView

- (id)initWithFrame:(CGRect)frame
{
  v11.receiver = self;
  v11.super_class = (Class)UIAlertView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIAlertController);
    alertController = v3->_alertController;
    v3->_alertController = v4;

    [(UIAlertController *)v3->_alertController setPreferredStyle:1];
    [(UIAlertController *)v3->_alertController _setShouldAllowNilParameters:1];
    if (dyld_program_sdk_at_least()
      && (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) != 0
       || [(id)UIApp _appAdoptsUISceneLifecycle]))
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28790], @"UIAlertView is deprecated and unavailable for UIScene based applications, please use UIAlertController!" format];
    }
    v6 = objc_alloc_init(_UIAlertControllerShimPresenter);
    presenter = v3->_presenter;
    v3->_presenter = v6;

    [(_UIAlertControllerShimPresenter *)v3->_presenter setAlertController:v3->_alertController];
    [(_UIAlertControllerShimPresenter *)v3->_presenter setLegacyAlert:v3];
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v3->_actions;
    v3->_actions = v8;

    v3->_cancelIndex = -1;
    v3->_defaultButtonIndex = -1;
    v3->_firstOtherButtonIndex = -1;
  }
  return v3;
}

- (UIAlertView)initWithTitle:(id)a3 buttons:(id)a4 defaultButtonIndex:(int)a5 delegate:(id)a6 context:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = -[UIAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = v16;
  if (v16)
  {
    [(UIAlertView *)v16 setTitle:v12];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          -[UIAlertView addButtonWithTitle:](v17, "addButtonWithTitle:", *(void *)(*((void *)&v24 + 1) + 8 * v22++), (void)v24);
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v20);
    }

    [(UIAlertView *)v17 setDefaultButtonIndex:a5];
    [(UIAlertView *)v17 setDelegate:v14];
    [(UIAlertView *)v17 setContext:v15];
  }

  return v17;
}

- (UIAlertView)initWithTitle:(id)a3 message:(id)a4 delegate:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButtons:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = -[UIAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v21 = v20;
  if (v20)
  {
    [(UIAlertView *)v20 setTitle:v14];
    [(UIAlertView *)v21 setMessage:v15];
    [(UIAlertView *)v21 setDelegate:v16];
    if (v17) {
      [(UIAlertView *)v21 setCancelButtonIndex:[(UIAlertView *)v21 addButtonWithTitle:v17]];
    }
    if (v18) {
      [(UIAlertView *)v21 setCancelButtonIndex:[(UIAlertView *)v21 addButtonWithTitle:v18]];
    }
    if (v19)
    {
      long long v25 = (id *)&v26;
      do
      {
        [(UIAlertView *)v21 addButtonWithTitle:v19];
        uint64_t v22 = v25++;
        id v23 = *v22;

        id v19 = v23;
      }
      while (v23);
    }
  }

  return v21;
}

- (UIAlertView)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
  va_start(va, otherButtonTitles);
  id v12 = title;
  id v13 = message;
  id v14 = delegate;
  id v15 = cancelButtonTitle;
  id v16 = otherButtonTitles;
  id v17 = -[UIAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v18 = v17;
  if (v17)
  {
    [(UIAlertView *)v17 setTitle:v12];
    [(UIAlertView *)v18 setMessage:v13];
    [(UIAlertView *)v18 setDelegate:v14];
    if (v15) {
      [(UIAlertView *)v18 setCancelButtonIndex:[(UIAlertView *)v18 addButtonWithTitle:v15]];
    }
    if (v16)
    {
      va_copy(v23, va);
      do
      {
        uint64_t v19 = [(UIAlertView *)v18 addButtonWithTitle:v16];
        if ([(UIAlertView *)v18 firstOtherButtonIndex] == -1) {
          [(UIAlertView *)v18 _setFirstOtherButtonIndex:v19];
        }
        uint64_t v20 = va_arg(v23, void *);
        uint64_t v21 = v20;

        id v16 = v21;
      }
      while (v21);
    }
  }

  return v18;
}

- (UIAlertView)initWithCoder:(NSCoder *)coder
{
  v4.receiver = self;
  v4.super_class = (Class)UIAlertView;
  return [(UIView *)&v4 initWithCoder:coder];
}

- (void)dealloc
{
  [(_UIAlertControllerShimPresenter *)self->_presenter setAlertController:0];
  [(_UIAlertControllerShimPresenter *)self->_presenter setLegacyAlert:0];
  presenter = self->_presenter;
  self->_presenter = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIAlertView;
  [(UIView *)&v4 dealloc];
}

- (void)_updateButtonTitle:(id)a3 buttonIndex:(unint64_t)a4
{
  id v7 = a3;
  if ([(NSMutableArray *)self->_actions count] > a4) {
    [(NSMutableArray *)self->_actions replaceObjectAtIndex:a4 withObject:v7];
  }
  v6 = [(UIAlertView *)self _preparedAlertActionAtIndex:a4];
  [v6 setTitle:v7];
}

- (id)_preparedAlertActionAtIndex:(unint64_t)a3
{
  objc_super v4 = [(UIAlertController *)self->_alertController _actions];
  if ([v4 count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)_prepareAlertActions
{
  if (!self->_hasPreparedAlertActions)
  {
    uint64_t v7 = 488;
    objc_initWeak(&location, self);
    for (i = 0; (unint64_t)i < [(NSMutableArray *)self->_actions count]; ++i)
    {
      objc_super v4 = [(NSMutableArray *)self->_actions objectAtIndex:i];
      BOOL v5 = i == (char *)self->_cancelIndex;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35__UIAlertView__prepareAlertActions__block_invoke;
      v10[3] = &unk_1E52DA098;
      objc_copyWeak(v11, &location);
      v11[1] = i;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __35__UIAlertView__prepareAlertActions__block_invoke_2;
      v8[3] = &unk_1E52DA0C0;
      objc_copyWeak(v9, &location);
      v9[1] = i;
      v6 = +[UIAlertAction _actionWithTitle:v4 image:0 style:v5 handler:v10 shouldDismissHandler:v8];
      [(UIAlertController *)self->_alertController addAction:v6];
      if (i == (char *)self->_defaultButtonIndex) {
        [(UIAlertController *)self->_alertController setPreferredAction:v6];
      }

      objc_destroyWeak(v9);
      objc_destroyWeak(v11);
    }
    *((unsigned char *)&self->super.super.super.isa + v7) = 1;
    objc_destroyWeak(&location);
  }
}

void __35__UIAlertView__prepareAlertActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _dismissForTappedIndex:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

uint64_t __35__UIAlertView__prepareAlertActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained) {
    uint64_t v4 = [WeakRetained _prepareToDismissForTappedIndex:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)isVisible
{
  if (self->_isPresented)
  {
    v2 = [(UIAlertView *)self window];
    int v3 = [v2 isHidden] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)title
{
  return [(UIViewController *)self->_alertController title];
}

- (void)setMessage:(NSString *)message
{
  uint64_t v4 = (NSString *)[(NSString *)message copy];
  BOOL v5 = self->_message;
  self->_message = v4;

  [(UIAlertView *)self _updateMessageAndSubtitle];
}

- (NSString)message
{
  return self->_message;
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  [(UIAlertView *)self _updateMessageAndSubtitle];
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)_updateMessageAndSubtitle
{
  message = self->_message;
  subtitle = self->_subtitle;
  if (message)
  {
    if (subtitle)
    {
      alertController = self->_alertController;
      id v6 = [NSString stringWithFormat:@"%@\n%@", subtitle, message];
      [(UIAlertController *)alertController setMessage:v6];

      return;
    }
    subtitle = self->_message;
  }
  BOOL v5 = self->_alertController;
  [(UIAlertController *)v5 setMessage:subtitle];
}

- (void)setAlertViewStyle:(UIAlertViewStyle)alertViewStyle
{
  self->_alertViewStyle = alertViewStyle;
  BOOL v5 = [(UIAlertView *)self _alertController];
  [v5 _removeAllTextFields];

  if (alertViewStyle != UIAlertViewStyleSecureTextInput)
  {
    if (alertViewStyle != UIAlertViewStyleLoginAndPasswordInput)
    {
      if (alertViewStyle == UIAlertViewStylePlainTextInput) {
        id v6 = [(UIAlertView *)self addTextFieldWithValue:0 label:0];
      }
      return;
    }
    uint64_t v7 = _UINSLocalizedStringWithDefaultValue(@"Login", @"Login");
    id v8 = [(UIAlertView *)self addTextFieldWithValue:0 label:v7];
  }
  v9 = _UINSLocalizedStringWithDefaultValue(@"Password", @"Password");
  id v10 = [(UIAlertView *)self addTextFieldWithValue:0 label:v9];

  [v10 setSecureTextEntry:1];
}

- (UIAlertViewStyle)alertViewStyle
{
  return self->_alertViewStyle;
}

- (id)window
{
  return [(_UIAlertControllerShimPresenter *)self->_presenter window];
}

- (BOOL)_prepareToDismissForTappedIndex:(int64_t)a3
{
  self->_handlingAlertActionShouldDismiss = 1;
  id v5 = [(UIAlertView *)self delegate];
  id v6 = self;
  v6->_alertControllerShouldDismiss = 0;
  if (objc_opt_respondsToSelector()) {
    [v5 alertView:v6 clickedButtonAtIndex:a3];
  }
  [(UIAlertView *)v6 dismissWithClickedButtonIndex:a3 animated:1];
  self->_handlingAlertActionShouldDismiss = 0;
  return v6->_alertControllerShouldDismiss;
}

- (void)_dismissForTappedIndex:(int64_t)a3
{
}

- (void)_setIsPresented:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIAlertView *)self delegate];
  if (self->_isPresented != v3)
  {
    self->_isPresented = v3;
    p_retainedSelf = &self->_retainedSelf;
    v9 = v5;
    if (v3)
    {
      objc_storeStrong(p_retainedSelf, self);
      [(UIAlertView *)self _prepareAlertActions];
      char v7 = objc_opt_respondsToSelector();
      id v5 = v9;
      if ((v7 & 1) == 0) {
        goto LABEL_7;
      }
      [v9 willPresentAlertView:self];
    }
    else
    {
      id v8 = *p_retainedSelf;
      id *p_retainedSelf = 0;
    }
    id v5 = v9;
  }
LABEL_7:
}

- (id)addButtonWithTitle:(id)a3 label:(id)a4
{
  return 0;
}

- (id)addButtonWithTitle:(id)a3 buttonClass:(Class)a4
{
  return 0;
}

- (NSInteger)addButtonWithTitle:(NSString *)title
{
  id v5 = title;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIAlertView.m" lineNumber:384 description:@"UIAlertView: Buttons added must have a title."];
  }
  NSInteger v6 = [(NSMutableArray *)self->_actions count];
  [(NSMutableArray *)self->_actions addObject:v5];

  return v6;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  if (a3 < 0) {
    int64_t v3 = -1;
  }
  else {
    int64_t v3 = a3;
  }
  self->_defaultButtonIndex = v3;
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setCancelButtonIndex:(NSInteger)cancelButtonIndex
{
  self->_cancelIndex = cancelButtonIndex;
}

- (NSInteger)cancelButtonIndex
{
  return self->_cancelIndex;
}

- (void)_setFirstOtherButtonIndex:(int64_t)a3
{
  self->_firstOtherButtonIndex = a3;
}

- (NSInteger)firstOtherButtonIndex
{
  return self->_firstOtherButtonIndex;
}

- (void)_updateFirstOtherButtonEnabledState
{
  id v5 = [(UIAlertView *)self delegate];
  int64_t v3 = [(UIAlertView *)self _preparedAlertActionAtIndex:self->_firstOtherButtonIndex];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [v5 alertViewShouldEnableFirstOtherButton:self];
    }
    else {
      uint64_t v4 = 1;
    }
    [v3 setEnabled:v4];
  }
}

- (NSString)buttonTitleAtIndex:(NSInteger)buttonIndex
{
  return (NSString *)[(NSMutableArray *)self->_actions objectAtIndex:buttonIndex];
}

- (NSInteger)numberOfButtons
{
  return [(NSMutableArray *)self->_actions count];
}

- (int)buttonCount
{
  return [(UIAlertView *)self numberOfButtons];
}

- (int64_t)_maximumNumberOfTextFieldsForCurrentStyle
{
  [(UIAlertView *)self alertViewStyle];
  UIAlertViewStyle v3 = [(UIAlertView *)self alertViewStyle];
  if ((unint64_t)(v3 - 1) > 2) {
    return 2;
  }
  else {
    return qword_186B926F8[v3 - 1];
  }
}

- (id)_addTextFieldWithValue:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UIAlertView *)self textFieldCount];
  if ([(UIAlertView *)self _maximumNumberOfTextFieldsForCurrentStyle] == v8)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__1;
    uint64_t v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    id v10 = [(UIAlertView *)self _alertController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__UIAlertView__addTextFieldWithValue_label___block_invoke;
    v12[3] = &unk_1E52DA188;
    id v16 = &v17;
    id v13 = v6;
    id v14 = v7;
    id v15 = self;
    [v10 addTextFieldWithConfigurationHandler:v12];

    id v9 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  return v9;
}

void __44__UIAlertView__addTextFieldWithValue_label___block_invoke(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1[7] + 8) + 40) setText:a1[4]];
  [*(id *)(*(void *)(a1[7] + 8) + 40) setPlaceholder:a1[5]];
  [*(id *)(*(void *)(a1[7] + 8) + 40) addTarget:a1[6] action:sel__textDidChangeInTextField_ forControlEvents:0x20000];
}

- (int)textFieldCount
{
  v2 = [(UIAlertView *)self _alertController];
  UIAlertViewStyle v3 = [v2 textFields];
  int v4 = [v3 count];

  return v4;
}

- (id)textField
{
  v2 = [(UIAlertView *)self _alertController];
  UIAlertViewStyle v3 = [v2 textFields];
  int v4 = [v3 firstObject];

  return v4;
}

- (UITextField)textFieldAtIndex:(NSInteger)textFieldIndex
{
  int v4 = [(UIAlertView *)self _alertController];
  id v5 = [v4 textFields];

  if (textFieldIndex < 0 || [v5 count] <= (unint64_t)textFieldIndex)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:textFieldIndex];
  }

  return (UITextField *)v6;
}

- (void)_showAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIAlertView *)self delegate];
  [(UIAlertView *)self _setIsPresented:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __29__UIAlertView__showAnimated___block_invoke;
  v11[3] = &unk_1E52D9F70;
  v11[4] = self;
  +[UIView performWithoutAnimation:v11];
  presenter = self->_presenter;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__UIAlertView__showAnimated___block_invoke_2;
  v8[3] = &unk_1E52D9F98;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [(_UIAlertControllerShimPresenter *)presenter _presentAlertControllerAnimated:v3 completion:v8];
}

uint64_t __29__UIAlertView__showAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFirstOtherButtonEnabledState];
}

void __29__UIAlertView__showAnimated___block_invoke_2(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) didPresentAlertView:*(void *)(a1 + 40)];
  }
  v2 = [*(id *)(a1 + 40) window];
  char v3 = [v2 isHidden];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) textField];
    [v4 becomeFirstResponder];
  }
}

- (void)show
{
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  NSInteger v5 = [(UIAlertView *)self cancelButtonIndex];
  [(UIAlertView *)self dismissWithClickedButtonIndex:v5 animated:v3];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
  if (!self->_dismissingAlertController)
  {
    BOOL v4 = animated;
    uint64_t v7 = [(UIAlertView *)self delegate];
    self->_alertControllerShouldDismiss = 1;
    self->_dismissingAlertController = 1;
    id v8 = (id)v7;
    if (objc_opt_respondsToSelector()) {
      [v8 alertView:self willDismissWithButtonIndex:buttonIndex];
    }
    if (!self->_handlingAlertActionShouldDismiss) {
      [(UIAlertView *)self _performPresentationDismissalWithClickedButtonIndex:buttonIndex animated:v4];
    }
  }
}

- (void)_performPresentationDismissalWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_alertControllerShouldDismiss)
  {
    BOOL v4 = a4;
    uint64_t v7 = [(UIAlertView *)self delegate];
    presenter = self->_presenter;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __76__UIAlertView__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke;
    v11[3] = &unk_1E52DA070;
    id v12 = v7;
    id v13 = self;
    int64_t v14 = a3;
    id v9 = v7;
    id v10 = self;
    [(_UIAlertControllerShimPresenter *)presenter _dismissAlertControllerAnimated:v4 completion:v11];
    v10->_dismissingAlertController = 0;
  }
}

uint64_t __76__UIAlertView__performPresentationDismissalWithClickedButtonIndex_animated___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) alertView:*(void *)(a1 + 40) didDismissWithButtonIndex:*(void *)(a1 + 48)];
  }
  v2 = *(void **)(a1 + 40);
  return [v2 _setIsPresented:0];
}

- (BOOL)_isAnimating
{
  if ([(UIViewController *)self->_alertController isBeingPresented]) {
    return 1;
  }
  alertController = self->_alertController;
  return [(UIViewController *)alertController isBeingDismissed];
}

- (CGSize)backgroundSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)numberOfRows
{
  return 0;
}

- (void)_setAccessoryView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSInteger v5 = objc_alloc_init(UIViewController);
    [(UIViewController *)v5 setView:v4];

    uint64_t v7 = [[_UIAlertViewShimAccessoryViewController alloc] initWithAccessoryViewController:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v6 = [(UIAlertView *)self _alertController];
  [v6 setContentViewController:v7];
}

- (BOOL)groupsTextFields
{
  return 0;
}

- (void)dismiss
{
}

- (id)titleLabel
{
  return 0;
}

- (id)keyboard
{
  return 0;
}

- (id)tableView
{
  return 0;
}

- (id)_addButtonWithTitle:(id)a3
{
  return 0;
}

- (id)_alertController
{
  return self->_alertController;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UIViewController)_externalViewControllerForPresentation
{
  return self->_externalViewControllerForPresentation;
}

- (void)_setExternalViewControllerForPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalViewControllerForPresentation, 0);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (UIAlertView)initWithTitle:(id)a3 message:(id)a4 delegate:(id)a5 cancelButtonTitle:(id)a6
{
  return [(UIAlertView *)self initWithTitle:a3 message:a4 delegate:a5 cancelButtonTitle:a6 otherButtonTitles:0];
}

+ (id)_remoteAlertViewWithBlock:(id)a3
{
  double v3 = (void (**)(id, _UIUserNotificationAlertView *))a3;
  id v4 = [(UIAlertView *)[_UIUserNotificationAlertView alloc] initWithTitle:0 message:0 delegate:0 cancelButtonTitle:0 otherButtonTitles:0];
  v3[2](v3, v4);

  NSInteger v5 = +[_UIUserNotificationRestrictedAlertViewProxy restrictedProxyForAlertView:v4];

  return v5;
}

+ (id)_alertViewForSessionWithRemoteViewController:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"remoteViewControllerProxy is nil!"];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__UIAlertView_ViewServiceSupport___alertViewForSessionWithRemoteViewController___block_invoke;
  v8[3] = &unk_1E530DAE0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 _remoteAlertViewWithBlock:v8];

  return v6;
}

uint64_t __80__UIAlertView_ViewServiceSupport___alertViewForSessionWithRemoteViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRemoteViewController:*(void *)(a1 + 32)];
}

+ (id)_alertViewForWindow:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__UIAlertView_ViewServiceSupport___alertViewForWindow___block_invoke;
    v7[3] = &unk_1E530DAE0;
    id v8 = v4;
    id v5 = [a1 _remoteAlertViewWithBlock:v7];
  }
  else
  {
    id v5 = (void *)[objc_alloc((Class)a1) initWithTitle:0 message:0 delegate:0 cancelButtonTitle:0 otherButtonTitles:0];
  }

  return v5;
}

uint64_t __55__UIAlertView_ViewServiceSupport___alertViewForWindow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostedWindow:*(void *)(a1 + 32)];
}

@end