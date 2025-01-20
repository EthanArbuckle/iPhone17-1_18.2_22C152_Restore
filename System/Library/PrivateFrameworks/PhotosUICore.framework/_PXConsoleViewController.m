@interface _PXConsoleViewController
- (BOOL)toolBarWasHidden;
- (UIBarButtonItem)_shareBarButtonItem;
- (UITextView)_textView;
- (_PXConsoleViewController)init;
- (void)_presentSharingViewController:(id)a3;
- (void)appendOutput:(id)a3;
- (void)loadView;
- (void)setToolBarWasHidden:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _PXConsoleViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->__textView, 0);
}

- (UIBarButtonItem)_shareBarButtonItem
{
  return self->__shareBarButtonItem;
}

- (void)setToolBarWasHidden:(BOOL)a3
{
  self->_toolBarWasHidden = a3;
}

- (BOOL)toolBarWasHidden
{
  return self->_toolBarWasHidden;
}

- (void)_presentSharingViewController:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = [(_PXConsoleViewController *)self _textView];
  uint64_t v5 = [v4 text];
  v6 = (void *)v5;
  v7 = &stru_1F00B0030;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  id v9 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v14[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  v11 = (void *)[v9 initWithActivityItems:v10 applicationActivities:0];
  [(_PXConsoleViewController *)self presentViewController:v11 animated:1 completion:0];
  v12 = [v11 popoverPresentationController];
  v13 = [(_PXConsoleViewController *)self _shareBarButtonItem];
  [v12 setBarButtonItem:v13];
}

- (UITextView)_textView
{
  textView = self->__textView;
  if (!textView)
  {
    id v4 = (id)[(_PXConsoleViewController *)self view];
    textView = self->__textView;
  }
  return textView;
}

- (void)appendOutput:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [v3 description];
      v7 = (void *)v6;
      v8 = &stru_1F00B0030;
      if (v6) {
        v8 = (__CFString *)v6;
      }
      id v9 = v8;

      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
LABEL_9:
      id v10 = v5;
      px_dispatch_on_main_queue();
    }
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
  }
  uint64_t v5 = v4;
  goto LABEL_9;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_PXConsoleViewController;
  -[_PXConsoleViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  uint64_t v5 = [(_PXConsoleViewController *)self navigationController];
  objc_msgSend(v5, "setToolbarHidden:animated:", -[_PXConsoleViewController toolBarWasHidden](self, "toolBarWasHidden"), v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PXConsoleViewController;
  -[_PXConsoleViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  uint64_t v5 = [(_PXConsoleViewController *)self navigationController];
  -[_PXConsoleViewController setToolBarWasHidden:](self, "setToolBarWasHidden:", [v5 isToolbarHidden]);

  objc_super v6 = [(_PXConsoleViewController *)self navigationController];
  [v6 setToolbarHidden:0 animated:v3];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)_PXConsoleViewController;
  [(_PXConsoleViewController *)&v7 loadView];
  BOOL v3 = [(_PXConsoleViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  [v3 bounds];
  uint64_t v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:");
  textView = self->__textView;
  self->__textView = v5;

  [(UITextView *)self->__textView setAutoresizingMask:18];
  [v3 addSubview:self->__textView];
}

- (_PXConsoleViewController)init
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_PXConsoleViewController;
  v2 = [(_PXConsoleViewController *)&v8 init];
  if (v2)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:v2 action:sel__presentSharingViewController_];
    shareBarButtonItem = v2->__shareBarButtonItem;
    v2->__shareBarButtonItem = (UIBarButtonItem *)v4;

    v9[0] = v3;
    v9[1] = v2->__shareBarButtonItem;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    [(_PXConsoleViewController *)v2 setToolbarItems:v6];
  }
  return v2;
}

@end