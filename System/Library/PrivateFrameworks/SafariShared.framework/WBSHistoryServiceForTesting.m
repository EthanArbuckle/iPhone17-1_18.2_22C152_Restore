@interface WBSHistoryServiceForTesting
- (WBSHistoryServiceForTesting)init;
- (id)_createListener;
- (id)connectWithClass:(Class)a3;
@end

@implementation WBSHistoryServiceForTesting

- (WBSHistoryServiceForTesting)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSHistoryServiceForTesting;
  v2 = [(WBSHistoryService *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)_createListener
{
  return self->_listener;
}

- (id)connectWithClass:(Class)a3
{
  id v4 = [a3 alloc];
  v5 = [(NSXPCListener *)self->_listener endpoint];
  v6 = (void *)[v4 initWithListenerEndpoint:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end