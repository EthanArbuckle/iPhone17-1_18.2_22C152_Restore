@interface MRDLockScreenContentController
- (BOOL)isQuerying;
- (BOOL)lockScreenPlatterHasContent;
- (BOOL)shouldConsiderSuggestions;
- (MRDLockScreenContentController)init;
- (MRDLockScreenContentControllerDelegate)delegate;
- (MRMediaSuggestionPreferences)suggestionPreferences;
- (OS_dispatch_queue)queryQueue;
- (int64_t)suggestionCount;
- (os_unfair_lock_s)lock;
- (void)_handlePlaybackQueueChangedNotification:(id)a3;
- (void)_notifyDelegate;
- (void)_updateSuggestionCountIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setIsQuerying:(BOOL)a3;
- (void)setShouldConsiderSuggestions:(BOOL)a3;
- (void)setSuggestionCount:(int64_t)a3;
- (void)setSuggestionPreferences:(id)a3;
@end

@implementation MRDLockScreenContentController

- (MRDLockScreenContentController)init
{
  v17.receiver = self;
  v17.super_class = (Class)MRDLockScreenContentController;
  v2 = [(MRDLockScreenContentController *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_shouldConsiderSuggestions = 0;
    v2->_suggestionCount = 0;
    v4 = (MRMediaSuggestionPreferences *)objc_alloc_init((Class)MRMediaSuggestionPreferences);
    suggestionPreferences = v3->_suggestionPreferences;
    v3->_suggestionPreferences = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaRemote.MRDLockScreenContentController.queryQueue", v6);
    queryQueue = v3->_queryQueue;
    v3->_queryQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v3);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100162634;
    v14 = &unk_1004171D0;
    objc_copyWeak(&v15, &location);
    [(MRMediaSuggestionPreferences *)v3->_suggestionPreferences setUserDisplayPreferencesDidChangeCallback:&v11];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"_handlePlaybackQueueChangedNotification:" name:kMRPlayerPlaybackQueueChangedNotification object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_updateSuggestionCountIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v4 = [(MRDLockScreenContentController *)self shouldConsiderSuggestions];
  unsigned int v5 = [(MRDLockScreenContentController *)self isQuerying];
  v6 = [(MRDLockScreenContentController *)self suggestionPreferences];
  unsigned int v7 = [v6 suggestionsDisabledInContext:MRSuggestionContextHomeScreen];

  if (v7)
  {
    uint64_t v8 = [(MRDLockScreenContentController *)self suggestionCount];
    if (v8 >= 1) {
      [(MRDLockScreenContentController *)self setSuggestionCount:0];
    }
    os_unfair_lock_unlock(p_lock);
    if (((v4 ^ 1 | v5) & 1) == 0 && v8 >= 1)
    {
      [(MRDLockScreenContentController *)self _notifyDelegate];
    }
  }
  else if ((v4 ^ 1 | v5) == 1)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(MRDLockScreenContentController *)self setIsQuerying:1];
    os_unfair_lock_unlock(p_lock);
    v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100331634(v9);
    }

    dispatch_time_t v10 = dispatch_time(0, 60000000000);
    v11 = [(MRDLockScreenContentController *)self queryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100162864;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_after(v10, v11, block);
  }
}

- (void)_notifyDelegate
{
  v3 = [(MRDLockScreenContentController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MRDLockScreenContentController *)self delegate];
    [v5 lockScreenContentControllerStateDidChange:self];
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  char v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];

  if ([(MRDLockScreenContentController *)self suggestionCount] <= 3)
  {
    id v5 = [v7 origin];
    unsigned int v6 = [v5 isLocal];

    if (v6) {
      [(MRDLockScreenContentController *)self _updateSuggestionCountIfNeeded];
    }
  }
}

- (BOOL)lockScreenPlatterHasContent
{
  v3 = +[MRDMediaRemoteServer server];
  char v4 = [v3 nowPlayingServer];
  id v5 = [v4 localActivePlayerClient];
  unsigned int v6 = [v5 playbackQueue];
  id v7 = [v6 contentItemWithOffset:0];

  if (v7) {
    return 1;
  }
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v9 = [(MRDLockScreenContentController *)self shouldConsiderSuggestions];
  if ((v9 & 1) == 0) {
    [(MRDLockScreenContentController *)self setShouldConsiderSuggestions:1];
  }
  int64_t v10 = [(MRDLockScreenContentController *)self suggestionCount];
  os_unfair_lock_unlock(&self->_lock);
  if (v9) {
    return v10 > 3;
  }
  [(MRDLockScreenContentController *)self _updateSuggestionCountIfNeeded];
  return 0;
}

- (MRDLockScreenContentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDLockScreenContentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRMediaSuggestionPreferences)suggestionPreferences
{
  return self->_suggestionPreferences;
}

- (void)setSuggestionPreferences:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)shouldConsiderSuggestions
{
  return self->_shouldConsiderSuggestions;
}

- (void)setShouldConsiderSuggestions:(BOOL)a3
{
  self->_shouldConsiderSuggestions = a3;
}

- (BOOL)isQuerying
{
  return self->_isQuerying;
}

- (void)setIsQuerying:(BOOL)a3
{
  self->_isQuerying = a3;
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (int64_t)suggestionCount
{
  return self->_suggestionCount;
}

- (void)setSuggestionCount:(int64_t)a3
{
  self->_suggestionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_suggestionPreferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end