@interface CDKnowledgeDaemonConnection
- (CDKnowledgeDaemon)daemon;
- (NSSet)authorizedEventStreamsToRead;
- (NSString)processName;
- (id)unauthorizedClientError;
- (void)confirmDatabaseConnectionWithReply:(id)a3;
- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4;
- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4;
- (void)deleteObjects:(id)a3 reply:(id)a4;
- (void)deleteRemoteState:(id)a3;
- (void)deviceUUIDWithReply:(id)a3;
- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)executeQuery:(id)a3 reply:(id)a4;
- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4;
- (void)saveObjects:(id)a3 reply:(id)a4;
- (void)setAuthorizedEventStreamsToRead:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setProcessName:(id)a3;
- (void)sourceDeviceIdentityWithReply:(id)a3;
- (void)synchronizeWithReply:(id)a3;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5;
@end

@implementation CDKnowledgeDaemonConnection

- (id)unauthorizedClientError
{
  uint64_t v2 = _DKErrorDomain;
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"unauthorized client";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v4 = +[NSError errorWithDomain:v2 code:9 userInfo:v3];

  return v4;
}

- (void)saveObjects:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  CFStringRef v7 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v7)
  {
    v8 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v8 saveObjects:v9 reply:v6];
  }
}

- (void)deleteObjects:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  CFStringRef v7 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v7)
  {
    v8 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v8 deleteObjects:v9 reply:v6];
  }
}

- (void)executeQuery:(id)a3 reply:(id)a4
{
  id v17 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  CFStringRef v7 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v7)
  {
    v8 = objc_opt_class();
    if (![v8 isEqual:objc_opt_class()])
    {
LABEL_6:
      v14 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
      v6[2](v6, 0, v14);
      goto LABEL_9;
    }
    id v9 = v17;
    id v10 = objc_alloc((Class)NSMutableSet);
    v11 = [v9 eventStreams];
    id v12 = [v10 initWithArray:v11];

    if (![v12 count]
      || ([(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v12 minusSet:v13],
          v13,
          [v12 count]))
    {

      goto LABEL_6;
    }
    id v15 = [v9 resultType];

    if (v15) {
      goto LABEL_6;
    }
  }
  v16 = [(CDKnowledgeDaemonConnection *)self processName];
  [v17 setClientName:v16];

  v14 = [(CDKnowledgeDaemonConnection *)self daemon];
  [v14 executeQuery:v17 reply:v6];
LABEL_9:
}

- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  CFStringRef v7 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v7)
  {
    v8 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v8 deleteAllEventsInEventStreamNamed:v9 reply:v6];
  }
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  CFStringRef v7 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v7)
  {
    v8 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v8 deleteAllEventsMatchingPredicate:v9 reply:v6];
  }
}

- (void)synchronizeWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v5)
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v4[2](v4, 0);
  }
  else
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v6 synchronizeWithReply:v4];
  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  id v11 = a4;
  v8 = (void (**)(id, void, void *))a5;
  id v9 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v9)
  {
    id v10 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v8[2](v8, 0, v10);
  }
  else
  {
    id v10 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v10 synchronizeWithUrgency:a3 client:v11 reply:v8];
  }
}

- (void)deleteRemoteState:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v5)
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v4[2](v4, 0);
  }
  else
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v6 deleteRemoteState:v4];
  }
}

- (void)sourceDeviceIdentityWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v5)
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v4[2](v4, 0);
  }
  else
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v6 sourceDeviceIdentityWithReply:v4];
  }
}

- (void)deviceUUIDWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(CDKnowledgeDaemonConnection *)self authorizedEventStreamsToRead];

  if (v5)
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self unauthorizedClientError];
    v4[2](v4, 0);
  }
  else
  {
    id v6 = [(CDKnowledgeDaemonConnection *)self daemon];
    [v6 deviceUUIDWithReply:v4];
  }
}

- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = [(CDKnowledgeDaemonConnection *)self daemon];
  [v9 disableSyncPolicyForFeature:a3 transportType:a4 withReply:v8];
}

- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = [(CDKnowledgeDaemonConnection *)self daemon];
  [v9 isSyncPolicyDisabledForFeature:a3 transportType:a4 withReply:v8];
}

- (void)confirmDatabaseConnectionWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(CDKnowledgeDaemonConnection *)self daemon];
  [v5 confirmDatabaseConnectionWithReply:v4];
}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CDKnowledgeDaemonConnection *)self daemon];
  [v7 requestBiomeEndpoint:v4 reply:v6];
}

- (NSSet)authorizedEventStreamsToRead
{
  return self->_authorizedEventStreamsToRead;
}

- (void)setAuthorizedEventStreamsToRead:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (CDKnowledgeDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_authorizedEventStreamsToRead, 0);
}

@end