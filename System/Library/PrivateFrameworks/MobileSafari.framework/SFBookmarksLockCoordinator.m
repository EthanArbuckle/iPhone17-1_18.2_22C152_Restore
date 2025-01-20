@interface SFBookmarksLockCoordinator
+ (SFBookmarksLockCoordinator)sharedCoordinator;
+ (void)showLockedDatabaseAlertForAction:(int64_t)a3 fromViewController:(id)a4;
- (BOOL)hasBookmarksLock;
- (BOOL)lockBookmarks;
- (SFBookmarksLockCoordinator)init;
- (void)_clearBookmarkLockTimer;
- (void)_didBecomeActive;
- (void)_unlockBookmarksNow;
- (void)_willResignActive;
- (void)dealloc;
- (void)unlockBookmarksIfNeeded;
- (void)unlockBookmarksSoon;
@end

@implementation SFBookmarksLockCoordinator

+ (SFBookmarksLockCoordinator)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1) {
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedCoordinator_sharedInstance;

  return (SFBookmarksLockCoordinator *)v2;
}

void __47__SFBookmarksLockCoordinator_sharedCoordinator__block_invoke()
{
  v0 = objc_alloc_init(SFBookmarksLockCoordinator);
  v1 = (void *)sharedCoordinator_sharedInstance;
  sharedCoordinator_sharedInstance = (uint64_t)v0;
}

- (SFBookmarksLockCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFBookmarksLockCoordinator;
  v2 = [(SFBookmarksLockCoordinator *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__willResignActive name:*MEMORY[0x1E4FB2738] object:0];
    [v3 addObserver:v2 selector:sel__didBecomeActive name:*MEMORY[0x1E4FB2628] object:0];
    v2->_needsBookmarksLockOnAppResume = 0;
    v4 = v2;
  }
  return v2;
}

- (void)_willResignActive
{
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, v3, OS_LOG_TYPE_INFO, "Application will resign active, unlocking bookmarks if needed", v4, 2u);
  }
  self->_needsBookmarksLockOnAppResume = self->_haveBookmarksLock;
  [(SFBookmarksLockCoordinator *)self unlockBookmarksIfNeeded];
}

- (void)_didBecomeActive
{
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, v3, OS_LOG_TYPE_INFO, "Application did become active, locking bookmarks if needed", v4, 2u);
  }
  if (self->_needsBookmarksLockOnAppResume) {
    [(SFBookmarksLockCoordinator *)self lockBookmarks];
  }
  self->_needsBookmarksLockOnAppResume = 0;
}

- (BOOL)hasBookmarksLock
{
  return self->_haveBookmarksLock;
}

- (BOOL)lockBookmarks
{
  [(SFBookmarksLockCoordinator *)self _clearBookmarkLockTimer];
  if (self->_haveBookmarksLock) {
    return 1;
  }
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18C354000, v4, OS_LOG_TYPE_INFO, "Lock coordinator locking bookmarks", v5, 2u);
  }
  BOOL result = [MEMORY[0x1E4FB60E8] lockSync];
  self->_haveBookmarksLock = result;
  return result;
}

- (void)unlockBookmarksSoon
{
  v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__unlockBookmarksNow selector:0 userInfo:0 repeats:10.0];
  bookmarkLockTimer = self->_bookmarkLockTimer;
  self->_bookmarkLockTimer = v3;
}

- (void)unlockBookmarksIfNeeded
{
  if (self->_haveBookmarksLock) {
    [(SFBookmarksLockCoordinator *)self _unlockBookmarksNow];
  }
}

- (void)_unlockBookmarksNow
{
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C354000, v3, OS_LOG_TYPE_INFO, "Lock coordinator unlocking bookmarks", v4, 2u);
  }
  [(SFBookmarksLockCoordinator *)self _clearBookmarkLockTimer];
  [MEMORY[0x1E4FB60E8] unlockSync];
  self->_haveBookmarksLock = 0;
}

- (void)_clearBookmarkLockTimer
{
  [(NSTimer *)self->_bookmarkLockTimer invalidate];
  bookmarkLockTimer = self->_bookmarkLockTimer;
  self->_bookmarkLockTimer = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFBookmarksLockCoordinator;
  [(SFBookmarksLockCoordinator *)&v2 dealloc];
}

+ (void)showLockedDatabaseAlertForAction:(int64_t)a3 fromViewController:(id)a4
{
  id v15 = a4;
  if ((unint64_t)a3 > 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = _WBSLocalizedString();
  }
  objc_super v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v5 preferredStyle:1];
  v7 = (void *)MEMORY[0x1E4FB1410];
  v8 = _WBSLocalizedString();
  v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  v10 = [v15 view];
  v11 = [v10 window];

  v12 = (void *)*MEMORY[0x1E4FB2608];
  v13 = [v11 _eventRoutingScene];
  [v12 _cancelAllEventsOfType:3 onEventRoutingScene:v13];

  v14 = [v11 rootViewController];
  [v14 presentViewController:v6 animated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end