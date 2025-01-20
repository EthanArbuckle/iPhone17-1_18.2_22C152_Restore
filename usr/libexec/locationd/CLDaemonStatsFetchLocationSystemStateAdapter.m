@interface CLDaemonStatsFetchLocationSystemStateAdapter
- (BOOL)valid;
- (CLDaemonStatsFetchLocationSystemStateAdapter)init;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonStatsFetchLocationSystemStateAdapter

- (CLDaemonStatsFetchLocationSystemStateAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonStatsFetchLocationSystemStateAdapter;
  result = [(CLDaemonStatsFetchLocationSystemStateAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end