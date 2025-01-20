@interface PUImportOneUpScrubberCell
+ (id)emptyThumbnailBackgroundColor;
- (BOOL)needsBadgeUpdate;
- (BOOL)selectable;
- (PUImportOneUpScrubberCell)initWithCoder:(id)a3;
- (PUImportOneUpScrubberCell)initWithFrame:(CGRect)a3;
- (PUImportOneUpScrubberCellDisplayDelegate)displayDelegate;
- (PXImportItemViewModel)importItem;
- (UIActivityIndicatorView)spinner;
- (int64_t)badgeType;
- (int64_t)thumbnailRequestID;
- (void)_commonPUImportOneUpScrubberCellInitialization;
- (void)_createSpinnerIfNecessary;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)refreshThumbnail;
- (void)setBadgeType:(int64_t)a3;
- (void)setDisplayDelegate:(id)a3;
- (void)setImportItem:(id)a3;
- (void)setNeedsBadgeUpdate:(BOOL)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setThumbnailRequestID:(int64_t)a3;
- (void)updateBadgeUIIfNeeded;
- (void)updateToThumbnail:(id)a3;
@end

@implementation PUImportOneUpScrubberCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_importItem, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
}

- (void)setThumbnailRequestID:(int64_t)a3
{
  self->_thumbnailRequestID = a3;
}

- (int64_t)thumbnailRequestID
{
  return self->_thumbnailRequestID;
}

- (void)setNeedsBadgeUpdate:(BOOL)a3
{
  self->_needsBadgeUpdate = a3;
}

- (BOOL)needsBadgeUpdate
{
  return self->_needsBadgeUpdate;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (PXImportItemViewModel)importItem
{
  return self->_importItem;
}

- (void)setDisplayDelegate:(id)a3
{
}

- (PUImportOneUpScrubberCellDisplayDelegate)displayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);
  return (PUImportOneUpScrubberCellDisplayDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUImportOneUpScrubberCell.m" lineNumber:203 description:@"Expecting main thread only for cell signals"];
  }
  if ((void *)PXImportItemViewModelOneUpScrubberCellContext == a5)
  {
    if ((v6 & 4) != 0)
    {
      v9 = [(PUImportOneUpScrubberCell *)self importItem];
      -[PUImportOneUpScrubberCell setSelectable:](self, "setSelectable:", [v9 isSelectable]);
    }
    BOOL v10 = (v6 & 5) != 0;
    if ((v6 & 8) != 0)
    {
      v11 = [(PUImportOneUpScrubberCell *)self importItem];
      int v12 = [v11 isDuplicate];

      if ((v6 & 5) != 0) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v12;
      }
    }
    if ((v6 & 0x12) != 0 || v10)
    {
      v13 = [(PUImportOneUpScrubberCell *)self importItem];
      -[PUImportOneUpScrubberCell setBadgeType:](self, "setBadgeType:", [v13 badgeType]);

      [(PUImportOneUpScrubberCell *)self updateBadgeUIIfNeeded];
    }
  }
}

- (void)_createSpinnerIfNecessary
{
  if (!self->_spinner)
  {
    v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v3;

    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIActivityIndicatorView *)self->_spinner setColor:v5];

    [(UIActivityIndicatorView *)self->_spinner sizeToFit];
    char v6 = self->_spinner;
    v7 = [(PUReviewScrubberCell *)self _checkmarkImageView];
    [(PUImportOneUpScrubberCell *)self insertSubview:v6 aboveSubview:v7];

    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11.c = v8;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v12, &v11, 0.5, 0.5);
    v9 = self->_spinner;
    CGAffineTransform v10 = v12;
    [(UIActivityIndicatorView *)v9 setTransform:&v10];
  }
}

- (void)updateToThumbnail:(id)a3
{
  -[PUReviewScrubberCell setImage:](self, "setImage:");
  if (a3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v6 = +[PUImportOneUpScrubberCell emptyThumbnailBackgroundColor];
  }
  v5 = [(PUReviewScrubberCell *)self _thumbnailImageView];
  [v5 setBackgroundColor:v6];
}

- (void)refreshThumbnail
{
  v4 = [(PUImportOneUpScrubberCell *)self displayDelegate];

  if (!v4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUImportOneUpScrubberCell.m" lineNumber:159 description:@"Missing thumbnail provider"];
  }
  v5 = [(PUImportOneUpScrubberCell *)self importItem];
  objc_initWeak(&location, self);
  id v6 = [(PUImportOneUpScrubberCell *)self displayDelegate];
  v7 = [(PUImportOneUpScrubberCell *)self importItem];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PUImportOneUpScrubberCell_refreshThumbnail__block_invoke;
  v10[3] = &unk_1E5F25D10;
  objc_copyWeak(&v12, &location);
  id v8 = v5;
  id v11 = v8;
  -[PUImportOneUpScrubberCell setThumbnailRequestID:](self, "setThumbnailRequestID:", [v6 importOneUpScrubberCell:self requestedThumbnailForImportItem:v7 completion:v10]);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __45__PUImportOneUpScrubberCell_refreshThumbnail__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    id v12 = v5;
    id v6 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [WeakRetained importItem];
    v9 = *(void **)(a1 + 32);

    if (v8 == v9)
    {
      id v10 = v12;
      if (a3)
      {

        id v10 = 0;
      }
      id v12 = v10;
      id v11 = objc_loadWeakRetained(v6);
      [v11 updateToThumbnail:v12];
    }
    id v5 = v12;
  }
}

