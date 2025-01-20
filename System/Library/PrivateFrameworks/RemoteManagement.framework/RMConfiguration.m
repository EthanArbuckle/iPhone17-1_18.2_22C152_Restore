@interface RMConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSData)content;
- (NSDictionary)assetByIdentifier;
- (NSString)identifier;
- (NSString)serverToken;
- (NSString)type;
- (RMConfiguration)initWithCoder:(id)a3;
- (RMConfiguration)initWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 content:(id)a6 channel:(id)a7 assetByIdentifier:(id)a8;
- (RMManagementChannel)channel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMConfiguration

- (RMConfiguration)initWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 content:(id)a6 channel:(id)a7 assetByIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)RMConfiguration;
  v20 = [(RMConfiguration *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    type = v20->_type;
    v20->_type = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    serverToken = v20->_serverToken;
    v20->_serverToken = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    content = v20->_content;
    v20->_content = (NSData *)v27;

    objc_storeStrong((id *)&v20->_channel, a7);
    uint64_t v29 = [v19 copy];
    assetByIdentifier = v20->_assetByIdentifier;
    v20->_assetByIdentifier = (NSDictionary *)v29;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverToken"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channel"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"assetByIdentifier"];

  id v15 = [(RMConfiguration *)self initWithType:v5 identifier:v6 serverToken:v7 content:v8 channel:v9 assetByIdentifier:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMConfiguration *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(RMConfiguration *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(RMConfiguration *)self serverToken];
  [v4 encodeObject:v7 forKey:@"serverToken"];

  v8 = [(RMConfiguration *)self content];
  [v4 encodeObject:v8 forKey:@"content"];

  v9 = [(RMConfiguration *)self channel];
  [v4 encodeObject:v9 forKey:@"channel"];

  id v10 = [(RMConfiguration *)self assetByIdentifier];
  [v4 encodeObject:v10 forKey:@"assetByIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMConfiguration *)self isEqualToConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RMConfiguration *)self hash];
  if (v5 == [v4 hash])
  {
    v6 = [(RMConfiguration *)self identifier];
    v7 = [v4 identifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(RMConfiguration *)self serverToken];
      v9 = [v4 serverToken];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(RMConfiguration *)self type];
        uint64_t v11 = [v4 type];
        if ([v10 isEqualToString:v11])
        {
          uint64_t v12 = [(RMConfiguration *)self channel];
          v13 = [v4 channel];
          if ([v12 isEqualToChannel:v13])
          {
            uint64_t v29 = v12;
            id v14 = [(RMConfiguration *)self content];
            [v4 content];
            v28 = v30 = v14;
            if (objc_msgSend(v14, "isEqualToData:"))
            {
              id v15 = [(RMConfiguration *)self assetByIdentifier];
              uint64_t v25 = [v4 assetByIdentifier];
              id v16 = v15;
              id v17 = v25;
              id v18 = v17;
              id v19 = v16;
              BOOL v20 = v16 == v17;
              uint64_t v12 = v29;
              uint64_t v27 = v19;
              if (v20)
              {
                BOOL v21 = 1;
              }
              else
              {
                BOOL v21 = 0;
                if (v19 && v17)
                {
                  id v22 = v17;
                  char v23 = [v19 isEqual:v17];
                  id v18 = v22;
                  BOOL v21 = v23;
                }
              }
              v26 = v18;
            }
            else
            {
              BOOL v21 = 0;
              uint64_t v12 = v29;
            }
          }
          else
          {
            BOOL v21 = 0;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  v3 = [(RMConfiguration *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(RMConfiguration *)self serverToken];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RMConfiguration *)self content];
  uint64_t v8 = [v7 hash];
  v9 = [(RMConfiguration *)self channel];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(RMConfiguration *)self type];
  uint64_t v12 = [v11 hash];
  v13 = [(RMConfiguration *)self assetByIdentifier];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serverToken
{
  return self->_serverToken;
}

- (NSData)content
{
  return self->_content;
}

- (RMManagementChannel)channel
{
  return self->_channel;
}

- (NSDictionary)assetByIdentifier
{
  return self->_assetByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetByIdentifier, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_serverToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end