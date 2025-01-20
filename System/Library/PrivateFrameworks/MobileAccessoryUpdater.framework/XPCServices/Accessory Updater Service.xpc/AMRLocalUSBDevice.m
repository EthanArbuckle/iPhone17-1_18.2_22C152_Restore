@interface AMRLocalUSBDevice
- (AMRLocalUSBDevice)initWithService:(unsigned int)a3;
- (void)closeDevice;
- (void)copyProductStringWithReply:(id)a3;
- (void)copySerialNumberWithReply:(id)a3;
- (void)dealloc;
- (void)getDeviceReleaseNumberWithReply:(id)a3;
- (void)getLocationIDWithReply:(id)a3;
- (void)getManufacturerStringIndexForIndexWithReply:(id)a3;
- (void)getProductIDWithReply:(id)a3;
- (void)handleUSBDeviceGeneralInterestNotification:(unsigned int)a3;
- (void)interfaceWithClass:(unsigned __int16)a3 subclass:(unsigned __int16)a4 withReply:(id)a5;
- (void)openDeviceWithReply:(id)a3;
- (void)printDeviceWithExclusiveAccess;
- (void)reEnumerateWithReply:(id)a3;
- (void)sendDeviceRequestTO:(unsigned __int16)a3 direction:(unsigned __int8)a4 requestType:(unsigned __int8)a5 recipient:(unsigned __int8)a6 request:(unsigned __int8)a7 value:(unsigned __int16)a8 length:(unsigned __int16)size data:(id)a10 noDataTO:(unsigned int)a11 completionTO:(unsigned int)a12 withReply:(id)a13;
@end

@implementation AMRLocalUSBDevice

