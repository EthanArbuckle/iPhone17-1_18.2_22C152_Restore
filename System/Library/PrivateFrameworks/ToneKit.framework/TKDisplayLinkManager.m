@interface TKDisplayLinkManager
+ (TKDisplayLinkManager)currentDisplayLinkManager;
+ (void)_releaseCurrentDisplayLinkManager;
- (BOOL)_isWarmUpModeEnabled;
- (BOOL)isPaused;
- (TKDisplayLinkManager)init;
- (double)duration;
- (double)timestamp;
- (id)_displayLink;
- (id)_prepareUpdatedObserversForModification;
- (id)addObserverForFrameInterval:(unint64_t)a3 handler:(id)a4;
- (id)addObserverWithHandler:(id)a3;
- (void)_didAddFirstObserver;
- (void)_didRemoveLastObserver;
- (void)_displayDidRefresh:(id)a3;
- (void)_setDisplayLink:(id)a3;
- (void)beginRequiringWarmUpMode;
- (void)dealloc;
- (void)endRequiringWarmUpMode;
- (void)removeObserverWithToken:(id)a3;
@end

@implementation TKDisplayLinkManager

+ (TKDisplayLinkManager)currentDisplayLinkManager
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  if (v3)
  {
    v4 = [MEMORY[0x263F08B88] currentThread];
    v5 = [v4 threadDictionary];

    v6 = [v5 objectForKey:v3];
    if (!v6)
    {
      v6 = objc_alloc_init(TKDisplayLinkManager);
      if (v6) {
        [v5 setObject:v6 forKey:v3];
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_releaseCurrentDisplayLinkManager
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = [MEMORY[0x263F08B88] currentThread];
    v4 = [v3 threadDictionary];

    [v4 removeObjectForKey:v5];
  }
}

- (TKDisplayLinkManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)TKDisplayLinkManager;
  v2 = [(TKDisplayLinkManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeObservers = v2->_activeObservers;
    v2->_activeObservers = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updatedObservers = v2->_updatedObservers;
    v2->_updatedObservers = v5;
  }
  return v2;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKDisplayLinkManager;
  [(TKDisplayLinkManager *)&v3 dealloc];
}

- (BOOL)isPaused
{
  return [(CADisplayLink *)self->_displayLink isPaused];
}

- (double)duration
{
  [(CADisplayLink *)self->_displayLink duration];
  return result;
}

- (double)timestamp
{
  [(CADisplayLink *)self->_displayLink timestamp];
  return result;
}

- (id)_displayLink
{
  displayLink = self->_displayLink;
  if (!displayLink)
  {
    v4 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__displayDidRefresh_];
    id v5 = self->_displayLink;
    self->_displayLink = v4;

    v6 = self->_displayLink;
    v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x263EFF478]];

    [(CADisplayLink *)self->_displayLink setPaused:1];
    displayLink = self->_displayLink;
  }

  return displayLink;
}

- (void)_setDisplayLink:(id)a3
{
  id v5 = (CADisplayLink *)a3;
  displayLink = self->_displayLink;
  p_displayLink = &self->_displayLink;
  v6 = displayLink;
  if (displayLink != v5)
  {
    v9 = v5;
    [(CADisplayLink *)v6 invalidate];
    objc_storeStrong((id *)p_displayLink, a3);
    id v5 = v9;
  }

  MEMORY[0x270F9A758](v6, v5);
}

- (id)addObserverWithHandler:(id)a3
{
  return [(TKDisplayLinkManager *)self addObserverForFrameInterval:1 handler:a3];
}

- (id)addObserverForFrameInterval:(unint64_t)a3 handler:(id)a4
{
  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  objc_super v8 = [v6 UUID];
  v9 = [[TKDisplayLinkManagerObserver alloc] initWithBlock:v7 frameInterval:a3];

  if (self->_isHandlingDisplayRefresh)
  {
    v10 = [(TKDisplayLinkManager *)self _prepareUpdatedObserversForModification];
    [v10 setObject:v9 forKey:v8];
  }
  else
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_activeObservers count];
    [(NSMutableDictionary *)self->_activeObservers setObject:v9 forKey:v8];
    if (!v11) {
      [(TKDisplayLinkManager *)self _didAddFirstObserver];
    }
  }

  return v8;
}

