@interface W5PeerDebugRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5DebugConfiguration)configuration;
- (W5PeerDebugRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (unint64_t)requestType;
- (void)setConfiguration:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDebugRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerDebugRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)W5PeerDebugRequestPayload;
  v5 = [(W5PeerDebugRequestPayload *)&v19 init];
  if (!v5
    || (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0)
    || ([v4 objectForKey:@"type"], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    v13 = sub_10009756C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl();
    }
    v8 = 0;
    v9 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v8 = v7;
  v5->_requestType = (unint64_t)[v7 integerValue];
  v9 = [v4 objectForKey:@"config"];
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    id v18 = 0;
    uint64_t v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v9 error:&v18];
    v13 = v18;
    configuration = v5->_configuration;
    v5->_configuration = (W5DebugConfiguration *)v12;

    if (v13)
    {
      v15 = sub_10009756C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543362;
        id v21 = v4;
        _os_log_send_and_compose_impl();
      }
    }
LABEL_9:
  }
  v16 = v5;

  return v16;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerDebugRequestPayload *)self version];

  if (v4)
  {
    v5 = [(W5PeerDebugRequestPayload *)self version];
    [v3 setObject:v5 forKey:@"version"];

    if ([(W5PeerDebugRequestPayload *)self requestType])
    {
      v6 = +[NSNumber numberWithUnsignedInteger:[(W5PeerDebugRequestPayload *)self requestType]];
      [v3 setObject:v6 forKey:@"type"];

      if ((id)[(W5PeerDebugRequestPayload *)self requestType] == (id)2)
      {
        v7 = [(W5PeerDebugRequestPayload *)self configuration];

        if (v7)
        {
          v8 = [(W5PeerDebugRequestPayload *)self configuration];
          id v17 = 0;
          v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v17];
          id v10 = v17;

          if (v10 || !v9)
          {
            v11 = sub_10009756C();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = 138543362;
              id v19 = v10;
              LODWORD(v16) = 12;
              v15 = &v18;
              _os_log_send_and_compose_impl();
            }
          }
          else
          {
            [v3 setObject:v9 forKey:@"config"];
          }
        }
      }
    }
  }
  if (!objc_msgSend(v3, "count", v15, v16))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerDebugRequestPayload encode]");
    id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }

  return v3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (W5DebugConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
}

@end