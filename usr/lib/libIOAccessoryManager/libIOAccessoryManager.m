uint64_t IOAccessoryManagerGetServiceWithPrimaryPort(int a1)
{
  __CFDictionary *v1;
  CFAllocatorRef v2;
  CFDictionaryRef v3;
  void *values;
  void *keys;
  int valuePtr;

  valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryManager");
  keys = @"IOAccessoryPrimaryDevicePort";
  v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  v3 = CFDictionaryCreate(v2, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v1);
}

uint64_t IOAccessoryManagerGetServiceWithSupportedFeature(const char *a1)
{
  v2 = IOServiceMatching("IOAccessoryManager");
  keys = @"FeaturesSupported";
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef cf = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, 0x8000100u);
  CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)&keys, &cf, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v2, @"IOPropertyExistsMatch", v4);
  CFRelease(v4);
  CFRelease(keys);
  CFRelease(cf);
  return IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
}

CFNumberRef IOAccessoryManagerGetPrimaryPort(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryPrimaryDevicePort", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef IOAccessoryManagerGetType(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryManagerType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

uint64_t IOAccessoryManagerGetUpstreamService(uint64_t a1)
{
  kern_return_t ParentEntry;
  kern_return_t v4;
  io_registry_entry_t v6;
  io_registry_entry_t parent;

  IOObjectRetain(a1);
  uint64_t v2 = a1;
  while (!IORegistryEntryInPlane(v2, "IOAccessory"))
  {
    parent = -1431655766;
    ParentEntry = IORegistryEntryGetParentEntry(v2, "IOService", &parent);
    IOObjectRelease(v2);
    uint64_t v2 = parent;
    if (ParentEntry) {
      return 0;
    }
  }
  while (v2 == a1 || !IOObjectConformsTo(v2, "IOAccessoryManager"))
  {
    v6 = -1431655766;
    CFDictionaryRef v4 = IORegistryEntryGetParentEntry(v2, "IOAccessory", &v6);
    IOObjectRelease(v2);
    uint64_t v2 = v6;
    if (v4) {
      return 0;
    }
  }
  return v2;
}

uint64_t IOAccessoryManagerGetUpstreamPrimaryPort(uint64_t a1)
{
  uint64_t result = IOAccessoryManagerGetUpstreamService(a1);
  if (result)
  {
    io_object_t v2 = result;
    CFNumberRef PrimaryPort = IOAccessoryManagerGetPrimaryPort(result);
    IOObjectRelease(v2);
    return (uint64_t)PrimaryPort;
  }
  return result;
}

uint64_t IOAccessoryManagerGetAccessoryID(io_registry_entry_t a1)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t result = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  if (CFProperty)
  {
    if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = -1;
    }
    CFRelease(CFProperty);
    return valuePtr;
  }
  return result;
}

CFTypeRef IOAccessoryManagerCopyAccessoryDeviceUID(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"IOAccessoryManagerAccessoryDeviceUID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t IOAccessoryManagerGetDigitalID(io_registry_entry_t a1, UInt8 *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryDigitalID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v8 = CFProperty;
    v10.location = 0;
    v10.length = 6;
    CFDataGetBytes(CFProperty, v10, a2);
    uint64_t v6 = 0;
LABEL_7:
    CFRelease(v8);
    return v6;
  }
  uint64_t v6 = 3758097095;
  if ((IOAccessoryManagerGetType(a1) & 0xF) != 0)
  {
    CFDataRef v7 = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryDetect", v4, 0);
    CFDataRef v8 = v7;
    uint64_t v6 = v7 == (const __CFData *)*MEMORY[0x263EFFB40] ? 3758097112 : 3758097113;
    if (v7) {
      goto LABEL_7;
    }
  }
  return v6;
}

uint64_t IOAccesoryManagerGetDigitalIDInterfaceDeviceInfo(io_registry_entry_t a1, UInt8 *a2)
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryInterfaceDeviceInfo", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v5 = CFProperty;
    v10.location = 0;
    v10.length = 4;
    CFDataGetBytes(CFProperty, v10, a2);
    CFRelease(v5);
    return 0;
  }
  else
  {
    __int16 v9 = -21846;
    int v8 = -1431655766;
    LODWORD(result) = IOAccessoryManagerGetDigitalID(a1, (UInt8 *)&v8);
    if (v8 >= 0x40u) {
      unsigned int v7 = -536870194;
    }
    else {
      unsigned int v7 = -536870160;
    }
    if (result) {
      return result;
    }
    else {
      return v7;
    }
  }
}

uint64_t checkIDBusAvailable(io_registry_entry_t a1, int a2)
{
  __int16 v5 = -21846;
  int v4 = -1431655766;
  uint64_t result = IOAccessoryManagerGetDigitalID(a1, (UInt8 *)&v4);
  if (!result)
  {
    uint64_t result = 3758097102;
    if (v4 <= 0x3Fu)
    {
      if (a2 && (v4 & 0x300) == 0) {
        return 3758097126;
      }
      else {
        return 3758097136;
      }
    }
  }
  return result;
}

uint64_t IOAccesoryManagerGetDigitalIDAccessoryVersionInfo(io_registry_entry_t a1, UInt8 *a2)
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryAccessoryVersionInfo", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDataRef v5 = CFProperty;
    v8.location = 0;
    v8.length = 6;
    CFDataGetBytes(CFProperty, v8, a2);
    CFRelease(v5);
    return 0;
  }
  else
  {
    return checkIDBusAvailable(a1, 1);
  }
}

uint64_t IOAccessoryManagerCopyDeviceInfo(io_registry_entry_t entry, int a2, void *a3)
{
  int v3 = a2 - 1;
  int v6 = 0;
  CFStringRef v7 = @"IOAccessoryInterfaceDeviceSerialNumber";
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      int v6 = 0;
      CFStringRef v7 = @"IOAccessoryInterfaceModuleSerialNumber";
      goto LABEL_11;
    case 2:
      int v6 = 0;
      CFStringRef v7 = @"IOAccessoryAccessorySerialNumber";
      goto LABEL_11;
    case 3:
      int v6 = 1;
      CFStringRef v7 = @"IOAccessoryAccessoryManufacturer";
      goto LABEL_11;
    case 4:
      int v6 = 1;
      CFStringRef v7 = @"IOAccessoryAccessoryName";
      goto LABEL_11;
    case 5:
      int v6 = 1;
      CFStringRef v7 = @"IOAccessoryAccessoryModelNumber";
      goto LABEL_11;
    case 6:
      int v6 = 1;
      CFStringRef v7 = @"IOAccessoryAccessoryFirmwareVersion";
      goto LABEL_11;
    case 7:
      int v6 = 1;
      CFStringRef v7 = @"IOAccessoryAccessoryHardwareVersion";
      goto LABEL_11;
    case 8:
      int v6 = 1;
      CFStringRef v7 = @"IOAccessoryAccessoryPPID";
LABEL_11:
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, v7, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (CFProperty)
      {
        CFTypeRef v10 = CFProperty;
        uint64_t result = 0;
        *a3 = v10;
      }
      else
      {
        uint64_t result = checkIDBusAvailable(entry, v6);
      }
      break;
    default:
      uint64_t result = 3758097090;
      break;
  }
  return result;
}

