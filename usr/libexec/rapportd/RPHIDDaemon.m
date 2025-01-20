@interface RPHIDDaemon
- (BOOL)_setupHIDGCDeviceWithOptions:(id)a3 andReturnError:(id *)a4;
- (BOOL)_setupHIDTouchDeviceAndReturnError:(id *)a3;
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMessageable)messenger;
- (void)_activateScreenSaverWithResponseHandler:(id)a3;
- (void)_handleCommand:(id)a3 responseHandler:(id)a4;
- (void)_handleGameControllerAuxEvent:(int64_t)a3 pressed:(int64_t)a4;
- (void)_handleGameControllerEvent:(id)a3;
- (void)_handleGameControllerStart:(id)a3 responseHandler:(id)a4;
- (void)_handleGameControllerStop:(id)a3 responseHandler:(id)a4;
- (void)_handleSelectWithButtonState:(int)a3;
- (void)_handleTouchEvent:(id)a3;
- (void)_handleTouchStart:(id)a3 responseHandler:(id)a4;
- (void)_handleTouchStop:(id)a3 responseHandler:(id)a4;
- (void)_injectKeyboardEventUsagePage:(unsigned int)a3 usageCode:(unsigned int)a4 buttonState:(int)a5;
- (void)_setupHIDGCSenderIDIfNeeded;
- (void)_setupHIDSenderIDIfNeeded;
- (void)_sleepSystemWithResponseHandler:(id)a3;
- (void)_wakeSystemWithResponseHandler:(id)a3;
- (void)invalidate;
- (void)setMessenger:(id)a3;
@end

@implementation RPHIDDaemon

