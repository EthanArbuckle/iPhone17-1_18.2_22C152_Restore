@interface RMAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAsset:(id)a3;
- (NSData)content;
- (NSString)identifier;
- (NSString)serverToken;
- (NSString)type;
- (RMAsset)initWithCoder:(id)a3;
- (RMAsset)initWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 content:(id)a6 channel:(id)a7;
- (RMManagementChannel)channel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMAsset

- (RMAsset)initWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 content:(id)a6 channel:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)RMAsset;
  v17 = [(RMAsset *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    type = v17->_type;
    v17->_type = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    serverToken = v17->_serverToken;
    v17->_serverToken = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    content = v17->_content;
    v17->_content = (NSData *)v24;

    objc_storeStrong((id *)&v17->_channel, a7);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverToken"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channel"];

  v10 = [(RMAsset *)self initWithType:v5 identifier:v6 serverToken:v7 content:v8 channel:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMAsset *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(RMAsset *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(RMAsset *)self serverToken];
  [v4 encodeObject:v7 forKey:@"serverToken"];

  v8 = [(RMAsset *)self content];
  [v4 encodeObject:v8 forKey:@"content"];

  id v9 = [(RMAsset *)self channel];
  [v4 encodeObject:v9 forKey:@"channel"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMAsset *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RMAsset *)self isEqualToAsset:v4];
  }

  return v5;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RMAsset *)self hash];
  if (v5 == [v4 hash])
  {
    v6 = [(RMAsset *)self identifier];
    v7 = [v4 identifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(RMAsset *)self serverToken];
      id v9 = [v4 serverToken];
      if ([v8 isEqualToString:v9])
      {
        v10 = [(RMAsset *)self type];
        v11 = [v4 type];
        if ([v10 isEqualToString:v11])
        {
          id v12 = [(RMAsset *)self channel];
          id v13 = [v4 channel];
          if ([v12 isEqualToChannel:v13])
          {
            v17 = [(RMAsset *)self content];
            [v4 content];
            id v14 = v18 = v12;
            char v15 = [v17 isEqualToData:v14];

            id v12 = v18;
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [(RMAsset *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(RMAsset *)self serverToken];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RMAsset *)self content];
  uint64_t v8 = [v7 hash];
  id v9 = [(RMAsset *)self channel];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(RMAsset *)self type];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_serverToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end