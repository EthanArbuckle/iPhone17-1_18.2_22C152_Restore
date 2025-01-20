@interface SPXPCMessage
- (BOOL)needsReply;
- (NSDictionary)info;
- (NSString)name;
- (OS_xpc_object)feedbackData;
- (SPXPCMessage)init;
- (SPXPCMessage)initWithName:(id)a3;
- (SPXPCMessage)initWithName:(id)a3 batchSize:(unint64_t)a4;
- (SPXPCMessage)initWithName:(id)a3 connection:(id)a4;
- (id)_createXPCMessage;
- (id)_initWithXPCMessage:(id)a3 onConnection:(id)a4;
- (id)objectsOfClasses:(id)a3 atIndex:(unint64_t)a4;
- (id)rootObjectOfClasses:(id)a3;
- (id)rootObjectOfClassesForFeedback:(id)a3;
- (void)sendReply:(id)a3;
- (void)setInfo:(id)a3;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setRootObject:(id)a3;
- (void)setRootObjectForFeedback:(id)a3;
@end

@implementation SPXPCMessage

- (NSDictionary)info
{
  return self->_info;
}

- (OS_xpc_object)feedbackData
{
  return self->_x_feedbackData;
}

- (void)setRootObject:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08910];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  [v9 encodeObject:v5 forKey:*MEMORY[0x263F081D0]];

  [v9 finishEncoding];
  id v6 = [v9 encodedData];
  v7 = (OS_xpc_object *)xpc_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"));
  x_rootObject = self->_x_rootObject;
  self->_x_rootObject = v7;
}

- (void)setInfo:(id)a3
{
}

- (void)setRootObjectForFeedback:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08910];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  [v9 encodeObject:v5 forKey:*MEMORY[0x263F081D0]];

  [v9 finishEncoding];
  id v6 = [v9 encodedData];
  v7 = (OS_xpc_object *)xpc_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"));
  x_feedbackData = self->_x_feedbackData;
  self->_x_feedbackData = v7;
}

- (id)_createXPCMessage
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_string_create([(NSString *)self->_name UTF8String]);
  info = self->_info;
  if (info
    && ([MEMORY[0x263F08AC0] dataWithPropertyList:info format:200 options:0 error:0],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    xpc_object_t v7 = xpc_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  else
  {
    xpc_object_t v7 = 0;
    id v6 = 0;
  }
  *(_OWORD *)keys = xmmword_2644B3190;
  long long v15 = *(_OWORD *)off_2644B31A0;
  v16 = "kDKMessageFeedbackDataKey";
  id v8 = v3;
  values[0] = v8;
  id v9 = v7;
  values[1] = v9;
  values[2] = self->_x_Objects;
  values[3] = self->_x_rootObject;
  values[4] = self->_x_feedbackData;
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
  for (uint64_t i = 4; i != -1; --i)

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (id)_initWithXPCMessage:(id)a3 onConnection:(id)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SPXPCMessage *)self init];
  xpc_object_t v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_receivingConnection, v8);
    string = xpc_dictionary_get_string(v7, "kDKMessageNameKey");
    if (string)
    {
      uint64_t v12 = [[NSString alloc] initWithUTF8String:string];
      name = v10->_name;
      v10->_name = (NSString *)v12;
    }
    else
    {
      name = v10->_name;
      v10->_name = 0;
    }

    size_t v33 = 0;
    data = xpc_dictionary_get_data(v7, "kDKMessageInfoKey", &v33);
    long long v15 = 0;
    if (data && v33)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:data length:v33 freeWhenDone:0];
      if (v16)
      {
        id v34 = 0;
        long long v15 = [MEMORY[0x263F08AC0] propertyListWithData:v16 options:0 format:0 error:&v34];
        id v17 = v34;
        if (v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[SPXPCMessage _initWithXPCMessage:onConnection:]();
        }
      }
      else
      {
        id v17 = 0;
        long long v15 = 0;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_info, v15);
    }
    uint64_t v18 = xpc_dictionary_get_value(v7, "kDKMessageObjectGraphKey");
    x_Objects = v10->_x_Objects;
    v10->_x_Objects = (OS_xpc_object *)v18;

    uint64_t v20 = xpc_dictionary_get_value(v7, "kDKMessageObjectRootGraphKey");
    x_rootObject = v10->_x_rootObject;
    v10->_x_rootObject = (OS_xpc_object *)v20;

    uint64_t v22 = xpc_dictionary_get_value(v7, "kDKMessageFeedbackDataKey");
    x_feedbackData = v10->_x_feedbackData;
    v10->_x_feedbackData = (OS_xpc_object *)v22;

    objc_storeStrong((id *)&v10->_x_message, a3);
    reply = (OS_xpc_object *)xpc_dictionary_create_reply(v7);
    x_reply = v10->_x_reply;
    v10->_x_reply = reply;

    if (v10->_x_reply)
    {
      uint64_t v26 = xpc_dictionary_get_remote_connection(v7);
      x_reply_connection = v10->_x_reply_connection;
      v10->_x_reply_connection = (OS_xpc_object *)v26;

      v28 = v10->_name;
      if (v28)
      {
        v35[0] = v10->_name;
        v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
      }
      else
      {
        v29 = 0;
      }
      uint64_t v30 = SPTransactionCreate(v29);
      replyTransaction = v10->_replyTransaction;
      v10->_replyTransaction = (OS_os_transaction *)v30;

      if (v28) {
    }
      }
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_replyTransaction, 0);
  objc_storeStrong((id *)&self->_x_feedbackData, 0);
  objc_storeStrong((id *)&self->_x_reply, 0);
  objc_storeStrong((id *)&self->_x_Objects, 0);
  objc_storeStrong((id *)&self->_x_rootObject, 0);
  objc_storeStrong((id *)&self->_x_message, 0);
  objc_storeStrong((id *)&self->_x_reply_connection, 0);

  objc_destroyWeak((id *)&self->_receivingConnection);
}

