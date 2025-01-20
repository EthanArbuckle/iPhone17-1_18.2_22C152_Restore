@interface PUPhotosGridCell
+ (Class)_contentViewClass;
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)isCloudIconVisible;
- (BOOL)isDraggable;
- (BOOL)isSelectionBadgeVisible;
- (BOOL)transitionFillerViewEnabled;
- (BOOL)transitionIsAppearing;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSNumber)progress;
- (PUPhotoView)photoContentView;
- (PUPhotoView)temporaryPhotoContentView;
- (PUPhotosGridCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)fillerEdgeInsets;
- (UIView)transitionFillerView;
- (int)currentImageRequestID;
- (int64_t)dragState;
- (void)_layoutTransitionFillerView;
- (void)_updateCloudIcon;
- (void)_updateContentViewClipsToBounds;
- (void)_updateHighlight;
- (void)_updateProgressImmediately:(BOOL)a3;
- (void)_updateSelectionBadge;
- (void)_updateSubviewOrdering;
- (void)addTemporaryPhotoContentView;
- (void)applyLayoutAttributes:(id)a3;
- (void)dragStateDidChange:(int64_t)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeTemporaryPhotoContentView;
- (void)setCloudIconVisible:(BOOL)a3;
- (void)setCurrentImageRequestID:(int)a3;
- (void)setDragState:(int64_t)a3;
- (void)setDraggable:(BOOL)a3;
- (void)setFillerEdgeInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPhotoContentView:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgress:(id)a3 immediately:(BOOL)a4;
- (void)setSelectionBadgeVisible:(BOOL)a3;
- (void)setTemporaryPhotoContentView:(id)a3;
- (void)setTemporaryPhotoImage:(id)a3 with:(int64_t)a4;
- (void)setTransitionFillerViewEnabled:(BOOL)a3;
- (void)setTransitionIsAppearing:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation PUPhotosGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryPhotoContentView, 0);
  objc_storeStrong((id *)&self->_photoContentView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_transitionFillerView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorViewConstraints, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_cloudIconImageView, 0);
  objc_storeStrong((id *)&self->_selectionBadgeView, 0);
  objc_storeStrong((id *)&self->_selectionOverlayView, 0);
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void)setCurrentImageRequestID:(int)a3
{
  self->_currentImageRequestID = a3;
}

- (int)currentImageRequestID
{
  return self->_currentImageRequestID;
}

- (void)setTransitionIsAppearing:(BOOL)a3
{
  self->_transitionIsAppearing = a3;
}

- (BOOL)transitionIsAppearing
{
  return self->_transitionIsAppearing;
}

- (UIEdgeInsets)fillerEdgeInsets
{
  double top = self->_fillerEdgeInsets.top;
  double left = self->_fillerEdgeInsets.left;
  double bottom = self->_fillerEdgeInsets.bottom;
  double right = self->_fillerEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)transitionFillerViewEnabled
{
  return self->_transitionFillerViewEnabled;
}

- (void)setTemporaryPhotoContentView:(id)a3
{
}

- (PUPhotoView)temporaryPhotoContentView
{
  return self->_temporaryPhotoContentView;
}

- (void)setPhotoContentView:(id)a3
{
}

- (PUPhotoView)photoContentView
{
  return self->_photoContentView;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (BOOL)isCloudIconVisible
{
  return self->_cloudIconVisible;
}

- (BOOL)isSelectionBadgeVisible
{
  return self->_selectionBadgeVisible;
}

- (void)setDraggable:(BOOL)a3
{
  self->_draggable = a3;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (UIView)transitionFillerView
{
  return self->_transitionFillerView;
}

- (void)setProgress:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (NSNumber *)a3;
  if (self->_progress != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_progress, a3);
    [(PUPhotosGridCell *)self _updateProgressImmediately:v4];
    v7 = v8;
  }
}

- (void)setProgress:(id)a3
{
}

- (void)dragStateDidChange:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosGridCell;
  -[PUPhotosGridCell dragStateDidChange:](&v5, sel_dragStateDidChange_);
  if ([(PUPhotosGridCell *)self dragState] != a3)
  {
    [(PUPhotosGridCell *)self setDragState:a3];
    [(PUPhotosGridCell *)self _updateSelectionBadge];
  }
}

- (void)setCloudIconVisible:(BOOL)a3
{
  if (self->_cloudIconVisible != a3)
  {
    self->_cloudIconVisible = a3;
    [(PUPhotosGridCell *)self _updateCloudIcon];
  }
}

