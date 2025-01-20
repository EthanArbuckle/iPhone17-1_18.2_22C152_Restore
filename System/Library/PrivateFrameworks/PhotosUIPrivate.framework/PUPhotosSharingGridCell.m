@interface PUPhotosSharingGridCell
- (PUPhotoView)photoView;
- (PUPhotosSharingGridCell)initWithFrame:(CGRect)a3;
- (int64_t)currentImageRequestID;
- (void)_updateHighlight;
- (void)_updateSubviewOrdering;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCurrentImageRequestID:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PUPhotosSharingGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingCellSuperview, 0);
  objc_storeStrong((id *)&self->_zoomingCell, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
}

- (void)setCurrentImageRequestID:(int64_t)a3
{
  self->_currentImageRequestID = a3;
}

- (int64_t)currentImageRequestID
{
  return self->_currentImageRequestID;
}

- (PUPhotoView)photoView
{
  return self->_photoView;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUPhotosSharingGridCell *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosSharingGridCell;
  [(PUPhotosSharingGridCell *)&v6 setHighlighted:v3];
  if (v5 != [(PUPhotosSharingGridCell *)self isHighlighted]) {
    [(PUPhotosSharingGridCell *)self _updateHighlight];
  }
}

- (void)layoutSubviews
{
  [(PUPhotosSharingGridCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(PUPhotosSharingGridCell *)self photoView];
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = (v4 - v9) * 0.5;
  double v13 = (v6 - v11) * 0.5;
  -[PUPhotoView setFrame:](self->_photoView, "setFrame:", v12, v13, v9, v11);
  highlightOverlayView = self->_highlightOverlayView;
  -[UIView setFrame:](highlightOverlayView, "setFrame:", v12, v13, v9, v11);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosSharingGridCell;
  [(PUPhotosSharingGridCell *)&v5 prepareForReuse];
  double v3 = [(PUPhotosSharingGridCell *)self photoView];
  double v4 = [v3 contentHelper];

  [v4 setPhotoImage:0];
  [v4 setPlaceHolderImage:0];
  [v4 setLivePhoto:0];
  [v4 setLoopingVideoAsset:0];
  [(PUPhotosSharingGridCell *)self setCurrentImageRequestID:0];
}

- (void)_updateSubviewOrdering
{
}

- (void)_updateHighlight
{
  if (([(PUPhotosSharingGridCell *)self isHighlighted] & 1) == 0
    || ([(PUPhotoView *)self->_photoView contentHelper],
        double v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 providesVisualFeedbackOnPress],
        v3,
        (v4 & 1) != 0))
  {
    uint64_t v10 = 1;
  }
  else
  {
    if (!self->_highlightOverlayView)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PUPhotosSharingGridCell *)self bounds];
      double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      highlightOverlayView = self->_highlightOverlayView;
      self->_highlightOverlayView = v6;

      [(UIView *)self->_highlightOverlayView setUserInteractionEnabled:0];
      double v8 = self->_highlightOverlayView;
      double v9 = [MEMORY[0x1E4FB1618] labelColor];
      [(UIView *)v8 setBackgroundColor:v9];

      [(UIView *)self->_highlightOverlayView setAlpha:0.5];
      [(PUPhotosSharingGridCell *)self addSubview:self->_highlightOverlayView];
    }
    uint64_t v10 = 0;
  }
  [(UIView *)self->_highlightOverlayView setHidden:v10];
  [(PUPhotosSharingGridCell *)self _updateSubviewOrdering];
  [(PUPhotosSharingGridCell *)self setNeedsLayout];
}

- (PUPhotosSharingGridCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PUPhotosSharingGridCell;
  double v3 = -[PUPhotosSharingGridCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3)
  {
    id v5 = [(PUPhotosSharingGridCell *)v3 contentView];
    [v5 bounds];
    uint64_t v10 = -[PUPhotoView initWithFrame:]([PUPhotoView alloc], "initWithFrame:", v6, v7, v8, v9);
    photoView = v4->_photoView;
    v4->_photoView = v10;

    double v12 = [(PUPhotoView *)v4->_photoView contentHelper];
    [v12 setFillMode:1];

    [v5 addSubview:v4->_photoView];
  }
  return v4;
}

@end