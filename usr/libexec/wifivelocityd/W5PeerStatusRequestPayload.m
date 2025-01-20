@interface W5PeerStatusRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5PeerStatusRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerStatusRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerStatusRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)W5PeerStatusRequestPayload;
  v5 = [(W5PeerStatusRequestPayload *)&v9 init];
  if (!v5
    || (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0))
  {

    v7 = sub_10009756C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      v11 = "-[W5PeerStatusRequestPayload initWithRequest:]";
      __int16 v12 = 2080;
      v13 = "W5PeerStatusRequestPayload.m";
      __int16 v14 = 1024;
      int v15 = 37;
      __int16 v16 = 2114;
      uint64_t v17 = 0;
      _os_log_send_and_compose_impl();
    }

    v5 = 0;
  }

  return v5;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_version)
  {
    id v4 = [(W5PeerStatusRequestPayload *)self version];
    [v3 setObject:v4 forKey:@"version"];
  }
  if (![v3 count])
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerStatusRequestPayload encode]");
    id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

    objc_exception_throw(v7);
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

@end