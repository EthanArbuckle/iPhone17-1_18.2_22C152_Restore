@interface PUReviewScrubberCell
- (BOOL)isFavorite;
- (BOOL)isSuggested;
- (BOOL)wantsSmallSuggestionIndicators;
- (PUReviewScrubberCell)initWithCoder:(id)a3;
- (PUReviewScrubberCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)_checkmarkImageView;
- (UIImageView)_suggestedImageView;
- (UIImageView)_thumbnailImageView;
- (void)_commonPUReviewScrubberCellInitialization;
- (void)_updateFavoriteView;
- (void)_updateSuggestedView;
- (void)_updateThumbnailImageView;
- (void)layoutSubviews;
- (void)setFavorite:(BOOL)a3;
- (void)setFavorite:(BOOL)a3 animated:(BOOL)a4;
- (void)setImage:(id)a3;
- (void)setSuggested:(BOOL)a3;
- (void)setSuggested:(BOOL)a3 animated:(BOOL)a4;
- (void)setWantsSmallSuggestionIndicators:(BOOL)a3;
@end

@implementation PUReviewScrubberCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__suggestedImageView, 0);
  objc_storeStrong((id *)&self->__checkmarkImageView, 0);
  objc_storeStrong((id *)&self->__thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (UIImageView)_suggestedImageView
{
  return self->__suggestedImageView;
}

- (UIImageView)_checkmarkImageView
{
  return self->__checkmarkImageView;
}

- (UIImageView)_thumbnailImageView
{
  return self->__thumbnailImageView;
}

- (void)setWantsSmallSuggestionIndicators:(BOOL)a3
{
  self->_wantsSmallSuggestionIndicators = a3;
}

- (BOOL)wantsSmallSuggestionIndicators
{
  return self->_wantsSmallSuggestionIndicators;
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (UIImage)image
{
  return self->_image;
}

- (void)_updateSuggestedView
{
  double v2 = 1.0;
  if (!self->_suggested) {
    double v2 = 0.0;
  }
  [(UIImageView *)self->__suggestedImageView setAlpha:v2];
}

- (void)_updateFavoriteView
{
  double v3 = 0.200000003;
  if (!self->_favorite) {
    double v3 = 1.0;
  }
  [(UIImageView *)self->__thumbnailImageView setAlpha:v3];
  double v4 = 0.0;
  if (self->_favorite) {
    double v4 = 1.0;
  }
  checkmarkImageView = self->__checkmarkImageView;
  [(UIImageView *)checkmarkImageView setAlpha:v4];
}

- (void)_updateThumbnailImageView
{
}

- (void)setSuggested:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_suggested != a3)
  {
    BOOL v4 = a4;
    self->_suggested = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PUReviewScrubberCell_setSuggested_animated___block_invoke;
    aBlock[3] = &unk_1E5F2ED10;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.25];
    }
    else {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

uint64_t __46__PUReviewScrubberCell_setSuggested_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSuggestedView];
}

- (void)setSuggested:(BOOL)a3
{
}

- (void)setFavorite:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_favorite != a3)
  {
    BOOL v4 = a4;
    self->_favorite = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PUReviewScrubberCell_setFavorite_animated___block_invoke;
    aBlock[3] = &unk_1E5F2ED10;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.25];
    }
    else {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

uint64_t __45__PUReviewScrubberCell_setFavorite_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFavoriteView];
}

- (void)setFavorite:(BOOL)a3
{
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(PUReviewScrubberCell *)self _updateThumbnailImageView];
    v5 = v6;
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)PUReviewScrubberCell;
  [(PUReviewScrubberCell *)&v27 layoutSubviews];
  double v3 = [(PUReviewScrubberCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIImageView setFrame:](self->__thumbnailImageView, "setFrame:", v5, v7, v9, v11);
  [(UIImageView *)self->__checkmarkImageView sizeToFit];
  [(UIImageView *)self->__thumbnailImageView center];
  -[UIImageView setCenter:](self->__checkmarkImageView, "setCenter:");
  [(UIImageView *)self->__suggestedImageView sizeToFit];
  [(UIImageView *)self->__suggestedImageView bounds];
  uint64_t v26 = 0;
  UIRectCenteredIntegralRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = 3.0;
  if (!self->_wantsSmallSuggestionIndicators)
  {
    v19 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", 0);
    [v19 scale];
    double v18 = 1.0 / v20 + 5.0;
  }
  v21 = [(PUReviewScrubberCell *)self contentView];
  [v21 frame];
  double v22 = v18 + CGRectGetMaxY(v28);

  -[UIImageView setFrame:](self->__suggestedImageView, "setFrame:", v13, v22, v15, v17);
  suggestedImageView = self->__suggestedImageView;
  v24 = [MEMORY[0x1E4FB1618] labelColor];
  v25 = [v24 colorWithAlphaComponent:0.25];
  [(UIImageView *)suggestedImageView setTintColor:v25];
}

- (PUReviewScrubberCell)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubberCell;
  double v3 = [(PUReviewScrubberCell *)&v7 initWithCoder:a3];
  double v4 = v3;
  if (v3)
  {
    [(PUReviewScrubberCell *)v3 _commonPUReviewScrubberCellInitialization];
    double v5 = v4;
  }

  return v4;
}

- (PUReviewScrubberCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubberCell;
  double v3 = -[PUReviewScrubberCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PUReviewScrubberCell *)v3 _commonPUReviewScrubberCellInitialization];
    double v5 = v4;
  }

  return v4;
}

- (void)_commonPUReviewScrubberCellInitialization
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  thumbnailImageView = self->__thumbnailImageView;
  self->__thumbnailImageView = v4;

  [(UIImageView *)self->__thumbnailImageView setAccessibilityIgnoresInvertColors:1];
  [(UIImageView *)self->__thumbnailImageView setContentMode:2];
  [(UIImageView *)self->__thumbnailImageView setClipsToBounds:1];
  double v6 = +[PUScrubberSettings sharedInstance];
  [v6 lemonadeItemCornerRadius];
  double v8 = v7;
  double v9 = [(UIImageView *)self->__thumbnailImageView layer];
  [v9 setCornerRadius:v8];

  uint64_t v10 = *MEMORY[0x1E4F39EA8];
  double v11 = [(UIImageView *)self->__thumbnailImageView layer];
  [v11 setCornerCurve:v10];

  double v12 = [(PUReviewScrubberCell *)self contentView];
  [v12 addSubview:self->__thumbnailImageView];

  id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  double v15 = (UIImageView *)[v13 initWithImage:v14];
  checkmarkImageView = self->__checkmarkImageView;
  self->__checkmarkImageView = v15;

  double v17 = [(PUReviewScrubberCell *)self contentView];
  [v17 addSubview:self->__checkmarkImageView];

  id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
  v19 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"AvalancheReviewSuggestedDot.png");
  double v20 = [v19 imageWithRenderingMode:2];
  v21 = (UIImageView *)[v18 initWithImage:v20];
  suggestedImageView = self->__suggestedImageView;
  self->__suggestedImageView = v21;

  v23 = [(PUReviewScrubberCell *)self contentView];
  [v23 addSubview:self->__suggestedImageView];

  self->_favorite = 0;
  self->_suggested = 0;
  [(PUReviewScrubberCell *)self _updateFavoriteView];
  [(PUReviewScrubberCell *)self _updateSuggestedView];
}

@end