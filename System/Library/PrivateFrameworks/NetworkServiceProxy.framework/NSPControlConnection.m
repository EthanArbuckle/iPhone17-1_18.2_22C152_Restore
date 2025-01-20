@interface NSPControlConnection
- (id)initFromConnection:(id)a3;
- (id)initFromMetadata:(id)a3;
- (id)initFromNWConnection:(id)a3;
- (id)initFromStream:(id)a3;
- (id)initFromTask:(id)a3;
- (unint64_t)flowIdentifier;
- (void)fetchConnectionInfoWithCompletionHandler:(id)a3;
@end

@implementation NSPControlConnection

- (id)initFromMetadata:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NSPControlConnection;
  v5 = [(NSPControlConnection *)&v12 init];
  if (!v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v6 = createPropertiesFromMetaData(v4);
  if (!v6)
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to create flow properties from the connection metadata", v11, 2u);
    }

    goto LABEL_9;
  }
  v7 = v6;
  v5->_flowIdentifier = [v6 flowIdentifier];

LABEL_5:
  v8 = v5;
LABEL_10:

  return v8;
}

- (id)initFromStream:(id)a3
{
  id v4 = [a3 propertyForKey:*MEMORY[0x1E4F18F10]];
  id v5 = [(NSPControlConnection *)self initFromMetadata:v4];

  return v5;
}

- (id)initFromTask:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 performSelector:sel__TCPConnectionMetadata];
    if (v5)
    {
      self = (NSPControlConnection *)[(NSPControlConnection *)self initFromMetadata:v5];

      id v5 = self;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)initFromConnection:(id)a3
{
  id v4 = [a3 metadata];
  id v5 = [(NSPControlConnection *)self initFromMetadata:v4];

  return v5;
}

- (id)initFromNWConnection:(id)a3
{
  if (a3)
  {
    uint64_t v4 = nw_connection_copy_metadata();
    id v5 = (void *)v4;
    if (v4 && MEMORY[0x1A622BC50](v4) == MEMORY[0x1E4F14580])
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      v9 = (void *)[v7 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v5) freeWhenDone:0];
      self = (NSPControlConnection *)[(NSPControlConnection *)self initFromMetadata:v9];

      v6 = self;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchConnectionInfoWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = +[NSPManager sharedManager];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSPControlConnection flowIdentifier](self, "flowIdentifier"));
  id v7 = [v5 getConnectionInfoForIdentifier:v6];

  v8 = nplog_obj();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      unint64_t v14 = [(NSPControlConnection *)self flowIdentifier];
      v10 = "Got connection info for flow %lu";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1A0FEE000, v11, v12, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    unint64_t v14 = [(NSPControlConnection *)self flowIdentifier];
    v10 = "Failed to get connection info for flow %lu";
    v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  v4[2](v4, v7);
}

- (unint64_t)flowIdentifier
{
  return self->_flowIdentifier;
}

@end