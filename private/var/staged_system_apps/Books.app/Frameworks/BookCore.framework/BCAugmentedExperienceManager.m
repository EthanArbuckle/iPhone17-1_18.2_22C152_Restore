@interface BCAugmentedExperienceManager
+ (BOOL)autoExpandAtEnd;
+ (BOOL)enabled;
+ (BOOL)endOfBookExperienceFeatureEnabled;
+ (float)confidenceThreshold;
+ (id)newAugmentedExperienceManager;
- (BCAugmentedExperienceHosting)presentationViewController;
- (BCAugmentedExperienceManager)init;
- (BCAugmentedExperienceManager)initWithStateChangeCoalescingDelay:(double)a3;
- (BOOL)_cancelShowExperience:(id)a3;
- (BOOL)_isExperienceViable:(id)a3;
- (BUCoalescingCallBlock)stateChangeCoalescingCallBlock;
- (NSMutableArray)augmentedExperiences;
- (NSString)storeID;
- (id)_detailsForExperience:(id)a3;
- (id)_eventToString:(int64_t)a3;
- (id)_stateToString:(int64_t)a3;
- (id)stateChangeBlock;
- (void)_cancelDelayForExperience:(id)a3;
- (void)_cancelPreloadExperience:(id)a3;
- (void)_currentBookIsFinished;
- (void)_delayCompletedForExperience:(id)a3;
- (void)_expandExperience:(id)a3;
- (void)_handleStateChange:(id)a3;
- (void)_preloadExperience:(id)a3;
- (void)_processStateEvent:(int64_t)a3 forExperience:(id)a4;
- (void)_showExperience:(id)a3;
- (void)_startDelayForExperience:(id)a3;
- (void)_userClosedExperience:(id)a3;
- (void)addExperience:(id)a3;
- (void)emitter:(id)a3 bookMilestoneReached:(int64_t)a4;
- (void)emitter:(id)a3 bookPositionChanged:(id)a4;
- (void)emitter:(id)a3 bookSectionChanged:(id)a4;
- (void)presenterWantsToCloseAsset:(id)a3 completion:(id)a4;
- (void)presenterWantsToDismiss:(id)a3;
- (void)presentingViewControllerDidChangeLayout:(id)a3;
- (void)removeExperienceOfType:(int64_t)a3;
- (void)setAugmentedExperiences:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setStateChangeBlock:(id)a3;
- (void)setStoreID:(id)a3;
@end

@implementation BCAugmentedExperienceManager

+ (BOOL)endOfBookExperienceFeatureEnabled
{
  v3 = +[NSUserDefaults standardUserDefaults];
  if ([v3 BOOLForKey:@"BKEndOfBookExperienceDisabled"]) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = [a1 enabled];
  }

  return v4;
}

+ (id)newAugmentedExperienceManager
{
  if (!+[BCAugmentedExperienceManager endOfBookExperienceFeatureEnabled])return 0; {

  }
  return objc_alloc_init(BCAugmentedExperienceManager);
}

