@interface SLGDomainWhitelist
- (BOOL)allowUnspecifiedDomains;
- (BOOL)isDomainWhitelisted:(id)a3;
- (NSSet)whitelist;
- (SLGDomainWhitelist)init;
- (void)_beginObservingSettings;
- (void)_lockQueue_loadSettings;
- (void)_lockQueue_loadUnspecifiedDomains;
- (void)_lockQueue_loadWhitelist;
- (void)_reloadSettings;
- (void)_stopObservingSettings;
- (void)addDomain:(id)a3;
- (void)dealloc;
- (void)removeDomain:(id)a3;
- (void)setAllowUnspecifiedDomains:(BOOL)a3;
@end

@implementation SLGDomainWhitelist

- (SLGDomainWhitelist)init
{
  v7.receiver = self;
  v7.super_class = (Class)SLGDomainWhitelist;
  v2 = [(SLGDomainWhitelist *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("SLGDomainWhitelistLock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    [(SLGDomainWhitelist *)v2 _reloadSettings];
    [(SLGDomainWhitelist *)v2 _beginObservingSettings];
  }
  return v2;
}

- (NSSet)whitelist
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  lockQueue = self->_lockQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SLGDomainWhitelist_whitelist__block_invoke;
  v6[3] = &unk_1E6870098;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(lockQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __31__SLGDomainWhitelist_whitelist__block_invoke(uint64_t a1)
{
}

- (BOOL)allowUnspecifiedDomains
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  lockQueue = v2->_lockQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SLGDomainWhitelist_allowUnspecifiedDomains__block_invoke;
  v5[3] = &unk_1E6870098;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __45__SLGDomainWhitelist_allowUnspecifiedDomains__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setAllowUnspecifiedDomains:(BOOL)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  lockQueue = self->_lockQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SLGDomainWhitelist_setAllowUnspecifiedDomains___block_invoke;
  v6[3] = &unk_1E68700C0;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_sync(lockQueue, v6);
}

void __49__SLGDomainWhitelist_setAllowUnspecifiedDomains___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = v1;
    CFPreferencesSetAppValue(@"SLGAllowUnspecifiedDomains", (CFPropertyListRef)[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24)], @"com.apple.UIKit");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.studylog.whitelistDidChange", 0, 0, 0);
  }
}

- (BOOL)isDomainWhitelisted:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SLGDomainWhitelist_isDomainWhitelisted___block_invoke;
  block[3] = &unk_1E68700E8;
  id v9 = v4;
  v10 = self;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(lockQueue, block);
  LOBYTE(v4) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

uint64_t __42__SLGDomainWhitelist_isDomainWhitelisted___block_invoke(uint64_t result)
{
  int v1 = (void *)result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(result + 32))
  {
    result = [*(id *)(v2 + 16) count];
    if (result)
    {
      result = [*(id *)(v1[5] + 16) containsObject:v1[4]];
      if ((result & 1) == 0) {
        goto LABEL_4;
      }
    }
  }
  else if (!*(unsigned char *)(v2 + 24))
  {
LABEL_4:
    *(unsigned char *)(*(void *)(v1[6] + 8) + 24) = 0;
  }
  return result;
}

- (void)addDomain:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SLGDomainWhitelist_addDomain___block_invoke;
  v7[3] = &unk_1E6870110;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lockQueue, v7);
}

void __32__SLGDomainWhitelist_addDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) setByAddingObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  CFPreferencesSetAppValue(@"SLGDomainWhitelist", v6, @"com.apple.UIKit");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.studylog.whitelistDidChange", 0, 0, 0);
}

- (void)removeDomain:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SLGDomainWhitelist_removeDomain___block_invoke;
  v7[3] = &unk_1E6870110;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lockQueue, v7);
}

void __35__SLGDomainWhitelist_removeDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
  [v2 removeObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
  id v5 = v2;

  value = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];

  CFPreferencesSetAppValue(@"SLGDomainWhitelist", value, @"com.apple.UIKit");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.studylog.whitelistDidChange", 0, 0, 0);
}

- (void)dealloc
{
  [(SLGDomainWhitelist *)self _stopObservingSettings];
  v3.receiver = self;
  v3.super_class = (Class)SLGDomainWhitelist;
  [(SLGDomainWhitelist *)&v3 dealloc];
}

- (void)_reloadSettings
{
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SLGDomainWhitelist__reloadSettings__block_invoke;
  block[3] = &unk_1E6870138;
  void block[4] = self;
  dispatch_async(lockQueue, block);
}

uint64_t __37__SLGDomainWhitelist__reloadSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockQueue_loadSettings");
}

- (void)_lockQueue_loadSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lockQueue);
  [(SLGDomainWhitelist *)self _lockQueue_loadWhitelist];

  [(SLGDomainWhitelist *)self _lockQueue_loadUnspecifiedDomains];
}

- (void)_lockQueue_loadWhitelist
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lockQueue);
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"SLGDomainWhitelist", @"com.apple.UIKit");
  if (v3)
  {
    id v4 = v3;
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSSet addObject:](v5, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    whitelist = self->_whitelist;
    self->_whitelist = v5;
  }
  else
  {
    self->_whitelist = [MEMORY[0x1E4F1CAD0] set];
    MEMORY[0x1F41817F8]();
  }
}

- (void)_lockQueue_loadUnspecifiedDomains
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lockQueue);
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"SLGAllowUnspecifiedDomains", @"com.apple.UIKit");
  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }
  self->_allowUnspecifiedDomains = v4;
}

- (void)_beginObservingSettings
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)SLGDomainWhitelistSettingsDidChange, @"com.apple.studylog.whitelistDidChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingSettings
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.studylog.whitelistDidChange", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);

  objc_storeStrong((id *)&self->_lockQueue, 0);
}

@end