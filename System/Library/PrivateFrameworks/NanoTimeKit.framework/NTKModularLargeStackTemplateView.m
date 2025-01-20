@interface NTKModularLargeStackTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (NTKModularLargeStackTemplateView)initWithFrame:(CGRect)a3;
- (id)_newLabelSubview;
- (id)_newLabelSubviewWithFont:(id)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_update;
- (void)_updateForStandardBodyTemplate:(id)a3;
- (void)_updateForTallBodyTemplate:(id)a3;
- (void)_updateLabelsMaxWidths;
@end

@implementation NTKModularLargeStackTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (NTKModularLargeStackTemplateView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NTKModularLargeStackTemplateView;
  id v3 = -[NTKModuleView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
    v5 = [(NTKModuleView *)v3 device];
    _LayoutConstants_21(v5, (uint64_t)v18);

    double v6 = *(double *)v18;
    v7 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(double *)v18 weight:*MEMORY[0x1E4FB09D0]];
    v8 = [MEMORY[0x1E4F19A50] systemFontOfSize:v6];
    uint64_t v9 = [(NTKModularLargeStackTemplateView *)v4 _newLabelSubviewWithFont:v7];
    headerLeadingLabel = v4->_headerLeadingLabel;
    v4->_headerLeadingLabel = (CLKUIColoringLabel *)v9;

    uint64_t v11 = [(NTKModularLargeStackTemplateView *)v4 _newLabelSubviewWithFont:v7];
    headerTrailingLabel = v4->_headerTrailingLabel;
    v4->_headerTrailingLabel = (CLKUIColoringLabel *)v11;

    uint64_t v13 = [(NTKModularLargeStackTemplateView *)v4 _newLabelSubviewWithFont:v8];
    body1Label = v4->_body1Label;
    v4->_body1Label = (CLKUIColoringLabel *)v13;

    uint64_t v15 = [(NTKModularLargeStackTemplateView *)v4 _newLabelSubviewWithFont:v8];
    body2Label = v4->_body2Label;
    v4->_body2Label = (CLKUIColoringLabel *)v15;
  }
  return v4;
}

