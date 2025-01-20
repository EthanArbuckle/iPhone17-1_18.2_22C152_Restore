@interface FRDestructiveDataActionProvider
- (FRDestructiveDataActionProvider)init;
- (void)consumeActionsUpToDestructiveActionSyncWithBlock:(id)a3;
- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3;
@end

@implementation FRDestructiveDataActionProvider

- (FRDestructiveDataActionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRDestructiveDataActionProvider;
  return [(FRDestructiveDataActionProvider *)&v3 init];
}

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
}

- (void)consumeActionsUpToDestructiveActionSyncWithBlock:(id)a3
{
}

@end