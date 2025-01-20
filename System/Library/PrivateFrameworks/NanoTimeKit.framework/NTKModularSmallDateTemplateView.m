@interface NTKModularSmallDateTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKModularSmallDateTemplateView)initWithFrame:(CGRect)a3;
- (id)_newLabelSubviewWithFont:(id)a3;
- (void)_configureContentSubviews;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_update;
- (void)setIsXL:(BOOL)a3;
@end

@implementation NTKModularSmallDateTemplateView

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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallDateTemplateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallDateTemplateView;
  id v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NTKModularSmallDateTemplateView *)v3 _configureContentSubviews];
  }
  return v4;
}

- (void)_configureContentSubviews
{
  id v11 = [(CLKUIColoringLabel *)self->_weekdayLabel textProvider];
  id v3 = [(CLKUIColoringLabel *)self->_dayLabel textProvider];
  [(CLKUIColoringLabel *)self->_weekdayLabel removeFromSuperview];
  [(CLKUIColoringLabel *)self->_dayLabel removeFromSuperview];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  v4 = [(NTKModuleView *)self device];
  _LayoutConstants_27(v4, [(NTKComplicationModuleView *)self isXL], &v12);

  v5 = objc_msgSend(MEMORY[0x1E4F19A50], "systemFontOfSize:weight:", v12);
  objc_super v6 = [(NTKModularSmallDateTemplateView *)self _newLabelSubviewWithFont:v5];
  weekdayLabel = self->_weekdayLabel;
  self->_weekdayLabel = v6;

  [(CLKUIColoringLabel *)self->_weekdayLabel setUppercase:1];
  [(CLKUIColoringLabel *)self->_weekdayLabel setTextProvider:v11];
  v8 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(double *)&v13 weight:*MEMORY[0x1E4FB09C8]];
  v9 = [(NTKModularSmallDateTemplateView *)self _newLabelSubviewWithFont:v8];
  dayLabel = self->_dayLabel;
  self->_dayLabel = v9;

  [(CLKUIColoringLabel *)self->_dayLabel setTextProvider:v3];
}

- (void)setIsXL:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKModularSmallDateTemplateView;
  [(NTKComplicationModuleView *)&v4 setIsXL:a3];
  [(NTKModularSmallDateTemplateView *)self _configureContentSubviews];
  [(NTKModularSmallDateTemplateView *)self _layoutContentView];
  [(NTKModuleView *)self _updateColors];
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)off_1E62BDB58);
  [v5 setNowProvider:&__block_literal_global_105];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__NTKModularSmallDateTemplateView__newLabelSubviewWithFont___block_invoke_2;
  v11[3] = &unk_1E62C0068;
  objc_copyWeak(&v12, &location);
  [v5 setNeedsResizeHandler:v11];
  [v5 setFont:v4];
  objc_super v6 = [(NTKModuleView *)self device];
  _LayoutConstants_27(v6, [(NTKComplicationModuleView *)self isXL], &v9);
  [v5 setMaxWidth:v10];

  v7 = [(NTKModuleView *)self contentView];
  [v7 addSubview:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __60__NTKModularSmallDateTemplateView__newLabelSubviewWithFont___block_invoke()
{
  return [MEMORY[0x1E4F19A20] complicationDate];
}

void __60__NTKModularSmallDateTemplateView__newLabelSubviewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentView];
  [v1 setNeedsLayout];
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
}

- (void)_layoutContentView
{
  id v3 = [(NTKModuleView *)self contentView];
  [v3 bounds];

  id v4 = [(NTKModuleView *)self device];
  _LayoutConstants_27(v4, [(NTKComplicationModuleView *)self isXL], &v27);
  double v23 = v28;

  id v5 = [(NTKModuleView *)self device];
  _LayoutConstants_27(v5, [(NTKComplicationModuleView *)self isXL], &v25);
  double v24 = v26;

  [(CLKUIColoringLabel *)self->_weekdayLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_weekdayLabel frame];
  objc_super v6 = [(NTKModuleView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [(CLKUIColoringLabel *)self->_weekdayLabel _lastLineBaseline];
  -[CLKUIColoringLabel setFrame:](self->_weekdayLabel, "setFrame:", v8, v23 - v13, v10, v12);
  [(CLKUIColoringLabel *)self->_dayLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_dayLabel frame];
  long long v14 = [(NTKModuleView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [(CLKUIColoringLabel *)self->_dayLabel _lastLineBaseline];
  dayLabel = self->_dayLabel;
  -[CLKUIColoringLabel setFrame:](dayLabel, "setFrame:", v16, v23 + v24 - v21, v18, v20);
}

- (void)_update
{
  id v6 = [(NTKModularTemplateView *)self complicationTemplate];
  -[NTKModularTemplateView setHighlightMode:](self, "setHighlightMode:", [v6 highlightMode]);
  id v3 = [v6 weekdayTextProvider];
  [(CLKUIColoringLabel *)self->_weekdayLabel setTextProvider:v3];

  id v4 = [v6 dayTextProvider];
  [(CLKUIColoringLabel *)self->_dayLabel setTextProvider:v4];

  id v5 = [(NTKModuleView *)self contentView];
  [v5 setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
}

@end