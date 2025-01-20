@interface W5PeerDatabaseListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5DatabaseManager)databaseManager;
- (W5PeerDatabaseListener)initWithDatabaseAccessManager:(id)a3;
- (int64_t)currentVersion;
- (void)setDatabaseManager:(id)a3;
@end

@implementation W5PeerDatabaseListener

- (W5PeerDatabaseListener)initWithDatabaseAccessManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerDatabaseListener;
  v6 = [(W5PeerDatabaseListener *)&v10 init];
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_databaseManager, a3), !v7->_databaseManager))
  {

    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 version];
    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315906;
      v20 = "-[W5PeerDatabaseListener handleClientRequest:]";
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      LODWORD(v18) = 42;
      v17 = &v19;
      _os_log_send_and_compose_impl();
    }

    v9 = objc_alloc_init(W5PeerDatabaseResponsePayload);
    objc_super v10 = +[NSNumber numberWithInteger:[(W5PeerDatabaseListener *)self currentVersion]];
    [(W5PeerDatabaseResponsePayload *)v9 setVersion:v10];

    [(W5PeerDatabaseResponsePayload *)v9 setStatus:1];
    if ([v7 integerValue] == (id)1 || objc_msgSend(v7, "integerValue") == (id)2)
    {
      v11 = [v6 fetchRequest:v17, v18];

      if (v11)
      {
        databaseManager = self->_databaseManager;
        v13 = [v6 fetchRequest];
        v14 = [(W5DatabaseManager *)databaseManager performFetch:v13];
        [(W5PeerDatabaseResponsePayload *)v9 setFetchedResults:v14];

LABEL_13:
        v15 = [v4 handler];
        ((void (**)(void, W5PeerDatabaseResponsePayload *, void))v15)[2](v15, v9, 0);

        goto LABEL_14;
      }
      v13 = sub_10009756C();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v19 = 136315394;
      v20 = "-[W5PeerDatabaseListener handleClientRequest:]";
      __int16 v21 = 2112;
      id v22 = v4;
    }
    else
    {
      v13 = sub_10009756C();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v19 = 136315394;
      v20 = "-[W5PeerDatabaseListener handleClientRequest:]";
      __int16 v21 = 2112;
      id v22 = v7;
    }
    _os_log_send_and_compose_impl();
    goto LABEL_13;
  }
LABEL_14:

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.dbQuery";
}

- (int64_t)currentVersion
{
  return 2;
}

- (W5DatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end