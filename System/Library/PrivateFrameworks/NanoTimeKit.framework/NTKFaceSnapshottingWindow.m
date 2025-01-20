@interface NTKFaceSnapshottingWindow
+ (BOOL)_isSecure;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_shouldUseRemoteContext;
- (BOOL)_wantsSceneAssociation;
- (NTKFaceSnapshottingWindow)init;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForViewTransform;
- (void)updateForDevice:(id)a3;
@end

@implementation NTKFaceSnapshottingWindow

- (NTKFaceSnapshottingWindow)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceSnapshottingWindow;
  v2 = -[NTKFaceSnapshottingWindow initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKFaceSnapshottingWindow *)v2 setBackgroundColor:v3];

    [(NTKFaceSnapshottingWindow *)v2 setOpaque:1];
  }
  return v2;
}

- (void)updateForDevice:(id)a3
{
  id v4 = a3;
  [v4 screenBounds];
  -[NTKFaceSnapshottingWindow setFrame:](self, "setFrame:");
  [v4 screenScale];
  double v6 = v5;

  [(NTKFaceSnapshottingWindow *)self setContentScaleFactor:v6];
}

- (BOOL)_shouldUseRemoteContext
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end