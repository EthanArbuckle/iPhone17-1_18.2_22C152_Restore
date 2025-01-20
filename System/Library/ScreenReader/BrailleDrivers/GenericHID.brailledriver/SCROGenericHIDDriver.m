@interface SCROGenericHIDDriver
- (BOOL)_HIDSetMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)_HIDSetMainCells_Legacy:(const char *)a3 length:(int64_t)a4;
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (BOOL)usage:(unsigned int)a3 isSameClassAsUsage:(unsigned int)a4 forUsagePage:(unsigned int)a5;
- (SCROGenericHIDDriver)init;
- (id)_HIDGetInputEvents;
- (id)genericControlRankComparator;
- (id)getInputEvents;
- (id)getRevelantHIDElementsFromRoot;
- (id)modelIdentifier;
- (int)_HIDLoadDriverWithIOElement:(id)a3;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)_mainSizeLegacy;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (unsigned)_eventForGenericControl:(__IOHIDValue *)a3;
- (unsigned)_eventForScreenReaderControl:(__IOHIDValue *)a3;
- (unsigned)productId;
- (unsigned)vendorId;
- (void)_buildRankingTable;
- (void)dealloc;
- (void)setProductId:(unsigned int)a3;
- (void)setVendorId:(unsigned int)a3;
@end

@implementation SCROGenericHIDDriver

- (SCROGenericHIDDriver)init
{
  v13.receiver = self;
  v13.super_class = (Class)SCROGenericHIDDriver;
  v2 = [(SCROGenericHIDDriver *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_isDriverLoaded = 0;
    p_setMainCellsSEL = &v2->_setMainCellsSEL;
    if ("_HIDSetMainCells:length:")
    {
      SEL *p_setMainCellsSEL = "_HIDSetMainCells:length:";
      v5 = "_HIDSetMainCells:length:";
    }
    else
    {
      v5 = 0;
      SEL *p_setMainCellsSEL = 0;
    }
    v2->_setMainCellsIMP = [(SCROGenericHIDDriver *)v2 methodForSelector:v5];
    p_getInputEventsSEL = &v3->_getInputEventsSEL;
    if ("_HIDGetInputEvents")
    {
      SEL *p_getInputEventsSEL = "_HIDGetInputEvents";
      v7 = "_HIDGetInputEvents";
    }
    else
    {
      v7 = 0;
      SEL *p_getInputEventsSEL = 0;
    }
    v3->_getInputEventsIMP = [(SCROGenericHIDDriver *)v3 methodForSelector:v7];
    uint64_t v8 = +[NSMutableArray array];
    enqueuedEvents = v3->_enqueuedEvents;
    v3->_enqueuedEvents = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init((Class)NSLock);
    eventLock = v3->_eventLock;
    v3->_eventLock = v10;

    v3->_numberOfBrailleCells = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)dealloc
{
  [(SCROGenericHIDDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)SCROGenericHIDDriver;
  [(SCROGenericHIDDriver *)&v3 dealloc];
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)loadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transport];
  v6 = _SCROD_LOG();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[NSNumber numberWithUnsignedInt:v5];
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    objc_super v13 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Loading IO element %@ - transport: %@", (uint8_t *)&v10, 0x16u);
  }
  if (v5 == 8 || v5 == 4)
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOHIDElementProtocol]) {
      int v8 = [(SCROGenericHIDDriver *)self _HIDLoadDriverWithIOElement:v4];
    }
    else {
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 3;
  }

  return v8;
}

- (BOOL)unloadDriver
{
  objc_super v3 = _SCROD_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Unloading GenericHID Braille Driver", v6, 2u);
  }

  self->_hasBeenUnloaded = 1;
  if (self->_isDriverLoaded)
  {
    self->_isDriverLoaded = 0;
    hidDevice = self->_hidDevice;
    if (hidDevice)
    {
      IOHIDDeviceClose(hidDevice, 0);
      CFRelease(self->_hidDevice);
      self->_hidDevice = 0;
    }
    if (self->_ioSystemFilterClient) {
      IOHIDEventSystemClientUnregisterEventFilterCallback();
    }
  }
  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return @"com.apple.generic.hid.mobile";
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)isInputEnabled
{
  return self->_isDriverLoaded;
}

- (BOOL)postsKeyboardEvents
{
  return self->_keyboardInputSupported;
}

- (int)brailleInputMode
{
  return 2 * self->_keyboardInputSupported;
}

