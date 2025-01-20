@interface PKExpressTransactionBannerHandleRequest
+ (BOOL)supportsSecureCoding;
+ (id)createForPassUniqueIdentifier:(id)a3;
- (NSString)passUniqueIdentifier;
- (PKExpressTransactionBannerHandleRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKExpressTransactionBannerHandleRequest

+ (id)createForPassUniqueIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [PKExpressTransactionBannerHandleRequest alloc];
    if (v4)
    {
      v10.receiver = v4;
      v10.super_class = (Class)PKBannerHandleRequest;
      v5 = objc_msgSendSuper2(&v10, sel_init);
      v6 = v5;
      if (v5) {
        v5[1] = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    uint64_t v7 = [v3 copy];
    v8 = (void *)v6[2];
    v6[2] = v7;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExpressTransactionBannerHandleRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKExpressTransactionBannerHandleRequest;
  v5 = [(PKBannerHandleRequest *)&v11 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        passUniqueIdentifier = v5->_passUniqueIdentifier,
        v5->_passUniqueIdentifier = (NSString *)v6,
        passUniqueIdentifier,
        !v5->_passUniqueIdentifier))
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKExpressTransactionBannerHandleRequest" code:0 userInfo:0];
    [v4 failWithError:v9];

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKExpressTransactionBannerHandleRequest;
  id v4 = a3;
  [(PKBannerHandleRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, @"passUniqueIdentifier", v5.receiver, v5.super_class);
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void).cxx_destruct
{
}

@end