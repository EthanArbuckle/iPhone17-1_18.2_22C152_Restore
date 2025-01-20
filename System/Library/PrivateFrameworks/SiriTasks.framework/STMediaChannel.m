@interface STMediaChannel
+ (BOOL)supportsSecureCoding;
- (NSString)callSign;
- (NSString)channelIdentifier;
- (NSString)name;
- (NSURL)streamUrl;
- (STMediaChannel)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCallSign:(id)a3;
- (void)setChannelIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setStreamUrl:(id)a3;
@end

@implementation STMediaChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUrl, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_callSign, 0);
}

- (void)setStreamUrl:(id)a3
{
}

- (NSURL)streamUrl
{
  return self->_streamUrl;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setChannelIdentifier:(id)a3
{
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setCallSign:(id)a3
{
}

- (NSString)callSign
{
  return self->_callSign;
}

- (STMediaChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STMediaChannel;
  v5 = [(STSiriModelObject *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_callSign"];
    callSign = v5->_callSign;
    v5->_callSign = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_channelIdentifier"];
    channelIdentifier = v5->_channelIdentifier;
    v5->_channelIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_streamUrl"];
    streamUrl = v5->_streamUrl;
    v5->_streamUrl = (NSURL *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STMediaChannel;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_callSign, @"_callSign", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_channelIdentifier forKey:@"_channelIdentifier"];
  [v4 encodeObject:self->_name forKey:@"_name"];
  [v4 encodeObject:self->_streamUrl forKey:@"_streamUrl"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end