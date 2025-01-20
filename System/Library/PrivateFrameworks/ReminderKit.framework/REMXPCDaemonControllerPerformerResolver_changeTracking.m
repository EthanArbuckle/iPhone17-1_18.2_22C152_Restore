@interface REMXPCDaemonControllerPerformerResolver_changeTracking
- (REMStoreContainerToken)storeContainerToken;
- (REMXPCDaemonControllerPerformerResolver_changeTracking)initWithStoreContainerToken:(id)a3;
- (id)name;
- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation REMXPCDaemonControllerPerformerResolver_changeTracking

- (REMXPCDaemonControllerPerformerResolver_changeTracking)initWithStoreContainerToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMXPCDaemonControllerPerformerResolver_changeTracking;
  v6 = [(REMXPCDaemonControllerPerformerResolver_changeTracking *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeContainerToken, a3);
  }

  return v7;
}

- (id)name
{
  return @"changeTracking";
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(REMXPCDaemonControllerPerformerResolver_changeTracking *)self storeContainerToken];
  [v10 changeTrackingPerformerWithStoreContainerToken:v11 reason:v9 completion:v8];
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

- (void).cxx_destruct
{
}

@end