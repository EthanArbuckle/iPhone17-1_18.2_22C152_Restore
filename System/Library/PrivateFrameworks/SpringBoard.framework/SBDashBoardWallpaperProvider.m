@interface SBDashBoardWallpaperProvider
- (id)createCoverSheetWallpaperView;
- (id)createCoverSheetWallpaperViewWithTransformOptions:(unint64_t)a3;
- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4;
- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5;
- (id)suspendWallpaperAnimationForReason:(id)a3;
- (void)wallpaperClientDidRotateFromInterfaceOrientation:(int64_t)a3;
- (void)wallpaperClientWillAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)wallpaperClientWillRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SBDashBoardWallpaperProvider

- (id)createCoverSheetWallpaperView
{
  return [(SBDashBoardWallpaperProvider *)self createCoverSheetWallpaperViewWithTransformOptions:18];
}

- (id)createCoverSheetWallpaperViewWithTransformOptions:(unint64_t)a3
{
  v3 = [[SBDashBoardWallpaperEffectView alloc] initWithWallpaperVariant:0 transformOptions:a3];
  [(PBUIWallpaperEffectViewBase *)v3 setStyle:0];
  [(PBUIWallpaperEffectViewBase *)v3 setForcesOpaque:1];
  [(PBUIWallpaperEffectViewBase *)v3 setShouldMatchWallpaperPosition:0];
  return v3;
}

- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = +[SBWallpaperController sharedInstance];
  v7 = [v6 createWallpaperFloatingViewForReason:v5 ignoreReplica:v4];

  return v7;
}

- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[SBWallpaperController sharedInstance];
  v11 = [v10 setWallpaperFloatingLayerContainerView:v9 forReason:v8 withAnimationFactory:v7];

  return v11;
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[SBWallpaperController sharedInstance];
  id v5 = [v4 suspendWallpaperAnimationForReason:v3];

  return v5;
}

- (void)wallpaperClientWillRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = +[SBWallpaperController sharedInstance];
  [v6 orientationSource:3 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)wallpaperClientWillAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = +[SBWallpaperController sharedInstance];
  [v6 orientationSource:3 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)wallpaperClientDidRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4 = +[SBWallpaperController sharedInstance];
  [v4 orientationSource:3 didRotateFromInterfaceOrientation:a3];
}

@end