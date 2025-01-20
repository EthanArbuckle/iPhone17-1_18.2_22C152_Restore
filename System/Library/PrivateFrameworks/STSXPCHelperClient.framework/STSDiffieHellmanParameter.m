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
  id v7 = a3;
  objc_msgSend_encodeInteger_forKey_(v7, v5, publicKeyGroup, @"publicKeyGroup");
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_publicKey, @"publicKey");
}

- (STSDiffieHellmanParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STSDiffieHellmanParameter;
  v6 = [(STSDiffieHellmanParameter *)&v12 init];
  if (v6)
  {
    v6->_unint64_t publicKeyGroup = objc_msgSend_decodeIntegerForKey_(v4, v5, @"publicKeyGroup");
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"dhInfo");
    publicKey = v6->_publicKey;
    v6->_publicKey = (NSData *)v9;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSDiffieHellmanParameter *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToData = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unint64_t publicKeyGroup = self->_publicKeyGroup;
    if (publicKeyGroup == objc_msgSend_publicKeyGroup(v6, v8, v9)
      && (uint64_t v12 = objc_msgSend_length(self->_publicKey, v10, v11),
          objc_msgSend_publicKey(v6, v13, v14),
          v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v18 = objc_msgSend_length(v15, v16, v17),
          v15,
          v12 == v18))
    {
      publicKey = self->_publicKey;
      if (publicKey)
      {
        v22 = objc_msgSend_publicKey(v6, v19, v20);
        char isEqualToData = objc_msgSend_isEqualToData_(publicKey, v23, (uint64_t)v22);
      }
      else
      {
        char isEqualToData = 1;
      }
    }
    else
    {
      char isEqualToData = 0;
    }
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"keyGroup=%lu, key=%@", self->_publicKeyGroup, self->_publicKey);
}

- (STSDiffieHellmanParameter)initWithKeyGroup:(unint64_t)a3 key:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSDiffieHellmanParameter;
  v8 = [(STSDiffieHellmanParameter *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_unint64_t publicKeyGroup = a3;
    objc_storeStrong((id *)&v8->_publicKey, a4);
  }

  return v9;
}

- (id)asData
{
  id v4 = objc_msgSend_data(MEMORY[0x263EFF990], a2, v2);
  char v13 = objc_msgSend_length(self->_publicKey, v5, v6) + 3;
  objc_msgSend_appendBytes_length_(v4, v7, (uint64_t)&v13, 1);
  objc_msgSend_appendBytes_length_(v4, v8, (uint64_t)&unk_2146D4308, 1);
  __int16 v12 = bswap32(LOWORD(self->_publicKeyGroup)) >> 16;
  objc_msgSend_appendBytes_length_(v4, v9, (uint64_t)&v12, 2);
  objc_msgSend_appendData_(v4, v10, (uint64_t)self->_publicKey);

  return v4;
}

- (unint64_t)publicKeyGroup
{
  return self->_publicKeyGroup;
}

- (void)setPublicKeyGroup:(unint64_t)a3
{
  self->_unint64_t publicKeyGroup = a3;
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