- (BOOL)activateAndReturnError:(id *)a3
{
  v5 = self->_messenger;
  if (!v5) {
    goto LABEL_12;
  }
  if (dword_100141558 <= 30 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (((self->_epochResetTicks = SecondsToUpTicks(), self->_hidClient)
     || (v6 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(), (self->_hidClient = v6) != 0))
    && (self->_hidGCClient
     || (v7 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(), (self->_hidGCClient = v7) != 0)))
  {
    CFStringRef v19 = @"statusFlags";
    v20 = &off_10012B168;
    BOOL v8 = 1;
    v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000524E4;
    v18[3] = &unk_100121CA0;
    v18[4] = self;
    [(RPMessageable *)v5 registerRequestID:@"_hidC" options:v9 handler:v18];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000524F0;
    v17[3] = &unk_100121CA0;
    v17[4] = self;
    [(RPMessageable *)v5 registerRequestID:@"_touchStart" options:v9 handler:v17];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000524FC;
    v16[3] = &unk_100121CA0;
    v16[4] = self;
    [(RPMessageable *)v5 registerRequestID:@"_touchStop" options:v9 handler:v16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100052508;
    v15[3] = &unk_100122C00;
    v15[4] = self;
    [(RPMessageable *)v5 registerEventID:@"_hidT" options:v9 handler:v15];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100052514;
    v14[3] = &unk_100121CA0;
    v14[4] = self;
    [(RPMessageable *)v5 registerRequestID:@"_gcStart" options:v9 handler:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100052520;
    v13[3] = &unk_100121CA0;
    v13[4] = self;
    [(RPMessageable *)v5 registerRequestID:@"_gcStop" options:v9 handler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005252C;
    v12[3] = &unk_100122C00;
    v12[4] = self;
    [(RPMessageable *)v5 registerEventID:@"_hidGC" options:v9 handler:v12];
  }
  else
  {
LABEL_12:
    v10 = RPErrorF();
    if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a3) {
      *a3 = v10;
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)invalidate
{
  if (dword_100141558 <= 30 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_hidC"];
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_touchStart"];
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_touchStop"];
  [(RPMessageable *)self->_messenger deregisterEventID:@"_hidT"];
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_gcStart"];
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_gcStop"];
  [(RPMessageable *)self->_messenger deregisterEventID:@"_hidGC"];
  messenger = self->_messenger;
  self->_messenger = 0;

  hidClient = self->_hidClient;
  if (hidClient)
  {
    CFRelease(hidClient);
    self->_hidClient = 0;
  }
  hidGCClient = self->_hidGCClient;
  if (hidGCClient)
  {
    CFRelease(hidGCClient);
    self->_hidGCClient = 0;
  }
}

- (void)_handleCommand:(id)a3 responseHandler:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  uint64_t v8 = CFDictionaryGetInt64Ranged();
  if (dword_100141558 <= 30 && (dword_100141558 != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0x13) {
      v9 = "?";
    }
    else {
      v9 = (&off_100122C48)[Int64Ranged];
    }
    if (v8 > 2) {
      v10 = "?";
    }
    else {
      v10 = (&off_100122CE8)[(int)v8];
    }
    v16 = v10;
    id v17 = v18;
    v15 = v9;
    LogPrintF();
  }
  switch(Int64Ranged)
  {
    case 1u:
      v11 = self;
      uint64_t v12 = 1;
      uint64_t v13 = 140;
      goto LABEL_36;
    case 2u:
      v11 = self;
      uint64_t v12 = 1;
      goto LABEL_33;
    case 3u:
      v11 = self;
      uint64_t v12 = 1;
      uint64_t v13 = 139;
      goto LABEL_36;
    case 4u:
      v11 = self;
      uint64_t v12 = 1;
      uint64_t v13 = 138;
      goto LABEL_36;
    case 5u:
      v11 = self;
      uint64_t v12 = 1;
      uint64_t v13 = 134;
      goto LABEL_36;
    case 6u:
      [(RPHIDDaemon *)self _handleSelectWithButtonState:v8];
      goto LABEL_37;
    case 7u:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 96;
      goto LABEL_36;
    case 8u:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 233;
      goto LABEL_36;
    case 9u:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 234;
      goto LABEL_36;
    case 0xAu:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 4;
      goto LABEL_36;
    case 0xBu:
      [(RPHIDDaemon *)self _activateScreenSaverWithResponseHandler:v6];
      break;
    case 0xCu:
      [(RPHIDDaemon *)self _sleepSystemWithResponseHandler:v6];
      break;
    case 0xDu:
      [(RPHIDDaemon *)self _wakeSystemWithResponseHandler:v6];
      break;
    case 0xEu:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 205;
      goto LABEL_36;
    case 0xFu:
      v11 = self;
      uint64_t v12 = 7;
      uint64_t v13 = 75;
      goto LABEL_36;
    case 0x10u:
      v11 = self;
      uint64_t v12 = 7;
      uint64_t v13 = 78;
      goto LABEL_36;
    case 0x11u:
      v11 = self;
      uint64_t v12 = 12;
LABEL_33:
      uint64_t v13 = 141;
      goto LABEL_36;
    case 0x12u:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 226;
      goto LABEL_36;
    case 0x13u:
      v11 = self;
      uint64_t v12 = 12;
      uint64_t v13 = 48;
LABEL_36:
      -[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:](v11, "_injectKeyboardEventUsagePage:usageCode:buttonState:", v12, v13, v8, v15, v16, v17);
LABEL_37:
      (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
      break;
    default:
      v14 = RPErrorF();
      if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v14);

      break;
  }
}

- (void)_activateScreenSaverWithResponseHandler:(id)a3
{
  id v4 = a3;
  v3 = RPErrorF();
  if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v3);
}

- (void)_injectKeyboardEventUsagePage:(unsigned int)a3 usageCode:(unsigned int)a4 buttonState:(int)a5
{
  if (!self->_hidClient
    || ([(RPHIDDaemon *)self _setupHIDSenderIDIfNeeded],
        mach_absolute_time(),
        (uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent()) == 0))
  {
LABEL_15:
    if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    return;
  }
  uint64_t v8 = (const void *)KeyboardEvent;
  if (self->_hidSenderID) {
    IOHIDEventSetSenderID();
  }
  IOHIDEventGetTimeStamp();
  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    v10 = (const void *)VendorDefinedEvent;
    IOHIDEventAppendEvent();
    CFRelease(v10);
  }
  IOHIDEventSystemClientDispatchEvent();
  CFRelease(v8);
  if (!a5)
  {
    mach_absolute_time();
    uint64_t v11 = IOHIDEventCreateKeyboardEvent();
    if (v11)
    {
      uint64_t v12 = (const void *)v11;
      if (self->_hidSenderID) {
        IOHIDEventSetSenderID();
      }
      IOHIDEventGetTimeStamp();
      uint64_t v13 = IOHIDEventCreateVendorDefinedEvent();
      if (v13)
      {
        v14 = (const void *)v13;
        IOHIDEventAppendEvent();
        CFRelease(v14);
      }
      IOHIDEventSystemClientDispatchEvent();
      CFRelease(v12);
      return;
    }
    goto LABEL_15;
  }
}

- (void)_sleepSystemWithResponseHandler:(id)a3
{
  id v4 = a3;
  v3 = RPErrorF();
  if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v3);
}

- (void)_wakeSystemWithResponseHandler:(id)a3
{
  id v4 = a3;
  v3 = RPErrorF();
  if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v3);
}

- (void)_handleGameControllerStart:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v8 = 0;
  [(RPHIDDaemon *)self _setupHIDGCDeviceWithOptions:a3 andReturnError:&v8];
  id v7 = v8;
  if (v7)
  {
    if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v7);
  }
  else
  {
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
  }
}

