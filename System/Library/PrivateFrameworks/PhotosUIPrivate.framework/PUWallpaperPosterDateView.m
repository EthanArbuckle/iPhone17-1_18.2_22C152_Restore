@interface PUWallpaperPosterDateView
- (BOOL)useThinnerFontWeightForTime;
- (BOOL)useVibrantAppearance;
- (PUWallpaperPosterDateView)initWithFrame:(CGRect)a3;
- (UIColor)timeColor;
- (UIFont)effectiveTimeFont;
- (UIFont)timeFont;
- (UILabel)timeLabel;
- (UIVisualEffectView)visualEffectView;
- (void)_initViews;
- (void)_updateTimeLabel;
- (void)layoutWithLayout:(id)a3 inContainerFrame:(CGRect)a4;
- (void)setEffectiveTimeFont:(id)a3;
- (void)setTimeColor:(id)a3;
- (void)setTimeFont:(id)a3;
- (void)setUseThinnerFontWeightForTime:(BOOL)a3;
- (void)setUseVibrantAppearance:(BOOL)a3;
@end

@implementation PUWallpaperPosterDateView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveTimeFont, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

- (void)setEffectiveTimeFont:(id)a3
{
}

- (UIFont)effectiveTimeFont
{
  return self->_effectiveTimeFont;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (BOOL)useThinnerFontWeightForTime
{
  return self->_useThinnerFontWeightForTime;
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (BOOL)useVibrantAppearance
{
  return self->_useVibrantAppearance;
}

- (void)_updateTimeLabel
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperPosterDateView *)self timeLabel];
  v4 = [(PUWallpaperPosterDateView *)self timeFont];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:100.0 weight:*MEMORY[0x1E4FB09E0]];
  }
  v7 = v6;

  v8 = [v7 fontDescriptor];
  uint64_t v9 = *MEMORY[0x1E4FB0950];
  v10 = [v8 objectForKey:*MEMORY[0x1E4FB0950]];

  uint64_t v11 = *MEMORY[0x1E4FB09F0];
  v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  [v12 doubleValue];
  double v14 = v13;

  BOOL v15 = [(PUWallpaperPosterDateView *)self useThinnerFontWeightForTime];
  double v16 = fmax(v14 + -0.2, 0.0);
  if (v15) {
    double v14 = v16;
  }
  v17 = (void *)[v10 mutableCopy];
  v18 = [NSNumber numberWithDouble:v14];
  [v17 setObject:v18 forKey:v11];

  v19 = [v7 fontDescriptor];
  uint64_t v31 = v9;
  v32[0] = v17;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  v21 = [v19 fontDescriptorByAddingAttributes:v20];

  v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:100.0];
  [v3 setFont:v22];
  v23 = [(PUWallpaperPosterDateView *)self timeColor];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v26 = v25;

  if ([(PUWallpaperPosterDateView *)self useVibrantAppearance])
  {
    uint64_t v27 = [MEMORY[0x1E4FB1618] whiteColor];

    [v3 setTextColor:v27];
    v28 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    v29 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v28];
    v30 = [(PUWallpaperPosterDateView *)self visualEffectView];
    [v30 setEffect:v29];

    v26 = (void *)v27;
  }
  else
  {
    [v3 setTextColor:v26];
    v28 = [(PUWallpaperPosterDateView *)self visualEffectView];
    [v28 setEffect:0];
  }
}

- (void)setTimeColor:(id)a3
{
  v8 = (UIColor *)a3;
  v5 = self->_timeColor;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(UIColor *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeColor, a3);
      [(PUWallpaperPosterDateView *)self _updateTimeLabel];
    }
  }
}

- (void)setTimeFont:(id)a3
{
  v8 = (UIFont *)a3;
  v5 = self->_timeFont;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(UIFont *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeFont, a3);
      [(PUWallpaperPosterDateView *)self _updateTimeLabel];
    }
  }
}

- (void)setUseVibrantAppearance:(BOOL)a3
{
  if (self->_useVibrantAppearance != a3)
  {
    self->_useVibrantAppearance = a3;
    [(PUWallpaperPosterDateView *)self _updateTimeLabel];
  }
}

