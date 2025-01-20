@interface TUMutableConversation
- (BOOL)isRelaying;
- (void)setRelaying:(BOOL)a3;
@end

@implementation TUMutableConversation

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (void)setRelaying:(BOOL)a3
{
  self->_relaying = a3;
}

@end