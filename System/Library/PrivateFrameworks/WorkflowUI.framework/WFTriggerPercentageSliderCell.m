@interface WFTriggerPercentageSliderCell
- (UILabel)label;
- (UISlider)slider;
- (WFTriggerPercentageSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFTriggerPercentageSliderCellDelegate)delegate;
- (double)roundValue:(double)a3 toNearestStep:(double)a4;
- (double)sliderValue;
- (double)stepValue;
- (void)configureWithInitialValue:(double)a3 maximumValue:(double)a4 minimumValue:(double)a5 stepValue:(double)a6;
- (void)setDelegate:(id)a3;
- (void)setSliderValue:(double)a3;
- (void)setStepValue:(double)a3;
- (void)sliderValueChanged:(id)a3;
@end

@implementation WFTriggerPercentageSliderCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setStepValue:(double)a3
{
  self->_stepValue = a3;
}

- (double)stepValue
{
  return self->_stepValue;
}

- (UILabel)label
{
  return self->_label;
}

- (UISlider)slider
{
  return self->_slider;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerPercentageSliderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerPercentageSliderCellDelegate *)WeakRetained;
}

- (double)roundValue:(double)a3 toNearestStep:(double)a4
{
  float v4 = a3 / a4;
  return roundf(v4) * a4;
}

- (void)setSliderValue:(double)a3
{
  [(WFTriggerPercentageSliderCell *)self stepValue];
  [(WFTriggerPercentageSliderCell *)self roundValue:a3 toNearestStep:v5];
  double v7 = v6;
  id v9 = [(WFTriggerPercentageSliderCell *)self slider];
  *(float *)&double v8 = v7;
  [v9 setValue:0 animated:v8];
}

- (double)sliderValue
{
  v3 = [(WFTriggerPercentageSliderCell *)self slider];
  [v3 value];
  double v5 = v4;
  [(WFTriggerPercentageSliderCell *)self stepValue];
  [(WFTriggerPercentageSliderCell *)self roundValue:v5 toNearestStep:v6];
  double v8 = v7;

  return v8;
}

- (void)sliderValueChanged:(id)a3
{
  float v4 = [(WFTriggerPercentageSliderCell *)self slider];
  [(WFTriggerPercentageSliderCell *)self sliderValue];
  *(float *)&double v5 = v5;
  [v4 setValue:0 animated:v5];

  id v6 = [(WFTriggerPercentageSliderCell *)self delegate];
  [(WFTriggerPercentageSliderCell *)self sliderValue];
  objc_msgSend(v6, "sliderValueChangedToValue:");
}

- (void)configureWithInitialValue:(double)a3 maximumValue:(double)a4 minimumValue:(double)a5 stepValue:(double)a6
{
  float v10 = a4;
  v11 = [(WFTriggerPercentageSliderCell *)self slider];
  *(float *)&double v12 = v10;
  [v11 setMaximumValue:v12];

  v13 = [(WFTriggerPercentageSliderCell *)self slider];
  *(float *)&a5 = a5;
  LODWORD(v14) = LODWORD(a5);
  [v13 setMinimumValue:v14];

  [(WFTriggerPercentageSliderCell *)self setSliderValue:a3];
  [(WFTriggerPercentageSliderCell *)self setStepValue:a6];
}

- (WFTriggerPercentageSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)WFTriggerPercentageSliderCell;
  float v4 = [(WFTriggerPercentageSliderCell *)&v13 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    slider = v4->_slider;
    v4->_slider = (UISlider *)v5;

    [(UISlider *)v4->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    v4->_stepValue = 1.0;
    double v7 = [(WFTriggerPercentageSliderCell *)v4 contentView];
    [v7 addSubview:v4->_slider];

    double v8 = v4->_slider;
    id v9 = [(WFTriggerPercentageSliderCell *)v4 contentView];
    id v10 = (id)-[UISlider wf_addConstraintsToFillSuperview:insets:](v8, "wf_addConstraintsToFillSuperview:insets:", v9, 8.0, 8.0, 8.0, 8.0);

    [(UISlider *)v4->_slider addTarget:v4 action:sel_sliderValueChanged_ forControlEvents:4096];
    v11 = v4;
  }

  return v4;
}

@end