CFNumberRef IOAccessoryManagerGetPowerMode(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryPowerMode", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef IOAccessoryManagerGetActivePowerMode(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryActivePowerMode", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef IOAccessoryManagerGetSleepPowerCurrentLimit(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessorySleepPowerCurrentLimit", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (result)
  {
    CFNumberRef v2 = result;
    unsigned int valuePtr = -1431655766;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

BOOL IOAccessoryManagerGetPowerDuringSleep(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"IOAccessoryManagerSleepPower", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFTypeRef v2 = CFProperty;
  CFTypeRef v3 = (CFTypeRef)*MEMORY[0x263EFFB40];
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 == v3;
}

uint64_t IOAccessoryManagerGetUSBConnectType(io_registry_entry_t a1, int *a2, BOOL *a3)
{
  CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!v5)
  {
    if (a2)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"IOAccessoryUSBConnectType");
      int valuePtr = -1431655766;
      if (Value)
      {
        int v7 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        int v8 = valuePtr;
        if (!v7) {
          int v8 = -1;
        }
      }
      else
      {
        int v8 = -1;
      }
      *a2 = v8;
    }
    if (a3) {
      *a3 = CFDictionaryGetValue(properties, @"IOAccessoryUSBActive") == (const void *)*MEMORY[0x263EFFB40];
    }
    CFRelease(properties);
  }
  return v5;
}

uint64_t IOAccessoryManagerGetUSBConnectTypePublished(io_registry_entry_t a1, int *a2, BOOL *a3)
{
  CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!v5)
  {
    if (a2)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"IOAccessoryUSBConnectTypePublished");
      int valuePtr = -1431655766;
      if (Value)
      {
        int v7 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        int v8 = valuePtr;
        if (!v7) {
          int v8 = -1;
        }
      }
      else
      {
        int v8 = -1;
      }
      *a2 = v8;
    }
    if (a3) {
      *a3 = CFDictionaryGetValue(properties, @"IOAccessoryUSBActive") == (const void *)*MEMORY[0x263EFFB40];
    }
    CFRelease(properties);
  }
  return v5;
}