- (int64_t)_mainSizeLegacy
{
  CFArrayRef v2 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)&off_8B50, 0);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFArrayRef v3 = v2;
  int64_t ReportCount = (int64_t)[(__CFArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (ReportCount)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != ReportCount; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(__IOHIDElement **)(*((void *)&v9 + 1) + 8 * i);
        if (!IOHIDElementIsArray(v7))
        {
          int64_t ReportCount = IOHIDElementGetReportCount(v7);
          goto LABEL_11;
        }
      }
      int64_t ReportCount = (int64_t)[(__CFArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (ReportCount) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return ReportCount;
}

- (int64_t)mainSize
{
  if (self->_isLegacy)
  {
    return [(SCROGenericHIDDriver *)self _mainSizeLegacy];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v2 = [&off_8BF0 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v2)
    {
      id v3 = v2;
      unint64_t v4 = 0;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(&off_8BF0);
          }
          uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v31[0] = @"UsagePage";
          v31[1] = @"Usage";
          v32[0] = &off_8530;
          v32[1] = v6;
          +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2, v20);
          CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CFArrayRef v8 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, v7, 0);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          CFArrayRef v9 = v8;
          id v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t ReportCount = 0;
            uint64_t v13 = *(void *)v23;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v9);
                }
                v15 = *(__IOHIDElement **)(*((void *)&v22 + 1) + 8 * (void)j);
                if (!IOHIDElementIsArray(v15) && ReportCount-- < 1)
                {
                  uint64_t ReportCount = IOHIDElementGetReportCount(v15);
                  v4 += IOHIDElementGetReportCount(v15);
                }
              }
              id v11 = [(__CFArray *)v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v11);
          }
        }
        id v3 = [&off_8BF0 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v3);
    }
    else
    {
      unint64_t v4 = 0;
    }
    unint64_t numberOfBrailleCells = self->_numberOfBrailleCells;
    if (v4 >= numberOfBrailleCells) {
      int64_t v18 = self->_numberOfBrailleCells;
    }
    else {
      int64_t v18 = v4;
    }
    if (numberOfBrailleCells == 0x7FFFFFFFFFFFFFFFLL) {
      return v4;
    }
    else {
      return v18;
    }
  }
}

- (int64_t)statusSize
{
  return 0;
}

- (id)getInputEvents
{
  return (id)((uint64_t (*)(void))self->_getInputEventsIMP)();
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  return ((uint64_t (*)(void))self->_setMainCellsIMP)();
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (int)_HIDLoadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 bundleIdentifier];
  if (!v6)
  {
    v14 = _SCROD_LOG();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v28 = "Failed to load GenericHID braille driver because we have no bundle identifier";
LABEL_35:
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    }
LABEL_36:
    int v27 = 1;
    goto LABEL_42;
  }
  if (self->_isDriverLoaded) {
    [(SCROGenericHIDDriver *)self unloadDriver];
  }
  CFDictionaryRef v7 = (__IOHIDDevice *)[v4 hidDevice];
  if (!v7)
  {
    v14 = _SCROD_LOG();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v28 = "Failed to load GenericHID braille driver because there is no hidDevice";
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  self->_hidDevice = v7;
  device = v7;
  CFArrayRef v8 = IOHIDDeviceGetProperty(v7, @"DeviceUsagePairs");
  -[SCROGenericHIDDriver setVendorId:](self, "setVendorId:", [v4 vendorId]);
  -[SCROGenericHIDDriver setProductId:](self, "setProductId:", [v4 productId]);
  CFArrayRef v9 = _SCROD_LOG();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = +[NSNumber numberWithUnsignedInt:[(SCROGenericHIDDriver *)self vendorId]];
    id v11 = +[NSNumber numberWithUnsignedInt:[(SCROGenericHIDDriver *)self productId]];
    long long v12 = [v4 manufacturerName];
    uint64_t v13 = [v4 productName];
    *(_DWORD *)buf = 138413058;
    v57 = v10;
    __int16 v58 = 2112;
    v59 = v11;
    __int16 v60 = 2112;
    v61 = v12;
    __int16 v62 = 2112;
    v63 = v13;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "HID braille display: VendorID %@ and product id: %@, maker %@, product %@", buf, 0x2Au);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (!v15)
  {

    goto LABEL_38;
  }
  id v16 = v15;
  v45 = self;
  v42 = v6;
  id v43 = v4;
  char v17 = 0;
  uint64_t v18 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v51 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      v21 = [v20 objectForKeyedSubscript:@"DeviceUsagePage"];
      long long v22 = [v20 objectForKeyedSubscript:@"DeviceUsage"];
      if ([v21 isEqual:&off_8530]
        && [v22 isEqual:&off_8590])
      {
        v45->_isLegacy = 1;
      }
      if ([v22 isEqual:&off_8590]
        && ([v21 isEqual:&off_8530] & 1) != 0
        || [v22 isEqual:&off_85A8]
        && ([v21 isEqual:&off_8530] & 1) != 0)
      {
        char v23 = 1;
LABEL_23:
        v45->_keyboardInputSupported = v23;
        char v17 = 1;
        goto LABEL_24;
      }
      if ([v22 isEqual:&off_85A8]
        && [v21 isEqual:&off_8530])
      {
        char v23 = 0;
        goto LABEL_23;
      }
