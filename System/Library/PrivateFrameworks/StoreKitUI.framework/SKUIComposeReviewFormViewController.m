@interface SKUIComposeReviewFormViewController
- (SKUIComposeReviewFormDelegate)delegate;
- (SKUIComposeReviewFormViewController)initWithReviewMetadata:(id)a3;
- (SKUIReviewMetadata)editedReviewMetadata;
- (void)_cancel;
- (void)_submit;
- (void)composeReviewViewValidityChanged:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setRating:(float)a3;
- (void)showSendAnimationInNavigationBarWithCompletion:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIComposeReviewFormViewController

- (SKUIComposeReviewFormViewController)initWithReviewMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIComposeReviewFormViewController;
  v5 = [(SUViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    review = v5->_review;
    v5->_review = (SKUIReviewMetadata *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(SKUIComposeReviewView *)self->_composeView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeReviewFormViewController;
  [(SUViewController *)&v3 dealloc];
}

- (SKUIReviewMetadata)editedReviewMetadata
{
  id v2 = [(SKUIComposeReviewView *)self->_composeView copyReview];

  return (SKUIReviewMetadata *)v2;
}

- (void)setRating:(float)a3
{
}

- (void)loadView
{
  objc_super v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  v5 = [SKUIComposeReviewView alloc];
  uint64_t v6 = -[SKUIComposeReviewView initWithFrame:style:](v5, "initWithFrame:style:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  composeView = self->_composeView;
  self->_composeView = v6;

  [(SKUIComposeReviewView *)self->_composeView setAutoresizingMask:18];
  [(SKUIComposeReviewView *)self->_composeView setDelegate:self];
  [(SKUIComposeReviewView *)self->_composeView setReview:self->_review];
  [(SKUIComposeReviewView *)self->_composeView reloadData];
  [(SKUIComposeReviewFormViewController *)self setView:self->_composeView];
  id v16 = [(SUViewController *)self navigationItem];
  id v8 = objc_alloc(MEMORY[0x1E4FB8898]);
  objc_super v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_1F1C879E8 table:0];
  v11 = (void *)[v8 initWithTitle:v10 style:0 target:self action:sel__cancel];

  [v16 setLeftBarButtonItem:v11];
  id v12 = objc_alloc(MEMORY[0x1E4FB8898]);
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"SUBMIT" value:&stru_1F1C879E8 table:0];
  v15 = (void *)[v12 initWithTitle:v14 style:2 target:self action:sel__submit];

  [v16 setRightBarButtonItem:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUViewController *)self navigationItem];
  uint64_t v6 = [v5 rightBarButtonItem];

  objc_msgSend(v6, "setEnabled:", -[SKUIComposeReviewView isValid](self->_composeView, "isValid"));
  v7.receiver = self;
  v7.super_class = (Class)SKUIComposeReviewFormViewController;
  [(SUViewController *)&v7 viewWillAppear:v3];
}

- (void)showSendAnimationInNavigationBarWithCompletion:(id)a3
{
}

- (void)composeReviewViewValidityChanged:(id)a3
{
  BOOL v4 = [(SUViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];

  objc_msgSend(v5, "setEnabled:", -[SKUIComposeReviewView isValid](self->_composeView, "isValid"));
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

- (SKUIComposeReviewFormDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIComposeReviewFormDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeView, 0);

  objc_storeStrong((id *)&self->_submitNavButton, 0);
}

@end