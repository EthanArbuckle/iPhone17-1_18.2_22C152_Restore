@interface SFEndNetworkSearchFeedback
+ (BOOL)supportsSecureCoding;
- (NSDictionary)networkTimingData;
- (SFEndNetworkSearchFeedback)initWithCoder:(id)a3;
- (SFEndNetworkSearchFeedback)initWithStartSearch:(id)a3 responseSize:(int64_t)a4 statusCode:(int64_t)a5 networkTimingData:(id)a6;
- (int64_t)responseSize;
- (int64_t)statusCode;
- (unint64_t)decompressedResponseSize;
- (unint64_t)rawResponseSize;
- (void)encodeWithCoder:(id)a3;
- (void)setDecompressedResponseSize:(unint64_t)a3;
- (void)setNetworkTimingData:(id)a3;
- (void)setRawResponseSize:(unint64_t)a3;
- (void)setResponseSize:(int64_t)a3;
- (void)setStatusCode:(int64_t)a3;
@end

@implementation SFEndNetworkSearchFeedback

- (void).cxx_destruct
{
}

- (void)setNetworkTimingData:(id)a3
{
}

- (NSDictionary)networkTimingData
{
  return self->_networkTimingData;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setDecompressedResponseSize:(unint64_t)a3
{
  self->_decompressedResponseSize = a3;
}

- (unint64_t)decompressedResponseSize
{
  return self->_decompressedResponseSize;
}

- (void)setRawResponseSize:(unint64_t)a3
{
  self->_rawResponseSize = a3;
}

- (unint64_t)rawResponseSize
{
  return self->_rawResponseSize;
}

- (void)setResponseSize:(int64_t)a3
{
  self->_responseSize = a3;
}

- (int64_t)responseSize
{
  return self->_responseSize;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFEndNetworkSearchFeedback;
  id v4 = a3;
  [(SFEndSearchFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_responseSize, @"response_size", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_statusCode forKey:@"status_code"];
  [v4 encodeObject:self->_networkTimingData forKey:@"network_timing_data"];
}

- (SFEndNetworkSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFEndNetworkSearchFeedback;
  objc_super v5 = [(SFEndSearchFeedback *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_responseSize = [v4 decodeInt64ForKey:@"response_size"];
    v5->_statusCode = [v4 decodeIntegerForKey:@"status_code"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"network_timing_data"];
    networkTimingData = v5->_networkTimingData;
    v5->_networkTimingData = (NSDictionary *)v10;
  }
  return v5;
}

- (SFEndNetworkSearchFeedback)initWithStartSearch:(id)a3 responseSize:(int64_t)a4 statusCode:(int64_t)a5 networkTimingData:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SFEndNetworkSearchFeedback;
  v11 = [(SFEndSearchFeedback *)&v16 initWithStartSearch:a3];
  v12 = v11;
  if (v11)
  {
    v11->_responseSize = a4;
    v11->_statusCode = a5;
    uint64_t v13 = [v10 copy];
    networkTimingData = v12->_networkTimingData;
    v12->_networkTimingData = (NSDictionary *)v13;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end