+ (BOOL)enabled
{
  objc_opt_class();
  v2 = +[BCRCDataContainer defaultContainer];
  v3 = [v2 configs];
  unsigned __int8 v4 = [v3 valueForKeyPath:@"endOfBookExperience.enabled"];
  v5 = BUDynamicCast();

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (BOOL)autoExpandAtEnd
{
  objc_opt_class();
  v2 = +[BCRCDataContainer defaultContainer];
  v3 = [v2 configs];
  unsigned __int8 v4 = [v3 valueForKeyPath:@"endOfBookExperience.autoExpandAtEnd"];
  v5 = BUDynamicCast();

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (float)confidenceThreshold
{
  objc_opt_class();
  v2 = +[BCRCDataContainer defaultContainer];
  v3 = [v2 configs];
  unsigned __int8 v4 = [v3 valueForKeyPath:@"endOfBookExperience.confidenceThreshold"];
  v5 = BUDynamicCast();

  if (v5)
  {
    [v5 floatValue];
    float v7 = v6;
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

- (BCAugmentedExperienceManager)init
{
  return [(BCAugmentedExperienceManager *)self initWithStateChangeCoalescingDelay:0.2];
}

- (BCAugmentedExperienceManager)initWithStateChangeCoalescingDelay:(double)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BCAugmentedExperienceManager;
  unsigned __int8 v4 = [(BCAugmentedExperienceManager *)&v17 init];
  if (v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    augmentedExperiences = v4->_augmentedExperiences;
    v4->_augmentedExperiences = (NSMutableArray *)v5;

    if (a3 != 0.0)
    {
      objc_initWeak(&location, v4);
      id v7 = objc_alloc((Class)BUCoalescingCallBlock);
      objc_copyWeak(&v15, &location);
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = +[NSString stringWithFormat:@"%@ in %@", @"stateChangeCoalescingCallBlock", v9, _NSConcreteStackBlock, 3221225472, sub_17434, &unk_2C4028];
      v11 = (BUCoalescingCallBlock *)[v7 initWithNotifyBlock:&v14 blockDescription:v10];
      stateChangeCoalescingCallBlock = v4->_stateChangeCoalescingCallBlock;
      v4->_stateChangeCoalescingCallBlock = v11;

      [(BUCoalescingCallBlock *)v4->_stateChangeCoalescingCallBlock setCoalescingDelay:a3];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  return v4;
}

- (void)_currentBookIsFinished
{
  v3 = [(BCAugmentedExperienceManager *)self presentationViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(BCAugmentedExperienceManager *)self presentationViewController];
    uint64_t v5 = [(BCAugmentedExperienceManager *)self storeID];
    [v6 setFinishedForAssetID:v5];
  }
}

- (void)_handleStateChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BCAugmentedExperienceManager *)self stateChangeCoalescingCallBlock];

  if (v5)
  {
    [(BCAugmentedExperienceManager *)self setStateChangeBlock:v4];

    id v7 = [(BCAugmentedExperienceManager *)self stateChangeCoalescingCallBlock];
    [v7 signalWithCompletion:&stru_2C4048];
  }
  else
  {
    id v7 = (void (**)(void))objc_retainBlock(v4);

    id v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    v7[2](v7);
  }
  id v6 = v7;
LABEL_6:
}

- (void)emitter:(id)a3 bookPositionChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1E97AC((uint64_t)v7, v8);
  }

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_17804;
  v10[3] = &unk_2C4070;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(BCAugmentedExperienceManager *)self _handleStateChange:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)emitter:(id)a3 bookMilestoneReached:(int64_t)a4
{
  id v6 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1E9890(a4, v6);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(BCAugmentedExperienceManager *)self augmentedExperiences];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    int64_t v11 = a4 - 2;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v12);
        uint64_t v14 = [v13 experience];
        id v15 = [v14 kind];

        if (!v15)
        {
          switch(v11)
          {
            case 0:
              goto LABEL_13;
            case 1:
              if ([v13 isPresented]) {
                goto LABEL_19;
              }
              [v13 setAutoExpand:1];
LABEL_13:
              [v13 setTriggeredLocation:1];
              [(BCAugmentedExperienceManager *)self _processStateEvent:1 forExperience:v13];
              v16 = self;
              uint64_t v17 = 2;
LABEL_14:
              [(BCAugmentedExperienceManager *)v16 _processStateEvent:v17 forExperience:v13];
              break;
            case 5:
            case 6:
            case 8:
              v16 = self;
              uint64_t v17 = 7;
              goto LABEL_14;
            case 7:
              if ([v13 isPresented]
                && [v13 isOnExperiencePage])
              {
LABEL_19:
                [(BCAugmentedExperienceManager *)self _expandExperience:v13];
              }
              break;
            default:
              break;
          }
        }
        id v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v18 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v9 = v18;
    }
    while (v18);
  }
}

