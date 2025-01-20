@interface UIEventSessionActionAnalytics
+ (id)sharedInstance;
- (BOOL)getAIDState;
- (NSNumber)sessionID;
- (NSString)bundleID;
- (UIEventSessionActionAnalytics)init;
- (id)_instanceOfActionClass:(Class)a3 source:(int64_t)a4;
- (id)allAccumulatorNames;
- (void)addAccumulator:(id)a3;
- (void)didHardwareConfigurationChange:(id)a3;
- (void)didKeyCommand:(id)a3;
- (void)didPointerClick:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5;
- (void)didPointerHover:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5;
- (void)didScroll:(id)a3 withSource:(int64_t)a4;
- (void)didShowContextualMenuFromLocation:(CGPoint)a3 withSource:(int64_t)a4;
- (void)didTap:(id)a3 withSource:(int64_t)a4;
- (void)didTextSelectionWithSource:(int64_t)a3;
- (void)didTouch:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5 withTrackpadFingerDownCount:(int64_t)a6;
- (void)didTypingWithSource:(int64_t)a3;
- (void)q_addAccumulator:(id)a3;
- (void)q_addActionAndUpdate:(id)a3;
- (void)q_enumerateAnalytics:(id)a3;
- (void)q_flushRecentActions;
- (void)q_setupDefaultAnalytics;
- (void)q_updateAnalyticsFromAccumulators;
- (void)q_updateHardwareState;
- (void)q_updateUIInterfaceOrientation;
- (void)q_writeAnalytics;
- (void)resetSessionID;
- (void)setSessionID:(id)a3;
- (void)updateAIDState;
- (void)updateHardwareKeyboardState;
- (void)updateUIInterfaceOrientation;
- (void)writeAnalytics;
- (void)writeEventWithFields:(id)a3 andName:(id)a4;
@end

@implementation UIEventSessionActionAnalytics

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__UIEventSessionActionAnalytics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB262B28 != -1) {
    dispatch_once(&qword_1EB262B28, block);
  }
  v2 = (void *)_MergedGlobals_1208;
  return v2;
}

void __47__UIEventSessionActionAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v4 = objc_alloc_init(*(Class *)(a1 + 32));
    v5 = (void *)_MergedGlobals_1208;
    _MergedGlobals_1208 = (uint64_t)v4;

    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &qword_1EB262B30);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v7 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v12 = 0;
          v8 = "Created shared instance on iPad";
          v9 = (uint8_t *)&v12;
LABEL_11:
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
        }
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    unint64_t v10 = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &qword_1EB262B38);
    if (*(unsigned char *)v10)
    {
      v7 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __int16 v11 = 0;
        v8 = "Disabled on non-iPad device";
        v9 = (uint8_t *)&v11;
        goto LABEL_11;
      }
    }
  }
}

- (UIEventSessionActionAnalytics)init
{
  v17.receiver = self;
  v17.super_class = (Class)UIEventSessionActionAnalytics;
  v2 = [(UIEventSessionActionAnalytics *)&v17 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_maxDepth = 0;
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.UIKit.UIEventSessionActionAnalytics", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:100];
    accumulators = v3->_accumulators;
    v3->_accumulators = (NSMutableSet *)v7;

    v9 = objc_alloc_init(UIEventSessionTouchEventAnalyzer);
    touchAnalyzer = v3->touchAnalyzer;
    v3->touchAnalyzer = v9;

    [(UIEventSessionActionAnalytics *)v3 resetSessionID];
    __int16 v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v3 selector:sel_writeAnalytics name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v11 addObserver:v3 selector:sel_writeAnalytics name:0x1ED1803C0 object:0];
    [v11 addObserver:v3 selector:sel_writeAnalytics name:0x1ED1802E0 object:0];
    __int16 v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v3 selector:sel_didHardwareConfigurationChange_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];

    if (_UIIsPrivateMainBundle())
    {
      v13 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v14 = [v13 bundleIdentifier];
      bundleID = v3->_bundleID;
      v3->_bundleID = (NSString *)v14;
    }
    else
    {
      v13 = v3->_bundleID;
      v3->_bundleID = (NSString *)@"other";
    }

    [(UIEventSessionActionAnalytics *)v3 q_setupDefaultAnalytics];
    [(UIEventSessionActionAnalytics *)v3 q_updateHardwareState];
    [(UIEventSessionActionAnalytics *)v3 q_updateUIInterfaceOrientation];
  }
  return v3;
}

