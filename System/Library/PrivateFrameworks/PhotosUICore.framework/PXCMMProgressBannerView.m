@interface PXCMMProgressBannerView
- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXCMMProgressBannerView)init;
- (PXCMMProgressBannerView)initWithCoder:(id)a3;
- (PXCMMProgressBannerView)initWithFrame:(CGRect)a3;
- (PXCMMProgressBannerView)initWithMomentShareStatusPresentation:(id)a3;
- (PXCMMProgressBannerViewDelegate)delegate;
- (UIAlertController)alertController;
- (double)layoutHeight;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_performActionFromView:(id)a3 sourceRect:(CGRect)a4;
- (void)_updateActivityTitle;
- (void)_updatePauseTitle;
- (void)_updateProgress;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAlertController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXCMMProgressBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_pauseLabel, 0);
  objc_storeStrong((id *)&self->_activityTextView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
}

- (void)setAlertController:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (double)layoutHeight
{
  return self->_layoutHeight;
}

- (void)setDelegate:(id)a3
{
}

- (PXCMMProgressBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCMMProgressBannerViewDelegate *)WeakRetained;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 contentType] == 2
    && ([v9 tagIdentifier],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:@"com.apple.photos.ui.link-action"],
        v11,
        v12))
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4FB13F0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__PXCMMProgressBannerView_textView_primaryActionForTextItem_defaultAction___block_invoke;
    v16[3] = &unk_1E5DD1098;
    id v17 = v8;
    id v18 = v9;
    objc_copyWeak(&v19, &location);
    v14 = [v13 actionWithHandler:v16];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __75__PXCMMProgressBannerView_textView_primaryActionForTextItem_defaultAction___block_invoke(id *a1)
{
  id v17 = [a1[4] layoutManager];
  uint64_t v2 = [a1[5] range];
  uint64_t v4 = objc_msgSend(v17, "glyphRangeForCharacterRange:actualCharacterRange:", v2, v3, 0);
  uint64_t v6 = v5;
  v7 = [a1[4] textContainer];
  objc_msgSend(v17, "boundingRectForGlyphRange:inTextContainer:", v4, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_performActionFromView:sourceRect:", a1[4], v9, v11, v13, v15);
}

- (void)_performActionFromView:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation action];
  if (v10)
  {
    double v11 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      momentShareStatusPresentation = self->_momentShareStatusPresentation;
      *(_DWORD *)buf = 138543362;
      v38 = momentShareStatusPresentation;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: User invoked un-pause action (%{public}@)", buf, 0xCu);
    }

    double v13 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation actionConfirmationAlertTitle];
    uint64_t v14 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation actionConfirmationAlertButtonTitle];
    double v15 = (void *)v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    int v17 = !v16;
    id v18 = PLUserStatusUIGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v20 = self->_momentShareStatusPresentation;
        *(_DWORD *)buf = 138543362;
        v38 = v20;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: Presenting confirmation alert (%{public}@)", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:0 preferredStyle:0];
      v22 = (void *)MEMORY[0x1E4FB1410];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke;
      v34[3] = &unk_1E5DBFFA0;
      v34[4] = self;
      objc_copyWeak(&v36, (id *)buf);
      v35 = v10;
      v23 = [v22 actionWithTitle:v15 style:0 handler:v34];
      [v21 addAction:v23];

      v24 = (void *)MEMORY[0x1E4FB1410];
      v25 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke_233;
      v32[3] = &unk_1E5DBFFC8;
      v32[4] = self;
      objc_copyWeak(&v33, (id *)buf);
      v26 = [v24 actionWithTitle:v25 style:1 handler:v32];
      [v21 addAction:v26];

      v27 = [v21 popoverPresentationController];
      [v27 setSourceView:v9];

      v28 = [v21 popoverPresentationController];
      objc_msgSend(v28, "setSourceRect:", x, y, width, height);

      v29 = [v21 popoverPresentationController];
      [v29 setPermittedArrowDirections:2];

      [(PXCMMProgressBannerView *)self setAlertController:v21];
      v30 = [(PXCMMProgressBannerView *)self delegate];
      [v30 progressBannerView:self presentViewController:v21];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v36);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v19)
      {
        v31 = self->_momentShareStatusPresentation;
        *(_DWORD *)buf = 138543362;
        v38 = v31;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: Invoking action without confirmation (%{public}@)", buf, 0xCu);
      }

      v10[2](v10);
    }
  }
}

