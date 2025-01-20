@interface NTKRichComplicationBezelBaseTextView
- (NTKRichComplicationBezelBaseTextView)init;
- (id)_createLabelViewWithFont:(id)a3;
- (id)_labelFont;
- (id)label;
- (void)_editingDidEnd;
- (void)_layoutLabel;
- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6;
- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5;
- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
@end

@implementation NTKRichComplicationBezelBaseTextView

- (NTKRichComplicationBezelBaseTextView)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBezelBaseTextView;
  v2 = [(NTKRichComplicationBezelView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_labelScale = 1.0;
    v4 = [(NTKRichComplicationBezelBaseTextView *)v2 _labelFont];
    uint64_t v5 = [(NTKRichComplicationBezelBaseTextView *)v3 _createLabelViewWithFont:v4];
    label = v3->_label;
    v3->_label = (CLKUIColoringView *)v5;

    [(NTKRichComplicationBezelBaseTextView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (id)label
{
  return self->_label;
}

- (id)_labelFont
{
  v2 = [(CDRichComplicationView *)self device];
  double v3 = _LayoutConstants_31(v2);

  v4 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v3 design:*MEMORY[0x1E4FB09E0]];
  uint64_t v5 = [v4 CLKFontWithAlternativePunctuation];

  return v5;
}

- (void)setForegroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseTextView;
  id v4 = a3;
  [(CDRichComplicationView *)&v5 setForegroundColor:v4];
  -[CLKUIColoringView setColor:](self->_label, "setColor:", v4, v5.receiver, v5.super_class);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationBezelBaseTextView;
  [(NTKRichComplicationBezelBaseTextView *)&v13 layoutSubviews];
  [(NTKRichComplicationBezelBaseTextView *)self _layoutLabel];
  double v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_31(v3);
  double v5 = v4;

  [(CLKUIColoringView *)self->_label frame];
  if (v8 < v5) {
    double v8 = v5;
  }
  CGRect v14 = CGRectInset(*(CGRect *)&v6, -3.0, -3.0);
  -[NTKRichComplicationBezelView _updateHitTestShape:frame:](self, "_updateHitTestShape:frame:", 1, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  v10 = [(NTKRichComplicationBezelView *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(NTKRichComplicationBezelView *)self delegate];
    [v12 didUpdateBezelTextForRichComplicationBezelView:self];
  }
}

- (void)_layoutLabel
{
  double v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_31(v3);
  double v5 = v4;

  [(NTKRichComplicationBezelBaseTextView *)self bounds];
  double v7 = v6;
  label = self->_label;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v23[0] = *MEMORY[0x1E4F1DAB8];
  v23[1] = v9;
  v23[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CLKUIColoringView *)label setTransform:v23];
  [(CLKUIColoringView *)self->_label sizeToFit];
  [(CLKUIColoringView *)self->_label frame];
  double v11 = v10;
  double v13 = v12;
  double v14 = (v7 - v10) * 0.5;
  v15 = [(NTKRichComplicationBezelBaseTextView *)self _labelFont];
  [v15 ascender];
  *(float *)&double v16 = v5 - v16;
  double v17 = ceilf(*(float *)&v16);

  -[CLKUIColoringView setFrame:](self->_label, "setFrame:", 0.0, 0.0, v11, v13);
  -[NTKRichComplicationBezelView _setLayoutTransformToView:origin:rotationInDegree:centerScale:](self, "_setLayoutTransformToView:origin:rotationInDegree:centerScale:", self->_label, v14, v17, self->_labelRotationInDegree, 1.0);
  v18 = self->_label;
  if (v18)
  {
    [(CLKUIColoringView *)v18 transform];
    v19 = self->_label;
  }
  else
  {
    v19 = 0;
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformScale(&v22, &v21, self->_labelScale, self->_labelScale);
  CGAffineTransform v20 = v22;
  [(CLKUIColoringView *)v19 setTransform:&v20];
}

- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  if ((unint64_t)a5 <= 1) {
    CLKCompressFraction();
  }
  double v7 = [(CDRichComplicationView *)self device];
  _LayoutConstants_31(v7);

  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1) {
    double v8 = -v8;
  }
  self->_labelRotationInDegree = v8;

  [(NTKRichComplicationBezelBaseTextView *)self setNeedsLayout];
}

- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6
{
  if (!a6) {
    [(NTKRichComplicationBezelBaseTextView *)self _setWhistlerAnalogEditingTransitonFraction:a4 direction:a5 position:a3];
  }
}

- (void)_editingDidEnd
{
  self->_labelRotationInDegree = 0.0;
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CLKInterpolateBetweenFloatsClipped();
  self->_labelScale = v5;

  [(NTKRichComplicationBezelBaseTextView *)self _layoutLabel];
}

- (void).cxx_destruct
{
}

- (id)_createLabelViewWithFont:(id)a3
{
  return 0;
}

@end