- (void)resetSessionID
{
  uint64_t v3 = [NSNumber numberWithUnsignedLong:arc4random_uniform(0x5F5E0FFu)];
  sessionID = self->_sessionID;
  self->_sessionID = v3;
}

- (void)q_enumerateAnalytics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(UIEventSessionActionAnalytics *)self q_flushRecentActions];
    accumulators = self->_accumulators;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__UIEventSessionActionAnalytics_q_enumerateAnalytics___block_invoke;
    v6[3] = &unk_1E53045C0;
    id v7 = v4;
    [(NSMutableSet *)accumulators enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __54__UIEventSessionActionAnalytics_q_enumerateAnalytics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateAnalytics:*(void *)(a1 + 32)];
}

- (id)allAccumulatorNames
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_accumulators, "count"));
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__UIEventSessionActionAnalytics_allAccumulatorNames__block_invoke;
  v9[3] = &unk_1E52D9F98;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  id v7 = v5;

  return v7;
}

void __52__UIEventSessionActionAnalytics_allAccumulatorNames__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "name", (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)q_writeAnalytics
{
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &q_writeAnalytics___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "writeAnalytics() called! (Should be when app goes to background)", buf, 2u);
      }
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke;
  v5[3] = &unk_1E5304610;
  v5[4] = self;
  [(UIEventSessionActionAnalytics *)self q_enumerateAnalytics:v5];
  [(NSMutableSet *)self->_accumulators enumerateObjectsUsingBlock:&__block_literal_global_467];
  [(UIEventSessionActionAnalytics *)self resetSessionID];
}

void __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_2___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v8 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "writeAnalytics(): [self enumerateAnalytics]...", buf, 2u);
      }
    }
  }
  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke_16(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v3 = [*(id *)(a1 + 40) bundleID];
  [v2 setObject:v3 forKeyedSubscript:@"bundleId"];

  return v2;
}

uint64_t __49__UIEventSessionActionAnalytics_q_writeAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)writeAnalytics
{
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &writeAnalytics___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "writeAnalytics() called! (Should be when app goes to background)", buf, 2u);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__UIEventSessionActionAnalytics_writeAnalytics__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __47__UIEventSessionActionAnalytics_writeAnalytics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_writeAnalytics");
}

- (void)writeEventWithFields:(id)a3 andName:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __62__UIEventSessionActionAnalytics_writeEventWithFields_andName___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v3 = [*(id *)(a1 + 40) bundleID];
  [v2 setObject:v3 forKeyedSubscript:@"bID"];

  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_3___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "writeEventWithFields() wrote %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  return v2;
}

- (void)addAccumulator:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__UIEventSessionActionAnalytics_addAccumulator___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __48__UIEventSessionActionAnalytics_addAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addAccumulator:", *(void *)(a1 + 40));
}

- (void)q_addAccumulator:(id)a3
{
  unint64_t maxDepth = self->_maxDepth;
  id v8 = a3;
  uint64_t v5 = [v8 depthRange];
  unint64_t v7 = v5 + v6;
  if (maxDepth > v5 + v6) {
    unint64_t v7 = maxDepth;
  }
  self->_unint64_t maxDepth = v7;
  [(NSMutableSet *)self->_accumulators addObject:v8];
}

