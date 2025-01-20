@interface CARDNDServiceAgent
+ (id)_DNDServiceInterface;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CARAutomaticDNDStatus)status;
- (CARDNDServiceAgent)initWithVehicleStore:(id)a3;
- (CRVehicleStore)vehicleStore;
- (void)_triggerModeChanged:(unint64_t)a3 mechanism:(id)a4;
- (void)allowedAutoReplyAudienceWithReply:(id)a3;
- (void)autoReplyMessageWithReply:(id)a3;
- (void)dealloc;
- (void)disableDNDUntilEndOfDriveWithContext:(id)a3 reply:(id)a4;
- (void)fetchDNDTriggerModeWithReply:(id)a3;
- (void)isCarPlayAutomaticDNDActiveWithReply:(id)a3;
- (void)resetAutomaticDNDPreferencesWithReply:(id)a3;
- (void)setAllowedAutoReplyAudience:(unint64_t)a3 reply:(id)a4;
- (void)setAutoReplyMessage:(id)a3 reply:(id)a4;
- (void)setCarPlayAutomaticDNDActive:(BOOL)a3 withReply:(id)a4;
- (void)setDNDTriggerMode:(unint64_t)a3 withReply:(id)a4;
- (void)setStatus:(id)a3;
- (void)setVehicleStore:(id)a3;
- (void)shouldDisplayExitConfirmationWithReply:(id)a3;
@end

@implementation CARDNDServiceAgent

- (CARDNDServiceAgent)initWithVehicleStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CARDNDServiceAgent;
  v6 = [(CARDNDServiceAgent *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vehicleStore, a3);
    v8 = (CARAutomaticDNDStatus *)objc_alloc_init((Class)CARAutomaticDNDStatus);
    status = v7->_status;
    v7->_status = v8;

    [(CARAutomaticDNDStatus *)v7->_status _detachObservers];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)sub_100047F44, CARAutomaticDNDCarPlayActivationChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v7;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARDNDServiceAgent;
  [(CARDNDServiceAgent *)&v4 dealloc];
}

+ (id)_DNDServiceInterface
{
  if (qword_1000E38C0 != -1) {
    dispatch_once(&qword_1000E38C0, &stru_1000BEB88);
  }
  v2 = (void *)qword_1000E38B8;

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.carkit.app"];
  if ([v6 BOOLValue])
  {

LABEL_4:
    v9 = CarDNDWDLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v5 serviceName];
      v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
      int v16 = 138412802;
      id v17 = v5;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Receiving connection %@ to service %@ from %@", (uint8_t *)&v16, 0x20u);
    }
    objc_super v12 = [(id)objc_opt_class() _DNDServiceInterface];
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:self];
    [v5 resume];
    BOOL v13 = 1;
    goto LABEL_10;
  }
  v7 = [v5 valueForEntitlement:@"com.apple.private.carkit.dnd"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8) {
    goto LABEL_4;
  }
  v14 = CarDNDWDLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    sub_100074EC0(v5, v14);
  }

  BOOL v13 = 0;
LABEL_10:

  return v13;
}

- (void)isCarPlayAutomaticDNDActiveWithReply:(id)a3
{
  id v4 = a3;
  id v5 = +[CARDNDManager sharedManager];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isDNDValid]);
}

- (void)setCarPlayAutomaticDNDActive:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = +[CARDNDManager sharedManager];
  objc_initWeak(&location, v6);

  if (v4)
  {
    v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v8 = "Engaging Driving from external activation.";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
  else
  {
    v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v8 = "Disabling Driving from external activation.";
      goto LABEL_6;
    }
  }

  id v9 = objc_loadWeakRetained(&location);
  v10 = [v9 CARDNDQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000484B0;
  block[3] = &unk_1000BEBB0;
  BOOL v15 = v4;
  objc_copyWeak(&v14, &location);
  id v13 = v5;
  id v11 = v5;
  dispatch_async(v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)resetAutomaticDNDPreferencesWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = [(CARDNDServiceAgent *)self status];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000487DC;
  v6[3] = &unk_1000BD1B0;
  v6[4] = self;
  [v5 _performCARPreferencesBlock:v6 forReading:0];

  if (v4) {
    v4[2](v4, 1, 0);
  }
}

- (void)shouldDisplayExitConfirmationWithReply:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  BOOL v4 = +[CARDNDManager sharedManager];
  if ([v4 isDNDValid])
  {
    id v5 = +[CARDNDManager sharedManager];
    uint64_t v6 = [v5 isCurrentlyInGeofencedRegion] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Should Display Exit Confirmation: %d", (uint8_t *)v8, 8u);
  }

  if (v3) {
    v3[2](v3, v6, 0);
  }
}

- (void)fetchDNDTriggerModeWithReply:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(CARDNDServiceAgent *)self status];
    (*((void (**)(id, id, void))a3 + 2))(v5, [v6 automaticDNDTriggeringMethod], 0);
  }
}