LABEL_24:
    }
    id v16 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
  }
  while (v16);

  id v4 = v43;
  if (v17)
  {
    IOReturn v24 = IOHIDDeviceOpen(device, 0);
    if (v24)
    {
      __int16 v25 = v24;
      long long v26 = _SCROD_LOG();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v25 & 0x3FFF;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Failed to load GenericHID braille driver because we failed to open the HIDDevice: %d", buf, 8u);
      }
      int v27 = 1;
    }
    else
    {
      [(SCROGenericHIDDriver *)v45 _buildRankingTable];
      Current = CFRunLoopGetCurrent();
      IOHIDDeviceScheduleWithRunLoop(device, Current, kCFRunLoopDefaultMode);
      IOHIDDeviceRegisterRemovalCallback(device, (IOHIDCallback)sub_3A00, v45);
      IOHIDDeviceRegisterInputValueCallback(v45->_hidDevice, (IOHIDValueCallback)sub_3AE8, v45);
      v45->_hidDevice = device;
      CFRetain(device);
      v45->_isDriverLoaded = 1;
      CFArrayRef v31 = IOHIDDeviceCopyMatchingElements(v45->_hidDevice, (CFDictionaryRef)&off_8B78, 0);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v26 = v31;
      id v32 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v47;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(v26);
            }
            v36 = *(__IOHIDElement **)(*((void *)&v46 + 1) + 8 * (void)j);
            if (IOHIDElementGetReportSize(v36) == 128)
            {
              uint64_t v37 = mach_absolute_time();
              IOHIDValueRef v38 = IOHIDValueCreateWithBytes(0, v36, v37, byte_D1C0, 16);
              if (v38)
              {
                v39 = v38;
                v40 = _SCROD_LOG();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v57 = v39;
                  _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Reported back screen reader: %@", buf, 0xCu);
                }

                IOHIDDeviceSetValue(v45->_hidDevice, v36, v39);
                CFRelease(v39);
              }
            }
          }
          id v33 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v33);
      }

      v45->_ioSystemFilterClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
      v41 = _SCROD_LOG();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v14;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Successful load generic hid: %@", buf, 0xCu);
      }

      int v27 = 0;
      id v4 = v43;
      uint64_t v6 = v42;
    }
    goto LABEL_41;
  }
LABEL_38:
  long long v26 = _SCROD_LOG();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v14;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Could not match usage for generic hid: %@", buf, 0xCu);
  }
  int v27 = 3;
LABEL_41:

LABEL_42:
  return v27;
}