uint64_t IOAccessoryManagerGetUSBChargingVoltage(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v3 = 3758097113;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryUSBChargingVoltage", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0;
    }
    else {
      *a2 = 0;
    }
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v3 = 3758097113;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryUSBCurrentLimit", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0;
    }
    else {
      *a2 = 0;
    }
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitBase(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerRestoreUSBCurrentLimitBase(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 4u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitBase(io_registry_entry_t a1, void *a2)
{
  uint64_t v3 = 3758097113;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryUSBCurrentLimitBase", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 3758097113;
    }
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentOffset(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitOffset(io_registry_entry_t a1, void *a2)
{
  uint64_t v3 = 3758097136;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryUSBCurrentLimitOffset", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 3758097136;
    }
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitMaximum(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 6u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerClearUSBCurrentLimitMaximum(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitMaximum(io_registry_entry_t a1, void *a2)
{
  uint64_t v3 = 3758097136;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryUSBCurrentLimitMaximum", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 3758097136;
    }
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerConfigurePower(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerConfigurePowerLowVoltageSelect(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x11u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetPowerDuringSleep(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerRequestAccessoryPowerOff(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0x12u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerRevokeFeatures(mach_port_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = 0;
  input[1] = a2;
  return IOConnectCallScalarMethod(a1, 0xDu, input, 2u, 0, 0);
}

uint64_t IOAccessoryManagerAllowFeatures(mach_port_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = 0;
  return IOConnectCallScalarMethod(a1, 0xDu, input, 2u, 0, 0);
}

uint64_t IOAccessoryManagerRevokeHighCurrentPower(mach_port_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  long long v2 = xmmword_2180E3A30;
  return IOConnectCallScalarMethod(a1, 0xDu, (const uint64_t *)&v2, 2u, 0, 0);
}

uint64_t IOAccessoryManagerConfigureUSBMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerEnableUSBHostMode(mach_port_t a1, int a2)
{
  uint64_t input = 2 * (a2 != 0);
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetBatteryPackMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetGoldbondMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x13u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerConfigureGoldbondMode(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 0x14u, input, 2u, 0, 0);
}

BOOL IOAccessoryManagerGetBatteryPackMode(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"IOAccessoryBatteryPack", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFTypeRef v2 = CFProperty;
  CFTypeRef v3 = (CFTypeRef)*MEMORY[0x263EFFB40];
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 == v3;
}

uint64_t IOAccessoryManagerSetUSBPowerIgnore(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xFu, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetUSBPreventSourceDetection(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x1Au, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetAttachStyle(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDetect(mach_port_t a1, unsigned int a2, int a3)
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = 1;
  v4[1] = a2;
  v4[2] = a3;
  return IOConnectCallScalarMethod(a1, 0xAu, v4, 3u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDigitalID(mach_port_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(a1, 0xBu, inputStruct, 6uLL, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDPDNConfig(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  input[4] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  input[2] = 0;
  uint64_t input[3] = 0;
  return IOConnectCallScalarMethod(a1, 0xEu, input, 4u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDPDNBTConfig(mach_port_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  input[4] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  uint64_t input[3] = a5;
  return IOConnectCallScalarMethod(a1, 0xEu, input, 4u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDetectClear(mach_port_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  long long v2 = xmmword_2180E3A90;
  uint64_t v3 = -1;
  return IOConnectCallScalarMethod(a1, 0xAu, (const uint64_t *)&v2, 3u, 0, 0);
}

uint64_t IOAccessoryManagerCheckPinVoltage(mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t *output)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x10u, input, 2u, output, &outputCnt);
}

uint64_t IOAccessoryManagerSelectEisPin(mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t *output)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x1Bu, input, 2u, output, &outputCnt);
}

uint64_t IOAccessoryManagerGetFreePinMask(mach_port_t a1, uint64_t *output)
{
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x1Cu, 0, 0, output, &outputCnt);
}

uint64_t IOAccessoryManagerLDCMGetAvailablePins(mach_port_t a1, uint64_t *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t output = 0;
  uint64_t v9 = 0;
  uint32_t outputCnt = 2;
  uint64_t result = IOConnectCallScalarMethod(a1, 0x1Du, 0, 0, &output, &outputCnt);
  if (!result)
  {
    uint64_t v6 = v9;
    *a2 = output;
    *a3 = v6;
  }
  return result;
}

uint64_t IOAccessoryManagerSetLDCM(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, void *a5)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t output = 0;
  uint64_t v11 = 0;
  uint32_t outputCnt = 2;
  uint64_t result = IOConnectCallScalarMethod(a1, 0x1Eu, input, 2u, &output, &outputCnt);
  if (!result)
  {
    uint64_t v8 = v11;
    *a4 = output;
    *a5 = v8;
  }
  return result;
}

uint64_t IOAccessoryManagerLDCMSetLiquidDetected(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x1Fu, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerLDCMEnableMitigations(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x20u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerLDCMEnableUserOverride(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x21u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerLDCMGetMeasurementStatus(mach_port_t a1, uint64_t *output)
{
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x22u, 0, 0, output, &outputCnt);
}

uint64_t IOAccessoryManagerLDCMSetState(mach_port_t a1, uint64_t *input)
{
  return IOConnectCallScalarMethod(a1, 0x23u, input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerApplyMGIDWorkaround(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0x24u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerForcePowerGateEnable(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x25u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerForceUSBConnectActive(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 2u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerPowerModeIsSupported(io_registry_entry_t a1, int a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"IOAccessorySupportedPowerModes", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty) {
    return 0;
  }
  CFArrayRef v5 = CFProperty;
  int valuePtr = a2;
  CFNumberRef v6 = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  v10.length = CFArrayGetCount(v5);
  v10.location = 0;
  uint64_t v7 = CFArrayContainsValue(v5, v10, v6);
  CFRelease(v6);
  CFRelease(v5);
  return v7;
}

CFArrayRef IOAccessoryManagerPowerModeCurrentLimit(io_registry_entry_t a1, int a2)
{
  CFArrayRef result = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryPowerCurrentLimits", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFArrayRef v4 = result;
    if (a2)
    {
      CFIndex v5 = (a2 - 1);
      if (CFArrayGetCount(result) > v5)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v4, v5);
        if (ValueAtIndex) {
          CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
        }
      }
    }
    CFRelease(v4);
    return (const __CFArray *)valuePtr;
  }
  return result;
}

uint64_t IOAccessoryManagerSetAccessoryUsedCurrent()
{
  return 0;
}

uint64_t IOAccessoryManagerSetAccessoryRequestedCurrent()
{
  return 0;
}

uint64_t IOAccessoryManagerPowerDuringSleepIsSupported(io_registry_entry_t a1)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryManagerSleepPower", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (result)
  {
    CFRelease((CFTypeRef)result);
    return 1;
  }
  return result;
}

uint64_t IOAccessoryManagerRequestLdcmMeasurement(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0x15u, v3, 1u, 0, 0);
}

uint64_t IOAccessoryManagerGetLdcmParams(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt = 126;
  return IOConnectCallStructMethod(a1, 0x16u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t IOAccessoryManagerSetVoltageDetected(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0x17u, v3, 1u, 0, 0);
}

uint64_t IOAccessoryManagerChallengeCryptoDock9Pin(mach_port_t a1, int a2, void *inputStruct, void *outputStruct)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a2;
  uint32_t outputCnt = 0;
  size_t v5 = 16;
  return IOConnectCallMethod(a1, 0x18u, input, 1u, inputStruct, 8uLL, 0, &outputCnt, outputStruct, &v5);
}

uint64_t IOAccessoryManagerChallengeCryptoDock(mach_port_t a1, int a2, void *inputStruct, uint64_t a4, void *outputStruct, uint64_t a6, uint64_t *a7)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a4;
  uint64_t input[2] = a6;
  uint32_t outputCnt = 1;
  size_t v8 = 16;
  return IOConnectCallMethod(a1, 0x19u, input, 3u, inputStruct, 0xFuLL, a7, &outputCnt, outputStruct, &v8);
}

uint64_t IOAccessoryManagerChallengeCryptoLength(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    io_object_t AuthCP = __findAuthCP();
    if (AuthCP)
    {
      io_object_t v6 = AuthCP;
      uint64_t v7 = 64;
      uint64_t v8 = 32;
    }
    else
    {
      ServiceWithCFNumberRef PrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1);
      if (!ServiceWithPrimaryPort) {
        return 3758097084;
      }
      io_object_t v6 = ServiceWithPrimaryPort;
      BOOLean_t v10 = IOObjectConformsTo(ServiceWithPrimaryPort, "IOAccessoryDock9Pin");
      uint64_t v8 = 15;
      if (v10) {
        uint64_t v8 = 8;
      }
      uint64_t v7 = 16;
    }
    *a1 = v8;
    *a2 = v7;
    IOObjectRelease(v6);
    return 0;
  }
  return result;
}

uint64_t __findAuthCP()
{
  *(void *)existing = 0;
  CFDictionaryRef v0 = IOServiceMatching("AppleAuthCP");
  if (v0)
  {
    if (!IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v0, &existing[1]) && existing[1] != 0)
    {
      uint64_t v2 = IOIteratorNext(existing[1]);
      if (v2)
      {
        uint64_t v3 = v2;
        CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        do
        {
          CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"flags", v4, 0);
          if (CFProperty)
          {
            CFNumberRef v6 = CFProperty;
            if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, existing) && BYTE2(existing[0]) << 16 == 0x40000)
            {
              CFRelease(v6);
              IOObjectRelease(existing[1]);
              uint64_t v8 = 0;
              IORegistryEntryGetRegistryEntryID(v3, &v8);
              return v3;
            }
            CFRelease(v6);
          }
          else
          {
            puts("numberref is NULL");
          }
          IOObjectRelease(v3);
          uint64_t v3 = IOIteratorNext(existing[1]);
        }
        while (v3);
      }
      IOObjectRelease(existing[1]);
    }
  }
  return 0;
}

uint64_t IOAccessoryManagerChallengeCryptoMLBChip4(const void *a1, uint64_t a2, UInt8 **a3, CFIndex *a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  io_connect_t connect = 0;
  CFDataRef theData = 0;
  *(_OWORD *)md = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v36 = 0u;
  if (!a1 || (CC_LONG v4 = a2, !a2))
  {
    uint64_t v6 = 3758097085;
    v30 = "invalid inCmd";
LABEL_38:
    puts(v30);
    CFDataRef v26 = 0;
    goto LABEL_30;
  }
  uint64_t v6 = 3758097085;
  if (!a3 || !a4)
  {
    v30 = "invalid outRsp";
    goto LABEL_38;
  }
  io_service_t AuthCP = __findAuthCP();
  if (!AuthCP)
  {
    CFDataRef v26 = 0;
    uint64_t v6 = 3758097084;
    goto LABEL_30;
  }
  io_object_t v10 = AuthCP;
  uint64_t v11 = IOServiceOpen(AuthCP, *MEMORY[0x263EF8960], 0, &connect);
  if (v11)
  {
    uint64_t v31 = v11;
    printf("IOServiceOpen failed: 0x%x\n", v11);
    CFDataRef v26 = 0;
    CFDataRef v13 = 0;
  }
  else
  {
    CC_SHA256(a1, v4, md);
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], md, 32);
    if (!v13)
    {
      v32 = "CFDataCreate failed";
LABEL_45:
      puts(v32);
      CFDataRef v26 = 0;
      goto LABEL_25;
    }
    uint64_t v14 = _cpCreateSignature(connect, v13, &theData);
    if (!v14)
    {
      CFDataRef v15 = theData;
      if (theData)
      {
        if (CFDataGetLength(theData) == 64)
        {
          v50.location = 0;
          v50.length = 64;
          CFDataGetBytes(v15, v50, buffer);
          int v16 = (char)v37;
          if ((v37 & 0x80u) == 0) {
            char v17 = 32;
          }
          else {
            char v17 = 33;
          }
          *(_OWORD *)&v48[12] = 0u;
          if ((buffer[0] & 0x80u) == 0) {
            UInt8 v18 = 32;
          }
          else {
            UInt8 v18 = 33;
          }
          *(_OWORD *)v48 = 0uLL;
          long long v47 = 0uLL;
          long long v46 = 0uLL;
          long long v45 = 0uLL;
          long long v44 = 0uLL;
          long long v43 = 0uLL;
          long long v42 = 0uLL;
          bytes[0] = 48;
          bytes[1] = (v17 + v18) | 4;
          bytes[2] = 2;
          bytes[3] = v18;
          if ((buffer[0] & 0x80u) == 0) {
            uint64_t v19 = 4;
          }
          else {
            uint64_t v19 = 5;
          }
          v20 = &bytes[v19];
          long long v21 = v36;
          *(_OWORD *)v20 = *(_OWORD *)buffer;
          *((_OWORD *)v20 + 1) = v21;
          v20[32] = 2;
          uint64_t v22 = v19 | 0x22;
          v20[33] = v17;
          if (v16 < 0)
          {
            bytes[v22] = 0;
            LODWORD(v22) = v19 + 35;
          }
          long long v23 = v38;
          v24 = &bytes[v22];
          *(_OWORD *)v24 = v37;
          *((_OWORD *)v24 + 1) = v23;
          CFDataRef v25 = CFDataCreate(v12, bytes, (v22 + 32));
          CFDataRef v26 = v25;
          if (v25 && CFDataGetLength(v25))
          {
            CFIndex Length = CFDataGetLength(v26);
            v28 = (UInt8 *)malloc_type_calloc(1uLL, Length, 0xF34617AEuLL);
            *a3 = v28;
            v51.location = 0;
            v51.length = Length;
            CFDataGetBytes(v26, v51, v28);
            uint64_t v6 = 0;
            *a4 = Length;
          }
          else
          {
            puts("outSignatureDer is empty");
          }
          goto LABEL_25;
        }
        v32 = "outSignature length is invalid";
      }
      else
      {
        v32 = "outSignature is NULL";
      }
      goto LABEL_45;
    }
    uint64_t v31 = v14;
    printf("cpCreateSignature failed: 0x%x\n", v14);
    CFDataRef v26 = 0;
  }
  uint64_t v6 = v31;
LABEL_25:
  IOObjectRelease(v10);
  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }
  if (v13) {
    CFRelease(v13);
  }
LABEL_30:
  if (theData) {
    CFRelease(theData);
  }
  if (v26) {
    CFRelease(v26);
  }
  return v6;
}

uint64_t _cpCreateSignature(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  outputStruct[6] = v6;
  outputStruct[7] = v6;
  outputStruct[4] = v6;
  outputStruct[5] = v6;
  outputStruct[2] = v6;
  outputStruct[3] = v6;
  outputStruct[0] = v6;
  outputStruct[1] = v6;
  size_t outputStructCnt = 128;
  BytePtr = CFDataGetBytePtr(theData);
  size_t Length = CFDataGetLength(theData);
  uint64_t v9 = IOConnectCallStructMethod(a1, 0, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!v9) {
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)outputStruct, outputStructCnt);
  }
  return v9;
}

uint64_t IOAccessoryManagerChallengeCryptoDockAuthChip(mach_port_t a1, int a2, const UInt8 *inputStruct, uint64_t a4, UInt8 *outputStruct, unint64_t a6, uint64_t *a7)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a4;
  uint64_t v10 = 3758097085;
  uint64_t input[2] = a6;
  io_connect_t connect = 0;
  uint32_t outputCnt = 1;
  size_t v27 = 16;
  if (!a1)
  {
    uint64_t v11 = 3758097084;
LABEL_5:
    io_service_t AuthCP = __findAuthCP();
    if (!AuthCP) {
      goto LABEL_17;
    }
    io_object_t v13 = AuthCP;
    CFDataRef theData = 0;
    uint64_t v14 = IOServiceOpen(AuthCP, *MEMORY[0x263EF8960], 0, &connect);
    if (v14)
    {
      uint64_t v22 = v14;
      printf("IOServiceOpen failed: 0x%x\n", v14);
      uint64_t v10 = v22;
    }
    else
    {
      CFDataRef v15 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], inputStruct, 32);
      if (v15)
      {
        CFDataRef v16 = v15;
        uint64_t v17 = _cpCreateSignature(connect, v15, &theData);
        if (v17)
        {
          uint64_t v23 = v17;
          printf("cpCreateSignature failed: 0x%x\n", v17);
          uint64_t v10 = v23;
        }
        else
        {
          CFDataRef v18 = theData;
          if (theData)
          {
            unint64_t Length = CFDataGetLength(theData);
            if (Length)
            {
              if (Length >= a6) {
                v20.length = a6;
              }
              else {
                v20.length = Length;
              }
              v20.location = 0;
              CFDataGetBytes(v18, v20, outputStruct);
              CFRelease(v18);
              uint64_t v10 = 0;
              goto LABEL_15;
            }
            v24 = "outSignature is empty";
          }
          else
          {
            v24 = "outSignature is NULL";
          }
          puts(v24);
        }
LABEL_15:
        IOObjectRelease(v13);
        CFRelease(v16);
LABEL_16:
        uint64_t v11 = v10;
        goto LABEL_17;
      }
      puts("CFDataCreate failed");
    }
    IOObjectRelease(v13);
    goto LABEL_16;
  }
  uint64_t v11 = IOConnectCallMethod(a1, 0x19u, input, 3u, inputStruct, 0xFuLL, a7, &outputCnt, outputStruct, &v27);
  if (v11) {
    goto LABEL_5;
  }
