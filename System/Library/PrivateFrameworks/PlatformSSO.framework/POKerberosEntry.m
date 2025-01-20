@interface POKerberosEntry
- (BOOL)hasAllRequiredValues;
- (NSData)messageBuffer;
- (NSData)sessionKey;
- (NSString)clientName;
- (NSString)realm;
- (NSString)serviceName;
- (NSString)ticketKeyPath;
- (POKerberosEntry)initWithData:(id)a3;
- (id)dataRepresentation;
- (id)dictionaryRepresentation;
- (int)encryptionKeyType;
- (void)setClientName:(id)a3;
- (void)setEncryptionKeyType:(int)a3;
- (void)setMessageBuffer:(id)a3;
- (void)setRealm:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSessionKey:(id)a3;
- (void)setTicketKeyPath:(id)a3;
@end

@implementation POKerberosEntry

- (BOOL)hasAllRequiredValues
{
  v3 = [(POKerberosEntry *)self ticketKeyPath];
  if ([v3 length])
  {
    v4 = [(POKerberosEntry *)self messageBuffer];
    if ([v4 length])
    {
      v5 = [(POKerberosEntry *)self realm];
      if ([v5 length])
      {
        v6 = [(POKerberosEntry *)self serviceName];
        if ([v6 length])
        {
          v7 = [(POKerberosEntry *)self clientName];
          if ([v7 length] && -[POKerberosEntry encryptionKeyType](self, "encryptionKeyType") >= 1)
          {
            v8 = [(POKerberosEntry *)self sessionKey];
            BOOL v9 = [v8 length] != 0;
          }
          else
          {
            BOOL v9 = 0;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  ticketKeyPath = self->_ticketKeyPath;
  v5 = NSStringFromSelector(sel_ticketKeyPath);
  [v3 setObject:ticketKeyPath forKeyedSubscript:v5];

  v6 = [(NSData *)self->_messageBuffer base64EncodedStringWithOptions:0];
  v7 = NSStringFromSelector(sel_messageBuffer);
  [v3 setObject:v6 forKeyedSubscript:v7];

  realm = self->_realm;
  BOOL v9 = NSStringFromSelector(sel_realm);
  [v3 setObject:realm forKeyedSubscript:v9];

  serviceName = self->_serviceName;
  v11 = NSStringFromSelector(sel_serviceName);
  [v3 setObject:serviceName forKeyedSubscript:v11];

  clientName = self->_clientName;
  v13 = NSStringFromSelector(sel_clientName);
  [v3 setObject:clientName forKeyedSubscript:v13];

  int encryptionKeyType = self->_encryptionKeyType;
  if (encryptionKeyType)
  {
    v15 = [NSNumber numberWithInt:self->_encryptionKeyType];
  }
  else
  {
    v15 = &unk_26E5D33A0;
  }
  v16 = NSStringFromSelector(sel_encryptionKeyType);
  [v3 setObject:v15 forKeyedSubscript:v16];

  if (encryptionKeyType) {
  v17 = [(NSData *)self->_sessionKey base64EncodedStringWithOptions:0];
  }
  v18 = NSStringFromSelector(sel_sessionKey);
  [v3 setObject:v17 forKeyedSubscript:v18];

  id v19 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v19 setFormatOptions:1907];
  v20 = [MEMORY[0x263EFF910] date];
  v21 = [v19 stringFromDate:v20];
  [v3 setObject:v21 forKeyedSubscript:@"created"];

  return v3;
}

- (id)dataRepresentation
{
  v2 = (void *)MEMORY[0x263F08900];
  id v3 = [(POKerberosEntry *)self dictionaryRepresentation];
  uint64_t v9 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:11 error:&v9];
  uint64_t v5 = v9;

  if (v5)
  {
    id v6 = __37__POKerberosEntry_dataRepresentation__block_invoke();
    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

id __37__POKerberosEntry_dataRepresentation__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to serialize kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __37__POKerberosEntry_dataRepresentation__block_invoke_cold_1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return v0;
}

- (POKerberosEntry)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(POKerberosEntry *)self init];
  if (!v5)
  {
LABEL_11:
    v10 = v5;
    goto LABEL_12;
  }
  id v42 = 0;
  uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:16 error:&v42];
  id v7 = v42;
  if (!v7)
  {
    v11 = NSStringFromSelector(sel_ticketKeyPath);
    uint64_t v12 = [v6 objectForKeyedSubscript:v11];
    ticketKeyPath = v5->_ticketKeyPath;
    v5->_ticketKeyPath = (NSString *)v12;

    v14 = NSStringFromSelector(sel_messageBuffer);
    v15 = [v6 objectForKeyedSubscript:v14];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263EFF8F8]);
      v17 = NSStringFromSelector(sel_messageBuffer);
      v18 = [v6 objectForKeyedSubscript:v17];
      uint64_t v19 = [v16 initWithBase64EncodedString:v18 options:0];
      messageBuffer = v5->_messageBuffer;
      v5->_messageBuffer = (NSData *)v19;
    }
    v21 = NSStringFromSelector(sel_realm);
    uint64_t v22 = [v6 objectForKeyedSubscript:v21];
    realm = v5->_realm;
    v5->_realm = (NSString *)v22;

    v24 = NSStringFromSelector(sel_serviceName);
    uint64_t v25 = [v6 objectForKeyedSubscript:v24];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v25;

    v27 = NSStringFromSelector(sel_clientName);
    uint64_t v28 = [v6 objectForKeyedSubscript:v27];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v28;

    v30 = NSStringFromSelector(sel_encryptionKeyType);
    v31 = [v6 objectForKeyedSubscript:v30];

    if (v31) {
      v5->_int encryptionKeyType = [v31 intValue];
    }
    v32 = NSStringFromSelector(sel_sessionKey);
    v33 = [v6 objectForKeyedSubscript:v32];

    if (v33)
    {
      id v34 = objc_alloc(MEMORY[0x263EFF8F8]);
      v35 = NSStringFromSelector(sel_sessionKey);
      v36 = [v6 objectForKeyedSubscript:v35];
      uint64_t v37 = [v34 initWithBase64EncodedString:v36 options:0];
      sessionKey = v5->_sessionKey;
      v5->_sessionKey = (NSData *)v37;
    }
    goto LABEL_11;
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __32__POKerberosEntry_initWithData___block_invoke;
  v40[3] = &unk_264BBECA8;
  id v41 = v7;
  id v8 = v7;
  id v9 = __32__POKerberosEntry_initWithData___block_invoke((uint64_t)v40);

  v10 = 0;
LABEL_12:

  return v10;
}

id __32__POKerberosEntry_initWithData___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to deserialize kerberos entry."];
  uint64_t v2 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __37__POKerberosEntry_dataRepresentation__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);
  }

  return v1;
}

- (NSString)ticketKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTicketKeyPath:(id)a3
{
}

- (NSData)messageBuffer
{
  return self->_messageBuffer;
}

- (void)setMessageBuffer:(id)a3
{
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (int)encryptionKeyType
{
  return self->_encryptionKeyType;
}

- (void)setEncryptionKeyType:(int)a3
{
  self->_int encryptionKeyType = a3;
}

- (NSData)sessionKey
{
  return self->_sessionKey;
}

- (void)setSessionKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_messageBuffer, 0);

  objc_storeStrong((id *)&self->_ticketKeyPath, 0);
}

void __37__POKerberosEntry_dataRepresentation__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end