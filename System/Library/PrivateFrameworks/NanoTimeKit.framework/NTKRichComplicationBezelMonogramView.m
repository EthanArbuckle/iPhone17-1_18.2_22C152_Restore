@interface NTKRichComplicationBezelMonogramView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (id)_createLabelViewWithFont:(id)a3;
- (id)_labelFont;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationBezelMonogramView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  v5 = [a3 textProvider];
  [(CLKUIColoringLabel *)self->_textLabel setTextProvider:v5];

  v6 = [(NTKRichComplicationBezelMonogramView *)self _labelFont];
  [(CLKUIColoringLabel *)self->_textLabel setFont:v6];

  [(NTKRichComplicationBezelMonogramView *)self setNeedsLayout];
}

- (id)_labelFont
{
  id v3 = [(CDRichComplicationView *)self device];
  double v4 = _LayoutConstants(v3);
  double v6 = v5;
  double v8 = v7;

  v9 = [(CLKUIColoringLabel *)self->_textLabel text];
  unint64_t v10 = [v9 length];

  if (v10 == 2) {
    double v11 = v6;
  }
  else {
    double v11 = v4;
  }
  if (v10 > 2) {
    double v11 = v8;
  }
  v12 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v11 design:*MEMORY[0x1E4FB09E0]];
  v13 = [v12 CLKFontWithAlternativePunctuation];

  return v13;
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)off_1E62BDB58);
  [v5 setInTimeTravel:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__NTKRichComplicationBezelMonogramView__createLabelViewWithFont___block_invoke;
  v12[3] = &unk_1E62C0040;
  objc_copyWeak(&v13, &location);
  [v5 setNowProvider:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__NTKRichComplicationBezelMonogramView__createLabelViewWithFont___block_invoke_2;
  v10[3] = &unk_1E62C0068;
  objc_copyWeak(&v11, &location);
  [v5 setNeedsResizeHandler:v10];
  double v6 = [(CDRichComplicationView *)self device];
  _LayoutConstants(v6);
  [v5 setMaxWidth:v7];

  [v5 setUppercase:1];
  [v5 setFont:v4];
  double v8 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setTextColor:v8];

  objc_storeStrong((id *)&self->_textLabel, v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v5;
}

id __65__NTKRichComplicationBezelMonogramView__createLabelViewWithFont___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  id v3 = [WeakRetained complicationDate];

  return v3;
}

void __65__NTKRichComplicationBezelMonogramView__createLabelViewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void).cxx_destruct
{
}

@end