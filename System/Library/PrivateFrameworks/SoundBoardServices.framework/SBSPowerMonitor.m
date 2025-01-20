@interface SBSPowerMonitor
- (SBSPowerMonitor)init;
- (SBSPowerMonitor)initWithTarget:(id)a3;
- (void)dealloc;
- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4;
@end

@implementation SBSPowerMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSPowerMonitor;
  [(SBSPowerMonitor *)&v3 dealloc];
}

- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4
{
  if (a4)
  {
    sbProxy = self->_sbProxy;
    -[SBSPowerMonitorImplementer getPowerEstimateForInterval:reply:](sbProxy, "getPowerEstimateForInterval:reply:");
  }
  else
  {
    v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_230B2C000, v5, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v6, 2u);
    }
  }
}

- (SBSPowerMonitor)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSPowerMonitor;
  v5 = [(SBSPowerMonitor *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSPowerMonitorImplementer *)v6;
  }
  return v5;
}

- (SBSPowerMonitor)init
{
  return [(SBSPowerMonitor *)self initWithTarget:@"localhost"];
}

@end