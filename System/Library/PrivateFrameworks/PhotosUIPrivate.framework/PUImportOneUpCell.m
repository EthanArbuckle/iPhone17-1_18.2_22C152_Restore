@interface PUImportOneUpCell
+ (double)alphaForSelectedCells;
- (PUImportOneUpCell)initWithCoder:(id)a3;
- (PUImportOneUpCell)initWithFrame:(CGRect)a3;
- (PUImportOneUpCellDisplayDelegate)displayDelegate;
- (PXImportItemViewModel)importItem;
- (UITextField)debugTextField;
- (int64_t)thumbnailRequestID;
- (void)_commonPUImportOneUpCellInitialization;
- (void)contextForObservingViewModelChanges;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)refreshThumbnail;
- (void)setDebugTextField:(id)a3;
- (void)setDisplayDelegate:(id)a3;
- (void)setImage:(id)a3 isPlaceholder:(BOOL)a4;
- (void)setImportItem:(id)a3;
- (void)setThumbnailRequestID:(int64_t)a3;
- (void)updateBadge;
- (void)updateDebugLabel:(id)a3;
- (void)updatePhotoViewForImportItem:(id)a3;
- (void)updateSelectedVisualAppearance;
@end

@implementation PUImportOneUpCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTextField, 0);
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

- (void)setDebugTextField:(id)a3
{
}

- (UITextField)debugTextField
{
  return self->_debugTextField;
}

- (PXImportItemViewModel)importItem
{
  return self->_importItem;
}

- (void)setDisplayDelegate:(id)a3
{
}

- (PUImportOneUpCellDisplayDelegate)displayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);
  return (PUImportOneUpCellDisplayDelegate *)WeakRetained;
}

- (void)updateDebugLabel:(id)a3
{
  v4 = (__CFString *)a3;
  v10 = v4;
  if (v4)
  {
    v5 = v4;
    if (!self->_debugTextField)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1D70]);
      v7 = (UITextField *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      debugTextField = self->_debugTextField;
      self->_debugTextField = v7;

      [(UITextField *)self->_debugTextField setTextAlignment:1];
      [(UITextField *)self->_debugTextField setAdjustsFontSizeToFitWidth:1];
      v9 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UITextField *)self->_debugTextField setBackgroundColor:v9];

      [(UITextField *)self->_debugTextField setEnabled:0];
      [(PUImportOneUpCell *)self addSubview:self->_debugTextField];
      [(PUImportOneUpCell *)self setNeedsLayout];
      v4 = v10;
      v5 = v10;
    }
  }
  else
  {
    v5 = &stru_1F06BE7B8;
  }
  [(UITextField *)self->_debugTextField setHidden:[(__CFString *)v4 length] == 0];
  [(UITextField *)self->_debugTextField setText:v5];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PUImportOneUpCell.m" lineNumber:211 description:@"Expecting main thread only for cell signals"];
  }
  if ([(PUImportOneUpCell *)self contextForObservingViewModelChanges] == a5)
  {
    if (a4)
    {
      v9 = [(PUImportOneUpCell *)self importItem];
      -[PUImportOneUpCell setSelected:](self, "setSelected:", [v9 isSelected]);

      LODWORD(v10) = 1;
    }
    else
    {
      unint64_t v10 = (a4 >> 2) & 1;
    }
    int v11 = a4 & 1;
    if ((a4 & 8) != 0)
    {
      v12 = [(PUImportOneUpCell *)self importItem];
      int v13 = [v12 isDuplicate];

      LODWORD(v10) = v10 | v13;
    }
    if ((a4 & 2) != 0)
    {
      v14 = [(PUImportOneUpCell *)self importItem];
      -[PUImportOneUpCell setSelected:](self, "setSelected:", [v14 isSelected]);

      LODWORD(v10) = 1;
      int v11 = 1;
    }
    int v15 = (a4 >> 4) & 1 | v10;
    if ((a4 & 0x80) != 0 && [(PUImportOneUpCell *)self thumbnailRequestID])
    {
      v16 = [(PUImportOneUpCell *)self displayDelegate];
      objc_msgSend(v16, "importOneUpCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"));

      [(PUImportOneUpCell *)self setThumbnailRequestID:0];
    }
    if (v15) {
      [(PUImportOneUpCell *)self updateBadge];
    }
    if (v11)
    {
      [(PUImportOneUpCell *)self updateSelectedVisualAppearance];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUImportOneUpCell;
  [(PUPhotosSharingGridCell *)&v3 layoutSubviews];
  if (self->_debugTextField)
  {
    [(PUImportOneUpCell *)self bounds];
    -[UITextField setFrame:](self->_debugTextField, "setFrame:", 0.0, 0.0, CGRectGetWidth(v4), 18.0);
  }
}

