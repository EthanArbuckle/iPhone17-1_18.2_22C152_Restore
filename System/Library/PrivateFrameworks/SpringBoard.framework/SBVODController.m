@interface SBVODController
+ (id)sharedInstance;
- (SBVODController)init;
- (void)_launchIPodIfNecessary;
- (void)dealloc;
@end

@implementation SBVODController

- (SBVODController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBVODController;
  v2 = [(SBVODController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_RentalMovieAdded, @"com.apple.itunesstored.RentalAdded", 0, CFNotificationSuspensionBehaviorDrop);
    [(SBVODController *)v2 _launchIPodIfNecessary];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.RentalAdded", 0);
  v4.receiver = self;
  v4.super_class = (Class)SBVODController;
  [(SBVODController *)&v4 dealloc];
}

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance_sController;
  if (!sharedInstance_sController)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBVODController);
    objc_super v4 = (void *)sharedInstance_sController;
    sharedInstance_sController = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)sharedInstance_sController;
  }
  return v2;
}

- (void)_launchIPodIfNecessary
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Media", @"iTunes_Control", @"iTunes", @"Rentals.plist", 0);
  v3 = [NSString pathWithComponents:v2];
  if (v3)
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v3];
    objc_super v5 = [v4 objectForKey:@"Rentals"];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Launching iPod for rentals", buf, 2u);
      }

      SBWorkspaceLaunchMusicSuspended();
    }
  }
}

@end