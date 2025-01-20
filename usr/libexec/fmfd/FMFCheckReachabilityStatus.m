@interface FMFCheckReachabilityStatus
- (FMFCheckReachabilityStatus)initWithClientSession:(id)a3 idsClientStatusMap:(id)a4;
- (NSDictionary)statusMap;
- (NSMutableDictionary)statusMapFromServer;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)processCommandResponse:(id)a3;
- (void)setStatusMap:(id)a3;
- (void)setStatusMapFromServer:(id)a3;
@end

@implementation FMFCheckReachabilityStatus

- (FMFCheckReachabilityStatus)initWithClientSession:(id)a3 idsClientStatusMap:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMFCheckReachabilityStatus;
  v7 = [(FMFBaseCmd *)&v11 initWithClientSession:a3];
  v8 = v7;
  if (v6 && v7)
  {
    [(FMFCheckReachabilityStatus *)v7 setStatusMap:v6];
    v9 = +[NSMutableDictionary dictionary];
    [(FMFCheckReachabilityStatus *)v8 setStatusMapFromServer:v9];
  }
  else
  {
    [(FMFBaseCmd *)v7 initFailed];
    v9 = v8;
    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return @"contactStatus";
}

- (id)jsonBodyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)FMFCheckReachabilityStatus;
  v3 = [(FMFBaseCmd *)&v8 jsonBodyDictionary];
  v4 = [(FMFCheckReachabilityStatus *)self statusMap];
  v5 = [v4 allKeys];
  [v3 setObject:v5 forKeyedSubscript:@"emails"];

  id v6 = [(FMFCheckReachabilityStatus *)self statusMap];
  [v3 setObject:v6 forKeyedSubscript:@"idsValidatedHandles"];

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FMFCheckReachabilityStatus;
  id v4 = a3;
  [(FMFBaseCmd *)&v8 processCommandResponse:v4];
  v5 = [v4 objectForKeyedSubscript:@"commandResponse"];

  id v6 = [v5 objectForKeyedSubscript:@"contactStatusMap"];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000188D4;
  v7[3] = &unk_1000A1EE0;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (NSMutableDictionary)statusMapFromServer
{
  return self->_statusMapFromServer;
}

- (void)setStatusMapFromServer:(id)a3
{
}

- (NSDictionary)statusMap
{
  return self->_statusMap;
}

- (void)setStatusMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMap, 0);

  objc_storeStrong((id *)&self->_statusMapFromServer, 0);
}

@end