@interface PTPRemoteCameraDeviceManager
- (BOOL)startUSBPTPInterfaceNotifications;
- (PTPRemoteCameraDeviceManager)init;
- (id)uuidStringForDeviceProperties:(id)a3;
- (void)dealloc;
- (void)immediateMatch;
@end

@implementation PTPRemoteCameraDeviceManager

- (PTPRemoteCameraDeviceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PTPRemoteCameraDeviceManager;
  v2 = [(ICRemoteCameraDeviceManager *)&v8 initManaging:@"PTPCameraDevice" systemDaemon:1];
  v3 = v2;
  if (v2)
  {
    p_notifyPort = &v2->_deviceMatchingInfo.notifyPort;
    v2->_deviceMatchingInfo.notifyPort = 0;
    *(void *)&v2->_deviceMatchingInfo.ptpNotifyIterator = 0;
    v2->_deviceMatchingInfo.notifyPort = IONotificationPortCreate(kIOMainPortDefault);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPort);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PTPRemoteCameraDeviceManager;
  [(ICRemoteCameraDeviceManager *)&v2 dealloc];
}

- (BOOL)startUSBPTPInterfaceNotifications
{
  kern_return_t v7;
  __CFDictionary *v8;
  io_object_t v9;
  io_object_t ptpDeathIterator;
  io_object_t ptpNotifyIterator;
  io_iterator_t v12;
  io_iterator_t notification[2];

  p_deviceMatchingInfo = &self->_deviceMatchingInfo;
  if (self->_deviceMatchingInfo.ptpNotifyIterator) {
    return 1;
  }
  *(void *)notification = 0;
  CFMutableDictionaryRef v5 = IOServiceMatching("IOUSBInterface");
  if (!v5) {
    return 0;
  }
  v6 = v5;
  [(__CFDictionary *)v6 setObject:&off_100054F90 forKeyedSubscript:@"bInterfaceClass"];
  [(__CFDictionary *)v6 setObject:&off_100054FA8 forKeyedSubscript:@"bInterfaceSubClass"];
  [(__CFDictionary *)v6 setObject:&off_100054FA8 forKeyedSubscript:@"bInterfaceProtocol"];
  v7 = IOServiceAddMatchingNotification(p_deviceMatchingInfo->notifyPort, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)sub_1000298E4, self, &notification[1]);

  if (v7)
  {
    BOOL v3 = 0;
    objc_super v8 = 0;
  }
  else
  {
    objc_super v8 = IOServiceMatching("IOUSBInterface");
    [(__CFDictionary *)v8 setObject:&off_100054F90 forKeyedSubscript:@"bInterfaceClass"];
    [(__CFDictionary *)v8 setObject:&off_100054FA8 forKeyedSubscript:@"bInterfaceSubClass"];
    [(__CFDictionary *)v8 setObject:&off_100054FA8 forKeyedSubscript:@"bInterfaceProtocol"];
    if (IOServiceAddMatchingNotification(p_deviceMatchingInfo->notifyPort, "IOServiceTerminate", v8, (IOServiceMatchingCallback)sub_100029AC0, self, notification))
    {
      BOOL v3 = 0;
    }
    else
    {
      while (1)
      {
        v9 = IOIteratorNext(notification[0]);
        if (!v9) {
          break;
        }
        IOObjectRelease(v9);
      }
      ptpDeathIterator = p_deviceMatchingInfo->ptpDeathIterator;
      if (ptpDeathIterator) {
        IOObjectRelease(ptpDeathIterator);
      }
      p_deviceMatchingInfo->ptpDeathIterator = notification[0];
      ptpNotifyIterator = p_deviceMatchingInfo->ptpNotifyIterator;
      if (ptpNotifyIterator) {
        IOObjectRelease(ptpNotifyIterator);
      }
      v12 = notification[1];
      p_deviceMatchingInfo->ptpNotifyIterator = notification[1];
      sub_1000298E4(self, v12);
      [(PTPRemoteCameraDeviceManager *)self immediateMatch];
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (void)immediateMatch
{
  io_iterator_t existing = 0;
  CFDictionaryRef v3 = IOServiceMatching("IOUSBInterface");
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if (MatchingServices)
  {
    uint64_t v5 = MatchingServices;
    __ICOSLogCreate();
    v6 = @"usb";
    if ((unint64_t)[@"usb" length] >= 0x15)
    {
      v7 = [@"usb" substringWithRange:0, 18];
      v6 = [v7 stringByAppendingString:@".."];
    }
    objc_super v8 = +[NSString stringWithFormat:@"IOServiceGetMatchingServices returned: %x", v5];
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6;
      v11 = v9;
      id v12 = [(__CFString *)v10 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v12;
      __int16 v33 = 2114;
      v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    io_object_t v13 = IOIteratorNext(existing);
    if (v13)
    {
      io_registry_entry_t v14 = v13;
      do
      {
        *(void *)buf = 0;
        if (!IORegistryEntryCreateCFProperties(v14, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0))
        {
          v15 = *(void **)buf;
          v16 = [*(id *)buf objectForKey:@"bInterfaceClass"];
          unsigned int v17 = [v16 unsignedCharValue];

          v18 = [v15 objectForKey:@"bInterfaceSubClass"];
          unsigned int v19 = [v18 unsignedCharValue];

          v20 = [v15 objectForKey:@"bInterfaceProtocol"];
          unsigned int v21 = [v20 unsignedCharValue];

          if (v17 == 6 && v19 == 1 && v21 == 1)
          {
            v22 = [v15 objectForKey:@"locationID"];
            io_registry_entry_t parent = 0;
            v23 = +[NSUUID UUID];
            v24 = [v23 UUIDString];

            if (!IORegistryEntryGetParentEntry(v14, "IOService", &parent))
            {
              if (parent)
              {
                CFMutableDictionaryRef properties = 0;
                if (!IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0))
                {
                  CFMutableDictionaryRef v25 = properties;
                  uint64_t v26 = [(PTPRemoteCameraDeviceManager *)self uuidStringForDeviceProperties:properties];

                  v24 = (void *)v26;
                }
              }
            }
            v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v22 unsignedIntegerValue]);
            v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"LOC:%lu", [v22 unsignedIntegerValue]);
            [(ICRemoteCameraDeviceManager *)self notifyClientDeviceAdded:v27 uuidString:v24 deviceName:v28];
          }
        }
        IOObjectRelease(v14);
        io_registry_entry_t v14 = IOIteratorNext(existing);
      }
      while (v14);
    }
    IOObjectRelease(existing);
  }
}

