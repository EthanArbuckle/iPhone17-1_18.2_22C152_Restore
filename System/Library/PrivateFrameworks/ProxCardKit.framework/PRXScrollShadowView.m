@interface PRXScrollShadowView
+ (Class)layerClass;
- (PRXScrollShadowView)initWithFrame:(CGRect)a3;
- (unint64_t)edge;
- (void)layoutSubviews;
- (void)setEdge:(unint64_t)a3;
@end

@implementation PRXScrollShadowView

- (PRXScrollShadowView)initWithFrame:(CGRect)a3
{
  v22[3] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)PRXScrollShadowView;
  v3 = -[PRXScrollShadowView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.14];
    v22[0] = [v4 CGColor];
    id v5 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.03];
    v22[1] = [v5 CGColor];
    id v6 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v22[2] = [v6 CGColor];
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
    v8 = [(PRXScrollShadowView *)v3 gradientLayer];
    [v8 setColors:v7];

    v9 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x263F157D0]);
    maskLayer = v3->_maskLayer;
    v3->_maskLayer = v9;

    [(PRXScrollShadowView *)v3 bounds];
    -[CAGradientLayer setFrame:](v3->_maskLayer, "setFrame:");
    id v11 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v21[0] = [v11 CGColor];
    id v12 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
    v21[1] = [v12 CGColor];
    id v13 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
    v21[2] = [v13 CGColor];
    id v14 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v21[3] = [v14 CGColor];
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [(CAGradientLayer *)v3->_maskLayer setColors:v15];

    [(CAGradientLayer *)v3->_maskLayer setLocations:&unk_26CCFC138];
    v16 = v3->_maskLayer;
    v17 = [(PRXScrollShadowView *)v3 gradientLayer];
    [v17 setMask:v16];

    [(PRXScrollShadowView *)v3 setEdge:1];
    v18 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRXScrollShadowView;
  [(PRXScrollShadowView *)&v3 layoutSubviews];
  [(PRXScrollShadowView *)self bounds];
  -[CAGradientLayer setFrame:](self->_maskLayer, "setFrame:");
}

- (void)setEdge:(unint64_t)a3
{
  if (self->_edge != a3)
  {
    self->_edge = a3;
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        goto LABEL_6;
      case 2uLL:
        id v4 = [(PRXScrollShadowView *)self gradientLayer];
        double v5 = 0.0;
        double v6 = 0.5;
        objc_msgSend(v4, "setStartPoint:", 0.0, 0.5);

        v7 = [(PRXScrollShadowView *)self gradientLayer];
        v8 = v7;
        double v9 = 1.0;
        double v10 = 1.0;
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
        v17 = [(PRXScrollShadowView *)self gradientLayer];
        double v5 = 0.5;
        double v13 = 1.0;
        objc_msgSend(v17, "setStartPoint:", 0.5, 1.0);

        id v12 = [(PRXScrollShadowView *)self gradientLayer];
        v8 = v12;
        double v6 = 0.0;
        double v14 = 0.5;
        double v15 = 0.0;
        goto LABEL_10;
      case 8uLL:
        v16 = [(PRXScrollShadowView *)self gradientLayer];
        double v9 = 1.0;
        double v6 = 0.5;
        objc_msgSend(v16, "setStartPoint:", 1.0, 0.5);

        v7 = [(PRXScrollShadowView *)self gradientLayer];
        v8 = v7;
        double v5 = 0.0;
        double v10 = 0.0;
LABEL_8:
        objc_msgSend(v7, "setEndPoint:", v10, 0.5);
        double v13 = 0.5;
        goto LABEL_11;
      default:
        if (a3 != 15) {
          return;
        }
LABEL_6:
        id v11 = [(PRXScrollShadowView *)self gradientLayer];
        double v5 = 0.5;
        double v6 = 0.0;
        objc_msgSend(v11, "setStartPoint:", 0.5, 0.0);

        id v12 = [(PRXScrollShadowView *)self gradientLayer];
        v8 = v12;
        double v13 = 1.0;
        double v14 = 0.5;
        double v15 = 1.0;
LABEL_10:
        objc_msgSend(v12, "setEndPoint:", v14, v15);
        double v9 = 0.5;
LABEL_11:

        -[CAGradientLayer setStartPoint:](self->_maskLayer, "setStartPoint:", v6, v5);
        maskLayer = self->_maskLayer;
        -[CAGradientLayer setEndPoint:](maskLayer, "setEndPoint:", v13, v9);
        break;
    }
  }
}

- (unint64_t)edge
{
  return self->_edge;
}

- (void).cxx_destruct
{
}

@end