@interface PUCurationTripKeyAssetBrowserDebugPhotosGridCell
- (NSString)subtitle;
- (NSString)title;
- (UIColor)color;
- (double)aestheticScore;
- (double)curationScore;
- (double)iconicSceneScore;
- (double)promotionScore;
- (void)layoutSubviews;
- (void)setAestheticScore:(double)a3;
- (void)setColor:(id)a3;
- (void)setCurationScore:(double)a3;
- (void)setIconicSceneScore:(double)a3;
- (void)setPromotionScore:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PUCurationTripKeyAssetBrowserDebugPhotosGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_promotionScoreLabel, 0);
  objc_storeStrong((id *)&self->_aestheticScoreLabel, 0);
  objc_storeStrong((id *)&self->_iconicSceneScoreLabel, 0);
  objc_storeStrong((id *)&self->_curationScoreLabel, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)color
{
  return self->_color;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (double)iconicSceneScore
{
  return self->_iconicSceneScore;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  [(UILabel *)self->_subtitleLabel setText:v4];
  [(UILabel *)self->_subtitleLabel sizeToFit];
  [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self bounds];
  double v8 = v7 + 18.0;
  double v10 = v9 + -4.0;
  [(UILabel *)self->_subtitleLabel bounds];
  subtitleLabel = self->_subtitleLabel;
  -[UILabel setFrame:](subtitleLabel, "setFrame:", 2.0, v8, v10);
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  [(UILabel *)self->_titleLabel setText:v4];
  [(UILabel *)self->_titleLabel sizeToFit];
  [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self bounds];
  double v8 = v7 + 2.0;
  double v10 = v9 + -4.0;
  [(UILabel *)self->_titleLabel bounds];
  titleLabel = self->_titleLabel;
  -[UILabel setFrame:](titleLabel, "setFrame:", 2.0, v8, v10);
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  [(UILabel *)self->_promotionScoreLabel setTextColor:v5];
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
  id v4 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  [(UILabel *)self->_promotionScoreLabel setText:v4];
}

- (void)setAestheticScore:(double)a3
{
  self->_aestheticScore = a3;
  id v4 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  [(UILabel *)self->_aestheticScoreLabel setText:v4];
}

- (void)setIconicSceneScore:(double)a3
{
  self->_iconicSceneScore = a3;
  id v4 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  [(UILabel *)self->_iconicSceneScoreLabel setText:v4];
}

- (void)setCurationScore:(double)a3
{
  self->_curationScore = a3;
  id v4 = [NSString stringWithFormat:@"%.2f", *(void *)&a3];
  [(UILabel *)self->_curationScoreLabel setText:v4];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PUCurationTripKeyAssetBrowserDebugPhotosGridCell;
  [(PUPhotosGridCell *)&v19 layoutSubviews];
  if (!self->_curationScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    curationScoreLabel = self->_curationScoreLabel;
    self->_curationScoreLabel = v3;

    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self addSubview:self->_curationScoreLabel];
    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setCurationScore:self->_curationScore];
  }
  if (!self->_iconicSceneScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    id v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
    iconicSceneScoreLabel = self->_iconicSceneScoreLabel;
    self->_iconicSceneScoreLabel = v5;

    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self addSubview:self->_iconicSceneScoreLabel];
    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setIconicSceneScore:self->_iconicSceneScore];
  }
  if (!self->_aestheticScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    double v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
    aestheticScoreLabel = self->_aestheticScoreLabel;
    self->_aestheticScoreLabel = v7;

    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self addSubview:self->_aestheticScoreLabel];
    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setAestheticScore:self->_aestheticScore];
  }
  if (!self->_promotionScoreLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    double v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
    promotionScoreLabel = self->_promotionScoreLabel;
    self->_promotionScoreLabel = v9;

    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self addSubview:self->_promotionScoreLabel];
    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setPromotionScore:self->_promotionScore];
    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setColor:self->_color];
  }
  if (!self->_titleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v11 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v11;

    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self addSubview:self->_titleLabel];
  }
  [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setTitle:self->_title];
  if (!self->_subtitleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v13 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v13;

    [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self addSubview:self->_subtitleLabel];
  }
  [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self setSubtitle:self->_subtitle];
  [(PUCurationTripKeyAssetBrowserDebugPhotosGridCell *)self bounds];
  double v16 = v15;
  double v18 = v17 + -32.0;
  -[UILabel setFrame:](self->_iconicSceneScoreLabel, "setFrame:", v17 + -32.0, v15 + -17.0, 30.0, 15.0);
  -[UILabel setFrame:](self->_curationScoreLabel, "setFrame:", v18, v16 + -33.0, 30.0, 15.0);
  -[UILabel setFrame:](self->_aestheticScoreLabel, "setFrame:", v18, v16 + -49.0, 30.0, 15.0);
  -[UILabel setFrame:](self->_promotionScoreLabel, "setFrame:", v18, v16 + -65.0, 30.0, 15.0);
}

id __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1930]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v2 = [MEMORY[0x1E4FB1618] labelColor];
  [v1 setTextColor:v2];

  v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v1 setBackgroundColor:v3];

  [v1 setAutoresizingMask:9];
  [v1 setTextAlignment:1];
  id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v1 setFont:v4];

  return v1;
}

@end