- (void)emitter:(id)a3 bookSectionChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1E9934((uint64_t)v7, v8);
  }

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_17D74;
  v10[3] = &unk_2C4098;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v11 = v9;
  id v12 = self;
  [(BCAugmentedExperienceManager *)self _handleStateChange:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)presentingViewControllerDidChangeLayout:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(BCAugmentedExperienceManager *)self augmentedExperiences];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) experience];
        id v11 = [v10 presenter];
        [v11 bringExperienceViewToFront:v4];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)removeExperienceOfType:(int64_t)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(BCAugmentedExperienceManager *)self augmentedExperiences];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 experience];
        id v12 = [v11 kind];

        if (v12 == (id)a3)
        {
          long long v13 = [v10 experience];
          long long v14 = [v13 presenter];
          [v14 endPresentation:0];

          long long v15 = [(BCAugmentedExperienceManager *)self augmentedExperiences];
          [v15 removeObject:v10];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)addExperience:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 location];
  if (!v4) {
    goto LABEL_3;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [v14 location];
  [v6 confidence];
  float v8 = v7;
  +[BCAugmentedExperienceManager confidenceThreshold];
  float v10 = v9;

  if (v8 >= v10)
  {
LABEL_3:
    id v11 = objc_alloc_init(BKAugmentedExperienceData);
    [(BKAugmentedExperienceData *)v11 setExperience:v14];
    [(BKAugmentedExperienceData *)v11 setTriggeredLocation:0];
    id v12 = [(BCAugmentedExperienceManager *)self augmentedExperiences];
    [v12 addObject:v11];

    long long v13 = [v14 presenter];
    [v13 setPresentingDelegate:self];
  }
}

- (BOOL)_isExperienceViable:(id)a3
{
  return !+[BKReachability isOffline];
}

- (void)_processStateEvent:(int64_t)a3 forExperience:(id)a4
{
  id v6 = a4;
  float v7 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    float v8 = [(BCAugmentedExperienceManager *)self _eventToString:a3];
    int v22 = 138412290;
    v23 = v8;
    _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_DEFAULT, "processStateEvent %@", (uint8_t *)&v22, 0xCu);
  }
  id v9 = [v6 state];
  switch((unint64_t)[v6 state])
  {
    case 0uLL:
      if (a3 == 1)
      {
        float v10 = [v6 experience];
        unsigned int v11 = [(BCAugmentedExperienceManager *)self _isExperienceViable:v10];

        if (v11)
        {
          [v6 setState:4];
          [(BCAugmentedExperienceManager *)self _preloadExperience:v6];
        }
      }
      goto LABEL_41;
    case 1uLL:
      if (a3 != 7)
      {
        if (a3 == 6) {
          goto LABEL_13;
        }
        goto LABEL_29;
      }
      goto LABEL_41;
    case 2uLL:
      if (a3 == 7)
      {
        if ([(BCAugmentedExperienceManager *)self _cancelShowExperience:v6])
        {
          id v12 = v6;
          uint64_t v13 = 1;
          goto LABEL_40;
        }
      }
      else if (a3 == 6 && [(BCAugmentedExperienceManager *)self _cancelShowExperience:v6])
      {
LABEL_13:
        id v12 = v6;
        uint64_t v13 = 3;
        goto LABEL_40;
      }
      goto LABEL_41;
    case 3uLL:
      if (!a3)
      {
LABEL_30:
        id v12 = v6;
        uint64_t v13 = 0;
        goto LABEL_40;
      }
      goto LABEL_41;
    case 4uLL:
      switch(a3)
      {
        case 0:
          goto LABEL_32;
        case 2:
          id v14 = v6;
          uint64_t v15 = 6;
          goto LABEL_21;
        case 3:
          id v12 = v6;
          uint64_t v13 = 5;
          goto LABEL_40;
        case 4:
          goto LABEL_30;
        default:
          goto LABEL_41;
      }
      goto LABEL_41;
    case 5uLL:
      if (!a3) {
        goto LABEL_32;
      }
      if (a3 == 2)
      {
        id v14 = v6;
        uint64_t v15 = 7;
LABEL_21:
        [v14 setState:v15];
        [(BCAugmentedExperienceManager *)self _startDelayForExperience:v6];
      }
      goto LABEL_41;
    case 6uLL:
      if (a3 == 5)
      {
        id v12 = v6;
        uint64_t v13 = 8;
        goto LABEL_40;
      }
      if (a3 == 3)
      {
        id v12 = v6;
        uint64_t v13 = 7;
LABEL_40:
        [v12 setState:v13];
        goto LABEL_41;
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      {
        [v6 setState:0];
        [(BCAugmentedExperienceManager *)self _cancelPreloadExperience:v6];
        [(BCAugmentedExperienceManager *)self _cancelDelayForExperience:v6];
      }
LABEL_41:
      id v16 = [v6 state];
      if (v9 != v16)
      {
        id v17 = v16;
        long long v18 = BCAugmentedExperienceLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = [(BCAugmentedExperienceManager *)self _stateToString:v9];
          long long v20 = [(BCAugmentedExperienceManager *)self _stateToString:v17];
          int v22 = 138412546;
          v23 = v19;
          __int16 v24 = 2112;
          v25 = v20;
          _os_log_impl(&def_7D91C, v18, OS_LOG_TYPE_DEFAULT, "processStateEvent state change from %@ to %@", (uint8_t *)&v22, 0x16u);
        }
        long long v21 = [v6 experience];
        [(BCAugmentedExperienceManager *)self _stateChangedTo:v17 forExperience:v21];
      }
      return;
    case 7uLL:
      if (a3 == 5) {
        goto LABEL_29;
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      {
        [v6 setState:0];
        [(BCAugmentedExperienceManager *)self _cancelDelayForExperience:v6];
        goto LABEL_33;
      }
      goto LABEL_41;
    case 8uLL:
      if (a3 == 3)
      {
LABEL_29:
        [v6 setState:2];
        [(BCAugmentedExperienceManager *)self _showExperience:v6];
      }
      else if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      {
LABEL_32:
        [v6 setState:0];
LABEL_33:
        [(BCAugmentedExperienceManager *)self _cancelPreloadExperience:v6];
      }
      goto LABEL_41;
    default:
      goto LABEL_41;
  }
}