- (BOOL)_HIDSetMainCells_Legacy:(const char *)a3 length:(int64_t)a4
{
  CFArrayRef v6 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)&off_8BA0, 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  CFArrayRef v7 = v6;
  id v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v30;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(__IOHIDElement **)(*((void *)&v29 + 1) + 8 * (void)v12);
        if (!IOHIDElementIsArray(v13) && v10-- < 1)
        {
          uint32_t ReportCount = IOHIDElementGetReportCount(v13);
          CFIndex LogicalMin = IOHIDElementGetLogicalMin(v13);
          uint64_t v17 = IOHIDElementGetLogicalMax(v13) - LogicalMin;
          if (v17 <= 254)
          {
            uint64_t v18 = _SCROD_LOG();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              int64_t v34 = v17;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Braille display does not support 8 dots, has maximum range of - %ld", buf, 0xCu);
            }
          }
          if (IOHIDElementGetReportCount(v13) < a4)
          {
            v19 = _SCROD_LOG();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint32_t v20 = IOHIDElementGetReportCount(v13);
              *(_DWORD *)buf = 134218240;
              int64_t v34 = a4;
              __int16 v35 = 2048;
              uint64_t v36 = v20;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Braille display does not support writing %ld cells -- truncating to %ld", buf, 0x16u);
            }
          }
          uint64_t v10 = ReportCount;
          uint64_t v21 = mach_absolute_time();
          long long v22 = IOHIDValueCreateWithBytes(0, v13, v21, (const uint8_t *)a3, a4);
          if (v22)
          {
            char v23 = v22;
            IOReturn v24 = IOHIDDeviceSetValue(self->_hidDevice, v13, v22);
            CFRelease(v23);
            if (v24)
            {
              __int16 v25 = _SCROD_LOG();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Failed to set value for display cell element", buf, 2u);
              }
            }
          }
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v26 = [(__CFArray *)v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
      id v9 = v26;
    }
    while (v26);
  }

  return 1;
}

- (BOOL)_HIDSetMainCells:(const char *)a3 length:(int64_t)a4
{
  if (self->_isLegacy)
  {
    return -[SCROGenericHIDDriver _HIDSetMainCells_Legacy:length:](self, "_HIDSetMainCells_Legacy:length:");
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = [&off_8C08 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v43;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(&off_8C08);
          }
          uint64_t v36 = v6;
          uint64_t v7 = *(void *)(*((void *)&v42 + 1) + 8 * v6);
          v51[0] = @"UsagePage";
          v51[1] = @"Usage";
          v52[0] = &off_8530;
          v52[1] = v7;
          +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2, v33);
          CFDictionaryRef v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CFArrayRef v8 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, v35, 0);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          CFArrayRef v9 = v8;
          id v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = 0;
            uint64_t v13 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v39 != v13) {
                  objc_enumerationMutation(v9);
                }
                id v15 = *(__IOHIDElement **)(*((void *)&v38 + 1) + 8 * i);
                if (!IOHIDElementIsArray(v15) && v12-- < 1)
                {
                  uint32_t ReportCount = IOHIDElementGetReportCount(v15);
                  CFIndex LogicalMin = IOHIDElementGetLogicalMin(v15);
                  uint64_t v19 = IOHIDElementGetLogicalMax(v15) - LogicalMin;
                  if (v19 <= 254)
                  {
                    uint32_t v20 = _SCROD_LOG();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      int64_t v47 = v19;
                      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Braille display does not support 8 dots, has maximum range of - %ld", buf, 0xCu);
                    }
                  }
                  uint32_t v21 = IOHIDElementGetReportCount(v15);
                  int64_t numberOfBrailleCells = self->_numberOfBrailleCells;
                  if (numberOfBrailleCells >= v21) {
                    int64_t v23 = v21;
                  }
                  else {
                    int64_t v23 = self->_numberOfBrailleCells;
                  }
                  uint64_t v24 = v23 & ~(v23 >> 63);
                  if (numberOfBrailleCells == 0x7FFFFFFFFFFFFFFFLL) {
                    int64_t v25 = v21;
                  }
                  else {
                    int64_t v25 = v24;
                  }
                  if (a4 > v25)
                  {
                    id v26 = _SCROD_LOG();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134218240;
                      int64_t v47 = a4;
                      __int16 v48 = 2048;
                      int64_t v49 = v25;
                      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Braille display does not support writing %ld cells -- truncating to %ld", buf, 0x16u);
                    }

                    a4 = v25;
                  }
                  uint64_t v27 = mach_absolute_time();
                  long long v28 = IOHIDValueCreateWithBytes(0, v15, v27, (const uint8_t *)a3, a4);
                  if (v28)
                  {
                    long long v29 = v28;
                    IOReturn v30 = IOHIDDeviceSetValue(self->_hidDevice, v15, v28);
                    CFRelease(v29);
                    if (v30)
                    {
                      long long v31 = _SCROD_LOG();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Failed to set value for display cell element", buf, 2u);
                      }
                    }
                  }
                  uint64_t v12 = ReportCount;
                  a3 += a4;
                }
              }
              id v11 = [(__CFArray *)v9 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }
            while (v11);
          }

          uint64_t v6 = v36 + 1;
        }
        while ((id)(v36 + 1) != v34);
        id v34 = [&off_8C08 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v34);
    }
    return 1;
  }
}

