@interface SUUIComposeReviewFormViewController
- (SUUIComposeReviewFormDelegate)delegate;
- (SUUIComposeReviewFormViewController)initWithReviewMetadata:(id)a3;
- (SUUIReviewMetadata)editedReviewMetadata;
- (void)_cancel;
- (void)_submit;
- (void)composeReviewViewValidityChanged:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setRating:(float)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIComposeReviewFormViewController

- (SUUIComposeReviewFormViewController)initWithReviewMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIComposeReviewFormViewController;
  v5 = [(SUViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    review = v5->_review;
    v5->_review = (SUUIReviewMetadata *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(SUUIComposeReviewView *)self->_composeView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeReviewFormViewController;
  [(SUViewController *)&v3 dealloc];
}

- (SUUIReviewMetadata)editedReviewMetadata
{
  id v2 = [(SUUIComposeReviewView *)self->_composeView copyReview];
  return (SUUIReviewMetadata *)v2;
}

- (void)setRating:(float)a3
{
}

- (void)loadView
{
  objc_super v3 = [MEMORY[0x263F82670] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  v5 = [SUUIComposeReviewView alloc];
  uint64_t v6 = -[SUUIComposeReviewView initWithFrame:style:](v5, "initWithFrame:style:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  composeView = self->_composeView;
  self->_composeView = v6;

  [(SUUIComposeReviewView *)self->_composeView setAutoresizingMask:18];
  [(SUUIComposeReviewView *)self->_composeView setDelegate:self];
  [(SUUIComposeReviewView *)self->_composeView setReview:self->_review];
  [(SUUIComposeReviewView *)self->_composeView reloadData];
  [(SUUIComposeReviewFormViewController *)self setView:self->_composeView];
  id v16 = [(SUViewController *)self navigationItem];
  id v8 = objc_alloc(MEMORY[0x263F895D0]);
  objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_2704F8130 table:0];
  v11 = (void *)[v8 initWithTitle:v10 style:0 target:self action:sel__cancel];

  [v16 setLeftBarButtonItem:v11];
  id v12 = objc_alloc(MEMORY[0x263F895D0]);
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"SUBMIT" value:&stru_2704F8130 table:0];
  v15 = (void *)[v12 initWithTitle:v14 style:2 target:self action:sel__submit];

  [v16 setRightBarButtonItem:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUViewController *)self navigationItem];
  uint64_t v6 = [v5 rightBarButtonItem];

  objc_msgSend(v6, "setEnabled:", -[SUUIComposeReviewView isValid](self->_composeView, "isValid"));
  v7.receiver = self;
  v7.super_class = (Class)SUUIComposeReviewFormViewController;
  [(SUViewController *)&v7 viewWillAppear:v3];
}

- (void)composeReviewViewValidityChanged:(id)a3
{
  BOOL v4 = [(SUViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];

  objc_msgSend(v5, "setEnabled:", -[SUUIComposeReviewView isValid](self->_composeView, "isValid"));
}

- (void)_cancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 composeReviewFormDidCancel:self];
  }
}

- (void)_submit
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 composeReviewFormDidSubmit:self];
  }
}

- (SUUIComposeReviewFormDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIComposeReviewFormDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeView, 0);
}

@end