LABEL_17:
  if (connect) {
    IOServiceClose(connect);
  }
  return v11;
}

uint64_t IOAccessoryPortGetServiceWithPort(int a1)
{
  int valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryPort");
  keys = @"IOAccessoryDevicePort";
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v3 = CFDictionaryCreate(v2, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v1);
}

CFNumberRef IOAccessoryPortGetPort(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryDevicePort", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef IOAccessoryPortGetTransportType(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryTransportType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef IOAccessoryPortGetStreamType(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryPortStreamType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef IOAccessoryPortGetManagerPrimaryPort(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryPortManagerPrimaryPort", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

uint64_t IOAccessoryPortGetManagerService(io_registry_entry_t a1)
{
  kern_return_t ParentEntry;
  uint64_t result;
  BOOL v3;
  BOOLean_t v4;
  io_registry_entry_t parent;

  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent);
  CFNumberRef result = parent;
  if (ParentEntry) {
    CFDictionaryRef v3 = 1;
  }
  else {
    CFDictionaryRef v3 = parent == 0;
  }
  if (!v3)
  {
    CC_LONG v4 = IOObjectConformsTo(parent, "IOAccessoryManager");
    CFNumberRef result = parent;
    if (!v4)
    {
      IOObjectRelease(parent);
      return 0;
    }
  }
  return result;
}

uint64_t IOAccessoryPortTransmitData(mach_port_t a1, void *inputStruct, size_t inputStructCnt, unsigned int a4)
{
  uint64_t input = a4;
  return IOConnectCallMethod(a1, 0, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t IOAccessoryPortWaitSendDone(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryPortSetUSBRoleSwitchMask(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(a1, 2u, input, 2u, 0, 0, 0, 0, 0, 0);
}

CFRunLoopSourceRef IOAccessoryPortCreateRunLoopSource(uint64_t a1, UInt8 a2, uint64_t a3, uint64_t a4)
{
  mach_msg_return_t v16;
  mach_msg_return_t v17;
  mach_msg_header_t v18;
  Boolean shouldFreeInfo[17];
  CFMachPortContext context;

  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 40);
  if (!Mutable) {
    return 0;
  }
  uint64_t v10 = Mutable;
  memset(&context, 0, sizeof(context));
  memset(shouldFreeInfo, 170, sizeof(shouldFreeInfo));
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((void *)MutableBytePtr + 2) = a3;
  MutableBytePtr[24] = a2;
  *((void *)MutableBytePtr + 4) = a4;
  if (MEMORY[0x21D4618E0](a1, 0, *MEMORY[0x263EF8960], &shouldFreeInfo[9], &shouldFreeInfo[1], 1)|| (*((void *)MutableBytePtr + 1) = *(void *)&shouldFreeInfo[9], uint64_t NotificationPort = IODataQueueAllocateNotificationPort(), (*((_DWORD *)MutableBytePtr + 1) = NotificationPort) == 0)|| MEMORY[0x21D4618F0](a1, 0, NotificationPort, 0))
  {
    CFRelease(v10);
    return 0;
  }
  context.version = 0;
  context.info = v10;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x263EFF3B8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x263EFF3B0];
  context.copyDescription = 0;
  CFDataRef v15 = CFMachPortCreateWithPort(v8, *((_DWORD *)MutableBytePtr + 1), (CFMachPortCallBack)IOAccessoryPortMachPortCallBack, &context, shouldFreeInfo);
  if (shouldFreeInfo[0]) {
    CFRelease(v10);
  }
  if (!v15) {
    return 0;
  }
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(v8, v15, 0);
  CFRelease(v15);
  if (RunLoopSource)
  {
    if (IODataQueueDataAvailable(*((IODataQueueMemory **)MutableBytePtr + 1)))
    {
      *(void *)&v18.msgh_bits = 0x1800000014;
      v18.msgh_remote_port = *((_DWORD *)MutableBytePtr + 1);
      v18.msgh_local_port = 0;
      *(void *)&v18.msgh_voucher_port = 0;
      CFDataRef v16 = mach_msg(&v18, 17, 0x18u, 0, 0, 0, 0);
      uint64_t v17 = v16;
      if (v16 && v16 != 268435460) {
        CFRelease(RunLoopSource);
      }
      if (v17 != 268435460 && v17) {
        return 0;
      }
    }
  }
  return RunLoopSource;
}

void IOAccessoryPortMachPortCallBack(int a1, int a2, int a3, CFMutableDataRef theData)
{
  if (theData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(theData);
    if (MutableBytePtr)
    {
      size_t v5 = MutableBytePtr;
      if (MutableBytePtr[24])
      {
        long long v6 = (void (*)(void, uint64_t))*((void *)MutableBytePtr + 2);
        uint64_t v7 = *((void *)MutableBytePtr + 4);
        v6(0, v7);
      }
      else
      {
        while (1)
        {
          uint64_t v10 = IODataQueuePeek(*((IODataQueueMemory **)v5 + 1));
          if (!v10) {
            break;
          }
          unsigned int v9 = *(unsigned __int16 *)v10->data;
          data = v10->data;
          if (v9 > 0x100) {
            break;
          }
          (*((void (**)(UInt8 *, void))v5 + 2))(data, *((void *)v5 + 4));
          IODataQueueDequeue(*((IODataQueueMemory **)v5 + 1), 0, 0);
        }
      }
    }
  }
}

uint64_t IOAccessoryIDBusGetServiceWithManagerPrimaryPort(int a1)
{
  int valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryIDBusTransport");
  keys = @"IOAccessoryPortManagerPrimaryPort";
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v3 = CFDictionaryCreate(v2, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v1);
}

uint64_t IOAccessoryIDBusTransferData(mach_port_t a1, void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t a5, unsigned int a6, double a7)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  size_t v8 = a5;
  input[0] = (unint64_t)(a7 * 1000000.0);
  input[1] = a6;
  return IOConnectCallMethod(a1, 0, input, 2u, inputStruct, inputStructCnt, 0, 0, outputStruct, &v8);
}

