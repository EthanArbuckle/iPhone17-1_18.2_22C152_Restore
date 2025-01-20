@interface LegacyAudioAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)showPersonalizationRequiredDialogAndGetResponse;
- (BOOL)startFirmwareUpdateStates;
- (LegacyAudioAccessory)initWithCoder:(id)a3;
- (LegacyAudioAccessory)initWithDelegate:(id)a3;
- (NSString)activeANCVersion;
- (NSString)activeFirmwareVersion;
- (NSString)description;
- (NSString)modelName;
- (NSString)serialNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceClassesForEAIdentifier:(id)a3;
- (id)getMatchingEntryForEAIdentifier:(id)a3;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)handleConnect:(id)a3 options:(id)a4;
- (void)log:(int)a3 format:(id)a4;
- (void)personalizationDone:(id)a3 response:(id)a4 error:(id)a5;
- (void)personalizationRequest:(id)a3;
- (void)progress:(double)a3;
- (void)updateCompleteForActiveDeviceClass;
@end

@implementation LegacyAudioAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LegacyAudioAccessory)initWithDelegate:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LegacyAudioAccessory;
  v6 = [(LegacyAudioAccessory *)&v17 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "legacyAudioUpdater");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_delegate, a3);
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    deviceClasses = v6->_deviceClasses;
    v6->_deviceClasses = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.legacyAudioAccessory.queue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    updateFirmwareAnalyticsEvents = v6->_updateFirmwareAnalyticsEvents;
    v6->_updateFirmwareAnalyticsEvents = v13;

    v15 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[LegacyAudioAccessory alloc] initWithDelegate:self->_delegate];
  objc_storeStrong((id *)&v4->_serialNumber, self->_serialNumber);
  objc_storeStrong((id *)&v4->_activeFirmwareVersion, self->_activeFirmwareVersion);
  objc_storeStrong((id *)&v4->_activeANCVersion, self->_activeANCVersion);
  objc_storeStrong((id *)&v4->_modelName, self->_modelName);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  serialNumber = self->_serialNumber;
  id v5 = a3;
  [v5 encodeObject:serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_activeFirmwareVersion forKey:@"activeFirmwareVersion"];
  [v5 encodeObject:self->_activeANCVersion forKey:@"activeANCVersion"];
  [v5 encodeObject:self->_modelName forKey:@"modelName"];
}

- (LegacyAudioAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LegacyAudioAccessory *)self initWithDelegate:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeFirmwareVersion"];
    activeFirmwareVersion = v5->_activeFirmwareVersion;
    v5->_activeFirmwareVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeANCVersion"];
    activeANCVersion = v5->_activeANCVersion;
    v5->_activeANCVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v12;
  }
  return v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@ serialNumber=%@, _modelName=%@, activeFirmwareVersion=%@, activeANCVersion=%@", v4, self->_serialNumber, self->_modelName, self->_activeFirmwareVersion, self->_activeANCVersion];

  return (NSString *)v5;
}

- (void)handleConnect:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007460;
  block[3] = &unk_1000314E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (BOOL)startFirmwareUpdateStates
{
  v3 = [(NSDictionary *)self->_updateOptions objectForKeyedSubscript:@"SerialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v3;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    id v7 = self->_serialNumber;
    *(_DWORD *)buf = 136315650;
    v22 = "-[LegacyAudioAccessory startFirmwareUpdateStates]";
    __int16 v23 = 2112;
    v24 = activeDeviceClass;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Starting update states for %@, serialNumber %@ ", buf, 0x20u);
  }
  uint64_t v8 = [EAAccessoryUpdater alloc];
  p_activeDeviceClass = (uint64_t *)&self->_activeDeviceClass;
  id v9 = self->_activeDeviceClass;
  id v20 = 0;
  dispatch_queue_t v11 = [(EAAccessoryUpdater *)v8 initWithDeviceClass:v9 delegate:self info:&v20 options:self->_updateOptions];
  id v12 = v20;
  updater = self->_updater;
  self->_updater = v11;

  v14 = self->_updater;
  if (v14)
  {
    v15 = [v12 objectForKeyedSubscript:@"AccessoryIdentifier"];
    modelName = self->_modelName;
    self->_modelName = v15;

    if (![(EAAccessoryUpdater *)self->_updater isMultiAssetSession])
    {
      objc_super v17 = objc_alloc_init(UARPUpdateFirmwareAnalyticsEvent);
      [(UARPUpdateFirmwareAnalyticsEvent *)v17 setModelName:self->_modelName];
      [(NSMutableDictionary *)self->_updateFirmwareAnalyticsEvents setObject:v17 forKeyedSubscript:self->_activeDeviceClass];
    }
    [(EAAccessoryUpdater *)self->_updater bootstrapWithOptions:self->_updateOptions];
  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001B5BC(p_activeDeviceClass, v18);
    }
  }

  return v14 != 0;
}

