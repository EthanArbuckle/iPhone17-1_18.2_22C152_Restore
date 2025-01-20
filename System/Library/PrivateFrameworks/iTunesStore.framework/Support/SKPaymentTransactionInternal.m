@interface SKPaymentTransactionInternal
- (SKPaymentTransactionInternal)init;
@end

@implementation SKPaymentTransactionInternal

- (SKPaymentTransactionInternal)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKPaymentTransactionInternal;
  v2 = [(SKPaymentTransactionInternal *)&v8 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    downloads = v2->_downloads;
    v2->_downloads = (NSArray *)&__NSArray0__struct;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionReceipt, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_temporaryIdentifier, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_originalTransaction, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloads, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end