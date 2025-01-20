@interface _StoreStatus
- (BOOL)needsResetSync;
- (NSNumber)seqId;
- (_StoreStatus)initWithPersistencePath:(id)a3;
- (void)_persistStatus;
- (void)setNeedsResetSync:(BOOL)a3;
- (void)setSeqId:(id)a3;
@end

@implementation _StoreStatus

- (_StoreStatus)initWithPersistencePath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_StoreStatus;
  v6 = [(_StoreStatus *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistencePath, a3);
    v8 = +[NSDictionary dictionaryWithContentsOfFile:v7->_persistencePath];
    objc_opt_class();
    NTKValidateDictionaryValue();
    objc_opt_class();
    NTKValidateDictionaryValue();
    if (v8)
    {
      v9 = (NSMutableDictionary *)[v8 mutableCopy];
      status = v7->_status;
      v7->_status = v9;
    }
    else
    {
      uint64_t v11 = +[NSMutableDictionary dictionary];
      v8 = v7->_status;
      v7->_status = (NSMutableDictionary *)v11;
    }
  }
  return v7;
}

- (BOOL)needsResetSync
{
  v2 = [(NSMutableDictionary *)self->_status objectForKey:@"needs-reset-sync"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNeedsResetSync:(BOOL)a3
{
  status = self->_status;
  id v5 = +[NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)status setObject:v5 forKey:@"needs-reset-sync"];

  [(_StoreStatus *)self _persistStatus];
}

- (NSNumber)seqId
{
  return (NSNumber *)[(NSMutableDictionary *)self->_status objectForKey:@"sequence-id"];
}

- (void)setSeqId:(id)a3
{
  status = self->_status;
  if (a3) {
    [(NSMutableDictionary *)status setObject:a3 forKey:@"sequence-id"];
  }
  else {
    [(NSMutableDictionary *)status removeObjectForKey:@"sequence-id"];
  }
  [(_StoreStatus *)self _persistStatus];
}

- (void)_persistStatus
{
  if (self->_persistencePath)
  {
    unsigned __int8 v3 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
    status = self->_status;
    id v8 = 0;
    unsigned __int8 v5 = [(NSMutableDictionary *)status writeToURL:v3 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_1000450B8((uint64_t)v6, v7);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
}

@end