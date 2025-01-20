@interface W5PeerGenericRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)info;
- (NSNumber)version;
- (W5PeerGenericRequestPayload)initWithRequest:(id)a3;
- (id)__allowedClasses;
- (id)encode;
- (void)setInfo:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerGenericRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (id)__allowedClasses
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:10];

  return v2;
}

- (W5PeerGenericRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)W5PeerGenericRequestPayload;
  v5 = [(W5PeerGenericRequestPayload *)&v16 init];
  if (!v5)
  {
    id v10 = 0;
    v6 = 0;
LABEL_10:

    v14 = sub_10009756C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      v18 = "-[W5PeerGenericRequestPayload initWithRequest:]";
      __int16 v19 = 2080;
      v20 = "W5PeerGenericRequestPayload.m";
      __int16 v21 = 1024;
      int v22 = 42;
      _os_log_send_and_compose_impl();
    }

    v5 = 0;
    goto LABEL_8;
  }
  v6 = [v4 objectForKey:@"payload"];
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_8;
  }
  v7 = [(W5PeerGenericRequestPayload *)v5 __allowedClasses];
  v8 = +[NSSet setWithArray:v7];
  id v15 = 0;
  uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:&v15];
  id v10 = v15;
  info = v5->_info;
  v5->_info = (NSDictionary *)v9;

  if (!v5->_info)
  {
    v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      v18 = "-[W5PeerGenericRequestPayload initWithRequest:]";
      __int16 v19 = 2080;
      v20 = "W5PeerGenericRequestPayload.m";
      __int16 v21 = 1024;
      int v22 = 34;
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_send_and_compose_impl();
    }

    goto LABEL_10;
  }
LABEL_8:

  return v5;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerGenericRequestPayload *)self info];

  if (v4)
  {
    v5 = [(W5PeerGenericRequestPayload *)self info];
    id v13 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v13];
    id v6 = v13;

    if (v4)
    {
      [v3 setObject:v4 forKeyedSubscript:@"payload"];
    }
    else
    {
      v8 = sub_10009756C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        id v15 = "-[W5PeerGenericRequestPayload encode]";
        __int16 v16 = 2080;
        int v17 = "W5PeerGenericRequestPayload.m";
        __int16 v18 = 1024;
        int v19 = 54;
        __int16 v20 = 2114;
        id v21 = v6;
        LODWORD(v12) = 38;
        v11 = &v14;
        _os_log_send_and_compose_impl();
      }

      id v4 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  if (!objc_msgSend(v3, "count", v11, v12))
  {
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerGenericRequestPayload encode]");
    id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

    objc_exception_throw(v10);
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

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end