- (AMRLocalUSBDevice)initWithService:(unsigned int)a3
{
  if (qword_1000B8D40 != -1) {
    dispatch_once(&qword_1000B8D40, &stru_10009E7D0);
  }
  v8.receiver = self;
  v8.super_class = (Class)AMRLocalUSBDevice;
  v5 = [(AMRLocalUSBDevice *)&v8 init];
  if (v5)
  {
    uint64_t DeviceInterfaceForService = _getDeviceInterfaceForService(a3);
    v5->deviceInterface = (IOUSBDeviceStruct245 **)DeviceInterfaceForService;
    if (DeviceInterfaceForService)
    {
      v5->serialNumber = (__CFString *)IORegistryEntryCreateCFProperty(a3, @"kUSBSerialNumberString", kCFAllocatorDefault, 0);
      v5->productString = (__CFString *)IORegistryEntryCreateCFProperty(a3, @"kUSBProductString", kCFAllocatorDefault, 0);
      IOObjectRetain(a3);
      v5->usbService = a3;
      v5->usbDeviceNotification = 0;
      v5->waitForOpenSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      v5->deviceOpenResult = 0;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FD20;
  block[3] = &unk_10009E7B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_notificationQueue, block);
  deviceInterface = self->deviceInterface;
  if (deviceInterface)
  {
    ((void (*)(IOUSBDeviceStruct245 **))(*deviceInterface)->Release)(deviceInterface);
    self->deviceInterface = 0;
  }
  serialNumber = self->serialNumber;
  if (serialNumber)
  {
    CFRelease(serialNumber);
    self->serialNumber = 0;
  }
  productString = self->productString;
  if (productString)
  {
    CFRelease(productString);
    self->productString = 0;
  }
  io_object_t usbService = self->usbService;
  if (usbService)
  {
    IOObjectRelease(usbService);
    self->io_object_t usbService = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AMRLocalUSBDevice;
  [(AMRLocalUSBDevice *)&v7 dealloc];
}

- (void)openDeviceWithReply:(id)a3
{
  uint64_t v5 = ((uint64_t (*)(IOUSBDeviceStruct245 **, SEL))(*self->deviceInterface)->USBDeviceOpen)(self->deviceInterface, a2);
  if (v5)
  {
    uint64_t v12 = v5;
    if (v5 != -536870203)
    {
      v20 = createAndLogUSBError(v5, @"error opening USB device: 0x%x", v6, v7, v8, v9, v10, v11, v5);
      goto LABEL_6;
    }
    [(AMRLocalUSBDevice *)self printDeviceWithExclusiveAccess];
    uint64_t v13 = IOServiceAddInterestNotification((IONotificationPortRef)_notificationPort, self->usbService, "IOGeneralInterest", (IOServiceInterestCallback)j__objc_msgSend_handleUSBDeviceGeneralInterestNotification_, self, &self->usbDeviceNotification);
    if (v13)
    {
      uint64_t v12 = v13;
      v20 = createAndLogUSBError(v13, @"error scheduling USB device notification: 0x%x", v14, v15, v16, v17, v18, v19, v13);
LABEL_6:
      v21 = v20;
      goto LABEL_14;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->waitForOpenSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    int deviceOpenResult = self->deviceOpenResult;
    if (deviceOpenResult)
    {
      v21 = createAndLogUSBError(deviceOpenResult, @"error opening USB device in the background: 0x%x", v22, v23, v24, v25, v26, v27, self->deviceOpenResult);
      uint64_t v12 = self->deviceOpenResult;
      if (!v12) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  deviceInterface = self->deviceInterface;
  uint64_t v38 = 0;
  uint64_t v30 = ((uint64_t (*)(IOUSBDeviceStruct245 **, void, uint64_t *))(*deviceInterface)->GetConfigurationDescriptorPtr)(deviceInterface, 0, &v38);
  if (v30)
  {
    uint64_t v12 = v30;
  }
  else
  {
    uint64_t v12 = ((uint64_t (*)(IOUSBDeviceStruct245 **, void))(*deviceInterface)->SetConfiguration)(deviceInterface, *(unsigned __int8 *)(v38 + 5));
    if (!v12)
    {
      v21 = 0;
      goto LABEL_15;
    }
  }
  v21 = createAndLogUSBError(v12, @"error setting configuration descriptor: 0x%x", v31, v32, v33, v34, v35, v36, v12);
LABEL_14:
  ((void (*)(IOUSBDeviceStruct245 **))(*self->deviceInterface)->USBDeviceClose)(self->deviceInterface);
LABEL_15:
  uint64_t v37 = _AMRestoreErrorForIOReturn(v12, 2010);
  (*((void (**)(id, uint64_t, NSError *))a3 + 2))(a3, v37, v21);
}

- (void)printDeviceWithExclusiveAccess
{
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(self->usbService, @"UsbExclusiveOwner", kCFAllocatorDefault, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = @"**Unknown**";
    if (CFProperty) {
      CFStringRef v3 = CFProperty;
    }
    int v4 = 138412290;
    CFStringRef v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error opening USB device failed with kIOReturnExclusiveAccess. Current owner: %@", (uint8_t *)&v4, 0xCu);
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
}

- (void)handleUSBDeviceGeneralInterestNotification:(unsigned int)a3
{
  if (a3 == -536870640)
  {
    int v4 = ((uint64_t (*)(IOUSBDeviceStruct245 **, SEL))(*self->deviceInterface)->USBDeviceOpen)(self->deviceInterface, a2);
    self->int deviceOpenResult = v4;
    if (v4 == -536870203)
    {
      [(AMRLocalUSBDevice *)self printDeviceWithExclusiveAccess];
    }
    else
    {
      IOObjectRelease(self->usbDeviceNotification);
      self->usbDeviceNotification = 0;
      waitForOpenSemaphore = self->waitForOpenSemaphore;
      dispatch_semaphore_signal(waitForOpenSemaphore);
    }
  }
}

- (void)sendDeviceRequestTO:(unsigned __int16)a3 direction:(unsigned __int8)a4 requestType:(unsigned __int8)a5 recipient:(unsigned __int8)a6 request:(unsigned __int8)a7 value:(unsigned __int16)a8 length:(unsigned __int16)size data:(id)a10 noDataTO:(unsigned int)a11 completionTO:(unsigned int)a12 withReply:(id)a13
{
  uint64_t v18 = size;
  uint64_t v19 = malloc_type_malloc(size, 0xC6C9CA00uLL);
  [a10 getBytes:v19 length:size];
  int v41 = 0;
  v36[0] = (a4 << 7) | (32 * (a5 & 3)) | a6 & 0x1F;
  v36[1] = a7;
  unsigned __int16 v37 = a8;
  unsigned __int16 v38 = a3;
  unsigned __int16 v39 = size;
  v20 = v19;
  v40 = v19;
  unsigned int v42 = a11;
  uint64_t v43 = a12;
  uint64_t v21 = ((uint64_t (*)(IOUSBDeviceStruct245 **, unsigned char *))(*self->deviceInterface)->DeviceRequestTO)(self->deviceInterface, v36);
  uint64_t v28 = v21;
  if (!v21)
  {
    v29 = 0;
    goto LABEL_10;
  }
  v29 = createAndLogUSBError(v21, @"DeviceRequest failed: 0x%x (IOKit return code). DeviceRequest was index: %u, direction: %u, requestType: %u, recipient: %u, request: %u, value: %u, length: %u, noDataTO: %u, completionTO: %u", v22, v23, v24, v25, v26, v27, v21);
  if (!size)
  {
LABEL_10:
    uint64_t v30 = v20;
    goto LABEL_11;
  }
  uint64_t v30 = v20;
  if (v20)
  {
    memset(&v48[2], 0, 480);
    if (size >= 0x200u) {
      uint64_t v18 = 512;
    }
    else {
      uint64_t v18 = size;
    }
    memset(v48, 0, 32);
    __strlcpy_chk();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v45 = v18;
      __int16 v46 = 2080;
      v47 = v48;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Data was : %.*s", buf, 0x12u);
    }
  }
LABEL_11:
  id v31 = objc_alloc((Class)NSData);
  id v32 = [v31 initWithBytes:v40 length:v18];
  free(v30);
  uint64_t v33 = _AMRestoreErrorForIOReturn(v28, 2009);
  (*((void (**)(id, uint64_t, id, NSError *))a13 + 2))(a13, v33, v32, v29);
}

- (void)interfaceWithClass:(unsigned __int16)a3 subclass:(unsigned __int16)a4 withReply:(id)a5
{
  io_iterator_t iterator = 0;
  int v11 = -1;
  v10[0] = a3;
  v10[1] = a4;
  int v6 = ((uint64_t (*)(IOUSBDeviceStruct245 **, _WORD *, io_iterator_t *))(*self->deviceInterface)->CreateInterfaceIterator)(self->deviceInterface, v10, &iterator);
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error creating interface iterator: 0x%x\n", buf, 8u);
    }
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
  uint64_t v8 = IOIteratorNext(iterator);
  IOObjectRelease(iterator);
  uint64_t v9 = [[AMRLocalUSBInterface alloc] initWithService:v8];
  IOObjectRelease(v8);
  (*((void (**)(id, AMRLocalUSBInterface *, void))a5 + 2))(a5, v9, 0);
}

- (void)getLocationIDWithReply:(id)a3
{
  uint64_t v4 = 0xFFFFFFFFLL;
  unsigned int v5 = -1;
  if (((unsigned int (*)(IOUSBDeviceStruct245 **, unsigned int *))(*self->deviceInterface)->GetLocationID)(self->deviceInterface, &v5))
  {
    unsigned int v5 = -1;
  }
  else
  {
    uint64_t v4 = v5;
  }
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, v4, 0);
}

- (void)getProductIDWithReply:(id)a3
{
  unsigned __int16 v5 = 0;
  if (((unsigned int (*)(IOUSBDeviceStruct245 **, unsigned __int16 *))(*self->deviceInterface)->GetDeviceProduct)(self->deviceInterface, &v5))
  {
    uint64_t v4 = 0;
    unsigned __int16 v5 = 0;
  }
  else
  {
    uint64_t v4 = v5;
  }
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, v4, 0);
}

- (void)getDeviceReleaseNumberWithReply:(id)a3
{
  unsigned __int16 v5 = 0;
  if (((unsigned int (*)(IOUSBDeviceStruct245 **, unsigned __int16 *))(*self->deviceInterface)->GetDeviceReleaseNumber)(self->deviceInterface, &v5))
  {
    uint64_t v4 = 0;
    unsigned __int16 v5 = 0;
  }
  else
  {
    uint64_t v4 = v5;
  }
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, v4, 0);
}

- (void)copySerialNumberWithReply:(id)a3
{
}

- (void)copyProductStringWithReply:(id)a3
{
}

- (void)reEnumerateWithReply:(id)a3
{
  uint64_t v4 = ((uint64_t (*)(IOUSBDeviceStruct245 **, void))(*self->deviceInterface)->USBDeviceReEnumerate)(self->deviceInterface, 0);
  uint64_t v5 = _AMRestoreErrorForIOReturn(v4, 2010);
  int v6 = (void (*)(id, uint64_t, void))*((void *)a3 + 2);
  v6(a3, v5, 0);
}

- (void)getManufacturerStringIndexForIndexWithReply:(id)a3
{
  unsigned __int8 v6 = 0;
  uint64_t v4 = ((uint64_t (*)(IOUSBDeviceStruct245 **, unsigned __int8 *))(*self->deviceInterface)->USBGetManufacturerStringIndex)(self->deviceInterface, &v6);
  uint64_t v5 = _AMRestoreErrorForIOReturn(v4, 2010);
  (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, v5, v6, 0);
}

- (void)closeDevice
{
}

@end