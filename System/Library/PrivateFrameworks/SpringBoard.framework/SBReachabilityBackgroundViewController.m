@interface SBReachabilityBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (SBReachabilityBackgroundViewController)initWithWallpaperVariant:(int64_t)a3;
- (id)view;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation SBReachabilityBackgroundViewController

- (SBReachabilityBackgroundViewController)initWithWallpaperVariant:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityBackgroundViewController;
  v5 = [(SBReachabilityBackgroundViewController *)&v11 init];
  if (v5)
  {
    v6 = [SBReachabilityBackgroundView alloc];
    int v7 = __sb__runningInSpringBoard();
    char v8 = v7;
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    v9 = -[SBReachabilityBackgroundView initWithFrame:wallpaperVariant:](v6, "initWithFrame:wallpaperVariant:", a3);
    if ((v8 & 1) == 0) {

    }
    [(SBReachabilityBackgroundViewController *)v5 setView:v9];
  }
  return v5;
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)SBReachabilityBackgroundViewController;
  v2 = [(SBReachabilityBackgroundViewController *)&v4 view];
  return v2;
}

- (BOOL)shouldAutorotate
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleReachability");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end