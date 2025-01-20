@interface WLKBackgroundUpdateController
+ (id)sharedInstance;
- (WLKBackgroundUpdateController)init;
- (id)_init;
- (void)dealloc;
@end

@implementation WLKBackgroundUpdateController

+ (id)sharedInstance
{
  if (sharedInstance___once_1 != -1) {
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;

  return v2;
}

uint64_t __47__WLKBackgroundUpdateController_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_0 = [[WLKBackgroundUpdateController alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (WLKBackgroundUpdateController)init
{
  return 0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)WLKBackgroundUpdateController;
  v2 = [(WLKBackgroundUpdateController *)&v10 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__WLKBackgroundUpdateController__init__block_invoke;
    v7[3] = &unk_1E620A318;
    objc_copyWeak(&v8, &location);
    uint32_t v5 = notify_register_dispatch("com.apple.WatchListKit.background-update-requested", &v2->_notifyToken, v3, v7);

    v2->_notifyTokenIsValid = v5 == 0;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__WLKBackgroundUpdateController__init__block_invoke(uint64_t a1)
{
  NSLog(&cfstr_GotBackgroundU.isa);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(&cfstr_PostingWlkback.isa);
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"WLKBackgroundUpdateRequestedNotification" object:WeakRetained];
  }
}

- (void)dealloc
{
  if (self->_notifyTokenIsValid) {
    notify_cancel(self->_notifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)WLKBackgroundUpdateController;
  [(WLKBackgroundUpdateController *)&v3 dealloc];
}

@end