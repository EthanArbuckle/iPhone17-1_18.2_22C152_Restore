@interface _TVStarHistogram
+ (id)_histogramViewWithElement:(id)a3 existingView:(id)a4;
+ (id)histogramViewWithElement:(id)a3 existingView:(id)a4;
- (BOOL)canBecomeFocused;
- (NSArray)starBars;
- (UIColor)barEmptyColor;
- (UIColor)barFillColor;
- (UIImage)starImage;
- (double)lineSpacing;
- (void)drawRect:(CGRect)a3;
- (void)setBarEmptyColor:(id)a3;
- (void)setBarFillColor:(id)a3;
- (void)setLineSpacing:(double)a3;
- (void)setStarBars:(id)a3;
- (void)setStarImage:(id)a3;
@end

@implementation _TVStarHistogram

+ (id)histogramViewWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = [v7 contentView];
    v9 = [v8 subviews];
    v10 = [v9 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      v12 = [v11 contentView];
      v13 = [v12 subviews];
      id v14 = [v13 firstObject];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = v10;
      }
      else {
        id v14 = 0;
      }
      id v11 = 0;
    }
    v15 = [v7 contentView];
    v16 = [v15 subviews];
    [v16 makeObjectsPerformSelector:sel_removeFromSuperview];

    v17 = [(id)objc_opt_class() _histogramViewWithElement:v6 existingView:v14];

    v18 = [v7 contentView];
    [v18 addSubview:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setAllowsFocus:0];
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() _histogramViewWithElement:v6 existingView:v5];
    v10 = v6;
  }

  return v7;
}

