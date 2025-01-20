@interface MBMessage
+ (id)_allowedClasses;
+ (id)messageWithName:(id)a3 arguments:(id)a4;
+ (id)messageWithName:(id)a3 arguments:(id)a4 personaIdentifier:(id)a5;
- (MBConnection)connection;
- (MBMessage)initWithName:(id)a3 arguments:(id)a4;
- (NSArray)arguments;
- (NSError)error;
- (NSError)replyError;
- (NSMutableDictionary)messageInfo;
- (NSMutableDictionary)replyInfo;
- (NSSecureCoding)reply;
- (NSString)description;
- (NSString)name;
- (NSString)personaIdentifier;
- (OS_xpc_object)xpcObject;
- (id)_initWithXPCObject:(id)a3;
- (id)_xpcObject;
- (void)_xpcObject;
- (void)archiver:(id)a3 didEncodeObject:(id)a4;
- (void)sendReply;
- (void)setConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setMessageInfo:(id)a3;
- (void)setReply:(id)a3;
- (void)setReplyError:(id)a3;
- (void)setReplyInfo:(id)a3;
- (void)setXpcObject:(id)a3;
@end

@implementation MBMessage

+ (id)_allowedClasses
{
  if (_allowedClasses_onceToken != -1) {
    dispatch_once(&_allowedClasses_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_allowedClasses_sAllowedClasses;
  return v2;
}

uint64_t __28__MBMessage__allowedClasses__block_invoke()
{
  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13,
    v12,
    v11,
    v0,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    objc_opt_class(),
  _allowedClasses_sAllowedClasses = 0);
  return MEMORY[0x1F41817F8]();
}

- (id)_initWithXPCObject:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MBMessage;
  uint64_t v6 = [(MBMessage *)&v24 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcObject, a3);
    size_t length = 0;
    data = xpc_dictionary_get_data(v7->_xpcObject, "messageInfo", &length);
    if (data)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:0];
      uint64_t v11 = [(id)objc_opt_class() _allowedClasses];
      uint64_t v12 = [v10 decodeObjectOfClasses:v11 forKey:*MEMORY[0x1E4F284E8]];
      messageInfo = v7->_messageInfo;
      v7->_messageInfo = (NSMutableDictionary *)v12;

      uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      replyInfo = v7->_replyInfo;
      v7->_replyInfo = v14;
    }
    else
    {
      uint64_t v16 = xpc_dictionary_get_data(v7->_xpcObject, "replyInfo", &length);
      if (!v16)
      {
        id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"invalid xpc object" userInfo:0];
        objc_exception_throw(v22);
      }
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v16 length:length freeWhenDone:0];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:0];
      uint64_t v17 = [(id)objc_opt_class() _allowedClasses];
      uint64_t v18 = [v10 decodeObjectOfClasses:v17 forKey:*MEMORY[0x1E4F284E8]];
      uint64_t v19 = v7->_replyInfo;
      v7->_replyInfo = (NSMutableDictionary *)v18;

      uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      replyInfo = v7->_messageInfo;
      v7->_messageInfo = v20;
    }
  }
  return v7;
}

+ (id)messageWithName:(id)a3 arguments:(id)a4 personaIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MBMessage alloc] initWithName:v9 arguments:v8];

  if (v7)
  {
    uint64_t v11 = [(MBMessage *)v10 messageInfo];
    [v11 setObject:v7 forKeyedSubscript:@"personaIdentifier"];
  }
  return v10;
}

+ (id)messageWithName:(id)a3 arguments:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MBMessage alloc] initWithName:v6 arguments:v5];

  return v7;
}

- (MBMessage)initWithName:(id)a3 arguments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MBConnection.m" lineNumber:303 description:@"must provide a name"];
  }
  v18.receiver = self;
  v18.super_class = (Class)MBMessage;
  id v9 = [(MBMessage *)&v18 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = (void *)[v7 copy];
    uint64_t v12 = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, @"name", 0);
    messageInfo = v9->_messageInfo;
    v9->_messageInfo = (NSMutableDictionary *)v12;

    if (v8) {
      [(NSMutableDictionary *)v9->_messageInfo setObject:v8 forKeyedSubscript:@"arguments"];
    }
    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    replyInfo = v9->_replyInfo;
    v9->_replyInfo = v14;
  }
  return v9;
}

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->_messageInfo objectForKeyedSubscript:@"name"];
}

