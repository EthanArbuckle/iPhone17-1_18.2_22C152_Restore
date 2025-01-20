@interface _TVPagePerformanceController
+ (BOOL)isPerformanceUIEnabled;
+ (void)postNotificationForImageProxy:(id)a3 withLoadingStatus:(BOOL)a4;
- (BOOL)_isMetricsReady;
- (BOOL)pageHasSubpages;
- (BOOL)pageIsLoading;
- (BOOL)pageWasInterrupted;
- (BOOL)pageWasUpdated;
- (NSDictionary)metrics;
- (_TVPagePerformanceController)init;
- (_TVPagePerformanceDelegate)delegate;
- (id)buildPagePerformanceView;
- (id)getEntryForTemplate:(id)a3;
- (unint64_t)pageCompleteDuration;
- (unint64_t)pageRenderDuration;
- (unint64_t)pageResourceDuration;
- (unint64_t)pageSetupDuration;
- (unint64_t)pageTransitionDuration;
- (unint64_t)templateDidComplete;
- (unint64_t)viewDidAppear;
- (unint64_t)viewDidDisappear;
- (unint64_t)viewDidLoad;
- (unint64_t)viewWillAppear;
- (unint64_t)viewWillDisappear;
- (unint64_t)viewWillLoad;
- (void)_calculatePageDurations;
- (void)_maybeDeliverMetrics;
- (void)markViewDidAppear;
- (void)markViewDidDisappear;
- (void)markViewDidLoad;
- (void)markViewWillAppear;
- (void)markViewWillDisappear;
- (void)markViewWillLoad;
- (void)setDelegate:(id)a3;
- (void)setPageCompleteDuration:(unint64_t)a3;
- (void)setPageHasSubpages:(BOOL)a3;
- (void)setPageIsLoading:(BOOL)a3;
- (void)setPageRenderDuration:(unint64_t)a3;
- (void)setPageResourceDuration:(unint64_t)a3;
- (void)setPageSetupDuration:(unint64_t)a3;
- (void)setPageTransitionDuration:(unint64_t)a3;
- (void)setPageWasInterrupted:(BOOL)a3;
- (void)setPageWasUpdated:(BOOL)a3;
- (void)setViewDidAppear:(unint64_t)a3;
- (void)setViewDidDisappear:(unint64_t)a3;
- (void)setViewDidLoad:(unint64_t)a3;
- (void)setViewWillAppear:(unint64_t)a3;
- (void)setViewWillDisappear:(unint64_t)a3;
- (void)setViewWillLoad:(unint64_t)a3;
@end

@implementation _TVPagePerformanceController

+ (BOOL)isPerformanceUIEnabled
{
  if (isPerformanceUIEnabled_onceToken != -1) {
    dispatch_once(&isPerformanceUIEnabled_onceToken, &__block_literal_global_26);
  }
  if (isPerformanceUIEnabled_internalBuild) {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PagePerformanceUIEnabled", @"com.apple.TVMLKit", 0);
  }
  else {
    int AppBooleanValue = isPerformanceUIEnabled_uiEnabled;
  }
  return AppBooleanValue != 0;
}

+ (void)postNotificationForImageProxy:(id)a3 withLoadingStatus:(BOOL)a4
{
  BOOL v4 = a4;
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21 = @"_TVPagePerformanceImageProxyNotificationTimestamp";
  v6 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v22[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  v8 = @"_TVPagePerformanceImageProxyDidLoadNotification";
  if (v4) {
    v8 = @"_TVPagePerformanceImageProxyWillLoadNotification";
  }
  v9 = v8;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __80___TVPagePerformanceController_postNotificationForImageProxy_withLoadingStatus___block_invoke;
  v17 = &unk_264BA7740;
  v10 = v9;
  v18 = v10;
  id v11 = v5;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  v13 = (void (**)(void))MEMORY[0x230FC9DC0](&v14);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v14, v15, v16, v17)) {
    v13[2](v13);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

- (_TVPagePerformanceController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_TVPagePerformanceController;
  v2 = [(_TVPagePerformanceController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    gettimeofday(&v2->_baseTimeval, 0);
    v3->_baseAbsoluteTime = mach_absolute_time();
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    templateEntries = v3->_templateEntries;
    v3->_templateEntries = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)markViewWillLoad
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceController *)self viewWillLoad])
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        id v5 = self;
        _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewWillLoad", (uint8_t *)&v4, 0xCu);
      }
    }
    [(_TVPagePerformanceController *)self setViewWillLoad:mach_absolute_time()];
  }
}