+ (id)_histogramViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  v50 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v7 = (_TVStarHistogram *)v6;
  }
  else
  {
    v8 = [_TVStarHistogram alloc];
    id v7 = -[_TVStarHistogram initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v9 = v7;
  v10 = [v5 style];
  objc_msgSend(v10, "tv_width");
  double v12 = v11;
  v13 = [v5 style];
  objc_msgSend(v13, "tv_height");
  v49 = v9;
  -[_TVStarHistogram setFrame:](v9, "setFrame:", 0.0, 0.0, v12, v14);

  v51 = v5;
  v52 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [v5 children];
  uint64_t v15 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v17 = 0;
    uint64_t v18 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v20, "tv_elementType") == 84)
        {
          v21 = objc_alloc_init(_TVStarBar);
          v22 = [v20 attributes];
          v23 = [v22 objectForKeyedSubscript:@"numStars"];
          -[_TVStarBar setNumStars:](v21, "setNumStars:", [v23 integerValue]);

          v24 = [v20 attributes];
          v25 = [v24 objectForKeyedSubscript:@"value"];
          [v25 floatValue];
          [(_TVStarBar *)v21 setValue:v26];

          [v52 addObject:v21];
          if (!v17)
          {
            v27 = [v20 style];
            v28 = objc_msgSend(v27, "tv_tintColor");
            v17 = [v28 color];
          }
          v29 = objc_msgSend(v20, "tv_attributedString");
          [(_TVStarBar *)v21 setCountStr:v29];

          v30 = [v20 style];
          objc_msgSend(v30, "tv_margin");
          -[_TVStarBar setBarMargin:](v21, "setBarMargin:");

          v31 = [v20 style];
          objc_msgSend(v31, "tv_width");
          -[_TVStarBar setBarWidth:](v21, "setBarWidth:");

          v32 = [v20 style];
          objc_msgSend(v32, "tv_height");
          -[_TVStarBar setHeight:](v21, "setHeight:");
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  v33 = [v51 style];
  v34 = objc_msgSend(v33, "tv_backgroundColor");
  v35 = [v34 color];
  v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    id v37 = [MEMORY[0x263F1C550] clearColor];
  }
  v38 = v37;

  [(_TVStarHistogram *)v49 setBackgroundColor:v38];
  [(_TVStarHistogram *)v49 setStarBars:v52];
  v39 = (void *)MEMORY[0x263F1C6B0];
  v40 = +[TVMLUtilities TVMLKitBundle];
  v41 = [v39 imageNamed:@"star_mask_s" inBundle:v40];

  if (!v17)
  {
    v17 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
  }
  v42 = [v17 colorWithAlphaComponent:0.3];
  v43 = [v41 _flatImageWithColor:v42];
  [(_TVStarHistogram *)v49 setStarImage:v43];

  v44 = [v17 colorWithAlphaComponent:0.15];
  [(_TVStarHistogram *)v49 setBarEmptyColor:v44];

  v45 = [v17 colorWithAlphaComponent:0.6];
  [(_TVStarHistogram *)v49 setBarFillColor:v45];

  v46 = [v51 style];
  objc_msgSend(v46, "tv_lineSpacing");
  -[_TVStarHistogram setLineSpacing:](v49, "setLineSpacing:");

  v47 = v49;
  return v47;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  double width = a3.size.width;
  uint64_t v72 = *MEMORY[0x263EF8340];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v4 = self->_starBars;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v67;
    double v8 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v67 != v7) {
          objc_enumerationMutation(v4);
        }
        v13 = [*(id *)(*((void *)&v66 + 1) + 8 * i) countStr];
        objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, v8, v9);
        double v15 = v14;
        double v17 = v16;

        double v11 = fmax(v11, v15);
        if (v10 == 0.0) {
          double v10 = v17;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v6);
    float v18 = v10;
    float v19 = v11;
  }
  else
  {
    float v18 = 0.0;
    float v19 = 0.0;
  }

  [(UIImage *)self->_starImage size];
  double v21 = v20;
  double v23 = v22;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = self->_starBars;
  uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    char v26 = 0;
    double v27 = ceilf(v19);
    uint64_t v28 = *(void *)v63;
    double v55 = v21 * 5.0 + 20.0;
    double v58 = ceilf(v18);
    double v59 = 0.0;
    double v29 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        [v31 barMargin];
        double v34 = v33;
        double v36 = v35;
        [v31 barWidth];
        double v38 = v37;
        [v31 height];
        double v60 = v39;
        if (v26)
        {
          double v40 = v59;
        }
        else
        {
          double v41 = width - (v38 + v36 + v55 + v34);
          double v27 = fmin(v27, v41);
          *(float *)&double v41 = (v41 - v27) * 0.5;
          double v40 = floorf(*(float *)&v41);
        }
        double v61 = v27;
        unint64_t v42 = 5;
        double v59 = v40;
        do
        {
          if (objc_msgSend(v31, "numStars", *(void *)&v55) >= v42) {
            -[UIImage drawInRect:](self->_starImage, "drawInRect:", v40, v29, v21, v23);
          }
          double v40 = v21 + 5.0 + v40;
          --v42;
        }
        while (v42);
        double v43 = v34 + v40;
        float v44 = v29 + (v60 + -6.0) * 0.5;
        double v45 = floorf(v44);
        [v31 barWidth];
        double v47 = v46;
        v48 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v43, v45, v46, 6.0, 2.0);
        [(UIColor *)self->_barEmptyColor set];
        [v48 fill];
        [v31 value];
        v50 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v43, v45, v47 * fmax(fmin(v49, 1.0), 0.0), 6.0, 2.0);

        [(UIColor *)self->_barFillColor set];
        [v50 fill];
        [v31 barWidth];
        double v52 = v43 + v36 + v51;
        v53 = [v31 countStr];
        float v54 = v29 + (v60 - v58) * 0.5;
        double v27 = v61;
        objc_msgSend(v53, "drawInRect:", v52, floorf(v54), v61);

        double v29 = v29 + v60 + self->_lineSpacing;
        CGContextRestoreGState(CurrentContext);

        char v26 = 1;
      }
      uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v25);
  }
}

- (NSArray)starBars
{
  return self->_starBars;
}

- (void)setStarBars:(id)a3
{
}

- (UIImage)starImage
{
  return self->_starImage;
}

- (void)setStarImage:(id)a3
{
}

- (UIColor)barEmptyColor
{
  return self->_barEmptyColor;
}

- (void)setBarEmptyColor:(id)a3
{
}

- (UIColor)barFillColor
{
  return self->_barFillColor;
}

- (void)setBarFillColor:(id)a3
{
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barFillColor, 0);
  objc_storeStrong((id *)&self->_barEmptyColor, 0);
  objc_storeStrong((id *)&self->_starBars, 0);
  objc_storeStrong((id *)&self->_starImage, 0);
}

@end