- (void)updateBadge
{
  objc_super v3 = [(PUImportOneUpCell *)self importItem];
  char v4 = [v3 isDeleted];

  if ((v4 & 1) == 0)
  {
    id v6 = [(PUImportOneUpCell *)self displayDelegate];
    v5 = [(PUImportOneUpCell *)self importItem];
    [v6 importOneUpCell:self requestedBadgeUpdateForImportItem:v5];
  }
}

- (void)setImage:(id)a3 isPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(PUPhotosSharingGridCell *)self photoView];
  v7 = [v6 contentHelper];

  [v10 size];
  objc_msgSend(v7, "setPhotoSize:");
  [v7 setFillMode:!v4];
  if (v4)
  {
    v8 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [v7 setBackgroundColor:v8];
  }
  else
  {
    [v7 setBackgroundColor:0];
  }
  [v7 setPhotoImage:v10];
  v9 = [(PUImportOneUpCell *)self importItem];
  [(PUImportOneUpCell *)self updatePhotoViewForImportItem:v9];
}

- (void)refreshThumbnail
{
  BOOL v4 = [(PUImportOneUpCell *)self importItem];
  char v5 = [v4 isDeleted];

  if ((v5 & 1) == 0)
  {
    id v6 = [(PUImportOneUpCell *)self displayDelegate];

    if (!v6)
    {
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PUImportOneUpCell.m" lineNumber:162 description:@"Missing thumbnail provider"];
    }
    v7 = [(PUImportOneUpCell *)self importItem];
    objc_initWeak(&location, self);
    v8 = [(PUImportOneUpCell *)self displayDelegate];
    v9 = [(PUImportOneUpCell *)self importItem];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__PUImportOneUpCell_refreshThumbnail__block_invoke;
    v12[3] = &unk_1E5F25D10;
    objc_copyWeak(&v14, &location);
    id v10 = v7;
    id v13 = v10;
    -[PUImportOneUpCell setThumbnailRequestID:](self, "setThumbnailRequestID:", [v8 importOneUpCell:self requestedThumbnailForImportItem:v9 completion:v12]);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __37__PUImportOneUpCell_refreshThumbnail__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = (id *)(a1 + 40);
    id v11 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = [WeakRetained importItem];
    v9 = *(void **)(a1 + 32);

    id v5 = v11;
    if (v8 == v9)
    {
      id v10 = objc_loadWeakRetained(v6);
      [v10 setImage:v11 isPlaceholder:a3];

      id v5 = v11;
    }
  }
}

- (void)updateSelectedVisualAppearance
{
  objc_super v3 = [(PUImportOneUpCell *)self importItem];
  int v4 = [v3 isSelected];

  double v5 = 1.0;
  if (v4)
  {
    +[PUImportOneUpCell alphaForSelectedCells];
    double v5 = v6;
  }
  id v8 = [(PUPhotosSharingGridCell *)self photoView];
  v7 = [v8 contentHelper];
  [v7 setContentAlpha:v5];
}

