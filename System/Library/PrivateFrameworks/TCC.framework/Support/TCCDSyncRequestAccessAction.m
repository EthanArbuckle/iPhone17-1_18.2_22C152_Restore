@interface TCCDSyncRequestAccessAction
+ (BOOL)supportsSecureCoding;
+ (id)requestAccessActionFromIDSMessage:(id)a3 mainSyncController:(id)a4;
- (id)idsMessageDictionary;
- (unint64_t)desiredAuth;
- (void)setDesiredAuth:(unint64_t)a3;
@end

@implementation TCCDSyncRequestAccessAction

+ (id)requestAccessActionFromIDSMessage:(id)a3 mainSyncController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"TCCDSyncAccessActionServiceIdentifierKey"];
  v8 = [v6 objectForKeyedSubscript:@"TCCDSyncAccessActionReplicaClientIdentifierKey"];
  v9 = [v6 objectForKeyedSubscript:@"TCCDSyncAccessActionClientTypeKey"];
  v10 = [v6 objectForKeyedSubscript:@"TCCDSyncAccessActionDesiredAuthKey"];

  if (v7 && v8 && v9 && v10)
  {
    v11 = [v5 mainClientIdentifierForReplicaClientIdentifier:v8];
    if (v11)
    {
      v12 = -[TCCDSyncClientAccessAction initWithServiceIdentifier:mainClientIdentifier:replicaClientIdentifier:clientType:]([TCCDSyncRequestAccessAction alloc], "initWithServiceIdentifier:mainClientIdentifier:replicaClientIdentifier:clientType:", v7, v11, v8, [v9 intValue]);
      -[TCCDSyncRequestAccessAction setDesiredAuth:](v12, "setDesiredAuth:", (int)[v10 intValue]);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_100058DA4();
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "+[TCCDSyncRequestAccessAction requestAccessActionFromIDSMessage:mainSyncController:]";
      __int16 v17 = 2048;
      v18 = v7;
      __int16 v19 = 2048;
      v20 = v8;
      __int16 v21 = 2048;
      v22 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s: malformed access update message: serviceID: %p, replicaClientID: %p, clientTypeNumber: %p", (uint8_t *)&v15, 0x2Au);
    }
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)idsMessageDictionary
{
  v9[0] = @"TCCDSyncAccessActionServiceIdentifierKey";
  v3 = [(TCCDSyncAccessAction *)self serviceIdentifier];
  v10[0] = v3;
  v9[1] = @"TCCDSyncAccessActionReplicaClientIdentifierKey";
  v4 = [(TCCDSyncClientAccessAction *)self replicaClientIdentifier];
  v10[1] = v4;
  v9[2] = @"TCCDSyncAccessActionClientTypeKey";
  id v5 = +[NSNumber numberWithInt:[(TCCDSyncClientAccessAction *)self clientType]];
  v10[2] = v5;
  v9[3] = @"TCCDSyncAccessActionDesiredAuthKey";
  id v6 = +[NSNumber numberWithLongLong:[(TCCDSyncRequestAccessAction *)self desiredAuth]];
  v10[3] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (unint64_t)desiredAuth
{
  return self->_desiredAuth;
}

- (void)setDesiredAuth:(unint64_t)a3
{
  self->_desiredAuth = a3;
}

@end