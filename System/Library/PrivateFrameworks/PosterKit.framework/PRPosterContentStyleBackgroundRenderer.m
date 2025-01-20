@interface PRPosterContentStyleBackgroundRenderer
- (NSArray)colorViews;
- (PRPosterContentStyleBackgroundRenderer)initWithView:(id)a3;
- (UIColor)originalBackgroundColor;
- (UIView)view;
- (_PRContentStyleGradientView)gradientView;
- (void)clearAnyPreviousStyle;
- (void)renderDiscreteColorStyle:(id)a3;
- (void)renderGradientStyle:(id)a3;
- (void)setColorViews:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setOriginalBackgroundColor:(id)a3;
@end

@implementation PRPosterContentStyleBackgroundRenderer

- (PRPosterContentStyleBackgroundRenderer)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterContentStyleBackgroundRenderer;
  v6 = [(PRPosterContentStyleBackgroundRenderer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

- (void)clearAnyPreviousStyle
{
  colorViews = self->_colorViews;
  if (colorViews)
  {
    [(NSArray *)colorViews performSelector:sel_removeFromSuperview];
    v4 = self->_colorViews;
    self->_colorViews = 0;
  }
  if (self->_originalBackgroundColor)
  {
    -[UIView setBackgroundColor:](self->_view, "setBackgroundColor:");
    originalBackgroundColor = self->_originalBackgroundColor;
    self->_originalBackgroundColor = 0;
  }
  gradientView = self->_gradientView;
  if (gradientView)
  {
    [(_PRContentStyleGradientView *)gradientView removeFromSuperview];
  }
}

- (void)renderDiscreteColorStyle:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PRPosterContentStyleBackgroundRenderer *)self clearAnyPreviousStyle];
  if ([v4 allowsVariation]) {
    [v4 variationAppliedColors];
  }
  else {
  id v5 = [v4 colors];
  }

  [(UIView *)self->_view bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  if ((unint64_t)[v5 count] < 2)
  {
    v25 = [(UIView *)self->_view backgroundColor];
    originalBackgroundColor = self->_originalBackgroundColor;
    self->_originalBackgroundColor = v25;

    view = self->_view;
    v14 = [v5 firstObject];
    [(UIView *)view setBackgroundColor:v14];
  }
  else
  {
    v14 = [v5 objectAtIndexedSubscript:0];
    v15 = [v5 objectAtIndexedSubscript:1];
    id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    double MidX = CGRectGetMidX(v29);
    v30.origin.x = v7;
    v30.origin.y = v9;
    v30.size.width = v11;
    v30.size.height = v13;
    v18 = objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, MidX, CGRectGetMaxY(v30));
    [v18 setBackgroundColor:v14];
    [v18 setAutoresizingMask:22];
    [(UIView *)self->_view addSubview:v18];
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v31.origin.x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    double v20 = CGRectGetMidX(v31);
    v32.origin.x = v7;
    v32.origin.y = v9;
    v32.size.width = v11;
    v32.size.height = v13;
    double v21 = CGRectGetMidX(v32);
    v33.origin.x = v7;
    v33.origin.y = v9;
    v33.size.width = v11;
    v33.size.height = v13;
    v22 = objc_msgSend(v19, "initWithFrame:", v20, 0.0, v21, CGRectGetMaxY(v33));
    [v22 setAutoresizingMask:19];
    [v22 setBackgroundColor:v15];
    [(UIView *)self->_view addSubview:v22];
    v28[0] = v18;
    v28[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    colorViews = self->_colorViews;
    self->_colorViews = v23;
  }
}

- (void)renderGradientStyle:(id)a3
{
  id v4 = a3;
  [(PRPosterContentStyleBackgroundRenderer *)self clearAnyPreviousStyle];
  id v23 = [v4 colors];
  uint64_t v5 = [v4 gradientType];
  double v6 = (id *)MEMORY[0x1E4F3A398];
  CGFloat v7 = (id *)MEMORY[0x1E4F3A3A0];
  if (v5 != 1) {
    CGFloat v7 = (id *)MEMORY[0x1E4F3A390];
  }
  if (v5 != 2) {
    double v6 = v7;
  }
  id v8 = *v6;
  CGFloat v9 = [v4 locations];
  [v4 startPoint];
  double v11 = v10;
  double v13 = v12;
  [v4 endPoint];
  double v15 = v14;
  double v17 = v16;

  v18 = objc_msgSend(v23, "bs_map:", &__block_literal_global_33);
  gradientView = self->_gradientView;
  if (!gradientView)
  {
    double v20 = [_PRContentStyleGradientView alloc];
    [(UIView *)self->_view bounds];
    CGRect v26 = CGRectInset(v25, -10.0, -10.0);
    double v21 = -[_PRContentStyleGradientView initWithFrame:](v20, "initWithFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
    [(_PRContentStyleGradientView *)v21 setAutoresizingMask:18];
    v22 = self->_gradientView;
    self->_gradientView = v21;

    gradientView = self->_gradientView;
  }
  [(UIView *)self->_view addSubview:gradientView];
  [(_PRContentStyleGradientView *)self->_gradientView setColors:v18 locations:v9 type:v8];
  -[_PRContentStyleGradientView setStartPoint:endPoint:](self->_gradientView, "setStartPoint:endPoint:", v11, v13, v15, v17);
}

uint64_t __62__PRPosterContentStyleBackgroundRenderer_renderGradientStyle___block_invoke(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

- (UIView)view
{
  return self->_view;
}

- (UIColor)originalBackgroundColor
{
  return self->_originalBackgroundColor;
}

- (void)setOriginalBackgroundColor:(id)a3
{
}

- (NSArray)colorViews
{
  return self->_colorViews;
}

- (void)setColorViews:(id)a3
{
}

- (_PRContentStyleGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_colorViews, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end