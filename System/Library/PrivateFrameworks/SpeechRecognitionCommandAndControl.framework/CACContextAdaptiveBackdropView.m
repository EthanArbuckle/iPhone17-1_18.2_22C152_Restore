@interface CACContextAdaptiveBackdropView
+ (Class)layerClass;
- (CACContextAdaptiveBackdropView)initWithFrame:(CGRect)a3;
- (UIView)tintView;
- (void)setCornerRadius:(double)a3;
- (void)setTintView:(id)a3;
@end

@implementation CACContextAdaptiveBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CACContextAdaptiveBackdropView)initWithFrame:(CGRect)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)CACContextAdaptiveBackdropView;
  v3 = -[CACContextAdaptiveBackdropView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v4 setValue:&unk_26EB4CFC0 forKey:@"inputRadius"];
    v5 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CF0]];
    v6 = (void *)MEMORY[0x263F827E8];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [(CACContextAdaptiveBackdropView *)v3 traitCollection];
    v9 = [v6 imageNamed:@"luminance" inBundle:v7 compatibleWithTraitCollection:v8];

    id v10 = v9;
    objc_msgSend(v5, "setValue:forKey:", objc_msgSend(v10, "CGImage"), @"inputColorMap");
    [v5 setValue:&unk_26EB4CFD0 forKey:@"inputAmount"];
    v25[0] = v4;
    v25[1] = v5;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    v12 = [(CACContextAdaptiveBackdropView *)v3 layer];
    [v12 setFilters:v11];

    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = [(CACContextAdaptiveBackdropView *)v3 layer];
    [v15 setGroupName:v14];

    id v16 = objc_alloc(MEMORY[0x263F82E00]);
    [(CACContextAdaptiveBackdropView *)v3 bounds];
    v17 = objc_msgSend(v16, "initWithFrame:");
    [(CACContextAdaptiveBackdropView *)v3 setTintView:v17];

    v18 = [(CACContextAdaptiveBackdropView *)v3 tintView];
    [v18 setAutoresizingMask:18];

    v19 = [MEMORY[0x263F825C8] colorWithWhite:0.941176471 alpha:0.77];
    v20 = [(CACContextAdaptiveBackdropView *)v3 tintView];
    [v20 setBackgroundColor:v19];

    v21 = [(CACContextAdaptiveBackdropView *)v3 tintView];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(CACContextAdaptiveBackdropView *)v3 tintView];
    [(CACContextAdaptiveBackdropView *)v3 addSubview:v22];
  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  v5 = [(CACContextAdaptiveBackdropView *)self layer];
  [v5 setCornerRadius:a3];

  id v7 = [(CACContextAdaptiveBackdropView *)self tintView];
  v6 = [v7 layer];
  [v6 setCornerRadius:a3];
}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end