@interface RMStoreClient
- (NSString)storeIdentifier;
- (RMActivationEngine)activationEngine;
- (RMStatusEngine)statusEngine;
- (RMStoreClient)initWithActivationEngine:(id)a3 statusEngine:(id)a4 storeIdentifier:(id)a5;
- (RMStoreClient)initWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6;
- (void)_sendStatusData:(id)a3;
- (void)_sendStatusOnlyIfNeeded:(BOOL)a3;
- (void)create;
- (void)remove;
- (void)setActivationEngine:(id)a3;
- (void)setStatusEngine:(id)a3;
- (void)start;
- (void)statusEngineHasUnacknowledgedSubscription:(id)a3;
- (void)syncWithCompletionHandler:(id)a3;
@end

@implementation RMStoreClient

- (RMStoreClient)initWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 newBackgroundContext];
  [v14 setAutomaticallyMergesChangesFromParent:1];
  v15 = +[NSString stringWithFormat:@"%@/%@", @"conduit", v10];
  [v14 setTransactionAuthor:v15];

  id v16 = v10;
  id v17 = [v11 newBackgroundContext];
  [v17 setAutomaticallyMergesChangesFromParent:1];
  v18 = +[NSString stringWithFormat:@"%@/%@", @"engine", v16];

  [v17 setTransactionAuthor:v18];
  v19 = [[RMActivationEngine alloc] initWithManagementSourceObjectID:v13 context:v17];
  v20 = [[RMStatusEngine alloc] initWithManagementSourceObjectID:v13 statusQuerier:v12 inContext:v14];

  v21 = [(RMStoreClient *)self initWithActivationEngine:v19 statusEngine:v20 storeIdentifier:v16];
  return v21;
}

- (RMStoreClient)initWithActivationEngine:(id)a3 statusEngine:(id)a4 storeIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RMStoreClient;
  id v12 = [(RMStoreClient *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activationEngine, a3);
    objc_storeStrong((id *)&v13->_statusEngine, a4);
    objc_storeStrong((id *)&v13->_storeIdentifier, a5);
  }

  return v13;
}

- (void)start
{
  v3 = [(RMStoreClient *)self statusEngine];
  [v3 setDelegate:self];

  v4 = [(RMStoreClient *)self statusEngine];
  [v4 start];

  [(RMStoreClient *)self _sendStatusOnlyIfNeeded:1];
  id v5 = [(RMStoreClient *)self activationEngine];
  [v5 syncWithCompletionHandler:&stru_1000C6B30];
}

- (void)create
{
  v3 = [(RMStoreClient *)self statusEngine];
  v9[0] = RMModelStatusItemManagementClientCapabilities;
  v9[1] = RMModelStatusItemManagementDeclarations;
  v4 = +[NSArray arrayWithObjects:v9 count:2];
  id v5 = +[NSSet setWithArray:v4];
  [v3 implicitlySubscribeToStatusKeyPaths:v5];

  v6 = [(RMStoreClient *)self statusEngine];
  v7 = [v6 queryForUnacknowledgedStatusSubscriptions];

  v8 = [(RMStoreClient *)self statusEngine];
  [v8 acknowledgeStatusSubscriptions:v7];
}

- (void)remove
{
  id v2 = [(RMStoreClient *)self activationEngine];
  [v2 removeReturningError:0];
}

- (void)syncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMStoreClient *)self activationEngine];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006F668;
  v7[3] = &unk_1000C6B58;
  id v8 = v4;
  id v6 = v4;
  [v5 syncWithCompletionHandler:v7];
}

- (void)statusEngineHasUnacknowledgedSubscription:(id)a3
{
  id v4 = +[RMLog storeClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10006FA3C(v4);
  }

  [(RMStoreClient *)self _sendStatusOnlyIfNeeded:1];
}

- (void)_sendStatusOnlyIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RMStoreClient *)self statusEngine];
  id v6 = +[RMStatusReporter newStatusReporterWithStatusEngine:v5 onlyIfNeeded:v3];

  id v10 = 0;
  v7 = [v6 statusReportReturningError:&v10];
  id v8 = v10;
  if (v8)
  {
    id v9 = +[RMLog storeClient];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006FAC4();
    }
  }
  else
  {
    if (v7)
    {
      [(RMStoreClient *)self _sendStatusData:v7];
      [v6 acknowledgeStatusSent];
      goto LABEL_7;
    }
    id v9 = +[RMLog storeClient];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10006FA80(v9);
    }
  }

LABEL_7:
}

- (void)_sendStatusData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];

  id v5 = +[RMLog storeClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10006FB38();
  }
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (RMActivationEngine)activationEngine
{
  return self->_activationEngine;
}

- (void)setActivationEngine:(id)a3
{
}

- (RMStatusEngine)statusEngine
{
  return self->_statusEngine;
}

- (void)setStatusEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusEngine, 0);
  objc_storeStrong((id *)&self->_activationEngine, 0);

  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end