- (void)_layoutContentView
{
  double v56 = 0.0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  id v3 = [(NTKModuleView *)self device];
  _LayoutConstants_21(v3, (uint64_t)&v53);

  v4 = [(NTKModuleView *)self device];
  double v5 = _LargeModularLayoutConstants(v4);
  double v7 = v6;

  v8 = [(NTKModularTemplateView *)self complicationTemplate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = [(NTKModularTemplateView *)self complicationTemplate];
    v12 = [v11 body2TextProvider];
    BOOL v10 = v12 != 0;
  }
  [(NTKModularLargeStackTemplateView *)self _updateLabelsMaxWidths];
  headerGlyph = self->_headerGlyph;
  if (headerGlyph && ([(CDComplicationImageView *)headerGlyph isHidden] & 1) == 0)
  {
    [(CDComplicationImageView *)self->_headerGlyph sizeToFit];
    [(CDComplicationImageView *)self->_headerGlyph center];
    double v15 = v14;
    v16 = [(CLKUIColoringLabel *)self->_headerLeadingLabel font];
    [v16 capHeight];
    v17 = [(NTKModuleView *)self device];
    CLKRoundForDevice();
    double v19 = v5 - v18;

    -[CDComplicationImageView setCenter:](self->_headerGlyph, "setCenter:", v15, v19);
  }
  [(CLKUIColoringLabel *)self->_headerLeadingLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_headerLeadingLabel frame];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel frame];
  [(CLKUIColoringLabel *)self->_headerLeadingLabel maxWidth];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel maxWidth];
  objc_super v20 = [(CLKUIColoringLabel *)self->_headerLeadingLabel font];
  [v20 ascender];
  v21 = [(NTKModuleView *)self device];
  CLKCeilForDevice();

  headerLeadingLabel = self->_headerLeadingLabel;
  v23 = [(NTKModuleView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](headerLeadingLabel, "setFrame:");

  headerTrailingLabel = self->_headerTrailingLabel;
  v25 = [(NTKModuleView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](headerTrailingLabel, "setFrame:");

  v26 = (void *)MEMORY[0x1E4F1CA48];
  double v27 = *(double *)&v54;
  v28 = [NSNumber numberWithDouble:*(double *)&v54];
  id v52 = [v26 arrayWithObject:v28];

  v29 = self->_headerGlyph;
  if (v29 && ([(CDComplicationImageView *)v29 isHidden] & 1) == 0)
  {
    [v52 addObject:self->_headerGlyph];
    v30 = [NSNumber numberWithDouble:*((double *)&v55 + 1)];
    [v52 addObject:v30];
  }
  [v52 addObject:self->_headerLeadingLabel];
  if (([(CLKUIColoringLabel *)self->_headerTrailingLabel isHidden] & 1) == 0)
  {
    v31 = [NSNumber numberWithDouble:v56];
    [v52 addObject:v31];

    [v52 addObject:self->_headerTrailingLabel];
  }
  [(NTKModuleView *)self naturalHorizontalLayoutForViewsAndSpacing:v52 columnAlignmentSpacing:0];
  double v32 = *(double *)&v55;
  if ((isKindOfClass & 1) == 0) {
    double v32 = v7;
  }
  double v33 = v5 + v32;
  body1Glyph = self->_body1Glyph;
  if (body1Glyph)
  {
    [(CDComplicationImageView *)body1Glyph sizeToFit];
    [(CDComplicationImageView *)self->_body1Glyph center];
    double v36 = v35;
    v37 = [(CLKUIColoringLabel *)self->_body1Label font];
    [v37 capHeight];
    v38 = [(NTKModuleView *)self device];
    CLKRoundForDevice();
    double v40 = v33 - v39;

    -[CDComplicationImageView setCenter:](self->_body1Glyph, "setCenter:", v36, v40);
  }
  [(CLKUIColoringLabel *)self->_body1Label frame];
  body1Label = self->_body1Label;
  [(CLKUIColoringLabel *)body1Label maxWidth];
  -[CLKUIColoringLabel sizeThatFits:](body1Label, "sizeThatFits:");
  [(CLKUIColoringLabel *)self->_body1Label maxWidth];
  v42 = [(CLKUIColoringLabel *)self->_body1Label font];
  [v42 ascender];
  v43 = [(NTKModuleView *)self device];
  CLKCeilForDevice();

  v44 = self->_body1Label;
  v45 = [(NTKModuleView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](v44, "setFrame:");

  v46 = [(NTKModuleView *)self viewsAndSpacingArrayForSpace:self->_body1Glyph view:self->_body1Label space:v27 view:*((double *)&v55 + 1)];
  [(NTKModuleView *)self naturalHorizontalLayoutForViewsAndSpacing:v46 columnAlignmentSpacing:0];
  body2Label = self->_body2Label;
  if (v10)
  {
    [(CLKUIColoringLabel *)body2Label setHidden:0];
    [(CLKUIColoringLabel *)self->_body2Label frame];
    v48 = self->_body2Label;
    [(CLKUIColoringLabel *)v48 maxWidth];
    -[CLKUIColoringLabel sizeThatFits:](v48, "sizeThatFits:");
    [(CLKUIColoringLabel *)self->_body2Label maxWidth];
    v49 = self->_body2Label;
    v50 = [(NTKModuleView *)self device];
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringLabel setFrame:](v49, "setFrame:");

    v51 = [(NTKModuleView *)self viewsAndSpacingArrayForSpace:self->_body2Label view:v27];
    [(NTKModuleView *)self naturalHorizontalLayoutForViewsAndSpacing:v51 columnAlignmentSpacing:0];
  }
  else
  {
    [(CLKUIColoringLabel *)body2Label setHidden:1];
  }
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  v4 = (void (**)(id, CDComplicationImageView *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_body1Glyph);
  (*v4)(v6, (CDComplicationImageView *)self->_headerLeadingLabel);
  (*v4)(v6, (CDComplicationImageView *)self->_headerTrailingLabel);
}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  v4 = (void (**)(id, CLKUIColoringLabel *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_body2Label);
}

- (id)_newLabelSubview
{
  id v3 = objc_alloc_init((Class)off_1E62BDB58);
  [(NTKModularLargeStackTemplateView *)self bounds];
  [v3 setMaxWidth:v4];
  [v3 setUppercase:0];
  double v5 = [(NTKModularTemplateView *)self timeTravelDate];
  [v3 setInTimeTravel:v5 != 0];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke;
  v10[3] = &unk_1E62C0040;
  objc_copyWeak(&v11, &location);
  [v3 setNowProvider:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke_2;
  v8[3] = &unk_1E62C0068;
  objc_copyWeak(&v9, &location);
  [v3 setNeedsResizeHandler:v8];
  id v6 = [(NTKModuleView *)self contentView];
  [v6 addSubview:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v3;
}

id __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  double v5 = v4;

  return v5;
}

void __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentView];
  [v1 setNeedsLayout];
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKModularLargeStackTemplateView *)self _newLabelSubview];
  [v5 setFont:v4];

  return v5;
}

