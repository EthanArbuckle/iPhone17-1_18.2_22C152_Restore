@interface W5PeerFileTransferResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)files;
- (NSData)publicKey;
- (NSError)error;
- (NSNumber)version;
- (W5PeerFileTransferResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setError:(id)a3;
- (void)setFiles:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerFileTransferResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerFileTransferResponsePayload)initWithRequest:(id)a3
{
  id v4 = (NSError *)a3;
  v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315906;
    v30 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
    __int16 v31 = 2080;
    v32 = "W5PeerFileTransferResponsePayload.m";
    __int16 v33 = 1024;
    int v34 = 30;
    __int16 v35 = 2114;
    v36 = v4;
    LODWORD(v26) = 38;
    v25 = &v29;
    _os_log_send_and_compose_impl();
  }

  v28.receiver = self;
  v28.super_class = (Class)W5PeerFileTransferResponsePayload;
  v6 = [(W5PeerFileTransferResponsePayload *)&v28 init];
  if (v6
    && (v7 = (NSNumber *)[(NSError *)v4 objectForKey:@"version"],
        (v6->_version = v7) != 0)
    && ([(NSError *)v4 objectForKey:@"status"],
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    v6->_status = (int64_t)[v8 integerValue];
    uint64_t v10 = [(NSError *)v4 objectForKey:@"publicKey"];
    publicKey = v6->_publicKey;
    v6->_publicKey = (NSData *)v10;

    v12 = [(NSError *)v4 objectForKey:@"files"];
    if (v12)
    {
      uint64_t v13 = objc_opt_class();
      v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
      id v27 = 0;
      uint64_t v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v14 fromData:v12 error:&v27];
      id v16 = v27;
      files = v6->_files;
      v6->_files = (NSArray *)v15;
    }
    else
    {
      id v16 = 0;
    }
    uint64_t v18 = [(NSError *)v4 objectForKey:@"error", v25, v26];
    error = v6->_error;
    v6->_error = (NSError *)v18;

    v20 = v6->_error;
    if (!v20)
    {
      v21 = 0;
      goto LABEL_14;
    }
    v21 = v20;
    v22 = sub_10009756C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315906;
      v30 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
      __int16 v31 = 2080;
      v32 = "W5PeerFileTransferResponsePayload.m";
      __int16 v33 = 1024;
      int v34 = 56;
      __int16 v35 = 2114;
      v36 = v21;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {

    v22 = sub_10009756C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      v30 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
      __int16 v31 = 2080;
      v32 = "W5PeerFileTransferResponsePayload.m";
      __int16 v33 = 1024;
      int v34 = 64;
      _os_log_send_and_compose_impl();
    }
    v12 = 0;
    id v16 = 0;
    v9 = 0;
    v21 = 0;
    v6 = 0;
  }

LABEL_14:
  v23 = v6;

  return v23;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(W5PeerFileTransferResponsePayload *)self version];
    int64_t v6 = [(W5PeerFileTransferResponsePayload *)self status];
    v7 = [(W5PeerFileTransferResponsePayload *)self publicKey];
    v8 = [(W5PeerFileTransferResponsePayload *)self error];
    int v27 = 136316674;
    objc_super v28 = "-[W5PeerFileTransferResponsePayload encode]";
    __int16 v29 = 2080;
    v30 = "W5PeerFileTransferResponsePayload.m";
    __int16 v31 = 1024;
    int v32 = 76;
    __int16 v33 = 2114;
    id v34 = v5;
    __int16 v35 = 2048;
    int64_t v36 = v6;
    __int16 v37 = 2114;
    v38 = v7;
    __int16 v39 = 2114;
    v40 = v8;
    LODWORD(v24) = 68;
    v22 = &v27;
    _os_log_send_and_compose_impl();
  }
  v9 = [(W5PeerFileTransferResponsePayload *)self version];

  if (v9)
  {
    uint64_t v10 = [(W5PeerFileTransferResponsePayload *)self version];
    [v3 setObject:v10 forKey:@"version"];

    if ([(W5PeerFileTransferResponsePayload *)self status])
    {
      v11 = +[NSNumber numberWithInteger:[(W5PeerFileTransferResponsePayload *)self status]];
      [v3 setObject:v11 forKey:@"status"];

      v12 = [(W5PeerFileTransferResponsePayload *)self publicKey];

      if (v12)
      {
        uint64_t v13 = [(W5PeerFileTransferResponsePayload *)self publicKey];
        [v3 setObject:v13 forKey:@"publicKey"];
      }
      v9 = [(W5PeerFileTransferResponsePayload *)self files];

      if (v9)
      {
        v14 = [(W5PeerFileTransferResponsePayload *)self files];
        id v26 = 0;
        v9 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v26];
        id v15 = v26;

        if (!v9 || v15)
        {
          id v16 = sub_10009756C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315906;
            objc_super v28 = "-[W5PeerFileTransferResponsePayload encode]";
            __int16 v29 = 2080;
            v30 = "W5PeerFileTransferResponsePayload.m";
            __int16 v31 = 1024;
            int v32 = 96;
            __int16 v33 = 2114;
            id v34 = v15;
            LODWORD(v25) = 38;
            v23 = &v27;
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          [v3 setObject:v9 forKey:@"files"];
        }
      }
      else
      {
        id v15 = 0;
      }
      v17 = [(W5PeerFileTransferResponsePayload *)self error];

      if (v17)
      {
        uint64_t v18 = [(W5PeerFileTransferResponsePayload *)self error];
        [v3 setObject:v18 forKey:@"error"];
      }
    }
    else
    {
      id v15 = 0;
      v9 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  if (!objc_msgSend(v3, "count", v22))
  {
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerFileTransferResponsePayload encode]");
    id v21 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v20 userInfo:0];

    objc_exception_throw(v21);
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

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
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
  objc_storeStrong((id *)&self->_files, 0);

  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end