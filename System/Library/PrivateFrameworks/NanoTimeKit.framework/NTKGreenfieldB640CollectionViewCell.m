@interface NTKGreenfieldB640CollectionViewCell
+ (CGSize)cellSizeForWatchBandImage:(id)a3 watchFaceName:(id)a4;
+ (id)reuseIdentifier;
- (void)_populateWithDecodedRecipe:(id)a3 bandImage:(id)a4 shouldPresentFaceName:(BOOL)a5 shouldPresentCheckmark:(BOOL)a6 isSelected:(BOOL)a7;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)updateSeletedState:(BOOL)a3;
@end

@implementation NTKGreenfieldB640CollectionViewCell

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)NTKGreenfieldB640CollectionViewCell;
  [(NTKGreenfieldB640CollectionViewCell *)&v44 layoutSubviews];
  uint64_t v43 = 0;
  memset(v42, 0, sizeof(v42));
  [(UIImageView *)self->_watchBandImageView frame];
  v3 = [(UIImageView *)self->_watchBandImageView image];
  [v3 size];
  double v5 = v4;
  v6 = [(UIImageView *)self->_watchBandImageView image];
  [v6 size];
  double v8 = v7;

  v9 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
  [v9 bounds];
  double v11 = (v10 - v5) * 0.5;

  -[UIImageView setFrame:](self->_watchBandImageView, "setFrame:", v11, 0.0, v5, v8);
  [(UIView *)self->_faceView frame];
  [(UIView *)self->_faceView frame];
  double v13 = (v5 - v12) * 0.5;
  [(UIView *)self->_faceView frame];
  double v15 = (v8 - v14) * 0.5;
  [(UIView *)self->_faceView frame];
  double v17 = v16;
  [(UIView *)self->_faceView frame];
  -[UIView setFrame:](self->_faceView, "setFrame:", v13, v15, v17);
  double v18 = v8 + *(double *)v42 + 0.0;
  [(UILabel *)self->_faceNameLabel frame];
  v19 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
  [v19 bounds];
  double v21 = v20;

  -[UILabel sizeThatFits:](self->_faceNameLabel, "sizeThatFits:", v21, 1.79769313e308);
  double v23 = v22;
  v24 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
  [v24 bounds];
  double v26 = (v25 - v21) * 0.5;

  -[UILabel setFrame:](self->_faceNameLabel, "setFrame:", v26, v18, v21, v23);
  [(UIImageView *)self->_selectedCheckImageView frame];
  v27 = [(UIImageView *)self->_selectedCheckImageView image];
  [v27 size];
  double v29 = v28;

  v30 = [(UIImageView *)self->_selectedCheckImageView image];
  [v30 size];
  double v32 = v31;

  v33 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
  [v33 bounds];
  double v35 = v34;
  v36 = [(UIImageView *)self->_selectedCheckImageView image];
  [v36 size];
  double v38 = (v35 - v37) * 0.5;

  v39 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
  [v39 bounds];
  double v41 = v40 - v32 - *((double *)v42 + 1);

  -[UIImageView setFrame:](self->_selectedCheckImageView, "setFrame:", v38, v41, v29, v32);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGreenfieldB640CollectionViewCell;
  [(NTKGreenfieldB640CollectionViewCell *)&v3 prepareForReuse];
  [(UIView *)self->_faceView removeFromSuperview];
}