- (id)_HIDGetInputEvents
{
  [(NSLock *)self->_eventLock lock];
  id v3 = [(NSMutableArray *)self->_enqueuedEvents copy];
  [(NSMutableArray *)self->_enqueuedEvents removeAllObjects];
  [(NSLock *)self->_eventLock unlock];

  return v3;
}

- (unsigned)_eventForScreenReaderControl:(__IOHIDValue *)a3
{
  Element = IOHIDValueGetElement(a3);
  int Usage = IOHIDElementGetUsage(Element);
  if (!Usage) {
    return 0;
  }
  if (IOHIDValueGetIntegerValue(a3) <= 0) {
    int v6 = 6;
  }
  else {
    int v6 = 65542;
  }
  return v6 | (16 * Usage) | 0x3000;
}

- (unsigned)_eventForGenericControl:(__IOHIDValue *)a3
{
  Element = IOHIDValueGetElement(a3);
  uint64_t Cookie = IOHIDElementGetCookie(Element);
  if (qword_D238 != -1) {
    dispatch_once(&qword_D238, &stru_8290);
  }
  genericControlRanking = self->_genericControlRanking;
  CFArrayRef v8 = +[NSNumber numberWithInt:Cookie];
  CFArrayRef v9 = [(NSMutableDictionary *)genericControlRanking objectForKey:v8];

  if ([v9 controlType] == (char *)&dword_0 + 1)
  {
    int v10 = 0x40000;
    id v11 = &off_8C20;
  }
  else if ([v9 controlType] == (char *)&dword_0 + 2)
  {
    int v10 = 393216;
    id v11 = &off_8C38;
  }
  else
  {
    if ([v9 controlType]
      || (unsigned int v16 = [v9 finalRank],
          id v11 = &off_8C50,
          (unint64_t)[&off_8C50 count] <= v16))
    {
      unsigned int v15 = 0;
      goto LABEL_15;
    }
    int v10 = 0x20000;
  }
  if (IOHIDValueGetIntegerValue(a3) <= 0) {
    int v12 = 6;
  }
  else {
    int v12 = 65542;
  }
  id v13 = [v9 finalRank];
  unsigned int v14 = v12 | (16 * sub_4A6C((uint64_t)v13, v13, v11)) & 0xF9FFF0;
  unsigned int v15 = ((v14 | ([v9 finalRank] << 24)) + 0x1000000) | v10;
LABEL_15:

  return v15;
}