- (void)_update
{
  id v4 = [(NTKModularTemplateView *)self complicationTemplate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NTKModularLargeStackTemplateView *)self _updateForStandardBodyTemplate:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NTKModularLargeStackTemplateView *)self _updateForTallBodyTemplate:v4];
    }
  }
  id v3 = [(NTKModuleView *)self contentView];
  [v3 setNeedsLayout];
}

- (void)_updateForStandardBodyTemplate:(id)a3
{
  id v33 = a3;
  id v4 = [v33 headerImageProvider];
  char v5 = [off_1E62BD5F0 existingImageView:self->_headerGlyph supportsImageProvider:v4];
  headerGlyph = self->_headerGlyph;
  if ((v5 & 1) == 0)
  {
    [(CDComplicationImageView *)headerGlyph removeFromSuperview];
    double v7 = [off_1E62BD5F0 viewForImageProvider:v4];
    v8 = self->_headerGlyph;
    self->_headerGlyph = v7;

    if (self->_headerGlyph)
    {
      id v9 = [(NTKModuleView *)self contentView];
      [v9 addSubview:self->_headerGlyph];

      BOOL v10 = self->_headerGlyph;
      id v11 = [(NTKModuleView *)self foregroundColor];
      [(CDComplicationImageView *)v10 setColor:v11];

      headerGlyph = self->_headerGlyph;
    }
    else
    {
      headerGlyph = 0;
    }
  }
  [(CDComplicationImageView *)headerGlyph setImageProvider:v4];
  v12 = [v33 body1ImageProvider];
  char v13 = [off_1E62BD5F0 existingImageView:self->_body1Glyph supportsImageProvider:v12];
  body1Glyph = self->_body1Glyph;
  if ((v13 & 1) == 0)
  {
    [(CDComplicationImageView *)body1Glyph removeFromSuperview];
    double v15 = [off_1E62BD5F0 viewForImageProvider:v12];
    v16 = self->_body1Glyph;
    self->_body1Glyph = v15;

    if (self->_body1Glyph)
    {
      v17 = [(NTKModuleView *)self contentView];
      [v17 addSubview:self->_body1Glyph];

      double v18 = self->_body1Glyph;
      double v19 = [(NTKModuleView *)self foregroundColor];
      [(CDComplicationImageView *)v18 setColor:v19];

      body1Glyph = self->_body1Glyph;
    }
    else
    {
      body1Glyph = 0;
    }
  }
  [(CDComplicationImageView *)body1Glyph setImageProvider:v12];
  headerLeadingLabel = self->_headerLeadingLabel;
  v21 = [v33 headerTextProvider];
  [(CLKUIColoringLabel *)headerLeadingLabel setTextProvider:v21];

  v22 = [v33 headerTrailingTextProvider];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel setTextProvider:v22];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel setHidden:v22 == 0];
  self->_shouldTruncateHeaderLeadingLabelFirst = [v33 shouldTruncateHeaderLeadingLabelFirst];
  body1Label = self->_body1Label;
  v24 = [v33 body1TextProvider];
  [(CLKUIColoringLabel *)body1Label setTextProvider:v24];

  v25 = self->_body1Label;
  v26 = (void *)MEMORY[0x1E4F19A50];
  double v27 = [(NTKModuleView *)self device];
  _LayoutConstants_21(v27, (uint64_t)v34);
  v28 = [v26 systemFontOfSize:v34[0]];
  [(CLKUIColoringLabel *)v25 setFont:v28];

  v29 = [v33 body2TextProvider];
  v30 = self->_body1Label;
  if (v29)
  {
    [(CLKUIColoringLabel *)v30 setNumberOfLines:1];
    body2Label = self->_body2Label;
    double v32 = v29;
  }
  else
  {
    [(CLKUIColoringLabel *)v30 setNumberOfLines:2];
    body2Label = self->_body2Label;
    double v32 = 0;
  }
  [(CLKUIColoringLabel *)body2Label setTextProvider:v32];
}

