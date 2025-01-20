@interface PKProxCardRequest
+ (BOOL)supportsSecureCoding;
- (PKProxCardRequest)initWithCoder:(id)a3;
- (PKProxCardRequest)initWithProxCardType:(int64_t)a3;
- (int64_t)proxCardType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKProxCardRequest

- (PKProxCardRequest)initWithProxCardType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKProxCardRequest;
  result = [(PKProxCardRequest *)&v5 init];
  if (result) {
    result->_proxCardType = a3;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKProxCardRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"proxCardType"] == 1
    && objc_opt_class()
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    self = [(PKProxCardRequest *)self initWithProxCardType:1];
    objc_super v5 = self;
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKProxCardRequest" code:0 userInfo:0];
    [v4 failWithError:v6];

    objc_super v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)proxCardType
{
  return self->_proxCardType;
}

@end