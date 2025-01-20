@interface _TVTextFieldViewController
- (IKTextFieldElement)viewElement;
- (UITextField)textField;
- (void)_updateKeyboardWithUserText;
- (void)_updateUserText;
- (void)_updateViewLayout;
- (void)dealloc;
- (void)loadView;
- (void)searchBarDidChangeText:(id)a3;
- (void)textDidChangeForKeyboard:(id)a3;
- (void)updateWithViewElement:(id)a3;
@end

@implementation _TVTextFieldViewController

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardWithUserText object:0];
  v3.receiver = self;
  v3.super_class = (Class)_TVTextFieldViewController;
  [(_TVTextFieldViewController *)&v3 dealloc];
}

- (void)updateWithViewElement:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  v5 = [(IKTextFieldElement *)self->_viewElement keyboard];
  [v5 setDelegate:self];

  if ([(_TVTextFieldViewController *)self isViewLoaded])
  {
    [(_TVTextFieldViewController *)self _updateViewLayout];
    [(_TVTextFieldViewController *)self _updateUserText];
  }
}

- (UITextField)textField
{
  if ([(_TVTextFieldViewController *)self isViewLoaded])
  {
    objc_super v3 = [(_TVTextFieldViewController *)self view];
    v4 = [v3 textField];
  }
  else
  {
    v4 = 0;
  }
  return (UITextField *)v4;
}

- (void)textDidChangeForKeyboard:(id)a3
{
  if ([(_TVTextFieldViewController *)self isViewLoaded])
  {
    [(_TVTextFieldViewController *)self _updateUserText];
  }
}

- (void)loadView
{
  objc_super v3 = [_TVSearchBar alloc];
  v4 = -[_TVSearchBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(_TVSearchBar *)v4 setDelegate:self];
  [(_TVTextFieldViewController *)self setView:v4];
  [(_TVTextFieldViewController *)self _updateViewLayout];
  [(_TVTextFieldViewController *)self _updateUserText];
}

- (void)searchBarDidChangeText:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardWithUserText object:0];
  [(_TVTextFieldViewController *)self performSelector:sel__updateKeyboardWithUserText withObject:0 afterDelay:0.2];
}

- (void)_updateViewLayout
{
  id v18 = [(_TVTextFieldViewController *)self viewElement];
  objc_super v3 = [(_TVTextFieldViewController *)self view];
  v4 = [v3 textField];
  v5 = objc_msgSend(v18, "tv_attributedString");
  id v6 = objc_msgSend(v18, "tv_textAttributes");
  v7 = (void *)[v6 mutableCopy];

  v8 = [v18 style];
  v9 = objc_msgSend(v8, "tv_highlightColor");
  v10 = [v9 color];

  if (v10) {
    [v7 setObject:v10 forKey:*MEMORY[0x263F1C240]];
  }
  [v4 setAttributedPlaceholder:v5];
  [v4 setDefaultTextAttributes:v7];
  v11 = [v18 attributes];
  v12 = [v11 objectForKey:@"activityIndicator"];
  int v13 = [v12 BOOLValue];

  v14 = [v3 activityIndicatorView];
  v15 = v14;
  if (v13) {
    [v14 startAnimating];
  }
  else {
    [v14 stopAnimating];
  }

  v16 = [(_TVTextFieldViewController *)self view];
  v17 = [(_TVTextFieldViewController *)self viewElement];
  [v16 transferLayoutStylesFromElement:v17];
}

- (void)_updateUserText
{
  id v6 = [(_TVTextFieldViewController *)self viewElement];
  objc_super v3 = [(_TVTextFieldViewController *)self textField];
  v4 = [v6 keyboard];
  v5 = [v4 text];
  [v3 setText:v5];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardWithUserText object:0];
}

- (void)_updateKeyboardWithUserText
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateKeyboardWithUserText object:0];
  id v6 = [(_TVTextFieldViewController *)self textField];
  objc_super v3 = [(_TVTextFieldViewController *)self viewElement];
  v4 = [v3 keyboard];
  v5 = [v6 text];
  [v4 setText:v5];
}

- (IKTextFieldElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
}

@end