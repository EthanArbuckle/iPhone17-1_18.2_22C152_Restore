@interface _TVRXSearchReference
- (NSString)identifier;
- (NSTimer)expirationTimer;
- (id)completionBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setExpirationTimer:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _TVRXSearchReference

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSTimer)expirationTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expirationTimer);

  return (NSTimer *)WeakRetained;
}

- (void)setExpirationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expirationTimer);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end