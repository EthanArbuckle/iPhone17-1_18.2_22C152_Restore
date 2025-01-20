@interface NSPToggleStats
- (BOOL)toggleState;
- (NSPProxyAgentNetworkStatistics)fallbackPathStatistics;
- (NSPProxyAgentNetworkStatistics)primaryPathStatistics;
- (NSPToggleStats)init;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)configOutageCount;
- (unint64_t)fraudAlertCount;
- (unint64_t)networkOutageCount;
- (unint64_t)odohAuthFailureCount;
- (unint64_t)odohBadMessageCount;
- (unint64_t)odohOutageCount;
- (unint64_t)proxyOutageCount;
- (unint64_t)systemIncompatibleCount;
- (unint64_t)tokenOutageCount;
- (void)addNetworkStatsToToggleStatsDict:(id)a3 networkStats:(id)a4;
- (void)resetStats;
- (void)sendToggleOffStats;
- (void)sendToggleOnStats;
- (void)setConfigOutageCount:(unint64_t)a3;
- (void)setFallbackPathStatistics:(id)a3;
- (void)setFraudAlertCount:(unint64_t)a3;
- (void)setNetworkOutageCount:(unint64_t)a3;
- (void)setOdohAuthFailureCount:(unint64_t)a3;
- (void)setOdohBadMessageCount:(unint64_t)a3;
- (void)setOdohOutageCount:(unint64_t)a3;
- (void)setPrimaryPathStatistics:(id)a3;
- (void)setProxyOutageCount:(unint64_t)a3;
- (void)setSystemIncompatibleCount:(unint64_t)a3;
- (void)setToggleState:(BOOL)a3;
- (void)setTokenOutageCount:(unint64_t)a3;
@end

@implementation NSPToggleStats

