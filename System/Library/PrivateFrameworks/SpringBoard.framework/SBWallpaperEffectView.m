@interface SBWallpaperEffectView
- (PBUIWallpaperController)wallpaperController;
- (SBWallpaperEffectView)initWithFrame:(CGRect)a3;
- (SBWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3;
- (SBWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3 transformOptions:(unint64_t)a4;
@end

@implementation SBWallpaperEffectView

- (SBWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3 transformOptions:(unint64_t)a4
{
  v7 = +[SBWallpaperController sharedInstance];
  v8 = [(PBUIWallpaperEffectViewBase *)self initWithWallpaperPresenter:v7 variant:a3 transformOptions:a4];

  return v8;
}

- (SBWallpaperEffectView)initWithFrame:(CGRect)a3
{
  return -[SBWallpaperEffectView initWithWallpaperVariant:](self, "initWithWallpaperVariant:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3
{
  return [(SBWallpaperEffectView *)self initWithWallpaperVariant:a3 transformOptions:0];
}

- (PBUIWallpaperController)wallpaperController
{
  v2 = [(PBUIWallpaperEffectViewBase *)self wallpaperPresenter];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (PBUIWallpaperController *)v3;
}

@end