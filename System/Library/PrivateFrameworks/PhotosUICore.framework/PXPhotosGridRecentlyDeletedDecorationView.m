@interface PXPhotosGridRecentlyDeletedDecorationView
- (CGRect)clippingRect;
- (PXAssetReference)userData;
- (PXPhotosGridRecentlyDeletedDecorationView)initWithFrame:(CGRect)a3;
- (PXTextBannerView)textBannerView;
- (unint64_t)decorationOptions;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setDecorationOptions:(unint64_t)a3;
- (void)setTextBannerView:(id)a3;
- (void)setUserData:(id)a3;
- (void)updateTextBanner;
@end

@implementation PXPhotosGridRecentlyDeletedDecorationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBannerView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (void)setTextBannerView:(id)a3
{
}

- (PXTextBannerView)textBannerView
{
  return self->_textBannerView;
}

- (PXAssetReference)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setUserData:(id)a3
{
  v5 = (PXAssetReference *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    [(PXPhotosGridRecentlyDeletedDecorationView *)self updateTextBanner];
    v5 = v6;
  }
}

- (void)layoutSubviews
{
  [(PXPhotosGridRecentlyDeletedDecorationView *)self bounds];
  -[PXTextBannerView setFrame:](self->_textBannerView, "setFrame:", 0.0, CGRectGetHeight(v4) + -24.0, v4.size.width, 24.0);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridRecentlyDeletedDecorationView;
  [(PXPhotosGridRecentlyDeletedDecorationView *)&v3 layoutSubviews];
}

- (void)updateTextBanner
{
  objc_super v3 = [(PXPhotosGridRecentlyDeletedDecorationView *)self textBannerView];
  CGRect v4 = [(PXPhotosGridRecentlyDeletedDecorationView *)self userData];
  v5 = [v4 asset];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = 0;
    v6 = PXPhotoKitLocalizedMessageForRecentlyDeletedDaysRemainingAsset(v5, &v7);
    [v3 setText:v6];
    [v3 setDestructiveText:v7];
  }
  else
  {
    [v3 setText:0];
  }
}

- (PXPhotosGridRecentlyDeletedDecorationView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosGridRecentlyDeletedDecorationView;
  objc_super v3 = -[PXPhotosGridRecentlyDeletedDecorationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CGRect v4 = [PXTextBannerView alloc];
    v5 = -[PXTextBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PXTextBannerView *)v5 setTextAlignment:1];
    [(PXPhotosGridRecentlyDeletedDecorationView *)v3 addSubview:v5];
    textBannerView = v3->_textBannerView;
    v3->_textBannerView = v5;
  }
  return v3;
}

@end