- (NSPToggleStats)init
{
  v8.receiver = self;
  v8.super_class = (Class)NSPToggleStats;
  v2 = [(NSPToggleStats *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    primaryPathStatistics = v2->_primaryPathStatistics;
    v2->_primaryPathStatistics = v3;

    v5 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    fallbackPathStatistics = v2->_fallbackPathStatistics;
    v2->_fallbackPathStatistics = v5;
  }
  return v2;
}

- (id)eventName
{
  return @"com.apple.nsp.ToggleStats";
}

- (void)addNetworkStatsToToggleStatsDict:(id)a3 networkStats:(id)a4
{
  id v6 = a3;
  v7 = a4;
  objc_super v8 = v7;
  if (!v6)
  {
    v38 = nplog_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]";
    v40 = "%s called with null toggleStatsDict";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, v40, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v7)
  {
    v38 = nplog_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]";
    v40 = "%s called with null networkStats";
    goto LABEL_14;
  }
  v9 = [(NSPToggleStats *)self primaryPathStatistics];

  if (v9 == v8)
  {
    CFStringRef v11 = @"PrimaryPath";
  }
  else
  {
    v10 = [(NSPToggleStats *)self fallbackPathStatistics];

    if (v10 == v8) {
      CFStringRef v11 = @"FallbackPath";
    }
    else {
      CFStringRef v11 = 0;
    }
  }
  v12 = +[NSString stringWithFormat:@"%@%@", v11, @"ProxyConnectionSuccessCount"];
  v13 = +[NSNumber numberWithUnsignedInteger:v8[2]];
  [v6 setObject:v13 forKeyedSubscript:v12];

  v14 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionTimeoutCount"];

  v15 = +[NSNumber numberWithUnsignedInteger:v8[3]];
  [v6 setObject:v15 forKeyedSubscript:v14];

  v16 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionRefusedCount"];

  v17 = +[NSNumber numberWithUnsignedInteger:v8[4]];
  [v6 setObject:v17 forKeyedSubscript:v16];

  v18 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionHostDownCount"];

  v19 = +[NSNumber numberWithUnsignedInteger:v8[5]];
  [v6 setObject:v19 forKeyedSubscript:v18];

  v20 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionHostUnreachableCount"];

  v21 = +[NSNumber numberWithUnsignedInteger:v8[6]];
  [v6 setObject:v21 forKeyedSubscript:v20];

  v22 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionErrorCount"];

  v23 = +[NSNumber numberWithUnsignedInteger:v8[7]];
  [v6 setObject:v23 forKeyedSubscript:v22];

  v24 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionDNSTimeoutCount"];

  v25 = +[NSNumber numberWithUnsignedInteger:v8[8]];
  [v6 setObject:v25 forKeyedSubscript:v24];

  v26 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionDNSBlockedCount"];

  v27 = +[NSNumber numberWithUnsignedInteger:v8[9]];
  [v6 setObject:v27 forKeyedSubscript:v26];

  v28 = +[NSString stringWithFormat:@"%@%@", v11, @"IngressProxyConnectionCertErrorCount"];

  v29 = +[NSNumber numberWithUnsignedInteger:v8[10]];
  [v6 setObject:v29 forKeyedSubscript:v28];

  v30 = +[NSString stringWithFormat:@"%@%@", v11, @"EgressProxyConnectionErrorCount"];

  v31 = +[NSNumber numberWithUnsignedInteger:v8[11]];
  [v6 setObject:v31 forKeyedSubscript:v30];

  v32 = +[NSString stringWithFormat:@"%@%@", v11, @"OriginProxyConnectionErrorCount"];

  v33 = +[NSNumber numberWithUnsignedInteger:v8[12]];
  [v6 setObject:v33 forKeyedSubscript:v32];

  v34 = +[NSString stringWithFormat:@"%@%@", v11, @"EgressProxyUnavailableErrorCount"];

  v35 = +[NSNumber numberWithUnsignedInteger:v8[13]];
  [v6 setObject:v35 forKeyedSubscript:v34];

  v36 = +[NSString stringWithFormat:@"%@%@", v11, @"IncompleteHandshakeStallCount"];

  v37 = +[NSNumber numberWithUnsignedInteger:v8[14]];
  [v6 setObject:v37 forKeyedSubscript:v36];

  v38 = +[NSString stringWithFormat:@"%@%@", v11, @"PostHandShakeStallCount"];

  v39 = +[NSNumber numberWithUnsignedInteger:v8[15]];
  [v6 setObject:v39 forKeyedSubscript:v38];

LABEL_9:
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithBool:[(NSPToggleStats *)self toggleState]];
  [v3 setObject:v4 forKeyedSubscript:@"ToggleState"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self configOutageCount]];
  [v3 setObject:v5 forKeyedSubscript:@"ConfigOutageCount"];

  id v6 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self tokenOutageCount]];
  [v3 setObject:v6 forKeyedSubscript:@"TokenOutageCount"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self networkOutageCount]];
  [v3 setObject:v7 forKeyedSubscript:@"NetworkOutageCount"];

  objc_super v8 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self proxyOutageCount]];
  [v3 setObject:v8 forKeyedSubscript:@"ProxyOutageCount"];

  v9 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self odohOutageCount]];
  [v3 setObject:v9 forKeyedSubscript:@"ODoHOutageCount"];

  v10 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self systemIncompatibleCount]];
  [v3 setObject:v10 forKeyedSubscript:@"SystemIncompatibleCount"];

  CFStringRef v11 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self fraudAlertCount]];
  [v3 setObject:v11 forKeyedSubscript:@"FraudAlertCount"];

  v12 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self odohAuthFailureCount]];
  [v3 setObject:v12 forKeyedSubscript:@"ODoHAuthFailureCount"];

  v13 = +[NSNumber numberWithUnsignedInteger:[(NSPToggleStats *)self odohBadMessageCount]];
  [v3 setObject:v13 forKeyedSubscript:@"ODoHBadMessageCount"];

  v14 = [(NSPToggleStats *)self primaryPathStatistics];
  [(NSPToggleStats *)self addNetworkStatsToToggleStatsDict:v3 networkStats:v14];

  v15 = [(NSPToggleStats *)self fallbackPathStatistics];
  [(NSPToggleStats *)self addNetworkStatsToToggleStatsDict:v3 networkStats:v15];

  return v3;
}

