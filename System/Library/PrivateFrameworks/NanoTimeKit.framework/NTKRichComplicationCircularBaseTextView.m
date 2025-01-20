@interface NTKRichComplicationCircularBaseTextView
- (NTKRichComplicationCircularBaseTextView)init;
- (NTKRichComplicationCircularBaseTextView)initWithFamily:(int64_t)a3;
- (id)_createLabelViewWithFont:(id)a3;
- (id)_labelFont;
- (id)label;
- (void)_layoutLabel;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)_setLayoutTransformToView:(id)a3 origin:(CGPoint)a4 centerScale:(double)a5;
- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
@end

@implementation NTKRichComplicationCircularBaseTextView

- (NTKRichComplicationCircularBaseTextView)init
{
  return [(NTKRichComplicationCircularBaseTextView *)self initWithFamily:10];
}

- (NTKRichComplicationCircularBaseTextView)initWithFamily:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  v3 = [(NTKRichComplicationCircularBaseView *)&v14 initWithFamily:a3];
  v4 = v3;
  if (v3)
  {
    v3->_labelScale = 1.0;
    v5 = [(NTKRichComplicationCircularBaseTextView *)v3 _labelFont];
    uint64_t v6 = [(NTKRichComplicationCircularBaseTextView *)v4 _createLabelViewWithFont:v5];
    label = v4->_label;
    v4->_label = (CLKUIColoringView *)v6;

    v8 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
    [v8 addSubview:v4->_label];

    v9 = [(NTKRichComplicationCircularBaseView *)v4 framingView];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v10];

    v11 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [v11 setBackgroundColor:v12];
  }
  return v4;
}

- (id)label
{
  return self->_label;
}

- (id)_labelFont
{
  id v2 = [(CDRichComplicationView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_49);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_49);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_49);
    if (v5 == v2)
    {
      uint64_t v6 = [v2 version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_49;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_49, v2);
  _LayoutConstants___previousCLKDeviceVersion_49 = [v2 version];

  ___LayoutConstants_block_invoke_47(v9, (uint64_t)v2);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_49);
  double v10 = *(double *)&_LayoutConstants___constants_0_8;

  v11 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v10 design:*MEMORY[0x1E4FB09E0]];
  v12 = [v11 CLKFontWithAlternativePunctuation];

  return v12;
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v10[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v11 = v5;
  double v12 = var2;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  [(CDRichComplicationView *)&v9 _setFontConfiguration:v10];
  if (a3->var1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id var1 = a3->var1;
    if (isKindOfClass)
    {
      [(CDRichComplicationView *)self _updateColoringLabel:self->_label withFontDescriptor:var1 andSizeFactor:a3->var2];
      id var1 = a3->var1;
    }
  }
  else
  {
    id var1 = 0;
  }
}

- (void)setForegroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  id v4 = a3;
  [(CDRichComplicationView *)&v5 setForegroundColor:v4];
  -[CLKUIColoringView setColor:](self->_label, "setColor:", v4, v5.receiver, v5.super_class);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  [(NTKRichComplicationCircularBaseView *)&v3 layoutSubviews];
  [(NTKRichComplicationCircularBaseTextView *)self _layoutLabel];
}

- (void)_layoutLabel
{
  objc_super v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  label = self->_label;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v28[0] = *MEMORY[0x1E4F1DAB8];
  v28[1] = v13;
  v28[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CLKUIColoringView *)label setTransform:v28];
  [(CLKUIColoringView *)self->_label sizeToFit];
  [(CLKUIColoringView *)self->_label frame];
  objc_super v14 = [(NTKRichComplicationCircularBaseTextView *)self _labelFont];
  [v14 ascender];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CLKUIColoringView *)self->_label _firstLineBaseline];
LABEL_5:
    v15 = [(NTKRichComplicationCircularBaseTextView *)self _labelFont];
    [v15 capHeight];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CLKUIColoringView *)self->_label _lastLineBaseline];
    goto LABEL_5;
  }
LABEL_6:
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  CGRectGetMidY(v29);
  v16 = [(CDRichComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  -[CLKUIColoringView setFrame:](self->_label, "setFrame:", v18, v20, v22, v24);
  CGAffineTransformMakeScale(&v27, self->_labelScale, self->_labelScale);
  v25 = self->_label;
  CGAffineTransform v26 = v27;
  [(CLKUIColoringView *)v25 setTransform:&v26];
}

- (void)_setLayoutTransformToView:(id)a3 origin:(CGPoint)a4 centerScale:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  [(NTKRichComplicationCircularBaseTextView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v22.c = v14;
  *(_OWORD *)&v22.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v21.a = *(_OWORD *)&v22.a;
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tdouble x = *(_OWORD *)&v22.tx;
  CGAffineTransformTranslate(&v22, &v21, x, y);
  [v9 center];
  CGFloat v16 = v11 * 0.5 - x - v15;
  [v9 center];
  CGFloat v18 = v13 * 0.5 - y - v17;
  CGAffineTransform v20 = v22;
  CGAffineTransformTranslate(&v21, &v20, v16, v18);
  CGAffineTransform v22 = v21;
  CGAffineTransform v20 = v21;
  CGAffineTransformScale(&v21, &v20, a5, a5);
  CGAffineTransform v22 = v21;
  CGAffineTransform v20 = v21;
  CGAffineTransformTranslate(&v21, &v20, -v16, -v18);
  CGAffineTransform v22 = v21;
  CGAffineTransform v19 = v21;
  [v9 setTransform:&v19];
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CLKInterpolateBetweenFloatsClipped();
  self->_labelScale = v5;
  [(NTKRichComplicationCircularBaseTextView *)self _layoutLabel];
}

- (void).cxx_destruct
{
}

- (id)_createLabelViewWithFont:(id)a3
{
  return 0;
}

@end