@interface PRREColorTableViewCell
- (PRREColorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_currentValue;
- (void)_configure;
- (void)_setCurrentValue:(id)a3;
- (void)_tapped:(id)a3;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
@end

@implementation PRREColorTableViewCell

- (PRREColorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PRREColorTableViewCell;
  v4 = [(PRREColorTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIColorWell *)objc_alloc_init(MEMORY[0x1E4FB1630]);
    well = v4->_well;
    v4->_well = v5;

    [(UIColorWell *)v4->_well setSupportsAlpha:0];
    [(UIColorWell *)v4->_well addTarget:v4 action:sel__valueChanged_ forControlEvents:4096];
    [(UIColorWell *)v4->_well addTarget:v4 action:sel__tapped_ forControlEvents:64];
    [(PRREColorTableViewCell *)v4 setAccessoryView:v4->_well];
  }
  return v4;
}

- (void)_configure
{
  v3.receiver = self;
  v3.super_class = (Class)PRREColorTableViewCell;
  [(PRRETableViewCell *)&v3 _configure];
  [(UIColorWell *)self->_well sizeToFit];
  [(PRREColorTableViewCell *)self setNeedsLayout];
}

- (id)_currentValue
{
  return [(UIColorWell *)self->_well selectedColor];
}

- (void)_setCurrentValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  [(UIColorWell *)self->_well setSelectedColor:v8];
}

- (void)_tapped:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1628]);
  [v4 setDelegate:self];
  [v4 setSupportsAlpha:0];
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v5 = a3;
  id v4 = [v5 selectedColor];
  [(PRREColorTableViewCell *)self _setCurrentValue:v4];

  [(PRRETableViewCell *)self _valueChanged:self];
  [v5 setDelegate:0];
}

- (void).cxx_destruct
{
}

@end