- (id)_eventToString:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 0;
  }
  else {
    return off_2C4130[a3];
  }
}

- (id)_stateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return 0;
  }
  else {
    return off_2C4170[a3];
  }
}

- (void)_preloadExperience:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "preloadExperience", buf, 2u);
  }

  id v6 = [v4 experience];
  float v7 = [v6 presenter];

  if (v7)
  {
    float v8 = [(BCAugmentedExperienceManager *)self presentationViewController];
    if (v8)
    {
      id v9 = [v4 experience];
      float v10 = [v9 presenter];
      unsigned int v11 = [v4 experience];
      id v12 = [v11 pageProgressionIsRTL];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_18A2C;
      v14[3] = &unk_2C40E8;
      v14[4] = self;
      id v15 = v4;
      [v10 preloadPresentationInVC:v8 pageProgressionIsRTL:v12 completion:v14];
    }
  }
  else
  {
    uint64_t v13 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1E9A18(v13);
    }

    [(BCAugmentedExperienceManager *)self _processStateEvent:4 forExperience:v4];
  }
}

- (void)_cancelPreloadExperience:(id)a3
{
  id v3 = a3;
  id v4 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v7 = 0;
    _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_DEFAULT, "cancelPreloadExperience", v7, 2u);
  }

  uint64_t v5 = [v3 experience];

  id v6 = [v5 presenter];
  [v6 cancelPreloadPresentation];
}

- (void)_startDelayForExperience:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "startDelayForExperience", buf, 2u);
  }

  id v6 = [v4 experience];
  [v6 delay];
  double v8 = v7;

  if (v8 <= 0.0)
  {
    [(BCAugmentedExperienceManager *)self _delayCompletedForExperience:v4];
  }
  else
  {
    id v9 = [v4 experience];
    [v9 delay];
    double v11 = v10;
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_18CE0;
    id v17 = &unk_2C4110;
    id v12 = v4;
    id v18 = v12;
    long long v19 = self;
    uint64_t v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v14 block:v11];

    [v12 setDelayTimer:v13, v14, v15, v16, v17];
  }
}