- (void)q_addActionAndUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (!self->_magicKeyboardState || !self->_hardwareKeyboardState) {
      [(UIEventSessionActionAnalytics *)self q_updateHardwareState];
    }
    [(UIEventSessionActionAnalytics *)self q_updateUIInterfaceOrientation];
    [v5 setSessionID:self->_sessionID];
    [v5 setUiInterfaceOrientation:self->_uiInterfaceOrientation];
    [v5 setHardwareKeyboardState:self->_hardwareKeyboardState];
    [v5 setMagicKeyboardState:self->_magicKeyboardState];
    uint64_t v6 = [(UIEventSessionActionAnalytics *)self bundleID];
    if ([v6 isEqualToString:@"com.apple.springboard"])
    {
      uint64_t v7 = [v5 source];

      if (v7 == 2) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    p_lastAction = &self->_lastAction;
    int64_t v9 = [(_UIEventSessionAction *)self->_lastAction mergeActionIfPossible:v5];
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &q_addActionAndUpdate____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        long long v11 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          long long v12 = *p_lastAction;
          int v13 = 134218498;
          int64_t v14 = v9;
          __int16 v15 = 2112;
          v16 = v12;
          __int16 v17 = 2112;
          id v18 = v5;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "q_addActionAndUpdate: Merge result %lu lastAction:%@ newAction:%@", (uint8_t *)&v13, 0x20u);
        }
      }
    }
    if (!*p_lastAction) {
      goto LABEL_13;
    }
    if (!v9)
    {
      [(UIEventSessionActionAnalytics *)self q_updateAnalyticsFromAccumulators];
LABEL_13:
      objc_storeStrong((id *)&self->_lastAction, a3);
    }
  }
LABEL_14:
}

- (void)q_updateAnalyticsFromAccumulators
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_lastAction)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = self->_accumulators;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "increaseWithAction:", self->_lastAction, (void)v9);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    lastAction = self->_lastAction;
    self->_lastAction = 0;
  }
}

- (void)q_flushRecentActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(UIEventSessionActionAnalytics *)self q_updateAnalyticsFromAccumulators];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_accumulators;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "flushAccumulator", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_instanceOfActionClass:(Class)a3 source:(int64_t)a4
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v6 = objc_alloc_init(a3);
    [v6 setSource:a4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)getAIDState
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  cf = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  CFArrayRef v2 = IOHIDEventSystemClientCopyServices(cf);
  uint64_t v3 = [(__CFArray *)v2 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0x1E4F1C000uLL;
    uint64_t v6 = *(void *)v40;
    uint64_t v7 = @"DeviceUsagePage";
    long long v8 = @"DeviceUsage";
    long long v9 = &unk_1ED3F6648;
    CFArrayRef obj = v2;
    uint64_t v27 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v4;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        service = *(__IOHIDServiceClient **)(*((void *)&v39 + 1) + 8 * v10);
        long long v11 = (void *)IOHIDServiceClientCopyProperty(service, @"DeviceUsagePairs");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = v10;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
          v29 = v11;
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v36;
            v33 = v12;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v36 != v15) {
                  objc_enumerationMutation(v12);
                }
                __int16 v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v18 = [v17 objectForKey:v7];
                  uint64_t v19 = [v17 objectForKey:v8];
                  if ([v18 isEqual:v9]
                    && [v19 isEqual:&unk_1ED3F6660])
                  {
                    unint64_t v20 = v5;
                    v21 = v9;
                    v22 = v8;
                    v23 = v7;
                    v24 = (void *)IOHIDServiceClientCopyProperty(service, @"Transport");
                    if ([v24 isEqualToString:@"AID"])
                    {
                      CFRelease(cf);

                      CFArrayRef v2 = obj;
                      BOOL v25 = 1;
                      goto LABEL_27;
                    }

                    uint64_t v7 = v23;
                    long long v8 = v22;
                    long long v9 = v21;
                    unint64_t v5 = v20;
                    id v12 = v33;
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          uint64_t v4 = v28;
          long long v11 = v29;
          uint64_t v6 = v27;
          uint64_t v10 = v30;
        }

        ++v10;
      }
      while (v10 != v4);
      CFArrayRef v2 = obj;
      uint64_t v4 = [(__CFArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v4);
  }

  if (cf) {
    CFRelease(cf);
  }
  BOOL v25 = 0;