- (void)_updateForTallBodyTemplate:(id)a3
{
  id v4 = a3;
  id v21 = [v4 headerImageProvider];
  char v5 = objc_msgSend(off_1E62BD5F0, "existingImageView:supportsImageProvider:", self->_headerGlyph);
  headerGlyph = self->_headerGlyph;
  if ((v5 & 1) == 0)
  {
    [(CDComplicationImageView *)headerGlyph removeFromSuperview];
    double v7 = [off_1E62BD5F0 viewForImageProvider:v21];
    v8 = self->_headerGlyph;
    self->_headerGlyph = v7;

    if (self->_headerGlyph)
    {
      id v9 = [(NTKModuleView *)self contentView];
      [v9 addSubview:self->_headerGlyph];

      BOOL v10 = self->_headerGlyph;
      id v11 = [(NTKModuleView *)self foregroundColor];
      [(CDComplicationImageView *)v10 setColor:v11];

      headerGlyph = self->_headerGlyph;
    }
    else
    {
      headerGlyph = 0;
    }
  }
  [(CDComplicationImageView *)headerGlyph setImageProvider:v21];
  [(CLKUIColoringLabel *)self->_body2Label setTextProvider:0];
  headerLeadingLabel = self->_headerLeadingLabel;
  char v13 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLeadingLabel setTextProvider:v13];

  double v14 = [v4 headerTrailingTextProvider];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel setTextProvider:v14];
  [(CLKUIColoringLabel *)self->_headerTrailingLabel setHidden:v14 == 0];
  self->_shouldTruncateHeaderLeadingLabelFirst = [v4 shouldTruncateHeaderLeadingLabelFirst];
  body1Label = self->_body1Label;
  v16 = [v4 bodyTextProvider];

  [(CLKUIColoringLabel *)body1Label setTextProvider:v16];
  [(CLKUIColoringLabel *)self->_body1Label setNumberOfLines:1];
  v17 = self->_body1Label;
  double v18 = (void *)MEMORY[0x1E4F19A50];
  double v19 = [(NTKModuleView *)self device];
  _LayoutConstants_21(v19, (uint64_t)v22);
  objc_super v20 = [v18 systemFontOfSize:v23 weight:*MEMORY[0x1E4FB09C8]];
  [(CLKUIColoringLabel *)v17 setFont:v20];
}

- (void)_updateLabelsMaxWidths
{
  double v26 = 0.0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  id v3 = [(NTKModuleView *)self device];
  _LayoutConstants_21(v3, (uint64_t)&v23);

  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[CDComplicationImageView sizeThatFits:](self->_headerGlyph, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v5);
  double v7 = v6;
  -[CDComplicationImageView sizeThatFits:](self->_body1Glyph, "sizeThatFits:", v4, v5);
  double v9 = v8;
  BOOL v10 = [(NTKModuleView *)self contentView];
  [v10 bounds];
  double v12 = v11 - *(double *)&v24 - *((double *)&v24 + 1);

  headerGlyph = self->_headerGlyph;
  double v14 = 0.0;
  if (headerGlyph && ([(CDComplicationImageView *)headerGlyph isHidden] & 1) == 0) {
    double v14 = v7 + *((double *)&v25 + 1);
  }
  double v15 = v12 - v14;
  if (self->_shouldTruncateHeaderLeadingLabelFirst) {
    v16 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerLeadingLabel;
  }
  else {
    v16 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerTrailingLabel;
  }
  id v22 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v16);
  if (self->_shouldTruncateHeaderLeadingLabelFirst) {
    v17 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerTrailingLabel;
  }
  else {
    v17 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerLeadingLabel;
  }
  id v18 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v17);
  if (([v18 isHidden] & 1) == 0)
  {
    [v18 setMaxWidth:v12 - v14];
    objc_msgSend(v18, "sizeThatFits:", v12 - v14, 1.79769313e308);
    double v20 = v15 - v19 - v26;
    if (v20 >= 0.0) {
      double v15 = v20;
    }
    else {
      double v15 = 0.0;
    }
  }
  [v22 setMaxWidth:v15];
  double v21 = v9 + *((double *)&v25 + 1);
  if (!self->_body1Glyph) {
    double v21 = 0.0;
  }
  [(CLKUIColoringLabel *)self->_body1Label setMaxWidth:v12 - v21];
  [(CLKUIColoringLabel *)self->_body2Label setMaxWidth:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body1Glyph, 0);
  objc_storeStrong((id *)&self->_headerGlyph, 0);
  objc_storeStrong((id *)&self->_body2Label, 0);
  objc_storeStrong((id *)&self->_body1Label, 0);
  objc_storeStrong((id *)&self->_headerTrailingLabel, 0);
  objc_storeStrong((id *)&self->_headerLeadingLabel, 0);
}

@end