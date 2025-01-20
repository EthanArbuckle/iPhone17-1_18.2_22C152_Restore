@interface RCPlaybackSettingSliderCell
+ (Class)sliderClass;
- (RCPlaybackSettingSliderCell)initWithFrame:(CGRect)a3;
- (double)sliderValue;
- (void)_updateSliderValue;
- (void)layoutMarginsDidChange;
- (void)setSliderValue:(double)a3;
- (void)updateConstraints;
@end

@implementation RCPlaybackSettingSliderCell

+ (Class)sliderClass
{
  return (Class)objc_opt_class();
}

- (RCPlaybackSettingSliderCell)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)RCPlaybackSettingSliderCell;
  v3 = -[RCPlaybackSettingSliderCell initWithFrame:](&v29, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIListContentConfiguration cellConfiguration];
    [(RCPlaybackSettingSliderCell *)v3 setContentConfiguration:v4];
    v5 = (RCPlaybackSettingsSlider *)objc_alloc_init((Class)[(id)objc_opt_class() sliderClass]);
    slider = v3->_slider;
    v3->_slider = v5;

    [(RCPlaybackSettingsSlider *)v3->_slider addTarget:v3 action:"_updateSliderValue" forControlEvents:4096];
    [(RCPlaybackSettingSliderCell *)v3 addSubview:v3->_slider];
    [(RCPlaybackSettingsSlider *)v3->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(RCPlaybackSettingSliderCell *)v3 contentView];
    [v7 directionalLayoutMargins];
    double v9 = v8;

    v10 = [(RCPlaybackSettingsSlider *)v3->_slider leadingAnchor];
    v11 = [(RCPlaybackSettingSliderCell *)v3 safeAreaLayoutGuide];
    v12 = [v11 leadingAnchor];
    uint64_t v13 = [v10 constraintEqualToAnchor:v12 constant:v9];
    sliderLeadingConstraint = v3->_sliderLeadingConstraint;
    v3->_sliderLeadingConstraint = (NSLayoutConstraint *)v13;

    [(NSLayoutConstraint *)v3->_sliderLeadingConstraint setActive:1];
    v15 = [(RCPlaybackSettingsSlider *)v3->_slider trailingAnchor];
    v16 = [(RCPlaybackSettingSliderCell *)v3 safeAreaLayoutGuide];
    v17 = [v16 trailingAnchor];
    uint64_t v18 = [v15 constraintEqualToAnchor:v17 constant:-v9];
    sliderTrailingConstraint = v3->_sliderTrailingConstraint;
    v3->_sliderTrailingConstraint = (NSLayoutConstraint *)v18;

    [(NSLayoutConstraint *)v3->_sliderTrailingConstraint setActive:1];
    v20 = [(RCPlaybackSettingsSlider *)v3->_slider topAnchor];
    v21 = [(RCPlaybackSettingSliderCell *)v3 safeAreaLayoutGuide];
    v22 = [v21 topAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [(RCPlaybackSettingsSlider *)v3->_slider bottomAnchor];
    v25 = [(RCPlaybackSettingSliderCell *)v3 safeAreaLayoutGuide];
    v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v27 setActive:1];
  }
  return v3;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)RCPlaybackSettingSliderCell;
  [(RCPlaybackSettingSliderCell *)&v3 layoutMarginsDidChange];
  [(RCPlaybackSettingSliderCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackSettingSliderCell;
  [(RCPlaybackSettingSliderCell *)&v6 updateConstraints];
  objc_super v3 = [(RCPlaybackSettingSliderCell *)self contentView];
  [v3 directionalLayoutMargins];
  double v5 = v4;

  [(NSLayoutConstraint *)self->_sliderLeadingConstraint setConstant:v5];
  [(NSLayoutConstraint *)self->_sliderTrailingConstraint setConstant:-v5];
}

- (void)setSliderValue:(double)a3
{
  float v4 = a3;
  *(float *)&a3 = v4;
  [(RCPlaybackSettingsSlider *)self->_slider setValue:a3];
  self->_currentSliderValue = v4;
}

- (double)sliderValue
{
  [(RCPlaybackSettingsSlider *)self->_slider value];
  return v2;
}

- (void)_updateSliderValue
{
  [(RCPlaybackSettingsSlider *)self->_slider value];
  float v4 = v3;
  if (self->_currentSliderValue != v3)
  {
    double v5 = [(RCPlaybackSettingCell *)self cellActionsDelegate];
    [v5 didUpdateSlider:self toValue:v4];

    self->_currentSliderValue = v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_sliderLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_slider, 0);
}

@end