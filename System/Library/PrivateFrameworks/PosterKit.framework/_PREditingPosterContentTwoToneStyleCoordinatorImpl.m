@interface _PREditingPosterContentTwoToneStyleCoordinatorImpl
- (double)itemViewLuminance;
- (id)effectiveColor1;
- (id)effectiveColor2;
- (id)itemView;
@end

@implementation _PREditingPosterContentTwoToneStyleCoordinatorImpl

- (id)effectiveColor1
{
  v3 = [(_PREditingPosterContentStyleCoordinatorImpl *)self variationSupportingStyle];
  v4 = [v3 variationAppliedColors];
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
    v9 = [v8 colors];
    id v7 = [v9 objectAtIndexedSubscript:0];
  }
  return v7;
}

- (id)effectiveColor2
{
  v3 = [(_PREditingPosterContentStyleCoordinatorImpl *)self variationSupportingStyle];
  v4 = [v3 variationAppliedColors];
  v5 = [v4 objectAtIndexedSubscript:1];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(_PREditingPosterContentStyleCoordinatorImpl *)self style];
    v9 = [v8 colors];
    id v7 = [v9 objectAtIndexedSubscript:1];
  }
  return v7;
}

- (double)itemViewLuminance
{
  v2 = [(_PREditingPosterContentTwoToneStyleCoordinatorImpl *)self effectiveColor1];
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
    v4 = [(_PREditingPosterContentTwoToneStyleCoordinatorImpl *)self effectiveColor1];
    uint64_t v5 = [(_PREditingPosterContentTwoToneStyleCoordinatorImpl *)self effectiveColor2];
    double v6 = (void *)v5;
    if (v5) {
      id v7 = (void *)v5;
    }
    else {
      id v7 = v4;
    }
    id v8 = v7;

    v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    [(UIView *)v9 setClipsToBounds:1];
    v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 25.0, 50.0);
    [(UIView *)v10 setBackgroundColor:v4];
    [(UIView *)v10 setAutoresizingMask:22];
    [(UIView *)v9 addSubview:v10];
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 25.0, 0.0, 25.0, 50.0);
    [(UIView *)v11 setAutoresizingMask:19];
    [(UIView *)v11 setBackgroundColor:v8];

    [(UIView *)v9 addSubview:v11];
    v12 = self->_itemView;
    self->_itemView = v9;
    v13 = v9;

    color1View = self->_color1View;
    self->_color1View = v10;
    v15 = v10;

    color2View = self->_color2View;
    self->_color2View = v11;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color2View, 0);
  objc_storeStrong((id *)&self->_color1View, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end