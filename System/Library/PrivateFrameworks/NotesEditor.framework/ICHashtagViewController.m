@interface ICHashtagViewController
- (ICHashtagViewControllerDelegate)delegate;
- (UITextField)textField;
- (id)nibBundle;
- (void)createFutureHashtag:(id)a3;
- (void)createHashtag:(id)a3;
- (void)createUnknownInlineAttachment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTextField:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICHashtagViewController

- (id)nibBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICHashtagViewController;
  [(ICHashtagViewController *)&v5 viewDidAppear:a3];
  v4 = [(ICHashtagViewController *)self textField];
  [v4 becomeFirstResponder];
}

- (void)createHashtag:(id)a3
{
  v4 = [(ICHashtagViewController *)self textField];
  id v9 = [v4 text];

  objc_super v5 = [(ICHashtagViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(ICHashtagViewController *)self delegate];
    [v7 hashtagViewController:self insertHashtagWithText:v9 viaAutoComplete:0];
  }
  v8 = [(ICHashtagViewController *)self presentingViewController];
  [v8 dismissViewControllerAnimated:1 completion:0];
}

- (void)createUnknownInlineAttachment:(id)a3
{
  v4 = [(ICHashtagViewController *)self textField];
  id v9 = [v4 text];

  objc_super v5 = [(ICHashtagViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(ICHashtagViewController *)self delegate];
    [v7 hashtagViewController:self insertUnknownInlineAttachmentWithText:v9];
  }
  v8 = [(ICHashtagViewController *)self presentingViewController];
  [v8 dismissViewControllerAnimated:1 completion:0];
}

- (void)createFutureHashtag:(id)a3
{
  v4 = [(ICHashtagViewController *)self textField];
  id v9 = [v4 text];

  objc_super v5 = [(ICHashtagViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(ICHashtagViewController *)self delegate];
    [v7 hashtagViewController:self insertFutureHashtagWithText:v9];
  }
  v8 = [(ICHashtagViewController *)self presentingViewController];
  [v8 dismissViewControllerAnimated:1 completion:0];
}

- (ICHashtagViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICHashtagViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  self->_textField = (UITextField *)a3;
}

- (void).cxx_destruct
{
}

@end