- (void)sendToggleOnStats
{
  [(NSPToggleStats *)self setToggleState:1];

  [(NSPProxyAnalytics *)self sendAnalytics];
}

- (void)sendToggleOffStats
{
  [(NSPToggleStats *)self setToggleState:0];

  [(NSPProxyAnalytics *)self sendAnalytics];
}

- (void)resetStats
{
  [(NSPToggleStats *)self setConfigOutageCount:0];
  [(NSPToggleStats *)self setTokenOutageCount:0];
  [(NSPToggleStats *)self setNetworkOutageCount:0];
  [(NSPToggleStats *)self setProxyOutageCount:0];
  [(NSPToggleStats *)self setOdohOutageCount:0];
  [(NSPToggleStats *)self setSystemIncompatibleCount:0];
  [(NSPToggleStats *)self setFraudAlertCount:0];
  [(NSPToggleStats *)self setOdohAuthFailureCount:0];
  [(NSPToggleStats *)self setOdohBadMessageCount:0];
  id v3 = [(NSPToggleStats *)self primaryPathStatistics];
  if (v3)
  {
    v3[6] = 0u;
    v3[7] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[1] = 0u;
  }

  v4 = [(NSPToggleStats *)self fallbackPathStatistics];
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[1] = 0u;
  }
}

- (unint64_t)tokenOutageCount
{
  return self->_tokenOutageCount;
}

- (void)setTokenOutageCount:(unint64_t)a3
{
  self->_tokenOutageCount = a3;
}

- (unint64_t)configOutageCount
{
  return self->_configOutageCount;
}

- (void)setConfigOutageCount:(unint64_t)a3
{
  self->_configOutageCount = a3;
}

- (unint64_t)networkOutageCount
{
  return self->_networkOutageCount;
}

- (void)setNetworkOutageCount:(unint64_t)a3
{
  self->_networkOutageCount = a3;
}

- (unint64_t)proxyOutageCount
{
  return self->_proxyOutageCount;
}

- (void)setProxyOutageCount:(unint64_t)a3
{
  self->_proxyOutageCount = a3;
}

- (unint64_t)odohOutageCount
{
  return self->_odohOutageCount;
}

- (void)setOdohOutageCount:(unint64_t)a3
{
  self->_odohOutageCount = a3;
}

- (unint64_t)systemIncompatibleCount
{
  return self->_systemIncompatibleCount;
}

- (void)setSystemIncompatibleCount:(unint64_t)a3
{
  self->_systemIncompatibleCount = a3;
}

- (unint64_t)fraudAlertCount
{
  return self->_fraudAlertCount;
}

- (void)setFraudAlertCount:(unint64_t)a3
{
  self->_fraudAlertCount = a3;
}

- (NSPProxyAgentNetworkStatistics)primaryPathStatistics
{
  return self->_primaryPathStatistics;
}

- (void)setPrimaryPathStatistics:(id)a3
{
}

- (NSPProxyAgentNetworkStatistics)fallbackPathStatistics
{
  return self->_fallbackPathStatistics;
}

- (void)setFallbackPathStatistics:(id)a3
{
}

- (unint64_t)odohAuthFailureCount
{
  return self->_odohAuthFailureCount;
}

- (void)setOdohAuthFailureCount:(unint64_t)a3
{
  self->_odohAuthFailureCount = a3;
}

- (unint64_t)odohBadMessageCount
{
  return self->_odohBadMessageCount;
}

- (void)setOdohBadMessageCount:(unint64_t)a3
{
  self->_odohBadMessageCount = a3;
}

- (BOOL)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(BOOL)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackPathStatistics, 0);

  objc_storeStrong((id *)&self->_primaryPathStatistics, 0);
}

@end