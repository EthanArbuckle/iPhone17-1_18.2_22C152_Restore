@interface _PUIStyleVibrantMonotoneCoordinatorImpl
- (double)itemViewLuminance;
- (id)_effectiveColor;
- (id)_itemDisplayColor;
- (id)_maxDisplayColor;
- (id)_minDisplayColor;
- (id)_sliderThumbDisplayColor;
- (id)itemView;
- (id)transparancyBackgroundImageForHeight:(double)a3;
- (id)variationSliderThumbView;
- (id)variationSliderTrackView;
- (void)setVariation:(double)a3;
@end

@implementation _PUIStyleVibrantMonotoneCoordinatorImpl

- (id)transparancyBackgroundImageForHeight:(double)a3
{
  cachedTransparancyBackgrounds = self->_cachedTransparancyBackgrounds;
  if (!cachedTransparancyBackgrounds)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_cachedTransparancyBackgrounds;
    self->_cachedTransparancyBackgrounds = v6;

    cachedTransparancyBackgrounds = self->_cachedTransparancyBackgrounds;
  }
  v8 = [NSNumber numberWithDouble:a3];
  v9 = [(NSMutableDictionary *)cachedTransparancyBackgrounds objectForKeyedSubscript:v8];

  if (!v9)
  {
    double v10 = fmax(a3 / 3.0, 0.5);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", v10 + v10, v10 + v10);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __80___PUIStyleVibrantMonotoneCoordinatorImpl_transparancyBackgroundImageForHeight___block_invoke;
    v16[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v16[4] = v10;
    v12 = [v11 imageWithActions:v16];
    v9 = objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    v13 = self->_cachedTransparancyBackgrounds;
    v14 = [NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)v13 setObject:v9 forKeyedSubscript:v14];
  }
  return v9;
}

- (id)_minDisplayColor
{
  v3 = [(PUIStyleUICoordinatorImpl *)self style];
  int v4 = [v3 allowsVariation];

  if (v4)
  {
    v5 = [PUIStyleDiscreteColors alloc];
    v6 = [(PUIStyleUICoordinatorImpl *)self style];
    v7 = [v6 colors];
    v8 = [(PUIStyleDiscreteColors *)v5 initWithOpaqueColors:v7 variation:-1.0];

    v9 = [(PUIStyleDiscreteColors *)v8 variationAppliedColors];
    double v10 = [v9 firstObject];
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

- (id)_maxDisplayColor
{
  v3 = [(PUIStyleUICoordinatorImpl *)self style];
  int v4 = [v3 allowsVariation];

  if (v4)
  {
    v5 = [PUIStyleDiscreteColors alloc];
    v6 = [(PUIStyleUICoordinatorImpl *)self style];
    v7 = [v6 colors];
    v8 = [(PUIStyleDiscreteColors *)v5 initWithOpaqueColors:v7 variation:0.0];

    v9 = [(PUIStyleDiscreteColors *)v8 variationAppliedColors];
    double v10 = [v9 firstObject];
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

- (id)_sliderThumbDisplayColor
{
  v3 = [(PUIStyleUICoordinatorImpl *)self style];
  int v4 = [v3 allowsVariation];

  if (v4)
  {
    [(PUIStyleUICoordinatorImpl *)self variation];
    double v6 = (v5 + 1.0) * 0.5 + -1.0;
    v7 = [PUIStyleDiscreteColors alloc];
    v8 = [(PUIStyleUICoordinatorImpl *)self style];
    v9 = [v8 colors];
    double v10 = [(PUIStyleDiscreteColors *)v7 initWithOpaqueColors:v9 variation:v6];

    v11 = [(PUIStyleDiscreteColors *)v10 variationAppliedColors];
    v12 = [v11 firstObject];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_itemDisplayColor
{
  v3 = [(PUIStyleUICoordinatorImpl *)self style];
  char v4 = [v3 allowsVariation];

  if (v4)
  {
    [(PUIStyleUICoordinatorImpl *)self variation];
    double v6 = (v5 + 1.0) * 0.5 + -1.0;
    v7 = [PUIStyleDiscreteColors alloc];
    v8 = [(PUIStyleUICoordinatorImpl *)self style];
    v9 = [v8 colors];
    double v10 = [(PUIStyleDiscreteColors *)v7 initWithOpaqueColors:v9 variation:v6];

    v11 = [(PUIStyleDiscreteColors *)v10 variationAppliedColors];
    v12 = [v11 firstObject];
  }
  else
  {
    v12 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _effectiveColor];
  }
  return v12;
}

- (id)_effectiveColor
{
  v3 = [(PUIStyleUICoordinatorImpl *)self variationSupportingStyle];
  char v4 = [v3 variationAppliedColors];
  double v5 = [v4 firstObject];
  double v6 = v5;
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
  double v5 = [(PUIStyleUICoordinatorImpl *)self style];
  int v6 = [v5 allowsVariation];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)_PUIStyleVibrantMonotoneCoordinatorImpl;
    [(PUIStyleUICoordinatorImpl *)&v11 setVariation:a3];
    itemViewContentView = self->_itemViewContentView;
    v8 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _itemDisplayColor];
    [(UIView *)itemViewContentView setBackgroundColor:v8];

    variationSliderThumbContentView = self->_variationSliderThumbContentView;
    double v10 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _sliderThumbDisplayColor];
    [(UIView *)variationSliderThumbContentView setBackgroundColor:v10];
  }
}

- (double)itemViewLuminance
{
  v2 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _effectiveColor];
  v3 = [[PUIColorValues alloc] initWithColor:v2];
  char v4 = [(PUIColorValues *)v3 hslValues];
  [v4 luminance];
  double v6 = v5;

  return v6;
}

