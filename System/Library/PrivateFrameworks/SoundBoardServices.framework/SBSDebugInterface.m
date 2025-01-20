@interface SBSDebugInterface
- (SBSDebugInterface)init;
- (SBSDebugInterface)initWithTarget:(id)a3;
- (void)clearHomeSWUpdate;
- (void)dealloc;
- (void)disassociateCurrentNetwork;
- (void)disassociateNetworkWithName:(id)a3;
- (void)getAllDebugInfo:(id)a3;
- (void)getFeatureFlags:(id)a3;
- (void)getLEDInfo:(id)a3;
- (void)getSelectDebugInfo:(id)a3 reply:(id)a4;
- (void)getTuningInfo:(id)a3;
- (void)getUserDefaults:(id)a3;
- (void)getVolume:(id)a3;
- (void)injectSWUpdateToHome:(id)a3;
- (void)playTone:(unsigned int)a3;
- (void)render:(id)a3;
- (void)resetAllUserDefaults;
- (void)resetUserDefault:(id)a3;
- (void)sendButtonCommand:(id)a3;
- (void)sendLEDCommand:(id)a3;
- (void)setBootSpinner:(BOOL)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHomeUpdateState:(int64_t)a3;
- (void)setLEDContents:(id)a3;
- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5;
- (void)setUserDefaults:(id)a3 withValue:(id)a4;
- (void)setVolume:(float)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)siriSay:(id)a3;
- (void)stopTone:(unsigned int)a3;
- (void)suScanForSoftwareUpdate;
- (void)triggerWiFiCoreCapture:(id)a3;
@end

@implementation SBSDebugInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSDebugInterface;
  [(SBSDebugInterface *)&v3 dealloc];
}

- (void)setVolume:(float)a3
{
}

- (void)getVolume:(id)a3
{
}

- (void)suScanForSoftwareUpdate
{
}

- (void)setFeatureFlags:(id)a3
{
}

- (void)getFeatureFlags:(id)a3
{
  if (a3)
  {
    sbProxy = self->_sbProxy;
    -[SBSDebugInfoImplementer getFeatureFlags:](sbProxy, "getFeatureFlags:");
  }
  else
  {
    v4 = _SBSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v5, 2u);
    }
  }
}

- (void)disassociateNetworkWithName:(id)a3
{
}

- (void)disassociateCurrentNetwork
{
}

- (void)setWifiEnabled:(BOOL)a3
{
}

- (void)setBootSpinner:(BOOL)a3
{
}

- (void)clearHomeSWUpdate
{
}

- (void)setHomeUpdateState:(int64_t)a3
{
}

- (void)injectSWUpdateToHome:(id)a3
{
}

- (void)sendButtonCommand:(id)a3
{
}

- (void)triggerWiFiCoreCapture:(id)a3
{
}

- (void)siriSay:(id)a3
{
}

- (void)setLEDContents:(id)a3
{
}

- (void)render:(id)a3
{
}

- (void)sendLEDCommand:(id)a3
{
}

- (void)getLEDInfo:(id)a3
{
}

- (void)resetUserDefault:(id)a3
{
}

- (void)resetAllUserDefaults
{
}

- (void)setUserDefaults:(id)a3 withValue:(id)a4
{
}

- (void)getUserDefaults:(id)a3
{
  if (a3)
  {
    sbProxy = self->_sbProxy;
    -[SBSDebugInfoImplementer getUserDefaults:](sbProxy, "getUserDefaults:");
  }
  else
  {
    v4 = _SBSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v5, 2u);
    }
  }
}

- (void)stopTone:(unsigned int)a3
{
}

- (void)playTone:(unsigned int)a3
{
}

- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5
{
}

- (void)getTuningInfo:(id)a3
{
  if (a3)
  {
    sbProxy = self->_sbProxy;
    -[SBSDebugInfoImplementer getTuningInfo:](sbProxy, "getTuningInfo:");
  }
  else
  {
    v4 = _SBSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v5, 2u);
    }
  }
}

- (void)getSelectDebugInfo:(id)a3 reply:(id)a4
{
}

- (void)getAllDebugInfo:(id)a3
{
  if (a3)
  {
    sbProxy = self->_sbProxy;
    -[SBSDebugInfoImplementer getAllDebugInfo:](sbProxy, "getAllDebugInfo:");
  }
  else
  {
    v4 = _SBSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v5, 2u);
    }
  }
}

- (SBSDebugInterface)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSDebugInterface;
  v5 = [(SBSDebugInterface *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSDebugInfoImplementer *)v6;
  }
  return v5;
}

- (SBSDebugInterface)init
{
  return [(SBSDebugInterface *)self initWithTarget:@"localhost"];
}

@end