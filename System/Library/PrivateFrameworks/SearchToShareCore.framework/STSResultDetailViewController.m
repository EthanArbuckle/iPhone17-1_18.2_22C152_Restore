@interface STSResultDetailViewController
- (BOOL)allowCustomContentViewInteraction;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isFullscreen;
- (BOOL)prefersStatusBarHidden;
- (BOOL)useBackgroundBlur;
- (CGRect)contentFrameForBounds:(CGRect)a3 traitCollection:(id)a4;
- (CGSize)contentSize;
- (CGSize)providerIconSize;
- (NSString)providerName;
- (NSString)queryString;
- (NSURL)contentURL;
- (NSURL)providerURL;
- (SFSearchResult)searchResult;
- (STSAnimatedImageInfo)thumbnailInfo;
- (STSResultDetailViewControllerDelegate)delegate;
- (UIImage)providerIcon;
- (UIImage)thumbnail;
- (unint64_t)numberOfReportedResults;
- (unint64_t)queryId;
- (void)_handleTap:(id)a3;
- (void)detailViewDidTapProvider:(id)a3;
- (void)detailViewDidTapReportConcern:(id)a3;
- (void)detailViewDidTapSend:(id)a3;
- (void)loadView;
- (void)setAllowCustomContentViewInteraction:(BOOL)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFullscreen:(BOOL)a3;
- (void)setNumberOfReportedResults:(unint64_t)a3;
- (void)setProviderIcon:(id)a3;
- (void)setProviderIconSize:(CGSize)a3;
- (void)setProviderName:(id)a3;
- (void)setProviderURL:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setQueryString:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setUseBackgroundBlur:(BOOL)a3;
- (void)updateCustomContentWithView:(id)a3;
- (void)updateWithThumbnail:(id)a3 orThumbnailInfo:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation STSResultDetailViewController

- (void)loadView
{
  v3 = [STSResultDetailView alloc];
  v5 = -[STSResultDetailView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(STSResultDetailView *)v5 setDelegate:self];
  -[STSResultDetailView setContentSize:](v5, "setContentSize:", self->_contentSize.width, self->_contentSize.height);
  v4 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleTap_];
  [v4 setDelegate:self];
  [(STSResultDetailView *)v5 addGestureRecognizer:v4];
  [(STSResultDetailViewController *)self setView:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(STSResultDetailViewController *)self modalPresentationStyle] == 6)
  {
    v8 = [(STSResultDetailViewController *)self view];
    objc_msgSend(v8, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), width, height);
  }
  [v7 animateAlongsideTransition:0 completion:0];
  v9.receiver = self;
  v9.super_class = (Class)STSResultDetailViewController;
  -[STSResultDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setUseBackgroundBlur:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STSResultDetailViewController *)self view];
  [v4 setUseBackgroundBlur:v3];
}

- (void)_handleTap:(id)a3
{
}

- (void)setContentSize:(CGSize)a3
{
  p_contentSize = &self->_contentSize;
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    p_contentSize->double width = a3.width;
    self->_contentSize.double height = a3.height;
    if ([(STSResultDetailViewController *)self isViewLoaded])
    {
      id v6 = [(STSResultDetailViewController *)self view];
      objc_msgSend(v6, "setContentSize:", p_contentSize->width, p_contentSize->height);
    }
  }
}

- (UIImage)thumbnail
{
  v2 = [(STSResultDetailViewController *)self view];
  BOOL v3 = [v2 thumbnail];

  return (UIImage *)v3;
}

- (STSAnimatedImageInfo)thumbnailInfo
{
  v2 = [(STSResultDetailViewController *)self view];
  BOOL v3 = [v2 thumbnailInfo];

  return (STSAnimatedImageInfo *)v3;
}

- (CGSize)providerIconSize
{
  v2 = [(STSResultDetailViewController *)self view];
  [v2 providerIconSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setProviderIconSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(STSResultDetailViewController *)self view];
  objc_msgSend(v5, "setProviderIconSize:", width, height);
}

- (UIImage)providerIcon
{
  v2 = [(STSResultDetailViewController *)self view];
  double v3 = [v2 providerIcon];

  return (UIImage *)v3;
}

- (void)setProviderIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(STSResultDetailViewController *)self view];
  [v5 setProviderIcon:v4];
}

- (NSString)providerName
{
  v2 = [(STSResultDetailViewController *)self view];
  double v3 = [v2 providerName];

  return (NSString *)v3;
}

- (void)setProviderName:(id)a3
{
  id v4 = a3;
  id v5 = [(STSResultDetailViewController *)self view];
  [v5 setProviderName:v4];
}

- (BOOL)isFullscreen
{
  v2 = [(STSResultDetailViewController *)self view];
  char v3 = [v2 isFullscreen];

  return v3;
}

- (void)setIsFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STSResultDetailViewController *)self view];
  [v4 setIsFullscreen:v3];
}

