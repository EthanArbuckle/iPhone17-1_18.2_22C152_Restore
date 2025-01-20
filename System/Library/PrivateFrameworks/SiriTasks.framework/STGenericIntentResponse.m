@interface STGenericIntentResponse
+ (BOOL)supportsSecureCoding;
- (STGenericIntentResponse)initWithCoder:(id)a3;
- (id)description;
- (int64_t)responseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setResponseCode:(int64_t)a3;
@end

@implementation STGenericIntentResponse

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (STGenericIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STGenericIntentResponse;
  v5 = [(AFSiriResponse *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_responseCode = [v4 decodeIntegerForKey:@"_responseCode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STGenericIntentResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_responseCode, @"_responseCode", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)STGenericIntentResponse;
  id v4 = [(STGenericIntentResponse *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ response code: %ld", v4, self->_responseCode];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end