@interface SISensitiveConditionsMessagePolicyResult
- (BOOL)suppressMessage;
- (void)setSuppressMessage:(BOOL)a3;
@end

@implementation SISensitiveConditionsMessagePolicyResult

- (void)setSuppressMessage:(BOOL)a3
{
  self->_suppressMessage = a3;
}

- (BOOL)suppressMessage
{
  return self->_suppressMessage;
}

@end