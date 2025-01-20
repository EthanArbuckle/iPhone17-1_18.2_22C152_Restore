@interface STShowChannelRequest
+ (BOOL)supportsSecureCoding;
- (STMediaChannel)channel;
- (STShowChannelRequest)initWithCoder:(id)a3;
- (id)_initWithChannel:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowChannelRequest

- (void).cxx_destruct
{
}

- (STMediaChannel)channel
{
  return self->_channel;
}

- (STShowChannelRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowChannelRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_channel"];
    channel = v5->_channel;
    v5->_channel = (STMediaChannel *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowChannelRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_channel, @"_channel", v5.receiver, v5.super_class);
}

- (id)_initWithChannel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowChannelRequest;
  uint64_t v6 = [(AFSiriRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_channel, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end