- (void)setSearchResult:(id)a3
{
  id v5 = (SFSearchResult *)a3;
  if (self->_searchResult != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_searchResult, a3);
    uint64_t v6 = [(SFSearchResult *)self->_searchResult sts_userReportRequest];
    if (v6
      && (double v7 = (void *)v6,
          unint64_t v8 = [(STSResultDetailViewController *)self numberOfReportedResults],
          v7,
          v8 <= 0x1E))
    {
      objc_super v9 = [(STSResultDetailViewController *)self view];
      [v9 setShowReportConcern:1];

      v10 = [(STSResultDetailViewController *)self view];
      v11 = [v10 reportConcernButton];
      v12 = [(STSResultDetailViewController *)self searchResult];
      v13 = objc_msgSend(v12, "sts_userReportRequest");
      v14 = [v13 affordanceText];
      [v11 setTitle:v14 forState:0];
    }
    else
    {
      v10 = [(STSResultDetailViewController *)self view];
      [v10 setShowReportConcern:0];
    }

    id v5 = v15;
  }
}

- (void)updateWithThumbnail:(id)a3 orThumbnailInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STSResultDetailViewController *)self view];
  [v8 updateWithThumbnail:v7 orThumbnailInfo:v6];
}

- (void)updateCustomContentWithView:(id)a3
{
  id v4 = a3;
  id v5 = [(STSResultDetailViewController *)self view];
  [v5 setCustomContentView:v4];
}

- (CGRect)contentFrameForBounds:(CGRect)a3 traitCollection:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = [(STSResultDetailViewController *)self view];
  objc_msgSend(v10, "contentFrameForBounds:traitCollection:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)detailViewDidTapProvider:(id)a3
{
  id v4 = [(STSResultDetailViewController *)self delegate];
  [v4 detailViewControllerDidSelectProviderLink:self];

  [(STSResultDetailViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)detailViewDidTapSend:(id)a3
{
  id v4 = [(STSResultDetailViewController *)self delegate];
  [v4 detailViewControllerDidInsert:self];

  [(STSResultDetailViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)detailViewDidTapReportConcern:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [(STSResultDetailViewController *)self searchResult];
  id v5 = objc_msgSend(v4, "sts_userReportRequest");

  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = [v5 title];
  id v8 = [v6 alertControllerWithTitle:v7 message:0 preferredStyle:0];

  id v9 = (void *)MEMORY[0x263F82400];
  v10 = [v5 dismissText];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke;
  v27[3] = &unk_264A05690;
  double v11 = self;
  v27[4] = self;
  double v12 = [v9 actionWithTitle:v10 style:1 handler:v27];
  [v8 addAction:v12];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v5 userReportOptions];
  uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v18 = [v17 name];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_3;
        v22[3] = &unk_264A056D8;
        v22[4] = v11;
        v22[5] = v17;
        double v19 = [MEMORY[0x263F82400] actionWithTitle:v18 style:0 handler:v22];
        [v8 addAction:v19];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v14);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_6;
  v21[3] = &unk_264A053F0;
  v21[4] = v11;
  [(STSResultDetailViewController *)v11 presentViewController:v8 animated:1 completion:v21];
}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_2;
  block[3] = &unk_264A053F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setShowReportConcern:1];

  BOOL v3 = [*(id *)(a1 + 32) view];
  id v4 = [v3 reportConcernButton];
  id v5 = [*(id *)(a1 + 32) searchResult];
  id v6 = objc_msgSend(v5, "sts_userReportRequest");
  id v7 = [v6 affordanceText];
  [v4 setTitle:v7 forState:0];

  id v8 = [*(id *)(a1 + 32) view];
  id v9 = [v8 reportConcernButton];
  [v9 sizeToFit];

  id v10 = [*(id *)(a1 + 32) view];
  [v10 setNeedsLayout];
}

uint64_t __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_4;
  block[3] = &unk_264A053F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  v2 = [*(id *)(a1 + 32) delegate];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [v3 searchResult];
  [v2 detailViewControllerDidReportConcern:v3 result:v4 punchout:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global];
}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setShowReportConcern:1];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 updateReportConcernButtonTitle];
}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setShowReportConcern:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_allowCustomContentViewInteraction)
  {
    id v5 = objc_msgSend(a4, "view", a3);
    id v6 = [(STSResultDetailViewController *)self view];
    id v7 = [v6 customContentView];
    int v8 = [v5 isEqual:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (STSResultDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSResultDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (void)setProviderURL:(id)a3
{
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (BOOL)useBackgroundBlur
{
  return self->_useBackgroundBlur;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (unint64_t)numberOfReportedResults
{
  return self->_numberOfReportedResults;
}

- (void)setNumberOfReportedResults:(unint64_t)a3
{
  self->_numberOfReportedResults = a3;
}

- (BOOL)allowCustomContentViewInteraction
{
  return self->_allowCustomContentViewInteraction;
}

- (void)setAllowCustomContentViewInteraction:(BOOL)a3
{
  self->_allowCustomContentViewInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end