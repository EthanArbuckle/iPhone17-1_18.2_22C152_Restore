@interface NTKCircularSmallStackTextComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKCircularSmallStackTextComplicationView)initWithFrame:(CGRect)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)_updateLabelColors;
- (void)_updateLabelsForFontChange;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
- (void)setUsesMultiColor:(BOOL)a3;
@end

@implementation NTKCircularSmallStackTextComplicationView

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
  return a3 == 4 || *MEMORY[0x1E4F19648] == a3;
}

- (NTKCircularSmallStackTextComplicationView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  id v3 = -[NTKCircularComplicationView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(NTKCircularComplicationView *)v3 _fontForDynamicFontSize:1];
    uint64_t v6 = [(NTKCircularComplicationView *)v4 _newLabelSubviewWithFont:v5];
    firstLineLabel = v4->_firstLineLabel;
    v4->_firstLineLabel = (CLKUIColoringLabel *)v6;

    uint64_t v8 = [(NTKCircularComplicationView *)v4 _newLabelSubviewWithFont:v5];
    secondLineLabel = v4->_secondLineLabel;
    v4->_secondLineLabel = (CLKUIColoringLabel *)v8;

    [(NTKCircularComplicationView *)v4 _layoutConstants];
    [(CLKUIColoringLabel *)v4->_firstLineLabel setMaxWidth:v11];
    [(CLKUIColoringLabel *)v4->_secondLineLabel setMaxWidth:v11];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  [(NTKCircularComplicationView *)&v21 layoutSubviews];
  [(NTKCircularSmallStackTextComplicationView *)self bounds];
  [(CLKUIColoringLabel *)self->_firstLineLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_secondLineLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_firstLineLabel frame];
  [(NTKCircularComplicationView *)self _layoutConstants];
  [(CLKUIColoringLabel *)self->_firstLineLabel _lastLineBaseline];
  [(NTKCircularComplicationView *)self _layoutConstants];
  id v3 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CLKUIColoringLabel setFrame:](self->_firstLineLabel, "setFrame:", v5, v7, v9, v11);
  [(CLKUIColoringLabel *)self->_secondLineLabel frame];
  [(NTKCircularComplicationView *)self _layoutConstants];
  [(NTKCircularComplicationView *)self _layoutConstants];
  [(CLKUIColoringLabel *)self->_secondLineLabel _lastLineBaseline];
  objc_super v12 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[CLKUIColoringLabel setFrame:](self->_secondLineLabel, "setFrame:", v14, v16, v18, v20);
}

- (void)_updateForTemplateChange
{
  id v7 = [(NTKCircularComplicationView *)self complicationTemplate];
  firstLineLabel = self->_firstLineLabel;
  double v4 = [v7 line1TextProvider];
  [(CLKUIColoringLabel *)firstLineLabel setTextProvider:v4];

  secondLineLabel = self->_secondLineLabel;
  double v6 = [v7 line2TextProvider];
  [(CLKUIColoringLabel *)secondLineLabel setTextProvider:v6];

  if ([(NTKCircularComplicationView *)self usesMediumLayout]) {
    [(NTKCircularSmallStackTextComplicationView *)self _updateLabelsForFontChange];
  }
  [(NTKCircularSmallStackTextComplicationView *)self _updateLabelColors];
  [(NTKCircularSmallStackTextComplicationView *)self setNeedsLayout];
}

- (void)_updateLabelColors
{
  [(NTKCircularComplicationView *)self _updateLabelViewColor:self->_firstLineLabel];
  secondLineLabel = self->_secondLineLabel;
  [(NTKCircularComplicationView *)self _updateLabelViewColor:secondLineLabel];
}

- (void)setForegroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  [(NTKCircularComplicationView *)&v4 setForegroundColor:a3];
  [(NTKCircularSmallStackTextComplicationView *)self _updateLabelColors];
}

- (void)setUsesMultiColor:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  [(NTKCircularComplicationView *)&v4 setUsesMultiColor:a3];
  [(NTKCircularSmallStackTextComplicationView *)self _updateLabelColors];
}

- (void)_updateLabelsForFontChange
{
  if ([(NTKCircularComplicationView *)self usesMediumLayout])
  {
    id v3 = [(CLKUIColoringLabel *)self->_firstLineLabel text];
    objc_super v4 = [(NTKCircularComplicationView *)self _mediumStackFontForText:v3];

    double v5 = [(CLKUIColoringLabel *)self->_secondLineLabel text];
    id v6 = [(NTKCircularComplicationView *)self _mediumStackFontForText:v5];
  }
  else
  {
    id v6 = [(NTKCircularComplicationView *)self _fontForDynamicFontSize:1];
    objc_super v4 = v6;
  }
  [(CLKUIColoringLabel *)self->_firstLineLabel setFont:v4];
  [(CLKUIColoringLabel *)self->_secondLineLabel setFont:v6];
  [(NTKCircularComplicationView *)self _layoutConstants];
  [(CLKUIColoringLabel *)self->_firstLineLabel setMaxWidth:v7];
  [(CLKUIColoringLabel *)self->_secondLineLabel setMaxWidth:v7];
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  objc_super v4 = (void (**)(id, CLKUIColoringLabel *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_secondLineLabel);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLineLabel, 0);
  objc_storeStrong((id *)&self->_firstLineLabel, 0);
}

@end