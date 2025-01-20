@interface W5PeerDebugResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5DebugConfiguration)configuration;
- (W5PeerDebugResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setConfiguration:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDebugResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerDebugResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)W5PeerDebugResponsePayload;
  v5 = [(W5PeerDebugResponsePayload *)&v27 init];
  if (!v5
    || (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0))
  {
    v8 = 0;
    goto LABEL_13;
  }
  v7 = [v4 objectForKey:@"status"];
  v8 = v7;
  if (!v7)
  {
LABEL_13:
    id v13 = 0;
    v9 = 0;
    goto LABEL_15;
  }
  v5->_status = (int64_t)[v7 integerValue];
  v9 = [v4 objectForKey:@"config"];
  if (!v9)
  {
    id v13 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  id v26 = 0;
  uint64_t v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v9 error:&v26];
  id v13 = v26;
  configuration = v5->_configuration;
  v5->_configuration = (W5DebugConfiguration *)v12;

  v15 = v5->_configuration;
  if (!v15)
  {
LABEL_15:

    v22 = sub_10009756C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315906;
      v29 = "-[W5PeerDebugResponsePayload initWithRequest:]";
      __int16 v30 = 2080;
      v31 = "W5PeerDebugResponsePayload.m";
      __int16 v32 = 1024;
      int v33 = 63;
      __int16 v34 = 2114;
      id v35 = v13;
      _os_log_send_and_compose_impl();
    }
    v5 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = [(W5DebugConfiguration *)v15 diagnosticsMode];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(W5DebugConfiguration *)v5->_configuration diagnosticsMode];
    v19 = [v18 uuid];

    if (!v19)
    {
      v20 = +[NSUUID UUID];
      v21 = [(W5DebugConfiguration *)v5->_configuration diagnosticsMode];
      [v21 setUuid:v20];

      v22 = sub_10009756C();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(W5PeerDebugResponsePayload *)v5 configuration];
        v24 = [v23 diagnosticsMode];
        int v28 = 136315906;
        v29 = "-[W5PeerDebugResponsePayload initWithRequest:]";
        __int16 v30 = 2080;
        v31 = "W5PeerDebugResponsePayload.m";
        __int16 v32 = 1024;
        int v33 = 56;
        __int16 v34 = 2114;
        id v35 = v24;
        _os_log_send_and_compose_impl();
      }
LABEL_10:
    }
  }

  return v5;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerDebugResponsePayload *)self version];

  if (!v4) {
    goto LABEL_16;
  }
  v5 = [(W5PeerDebugResponsePayload *)self version];
  [v3 setObject:v5 forKey:@"version"];

  if (![(W5PeerDebugResponsePayload *)self status])
  {
    v8 = 0;
    goto LABEL_7;
  }
  v6 = +[NSNumber numberWithInteger:[(W5PeerDebugResponsePayload *)self status]];
  [v3 setObject:v6 forKey:@"status"];

  id v4 = [(W5PeerDebugResponsePayload *)self configuration];

  if (v4)
  {
    v7 = [(W5PeerDebugResponsePayload *)self configuration];
    id v17 = 0;
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v17];
    id v4 = v17;

    if (!v4 && v8)
    {
      [v3 setObject:v8 forKey:@"config"];
LABEL_7:
      id v4 = 0;
      goto LABEL_11;
    }
    v9 = sub_10009756C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315906;
      v19 = "-[W5PeerDebugResponsePayload encode]";
      __int16 v20 = 2080;
      v21 = "W5PeerDebugResponsePayload.m";
      __int16 v22 = 1024;
      int v23 = 87;
      __int16 v24 = 2114;
      id v25 = v4;
      LODWORD(v16) = 38;
      v15 = &v18;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
LABEL_16:
    v8 = 0;
  }
LABEL_11:
  if (!objc_msgSend(v3, "count", v15, v16))
  {
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerDebugResponsePayload encode]");
    id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  if ([v3 count]) {
    uint64_t v10 = v3;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (W5DebugConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end