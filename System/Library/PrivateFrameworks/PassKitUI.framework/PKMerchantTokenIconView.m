@interface PKMerchantTokenIconView
- (PKMerchantTokenIconView)initWithFrame:(CGRect)a3;
- (void)_cancelImageDownload;
- (void)_downloadImageFromURL:(id)a3;
- (void)_setUpConstraints;
- (void)_setUpMonogramLabel;
- (void)_setUpSelf;
- (void)_setUpViews;
- (void)_updateIconImage;
- (void)_updateMonogramLabelWithText:(id)a3;
- (void)updateWithImage:(id)a3 cornerRadius:(double)a4;
- (void)updateWithImageURL:(id)a3 monogramText:(id)a4 cornerRadius:(double)a5;
@end

@implementation PKMerchantTokenIconView

- (PKMerchantTokenIconView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenIconView;
  v3 = -[PKMerchantTokenIconView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKMerchantTokenIconView *)v3 _setUpViews];
    [(PKMerchantTokenIconView *)v4 _setUpConstraints];
  }
  return v4;
}

- (void)updateWithImage:(id)a3 cornerRadius:(double)a4
{
  objc_super v6 = (UIImage *)a3;
  [(PKMerchantTokenIconView *)self _cancelImageDownload];
  image = self->_image;
  self->_image = v6;

  self->_cornerRadius = a4;

  [(PKMerchantTokenIconView *)self _updateIconImage];
}

- (void)updateWithImageURL:(id)a3 monogramText:(id)a4 cornerRadius:(double)a5
{
  id v8 = a4;
  id v10 = a3;
  [(PKMerchantTokenIconView *)self _cancelImageDownload];
  image = self->_image;
  self->_image = 0;

  self->_cornerRadius = a5;
  [(PKMerchantTokenIconView *)self _updateMonogramLabelWithText:v8];

  [(PKMerchantTokenIconView *)self _updateIconImage];
  [(PKMerchantTokenIconView *)self _downloadImageFromURL:v10];
}

- (void)_setUpViews
{
  [(PKMerchantTokenIconView *)self _setUpSelf];

  [(PKMerchantTokenIconView *)self _setUpMonogramLabel];
}

- (void)_setUpSelf
{
  [(PKMerchantTokenIconView *)self setClipsToBounds:1];
  [(PKMerchantTokenIconView *)self setContentMode:2];
  id v4 = [(PKMerchantTokenIconView *)self layer];
  id v3 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v3, "CGColor"));
}

- (void)_setUpMonogramLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  id v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  monogramLabel = self->_monogramLabel;
  self->_monogramLabel = v4;

  [(UILabel *)self->_monogramLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = self->_monogramLabel;
  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v6 setTextColor:v7];

  [(UILabel *)self->_monogramLabel setTextAlignment:1];
  id v8 = self->_monogramLabel;
  v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:100.0 weight:*MEMORY[0x1E4FB09D0]];
  [(UILabel *)v8 setFont:v9];

  [(UILabel *)self->_monogramLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_monogramLabel setMinimumScaleFactor:0.01];
  id v10 = self->_monogramLabel;

  [(PKMerchantTokenIconView *)self addSubview:v10];
}

- (void)_setUpConstraints
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1E4F28DC8];
  v16 = [(UILabel *)self->_monogramLabel centerYAnchor];
  v15 = [(PKMerchantTokenIconView *)self centerYAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v17[0] = v14;
  id v3 = [(UILabel *)self->_monogramLabel heightAnchor];
  id v4 = [(PKMerchantTokenIconView *)self heightAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 multiplier:0.715];
  v17[1] = v5;
  objc_super v6 = [(UILabel *)self->_monogramLabel leadingAnchor];
  v7 = [(PKMerchantTokenIconView *)self leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];
  v17[2] = v8;
  v9 = [(UILabel *)self->_monogramLabel trailingAnchor];
  id v10 = [(PKMerchantTokenIconView *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v17[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  [v13 activateConstraints:v12];
}

- (void)_updateMonogramLabelWithText:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 length];
  monogramLabel = self->_monogramLabel;
  if (v4)
  {
    objc_super v6 = objc_msgSend(v7, "substringWithRange:", 0, 1);
    [(UILabel *)monogramLabel setText:v6];
  }
  else
  {
    [(UILabel *)monogramLabel setText:&stru_1EF1B5B50];
  }
}

- (void)_updateIconImage
{
  image = self->_image;
  if (image)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKMerchantTokenIconView *)self setBackgroundColor:v4];

    [(PKMerchantTokenIconView *)self _setContinuousCornerRadius:self->_cornerRadius];
    v5 = [(PKMerchantTokenIconView *)self layer];
    [v5 setBorderWidth:PKUIPixelLength()];

    objc_super v6 = self->_image;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] systemGray2Color];
    [(PKMerchantTokenIconView *)self setBackgroundColor:v7];

    [(PKMerchantTokenIconView *)self _setContinuousCornerRadius:self->_cornerRadius];
    id v8 = [(PKMerchantTokenIconView *)self layer];
    [v8 setBorderWidth:PKUIPixelLength()];

    objc_super v6 = 0;
  }
  [(PKMerchantTokenIconView *)self setImage:v6];
  monogramLabel = self->_monogramLabel;

  [(UILabel *)monogramLabel setHidden:image != 0];
}

- (void)_downloadImageFromURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__63;
  v14 = __Block_byref_object_dispose__63;
  id v15 = 0;
  v5 = [MEMORY[0x1E4F290E0] sharedSession];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke;
  v8[3] = &unk_1E59DEE80;
  objc_copyWeak(&v9, &location);
  v8[4] = &v10;
  uint64_t v6 = [v5 dataTaskWithURL:v4 completionHandler:v8];
  id v7 = (void *)v11[5];
  v11[5] = v6;

  objc_storeStrong((id *)&self->_imageDownloadTask, (id)v11[5]);
  [(id)v11[5] resume];
  objc_destroyWeak(&v9);
  _Block_object_dispose(&v10, 8);

  objc_destroyWeak(&location);
}

void __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  if (!a4 && [a3 statusCode] == 200)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke_2;
    block[3] = &unk_1E59D4EC0;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v11);
  }
}

void __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[66] == *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v4 = WeakRetained;
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:*(void *)(a1 + 32)];
    if (v3)
    {
      objc_storeStrong(v4 + 64, v3);
      [v4 _updateIconImage];
    }

    WeakRetained = v4;
  }
}

- (void)_cancelImageDownload
{
  [(NSURLSessionDataTask *)self->_imageDownloadTask cancel];
  imageDownloadTask = self->_imageDownloadTask;
  self->_imageDownloadTask = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloadTask, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_monogramLabel, 0);
}

@end