- (void)markViewDidLoad
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceController *)self viewDidLoad])
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        id v5 = self;
        _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewDidLoad", (uint8_t *)&v4, 0xCu);
      }
    }
    [(_TVPagePerformanceController *)self setViewDidLoad:mach_absolute_time()];
  }
}

- (void)markViewWillAppear
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceController *)self viewWillAppear])
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        id v5 = self;
        _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewWillAppear", (uint8_t *)&v4, 0xCu);
      }
    }
    [(_TVPagePerformanceController *)self setViewWillAppear:mach_absolute_time()];
  }
}

- (void)markViewDidAppear
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceController *)self viewDidAppear])
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        id v5 = self;
        _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewDidAppear", (uint8_t *)&v4, 0xCu);
      }
    }
    [(_TVPagePerformanceController *)self setViewDidAppear:mach_absolute_time()];
    [(NSMutableArray *)self->_templateEntries makeObjectsPerformSelector:sel__maybeStopListeningForInitialImageProxyLoadNotifications];
  }
}

- (void)markViewWillDisappear
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceController *)self viewWillDisappear])
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        id v5 = self;
        _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewWillDisappear", (uint8_t *)&v4, 0xCu);
      }
    }
    [(_TVPagePerformanceController *)self setViewWillDisappear:mach_absolute_time()];
    [(NSMutableArray *)self->_templateEntries makeObjectsPerformSelector:sel__stopListeningForInitialImageProxyLoadNotifications];
  }
}

- (void)markViewDidDisappear
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceController *)self viewDidDisappear])
  {
    if (![(_TVPagePerformanceController *)self templateDidComplete]) {
      [(_TVPagePerformanceController *)self setPageWasInterrupted:1];
    }
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        id v5 = self;
        _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewDidDisappear", (uint8_t *)&v4, 0xCu);
      }
    }
    [(_TVPagePerformanceController *)self setViewDidDisappear:mach_absolute_time()];
    [(_TVPagePerformanceController *)self _maybeDeliverMetrics];
  }
}

- (id)getEntryForTemplate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_templateEntries lastObject];
  id v6 = [v5 templateElement];

  if (v6 == v4)
  {
    uint64_t v12 = [v5 templateDidTransition];
    int v13 = IsPerformanceLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        uint64_t v14 = (void *)TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v14;
          v16 = [v4 elementName];
          int v21 = 134218242;
          v22 = self;
          __int16 v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_230B4C000, v15, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p %@ reuseEntryForTemplate", (uint8_t *)&v21, 0x16u);
        }
      }
      objc_msgSend(v5, "setTemplateUpdateCount:", objc_msgSend(v5, "templateUpdateCount") + 1);
      [(_TVPagePerformanceController *)self setPageWasUpdated:1];
      v10 = v5;
    }
    else
    {
      if (v13)
      {
        v17 = (void *)TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          id v19 = [v4 elementName];
          int v21 = 134218242;
          v22 = self;
          __int16 v23 = 2112;
          v24 = v19;
          _os_log_impl(&dword_230B4C000, v18, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p %@ ignoreEntryForTemplate", (uint8_t *)&v21, 0x16u);
        }
      }
      v10 = 0;
    }
  }
  else
  {
    [v5 _stopListeningForInitialImageProxyLoadNotifications];
    if (IsPerformanceLoggingEnabled())
    {
      objc_super v7 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = [v4 elementName];
        int v21 = 134218242;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_230B4C000, v8, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p %@ createEntryForTemplate", (uint8_t *)&v21, 0x16u);
      }
    }
    v10 = [[_TVPagePerformanceTemplateEntry alloc] initWithPagePerformanceController:self forTemplateElement:v4];
    [(NSMutableArray *)self->_templateEntries addObject:v10];
    id v11 = [v4 elementName];
    -[_TVPagePerformanceController setPageIsLoading:](self, "setPageIsLoading:", [@"loadingTemplate" isEqualToString:v11]);
    -[_TVPagePerformanceController setPageHasSubpages:](self, "setPageHasSubpages:", [@"menuBarTemplate" isEqualToString:v11]);
    [(_TVPagePerformanceController *)self setPageWasUpdated:0];
  }
  return v10;
}