- (void)_handleGameControllerStop:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  hidGCDevice = self->_hidGCDevice;
  if (hidGCDevice)
  {
    CFRelease(hidGCDevice);
    self->_hidGCDevice = 0;
  }
  self->_hidGCSenderID = 0;
  self->_hidGCSenderIDInitialized = 0;
  (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
}

- (void)_handleGameControllerAuxEvent:(int64_t)a3 pressed:(int64_t)a4
{
  mach_absolute_time();
  uint64_t v4 = IOHIDEventCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    IOHIDEventSetEventFlags();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetSenderID();
    IOHIDEventSystemClientDispatchEvent();
    CFRelease(v5);
  }
  else if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleGameControllerEvent:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_hidGCClient
    && v4
    && ([(RPHIDDaemon *)self _setupHIDGCSenderIDIfNeeded], self->_hidGCSenderID)
    && (mach_absolute_time(), (uint64_t v5 = IOHIDEventCreate()) != 0))
  {
    id v6 = (const void *)v5;
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetInt64Ranged();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetInt64Ranged();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    CFDictionaryGetDouble();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetSenderID();
    IOHIDEventSystemClientDispatchEvent();
    CFRelease(v6);
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    int v8 = CFDictionaryGetInt64Ranged();
    int v9 = CFDictionaryGetInt64Ranged();
    if ((Int64Ranged & 0xFFFFFF00) != 0) {
      [(RPHIDDaemon *)self _handleGameControllerAuxEvent:547 pressed:Int64Ranged & 1];
    }
    if ((v8 & 0xFFFFFF00) != 0) {
      [(RPHIDDaemon *)self _handleGameControllerAuxEvent:516 pressed:v8 & 1];
    }
    if ((v9 & 0xFFFFFF00) != 0) {
      [(RPHIDDaemon *)self _handleGameControllerAuxEvent:521 pressed:v9 & 1];
    }
  }
  else if (dword_100141558 <= 60 && (dword_100141558 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_setupHIDGCDeviceWithOptions:(id)a3 andReturnError:(id *)a4
{
  if (self->_hidGCDevice) {
    return 1;
  }
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = xmmword_10011A4EA;
  v22[0] = unk_10011A4FA;
  *(_OWORD *)((char *)v22 + 9) = unk_10011A503;
  long long v17 = xmmword_10011A4AA;
  long long v18 = unk_10011A4BA;
  long long v19 = xmmword_10011A4CA;
  long long v20 = unk_10011A4DA;
  long long v15 = xmmword_10011A48A;
  long long v16 = unk_10011A49A;
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&v15 length:137];
  [v7 setObject:v8 forKeyedSubscript:@"ReportDescriptor" v15, v16, v17, v18, v19, v20, v21, v22[0], v22[1]];

  [v7 setObject:&off_10012B180 forKeyedSubscript:@"VendorID"];
  [v7 setObject:&off_10012B198 forKeyedSubscript:@"ProductID"];
  [v7 setObject:@"Rapport" forKeyedSubscript:@"Transport"];
  [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:@"DisplayIntegrated"];
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Authenticated"];
  id v9 = objc_alloc_init((Class)NSUUID);
  id v10 = [v9 UUIDString];
  [v7 setObject:v10 forKeyedSubscript:@"PhysicalDeviceUniqueID"];

  [v7 setObject:@"Generic Extended Controller" forKeyedSubscript:@"Product"];
  [v7 setObject:&off_10012B1B0 forKeyedSubscript:@"DeviceUsagePage"];
  [v7 setObject:&off_10012B1C8 forKeyedSubscript:@"DeviceUsage"];
  uint64_t v11 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate();
  self->_hidGCDevice = v11;
  BOOL v4 = v11 != 0;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = CUMainQueue();
    IOHIDUserDeviceSetDispatchQueue(v12, v13);

    IOHIDUserDeviceActivate(self->_hidGCDevice);
  }
  else if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_setupHIDGCSenderIDIfNeeded
{
  kern_return_t ChildEntry;
  kern_return_t v6;
  kern_return_t RegistryEntryID;
  io_registry_entry_t entry;
  io_registry_entry_t child;
  uint64_t vars8;

  if (!self->_hidGCSenderIDInitialized && self->_hidGCDevice)
  {
    self->_hidGCSenderID = 0;
    io_registry_entry_t v3 = IOHIDUserDeviceCopyService();
    if (v3)
    {
      io_object_t v4 = v3;
      child = 0;
      ChildEntry = IORegistryEntryGetChildEntry(v3, "IOService", &child);
      IOObjectRelease(v4);
      if (ChildEntry)
      {
        if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
LABEL_21:
        }
          LogPrintF();
      }
      else
      {
        entry = 0;
        id v6 = IORegistryEntryGetChildEntry(child, "IOService", &entry);
        IOObjectRelease(child);
        if (v6)
        {
          if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
            goto LABEL_21;
          }
        }
        else
        {
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, &self->_hidGCSenderID);
          self->_hidGCSenderIDInitialized = 1;
          IOObjectRelease(entry);
          if (RegistryEntryID
            && dword_100141558 <= 90
            && (dword_100141558 != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_21;
          }
        }
      }
    }
    else if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_handleTouchStart:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100141558 <= 30 && (dword_100141558 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v6;
    LogPrintF();
  }
  id v11 = 0;
  -[RPHIDDaemon _setupHIDTouchDeviceAndReturnError:](self, "_setupHIDTouchDeviceAndReturnError:", &v11, v10);
  id v8 = v11;
  if (v8)
  {
    if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
  }
  else
  {
    CFStringRef v12 = @"_i";
    uint64_t v13 = &off_10012B1B0;
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0, 0);
  }
}

