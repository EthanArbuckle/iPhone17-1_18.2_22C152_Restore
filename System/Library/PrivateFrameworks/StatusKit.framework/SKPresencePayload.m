@interface SKPresencePayload
+ (BOOL)supportsSecureCoding;
+ (id)logger;
- (BOOL)isEqual:(id)a3;
- (NSData)payloadData;
- (NSDictionary)cachedPayloadDictionary;
- (NSDictionary)payloadDictionary;
- (SKPresencePayload)initWithCoder:(id)a3;
- (SKPresencePayload)initWithData:(id)a3;
- (SKPresencePayload)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedPayloadDictionary:(id)a3;
@end

@implementation SKPresencePayload

- (SKPresencePayload)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPresencePayload;
  v5 = [(SKPresencePayload *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    payloadData = v5->_payloadData;
    v5->_payloadData = (NSData *)v6;
  }
  return v5;
}

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger__logger;
  return v2;
}

uint64_t __27__SKPresencePayload_logger__block_invoke()
{
  logger__logger = (uint64_t)os_log_create("com.apple.StatusKit", "SKPresencePayload");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SKPresencePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];

  uint64_t v6 = [(SKPresencePayload *)self initWithData:v5];
  return v6;
}

- (id)description
{
  v3 = [(SKPresencePayload *)self payloadDictionary];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    v7 = [v4 stringWithFormat:@"<%@: %p payloadDictionary = \"%@\">;", v5, self, v3];;
  }
  else
  {
    v8 = [(SKPresencePayload *)self payloadData];
    v7 = [v4 stringWithFormat:@"<%@: %p payloadData = \"%@\">;", v6, self, v8];;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(SKPresencePayload *)self payloadData];
    if (v6)
    {
    }
    else
    {
      v8 = [v5 payloadData];

      if (!v8)
      {
        char v7 = 1;
        goto LABEL_7;
      }
    }
    objc_super v9 = [(SKPresencePayload *)self payloadData];
    v10 = [v5 payloadData];
    char v7 = [v9 isEqualToData:v10];

LABEL_7:
    goto LABEL_8;
  }
  char v7 = 0;
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(SKPresencePayload *)self payloadData];

  if (!v3) {
    return 0;
  }
  id v4 = [(SKPresencePayload *)self payloadData];
  id v5 = (const void *)[v4 bytes];
  uint64_t v6 = [(SKPresencePayload *)self payloadData];
  CC_SHA256(v5, [v6 length], md);

  char v7 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  unint64_t v8 = [v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SKPresencePayload allocWithZone:a3];
  id v5 = [(SKPresencePayload *)self payloadData];
  uint64_t v6 = [(SKPresencePayload *)v4 initWithData:v5];

  return v6;
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

- (SKPresencePayload)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v9];
    id v5 = v9;
    if (v5)
    {
      uint64_t v6 = +[SKPresencePayload logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKPresencePayload(DictionaryPayloads) initWithDictionary:]((uint64_t)v5, v6);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  char v7 = [(SKPresencePayload *)self initWithData:v4];

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

    uint64_t v6 = [(SKPresencePayload *)v2 payloadData];
    if (v6)
    {
      id v11 = 0;
      id v5 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v11];
      id v7 = v11;
      if (v7)
      {
        unint64_t v8 = +[SKPresencePayload logger];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(SKPresencePayload(DictionaryPayloads) *)(uint64_t)v7 payloadDictionary];
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