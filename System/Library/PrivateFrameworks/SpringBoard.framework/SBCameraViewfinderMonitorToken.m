@interface SBCameraViewfinderMonitorToken
- (SBCameraViewfinderMonitorToken)initWithMonitor:(id)a3 observer:(id)a4;
- (id)auditTokenForProcessWithActiveOrImminentViewfinderSession;
- (void)cancel;
@end

@implementation SBCameraViewfinderMonitorToken

- (id)auditTokenForProcessWithActiveOrImminentViewfinderSession
{
  monitor = self->_monitor;
  if (!monitor || !self->_observer)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBCameraViewfinderMonitor.m" lineNumber:200 description:@"Already canceled?"];

    monitor = self->_monitor;
  }
  return [(SBCameraViewfinderMonitor *)monitor auditTokenForProcessWithActiveOrImminentViewfinderSession];
}

- (SBCameraViewfinderMonitorToken)initWithMonitor:(id)a3 observer:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBCameraViewfinderMonitor.m", 178, @"Invalid parameter not satisfying: %@", @"monitor != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SBCameraViewfinderMonitor.m", 179, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SBCameraViewfinderMonitorToken;
  v11 = [(SBCameraViewfinderMonitorToken *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_monitor, a3);
    objc_storeStrong((id *)&v12->_observer, a4);
  }

  return v12;
}

- (void)cancel
{
  monitor = self->_monitor;
  if (!monitor || !self->_observer)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBCameraViewfinderMonitor.m" lineNumber:191 description:@"Already canceled?"];

    monitor = self->_monitor;
  }
  -[SBCameraViewfinderMonitor _removeObserver:](monitor, "_removeObserver:");
  observer = self->_observer;
  self->_observer = 0;

  v6 = self->_monitor;
  self->_monitor = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end