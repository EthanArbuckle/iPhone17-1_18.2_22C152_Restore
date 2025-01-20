@interface NFTNEPService
+ (BOOL)supportsSecureCoding;
+ (id)serviceWithURI:(id)a3 minWaitTime:(unsigned __int8)a4 maxWaitTimeExtension:(unsigned __int8)a5 maxMessageSize:(unsigned __int16)a6;
- (NFTNEPService)initWithCoder:(id)a3;
- (NSString)uri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)maxMessageSize;
- (unsigned)maxWaitTimeExtension;
- (unsigned)minWaitTime;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxMessageSize:(unsigned __int16)a3;
- (void)setMaxWaitTimeExtension:(unsigned __int8)a3;
- (void)setMinWaitTime:(unsigned __int8)a3;
- (void)setUri:(id)a3;
@end

@implementation NFTNEPService

+ (id)serviceWithURI:(id)a3 minWaitTime:(unsigned __int8)a4 maxWaitTimeExtension:(unsigned __int8)a5 maxMessageSize:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = v10;
  if (v10)
  {
    [v10 setUri:v9];
    [v11 setMinWaitTime:v8];
    [v11 setMaxWaitTimeExtension:v7];
    [v11 setMaxMessageSize:v6];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    id v6 = [(NSString *)self->_uri copyWithZone:a3];
    uint64_t v7 = (void *)v5[2];
    v5[2] = v6;

    *((unsigned char *)v5 + 8) = self->_minWaitTime;
    *((unsigned char *)v5 + 9) = self->_maxWaitTimeExtension;
    *((_WORD *)v5 + 5) = self->_maxMessageSize;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uri = self->_uri;
  id v5 = a3;
  [v5 encodeObject:uri forKey:@"uri"];
  [v5 encodeInteger:self->_minWaitTime forKey:@"minWaitTime"];
  [v5 encodeInteger:self->_maxWaitTimeExtension forKey:@"maxWaitTimeExtension"];
  [v5 encodeInteger:self->_maxMessageSize forKey:@"maxMessageSize"];
}

- (NFTNEPService)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTNEPService;
  id v5 = [(NFTNEPService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
    uri = v5->_uri;
    v5->_uri = (NSString *)v6;

    v5->_minWaitTime = [v4 decodeIntegerForKey:@"minWaitTime"];
    v5->_maxWaitTimeExtension = [v4 decodeIntegerForKey:@"maxWaitTimeExtension"];
    v5->_maxMessageSize = (unsigned __int16)[v4 decodeIntegerForKey:@"maxMessageSize"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NFTNEPService *)self uri];
  id v5 = [v3 initWithFormat:@"{uri=%@, Nwait=%d, twait=%d, maxMsgSize=%d}", v4, -[NFTNEPService maxWaitTimeExtension](self, "maxWaitTimeExtension"), -[NFTNEPService minWaitTime](self, "minWaitTime"), -[NFTNEPService maxMessageSize](self, "maxMessageSize")];

  return v5;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (unsigned)minWaitTime
{
  return self->_minWaitTime;
}

- (void)setMinWaitTime:(unsigned __int8)a3
{
  self->_minWaitTime = a3;
}

- (unsigned)maxWaitTimeExtension
{
  return self->_maxWaitTimeExtension;
}

- (void)setMaxWaitTimeExtension:(unsigned __int8)a3
{
  self->_maxWaitTimeExtension = a3;
}

- (unsigned)maxMessageSize
{
  return self->_maxMessageSize;
}

- (void)setMaxMessageSize:(unsigned __int16)a3
{
  self->_maxMessageSize = a3;
}

- (void).cxx_destruct
{
}

@end