@interface SVAdGradientView
+ (Class)layerClass;
- (SVAdGradientView)initWithFrame:(CGRect)a3;
@end

@implementation SVAdGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SVAdGradientView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SVAdGradientView;
  v3 = -[SVAdGradientView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SVAdGradientView *)v3 layer];
    objc_msgSend(v5, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v5, "setEndPoint:", 0.5, 1.0);
    v6 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v7 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.03];
    v8 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.12];
    v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.35];
    v10 = (void *)MEMORY[0x263EFF8C0];
    id v27 = v6;
    uint64_t v11 = [v27 CGColor];
    id v26 = v7;
    uint64_t v12 = [v26 CGColor];
    id v13 = v8;
    uint64_t v14 = [v13 CGColor];
    id v15 = v9;
    v16 = objc_msgSend(v10, "arrayWithObjects:", v11, v12, v14, objc_msgSend(v15, "CGColor"), 0);
    [v5 setColors:v16];
    v17 = [NSNumber numberWithFloat:0.0];
    LODWORD(v18) = 0.5;
    v19 = [NSNumber numberWithFloat:v18];
    LODWORD(v20) = 0.75;
    v21 = [NSNumber numberWithFloat:v20];
    LODWORD(v22) = 1.0;
    v23 = [NSNumber numberWithFloat:v22];
    v24 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v17, v19, v21, v23, 0);
    [v5 setLocations:v24];
  }
  return v4;
}

@end