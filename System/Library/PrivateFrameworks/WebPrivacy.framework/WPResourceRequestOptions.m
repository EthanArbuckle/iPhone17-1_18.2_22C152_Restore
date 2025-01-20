@interface WPResourceRequestOptions
- (BOOL)afterUpdates;
- (void)setAfterUpdates:(BOOL)a3;
@end

@implementation WPResourceRequestOptions

- (void)setAfterUpdates:(BOOL)a3
{
  self->_afterUpdates = a3;
}

- (BOOL)afterUpdates
{
  return self->_afterUpdates;
}

@end