@interface SKStatusPayload
+ (BOOL)supportsSecureCoding;
+ (id)logger;
- (NSData)payloadData;
- (NSDictionary)cachedPayloadDictionary;
- (NSDictionary)payloadDictionary;
- (SKStatusPayload)initWithCoder:(id)a3;
- (SKStatusPayload)initWithData:(id)a3;
- (SKStatusPayload)initWithDictionary:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedPayloadDictionary:(id)a3;
@end

@implementation SKStatusPayload

- (SKStatusPayload)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKStatusPayload;
  v6 = [(SKStatusPayload *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_payloadData, a3);
  }

  return v7;
}

+ (id)logger
{
  if (logger_onceToken_4 != -1) {
    dispatch_once(&logger_onceToken_4, &__block_literal_global_4);
  }
  v2 = (void *)logger__logger_4;
  return v2;
}

uint64_t __25__SKStatusPayload_logger__block_invoke()
{
  logger__logger_4 = (uint64_t)os_log_create("com.apple.StatusKit", "SKStatusPayload");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SKStatusPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadData"];

  v6 = [(SKStatusPayload *)self initWithData:v5];
  return v6;
}

- (id)description
{
  v3 = [(SKStatusPayload *)self payloadDictionary];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    v7 = [v4 stringWithFormat:@"<%@: %p payloadDictionary = \"%@\">;", v5, self, v3];;
  }
  else
  {
    v8 = [(SKStatusPayload *)self payloadData];
    v7 = [v4 stringWithFormat:@"<%@: %p payloadData = \"%@\">;", v6, self, v8];;
  }
  return v7;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (NSDictionary)cachedPayloadDictionary
{
  return self->_cachedPayloadDictionary;
}

- (void)setCachedPayloadDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPayloadDictionary, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
}

- (SKStatusPayload)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v9];
    id v5 = v9;
    if (v5)
    {
      uint64_t v6 = +[SKStatusPayload logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKInvitationPayload(DictionaryPayloads) initWithDictionary:dateCreated:]((uint64_t)v5, v6);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  v7 = [(SKStatusPayload *)self initWithData:v4];

  return v7;
}

- (NSDictionary)payloadDictionary
{
  v2 = self;
  objc_sync_enter(v2);
  p_cachedPayloadDictionary = (id *)&v2->_cachedPayloadDictionary;
  cachedPayloadDictionary = v2->_cachedPayloadDictionary;
  if (cachedPayloadDictionary)
  {
    id v5 = cachedPayloadDictionary;
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    uint64_t v6 = [(SKStatusPayload *)v2 payloadData];
    if (v6)
    {
      id v11 = 0;
      id v5 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v11];
      id v7 = v11;
      if (v7)
      {
        v8 = +[SKStatusPayload logger];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(SKInvitationPayload(DictionaryPayloads) *)(uint64_t)v7 payloadDictionary];
        }
      }
    }
    else
    {
      id v5 = 0;
    }
    id v9 = v2;
    objc_sync_enter(v9);
    objc_storeStrong(p_cachedPayloadDictionary, v5);
    objc_sync_exit(v9);
  }
  return v5;
}

@end