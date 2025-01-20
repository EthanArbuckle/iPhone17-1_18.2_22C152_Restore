@interface BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection
+ (id)daemonProtocolInterface;
- (BOOL)isEnrolled;
- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol)remoteObjectProxy;
- (BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection)initWithConnection:(id)a3 broadcastingProvider:(id)a4;
- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController)enrollmentController;
- (void)activateWithCompletion:(id)a3;
- (void)beginAdvertisingProximityAutomatedDeviceEnrollment;
- (void)endAdvertisingProximityAutomatedDeviceEnrollment;
- (void)enrollmentController:(id)a3 hasBroadcastError:(id)a4;
- (void)enrollmentController:(id)a3 hasCompletedWithViewModel:(id)a4;
- (void)enrollmentController:(id)a3 hasUpdatedWithViewModel:(id)a4;
- (void)enrollmentController:(id)a3 needsToDisplayPin:(id)a4;
- (void)enrollmentControllerHasPaired:(id)a3 withInitialViewModel:(id)a4;
- (void)enrollmentControllerNeedsToDismissPin:(id)a3;
- (void)fetchActivationStateWithCompletion:(id)a3;
- (void)reboot;
- (void)shutDown;
- (void)shutdown;
@end

@implementation BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection

+ (id)daemonProtocolInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BYDaemonProximityAutomatedDeviceEnrollmentTargetProtocol];
}

- (BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection)initWithConnection:(id)a3 broadcastingProvider:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection;
  v7 = [(BYDaemonClientConnection *)&v20 initWithConnection:a3];
  if (v7)
  {
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ created.", buf, 0xCu);
    }
    id v11 = objc_alloc_init((Class)DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives);
    id v12 = objc_alloc_init((Class)DMTMobileGestaltBackedDeviceInformationPrimitives);
    id v13 = objc_alloc_init((Class)DMTNetworkBackedInternetReachabilityPrimitives);
    id v14 = objc_alloc_init((Class)DMTCoreWiFiBackedWiFiPrimitives);
    id v15 = objc_alloc_init((Class)DMTManagedConfigurationBackedProfileInstallationPrimitives);
    v16 = objc_opt_new();
    v17 = (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)[objc_alloc((Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController) initWithBroadcastingProvider:v6 enrollmentPrimitives:v11 deviceInformationPrimitives:v12 enrollmentInformationPrimitives:v7 reachabilityPrimitives:v13 wifiActivationPrimitives:v7 wifiPrimitives:v14 profileInstallationPrimitives:v15 destructiveErasePrimitives:v16 powerOffPrimitives:v7 delegate:v7];
    enrollmentController = v7->_enrollmentController;
    v7->_enrollmentController = v17;
  }
  return v7;
}

- (void)beginAdvertisingProximityAutomatedDeviceEnrollment
{
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self enrollmentController];
  [v6 beginBroadcasting];
}

- (void)endAdvertisingProximityAutomatedDeviceEnrollment
{
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self enrollmentController];
  [v6 endBroadcasting];
}

- (void)shutdown
{
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self enrollmentController];
  [v6 beginEraseAndShutdown];
}

- (void)enrollmentController:(id)a3 hasBroadcastError:(id)a4
{
  id v5 = a4;
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v6 dismissProximityPinCodeWithError:v5];
}

- (void)enrollmentController:(id)a3 needsToDisplayPin:(id)a4
{
  id v5 = a4;
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v6 displayProximityPinCode:v5];
}

- (void)enrollmentControllerNeedsToDismissPin:(id)a3
{
  id v3 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v3 dismissProximityPinCodeWithError:0];
}

- (void)enrollmentControllerHasPaired:(id)a3 withInitialViewModel:(id)a4
{
  id v5 = a4;
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v6 configuratorPairingSuccessfulWithViewModel:v5];
}

- (void)enrollmentController:(id)a3 hasCompletedWithViewModel:(id)a4
{
  id v5 = a4;
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v6 enrollmentCompleteWithViewModel:v5];
}

- (void)enrollmentController:(id)a3 hasUpdatedWithViewModel:(id)a4
{
  id v5 = a4;
  id v6 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v6 enrollmentHasStatusUpdateWithViewModel:v5];
}

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol)remoteObjectProxy
{
  v2 = [(BYDaemonClientConnection *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_10001C768];

  return (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol *)v3;
}

- (BOOL)isEnrolled
{
  return 0;
}

- (void)reboot
{
}

- (void)shutDown
{
  id v2 = [(BYDaemonProximityAutomatedDeviceEnrollmentTargetClientConnection *)self remoteObjectProxy];
  [v2 displayShutdownUI];
}

- (void)fetchActivationStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDaemonClientConnection *)self connection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005B14;
  v11[3] = &unk_10001C790;
  id v6 = v4;
  id v12 = v6;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005B2C;
  v9[3] = &unk_10001C7B8;
  id v10 = v6;
  id v8 = v6;
  [v7 fetchActivationStateWithCompletion:v9];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDaemonClientConnection *)self connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005C0C;
  v8[3] = &unk_10001C790;
  id v9 = v4;
  id v6 = v4;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 activateUsingWiFiWithCompletion:v6];
}

- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (void).cxx_destruct
{
}

@end