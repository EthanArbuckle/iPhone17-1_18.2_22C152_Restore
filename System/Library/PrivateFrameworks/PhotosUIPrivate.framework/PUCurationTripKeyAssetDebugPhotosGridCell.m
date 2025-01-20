@interface PUCurationTripKeyAssetDebugPhotosGridCell
- (NSString)subtitle;
- (NSString)title;
- (void)layoutSubviews;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PUCurationTripKeyAssetDebugPhotosGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  [(UILabel *)self->_subtitleLabel setText:v4];
  [(UILabel *)self->_subtitleLabel sizeToFit];
  v7 = [(PUCurationTripKeyAssetDebugPhotosGridCell *)self contentView];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;

  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v13;
  v19.size.height = v15;
  double v16 = CGRectGetMaxY(v19) + 18.0;
  [(UILabel *)self->_subtitleLabel bounds];
  subtitleLabel = self->_subtitleLabel;
  -[UILabel setFrame:](subtitleLabel, "setFrame:", 2.0, v16, v13 + -4.0);
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  [(UILabel *)self->_titleLabel setText:v4];
  [(UILabel *)self->_titleLabel sizeToFit];
  v7 = [(PUCurationTripKeyAssetDebugPhotosGridCell *)self contentView];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;

  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v13;
  v19.size.height = v15;
  double v16 = CGRectGetMaxY(v19) + 2.0;
  [(UILabel *)self->_titleLabel bounds];
  titleLabel = self->_titleLabel;
  -[UILabel setFrame:](titleLabel, "setFrame:", 2.0, v16, v13 + -4.0);
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PUCurationTripKeyAssetDebugPhotosGridCell;
  [(PUPhotosGridCell *)&v7 layoutSubviews];
  if (!self->_titleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    [(PUCurationTripKeyAssetDebugPhotosGridCell *)self addSubview:self->_titleLabel];
  }
  [(PUCurationTripKeyAssetDebugPhotosGridCell *)self setTitle:self->_title];
  if (!self->_subtitleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    [(PUCurationTripKeyAssetDebugPhotosGridCell *)self addSubview:self->_subtitleLabel];
  }
  [(PUCurationTripKeyAssetDebugPhotosGridCell *)self setSubtitle:self->_subtitle];
}

@end