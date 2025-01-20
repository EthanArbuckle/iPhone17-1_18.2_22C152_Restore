@interface MapsARSessionManager
+ (MapsARSessionManager)sharedManager;
- (ARSession)session;
- (ARSessionDebugLogger)debugLogger;
- (MapsARSessionManager)init;
- (NSPointerArray)sessionOwners;
- (id)allSessionOwners;
- (id)currentSessionOwner;
- (void)requestSessionWithOwner:(id)a3;
- (void)resignSessionWithOwner:(id)a3;
- (void)setDebugLogger:(id)a3;
- (void)setSessionOwners:(id)a3;
@end

@implementation MapsARSessionManager

+ (MapsARSessionManager)sharedManager
{
  if (qword_1016105F8 != -1) {
    dispatch_once(&qword_1016105F8, &stru_101315560);
  }
  v2 = (void *)qword_1016105F0;

  return (MapsARSessionManager *)v2;
}

- (MapsARSessionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsARSessionManager;
  v2 = [(MapsARSessionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSPointerArray pointerArrayWithOptions:2];
    sessionOwners = v2->_sessionOwners;
    v2->_sessionOwners = (NSPointerArray *)v3;
  }
  return v2;
}

- (void)requestSessionWithOwner:(id)a3
{
  v4 = (char *)a3;
  v5 = sub_1000643CC();
  objc_super v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is requesting session ownership", (uint8_t *)&v13, 0xCu);
    }

    objc_super v6 = [(MapsARSessionManager *)self sessionOwners];
    objc_sync_enter(v6);
    v7 = [(MapsARSessionManager *)self sessionOwners];
    [v7 _maps_lastObject];
    v8 = (char *)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      v12 = sub_1000643CC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        v14 = v4;
        __int16 v15 = 2112;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Current session owner (%@) is equal to the requesting session owner (%@); ignoring",
          (uint8_t *)&v13,
          0x16u);
      }
    }
    else
    {
      v9 = [(MapsARSessionManager *)self sessionOwners];
      [v9 _maps_moveOrAddObjectToTop:v4];

      v10 = sub_1000643CC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        v14 = v8;
        __int16 v15 = 2112;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Session ownership transitioned from %@ to %@", (uint8_t *)&v13, 0x16u);
      }

      v11 = [(MapsARSessionManager *)self session];
      [v8 sessionManager:self didResignSessionOwnership:v11];

      v12 = [(MapsARSessionManager *)self session];
      [v4 sessionManager:self didGainSessionOwnership:v12];
    }

    objc_sync_exit(v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    v14 = "-[MapsARSessionManager requestSessionWithOwner:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s cannot be called with a nil owner", (uint8_t *)&v13, 0xCu);
  }
}

- (ARSession)session
{
  session = self->_session;
  if (!session)
  {
    v4 = (ARSession *)objc_alloc_init((Class)ARSession);
    v5 = self->_session;
    self->_session = v4;

    objc_super v6 = [[ARSessionDebugLogger alloc] initWithSession:self->_session];
    debugLogger = self->_debugLogger;
    self->_debugLogger = v6;

    session = self->_session;
  }

  return session;
}

- (NSPointerArray)sessionOwners
{
  return self->_sessionOwners;
}

- (void)resignSessionWithOwner:(id)a3
{
  v4 = a3;
  v5 = sub_1000643CC();
  objc_super v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is resigning session ownership", (uint8_t *)&v18, 0xCu);
    }

    objc_super v6 = [(MapsARSessionManager *)self sessionOwners];
    objc_sync_enter(v6);
    v7 = [(MapsARSessionManager *)self sessionOwners];
    unsigned __int8 v8 = [v7 _maps_containsObject:v4];

    if (v8)
    {
      v9 = [(MapsARSessionManager *)self sessionOwners];
      v10 = [v9 _maps_lastObject];

      v11 = [(MapsARSessionManager *)self sessionOwners];
      [v11 _maps_removeObject:v4];

      v12 = [(MapsARSessionManager *)self sessionOwners];
      int v13 = [v12 _maps_lastObject];

      v14 = sub_1000643CC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        v19 = (const char *)v10;
        __int16 v20 = 2112;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session ownership transitioned from %@ to %@", (uint8_t *)&v18, 0x16u);
      }

      if (v10 == v4)
      {
        __int16 v15 = [(MapsARSessionManager *)self session];
        [v4 sessionManager:self didResignSessionOwnership:v15];
      }
      if (v13 != v10)
      {
        v16 = [(MapsARSessionManager *)self session];
        [v13 sessionManager:self didGainSessionOwnership:v16];
      }
      if (!v13)
      {
        v17 = [(MapsARSessionManager *)self session];
        [v17 pause];
      }
    }
    else
    {
      v10 = sub_1000643CC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = (const char *)v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resigning session owner (%@) isn't part of the current session owners; ignoring",
          (uint8_t *)&v18,
          0xCu);
      }
    }

    objc_sync_exit(v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    v19 = "-[MapsARSessionManager resignSessionWithOwner:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s cannot be called with a nil owner", (uint8_t *)&v18, 0xCu);
  }
}

- (id)allSessionOwners
{
  uint64_t v3 = [(MapsARSessionManager *)self sessionOwners];
  objc_sync_enter(v3);
  v4 = +[NSMutableArray array];
  for (unint64_t i = 0; ; ++i)
  {
    objc_super v6 = [(MapsARSessionManager *)self sessionOwners];
    id v7 = [v6 count];

    if (i >= (unint64_t)v7) {
      break;
    }
    unsigned __int8 v8 = [(MapsARSessionManager *)self sessionOwners];
    objc_initWeak(&location, [v8 pointerAtIndex:i]);

    id v9 = objc_loadWeakRetained(&location);
    if (v9) {
      [v4 addObject:v9];
    }

    objc_destroyWeak(&location);
  }
  id v10 = [v4 copy];

  objc_sync_exit(v3);

  return v10;
}

- (id)currentSessionOwner
{
  uint64_t v3 = [(MapsARSessionManager *)self sessionOwners];
  objc_sync_enter(v3);
  v4 = [(MapsARSessionManager *)self sessionOwners];
  v5 = [v4 _maps_lastObject];

  objc_sync_exit(v3);

  return v5;
}

- (void)setSessionOwners:(id)a3
{
}

- (ARSessionDebugLogger)debugLogger
{
  return self->_debugLogger;
}

- (void)setDebugLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLogger, 0);
  objc_storeStrong((id *)&self->_sessionOwners, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end