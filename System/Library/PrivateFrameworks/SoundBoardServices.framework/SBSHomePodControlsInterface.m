@interface SBSHomePodControlsInterface
- (BOOL)isMediaAlarm:(id)a3;
- (SBSHomePodControlsInterface)init;
- (SBSHomePodControlsInterface)initWithTarget:(id)a3;
- (void)dealloc;
- (void)getAllSyncedAlarmsAndTimers:(id)a3;
@end

@implementation SBSHomePodControlsInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSHomePodControlsInterface;
  [(SBSHomePodControlsInterface *)&v3 dealloc];
}

- (BOOL)isMediaAlarm:(id)a3
{
  return [(SBSHomePodControlsImplementer *)self->_sbProxy isMediaAlarm:a3];
}

- (void)getAllSyncedAlarmsAndTimers:(id)a3
{
  if (a3)
  {
    sbProxy = self->_sbProxy;
    -[SBSHomePodControlsImplementer getAllSyncedAlarmsAndTimers:](sbProxy, "getAllSyncedAlarmsAndTimers:");
  }
  else
  {
    v4 = _SBSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "getAllSyncedAlarmsAndTimers Reply completion handler is nil", v5, 2u);
    }
  }
}

- (SBSHomePodControlsInterface)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomePodControlsInterface;
  v5 = [(SBSHomePodControlsInterface *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSHomePodControlsImplementer *)v6;
  }
  return v5;
}

- (SBSHomePodControlsInterface)init
{
  return [(SBSHomePodControlsInterface *)self initWithTarget:@"localhost"];
}

@end