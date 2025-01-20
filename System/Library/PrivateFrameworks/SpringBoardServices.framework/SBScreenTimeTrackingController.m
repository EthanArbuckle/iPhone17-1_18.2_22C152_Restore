@interface SBScreenTimeTrackingController
- (SBScreenTimeTrackingController)init;
- (id)_nameForContext:(int)a3;
- (void)_queue_handleNewLayout:(id)a3 withContext:(id)a4;
- (void)_queue_setActiveCategory:(int)a3 context:(int)a4;
- (void)_queue_setPhoneOrFaceTimeActive:(BOOL)a3;
- (void)_queue_setScreenOn:(BOOL)a3 withContext:(id)a4;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
@end

@implementation SBScreenTimeTrackingController

uint64_t __69__SBScreenTimeTrackingController__queue_handleNewLayout_withContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 level];
  uint64_t v6 = [v4 level];

  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  block[3] = &unk_1E566BD88;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(id *a1)
{
  objc_storeStrong((id *)a1[4] + 7, a1[5]);
  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  uint64_t v2 = _block_invoke_requestCount;
  if (!_block_invoke_requestCount)
  {
    [a1[4] _queue_handleNewLayout:a1[5] withContext:a1[6]];
    dispatch_time_t v3 = dispatch_time(0, 250000000);
    id v4 = a1[4];
    uint64_t v5 = *((void *)v4 + 2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2;
    block[3] = &unk_1E566BCE8;
    block[4] = v4;
    dispatch_after(v3, v5, block);
    uint64_t v2 = _block_invoke_requestCount;
  }
  _block_invoke_requestCount = v2 + 1;
}

- (void)_queue_handleNewLayout:(id)a3 withContext:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26 = self;
  id v27 = a4;
  BSDispatchQueueAssert();
  v28 = v6;
  id v7 = [v6 elements];
  id v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_16];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v31 = 0;
    id v32 = 0;
    id v12 = 0;
    id v36 = 0;
    id v37 = 0;
    unint64_t v35 = 0;
    id v38 = 0;
    id v39 = 0;
    unint64_t v13 = 0;
    id v14 = 0;
    id v41 = 0;
    id v15 = 0;
    uint64_t v16 = *(void *)v43;
    uint64_t v40 = *MEMORY[0x1E4F625B0];
    uint64_t v34 = *MEMORY[0x1E4F625A8];
    uint64_t v30 = *MEMORY[0x1E4F625C0];
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * v17);
        v19 = [v18 identifier];
        v20 = v19;
        if (v15 || ![v19 isEqualToString:v40])
        {
          if (v13 || ![v20 isEqualToString:@"com.apple.InCallService"])
          {
            if ([v18 layoutRole] == 3)
            {
              id v21 = v18;

              id v14 = v21;
            }
            else if (v41 {
                   || ![v20 isEqualToString:@"com.apple.springboard.home-screen"])
            }
            {
              if (v39 || ![v20 isEqualToString:v34])
              {
                if (v38 || ![v20 isEqualToString:v30])
                {
                  if (v37
                    || ![v20 isEqualToString:@"com.apple.springboard.today-view"])
                  {
                    if (v36
                      || ![v20 isEqualToString:@"com.apple.springboard.spotlight"])
                    {
                      if (v35
                        || ![v20 isEqualToString:@"com.apple.springboard.passcode"])
                      {
                        if (v12
                          || ![v20 isEqualToString:@"com.apple.springboard.app-switcher"])
                        {
                          if (!v31
                            && [v18 isUIApplicationElement]
                            && [v18 layoutRole] == 1)
                          {
                            id v31 = v18;
                          }
                          else if (!v32)
                          {
                            if ([v18 isUIApplicationElement]
                              && [v18 layoutRole] == 6)
                            {
                              id v29 = v12;
                              v22 = [v18 bundleIdentifier];
                              int v33 = [v22 isEqualToString:@"com.apple.camera"];

                              if (v33) {
                                id v32 = v18;
                              }
                              else {
                                id v32 = 0;
                              }
                              id v12 = v29;
                            }
                            else
                            {
                              id v32 = 0;
                            }
                          }
                        }
                        else
                        {
                          id v12 = v18;
                        }
                      }
                      else
                      {
                        unint64_t v35 = v18;
                      }
                    }
                    else
                    {
                      id v36 = v18;
                    }
                  }
                  else
                  {
                    id v37 = v18;
                  }
                }
                else
                {
                  id v38 = v18;
                }
              }
              else
              {
                id v39 = v18;
              }
            }
            else
            {
              id v41 = v18;
            }
          }
          else
          {
            unint64_t v13 = v18;

            id v14 = (void *)v13;
          }
        }
        else
        {
          id v15 = v18;
        }

        ++v17;
      }
      while (v11 != v17);
      uint64_t v23 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v11 = v23;
    }
    while (v23);
  }
  else
  {
    id v31 = 0;
    id v32 = 0;
    id v12 = 0;
    id v36 = 0;
    id v37 = 0;
    unint64_t v35 = 0;
    id v38 = 0;
    id v39 = 0;
    unint64_t v13 = 0;
    id v14 = 0;
    id v41 = 0;
    id v15 = 0;
  }

  [(SBScreenTimeTrackingController *)v26 _queue_setPhoneOrFaceTimeActive:v13 != 0];
  -[SBScreenTimeTrackingController _queue_setScreenOn:withContext:](v26, "_queue_setScreenOn:withContext:", [v28 displayBacklightLevel] > 0, v27);
  if (!v26->_queue_isScreenOn)
  {
    uint64_t queue_activeContext = 0;
    uint64_t v25 = 0;
    goto LABEL_86;
  }
  if (!v14)
  {
    if (v15)
    {
      if (v38)
      {
        uint64_t v25 = 14;
      }
      else
      {
        if (v35) {
          uint64_t v25 = 15;
        }
        else {
          uint64_t v25 = 13;
        }
        if (!(v35 | v13))
        {
          if (v32)
          {
            uint64_t v25 = 11;
          }
          else if (v36)
          {
            uint64_t v25 = 16;
          }
          else if (v37)
          {
            uint64_t v25 = 17;
          }
          else
          {
            uint64_t v25 = 9;
          }
        }
      }
      uint64_t queue_activeContext = 3;
      goto LABEL_80;
    }
    if (v31)
    {
      uint64_t v25 = 3;
      uint64_t queue_activeContext = 2;
      goto LABEL_80;
    }
    if (v41)
    {
      if (v36)
      {
        uint64_t v25 = 18;
      }
      else if (v37)
      {
        uint64_t v25 = 19;
      }
      else
      {
        uint64_t v25 = 2;
      }
      uint64_t queue_activeContext = 1;
      goto LABEL_80;
    }
  }
  uint64_t queue_activeContext = 0;
  uint64_t v25 = 1;
