@interface PXCMMTranscriptBubbleStatusView
- (BOOL)showsActivityIndicator;
- (CGSize)_performLayoutInSize:(CGSize)a3 minimizingSize:(BOOL)a4 updateSubviewFrames:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)statusDescription;
- (NSString)statusTitle;
- (PXCMMSpec)spec;
- (PXCMMTranscriptBubbleStatusView)initWithCoder:(id)a3;
- (PXCMMTranscriptBubbleStatusView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)bubbleSafeAreaInsets;
- (void)_updateActivityIndicator;
- (void)_updateRoundedCornerOverlayView;
- (void)layoutSubviews;
- (void)setBubbleSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setShowsActivityIndicator:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setStatusDescription:(id)a3;
- (void)setStatusTitle:(id)a3;
@end

@implementation PXCMMTranscriptBubbleStatusView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlay, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (void)setBubbleSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_bubbleSafeAreaInsets = a3;
}

- (UIEdgeInsets)bubbleSafeAreaInsets
{
  double top = self->_bubbleSafeAreaInsets.top;
  double left = self->_bubbleSafeAreaInsets.left;
  double bottom = self->_bubbleSafeAreaInsets.bottom;
  double right = self->_bubbleSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXCMMSpec)spec
{
  return self->_spec;
}

- (void)_updateRoundedCornerOverlayView
{
  roundedCornerOverlay = self->_roundedCornerOverlay;
  if (!roundedCornerOverlay)
  {
    v4 = objc_alloc_init(PXRoundedCornerOverlayView);
    v5 = self->_roundedCornerOverlay;
    self->_roundedCornerOverlay = v4;

    [(PXCMMTranscriptBubbleStatusView *)self addSubview:self->_roundedCornerOverlay];
    roundedCornerOverlay = self->_roundedCornerOverlay;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXCMMTranscriptBubbleStatusView__updateRoundedCornerOverlayView__block_invoke;
  v6[3] = &unk_1E5DBAB68;
  v6[4] = self;
  [(PXRoundedCornerOverlayView *)roundedCornerOverlay performChanges:v6];
}

void __66__PXCMMTranscriptBubbleStatusView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 456);
  id v5 = a2;
  v4 = [v3 bubbleBackgroundColor];
  [v5 setOverlayColor:v4];

  [*(id *)(*(void *)(a1 + 32) + 456) bubbleStatusIconCornerRadius];
  objc_msgSend(v5, "setCornerRadius:");
  [*(id *)(*(void *)(a1 + 32) + 456) displayScale];
  objc_msgSend(v5, "setDisplayScale:");
}

- (void)_updateActivityIndicator
{
  if (!self->_activityIndicator
    && [(PXCMMTranscriptBubbleStatusView *)self showsActivityIndicator])
  {
    v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(PXCMMTranscriptBubbleStatusView *)self addSubview:self->_activityIndicator];
  }
  if ([(PXCMMTranscriptBubbleStatusView *)self showsActivityIndicator]
    && ![(UIActivityIndicatorView *)self->_activityIndicator isAnimating])
  {
    v6 = self->_activityIndicator;
    [(UIActivityIndicatorView *)v6 startAnimating];
  }
  else if (![(PXCMMTranscriptBubbleStatusView *)self showsActivityIndicator] {
         && [(UIActivityIndicatorView *)self->_activityIndicator isAnimating])
  }
  {
    id v5 = self->_activityIndicator;
    [(UIActivityIndicatorView *)v5 stopAnimating];
  }
}

- (CGSize)_performLayoutInSize:(CGSize)a3 minimizingSize:(BOOL)a4 updateSubviewFrames:(BOOL)a5
{
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMTranscriptBubbleStatusView;
  [(PXCMMTranscriptBubbleStatusView *)&v5 layoutSubviews];
  [(PXCMMTranscriptBubbleStatusView *)self bounds];
  -[PXCMMTranscriptBubbleStatusView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 1, 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[PXCMMTranscriptBubbleStatusView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 0, 0, a3.width, a3.height);
  double v6 = v5;
  spec = self->_spec;
  if (spec)
  {
    [(PXFeatureSpec *)spec displayScale];
    double v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v9 = v11;
  }
  +[PXCMMSpec maxBubbleWidthForDisplayScale:v9];
  double v13 = fmin(width, v12);
  double v14 = v6;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  if (self->_showsActivityIndicator != a3)
  {
    self->_showsActivityIndicator = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateActivityIndicator];
  }
}

- (NSString)statusDescription
{
  return [(PXCMMTranscriptTextView *)self->_textView secondaryText];
}

- (void)setStatusDescription:(id)a3
{
}

- (NSString)statusTitle
{
  return [(PXCMMTranscriptTextView *)self->_textView primaryText];
}

- (void)setStatusTitle:(id)a3
{
}

- (void)setSpec:(id)a3
{
  double v5 = (PXCMMSpec *)a3;
  if (self->_spec != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    double v6 = [(PXCMMTranscriptBubbleStatusView *)self spec];
    v7 = [v6 bubbleBackgroundColor];
    [(PXCMMTranscriptBubbleStatusView *)self setBackgroundColor:v7];

    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateRoundedCornerOverlayView];
    double v5 = v8;
  }
}

- (PXCMMTranscriptBubbleStatusView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXCMMTranscriptBubbleStatusView;
  double v3 = -[PXCMMTranscriptBubbleStatusView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel_setNeedsLayout];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateActivityIndicator needsUpdate:0];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateRoundedCornerOverlayView needsUpdate:1];
    double v6 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXMessagesPlaceholderIcon");
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v7;

    [(UIImageView *)v3->_iconImageView setClipsToBounds:1];
    [(UIImageView *)v3->_iconImageView setContentMode:1];
    [(PXCMMTranscriptBubbleStatusView *)v3 addSubview:v3->_iconImageView];
    double v9 = [PXCMMTranscriptTextView alloc];
    uint64_t v10 = -[PXCMMTranscriptTextView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v3->_textView;
    v3->_textView = (PXCMMTranscriptTextView *)v10;

    [(PXCMMTranscriptBubbleStatusView *)v3 addSubview:v3->_textView];
  }
  return v3;
}

- (PXCMMTranscriptBubbleStatusView)initWithCoder:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMTranscriptBubbleStatusView.m", 38, @"%s is not available as initializer", "-[PXCMMTranscriptBubbleStatusView initWithCoder:]");

  abort();
}

@end