@interface ContinuousReadingViewController
- (BOOL)interceptsScrollToTopTap;
- (BOOL)isCommittingToContinuousDocument;
- (BOOL)isScrollingToNextContinuousDocument;
- (BOOL)isSuppressingAutoScroll;
- (BOOL)isUserInteractingWithContainer;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (ContinuousReadingBannerView)topBannerView;
- (ContinuousReadingItem)currentItem;
- (ContinuousReadingPreviewView)previewView;
- (ContinuousReadingPreviewView)previousItemPreviewView;
- (ContinuousReadingViewControllerDelegate)delegate;
- (UIScrollView)_outerScrollView;
- (_SFWebView)currentWebView;
- (double)_scrollOffsetYForNextDocument;
- (double)_scrollOffsetYForPreviousDocument;
- (double)scrollOffsetYForCurrentDocument;
- (void)_commitToNextContinuousDocument;
- (void)_commitToPreviousContinuousDocument;
- (void)_setOuterScrollView:(id)a3;
- (void)_willCommitToContinuousDocumentInPreviewView:(id)a3;
- (void)didCreateWebViewForNextDocument:(id)a3;
- (void)didCreateWebViewForPreviousDocument:(id)a3;
- (void)innerScrollViewDidScroll:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBannerTheme:(id)a3 animated:(BOOL)a4;
- (void)setCurrentItem:(id)a3;
- (void)setCurrentWebView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterceptsScrollToTopTap:(BOOL)a3;
- (void)setPreviewView:(id)a3;
- (void)setPreviousItemPreviewView:(id)a3;
- (void)setSuppressingAutoScroll:(BOOL)a3;
- (void)updateContinuousPreviewViewSizeAttributes;
- (void)updateOuterScrollView;
@end

@implementation ContinuousReadingViewController

- (BOOL)isScrollingToNextContinuousDocument
{
  return self->_scrollingToNextContinuousDocument;
}

- (BOOL)isCommittingToContinuousDocument
{
  return self->_committingToContinuousDocument;
}

- (ContinuousReadingBannerView)topBannerView
{
  return [(ContinuousReadingPreviewView *)self->_previousItemPreviewView bannerView];
}

- (void)setBannerTheme:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_bannerTheme, a3);
  id v7 = a3;
  [(ContinuousReadingPreviewView *)self->_previousItemPreviewView setBannerTheme:v7 animated:v4];
  [(ContinuousReadingPreviewView *)self->_previewView setBannerTheme:v7 animated:v4];
}

- (void)updateContinuousPreviewViewSizeAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  if (WeakRetained)
  {
    id v26 = WeakRetained;
    [WeakRetained bounds];
    double v5 = v4;
    double v7 = v6;
    -[ContinuousReadingPreviewView setContentViewSize:](self->_previousItemPreviewView, "setContentViewSize:", v4, v6);
    -[ContinuousReadingPreviewView setContentViewSize:](self->_previewView, "setContentViewSize:", v5, v7);
    [v26 _obscuredInsets];
    UIEdgeInsetsReplace();
    double v25 = v8;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = v5 - (v9 + v13);
    v16 = [v26 scrollView];
    [v16 contentInset];
    double v18 = v17;
    double v20 = v19;

    id v21 = [(ContinuousReadingPreviewView *)self->_previousItemPreviewView contentView];
    if (v26 != v21)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v21, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v15, v7, v15, v7, v5, v7);
      }
      else {
        objc_msgSend(v21, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v15, v7, v5, v7);
      }
      v22 = [v21 scrollView];
      objc_msgSend(v22, "_sf_setContentInsetAdjustments:", 0.0, v18, 0.0, v20);

      objc_msgSend(v21, "_setObscuredInsets:", v25, v10, v12, v14);
    }
    id v23 = [(ContinuousReadingPreviewView *)self->_previewView contentView];

    if (v23 != v26)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v23, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v15, v7, v15, v7, v5, v7);
      }
      else {
        objc_msgSend(v23, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v15, v7, v5, v7);
      }
      v24 = [v23 scrollView];
      objc_msgSend(v24, "_sf_setContentInsetAdjustments:", 0.0, v18, 0.0, v20);

      objc_msgSend(v23, "_setObscuredInsets:", v25, v10, v12, v14);
    }

    id WeakRetained = v26;
  }
}

