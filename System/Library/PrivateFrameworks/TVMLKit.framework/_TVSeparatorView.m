@interface _TVSeparatorView
+ (id)separatorViewWithElement:(id)a3 existingView:(id)a4;
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)tintColor;
- (UIView)separatorComponent;
- (double)lineHeight;
- (id)preferredFocusEnvironments;
- (void)layoutSubviews;
- (void)setLineHeight:(double)a3;
- (void)setSeparatorComponent:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _TVSeparatorView

+ (id)separatorViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  v28 = v6;
  if (objc_opt_isKindOfClass())
  {
    v7 = (_TVSeparatorView *)v6;
  }
  else
  {
    v8 = [_TVSeparatorView alloc];
    v7 = -[_TVSeparatorView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v9 = v7;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v10 = [v5 children];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v16 = +[TVInterfaceFactory sharedInterfaceFactory];
        v17 = [(_TVSeparatorView *)v9 separatorComponent];
        v18 = [v16 _viewFromElement:v15 existingView:v17];

        if (v18)
        {
          [(_TVSeparatorView *)v9 setSeparatorComponent:v18];

          goto LABEL_14;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  v19 = [v5 style];
  v20 = objc_msgSend(v19, "tv_tintColor");
  v21 = [v20 color];

  if (!v21)
  {
    v21 = [MEMORY[0x263F1C550] opaqueSeparatorColor];
  }
  [(_TVSeparatorView *)v9 setTintColor:v21];
  v22 = [v5 style];
  objc_msgSend(v22, "tv_height");
  double v24 = v23;

  if (v24 <= 0.0)
  {
    v25 = [MEMORY[0x263F1C920] mainScreen];
    [v25 scale];
    double v24 = 1.0 / v26;
  }
  [(_TVSeparatorView *)v9 setLineHeight:v24];

  return v9;
}

- (BOOL)canBecomeFocused
{
  p_separatorComponent = &self->_separatorComponent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  if ([WeakRetained canBecomeFocused])
  {
    id v4 = objc_loadWeakRetained((id *)p_separatorComponent);
    int v5 = [v4 isFocused] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  p_separatorComponent = &self->_separatorComponent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_separatorComponent);
    v7[0] = v4;
    int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    int v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)setSeparatorComponent:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    [v5 removeFromSuperview];

    id v6 = objc_storeWeak((id *)&self->_separatorComponent, obj);
    if (obj)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_separatorComponent);
      [(_TVSeparatorView *)self addSubview:v7];
    }
  }
  [(_TVSeparatorView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self tv_padding];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  objc_msgSend(WeakRetained, "tv_sizeThatFits:", width, height);
  double v12 = v11;

  float lineHeight = self->_lineHeight;
  double v14 = v7 + v9 + fmax(v12, ceilf(lineHeight));
  double v15 = width;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  [(_TVSeparatorView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self tv_padding];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  p_line1 = &self->_line1;
  line1 = self->_line1;
  if (!line1)
  {
    v19 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    v20 = *p_line1;
    *p_line1 = v19;

    [(_TVSeparatorView *)self addSubview:*p_line1];
    line1 = *p_line1;
  }
  [(UIView *)line1 setBackgroundColor:self->_tintColor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);

  if (WeakRetained)
  {
    v62.origin.x = v4;
    v62.origin.y = v6;
    v62.size.double width = v8;
    v62.size.double height = v10;
    double v63 = v16;
    id v22 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    uint64_t v23 = objc_msgSend(v22, "tv_alignment");

    if ((v23 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      [(UIView *)self->_line2 removeFromSuperview];
      line2 = self->_line2;
      self->_line2 = 0;
    }
    id v25 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v25, "tv_margin");
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    double v59 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v61 = *MEMORY[0x263F001A8];
    double v66 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v68 = *(double *)(MEMORY[0x263F001A8] + 24);
    id v32 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v32, "tv_sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v34 = v33;
    double v36 = v35;

    double v37 = v12 + v27;
    double v38 = v36;
    float v39 = v36 * 0.5;
    float v40 = floorf(v39);
    double v41 = v37 + v40;
    double v65 = v37;
    if (v23 == 3)
    {
      double v42 = CGRectGetWidth(v62) - v63 - v31 - v34;
      double v64 = v42 - v14 - v29;
      double lineHeight = self->_lineHeight;
      double v43 = v14;
      double v45 = v59;
      double v14 = v61;
    }
    else
    {
      double v58 = v37 + v40;
      if (v23 == 1)
      {
        double v42 = v14 + v29;
        double v43 = v31 + v14 + v29 + v34;
        double v64 = CGRectGetWidth(v62) - v43 - v63;
        double lineHeight = self->_lineHeight;
        double v45 = v59;
        double v14 = v61;
        double v41 = v58;
      }
      else
      {
        float v49 = (CGRectGetWidth(v62) - v14 - v63 - (v31 + v29 + v34)) * 0.5;
        double v67 = v29;
        double v42 = v14 + v29 + floorf(v49);
        double v56 = v42 - v14;
        double v57 = v14;
        double v60 = self->_lineHeight;
        double v14 = v31 + v34 + v42;
        double v50 = CGRectGetWidth(v62) - v63;
        double v68 = self->_lineHeight;
        v51 = self->_line2;
        if (!v51)
        {
          v52 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
          v53 = self->_line2;
          self->_line2 = v52;

          [(_TVSeparatorView *)self addSubview:self->_line2];
          v51 = self->_line2;
        }
        double v64 = v56 - v67;
        double v66 = v50 - v14;
        -[UIView setBackgroundColor:](v51, "setBackgroundColor:", self->_tintColor, *(void *)&v56);
        double v41 = v58;
        double v45 = v58;
        double lineHeight = v60;
        double v38 = v36;
        double v43 = v57;
      }
    }
    id v54 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v54, "setFrame:", v42, v65, v34, v38);

    -[UIView setFrame:](*p_line1, "setFrame:", v43, v41, v64, lineHeight);
    p_line1 = &self->_line2;
    double v47 = v66;
    double v48 = v68;
  }
  else
  {
    [(UIView *)self->_line2 removeFromSuperview];
    v46 = self->_line2;
    self->_line2 = 0;

    v70.origin.x = v4;
    v70.origin.y = v6;
    v70.size.double width = v8;
    v70.size.double height = v10;
    double v47 = CGRectGetWidth(v70) - v14 - v16;
    double v48 = self->_lineHeight;
    double v45 = v12;
  }
  v55 = *p_line1;
  -[UIView setFrame:](v55, "setFrame:", v14, v45, v47, v48);
}

- (UIView)separatorComponent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  return (UIView *)WeakRetained;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (void)setLineHeight:(double)a3
{
  self->_double lineHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_separatorComponent);
  objc_storeStrong((id *)&self->_line2, 0);
  objc_storeStrong((id *)&self->_line1, 0);
}

@end