LABEL_27:

  return v25;
}

- (void)updateAIDState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIEventSessionActionAnalytics *)self getAIDState];
  int64_t v4 = 1;
  if (v3) {
    int64_t v4 = 2;
  }
  self->_int64_t magicKeyboardState = v4;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &updateAIDState___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int64_t magicKeyboardState = self->_magicKeyboardState;
        int v8 = 134217984;
        int64_t v9 = magicKeyboardState;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "New magic keyboard state: %lu", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)updateHardwareKeyboardState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[UIDevice currentDevice];
  int64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 _isHardwareKeyboardAvailable];
    int64_t v6 = 1;
    if (v5) {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 0;
  }
  self->_int64_t hardwareKeyboardState = v6;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &updateHardwareKeyboardState___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      int v8 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int64_t hardwareKeyboardState = self->_hardwareKeyboardState;
        int v10 = 134217984;
        int64_t v11 = hardwareKeyboardState;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "New hardware keyboard state: %lu", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)updateUIInterfaceOrientation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_int64_t uiInterfaceOrientation = [(id)UIApp activeInterfaceOrientation];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &updateUIInterfaceOrientation___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      int64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int64_t uiInterfaceOrientation = self->_uiInterfaceOrientation;
        int v6 = 134217984;
        int64_t v7 = uiInterfaceOrientation;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "New interface orientation: %lu", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)q_updateHardwareState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v7 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled)
    {
      while (v3 >= v7)
      {
        _UIInternalPreferenceSync(v3, &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled, @"UIEventSessionActionAnalyticsMagicKeyboardStateEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v7 = _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled;
        if (v3 == _UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled) {
          goto LABEL_4;
        }
      }
      if (byte_1E8FD541C) {
        [(UIEventSessionActionAnalytics *)self updateAIDState];
      }
    }
  }
LABEL_4:
  [(UIEventSessionActionAnalytics *)self updateHardwareKeyboardState];
  int64_t lastMagicKeyboardState = self->_lastMagicKeyboardState;
  BOOL v5 = self->_magicKeyboardState == lastMagicKeyboardState || lastMagicKeyboardState == 0;
  if (!v5 || (int64_t v6 = self->_lastHardwareKeyboardState, self->_hardwareKeyboardState != v6) && v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", q_updateHardwareState___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        int64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int64_t magicKeyboardState = self->_magicKeyboardState;
          int64_t v10 = self->_lastMagicKeyboardState;
          int64_t hardwareKeyboardState = self->_hardwareKeyboardState;
          int64_t lastHardwareKeyboardState = self->_lastHardwareKeyboardState;
          int v14 = 134218752;
          int64_t v15 = v10;
          __int16 v16 = 2048;
          int64_t v17 = magicKeyboardState;
          __int16 v18 = 2048;
          int64_t v19 = lastHardwareKeyboardState;
          __int16 v20 = 2048;
          int64_t v21 = hardwareKeyboardState;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "*** Detected hardware state change (Magic KB %lu->%lu, HW KB %lu->%lu)", (uint8_t *)&v14, 0x2Au);
        }
      }
    }
  }
  self->_int64_t lastMagicKeyboardState = self->_magicKeyboardState;
  self->_int64_t lastHardwareKeyboardState = self->_hardwareKeyboardState;
}

- (void)q_updateUIInterfaceOrientation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(UIEventSessionActionAnalytics *)self updateUIInterfaceOrientation];
  int64_t lastUIInterfaceOrientation = self->_lastUIInterfaceOrientation;
  if (self->_uiInterfaceOrientation != lastUIInterfaceOrientation && lastUIInterfaceOrientation != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &q_updateUIInterfaceOrientation___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        int v7 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int64_t uiInterfaceOrientation = self->_uiInterfaceOrientation;
          int64_t v8 = self->_lastUIInterfaceOrientation;
          int v10 = 134218240;
          int64_t v11 = v8;
          __int16 v12 = 2048;
          int64_t v13 = uiInterfaceOrientation;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "*** Detected UI interface orientation change (orientation %lu->%lu)", (uint8_t *)&v10, 0x16u);
        }
      }
    }
  }
  int64_t v5 = self->_uiInterfaceOrientation;
  if (v5 != self->_lastUIInterfaceOrientation) {
    self->_int64_t lastUIInterfaceOrientation = v5;
  }
}

