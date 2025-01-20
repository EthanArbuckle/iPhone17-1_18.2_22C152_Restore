@interface RCChangeTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)contentHash;
- (NSString)description;
- (NSString)identifier;
- (NSString)lastModifiedString;
- (RCChangeTag)initWithCoder:(id)a3;
- (RCChangeTag)initWithIdentifier:(id)a3 contentHash:(id)a4 lastModifiedString:(id)a5;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RCChangeTag

- (RCChangeTag)initWithIdentifier:(id)a3 contentHash:(id)a4 lastModifiedString:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCChangeTag;
  v12 = [(RCChangeTag *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_contentHash, a4);
    objc_storeStrong((id *)&v13->_lastModifiedString, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(RCChangeTag *)self identifier];
    v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(RCChangeTag *)self contentHash];
      id v9 = [v5 contentHash];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(RCChangeTag *)self lastModifiedString];
        id v11 = [v5 lastModifiedString];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(RCChangeTag *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(RCChangeTag *)self contentHash];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RCChangeTag *)self lastModifiedString];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(RCChangeTag *)self identifier];
  uint64_t v6 = [(RCChangeTag *)self contentHash];
  v7 = [(RCChangeTag *)self lastModifiedString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@\n contentHash: %@\n lastModified: %@",
    v4,
    self,
    v5,
    v6,
  unint64_t v8 = v7);

  return (NSString *)v8;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(RCChangeTag *)self identifier];
  [v3 setObject:v4 forKey:@"id"];

  id v5 = [(RCChangeTag *)self contentHash];
  [v3 setObject:v5 forKey:@"changeTag"];

  uint64_t v6 = [(RCChangeTag *)self lastModifiedString];
  [v3 setObject:v6 forKey:@"lastModified"];

  v7 = (void *)[v3 copy];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCChangeTag *)self identifier];
  [v4 encodeObject:v5 forKey:@"id"];

  uint64_t v6 = [(RCChangeTag *)self contentHash];
  [v4 encodeObject:v6 forKey:@"changeTag"];

  id v7 = [(RCChangeTag *)self lastModifiedString];
  [v4 encodeObject:v7 forKey:@"lastModified"];
}

- (RCChangeTag)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeTag"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModified"];

  unint64_t v8 = [(RCChangeTag *)self initWithIdentifier:v5 contentHash:v6 lastModifiedString:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contentHash
{
  return self->_contentHash;
}

- (NSString)lastModifiedString
{
  return self->_lastModifiedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedString, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end