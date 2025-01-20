@interface STSDiffieHellmanParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)publicKey;
- (STSDiffieHellmanParameter)initWithCoder:(id)a3;
- (STSDiffieHellmanParameter)initWithKeyGroup:(unint64_t)a3 key:(id)a4;
- (id)asData;
- (id)description;
- (unint64_t)publicKeyGroup;
- (void)encodeWithCoder:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyGroup:(unint64_t)a3;
@end

@implementation STSDiffieHellmanParameter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t publicKeyGroup = self->_publicKeyGroup;
  id v5 = a3;
  [v5 encodeInteger:publicKeyGroup forKey:@"publicKeyGroup"];
  [v5 encodeObject:self->_publicKey forKey:@"publicKey"];
}

- (STSDiffieHellmanParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSDiffieHellmanParameter;
  id v5 = [(STSDiffieHellmanParameter *)&v9 init];
  if (v5)
  {
    v5->_unint64_t publicKeyGroup = (unint64_t)[v4 decodeIntegerForKey:@"publicKeyGroup"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dhInfo"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSDiffieHellmanParameter *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    id publicKeyGroup = self->_publicKeyGroup;
    if (publicKeyGroup == (id)[(STSDiffieHellmanParameter *)v6 publicKeyGroup]
      && (NSUInteger v8 = [(NSData *)self->_publicKey length],
          [(STSDiffieHellmanParameter *)v6 publicKey],
          objc_super v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 length],
          v9,
          (id)v8 == v10))
    {
      publicKey = self->_publicKey;
      if (publicKey)
      {
        v12 = [(STSDiffieHellmanParameter *)v6 publicKey];
        unsigned __int8 v13 = [(NSData *)publicKey isEqualToData:v12];
      }
      else
      {
        unsigned __int8 v13 = 1;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)description
{
  return +[NSString stringWithFormat:@"keyGroup=%lu, key=%@", self->_publicKeyGroup, self->_publicKey];
}

- (STSDiffieHellmanParameter)initWithKeyGroup:(unint64_t)a3 key:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSDiffieHellmanParameter;
  NSUInteger v8 = [(STSDiffieHellmanParameter *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_id publicKeyGroup = a3;
    objc_storeStrong((id *)&v8->_publicKey, a4);
  }

  return v9;
}

- (id)asData
{
  v3 = +[NSMutableData data];
  char v6 = [(NSData *)self->_publicKey length] + 3;
  [v3 appendBytes:&v6 length:1];
  [v3 appendBytes:&unk_100052218 length:1];
  __int16 v5 = bswap32(LOWORD(self->_publicKeyGroup)) >> 16;
  [v3 appendBytes:&v5 length:2];
  [v3 appendData:self->_publicKey];

  return v3;
}

- (unint64_t)publicKeyGroup
{
  return self->_publicKeyGroup;
}

- (void)setPublicKeyGroup:(unint64_t)a3
{
  self->_id publicKeyGroup = a3;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end