@interface NIFindingNotifier
- (NIFindingNotifier)initWithParentSession:(id)a3;
- (void)notifyDiscoveredNearbyObjectWithToken:(id)a3 sharedConfigurationData:(id)a4;
- (void)notifyRemovedNearbyObjectWithToken:(id)a3;
- (void)notifyUpdatedHeadingForLocalDevice:(id)a3;
- (void)notifyUpdatedLocation:(id)a3 forNearbyObjectWithToken:(id)a4;
- (void)notifyUpdatedLocationForLocalDevice:(id)a3;
@end

@implementation NIFindingNotifier

- (NIFindingNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIFindingNotifier;
  v5 = [(NIFindingNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyDiscoveredNearbyObjectWithToken:(id)a3 sharedConfigurationData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"NISession.mm", 2502, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v24 = +[NSAssertionHandler currentHandler];
  [v24 handleFailureInMethod:a2, self, @"NISession.mm", 2503, @"Invalid parameter not satisfying: %@", @"configurationData" object file lineNumber description];

LABEL_3:
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v36[0] = @"FindingEventDictKey_EventType";
    v36[1] = @"FindingEventDictKey_ObjectDiscoveryToken";
    v37[0] = &off_1008789B8;
    v37[1] = v7;
    v36[2] = @"FindingEventDictKey_SharedConfigurationData";
    v37[2] = v9;
    v11 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    if (+[NIPlatformInfo isInternalBuild])
    {
      v12 = [WeakRetained getInternalLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [WeakRetained getInternalIdentifier];
        unsigned int v14 = [WeakRetained internalState] - 1;
        if (v14 > 7) {
          CFStringRef v15 = @"Activating";
        }
        else {
          CFStringRef v15 = off_10085F9D0[v14];
        }
        v17 = [v7 descriptionInternal];
        *(_DWORD *)buf = 138413058;
        id v29 = v13;
        __int16 v30 = 2112;
        CFStringRef v31 = v15;
        __int16 v32 = 2112;
        v33 = v17;
        __int16 v34 = 2112;
        v35 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client: notifyDiscoveredNearbyObject STARTED [%@]. State: %@. Token: %@. Data: %@", buf, 0x2Au);
      }
    }
    v18 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EFC6C;
    block[3] = &unk_100846588;
    id v19 = WeakRetained;
    id v26 = v19;
    id v20 = v11;
    id v27 = v20;
    dispatch_sync(v18, block);

    if (+[NIPlatformInfo isInternalBuild])
    {
      v21 = [v19 getInternalLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v19 getInternalIdentifier];
        *(_DWORD *)buf = 138412290;
        id v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Client: notifyDiscoveredNearbyObject FINISHED [%@]", buf, 0xCu);
      }
    }
  }
  else
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2507 description:@"Parent session is nil"];
  }
}

- (void)notifyRemovedNearbyObjectWithToken:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"NISession.mm", 2532, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v29[0] = @"FindingEventDictKey_EventType";
    v29[1] = @"FindingEventDictKey_ObjectDiscoveryToken";
    v30[0] = &off_1008789D0;
    v30[1] = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    if (+[NIPlatformInfo isInternalBuild])
    {
      id v8 = [WeakRetained getInternalLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [WeakRetained getInternalIdentifier];
        unsigned int v10 = [WeakRetained internalState] - 1;
        if (v10 > 7) {
          CFStringRef v11 = @"Activating";
        }
        else {
          CFStringRef v11 = off_10085F9D0[v10];
        }
        id v13 = [v5 descriptionInternal];
        *(_DWORD *)buf = 138412802;
        id v24 = v9;
        __int16 v25 = 2112;
        CFStringRef v26 = v11;
        __int16 v27 = 2112;
        v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client: notifyRemovedNearbyObject STARTED [%@]. State: %@. Token: %@", buf, 0x20u);
      }
    }
    unsigned int v14 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F00A8;
    block[3] = &unk_100846588;
    id v15 = WeakRetained;
    id v21 = v15;
    id v16 = v7;
    id v22 = v16;
    dispatch_sync(v14, block);

    if (+[NIPlatformInfo isInternalBuild])
    {
      v17 = [v15 getInternalLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v15 getInternalIdentifier];
        *(_DWORD *)buf = 138412290;
        id v24 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Client: notifyRemovedNearbyObject FINISHED [%@]", buf, 0xCu);
      }
    }
  }
  else
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2536 description:@"Parent session is nil"];
  }
}

- (void)notifyUpdatedLocationForLocalDevice:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    CFStringRef v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NISession.mm", 2559, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v15[0] = @"FindingEventDictKey_EventType";
    v15[1] = @"FindingEventDictKey_Location";
    v16[0] = &off_100878970;
    v16[1] = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    id v8 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F0348;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v7;
    id v9 = v7;
    dispatch_sync(v8, block);
  }
  else
  {
    unsigned int v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2563 description:@"Parent session is nil"];
  }
}

- (void)notifyUpdatedHeadingForLocalDevice:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    CFStringRef v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NISession.mm", 2576, @"Invalid parameter not satisfying: %@", @"heading" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v15[0] = @"FindingEventDictKey_EventType";
    v15[1] = @"FindingEventDictKey_Heading";
    v16[0] = &off_100878988;
    v16[1] = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    id v8 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F05E8;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v7;
    id v9 = v7;
    dispatch_sync(v8, block);
  }
  else
  {
    unsigned int v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2580 description:@"Parent session is nil"];
  }
}

- (void)notifyUpdatedLocation:(id)a3 forNearbyObjectWithToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NISession.mm", 2593, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = +[NSAssertionHandler currentHandler];
  [v16 handleFailureInMethod:a2, self, @"NISession.mm", 2594, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];

LABEL_3:
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v20[0] = @"FindingEventDictKey_EventType";
    v20[1] = @"FindingEventDictKey_ObjectDiscoveryToken";
    v21[0] = &off_1008789A0;
    v21[1] = v9;
    v20[2] = @"FindingEventDictKey_Location";
    v21[2] = v7;
    CFStringRef v11 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    v12 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F08FC;
    block[3] = &unk_100846588;
    id v18 = WeakRetained;
    id v19 = v11;
    id v13 = v11;
    dispatch_sync(v12, block);
  }
  else
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2598 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end