- (SPXPCMessage)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(SPXPCMessage *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (SPXPCMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPXPCMessage;
  result = [(SPXPCMessage *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (SPXPCMessage)initWithName:(id)a3 batchSize:(unint64_t)a4
{
  id v5 = [(SPXPCMessage *)self initWithName:a3];
  if (v5)
  {
    uint64_t v6 = (OS_xpc_object *)xpc_array_create(0, 0);
    x_Objects = v5->_x_Objects;
    v5->_x_Objects = v6;

    for (; a4; --a4)
    {
      id v8 = v5->_x_Objects;
      xpc_object_t v9 = xpc_null_create();
      xpc_array_append_value(v8, v9);
    }
  }
  return v5;
}

- (SPXPCMessage)initWithName:(id)a3 connection:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = -[SPXPCMessage initWithName:](self, "initWithName:", a3, a4);
  id v5 = v4;
  if (v4)
  {
    name = v4->_name;
    if (name)
    {
      v11[0] = v4->_name;
      id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v8 = SPTransactionCreate(v7);
    replyTransaction = v5->_replyTransaction;
    v5->_replyTransaction = (OS_os_transaction *)v8;

    if (name) {
  }
    }
  return v5;
}

- (id)rootObjectOfClasses:(id)a3
{
  id v4 = a3;
  x_rootObject = self->_x_rootObject;
  if (!x_rootObject) {
    goto LABEL_5;
  }
  bytes_ptr = (void *)xpc_data_get_bytes_ptr(x_rootObject);
  if (!bytes_ptr) {
    goto LABEL_6;
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(self->_x_rootObject) freeWhenDone:0];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    xpc_object_t v9 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v7 error:0];
    bytes_ptr = [v9 decodeObjectOfClasses:v4 forKey:*MEMORY[0x263F081D0]];
  }
  else
  {
LABEL_5:
    bytes_ptr = 0;
  }
LABEL_6:

  return bytes_ptr;
}

- (id)objectsOfClasses:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  size_t length = 0;
  x_Objects = self->_x_Objects;
  if (x_Objects
    && xpc_array_get_count(x_Objects) > a4
    && (data = xpc_array_get_data(self->_x_Objects, a4, &length)) != 0
    && (xpc_object_t v9 = data,
        id v10 = objc_alloc(MEMORY[0x263EFF8F8]),
        (uint64_t v11 = [v10 initWithBytesNoCopy:v9 length:length freeWhenDone:0]) != 0))
  {
    uint64_t v12 = (void *)v11;
    v13 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v11 error:0];
    v14 = [NSString stringWithFormat:@"%@_%lu", @"kMessageResultSetDataKey", a4];
    long long v15 = [v13 decodeObjectOfClasses:v6 forKey:v14];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x263F08910];
  id v7 = a3;
  id v14 = (id)[[v6 alloc] initRequiringSecureCoding:1];
  uint64_t v8 = [NSString stringWithFormat:@"%@_%lu", @"kMessageResultSetDataKey", a4];
  [v14 encodeObject:v7 forKey:v8];

  [v14 finishEncoding];
  xpc_object_t v9 = [v14 encodedData];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  x_Objects = self->_x_Objects;
  id v12 = v9;
  xpc_object_t v13 = xpc_data_create((const void *)[v12 bytes], objc_msgSend(v12, "length"));
  xpc_array_set_value(x_Objects, a4, v13);

  os_unfair_lock_unlock(p_lock);
}

- (id)rootObjectOfClassesForFeedback:(id)a3
{
  id v4 = a3;
  x_feedbackData = self->_x_feedbackData;
  if (!x_feedbackData) {
    goto LABEL_5;
  }
  bytes_ptr = (void *)xpc_data_get_bytes_ptr(x_feedbackData);
  if (!bytes_ptr) {
    goto LABEL_6;
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(self->_x_feedbackData) freeWhenDone:0];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    xpc_object_t v9 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v7 error:0];
    bytes_ptr = [v9 decodeObjectOfClasses:v4 forKey:*MEMORY[0x263F081D0]];
  }
  else
  {
LABEL_5:
    bytes_ptr = 0;
  }
LABEL_6:

  return bytes_ptr;
}

- (void)sendReply:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (self->_x_reply && self->_x_reply_connection)
  {
    if (v5)
    {
      id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v5 format:200 options:0 error:0];
    }
    else
    {
      id v6 = 0;
    }
    if ([v6 length])
    {
      x_reply = self->_x_reply;
      id v9 = v6;
      xpc_dictionary_set_data(x_reply, "kDKMessageInfoKey", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    }
    xpc_connection_send_message(self->_x_reply_connection, self->_x_reply);
    SPTransactionDone(self->_replyTransaction);
    replyTransaction = self->_replyTransaction;
    self->_replyTransaction = 0;
  }
  else
  {
    uint64_t v7 = self->_replyTransaction;
    if (v7)
    {
      SPTransactionDone(v7);
      id v6 = self->_replyTransaction;
      self->_replyTransaction = 0;
    }
    else
    {
      id v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"SPXPCConnection.m" lineNumber:650 description:@"Trying to send reply where one isn't expected"];
    }
  }
}

- (BOOL)needsReply
{
  return self->_x_reply && self->_x_reply_connection != 0;
}

- (void)_initWithXPCMessage:onConnection:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21E5D7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error deserializing plist %@", v0, 0xCu);
}

@end