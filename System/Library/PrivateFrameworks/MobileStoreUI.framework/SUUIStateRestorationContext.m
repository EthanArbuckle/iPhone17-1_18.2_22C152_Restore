@interface SUUIStateRestorationContext
+ (id)sharedContext;
+ (void)setSharedContext:(id)a3;
- (SUUIClientContext)clientContext;
- (void)setClientContext:(id)a3;
@end

@implementation SUUIStateRestorationContext

+ (void)setSharedContext:(id)a3
{
}

+ (id)sharedContext
{
  return (id)sContext;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end