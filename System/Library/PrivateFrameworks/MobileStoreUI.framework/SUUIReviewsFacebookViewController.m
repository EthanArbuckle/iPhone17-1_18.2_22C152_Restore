@interface SUUIReviewsFacebookViewController
- (SUUIClientContext)clientContext;
- (SUUIFacebookLikeStatus)facebookLikeStatus;
- (SUUIReviewsFacebookViewControllerDelegate)delegate;
- (void)_changeStatusToUserLiked:(BOOL)a3;
- (void)_reloadFacebookView;
- (void)_toggleLike:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFacebookLikeStatus:(id)a3;
@end

@implementation SUUIReviewsFacebookViewController

- (void)dealloc
{
  v3 = [(SUUIReviewsFacebookView *)self->_facebookView likeToggleButton];
  [v3 removeTarget:self action:0 forControlEvents:4095];

  v4.receiver = self;
  v4.super_class = (Class)SUUIReviewsFacebookViewController;
  [(SUUIReviewsFacebookViewController *)&v4 dealloc];
}

- (void)setFacebookLikeStatus:(id)a3
{
  if (self->_facebookLikeStatus != a3)
  {
    objc_super v4 = (SUUIFacebookLikeStatus *)[a3 copy];
    facebookLikeStatus = self->_facebookLikeStatus;
    self->_facebookLikeStatus = v4;

    [(SUUIReviewsFacebookViewController *)self _reloadFacebookView];
  }
}

- (void)loadView
{
  facebookView = self->_facebookView;
  if (!facebookView)
  {
    objc_super v4 = [[SUUIReviewsFacebookView alloc] initWithClientContext:self->_clientContext];
    v5 = self->_facebookView;
    self->_facebookView = v4;

    v6 = [(SUUIReviewsFacebookView *)self->_facebookView likeToggleButton];
    [v6 addTarget:self action:sel__toggleLike_ forControlEvents:64];

    [(SUUIReviewsFacebookViewController *)self _reloadFacebookView];
    facebookView = self->_facebookView;
  }
  [(SUUIReviewsFacebookViewController *)self setView:facebookView];
}

- (void)_toggleLike:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUUIFacebookLikeStatus *)self->_facebookLikeStatus isUserLiked];
  BOOL v6 = v5;
  BOOL v7 = !v5;
  [(SUUIReviewsFacebookViewController *)self _changeStatusToUserLiked:v7];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke;
  aBlock[3] = &unk_265403638;
  objc_copyWeak(&v16, &location);
  BOOL v17 = v7;
  v8 = _Block_copy(aBlock);
  uint64_t v9 = SUUISocialFramework();
  v10 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Slfacebooksess.isa, v9), "sharedSession");
  [(SUUIFacebookLikeStatus *)self->_facebookLikeStatus URL];
  if (v6) {
    v11 = {;
  }
    [v10 unlikeURL:v11 completion:v8];
  }
  else {
    v11 = {;
  }
    [v10 likeURL:v11 completion:v8];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 reviewsFacebookViewControllerDidChange:self];
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke_2;
    v3[3] = &unk_265403610;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    char v5 = *(unsigned char *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v3);
    objc_destroyWeak(&v4);
  }
}

void __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _changeStatusToUserLiked:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_changeStatusToUserLiked:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[(SUUIFacebookLikeStatus *)self->_facebookLikeStatus copy];
  [v5 setUserLiked:v3];
  [(SUUIReviewsFacebookViewController *)self setFacebookLikeStatus:v5];
}

- (void)_reloadFacebookView
{
  facebookView = self->_facebookView;
  id v4 = [(SUUIFacebookLikeStatus *)self->_facebookLikeStatus friendNames];
  [(SUUIReviewsFacebookView *)facebookView setFriendNames:v4];

  id v5 = self->_facebookView;
  BOOL v6 = [(SUUIFacebookLikeStatus *)self->_facebookLikeStatus isUserLiked];
  [(SUUIReviewsFacebookView *)v5 setUserLiked:v6];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIReviewsFacebookViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIReviewsFacebookViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUIFacebookLikeStatus)facebookLikeStatus
{
  return self->_facebookLikeStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facebookView, 0);
  objc_storeStrong((id *)&self->_facebookLikeStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end