LABEL_80:
  if (v39)
  {
    uint64_t v25 = 5;
LABEL_85:
    uint64_t queue_activeContext = v26->_queue_activeContext;
    goto LABEL_86;
  }
  if (!v15 && v12)
  {
    uint64_t v25 = 4;
    goto LABEL_85;
  }
LABEL_86:
  -[SBScreenTimeTrackingController _queue_setActiveCategory:context:](v26, "_queue_setActiveCategory:context:", v25, queue_activeContext, v26);
}

- (void)_queue_setScreenOn:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  BSDispatchQueueAssert();
  if (self->_queue_isScreenOn != v4)
  {
    self->_queue_isScreenOn = v4;
    if (v4)
    {
      id v6 = [v8 transitionReason];
      if (([v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.homeButton"] & 1) != 0
        || ([v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.lockButton"] & 1) != 0
        || ([v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.smartCover"] & 1) != 0
        || ([v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.magicKeyboardExtended"] || [v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.volumeButton"] || [v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.otherButton"] || [v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.liftToWake"])
      {
        id v7 = @"user";
      }
      else if (self->_queue_isPhoneOrFaceTimeActive {
             && ([v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.fullScreenAlert"] & 1) != 0)
      }
      {
        id v7 = @"phone";
      }
      else
      {
        if (([v6 isEqualToString:@"com.apple.SpringBoard.backlight.transitionReason.notification"] & 1) == 0 && ![v6 isEqualToString:@"com.apple.SpringBoard.transitionReason.notification"])
        {
          goto LABEL_12;
        }
        id v7 = @"push";
      }
      soft_ADClientAddValueForScalarKey([NSString stringWithFormat:@"com.apple.springboard.lockscreen.%@.wakeCount", v7]);
LABEL_12:
    }
  }
}

- (void)_queue_setPhoneOrFaceTimeActive:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_isPhoneOrFaceTimeActive != v3) {
    self->_queue_isPhoneOrFaceTimeActive = v3;
  }
}

- (void)_queue_setActiveCategory:(int)a3 context:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  BSDispatchQueueAssert();
  unsigned int queue_activeCategory = self->_queue_activeCategory;
  if (queue_activeCategory != v5)
  {
    uint64_t queue_activeContext = self->_queue_activeContext;
    self->_uint64_t queue_activeContext = v4;
    self->_unsigned int queue_activeCategory = v5;
    id v9 = _SBFScreenTimeNameForCategory(queue_activeCategory);
    uint64_t v10 = [(SBScreenTimeTrackingController *)self _nameForContext:queue_activeContext];
    uint64_t v11 = "pplication";
    if (v9)
    {
      id v12 = [NSString stringWithFormat:v9, v10];

      uint64_t v13 = [NSString stringWithFormat:@"com.apple.springboard.%@.screenOnTime", v12];
      unint64_t queue_thisCategoryStartTime = self->_queue_thisCategoryStartTime;
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2020000000;
      id v15 = (void (*)(uint64_t, unint64_t))getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr;
      uint64_t v25 = getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr;
      if (!getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr)
      {
        uint64_t v16 = (void *)AggregateDictionaryLibrary();
        v23[3] = (uint64_t)dlsym(v16, "ADPushTimeIntervalForDistributionKeySinceStartTime");
        getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr = (_UNKNOWN *)v23[3];
        id v15 = (void (*)(uint64_t, unint64_t))v23[3];
      }
      _Block_object_dispose(&v22, 8);
      if (!v15) {
        -[SBScreenTimeTrackingController _queue_setActiveCategory:context:]();
      }
      v15(v13, queue_thisCategoryStartTime);
      uint64_t v11 = "kSBSAnalyticsDisplayLayoutElementUIApplication" + 36;
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v17 = _SBFScreenTimeNameForCategory(v5);
    v18 = [(SBScreenTimeTrackingController *)self _nameForContext:v4];
    if (v17)
    {
      v19 = [NSString stringWithFormat:v17, v18];

      soft_ADClientAddValueForScalarKey([NSString stringWithFormat:@"com.apple.springboard.%@.activationCount", v19]);
    }
    else
    {
      v19 = 0;
    }
    _SBFScreenTimePostExternalChangeNotification(v5);
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = *((void *)v11 + 373);
    v20 = (uint64_t (*)(void))getADMonotonicTimeGetCurrentSymbolLoc_ptr;
    uint64_t v25 = getADMonotonicTimeGetCurrentSymbolLoc_ptr;
    if (!getADMonotonicTimeGetCurrentSymbolLoc_ptr)
    {
      id v21 = (void *)AggregateDictionaryLibrary();
      v23[3] = (uint64_t)dlsym(v21, "ADMonotonicTimeGetCurrent");
      getADMonotonicTimeGetCurrentSymbolLoc_ptr = (_UNKNOWN *)v23[3];
      v20 = (uint64_t (*)(void))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v20) {
      -[SBScreenTimeTrackingController _queue_setActiveCategory:context:]();
    }
    self->_unint64_t queue_thisCategoryStartTime = v20();
    self->_queue_lastCategoryChangeTime = CFAbsoluteTimeGetCurrent();
  }
}

- (id)_nameForContext:(int)a3
{
  if ((a3 - 1) > 2) {
    return @"other";
  }
  else {
    return off_1E566BDE0[a3 - 1];
  }
}

uint64_t __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2(uint64_t result)
{
  unint64_t v1 = _block_invoke_requestCount;
  _block_invoke_requestCount = 0;
  if (v1 >= 2) {
    return [*(id *)(result + 32) _queue_handleNewLayout:*(void *)(*(void *)(result + 32) + 56) withContext:*(void *)(*(void *)(result + 32) + 64)];
  }
  return result;
}

- (SBScreenTimeTrackingController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBScreenTimeTrackingController;
  uint64_t v2 = [(SBScreenTimeTrackingController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.power.screenTimeTracking", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F62940]) initWithDisplayType:0];
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v5;

    [(FBSDisplayLayoutMonitor *)v2->_layoutMonitor addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBScreenTimeTrackingController;
  [(SBScreenTimeTrackingController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_lastLayoutTransitionContext, 0);
  objc_storeStrong((id *)&self->_queue_lastLayout, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)_queue_setActiveCategory:context:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v1 = [NSString stringWithUTF8String:"ADMonotonicTime soft_ADMonotonicTimeGetCurrent(void)"];
  [v0 handleFailureInFunction:v1 file:@"SBScreenTimeTrackingController.m" lineNumber:21 description:@"%s" dlerror()];

  __break(1u);
}

- (void)_queue_setActiveCategory:context:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v1 = [NSString stringWithUTF8String:"ADTimeInterval soft_ADPushTimeIntervalForDistributionKeySinceStartTime(CFStringRef, ADMonotonicTime)"];
  [v0 handleFailureInFunction:v1 file:@"SBScreenTimeTrackingController.m" lineNumber:23 description:@"%s" dlerror()];

  __break(1u);
}

@end