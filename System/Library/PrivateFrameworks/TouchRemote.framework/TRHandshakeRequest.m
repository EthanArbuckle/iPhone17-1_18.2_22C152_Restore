@interface TRHandshakeRequest
+ (BOOL)supportsSecureCoding;
- (TRHandshakeRequest)initWithCoder:(id)a3;
- (id)description;
- (int64_t)protocolVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
@end

@implementation TRHandshakeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRHandshakeRequest;
  id v4 = a3;
  [(TRMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_protocolVersion, @"TRHandshakeMessages_pV", v5.receiver, v5.super_class);
}

- (TRHandshakeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRHandshakeRequest;
  objc_super v5 = [(TRMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_protocolVersion = [v4 decodeIntegerForKey:@"TRHandshakeMessages_pV"];
  }

  return v5;
}

- (id)description
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"protocolVersion:%ld", self->_protocolVersion);
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRHandshakeRequest;
  objc_super v5 = [(TRMessage *)&v8 description];
  v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

@end