@interface SKUIITunesStoreUIPageViewController
- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4;
- (BOOL)showsCancelButton;
- (NSString)cancelButtonTitle;
- (SKProductPageViewController)productPageViewController;
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

@implementation SKUIITunesStoreUIPageViewController

- (void)dealloc
{
  v3 = [(SUBarButtonItem *)self->_cancelButtonItem target];

  if (v3 == self) {
    [(SUBarButtonItem *)self->_cancelButtonItem setTarget:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIITunesStoreUIPageViewController;
  [(SUStorePageViewController *)&v4 dealloc];
}

- (void)handleFailureWithError:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIITunesStoreUIPageViewController handleFailureWithError:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ([(SUViewController *)self isVisible])
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIITunesStoreUIPageViewController;
    [(SUStorePageViewController *)&v13 handleFailureWithError:v4];
  }
}

- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIITunesStoreUIPageViewController presentDialogForError:pendUntilVisible:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [(SKUIITunesStoreUIPageViewController *)self productPageViewController];
  uint64_t v16 = [v15 productPageStyle];

  if (v16 == 1)
  {
    BOOL v17 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SKUIITunesStoreUIPageViewController;
    BOOL v17 = [(SUViewController *)&v19 presentDialogForError:v6 pendUntilVisible:v4];
  }

  return v17;
}

- (void)resetNavigationItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIITunesStoreUIPageViewController resetNavigationItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIITunesStoreUIPageViewController;
  [(SUStorePageViewController *)&v13 resetNavigationItem:v4];
  if ([(SKUIITunesStoreUIPageViewController *)self showsCancelButton]) {
    [(SKUIITunesStoreUIPageViewController *)self _addCancelButtonToNavigationItem:v4];
  }
}

- (void)viewWillLayoutSubviews
{
}

- (void)_addCancelButtonToNavigationItem:(id)a3
{
  id v4 = a3;
  id v7 = [(SKUIITunesStoreUIPageViewController *)self _cancelButtonItem];
  BOOL v5 = [(SUViewController *)self clientInterface];
  uint64_t v6 = [v5 appearance];
  [v6 styleBarButtonItem:v7];

  [v4 setLeftBarButtonItem:v7 animated:0];
}

- (id)_cancelButtonItem
{
  if (!self->_cancelButtonItem)
  {
    v3 = (SUBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB8898]);
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v3;

    [(SUBarButtonItem *)self->_cancelButtonItem setAction:sel__storeSheetCancelButtonAction_];
    [(SUBarButtonItem *)self->_cancelButtonItem setStyle:2];
    [(SUBarButtonItem *)self->_cancelButtonItem setTarget:self];
    BOOL v5 = self->_cancelButtonItem;
    if (self->_cancelButtonTitle)
    {
      -[SUBarButtonItem setTitle:](self->_cancelButtonItem, "setTitle:");
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"CLOSE_SHEET_BUTTON" value:&stru_1F1C879E8 table:0];
      [(SUBarButtonItem *)v5 setTitle:v7];
    }
  }
  uint64_t v8 = self->_cancelButtonItem;

  return v8;
}

- (void)_storeSheetCancelButtonAction:(id)a3
{
  id v3 = [(SKUIITunesStoreUIPageViewController *)self productPageViewController];
  [v3 _sendDidFinishWithResult:0];
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (SKProductPageViewController)productPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productPageViewController);

  return (SKProductPageViewController *)WeakRetained;
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

- (void)handleFailureWithError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)presentDialogForError:(uint64_t)a3 pendUntilVisible:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetNavigationItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end