@interface UPQuiltViewPad
- (NSString)identifier;
- (UPQuiltViewPad)initWithFrame:(CGRect)a3 identifier:(id)a4;
- (double)getOffsetForDeviceInterfaceOrientation:(double *)a1;
- (double)originTranslationValueForLandscapeMode;
- (double)originTranslationValueForPortraitMode;
- (double)scaleValueForLandscapeMode;
- (id)description;
- (id)setupLayerForIdentifier:(void *)a1;
- (void)setIdentifier:(id)a3;
- (void)updateQuiltsWithIdentifier:(id)a3 deviceInterfaceOrientation:(int64_t)a4 unlockProgress:(double)a5;
@end

@implementation UPQuiltViewPad

- (UPQuiltViewPad)initWithFrame:(CGRect)a3 identifier:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UPQuiltViewPad;
  v10 = -[UPQuiltViewPad initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_originalFrame.origin.double x = x;
    v10->_originalFrame.origin.double y = y;
    v10->_originalFrame.size.double width = width;
    v10->_originalFrame.size.double height = height;
    uint64_t v12 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v11->_widthRatioToHero = width / 834.0;
    v11->_heightRatioToHero = height / 1194.0;
    uint64_t v14 = -[UPQuiltViewPad setupLayerForIdentifier:](v11, v11->_identifier);
    quiltImageLayer = v11->_quiltImageLayer;
    v11->_quiltImageLayer = (CALayer *)v14;

    v16 = [(UPQuiltViewPad *)v11 layer];
    [v16 addSublayer:v11->_quiltImageLayer];

    v17 = [(UPQuiltViewPad *)v11 layer];
    [v17 setNeedsDisplay];
  }
  return v11;
}

- (id)setupLayerForIdentifier:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (setupLayerForIdentifier__onceToken != -1) {
      dispatch_once(&setupLayerForIdentifier__onceToken, &__block_literal_global_0);
    }
    v4 = (void *)setupLayerForIdentifier__cache;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__UPQuiltViewPad_setupLayerForIdentifier___block_invoke_2;
    v12[3] = &unk_264C4C700;
    id v13 = v3;
    id v5 = [v4 imageForKey:v13 generatingIfNecessaryWithBlock:v12];
    uint64_t v6 = [v5 CGImage];
    id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
    [v5 size];
    double v9 = v8;
    [v5 size];
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v9, v10);
    [v7 setContents:v6];
    [a1 setClipsToBounds:0];
    [v7 setMasksToBounds:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setIdentifier:(id)a3
{
  id v11 = a3;
  if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:") || !self->_quiltImageLayer)
  {
    v4 = (NSString *)[v11 copy];
    identifier = self->_identifier;
    self->_identifier = v4;

    -[UPQuiltViewPad setupLayerForIdentifier:](self, v11);
    uint64_t v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
    id v7 = [(CALayer *)self->_quiltImageLayer superlayer];

    double v8 = [(UPQuiltViewPad *)self layer];
    double v9 = v8;
    if (v7) {
      [v8 replaceSublayer:self->_quiltImageLayer with:v6];
    }
    else {
      [v8 addSublayer:v6];
    }

    quiltImageLayer = self->_quiltImageLayer;
    self->_quiltImageLayer = v6;
  }
}

uint64_t __42__UPQuiltViewPad_setupLayerForIdentifier___block_invoke()
{
  setupLayerForIdentifier__cache = [objc_alloc(MEMORY[0x263F29D40]) initWithUniqueIdentifier:@"UnityPoster"];
  return MEMORY[0x270F9A758]();
}

id __42__UPQuiltViewPad_setupLayerForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  *a2 |= 4uLL;
  v2 = (void *)MEMORY[0x263F827E8];
  id v3 = [*(id *)(a1 + 32) stringByAppendingString:@"_ipad"];
  v4 = [v2 imageNamed:v3];

  return v4;
}

