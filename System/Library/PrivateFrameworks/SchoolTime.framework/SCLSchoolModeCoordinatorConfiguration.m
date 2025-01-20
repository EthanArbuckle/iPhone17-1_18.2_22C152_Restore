@interface SCLSchoolModeCoordinatorConfiguration
- (BOOL)isManuallyManagedOnly;
- (BOOL)sendsRemoteHistoryItems;
- (BOOL)sendsRemoteScheduleSettings;
- (IDSDevice)idsDevice;
- (NRDevice)NRDevice;
- (NSURL)directoryURL;
- (OS_dispatch_queue)targetQueue;
- (SCLSchoolModeServer)server;
- (SCLTransportController)transportController;
- (SCLUnlockHistoryPersistentStore)historyStore;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setHistoryStore:(id)a3;
- (void)setIdsDevice:(id)a3;
- (void)setManuallyManagedOnly:(BOOL)a3;
- (void)setNRDevice:(id)a3;
- (void)setSendsRemoteHistoryItems:(BOOL)a3;
- (void)setSendsRemoteScheduleSettings:(BOOL)a3;
- (void)setServer:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTransportController:(id)a3;
@end

@implementation SCLSchoolModeCoordinatorConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SCLSchoolModeCoordinatorConfiguration);
  v5 = [(SCLSchoolModeCoordinatorConfiguration *)self NRDevice];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setNRDevice:v5];

  v6 = [(SCLSchoolModeCoordinatorConfiguration *)self idsDevice];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setIdsDevice:v6];

  v7 = [(SCLSchoolModeCoordinatorConfiguration *)self transportController];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setTransportController:v7];

  v8 = [(SCLSchoolModeCoordinatorConfiguration *)self server];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setServer:v8];

  v9 = [(SCLSchoolModeCoordinatorConfiguration *)self historyStore];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setHistoryStore:v9];

  v10 = [(SCLSchoolModeCoordinatorConfiguration *)self directoryURL];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setDirectoryURL:v10];

  [(SCLSchoolModeCoordinatorConfiguration *)v4 setSendsRemoteHistoryItems:[(SCLSchoolModeCoordinatorConfiguration *)self sendsRemoteHistoryItems]];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setSendsRemoteScheduleSettings:[(SCLSchoolModeCoordinatorConfiguration *)self sendsRemoteScheduleSettings]];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setManuallyManagedOnly:[(SCLSchoolModeCoordinatorConfiguration *)self isManuallyManagedOnly]];
  v11 = [(SCLSchoolModeCoordinatorConfiguration *)self targetQueue];
  [(SCLSchoolModeCoordinatorConfiguration *)v4 setTargetQueue:v11];

  return v4;
}

- (NRDevice)NRDevice
{
  return self->_NRDevice;
}

- (void)setNRDevice:(id)a3
{
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
}

- (SCLTransportController)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
}

- (SCLSchoolModeServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (SCLUnlockHistoryPersistentStore)historyStore
{
  return self->_historyStore;
}

- (void)setHistoryStore:(id)a3
{
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (BOOL)sendsRemoteScheduleSettings
{
  return self->_sendsRemoteScheduleSettings;
}

- (void)setSendsRemoteScheduleSettings:(BOOL)a3
{
  self->_sendsRemoteScheduleSettings = a3;
}

- (BOOL)sendsRemoteHistoryItems
{
  return self->_sendsRemoteHistoryItems;
}

- (void)setSendsRemoteHistoryItems:(BOOL)a3
{
  self->_sendsRemoteHistoryItems = a3;
}

- (BOOL)isManuallyManagedOnly
{
  return self->_manuallyManagedOnly;
}

- (void)setManuallyManagedOnly:(BOOL)a3
{
  self->_manuallyManagedOnly = a3;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_historyStore, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_transportController, 0);
  objc_storeStrong((id *)&self->_idsDevice, 0);
  objc_storeStrong((id *)&self->_NRDevice, 0);
}

@end