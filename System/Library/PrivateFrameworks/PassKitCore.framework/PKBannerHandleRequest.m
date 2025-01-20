@interface PKBannerHandleRequest
+ (BOOL)supportsSecureCoding;
- (PKBannerHandleRequest)init;
- (PKBannerHandleRequest)initWithCoder:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKBannerHandleRequest

- (PKBannerHandleRequest)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBannerHandleRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (v5 <= 2 && (unint64_t v6 = v5, objc_opt_class()) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKBannerHandleRequest;
      v7 = [(PKBannerHandleRequest *)&v11 init];
      if (v7) {
        v7->_type = v6;
      }
    }
    else
    {
      v7 = 0;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKBannerHandleRequest" code:0 userInfo:0];
    [v4 failWithError:v9];

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

@end