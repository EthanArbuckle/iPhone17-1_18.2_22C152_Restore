@interface PUSlideshowSpeedCell
- (BOOL)isEnabled;
- (PUSlideshowSpeedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PUSlideshowSpeedCellDelegate)delegate;
- (double)stepDuration;
- (void)_stepDurationValueChanged:(id)a3;
- (void)_updateView;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStepDuration:(double)a3;
- (void)updateConstraints;
@end

@implementation PUSlideshowSpeedCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_speedConstraints, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_fasterGlyphImageView, 0);
  objc_storeStrong((id *)&self->_slowerGlyphImageView, 0);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (PUSlideshowSpeedCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSlideshowSpeedCellDelegate *)WeakRetained;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(PUSlideshowSpeedCell *)self _updateView];
  }
}

- (void)setStepDuration:(double)a3
{
  *(float *)&a3 = (float)(12 - (uint64_t)a3);
  [(UISlider *)self->_slider setValue:a3];
}

- (double)stepDuration
{
  [(UISlider *)self->_slider value];
  return 10.0 - (double)(uint64_t)v2 + 2.0;
}

- (void)_stepDurationValueChanged:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [(PUSlideshowSpeedCell *)self stepDuration];
    objc_msgSend(v7, "PUSlideshowSpeedCell:stepDurationDidChange:", self);
  }
}

- (void)_updateView
{
}

- (PUSlideshowSpeedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)PUSlideshowSpeedCell;
  v4 = [(PUSlideshowSpeedCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    [(PUSlideshowSpeedCell *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUSlideshowSpeedCell *)v5 setSelectionStyle:0];
    char v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hare.fill"];
    id v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIImageView *)v7 setTintColor:v8];

    [(UIImageView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(PUSlideshowSpeedCell *)v5 contentView];
    [v9 addSubview:v7];

    fasterGlyphImageView = v5->_fasterGlyphImageView;
    v5->_fasterGlyphImageView = v7;
    v11 = v7;

    v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"tortoise.fill"];
    v13 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
    [(UIImageView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIImageView *)v13 setTintColor:v14];

    v15 = [(PUSlideshowSpeedCell *)v5 contentView];
    [v15 addSubview:v13];

    slowerGlyphImageView = v5->_slowerGlyphImageView;
    v5->_slowerGlyphImageView = v13;
    v17 = v13;

    v18 = (UISlider *)objc_alloc_init(MEMORY[0x1E4FB1C38]);
    [(UISlider *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 2.0;
    [(UISlider *)v18 setMinimumValue:v19];
    LODWORD(v20) = 10.0;
    [(UISlider *)v18 setMaximumValue:v20];
    [(UISlider *)v18 setContinuous:0];
    [(UISlider *)v18 addTarget:v5 action:sel__stepDurationValueChanged_ forControlEvents:4096];
    v21 = [(PUSlideshowSpeedCell *)v5 contentView];
    [v21 addSubview:v18];

    slider = v5->_slider;
    v5->_slider = v18;
  }
  return v5;
}

- (void)updateConstraints
{
  if (self->_slider)
  {
    slowerGlyphImageView = self->_slowerGlyphImageView;
    if (slowerGlyphImageView)
    {
      fasterGlyphImageView = self->_fasterGlyphImageView;
      if (fasterGlyphImageView)
      {
        if (!self->_speedConstraints)
        {
          v5 = _NSDictionaryOfVariableBindings(&cfstr_Slowerglyphima.isa, slowerGlyphImageView, fasterGlyphImageView, self->_slider, 0);
          char v6 = [MEMORY[0x1E4F1CA48] array];
          id v7 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_slowerGlyphImageView]-[_slider]-[_fasterGlyphImageView]-|" options:0 metrics:0 views:v5];
          [(NSArray *)v6 addObjectsFromArray:v7];

          v8 = (void *)MEMORY[0x1E4F28DC8];
          slider = self->_slider;
          v10 = [(PUSlideshowSpeedCell *)self contentView];
          v11 = [v8 constraintWithItem:slider attribute:10 relatedBy:0 toItem:v10 attribute:10 multiplier:1.0 constant:0.0];
          [(NSArray *)v6 addObject:v11];

          v12 = (void *)MEMORY[0x1E4F28DC8];
          v13 = self->_slowerGlyphImageView;
          v14 = [(PUSlideshowSpeedCell *)self contentView];
          v15 = [v12 constraintWithItem:v13 attribute:10 relatedBy:0 toItem:v14 attribute:10 multiplier:1.0 constant:0.0];
          [(NSArray *)v6 addObject:v15];

          v16 = (void *)MEMORY[0x1E4F28DC8];
          v17 = self->_fasterGlyphImageView;
          v18 = [(PUSlideshowSpeedCell *)self contentView];
          double v19 = [v16 constraintWithItem:v17 attribute:10 relatedBy:0 toItem:v18 attribute:10 multiplier:1.0 constant:0.0];
          [(NSArray *)v6 addObject:v19];

          [MEMORY[0x1E4F28DC8] activateConstraints:v6];
          speedConstraints = self->_speedConstraints;
          self->_speedConstraints = v6;
        }
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PUSlideshowSpeedCell;
  [(PUSlideshowSpeedCell *)&v21 updateConstraints];
}

@end