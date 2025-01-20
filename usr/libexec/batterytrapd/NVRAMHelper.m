@interface NVRAMHelper
- (BOOL)hasALPMClock;
- (BOOL)syncNVRAM;
- (BOOL)writeNVRAM:(id)a3 :(id)a4;
- (NVRAMHelper)init;
- (NVRAMHelper)initWithLog:(id)a3;
- (id)readNVRAM:(id)a3;
- (unsigned)createOptionsRef;
- (void)dealloc;
- (void)releaseOptionsRef:(unsigned int)a3;
@end

@implementation NVRAMHelper

- (id)readNVRAM:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(self->optionsRef, v4, kCFAllocatorDefault, 0);
    CFDataRef v6 = CFProperty;
    if (!CFProperty) {
      goto LABEL_8;
    }
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFDataGetTypeID())
    {
      CFDataRef v6 = +[NSString stringWithUTF8String:CFDataGetBytePtr(v6)];
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
  {
    sub_100002304();
  }
  CFDataRef v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)writeNVRAM:(id)a3 :(id)a4
{
  kern_return_t v12;
  int v13;
  OS_os_log *v14;
  BOOL v15;
  int v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  CFDataRef v6 = (__CFString *)a3;
  id v7 = a4;
  v8 = [(NVRAMHelper *)self readNVRAM:v6];
  unsigned int v9 = [v8 isEqualToString:v7];
  logs = self->logs;
  BOOL v11 = os_log_type_enabled((os_log_t)logs, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      v17 = 138412802;
      v18 = v6;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)logs, OS_LOG_TYPE_DEBUG, "Current value of variable %@ is the same (%@) as the value passed in (%@). Skipping write.", (uint8_t *)&v17, 0x20u);
    }
LABEL_10:
    v15 = 1;
    goto LABEL_11;
  }
  if (v11)
  {
    v17 = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)logs, OS_LOG_TYPE_DEBUG, "Updating %@ from value %@ to value %@", (uint8_t *)&v17, 0x20u);
  }
  v12 = IORegistryEntrySetCFProperty(self->optionsRef, v6, [v7 dataUsingEncoding:4]);
  if (!v12) {
    goto LABEL_10;
  }
  v13 = v12;
  v14 = self->logs;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
    sub_100002338((uint64_t)v6, v13, (os_log_t)v14);
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)syncNVRAM
{
  kern_return_t v3;

  v3 = IORegistryEntrySetCFProperty(self->optionsRef, @"IONVRAM-SYNCNOW-PROPERTY", @"IONVRAM-SYNCNOW-PROPERTY");
  if (v3 && os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR)) {
    sub_1000023C0();
  }
  return v3 == 0;
}

- (unsigned)createOptionsRef
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v3 && os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR)) {
    sub_1000023F4();
  }
  return v3;
}

- (void)releaseOptionsRef:(unsigned int)a3
{
  if (a3) {
    IOObjectRelease(a3);
  }
}

- (BOOL)hasALPMClock
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/product");
  if (v3)
  {
    io_object_t v4 = v3;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"lpm-clock", 0, 0);
    if (CFProperty)
    {
      CFDataRef v6 = CFProperty;
      CFTypeID v7 = CFGetTypeID(CFProperty);
      if (v7 == CFDataGetTypeID())
      {
        CFDataGetBytePtr(v6);
        CFDataGetLength(v6);
        __memcpy_chk();
        byte_100008540 = 0;
      }
      else if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
      {
        sub_10000249C();
      }
      IOObjectRelease(v4);
      CFRelease(v6);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG)) {
        sub_10000245C();
      }
      IOObjectRelease(v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
  {
    sub_100002428();
  }
  return byte_100008540;
}

- (NVRAMHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)NVRAMHelper;
  v2 = [(NVRAMHelper *)&v5 init];
  io_registry_entry_t v3 = v2;
  if (v2) {
    v2->optionsRef = [(NVRAMHelper *)v2 createOptionsRef];
  }
  return v3;
}

- (NVRAMHelper)initWithLog:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NVRAMHelper;
  objc_super v5 = [(NVRAMHelper *)&v9 init];
  CFDataRef v6 = v5;
  if (v5)
  {
    v5->optionsRef = [(NVRAMHelper *)v5 createOptionsRef];
    if (v4) {
      CFTypeID v7 = v4;
    }
    else {
      CFTypeID v7 = &_os_log_default;
    }
    objc_storeStrong((id *)&v6->logs, v7);
  }

  return v6;
}

- (void)dealloc
{
  [(NVRAMHelper *)self releaseOptionsRef:self->optionsRef];
  v3.receiver = self;
  v3.super_class = (Class)NVRAMHelper;
  [(NVRAMHelper *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end