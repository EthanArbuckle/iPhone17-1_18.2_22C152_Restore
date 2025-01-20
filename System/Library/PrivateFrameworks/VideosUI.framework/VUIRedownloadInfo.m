@interface VUIRedownloadInfo
- (AMSBuyParams)buyParams;
- (id)completion;
- (int64_t)redownloadType;
- (void)setBuyParams:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setRedownloadType:(int64_t)a3;
@end

@implementation VUIRedownloadInfo

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (int64_t)redownloadType
{
  return self->_redownloadType;
}

- (void)setRedownloadType:(int64_t)a3
{
  self->_redownloadType = a3;
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
  objc_storeStrong((id *)&self->_buyParams, 0);
}

@end