@interface UARPHIDAccessory
- (BOOL)corePropertiesQueried;
- (BOOL)goldrestoreQueryInProgress;
- (BOOL)hidDeviceScheduled;
- (BOOL)needsConsentToStage;
- (BOOL)updateInProgress;
- (NSDate)lastReportedStagingTime;
- (NSMutableData)hidBuffer;
- (NSMutableSet)propertiesToQuery;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)identifier;
- (NSString)transport;
- (UARPAccessory)uarpAccessory;
- (UARPAccessoryID)uarpAccessoryID;
- (UARPHIDAccessory)initWithHIDDeviceRef:(__IOHIDDevice *)a3;
- (__IOHIDDevice)hidDeviceRef;
- (id)getPropertiesToQuery;
- (id)locationID;
- (unsigned)expectedHIDMessageID;
- (unsigned)hidMessageID;
- (unsigned)hidReportID;
- (unsigned)hidReportSizeInput;
- (unsigned)hidReportSizeOutput;
- (unsigned)options;
- (void)handleHIDDisconnect;
- (void)internalQueryStartWithCompletionCallback:(id)a3;
- (void)proceedWithUpdate;
- (void)setExpectedHIDMessageID:(unsigned __int16)a3;
- (void)setGoldrestoreQueryInProgress:(BOOL)a3;
- (void)setHidBuffer:(id)a3;
- (void)setHidDeviceScheduled:(BOOL)a3;
- (void)setHidMessageID:(unsigned __int16)a3;
- (void)setHidReportID:(unsigned __int8)a3;
- (void)setHidReportSizeInput:(unsigned int)a3;
- (void)setHidReportSizeOutput:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastReportedStagingTime:(id)a3;
- (void)setLocationID:(id)a3;
- (void)setNeedsConsentToStage:(BOOL)a3;
- (void)setOptions:(unsigned int)a3;
- (void)setProductID:(id)a3;
- (void)setTransport:(id)a3;
- (void)setUarpAccessory:(id)a3;
- (void)setUarpAccessoryID:(id)a3;
- (void)setUpdateInProgress:(BOOL)a3;
- (void)setVendorID:(id)a3;
- (void)updateProperty:(unint64_t)a3 value:(id)a4;
- (void)waitForInternalQueryToComplete;
@end

@implementation UARPHIDAccessory

- (UARPHIDAccessory)initWithHIDDeviceRef:(__IOHIDDevice *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UARPHIDAccessory;
  v4 = [(UARPHIDAccessory *)&v11 init];
  v5 = (UARPHIDAccessory *)v4;
  if (v4)
  {
    *((void *)v4 + 9) = a3;
    *(_DWORD *)(v4 + 54) = 1;
    uint64_t v6 = +[NSDate distantPast];
    lastReportedStagingTime = v5->_lastReportedStagingTime;
    v5->_lastReportedStagingTime = (NSDate *)v6;

    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "hidUpdater");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;
  }
  return v5;
}

- (void)setOptions:(unsigned int)a3
{
  self->_options = a3;
}

- (void)setLocationID:(id)a3
{
}

- (unsigned)options
{
  return self->_options;
}

- (id)locationID
{
  return self->_locationID;
}

- (void)internalQueryStartWithCompletionCallback:(id)a3
{
  id v4 = a3;
  id v9 = [(UARPHIDAccessory *)self getPropertiesToQuery];
  v5 = +[NSMutableSet setWithArray:v9];
  propertiesToQuery = self->_propertiesToQuery;
  self->_propertiesToQuery = v5;

  id v7 = [v4 copy];
  id completion = self->_completion;
  self->_id completion = v7;
}

- (void)waitForInternalQueryToComplete
{
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  querySemaphore = self->_querySemaphore;
  self->_querySemaphore = v3;

  v5 = self->_querySemaphore;
  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_10001CD78((uint64_t)self, log);
    }
  }
}

- (void)updateProperty:(unint64_t)a3 value:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setManufacturer:v6];
      break;
    case 1uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setModelName:v6];
      break;
    case 2uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setSerialNumber:v6];
      break;
    case 4uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setFirmwareVersion:v6];
      break;
    case 5uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setStagedFirmwareVersion:v6];
      break;
    case 7uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setProductGroup:v6];
      break;
    case 8uLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setProductNumber:v6];
      break;
    case 0xCuLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setHwFusingType:v6];
      break;
    case 0xDuLL:
      [(UARPAccessoryID *)self->_uarpAccessoryID setFriendlyName:v6];
      break;
    default:
      break;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    os_log_t v8 = log;
    *(_DWORD *)buf = 136315394;
    v35 = "-[UARPHIDAccessory updateProperty:value:]";
    __int16 v36 = 2080;
    uint64_t v37 = UARPAccessoryPropertyToString();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Got property: %s", buf, 0x16u);
  }
  unint64_t v28 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = self->_propertiesToQuery;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = self->_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v16 = v14;
          [v15 intValue];
          uint64_t v17 = UARPAccessoryPropertyToString();
          *(_DWORD *)buf = 136315394;
          v35 = "-[UARPHIDAccessory updateProperty:value:]";
          __int16 v36 = 2080;
          uint64_t v37 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s: Property to query: %s", buf, 0x16u);
        }
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  propertiesToQuery = self->_propertiesToQuery;
  v19 = +[NSNumber numberWithUnsignedInteger:v28];
  LODWORD(propertiesToQuery) = [(NSMutableSet *)propertiesToQuery containsObject:v19];

  if (propertiesToQuery)
  {
    v20 = self->_propertiesToQuery;
    v21 = +[NSNumber numberWithUnsignedInteger:v28];
    [(NSMutableSet *)v20 removeObject:v21];
  }
  v22 = self->_log;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = self->_propertiesToQuery;
    v24 = v22;
    id v25 = [(NSMutableSet *)v23 count];
    *(_DWORD *)buf = 136315394;
    v35 = "-[UARPHIDAccessory updateProperty:value:]";
    __int16 v36 = 2048;
    uint64_t v37 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: Properties left to get: %lu", buf, 0x16u);
  }
  if (![(NSMutableSet *)self->_propertiesToQuery count]
    && [(UARPHIDAccessory *)self corePropertiesQueried])
  {
    v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uarpAccessoryID = self->_uarpAccessoryID;
      *(_DWORD *)buf = 136315394;
      v35 = "-[UARPHIDAccessory updateProperty:value:]";
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)uarpAccessoryID;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s: All properties queried for accessory %@", buf, 0x16u);
    }
    [(UARPHIDAccessory *)self proceedWithUpdate];
  }
}

