@interface _PUIStyleGradientCoordinatorImpl
- (double)itemViewLuminance;
- (id)itemView;
@end

@implementation _PUIStyleGradientCoordinatorImpl

- (double)itemViewLuminance
{
  v2 = [(PUIStyleUICoordinatorImpl *)self style];
  v3 = [v2 colors];
  v4 = [v3 firstObject];

  v5 = [[PUIColorValues alloc] initWithColor:v4];
  v6 = [(PUIColorValues *)v5 hslValues];
  [v6 luminance];
  double v8 = v7;

  return v8;
}

- (id)itemView
{
  gradientItemView = self->_gradientItemView;
  if (!gradientItemView)
  {
    v4 = [(PUIStyleUICoordinatorImpl *)self style];
    v5 = [v4 colors];
    v6 = PUIStyleGradientTypeToCAEditingGradientLayerTypeFrom((id)[v4 gradientType]);
    double v7 = [v4 locations];
    [v4 startPoint];
    double v9 = v8;
    double v11 = v10;
    [v4 endPoint];
    double v13 = v12;
    double v15 = v14;
    v16 = objc_msgSend(v5, "bs_map:", &__block_literal_global_26);
    v17 = -[PUIGradientView initWithFrame:usesBlur:]([PUIGradientView alloc], "initWithFrame:usesBlur:", 1, 0.0, 0.0, 50.0, 50.0);
    [(PUIGradientView *)v17 setColors:v16 locations:v7 type:v6];
    -[PUIGradientView setStartPoint:endPoint:](v17, "setStartPoint:endPoint:", v9, v11, v13, v15);
    v18 = self->_gradientItemView;
    self->_gradientItemView = v17;

    gradientItemView = self->_gradientItemView;
  }
  return gradientItemView;
}

- (void).cxx_destruct
{
}

@end