- (double)getOffsetForDeviceInterfaceOrientation:(double *)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = a2 - 2;
  if ((unint64_t)(a2 - 2) > 2)
  {
    CGFloat v4 = 0.0;
    double v3 = 0.6;
  }
  else
  {
    double v3 = dbl_2352C32A0[v2];
    CGFloat v4 = dbl_2352C32B8[v2];
  }
  double v5 = a1[70];
  double v6 = a1[71];
  double v7 = a1[72];
  double v8 = a1[73];
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&v14.tx;
  CGAffineTransformTranslate(&v14, &v13, v5 * 0.5 * v7, v6 * 0.5 * v8);
  CGAffineTransform v12 = v14;
  CGAffineTransformRotate(&v13, &v12, v4);
  CGAffineTransform v14 = v13;
  CGAffineTransform v12 = v13;
  CGAffineTransformScale(&v13, &v12, v3 * v7, v3 * v8);
  CGAffineTransform v14 = v13;
  CGAffineTransform v12 = v13;
  CGAffineTransformTranslate(&v13, &v12, -(v5 * 0.5 * v7), -(v6 * 0.5 * v8));
  CGAffineTransform v14 = v13;
  v15.size.double width = v5 * v7;
  v15.size.double height = v6 * v8;
  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  *(void *)&double v10 = (unint64_t)CGRectApplyAffineTransform(v15, &v13);
  return UPSubtractPoints(0.0, 0.0, v10);
}

- (double)originTranslationValueForPortraitMode
{
  if (a1)
  {
    unsigned int v2 = MGGetSInt32Answer();
    if (v2 > 0x1C) {
      goto LABEL_9;
    }
    double v3 = -0.282;
    if (((1 << v2) & 0x200018) != 0 || ((1 << v2) & 0x100000C0) != 0) {
      goto LABEL_10;
    }
    if (((1 << v2) & 0x4800) != 0) {
      double v3 = -0.276;
    }
    else {
LABEL_9:
    }
      double v3 = -0.276;
LABEL_10:
    [a1 timeRect];
    [a1 timeRect];
    return v3 * a1[72] * 3414.0;
  }
  return 0.0;
}

- (double)scaleValueForLandscapeMode
{
  if (!a1) {
    return 0.0;
  }
  unsigned int v1 = MGGetSInt32Answer();
  if (v1 > 0x1C || ((1 << v1) & 0x100000C0) == 0) {
    return 0.4;
  }
  else {
    return 0.45;
  }
}

- (double)originTranslationValueForLandscapeMode
{
  if (!a1) {
    return 0.0;
  }
  unsigned int v2 = MGGetSInt32Answer();
  if (v2 > 0x1C) {
    goto LABEL_9;
  }
  if (((1 << v2) & 0x200018) != 0)
  {
    double v3 = 0.1262;
    goto LABEL_10;
  }
  if (((1 << v2) & 0x100000C0) == 0)
  {
    if (((1 << v2) & 0x4800) != 0)
    {
      double v3 = 0.1054;
      goto LABEL_10;
    }
LABEL_9:
    double v3 = 0.1326;
    goto LABEL_10;
  }
  double v3 = 0.15112;
LABEL_10:
  [a1 timeRect];
  double v5 = v4;
  [a1 timeRect];
  double v7 = -(v3 * a1[72] * 3414.0 - (v5 + v6 * 0.5));
  [a1 landscapeWidgetRect];
  return v7;
}

