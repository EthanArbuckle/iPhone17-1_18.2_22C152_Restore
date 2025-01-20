@interface PBUIGradientView
+ (Class)layerClass;
- (PBUIWallpaperGradient)gradient;
- (void)setGradient:(id)a3;
@end

@implementation PBUIGradientView

+ (Class)layerClass
{
  return (Class)self;
}

- (void)setGradient:(id)a3
{
  v6 = (PBUIWallpaperGradient *)a3;
  if (self->_gradient != v6)
  {
    objc_storeStrong((id *)&self->_gradient, a3);
    v5 = [(PBUIGradientView *)self layer];
    [(PBUIWallpaperGradient *)v6 configureLayer:v5];
  }
}

- (PBUIWallpaperGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
}

@end