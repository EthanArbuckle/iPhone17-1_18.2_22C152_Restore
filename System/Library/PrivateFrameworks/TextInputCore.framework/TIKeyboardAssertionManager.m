@interface TIKeyboardAssertionManager
+ (id)sharedAssertionManager;
+ (id)singletonInstance;
+ (void)setSharedAssertionManager:(id)a3;
- (BOOL)hasAssertions;
- (BOOL)hasBackgroundActivityAssertions;
- (BOOL)pendingUpdate;
- (NSHashTable)assertions;
- (TIKeyboardAssertionManager)init;
- (TIKeyboardAssertionManagerDelegate)delegate;
- (int64_t)backgroundActivityAssertions;
- (void)addAssertionForObject:(id)a3;
- (void)performBackgroundActivityUpdate;
- (void)performUpdate;
- (void)releaseBackgroundActivityAssertion;
- (void)removeAssertionForObject:(id)a3;
- (void)retainBackgroundActivityAssertion;
- (void)scheduleUpdate;
- (void)setBackgroundActivityAssertions:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAssertions:(BOOL)a3;
- (void)setHasBackgroundActivityAssertions:(BOOL)a3;
- (void)setPendingUpdate:(BOOL)a3;
@end

@implementation TIKeyboardAssertionManager

- (void).cxx_destruct
{
}

- (void)setBackgroundActivityAssertions:(int64_t)a3
{
  self->_backgroundActivityAssertions = a3;
}

- (int64_t)backgroundActivityAssertions
{
  return self->_backgroundActivityAssertions;
}

- (void)setHasBackgroundActivityAssertions:(BOOL)a3
{
  self->_hasBackgroundActivityAssertions = a3;
}

- (BOOL)hasBackgroundActivityAssertions
{
  return self->_hasBackgroundActivityAssertions;
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setPendingUpdate:(BOOL)a3
{
  self->_pendingUpdate = a3;
}

- (BOOL)pendingUpdate
{
  return self->_pendingUpdate;
}

- (void)setHasAssertions:(BOOL)a3
{
  self->_hasAssertions = a3;
}

- (BOOL)hasAssertions
{
  return self->_hasAssertions;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TIKeyboardAssertionManagerDelegate *)a3;
}

- (TIKeyboardAssertionManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)releaseBackgroundActivityAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if ([(TIKeyboardAssertionManager *)self backgroundActivityAssertions] >= 1) {
      [(TIKeyboardAssertionManager *)self setBackgroundActivityAssertions:[(TIKeyboardAssertionManager *)self backgroundActivityAssertions] - 1];
    }
    [(TIKeyboardAssertionManager *)self performBackgroundActivityUpdate];
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v4 = TIOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s decrement background activity assertions (count=%ld)", "-[TIKeyboardAssertionManager releaseBackgroundActivityAssertion]", -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions"));
        *(_DWORD *)buf = 138412290;
        v7 = v5;
        _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(TIKeyboardAssertionManager *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)retainBackgroundActivityAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(TIKeyboardAssertionManager *)self setBackgroundActivityAssertions:[(TIKeyboardAssertionManager *)self backgroundActivityAssertions] + 1];
    [(TIKeyboardAssertionManager *)self performBackgroundActivityUpdate];
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v4 = TIOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s increment background activity assertions (count=%ld)", "-[TIKeyboardAssertionManager retainBackgroundActivityAssertion]", -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions"));
        *(_DWORD *)buf = 138412290;
        v7 = v5;
        _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(TIKeyboardAssertionManager *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:1];
  }
}

- (void)removeAssertionForObject:(id)a3
{
  id v4 = a3;
  v5 = [(TIKeyboardAssertionManager *)self assertions];
  [v5 removeObject:v4];

  [(TIKeyboardAssertionManager *)self scheduleUpdate];
}

- (void)addAssertionForObject:(id)a3
{
  id v4 = a3;
  v5 = [(TIKeyboardAssertionManager *)self assertions];
  [v5 addObject:v4];

  [(TIKeyboardAssertionManager *)self scheduleUpdate];
}

- (void)performBackgroundActivityUpdate
{
  int64_t v3 = [(TIKeyboardAssertionManager *)self backgroundActivityAssertions];
  if ([(TIKeyboardAssertionManager *)self hasBackgroundActivityAssertions] != v3 > 0)
  {
    [(TIKeyboardAssertionManager *)self setHasBackgroundActivityAssertions:v3 > 0];
    id v4 = [(TIKeyboardAssertionManager *)self delegate];
    [v4 backgroundActivityAssertionsDidChange];
  }
}

- (void)performUpdate
{
  [(TIKeyboardAssertionManager *)self setPendingUpdate:0];
  int64_t v3 = [(TIKeyboardAssertionManager *)self assertions];
  uint64_t v4 = [v3 count];

  if ((v4 != 0) != [(TIKeyboardAssertionManager *)self hasAssertions])
  {
    [(TIKeyboardAssertionManager *)self setHasAssertions:v4 != 0];
    id v5 = [(TIKeyboardAssertionManager *)self delegate];
    [v5 keyboardAssertionsDidChange];
  }
}

- (void)scheduleUpdate
{
  if (![(TIKeyboardAssertionManager *)self pendingUpdate])
  {
    [(TIKeyboardAssertionManager *)self setPendingUpdate:1];
    [(TIKeyboardAssertionManager *)self performSelectorOnMainThread:sel_performUpdate withObject:0 waitUntilDone:0];
  }
}

- (TIKeyboardAssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardAssertionManager;
  v2 = [(TIKeyboardAssertionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;
  }
  return v2;
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_21548 != -1) {
    dispatch_once(&singletonInstance_onceToken_21548, &__block_literal_global_21549);
  }
  v2 = (void *)singletonInstance_singletonInstance_21550;

  return v2;
}

uint64_t __47__TIKeyboardAssertionManager_singletonInstance__block_invoke()
{
  v0 = objc_alloc_init(TIKeyboardAssertionManager);
  uint64_t v1 = singletonInstance_singletonInstance_21550;
  singletonInstance_singletonInstance_21550 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedAssertionManager
{
  if (__testingInstance_21553)
  {
    id v2 = (id)__testingInstance_21553;
  }
  else
  {
    id v2 = +[TIKeyboardAssertionManager singletonInstance];
  }

  return v2;
}

+ (void)setSharedAssertionManager:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance_21553 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance_21553, a3);
    id v4 = v5;
  }
}

@end