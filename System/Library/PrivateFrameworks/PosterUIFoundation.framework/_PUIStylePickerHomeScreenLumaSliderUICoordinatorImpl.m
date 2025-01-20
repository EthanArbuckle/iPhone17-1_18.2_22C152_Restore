@interface _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl
- (_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl)initWithStyle:(id)a3;
- (id)effectiveColor;
- (id)variationSliderThumbView;
- (id)variationSliderTrackView;
- (void)_updateSliderThumbView;
- (void)_updateVariationSliderTrackView;
- (void)gradientSliderDidChange:(id)a3;
- (void)setVariation:(double)a3;
@end

@implementation _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl

- (_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl)initWithStyle:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl;
  v5 = [(PUIStyleUICoordinatorImpl *)&v10 initWithStyle:v4];
  if (v5)
  {
    +[PUIDiscreteGradientVariatedCustomStyle minLuminanceForStyle:v4];
    v5->_minLuminance = v6;
    +[PUIDiscreteGradientVariatedCustomStyle maxLuminanceForStyle:v4];
    v5->_maxLuminance = v7;
    [v4 luminanceValue];
    [(PUIStyleUICoordinatorImpl *)v5 setVariation:0 updateStyle:fmax(fmin((v8 - v5->_minLuminance + v8 - v5->_minLuminance) / (v5->_maxLuminance - v5->_minLuminance) + -1.0, 1.0), -1.0)];
  }

  return v5;
}

- (id)effectiveColor
{
  v2 = [(PUIStyleUICoordinatorImpl *)self style];
  v3 = [v2 luminanceAppliedColor];

  return v3;
}

- (void)setVariation:(double)a3
{
  double v4 = self->_minLuminance + (a3 + 1.0) * (self->_maxLuminance - self->_minLuminance) * 0.5;
  id v7 = [(PUIStyleUICoordinatorImpl *)self style];
  v5 = (void *)[v7 copyWithLuminance:v4];
  [(PUIStyleUICoordinatorImpl *)self setStyle:v5];

  double v6 = [(_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *)self effectiveColor];
  [(UIView *)self->_variationSliderThumbView setBackgroundColor:v6];
}

- (void)gradientSliderDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PUIStyleUICoordinatorImpl *)self style];
  [v5 luminanceValue];
  double v7 = v6;

  double v8 = [v4 variationAppliedColors];
  id v17 = [v8 firstObject];

  v9 = [[PUIColorValues alloc] initWithColor:v17];
  double v10 = (v7 - self->_minLuminance + v7 - self->_minLuminance) / (self->_maxLuminance - self->_minLuminance) + -1.0;
  +[PUIDiscreteGradientVariatedCustomStyle minLuminanceForStyle:v4];
  self->_minLuminance = v11;
  +[PUIDiscreteGradientVariatedCustomStyle maxLuminanceForStyle:v4];
  self->_maxLuminance = v12;
  double v13 = self->_minLuminance + (v10 + 1.0) * (v12 - self->_minLuminance) * 0.5;
  v14 = [(PUIColorValues *)v9 hslValues];
  [v14 saturation];
  v16 = (void *)[v4 copyWithLuminance:v13 saturation:v15];

  [(PUIStyleUICoordinatorImpl *)self setStyle:v16];
  [(_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *)self _updateVariationSliderTrackView];
  [(_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *)self _updateSliderThumbView];
}

- (id)variationSliderThumbView
{
  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    id v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v5 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    [(_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *)self _updateSliderThumbView];
    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    id v4 = -[PUIGradientView initWithFrame:]([PUIGradientView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    v5 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    [(PUIGradientView *)self->_variationSliderTrackView setUsesBlur:1];
    [(_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *)self _updateVariationSliderTrackView];
    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void)_updateSliderThumbView
{
  id v4 = [(PUIStyleUICoordinatorImpl *)self style];
  v3 = [v4 luminanceAppliedColor];
  [(UIView *)self->_variationSliderThumbView setBackgroundColor:v3];
}

- (void)_updateVariationSliderTrackView
{
  v25[1] = *MEMORY[0x263EF8340];
  v23 = [(PUIStyleUICoordinatorImpl *)self style];
  v3 = [v23 variationAppliedColors];
  v22 = [v3 firstObject];

  id v4 = [PUIStyleDiscreteColors alloc];
  v25[0] = v22;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  v21 = [(PUIStyleDiscreteColors *)v4 initWithColors:v5 vibrant:0 supportsVariation:1 variationValue:0.0];

  id v20 = [(PUIStyleDiscreteColors *)v21 copyWithVariation:0.0];
  double v6 = [v20 variationAppliedColors];
  double v7 = [v6 firstObject];

  double v8 = objc_msgSend(v7, "pui_hslValues");
  v9 = [PUIColorValues alloc];
  [v8 hue];
  double v11 = v10;
  [v8 saturation];
  double v13 = [(PUIColorValues *)v9 initWithHue:v11 saturation:v12 luminance:self->_minLuminance alpha:1.0];
  v14 = [(PUIColorValues *)v13 color];
  double v15 = [MEMORY[0x263F1C550] whiteColor];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  variationSliderTrackView = self->_variationSliderTrackView;
  id v17 = v14;
  v24[0] = [v17 CGColor];
  id v18 = v15;
  v24[1] = [v18 CGColor];
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [(PUIGradientView *)variationSliderTrackView setColors:v19 locations:0 type:0];

  -[PUIGradientView setStartPoint:endPoint:](self->_variationSliderTrackView, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
  [MEMORY[0x263F158F8] commit];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
}

@end