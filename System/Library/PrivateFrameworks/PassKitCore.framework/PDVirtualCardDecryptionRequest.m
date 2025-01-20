@interface PDVirtualCardDecryptionRequest
- (NSData)authorization;
- (PKVirtualCard)virtualCard;
- (id)completion;
- (int64_t)action;
- (void)setAction:(int64_t)a3;
- (void)setAuthorization:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setVirtualCard:(id)a3;
@end

@implementation PDVirtualCardDecryptionRequest

- (PKVirtualCard)virtualCard
{
  return self->_virtualCard;
}

- (void)setVirtualCard:(id)a3
{
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
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
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_virtualCard, 0);
}

@end