uint64_t __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 408);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: User confirmed action (%{public}@)", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setAlertController:0];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke_233(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 408);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: User cancelled action (%{public}@)", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlertController:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((void *)PXMomentShareStatusPresentationObservationContext_155482 != a5)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCMMProgressBannerView.m" lineNumber:289 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v10 = v9;
  if ((a4 & 0x20) != 0) {
    [(PXCMMProgressBannerView *)self _updatePauseTitle];
  }
  if ((a4 & 0x7C0) != 0)
  {
    double v11 = [(PXCMMProgressBannerView *)self alertController];
    if (v11)
    {
      double v12 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        momentShareStatusPresentation = self->_momentShareStatusPresentation;
        int v16 = 138543362;
        int v17 = momentShareStatusPresentation;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: Auto-dismiss alert for replaced action (%{public}@)", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v14 = [(PXCMMProgressBannerView *)self delegate];
      [v14 progressBannerView:self dismissViewController:v11];

      [(PXCMMProgressBannerView *)self setAlertController:0];
    }

    LODWORD(v11) = 1;
    if ((a4 & 0x1000) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    double v11 = (void *)((a4 >> 3) & 1);
    if ((a4 & 0x1000) != 0) {
LABEL_10:
    }
      [(PXCMMProgressBannerView *)self _updateProgress];
  }
  if (v11) {
    [(PXCMMProgressBannerView *)self _updateActivityTitle];
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
}

- (void)_updateProgress
{
  [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation activityProgress];
  if (*(float *)&v3 == -1.0)
  {
    uint64_t v4 = +[PXCompleteMyMomentSettings sharedInstance];
    if ([v4 showProgressBannerView])
    {
      int v5 = +[PXCompleteMyMomentSettings sharedInstance];
      int v6 = [v5 showProgressBannerViewPaused];

      LODWORD(v3) = 0.5;
      if (v6) {
        *(float *)&double v3 = -1.0;
      }
    }
    else
    {

      LODWORD(v3) = -1.0;
    }
  }
  progressView = self->_progressView;
  [(UIProgressView *)progressView setProgress:v3];
}

- (void)_updatePauseTitle
{
  uint64_t v8 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation pauseTitle];
  if (![(__CFString *)v8 length])
  {
    double v3 = +[PXCompleteMyMomentSettings sharedInstance];
    if ([v3 showProgressBannerView])
    {
      uint64_t v4 = +[PXCompleteMyMomentSettings sharedInstance];
      int v5 = [v4 showProgressBannerViewPaused];

      if (!v5) {
        goto LABEL_6;
      }
      double v3 = v8;
      uint64_t v8 = @"<debug pause status>";
    }
  }
LABEL_6:
  int v6 = [(UILabel *)self->_pauseLabel text];
  int v7 = [v6 length] == 0;

  LODWORD(v6) = [(__CFString *)v8 length] == 0;
  [(UILabel *)self->_pauseLabel setText:v8];
  if (v7 != v6) {
    [(PXCMMProgressBannerView *)self setNeedsLayout];
  }
}

- (void)_updateActivityTitle
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation activityTitle];
  if (![v2 length])
  {
    double v3 = +[PXCompleteMyMomentSettings sharedInstance];
    int v4 = [v3 showProgressBannerView];

    if (v4) {
  }
    }
  _ActivityTitleAttributes();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMProgressBannerView;
  [(PXCMMProgressBannerView *)&v4 layoutSubviews];
  [(PXCMMProgressBannerView *)self bounds];
  [(PXCMMProgressBannerView *)self _performLayoutInWidth:1 updateSubviewFrames:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXCMMProgressBannerView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (PXCMMProgressBannerView)initWithMomentShareStatusPresentation:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCMMProgressBannerView.m", 54, @"Invalid parameter not satisfying: %@", @"momentShareStatusPresentation" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXCMMProgressBannerView;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v11 = -[PXCMMProgressBannerView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  p_isa = (id *)&v11->super.super.super.isa;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_momentShareStatusPresentation, a3);
    [p_isa[51] registerChangeObserver:p_isa context:PXMomentShareStatusPresentationObservationContext_155482];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1F00]), "initWithFrame:", v7, v8, v9, v10);
    id v14 = p_isa[52];
    p_isa[52] = (id)v13;

    [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    [p_isa[52] setEffect:objc_claimAutoreleasedReturnValue()];
    [p_isa[52] setAutoresizingMask:18];
    [p_isa addSubview:p_isa[52]];
    objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", v7, v8, v9, v10);
    _ActivityTitleAttributes();
  }

  return 0;
}

- (PXCMMProgressBannerView)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMProgressBannerView.m", 50, @"%s is not available as initializer", "-[PXCMMProgressBannerView initWithCoder:]");

  abort();
}

- (PXCMMProgressBannerView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMProgressBannerView.m", 46, @"%s is not available as initializer", "-[PXCMMProgressBannerView initWithFrame:]");

  abort();
}

- (PXCMMProgressBannerView)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMProgressBannerView.m", 42, @"%s is not available as initializer", "-[PXCMMProgressBannerView init]");

  abort();
}

@end