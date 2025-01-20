@interface NTKSimpleTextComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (CDComplicationDisplayObserver)displayObserver;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKComplicationTemplateSimpleText)template;
- (CLKDevice)device;
- (CLKFont)font;
- (CLKUIColoringLabel)label;
- (NSDate)timeTravelDate;
- (NTKSimpleTextComplicationView)init;
- (id)_defaultFont;
- (id)complicationTemplate;
- (unint64_t)complicationType;
- (unint64_t)textLayoutStyle;
- (void)_updateLabelFrame;
- (void)layoutSubviews;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
- (void)setDevice:(id)a3;
- (void)setDisplayObserver:(id)a3;
- (void)setFont:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTemplate:(id)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTimeTravelDate:(id)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation NTKSimpleTextComplicationView

- (NTKSimpleTextComplicationView)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSimpleTextComplicationView;
  v2 = [(NTKSimpleTextComplicationView *)&v9 init];
  if (v2)
  {
    v3 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v4 = [v3 device];
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    v6 = [(NTKSimpleTextComplicationView *)v2 label];
    [(NTKSimpleTextComplicationView *)v2 addSubview:v6];

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKSimpleTextComplicationView *)v2 setBackgroundColor:v7];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSimpleTextComplicationView;
  [(NTKSimpleTextComplicationView *)&v3 layoutSubviews];
  [(NTKSimpleTextComplicationView *)self _updateLabelFrame];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  v8 = [(NTKSimpleTextComplicationView *)self device];
  _LayoutConstants_42(v8, (uint64_t)&v11);

  double v9 = v5 + *((double *)&v12 + 1);
  if (v5 + *((double *)&v12 + 1) < *((double *)&v11 + 1)) {
    double v9 = *((double *)&v11 + 1);
  }
  if (v7 >= *(double *)&v12) {
    double v10 = v7;
  }
  else {
    double v10 = *(double *)&v12;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_updateLabelFrame
{
  [(CLKUIColoringLabel *)self->_label sizeToFit];
  objc_super v3 = [(NTKSimpleTextComplicationView *)self device];
  _LayoutConstants_42(v3, (uint64_t)v9);
  double v4 = v10;

  [(CLKUIColoringLabel *)self->_label bounds];
  if (CGRectGetWidth(v12) > v4)
  {
    [(CLKUIColoringLabel *)self->_label frame];
    -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
  }
  [(NTKSimpleTextComplicationView *)self bounds];
  double v6 = v5 * 0.5;
  [(NTKSimpleTextComplicationView *)self bounds];
  label = self->_label;
  -[CLKUIColoringLabel setCenter:](label, "setCenter:", v6, v7 * 0.5);
}

- (CLKUIColoringLabel)label
{
  p_label = &self->_label;
  label = self->_label;
  if (!label)
  {
    id v5 = objc_alloc_init((Class)off_1E62BDB58);
    double v6 = [(NTKSimpleTextComplicationView *)self _defaultFont];
    [v5 setFont:v6];

    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__NTKSimpleTextComplicationView_label__block_invoke;
    v16[3] = &unk_1E62C0040;
    objc_copyWeak(&v17, &location);
    [v5 setNowProvider:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__NTKSimpleTextComplicationView_label__block_invoke_2;
    v14[3] = &unk_1E62C0068;
    objc_copyWeak(&v15, &location);
    [v5 setNeedsResizeHandler:v14];
    [v5 setTextAlignment:1];
    [v5 setAdjustsFontSizeToFitWidth:1];
    objc_storeStrong((id *)p_label, v5);
    objc_initWeak(&from, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__NTKSimpleTextComplicationView_label__block_invoke_3;
    v11[3] = &unk_1E62C0068;
    objc_copyWeak(&v12, &from);
    [v5 setNeedsResizeHandler:v11];
    double v7 = [(NTKSimpleTextComplicationView *)self device];
    _LayoutConstants_42(v7, (uint64_t)v10);
    [v5 setMaxWidth:v10[4]];

    v8 = [(NTKSimpleTextComplicationView *)self timeTravelDate];
    [v5 setInTimeTravel:v8 != 0];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    label = *p_label;
  }
  return label;
}

id __38__NTKSimpleTextComplicationView_label__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  objc_super v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  id v5 = v4;

  return v5;
}

void __38__NTKSimpleTextComplicationView_label__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

void __38__NTKSimpleTextComplicationView_label__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (id)_defaultFont
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  v2 = [(NTKSimpleTextComplicationView *)self device];
  _LayoutConstants_42(v2, (uint64_t)v6);

  objc_super v3 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:*(double *)v6 design:*MEMORY[0x1E4FB09E0]];
  id v4 = [v3 CLKFontWithAlternativePunctuation];

  return v4;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id v4 = [(CLKUIColoringLabel *)self->_label font];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(CLKUIColoringLabel *)self->_label setFont:v6];
    [(NTKSimpleTextComplicationView *)self setNeedsLayout];
  }
}

- (CLKFont)font
{
  return [(CLKUIColoringLabel *)self->_label font];
}

- (unint64_t)complicationType
{
  v2 = [(CLKComplicationTemplateSimpleText *)self->_template metadata];
  objc_super v3 = [v2 objectForKeyedSubscript:@"NTKSimpleTextComplicationTypeMetadataKey"];
  unint64_t v4 = [v3 unsignedIntValue];

  return v4;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  objc_storeStrong((id *)&self->_template, a3);
  id v6 = a3;
  uint64_t v7 = [v6 textProvider];
  [(CLKUIColoringLabel *)self->_label setTextProvider:v7];

  [(NTKSimpleTextComplicationView *)self setNeedsLayout];
}

- (id)complicationTemplate
{
  return self->_template;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return *MEMORY[0x1E4F19650] == a3;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  timeTravelDate = self->_timeTravelDate;
  id v15 = v6;
  if (v6)
  {
    if ([v6 isEqual:timeTravelDate]) {
      goto LABEL_14;
    }
    v8 = self->_timeTravelDate;
    BOOL v10 = [(CLKComplicationTemplateSimpleText *)self->_template timeTravelUpdateFrequency] == 2
       || v8 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0) {
      goto LABEL_14;
    }
    BOOL v10 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  label = self->_label;
  id v12 = [(NTKSimpleTextComplicationView *)self timeTravelDate];
  [(CLKUIColoringLabel *)label setInTimeTravel:v12 != 0];

  if (v10)
  {
    uint64_t v13 = self->_label;
    v14 = [(CLKComplicationTemplateSimpleText *)self->_template textProvider];
    [(CLKUIColoringLabel *)v13 setTextProvider:v14];
  }
LABEL_14:
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);
  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (void)setLabel:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (CLKComplicationTemplateSimpleText)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->displayObserver);
}

@end