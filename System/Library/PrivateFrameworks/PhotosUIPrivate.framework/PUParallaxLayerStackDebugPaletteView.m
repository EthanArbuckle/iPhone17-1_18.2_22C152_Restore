@interface PUParallaxLayerStackDebugPaletteView
- (PIParallaxColorPalette)palette;
- (PUParallaxLayerStackDebugPaletteView)initWithColorPalette:(id)a3;
- (void)_layoutPalette:(id)a3 origin:(CGPoint)a4 cellsPerRow:(int)a5 cellWidth:(double)a6 callback:(id)a7;
- (void)layoutSubviews;
@end

@implementation PUParallaxLayerStackDebugPaletteView

- (void).cxx_destruct
{
}

- (PIParallaxColorPalette)palette
{
  return self->_palette;
}

- (void)_layoutPalette:(id)a3 origin:(CGPoint)a4 cellsPerRow:(int)a5 cellWidth:(double)a6 callback:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  id v22 = a3;
  v13 = (void (**)(id, void *, double, double, double, double))a7;
  v14 = [v22 primaryColors];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    unint64_t v17 = a5;
    do
    {
      v18 = [v22 suggestionAtIndex:v16];
      v19 = v13[2](v13, v18, x + (double)(v16 % v17) * a6, y + (double)(v16 / v17) * a6, a6 + -2.0, a6 + -2.0);
      [(PUParallaxLayerStackDebugPaletteView *)self addSubview:v19];

      ++v16;
      v20 = [v22 primaryColors];
      unint64_t v21 = [v20 count];
    }
    while (v16 < v21);
  }
}

- (void)layoutSubviews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v3 = [(PUParallaxLayerStackDebugPaletteView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }

  [(PUParallaxLayerStackDebugPaletteView *)self bounds];
  CGRect v38 = CGRectInset(v37, 30.0, 30.0);
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v38.origin.x, v38.origin.y, v38.size.width, 50.0);
  [v11 setText:@"Primary Colors"];
  [(PUParallaxLayerStackDebugPaletteView *)self addSubview:v11];
  double v12 = y + 50.0 + 5.0;
  v13 = [(PUParallaxLayerStackDebugPaletteView *)self palette];
  -[PUParallaxLayerStackDebugPaletteView _layoutPalette:origin:cellsPerRow:cellWidth:callback:](self, "_layoutPalette:origin:cellsPerRow:cellWidth:callback:", v13, 12, &__block_literal_global_51178, x, v12, width / 12.0);

  v14 = [(PUParallaxLayerStackDebugPaletteView *)self palette];
  uint64_t v15 = [v14 secondaryColors];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = [(PUParallaxLayerStackDebugPaletteView *)self palette];
    v18 = [v17 primaryColors];
    unint64_t v19 = [v18 count] / 0xCuLL;

    v20 = [(PUParallaxLayerStackDebugPaletteView *)self palette];
    unint64_t v21 = [v20 primaryColors];
    unint64_t v22 = __ROR8__(0xAAAAAAAAAAAAAAABLL * [v21 count], 2);

    if (v22 <= 0x1555555555555555) {
      unint64_t v23 = v19;
    }
    else {
      unint64_t v23 = v19 + 1;
    }
    double v24 = width / 12.0 * (double)v23 + 10.0;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, v12 + v24, width, 50.0);
    [v25 setText:@"Secondary Colors"];
    [(PUParallaxLayerStackDebugPaletteView *)self addSubview:v25];
    double v26 = v12 + v24 + 50.0 + 5.0;
    v27 = [(PUParallaxLayerStackDebugPaletteView *)self palette];
    -[PUParallaxLayerStackDebugPaletteView _layoutPalette:origin:cellsPerRow:cellWidth:callback:](self, "_layoutPalette:origin:cellsPerRow:cellWidth:callback:", v27, 12, &__block_literal_global_83, x, v26, width / 12.0);

    double v28 = v24 + v26;
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, v28, width, 50.0);
    [v29 setText:@"Blended Colors"];
    [(PUParallaxLayerStackDebugPaletteView *)self addSubview:v29];
    v30 = [(PUParallaxLayerStackDebugPaletteView *)self palette];
    -[PUParallaxLayerStackDebugPaletteView _layoutPalette:origin:cellsPerRow:cellWidth:callback:](self, "_layoutPalette:origin:cellsPerRow:cellWidth:callback:", v30, 12, &__block_literal_global_88, x, v28 + 50.0 + 5.0, width / 12.0);
  }
}

id __54__PUParallaxLayerStackDebugPaletteView_layoutSubviews__block_invoke_3(double a1, double a2, double a3, double a4, uint64_t a5, void *a6)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v10 = (objc_class *)MEMORY[0x1E4F90260];
  id v11 = a6;
  double v12 = objc_msgSend([v10 alloc], "initWithFrame:", a1, a2, a3, a4);
  v13 = (void *)MEMORY[0x1E4FB1618];
  v14 = [v11 primaryColor];
  uint64_t v15 = objc_msgSend(v13, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
  v21[0] = v15;
  uint64_t v16 = (void *)MEMORY[0x1E4FB1618];
  unint64_t v17 = [v11 secondaryColor];

  v18 = objc_msgSend(v16, "colorWithCGColor:", objc_msgSend(v17, "CGColor"));
  v21[1] = v18;
  unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  [v12 setColors:v19];
  return v12;
}

id __54__PUParallaxLayerStackDebugPaletteView_layoutSubviews__block_invoke_2(double a1, double a2, double a3, double a4, uint64_t a5, void *a6)
{
  v10 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v11 = a6;
  double v12 = objc_msgSend([v10 alloc], "initWithFrame:", a1, a2, a3, a4);
  v13 = (void *)MEMORY[0x1E4FB1618];
  v14 = [v11 secondaryColor];

  uint64_t v15 = objc_msgSend(v13, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
  [v12 setBackgroundColor:v15];

  return v12;
}

id __54__PUParallaxLayerStackDebugPaletteView_layoutSubviews__block_invoke(double a1, double a2, double a3, double a4, uint64_t a5, void *a6)
{
  v10 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v11 = a6;
  double v12 = objc_msgSend([v10 alloc], "initWithFrame:", a1, a2, a3, a4);
  v13 = (void *)MEMORY[0x1E4FB1618];
  v14 = [v11 primaryColor];

  uint64_t v15 = objc_msgSend(v13, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
  [v12 setBackgroundColor:v15];

  return v12;
}

- (PUParallaxLayerStackDebugPaletteView)initWithColorPalette:(id)a3
{
  uint64_t v4 = (PIParallaxColorPalette *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PUParallaxLayerStackDebugPaletteView;
  uint64_t v5 = -[PUParallaxLayerStackDebugPaletteView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  palette = v5->_palette;
  v5->_palette = v4;

  return v5;
}

@end