- (unint64_t)templateDidComplete
{
  if ([(_TVPagePerformanceController *)self viewDidDisappear]) {
    return 0;
  }
  id v4 = [(NSMutableArray *)self->_templateEntries lastObject];
  unint64_t v5 = [(_TVPagePerformanceController *)self viewDidAppear];
  if (v5 <= [v4 templateDidTransition]) {
    unint64_t v6 = [v4 templateDidTransition];
  }
  else {
    unint64_t v6 = [(_TVPagePerformanceController *)self viewDidAppear];
  }
  unint64_t v3 = v6;
  if ([v4 templateDidLoadResources] > v6) {
    unint64_t v3 = [v4 templateDidLoadResources];
  }

  return v3;
}

- (NSDictionary)metrics
{
  v18[8] = *MEMORY[0x263EF8340];
  __darwin_time_t v3 = self->_baseTimeval.tv_usec + 1000000 * self->_baseTimeval.tv_sec;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39___TVPagePerformanceController_metrics__block_invoke;
  v16[3] = &unk_264BA78B0;
  v16[4] = self;
  v16[5] = v3;
  id v4 = (void (**)(void, void))MEMORY[0x230FC9DC0](v16, a2);
  unint64_t v5 = [(NSMutableArray *)self->_templateEntries lastObject];
  v17[0] = @"pageAppearTime";
  uint64_t v15 = v4[2](v4, [(_TVPagePerformanceController *)self viewDidAppear]);
  v18[0] = v15;
  v17[1] = @"pageUserInteractiveTime";
  unint64_t v6 = v4[2](v4, [v5 templateDidTransition]);
  v18[1] = v6;
  v17[2] = @"pageEndTime";
  objc_super v7 = v4[2](v4, [(_TVPagePerformanceController *)self templateDidComplete]);
  v18[2] = v7;
  v17[3] = @"pageInterruptTime";
  v8 = v4[2](v4, [(_TVPagePerformanceController *)self viewDidDisappear]);
  v18[3] = v8;
  v17[4] = @"modelRenderStartTime";
  v9 = v4[2](v4, [v5 templateWillRender]);
  v18[4] = v9;
  v17[5] = @"modelRenderEndTime";
  v10 = v4[2](v4, [v5 templateDidRender]);
  v18[5] = v10;
  v17[6] = @"resourceRequestStartTime";
  id v11 = v4[2](v4, [v5 templateWillLoadResources]);
  v18[6] = v11;
  v17[7] = @"resourceRequestEndTime";
  uint64_t v12 = v4[2](v4, [v5 templateDidLoadResources]);
  v18[7] = v12;
  int v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:8];

  return (NSDictionary *)v13;
}

