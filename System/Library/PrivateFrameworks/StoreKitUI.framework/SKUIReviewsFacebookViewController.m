@interface SKUIReviewsFacebookViewController
- (SKUIClientContext)clientContext;
- (SKUIFacebookLikeStatus)facebookLikeStatus;
- (SKUIReviewsFacebookViewControllerDelegate)delegate;
- (void)_changeStatusToUserLiked:(BOOL)a3;
- (void)_reloadFacebookView;
- (void)_toggleLike:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFacebookLikeStatus:(id)a3;
@end

@implementation SKUIReviewsFacebookViewController

- (void)dealloc
{
}

- (void)setFacebookLikeStatus:(id)a3
{
  v4 = (SKUIFacebookLikeStatus *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIReviewsFacebookViewController setFacebookLikeStatus:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_facebookLikeStatus != v4)
  {
    v13 = (SKUIFacebookLikeStatus *)[(SKUIFacebookLikeStatus *)v4 copy];
    facebookLikeStatus = self->_facebookLikeStatus;
    self->_facebookLikeStatus = v13;

    [(SKUIReviewsFacebookViewController *)self _reloadFacebookView];
  }
}

- (void)loadView
{
}

- (void)_toggleLike:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKUIFacebookLikeStatus *)self->_facebookLikeStatus isUserLiked];
  BOOL v6 = v5;
  BOOL v7 = !v5;
  [(SKUIReviewsFacebookViewController *)self _changeStatusToUserLiked:v7];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke;
  aBlock[3] = &unk_1E6427D30;
  objc_copyWeak(&v16, &location);
  BOOL v17 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = SKUISocialFramework();
  uint64_t v10 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Slfacebooksess.isa, v9), "sharedSession");
  [(SKUIFacebookLikeStatus *)self->_facebookLikeStatus URL];
  if (v6) {
    uint64_t v11 = {;
  }
    [v10 unlikeURL:v11 completion:v8];
  }
  else {
    uint64_t v11 = {;
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

void __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke_2;
    v3[3] = &unk_1E6427D08;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    char v5 = *(unsigned char *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
  }
}

void __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _changeStatusToUserLiked:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_changeStatusToUserLiked:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[(SKUIFacebookLikeStatus *)self->_facebookLikeStatus copy];
  [v5 setUserLiked:v3];
  [(SKUIReviewsFacebookViewController *)self setFacebookLikeStatus:v5];
}

- (void)_reloadFacebookView
{
  facebookView = self->_facebookView;
  id v4 = [(SKUIFacebookLikeStatus *)self->_facebookLikeStatus friendNames];
  [(SKUIReviewsFacebookView *)facebookView setFriendNames:v4];

  id v5 = self->_facebookView;
  BOOL v6 = [(SKUIFacebookLikeStatus *)self->_facebookLikeStatus isUserLiked];

  [(SKUIReviewsFacebookView *)v5 setUserLiked:v6];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIReviewsFacebookViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIReviewsFacebookViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIFacebookLikeStatus)facebookLikeStatus
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

- (void)setFacebookLikeStatus:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end