- (ContinuousReadingPreviewView)previewView
{
  return self->_previewView;
}

- (void)innerScrollViewDidScroll:(id)a3
{
  id v15 = a3;
  if (![(ContinuousReadingPreviewView *)self->_previewView canShowContentView]
    && ![(ContinuousReadingPreviewView *)self->_previousItemPreviewView canShowContentView]
    || self->_suppressingAutoScroll)
  {
    goto LABEL_15;
  }
  double v4 = [(ContinuousReadingViewController *)self _outerScrollView];
  [v15 bounds];
  double MaxY = CGRectGetMaxY(v17);
  [v15 contentSize];
  double v7 = MaxY - v6;
  [v15 contentInset];
  double v9 = v7 - v8;
  if (v7 - v8 >= 0.0)
  {
    uint64_t v14 = [(ContinuousReadingPreviewView *)self->_previewView canShowContentView];
    goto LABEL_13;
  }
  objc_msgSend(v15, "bounds", v9);
  double MinY = CGRectGetMinY(v18);
  [v15 contentInset];
  double v12 = MinY + v11;
  BOOL v13 = [(ContinuousReadingPreviewView *)self->_previousItemPreviewView canShowContentView];
  uint64_t v14 = v12 > 0.0 || v13;
  if (v12 <= 0.0 || v13) {
    goto LABEL_13;
  }
  if ([(ContinuousReadingPreviewView *)self->_previewView canShowContentView])
  {
    uint64_t v14 = 1;
LABEL_13:
    [v4 setScrollEnabled:v14];
  }

LABEL_15:
}

- (ContinuousReadingItem)currentItem
{
  return self->_currentItem;
}

- (void)setDelegate:(id)a3
{
}

- (void)setCurrentWebView:(id)a3
{
}

- (UIScrollView)_outerScrollView
{
  outerScrollView = self->_outerScrollView;
  if (!outerScrollView)
  {
    double v4 = objc_alloc_init(ContinuousReadingScrollView);
    double v5 = self->_outerScrollView;
    self->_outerScrollView = &v4->super;

    [(UIScrollView *)self->_outerScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)self->_outerScrollView setPagingEnabled:1];
    [(UIScrollView *)self->_outerScrollView setAutoresizingMask:18];
    [(UIScrollView *)self->_outerScrollView setDelegate:self];
    [(UIScrollView *)self->_outerScrollView _setAutoScrollEnabled:0];
    [(UIScrollView *)self->_outerScrollView setScrollsToTop:0];
    [(UIScrollView *)self->_outerScrollView setScrollEnabled:0];
    double v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIScrollView *)self->_outerScrollView setBackgroundColor:v6];

    self->_suppressingAutoScroll = 1;
    outerScrollView = self->_outerScrollView;
  }
  double v7 = outerScrollView;
  return v7;
}

- (void)updateOuterScrollView
{
  id v12 = [(ContinuousReadingViewController *)self _outerScrollView];
  [v12 frame];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(ContinuousReadingPreviewView *)self->_previewView canShowContentView];
  double v8 = -0.0;
  if (v7) {
    double v8 = v6;
  }
  objc_msgSend(v12, "setContentSize:", v4, v6 + v8);
  if ([(ContinuousReadingPreviewView *)self->_previousItemPreviewView canShowContentView])
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  objc_msgSend(v12, "setContentInset:", v6, v9, v10, v11);
}

- (ContinuousReadingPreviewView)previousItemPreviewView
{
  return self->_previousItemPreviewView;
}

- (void)setPreviousItemPreviewView:(id)a3
{
  double v5 = (ContinuousReadingPreviewView *)a3;
  previousItemPreviewView = self->_previousItemPreviewView;
  BOOL v7 = v5;
  if (previousItemPreviewView != v5)
  {
    [(ContinuousReadingPreviewView *)previousItemPreviewView removeFromSuperview];
    objc_storeStrong((id *)&self->_previousItemPreviewView, a3);
    [(ContinuousReadingPreviewView *)v7 setBannerTheme:self->_bannerTheme animated:0];
    [(ContinuousReadingViewController *)self updateOuterScrollView];
  }
}

