@interface VUILibraryDownloadPopoverViewController
- (VUILibraryDownloadPopoverViewControllerDelegate)delegate;
- (VUILibraryListItemView)listView;
- (void)loadView;
- (void)popoverPressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListView:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VUILibraryDownloadPopoverViewController

- (void)loadView
{
  v23.receiver = self;
  v23.super_class = (Class)VUILibraryDownloadPopoverViewController;
  [(VUILibraryDownloadPopoverViewController *)&v23 loadView];
  v3 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v3 setTextStyle:3];
  [(VUITextLayout *)v3 setFontWeight:0];
  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [(VUITextLayout *)v3 setColor:v4];

  [(VUITextLayout *)v3 setNumberOfLines:1];
  v5 = +[VUILocalizationManager sharedInstance];
  v6 = [v5 localizedStringForKey:@"REMOVE_DOWNLOAD"];
  v7 = +[VUILabel labelWithString:v6 textLayout:v3 existingLabel:0];

  v8 = +[VUIImageResourceMap imageForResourceName:@"ActionMenu-ClearHistory"];
  v9 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  v10 = [v8 _flatImageWithColor:v9];

  v11 = objc_alloc_init(VUILibraryListItemView);
  listView = self->_listView;
  self->_listView = v11;

  [(VUILibraryListItemView *)self->_listView setTitleLabel:v7];
  [(VUILibraryListItemView *)self->_listView setItemImage:v10];
  v13 = [(VUILibraryDownloadPopoverViewController *)self view];
  [v13 bounds];
  double Width = CGRectGetWidth(v24);

  v15 = [(VUILibraryDownloadPopoverViewController *)self view];
  [v15 bounds];
  double Height = CGRectGetHeight(v25);

  -[VUILibraryListItemView sizeThatFits:](self->_listView, "sizeThatFits:", Width, 1.79769313e308);
  -[VUILibraryDownloadPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", fmin(Height, v17), fmin(Height, v18));
  [(VUILibraryDownloadPopoverViewController *)self setView:self->_listView];
  v19 = [(VUILibraryDownloadPopoverViewController *)self view];
  v20 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [v19 setBackgroundColor:v20];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_popoverPressed_];
  [v21 setDelegate:self];
  v22 = [(VUILibraryDownloadPopoverViewController *)self view];
  [v22 addGestureRecognizer:v21];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUILibraryDownloadPopoverViewController;
  [(VUILibraryDownloadPopoverViewController *)&v5 viewWillDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeDownloadDismissed];
}

- (void)popoverPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeDownloadPressed];
}

- (VUILibraryDownloadPopoverViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryDownloadPopoverViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUILibraryListItemView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end