- (void)removeObserverWithToken:(id)a3
{
  if (self->_isHandlingDisplayRefresh)
  {
    id v4 = a3;
    id v8 = [(TKDisplayLinkManager *)self _prepareUpdatedObserversForModification];
    [v8 removeObjectForKey:v4];
  }
  else
  {
    activeObservers = self->_activeObservers;
    id v6 = a3;
    uint64_t v7 = [(NSMutableDictionary *)activeObservers count];
    [(NSMutableDictionary *)self->_activeObservers removeObjectForKey:v6];

    if (v7 && ![(NSMutableDictionary *)self->_activeObservers count])
    {
      [(TKDisplayLinkManager *)self _didRemoveLastObserver];
    }
  }
}

- (id)_prepareUpdatedObserversForModification
{
  if (!self->_hasUpdatedObservers)
  {
    [(NSMutableDictionary *)self->_updatedObservers addEntriesFromDictionary:self->_activeObservers];
    self->_hasUpdatedObservers = 1;
  }
  updatedObservers = self->_updatedObservers;

  return updatedObservers;
}

- (void)_didAddFirstObserver
{
  id v2 = [(TKDisplayLinkManager *)self _displayLink];
  [v2 setPaused:0];
}

- (void)_didRemoveLastObserver
{
  [(CADisplayLink *)self->_displayLink setPaused:1];
  if (![(TKDisplayLinkManager *)self _isWarmUpModeEnabled])
  {
    [(TKDisplayLinkManager *)self _setDisplayLink:0];
    objc_super v3 = objc_opt_class();
    [v3 _releaseCurrentDisplayLinkManager];
  }
}

- (BOOL)_isWarmUpModeEnabled
{
  return self->_warmUpModeRequirementsCount != 0;
}

- (void)beginRequiringWarmUpMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "Unexpectedly has updated target actions even though not handling display refresh.", v2, v3, v4, v5, v6);
}

- (void)endRequiringWarmUpMode
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v2 = self->_warmUpModeRequirementsCount - 1;
  self->_warmUpModeRequirementsCount = v2;
  if (!v2 && !self->_isHandlingDisplayRefresh)
  {
    if (self->_hasUpdatedObservers)
    {
      uint64_t v4 = TLLogGeneral();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (v5)
      {
        uint8_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Shared/Embedded/DisplayLink/TKDisplayLinkManager.m"];
        uint64_t v7 = TLLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v6 lastPathComponent];
          v9 = [MEMORY[0x263F08B88] callStackSymbols];
          int v11 = 136381443;
          v12 = "-[TKDisplayLinkManager endRequiringWarmUpMode]";
          __int16 v13 = 2113;
          v14 = v8;
          __int16 v15 = 2049;
          uint64_t v16 = 187;
          __int16 v17 = 2113;
          v18 = v9;
          _os_log_impl(&dword_22107E000, v7, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v11, 0x2Au);
        }
      }
      else
      {
        uint8_t v6 = TLLogGeneral();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
        }
      }

      v10 = TLLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TKDisplayLinkManager beginRequiringWarmUpMode]();
      }
    }
    if (![(NSMutableDictionary *)self->_activeObservers count]) {
      [(TKDisplayLinkManager *)self _didRemoveLastObserver];
    }
  }
}

- (void)_displayDidRefresh:(id)a3
{
  BOOL isHandlingDisplayRefresh = self->_isHandlingDisplayRefresh;
  self->_BOOL isHandlingDisplayRefresh = 1;
  p_activeObservers = &self->_activeObservers;
  activeObservers = self->_activeObservers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__TKDisplayLinkManager__displayDidRefresh___block_invoke;
  v9[3] = &unk_264589A98;
  v9[4] = self;
  [(NSMutableDictionary *)activeObservers enumerateKeysAndObjectsUsingBlock:v9];
  self->_BOOL isHandlingDisplayRefresh = isHandlingDisplayRefresh;
  if (!isHandlingDisplayRefresh && self->_hasUpdatedObservers)
  {
    [(NSMutableDictionary *)self->_activeObservers removeAllObjects];
    updatedObservers = self->_updatedObservers;
    id v8 = updatedObservers;
    objc_storeStrong((id *)&self->_updatedObservers, self->_activeObservers);
    objc_storeStrong((id *)p_activeObservers, updatedObservers);
    self->_hasUpdatedObservers = 0;
    if (![(NSMutableDictionary *)self->_activeObservers count]) {
      [(TKDisplayLinkManager *)self _didRemoveLastObserver];
    }
  }
}

uint64_t __43__TKDisplayLinkManager__displayDidRefresh___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 displayDidRefresh:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObservers, 0);
  objc_storeStrong((id *)&self->_activeObservers, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end