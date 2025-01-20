@interface W5PeerDiagnosticsResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)results;
- (NSError)error;
- (NSNumber)version;
- (W5PeerDiagnosticsResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setError:(id)a3;
- (void)setResults:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDiagnosticsResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerDiagnosticsResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)W5PeerDiagnosticsResponsePayload;
  v5 = [(W5PeerDiagnosticsResponsePayload *)&v19 init];
  if (!v5
    || (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0))
  {

    v15 = sub_10009756C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      v21 = "-[W5PeerDiagnosticsResponsePayload initWithRequest:]";
      __int16 v22 = 2080;
      v23 = "W5PeerDiagnosticsResponsePayload.m";
      __int16 v24 = 1024;
      int v25 = 56;
      __int16 v26 = 2114;
      uint64_t v27 = 0;
      _os_log_send_and_compose_impl();
    }
    v9 = 0;
    v8 = 0;
    id v13 = 0;
    v5 = 0;
    goto LABEL_8;
  }
  v7 = [v4 objectForKey:@"status"];
  v8 = v7;
  if (v7) {
    v5->_status = (int64_t)[v7 integerValue];
  }
  v9 = [v4 objectForKey:@"testResults"];
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  id v18 = 0;
  uint64_t v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v9 error:&v18];
  id v13 = v18;
  results = v5->_results;
  v5->_results = (NSArray *)v12;

  if (!v5->_results)
  {
    v15 = [v4 objectForKey:@"testError"];
    if (v15) {
      objc_storeStrong((id *)&v5->_error, v15);
    }
LABEL_8:
  }
  v16 = v5;

  return v16;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(W5PeerDiagnosticsResponsePayload *)self version];
    int64_t v6 = [(W5PeerDiagnosticsResponsePayload *)self status];
    v7 = [(W5PeerDiagnosticsResponsePayload *)self results];
    v8 = [(W5PeerDiagnosticsResponsePayload *)self error];
    int v22 = 136316674;
    v23 = "-[W5PeerDiagnosticsResponsePayload encode]";
    __int16 v24 = 2080;
    int v25 = "W5PeerDiagnosticsResponsePayload.m";
    __int16 v26 = 1024;
    int v27 = 66;
    __int16 v28 = 2114;
    v29 = v5;
    __int16 v30 = 2048;
    int64_t v31 = v6;
    __int16 v32 = 2114;
    v33 = v7;
    __int16 v34 = 2114;
    v35 = v8;
    LODWORD(v20) = 68;
    objc_super v19 = &v22;
    _os_log_send_and_compose_impl();
  }
  id v9 = [(W5PeerDiagnosticsResponsePayload *)self version];

  if (v9)
  {
    uint64_t v10 = [(W5PeerDiagnosticsResponsePayload *)self version];
    [v3 setObject:v10 forKey:@"version"];

    if (![(W5PeerDiagnosticsResponsePayload *)self status])
    {
LABEL_9:
      v14 = 0;
      id v9 = 0;
      goto LABEL_11;
    }
    v11 = +[NSNumber numberWithInteger:[(W5PeerDiagnosticsResponsePayload *)self status]];
    [v3 setObject:v11 forKey:@"status"];

    uint64_t v12 = [(W5PeerDiagnosticsResponsePayload *)self results];

    if (v12)
    {
      id v13 = [(W5PeerDiagnosticsResponsePayload *)self results];
      id v21 = 0;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v21];
      id v9 = v21;

      [v3 setObject:v14 forKey:@"testResults"];
      goto LABEL_11;
    }
    id v9 = [(W5PeerDiagnosticsResponsePayload *)self error];

    if (v9)
    {
      v15 = [(W5PeerDiagnosticsResponsePayload *)self error];
      [v3 setObject:v15 forKey:@"testError"];

      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_11:
  if (!objc_msgSend(v3, "count", v19, v20))
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerDiagnosticsResponsePayload encode]");
    id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

    objc_exception_throw(v18);
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

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end