- (void)_buildRankingTable
{
  if (!self->_genericControlRanking)
  {
    id v3 = +[NSMutableDictionary dictionary];
    genericControlRanking = self->_genericControlRanking;
    self->_genericControlRanking = v3;

    v74 = +[NSMutableArray array];
    v70 = self;
    [(SCROGenericHIDDriver *)self getRevelantHIDElementsFromRoot];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v73 = long long v88 = 0u;
    id obj = [v73 allKeys];
    id v75 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
    if (v75)
    {
      uint64_t v72 = *(void *)v86;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v86 != v72) {
            objc_enumerationMutation(obj);
          }
          uint64_t v77 = v5;
          int v6 = *(void **)(*((void *)&v85 + 1) + 8 * v5);
          uint64_t v7 = (__IOHIDElement *)[v73 objectForKey:v6];
          uint64_t Usage = IOHIDElementGetUsage(v7);
          uint64_t UsagePage = IOHIDElementGetUsagePage(v7);
          int v10 = objc_alloc_init(SCROGenericHIDControlInfo);
          [(SCROGenericHIDControlInfo *)v10 setUsage:Usage];
          int v76 = UsagePage;
          [(SCROGenericHIDControlInfo *)v10 setUsagePage:UsagePage];
          -[SCROGenericHIDControlInfo setCookie:](v10, "setCookie:", [v6 unsignedIntegerValue]);
          IOHIDElementRef Parent = IOHIDElementGetParent(v7);
          if (Parent)
          {
            int v12 = Parent;
            int v13 = 0;
            unsigned int v14 = 0;
            int v79 = Usage;
            do
            {
              if (IOHIDElementGetType(v12) == kIOHIDElementTypeCollection)
              {
                if (!v14) {
                  unsigned int v14 = v12;
                }
                uint64_t v15 = IOHIDElementGetUsage(v12);
                uint32_t v16 = IOHIDElementGetUsagePage(v12);
                if (v16 == 10)
                {
                  if (![(SCROGenericHIDControlInfo *)v10 instanceNumber]) {
                    [(SCROGenericHIDControlInfo *)v10 setInstanceNumber:v15];
                  }
                }
                else if (v16 == 65 && ![(SCROGenericHIDControlInfo *)v10 collectionUsage])
                {
                  [(SCROGenericHIDControlInfo *)v10 setCollectionUsage:v15];
                }
                if (v12 == v14 && Usage >= 0x21C && Usage <= 0x21E)
                {
                  uint64_t v17 = IOHIDElementGetChildren(v12);
                  long long v81 = 0u;
                  long long v82 = 0u;
                  long long v83 = 0u;
                  long long v84 = 0u;
                  id v18 = [v17 countByEnumeratingWithState:&v81 objects:v89 count:16];
                  if (v18)
                  {
                    id v19 = v18;
                    uint64_t v20 = *(void *)v82;
                    do
                    {
                      for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
                      {
                        if (*(void *)v82 != v20) {
                          objc_enumerationMutation(v17);
                        }
                        long long v22 = *(__IOHIDElement **)(*((void *)&v81 + 1) + 8 * i);
                        uint32_t v23 = IOHIDElementGetUsage(v22);
                        uint32_t v24 = IOHIDElementGetUsagePage(v22);
                        BOOL v26 = v23 == 542 && v24 == 65;
                        v13 |= v26;
                      }
                      id v19 = [v17 countByEnumeratingWithState:&v81 objects:v89 count:16];
                    }
                    while (v19);
                  }

                  unsigned int v14 = v12;
                  LODWORD(Usage) = v79;
                }
              }
              int v12 = IOHIDElementGetParent(v12);
            }
            while (v12);
          }
          else
          {
            int v13 = 0;
          }
          if (v76 == 65)
          {
            if ((Usage - 528) >= 0xA) {
              uint64_t v27 = ((Usage - 540) < 3) & (v13 ^ 1u);
            }
            else {
              uint64_t v27 = 2;
            }
            [(SCROGenericHIDControlInfo *)v10 setControlType:v27];
          }
          [v74 addObject:v10];

          uint64_t v5 = v77 + 1;
        }
        while ((id)(v77 + 1) != v75);
        id v75 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
      }
      while (v75);
    }

    uint64_t v28 = [v74 indexesOfObjectsPassingTest:&stru_82F8];
    uint64_t v29 = [v74 indexesOfObjectsPassingTest:&stru_8318];
    IOReturn v30 = [v74 indexesOfObjectsPassingTest:&stru_8338];
    v80 = (void *)v28;
    long long v31 = [v74 objectsAtIndexes:v28];
    id v32 = [v31 mutableCopy];

    v78 = (void *)v29;
    uint64_t v33 = [v74 objectsAtIndexes:v29];
    id v34 = [v33 mutableCopy];

    CFDictionaryRef v35 = [v74 objectsAtIndexes:v30];
    id v36 = [v35 mutableCopy];

    uint64_t v37 = [(SCROGenericHIDDriver *)v70 genericControlRankComparator];
    [v32 sortUsingComparator:v37];

    long long v38 = [(SCROGenericHIDDriver *)v70 genericControlRankComparator];
    [v34 sortUsingComparator:v38];

    long long v39 = [(SCROGenericHIDDriver *)v70 genericControlRankComparator];
    [v36 sortUsingComparator:v39];

    if ([v32 count])
    {
      uint64_t v40 = 0;
      unsigned int v41 = 1;
      do
      {
        uint64_t v42 = [v32 count] + ~v40;
        long long v43 = [v32 objectAtIndexedSubscript:v40];
        [v43 setFinalRank:v42];

        long long v44 = v70->_genericControlRanking;
        long long v45 = [v32 objectAtIndexedSubscript:v40];
        long long v46 = [v32 objectAtIndexedSubscript:v40];
        int64_t v47 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v46 cookie]);
        [(NSMutableDictionary *)v44 setObject:v45 forKey:v47];

        uint64_t v40 = v41;
        BOOL v48 = (unint64_t)[v32 count] > v41++;
      }
      while (v48);
    }
    if ([v34 count])
    {
      uint64_t v49 = 0;
      unsigned int v50 = 1;
      do
      {
        uint64_t v51 = [v34 count] + ~v49;
        long long v52 = [v34 objectAtIndexedSubscript:v49];
        [v52 setFinalRank:v51];

        long long v53 = v70->_genericControlRanking;
        v54 = [v34 objectAtIndexedSubscript:v49];
        v55 = [v34 objectAtIndexedSubscript:v49];
        v56 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v55 cookie]);
        [(NSMutableDictionary *)v53 setObject:v54 forKey:v56];

        uint64_t v49 = v50;
        BOOL v48 = (unint64_t)[v34 count] > v50++;
      }
      while (v48);
    }
    if ([v36 count])
    {
      uint64_t v57 = 0;
      unsigned int v58 = 1;
      do
      {
        unint64_t v59 = (unint64_t)[v36 count] + ~v57;
        __int16 v60 = [v36 objectAtIndexedSubscript:v57];
        unsigned int v61 = [v60 usage];

        if (v61 - 533 >= 5) {
          unsigned int v62 = 0;
        }
        else {
          unsigned int v62 = v61 - 533;
        }
        if (v61 - 528 <= 4) {
          unsigned int v63 = v61 - 528;
        }
        else {
          unsigned int v63 = v62;
        }
        uint64_t v64 = 5 * (v59 / 5) + v63;
        v65 = [v36 objectAtIndexedSubscript:v57];
        [v65 setFinalRank:v64];

        v66 = v70->_genericControlRanking;
        v67 = [v36 objectAtIndexedSubscript:v57];
        v68 = [v36 objectAtIndexedSubscript:v57];
        v69 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v68 cookie]);
        [(NSMutableDictionary *)v66 setObject:v67 forKey:v69];

        uint64_t v57 = v58;
        BOOL v48 = (unint64_t)[v36 count] > v58++;
      }
      while (v48);
    }
  }
}

