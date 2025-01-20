@interface PNPWizardInkWeightControl
- (CGSize)intrinsicContentSize;
- (PNPWizardInkWeightControl)initWithFrame:(CGRect)a3;
- (double)value;
- (id)_knobColor;
- (void)layoutSubviews;
- (void)setValue:(double)a3;
@end

@implementation PNPWizardInkWeightControl

- (PNPWizardInkWeightControl)initWithFrame:(CGRect)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)PNPWizardInkWeightControl;
  v3 = -[PNPWizardInkWeightControl initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(PNPGradientView);
  gradient = v3->_gradient;
  v3->_gradient = v4;

  v6 = [MEMORY[0x263F1C550] colorWithWhite:0.91 alpha:1.0];
  v7 = [MEMORY[0x263F1C550] colorWithWhite:0.67 alpha:1.0];
  v8 = [(PNPGradientView *)v3->_gradient gradientLayer];
  id v9 = v6;
  v19[0] = [v9 CGColor];
  id v10 = v7;
  v19[1] = [v10 CGColor];
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v8 setColors:v11];

  objc_msgSend(v8, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v8, "setEndPoint:", 1.0, 0.5);
  [v8 setLocations:&unk_26ECE7A80];
  [(PNPWizardInkWeightControl *)v3 addSubview:v3->_gradient];
  v12 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  knob = v3->_knob;
  v3->_knob = v12;

  v14 = [(UIView *)v3->_knob layer];
  id v15 = [MEMORY[0x263F1C550] colorWithWhite:0.976 alpha:1.0];
  objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  v16 = [(UIView *)v3->_knob layer];
  [v16 setBorderWidth:4.0];

  [(PNPWizardInkWeightControl *)v3 addSubview:v3->_knob];
  return v3;
}

- (id)_knobColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:self->_value * -0.24 + 0.91 alpha:1.0];
}

- (void)layoutSubviews
{
  [(PNPWizardInkWeightControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[PNPGradientView setFrame:](self->_gradient, "setFrame:");
  [(PNPGradientView *)self->_gradient _setContinuousCornerRadius:v6 * 0.5];
  knob = self->_knob;
  v8 = [(PNPWizardInkWeightControl *)self _knobColor];
  [(UIView *)knob setBackgroundColor:v8];

  [(PNPWizardInkWeightControl *)self intrinsicContentSize];
  double v10 = v9 * 2.6;
  UIRectCenteredYInRect();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(PNPWizardInkWeightControl *)self value];
  -[UIView setFrame:](self->_knob, "setFrame:", (v4 - v6) * v17, v12, v14, v16);
  objc_super v18 = self->_knob;
  [(UIView *)v18 _setCornerRadius:v10 * 0.5];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 100.0;
  double v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = fmin(fmax(a3, 0.0), 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knob, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end