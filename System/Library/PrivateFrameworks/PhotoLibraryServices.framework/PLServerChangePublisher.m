@interface PLServerChangePublisher
- (PLServerChangePublisher)init;
- (id)publishChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5;
- (void)_postChangeHubNotification;
- (void)_postWatchUpdateNotification;
- (void)_postWatchUpdateNotificationIfNotPaused;
- (void)_postWatchUpdateNotificationIfPending;
- (void)dealloc;
- (void)distributeChangeEvent:(id)a3 transaction:(id)a4;
- (void)pauseLaunchEventNotifications;
- (void)unpauseLaunchEventNotifications;
@end

@implementation PLServerChangePublisher

- (void)pauseLaunchEventNotifications
{
  v3 = PLChangeHandlingGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_EVENT, v4, "Pause WatchUpdate notifications", "", buf, 2u);
  }

  v7 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Pause WatchUpdate notifications", v8, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_suppressWatchNotification);
}

- (void)unpauseLaunchEventNotifications
{
  v3 = PLChangeHandlingGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_EVENT, v4, "Unpause WatchUpdate notifications", "", buf, 2u);
  }

  v7 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Unpause WatchUpdate notifications", v8, 2u);
  }

  atomic_store(0, (unsigned __int8 *)&self->_suppressWatchNotification);
  [(PLServerChangePublisher *)self _postWatchUpdateNotificationIfPending];
}

- (void)_postWatchUpdateNotification
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = atomic_load((unint64_t *)&self->_postCount);
  v3 = PLChangeHandlingGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = v2;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_EVENT, v4, "Post WatchUpdate notification", "post count: %lld", buf, 0xCu);
  }

  uint64_t v7 = pl_notify_post_with_retry();
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"-[PLServerChangePublisher _postWatchUpdateNotification]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PLServerChangePublisher.m", 112, @"-[PLServerChangePublisher _postWatchUpdateNotification]: notify_post() failed: (%d)", v8);
  }
}

- (void)_postWatchUpdateNotificationIfPending
{
  p_hasPendingWatchNotification = &self->_hasPendingWatchNotification;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_hasPendingWatchNotification);
  if (v3)
  {
    [(PLServerChangePublisher *)self _postWatchUpdateNotification];
    atomic_store(0, (unsigned __int8 *)p_hasPendingWatchNotification);
  }
}

- (void)_postWatchUpdateNotificationIfNotPaused
{
  p_hasPendingWatchNotification = &self->_hasPendingWatchNotification;
  atomic_store(1u, (unsigned __int8 *)&self->_hasPendingWatchNotification);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_suppressWatchNotification);
  if ((v3 & 1) == 0)
  {
    [(PLServerChangePublisher *)self _postWatchUpdateNotification];
    atomic_store(0, (unsigned __int8 *)p_hasPendingWatchNotification);
  }
}

- (void)_postChangeHubNotification
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  atomic_fetch_add(&self->_postCount, 1uLL);
  unint64_t v2 = atomic_load((unint64_t *)&self->_postCount);
  unsigned __int8 v3 = PLChangeHandlingGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = v2;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_EVENT, v4, "Post ChangeHub notification", "post count: %lld", buf, 0xCu);
  }

  qos_class_self();
  uint64_t v7 = pl_notify_post_with_retry();
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"-[PLServerChangePublisher _postChangeHubNotification]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PLServerChangePublisher.m", 84, @"-[PLServerChangePublisher _postChangeHubNotification]: notify_post() failed: (%d)", v8);
  }
}

- (void)distributeChangeEvent:(id)a3 transaction:(id)a4
{
  xpc_object_t xdict = a3;
  id v7 = a4;
  uint64_t v8 = xdict;
  if (!xdict)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLServerChangePublisher.m", 60, @"Invalid parameter not satisfying: %@", @"event != NULL" object file lineNumber description];

    uint64_t v8 = 0;
  }
  if (xpc_dictionary_get_uint64(v8, "eventKind") != 1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLServerChangePublisher.m" lineNumber:64 description:@"Trying to distribute an invalid event."];
  }
  if (!+[PLLegacyChangeEvent isEmptyEvent:xdict])
  {
    [(PLServerChangePublisher *)self _postChangeHubNotification];
    [(PLServerChangePublisher *)self _postWatchUpdateNotificationIfNotPaused];
  }
}

- (id)publishChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v8 transactionToken];
  if (v9)
  {
    id v10 = v8;
    v11 = [v10 changeScopes];
    unint64_t v12 = [v10 pathManager];

    +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v9, v11, v12, "-[PLServerChangePublisher publishChangeEvent:delayedSaveActionsDetail:transaction:]");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    [v10 completeTransaction];
  }
  [(PLServerChangePublisher *)self distributeChangeEvent:v7 transaction:v8];

  return v8;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLServerChangePublisher;
  [(PLServerChangePublisher *)&v4 dealloc];
}

- (PLServerChangePublisher)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PLServerChangePublisher;
  unint64_t v2 = [(PLServerChangePublisher *)&v6 init];
  unsigned __int8 v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    id v10 = v2;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p init", buf, 0x16u);
  }

  return v2;
}

@end