- (void)setPreviewView:(id)a3
{
  double v5 = (ContinuousReadingPreviewView *)a3;
  previewView = self->_previewView;
  BOOL v7 = v5;
  if (previewView != v5)
  {
    [(ContinuousReadingPreviewView *)previewView removeFromSuperview];
    objc_storeStrong((id *)&self->_previewView, a3);
    [(ContinuousReadingPreviewView *)v7 setBannerTheme:self->_bannerTheme animated:0];
    [(ContinuousReadingViewController *)self updateOuterScrollView];
  }
}

- (BOOL)isUserInteractingWithContainer
{
  double v3 = [(ContinuousReadingViewController *)self _outerScrollView];
  if ([v3 isTracking])
  {
    BOOL v4 = 1;
  }
  else
  {
    [v3 contentOffset];
    double v6 = v5;
    [(ContinuousReadingViewController *)self scrollOffsetYForCurrentDocument];
    BOOL v4 = v6 != v7;
  }

  return v4;
}

- (void)setInterceptsScrollToTopTap:(BOOL)a3
{
  if (self->_interceptsScrollToTopTap != a3)
  {
    BOOL v3 = a3;
    self->_interceptsScrollToTopTap = a3;
    id v4 = [(ContinuousReadingViewController *)self _outerScrollView];
    [v4 setScrollEnabled:v3];
    [v4 setScrollsToTop:v3];
  }
}

- (void)didCreateWebViewForNextDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(ContinuousReadingPreviewView *)self->_previewView contentView];

  if (v5 != v4)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    [WeakRetained frame];
    double v10 = v9;
    double v12 = v11;

    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v17[0] = *MEMORY[0x1E4F1DAB8];
    v17[1] = v13;
    v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v17];
    objc_msgSend(v4, "setFrame:", v6, v7, v10, v12);
    uint64_t v14 = [v4 scrollView];
    [v14 setClipsToBounds:1];

    id v15 = [v4 scrollView];
    [v15 setScrollsToTop:0];

    [(ContinuousReadingPreviewView *)self->_previewView setContentView:v4];
    v16 = [(ContinuousReadingViewController *)self _outerScrollView];
    [v4 setClippingView:v16];

    [(ContinuousReadingViewController *)self updateOuterScrollView];
  }
}

- (void)didCreateWebViewForPreviousDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(ContinuousReadingPreviewView *)self->_previousItemPreviewView contentView];

  if (v5 != v4)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    [WeakRetained frame];
    double v10 = v9;
    double v12 = v11;

    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v17[0] = *MEMORY[0x1E4F1DAB8];
    v17[1] = v13;
    v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v17];
    objc_msgSend(v4, "setFrame:", v6, v7, v10, v12);
    uint64_t v14 = [v4 scrollView];
    [v14 setClipsToBounds:1];

    id v15 = [v4 scrollView];
    [v15 setScrollsToTop:0];

    [(ContinuousReadingPreviewView *)self->_previousItemPreviewView setContentView:v4];
    v16 = [(ContinuousReadingViewController *)self _outerScrollView];
    [v4 setClippingView:v16];

    [(ContinuousReadingViewController *)self updateOuterScrollView];
  }
}

