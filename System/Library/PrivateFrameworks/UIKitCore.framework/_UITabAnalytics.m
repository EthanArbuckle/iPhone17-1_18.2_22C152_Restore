@interface _UITabAnalytics
+ (id)sharedInstance;
- (void)_sendCustomizationEvent:(void *)a1;
- (void)_sendEvent:(void *)a3 additionalPayload:;
- (void)_updateCustomizationStatusIfNeeded:(void *)a1;
- (void)_updateSidebarStatusIfNeeded:(uint64_t)a1;
- (void)updateStatusIfNeeded:(void *)a1;
- (void)userDidToggleSidebar:(uint64_t)a3 source:;
@end

@implementation _UITabAnalytics

+ (id)sharedInstance
{
  self;
  if (qword_1EB25F3A0 != -1) {
    dispatch_once(&qword_1EB25F3A0, &__block_literal_global_77);
  }
  v0 = (void *)_MergedGlobals_974;
  return v0;
}

- (void)userDidToggleSidebar:(uint64_t)a3 source:
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)(a1 + 40) = a3;
    v5 = [a2 sidebar];
    int isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v5);

    v7 = @"None";
    switch(a3)
    {
      case 0:
        break;
      case 1:
        if (isSidebarSupportedAnd) {
          v7 = @"Button.TabBar";
        }
        else {
          v7 = @"Button.Sidebar";
        }
        break;
      case 2:
        v7 = @"KeyCommand";
        break;
      case 4:
        v7 = @"Overlay Button";
        break;
      default:
        v7 = @"Unknown";
        break;
    }
    v8 = @"Hidden";
    if (isSidebarSupportedAnd) {
      v8 = @"Visible";
    }
    v13[0] = @"sidebarState";
    v13[1] = @"sidebarToggleSource";
    v14[0] = v8;
    v14[1] = v7;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = v8;
    v11 = v7;
    v12 = [v9 dictionaryWithObjects:v14 forKeys:v13 count:2];

    -[_UITabAnalytics _sendEvent:additionalPayload:](a1, 2, v12);
  }
}

- (void)_sendEvent:(void *)a3 additionalPayload:
{
  id v4 = a3;
  if (a1)
  {
    v5 = (void *)[*(id *)(a1 + 8) copy];
    id v7 = v4;
    id v6 = v5;
    AnalyticsSendEventLazy();
  }
}

- (void)_sendCustomizationEvent:(void *)a1
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v3 = [a2 _tabElements];
    uint64_t v4 = _UITabChildrenCount(v3);

    v18[0] = @"numberOfCustomizations";
    v5 = [NSNumber numberWithInteger:a1[2]];
    v19[0] = v5;
    v18[1] = @"numberOfTabsInBar";
    id v6 = [NSNumber numberWithInteger:a1[3]];
    v19[1] = v6;
    v18[2] = @"totalNumberOfTabs";
    id v7 = [NSNumber numberWithUnsignedInteger:v4];
    v19[2] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    -[_UITabAnalytics _sendEvent:additionalPayload:]((uint64_t)a1, 1, v8);

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    v10 = (void *)a1[4];
    a1[4] = v9;

    v16[0] = @"numberOfCustomizations";
    v11 = [NSNumber numberWithInteger:a1[2]];
    v17[0] = v11;
    v16[1] = @"numberOfTabsInBar";
    v12 = [NSNumber numberWithInteger:a1[3]];
    v16[2] = @"lastCustomizationDate";
    uint64_t v13 = a1[4];
    v17[1] = v12;
    v17[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v15 setObject:v14 forKey:@"com.apple.UIKit.TabStatistics"];
  }
}

- (void)updateStatusIfNeeded:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[_UITabAnalytics _updateSidebarStatusIfNeeded:]((uint64_t)a1, v3);
    -[_UITabAnalytics _updateCustomizationStatusIfNeeded:](a1, v3);
  }
}

- (void)_updateSidebarStatusIfNeeded:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = v3;
    v5 = [v3 sidebar];
    int isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v5);

    id v3 = v7;
    if (isSidebarSupportedAnd)
    {
      if (v4 == 4 || v4 == 1)
      {
        -[_UITabAnalytics _sendEvent:additionalPayload:](a1, 3, 0);
        id v3 = v7;
      }
    }
  }
}

- (void)_updateCustomizationStatusIfNeeded:(void *)a1
{
  id v3 = a2;
  if (a1 && a1[2])
  {
    id v5 = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    if ([v4 compare:a1[4]] == 1) {
      -[_UITabAnalytics _sendCustomizationEvent:](a1, v5);
    }

    id v3 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizationLastReportedDate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end