- (void)setSelectionBadgeVisible:(BOOL)a3
{
  if (self->_selectionBadgeVisible != a3)
  {
    self->_selectionBadgeVisible = a3;
    [(PUPhotosGridCell *)self _updateSelectionBadge];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotosGridCell *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotosGridCell;
    [(PUPhotosGridCell *)&v5 setHighlighted:v3];
    [(PUPhotosGridCell *)self _updateHighlight];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotosGridCell;
  [(PUPhotosGridCell *)&v3 prepareForReuse];
  [(PUPhotosGridCell *)self removeTemporaryPhotoContentView];
  [(PUPhotosGridCell *)self setSelectionBadgeVisible:0];
  [(PUPhotosGridCell *)self setHighlighted:0];
  [(PUPhotosGridCell *)self setCloudIconVisible:0];
  [(PUPhotosGridCell *)self setDraggable:0];
  [(PUPhotosGridCell *)self setProgress:0 immediately:1];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 interactiveTransitionProgress];
    if (v4 >= 0.0)
    {
      BOOL v5 = [(PUPhotosGridCell *)self transitionIsAppearing];
      [v13 interactiveTransitionProgress];
      double v7 = fmin(v6, 1.0);
      v8 = [(PUPhotosGridCell *)self transitionFillerView];
      v9 = v8;
      if (v8)
      {
        double v10 = 1.0 - v7;
        if (v5) {
          double v10 = v7;
        }
        [v8 setAlpha:v10];
      }
      temporaryPhotoContentView = self->_temporaryPhotoContentView;
      if (temporaryPhotoContentView)
      {
        double v12 = 1.0 - v7;
        if (!v5) {
          double v12 = v7;
        }
        [(PUPhotoView *)temporaryPhotoContentView setAlpha:v12];
      }
    }
  }
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v5 = [(PUPhotosGridCell *)self photoContentView];
  double v6 = [v5 contentHelper];
  objc_msgSend(v6, "contentViewSizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)updateConstraints
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridCell;
  [(PUPhotosGridCell *)&v7 updateConstraints];
  if (self->_progressIndicatorView)
  {
    if (!self->_progressIndicatorViewConstraints)
    {
      objc_super v3 = [MEMORY[0x1E4F1CA48] array];
      double v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_progressIndicatorView attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [(NSArray *)v3 addObject:v4];

      BOOL v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_progressIndicatorView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
      [(NSArray *)v3 addObject:v5];

      [(PUPhotosGridCell *)self addConstraints:v3];
      progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
      self->_progressIndicatorViewConstraints = v3;
    }
  }
}

