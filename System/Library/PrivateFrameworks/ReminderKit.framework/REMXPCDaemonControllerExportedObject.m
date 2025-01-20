@interface REMXPCDaemonControllerExportedObject
- (REMXPCDaemonControllerCloudKitNetworkActivityDelegate)cloudKitNetworkActivityDelegate;
- (void)cloudKitNetworkActivityDidUpdate:(id)a3;
- (void)setCloudKitNetworkActivityDelegate:(id)a3;
@end

@implementation REMXPCDaemonControllerExportedObject

- (void)cloudKitNetworkActivityDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMXPCDaemonControllerExportedObject *)self cloudKitNetworkActivityDelegate];
  [v5 cloudKitNetworkActivityDidChange:v4];
}

- (REMXPCDaemonControllerCloudKitNetworkActivityDelegate)cloudKitNetworkActivityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitNetworkActivityDelegate);

  return (REMXPCDaemonControllerCloudKitNetworkActivityDelegate *)WeakRetained;
}

- (void)setCloudKitNetworkActivityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end