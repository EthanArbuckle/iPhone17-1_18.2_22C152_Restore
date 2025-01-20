@interface PUCurationKeyAssetComparisonViewCell
+ (double)cellHeightWithCellWidth:(double)a3;
- (NSString)representedAssetIdentifier;
- (PUCurationKeyAssetComparisonViewCell)initWithFrame:(CGRect)a3;
- (UIImage)thumbnailImage;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setRepresentedAssetIdentifier:(id)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation PUCurationKeyAssetComparisonViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)setRepresentedAssetIdentifier:(id)a3
{
}

- (NSString)representedAssetIdentifier
{
  return self->_representedAssetIdentifier;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setImage:v5];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PUCurationKeyAssetComparisonViewCell;
  [(PUCurationKeyAssetComparisonViewCell *)&v3 prepareForReuse];
  [(PUCurationKeyAssetComparisonViewCell *)self setThumbnailImage:0];
  [(PUCurationKeyAssetComparisonViewCell *)self setRepresentedAssetIdentifier:0];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUCurationKeyAssetComparisonViewCell;
  [(PUCurationKeyAssetComparisonViewCell *)&v8 layoutSubviews];
  objc_super v3 = [(PUCurationKeyAssetComparisonViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", 3.0, 19.0, v5 + -6.0, v7 + -6.0 + -16.0);
}

- (PUCurationKeyAssetComparisonViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUCurationKeyAssetComparisonViewCell;
  objc_super v3 = -[PUCurationKeyAssetComparisonViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    double v6 = [(PUCurationKeyAssetComparisonViewCell *)v3 contentView];
    [v6 addSubview:v3->_imageView];
  }
  return v3;
}

+ (double)cellHeightWithCellWidth:(double)a3
{
  return a3 + 6.0 + 16.0;
}

@end