@interface CACAdaptiveBackdropView
+ (Class)layerClass;
+ (id)contrastAdaptiveBackdropViewWithFrame:(CGRect)a3;
- (CACAdaptiveBackdropView)initWithFrame:(CGRect)a3;
- (CACAdaptiveBackdropView)initWithFrame:(CGRect)a3 isContrasted:(BOOL)a4;
- (CAFilter)colorMatrix;
- (CAFilter)gaussianBlurFilter;
- (CAFilter)luminanceMapFilter;
- (void)setColorMatrix:(id)a3;
- (void)setGaussianBlurFilter:(id)a3;
- (void)setLuminanceMapFilter:(id)a3;
@end

@implementation CACAdaptiveBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CACAdaptiveBackdropView)initWithFrame:(CGRect)a3
{
  return -[CACAdaptiveBackdropView initWithFrame:isContrasted:](self, "initWithFrame:isContrasted:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CACAdaptiveBackdropView)initWithFrame:(CGRect)a3 isContrasted:(BOOL)a4
{
  BOOL v4 = a4;
  v30[3] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)CACAdaptiveBackdropView;
  v5 = -[CACAdaptiveBackdropView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v6 setValue:&unk_26EB4CF90 forKey:@"inputRadius"];
    gaussianBlurFilter = v5->_gaussianBlurFilter;
    v5->_gaussianBlurFilter = (CAFilter *)v6;
    id v8 = v6;

    v9 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CF0]];
    v10 = (void *)MEMORY[0x263F827E8];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [(CACAdaptiveBackdropView *)v5 traitCollection];
    v13 = [v10 imageNamed:@"luminance" inBundle:v11 compatibleWithTraitCollection:v12];

    id v14 = v13;
    objc_msgSend(v9, "setValue:forKey:", objc_msgSend(v14, "CGImage"), @"inputColorMap");
    [v9 setValue:&unk_26EB4CFA0 forKey:@"inputAmount"];
    luminanceMapFilter = v5->_luminanceMapFilter;
    v5->_luminanceMapFilter = (CAFilter *)v9;
    id v16 = v9;

    v17 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
    CAColorMatrixMakeColorSourceOver();
    memset(v28, 0, sizeof(v28));
    v18 = [MEMORY[0x263F08D40] valueWithBytes:v28 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
    [v17 setValue:v18 forKey:@"inputColorMatrix"];

    colorMatrix = v5->_colorMatrix;
    v5->_colorMatrix = (CAFilter *)v17;
    id v20 = v17;

    v30[0] = v8;
    v30[1] = v16;
    v30[2] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];

    v22 = [(CACAdaptiveBackdropView *)v5 layer];
    [v22 setFilters:v21];

    if (v4) {
      CACAdaptiveBackdropContrastedGroupName();
    }
    else {
    v23 = CACAdaptiveBackdropGroupName();
    }
    v24 = [(CACAdaptiveBackdropView *)v5 layer];
    [v24 setGroupName:v23];

    double v25 = CACAdaptiveBackdropScale();
    v26 = [(CACAdaptiveBackdropView *)v5 layer];
    [v26 setScale:v25];
  }
  return v5;
}

+ (id)contrastAdaptiveBackdropViewWithFrame:(CGRect)a3
{
  v3 = -[CACAdaptiveBackdropView initWithFrame:isContrasted:]([CACAdaptiveBackdropView alloc], "initWithFrame:isContrasted:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

- (CAFilter)gaussianBlurFilter
{
  return self->_gaussianBlurFilter;
}

- (void)setGaussianBlurFilter:(id)a3
{
}

- (CAFilter)luminanceMapFilter
{
  return self->_luminanceMapFilter;
}

- (void)setLuminanceMapFilter:(id)a3
{
}

- (CAFilter)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorMatrix, 0);
  objc_storeStrong((id *)&self->_luminanceMapFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
}

@end