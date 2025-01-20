@interface WFStubInterface
- (BOOL)currentNetworkIsDirected;
- (BOOL)hasNoGatewayIP;
- (BOOL)ipv4SelfAssigned;
- (id)currentNetwork;
- (id)interfaceName;
- (void)setCurrentNetwork:(id)a3;
- (void)setCurrentNetworkIsDirected:(BOOL)a3;
- (void)setHasNoGatewayIP:(BOOL)a3;
- (void)setIpv4SelfAssigned:(BOOL)a3;
@end

@implementation WFStubInterface

- (id)interfaceName
{
  return @"en0";
}

- (void)setCurrentNetwork:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_currentNetwork = &self->_currentNetwork;
  if (([v5 isEqual:self->_currentNetwork] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentNetwork, a3);
    v7 = *p_currentNetwork;
    if (*p_currentNetwork)
    {
      v10 = @"WFInterfaceNetworkKey";
      v11[0] = v7;
      v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      v8 = 0;
    }
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"WFInterfaceNetworkChangedNotification" object:self userInfo:v8];
  }
}

- (id)currentNetwork
{
  return self->_currentNetwork;
}

- (BOOL)currentNetworkIsDirected
{
  return self->_currentNetworkIsDirected;
}

- (void)setCurrentNetworkIsDirected:(BOOL)a3
{
  self->_currentNetworkIsDirected = a3;
}

- (BOOL)ipv4SelfAssigned
{
  return self->_ipv4SelfAssigned;
}

- (void)setIpv4SelfAssigned:(BOOL)a3
{
  self->_ipv4SelfAssigned = a3;
}

- (BOOL)hasNoGatewayIP
{
  return self->_hasNoGatewayIP;
}

- (void)setHasNoGatewayIP:(BOOL)a3
{
  self->_hasNoGatewayIP = a3;
}

- (void).cxx_destruct
{
}

@end