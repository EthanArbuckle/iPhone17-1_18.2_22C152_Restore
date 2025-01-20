@interface W5PeerDiagnosticsRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)tests;
- (NSDictionary)configuration;
- (NSNumber)version;
- (NSUUID)uuid;
- (W5PeerDiagnosticsRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (void)setConfiguration:(id)a3;
- (void)setTests:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDiagnosticsRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerDiagnosticsRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)W5PeerDiagnosticsRequestPayload;
  v5 = [(W5PeerDiagnosticsRequestPayload *)&v26 init];
  if (v5
    && (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) != 0))
  {
    v7 = [v4 objectForKey:@"configuration"];
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v25 = 0;
    uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v7 error:&v25];
    id v10 = v25;
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v9;

    v12 = [v4 objectForKey:@"tests"];
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
    id v24 = v10;
    uint64_t v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v14 fromData:v12 error:&v24];
    id v16 = v24;

    tests = v5->_tests;
    v5->_tests = (NSArray *)v15;

    uint64_t v18 = [v4 objectForKey:@"uuid"];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v18];
      p_super = &v5->_uuid->super;
      v5->_uuid = v20;
      goto LABEL_5;
    }
  }
  else
  {
    v7 = 0;
    id v16 = 0;
    v12 = 0;
  }

  p_super = sub_10009756C();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315906;
    v28 = "-[W5PeerDiagnosticsRequestPayload initWithRequest:]";
    __int16 v29 = 2080;
    v30 = "W5PeerDiagnosticsRequestPayload.m";
    __int16 v31 = 1024;
    int v32 = 54;
    __int16 v33 = 2114;
    id v34 = v16;
    _os_log_send_and_compose_impl();
  }
  v19 = 0;
  v5 = 0;
LABEL_5:

  v22 = v5;
  return v22;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerDiagnosticsRequestPayload *)self version];

  if (v4)
  {
    v5 = [(W5PeerDiagnosticsRequestPayload *)self version];
    [v3 setObject:v5 forKey:@"version"];

    v6 = [(W5PeerDiagnosticsRequestPayload *)self configuration];

    if (v6)
    {
      v7 = [(W5PeerDiagnosticsRequestPayload *)self configuration];
      id v26 = 0;
      v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v26];
      id v4 = v26;

      if (!v8)
      {
        uint64_t v9 = sub_10009756C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315906;
          v28 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v29 = 2080;
          v30 = "W5PeerDiagnosticsRequestPayload.m";
          __int16 v31 = 1024;
          int v32 = 72;
          __int16 v33 = 2114;
          id v34 = v4;
          LODWORD(v22) = 38;
          v21 = &v27;
LABEL_22:
          _os_log_send_and_compose_impl();
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else
    {
      id v10 = +[NSNull null];
      id v25 = 0;
      v8 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v25];
      id v4 = v25;

      if (!v8)
      {
        uint64_t v9 = sub_10009756C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315906;
          v28 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v29 = 2080;
          v30 = "W5PeerDiagnosticsRequestPayload.m";
          __int16 v31 = 1024;
          int v32 = 77;
          __int16 v33 = 2114;
          id v34 = v4;
          LODWORD(v22) = 38;
          v21 = &v27;
          goto LABEL_22;
        }
LABEL_23:
        v14 = 0;
        v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    v11 = v4;
    [v3 setObject:v8 forKey:@"configuration"];
    v12 = [(W5PeerDiagnosticsRequestPayload *)self tests];

    if (v12)
    {
      uint64_t v13 = [(W5PeerDiagnosticsRequestPayload *)self tests];
      id v24 = v4;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v24];
      id v4 = v24;

      if (!v14)
      {
        uint64_t v9 = sub_10009756C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315906;
          v28 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v29 = 2080;
          v30 = "W5PeerDiagnosticsRequestPayload.m";
          __int16 v31 = 1024;
          int v32 = 85;
          __int16 v33 = 2114;
          id v34 = v4;
          LODWORD(v22) = 38;
          v21 = &v27;
LABEL_26:
          _os_log_send_and_compose_impl();
          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v15 = +[NSNull null];
      id v23 = v4;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v23];
      id v4 = v23;

      if (!v14)
      {
        uint64_t v9 = sub_10009756C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315906;
          v28 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v29 = 2080;
          v30 = "W5PeerDiagnosticsRequestPayload.m";
          __int16 v31 = 1024;
          int v32 = 90;
          __int16 v33 = 2114;
          id v34 = v4;
          LODWORD(v22) = 38;
          v21 = &v27;
          goto LABEL_26;
        }
LABEL_27:
        v14 = 0;
        goto LABEL_14;
      }
    }
    [v3 setObject:v14 forKey:@"tests"];
    id v16 = [(W5PeerDiagnosticsRequestPayload *)self uuid];

    if (!v16) {
      goto LABEL_15;
    }
    uint64_t v9 = [(W5PeerDiagnosticsRequestPayload *)self uuid];
    v17 = [v9 UUIDString];
    [v3 setObject:v17 forKey:@"uuid"];

    goto LABEL_14;
  }
  v14 = 0;
  v8 = 0;
LABEL_15:
  if (!objc_msgSend(v3, "count", v21, v22))
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerDiagnosticsRequestPayload encode]");
    id v20 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v19 userInfo:0];

    objc_exception_throw(v20);
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

- (NSArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_tests, 0);
}

@end