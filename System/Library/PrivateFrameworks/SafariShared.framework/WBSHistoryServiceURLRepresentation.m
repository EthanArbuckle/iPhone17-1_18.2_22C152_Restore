@interface WBSHistoryServiceURLRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)urlHash;
- (NSData)urlSalt;
- (NSString)urlString;
- (WBSHistoryServiceURLRepresentation)init;
- (WBSHistoryServiceURLRepresentation)initWithCoder:(id)a3;
- (WBSHistoryServiceURLRepresentation)initWithURLHash:(id)a3 salt:(id)a4;
- (WBSHistoryServiceURLRepresentation)initWithURLString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryServiceURLRepresentation

- (WBSHistoryServiceURLRepresentation)init
{
  return 0;
}

- (WBSHistoryServiceURLRepresentation)initWithURLString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceURLRepresentation;
  v5 = [(WBSHistoryServiceURLRepresentation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WBSHistoryServiceURLRepresentation)initWithURLHash:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryServiceURLRepresentation;
  v8 = [(WBSHistoryServiceURLRepresentation *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    urlHash = v8->_urlHash;
    v8->_urlHash = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    urlSalt = v8->_urlSalt;
    v8->_urlSalt = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryServiceURLRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceURLRepresentation;
  v5 = [(WBSHistoryServiceURLRepresentation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlString"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlHash"];
    urlHash = v5->_urlHash;
    v5->_urlHash = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlSalt"];
    urlSalt = v5->_urlSalt;
    v5->_urlSalt = (NSData *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  urlString = self->_urlString;
  id v5 = a3;
  [v5 encodeObject:urlString forKey:@"urlString"];
  [v5 encodeObject:self->_urlHash forKey:@"urlHash"];
  [v5 encodeObject:self->_urlSalt forKey:@"urlSalt"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  urlString = self->_urlString;
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (urlString)
  {
    uint64_t v6 = self->_urlString;
    return (id)[v5 initWithURLString:v6];
  }
  else
  {
    urlHash = self->_urlHash;
    urlSalt = self->_urlSalt;
    return (id)[v5 initWithURLHash:urlHash salt:urlSalt];
  }
}

- (id)description
{
  urlString = self->_urlString;
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)v6;
  if (urlString) {
    [v4 stringWithFormat:@"<%@: %p; urlString = \"%@\">", v6, self, self->_urlString, v10];
  }
  else {
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; urlHash = \"%@\"; urlSalt = \"%@\">",
  }
      v6,
      self,
      self->_urlHash,
  uint64_t v8 = self->_urlSalt);

  return v8;
}

- (unint64_t)hash
{
  urlString = self->_urlString;
  if (urlString)
  {
    return [(NSString *)urlString hash];
  }
  else
  {
    uint64_t v5 = [(NSData *)self->_urlSalt hash];
    return [(NSData *)self->_urlHash hash] ^ v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSHistoryServiceURLRepresentation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      urlString = (NSData *)self->_urlString;
      if (!urlString || (urlSalt = (NSData *)v5->_urlString) == 0)
      {
        if (![(NSData *)self->_urlHash isEqual:v5->_urlHash])
        {
          char v8 = 0;
          goto LABEL_11;
        }
        urlString = self->_urlSalt;
        urlSalt = v5->_urlSalt;
      }
      char v8 = [(NSData *)urlString isEqual:urlSalt];
LABEL_11:

      goto LABEL_12;
    }
    char v8 = 0;
  }
LABEL_12:

  return v8;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSData)urlHash
{
  return self->_urlHash;
}

- (NSData)urlSalt
{
  return self->_urlSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSalt, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end