- (void)setUseThinnerFontWeightForTime:(BOOL)a3
{
  if (self->_useThinnerFontWeightForTime != a3)
  {
    self->_useThinnerFontWeightForTime = a3;
    [(PUWallpaperPosterDateView *)self _updateTimeLabel];
  }
}

- (void)layoutWithLayout:(id)a3 inContainerFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v6 = a3;
  [v6 visibleFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v6 timeFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v36 = v21;

  double v22 = v16 - v8;
  double v23 = 0.0;
  double v24 = 0.0;
  if (v12 != 0.0)
  {
    double v22 = v22 / v12;
    double v24 = v20 / v12;
  }
  double v25 = v18 - v10;
  if (v14 != 0.0)
  {
    double v25 = v25 / v14;
    double v23 = v36 / v14;
  }
  CGFloat v26 = x + v22 * width;
  CGFloat v27 = width * v24;
  CGFloat v28 = height * v23;
  CGFloat v29 = y + height - (height * v23 + y + v25 * height);
  -[PUWallpaperPosterDateView setFrame:](self, "setFrame:", v26, v29, width * v24, v28, *(void *)&v36);
  v42.origin.double x = v26;
  v42.origin.double y = v29;
  v42.size.double width = v27;
  v42.size.double height = v28;
  CGFloat v30 = -CGRectGetMinX(v42);
  v43.origin.double x = v26;
  v43.origin.double y = v29;
  v43.size.double width = v27;
  v43.size.double height = v28;
  CGFloat v31 = -CGRectGetMinY(v43);
  v44.origin.double x = v26;
  v44.origin.double y = v29;
  v44.size.double width = v27;
  v44.size.double height = v28;
  CGRect v45 = CGRectOffset(v44, v30, v31);
  double v32 = v45.origin.x;
  double v33 = v45.origin.y;
  double v34 = v45.size.width;
  double v35 = v45.size.height;
  id v40 = [(PUWallpaperPosterDateView *)self timeLabel];
  objc_msgSend(v40, "setFrame:", v32, v33, v34, v35);
}

- (void)_initViews
{
  id v21 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"h:mm"];
  v4 = [v3 stringFromDate:v21];
  v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
  [(PUWallpaperPosterDateView *)self bounds];
  -[UIVisualEffectView setFrame:](v5, "setFrame:");
  [(UIVisualEffectView *)v5 setAutoresizingMask:18];
  [(PUWallpaperPosterDateView *)self addSubview:v5];
  id v6 = (objc_class *)MEMORY[0x1E4FB1930];
  double v7 = self->_timeFont;
  id v8 = [v6 alloc];
  double v9 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UILabel *)v9 setTextColor:self->_timeColor];
  [(UILabel *)v9 setTextAlignment:1];
  [(UILabel *)v9 setFont:v7];
  [(UILabel *)v9 setText:v4];
  double v10 = [(UIVisualEffectView *)v5 contentView];
  [v10 addSubview:v9];

  double v11 = [(UILabel *)v9 layer];
  [v11 setShadowRadius:2.0];

  double v12 = [(UILabel *)v9 layer];
  LODWORD(v13) = 0.125;
  [v12 setShadowOpacity:v13];

  double v14 = *MEMORY[0x1E4F1DB30];
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v16 = [(UILabel *)v9 layer];
  objc_msgSend(v16, "setShadowOffset:", v14, v15);

  timeLabel = self->_timeLabel;
  self->_timeLabel = v9;
  double v18 = v9;

  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v5;
  double v20 = v5;
}

- (PUWallpaperPosterDateView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUWallpaperPosterDateView;
  id v3 = -[PUWallpaperPosterDateView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:100.0 weight:*MEMORY[0x1E4FB09E0]];
    timeFont = v3->_timeFont;
    v3->_timeFont = (UIFont *)v4;

    uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
    timeColor = v3->_timeColor;
    v3->_timeColor = (UIColor *)v6;

    [(PUWallpaperPosterDateView *)v3 _initViews];
  }
  return v3;
}

@end