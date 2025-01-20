@interface BKUploadStatusCell
- (BCCacheVendedLayer)coverImageLayer;
- (UILabel)statusLabel;
- (UILabel)titleLabel;
- (UIView)coverImageContainerView;
- (UIView)textContainerView;
- (id)coverObserver;
- (id)coverSourceIdentifier;
- (void)_updateBookCover;
- (void)awakeFromNib;
- (void)configureForAsset:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCoverImageContainerView:(id)a3;
- (void)setCoverImageLayer:(id)a3;
- (void)setCoverObserver:(id)a3;
- (void)setCoverSourceIdentifier:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setTextContainerView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BKUploadStatusCell

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)BKUploadStatusCell;
  [(BKUploadStatusCell *)&v4 awakeFromNib];
  v3 = [(BKUploadStatusCell *)self coverImageContainerView];
  [v3 setClipsToBounds:0];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)BKUploadStatusCell;
  [(BKUploadStatusCell *)&v4 prepareForReuse];
  v3 = [(BKUploadStatusCell *)self coverImageLayer];
  [v3 removeFromSuperlayer];

  [(BKUploadStatusCell *)self setCoverImageLayer:0];
}

- (void)configureForAsset:(id)a3
{
  id v4 = a3;
  id v32 = v4;
  if (v4)
  {
    v5 = [v4 title];
    v6 = [(BKUploadStatusCell *)self titleLabel];
    [v6 setText:v5];

    v7 = [v32 path];
    id v8 = [v7 length];

    if (v8)
    {
      id v9 = objc_alloc((Class)BKLibraryFileSizeManagerCacheItemRequest);
      v10 = [v32 assetID];
      v11 = [v32 path];
      v12 = +[NSURL fileURLWithPath:v11];
      id v13 = [v9 initWithCacheItemRequestWithAssetID:v10 assetURL:v12];

      v14 = +[BKLibraryFileSizeManager sharedInstance];
      v15 = [v14 synchronousFileSizeForCacheItemRequest:v13];

      id v16 = [v15 longLongValue];
    }
    else
    {
      id v16 = [v32 fileSize];
    }
    v18 = +[NSByteCountFormatter stringFromByteCount:v16 countStyle:0];
    v19 = +[BKLibraryAssetStatusController sharedController];
    v20 = [v32 assetID];
    v21 = [v19 statusForAssetID:v20];

    if ([v21 state] == (id)9)
    {
      v22 = +[NSBundle mainBundle];
      v23 = [v22 localizedStringForKey:@"%@ - Uploading" value:&stru_100A70340 table:0];
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v18);
      v25 = [(BKUploadStatusCell *)self statusLabel];
      [v25 setText:v24];
    }
    else
    {
      v22 = [(BKUploadStatusCell *)self statusLabel];
      [v22 setText:v18];
    }

    v26 = +[BCCacheManager defaultCacheManager];
    v27 = [v32 permanentOrTemporaryAssetID];
    v28 = [v26 fetchLayerForAssetID:v27 size:2 options:41.0, 53.0];
    [(BKUploadStatusCell *)self setCoverImageLayer:v28];

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    v29 = [(BKUploadStatusCell *)self coverImageContainerView];
    v30 = [v29 layer];
    v31 = [(BKUploadStatusCell *)self coverImageLayer];
    [v30 addSublayer:v31];

    [(BKUploadStatusCell *)self _updateBookCover];
    +[CATransaction commit];
  }
  else
  {
    v17 = [(BKUploadStatusCell *)self titleLabel];
    [v17 setText:@"General Book Title"];

    v18 = [(BKUploadStatusCell *)self statusLabel];
    [v18 setText:@"3.4 MB - Uploading"];
  }
}

- (void)_updateBookCover
{
  v3 = [(BKUploadStatusCell *)self coverImageLayer];
  id v4 = [v3 describedImageShown];

  if (v4)
  {
    v5 = [(BKUploadStatusCell *)self coverImageLayer];
    v6 = [v5 describedImageShown];
    [v6 imageSize];
  }
  CGRectMakeWithOriginSize();
  v7 = [(BKUploadStatusCell *)self coverImageContainerView];
  [v7 bounds];
  CGRectFitRectInRectClip();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id v16 = [(BKUploadStatusCell *)self coverImageLayer];
  [v16 setFrame:v9, v11, v13, v15];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKUploadStatusCell;
  [(BKUploadStatusCell *)&v3 layoutSubviews];
  [(BKUploadStatusCell *)self _updateBookCover];
}

- (UIView)textContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainerView);

  return (UIView *)WeakRetained;
}

- (void)setTextContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusLabel);

  return (UILabel *)WeakRetained;
}

- (void)setStatusLabel:(id)a3
{
}

- (id)coverObserver
{
  return self->_coverObserver;
}

- (void)setCoverObserver:(id)a3
{
}

- (id)coverSourceIdentifier
{
  return self->_coverSourceIdentifier;
}

- (void)setCoverSourceIdentifier:(id)a3
{
}

- (BCCacheVendedLayer)coverImageLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverImageLayer);

  return (BCCacheVendedLayer *)WeakRetained;
}

- (void)setCoverImageLayer:(id)a3
{
}

- (UIView)coverImageContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverImageContainerView);

  return (UIView *)WeakRetained;
}

- (void)setCoverImageContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverImageContainerView);
  objc_destroyWeak((id *)&self->_coverImageLayer);
  objc_storeStrong(&self->_coverSourceIdentifier, 0);
  objc_storeStrong(&self->_coverObserver, 0);
  objc_destroyWeak((id *)&self->_statusLabel);
  objc_destroyWeak((id *)&self->_titleLabel);

  objc_destroyWeak((id *)&self->_textContainerView);
}

@end