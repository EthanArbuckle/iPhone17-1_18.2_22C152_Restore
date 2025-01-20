@interface MTDBExtensionAccess
+ (id)sharedInstance;
- (BOOL)isReady;
- (MTDBExtensionAccess)init;
- (void)_handleChange;
- (void)_startObserving;
- (void)_stopObserving;
- (void)addObserver:(id)a3;
- (void)attemptToFix;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
@end

@implementation MTDBExtensionAccess

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __37__MTDBExtensionAccess_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MTDBExtensionAccess);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTDBExtensionAccess)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTDBExtensionAccess;
  v2 = [(MTDBExtensionAccess *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    [(MTDBExtensionAccess *)v2 _startObserving];
  }
  return v2;
}

- (void)dealloc
{
  [(MTDBExtensionAccess *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)MTDBExtensionAccess;
  [(MTDBExtensionAccess *)&v3 dealloc];
}

- (BOOL)isReady
{
  return +[MTDB canExtensionOpenDatabase];
}

- (void)attemptToFix
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_hasAttemptedToFix) {
    obj->_hasAttemptedToFix = 1;
  }
  objc_sync_exit(obj);
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)MTDBExtensionAccessContext == a6)
  {
    [(MTDBExtensionAccess *)self _handleChange];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MTDBExtensionAccess;
    -[MTDBExtensionAccess observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_startObserving
{
  objc_super v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_DEFAULT, "MTDBExtensionAccess will start observing", v7, 2u);
  }

  v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 addObserver:self forKeyPath:@"MTDetectedCorruptDB" options:0 context:MTDBExtensionAccessContext];

  id v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v5 addObserver:self forKeyPath:@"MTCoreDataMigrationVersion" options:0 context:MTDBExtensionAccessContext];

  objc_super v6 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v6 addObserver:self forKeyPath:@"MTLibraryMigrationVersion" options:0 context:MTDBExtensionAccessContext];
}

- (void)_stopObserving
{
  objc_super v3 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v3 removeObserver:self forKeyPath:@"MTDetectedCorruptDB" context:MTDBExtensionAccessContext];

  v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 removeObserver:self forKeyPath:@"MTCoreDataMigrationVersion" context:MTDBExtensionAccessContext];

  id v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v5 removeObserver:self forKeyPath:@"MTLibraryMigrationVersion" context:MTDBExtensionAccessContext];

  objc_super v6 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_DEFAULT, "MTDBExtensionAccess did stop observing", v7, 2u);
  }
}

- (void)_handleChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v16 = +[MTDB canExtensionOpenDatabase];
    _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_DEFAULT, "MTDBExtensionAccess extension access did change %x will notify observers", buf, 8u);
  }

  v4 = self->_observers;
  objc_sync_enter(v4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "extensionAccessDidChange", (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end