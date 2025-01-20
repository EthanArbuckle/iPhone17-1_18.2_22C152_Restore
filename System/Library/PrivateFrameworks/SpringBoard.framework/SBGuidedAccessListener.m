@interface SBGuidedAccessListener
+ (id)sharedGuidedAccessListener;
- (BOOL)isGuidedAccessActive;
- (SBGuidedAccessListener)init;
- (void)guidedAccessWasActivated;
- (void)guidedAccessWasDeactivated;
- (void)setIsGuidedAccessActive:(BOOL)a3;
@end

@implementation SBGuidedAccessListener

+ (id)sharedGuidedAccessListener
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBGuidedAccessListener_sharedGuidedAccessListener__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGuidedAccessListener_onceToken != -1) {
    dispatch_once(&sharedGuidedAccessListener_onceToken, block);
  }
  v3 = (void *)sharedGuidedAccessListener___sharedGuidedAccessListener;
  return v3;
}

void __52__SBGuidedAccessListener_sharedGuidedAccessListener__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGuidedAccessListener___sharedGuidedAccessListener;
  sharedGuidedAccessListener___sharedGuidedAccessListener = (uint64_t)v1;
}

- (SBGuidedAccessListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBGuidedAccessListener;
  v2 = [(SBGuidedAccessListener *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_guidedAccessWasActivated name:*MEMORY[0x1E4FB9178] object:0];
    [v3 addObserver:v2 selector:sel_guidedAccessWasDeactivated name:*MEMORY[0x1E4FB9180] object:0];
  }
  return v2;
}

- (void)guidedAccessWasActivated
{
  self->_isGuidedAccessActive = 1;
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBGuidedAccessActivationChangedNotification" object:0];
}

- (void)guidedAccessWasDeactivated
{
  self->_isGuidedAccessActive = 0;
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBGuidedAccessActivationChangedNotification" object:0];
}

- (BOOL)isGuidedAccessActive
{
  return self->_isGuidedAccessActive;
}

- (void)setIsGuidedAccessActive:(BOOL)a3
{
  self->_isGuidedAccessActive = a3;
}

@end