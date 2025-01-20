@interface VehicleColorPickerCell
- (VehicleColorPicker)colorPicker;
- (double)cellHeightWithWidth:(double)a3;
- (void)setColorPicker:(id)a3;
@end

@implementation VehicleColorPickerCell

- (double)cellHeightWithWidth:(double)a3
{
  p_colorPicker = &self->_colorPicker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorPicker);
  [WeakRetained layoutIfNeeded];

  id v5 = objc_loadWeakRetained((id *)p_colorPicker);
  [v5 bounds];
  [v5 sizeThatFits:v6, 1.79769313e308];
  double v8 = v7;

  double result = v8 + 16.0;
  if (v8 + 16.0 < 44.0) {
    return 44.0;
  }
  return result;
}

- (VehicleColorPicker)colorPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorPicker);

  return (VehicleColorPicker *)WeakRetained;
}

- (void)setColorPicker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end