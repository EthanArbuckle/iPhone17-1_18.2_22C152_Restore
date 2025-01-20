@interface _PREditingPosterContentOpaqueMonotoneStyleCoordinatorImpl
- (double)itemViewLuminance;
- (id)effectiveColor;
- (id)itemView;
- (id)variationSliderThumbView;
- (id)variationSliderTrackView;
- (void)setVariation:(double)a3;
@end

@implementation _PREditingPosterContentOpaqueMonotoneStyleCoordinatorImpl

- (id)effectiveColor
{
  v3 = [(_PREditingPosterContentStyleCoordinatorImpl *)self variationSupportingStyle];
  v4 = [v3 variationAppliedColors];
  v5 = [v4 firstObject];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
    v9 = [v8 colors];
    id v7 = [v9 firstObject];
  }
  return v7;
}

- (void)setVariation:(double)a3
{
  v5 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
  int v6 = [v5 allowsVariation];

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)_PREditingPosterContentOpaqueMonotoneStyleCoordinatorImpl;
    [(_PREditingPosterContentStyleCoordinatorImpl *)&v10 setVariation:a3];
    id v7 = [(_PREditingPosterContentStyleCoordinatorImpl *)self variationSupportingStyle];
    v8 = [v7 variationAppliedColors];
    v9 = [v8 firstObject];

    [(UIView *)self->_itemView setBackgroundColor:v9];
    [(UIView *)self->_variationSliderThumbView setBackgroundColor:v9];
  }
}

- (double)itemViewLuminance
{
  v2 = [(_PREditingPosterContentOpaqueMonotoneStyleCoordinatorImpl *)self effectiveColor];
  v3 = [[PRPosterColorValues alloc] initWithColor:v2];
  v4 = [(PRPosterColorValues *)v3 hslValues];
  [v4 luminance];
  double v6 = v5;

  return v6;
}

- (id)itemView
{
  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    double v5 = [(_PREditingPosterContentOpaqueMonotoneStyleCoordinatorImpl *)self effectiveColor];
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
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    double v5 = [(_PREditingPosterContentOpaqueMonotoneStyleCoordinatorImpl *)self effectiveColor];
    [(UIView *)v4 setBackgroundColor:v5];
    double v6 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  v17[2] = *MEMORY[0x1E4F143B8];
  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F927D0]), "initWithFrame:usesBlur:", 0, 0.0, 0.0, 100.0, 50.0);
    double v5 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
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
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v4 setColors:v14 locations:0 type:0];

    objc_msgSend(v4, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
    v15 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = (PUIGradientView *)v4;

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