- (void)_handleTouchStop:(id)a3 responseHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (dword_100141558 <= 30 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  activeTouchEventMap = self->_activeTouchEventMap;
  self->_activeTouchEventMap = 0;

  self->_lastEventTicks = 0;
  self->_epochNanos = 0;
  self->_epochTicks = 0;
  hidTouchDevice = self->_hidTouchDevice;
  if (hidTouchDevice)
  {
    CFRelease(hidTouchDevice);
    self->_hidTouchDevice = 0;
  }
  self->_hidSenderID = 0;
  self->_hidSenderIDInitialized = 0;
  (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
}

- (void)_handleTouchEvent:(id)a3
{
  id v4 = a3;
  if (self->_hidTouchDevice) {
    goto LABEL_8;
  }
  if (dword_100141558 <= 30 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v35 = 0;
  [(RPHIDDaemon *)self _setupHIDTouchDeviceAndReturnError:&v35];
  uint64_t v5 = (_UNKNOWN **)v35;
  id v6 = v5;
  if (self->_hidTouchDevice)
  {

LABEL_8:
    uint64_t v7 = mach_absolute_time();
    if (dword_100141558 <= 9 && (dword_100141558 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v4;
      LogPrintF();
    }
    int v34 = 0;
    uint64_t v8 = NSDictionaryGetNSNumber();
    id v9 = (void *)v8;
    id v10 = &off_10012B1E0;
    if (v8) {
      id v10 = (_UNKNOWN **)v8;
    }
    id v6 = v10;

    unsigned int v30 = [v6 intValue];
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    __int16 v31 = CFDictionaryGetInt64Ranged();
    __int16 v32 = CFDictionaryGetInt64Ranged();
    unint64_t Int64 = CFDictionaryGetInt64();
    if (!self->_activeTouchEventMap)
    {
      CFStringRef v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      activeTouchEventMap = self->_activeTouchEventMap;
      self->_activeTouchEventMap = v12;
    }
    id v14 = [objc_alloc((Class)NSValue) initWithBytes:&v30 objCType:"{?=iSSiB}"];
    [(NSMutableDictionary *)self->_activeTouchEventMap setObject:v14 forKeyedSubscript:v6];

    if (v7 - self->_lastEventTicks >= self->_epochResetTicks)
    {
      self->_epochNanos = Int64;
      self->_unint64_t epochTicks = v7;
      uint64_t v16 = v7;
    }
    else
    {
      unint64_t epochTicks = self->_epochTicks;
      uint64_t v16 = NanosecondsToUpTicks() + epochTicks;
    }
    self->_lastEventTicks = v7;
    uint64_t v25 = 0;
    v26 = (const uint8_t *)&v25;
    uint64_t v27 = 0x3010000000;
    v28 = &unk_1000FFA8E;
    v29[0] = 0;
    *(void *)((char *)v29 + 5) = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    long long v17 = self->_activeTouchEventMap;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    _OWORD v22[2] = sub_100054188;
    v22[3] = &unk_100122C28;
    v22[4] = &v25;
    v22[5] = v23;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v22, v20);
    int v18 = Int64Ranged;
    long long v19 = v26;
    *((unsigned char *)v26 + 44) = Int64Ranged == 5;
    if ((v18 - 1) >= 3)
    {
      [(NSMutableDictionary *)self->_activeTouchEventMap setObject:0 forKeyedSubscript:v6];
      long long v19 = v26;
    }
    if (IOHIDUserDeviceHandleReportWithTimeStamp(self->_hidTouchDevice, v16, v19 + 32, 13)
      && dword_100141558 <= 90
      && (dword_100141558 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(&v25, 8);
    goto LABEL_27;
  }
  if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize()))
  {
    long long v21 = CUPrintNSError();
    LogPrintF();
  }
LABEL_27:
}

- (void)_handleSelectWithButtonState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mach_absolute_time();
  uint64_t v5 = UpTicksToMilliseconds();
  if (v3 >= 2)
  {
    if (v5 - self->_lastSelectButtonDown <= 0x14)
    {
      dispatch_time_t v6 = dispatch_time(0, 20000000);
      uint64_t v7 = CUMainQueue();
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100054348;
      v8[3] = &unk_1001218E0;
      v8[4] = self;
      int v9 = v3;
      dispatch_after(v6, v7, v8);

      return;
    }
  }
  else
  {
    mach_absolute_time();
    self->_lastSelectButtonDown = UpTicksToMilliseconds();
  }

  [(RPHIDDaemon *)self _injectKeyboardEventUsagePage:12 usageCode:128 buttonState:v3];
}

- (BOOL)_setupHIDTouchDeviceAndReturnError:(id *)a3
{
  if (self->_hidTouchDevice) {
    return 1;
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 setObject:&off_10012B1F8 forKeyedSubscript:@"VendorID"];
  [v6 setObject:&off_10012B210 forKeyedSubscript:@"ProductID"];
  [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"DisplayIntegrated"];
  [v6 setObject:@"Rapport" forKeyedSubscript:@"Transport"];
  *(_OWORD *)CFStringRef v12 = xmmword_10011A533;
  *(_OWORD *)&v12[16] = unk_10011A543;
  long long v15 = xmmword_10011A573;
  long long v16 = unk_10011A583;
  long long v17 = xmmword_10011A593;
  long long v13 = xmmword_10011A553;
  long long v14 = unk_10011A563;
  long long v10 = xmmword_10011A513;
  long long v11 = unk_10011A523;
  LODWORD(v18) = -1073638137;
  *(_WORD *)&v12[15] = 1000;
  HIWORD(v15) = 1000;
  *(_WORD *)&v12[28] = 1000;
  *(_WORD *)((char *)&v16 + 11) = 1000;
  id v7 = [objc_alloc((Class)NSData) initWithBytes:&v10 length:148];
  [v6 setObject:v7 forKeyedSubscript:@"ReportDescriptor" v10, v11, *(_OWORD *)v12, *(_OWORD *)&v12[16], v13, v14, v15, v16, v17, v18];

  uint64_t v8 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate();
  self->_hidTouchDevice = v8;
  BOOL v3 = v8 != 0;
  if (!v8 && a3)
  {
    RPErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_setupHIDSenderIDIfNeeded
{
  kern_return_t ChildEntry;
  kern_return_t v6;
  kern_return_t RegistryEntryID;
  io_registry_entry_t entry;
  io_registry_entry_t child;
  uint64_t vars8;

  if (!self->_hidSenderIDInitialized && self->_hidTouchDevice)
  {
    self->_hidSenderID = 0;
    p_hidSenderID = &self->_hidSenderID;
    self->_hidSenderIDInitialized = 1;
    io_registry_entry_t v3 = IOHIDUserDeviceCopyService();
    if (v3)
    {
      io_object_t v4 = v3;
      child = 0;
      ChildEntry = IORegistryEntryGetChildEntry(v3, "IOService", &child);
      IOObjectRelease(v4);
      if (ChildEntry)
      {
        if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
LABEL_21:
        }
          LogPrintF();
      }
      else
      {
        entry = 0;
        id v6 = IORegistryEntryGetChildEntry(child, "IOService", &entry);
        IOObjectRelease(child);
        if (v6)
        {
          if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize())) {
            goto LABEL_21;
          }
        }
        else
        {
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, p_hidSenderID);
          IOObjectRelease(entry);
          if (RegistryEntryID
            && dword_100141558 <= 90
            && (dword_100141558 != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_21;
          }
        }
      }
    }
    else if (dword_100141558 <= 90 && (dword_100141558 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);

  objc_storeStrong((id *)&self->_activeTouchEventMap, 0);
}

@end