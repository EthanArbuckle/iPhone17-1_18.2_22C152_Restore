@interface PKPeerPaymentMessageLocalProperties
+ (BOOL)supportsSecureCoding;
- (NSData)analyticsSessionToken;
- (PKPeerPaymentMessageLocalProperties)initWithCoder:(id)a3;
- (PKPeerPaymentMessageLocalProperties)initWithSource:(unint64_t)a3;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsSessionToken:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation PKPeerPaymentMessageLocalProperties

- (PKPeerPaymentMessageLocalProperties)initWithSource:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessageLocalProperties;
  result = [(PKPeerPaymentMessageLocalProperties *)&v5 init];
  if (result) {
    result->_source = a3;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t source = self->_source;
  id v5 = a3;
  [v5 encodeInteger:source forKey:@"source"];
  [v5 encodeObject:self->_analyticsSessionToken forKey:@"analyticsSessionToken"];
}

- (PKPeerPaymentMessageLocalProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessageLocalProperties;
  id v5 = [(PKPeerPaymentMessageLocalProperties *)&v9 init];
  if (v5)
  {
    v5->_unint64_t source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsSessionToken"];
    analyticsSessionToken = v5->_analyticsSessionToken;
    v5->_analyticsSessionToken = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_unint64_t source = a3;
}

- (NSData)analyticsSessionToken
{
  return self->_analyticsSessionToken;
}

- (void)setAnalyticsSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end