- (NSArray)arguments
{
  return (NSArray *)[(NSMutableDictionary *)self->_messageInfo objectForKeyedSubscript:@"arguments"];
}

- (NSString)personaIdentifier
{
  return (NSString *)[(NSMutableDictionary *)self->_messageInfo objectForKeyedSubscript:@"personaIdentifier"];
}

- (NSError)error
{
  return (NSError *)[(NSMutableDictionary *)self->_messageInfo objectForKeyedSubscript:@"error"];
}

- (void)setError:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_messageInfo setObject:a3 forKeyedSubscript:@"error"];
  }
}

- (void)archiver:(id)a3 didEncodeObject:(id)a4
{
  id v4 = a4;
  if (MBIsInternalInstall())
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = [v6 isEqualToString:@"CKRecordID"];

    if (v7)
    {
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_FAULT, "Improper error sanitizing: CKRecordID leaked", (uint8_t *)&v15, 2u);
        _MBLog(@"FAULT", (uint64_t)"Improper error sanitizing: CKRecordID leaked", v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
}

- (void)sendReply
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MBMessage *)self replyError];
  xpc_dictionary_get_remote_connection(self->_xpcObject);
  id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(self->_xpcObject);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v6 setDelegate:self];
  [v6 encodeObject:self->_replyInfo forKey:*MEMORY[0x1E4F284E8]];
  [v6 finishEncoding];
  id v7 = [v6 encodedData];
  xpc_object_t v8 = xpc_data_create((const void *)[v7 bytes], objc_msgSend(v7, "length"));
  xpc_dictionary_set_value(reply, "replyInfo", v8);
  if (v3)
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(MBMessage *)self name];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v3;
      _os_log_impl(&dword_1DD9AE000, v9, OS_LOG_TYPE_DEFAULT, "Sending reply for \"%{public}@\": %@", buf, 0x16u);

      uint64_t v11 = [(MBMessage *)self name];
      _MBLog(@"DEFAULT", (uint64_t)"Sending reply for \"%{public}@\": %@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
  }
  xpc_connection_send_message(v4, reply);
}

- (void)setReply:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_replyInfo setObject:a3 forKeyedSubscript:@"info"];
  }
}

- (NSSecureCoding)reply
{
  return (NSSecureCoding *)[(NSMutableDictionary *)self->_replyInfo objectForKeyedSubscript:@"info"];
}

- (void)setReplyError:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_replyInfo setObject:a3 forKeyedSubscript:@"error"];
  }
}

- (NSError)replyError
{
  return (NSError *)[(NSMutableDictionary *)self->_replyInfo objectForKeyedSubscript:@"error"];
}

- (id)_xpcObject
{
  xpcObject = self->_xpcObject;
  if (!xpcObject)
  {
    id v4 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    id v5 = self->_xpcObject;
    self->_xpcObject = v4;

    messageInfo = self->_messageInfo;
    id v12 = 0;
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:messageInfo requiringSecureCoding:1 error:&v12];
    id v8 = v12;
    if (!v7) {
      [(MBMessage *)(uint64_t *)&self->_messageInfo _xpcObject];
    }
    id v9 = v7;
    xpc_object_t v10 = xpc_data_create((const void *)[v9 bytes], objc_msgSend(v9, "length"));
    xpc_dictionary_set_value(self->_xpcObject, "messageInfo", v10);

    xpcObject = self->_xpcObject;
  }
  return xpcObject;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MBMessage;
  id v4 = [(MBMessage *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_messageInfo];

  return (NSString *)v5;
}

- (MBConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (void)setXpcObject:(id)a3
{
}

- (NSMutableDictionary)messageInfo
{
  return self->_messageInfo;
}

- (void)setMessageInfo:(id)a3
{
}

- (NSMutableDictionary)replyInfo
{
  return self->_replyInfo;
}

- (void)setReplyInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyInfo, 0);
  objc_storeStrong((id *)&self->_messageInfo, 0);
  objc_storeStrong((id *)&self->_xpcObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_xpcObject
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *a1;
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_ERROR, "Failed to archive the message (%@): %@", buf, 0x16u);
    _MBLog(@"ERROR", (uint64_t)"Failed to archive the message (%@): %@", v6, v7, v8, v9, v10, v11, *a1);
  }

  __assert_rtn("-[MBMessage _xpcObject]", "MBConnection.m", 382, "0");
}

@end