- (id)getRevelantHIDElementsFromRoot
{
  CFArrayRef v2 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)&off_8BC8, 0);
  id v3 = +[NSMutableDictionary dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  CFArrayRef obj = v2;
  id v23 = [(__CFArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        uint64_t v5 = *(void *)(*((void *)&v30 + 1) + 8 * v4);
        int v6 = +[NSMutableArray array];
        [v6 addObject:v5];
        if ([v6 count])
        {
          int64_t v25 = v6;
          do
          {
            uint64_t v7 = (__IOHIDElement *)[v6 firstObject];
            [v6 removeObjectAtIndex:0];
            CFArrayRef v8 = IOHIDElementGetChildren(v7);
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v9)
            {
              id v10 = v9;
              uint64_t v11 = *(void *)v27;
              do
              {
                for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v27 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  int v13 = *(__IOHIDElement **)(*((void *)&v26 + 1) + 8 * i);
                  uint32_t Usage = IOHIDElementGetUsage(v13);
                  uint32_t UsagePage = IOHIDElementGetUsagePage(v13);
                  if (Usage < 0x21F && Usage > 0x20F && UsagePage == 65 || UsagePage == 9)
                  {
                    id v19 = +[NSNumber numberWithInt:IOHIDElementGetCookie(v13)];
                    [v3 setObject:v13 forKey:v19];
                  }
                }
                id v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v10);
            }
            int v6 = v25;
            [v25 addObjectsFromArray:v8];
          }
          while ([v25 count]);
        }

        uint64_t v4 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      id v23 = [(__CFArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  return v3;
}

- (BOOL)usage:(unsigned int)a3 isSameClassAsUsage:(unsigned int)a4 forUsagePage:(unsigned int)a5
{
  return a3 == a4
      || a5 == 9
      || a5 == 65 && (a3 - 528 <= 4 && a4 - 528 < 5 || a3 - 533 <= 4 && a4 - 533 < 5 || a3 - 540 <= 2 && a4 - 540 < 3);
}

- (id)genericControlRankComparator
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_56B4;
  v5[3] = &unk_8360;
  v5[4] = self;
  CFArrayRef v2 = objc_retainBlock(v5);
  id v3 = objc_retainBlock(v2);

  return v3;
}

- (unsigned)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(unsigned int)a3
{
  self->_vendorId = a3;
}

- (unsigned)productId
{
  return self->_productId;
}

- (void)setProductId:(unsigned int)a3
{
  self->_productId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericControlRanking, 0);
  objc_storeStrong((id *)&self->_eventLock, 0);

  objc_storeStrong((id *)&self->_enqueuedEvents, 0);
}

@end