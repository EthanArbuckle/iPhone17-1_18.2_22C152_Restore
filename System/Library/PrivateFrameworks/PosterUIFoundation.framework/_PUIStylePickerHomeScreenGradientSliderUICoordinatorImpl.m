@interface _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl
- (id)effectiveColor;
- (id)variationSliderThumbView;
- (id)variationSliderTrackView;
- (void)_updateVariationSliderTrackView;
- (void)resetSaturation;
- (void)setVariation:(double)a3;
@end

@implementation _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl

- (id)effectiveColor
{
  v2 = [(PUIStyleUICoordinatorImpl *)self style];
  v3 = [v2 variationAppliedColors];
  v4 = [v3 firstObject];

  return v4;
}

- (void)setVariation:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl;
  [(PUIStyleUICoordinatorImpl *)&v5 setVariation:a3];
  v4 = [(_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *)self effectiveColor];
  [(UIView *)self->_variationSliderThumbView setBackgroundColor:v4];
}

- (id)variationSliderThumbView
{
  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    objc_super v5 = [(_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *)self effectiveColor];
    [(UIView *)v4 setBackgroundColor:v5];
    v6 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = -[PUIGradientView initWithFrame:]([PUIGradientView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    objc_super v5 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    [(PUIGradientView *)self->_variationSliderTrackView setUsesBlur:1];
    [(_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *)self _updateVariationSliderTrackView];
    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void)resetSaturation
{
  v3 = [(PUIStyleUICoordinatorImpl *)self style];
  v4 = (void *)[v3 copyWithResetSaturation];

  id v5 = (id)[v4 copyWithLuminance:0.0];
  [(PUIStyleUICoordinatorImpl *)self setStyle:v5];
}

- (void)_updateVariationSliderTrackView
{
  id v3 = (id)*MEMORY[0x263F15DD0];
  v4 = [(PUIStyleUICoordinatorImpl *)self style];
  id v5 = [v4 colors];

  uint64_t v6 = [v5 count];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91___PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl__updateVariationSliderTrackView__block_invoke;
  v9[3] = &unk_265470F40;
  v9[4] = v10;
  v9[5] = v6;
  v7 = objc_msgSend(v5, "bs_map:", v9);
  v8 = objc_msgSend(v5, "bs_map:", &__block_literal_global_3);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(PUIGradientView *)self->_variationSliderTrackView setColors:v8 locations:v7 type:v3];
  -[PUIGradientView setStartPoint:endPoint:](self->_variationSliderTrackView, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
  [MEMORY[0x263F158F8] commit];

  _Block_object_dispose(v10, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
}

@end