- (id)deviceClassesForEAIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(LegacyAudioAccessory *)self getMatchingEntryForEAIdentifier:v4];
  id v6 = [v5 objectForKeyedSubscript:@"DeviceClasses"];
  if (!v6)
  {
    id v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, 0);
  }

  return v6;
}

- (id)getMatchingEntryForEAIdentifier:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = +[LegacyAudioController sharedInstance];
  id v5 = [v4 matchingAccessoriesList];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        dispatch_queue_t v11 = [v10 objectForKeyedSubscript:@"DeviceClass"];
        unsigned __int8 v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (void)updateCompleteForActiveDeviceClass
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    serialNumber = self->_serialNumber;
    int v18 = 136315650;
    v19 = "-[LegacyAudioAccessory updateCompleteForActiveDeviceClass]";
    __int16 v20 = 2112;
    v21 = activeDeviceClass;
    __int16 v22 = 2112;
    __int16 v23 = serialNumber;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Update states complete for %@, serialNumber %@ ", (uint8_t *)&v18, 0x20u);
  }
  personalizer = self->_personalizer;
  if (personalizer) {
    [(FudPersonalizer *)personalizer setDelegate:0];
  }
  id v7 = +[LegacyAudioController sharedInstance];
  [v7 addActiveFirmwareAnalytics:self];

  uint64_t v8 = [(NSMutableDictionary *)self->_updateFirmwareAnalyticsEvents objectForKeyedSubscript:self->_activeDeviceClass];
  id v9 = v8;
  if (v8 && [v8 stagingStatus])
  {
    id v10 = self->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v11 = self->_activeDeviceClass;
      unsigned __int8 v12 = self->_serialNumber;
      int v18 = 136315650;
      v19 = "-[LegacyAudioAccessory updateCompleteForActiveDeviceClass]";
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Posting analytics for %@, serialNumber %@ ", (uint8_t *)&v18, 0x20u);
    }
    [v9 send];
  }
  else
  {
    id v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_activeDeviceClass;
      long long v15 = self->_serialNumber;
      int v18 = 136315650;
      v19 = "-[LegacyAudioAccessory updateCompleteForActiveDeviceClass]";
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      __int16 v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Analytics event invalid, not posting for %@, serialNumber %@ ", (uint8_t *)&v18, 0x20u);
    }
  }
  [(NSMutableDictionary *)self->_updateFirmwareAnalyticsEvents removeObjectForKey:self->_activeDeviceClass];
  [(NSMutableArray *)self->_deviceClasses removeObject:self->_activeDeviceClass];
  [(EAAccessoryUpdater *)self->_updater setDelegate:0];
  if ([(NSMutableArray *)self->_deviceClasses count])
  {
    long long v16 = [(NSMutableArray *)self->_deviceClasses firstObject];
    long long v17 = self->_activeDeviceClass;
    self->_activeDeviceClass = v16;

    if (![(LegacyAudioAccessory *)self startFirmwareUpdateStates]) {
      [(LegacyAudioAccessory *)self updateCompleteForActiveDeviceClass];
    }
  }
  else
  {
    [(LegacyAudioAccessoryDelegate *)self->_delegate updateCompleteForAccessory:self];
  }
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    *(_DWORD *)buf = 136316162;
    long long v16 = "-[LegacyAudioAccessory didBootstrap:info:error:]";
    __int16 v17 = 2112;
    int v18 = activeDeviceClass;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, successful=%d, info=%@, error=%@", buf, 0x30u);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007CC0;
  v13[3] = &unk_100031508;
  BOOL v14 = v6;
  v13[4] = self;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a7;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    *(_DWORD *)buf = 136316674;
    id v24 = "-[LegacyAudioAccessory didFind:info:updateAvailable:needsDownload:error:]";
    __int16 v25 = 2112;
    v26 = activeDeviceClass;
    __int16 v27 = 1024;
    BOOL v28 = v10;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 1024;
    BOOL v32 = v9;
    __int16 v33 = 1024;
    BOOL v34 = v8;
    __int16 v35 = 2112;
    id v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, successful=%d, info=%@, updateAvailable=%d, needsDownload=%d, error=%@", buf, 0x3Cu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007EA8;
  block[3] = &unk_100031530;
  block[4] = self;
  id v19 = v12;
  BOOL v20 = v10;
  BOOL v21 = v9;
  BOOL v22 = v8;
  id v17 = v12;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    *(_DWORD *)buf = 136316162;
    long long v16 = "-[LegacyAudioAccessory didDownload:info:error:]";
    __int16 v17 = 2112;
    int v18 = activeDeviceClass;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, successful=%d, info=%@, error=%@", buf, 0x30u);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008250;
  v13[3] = &unk_100031508;
  v13[4] = self;
  BOOL v14 = v6;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    *(_DWORD *)buf = 136316162;
    long long v16 = "-[LegacyAudioAccessory didPrepare:info:error:]";
    __int16 v17 = 2112;
    int v18 = activeDeviceClass;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, successful=%d, info=%@, error=%@", buf, 0x30u);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008468;
  v13[3] = &unk_100031508;
  BOOL v14 = v6;
  v13[4] = self;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    *(_DWORD *)buf = 136316162;
    int v18 = "-[LegacyAudioAccessory didApply:info:error:]";
    __int16 v19 = 2112;
    BOOL v20 = activeDeviceClass;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, successful=%d, info=%@, error=%@", buf, 0x30u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000085F0;
  block[3] = &unk_100031558;
  block[4] = self;
  id v15 = v8;
  BOOL v16 = v6;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)progress:(double)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    int v7 = 136315650;
    id v8 = "-[LegacyAudioAccessory progress:]";
    __int16 v9 = 2112;
    BOOL v10 = activeDeviceClass;
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, progress=%f", (uint8_t *)&v7, 0x20u);
  }
}

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    activeDeviceClass = self->_activeDeviceClass;
    *(_DWORD *)buf = 136316162;
    id v15 = "-[LegacyAudioAccessory didFinish:info:error:]";
    __int16 v16 = 2112;
    __int16 v17 = activeDeviceClass;
    __int16 v18 = 1024;
    BOOL v19 = v6;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: deviceClass=%@, successful=%d, info=%@, error=%@", buf, 0x30u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000088F0;
  block[3] = &unk_100031580;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)personalizationRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008990;
  v7[3] = &unk_1000315A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)personalizationDone:(id)a3 response:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[LegacyAudioAccessory personalizationDone:response:error:]";
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Error during personalization %@.", (uint8_t *)&v14, 0x16u);
  }
  if (v10)
  {
    id v12 = 0;
    id v13 = v10;
  }
  else
  {
    id v12 = v9;
    id v13 = 0;
  }
  [(EAAccessoryUpdater *)self->_updater personalizationResponse:v8 response:v12 status:v13];
}

