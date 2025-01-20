@interface _PUDisabledUserInteractionToken
- (NSString)identifier;
- (int64_t)reason;
- (void)setIdentifier:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation _PUDisabledUserInteractionToken

- (void).cxx_destruct
{
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

@end