- (void)_triggerModeChanged:(unint64_t)a3 mechanism:(id)a4
{
  id v6 = a4;
  v7 = [(CARDNDServiceAgent *)self status];
  unint64_t v8 = (unint64_t)[v7 automaticDNDTriggeringMethod];

  id v9 = [(CARDNDServiceAgent *)self status];
  [v9 mostRecentTriggerMethodChange];
  double v11 = v10;

  objc_super v12 = [(CARDNDServiceAgent *)self status];
  if ([v12 hasAdjustedTriggerMethod])
  {
    if (v8 > 2) {
      CFStringRef v13 = @"Unknown";
    }
    else {
      CFStringRef v13 = off_1000BEC38[v8];
    }
  }
  else
  {
    CFStringRef v13 = @"New";
  }

  id v14 = [(CARDNDServiceAgent *)self status];
  [v14 setHasAdjustedTriggerMethod:1];

  id v17 = +[CARAnalytics sharedInstance];
  if (a3 > 2) {
    CFStringRef v15 = @"Unknown";
  }
  else {
    CFStringRef v15 = off_1000BEC38[a3];
  }
  int v16 = [(CARDNDServiceAgent *)self status];
  [v17 userChangedFromTriggerMethod:v13 toMethod:v15 withMechanism:v6 activateWithCarPlay:[v16 shouldActivateWithCarPlay] activateWithCarPlay:v11];
}

- (void)setDNDTriggerMode:(unint64_t)a3 withReply:(id)a4
{
  id v11 = a4;
  id v6 = [(CARDNDServiceAgent *)self status];
  id v7 = [v6 automaticDNDTriggeringMethod];

  if (v7 != (id)a3)
  {
    [(CARDNDServiceAgent *)self _triggerModeChanged:a3 mechanism:@"Settings"];
    unint64_t v8 = [(CARDNDServiceAgent *)self status];
    [v8 setAutomaticDNDTriggeringMethod:a3];

    if (a3)
    {
      id v9 = +[CARDNDManager sharedManager];
      [v9 _checkVehicleState];
    }
  }
  double v10 = v11;
  if (v11)
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
    double v10 = v11;
  }
}

- (void)allowedAutoReplyAudienceWithReply:(id)a3
{
  CFStringRef v3 = (const __CFString *)CARDNDAutoReplyAudience;
  CFStringRef v4 = (const __CFString *)CRPreferencesAutomaticDNDDomain;
  id v5 = (void (**)(id, uint64_t, void))a3;
  id v6 = (void *)CFPreferencesCopyAppValue(v3, v4);
  id v7 = v6;
  if (v6) {
    uint64_t v8 = (uint64_t)[v6 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 4;
  }
  id v9 = CarDNDWDLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = +[NSNumber numberWithUnsignedInteger:v8];
    int v11 = 138412290;
    objc_super v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated auto-reply audience to %@", (uint8_t *)&v11, 0xCu);
  }
  v5[2](v5, v8, 0);
}

- (void)setAllowedAutoReplyAudience:(unint64_t)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048E74;
  v7[3] = &unk_1000BEBD8;
  id v8 = a4;
  unint64_t v9 = a3;
  id v6 = v8;
  [(CARDNDServiceAgent *)self allowedAutoReplyAudienceWithReply:v7];
}

- (void)autoReplyMessageWithReply:(id)a3
{
  id v7 = (void (**)(id, void *, void))a3;
  CFStringRef v3 = (void *)CFPreferencesCopyAppValue(CARDNDAutoReplyMessage, CRPreferencesAutomaticDNDDomain);
  CFStringRef v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (![v5 length])
  {
    uint64_t v6 = CRLocalizedStringForKey();

    id v5 = (void *)v6;
  }
  v7[2](v7, v5, 0);
}

- (void)setAutoReplyMessage:(id)a3 reply:(id)a4
{
  CFStringRef v6 = (const __CFString *)CARDNDAutoReplyMessage;
  CFStringRef v7 = (const __CFString *)CRPreferencesAutomaticDNDDomain;
  id v8 = (void (**)(id, uint64_t, void))a4;
  CFPreferencesSetAppValue(v6, a3, v7);
  [(CARDNDServiceAgent *)self allowedAutoReplyAudienceWithReply:&stru_1000BEC18];
  v8[2](v8, 1, 0);
}

- (void)disableDNDUntilEndOfDriveWithContext:(id)a3 reply:(id)a4
{
  id v5 = a3;
  CFStringRef v6 = (void (**)(id, uint64_t, void))a4;
  CFStringRef v7 = +[CARDNDManager sharedManager];
  unsigned int v8 = [v7 isDNDValid];
  unint64_t v9 = CarDNDWDLogging();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Disabling Driving until end of drive.", buf, 2u);
    }

    int v11 = +[CARAnalytics sharedInstance];
    if ([v7 isCurrentlyInGeofencedRegion]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 4;
    }
    [v11 DNDEndedWithTrigger:v12 vehicleHints:[v7 lastKnownVehicularHints] context:v5];

    [v7 _disableDNDUntilEndOfDrive];
    if (!v6) {
      goto LABEL_13;
    }
LABEL_12:
    v6[2](v6, 1, 0);
    goto LABEL_13;
  }
  if (v10)
  {
    *(_WORD *)CFStringRef v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring disable Driving until end of drive - Driving was not valid.", v13, 2u);
  }

  if (v6) {
    goto LABEL_12;
  }
LABEL_13:
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
}

- (CARAutomaticDNDStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_vehicleStore, 0);
}

@end