uint64_t IOAccessoryIDBusCancelTransfer(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 1u, 0, 0, 0, 0);
}

uint64_t IOAccessoryIDBusSendBreak(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 2u, 0, 0, 0, 0);
}

uint64_t IOAccessoryIDBusSendBusReset(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 3u, 0, 0, 0, 0);
}

uint64_t IOAccessoryIDBusAssertBusReset(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryIDBusGetMaxTransfer(uint64_t a1, void *a2, void *a3)
{
  io_registry_entry_t entry = -1431655766;
  uint64_t v5 = MEMORY[0x21D4618D0](a1, &entry);
  if (!v5)
  {
    CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    uint64_t v5 = IORegistryEntryCreateCFProperties(entry, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!v5)
    {
      uint64_t v5 = 3758097084;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(properties, "IOAccessoryIDBusTransportMaxTransmit");
      CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(properties, "IOAccessoryIDBusTransportMaxReceive");
      int valuePtr = -1431655766;
      uint64_t v8 = 3758097084;
      if (Value && CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
      {
        uint64_t v8 = 0;
        *a2 = valuePtr;
      }
      if (v7 && CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
      {
        *a3 = valuePtr;
        uint64_t v5 = v8;
      }
      CFRelease(properties);
    }
  }
  return v5;
}

CFNumberRef IOAccessoryEAInterfaceGetTransportType(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"TransportType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFTypeRef IOAccessoryEAInterfaceCopyProtocolString(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"ProtocolString", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceVendorName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceProductName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceModelNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceHardwareRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceFirmwareRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceSerialNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceDockType(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceDockType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t IOAccessoryEAInterfaceRegisterReceiveCallback(mach_port_t a1, IONotificationPortRef notify, uint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  reference[0] = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  reference[1] = a3;
  long long v8 = a4;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 2u, MachPort, reference, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAccessoryEAInterfaceReceiveData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 1u, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryEAInterfaceSendData(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 0, inputStruct, inputStructCnt, 0, 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceVendorName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceProductName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceModelNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceHardwareRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceFirmwareRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceSerialNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceDockType(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceDockType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFNumberRef IOAccessoryOOBPairingInterfaceCopyDevicePlatformID(io_registry_entry_t a1)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"DevicePlatformID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (result)
  {
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    if (CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr)) {
      return (const __CFNumber *)valuePtr;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFTypeRef IOAccessoryOOBPairingInterfaceGetSupportedPairingTypes(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceSupportedOOBPairingTypes", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetActivePairingType(io_registry_entry_t a1)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"DeviceActiveOOBPairingType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unsigned int valuePtr = -1431655766;
  if (CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr)) {
    return valuePtr;
  }
  else {
    return 2;
  }
}

uint64_t IOAccessoryOOBPairingInterfaceSupports2Way(io_registry_entry_t a1)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"DeviceSupportsSupports2Way", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  int valuePtr = -1431655766;
  int Value = CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
  unsigned __int8 v3 = valuePtr;
  if (!Value) {
    return 0;
  }
  return v3;
}

uint64_t IOAccessoryOOBPairingInterfaceRegisterReceiveCallback(mach_port_t a1, IONotificationPortRef notify, uint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  reference[0] = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  reference[1] = a3;
  long long v8 = a4;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 0, MachPort, reference, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingInfo(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 1u, inputStruct, inputStructCnt, 0, 0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingInfo(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingData(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 3u, inputStruct, inputStructCnt, 0, 0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 4u, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategories(io_registry_entry_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  long long v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    unsigned int v7 = 0;
    if (a2 && a3) {
      unsigned int v7 = *a3;
    }
    *(_DWORD *)buf = 136315650;
    CFRange v20 = "IOAccessoryConfigStreamInterfaceGetCategories";
    __int16 v21 = 1024;
    io_registry_entry_t v22 = a1;
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    _os_log_impl(&dword_2180DC000, v6, OS_LOG_TYPE_INFO, "%s: service %d, outDataCount %u", buf, 0x18u);
  }
  if (!a2 || !a3)
  {
    uint64_t v14 = 3758097090;
    io_object_t v13 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    unsigned int v15 = 0;
    goto LABEL_23;
  }
  if (!*a3) {
    goto LABEL_26;
  }
  CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryConfigStreamCategoryList", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    if (CFProperty) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 3758097090;
    io_object_t v13 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    goto LABEL_22;
  }
  IOAccessoryConfigStreamInterfaceGetCategories_cold_2();
  if (!CFProperty) {
    goto LABEL_26;
  }
LABEL_13:
  unsigned int Count = CFArrayGetCount(CFProperty);
  unsigned int v10 = *a3;
  if (Count < *a3) {
    unsigned int v10 = Count;
  }
  if (v10 >= 8) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = v10;
  }
  CFAllocatorRef v12 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG)) {
    IOAccessoryConfigStreamInterfaceGetCategories_cold_1(a1, v11, v12);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 0x40000000;
  v17[2] = __IOAccessoryConfigStreamInterfaceGetCategories_block_invoke;
  v17[3] = &__block_descriptor_tmp;
  int v18 = v11;
  v17[4] = a2;
  __iterateDictionaryList(CFProperty, v11, (uint64_t)v17);
  *a3 = v11;
  CFRelease(CFProperty);
  io_object_t v13 = gLogObject;
  uint64_t v14 = 0;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = 0;
LABEL_22:
    unsigned int v15 = *a3;
LABEL_23:
    *(_DWORD *)buf = 136315906;
    CFRange v20 = "IOAccessoryConfigStreamInterfaceGetCategories";
    __int16 v21 = 1024;
    io_registry_entry_t v22 = a1;
    __int16 v23 = 1024;
    unsigned int v24 = v15;
    __int16 v25 = 1024;
    int v26 = v14;
    _os_log_impl(&dword_2180DC000, v13, OS_LOG_TYPE_DEFAULT, "%s: service %d, *outDataCount %u, ret %x", buf, 0x1Eu);
  }
  return v14;
}

void __iterateDictionaryList(const __CFArray *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "__iterateDictionaryList";
    __int16 v15 = 2048;
    CFIndex Count = CFArrayGetCount(a1);
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 1024;
    BOOL v20 = a3 != 0;
    _os_log_debug_impl(&dword_2180DC000, v6, OS_LOG_TYPE_DEBUG, "%s: array %ld values, upToCount %ld, handler %d", buf, 0x26u);
  }
  uint64_t v7 = a2 - 1;
  if (a2 >= 1 && a1 && a3)
  {
    CFIndex v8 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
      unsigned int v10 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        CFIndex v12 = CFDictionaryGetCount(ValueAtIndex);
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = "__iterateDictionaryList";
        __int16 v15 = 2048;
        CFIndex Count = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        _os_log_debug_impl(&dword_2180DC000, v10, OS_LOG_TYPE_DEBUG, "%s: call handler, i %ld, item %ld values", buf, 0x20u);
      }
      if ((*(unsigned int (**)(uint64_t, CFIndex, const __CFDictionary *))(a3 + 16))(a3, v8, ValueAtIndex)) {
        BOOL v11 = v7 == v8;
      }
      else {
        BOOL v11 = 1;
      }
      ++v8;
    }
    while (!v11);
  }
}

uint64_t __IOAccessoryConfigStreamInterfaceGetCategories_block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *(_DWORD *)(a1 + 40);
    int v10 = 136315906;
    BOOL v11 = "IOAccessoryConfigStreamInterfaceGetCategories_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 1024;
    int v15 = v9;
    __int16 v16 = 2048;
    CFIndex Count = CFDictionaryGetCount(a3);
    _os_log_debug_impl(&dword_2180DC000, v6, OS_LOG_TYPE_DEBUG, "%s: callback, index %ld / %d, entry %ld values", (uint8_t *)&v10, 0x26u);
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"CategoryID");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(*(void *)(a1 + 32) + 8 * a2));
  }
  return 1;
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategoryProperties(io_registry_entry_t a1, int a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2000000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2000000000;
  uint64_t v33 = -1;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  CFIndex v8 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = 0;
    if (a3 && a4) {
      unsigned int v9 = *a4;
    }
    *(_DWORD *)buf = 136315906;
    v39 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    __int16 v40 = 1024;
    io_registry_entry_t v41 = a1;
    __int16 v42 = 1024;
    int v43 = a2;
    __int16 v44 = 1024;
    *(_DWORD *)long long v45 = v9;
    _os_log_impl(&dword_2180DC000, v8, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, outDataCount %u", buf, 0x1Eu);
  }
  if (!a3 || !a4)
  {
    uint64_t v13 = 3758097090;
    BOOL v20 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    unsigned int v25 = 0;
    goto LABEL_35;
  }
  if (!*a4) {
    goto LABEL_26;
  }
  CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryConfigStreamCategoryList", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    if (CFProperty) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v13 = 3758097090;
    BOOL v20 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  IOAccessoryConfigStreamInterfaceGetCategoryProperties_cold_1();
  if (!CFProperty) {
    goto LABEL_26;
  }
LABEL_13:
  CFIndex Count = CFArrayGetCount(CFProperty);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 0x40000000;
  v29[2] = __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke;
  v29[3] = &unk_2642FF9A8;
  v29[4] = &v30;
  v29[5] = &v34;
  __findCategoryEntry(CFProperty, a2, (uint64_t)v29);
  __int16 v12 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = 8;
    if (Count < 8) {
      uint64_t v21 = Count;
    }
    uint64_t v22 = v31[3];
    uint64_t v23 = v35[3];
    *(_DWORD *)buf = 136316418;
    v39 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    __int16 v40 = 1024;
    io_registry_entry_t v41 = a1;
    __int16 v42 = 1024;
    int v43 = a2;
    __int16 v44 = 2048;
    *(void *)long long v45 = v22;
    *(_WORD *)&v45[8] = 2048;
    uint64_t v46 = v21;
    __int16 v47 = 2112;
    uint64_t v48 = v23;
    _os_log_debug_impl(&dword_2180DC000, v12, OS_LOG_TYPE_DEBUG, "%s: service %d, categoryID 0x%x, found catIndex %ld, categoryCount %ld, categoryItem %@", buf, 0x36u);
  }
  uint64_t v13 = 3758097090;
  if ((v31[3] & 0x8000000000000000) == 0)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v35[3], @"PropertyList");
    int v15 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = v31[3];
      *(_DWORD *)buf = 136316162;
      v39 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
      __int16 v40 = 1024;
      io_registry_entry_t v41 = a1;
      __int16 v42 = 1024;
      int v43 = a2;
      __int16 v44 = 2048;
      *(void *)long long v45 = v24;
      *(_WORD *)&v45[8] = 2112;
      uint64_t v46 = (uint64_t)Value;
      _os_log_debug_impl(&dword_2180DC000, v15, OS_LOG_TYPE_DEBUG, "%s: service %d, category 0x%x / %ld, found propertyList %@", buf, 0x2Cu);
      if (Value) {
        goto LABEL_17;
      }
    }
    else if (Value)
    {
LABEL_17:
      unsigned int v16 = CFArrayGetCount(Value);
      unsigned int v17 = *a4;
      if (v16 < *a4) {
        unsigned int v17 = v16;
      }
      if (v17 >= 0x10) {
        uint64_t v18 = 16;
      }
      else {
        uint64_t v18 = v17;
      }
      __int16 v19 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = v31[3];
        *(_DWORD *)buf = 136316162;
        v39 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
        __int16 v40 = 1024;
        io_registry_entry_t v41 = a1;
        __int16 v42 = 1024;
        int v43 = a2;
        __int16 v44 = 2048;
        *(void *)long long v45 = v27;
        *(_WORD *)&v45[8] = 1024;
        LODWORD(v46) = v18;
        _os_log_debug_impl(&dword_2180DC000, v19, OS_LOG_TYPE_DEBUG, "%s: service %d, category 0x%x / %ld, propertyCount %d", buf, 0x28u);
      }
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 0x40000000;
      v28[2] = __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke_183;
      v28[3] = &__block_descriptor_tmp_187;
      v28[4] = a3;
      __iterateDictionaryList(Value, v18, (uint64_t)v28);
      uint64_t v13 = 0;
      *a4 = v18;
      goto LABEL_33;
    }
    uint64_t v13 = 3758097112;
  }
