@interface SharedTripSceneAwareSubscription
- (BOOL)_isActive;
- (SharedTripSceneAwareSubscription)initWithTripIdentifier:(id)a3 scene:(id)a4;
- (void)_setIsActive:(BOOL)a3;
- (void)_subscribeIfNecessary:(id)a3;
- (void)_unsubscribeIfNecessary:(id)a3;
- (void)_updateForSceneState:(int64_t)a3;
@end

@implementation SharedTripSceneAwareSubscription

- (SharedTripSceneAwareSubscription)initWithTripIdentifier:(id)a3 scene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SharedTripSceneAwareSubscription;
  v8 = [(SharedTripSceneAwareSubscription *)&v21 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    tripIdentifier = v8->_tripIdentifier;
    v8->_tripIdentifier = v9;

    id v11 = objc_storeWeak((id *)&v8->_scene, v7);
    -[SharedTripSceneAwareSubscription _updateForSceneState:](v8, "_updateForSceneState:", [v7 activationState]);

    v12 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_scene);
    [v12 addObserver:v8 selector:"_unsubscribeIfNecessary:" name:UISceneWillDeactivateNotification object:WeakRetained];

    v14 = +[NSNotificationCenter defaultCenter];
    id v15 = objc_loadWeakRetained((id *)&v8->_scene);
    [v14 addObserver:v8 selector:"_unsubscribeIfNecessary:" name:UISceneDidEnterBackgroundNotification object:v15];

    v16 = +[NSNotificationCenter defaultCenter];
    id v17 = objc_loadWeakRetained((id *)&v8->_scene);
    [v16 addObserver:v8 selector:"_subscribeIfNecessary:" name:UISceneDidActivateNotification object:v17];

    v18 = +[NSNotificationCenter defaultCenter];
    id v19 = objc_loadWeakRetained((id *)&v8->_scene);
    [v18 addObserver:v8 selector:"_subscribeIfNecessary:" name:UISceneWillEnterForegroundNotification object:v19];
  }
  return v8;
}

- (void)_unsubscribeIfNecessary:(id)a3
{
  id v4 = a3;
  v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(SharedTripSceneAwareSubscription *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    v12 = [v4 name];
    v13 = [v4 object];
    *(_DWORD *)buf = 138543874;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v12;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Scene deactivating with %{public}@: %{public}@", buf, 0x20u);
  }
  [(SharedTripSceneAwareSubscription *)self _updateForSceneState:2];
}

- (void)_subscribeIfNecessary:(id)a3
{
  id v4 = a3;
  v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(SharedTripSceneAwareSubscription *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    v12 = [v4 name];
    v13 = [v4 object];
    *(_DWORD *)buf = 138543874;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v12;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Scene activating with %{public}@: %{public}@", buf, 0x20u);
  }
  [(SharedTripSceneAwareSubscription *)self _updateForSceneState:0];
}

- (void)_updateForSceneState:(int64_t)a3
{
  v5 = sub_100576A9C();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_17;
  }
  id v6 = self;
  if (!v6)
  {
    id v11 = @"<nil>";
    goto LABEL_10;
  }
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    v9 = [(SharedTripSceneAwareSubscription *)v6 performSelector:"accessibilityIdentifier"];
    v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  if ((unint64_t)a3 >= 2) {
    v12 = "inactive";
  }
  else {
    v12 = "active";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
  v14 = WeakRetained;
  if ((unint64_t)(a3 + 1) > 3) {
    CFStringRef v15 = @"unknown";
  }
  else {
    CFStringRef v15 = *(&off_10131C1D8 + a3 + 1);
  }
  *(_DWORD *)buf = 138544130;
  id v17 = v11;
  __int16 v18 = 2080;
  id v19 = v12;
  __int16 v20 = 2114;
  id v21 = WeakRetained;
  __int16 v22 = 2114;
  CFStringRef v23 = v15;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Will set %s for scene state %{public}@: %{public}@", buf, 0x2Au);

LABEL_17:
  [(SharedTripSceneAwareSubscription *)self _setIsActive:(unint64_t)a3 < 2];
}

