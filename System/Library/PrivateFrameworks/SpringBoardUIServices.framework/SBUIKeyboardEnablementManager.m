@interface SBUIKeyboardEnablementManager
+ (id)sharedInstance;
- (SBUIKeyboardEnablementManager)init;
- (id)description;
- (void)disableAutomaticAppearanceForContext:(id)a3;
- (void)enableAutomaticAppearanceForContext:(id)a3;
@end

@implementation SBUIKeyboardEnablementManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __47__SBUIKeyboardEnablementManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBUIKeyboardEnablementManager);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBUIKeyboardEnablementManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIKeyboardEnablementManager;
  v2 = [(SBUIKeyboardEnablementManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    disabledContexts = v2->_disabledContexts;
    v2->_disabledContexts = (NSHashTable *)v3;
  }
  return v2;
}

- (void)disableAutomaticAppearanceForContext:(id)a3
{
  id v5 = a3;
  if (!-[NSHashTable containsObject:](self->_disabledContexts, "containsObject:"))
  {
    [(NSHashTable *)self->_disabledContexts addObject:v5];
    UIKeyboardDisableAutomaticAppearance();
    v4 = [MEMORY[0x1E4F42C68] sharedInstance];
    [v4 _beginDisablingAnimations];
  }
}

- (void)enableAutomaticAppearanceForContext:(id)a3
{
  id v5 = a3;
  if (-[NSHashTable containsObject:](self->_disabledContexts, "containsObject:"))
  {
    [(NSHashTable *)self->_disabledContexts removeObject:v5];
    v4 = [MEMORY[0x1E4F42C68] sharedInstance];
    [v4 _endDisablingAnimations];

    if (![(NSHashTable *)self->_disabledContexts count]) {
      UIKeyboardEnableAutomaticAppearance();
    }
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@:%p - disabledContexts: %@>", v5, self, self->_disabledContexts];

  return v6;
}

- (void).cxx_destruct
{
}

@end