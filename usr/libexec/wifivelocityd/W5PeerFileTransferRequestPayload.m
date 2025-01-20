@interface W5PeerFileTransferRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSData)publicKey;
- (NSNumber)version;
- (NSString)targetID;
- (NSURL)remotePath;
- (W5PeerFileTransferRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)type;
- (void)setPublicKey:(id)a3;
- (void)setRemotePath:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerFileTransferRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerFileTransferRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)W5PeerFileTransferRequestPayload;
  v5 = [(W5PeerFileTransferRequestPayload *)&v22 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = (NSNumber *)[v4 objectForKey:@"version"];
  v5->_version = v6;
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = objc_alloc((Class)NSURL);
  v8 = [v4 objectForKey:@"url"];
  v9 = (NSURL *)[v7 initWithString:v8];
  remotePath = v5->_remotePath;
  v5->_remotePath = v9;

  if (!v5->_remotePath)
  {
LABEL_11:
    id v14 = 0;
    v11 = 0;
    goto LABEL_12;
  }
  v11 = [v4 objectForKey:@"type"];
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  id v21 = 0;
  v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v11 error:&v21];
  id v14 = v21;
  v5->_int64_t type = (int64_t)[v13 integerValue];

  int64_t type = v5->_type;
  if (type == 1)
  {
    uint64_t v16 = [v4 objectForKey:@"targetID"];
    targetID = v5->_targetID;
    v5->_targetID = (NSString *)v16;

    if (v5->_targetID)
    {
      uint64_t v18 = [v4 objectForKey:@"publicKey"];
      p_super = &v5->_publicKey->super;
      v5->_publicKey = (NSData *)v18;
LABEL_9:

      goto LABEL_10;
    }
LABEL_12:

    p_super = sub_10009756C();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315650;
      v24 = "-[W5PeerFileTransferRequestPayload initWithRequest:]";
      __int16 v25 = 2080;
      v26 = "W5PeerFileTransferRequestPayload.m";
      __int16 v27 = 1024;
      int v28 = 53;
      _os_log_send_and_compose_impl();
    }
    v5 = 0;
    goto LABEL_9;
  }
  if (!type) {
    goto LABEL_12;
  }
LABEL_10:

  return v5;
}

- (id)encode
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(W5PeerFileTransferRequestPayload *)self version];

  if (v4
    && ([(W5PeerFileTransferRequestPayload *)self version],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v3 setObject:v5 forKey:@"version"],
        v5,
        [(W5PeerFileTransferRequestPayload *)self remotePath],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v6 = [(W5PeerFileTransferRequestPayload *)self remotePath];
    id v7 = [v6 absoluteString];
    [v3 setObject:v7 forKey:@"url"];

    if ([(W5PeerFileTransferRequestPayload *)self type])
    {
      id v8 = [objc_alloc((Class)NSNumber) initWithInteger:-[W5PeerFileTransferRequestPayload type](self, "type")];
      id v20 = 0;
      id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v20];
      id v9 = v20;

      [v3 setObject:v4 forKey:@"type"];
      if ((id)[(W5PeerFileTransferRequestPayload *)self type] == (id)1)
      {
        v10 = [(W5PeerFileTransferRequestPayload *)self targetID];

        if (!v10) {
          goto LABEL_12;
        }
        v11 = [(W5PeerFileTransferRequestPayload *)self targetID];
        [v3 setObject:v11 forKey:@"targetID"];
      }
      v12 = [(W5PeerFileTransferRequestPayload *)self publicKey];

      if (v12)
      {
        v13 = [(W5PeerFileTransferRequestPayload *)self publicKey];
        [v3 setObject:v13 forKey:@"publicKey"];
      }
      id v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315906;
        objc_super v22 = "-[W5PeerFileTransferRequestPayload encode]";
        __int16 v23 = 2080;
        v24 = "W5PeerFileTransferRequestPayload.m";
        __int16 v25 = 1024;
        int v26 = 85;
        __int16 v27 = 2114;
        id v28 = v3;
        LODWORD(v19) = 38;
        uint64_t v18 = &v21;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      id v9 = 0;
      id v4 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_12:
  if (!objc_msgSend(v3, "count", v18, v19))
  {
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerFileTransferRequestPayload encode]");
    id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

    objc_exception_throw(v17);
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

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
}

- (NSURL)remotePath
{
  return self->_remotePath;
}

- (void)setRemotePath:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_remotePath, 0);

  objc_storeStrong((id *)&self->_targetID, 0);
}

@end