LABEL_33:
  CFRelease(CFProperty);
  BOOL v20 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
LABEL_34:
    unsigned int v25 = *a4;
LABEL_35:
    *(_DWORD *)buf = 136316162;
    v39 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    __int16 v40 = 1024;
    io_registry_entry_t v41 = a1;
    __int16 v42 = 1024;
    int v43 = a2;
    __int16 v44 = 1024;
    *(_DWORD *)long long v45 = v25;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v13;
    _os_log_impl(&dword_2180DC000, v20, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, outDataCount %u, ret %x", buf, 0x24u);
  }
LABEL_36:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v13;
}

void __findCategoryEntry(const __CFArray *a1, int a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = -1;
  long long v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    CFIndex Count = CFArrayGetCount(a1);
    *(_DWORD *)buf = 136315906;
    BOOL v20 = "__findCategoryEntry";
    __int16 v21 = 2048;
    CFIndex v22 = Count;
    __int16 v23 = 1024;
    int v24 = a2;
    __int16 v25 = 1024;
    BOOL v26 = a3 != 0;
    _os_log_debug_impl(&dword_2180DC000, v6, OS_LOG_TYPE_DEBUG, "%s: categoryList %ld, categoryID %d, handler %d", buf, 0x22u);
    if (!a1) {
      goto LABEL_7;
    }
  }
  else if (!a1)
  {
    goto LABEL_7;
  }
  if (a3)
  {
    CFIndex v7 = CFArrayGetCount(a1);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ____findCategoryEntry_block_invoke;
    v9[3] = &unk_2642FFA38;
    __int16 v10 = a2;
    v9[4] = &v11;
    v9[5] = &v15;
    __iterateDictionaryList(a1, v7, (uint64_t)v9);
    if ((v12[3] & 0x8000000000000000) == 0)
    {
      if (v16[3]) {
        (*(void (**)(uint64_t))(a3 + 16))(a3);
      }
    }
  }
