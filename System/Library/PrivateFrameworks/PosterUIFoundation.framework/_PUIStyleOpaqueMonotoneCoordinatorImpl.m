@interface _PUIStyleOpaqueMonotoneCoordinatorImpl
- (double)itemViewLuminance;
- (id)effectiveColor;
- (id)itemView;
- (id)variationSliderThumbView;
- (id)variationSliderTrackView;
- (void)setVariation:(double)a3;
@end

@implementation _PUIStyleOpaqueMonotoneCoordinatorImpl

- (id)effectiveColor
{
  v3 = [(PUIStyleUICoordinatorImpl *)self variationSupportingStyle];
  v4 = [v3 variationAppliedColors];
  v5 = [v4 firstObject];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(PUIStyleUICoordinatorImpl *)self style];
    v9 = [v8 colors];
    id v7 = [v9 firstObject];
  }
  return v7;
}

- (void)setVariation:(double)a3
{
  v5 = [(PUIStyleUICoordinatorImpl *)self style];
  int v6 = [v5 allowsVariation];

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)_PUIStyleOpaqueMonotoneCoordinatorImpl;
    [(PUIStyleUICoordinatorImpl *)&v10 setVariation:a3];
    id v7 = [(PUIStyleUICoordinatorImpl *)self variationSupportingStyle];
    v8 = [v7 variationAppliedColors];
    v9 = [v8 firstObject];

    [(UIView *)self->_itemView setBackgroundColor:v9];
    [(UIView *)self->_variationSliderThumbView setBackgroundColor:v9];
  }
}

- (double)itemViewLuminance
{
  v2 = [(_PUIStyleOpaqueMonotoneCoordinatorImpl *)self effectiveColor];
  v3 = [[PUIColorValues alloc] initWithColor:v2];
  v4 = [(PUIColorValues *)v3 hslValues];
  [v4 luminance];
  double v6 = v5;

  return v6;
}

- (id)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    double v5 = [(_PUIStyleOpaqueMonotoneCoordinatorImpl *)self effectiveColor];
    [(UIView *)v4 setBackgroundColor:v5];
    double v6 = self->_itemView;
    self->_itemView = v4;

    itemView = self->_itemView;
  }
  return itemView;
}

- (id)variationSliderThumbView
{
  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    double v5 = [(_PUIStyleOpaqueMonotoneCoordinatorImpl *)self effectiveColor];
    [(UIView *)v4 setBackgroundColor:v5];
    double v6 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  v17[2] = *MEMORY[0x263EF8340];
  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = -[PUIGradientView initWithFrame:usesBlur:]([PUIGradientView alloc], "initWithFrame:usesBlur:", 0, 0.0, 0.0, 100.0, 50.0);
    double v5 = [(PUIStyleUICoordinatorImpl *)self style];
    double v6 = (void *)[v5 copyWithVariation:-1.0];
    id v7 = (void *)[v5 copyWithVariation:1.0];
    v8 = [v6 variationAppliedColors];
    v9 = [v8 firstObject];

    objc_super v10 = [v7 variationAppliedColors];
    v11 = [v10 firstObject];

    id v12 = v9;
    v17[0] = [v12 CGColor];
    id v13 = v11;
    v17[1] = [v13 CGColor];
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [(PUIGradientView *)v4 setColors:v14 locations:0 type:0];

    -[PUIGradientView setStartPoint:endPoint:](v4, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
    v15 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end