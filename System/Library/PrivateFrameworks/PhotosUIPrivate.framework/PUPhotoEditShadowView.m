@interface PUPhotoEditShadowView
+ (Class)layerClass;
- (PUPhotoEditShadowView)initWithFrame:(CGRect)a3;
- (unint64_t)transparentSide;
- (void)layoutSubviews;
- (void)setTransparentSide:(unint64_t)a3;
- (void)updateGradient;
@end

@implementation PUPhotoEditShadowView

- (void).cxx_destruct
{
}

- (unint64_t)transparentSide
{
  return self->_transparentSide;
}

- (void)setTransparentSide:(unint64_t)a3
{
  if (self->_transparentSide != a3)
  {
    self->_transparentSide = a3;
    if (self->_useVisualEffectView)
    {
      v4 = self->_gradientMaskLayer;
    }
    else
    {
      v4 = [(PUPhotoEditShadowView *)self gradientLayer];
    }
    double v5 = 1.0;
    double v6 = 0.5;
    double v7 = 0.0;
    double v8 = 0.5;
    switch(a3)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
        double v5 = 0.0;
        double v7 = 1.0;
        goto LABEL_10;
      case 2uLL:
        double v7 = 0.5;
        double v8 = 0.0;
        double v6 = 1.0;
        goto LABEL_9;
      case 3uLL:
        double v7 = 0.5;
        double v8 = 1.0;
        double v6 = 0.0;
LABEL_9:
        double v5 = 0.5;
LABEL_10:
        v9 = v4;
        -[CAGradientLayer setStartPoint:](v4, "setStartPoint:", v6, v7);
        -[CAGradientLayer setEndPoint:](v9, "setEndPoint:", v8, v5);
        v4 = v9;
        break;
      default:
        break;
    }
  }
}

- (void)updateGradient
{
  if (!self->_useVisualEffectView)
  {
    v3 = [(PUPhotoEditShadowView *)self traitCollection];
    if ([v3 userInterfaceStyle] == 1) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }

    double v5 = (void *)MEMORY[0x1E4F91258];
    double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:1.0];
    double v7 = [v5 colorValuesForSmoothDescendingGradientWithBaseColor:v6];
    double v8 = [(PUPhotoEditShadowView *)self gradientLayer];
    [v8 setColors:v7];

    id v10 = [MEMORY[0x1E4F91258] stopLocationsForSmoothDescendingGradient];
    v9 = [(PUPhotoEditShadowView *)self gradientLayer];
    [v9 setLocations:v10];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditShadowView;
  [(PUPhotoEditShadowView *)&v3 layoutSubviews];
  [(PUPhotoEditShadowView *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientMaskLayer, "setFrame:");
}

- (PUPhotoEditShadowView)initWithFrame:(CGRect)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PUPhotoEditShadowView;
  objc_super v3 = -[PUPhotoEditShadowView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PUPhotoEditShadowView *)v3 setUserInteractionEnabled:0];
    double v5 = +[PUPhotoEditProtoSettings sharedInstance];
    v4->_useVisualEffectView = [v5 blurToolBackgrounds];

    if (v4->_useVisualEffectView)
    {
      double v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v6];
      [v7 setAutoresizingMask:18];
      [(PUPhotoEditShadowView *)v4 bounds];
      objc_msgSend(v7, "setFrame:");
      [(PUPhotoEditShadowView *)v4 addSubview:v7];
      uint64_t v8 = [MEMORY[0x1E4F39BD0] layer];
      gradientMaskLayer = v4->_gradientMaskLayer;
      v4->_gradientMaskLayer = (CAGradientLayer *)v8;

      [(PUPhotoEditShadowView *)v4 bounds];
      -[CAGradientLayer setFrame:](v4->_gradientMaskLayer, "setFrame:");
      id v10 = (void *)MEMORY[0x1E4F1C978];
      id v11 = [MEMORY[0x1E4FB1618] whiteColor];
      uint64_t v12 = [v11 CGColor];
      id v13 = [MEMORY[0x1E4FB1618] clearColor];
      v14 = objc_msgSend(v10, "arrayWithObjects:", v12, objc_msgSend(v13, "CGColor"), 0);
      [(CAGradientLayer *)v4->_gradientMaskLayer setColors:v14];

      -[CAGradientLayer setStartPoint:](v4->_gradientMaskLayer, "setStartPoint:", 0.0, 0.200000003);
      -[CAGradientLayer setEndPoint:](v4->_gradientMaskLayer, "setEndPoint:", 0.0, 1.0);
      v15 = v4->_gradientMaskLayer;
      v16 = [v7 layer];
      [v16 setMask:v15];

      v21[0] = objc_opt_class();
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      id v18 = (id)[(PUPhotoEditShadowView *)v4 registerForTraitChanges:v17 withAction:sel_traitEnvironment_didChangeTraitCollection_];
    }
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end