- (void)didTouch:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5 withTrackpadFingerDownCount:(int64_t)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v11 = a4.y;
  CGFloat v12 = a4.x;
  uint64_t v14 = NSNumber;
  id v15 = a3;
  __int16 v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "_touchIdentifier"));
  uint64_t v17 = [v15 phase];
  uint64_t v18 = [v15 type];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__UIEventSessionActionAnalytics_didTouch_withLocationInWindow_withWindowBounds_withTrackpadFingerDownCount___block_invoke;
  block[3] = &unk_1E52DF378;
  block[4] = self;
  id v22 = v16;
  uint64_t v23 = v17;
  uint64_t v24 = v18;
  CGFloat v25 = v12;
  CGFloat v26 = v11;
  CGFloat v27 = x;
  CGFloat v28 = y;
  CGFloat v29 = width;
  CGFloat v30 = height;
  int64_t v31 = a6;
  id v20 = v16;
  dispatch_async(queue, block);
}

void __108__UIEventSessionActionAnalytics_didTouch_withLocationInWindow_withWindowBounds_withTrackpadFingerDownCount___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "didTouchWithID:withPhase:withType:withLocationInWindow:withWindowBounds:withTrackpadFingerDownCount:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 112), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didPointerHover:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  if (a3)
  {
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
    CGFloat v9 = a4.y;
    CGFloat v10 = a4.x;
    uint64_t v12 = [a3 _trackpadFingerDownCount];
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__UIEventSessionActionAnalytics_didPointerHover_withLocationInWindow_withWindowBounds___block_invoke;
    v14[3] = &unk_1E5304658;
    v14[4] = self;
    v14[5] = v12;
    *(CGFloat *)&v14[6] = v10;
    *(CGFloat *)&v14[7] = v9;
    *(CGFloat *)&v14[8] = x;
    *(CGFloat *)&v14[9] = y;
    *(CGFloat *)&v14[10] = width;
    *(CGFloat *)&v14[11] = height;
    dispatch_async(queue, v14);
  }
}

void __87__UIEventSessionActionAnalytics_didPointerHover_withLocationInWindow_withWindowBounds___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "didPointerHoverWithTrackpadFingerDownCount:withLocationInWindow:withWindowBounds:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didPointerClick:(id)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  if (a3)
  {
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
    CGFloat v9 = a4.y;
    CGFloat v10 = a4.x;
    uint64_t v12 = [a3 _trackpadFingerDownCount];
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__UIEventSessionActionAnalytics_didPointerClick_withLocationInWindow_withWindowBounds___block_invoke;
    v14[3] = &unk_1E5304658;
    v14[4] = self;
    v14[5] = v12;
    *(CGFloat *)&v14[6] = v10;
    *(CGFloat *)&v14[7] = v9;
    *(CGFloat *)&v14[8] = x;
    *(CGFloat *)&v14[9] = y;
    *(CGFloat *)&v14[10] = width;
    *(CGFloat *)&v14[11] = height;
    dispatch_async(queue, v14);
  }
}