- (void)_layoutTransitionFillerView
{
  if (self->_transitionFillerView)
  {
    objc_super v3 = [(PUPhotosGridCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    -[UIView setFrame:](self->_transitionFillerView, "setFrame:", v5 + self->_fillerEdgeInsets.left, v7 + self->_fillerEdgeInsets.top, v9 - (self->_fillerEdgeInsets.left + self->_fillerEdgeInsets.right), v11 - (self->_fillerEdgeInsets.top + self->_fillerEdgeInsets.bottom));
    CGFloat v12 = (self->_fillerEdgeInsets.right - self->_fillerEdgeInsets.left) * 0.5;
    CGFloat v13 = (self->_fillerEdgeInsets.bottom - self->_fillerEdgeInsets.top) * 0.5;
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&v16, v12, v13);
    v14 = [(UIView *)self->_transitionFillerView layer];
    CGAffineTransform v15 = v16;
    [v14 setContentsTransform:&v15];
  }
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)PUPhotosGridCell;
  [(PUPhotosGridCell *)&v34 layoutSubviews];
  [(PUPhotosGridCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PUPhotosGridCell *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PUPhotoView setFrame:](self->_temporaryPhotoContentView, "setFrame:", v4, v6, v8, v10);
  CGFloat v12 = [(PUPhotosGridCell *)self photoContentView];
  CGFloat v13 = [v12 contentHelper];
  [v13 imageContentFrame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  -[UIView setFrame:](self->_highlightOverlayView, "setFrame:", v15, v17, v19, v21);
  -[UIView setFrame:](self->_selectionOverlayView, "setFrame:", v15, v17, v19, v21);
  [(UIView *)self->_selectionBadgeView bounds];
  double v23 = v22;
  double v25 = v24;
  v35.origin.x = v15;
  v35.origin.y = v17;
  v35.size.double width = v19;
  v35.size.double height = v21;
  CGFloat v26 = CGRectGetMaxX(v35) - v23 + -3.5;
  v36.origin.x = v15;
  v36.origin.y = v17;
  v36.size.double width = v19;
  v36.size.double height = v21;
  -[UIView setFrame:](self->_selectionBadgeView, "setFrame:", v26, CGRectGetMaxY(v36) - v25 + -3.5, v23, v25);
  [(UIImageView *)self->_cloudIconImageView bounds];
  double v28 = v27;
  double v30 = v29;
  v37.origin.x = v15;
  v37.origin.y = v17;
  v37.size.double width = v19;
  v37.size.double height = v21;
  CGFloat v31 = CGRectGetMaxX(v37) - v28 + -8.0;
  v38.origin.x = v15;
  v38.origin.y = v17;
  v38.size.double width = v19;
  v38.size.double height = v21;
  -[UIImageView setFrame:](self->_cloudIconImageView, "setFrame:", v31, CGRectGetMaxY(v38) - v30 + -5.0, v28, v30);
  v32 = [(PUPhotosGridCell *)self photoContentView];
  v33 = [v32 contentHelper];
  [v33 layoutSubviewsOfContentView];

  [(PUPhotosGridCell *)self _layoutTransitionFillerView];
}

- (void)_updateContentViewClipsToBounds
{
  transitionFillerView = self->_transitionFillerView;
  if ([(PUPhotosGridCell *)self clipsToBounds] != (transitionFillerView == 0))
  {
    [(PUPhotosGridCell *)self setClipsToBounds:transitionFillerView == 0];
  }
}

- (void)_updateSubviewOrdering
{
  [(PUPhotosGridCell *)self sendSubviewToBack:self->_transitionFillerView];
  [(PUPhotosGridCell *)self bringSubviewToFront:self->_selectionOverlayView];
  [(PUPhotosGridCell *)self bringSubviewToFront:self->_selectionBadgeView];
  [(PUPhotosGridCell *)self bringSubviewToFront:self->_cloudIconImageView];
  [(PUPhotosGridCell *)self bringSubviewToFront:self->_progressIndicatorView];
  [(PUPhotosGridCell *)self bringSubviewToFront:self->_highlightOverlayView];
  temporaryPhotoContentView = self->_temporaryPhotoContentView;
  [(PUPhotosGridCell *)self bringSubviewToFront:temporaryPhotoContentView];
}

- (void)_updateProgressImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  progress = self->_progress;
  progressIndicatorView = self->_progressIndicatorView;
  if (!progress)
  {
    if (!progressIndicatorView) {
      return;
    }
    double v9 = progressIndicatorView;
    double v10 = self->_progressIndicatorView;
    self->_progressIndicatorView = 0;

    progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
    self->_progressIndicatorViewConstraints = 0;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__PUPhotosGridCell__updateProgressImmediately___block_invoke;
    v15[3] = &unk_1E5F2ED10;
    double v16 = v9;
    CGFloat v12 = v9;
    [(PUProgressIndicatorView *)v12 endShowingProgressImmediately:v3 animated:v3 ^ 1 withCompletionHandler:v15];

LABEL_6:
    progressIndicatorView = self->_progressIndicatorView;
    if (!progressIndicatorView) {
      return;
    }
    goto LABEL_7;
  }
  if (!progressIndicatorView)
  {
    double v7 = [[PUProgressIndicatorView alloc] initWithStyle:1];
    double v8 = self->_progressIndicatorView;
    self->_progressIndicatorView = v7;

    [(PUProgressIndicatorView *)self->_progressIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUProgressIndicatorView *)self->_progressIndicatorView beginShowingProgressImmediately:v3 animated:v3 ^ 1];
    [(PUPhotosGridCell *)self addSubview:self->_progressIndicatorView];
    [(PUPhotosGridCell *)self _updateSubviewOrdering];
    [(PUPhotosGridCell *)self setNeedsUpdateConstraints];
    goto LABEL_6;
  }
LABEL_7:
  [(PUProgressIndicatorView *)progressIndicatorView setDeterminate:1];
  CGFloat v13 = self->_progressIndicatorView;
  [(NSNumber *)self->_progress floatValue];
  [(PUProgressIndicatorView *)v13 setCurrentProgress:v14];
}

