@interface _UIPrototypingMenuNumberCell
- (UILabel)maxLabel;
- (UILabel)minLabel;
- (UIStackView)floatValueStackView;
- (UITapGestureRecognizer)tapRecognizer;
- (_UIPrototypingMenuNumberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_UIPrototypingMenuSlider)slider;
- (double)current;
- (double)max;
- (double)min;
- (void)_prototypingSettingDidChange;
- (void)_sliderDidChangeValue:(id)a3;
- (void)_tapRecognizerDidRecognizer:(id)a3;
- (void)setCurrent:(double)a3;
- (void)setFloatValueStackView:(id)a3;
- (void)setMax:(double)a3;
- (void)setMaxLabel:(id)a3;
- (void)setMin:(double)a3;
- (void)setMinLabel:(id)a3;
- (void)setSlider:(id)a3;
- (void)setTapRecognizer:(id)a3;
@end

@implementation _UIPrototypingMenuNumberCell

- (_UIPrototypingMenuNumberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)_UIPrototypingMenuNumberCell;
  v4 = [(_UIPrototypingMenuCell *)&v25 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [UIStackView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[UIStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    floatValueStackView = v4->_floatValueStackView;
    v4->_floatValueStackView = (UIStackView *)v10;

    [(UIStackView *)v4->_floatValueStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_floatValueStackView setAxis:0];
    [(UIStackView *)v4->_floatValueStackView setDistribution:0];
    [(UIStackView *)v4->_floatValueStackView setSpacing:1.17549435e-38];
    [(UIStackView *)v4->_floatValueStackView setLayoutMarginsRelativeArrangement:1];
    -[UIView setLayoutMargins:](v4->_floatValueStackView, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    v12 = [(_UIPrototypingMenuCell *)v4 stackView];
    [v12 addArrangedSubview:v4->_floatValueStackView];

    v13 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    minLabel = v4->_minLabel;
    v4->_minLabel = v13;

    double v15 = *(double *)off_1E52D6BF8;
    v16 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:17.0 weight:*(double *)off_1E52D6BF8];
    [(UILabel *)v4->_minLabel setFont:v16];

    [(UIStackView *)v4->_floatValueStackView addArrangedSubview:v4->_minLabel];
    v17 = -[_UIPrototypingMenuSlider initWithFrame:]([_UIPrototypingMenuSlider alloc], "initWithFrame:", v6, v7, v8, v9);
    slider = v4->_slider;
    v4->_slider = v17;

    [(UIControl *)v4->_slider addTarget:v4 action:sel__sliderDidChangeValue_ forControlEvents:4096];
    [(UIStackView *)v4->_floatValueStackView addArrangedSubview:v4->_slider];
    v19 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    maxLabel = v4->_maxLabel;
    v4->_maxLabel = v19;

    v21 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:17.0 weight:v15];
    [(UILabel *)v4->_maxLabel setFont:v21];

    [(UILabel *)v4->_maxLabel setTextAlignment:2];
    [(UIStackView *)v4->_floatValueStackView addArrangedSubview:v4->_maxLabel];
    v22 = [[UITapGestureRecognizer alloc] initWithTarget:v4 action:sel__tapRecognizerDidRecognizer_];
    tapRecognizer = v4->_tapRecognizer;
    v4->_tapRecognizer = v22;

    [(UIView *)v4 addGestureRecognizer:v4->_tapRecognizer];
    [(UITableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)_tapRecognizerDidRecognizer:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v6 = [(_UIPrototypingMenuNumberCell *)self slider];
  double v7 = [(_UIPrototypingMenuNumberCell *)self slider];
  [v7 knobCenter];
  objc_msgSend(v6, "convertPoint:toView:", self);
  double v9 = v8;

  uint64_t v10 = [(_UIPrototypingMenuNumberCell *)self slider];
  id v11 = v10;
  if (v5 >= v9) {
    [v10 increment];
  }
  else {
    [v10 decrement];
  }
}

- (void)_prototypingSettingDidChange
{
  v28.receiver = self;
  v28.super_class = (Class)_UIPrototypingMenuNumberCell;
  [(_UIPrototypingMenuCell *)&v28 _prototypingSettingDidChange];
  v3 = [(_UIPrototypingMenuCell *)self prototypingSetting];
  [v3 stepSize];
  double v5 = v4;
  if (v4 == 0.0)
  {
    uint64_t v6 = [v3 type];
    if (v6 == 1)
    {
      double v5 = 0.01;
    }
    else if (!v6)
    {
      double v5 = 1.0;
    }
  }
  double v7 = [v3 minimumValue];
  [v7 floatValue];
  float v9 = v8;

  float v10 = v5;
  if (v10 <= 0.0) {
    goto LABEL_12;
  }
  if (fmod(v10, 1.0) == 0.0)
  {
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  if (fmod(v10, 0.1) == 0.0) {
    uint64_t v11 = 1;
  }
  else {
LABEL_12:
  }
    uint64_t v11 = 2;
LABEL_13:
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%.*f", v11, v9);
  [(UILabel *)self->_minLabel setText:v12];

  v13 = [v3 maximumValue];
  [v13 floatValue];
  float v15 = v14;

  if (v10 <= 0.0) {
    goto LABEL_18;
  }
  if (fmod(v10, 1.0) != 0.0)
  {
    if (fmod(v10, 0.1) == 0.0)
    {
      uint64_t v16 = 1;
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v16 = 2;
    goto LABEL_19;
  }
  uint64_t v16 = 0;
LABEL_19:
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%.*f", v16, v15);
  [(UILabel *)self->_maxLabel setText:v17];

  v18 = [v3 currentValue];
  [v18 floatValue];
  int v20 = v19;

  v21 = [(_UIPrototypingMenuNumberCell *)self slider];
  *(float *)&double v22 = v9;
  [v21 setMinimumValue:v22];

  v23 = [(_UIPrototypingMenuNumberCell *)self slider];
  *(float *)&double v24 = v15;
  [v23 setMaximumValue:v24];

  objc_super v25 = [(_UIPrototypingMenuNumberCell *)self slider];
  [v25 setStepSize:v5];

  v26 = [(_UIPrototypingMenuNumberCell *)self slider];
  LODWORD(v27) = v20;
  [v26 setValue:v27];
}

- (void)_sliderDidChangeValue:(id)a3
{
  double v4 = NSNumber;
  [a3 value];
  objc_msgSend(v4, "numberWithFloat:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = [(_UIPrototypingMenuCell *)self prototypingSetting];
  [v5 setCurrentValue:v6];
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)current
{
  return self->_current;
}

- (void)setCurrent:(double)a3
{
  self->_current = a3;
}

- (UIStackView)floatValueStackView
{
  return self->_floatValueStackView;
}

- (void)setFloatValueStackView:(id)a3
{
}

- (UILabel)minLabel
{
  return self->_minLabel;
}

- (void)setMinLabel:(id)a3
{
}

- (UILabel)maxLabel
{
  return self->_maxLabel;
}

- (void)setMaxLabel:(id)a3
{
}

- (_UIPrototypingMenuSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_maxLabel, 0);
  objc_storeStrong((id *)&self->_minLabel, 0);
  objc_storeStrong((id *)&self->_floatValueStackView, 0);
}

@end