void __87__UIEventSessionActionAnalytics_didPointerClick_withLocationInWindow_withWindowBounds___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "didPointerClickWithTrackpadFingerDownCount:withLocationInWindow:withWindowBounds:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(void *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didTap:(id)a3 withSource:(int64_t)a4
{
  uint64_t v5 = [(UIEventSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class() source:a4];
  uint64_t v6 = [v5 asTap];

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__UIEventSessionActionAnalytics_didTap_withSource___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v10 = v6;
  CGFloat v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

uint64_t __51__UIEventSessionActionAnalytics_didTap_withSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_4___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = v4;
        long long v7 = [v5 description];
        id v8 = [*(id *)(a1 + 40) bundleID];
        int v9 = 138412546;
        id v10 = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "didTap action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(void *)(a1 + 32));
}

- (void)didScroll:(id)a3 withSource:(int64_t)a4
{
  uint64_t v5 = [(UIEventSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class() source:a4];
  uint64_t v6 = [v5 asScroll];

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__UIEventSessionActionAnalytics_didScroll_withSource___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v10 = v6;
  __int16 v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __54__UIEventSessionActionAnalytics_didScroll_withSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_UIIsPrivateMainBundle())
  {
    CFArrayRef v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 bundleIdentifier];
  }
  else
  {
    uint64_t v3 = @"other";
  }
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_5___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void **)(a1 + 32);
        long long v7 = v5;
        id v8 = [v6 description];
        int v9 = 138412546;
        id v10 = v8;
        __int16 v11 = 2112;
        uint64_t v12 = v3;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "didScroll action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(void *)(a1 + 32));
}

- (void)didShowContextualMenuFromLocation:(CGPoint)a3 withSource:(int64_t)a4
{
  uint64_t v5 = [(UIEventSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class() source:a4];
  uint64_t v6 = [v5 asContextualPress];

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__UIEventSessionActionAnalytics_didShowContextualMenuFromLocation_withSource___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v10 = v6;
  __int16 v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

uint64_t __78__UIEventSessionActionAnalytics_didShowContextualMenuFromLocation_withSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_6___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = v4;
        long long v7 = [v5 description];
        id v8 = [*(id *)(a1 + 40) bundleID];
        int v9 = 138412546;
        id v10 = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "didShowContextualMenuFromLocation action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(void *)(a1 + 32));
}

- (void)didTypingWithSource:(int64_t)a3
{
  if (a3 == 1)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UIEventSessionActionAnalytics.m" lineNumber:473 description:@"didTypingWithSource called with direct touch source. This should be accounted for in didTouch:"];
  }
  uint64_t v5 = [(UIEventSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class() source:a3];
  uint64_t v6 = [v5 asTyping];

  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__UIEventSessionActionAnalytics_didTypingWithSource___block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v12 = v6;
  uint64_t v13 = self;
  id v8 = v6;
  dispatch_async(queue, v11);
}

uint64_t __53__UIEventSessionActionAnalytics_didTypingWithSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_7___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = v4;
        long long v7 = [v5 description];
        id v8 = [*(id *)(a1 + 40) bundleID];
        int v9 = 138412546;
        id v10 = v7;
        __int16 v11 = 2112;
        id v12 = v8;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "didTypingWithSource action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(void *)(a1 + 32));
}

