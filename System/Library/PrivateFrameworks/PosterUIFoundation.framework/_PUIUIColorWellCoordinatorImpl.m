@interface _PUIUIColorWellCoordinatorImpl
- (_PUIUIColorWellCoordinatorImpl)initWithStyle:(id)a3 colorWellView:(id)a4;
- (id)effectiveColor;
- (id)itemView;
- (id)variationSliderThumbView;
- (id)variationSliderTrackView;
- (void)setVariation:(double)a3;
@end

@implementation _PUIUIColorWellCoordinatorImpl

- (_PUIUIColorWellCoordinatorImpl)initWithStyle:(id)a3 colorWellView:(id)a4
{
  id v7 = a4;
  v8 = [(PUIStyleUICoordinatorImpl *)self initWithStyle:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_colorWellView, a4);
  }

  return v9;
}

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
  v6.receiver = self;
  v6.super_class = (Class)_PUIUIColorWellCoordinatorImpl;
  [(PUIStyleUICoordinatorImpl *)&v6 setVariation:a3];
  v4 = [(_PUIUIColorWellCoordinatorImpl *)self effectiveColor];
  v5 = [(PUIColorWellView *)self->_colorWellView colorWell];
  [v5 setSelectedColor:v4];

  [(UIView *)self->_variationSliderThumbView setBackgroundColor:v4];
}

- (id)itemView
{
  return self->_colorWellView;
}

- (id)variationSliderThumbView
{
  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v5 = [(_PUIUIColorWellCoordinatorImpl *)self effectiveColor];
    [(UIView *)v4 setBackgroundColor:v5];
    objc_super v6 = self->_variationSliderThumbView;
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
    v5 = [(PUIStyleUICoordinatorImpl *)self style];
    objc_super v6 = (void *)[v5 copyWithVariation:-1.0];
    id v7 = (void *)[v5 copyWithVariation:1.0];
    v8 = [v6 variationAppliedColors];
    v9 = [v8 firstObject];

    v10 = [v7 variationAppliedColors];
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
  objc_storeStrong((id *)&self->_colorWellView, 0);
}

@end