- (void)updateBadgeUIIfNeeded
{
  if ([(PUImportOneUpScrubberCell *)self needsBadgeUpdate])
  {
    [(PUImportOneUpScrubberCell *)self setNeedsBadgeUpdate:0];
    id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
    int v3 = 0;
    uint64_t v4 = 1;
    switch(self->_badgeType)
    {
      case 0:
        uint64_t v4 = 0;
        int v3 = 0;
        break;
      case 2:
        uint64_t v4 = 0;
        int v3 = 1;
        break;
      case 3:
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
        goto LABEL_8;
      case 4:
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemRedColor];
LABEL_8:
        id v6 = (void *)v5;

        int v3 = 0;
        id v8 = v6;
        break;
      default:
        break;
    }
    v7 = [(PUReviewScrubberCell *)self _checkmarkImageView];
    [v7 setTintColor:v8];

    [(PUReviewScrubberCell *)self setFavorite:v4];
    if (v3)
    {
      [(PUImportOneUpScrubberCell *)self _createSpinnerIfNecessary];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    }
    [(PUImportOneUpScrubberCell *)self setNeedsLayout];
  }
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
  [(PUImportOneUpScrubberCell *)self setNeedsBadgeUpdate:1];
}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
  [(PUImportOneUpScrubberCell *)self setNeedsBadgeUpdate:1];
}

- (void)setImportItem:(id)a3
{
  p_importItem = &self->_importItem;
  v7 = (PXImportItemViewModel *)a3;
  if (*p_importItem != v7)
  {
    objc_storeStrong((id *)&self->_importItem, a3);
    id v6 = [(PUImportOneUpScrubberCell *)self importItem];
    -[PUImportOneUpScrubberCell setSelectable:](self, "setSelectable:", [v6 isSelectable]);

    [(PUImportOneUpScrubberCell *)self setBadgeType:[(PXImportItemViewModel *)v7 badgeType]];
    [(PUImportOneUpScrubberCell *)self updateBadgeUIIfNeeded];
    [(PUImportOneUpScrubberCell *)self updateToThumbnail:0];
    [(PXImportItemViewModel *)*p_importItem registerChangeObserver:self context:PXImportItemViewModelOneUpScrubberCellContext];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PUImportOneUpScrubberCell;
  [(PUImportOneUpScrubberCell *)&v5 prepareForReuse];
  [(PXImportItemViewModel *)self->_importItem unregisterChangeObserver:self context:PXImportItemViewModelOneUpScrubberCellContext];
  if ([(PUImportOneUpScrubberCell *)self thumbnailRequestID])
  {
    int v3 = [(PUImportOneUpScrubberCell *)self displayDelegate];
    objc_msgSend(v3, "importOneUpScrubberCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpScrubberCell thumbnailRequestID](self, "thumbnailRequestID"));

    [(PUImportOneUpScrubberCell *)self setThumbnailRequestID:0];
  }
  importItem = self->_importItem;
  self->_importItem = 0;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUImportOneUpScrubberCell;
  [(PUReviewScrubberCell *)&v8 layoutSubviews];
  [(PUImportOneUpScrubberCell *)self bounds];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double MidX = CGRectGetMidX(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", MidX, CGRectGetMidY(v10));
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  if ([(PUImportOneUpScrubberCell *)self thumbnailRequestID])
  {
    int v3 = [(PUImportOneUpScrubberCell *)self displayDelegate];
    objc_msgSend(v3, "importOneUpScrubberCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpScrubberCell thumbnailRequestID](self, "thumbnailRequestID"));

    [(PUImportOneUpScrubberCell *)self setThumbnailRequestID:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpScrubberCell;
  [(PUImportOneUpScrubberCell *)&v4 dealloc];
}

- (PUImportOneUpScrubberCell)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpScrubberCell;
  int v3 = [(PUReviewScrubberCell *)&v7 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3)
  {
    [(PUImportOneUpScrubberCell *)v3 _commonPUImportOneUpScrubberCellInitialization];
    objc_super v5 = v4;
  }

  return v4;
}

- (PUImportOneUpScrubberCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpScrubberCell;
  int v3 = -[PUReviewScrubberCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    [(PUImportOneUpScrubberCell *)v3 _commonPUImportOneUpScrubberCellInitialization];
    objc_super v5 = v4;
  }

  return v4;
}

- (void)_commonPUImportOneUpScrubberCellInitialization
{
  [(PUReviewScrubberCell *)self setSuggested:0];
  [(PUReviewScrubberCell *)self setWantsSmallSuggestionIndicators:0];
  [(PUImportOneUpScrubberCell *)self setThumbnailRequestID:0];
}

+ (id)emptyThumbnailBackgroundColor
{
  if (emptyThumbnailBackgroundColor_onceToken != -1) {
    dispatch_once(&emptyThumbnailBackgroundColor_onceToken, &__block_literal_global_32918);
  }
  v2 = (void *)emptyThumbnailBackgroundColor_emptyBackgroundColor;
  return v2;
}

void __58__PUImportOneUpScrubberCell_emptyThumbnailBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  v1 = (void *)emptyThumbnailBackgroundColor_emptyBackgroundColor;
  emptyThumbnailBackgroundColor_emptyBackgroundColor = v0;
}

@end