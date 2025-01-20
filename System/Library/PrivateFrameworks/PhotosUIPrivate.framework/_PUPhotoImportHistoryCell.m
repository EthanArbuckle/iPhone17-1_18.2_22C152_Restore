@interface _PUPhotoImportHistoryCell
- (PHAsset)asset;
- (UIImageView)imageView;
- (_PUPhotoImportHistoryCell)initWithFrame:(CGRect)a3;
- (int)currentImageRequestToken;
- (void)_updateBorderColor;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAsset:(id)a3;
- (void)setCurrentImageRequestToken:(int)a3;
- (void)setImageView:(id)a3;
@end

@implementation _PUPhotoImportHistoryCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)setCurrentImageRequestToken:(int)a3
{
  self->_currentImageRequestToken = a3;
}

- (int)currentImageRequestToken
{
  return self->_currentImageRequestToken;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)_updateBorderColor
{
  v3 = [(_PUPhotoImportHistoryCell *)self asset];
  int v4 = [v3 isFavorite];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4FB1618] redColor];
    uint64_t v6 = [v5 CGColor];
    v7 = [(_PUPhotoImportHistoryCell *)self layer];
    [v7 setBorderColor:v6];

    v8 = [(_PUPhotoImportHistoryCell *)self layer];
    double v9 = 4.0;
  }
  else
  {
    v10 = [(_PUPhotoImportHistoryCell *)self layer];
    [v10 setBorderColor:0];

    v8 = [(_PUPhotoImportHistoryCell *)self layer];
    double v9 = 0.0;
  }
  id v11 = v8;
  [v8 setBorderWidth:v9];
}

- (void)setAsset:(id)a3
{
  id v5 = (PHAsset *)a3;
  if (self->_asset != v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F390D0] defaultManager];
    objc_msgSend(v6, "cancelImageRequest:", -[_PUPhotoImportHistoryCell currentImageRequestToken](self, "currentImageRequestToken"));

    [(_PUPhotoImportHistoryCell *)self setCurrentImageRequestToken:0];
    v7 = [(_PUPhotoImportHistoryCell *)self imageView];
    [v7 setImage:0];

    objc_storeStrong((id *)&self->_asset, a3);
    if (v5)
    {
      objc_initWeak(&location, self);
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 1;
      v8 = [MEMORY[0x1E4F390D0] defaultManager];
      [(_PUPhotoImportHistoryCell *)self bounds];
      double v10 = v9;
      double v12 = v11;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __38___PUPhotoImportHistoryCell_setAsset___block_invoke;
      v13[3] = &unk_1E5F2E170;
      objc_copyWeak(&v14, &location);
      v13[4] = &v15;
      -[_PUPhotoImportHistoryCell setCurrentImageRequestToken:](self, "setCurrentImageRequestToken:", objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, 1, 0, v13, v10, v12));

      *((unsigned char *)v16 + 24) = 0;
      objc_destroyWeak(&v14);
      _Block_object_dispose(&v15, 8);
      objc_destroyWeak(&location);
    }
    [(_PUPhotoImportHistoryCell *)self _updateBorderColor];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_PUPhotoImportHistoryCell;
  [(_PUPhotoImportHistoryCell *)&v3 prepareForReuse];
  [(_PUPhotoImportHistoryCell *)self setAsset:0];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_PUPhotoImportHistoryCell;
  [(_PUPhotoImportHistoryCell *)&v12 layoutSubviews];
  [(_PUPhotoImportHistoryCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(_PUPhotoImportHistoryCell *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (_PUPhotoImportHistoryCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PUPhotoImportHistoryCell;
  double v3 = -[_PUPhotoImportHistoryCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    double v6 = [(_PUPhotoImportHistoryCell *)v3 contentView];
    [v6 addSubview:v3->_imageView];

    v3->_currentImageRequestToken = 0;
  }
  return v3;
}

@end