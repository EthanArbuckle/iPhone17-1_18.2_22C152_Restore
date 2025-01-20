@interface NTKModularLargeTableTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (NTKModularLargeTableTemplateView)initWithFrame:(CGRect)a3;
- (void)_enumerateColumnRowsWithBlock:(id)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_update;
@end

@implementation NTKModularLargeTableTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKModularLargeTableTemplateView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKModularLargeTableTemplateView;
  id v3 = -[NTKModuleView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NTKModularLargeColumnTemplateView *)v3 _newHeaderLabelSubview];
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (CLKUIColoringLabel *)v5;

    uint64_t v7 = [(NTKModularLargeColumnTemplateView *)v4 _newBodyLabelSubview];
    row1Column1Label = v4->_row1Column1Label;
    v4->_row1Column1Label = (CLKUIColoringLabel *)v7;

    uint64_t v9 = [(NTKModularLargeColumnTemplateView *)v4 _newBodyLabelSubview];
    row1Column2Label = v4->_row1Column2Label;
    v4->_row1Column2Label = (CLKUIColoringLabel *)v9;

    uint64_t v11 = [(NTKModularLargeColumnTemplateView *)v4 _newBodyLabelSubview];
    row2Column1Label = v4->_row2Column1Label;
    v4->_row2Column1Label = (CLKUIColoringLabel *)v11;

    uint64_t v13 = [(NTKModularLargeColumnTemplateView *)v4 _newBodyLabelSubview];
    row2Column2Label = v4->_row2Column2Label;
    v4->_row2Column2Label = (CLKUIColoringLabel *)v13;
  }
  return v4;
}

- (void)_layoutContentView
{
  id v3 = [(NTKModuleView *)self contentView];
  [v3 bounds];
  double v5 = v4;

  v6 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v6, &v22);
  double v7 = *((double *)&v22 + 1);

  v8 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v8, &v20);
  double v9 = v21;

  [(CDComplicationImageView *)self->_headerImageView sizeToFit];
  [(CDComplicationImageView *)self->_headerImageView frame];
  double v11 = v5 - v7 - v9;
  if (v10 > 0.0)
  {
    double v12 = v10;
    uint64_t v13 = [(NTKModuleView *)self device];
    _LayoutConstants_38(v13, &v18);
    double v11 = v11 - (v12 + v19);
  }
  [(CLKUIColoringLabel *)self->_headerLabel setMaxWidth:v11];
  [(CLKUIColoringLabel *)self->_headerLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_headerLabel frame];
  -[CLKUIColoringLabel setFrame:](self->_headerLabel, "setFrame:");
  headerImageView = self->_headerImageView;
  headerLabel = self->_headerLabel;
  objc_super v16 = [(NTKModuleView *)self device];
  [(NTKModularLargeColumnTemplateView *)self _positionLeadingAlignedImageView:headerImageView label:headerLabel withBaselineOffset:_LargeModularLayoutConstants(v16)];

  id v17 = [(NTKModularTemplateView *)self complicationTemplate];
  -[NTKModularLargeColumnTemplateView _layoutRowsOfColumnsWithAlignment:](self, "_layoutRowsOfColumnsWithAlignment:", [v17 column2Alignment]);
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  double v4 = (void (**)(id, CLKUIColoringLabel *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_headerLabel);
}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  double v4 = (void (**)(id, CLKUIColoringLabel *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_row1Column2Label);
  (*v4)(v6, self->_row2Column1Label);
  (*v4)(v6, self->_row2Column2Label);
}

- (void)_enumerateColumnRowsWithBlock:(id)a3
{
  double v12 = (void (**)(id, void, CLKUIColoringLabel *, CLKUIColoringLabel *, double))a3;
  double v4 = [(NTKModuleView *)self device];
  double v5 = _LargeModularLayoutConstants(v4);

  id v6 = [(NTKModuleView *)self device];
  _LargeModularLayoutConstants(v6);
  double v8 = v5 + v7;

  v12[2](v12, 0, self->_row1Column1Label, self->_row1Column2Label, v8);
  double v9 = [(NTKModuleView *)self device];
  _LargeModularLayoutConstants(v9);
  double v11 = v8 + v10;

  v12[2](v12, 0, self->_row2Column1Label, self->_row2Column2Label, v11);
}

- (void)_update
{
  id v22 = [(NTKModularTemplateView *)self complicationTemplate];
  id v3 = [v22 headerImageProvider];
  char v4 = [off_1E62BD5F0 existingImageView:self->_headerImageView supportsImageProvider:v3];
  headerImageView = self->_headerImageView;
  if ((v4 & 1) == 0)
  {
    [(CDComplicationImageView *)headerImageView removeFromSuperview];
    id v6 = [off_1E62BD5F0 viewForImageProvider:v3];
    double v7 = self->_headerImageView;
    self->_headerImageView = v6;

    if (self->_headerImageView)
    {
      double v8 = [(NTKModuleView *)self contentView];
      [v8 addSubview:self->_headerImageView];

      double v9 = self->_headerImageView;
      double v10 = [(NTKModuleView *)self foregroundColor];
      [(CDComplicationImageView *)v9 setColor:v10];

      headerImageView = self->_headerImageView;
    }
    else
    {
      headerImageView = 0;
    }
  }
  [(CDComplicationImageView *)headerImageView setImageProvider:v3];
  [(CDComplicationImageView *)self->_headerImageView setHidden:v3 == 0];
  headerLabel = self->_headerLabel;
  double v12 = [v22 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v12];

  row1Column1Label = self->_row1Column1Label;
  v14 = [v22 row1Column1TextProvider];
  [(CLKUIColoringLabel *)row1Column1Label setTextProvider:v14];

  row1Column2Label = self->_row1Column2Label;
  objc_super v16 = [v22 row1Column2TextProvider];
  [(CLKUIColoringLabel *)row1Column2Label setTextProvider:v16];

  row2Column1Label = self->_row2Column1Label;
  long long v18 = [v22 row2Column1TextProvider];
  [(CLKUIColoringLabel *)row2Column1Label setTextProvider:v18];

  row2Column2Label = self->_row2Column2Label;
  long long v20 = [v22 row2Column2TextProvider];
  [(CLKUIColoringLabel *)row2Column2Label setTextProvider:v20];

  -[NTKModularLargeColumnTemplateView setUseNoColumnPadding:](self, "setUseNoColumnPadding:", [v22 useNoColumnPadding]);
  double v21 = [(NTKModuleView *)self contentView];
  [v21 setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2Label, 0);
  objc_storeStrong((id *)&self->_row2Column1Label, 0);
  objc_storeStrong((id *)&self->_row1Column2Label, 0);
  objc_storeStrong((id *)&self->_row1Column1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);

  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end