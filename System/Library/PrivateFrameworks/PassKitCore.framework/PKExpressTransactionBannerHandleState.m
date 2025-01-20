@interface PKExpressTransactionBannerHandleState
+ (BOOL)supportsSecureCoding;
+ (id)createForTransactionState:(id)a3;
- (PKExpressTransactionBannerHandleState)initWithCoder:(id)a3;
- (PKExpressTransactionState)transactionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKExpressTransactionBannerHandleState

+ (id)createForTransactionState:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v3 = v4;
  v5 = [PKExpressTransactionBannerHandleState alloc];
  if (!v5)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_5;
  }
  v10.receiver = v5;
  v10.super_class = (Class)PKBannerHandleState;
  v6 = objc_msgSendSuper2(&v10, sel_init);
  v7 = v6;
  if (v6) {
    v6[1] = 0;
  }
LABEL_5:
  v8 = (void *)v7[2];
  v7[2] = v3;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExpressTransactionBannerHandleState)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKExpressTransactionBannerHandleState;
  v5 = [(PKBannerHandleState *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionState"];
    transactionState = v5->_transactionState;
    v5->_transactionState = (PKExpressTransactionState *)v6;

    if (!v5->_transactionState)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKExpressTransactionBannerHandleState" code:0 userInfo:0];
      [v4 failWithError:v8];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKExpressTransactionBannerHandleState;
  id v4 = a3;
  [(PKBannerHandleState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionState, @"transactionState", v5.receiver, v5.super_class);
}

- (PKExpressTransactionState)transactionState
{
  return self->_transactionState;
}

- (void).cxx_destruct
{
}

@end