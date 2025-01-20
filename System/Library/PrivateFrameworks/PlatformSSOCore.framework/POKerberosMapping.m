@interface POKerberosMapping
- (NSString)clientNameKeyName;
- (NSString)encryptionKeyTypeKeyName;
- (NSString)messageBufferKeyName;
- (NSString)realmKeyName;
- (NSString)serviceNameKeyName;
- (NSString)sessionKeyKeyName;
- (NSString)ticketKeyPath;
- (POKerberosMapping)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (void)setClientNameKeyName:(id)a3;
- (void)setEncryptionKeyTypeKeyName:(id)a3;
- (void)setMessageBufferKeyName:(id)a3;
- (void)setRealmKeyName:(id)a3;
- (void)setServiceNameKeyName:(id)a3;
- (void)setSessionKeyKeyName:(id)a3;
- (void)setTicketKeyPath:(id)a3;
@end

@implementation POKerberosMapping

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  ticketKeyPath = self->_ticketKeyPath;
  v5 = NSStringFromSelector(sel_ticketKeyPath);
  [v3 setObject:ticketKeyPath forKeyedSubscript:v5];

  messageBufferKeyName = self->_messageBufferKeyName;
  v7 = NSStringFromSelector(sel_messageBufferKeyName);
  [v3 setObject:messageBufferKeyName forKeyedSubscript:v7];

  realmKeyName = self->_realmKeyName;
  v9 = NSStringFromSelector(sel_realmKeyName);
  [v3 setObject:realmKeyName forKeyedSubscript:v9];

  serviceNameKeyName = self->_serviceNameKeyName;
  v11 = NSStringFromSelector(sel_serviceNameKeyName);
  [v3 setObject:serviceNameKeyName forKeyedSubscript:v11];

  clientNameKeyName = self->_clientNameKeyName;
  v13 = NSStringFromSelector(sel_clientNameKeyName);
  [v3 setObject:clientNameKeyName forKeyedSubscript:v13];

  encryptionKeyTypeKeyName = self->_encryptionKeyTypeKeyName;
  v15 = NSStringFromSelector(sel_encryptionKeyTypeKeyName);
  [v3 setObject:encryptionKeyTypeKeyName forKeyedSubscript:v15];

  sessionKeyKeyName = self->_sessionKeyKeyName;
  v17 = NSStringFromSelector(sel_sessionKeyKeyName);
  [v3 setObject:sessionKeyKeyName forKeyedSubscript:v17];

  return v3;
}

- (POKerberosMapping)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(POKerberosMapping *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_ticketKeyPath);
    uint64_t v7 = [v4 objectForKeyedSubscript:v6];
    ticketKeyPath = v5->_ticketKeyPath;
    v5->_ticketKeyPath = (NSString *)v7;

    v9 = NSStringFromSelector(sel_messageBufferKeyName);
    uint64_t v10 = [v4 objectForKeyedSubscript:v9];
    messageBufferKeyName = v5->_messageBufferKeyName;
    v5->_messageBufferKeyName = (NSString *)v10;

    v12 = NSStringFromSelector(sel_realmKeyName);
    uint64_t v13 = [v4 objectForKeyedSubscript:v12];
    realmKeyName = v5->_realmKeyName;
    v5->_realmKeyName = (NSString *)v13;

    v15 = NSStringFromSelector(sel_serviceNameKeyName);
    uint64_t v16 = [v4 objectForKeyedSubscript:v15];
    serviceNameKeyName = v5->_serviceNameKeyName;
    v5->_serviceNameKeyName = (NSString *)v16;

    v18 = NSStringFromSelector(sel_clientNameKeyName);
    uint64_t v19 = [v4 objectForKeyedSubscript:v18];
    clientNameKeyName = v5->_clientNameKeyName;
    v5->_clientNameKeyName = (NSString *)v19;

    v21 = NSStringFromSelector(sel_encryptionKeyTypeKeyName);
    uint64_t v22 = [v4 objectForKeyedSubscript:v21];
    encryptionKeyTypeKeyName = v5->_encryptionKeyTypeKeyName;
    v5->_encryptionKeyTypeKeyName = (NSString *)v22;

    v24 = NSStringFromSelector(sel_sessionKeyKeyName);
    uint64_t v25 = [v4 objectForKeyedSubscript:v24];
    sessionKeyKeyName = v5->_sessionKeyKeyName;
    v5->_sessionKeyKeyName = (NSString *)v25;
  }
  return v5;
}

- (NSString)ticketKeyPath
{
  return self->_ticketKeyPath;
}

- (void)setTicketKeyPath:(id)a3
{
}

- (NSString)messageBufferKeyName
{
  return self->_messageBufferKeyName;
}

- (void)setMessageBufferKeyName:(id)a3
{
}

- (NSString)realmKeyName
{
  return self->_realmKeyName;
}

- (void)setRealmKeyName:(id)a3
{
}

- (NSString)serviceNameKeyName
{
  return self->_serviceNameKeyName;
}

- (void)setServiceNameKeyName:(id)a3
{
}

- (NSString)clientNameKeyName
{
  return self->_clientNameKeyName;
}

- (void)setClientNameKeyName:(id)a3
{
}

- (NSString)encryptionKeyTypeKeyName
{
  return self->_encryptionKeyTypeKeyName;
}

- (void)setEncryptionKeyTypeKeyName:(id)a3
{
}

- (NSString)sessionKeyKeyName
{
  return self->_sessionKeyKeyName;
}

- (void)setSessionKeyKeyName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKeyKeyName, 0);
  objc_storeStrong((id *)&self->_encryptionKeyTypeKeyName, 0);
  objc_storeStrong((id *)&self->_clientNameKeyName, 0);
  objc_storeStrong((id *)&self->_serviceNameKeyName, 0);
  objc_storeStrong((id *)&self->_realmKeyName, 0);
  objc_storeStrong((id *)&self->_messageBufferKeyName, 0);
  objc_storeStrong((id *)&self->_ticketKeyPath, 0);
}

@end