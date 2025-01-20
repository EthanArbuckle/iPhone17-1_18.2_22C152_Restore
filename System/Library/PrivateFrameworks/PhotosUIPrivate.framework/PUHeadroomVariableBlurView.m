@interface PUHeadroomVariableBlurView
+ (Class)layerClass;
- (CAFilter)blurFilter;
- (PUHeadroomVariableBlurView)initWithFrame:(CGRect)a3;
- (UIImage)currentBlurMaskImage;
- (void)_updateBlurProperties;
- (void)setCurrentBlurMaskImage:(id)a3;
@end

@implementation PUHeadroomVariableBlurView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBlurMaskImage, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
}

- (void)setCurrentBlurMaskImage:(id)a3
{
}

- (UIImage)currentBlurMaskImage
{
  return self->_currentBlurMaskImage;
}

- (CAFilter)blurFilter
{
  return self->_blurFilter;
}

- (void)_updateBlurProperties
{
  v3 = +[PUPosterHeadroomSettings sharedInstance];
  [v3 blurMaskHeight];
  double v5 = v4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 1.0, v4);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __51__PUHeadroomVariableBlurView__updateBlurProperties__block_invoke;
  v19 = &unk_1E5F2DBC0;
  id v20 = v3;
  double v21 = v5;
  id v7 = v3;
  v8 = [v6 imageWithActions:&v16];
  -[PUHeadroomVariableBlurView setCurrentBlurMaskImage:](self, "setCurrentBlurMaskImage:", v8, v16, v17, v18, v19);

  v9 = +[PUPosterHeadroomSettings sharedInstance];
  [v9 blurRadius];
  double v11 = v10;

  v12 = [(PUHeadroomVariableBlurView *)self backdropLayer];
  id v13 = [(PUHeadroomVariableBlurView *)self currentBlurMaskImage];
  objc_msgSend(v12, "setValue:forKeyPath:", objc_msgSend(v13, "CGImage"), @"filters.variableBlur.inputMaskImage");

  v14 = [(PUHeadroomVariableBlurView *)self backdropLayer];
  v15 = [NSNumber numberWithDouble:v11];
  [v14 setValue:v15 forKeyPath:@"filters.variableBlur.inputRadius"];
}

void __51__PUHeadroomVariableBlurView__updateBlurProperties__block_invoke(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1DBF8];
  id v4 = a2;
  double v5 = CGColorSpaceCreateWithName(v3);
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  v13[0] = [v6 CGColor];
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  v13[1] = [v7 CGColor];
  CFArrayRef v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  [*(id *)(a1 + 32) blurMaskTopLocation];
  locations[0] = v9;
  locations[1] = 1.0;
  double v10 = CGGradientCreateWithColors(v5, v8, locations);
  double v11 = (CGContext *)[v4 CGContext];

  v15.y = *(CGFloat *)(a1 + 40);
  v14.x = 0.0;
  v14.y = 0.0;
  v15.x = 0.0;
  CGContextDrawLinearGradient(v11, v10, v14, v15, 2u);
  CGGradientRelease(v10);
  CGColorSpaceRelease(v5);
}

- (PUHeadroomVariableBlurView)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PUHeadroomVariableBlurView;
  CFStringRef v3 = -[PUHeadroomVariableBlurView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A060]];
    double v5 = [(PUHeadroomVariableBlurView *)v3 backdropLayer];
    [v5 setCompositingFilter:v4];

    id v6 = [(PUHeadroomVariableBlurView *)v3 backdropLayer];
    [v6 setAllowsHitTesting:0];

    id v7 = [(PUHeadroomVariableBlurView *)v3 backdropLayer];
    [v7 setMasksToBounds:1];

    uint64_t v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A348]];
    blurFilter = v3->_blurFilter;
    v3->_blurFilter = (CAFilter *)v8;

    [(CAFilter *)v3->_blurFilter setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    [(CAFilter *)v3->_blurFilter setValue:MEMORY[0x1E4F1CC28] forKey:@"inputDither"];
    [(CAFilter *)v3->_blurFilter setEnabled:1];
    v14[0] = v3->_blurFilter;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    double v11 = [(PUHeadroomVariableBlurView *)v3 backdropLayer];
    [v11 setFilters:v10];

    [(PUHeadroomVariableBlurView *)v3 _updateBlurProperties];
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end