LABEL_7:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke_183(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"PropertyID");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(*(void *)(a1 + 32) + 8 * a2));
  }
  return 1;
}

uint64_t IOAccessoryConfigStreamInterfaceGetProperty(io_registry_entry_t a1, int a2, int a3, UInt8 *a4, CFIndex *a5)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2000000000;
  uint64_t v55 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2000000000;
  uint64_t v51 = -1;
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2000000000;
  uint64_t v47 = -1;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  __int16 v10 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    CFIndex v11 = 0;
    if (a4 && a5) {
      CFIndex v11 = *a5;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a1;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    LOWORD(v76) = 1024;
    *(_DWORD *)((char *)&v76 + 2) = a3;
    WORD3(v76) = 2048;
    *((void *)&v76 + 1) = v11;
    _os_log_impl(&dword_2180DC000, v10, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x, outDataSize %lu", buf, 0x28u);
  }
  uint64_t v12 = 3758097090;
  if (a4) {
    BOOL v13 = a5 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  char v14 = v13;
  char v37 = v14;
  if (!v13 && *a5)
  {
    CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryConfigStreamCategoryList", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      if (!CFProperty) {
        goto LABEL_40;
      }
LABEL_18:
      buffer = a4;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 0x40000000;
      v39 = (void (*)(void *, uint64_t))__IOAccessoryConfigStreamInterfaceGetProperty_block_invoke;
      __int16 v40 = &unk_2642FF9F0;
      io_registry_entry_t v41 = &v48;
      __int16 v42 = &v44;
      int v43 = &v52;
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2000000000;
      uint64_t v74 = 0;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2000000000;
      uint64_t v70 = -1;
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x2000000000;
      uint64_t v66 = -1;
      unsigned int v16 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        CFIndex Count = CFArrayGetCount(CFProperty);
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = "__findPropertyEntry";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = Count;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v76) = a2;
        WORD2(v76) = 1024;
        *(_DWORD *)((char *)&v76 + 6) = a3;
        WORD5(v76) = 1024;
        HIDWORD(v76) = 1;
        _os_log_debug_impl(&dword_2180DC000, v16, OS_LOG_TYPE_DEBUG, "%s: categoryList %ld, categoryID %d, propertyID %d, handler %d", buf, 0x28u);
      }
      CFIndex v17 = CFArrayGetCount(CFProperty);
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 0x40000000;
      v62[2] = ____findPropertyEntry_block_invoke;
      v62[3] = &unk_2642FFA60;
      v62[4] = &v67;
      v62[5] = &v71;
      __findCategoryEntry(CFProperty, a2, (uint64_t)v62);
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 0x40000000;
      *(void *)&buf[16] = ____findPropertyEntry_block_invoke_2;
      *(void *)&long long v76 = &unk_2642FFA88;
      *(_WORD *)&v77[8] = a2;
      *((void *)&v76 + 1) = &v67;
      *(void *)v77 = &v71;
      __iterateDictionaryList(CFProperty, v17, (uint64_t)buf);
      if ((v68[3] & 0x8000000000000000) == 0)
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v72[3], @"PropertyList");
        uint64_t v58 = 0;
        v59 = &v58;
        uint64_t v60 = 0x2000000000;
        uint64_t v61 = 0;
        if (Value)
        {
          CFArrayRef v19 = Value;
          CFIndex v20 = CFArrayGetCount(Value);
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 0x40000000;
          v56[2] = ____findPropertyEntry_block_invoke_3;
          v56[3] = &unk_2642FFAB0;
          __int16 v57 = a3;
          v56[4] = &v63;
          v56[5] = &v58;
          __iterateDictionaryList(v19, v20, (uint64_t)v56);
          if ((v64[3] & 0x8000000000000000) == 0)
          {
            if (v59[3]) {
              v39(v38, v68[3]);
            }
          }
        }
        _Block_object_dispose(&v58, 8);
      }
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v71, 8);
      __int16 v21 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = v49[3];
        uint64_t v29 = v45[3];
        CFDataRef v30 = (const __CFData *)v53[3];
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a1;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a2;
        LOWORD(v76) = 1024;
        *(_DWORD *)((char *)&v76 + 2) = a3;
        WORD3(v76) = 2048;
        *((void *)&v76 + 1) = v28;
        *(_WORD *)v77 = 2048;
        *(void *)&v77[2] = v29;
        __int16 v78 = 2112;
        CFDataRef v79 = v30;
        _os_log_debug_impl(&dword_2180DC000, v21, OS_LOG_TYPE_DEBUG, "%s: service %d, categoryID 0x%x, propertyID 0x%x, found catIndex %ld, propIndex %ld, propertyItem %@", buf, 0x3Cu);
      }
      CFDictionaryRef v22 = (const __CFDictionary *)v53[3];
      if (v22)
      {
        CFDataRef v23 = (const __CFData *)CFDictionaryGetValue(v22, @"PropertyData");
        int v24 = gLogObject;
        if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v31 = v49[3];
          uint64_t v32 = v45[3];
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = a1;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = a2;
          LOWORD(v76) = 2048;
          *(void *)((char *)&v76 + 2) = v31;
          WORD5(v76) = 1024;
          HIDWORD(v76) = a3;
          *(_WORD *)v77 = 2048;
          *(void *)&v77[2] = v32;
          __int16 v78 = 2112;
          CFDataRef v79 = v23;
          _os_log_debug_impl(&dword_2180DC000, v24, OS_LOG_TYPE_DEBUG, "%s: service %d, category 0x%x / %ld, property 0x%x / %ld, found data %@", buf, 0x3Cu);
          if (v23) {
            goto LABEL_31;
          }
        }
        else if (v23)
        {
LABEL_31:
          unint64_t Length = CFDataGetLength(v23);
          if (Length >= *a5) {
            CFIndex v26 = *a5;
          }
          else {
            CFIndex v26 = Length;
          }
          v81.location = 0;
          v81.length = v26;
          CFDataGetBytes(v23, v81, buffer);
          uint64_t v12 = 0;
          *a5 = v26;
          goto LABEL_39;
        }
      }
      uint64_t v12 = 3758097112;
LABEL_39:
      CFRelease(CFProperty);
      goto LABEL_40;
    }
    IOAccessoryConfigStreamInterfaceGetProperty_cold_1();
    if (CFProperty) {
      goto LABEL_18;
    }
  }
LABEL_40:
  uint64_t v33 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (v37) {
      CFIndex v34 = 0;
    }
    else {
      CFIndex v34 = *a5;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a1;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    LOWORD(v76) = 1024;
    *(_DWORD *)((char *)&v76 + 2) = a3;
    WORD3(v76) = 2048;
    *((void *)&v76 + 1) = v34;
    *(_WORD *)v77 = 1024;
    *(_DWORD *)&v77[2] = v12;
    _os_log_impl(&dword_2180DC000, v33, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, propertyID 0x%x, outDataSize %lu, ret %x", buf, 0x2Eu);
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  return v12;
}

void *__IOAccessoryConfigStreamInterfaceGetProperty_block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(result[4] + 8) + 24) = a2;
  *(void *)(*(void *)(result[5] + 8) + 24) = a3;
  *(void *)(*(void *)(result[6] + 8) + 24) = a4;
  return result;
}

