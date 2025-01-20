@interface NTKRichComplicationBaseCircularStackTextView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (BOOL)templateWantsPlatter;
- (CLKUIColoringLabel)line1Label;
- (CLKUIColoringLabel)line2Label;
- (NTKRichComplicationBaseCircularStackTextView)initWithFamily:(int64_t)a3;
- (id)_createAndAddLabel;
- (id)_desiredFontForLabel:(id)a3;
- (int64_t)_line1FilterStyle;
- (int64_t)_line2FilterStyle;
- (unint64_t)highlightMode;
- (void)_editingDidEnd;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)layoutSubviews;
- (void)setHighlightMode:(unint64_t)a3;
- (void)setLine1Label:(id)a3;
- (void)setLine2Label:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularStackTextView

- (NTKRichComplicationBaseCircularStackTextView)initWithFamily:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  v3 = [(NTKRichComplicationCircularBaseView *)&v10 initWithFamily:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NTKRichComplicationBaseCircularStackTextView *)v3 _createAndAddLabel];
    line1Label = v4->_line1Label;
    v4->_line1Label = (CLKUIColoringLabel *)v5;

    uint64_t v7 = [(NTKRichComplicationBaseCircularStackTextView *)v4 _createAndAddLabel];
    line2Label = v4->_line2Label;
    v4->_line2Label = (CLKUIColoringLabel *)v7;
  }
  return v4;
}

- (id)_createAndAddLabel
{
  uint64_t v12 = 0;
  long long v11 = 0u;
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_28(v3, [(CDRichComplicationView *)self family], (uint64_t)&v10);

  id v4 = objc_alloc((Class)off_1E62BDB58);
  uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = (void *)*((void *)&v11 + 1);
  [v5 setFont:*((void *)&v11 + 1)];
  [v5 setTextAlignment:1];
  uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v5 setTextColor:v7];

  [v5 setUsesTextProviderTintColoring:1];
  [v5 setMaxWidth:*(double *)&v11];
  v8 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v8 addSubview:v5];

  [v5 setFilterProvider:self];
  return v5;
}

- (id)_desiredFontForLabel:(id)a3
{
  id v4 = a3;
  double v24 = 0.0;
  long long v23 = 0u;
  uint64_t v5 = [(CDRichComplicationView *)self device];
  _LayoutConstants_28(v5, [(CDRichComplicationView *)self family], (uint64_t)&v22);

  double v6 = *(double *)&v23;
  id v7 = *((id *)&v23 + 1);
  [v7 pointSize];
  double v9 = v8;
  [v4 widthForMaxWidth:v7 withFont:v6];
  double v11 = v10;
  uint64_t v12 = [v4 textProvider];
  uint64_t v13 = [v12 shrinkTextPreference];

  i = v7;
  if (v13)
  {
    if (v13 == 1) {
      double v15 = v24;
    }
    else {
      double v15 = 0.0;
    }
    double v16 = *MEMORY[0x1E4FB09D0];
    v17 = (void *)MEMORY[0x1E4F19680];
    for (i = v7; v11 > v6 && v9 > v15; i = (void *)v19)
    {
      double v9 = v9 + -1.0;
      uint64_t v19 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v17 weight:v9 design:v16];

      [v4 widthForMaxWidth:v19 withFont:v6];
      double v11 = v20;
    }
  }

  return i;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  [(NTKRichComplicationCircularBaseView *)&v32 layoutSubviews];
  v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  uint64_t v27 = v4;
  uint64_t v28 = v5;

  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  double v6 = [(CDRichComplicationView *)self device];
  _LayoutConstants_28(v6, [(CDRichComplicationView *)self family], (uint64_t)&v29);

  id v7 = [(NTKRichComplicationBaseCircularStackTextView *)self _desiredFontForLabel:self->_line1Label];
  [(CLKUIColoringLabel *)self->_line1Label setFont:v7];
  [(CLKUIColoringLabel *)self->_line1Label sizeToFit];
  [(CLKUIColoringLabel *)self->_line1Label frame];
  [(CLKUIColoringLabel *)self->_line1Label _lastLineBaseline];
  double v8 = [(CDRichComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[CLKUIColoringLabel setFrame:](self->_line1Label, "setFrame:", v10, v12, v14, v16);
  v17 = [(NTKRichComplicationBaseCircularStackTextView *)self _desiredFontForLabel:self->_line2Label];
  [(CLKUIColoringLabel *)self->_line2Label setFont:v17];
  [(CLKUIColoringLabel *)self->_line2Label sizeToFit];
  [(CLKUIColoringLabel *)self->_line2Label frame];
  [(CLKUIColoringLabel *)self->_line2Label _lastLineBaseline];
  v18 = [(CDRichComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  -[CLKUIColoringLabel setFrame:](self->_line2Label, "setFrame:", v20, v22, v24, v26);
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v10[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v11 = v5;
  double v12 = var2;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  [(CDRichComplicationView *)&v9 _setFontConfiguration:v10];
  id v7 = a3->var1;
  if (v7)
  {
    double v8 = a3->var2;
    [(CDRichComplicationView *)self _updateColoringLabel:self->_line1Label withFontDescriptor:v7 andSizeFactor:v8];
    [(CDRichComplicationView *)self _updateColoringLabel:self->_line2Label withFontDescriptor:v7 andSizeFactor:v8];
  }
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_editingDidEnd
{
  [(CLKUIColoringLabel *)self->_line1Label editingDidEnd];
  line2Label = self->_line2Label;
  [(CLKUIColoringLabel *)line2Label editingDidEnd];
}

- (BOOL)templateWantsPlatter
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CLKUIColoringLabel *)self->_line1Label transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularStackTextView *)self _line1FilterStyle] style:a3];
  [(CLKUIColoringLabel *)self->_line2Label transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularStackTextView *)self _line2FilterStyle] style:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  [(NTKRichComplicationCircularBaseView *)&v3 updateMonochromeColor];
  [(CLKUIColoringLabel *)self->_line1Label updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularStackTextView *)self _line1FilterStyle]];
  [(CLKUIColoringLabel *)self->_line2Label updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularStackTextView *)self _line2FilterStyle]];
}

- (int64_t)_line1FilterStyle
{
  objc_super v3 = [(CDRichComplicationView *)self device];
  char v4 = NTKShowGossamerUI(v3);

  if (v4) {
    return 2;
  }
  else {
    return 2 * (self->_highlightMode != 0);
  }
}

- (int64_t)_line2FilterStyle
{
  objc_super v3 = [(CDRichComplicationView *)self device];
  char v4 = NTKShowGossamerUI(v3);

  if (v4) {
    return 0;
  }
  else {
    return 2 * (self->_highlightMode == 0);
  }
}

- (CLKUIColoringLabel)line1Label
{
  return self->_line1Label;
}

- (void)setLine1Label:(id)a3
{
}

- (CLKUIColoringLabel)line2Label
{
  return self->_line2Label;
}

- (void)setLine2Label:(id)a3
{
}

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2Label, 0);
  objc_storeStrong((id *)&self->_line1Label, 0);
}

@end