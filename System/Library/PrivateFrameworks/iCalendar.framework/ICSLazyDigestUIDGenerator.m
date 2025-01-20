@interface ICSLazyDigestUIDGenerator
- (ICSLazyDigestUIDGenerator)initWithData:(id)a3;
- (id)_digest;
- (id)generateUID;
@end

@implementation ICSLazyDigestUIDGenerator

- (ICSLazyDigestUIDGenerator)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSLazyDigestUIDGenerator;
  v6 = [(ICSLazyDigestUIDGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (id)_digest
{
  digest = self->_digest;
  if (!digest)
  {
    data = self->_data;
    if (data)
    {
      id v5 = [(NSData *)data ical_digest];
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 2 * objc_msgSend(v5, "length"));
      digest = v5;
      uint64_t v7 = [(NSString *)digest bytes];
      if ([(NSString *)digest length])
      {
        uint64_t v8 = 0;
        do
          objc_msgSend(v6, "appendFormat:", @"%02X", *(unsigned __int8 *)(v7 + v8++));
        while (v8 != [(NSString *)digest length]);
      }
      objc_super v9 = (NSString *)[v6 copy];
      v10 = self->_digest;
      self->_digest = v9;
    }
    else
    {
      self->_digest = (NSString *)&stru_1F3601330;
    }
  }
  v11 = self->_digest;
  return v11;
}

- (id)generateUID
{
  v3 = [(ICSLazyDigestUIDGenerator *)self _digest];
  v4 = NSString;
  uint64_t lastIndex = self->_lastIndex;
  self->_uint64_t lastIndex = lastIndex + 1;
  v6 = [v4 stringWithFormat:@"%@_%d", v3, lastIndex];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end