- (void)updatePhotoViewForImportItem:(id)a3
{
  int v4 = [a3 importAsset];
  if ([v4 isHDR])
  {
    if ([v4 isImage]) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 1024;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v6 = [v4 isBurst];
  int v7 = [v4 isSDOF];
  uint64_t v8 = 0;
  if ([v4 isMovie])
  {
    v9 = [v4 durationTimeInterval];
    [v9 doubleValue];
    uint64_t v8 = v10;
  }
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v13 = [(PUPhotosSharingGridCell *)self photoView];
  id v14 = [v13 contentHelper];
  int v15 = [v14 photoImage];

  double v16 = v12;
  double v17 = v11;
  if (v15)
  {
    v18 = [(PUPhotosSharingGridCell *)self photoView];
    v19 = [v18 contentHelper];
    v20 = [v19 photoImage];
    [v20 size];
    double v17 = v21;
    double v16 = v22;
  }
  if (v17 == v11 && v16 == v12)
  {
    v25 = [(PUImportOneUpCell *)self importItem];
    int v24 = [v25 isPanoramicImage];
  }
  else
  {
    int v24 = objc_msgSend(MEMORY[0x1E4F902C0], "hasPanoramaImageDimensions:", v17, v16);
  }
  uint64_t v26 = v5 | 8;
  if (!v6) {
    uint64_t v26 = v5;
  }
  if (v7) {
    v26 |= 0x10uLL;
  }
  if (v24) {
    uint64_t v27 = v26 | 2;
  }
  else {
    uint64_t v27 = v26;
  }
  v28 = [(PUPhotosSharingGridCell *)self photoView];
  v29 = [v28 contentHelper];
  v32[0] = v27;
  v32[1] = v8;
  v32[2] = 0;
  v32[3] = 0;
  [v29 setBadgeInfo:v32];

  v30 = [(PUPhotosSharingGridCell *)self photoView];
  v31 = [v30 contentHelper];
  [v31 setBadgeStyle:7];
}

- (void)setImportItem:(id)a3
{
  uint64_t v5 = (PXImportItemViewModel *)a3;
  importItem = self->_importItem;
  if (importItem != v5)
  {
    v9 = v5;
    [(PXImportItemViewModel *)importItem unregisterChangeObserver:self context:[(PUImportOneUpCell *)self contextForObservingViewModelChanges]];
    objc_storeStrong((id *)&self->_importItem, a3);
    int v7 = [(PUImportOneUpCell *)self importItem];
    -[PUImportOneUpCell setSelected:](self, "setSelected:", [v7 isSelected]);

    uint64_t v8 = [(PUImportOneUpCell *)self importItem];
    [(PUImportOneUpCell *)self updatePhotoViewForImportItem:v8];

    [(PUImportOneUpCell *)self updateSelectedVisualAppearance];
    [(PXImportItemViewModel *)self->_importItem registerChangeObserver:self context:[(PUImportOneUpCell *)self contextForObservingViewModelChanges]];
    uint64_t v5 = v9;
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PUImportOneUpCell;
  [(PUPhotosSharingGridCell *)&v5 prepareForReuse];
  [(PXImportItemViewModel *)self->_importItem unregisterChangeObserver:self context:[(PUImportOneUpCell *)self contextForObservingViewModelChanges]];
  importItem = self->_importItem;
  self->_importItem = 0;

  if ([(PUImportOneUpCell *)self thumbnailRequestID])
  {
    int v4 = [(PUImportOneUpCell *)self displayDelegate];
    objc_msgSend(v4, "importOneUpCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"));

    [(PUImportOneUpCell *)self setThumbnailRequestID:0];
  }
}

- (void)dealloc
{
  importItem = self->_importItem;
  self->_importItem = 0;

  if ([(PUImportOneUpCell *)self thumbnailRequestID])
  {
    int v4 = [(PUImportOneUpCell *)self displayDelegate];
    objc_msgSend(v4, "importOneUpCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"));

    [(PUImportOneUpCell *)self setThumbnailRequestID:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)PUImportOneUpCell;
  [(PUImportOneUpCell *)&v5 dealloc];
}

- (void)contextForObservingViewModelChanges
{
  return (void *)PXImportItemViewModelOneUpCellContext;
}

- (PUImportOneUpCell)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpCell;
  objc_super v3 = [(PUImportOneUpCell *)&v7 initWithCoder:a3];
  int v4 = v3;
  if (v3)
  {
    [(PUImportOneUpCell *)v3 _commonPUImportOneUpCellInitialization];
    objc_super v5 = v4;
  }

  return v4;
}

- (PUImportOneUpCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpCell;
  objc_super v3 = -[PUPhotosSharingGridCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3)
  {
    [(PUImportOneUpCell *)v3 _commonPUImportOneUpCellInitialization];
    objc_super v5 = v4;
  }

  return v4;
}

- (void)_commonPUImportOneUpCellInitialization
{
}

+ (double)alphaForSelectedCells
{
  return 1.0;
}

@end