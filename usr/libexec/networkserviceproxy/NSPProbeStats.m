@interface NSPProbeStats
- (NSString)probeInterface;
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (id)probeReasonToString;
- (int64_t)probeReason;
- (unint64_t)directProbeCount;
- (unint64_t)directProbeFailedCount;
- (unint64_t)directProbeRedirectedCount;
- (unint64_t)directProbeServerErrorCount;
- (unint64_t)directProbeSuccessCount;
- (unint64_t)probeDurationSec;
- (unint64_t)proxyProbeCount;
- (unint64_t)proxyProbeFailedCount;
- (unint64_t)proxyProbeRedirectedCount;
- (unint64_t)proxyProbeServerErrorCount;
- (unint64_t)proxyProbeSuccessCount;
- (void)setDirectProbeCount:(unint64_t)a3;
- (void)setDirectProbeFailedCount:(unint64_t)a3;
- (void)setDirectProbeRedirectedCount:(unint64_t)a3;
- (void)setDirectProbeServerErrorCount:(unint64_t)a3;
- (void)setDirectProbeSuccessCount:(unint64_t)a3;
- (void)setProbeDurationSec:(unint64_t)a3;
- (void)setProbeInterface:(id)a3;
- (void)setProbeReason:(int64_t)a3;
- (void)setProxyProbeCount:(unint64_t)a3;
- (void)setProxyProbeFailedCount:(unint64_t)a3;
- (void)setProxyProbeRedirectedCount:(unint64_t)a3;
- (void)setProxyProbeServerErrorCount:(unint64_t)a3;
- (void)setProxyProbeSuccessCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPProbeStats

- (id)eventName
{
  return @"com.apple.nsp.ProbeStats";
}

- (id)probeReasonToString
{
  int64_t v2 = [(NSPProbeStats *)self probeReason];
  CFStringRef v3 = @"Unknown";
  if (v2 == 1) {
    CFStringRef v3 = @"Proxy";
  }
  if (v2 == 2) {
    return @"DNS";
  }
  else {
    return (id)v3;
  }
}

- (id)analyticsDict
{
  CFStringRef v3 = [(NSPProbeStats *)self tierType];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = [(NSPProbeStats *)self tierType];
    [v4 setObject:v5 forKeyedSubscript:@"TierType"];

    v6 = [(NSPProbeStats *)self probeReasonToString];
    [v4 setObject:v6 forKeyedSubscript:@"ProbeReason"];

    v7 = [(NSPProbeStats *)self probeInterface];
    [v4 setObject:v7 forKeyedSubscript:@"ProbeInterface"];

    v8 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self probeDurationSec]];
    [v4 setObject:v8 forKeyedSubscript:@"ProbeDuration"];

    v9 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self proxyProbeCount]];
    [v4 setObject:v9 forKeyedSubscript:@"ProxyProbeCount"];

    v10 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self proxyProbeSuccessCount]];
    [v4 setObject:v10 forKeyedSubscript:@"ProxyProbeSuccessCount"];

    v11 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self proxyProbeFailedCount]];
    [v4 setObject:v11 forKeyedSubscript:@"ProxyProbeFailedCount"];

    v12 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self proxyProbeRedirectedCount]];
    [v4 setObject:v12 forKeyedSubscript:@"ProxyProbeRedirectedCount"];

    v13 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self proxyProbeServerErrorCount]];
    [v4 setObject:v13 forKeyedSubscript:@"ProxyProbeServerErrorCount"];

    v14 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self directProbeCount]];
    [v4 setObject:v14 forKeyedSubscript:@"DirectProbeCount"];

    v15 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self directProbeSuccessCount]];
    [v4 setObject:v15 forKeyedSubscript:@"DirectProbeSuccessCount"];

    v16 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self directProbeFailedCount]];
    [v4 setObject:v16 forKeyedSubscript:@"DirectProbeFailedCount"];

    v17 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self directProbeRedirectedCount]];
    [v4 setObject:v17 forKeyedSubscript:@"DirectProbeRedirectedCount"];

    v18 = +[NSNumber numberWithUnsignedInteger:[(NSPProbeStats *)self directProbeServerErrorCount]];
    [v4 setObject:v18 forKeyedSubscript:@"DirectProbeServerErrorCount"];
  }
  else
  {
    v20 = nplog_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      int v21 = 136315138;
      v22 = "-[NSPProbeStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null self.tierType", (uint8_t *)&v21, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (int64_t)probeReason
{
  return self->_probeReason;
}

- (void)setProbeReason:(int64_t)a3
{
  self->_probeReason = a3;
}

- (NSString)probeInterface
{
  return self->_probeInterface;
}

- (void)setProbeInterface:(id)a3
{
}

- (unint64_t)probeDurationSec
{
  return self->_probeDurationSec;
}

- (void)setProbeDurationSec:(unint64_t)a3
{
  self->_probeDurationSec = a3;
}

- (unint64_t)proxyProbeCount
{
  return self->_proxyProbeCount;
}

- (void)setProxyProbeCount:(unint64_t)a3
{
  self->_proxyProbeCount = a3;
}

- (unint64_t)proxyProbeSuccessCount
{
  return self->_proxyProbeSuccessCount;
}

- (void)setProxyProbeSuccessCount:(unint64_t)a3
{
  self->_proxyProbeSuccessCount = a3;
}

- (unint64_t)proxyProbeFailedCount
{
  return self->_proxyProbeFailedCount;
}

- (void)setProxyProbeFailedCount:(unint64_t)a3
{
  self->_proxyProbeFailedCount = a3;
}

- (unint64_t)proxyProbeRedirectedCount
{
  return self->_proxyProbeRedirectedCount;
}

- (void)setProxyProbeRedirectedCount:(unint64_t)a3
{
  self->_proxyProbeRedirectedCount = a3;
}

- (unint64_t)proxyProbeServerErrorCount
{
  return self->_proxyProbeServerErrorCount;
}

- (void)setProxyProbeServerErrorCount:(unint64_t)a3
{
  self->_proxyProbeServerErrorCount = a3;
}

- (unint64_t)directProbeCount
{
  return self->_directProbeCount;
}

- (void)setDirectProbeCount:(unint64_t)a3
{
  self->_directProbeCount = a3;
}

- (unint64_t)directProbeSuccessCount
{
  return self->_directProbeSuccessCount;
}

- (void)setDirectProbeSuccessCount:(unint64_t)a3
{
  self->_directProbeSuccessCount = a3;
}

- (unint64_t)directProbeFailedCount
{
  return self->_directProbeFailedCount;
}

- (void)setDirectProbeFailedCount:(unint64_t)a3
{
  self->_directProbeFailedCount = a3;
}

- (unint64_t)directProbeRedirectedCount
{
  return self->_directProbeRedirectedCount;
}

- (void)setDirectProbeRedirectedCount:(unint64_t)a3
{
  self->_directProbeRedirectedCount = a3;
}

- (unint64_t)directProbeServerErrorCount
{
  return self->_directProbeServerErrorCount;
}

- (void)setDirectProbeServerErrorCount:(unint64_t)a3
{
  self->_directProbeServerErrorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeInterface, 0);

  objc_storeStrong((id *)&self->_tierType, 0);
}

@end