- (void)updateQuiltsWithIdentifier:(id)a3 deviceInterfaceOrientation:(int64_t)a4 unlockProgress:(double)a5
{
  id v8 = a3;
  if (![(NSString *)self->_identifier isEqualToString:v8]) {
    [(UPQuiltViewPad *)self setIdentifier:v8];
  }
  double v9 = a5 * -0.2 + 1.0;
  if ((unint64_t)(a4 - 3) >= 2) {
    double v10 = a5 * -0.2 + 1.0;
  }
  else {
    double v10 = a5 * -0.1 + 1.0;
  }
  double v11 = -[UPQuiltViewPad getOffsetForDeviceInterfaceOrientation:]((double *)self, a4);
  double v13 = v12;
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v40.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v40.c = v14;
  *(_OWORD *)&v40.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v39.a = *(_OWORD *)&v40.a;
  *(_OWORD *)&v39.c = v14;
  *(_OWORD *)&v39.tdouble x = *(_OWORD *)&v40.tx;
  CGAffineTransformScale(&v40, &v39, v9, v10);
  switch(a4)
  {
    case 2:
      double v20 = -[UPQuiltViewPad originTranslationValueForPortraitMode]((double *)self);
      CGAffineTransform v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, -v20, -v21);
      CGAffineTransform v40 = v39;
      CGAffineTransform v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, -v11, -v13);
      CGAffineTransform v40 = v39;
      CGAffineTransform v38 = v39;
      CGAffineTransformRotate(&v39, &v38, 3.14159265);
      break;
    case 3:
      double v22 = -[UPQuiltViewPad originTranslationValueForLandscapeMode]((double *)self);
      double v24 = v23;
      unsigned int v25 = MGGetSInt32Answer();
      if (v25 <= 0x1C && ((1 << v25) & 0x100000C0) != 0) {
        double v26 = 0.45;
      }
      else {
        double v26 = 0.4;
      }
      CGAffineTransform v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, -v22, -v24);
      *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
      *(_OWORD *)&v40.tdouble x = *(_OWORD *)&v39.tx;
      *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
      CGAffineTransform v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, -v11, v13);
      *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
      *(_OWORD *)&v40.tdouble x = *(_OWORD *)&v39.tx;
      *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
      CGAffineTransform v38 = v39;
      CGAffineTransformRotate(&v39, &v38, 1.57079633);
      long long v30 = *(_OWORD *)&v39.c;
      long long v29 = *(_OWORD *)&v39.tx;
      *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
      *(_OWORD *)&v40.tdouble x = *(_OWORD *)&v39.tx;
      long long v31 = *(_OWORD *)&v39.a;
      double widthRatioToHero = self->_widthRatioToHero;
      *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
      double v33 = v26 * widthRatioToHero;
      double heightRatioToHero = self->_heightRatioToHero;
      goto LABEL_22;
    case 4:
      double v15 = -[UPQuiltViewPad originTranslationValueForLandscapeMode]((double *)self);
      CGFloat v17 = v16;
      unsigned int v18 = MGGetSInt32Answer();
      if (v18 <= 0x1C && ((1 << v18) & 0x100000C0) != 0) {
        double v19 = 0.45;
      }
      else {
        double v19 = 0.4;
      }
      CGAffineTransform v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, v15, v17);
      CGAffineTransform v40 = v39;
      CGAffineTransform v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, v11, -v13);
      CGAffineTransform v40 = v39;
      CGAffineTransform v38 = v39;
      CGAffineTransformRotate(&v39, &v38, -1.57079633);
      long long v30 = *(_OWORD *)&v39.c;
      long long v29 = *(_OWORD *)&v39.tx;
      CGAffineTransform v40 = v39;
      long long v31 = *(_OWORD *)&v39.a;
      double heightRatioToHero = self->_heightRatioToHero;
      double v33 = v19 * self->_widthRatioToHero;
LABEL_22:
      double v34 = heightRatioToHero * 0.4;
      goto LABEL_23;
    default:
      double v27 = -[UPQuiltViewPad originTranslationValueForPortraitMode]((double *)self);
      CGAffineTransform v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, v27, v28);
      CGAffineTransform v40 = v39;
      CGAffineTransform v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, v11, v13);
      break;
  }
  long long v30 = *(_OWORD *)&v39.c;
  long long v29 = *(_OWORD *)&v39.tx;
  *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
  *(_OWORD *)&v40.tdouble x = *(_OWORD *)&v39.tx;
  long long v31 = *(_OWORD *)&v39.a;
  double v32 = self->_widthRatioToHero;
  *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
  double v33 = v32 * 0.6;
  double v34 = self->_heightRatioToHero * 0.6;
LABEL_23:
  *(_OWORD *)&v38.a = v31;
  *(_OWORD *)&v38.c = v30;
  *(_OWORD *)&v38.tdouble x = v29;
  CGAffineTransformScale(&v39, &v38, v33, v34);
  CGAffineTransform v40 = v39;
  CGAffineTransform v37 = v39;
  [(UPQuiltViewPad *)self setTransform:&v37];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"UPQuilt = memory:%p", self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_quiltImageLayer, 0);
  objc_storeStrong((id *)&self->_transitionLayer, 0);
}

@end