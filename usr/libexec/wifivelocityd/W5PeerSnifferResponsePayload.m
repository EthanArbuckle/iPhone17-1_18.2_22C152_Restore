@interface W5PeerSnifferResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)filePaths;
- (NSNumber)version;
- (NSUUID)uuid;
- (W5PeerSnifferResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setFilePaths:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSnifferResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerSnifferResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)W5PeerSnifferResponsePayload;
  v5 = [(W5PeerSnifferResponsePayload *)&v21 init];
  if (v5
    && (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) != 0)
    && ([v4 objectForKey:@"status"], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v5->_status = (int64_t)[v7 integerValue];
    v9 = [v4 objectForKey:@"paths"];
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      id v20 = 0;
      uint64_t v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v9 error:&v20];
      id v14 = v20;
      filePaths = v5->_filePaths;
      v5->_filePaths = (NSDictionary *)v13;
    }
    else
    {
      id v14 = 0;
    }
    uint64_t v16 = [v4 objectForKey:@"uuid"];
    p_super = &v5->_uuid->super;
    v5->_uuid = (NSUUID *)v16;
  }
  else
  {

    p_super = sub_10009756C();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      v23 = "-[W5PeerSnifferResponsePayload initWithRequest:]";
      __int16 v24 = 2080;
      v25 = "W5PeerSnifferResponsePayload.m";
      __int16 v26 = 1024;
      int v27 = 55;
      __int16 v28 = 2114;
      uint64_t v29 = 0;
      _os_log_send_and_compose_impl();
    }
    v9 = 0;
    id v14 = 0;
    v8 = 0;
    v5 = 0;
  }

  v18 = v5;
  return v18;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerSnifferResponsePayload *)self version];

  if (!v4) {
    goto LABEL_18;
  }
  v5 = [(W5PeerSnifferResponsePayload *)self version];
  [v3 setObject:v5 forKey:@"version"];

  if (![(W5PeerSnifferResponsePayload *)self status])
  {
    id v4 = 0;
LABEL_18:
    id v8 = 0;
    goto LABEL_13;
  }
  v6 = +[NSNumber numberWithInteger:[(W5PeerSnifferResponsePayload *)self status]];
  [v3 setObject:v6 forKey:@"status"];

  id v4 = [(W5PeerSnifferResponsePayload *)self filePaths];

  if (v4)
  {
    v7 = [(W5PeerSnifferResponsePayload *)self filePaths];
    id v17 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v17];
    id v8 = v17;

    if (!v4 || v8)
    {
      v9 = sub_10009756C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        v19 = "-[W5PeerSnifferResponsePayload encode]";
        __int16 v20 = 2080;
        objc_super v21 = "W5PeerSnifferResponsePayload.m";
        __int16 v22 = 1024;
        int v23 = 82;
        __int16 v24 = 2114;
        id v25 = v8;
        LODWORD(v16) = 38;
        v15 = &v18;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      [v3 setObject:v4 forKey:@"paths"];
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v10 = [(W5PeerSnifferResponsePayload *)self uuid];

  if (v10)
  {
    uint64_t v11 = [(W5PeerSnifferResponsePayload *)self uuid];
    [v3 setObject:v11 forKey:@"uuid"];
  }
LABEL_13:
  if (![v3 count])
  {
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerSnifferResponsePayload encode]");
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

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSDictionary)filePaths
{
  return self->_filePaths;
}

- (void)setFilePaths:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_filePaths, 0);
}

@end