- (BOOL)showPersonalizationRequiredDialogAndGetResponse
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  id v3 = [(LegacyAudioAccessory *)self getMatchingEntryForEAIdentifier:self->_activeDeviceClass];
  id v4 = [v3 objectForKeyedSubscript:@"DeviceClassName"];
  CFStringRef v5 = @"your accessory";
  if (v4) {
    CFStringRef v5 = v4;
  }
  id v6 = +[NSString stringWithValidatedFormat:@"New Firmware available for %@. This requires Personalization, you will be prompted for your credentials.", @"%@", 0, v5 validFormatSpecifiers error];
  int v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:@"*** INTERNAL ONLY ***" forKey:kCFUserNotificationAlertHeaderKey];
  [v7 setObject:v6 forKey:kCFUserNotificationAlertMessageKey];
  [v7 setObject:@"OK" forKey:kCFUserNotificationDefaultButtonTitleKey];
  [v7 setObject:@"Cancel" forKey:kCFUserNotificationAlternateButtonTitleKey];
  SInt32 error = 0;
  id v8 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x21uLL, &error, (CFDictionaryRef)v7);
  if (v8)
  {
    id v9 = v8;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v8, 0.0, &responseFlags);
    BOOL v10 = responseFlags == 0;
    CFRelease(v9);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)log:(int)a3 format:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:&v10];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)activeFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)activeANCVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_activeANCVersion, 0);
  objc_storeStrong((id *)&self->_activeFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_updateFirmwareAnalyticsEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_updateOptions, 0);
  objc_storeStrong((id *)&self->_activeDeviceClass, 0);
  objc_storeStrong((id *)&self->_deviceClasses, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end