- (void)didTextSelectionWithSource:(int64_t)a3
{
  uint64_t v4 = [(UIEventSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class() source:a3];
  uint64_t v5 = [v4 asTextSelection];

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__UIEventSessionActionAnalytics_didTextSelectionWithSource___block_invoke;
  v8[3] = &unk_1E52D9F98;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __60__UIEventSessionActionAnalytics_didTextSelectionWithSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_8___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = v4;
        id v7 = [v5 description];
        id v8 = [*(id *)(a1 + 40) bundleID];
        int v9 = 138412546;
        id v10 = v7;
        __int16 v11 = 2112;
        id v12 = v8;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "didTextSelectionWithSource action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(void *)(a1 + 32));
}

- (void)didKeyCommand:(id)a3
{
  uint64_t v4 = [(UIEventSessionActionAnalytics *)self _instanceOfActionClass:objc_opt_class() source:6];
  uint64_t v5 = [v4 asKeyCommand];

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__UIEventSessionActionAnalytics_didKeyCommand___block_invoke;
  v8[3] = &unk_1E52D9F98;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __47__UIEventSessionActionAnalytics_didKeyCommand___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &_UIInternalPreference_UIEventSessionActionAnalyticsMagicKeyboardStateEnabled_block_invoke_9___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v4 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = v4;
        id v7 = [v5 description];
        id v8 = [*(id *)(a1 + 40) bundleID];
        int v9 = 138412546;
        id v10 = v7;
        __int16 v11 = 2112;
        id v12 = v8;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "didKeyCommand action = %@, bundleId = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(void *)(a1 + 32));
}

- (void)didHardwareConfigurationChange:(id)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &didHardwareConfigurationChange____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Received hardware keyboard availability change notification!", buf, 2u);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__UIEventSessionActionAnalytics_didHardwareConfigurationChange___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__UIEventSessionActionAnalytics_didHardwareConfigurationChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_updateHardwareState");
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->touchAnalyzer, 0);
  objc_storeStrong((id *)&self->_accumulators, 0);
  objc_storeStrong((id *)&self->_lastAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)q_setupDefaultAnalytics
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v16[0] = objc_opt_class();
  v17[0] = &unk_1ED3F1558;
  v16[1] = objc_opt_class();
  v17[1] = &unk_1ED3F1570;
  v16[2] = objc_opt_class();
  v17[2] = &unk_1ED3F1588;
  v16[3] = objc_opt_class();
  v17[3] = &unk_1ED3F15A0;
  v16[4] = objc_opt_class();
  v17[4] = &unk_1ED3F15B8;
  v16[5] = objc_opt_class();
  v17[5] = &unk_1ED3F15D0;
  v16[6] = objc_opt_class();
  v17[6] = &unk_1ED3F15E8;
  v16[7] = objc_opt_class();
  v17[7] = &unk_1ED3F1600;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:8];
  uint64_t v4 = [v3 objectForKeyedSubscript:objc_opt_class()];
  uint64_t v5 = [v4 count];

  if (v5 != 7)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIEventSessionActionDefaultAnalytics.m" lineNumber:76 description:@"rawEventsAllowedActionSourcePairs has incoorect length. Make sure it aligns with _UIEventSourceCount"];
  }
  v14[0] = objc_opt_class();
  v15[0] = &unk_1ED3F1618;
  v14[1] = objc_opt_class();
  v15[1] = &unk_1ED3F1630;
  v14[2] = objc_opt_class();
  v15[2] = &unk_1ED3F1648;
  v14[3] = objc_opt_class();
  v15[3] = &unk_1ED3F1660;
  v14[4] = objc_opt_class();
  v15[4] = &unk_1ED3F1678;
  v14[5] = objc_opt_class();
  v15[5] = &unk_1ED3F1690;
  v14[6] = objc_opt_class();
  v15[6] = &unk_1ED3F16A8;
  v14[7] = objc_opt_class();
  v15[7] = &unk_1ED3F16C0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
  id v7 = [v6 objectForKeyedSubscript:objc_opt_class()];
  uint64_t v8 = [v7 count];

  if (v8 != 7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIEventSessionActionDefaultAnalytics.m" lineNumber:91 description:@"rawEventsAllowedActionSourcePairs has incoorect length. Make sure it aligns with _UIEventSourceCount"];
  }
  int v9 = +[_UIEventSessionDynamicAllEventAccumulator accumulatorWithName:@"com.apple.inputAnalytics.eventSessionActionRawEvents" depth:1 block:&__block_literal_global_583 delegate:self allowedActionSourceTypes:v3];
  [(UIEventSessionActionAnalytics *)self q_addAccumulator:v9];

  id v10 = +[_UIEventSessionDynamicAllEventAccumulator accumulatorWithName:@"com.apple.inputAnalytics.eventSessionActionContextualEvents" depth:1 block:&__block_literal_global_94_3 delegate:self allowedActionSourceTypes:v6];
  [(UIEventSessionActionAnalytics *)self q_addAccumulator:v10];
}

uint64_t __65__UIEventSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v2 = [a2 firstObject];
  uint64_t v3 = [v2 actionCount];

  return v3;
}

uint64_t __65__UIEventSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  CFArrayRef v2 = [a2 firstObject];
  uint64_t v3 = [v2 actionCount];

  return v3;
}

@end