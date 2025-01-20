@interface PKBannerHandleState
+ (BOOL)supportsSecureCoding;
- (PKBannerHandleState)init;
- (PKBannerHandleState)initWithCoder:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKBannerHandleState

- (PKBannerHandleState)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBannerHandleState)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (v5 <= 1 && objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v10.receiver = self;
      v10.super_class = (Class)PKBannerHandleState;
      v6 = [(PKBannerHandleState *)&v10 init];
      if (v6) {
        v6->_type = v5;
      }
    }
    else
    {
      v6 = 0;
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKBannerHandleState" code:0 userInfo:0];
    [v4 failWithError:v8];

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

@end