- (void)_setIsActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3) {
      goto LABEL_15;
    }
    if (self->_tripIdentifier)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

      if (WeakRetained)
      {
        if (self->_active)
        {
          if (self->_token) {
            return;
          }
          v5 = sub_100576A9C();
          if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
            goto LABEL_14;
          }
          id v6 = self;
          id v7 = (objc_class *)objc_opt_class();
          v8 = NSStringFromClass(v7);
          if (objc_opt_respondsToSelector())
          {
            v9 = [(SharedTripSceneAwareSubscription *)v6 performSelector:"accessibilityIdentifier"];
            v10 = v9;
            if (v9 && ![v9 isEqualToString:v8])
            {
              id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

              goto LABEL_13;
            }
          }
          id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_13:

          tripIdentifier = self->_tripIdentifier;
          *(_DWORD *)buf = 138543618;
          id v42 = v11;
          __int16 v43 = 2114;
          v44 = tripIdentifier;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Acquiring token for trip %{public}@", buf, 0x16u);

LABEL_14:
          v13 = self->_tripIdentifier;
          objc_initWeak((id *)buf, self);
          v14 = +[MSPSharedTripService sharedInstance];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100C3FCC4;
          v38[3] = &unk_1012E9810;
          objc_copyWeak(&v40, (id *)buf);
          token = v13;
          v39 = token;
          [v14 subscribeToSharedTripUpdatesWithIdentifier:token completion:v38];

          objc_destroyWeak(&v40);
          objc_destroyWeak((id *)buf);
LABEL_39:

          return;
        }
LABEL_15:
        if (!self->_token) {
          return;
        }
        __int16 v16 = sub_100576A9C();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        id v17 = self;
        __int16 v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        if (objc_opt_respondsToSelector())
        {
          __int16 v20 = [(SharedTripSceneAwareSubscription *)v17 performSelector:"accessibilityIdentifier"];
          id v21 = v20;
          if (v20 && ![v20 isEqualToString:v19])
          {
            __int16 v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

            goto LABEL_22;
          }
        }
        __int16 v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_22:

        CFStringRef v23 = v17->_tripIdentifier;
        *(_DWORD *)buf = 138543618;
        id v42 = v22;
        __int16 v43 = 2114;
        v44 = v23;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Removing token for trip %{public}@", buf, 0x16u);

LABEL_23:
        token = self->_token;
        self->_token = 0;
        goto LABEL_39;
      }
    }
    token = sub_100576A9C();
    if (!os_log_type_enabled(token, OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    v24 = self;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    if (objc_opt_respondsToSelector())
    {
      v27 = [(SharedTripSceneAwareSubscription *)v24 performSelector:"accessibilityIdentifier"];
      v28 = v27;
      if (v27 && ![v27 isEqualToString:v26])
      {
        v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

LABEL_30:
        id v30 = v29;
        v31 = self->_tripIdentifier;
        id v32 = objc_loadWeakRetained((id *)&v24->_scene);
        if (!v32)
        {
          v37 = @"<nil>";
          goto LABEL_38;
        }
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        if (objc_opt_respondsToSelector())
        {
          v35 = [v32 performSelector:"accessibilityIdentifier"];
          v36 = v35;
          if (v35 && ![v35 isEqualToString:v34])
          {
            v37 = +[NSString stringWithFormat:@"%@<%p, %@>", v34, v32, v36];

            goto LABEL_36;
          }
        }
        v37 = +[NSString stringWithFormat:@"%@<%p>", v34, v32];
LABEL_36:

LABEL_38:
        *(_DWORD *)buf = 138543874;
        id v42 = v30;
        __int16 v43 = 2114;
        v44 = v31;
        __int16 v45 = 2114;
        v46 = v37;
        _os_log_impl((void *)&_mh_execute_header, token, OS_LOG_TYPE_FAULT, "[%{public}@] Cannot activate because no trip ID %{public}@ or scene %{public}@", buf, 0x20u);

        goto LABEL_39;
      }
    }
    v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
    goto LABEL_30;
  }
}

- (BOOL)_isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_destroyWeak((id *)&self->_scene);

  objc_storeStrong((id *)&self->_tripIdentifier, 0);
}

@end