- (id)buildPagePerformanceView
{
  v23[5] = *MEMORY[0x263EF8340];
  [(_TVPagePerformanceController *)self _calculatePageDurations];
  __darwin_time_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 500.0, 0.0);
  id v4 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
  [v3 setBackgroundColor:v4];

  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  id v19 = &unk_230C43B61;
  long long v20 = xmmword_230C381F0;
  long long v21 = xmmword_230C38200;
  v22[0] = @"Complete Duration: ";
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageCompleteDuration](self, "pageCompleteDuration"));
  v23[0] = v5;
  v22[1] = @"Setup Duration: ";
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageSetupDuration](self, "pageSetupDuration"));
  v23[1] = v6;
  void v22[2] = @"Render Duration: ";
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageRenderDuration](self, "pageRenderDuration"));
  v23[2] = v7;
  v22[3] = @"Resource Duration: ";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageResourceDuration](self, "pageResourceDuration"));
  v23[3] = v8;
  v22[4] = @"Transition Duration: ";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageTransitionDuration](self, "pageTransitionDuration"));
  v23[4] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56___TVPagePerformanceController_buildPagePerformanceView__block_invoke;
  v13[3] = &unk_264BA78D8;
  uint64_t v15 = &v16;
  id v11 = v3;
  id v14 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, 500.0, v17[5]);

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)_calculatePageDurations
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __darwin_time_t v3 = [(NSMutableArray *)self->_templateEntries lastObject];
  -[_TVPagePerformanceController setPageRenderDuration:](self, "setPageRenderDuration:", [v3 templateRenderDuration]);
  if ([(_TVPagePerformanceController *)self pageWasUpdated])
  {
    [(_TVPagePerformanceController *)self setPageCompleteDuration:0];
    [(_TVPagePerformanceController *)self setPageSetupDuration:0];
    [(_TVPagePerformanceController *)self setPageResourceDuration:0];
    id v4 = self;
    unint64_t v5 = 0;
  }
  else
  {
    if (IsPerformanceLoggingEnabled())
    {
      unint64_t v6 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        templateEntries = self->_templateEntries;
        *(_DWORD *)buf = 134218242;
        v24 = self;
        __int16 v25 = 2112;
        v26 = templateEntries;
        _os_log_impl(&dword_230B4C000, v6, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p calculatePageDurations %@", buf, 0x16u);
      }
    }
    if ([(_TVPagePerformanceController *)self pageWasInterrupted]) {
      unint64_t v8 = [(_TVPagePerformanceController *)self viewDidDisappear];
    }
    else {
      unint64_t v8 = [(_TVPagePerformanceController *)self templateDidComplete];
    }
    [(_TVPagePerformanceController *)self setPageCompleteDuration:_TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(self->_baseAbsoluteTime, v8)];
    -[_TVPagePerformanceController setPageSetupDuration:](self, "setPageSetupDuration:", _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(self->_baseAbsoluteTime, [v3 templateWillRender]));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_templateEntries;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v17 = objc_msgSend(v16, "templateTransitionDuration", (void)v18);
          if (v17 > v13) {
            unint64_t v13 = v17;
          }
          v12 += [v16 templateResourcesDuration];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
    }

    [(_TVPagePerformanceController *)self setPageResourceDuration:v12];
    id v4 = self;
    unint64_t v5 = v13;
  }
  -[_TVPagePerformanceController setPageTransitionDuration:](v4, "setPageTransitionDuration:", v5, (void)v18);
}

- (BOOL)_isMetricsReady
{
  __darwin_time_t v3 = [(NSMutableArray *)self->_templateEntries lastObject];
  if ([(_TVPagePerformanceController *)self viewDidDisappear])
  {
    if ([v3 templateDidLoadResources])
    {
      if (IsPerformanceLoggingEnabled())
      {
        id v4 = TVMLKitPerformanceLogObject;
        BOOL v5 = 0;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v9 = 0;
          unint64_t v6 = "[DEBUG] shouldDeliverMetrics -- Too late; page has already been dismissed/finished loading";
          objc_super v7 = (uint8_t *)&v9;
LABEL_16:
          _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
          goto LABEL_17;
        }
        goto LABEL_18;
      }
LABEL_17:
      BOOL v5 = 0;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (![(_TVPagePerformanceController *)self viewDidAppear])
  {
    if (IsPerformanceLoggingEnabled())
    {
      id v4 = TVMLKitPerformanceLogObject;
      BOOL v5 = 0;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unint64_t v6 = "[DEBUG] shouldDeliverMetrics -- Too early; page is not yet interactive";
        objc_super v7 = buf;
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ([v3 templateDidLoadResources] && objc_msgSend(v3, "templateDidTransition"))
  {
LABEL_9:
    BOOL v5 = 1;
    goto LABEL_18;
  }
  if (!IsPerformanceLoggingEnabled()) {
    goto LABEL_17;
  }
  id v4 = TVMLKitPerformanceLogObject;
  BOOL v5 = 0;
  if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = 0;
    unint64_t v6 = "[DEBUG] shouldDeliverMetrics -- Too early; page is not finished loading";
    objc_super v7 = (uint8_t *)&v10;
    goto LABEL_16;
  }
LABEL_18:

  return v5;
}

- (void)_maybeDeliverMetrics
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (IsPerformanceLoggingEnabled())
  {
    __darwin_time_t v3 = TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = self;
      _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p maybeDeliverMetrics", (uint8_t *)&v7, 0xCu);
    }
  }
  if ([(_TVPagePerformanceController *)self _isMetricsReady])
  {
    if (IsPerformanceLoggingEnabled())
    {
      id v4 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        unint64_t v8 = self;
        _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p actuallyDeliverMetrics", (uint8_t *)&v7, 0xCu);
      }
    }
    BOOL v5 = [(_TVPagePerformanceController *)self delegate];
    unint64_t v6 = [(_TVPagePerformanceController *)self metrics];
    [v5 pagePerformanceController:self didUpdateMetrics:v6];
  }
}

