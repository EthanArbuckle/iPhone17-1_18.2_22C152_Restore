@interface PUIGradientView
- (BOOL)usesBlur;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (PUIGradientView)initWithFrame:(CGRect)a3;
- (PUIGradientView)initWithFrame:(CGRect)a3 usesBlur:(BOOL)a4;
- (void)layoutSubviews;
- (void)setColors:(id)a3;
- (void)setColors:(id)a3 locations:(id)a4 type:(id)a5;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
- (void)setUsesBlur:(BOOL)a3;
@end

@implementation PUIGradientView

- (PUIGradientView)initWithFrame:(CGRect)a3
{
  return -[PUIGradientView initWithFrame:usesBlur:](self, "initWithFrame:usesBlur:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUIGradientView)initWithFrame:(CGRect)a3 usesBlur:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUIGradientView;
  v5 = -[PUIGradientView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(PUIGradientView *)v5 setClipsToBounds:1];
    uint64_t v7 = [MEMORY[0x263F157D0] layer];
    gradientLayer = v6->_gradientLayer;
    v6->_gradientLayer = (CAGradientLayer *)v7;

    v9 = v6->_gradientLayer;
    [(PUIGradientView *)v6 bounds];
    -[CAGradientLayer setFrame:](v9, "setFrame:");
    v10 = [(PUIGradientView *)v6 layer];
    [v10 addSublayer:v6->_gradientLayer];

    [(PUIGradientView *)v6 setUsesBlur:v4];
  }
  return v6;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PUIGradientView;
  [(PUIGradientView *)&v4 layoutSubviews];
  gradientLayer = self->_gradientLayer;
  [(PUIGradientView *)self bounds];
  -[CAGradientLayer setFrame:](gradientLayer, "setFrame:");
}

- (void)setUsesBlur:(BOOL)a3
{
  if (self->_usesBlur != a3)
  {
    if (a3)
    {
      if (!self->_blurFilter)
      {
        objc_super v4 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
        blurFilter = self->_blurFilter;
        self->_blurFilter = v4;

        [(CAFilter *)self->_blurFilter setValue:&unk_27081B230 forKey:@"inputRadius"];
        [(CAFilter *)self->_blurFilter setValue:&unk_27081B248 forKey:@"inputHardEdges"];
        [(CAFilter *)self->_blurFilter setValue:&unk_27081B248 forKey:@"inputNormalizeEdges"];
      }
      p_gradientLayer = &self->_gradientLayer;
      uint64_t v7 = [(CAGradientLayer *)self->_gradientLayer filters];
      v8 = (void *)[v7 mutableCopy];
      v9 = v8;
      if (v8) {
        id v10 = v8;
      }
      else {
        id v10 = (id)objc_opt_new();
      }
      id v15 = v10;

      [v15 addObject:self->_blurFilter];
    }
    else
    {
      p_gradientLayer = &self->_gradientLayer;
      v11 = [(CAGradientLayer *)self->_gradientLayer filters];
      objc_super v12 = (void *)[v11 mutableCopy];
      v13 = v12;
      if (v12) {
        id v14 = v12;
      }
      else {
        id v14 = (id)objc_opt_new();
      }
      id v15 = v14;

      [v15 removeObject:self->_blurFilter];
    }
    [(CAGradientLayer *)*p_gradientLayer setFilters:v15];
  }
}

- (void)setColors:(id)a3 locations:(id)a4 type:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v10) {
    [(CAGradientLayer *)self->_gradientLayer setColors:v10];
  }
  if (v8) {
    [(CAGradientLayer *)self->_gradientLayer setLocations:v8];
  }
  if (v9) {
    [(CAGradientLayer *)self->_gradientLayer setType:v9];
  }
}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", a3.x, a3.y);
  gradientLayer = self->_gradientLayer;
  -[CAGradientLayer setEndPoint:](gradientLayer, "setEndPoint:", x, y);
}

- (NSArray)colors
{
  v2 = [(CAGradientLayer *)self->_gradientLayer colors];
  v3 = objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_1);

  return (NSArray *)v3;
}

uint64_t __25__PUIGradientView_colors__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F1C550] colorWithCGColor:a2];
}

- (void)setColors:(id)a3
{
  gradientLayer = self->_gradientLayer;
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_18);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CAGradientLayer *)gradientLayer setColors:v4];
}

uint64_t __29__PUIGradientView_setColors___block_invoke(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

- (NSArray)locations
{
  return [(CAGradientLayer *)self->_gradientLayer locations];
}

- (void)setLocations:(id)a3
{
}

- (CGPoint)startPoint
{
  [(CAGradientLayer *)self->_gradientLayer startPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
}

- (CGPoint)endPoint
{
  [(CAGradientLayer *)self->_gradientLayer endPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
}

- (BOOL)usesBlur
{
  return self->_usesBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end