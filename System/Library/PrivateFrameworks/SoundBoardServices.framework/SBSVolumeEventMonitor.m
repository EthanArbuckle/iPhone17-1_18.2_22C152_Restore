@interface SBSVolumeEventMonitor
- (NSXPCConnection)sbConnection;
- (SBSVolumeEventMonitor)init;
- (SBSVolumeEventMonitor)initWithTarget:(id)a3;
- (SBSVolumeEventMonitorImplementer)sbProxy;
- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4;
- (void)setSbConnection:(id)a3;
@end

@implementation SBSVolumeEventMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (SBSVolumeEventMonitorImplementer)sbProxy
{
  return (SBSVolumeEventMonitorImplementer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSbConnection:(id)a3
{
}

- (NSXPCConnection)sbConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4
{
}

- (SBSVolumeEventMonitor)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSVolumeEventMonitor;
  v5 = [(SBSVolumeEventMonitor *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSVolumeEventMonitorImplementer *)v6;
  }
  return v5;
}

- (SBSVolumeEventMonitor)init
{
  return [(SBSVolumeEventMonitor *)self initWithTarget:@"localhost"];
}

@end