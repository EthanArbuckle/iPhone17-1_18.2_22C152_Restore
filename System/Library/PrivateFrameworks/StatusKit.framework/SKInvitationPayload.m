@interface SKInvitationPayload
+ (BOOL)supportsSecureCoding;
+ (id)logger;
- (NSData)payloadData;
- (NSDate)dateCreated;
- (NSDictionary)cachedPayloadDictionary;
- (NSDictionary)payloadDictionary;
- (SKInvitationPayload)initWithCoder:(id)a3;
- (SKInvitationPayload)initWithData:(id)a3 dateCreated:(id)a4;
- (SKInvitationPayload)initWithDictionary:(id)a3 dateCreated:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedPayloadDictionary:(id)a3;
@end

@implementation SKInvitationPayload

- (SKInvitationPayload)initWithData:(id)a3 dateCreated:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKInvitationPayload;
  v9 = [(SKInvitationPayload *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadData, a3);
    objc_storeStrong((id *)&v10->_dateCreated, a4);
  }

  return v10;
}

+ (id)logger
{
  if (logger_onceToken_0 != -1) {
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)logger__logger_0;
  return v2;
}

uint64_t __29__SKInvitationPayload_logger__block_invoke()
{
  logger__logger_0 = (uint64_t)os_log_create("com.apple.StatusKit", "SKInvitationPayload");
  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = [(SKInvitationPayload *)self payloadDictionary];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    v6 = [(SKInvitationPayload *)self dateCreated];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; payloadDictionary = \"%@\"; dateCreated = \"%@\">;",
      v5,
      self,
      v3,
    id v7 = v6);
  }
  else
  {
    v6 = [(SKInvitationPayload *)self payloadData];
    id v8 = [(SKInvitationPayload *)self dateCreated];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; payloadData = \"%@\"; dateCreated = \"%@\">;",
      v5,
      self,
      v6,
    id v7 = v8);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  payloadData = self->_payloadData;
  id v5 = a3;
  [v5 encodeObject:payloadData forKey:@"payloadData"];
  [v5 encodeObject:self->_dateCreated forKey:@"dateCreated"];
}

- (SKInvitationPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];

  id v7 = [(SKInvitationPayload *)self initWithData:v5 dateCreated:v6];
  return v7;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
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
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
}

- (SKInvitationPayload)initWithDictionary:(id)a3 dateCreated:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v11 = 0;
    a3 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = +[SKInvitationPayload logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SKInvitationPayload(DictionaryPayloads) initWithDictionary:dateCreated:]((uint64_t)v7, v8);
      }
    }
  }
  v9 = [(SKInvitationPayload *)self initWithData:a3 dateCreated:v6];

  return v9;
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

    id v6 = [(SKInvitationPayload *)v2 payloadData];
    if (v6)
    {
      id v11 = 0;
      id v5 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v11];
      id v7 = v11;
      if (v7)
      {
        id v8 = +[SKInvitationPayload logger];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(SKInvitationPayload(DictionaryPayloads) *)(uint64_t)v7 payloadDictionary];
        }
      }
    }
    else
    {
      id v5 = 0;
    }
    v9 = v2;
    objc_sync_enter(v9);
    objc_storeStrong(p_cachedPayloadDictionary, v5);
    objc_sync_exit(v9);
  }
  return v5;
}

@end