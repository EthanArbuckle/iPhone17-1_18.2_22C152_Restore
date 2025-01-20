@interface REMXPCDaemonControllerPerformerResolver_store
- (REMStoreContainerToken)storeContainerToken;
- (REMXPCDaemonControllerPerformerResolver_store)initWithStoreContainerToken:(id)a3;
- (id)name;
- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation REMXPCDaemonControllerPerformerResolver_store

- (void).cxx_destruct
{
}

- (REMXPCDaemonControllerPerformerResolver_store)initWithStoreContainerToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMXPCDaemonControllerPerformerResolver_store;
  v6 = [(REMXPCDaemonControllerPerformerResolver_store *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeContainerToken, a3);
  }

  return v7;
}

- (id)name
{
  return @"store";
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F28F80];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 processInfo];
  id v14 = [v12 processName];

  v13 = [(REMXPCDaemonControllerPerformerResolver_store *)self storeContainerToken];
  [v11 storePerformerWithProcessName:v14 storeContainerToken:v13 reason:v10 completion:v9];
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

@end