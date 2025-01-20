@interface SKUIRedeemPreflightResult
- (NSError)error;
- (SKUIClientContext)clientContext;
- (SKUIRedeemConfiguration)redeemConfiguration;
- (SSAccount)account;
- (SSVRedeemCodeMetadata)codeMetadata;
- (int64_t)resultType;
- (void)setAccount:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setCodeMetadata:(id)a3;
- (void)setError:(id)a3;
- (void)setRedeemConfiguration:(id)a3;
- (void)setResultType:(int64_t)a3;
@end

@implementation SKUIRedeemPreflightResult

- (SSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SSVRedeemCodeMetadata)codeMetadata
{
  return self->_codeMetadata;
}

- (void)setCodeMetadata:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (SKUIRedeemConfiguration)redeemConfiguration
{
  return self->_redeemConfiguration;
}

- (void)setRedeemConfiguration:(id)a3
{
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_codeMetadata, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end