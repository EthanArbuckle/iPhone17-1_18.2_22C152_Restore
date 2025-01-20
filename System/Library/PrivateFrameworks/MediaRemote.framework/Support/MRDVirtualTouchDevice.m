@interface MRDVirtualTouchDevice
- (BOOL)handleHIDReport:(id)a3;
- (BOOL)handleTouchEvent:(_MRHIDTouchEvent *)a3;
- (MRDVirtualTouchDevice)initWithDeviceDescriptor:(id)a3;
- (MRVirtualTouchDeviceDescriptor)deviceDescriptor;
- (__IOHIDUserDevice)ioDevice;
- (id)_newIOKitDeviceProperties;
- (id)deviceProperties;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
@end

@implementation MRDVirtualTouchDevice

- (MRDVirtualTouchDevice)initWithDeviceDescriptor:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRDVirtualTouchDevice;
  v5 = [(MRDVirtualTouchDevice *)&v15 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (MRVirtualTouchDeviceDescriptor *)[v4 copy];
  deviceDescriptor = v5->_deviceDescriptor;
  v5->_deviceDescriptor = v6;

  v5->_uniqueIdentifier = (int)(atomic_fetch_add_explicit(&dword_10047E3E4, 1u, memory_order_relaxed) + 1);
  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  activeTouchEventsForFingerIndices = v5->_activeTouchEventsForFingerIndices;
  v5->_activeTouchEventsForFingerIndices = v8;

  v10 = [(MRDVirtualTouchDevice *)v5 deviceProperties];
  uint64_t v11 = IOHIDUserDeviceCreate();
  v5->_ioDevice = (__IOHIDUserDevice *)v11;
  if (v11)
  {

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    sub_1003311D0(v13);
  }

  v12 = 0;
LABEL_8:

  return v12;
}

- (void)dealloc
{
  ioDevice = self->_ioDevice;
  if (ioDevice) {
    CFRelease(ioDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)MRDVirtualTouchDevice;
  [(MRDVirtualTouchDevice *)&v4 dealloc];
}

- (id)deviceProperties
{
  deviceProperties = self->_deviceProperties;
  if (!deviceProperties)
  {
    objc_super v4 = [(MRDVirtualTouchDevice *)self _newIOKitDeviceProperties];
    v5 = self->_deviceProperties;
    self->_deviceProperties = v4;

    deviceProperties = self->_deviceProperties;
  }

  return deviceProperties;
}

- (BOOL)handleHIDReport:(id)a3
{
  id v4 = a3;
  [v4 bytes];
  [v4 length];

  int v5 = IOHIDUserDeviceHandleReport();
  if (v5)
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t uniqueIdentifier = self->_uniqueIdentifier;
      int v9 = 134218240;
      unint64_t v10 = uniqueIdentifier;
      __int16 v11 = 1024;
      int v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Failed to handle HID report for device ID %llu. (kernel error = %d)", (uint8_t *)&v9, 0x12u);
    }
  }
  return v5 == 0;
}

- (BOOL)handleTouchEvent:(_MRHIDTouchEvent *)a3
{
  long long v5 = *(_OWORD *)&a3->var2;
  long long v17 = *(_OWORD *)&a3->var0.var0.var0;
  long long v18 = v5;
  v6 = +[NSValue valueWithMRHIDTouchEvent:&v17];
  activeTouchEventsForFingerIndices = self->_activeTouchEventsForFingerIndices;
  v8 = +[NSNumber numberWithUnsignedInt:a3->var3];
  [(NSMutableDictionary *)activeTouchEventsForFingerIndices setObject:v6 forKeyedSubscript:v8];

  *(void *)&long long v17 = 0;
  *((void *)&v17 + 1) = &v17;
  *(void *)&long long v18 = 0x3010000000;
  *((void *)&v18 + 1) = &unk_1003BC3BE;
  memset(v19, 0, sizeof(v19));
  v19[12] = a3->var1 == 5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  int v9 = self->_activeTouchEventsForFingerIndices;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001571DC;
  v14[3] = &unk_10041ECB8;
  v14[4] = &v17;
  v14[5] = v15;
  [(NSMutableDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v14];
  if (a3->var1 - 1 >= 3)
  {
    unint64_t v10 = self->_activeTouchEventsForFingerIndices;
    __int16 v11 = +[NSNumber numberWithUnsignedInt:a3->var3];
    [(NSMutableDictionary *)v10 removeObjectForKey:v11];
  }
  BOOL v12 = IOHIDUserDeviceHandleReportWithTimeStamp(self->_ioDevice, a3->var2, (const uint8_t *)(*((void *)&v17 + 1) + 32), 13) == 0;
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)_newIOKitDeviceProperties
{
  [(MRVirtualTouchDeviceDescriptor *)self->_deviceDescriptor screenSize];
  LODWORD(v18) = -1073638137;
  long long v15 = xmmword_1003C5580;
  long long v16 = unk_1003C5590;
  long long v17 = xmmword_1003C55A0;
  long long v11 = xmmword_1003C5540;
  long long v12 = unk_1003C5550;
  long long v13 = xmmword_1003C5560;
  long long v14 = unk_1003C5570;
  long long v9 = xmmword_1003C5520;
  long long v10 = unk_1003C5530;
  HIBYTE(v11) = (int)v3;
  LOBYTE(v12) = (unsigned __int16)(int)v3 >> 8;
  HIWORD(v15) = (int)v3;
  WORD6(v12) = (int)v4;
  *(_WORD *)((char *)&v16 + 11) = WORD6(v12);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [objc_alloc((Class)NSData) initWithBytes:&v9 length:148];
  objc_msgSend(v5, "setObject:forKey:", v6, @"ReportDescriptor", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  v7 = +[NSNumber numberWithBool:[(MRVirtualTouchDeviceDescriptor *)self->_deviceDescriptor isIntegratedDisplay]];
  [v5 setObject:v7 forKey:@"DisplayIntegrated"];

  [v5 setObject:&off_1004382F8 forKey:@"ProductID"];
  [v5 setObject:&off_100438310 forKey:@"VendorID"];

  return v5;
}

- (MRVirtualTouchDeviceDescriptor)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (__IOHIDUserDevice)ioDevice
{
  return self->_ioDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDescriptor, 0);
  objc_storeStrong((id *)&self->_activeTouchEventsForFingerIndices, 0);

  objc_storeStrong((id *)&self->_deviceProperties, 0);
}

@end