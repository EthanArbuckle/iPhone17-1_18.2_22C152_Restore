@interface PXSuggestionToken
- (BOOL)canceled;
- (PXSuggestionToken)init;
- (unint64_t)token;
- (void)cancel;
- (void)setToken:(unint64_t)a3;
@end

@implementation PXSuggestionToken

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)cancel
{
  self->_canceled = 1;
}

- (PXSuggestionToken)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXSuggestionToken;
  result = [(PXSuggestionToken *)&v3 init];
  if (result) {
    result->_token = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end