@interface NSPProxyAgentStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)egressProxyLowWaterMarkHitCount;
- (unint64_t)egressProxyTokensAdded;
- (unint64_t)ingressProxyLowWaterMarkHitCount;
- (unint64_t)ingressProxyTokensAdded;
- (void)setEgressProxyLowWaterMarkHitCount:(unint64_t)a3;
- (void)setEgressProxyTokensAdded:(unint64_t)a3;
- (void)setIngressProxyLowWaterMarkHitCount:(unint64_t)a3;
- (void)setIngressProxyTokensAdded:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPProxyAgentStats

- (id)eventName
{
  return @"com.apple.nsp.proxyAgentStats";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(NSPProxyAgentStats *)self tierType];
  [v3 setObject:v4 forKeyedSubscript:@"TierType"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(NSPProxyAgentStats *)self ingressProxyTokensAdded]];
  [v3 setObject:v5 forKeyedSubscript:@"IngressProxyTokensAdded"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(NSPProxyAgentStats *)self egressProxyTokensAdded]];
  [v3 setObject:v6 forKeyedSubscript:@"EgressProxyTokensAdded"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(NSPProxyAgentStats *)self ingressProxyLowWaterMarkHitCount]];
  [v3 setObject:v7 forKeyedSubscript:@"IngressProxyLowWaterMarkEventHitCount"];

  v8 = +[NSNumber numberWithUnsignedInteger:[(NSPProxyAgentStats *)self egressProxyLowWaterMarkHitCount]];
  [v3 setObject:v8 forKeyedSubscript:@"EgressProxyLowWaterMarkEventHitCount"];

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (unint64_t)ingressProxyTokensAdded
{
  return self->_ingressProxyTokensAdded;
}

- (void)setIngressProxyTokensAdded:(unint64_t)a3
{
  self->_ingressProxyTokensAdded = a3;
}

- (unint64_t)egressProxyTokensAdded
{
  return self->_egressProxyTokensAdded;
}

- (void)setEgressProxyTokensAdded:(unint64_t)a3
{
  self->_egressProxyTokensAdded = a3;
}

- (unint64_t)ingressProxyLowWaterMarkHitCount
{
  return self->_ingressProxyLowWaterMarkHitCount;
}

- (void)setIngressProxyLowWaterMarkHitCount:(unint64_t)a3
{
  self->_ingressProxyLowWaterMarkHitCount = a3;
}

- (unint64_t)egressProxyLowWaterMarkHitCount
{
  return self->_egressProxyLowWaterMarkHitCount;
}

- (void)setEgressProxyLowWaterMarkHitCount:(unint64_t)a3
{
  self->_egressProxyLowWaterMarkHitCount = a3;
}

- (void).cxx_destruct
{
}

@end