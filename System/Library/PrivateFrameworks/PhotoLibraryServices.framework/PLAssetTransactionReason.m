@interface PLAssetTransactionReason
+ (id)transactionReason:(id)a3;
- (NSString)reason;
- (void)setReason:(id)a3;
@end

@implementation PLAssetTransactionReason

- (void).cxx_destruct
{
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

+ (id)transactionReason:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PLAssetTransactionReason);
  [(PLAssetTransactionReason *)v4 setReason:v3];

  return v4;
}

@end