- (_TVPagePerformanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVPagePerformanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pageHasSubpages
{
  return self->_pageHasSubpages;
}

- (void)setPageHasSubpages:(BOOL)a3
{
  self->_pageHasSubpages = a3;
}

- (BOOL)pageWasInterrupted
{
  return self->_pageWasInterrupted;
}

- (void)setPageWasInterrupted:(BOOL)a3
{
  self->_pageWasInterrupted = a3;
}

- (BOOL)pageWasUpdated
{
  return self->_pageWasUpdated;
}

- (void)setPageWasUpdated:(BOOL)a3
{
  self->_pageWasUpdated = a3;
}

- (unint64_t)viewWillLoad
{
  return self->_viewWillLoad;
}

- (void)setViewWillLoad:(unint64_t)a3
{
  self->_viewWillLoad = a3;
}

- (unint64_t)viewDidLoad
{
  return self->_viewDidLoad;
}

- (void)setViewDidLoad:(unint64_t)a3
{
  self->_viewDidLoad = a3;
}

- (unint64_t)viewWillAppear
{
  return self->_viewWillAppear;
}

- (void)setViewWillAppear:(unint64_t)a3
{
  self->_viewWillAppear = a3;
}

- (unint64_t)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(unint64_t)a3
{
  self->_viewDidAppear = a3;
}

- (unint64_t)viewWillDisappear
{
  return self->_viewWillDisappear;
}

- (void)setViewWillDisappear:(unint64_t)a3
{
  self->_viewWillDisappear = a3;
}

- (unint64_t)viewDidDisappear
{
  return self->_viewDidDisappear;
}

- (void)setViewDidDisappear:(unint64_t)a3
{
  self->_viewDidDisappear = a3;
}

- (BOOL)pageIsLoading
{
  return self->_pageIsLoading;
}

- (void)setPageIsLoading:(BOOL)a3
{
  self->_pageIsLoading = a3;
}

- (unint64_t)pageCompleteDuration
{
  return self->_pageCompleteDuration;
}

- (void)setPageCompleteDuration:(unint64_t)a3
{
  self->_pageCompleteDuration = a3;
}

- (unint64_t)pageSetupDuration
{
  return self->_pageSetupDuration;
}

- (void)setPageSetupDuration:(unint64_t)a3
{
  self->_pageSetupDuration = a3;
}

- (unint64_t)pageRenderDuration
{
  return self->_pageRenderDuration;
}

- (void)setPageRenderDuration:(unint64_t)a3
{
  self->_pageRenderDuration = a3;
}

- (unint64_t)pageResourceDuration
{
  return self->_pageResourceDuration;
}

- (void)setPageResourceDuration:(unint64_t)a3
{
  self->_pageResourceDuration = a3;
}

- (unint64_t)pageTransitionDuration
{
  return self->_pageTransitionDuration;
}

- (void)setPageTransitionDuration:(unint64_t)a3
{
  self->_pageTransitionDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_templateEntries, 0);
}

@end