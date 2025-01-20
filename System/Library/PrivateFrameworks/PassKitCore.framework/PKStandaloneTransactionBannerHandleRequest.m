@interface PKStandaloneTransactionBannerHandleRequest
+ (BOOL)supportsSecureCoding;
+ (id)createForPassUniqueIdentifier:(id)a3 withDisplayableName:(id)a4 transactionType:(int64_t)a5 walletForeground:(BOOL)a6;
- (BOOL)isWalletForeground;
- (NSString)displayableName;
- (NSString)passUniqueIdentifier;
- (PKStandaloneTransactionBannerHandleRequest)initWithCoder:(id)a3;
- (int64_t)transactionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKStandaloneTransactionBannerHandleRequest

+ (id)createForPassUniqueIdentifier:(id)a3 withDisplayableName:(id)a4 transactionType:(int64_t)a5 walletForeground:(BOOL)a6
{
  id v9 = a3;
  v10 = 0;
  if (v9 && a5)
  {
    id v11 = a4;
    v12 = [PKStandaloneTransactionBannerHandleRequest alloc];
    if (v12)
    {
      v19.receiver = v12;
      v19.super_class = (Class)PKBannerHandleRequest;
      v13 = objc_msgSendSuper2(&v19, sel_init);
      v10 = v13;
      if (v13) {
        v13[1] = 2;
      }
    }
    else
    {
      v10 = 0;
    }
    uint64_t v14 = [v9 copy];
    v15 = (void *)v10[3];
    v10[3] = v14;

    uint64_t v16 = [v11 copy];
    v17 = (void *)v10[4];
    v10[4] = v16;

    v10[5] = a5;
    *((unsigned char *)v10 + 16) = a6;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKStandaloneTransactionBannerHandleRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKStandaloneTransactionBannerHandleRequest;
  v5 = [(PKBannerHandleRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    if (!v5->_passUniqueIdentifier
      || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayableName"],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          displayableName = v5->_displayableName,
          v5->_displayableName = (NSString *)v8,
          displayableName,
          uint64_t v10 = [v4 decodeIntegerForKey:@"transactionType"],
          (v5->_transactionType = v10) == 0))
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKStandaloneTransactionBannerHandleRequest" code:0 userInfo:0];
      [v4 failWithError:v12];

      id v11 = 0;
      goto LABEL_7;
    }
    v5->_walletForeground = [v4 decodeBoolForKey:@"walletForeground"];
  }
  id v11 = v5;
LABEL_7:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKStandaloneTransactionBannerHandleRequest;
  id v4 = a3;
  [(PKBannerHandleRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, @"passUniqueIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_displayableName forKey:@"displayableName"];
  [v4 encodeInteger:self->_transactionType forKey:@"transactionType"];
  [v4 encodeBool:self->_walletForeground forKey:@"walletForeground"];
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)displayableName
{
  return self->_displayableName;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (BOOL)isWalletForeground
{
  return self->_walletForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayableName, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end