- (void)_populateWithDecodedRecipe:(id)a3 bandImage:(id)a4 shouldPresentFaceName:(BOOL)a5 shouldPresentCheckmark:(BOOL)a6 isSelected:(BOOL)a7
{
  BOOL v38 = a7;
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  *(void *)&double v13 = _LayoutConstants_50((uint64_t)&v48).n128_u64[0];
  if (!self->_watchBandImageView)
  {
    double v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    watchBandImageView = self->_watchBandImageView;
    self->_watchBandImageView = v14;

    double v16 = BPSBackgroundColor();
    [(UIImageView *)self->_watchBandImageView setBackgroundColor:v16];

    double v17 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
    [v17 addSubview:self->_watchBandImageView];

    [(UIImageView *)self->_watchBandImageView setImage:v12];
    [(UIImageView *)self->_watchBandImageView setContentMode:1];
  }
  double v18 = objc_msgSend(v11, "watchFace", v13);
  v19 = [NTKFaceViewController alloc];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __132__NTKGreenfieldB640CollectionViewCell__populateWithDecodedRecipe_bandImage_shouldPresentFaceName_shouldPresentCheckmark_isSelected___block_invoke;
  v41[3] = &unk_1E62C93E8;
  id v20 = v18;
  long long v44 = v49;
  long long v45 = v50;
  long long v46 = v51;
  id v42 = v20;
  uint64_t v47 = v52;
  long long v43 = v48;
  double v21 = [(NTKFaceViewController *)v19 initWithFace:v20 configuration:v41];
  double v22 = [(NTKFaceViewController *)v21 faceView];
  faceView = self->_faceView;
  self->_faceView = v22;

  [(UIImageView *)self->_watchBandImageView addSubview:self->_faceView];
  v24 = [(UIImageView *)self->_watchBandImageView image];
  [v24 size];
  double v25 = *((double *)&v49 + 1);
  CGFloat v27 = v26 / *((double *)&v49 + 1);
  double v28 = [(UIImageView *)self->_watchBandImageView image];
  [v28 size];
  CGAffineTransformMakeScale(&v40, v27, v29 / v25);
  v30 = self->_faceView;
  CGAffineTransform v39 = v40;
  [(UIView *)v30 setTransform:&v39];

  if (v8)
  {
    if (!self->_faceNameLabel)
    {
      double v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      faceNameLabel = self->_faceNameLabel;
      self->_faceNameLabel = v31;

      [(UILabel *)self->_faceNameLabel setTextAlignment:1];
      v33 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [(UILabel *)self->_faceNameLabel setTextColor:v33];

      double v34 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      [(UILabel *)self->_faceNameLabel setFont:v34];

      [(UILabel *)self->_faceNameLabel setNumberOfLines:0];
      double v35 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
      [v35 addSubview:self->_faceNameLabel];
    }
    v36 = [v11 watchFace];
    double v37 = [v36 faceSharingName];
    [(UILabel *)self->_faceNameLabel setText:v37];
  }
  self->_shouldPresentCheckmark = a6;
  [(NTKGreenfieldB640CollectionViewCell *)self updateSeletedState:v38];
}

void __132__NTKGreenfieldB640CollectionViewCell__populateWithDecodedRecipe_bandImage_shouldPresentFaceName_shouldPresentCheckmark_isSelected___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setDataMode:3];
  [v7 setShouldShowSnapshot:1];
  [v7 setShowsCanonicalContent:1];
  [v7 freeze];
  objc_super v3 = [*(id *)(a1 + 32) device];
  if ([v3 isLuxo])
  {
    [v3 screenCornerRadius];
    double v5 = v4;
  }
  else
  {
    double v5 = *(double *)(a1 + 72);
  }
  v6 = [v7 faceView];
  [v6 _setContinuousCornerRadius:v5];
}

- (void)updateSeletedState:(BOOL)a3
{
  if (self->_shouldPresentCheckmark)
  {
    if (!self->_selectedCheckImageView)
    {
      double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      selectedCheckImageView = self->_selectedCheckImageView;
      self->_selectedCheckImageView = v5;

      id v7 = [(NTKGreenfieldB640CollectionViewCell *)self contentView];
      [v7 addSubview:self->_selectedCheckImageView];

      [(UIImageView *)self->_selectedCheckImageView setContentMode:0];
    }
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    _LayoutConstants_50((uint64_t)&v12);
    if (a3)
    {
      BOOL v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:*(double *)&v13];
      v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      double v10 = @"checkmark.circle.fill";
    }
    else
    {
      BOOL v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:2 weight:*(double *)&v13];
      v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
      double v10 = @"circle";
    }
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v10 withConfiguration:v8];
    [(UIImageView *)self->_selectedCheckImageView setImage:v11];

    [(UIImageView *)self->_selectedCheckImageView setTintColor:v9];
  }
}

+ (id)reuseIdentifier
{
  return @"NTKGreenfieldB640CollectionViewCellReuseIdentifier";
}

+ (CGSize)cellSizeForWatchBandImage:(id)a3 watchFaceName:(id)a4
{
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v6, "size", _LayoutConstants_50((uint64_t)&v22).n128_f64[0]);
  double v8 = v7;
  v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:2 weight:*(double *)&v23];
  double v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill" withConfiguration:v9];
  [v10 size];
  double v12 = v11;
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v13 setTextAlignment:1];
  long long v14 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v13 setTextColor:v14];

  long long v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v13 setFont:v15];

  [v13 setNumberOfLines:0];
  [v13 setText:v5];

  [v6 size];
  objc_msgSend(v13, "sizeThatFits:");
  double v17 = *((double *)&v22 + 1) + v12 + *((double *)&v22 + 1) + v16 + v8 + *(double *)&v22;
  [v6 size];
  double v19 = v18;

  double v20 = v19;
  double v21 = v17;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCheckImageView, 0);
  objc_storeStrong((id *)&self->_faceNameLabel, 0);
  objc_storeStrong((id *)&self->_watchBandImageView, 0);
  objc_storeStrong((id *)&self->_snapshotFaceViewForErrorState, 0);

  objc_storeStrong((id *)&self->_faceView, 0);
}

@end