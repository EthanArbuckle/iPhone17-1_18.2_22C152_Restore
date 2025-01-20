@interface CSProxy
+ (BOOL)isHost;
+ (id)description;
+ (id)getProxiesForDiagnosticID:(id)a3;
+ (void)initRemoteServers;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3;
- (CSProxy)init;
- (NSString)diagnosticID;
- (unint64_t)getTimeoutSec;
- (void)cancelConnection;
- (void)setDiagnosticID:(id)a3;
- (void)transferFileToHost:(id)a3;
- (void)waitToReceiveCoSysdiagnose;
@end

@implementation CSProxy

- (CSProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSProxy;
  return [(CSProxy *)&v3 init];
}

+ (BOOL)isHost
{
}

+ (id)description
{
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3 = a3;
  __assert_rtn("+[CSProxy getProxiesForDiagnosticID:]", "CSProxy.m", 27, "0 && \"Error: must subclass CSProxy\"");
}

+ (void)initRemoteServers
{
}

- (void)cancelConnection
{
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSProxy triggerCoSysdiagnoseWithParams:]", "CSProxy.m", 39, "0 && \"Error: must subclass CSProxy\"");
}

- (void)waitToReceiveCoSysdiagnose
{
}

- (void)transferFileToHost:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSProxy transferFileToHost:]", "CSProxy.m", 47, "0 && \"Error: must subclass CSProxy\"");
}

- (unint64_t)getTimeoutSec
{
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiagnosticID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end