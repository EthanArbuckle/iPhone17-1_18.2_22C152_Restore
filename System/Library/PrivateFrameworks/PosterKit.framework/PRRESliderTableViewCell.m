@interface PRRESliderTableViewCell
- (PRRESliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_currentValue;
- (void)_configure;
- (void)_setCurrentValue:(id)a3;
@end

@implementation PRRESliderTableViewCell

- (PRRESliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PRRESliderTableViewCell;
  v4 = [(PRRESliderTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISlider *)objc_alloc_init(MEMORY[0x1E4FB1C38]);
    slider = v4->_slider;
    v4->_slider = v5;

    [(UISlider *)v4->_slider addTarget:v4 action:sel__valueChanged_ forControlEvents:4096];
    [(PRRESliderTableViewCell *)v4 setAccessoryView:v4->_slider];
  }
  return v4;
}

- (void)_configure
{
  v4.receiver = self;
  v4.super_class = (Class)PRRESliderTableViewCell;
  [(PRRETableViewCell *)&v4 _configure];
  [(UISlider *)self->_slider setMinimumValue:0.0];
  LODWORD(v3) = 1.0;
  [(UISlider *)self->_slider setMaximumValue:v3];
}

- (id)_currentValue
{
  v2 = NSNumber;
  [(UISlider *)self->_slider value];
  return (id)objc_msgSend(v2, "numberWithFloat:");
}

- (void)_setCurrentValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v12 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v12;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  slider = self->_slider;
  [v7 floatValue];
  int v10 = v9;

  LODWORD(v11) = v10;
  [(UISlider *)slider setValue:v11];
}

- (void).cxx_destruct
{
}

@end