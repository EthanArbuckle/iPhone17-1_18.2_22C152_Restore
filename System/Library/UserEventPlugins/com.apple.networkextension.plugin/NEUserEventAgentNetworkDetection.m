@interface NEUserEventAgentNetworkDetection
- (NEUserEventAgentNetworkDetection)init;
@end

@implementation NEUserEventAgentNetworkDetection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netPropsKeyExpiryTimer, 0);
  objc_storeStrong((id *)&self->_notifyTokens, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

- (NEUserEventAgentNetworkDetection)init
{
  v6.receiver = self;
  v6.super_class = (Class)NEUserEventAgentNetworkDetection;
  v2 = [(NEUserEventAgentNetworkDetection *)&v6 init];
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_array_create(0, 0);
    notifyTokens = v2->_notifyTokens;
    v2->_notifyTokens = v3;
  }
  return v2;
}

@end