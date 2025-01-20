@interface NTKPeopleComplicationImageView
- (BOOL)usesLegibility;
- (CLKImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKPeopleComplicationImageView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (UIColor)overrideColor;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (int64_t)_profileImageFilterStyle;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKPeopleComplicationImageView

- (NTKPeopleComplicationImageView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NTKPeopleComplicationImageView;
  v3 = -[NTKPeopleComplicationImageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v4;

    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v3->_nameLabel setTextColor:v6];

    [(UILabel *)v3->_nameLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_nameLabel setTextAlignment:1];
    [(NTKPeopleComplicationImageView *)v3 addSubview:v3->_nameLabel];
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    profileImageView = v3->_profileImageView;
    v3->_profileImageView = v7;

    [(UIImageView *)v3->_profileImageView setContentMode:1];
    [(UIImageView *)v3->_profileImageView setClipsToBounds:1];
    [(NTKPeopleComplicationImageView *)v3 addSubview:v3->_profileImageView];
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    ringView = v3->_ringView;
    v3->_ringView = v9;

    [(UIView *)v3->_ringView setClipsToBounds:1];
    id v11 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v12 = [v11 CGColor];
    v13 = [(UIView *)v3->_ringView layer];
    [v13 setBorderColor:v12];

    v3->_usingPersonSymbol = 0;
    [(NTKPeopleComplicationImageView *)v3 addSubview:v3->_ringView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)NTKPeopleComplicationImageView;
  [(NTKPeopleComplicationImageView *)&v30 layoutSubviews];
  [(NTKPeopleComplicationImageView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v9 = v3;
  double v10 = v4;
  if (v3 >= v4) {
    double v11 = v4;
  }
  else {
    double v11 = v3;
  }
  double v12 = (v3 - v11) * 0.5;
  double v13 = (v4 - v11) * 0.5;
  -[UIImageView setFrame:](self->_profileImageView, "setFrame:", v12, v13, v11, v11);
  v14 = [(UIImageView *)self->_profileImageView layer];
  [v14 setCornerRadius:v11 * 0.5];

  -[UIView setFrame:](self->_ringView, "setFrame:", v12, v13, v11, v11);
  objc_super v15 = [(UIView *)self->_ringView layer];
  [v15 setCornerRadius:v11 * 0.5];

  v16 = [(UIView *)self->_ringView layer];
  [v16 borderWidth];
  CGFloat v18 = v17 * 0.5;
  v19 = [(UIView *)self->_ringView layer];
  [v19 borderWidth];
  CGFloat v21 = v20 * 0.5;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.double width = v9;
  v31.size.double height = v10;
  CGRect v32 = CGRectInset(v31, v18, v21);
  double width = v32.size.width;
  double height = v32.size.height;

  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", width, height);
  double v26 = v24;
  double v27 = v25;
  if (v25 > 0.0 && v24 > 0.0)
  {
    double v28 = v24 / v25;
    float v29 = width * width / (v28 * v28 + 1.0);
    double v27 = sqrtf(v29);
    double v26 = v28 * v27;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", (v9 - v26) * 0.5, (v10 - v27) * 0.5);
}

- (void)setImageProvider:(id)a3
{
  id v31 = a3;
  objc_storeStrong((id *)&self->_imageProvider, a3);
  double v5 = self->_imageProvider;
  CGFloat v6 = [(CLKImageProvider *)v5 nameAbbreviation];
  double v7 = [v6 uppercaseString];
  [(UILabel *)self->_nameLabel setText:v7];

  CGFloat v8 = [(CLKImageProvider *)v5 profileImage];
  if (v8)
  {

LABEL_4:
    double v11 = [(CLKImageProvider *)v5 profileImage];
    [(UIImageView *)self->_profileImageView setImage:v11];

    double v12 = [(CLKImageProvider *)v5 profileImage];
    [(UILabel *)self->_nameLabel setHidden:v12 != 0];

    double v13 = [(CLKImageProvider *)v5 profileImage];
    [(UIImageView *)self->_profileImageView setHidden:v13 == 0];

    v14 = (void *)MEMORY[0x1E4F19A50];
    [(CLKImageProvider *)v5 fontSize];
    objc_super v15 = objc_msgSend(v14, "systemFontOfSize:weight:design:", *MEMORY[0x1E4F19680]);
    v16 = [v15 CLKFontWithAlternativePunctuation];
    [(UILabel *)self->_nameLabel setFont:v16];

    BOOL v17 = 0;
    goto LABEL_5;
  }
  double v9 = [(UILabel *)self->_nameLabel text];
  uint64_t v10 = [v9 length];

  if (v10) {
    goto LABEL_4;
  }
  CGFloat v21 = [MEMORY[0x1E4F19AB8] _symbolImageProviderWithSystemName:@"person.crop.circle.fill"];
  personSymbolImageProvider = self->_personSymbolImageProvider;
  self->_personSymbolImageProvider = v21;

  v23 = self->_personSymbolImageProvider;
  [(UIImageView *)self->_profileImageView frame];
  double v25 = v24;
  double v27 = v26;
  [(UIImageView *)self->_profileImageView frame];
  BOOL v17 = 1;
  [(CLKSymbolImageProvider *)v23 finalizeWithPointSize:0 weight:5 maxSDKSize:1 maxDeviceSize:v25 maskToCircle:v27];
  double v28 = self->_personSymbolImageProvider;
  float v29 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_super v30 = [(CLKSymbolImageProvider *)v28 createSymbolImageForType:2 color:v29];
  [(UIImageView *)self->_profileImageView setImage:v30];

  [(UIImageView *)self->_profileImageView setHidden:0];
  [(UILabel *)self->_nameLabel setHidden:1];
LABEL_5:
  self->_usingPersonSymbol = v17;
  [(CLKImageProvider *)v5 borderWidth];
  double v19 = v18;
  double v20 = [(UIView *)self->_ringView layer];
  [v20 setBorderWidth:v19];

  [(NTKPeopleComplicationImageView *)self setNeedsLayout];
}

- (void)setColor:(id)a3
{
  p_color = &self->_color;
  objc_storeStrong((id *)&self->_color, a3);
  id v6 = a3;
  [(UILabel *)self->_nameLabel setTextColor:*p_color];
  uint64_t v7 = [(UIColor *)*p_color CGColor];
  id v8 = [(UIView *)self->_ringView layer];

  [v8 setBorderColor:v7];
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKPeopleComplicationImageView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  double v5 = [a3 metadata];
  id v6 = [v5 objectForKey:@"NTKPeopleComplicationImageProviderMetadataKey"];

  [(NTKPeopleComplicationImageView *)self setImageProvider:v6];
}

- (void)setFilterProvider:(id)a3
{
}

- (int64_t)_profileImageFilterStyle
{
  v2 = [(NTKPeopleComplicationImageView *)self filterProvider];
  double v3 = [v2 device];
  int v4 = NTKShowGossamerUI(v3);

  if (v4) {
    return 5;
  }
  else {
    return 1;
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  double v5 = [(NTKPeopleComplicationImageView *)self filterProvider];
  id v6 = [v5 colorForView:self accented:1];
  color = self->_color;
  self->_color = v6;

  self->_monochromeTintAmount = a3;
  id v8 = [(NTKPeopleComplicationImageView *)self filterProvider];
  id v17 = [v8 filtersForView:self style:3 fraction:a3];

  if (v17)
  {
    if (self->_usingPersonSymbol)
    {
      double v9 = [(UIImageView *)self->_profileImageView layer];
      [v9 setFilters:v17];
    }
    else
    {
      uint64_t v10 = [(NTKPeopleComplicationImageView *)self filterProvider];
      double v9 = objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKPeopleComplicationImageView _profileImageFilterStyle](self, "_profileImageFilterStyle"), a3);

      double v11 = [(UIImageView *)self->_profileImageView layer];
      [v11 setFilters:v9];
    }
    double v12 = [(UILabel *)self->_nameLabel layer];
    [v12 setFilters:v17];
  }
  double v13 = [MEMORY[0x1E4FB1618] whiteColor];
  NTKInterpolateBetweenColors();
  id v14 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 CGColor];
  v16 = [(UIView *)self->_ringView layer];
  [v16 setBorderColor:v15];
}

- (void)updateMonochromeColor
{
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_personSymbolImageProvider, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_profileImageView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end