uint64_t __47__PUPhotosGridCell__updateProgressImmediately___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateCloudIcon
{
  if (![(PUPhotosGridCell *)self isCloudIconVisible]
    || [(PUPhotosGridCell *)self isSelectionBadgeVisible])
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (!self->_cloudIconImageView)
    {
      BOOL v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"Thumbnail_Loading.png");
      double v4 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v3];
      cloudIconImageView = self->_cloudIconImageView;
      self->_cloudIconImageView = v4;

      [v3 size];
      PXRectWithOriginAndSize();
      -[UIImageView setFrame:](self->_cloudIconImageView, "setFrame:");
      [(UIImageView *)self->_cloudIconImageView setUserInteractionEnabled:0];
      [(PUPhotosGridCell *)self addSubview:self->_cloudIconImageView];
      [(PUPhotosGridCell *)self _updateSubviewOrdering];
    }
    uint64_t v6 = 0;
  }
  [(UIImageView *)self->_cloudIconImageView setHidden:v6];
  [(PUPhotosGridCell *)self setNeedsLayout];
}

- (void)_updateSelectionBadge
{
  if ([(PUPhotosGridCell *)self isSelectionBadgeVisible]
    && [(PUPhotosGridCell *)self dragState] != 1)
  {
    selectionOverlayView = self->_selectionOverlayView;
    BOOL v3 = selectionOverlayView == 0;
    if (!selectionOverlayView)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PUPhotosGridCell *)self bounds];
      double v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
      double v10 = self->_selectionOverlayView;
      self->_selectionOverlayView = v9;

      [(UIView *)self->_selectionOverlayView setUserInteractionEnabled:0];
      double v11 = self->_selectionOverlayView;
      CGFloat v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(UIView *)v11 setBackgroundColor:v12];

      [(UIView *)self->_selectionOverlayView setAlpha:0.25];
      [(PUPhotosGridCell *)self addSubview:self->_selectionOverlayView];
    }
    if (self->_selectionBadgeView)
    {
      uint64_t v4 = 0;
    }
    else
    {
      CGFloat v13 = (void *)MEMORY[0x1E4FB1EB0];
      float v14 = [MEMORY[0x1E4FB1618] systemBlueColor];
      objc_msgSend(v13, "px_circularGlyphViewWithName:backgroundColor:", @"checkmark.circle", v14);
      double v15 = (UIView *)objc_claimAutoreleasedReturnValue();
      selectionBadgeView = self->_selectionBadgeView;
      self->_selectionBadgeView = v15;

      [(UIView *)self->_selectionBadgeView setUserInteractionEnabled:0];
      [(PUPhotosGridCell *)self addSubview:self->_selectionBadgeView];
      uint64_t v4 = 0;
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
    uint64_t v4 = 1;
  }
  double v5 = [MEMORY[0x1E4F90268] sharedInstance];
  int v6 = [v5 disableSelectionOverlayView];

  [(UIView *)self->_selectionOverlayView setHidden:v4 | v6];
  [(UIView *)self->_selectionBadgeView setHidden:v4];
  [(PUPhotosGridCell *)self _updateCloudIcon];
  if (v3) {
    [(PUPhotosGridCell *)self _updateSubviewOrdering];
  }
  [(PUPhotosGridCell *)self setNeedsLayout];
}

- (void)_updateHighlight
{
  if ([(PUPhotosGridCell *)self isHighlighted]
    && ![(PUPhotosGridCell *)self isDraggable])
  {
    highlightOverlayView = self->_highlightOverlayView;
    if (!highlightOverlayView)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PUPhotosGridCell *)self bounds];
      double v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      int v6 = self->_highlightOverlayView;
      self->_highlightOverlayView = v5;

      [(UIView *)self->_highlightOverlayView setUserInteractionEnabled:0];
      double v7 = self->_highlightOverlayView;
      id v8 = [MEMORY[0x1E4FB1618] labelColor];
      [(UIView *)v7 setBackgroundColor:v8];

      [(UIView *)self->_highlightOverlayView setAlpha:0.5];
      [(PUPhotosGridCell *)self addSubview:self->_highlightOverlayView];
      highlightOverlayView = self->_highlightOverlayView;
    }
    [(UIView *)highlightOverlayView setHidden:0];
    [(PUPhotosGridCell *)self _updateSubviewOrdering];
  }
  else
  {
    [(UIView *)self->_highlightOverlayView setHidden:1];
  }
  [(PUPhotosGridCell *)self setNeedsLayout];
}