- (BOOL)corePropertiesQueried
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uarpAccessoryID = self->_uarpAccessoryID;
    v5 = log;
    id v6 = [(UARPAccessoryID *)uarpAccessoryID serialNumber];
    id v7 = [(UARPAccessoryID *)self->_uarpAccessoryID firmwareVersion];
    os_log_t v8 = [(UARPAccessoryID *)self->_uarpAccessoryID stagedFirmwareVersion];
    int v14 = 136315906;
    v15 = "-[UARPHIDAccessory corePropertiesQueried]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Serial Number <%@>, Firmware Version <%@>, Staged FW Version <%@> ", (uint8_t *)&v14, 0x2Au);
  }
  id v9 = [(UARPAccessoryID *)self->_uarpAccessoryID serialNumber];
  if (v9)
  {
    id v10 = [(UARPAccessoryID *)self->_uarpAccessoryID firmwareVersion];
    if (v10)
    {
      id v11 = [(UARPAccessoryID *)self->_uarpAccessoryID stagedFirmwareVersion];
      BOOL v12 = v11 != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)proceedWithUpdate
{
  querySemaphore = self->_querySemaphore;
  if (querySemaphore)
  {
    dispatch_semaphore_signal(querySemaphore);
    id v4 = self->_querySemaphore;
    self->_querySemaphore = 0;
  }
  id completion = (void (**)(id, UARPAccessoryID *))self->_completion;
  if (completion)
  {
    completion[2](completion, self->_uarpAccessoryID);
    id v6 = self->_completion;
    self->_id completion = 0;
  }
}

- (void)handleHIDDisconnect
{
  querySemaphore = self->_querySemaphore;
  if (querySemaphore)
  {
    dispatch_semaphore_signal(querySemaphore);
  }
  else
  {
    id completion = (void (**)(id, UARPAccessoryID *))self->_completion;
    if (completion) {
      completion[2](completion, self->_uarpAccessoryID);
    }
  }
  self->_hidDeviceRef = 0;
}

- (id)getPropertiesToQuery
{
  v2 = +[NSMutableArray arrayWithArray:&off_1000292B8];
  v3 = +[NSArray arrayWithArray:v2];

  return v3;
}

- (__IOHIDDevice)hidDeviceRef
{
  return self->_hidDeviceRef;
}

- (UARPAccessoryID)uarpAccessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUarpAccessoryID:(id)a3
{
}

- (UARPAccessory)uarpAccessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUarpAccessory:(id)a3
{
}

- (unsigned)hidReportSizeInput
{
  return self->_hidReportSizeInput;
}

- (void)setHidReportSizeInput:(unsigned int)a3
{
  self->_hidReportSizeInput = a3;
}

- (unsigned)hidReportSizeOutput
{
  return self->_hidReportSizeOutput;
}

- (void)setHidReportSizeOutput:(unsigned int)a3
{
  self->_hidReportSizeOutput = a3;
}

- (unsigned)hidReportID
{
  return self->_hidReportID;
}

- (void)setHidReportID:(unsigned __int8)a3
{
  self->_hidReportID = a3;
}

- (unsigned)expectedHIDMessageID
{
  return self->_expectedHIDMessageID;
}

- (void)setExpectedHIDMessageID:(unsigned __int16)a3
{
  self->_expectedHIDMessageID = a3;
}

- (unsigned)hidMessageID
{
  return self->_hidMessageID;
}

- (void)setHidMessageID:(unsigned __int16)a3
{
  self->_hidMessageID = a3;
}

- (NSMutableData)hidBuffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHidBuffer:(id)a3
{
}

- (BOOL)hidDeviceScheduled
{
  return self->_hidDeviceScheduled;
}

- (void)setHidDeviceScheduled:(BOOL)a3
{
  self->_hidDeviceScheduled = a3;
}

- (NSMutableSet)propertiesToQuery
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)goldrestoreQueryInProgress
{
  return self->_goldrestoreQueryInProgress;
}

- (void)setGoldrestoreQueryInProgress:(BOOL)a3
{
  self->_goldrestoreQueryInProgress = a3;
}

- (NSString)transport
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTransport:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (NSDate)lastReportedStagingTime
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastReportedStagingTime:(id)a3
{
}

- (BOOL)needsConsentToStage
{
  return self->_needsConsentToStage;
}

- (void)setNeedsConsentToStage:(BOOL)a3
{
  self->_needsConsentToStage = a3;
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setProductID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_lastReportedStagingTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_propertiesToQuery, 0);
  objc_storeStrong((id *)&self->_hidBuffer, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_storeStrong((id *)&self->_uarpAccessoryID, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_querySemaphore, 0);
}

@end