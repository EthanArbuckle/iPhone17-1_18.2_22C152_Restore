@interface _PREditingPosterContentGradientStyleCoordinatorImpl
- (double)itemViewLuminance;
- (id)itemView;
@end

@implementation _PREditingPosterContentGradientStyleCoordinatorImpl

- (double)itemViewLuminance
{
  v2 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
  v3 = [v2 colors];
  v4 = [v3 firstObject];

  v5 = [[PRPosterColorValues alloc] initWithColor:v4];
  v6 = [(PRPosterColorValues *)v5 hslValues];
  [v6 luminance];
  double v8 = v7;

  return v8;
}

- (id)itemView
{
  gradientItemView = self->_gradientItemView;
  if (!gradientItemView)
  {
    v4 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
    v5 = [v4 colors];
    uint64_t v6 = [v4 gradientType];
    double v7 = (id *)MEMORY[0x1E4F3A398];
    double v8 = (id *)MEMORY[0x1E4F3A3A0];
    if (v6 != 1) {
      double v8 = (id *)MEMORY[0x1E4F3A390];
    }
    if (v6 != 2) {
      double v7 = v8;
    }
    id v9 = *v7;
    v10 = [v4 locations];
    [v4 startPoint];
    double v12 = v11;
    double v14 = v13;
    [v4 endPoint];
    double v16 = v15;
    double v18 = v17;
    v19 = objc_msgSend(v5, "bs_map:", &__block_literal_global_37);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F927D0]), "initWithFrame:usesBlur:", 1, 0.0, 0.0, 50.0, 50.0);
    [v20 setColors:v19 locations:v10 type:v9];
    objc_msgSend(v20, "setStartPoint:endPoint:", v12, v14, v16, v18);
    v21 = self->_gradientItemView;
    self->_gradientItemView = (PUIGradientView *)v20;

    gradientItemView = self->_gradientItemView;
  }
  return gradientItemView;
}

- (void).cxx_destruct
{
}

@end