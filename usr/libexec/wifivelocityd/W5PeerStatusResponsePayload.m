@interface W5PeerStatusResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5PeerStatusResponsePayload)initWithRequest:(id)a3;
- (W5Status)peerStatus;
- (id)encode;
- (int64_t)status;
- (void)setPeerStatus:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerStatusResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerStatusResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)W5PeerStatusResponsePayload;
  v5 = [(W5PeerStatusResponsePayload *)&v27 init];
  if (v5
    && (v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) != 0))
  {
    v7 = [v4 objectForKey:@"status"];
    v8 = v7;
    if (v7) {
      v5->_status = (int64_t)[v7 integerValue];
    }
    v24 = v8;
    v9 = [v4 objectForKey:@"peerStatus"];
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v26 = 0;
    uint64_t v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v9 error:&v26];
    id v12 = v26;
    peerStatus = v5->_peerStatus;
    v5->_peerStatus = (W5Status *)v11;

    BOOL v14 = v5->_peerStatus != 0;
  }
  else
  {
    v24 = 0;
    id v12 = 0;
    v9 = 0;
    BOOL v14 = 0;
  }
  v15 = [v4 objectForKey:&off_1000EB968];

  if (v15)
  {
    v16 = [v4 objectForKey:&off_1000EB968];

    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v25 = v12;
    uint64_t v18 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v17 fromData:v16 error:&v25];
    id v19 = v25;

    v20 = v5->_peerStatus;
    v5->_peerStatus = (W5Status *)v18;

    if (v5->_peerStatus)
    {
      v5->_version = (NSNumber *)&off_1000EB968;
      v5->_status = 1;
      v21 = v24;
      goto LABEL_14;
    }
  }
  else
  {
    id v19 = v12;
    v16 = v9;
  }
  v21 = v24;
  if (!v14)
  {

    v22 = sub_10009756C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315906;
      v29 = "-[W5PeerStatusResponsePayload initWithRequest:]";
      __int16 v30 = 2080;
      v31 = "W5PeerStatusResponsePayload.m";
      __int16 v32 = 1024;
      int v33 = 66;
      __int16 v34 = 2114;
      id v35 = v19;
      _os_log_send_and_compose_impl();
    }

    v5 = 0;
  }
LABEL_14:

  return v5;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(W5PeerStatusResponsePayload *)self version];
    int64_t v6 = [(W5PeerStatusResponsePayload *)self status];
    v7 = [(W5PeerStatusResponsePayload *)self peerStatus];
    int v20 = 136316418;
    v21 = "-[W5PeerStatusResponsePayload encode]";
    __int16 v22 = 2080;
    v23 = "W5PeerStatusResponsePayload.m";
    __int16 v24 = 1024;
    int v25 = 77;
    __int16 v26 = 2114;
    id v27 = v5;
    __int16 v28 = 2048;
    int64_t v29 = v6;
    __int16 v30 = 2114;
    v31 = v7;
    LODWORD(v18) = 58;
    v17 = &v20;
    _os_log_send_and_compose_impl();
  }
  v8 = [(W5PeerStatusResponsePayload *)self version];

  if (!v8) {
    goto LABEL_17;
  }
  v9 = [(W5PeerStatusResponsePayload *)self version];
  [v3 setObject:v9 forKey:@"version"];

  if (![(W5PeerStatusResponsePayload *)self status])
  {
    v8 = 0;
    goto LABEL_17;
  }
  v10 = +[NSNumber numberWithInteger:[(W5PeerStatusResponsePayload *)self status]];
  [v3 setObject:v10 forKey:@"status"];

  v8 = [(W5PeerStatusResponsePayload *)self peerStatus];

  if (!v8)
  {
LABEL_17:
    id v12 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = [(W5PeerStatusResponsePayload *)self peerStatus];
  id v19 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v19];
  id v12 = v19;

  if (!v8 || v12)
  {
    v13 = sub_10009756C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      v21 = "-[W5PeerStatusResponsePayload encode]";
      __int16 v22 = 2080;
      v23 = "W5PeerStatusResponsePayload.m";
      __int16 v24 = 1024;
      int v25 = 94;
      __int16 v26 = 2114;
      id v27 = v12;
      LODWORD(v18) = 38;
      v17 = &v20;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    [v3 setObject:v8 forKey:@"peerStatus"];
    [v3 setObject:v8 forKey:self->_version];
  }
LABEL_12:
  if (!objc_msgSend(v3, "count", v17, v18))
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerStatusResponsePayload encode]");
    id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

    objc_exception_throw(v16);
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

- (W5Status)peerStatus
{
  return self->_peerStatus;
}

- (void)setPeerStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end