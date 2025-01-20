@interface STConcreteFamilyCirclePrimitives
- (STFamilyCirclePrimitivesDelegate)delegate;
- (int)familyChangedToken;
- (int)iCloudAccountChangedToken;
- (void)_delegateFetchedFamilyMembers;
- (void)_familyCircleChangedWithNotification:(id)a3;
- (void)_familyCircleDidChange;
- (void)_iCloudAccountDidChange;
- (void)_startObservingFamilyChangeNotificationsOnQueue:(id)a3;
- (void)_stopObservingFamilyChangeNotifications;
- (void)dealloc;
- (void)fetchFamilyMembersForcingCacheRefresh:(BOOL)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFamilyChangedToken:(int)a3;
- (void)setICloudAccountChangedToken:(int)a3;
- (void)startOnQueue:(id)a3;
@end

@implementation STConcreteFamilyCirclePrimitives

- (void)dealloc
{
  [(STConcreteFamilyCirclePrimitives *)self _stopObservingFamilyChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)STConcreteFamilyCirclePrimitives;
  [(STConcreteFamilyCirclePrimitives *)&v3 dealloc];
}

- (void)startOnQueue:(id)a3
{
}

- (void)_startObservingFamilyChangeNotificationsOnQueue:(id)a3
{
  v4 = a3;
  v5 = +[STLog familyMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v31 = "-[STConcreteFamilyCirclePrimitives _startObservingFamilyChangeNotificationsOnQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nObserving family change notifications.", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v6 = (const char *)[DMFiCloudAccountDidChangeDarwinNotification UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100016414;
  handler[3] = &unk_1002FB898;
  objc_copyWeak(&v28, &location);
  if (notify_register_dispatch(v6, &self->_iCloudAccountChangedToken, v4, handler))
  {
    v7 = +[STLog familyCirclePrimitives];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10025C0F0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = (const char *)[FAFamilyUpdateNotification UTF8String];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100016454;
  v25[3] = &unk_1002FB898;
  objc_copyWeak(&v26, &location);
  if (notify_register_dispatch(v15, &self->_familyChangedToken, v4, v25))
  {
    v16 = +[STLog familyCirclePrimitives];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10025C078(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  v24 = +[STLog familyMessaging];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v31 = "-[STConcreteFamilyCirclePrimitives _startObservingFamilyChangeNotificationsOnQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nExiting Family Change Notifications Queue", buf, 0xCu);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_stopObservingFamilyChangeNotifications
{
  objc_super v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136446210;
    uint64_t v22 = "-[STConcreteFamilyCirclePrimitives _stopObservingFamilyChangeNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", (uint8_t *)&v21, 0xCu);
  }

  if (notify_cancel(self->_iCloudAccountChangedToken))
  {
    v4 = +[STLog familyCirclePrimitives];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10025C1E0(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if (notify_cancel(self->_familyChangedToken))
  {
    uint64_t v12 = +[STLog familyCirclePrimitives];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10025C168(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  uint64_t v20 = +[STLog familyMessaging];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136446210;
    uint64_t v22 = "-[STConcreteFamilyCirclePrimitives _stopObservingFamilyChangeNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nexiting", (uint8_t *)&v21, 0xCu);
  }
}

- (void)_familyCircleChangedWithNotification:(id)a3
{
  v4 = +[STLog familyMessaging];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    uint64_t v6 = "-[STConcreteFamilyCirclePrimitives _familyCircleChangedWithNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nFamily cricle changed with notification.", (uint8_t *)&v5, 0xCu);
  }

  [(STConcreteFamilyCirclePrimitives *)self _familyCircleDidChange];
}

- (void)_familyCircleDidChange
{
  objc_super v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    int v5 = "-[STConcreteFamilyCirclePrimitives _familyCircleDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nFamily circle did change.", (uint8_t *)&v4, 0xCu);
  }

  [(STConcreteFamilyCirclePrimitives *)self _delegateFetchedFamilyMembers];
}

- (void)_iCloudAccountDidChange
{
  objc_super v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    int v5 = "-[STConcreteFamilyCirclePrimitives _iCloudAccountDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \niCloud account did change.", (uint8_t *)&v4, 0xCu);
  }

  [(STConcreteFamilyCirclePrimitives *)self _delegateFetchedFamilyMembers];
}

- (void)_delegateFetchedFamilyMembers
{
  objc_super v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v6 = "-[STConcreteFamilyCirclePrimitives _delegateFetchedFamilyMembers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nDelegate fetched family members.", buf, 0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016958;
  v4[3] = &unk_1002FB8C0;
  v4[4] = self;
  [(STConcreteFamilyCirclePrimitives *)self fetchFamilyMembersForcingCacheRefresh:0 completionHandler:v4];
}

- (void)fetchFamilyMembersForcingCacheRefresh:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = +[STLog familyMessaging];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "NO";
    if (v4) {
      uint64_t v7 = "YES";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = "-[STConcreteFamilyCirclePrimitives fetchFamilyMembersForcingCacheRefresh:completionHandler:]";
    __int16 v14 = 2082;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nforceCacheRefresh: %{public}s", buf, 0x16u);
  }

  uint64_t v8 = objc_opt_new();
  [v8 setCachePolicy:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100016BC4;
  v10[3] = &unk_1002FB8E8;
  id v11 = v5;
  id v9 = v5;
  [v8 startRequestWithCompletionHandler:v10];
}

- (STFamilyCirclePrimitivesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STFamilyCirclePrimitivesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)familyChangedToken
{
  return self->_familyChangedToken;
}

- (void)setFamilyChangedToken:(int)a3
{
  self->_familyChangedToken = a3;
}

- (int)iCloudAccountChangedToken
{
  return self->_iCloudAccountChangedToken;
}

- (void)setICloudAccountChangedToken:(int)a3
{
  self->_iCloudAccountChangedToken = a3;
}

- (void).cxx_destruct
{
}

@end