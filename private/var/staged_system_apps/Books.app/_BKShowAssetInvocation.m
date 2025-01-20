@interface _BKShowAssetInvocation
- (BKLocation)location;
- (BKTransactionProviding)transactionProvider;
- (NSDictionary)options;
- (NSString)assetID;
- (id)completion;
- (void)setAssetID:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTransactionProvider:(id)a3;
@end

@implementation _BKShowAssetInvocation

- (BKTransactionProviding)transactionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProvider);

  return (BKTransactionProviding *)WeakRetained;
}

- (void)setTransactionProvider:(id)a3
{
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_destroyWeak((id *)&self->_transactionProvider);
}

@end