- (void)_delayCompletedForExperience:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "delayCompletedForExperience", buf, 2u);
  }

  [(BCAugmentedExperienceManager *)self _delayCompleted];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_18E14;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_cancelDelayForExperience:(id)a3
{
  id v3 = a3;
  id v4 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_DEFAULT, "cancelDelayForExperience", v6, 2u);
  }

  uint64_t v5 = [v3 delayTimer];
  [v5 invalidate];

  [v3 setDelayTimer:0];
}

- (id)_detailsForExperience:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:&off_2E13C8 forKeyedSubscript:@"BCAugmentedExperienceLocationKey"];
  uint64_t v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 triggeredLocation]);
  [v4 setObject:v5 forKeyedSubscript:@"BCAugmentedExperienceLocationVariantKey"];

  id v6 = [v3 experience];

  double v7 = [v6 version];
  [v4 setObject:v7 forKeyedSubscript:@"BCAugmentedExperienceVariantVersionKey"];

  return v4;
}

- (void)_expandExperience:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "expandExperience", v9, 2u);
  }

  id v6 = [(BCAugmentedExperienceManager *)self presentationViewController];
  if (v6)
  {
    double v7 = [v4 experience];
    id v8 = [v7 presenter];
    [v8 expandInVC:v6];
  }
}

- (void)_showExperience:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "showExperience", v13, 2u);
  }

  id v6 = [(BCAugmentedExperienceManager *)self presentationViewController];
  if (v6)
  {
    double v7 = [v4 experience];
    id v8 = [v7 presenter];
    id v9 = [v4 autoExpand];
    double v10 = [(BCAugmentedExperienceManager *)self _detailsForExperience:v4];
    [v8 presentInVC:v6 autoExpanded:v9 details:v10];

    [v4 setIsPresented:1];
    double v11 = [v4 experience];
    id v12 = [v11 kind];

    if (!v12) {
      [(BCAugmentedExperienceManager *)self _currentBookIsFinished];
    }
  }
}

- (void)_userClosedExperience:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "userClosedExperience", v6, 2u);
  }

  [v4 setIsPresented:0];
  [(BCAugmentedExperienceManager *)self _processStateEvent:6 forExperience:v4];
}

- (BOOL)_cancelShowExperience:(id)a3
{
  id v3 = a3;
  id v4 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_DEFAULT, "cancelShowExperience", buf, 2u);
  }

  uint64_t v5 = [v3 experience];
  id v6 = [v5 presenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_19348;
  v10[3] = &unk_2C3C50;
  id v11 = v3;
  id v7 = v3;
  unsigned __int8 v8 = [v6 endPresentation:v10];

  return v8;
}

- (void)presenterWantsToDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "User wants to dismiss the experience", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(BCAugmentedExperienceManager *)self augmentedExperiences];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 experience];
        id v13 = [v12 presenter];

        if (v13 == v4) {
          [(BCAugmentedExperienceManager *)self _userClosedExperience:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)presenterWantsToCloseAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_DEFAULT, "Closing the current asset", v11, 2u);
  }

  [(BCAugmentedExperienceManager *)self presenterWantsToDismiss:v7];
  uint64_t v9 = [(BCAugmentedExperienceManager *)self presentationViewController];
  [v9 requestClose:1];

  double v10 = (void (**)(void))objc_retainBlock(v6);
  if (v10) {
    v10[2](v10);
  }
}

- (BCAugmentedExperienceHosting)presentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);

  return (BCAugmentedExperienceHosting *)WeakRetained;
}

- (void)setPresentationViewController:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSMutableArray)augmentedExperiences
{
  return self->_augmentedExperiences;
}

- (void)setAugmentedExperiences:(id)a3
{
}

- (BUCoalescingCallBlock)stateChangeCoalescingCallBlock
{
  return self->_stateChangeCoalescingCallBlock;
}

- (id)stateChangeBlock
{
  return self->_stateChangeBlock;
}

- (void)setStateChangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_storeStrong((id *)&self->_stateChangeCoalescingCallBlock, 0);
  objc_storeStrong((id *)&self->_augmentedExperiences, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_destroyWeak((id *)&self->_presentationViewController);
}

@end