- (void)setFillerEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_fillerEdgeInsets.left != a3.left
    || self->_fillerEdgeInsets.top != a3.top
    || self->_fillerEdgeInsets.right != a3.right
    || self->_fillerEdgeInsets.bottom != a3.bottom)
  {
    self->_fillerEdgeInsets = a3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__PUPhotosGridCell_setFillerEdgeInsets___block_invoke;
    v6[3] = &unk_1E5F2ED10;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
  }
}

uint64_t __40__PUPhotosGridCell_setFillerEdgeInsets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTransitionFillerView];
}

- (void)setTransitionFillerViewEnabled:(BOOL)a3
{
  if (self->_transitionFillerViewEnabled != a3)
  {
    self->_transitionFillerViewEnabled = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      double v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      transitionFillerView = self->_transitionFillerView;
      self->_transitionFillerView = v5;

      [(PUPhotosGridCell *)self addSubview:self->_transitionFillerView];
      [(PUPhotosGridCell *)self setNeedsLayout];
      [(PUPhotosGridCell *)self _updateSubviewOrdering];
      double v7 = +[PUInterfaceManager currentTheme];
      id v8 = self->_transitionFillerView;
      double v9 = [v7 photoCollectionViewBackgroundColor];
      [(UIView *)v8 setBackgroundColor:v9];

      [(UIView *)self->_transitionFillerView setOpaque:1];
    }
    else
    {
      [(UIView *)self->_transitionFillerView removeFromSuperview];
      double v7 = self->_transitionFillerView;
      self->_transitionFillerView = 0;
    }

    [(PUPhotosGridCell *)self _updateContentViewClipsToBounds];
  }
}

- (void)setTemporaryPhotoImage:(id)a3 with:(int64_t)a4
{
  temporaryPhotoContentView = self->_temporaryPhotoContentView;
  id v7 = a3;
  id v8 = [(PUPhotoView *)temporaryPhotoContentView contentHelper];
  [v8 setPhotoImage:v7];

  double v9 = [(PUPhotoView *)self->_temporaryPhotoContentView contentHelper];
  double v10 = [(PUPhotosGridCell *)self photoContentView];
  double v11 = [v10 contentHelper];
  [v11 photoSize];
  objc_msgSend(v9, "setPhotoSize:");

  id v12 = [(PUPhotoView *)self->_temporaryPhotoContentView contentHelper];
  [v12 setFillMode:a4];
}

- (void)removeTemporaryPhotoContentView
{
  [(PUPhotoView *)self->_temporaryPhotoContentView removeFromSuperview];
  temporaryPhotoContentView = self->_temporaryPhotoContentView;
  self->_temporaryPhotoContentView = 0;
}

- (void)addTemporaryPhotoContentView
{
  if (!self->_temporaryPhotoContentView)
  {
    BOOL v3 = [PUPhotoView alloc];
    id v4 = [(PUPhotosGridCell *)self contentView];
    [v4 bounds];
    double v5 = -[PUPhotoView initWithFrame:](v3, "initWithFrame:");
    temporaryPhotoContentView = self->_temporaryPhotoContentView;
    self->_temporaryPhotoContentView = v5;

    id v7 = [(PUPhotoView *)self->_temporaryPhotoContentView contentHelper];
    [v7 setAvoidsImageViewIfPossible:1];

    [(PUPhotoView *)self->_temporaryPhotoContentView setAlpha:0.0];
    id v8 = [(PUPhotoView *)self->_temporaryPhotoContentView layer];
    [v8 setAllowsGroupOpacity:0];

    [(PUPhotosGridCell *)self addSubview:self->_temporaryPhotoContentView];
    [(PUPhotosGridCell *)self _updateSubviewOrdering];
  }
}

- (PUPhotosGridCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridCell;
  id v4 = -[PUPhotosGridCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  if (v4)
  {
    int v6 = [(PUPhotosGridCell *)v4 contentView];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v5, @"PUPhotosGridCell.m", 63, @"The content view must be a PUPhotoView: %@", v6 object file lineNumber description];
    }
    [(PUPhotosGridCell *)v5 setPhotoContentView:v6];
    id v7 = [(PUPhotosGridCell *)v5 layer];
    [v7 setAllowsGroupOpacity:0];
  }
  return v5;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end