@interface PUWallpaperPosterParallaxView
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (PUWallpaperPosterMotionEffect)motionEffect;
- (PUWallpaperPosterParallaxView)initWithFrame:(CGRect)a3 parallaxHandler:(id)a4;
- (id)parallaxHandler;
- (void)setMotionEffect:(id)a3;
- (void)startParallax;
- (void)stopParallax;
@end

@implementation PUWallpaperPosterParallaxView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEffect, 0);
  objc_storeStrong(&self->_parallaxHandler, 0);
}

- (void)setMotionEffect:(id)a3
{
}

- (PUWallpaperPosterMotionEffect)motionEffect
{
  return self->_motionEffect;
}

- (id)parallaxHandler
{
  return self->_parallaxHandler;
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5 = a3;
  v6 = [(PUWallpaperPosterParallaxView *)self motionEffect];
  [v6 parallaxVectorFromKeyPathsAndRelativeValues:v5];
  double v8 = v7;
  double v10 = v9;

  v11 = [(PUWallpaperPosterParallaxView *)self parallaxHandler];
  v11[2](v8, v10);

  return 1;
}

- (void)stopParallax
{
  v3 = [(PUWallpaperPosterParallaxView *)self motionEffect];

  if (v3)
  {
    v4 = [(PUWallpaperPosterParallaxView *)self motionEffect];
    [(PUWallpaperPosterParallaxView *)self removeMotionEffect:v4];

    [(PUWallpaperPosterParallaxView *)self setMotionEffect:0];
  }
}

- (void)startParallax
{
  v3 = [(PUWallpaperPosterParallaxView *)self motionEffect];

  if (!v3)
  {
    v4 = objc_alloc_init(PUWallpaperPosterMotionEffect);
    [(PUWallpaperPosterParallaxView *)self setMotionEffect:v4];

    id v5 = [(PUWallpaperPosterParallaxView *)self motionEffect];
    [(PUWallpaperPosterParallaxView *)self addMotionEffect:v5];
  }
}

- (PUWallpaperPosterParallaxView)initWithFrame:(CGRect)a3 parallaxHandler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUWallpaperPosterParallaxView;
  double v10 = -[PUWallpaperPosterParallaxView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    id parallaxHandler = v10->_parallaxHandler;
    v10->_id parallaxHandler = (id)v11;
  }
  return v10;
}

@end