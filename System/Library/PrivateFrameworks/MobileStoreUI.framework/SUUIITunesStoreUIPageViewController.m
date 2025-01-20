@interface SUUIITunesStoreUIPageViewController
- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4;
- (BOOL)showsCancelButton;
- (NSString)cancelButtonTitle;
- (SUProductPageViewController)productPageViewController;
- (id)_cancelButtonItem;
- (void)_addCancelButtonToNavigationItem:(id)a3;
- (void)_storeSheetCancelButtonAction:(id)a3;
- (void)dealloc;
- (void)handleFailureWithError:(id)a3;
- (void)resetNavigationItem:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setProductPageViewController:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SUUIITunesStoreUIPageViewController

- (void)dealloc
{
  v3 = [(SUBarButtonItem *)self->_cancelButtonItem target];

  if (v3 == self) {
    [(SUBarButtonItem *)self->_cancelButtonItem setTarget:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIITunesStoreUIPageViewController;
  [(SUStorePageViewController *)&v4 dealloc];
}

- (void)handleFailureWithError:(id)a3
{
  id v4 = a3;
  if ([(SUViewController *)self isVisible])
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIITunesStoreUIPageViewController;
    [(SUStorePageViewController *)&v5 handleFailureWithError:v4];
  }
}

- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SUUIITunesStoreUIPageViewController *)self productPageViewController];
  uint64_t v8 = [v7 productPageStyle];

  if (v8 == 1)
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIITunesStoreUIPageViewController;
    BOOL v9 = [(SUViewController *)&v11 presentDialogForError:v6 pendUntilVisible:v4];
  }

  return v9;
}

- (void)resetNavigationItem:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIITunesStoreUIPageViewController;
  [(SUStorePageViewController *)&v5 resetNavigationItem:v4];
  if ([(SUUIITunesStoreUIPageViewController *)self showsCancelButton]) {
    [(SUUIITunesStoreUIPageViewController *)self _addCancelButtonToNavigationItem:v4];
  }
}

- (void)viewWillLayoutSubviews
{
  if ([(SUUIITunesStoreUIPageViewController *)self showsCancelButton])
  {
    v3 = [(SUStorePageViewController *)self navigationItemForScriptInterface];
    [(SUUIITunesStoreUIPageViewController *)self _addCancelButtonToNavigationItem:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIITunesStoreUIPageViewController;
  [(SUUIITunesStoreUIPageViewController *)&v4 viewWillLayoutSubviews];
}

- (void)_addCancelButtonToNavigationItem:(id)a3
{
  id v4 = a3;
  id v7 = [(SUUIITunesStoreUIPageViewController *)self _cancelButtonItem];
  objc_super v5 = [(SUViewController *)self clientInterface];
  id v6 = [v5 appearance];
  [v6 styleBarButtonItem:v7];

  [v4 setLeftBarButtonItem:v7 animated:0];
}

- (id)_cancelButtonItem
{
  if (!self->_cancelButtonItem)
  {
    v3 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x263F895D0]);
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v3;

    [(SUBarButtonItem *)self->_cancelButtonItem setAction:sel__storeSheetCancelButtonAction_];
    [(SUBarButtonItem *)self->_cancelButtonItem setStyle:2];
    [(SUBarButtonItem *)self->_cancelButtonItem setTarget:self];
    objc_super v5 = self->_cancelButtonItem;
    if (self->_cancelButtonTitle)
    {
      -[SUBarButtonItem setTitle:](self->_cancelButtonItem, "setTitle:");
    }
    else
    {
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"CLOSE_SHEET_BUTTON" value:&stru_2704F8130 table:0];
      [(SUBarButtonItem *)v5 setTitle:v7];
    }
  }
  uint64_t v8 = self->_cancelButtonItem;
  return v8;
}

- (void)_storeSheetCancelButtonAction:(id)a3
{
  id v3 = [(SUUIITunesStoreUIPageViewController *)self productPageViewController];
  [v3 _sendDidFinishWithResult:0];
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (SUProductPageViewController)productPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productPageViewController);
  return (SUProductPageViewController *)WeakRetained;
}

- (void)setProductPageViewController:(id)a3
{
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  self->_showsCancelButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_productPageViewController);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
}

@end