@interface WFPendingNetworkUpdate
- (WFNetworkListRecord)network;
- (WFPendingNetworkUpdate)initWithNetwork:(id)a3;
- (id)description;
- (void)setNetwork:(id)a3;
@end

@implementation WFPendingNetworkUpdate

- (WFPendingNetworkUpdate)initWithNetwork:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPendingNetworkUpdate;
  v5 = [(WFPendingNetworkUpdate *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copyWithZone:0];
      network = v6->_network;
      v6->_network = (WFNetworkListRecord *)v7;
    }
    else
    {
      network = v5->_network;
      v5->_network = 0;
    }
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFPendingNetworkUpdate *)self network];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p network='%@'>", v5, self, v6];

  return v7;
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (void).cxx_destruct
{
}

@end