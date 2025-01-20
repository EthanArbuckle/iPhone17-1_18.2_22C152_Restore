@interface BYDaemonProximityController
+ (id)sharedController;
- (BOOL)hasConnection;
- (BOOL)showingPIN;
- (BYDaemonProximityControllerDelegate)delegate;
- (CUMessageSession)messageSession;
- (NSString)deviceClass;
- (NSString)model;
- (SASProximityHandshake)handshake;
- (SASProximityInformation)information;
- (SFDeviceSetupServiceiOS)service;
- (id)deviceClassForSharingDeviceClass:(unsigned __int8)a3;
- (id)fileTransferSessionTemplate;
- (id)suspendCompletionBlock;
- (void)beginAdvertising;
- (void)beginSIMSetupExternalAuthentication;
- (void)endAdvertising;
- (void)endDeviceToDeviceMigration;
- (void)endPairing;
- (void)endSIMSetupExternalAuthentication;
- (void)setDelegate:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setHandshake:(id)a3;
- (void)setHasConnection:(BOOL)a3;
- (void)setInformation:(id)a3;
- (void)setMessageSession:(id)a3;
- (void)setModel:(id)a3;
- (void)setService:(id)a3;
- (void)setShowingPIN:(BOOL)a3;
- (void)setSuspendCompletionBlock:(id)a3;
- (void)showMigrationInterfaceOnSource;
- (void)suspendConnectionForSoftwareUpdate:(id)a3;
@end

@implementation BYDaemonProximityController

+ (id)sharedController
{
  if (qword_100024CF8 != -1) {
    dispatch_once(&qword_100024CF8, &stru_10001C5D8);
  }
  v2 = (void *)qword_100024D00;
  return v2;
}

- (void)beginAdvertising
{
  v3 = [(BYDaemonProximityController *)self service];

  v4 = _BYLoggingFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already advertising for proximity...", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting advertising for proximity...", (uint8_t *)buf, 2u);
    }

    id v6 = objc_alloc_init((Class)SFDeviceSetupServiceiOS);
    [(BYDaemonProximityController *)self setService:v6];

    dispatch_queue_t v7 = dispatch_queue_create("Proximity Setup Queue", 0);
    v8 = [(BYDaemonProximityController *)self service];
    [v8 setDispatchQueue:v7];

    objc_initWeak(buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100003458;
    v20[3] = &unk_10001C600;
    objc_copyWeak(&v21, buf);
    v9 = [(BYDaemonProximityController *)self service];
    [v9 setShowPINHandlerEx:v20];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000034E0;
    v18[3] = &unk_10001C628;
    objc_copyWeak(&v19, buf);
    v10 = [(BYDaemonProximityController *)self service];
    [v10 setCompletionHandler:v18];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003558;
    v16[3] = &unk_10001C650;
    objc_copyWeak(&v17, buf);
    v11 = [(BYDaemonProximityController *)self service];
    [v11 setProgressHandlerEx:v16];

    objc_copyWeak(&v15, buf);
    v12 = [(BYDaemonProximityController *)self service];
    [v12 setReceivedObjectHandler:&v14];

    v13 = [(BYDaemonProximityController *)self service];
    [v13 activate];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
}

- (void)endAdvertising
{
  v3 = [(BYDaemonProximityController *)self service];

  if (v3)
  {
    v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ending advertising for proximity...", v6, 2u);
    }

    BOOL v5 = [(BYDaemonProximityController *)self service];
    [v5 invalidate];

    [(BYDaemonProximityController *)self setService:0];
  }
}

- (void)endPairing
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending pairing...", v5, 2u);
  }

  v4 = [(BYDaemonProximityController *)self service];
  [v4 sendSetupAction:1 info:0 responseHandler:0];
}

- (void)beginSIMSetupExternalAuthentication
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning SIM setup external authentication", v5, 2u);
  }

  v4 = [(BYDaemonProximityController *)self service];
  [v4 sendSetupAction:9 info:0 responseHandler:0];
}

- (void)endSIMSetupExternalAuthentication
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending SIM setup external authentication", v5, 2u);
  }

  v4 = [(BYDaemonProximityController *)self service];
  [v4 sendSetupAction:10 info:0 responseHandler:0];
}

- (id)fileTransferSessionTemplate
{
  v2 = [(BYDaemonProximityController *)self service];
  v3 = [v2 fileTransferSessionTemplate];

  return v3;
}

- (void)endDeviceToDeviceMigration
{
  id v2 = [(BYDaemonProximityController *)self service];
  [v2 sendSetupAction:4 info:0 responseHandler:0];
}

- (void)showMigrationInterfaceOnSource
{
  id v2 = [(BYDaemonProximityController *)self service];
  [v2 sendSetupAction:3 info:0 responseHandler:0];
}

- (void)suspendConnectionForSoftwareUpdate:(id)a3
{
  [(BYDaemonProximityController *)self setSuspendCompletionBlock:a3];
  id v4 = [(BYDaemonProximityController *)self service];
  [v4 sendSetupAction:5 info:0 responseHandler:0];
}

- (id)deviceClassForSharingDeviceClass:(unsigned __int8)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return *(&off_10001C698 + (char)(a3 - 1));
  }
}

- (BYDaemonProximityControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYDaemonProximityControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SASProximityHandshake)handshake
{
  return (SASProximityHandshake *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandshake:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceClass:(id)a3
{
}

- (SASProximityInformation)information
{
  return (SASProximityInformation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInformation:(id)a3
{
}

- (CUMessageSession)messageSession
{
  return (CUMessageSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageSession:(id)a3
{
}

- (BOOL)hasConnection
{
  return self->_hasConnection;
}

- (void)setHasConnection:(BOOL)a3
{
  self->_hasConnection = a3;
}

- (SFDeviceSetupServiceiOS)service
{
  return (SFDeviceSetupServiceiOS *)objc_getProperty(self, a2, 64, 1);
}

- (void)setService:(id)a3
{
}

- (BOOL)showingPIN
{
  return self->_showingPIN;
}

- (void)setShowingPIN:(BOOL)a3
{
  self->_showingPIN = a3;
}

- (id)suspendCompletionBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSuspendCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suspendCompletionBlock, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_handshake, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end