uint64_t IOAccessoryConfigStreamInterfaceRequestGetProperty(io_service_t a1, io_connect_t a2, unsigned int a3)
{
  kern_return_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  io_service_t v20;
  __int16 v21;
  io_connect_t v22;
  __int16 v23;
  unsigned char v24[10];
  uint64_t v25;
  uint64_t input[3];

  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  input[0] = a2;
  input[1] = a3;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  CFIndex v8 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
    CFArrayRef v19 = 1024;
    CFIndex v20 = a1;
    __int16 v21 = 1024;
    CFDictionaryRef v22 = a2;
    CFDataRef v23 = 1024;
    *(_DWORD *)int v24 = a3;
    _os_log_impl(&dword_2180DC000, v8, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x", buf, 0x1Eu);
  }
  io_connect_t connect = 0;
  uint64_t v9 = IOServiceOpen(a1, *MEMORY[0x263EF8960], 0, &connect);
  if (!v9)
  {
    __int16 v10 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
      CFArrayRef v19 = 1024;
      CFIndex v20 = a1;
      __int16 v21 = 1024;
      CFDictionaryRef v22 = connect;
      CFDataRef v23 = 2048;
      *(void *)int v24 = v6;
      *(_WORD *)&v24[8] = 2048;
      __int16 v25 = v7;
      _os_log_debug_impl(&dword_2180DC000, v10, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, arg [%llx  %llx]", buf, 0x2Cu);
    }
    CFIndex v11 = IOConnectCallScalarMethod(connect, 0, input, 2u, 0, 0);
    uint64_t v12 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
      CFArrayRef v19 = 1024;
      CFIndex v20 = a1;
      __int16 v21 = 1024;
      CFDictionaryRef v22 = connect;
      CFDataRef v23 = 1024;
      *(_DWORD *)int v24 = v11;
      _os_log_debug_impl(&dword_2180DC000, v12, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, after call, ret %x", buf, 0x1Eu);
    }
    uint64_t v9 = IOServiceClose(connect);
  }
  BOOL v13 = v9;
  char v14 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
    CFArrayRef v19 = 1024;
    CFIndex v20 = a1;
    __int16 v21 = 1024;
    CFDictionaryRef v22 = a2;
    CFDataRef v23 = 1024;
    *(_DWORD *)int v24 = a3;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v13;
    _os_log_impl(&dword_2180DC000, v14, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, propertyID 0x%x, ret %x", buf, 0x24u);
  }
  return v13;
}

uint64_t IOAccessoryConfigStreamInterfaceSetProperty(io_service_t a1, io_connect_t a2, unsigned int a3, const void *a4, uint64_t a5)
{
  kern_return_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  io_service_t v24;
  __int16 v25;
  io_connect_t v26;
  __int16 v27;
  unsigned char v28[20];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t input[4];

  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a5;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  uint64_t v12 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    CFDictionaryRef v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
    CFDataRef v23 = 1024;
    int v24 = a1;
    __int16 v25 = 1024;
    CFIndex v26 = a2;
    uint64_t v27 = 1024;
    *(_DWORD *)uint64_t v28 = a3;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = a5;
    _os_log_impl(&dword_2180DC000, v12, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x, dataSize %zu", buf, 0x28u);
  }
  io_connect_t connect = 0;
  uint64_t v13 = IOServiceOpen(a1, *MEMORY[0x263EF8960], 0, &connect);
  if (v13) {
    goto LABEL_12;
  }
  if (a5 <= 0x400)
  {
    char v14 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316930;
      CFDictionaryRef v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
      CFDataRef v23 = 1024;
      int v24 = a1;
      __int16 v25 = 1024;
      CFIndex v26 = connect;
      uint64_t v27 = 2048;
      *(void *)uint64_t v28 = v10;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v11;
      *(_WORD *)&v28[18] = 2048;
      uint64_t v29 = a5;
      CFDataRef v30 = 2048;
      uint64_t v31 = a5;
      uint64_t v32 = 1024;
      uint64_t v33 = 1024;
      _os_log_debug_impl(&dword_2180DC000, v14, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, arg [%llx  %llx  %llx], dataSize %zu / %d", buf, 0x46u);
    }
    uint64_t v15 = IOConnectCallMethod(connect, 1u, input, 3u, a4, 0x400uLL, 0, 0, 0, 0);
    unsigned int v16 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      CFDictionaryRef v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
      CFDataRef v23 = 1024;
      int v24 = a1;
      __int16 v25 = 1024;
      CFIndex v26 = connect;
      uint64_t v27 = 1024;
      *(_DWORD *)uint64_t v28 = v15;
      _os_log_debug_impl(&dword_2180DC000, v16, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, after call, ret %x", buf, 0x1Eu);
    }
    uint64_t v13 = IOServiceClose(connect);
LABEL_12:
    CFIndex v17 = v13;
    goto LABEL_13;
  }
  CFIndex v17 = 52;
LABEL_13:
  uint64_t v18 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    CFDictionaryRef v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
    CFDataRef v23 = 1024;
    int v24 = a1;
    __int16 v25 = 1024;
    CFIndex v26 = a2;
    uint64_t v27 = 1024;
    *(_DWORD *)uint64_t v28 = a3;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = a5;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = v17;
    _os_log_impl(&dword_2180DC000, v18, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, propertyID 0x%x, dataSize %zu, ret %x", buf, 0x2Eu);
  }
  return v17;
}

os_log_t ____initLogging_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ioamlib", "ioamlib");
  gLogObject = (uint64_t)result;
  return result;
}

uint64_t ____findCategoryEntry_block_invoke(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"CategoryID");
  if (!Value) {
    return 1;
  }
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr != *(unsigned __int16 *)(a1 + 48)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = theDict;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke_2(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"CategoryID");
  if (!Value) {
    return 1;
  }
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr != *(unsigned __int16 *)(a1 + 48)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = theDict;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke_3(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"PropertyID");
  if (!Value) {
    return 1;
  }
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr != *(unsigned __int16 *)(a1 + 48)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = theDict;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void *ResourceArbiterClientNotifyEvent(void *result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 == -469794814)
  {
    uint64_t result = (void *)[result clientPriority];
    if (result == a4)
    {
      return (void *)[v5 resourceAccessRevoked];
    }
  }
  else if (a3 == -469794815)
  {
    uint64_t result = (void *)[result clientPriority];
    if (result == a4)
    {
      return (void *)[v5 resourceAccessGranted];
    }
  }
  return result;
}

uint64_t requestResource(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 0, input, 2u, 0, 0);
}

uint64_t releaseResource(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

void IOAccessoryConfigStreamInterfaceGetCategories_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "IOAccessoryConfigStreamInterfaceGetCategories";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_debug_impl(&dword_2180DC000, log, OS_LOG_TYPE_DEBUG, "%s: service %d, categoryCount %d", (uint8_t *)&v3, 0x18u);
}

void IOAccessoryConfigStreamInterfaceGetCategories_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2180DC000, v0, v1, "%s: service %d, categoryList %@ ", v2);
}

void IOAccessoryConfigStreamInterfaceGetCategoryProperties_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2180DC000, v0, v1, "%s: service %d, categoryList %@ ", v2);
}

void IOAccessoryConfigStreamInterfaceGetProperty_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2180DC000, v0, v1, "%s: service %d, categoryList %@ ", v2);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F18](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x270EF3F48](*(void *)&connect, service);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x270EF3FE0](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x270EF3FF0](dataQueue);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x270EF4A48](*(void *)&entry, plane);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}