- (void)_willCommitToContinuousDocumentInPreviewView:(id)a3
{
  id v4 = a3;
  id v5 = [(ContinuousReadingViewController *)self _outerScrollView];
  objc_msgSend(v5, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  double v6 = [(ContinuousReadingViewController *)self _outerScrollView];
  double v7 = [v4 contentView];
  [v6 addSubview:v7];

  double v8 = [v4 contentView];

  id v15 = [v8 scrollView];

  objc_msgSend(v15, "_sf_setContentInsetAdjustments:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v15 contentOffset];
  double v10 = v9;
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained continuousReadingViewControllerNextWebViewLandingOffset:self includeBottomBar:0];
  objc_msgSend(v15, "setContentOffset:", v10, v12 - v14);
}

- (void)_commitToNextContinuousDocument
{
  [(ContinuousReadingViewController *)self _willCommitToContinuousDocumentInPreviewView:self->_previewView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [(ContinuousReadingPreviewView *)self->_previewView continuousReadingItem];
  self->_committingToContinuousDocument = 1;
  [WeakRetained continuousReadingViewControllerWillCommitToLoadNextItem:self];
  [WeakRetained continuousReadingViewController:self didCommitToLoadItem:v3];
  self->_committingToContinuousDocument = 0;
}

- (void)_commitToPreviousContinuousDocument
{
  [(ContinuousReadingViewController *)self _willCommitToContinuousDocumentInPreviewView:self->_previousItemPreviewView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [(ContinuousReadingPreviewView *)self->_previousItemPreviewView continuousReadingItem];
  self->_committingToContinuousDocument = 1;
  [WeakRetained continuousReadingViewControllerCommitToLoadPreviousItem:self];
  [WeakRetained continuousReadingViewController:self didCommitToLoadItem:v3];
  self->_committingToContinuousDocument = 0;
}

- (double)scrollOffsetYForCurrentDocument
{
  return 0.0;
}

- (double)_scrollOffsetYForNextDocument
{
  v2 = [(ContinuousReadingViewController *)self _outerScrollView];
  [v2 frame];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (double)_scrollOffsetYForPreviousDocument
{
  v2 = [(ContinuousReadingViewController *)self _outerScrollView];
  [v2 frame];
  double v3 = -CGRectGetHeight(v5);

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (!self->_suppressingAutoScroll)
  {
    id v10 = v4;
    [v4 contentOffset];
    if (v5 >= 0.0
      || [(ContinuousReadingPreviewView *)self->_previousItemPreviewView canShowContentView])
    {
      [v10 contentOffset];
      double v7 = v6;
      [(ContinuousReadingViewController *)self scrollOffsetYForCurrentDocument];
      id v4 = v10;
      if (v7 == v8) {
        goto LABEL_8;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained continuousReadingViewController:self scrollViewDidScroll:v10];
    }
    else
    {
      objc_msgSend(v10, "setContentOffset:", 0.0, 0.0);
    }
    id v4 = v10;
  }
LABEL_8:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a5->y;
  [(ContinuousReadingViewController *)self _scrollOffsetYForNextDocument];
  if (y == v7)
  {
    self->_scrollingToNextContinuousDocument = 1;
    memset(&v16, 0, sizeof(v16));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    double v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained transform];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }

    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 continuousReadingViewControllerNextWebViewLandingOffset:self includeBottomBar:1];
    CGAffineTransform v14 = v16;
    CGAffineTransformTranslate(&v15, &v14, 0.0, v11);
    CGAffineTransform v16 = v15;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    CGAffineTransform v13 = v16;
    v12[2] = __94__ContinuousReadingViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
    v12[3] = &unk_1E6D7C1F8;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.15];
  }
}

void __94__ContinuousReadingViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  [WeakRetained setTransform:v4];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v10 = a3;
  [v10 contentOffset];
  double v5 = v4;
  [(ContinuousReadingViewController *)self _scrollOffsetYForNextDocument];
  if (v5 == v6)
  {
    [(ContinuousReadingViewController *)self _commitToNextContinuousDocument];
    self->_scrollingToNextContinuousDocument = 0;
  }
  else
  {
    [v10 contentOffset];
    double v8 = v7;
    [(ContinuousReadingViewController *)self _scrollOffsetYForPreviousDocument];
    if (v8 == v9) {
      [(ContinuousReadingViewController *)self _commitToPreviousContinuousDocument];
    }
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained continuousReadingViewControllerDidObserveScrollToTopTap:self];

  return 0;
}

- (void)setCurrentItem:(id)a3
{
}

- (_SFWebView)currentWebView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  return (_SFWebView *)WeakRetained;
}

- (BOOL)isSuppressingAutoScroll
{
  return self->_suppressingAutoScroll;
}

- (void)setSuppressingAutoScroll:(BOOL)a3
{
  self->_suppressingAutoScroll = a3;
}

- (BOOL)interceptsScrollToTopTap
{
  return self->_interceptsScrollToTopTap;
}

- (ContinuousReadingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ContinuousReadingViewControllerDelegate *)WeakRetained;
}

- (void)_setOuterScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_currentWebView);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_previousItemPreviewView, 0);
  objc_storeStrong((id *)&self->_bannerTheme, 0);
}

@end