- (id)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    char v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    double v5 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIView *)v4 setClipsToBounds:1];
    id v6 = objc_alloc(MEMORY[0x263F1CB60]);
    [(UIView *)v4 bounds];
    id v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    [(UIView *)v7 setAutoresizingMask:18];
    [(UIView *)v4 addSubview:v7];
    itemViewContentView = self->_itemViewContentView;
    self->_itemViewContentView = v7;
    v9 = v7;

    double v10 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _itemDisplayColor];
    [(UIView *)v9 setBackgroundColor:v10];

    objc_super v11 = self->_itemView;
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
    char v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    double v5 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIView *)v4 setClipsToBounds:1];
    id v6 = objc_alloc(MEMORY[0x263F1CB60]);
    [(UIView *)v4 bounds];
    id v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    [(UIView *)v7 setAutoresizingMask:18];
    [(UIView *)v4 addSubview:v7];
    variationSliderThumbContentView = self->_variationSliderThumbContentView;
    self->_variationSliderThumbContentView = v7;
    v9 = v7;

    double v10 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _sliderThumbDisplayColor];
    [(UIView *)v9 setBackgroundColor:v10];
    objc_super v11 = self->_variationSliderThumbView;
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
    char v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    double v5 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIView *)v4 setClipsToBounds:1];
    id v6 = [PUIGradientView alloc];
    [(UIView *)v4 bounds];
    id v7 = -[PUIGradientView initWithFrame:usesBlur:](v6, "initWithFrame:usesBlur:", 0);
    v8 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _minDisplayColor];
    v9 = [(_PUIStyleVibrantMonotoneCoordinatorImpl *)self _maxDisplayColor];
    id v10 = v8;
    v17[0] = [v10 CGColor];
    id v11 = v9;
    v17[1] = [v11 CGColor];
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [(UIView *)v7 setColors:v12 locations:0 type:0];

    -[UIView setStartPoint:endPoint:](v7, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
    [(UIView *)v4 addSubview:v7];
    [(UIView *)v7 setAutoresizingMask:18];
    variationSliderTrackContentView = self->_variationSliderTrackContentView;
    self->_variationSliderTrackContentView = v7;
    v14 = v7;

    v15 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTransparancyBackgrounds, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackContentView, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
  objc_storeStrong((id *)&self->_variationSliderThumbContentView, 0);
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_itemViewContentView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end