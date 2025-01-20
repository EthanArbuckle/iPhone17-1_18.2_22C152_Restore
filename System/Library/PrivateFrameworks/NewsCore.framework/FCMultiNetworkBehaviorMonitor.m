@interface FCMultiNetworkBehaviorMonitor
- (FCMultiNetworkBehaviorMonitor)init;
- (NFMultiDelegate)multiDelegate;
- (void)addMonitor:(id)a3;
- (void)logNetworkEvent:(id)a3;
- (void)removeMonitor:(id)a3;
@end

@implementation FCMultiNetworkBehaviorMonitor

- (void)logNetworkEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(FCMultiNetworkBehaviorMonitor *)self multiDelegate];
  v5 = [v6 delegate];
  [v5 logNetworkEvent:v4];
}

- (void)addMonitor:(id)a3
{
  id v4 = a3;
  id v5 = [(FCMultiNetworkBehaviorMonitor *)self multiDelegate];
  [v5 addDelegate:v4];
}

- (NFMultiDelegate)multiDelegate
{
  return self->_multiDelegate;
}

- (FCMultiNetworkBehaviorMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCMultiNetworkBehaviorMonitor;
  v2 = [(FCMultiNetworkBehaviorMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F81BD8]) initWithDelegate:0 delegateProtocol:&unk_1EF8F1AE8 options:1];
    multiDelegate = v2->_multiDelegate;
    v2->_multiDelegate = (NFMultiDelegate *)v3;
  }
  return v2;
}

- (void)removeMonitor:(id)a3
{
  id v4 = a3;
  id v5 = [(FCMultiNetworkBehaviorMonitor *)self multiDelegate];
  [v5 removeDelegate:v4];
}

- (void).cxx_destruct
{
}

@end