- (id)uuidStringForDeviceProperties:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"USB Serial Number"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"idVendor"];
  id v6 = [v5 unsignedShortValue];

  v7 = [v3 objectForKeyedSubscript:@"idProduct"];

  id v8 = [v7 unsignedShortValue];
  if ([v4 length] == (id)24 && v6 == 1452)
  {
    v9 = [v4 substringWithRange:0, 8];
    v10 = [v4 substringFromIndex:9];
    uint64_t v11 = +[NSString stringWithFormat:@"%@-%@", v9, v10];

    v4 = (void *)v11;
  }
  if (!v4)
  {
    CFUUIDRef v32 = CFUUIDCreateWithBytes(kCFAllocatorDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, BYTE1(v6), (UInt8)v6, BYTE1(v8), (UInt8)v8);
    if (v32)
    {
      CFUUIDRef v33 = v32;
      id v12 = (void *)CFUUIDCreateString(kCFAllocatorDefault, v32);
      CFRelease(v33);
    }
    else
    {
      id v12 = 0;
    }
    __ICOSLogCreate();
    v34 = @"UUID Gen";
    if ((unint64_t)[@"UUID Gen" length] >= 0x15)
    {
      v35 = [@"UUID Gen" substringWithRange:0, 18];
      v34 = [v35 stringByAppendingString:@".."];
    }
    v36 = +[NSString stringWithFormat:@"Device Serial Missing: %d/%d, Setting: %@", v6, v8, v12];
    v37 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033E74(v34, v37);
    }

LABEL_22:
    if (v12) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  __src[0] = 0;
  __src[1] = 0;
  unint64_t v44 = 0;
  id v12 = 0;
  if (![v4 getBytes:__src maxLength:16 usedLength:&v44 encoding:[v4 smallestEncoding] options:1 range:[v4 length] remainingRange:0])goto LABEL_22; {
  UInt8 byte15 = 0;
  }
  UInt8 v14 = 0;
  UInt8 v15 = 0;
  UInt8 v16 = 0;
  UInt8 v17 = 0;
  UInt8 v18 = 0;
  UInt8 v19 = 0;
  UInt8 v20 = 0;
  UInt8 byte7 = 0;
  UInt8 v22 = 0;
  UInt8 v23 = 0;
  UInt8 v24 = 0;
  UInt8 v25 = 0;
  UInt8 v26 = 0;
  UInt8 v27 = 0;
  UInt8 v28 = 0;
  *(void *)byte6 = 0;
  uint64_t v46 = 0;
  if (v44 >= 0x10) {
    int v29 = 0;
  }
  else {
    int v29 = 16 - v44;
  }
  if (v29 <= 15)
  {
    memcpy(&byte6[v29], __src, (15 - v29) + 1);
    UInt8 v28 = byte6[0];
    UInt8 v27 = byte6[1];
    UInt8 v26 = byte6[2];
    UInt8 v25 = byte6[3];
    UInt8 v24 = byte6[4];
    UInt8 v23 = byte6[5];
    UInt8 v22 = byte6[6];
    UInt8 byte7 = byte6[7];
    UInt8 v20 = v46;
    UInt8 v19 = BYTE1(v46);
    UInt8 v18 = BYTE2(v46);
    UInt8 v17 = BYTE3(v46);
    UInt8 v16 = BYTE4(v46);
    UInt8 v15 = BYTE5(v46);
    UInt8 v14 = BYTE6(v46);
    UInt8 byte15 = HIBYTE(v46);
  }
  CFUUIDRef v30 = CFUUIDCreateWithBytes(kCFAllocatorDefault, v28, v27, v26, v25, v24, v23, v22, byte7, v20, v19, v18, v17, v16, v15, v14, byte15);
  if (!v30 || (v31 = v30, id v12 = (void *)CFUUIDCreateString(kCFAllocatorDefault, v30), CFRelease(v31), !v12))
  {
LABEL_23:
    v38 = +[NSUUID UUID];
    id v12 = [v38 UUIDString];

    __ICOSLogCreate();
    v39 = @"UUID Gen";
    if ((unint64_t)[@"UUID Gen" length] >= 0x15)
    {
      v40 = [@"UUID Gen" substringWithRange:0, 18];
      v39 = [v40 stringByAppendingString:@".."];
    }
    v41 = +[NSString stringWithFormat:@"UUID Generation failed: %@/%d/%d, Setting: %@", v4, v6, v8, v12];
    v42 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033E74(v39, v42);
    }
  }
LABEL_28:

  return v12;
}

@end