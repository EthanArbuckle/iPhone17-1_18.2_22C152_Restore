@interface MGIOKitHelper
- (BOOL)createServicesIteratorByNameMatch:(const char *)a3;
- (BOOL)createTreeIterator:(const char *)a3;
- (MGIOKitHelper)init;
- (__CFArray)iteratorCopyBusyServiceNames;
- (__CFBoolean)copyBooleanFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFData)copyDataFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFData)copyDataFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFDictionary)deviceTreeNodeIsPresent:(__CFString *)a3 withExactName:(BOOL)a4 withNodeClass:(__CFString *)a5;
- (__CFNumber)copyNumberFromData:(__CFData *)a3;
- (__CFNumber)copyNumberFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFString)copyStringFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFString)copyStringFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (unsigned)copyDeviceTreeStructureNext:(id)a3 withFirstChar:(char)a4;
- (void)copyDeviceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (void)copyPropertyFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (void)copyServiceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (void)dealloc;
- (void)deleteIterator;
@end

@implementation MGIOKitHelper

- (void)dealloc
{
  [(MGIOKitHelper *)self deleteIterator];
  v3.receiver = self;
  v3.super_class = (Class)MGIOKitHelper;
  [(MGIOKitHelper *)&v3 dealloc];
}

- (BOOL)createTreeIterator:(const char *)a3
{
  return IORegistryCreateIterator(*MEMORY[0x1E4F2EEF0], a3, 1u, &self->devIterator) == 0;
}

- (void)deleteIterator
{
  io_object_t devIterator = self->devIterator;
  if (devIterator)
  {
    IOObjectRelease(devIterator);
    self->io_object_t devIterator = 0;
  }
}

- (unsigned)copyDeviceTreeStructureNext:(id)a3 withFirstChar:(char)a4
{
  int v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  for (uint64_t i = IOIteratorNext(self->devIterator); i; uint64_t i = IOIteratorNext(self->devIterator))
  {
    memset(v11, 0, sizeof(v11));
    if (!MEMORY[0x19F3AA060](i, v11))
    {
      v8 = [NSString stringWithUTF8String:v11];
      v9 = v8;
      if (v4)
      {
        if (sub_19D7183B0(v8, v6, v4)) {
          goto LABEL_10;
        }
      }
      else if (![(__CFString *)v8 compare:v6 options:1])
      {
LABEL_10:

        break;
      }
      IOObjectRelease(i);
    }
  }

  return i;
}

- (__CFDictionary)deviceTreeNodeIsPresent:(__CFString *)a3 withExactName:(BOOL)a4 withNodeClass:(__CFString *)a5
{
  kern_return_t CFProperties;
  mach_error_t v21;
  char *v22;
  const char *v23;
  __CFString *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __CFString *v33;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  char *v38;
  io_name_t className;
  uint64_t v40;

  BOOL v6 = a4;
  v40 = *MEMORY[0x1E4F143B8];
  cf = 0;
  v33 = a3;
  v8 = a5;
  uint64_t v9 = IOIteratorNext(self->devIterator);
  if (!v9)
  {
    uint64_t v12 = 0;
    v11 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  v11 = 0;
  uint64_t v12 = 0;
  long long v13 = 0uLL;
  while (1)
  {
    v14 = v12;
    if (v8)
    {
      *(_OWORD *)&className[96] = v13;
      *(_OWORD *)&className[112] = v13;
      *(_OWORD *)&className[64] = v13;
      *(_OWORD *)&className[80] = v13;
      *(_OWORD *)&className[32] = v13;
      *(_OWORD *)&className[48] = v13;
      *(_OWORD *)className = v13;
      *(_OWORD *)&className[16] = v13;
      IOObjectGetClass(v10, className);
      uint64_t v15 = [NSString stringWithUTF8String:className];

      int v16 = [(__CFString *)v8 isEqualToString:v15];
      long long v13 = 0uLL;
      int v17 = v16;
      v11 = (void *)v15;
    }
    else
    {
      int v17 = 1;
    }
    *(_OWORD *)&className[96] = v13;
    *(_OWORD *)&className[112] = v13;
    *(_OWORD *)&className[64] = v13;
    *(_OWORD *)&className[80] = v13;
    *(_OWORD *)&className[32] = v13;
    *(_OWORD *)&className[48] = v13;
    *(_OWORD *)className = v13;
    *(_OWORD *)&className[16] = v13;
    MEMORY[0x19F3AA060](v10, className);
    uint64_t v12 = [NSString stringWithUTF8String:className];

    if (!v17) {
      goto LABEL_11;
    }
    if (!v6) {
      break;
    }
    if ([v12 isEqualToString:v33]) {
      goto LABEL_18;
    }
LABEL_11:
    IOObjectRelease(v10);
    uint64_t v10 = IOIteratorNext(self->devIterator);
    long long v13 = 0uLL;
    if (!v10) {
      goto LABEL_14;
    }
  }
  if (![v12 hasPrefix:v33]) {
    goto LABEL_11;
  }
LABEL_18:
  CFProperties = IORegistryEntryCreateCFProperties(v10, (CFMutableDictionaryRef *)&cf, 0, 0);
  if (CFProperties)
  {
    v21 = CFProperties;
    v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22) {
      v23 = v22 + 1;
    }
    else {
      v23 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    v24 = v33;
    v25 = [(__CFString *)v24 UTF8String];
    mach_error_string(v21);
    _MGLog((uint64_t)v23, 215, @"IORegistryEntryCreateCFProperties failed for '%s': %s", v26, v27, v28, v29, v30, v25);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(__CFString *)v24 UTF8String];
      v32 = mach_error_string(v21);
      *(_DWORD *)buf = 136315394;
      v36 = v31;
      v37 = 2080;
      v38 = v32;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed for '%s': %s", buf, 0x16u);
    }
LABEL_14:
    Copy = 0;
  }
  else
  {
    Copy = CFDictionaryCreateCopy(0, (CFDictionaryRef)cf);
    IOObjectRelease(v10);
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }

  return Copy;
}

- (MGIOKitHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)MGIOKitHelper;
  result = [(MGIOKitHelper *)&v3 init];
  if (result) {
    result->io_object_t devIterator = 0;
  }
  return result;
}

- (BOOL)createServicesIteratorByNameMatch:(const char *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MGIOKitHelper *)self deleteIterator];
  CFDictionaryRef v5 = IOServiceNameMatching(a3);
  if (v5) {
    return IOServiceGetMatchingServices(*MEMORY[0x1E4F2EEF0], v5, &self->devIterator) == 0;
  }
  v7 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
  if (v7) {
    long long v13 = v7 + 1;
  }
  else {
    long long v13 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
  }
  _MGLog((uint64_t)v13, 69, @"Failed to create iterator: %s ", v8, v9, v10, v11, v12, (char)a3);
  BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    int v16 = a3;
    _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to create iterator: %s ", buf, 0xCu);
    return 0;
  }
  return result;
}

- (void)copyServiceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  int v6 = a6;
  id v9 = a3;
  uint64_t v10 = (__CFString *)a5;
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  if (v9 && v10)
  {
    while (1)
    {
      io_object_t v13 = IOIteratorNext(self->devIterator);
      if (!v13) {
        break;
      }
      io_registry_entry_t v14 = v13;
      CFStringRef v15 = IOObjectCopyClass(v13);
      if (v15)
      {
        CFStringRef v16 = v15;
        if (CFEqual(v15, v9)
          && (CFTypeRef v17 = IORegistryEntryCreateCFProperty(v14, @"IORegistryEntryPropertyKeys", 0, 0)) != 0)
        {
          v18 = v17;
          if (v6) {
            CFTypeRef CFProperty = sub_19D7182D0(v14, v17, v11, v6);
          }
          else {
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v14, v11, 0, 0);
          }
          uint64_t v12 = (void *)CFProperty;
          CFRelease(v18);
        }
        else
        {
          uint64_t v12 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        uint64_t v12 = 0;
      }
      IOObjectRelease(v14);
      if (v12) {
        goto LABEL_17;
      }
    }
    uint64_t v12 = 0;
  }
LABEL_17:

  return v12;
}

- (void)copyDeviceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  int v6 = a6;
  uint64_t v7 = a4;
  uint64_t v10 = (__CFString *)a5;
  while (1)
  {
    io_registry_entry_t v11 = [(MGIOKitHelper *)self copyDeviceTreeStructureNext:a3 withFirstChar:v7];
    if (!v11) {
      break;
    }
    io_registry_entry_t v12 = v11;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v11, @"IORegistryEntryPropertyKeys", 0, 0);
    if (CFProperty)
    {
      io_registry_entry_t v14 = CFProperty;
      if (v6) {
        CFTypeRef v15 = sub_19D7182D0(v12, CFProperty, v10, v6);
      }
      else {
        CFTypeRef v15 = IORegistryEntryCreateCFProperty(v12, v10, 0, 0);
      }
      CFStringRef v16 = (void *)v15;
      CFRelease(v14);
    }
    else
    {
      CFStringRef v16 = 0;
    }
    IOObjectRelease(v12);
    if (v16) {
      goto LABEL_12;
    }
  }
  CFStringRef v16 = 0;
LABEL_12:

  return v16;
}

- (__CFNumber)copyNumberFromData:(__CFData *)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 != CFDataGetTypeID())
  {
    uint64_t v8 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v8) {
      io_registry_entry_t v14 = v8 + 1;
    }
    else {
      io_registry_entry_t v14 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v14, 279, @"can't create number", v9, v10, v11, v12, v13, v26);
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    __int16 v26 = 0;
    CFTypeRef v15 = MEMORY[0x1E4F14500];
    CFStringRef v16 = "can't create number";
    CFTypeRef v17 = (uint8_t *)&v26;
    goto LABEL_20;
  }
  CFIndex Length = CFDataGetLength(a3);
  if (Length < 8)
  {
    if (Length == 4)
    {
      BytePtr = CFDataGetBytePtr(a3);
      CFNumberType v7 = kCFNumberSInt32Type;
      goto LABEL_12;
    }
    v19 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v19) {
      v25 = v19 + 1;
    }
    else {
      v25 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v25, 276, @"can't create number from data", v20, v21, v22, v23, v24, v26);
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    CFTypeRef v15 = MEMORY[0x1E4F14500];
    CFStringRef v16 = "can't create number from data";
    CFTypeRef v17 = buf;
LABEL_20:
    _os_log_impl(&dword_19D70E000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
    return 0;
  }
  BytePtr = CFDataGetBytePtr(a3);
  CFNumberType v7 = kCFNumberSInt64Type;
LABEL_12:

  return CFNumberCreate(0, v7, BytePtr);
}

- (__CFNumber)copyNumberFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [(MGIOKitHelper *)self copyDeviceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (v12)
  {
    uint64_t v13 = v12;
    io_registry_entry_t v14 = [(MGIOKitHelper *)self copyNumberFromData:v12];
    CFRelease(v13);
  }
  else
  {
    CFTypeRef v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 301, @"Failed to retrieve data %@:%@", v16, v17, v18, v19, v20, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    io_registry_entry_t v14 = 0;
  }

  return v14;
}

- (__CFString)copyStringFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  CFDataRef v12 = [(MGIOKitHelper *)self copyDeviceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (v12)
  {
    CFDataRef v13 = v12;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v13))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v13);
      if (Length >= 1)
      {
        CFIndex v18 = Length;
        do
        {
          unsigned int v19 = *BytePtr++;
          CFStringAppendFormat(Mutable, 0, @"%X", v19);
          --v18;
        }
        while (v18);
      }
LABEL_20:
      CFRelease(v13);
      CFDataRef v13 = (const __CFData *)Mutable;
      goto LABEL_21;
    }
    CFTypeID v27 = CFStringGetTypeID();
    if (v27 != CFGetTypeID(v13))
    {
      v28 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
      if (v28) {
        v34 = v28 + 1;
      }
      else {
        v34 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
      }
      _MGLog((uint64_t)v34, 337, @"Unsupported type.", v29, v30, v31, v32, v33, v36);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported type.", buf, 2u);
      }
      Mutable = 0;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v20 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v20) {
      id v26 = v20 + 1;
    }
    else {
      id v26 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v26, 321, @"Failed to retrieve data %@:%@", v21, v22, v23, v24, v25, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    CFDataRef v13 = 0;
  }
LABEL_21:

  return (__CFString *)v13;
}

- (__CFString)copyStringFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  CFDataRef v12 = [(MGIOKitHelper *)self copyServiceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (v12)
  {
    CFDataRef v13 = v12;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v13))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v13);
      if (Length >= 1)
      {
        CFIndex v18 = Length;
        do
        {
          unsigned int v19 = *BytePtr++;
          CFStringAppendFormat(Mutable, 0, @"%X", v19);
          --v18;
        }
        while (v18);
      }
LABEL_20:
      CFRelease(v13);
      CFDataRef v13 = (const __CFData *)Mutable;
      goto LABEL_21;
    }
    CFTypeID v27 = CFStringGetTypeID();
    if (v27 != CFGetTypeID(v13))
    {
      v28 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
      if (v28) {
        v34 = v28 + 1;
      }
      else {
        v34 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
      }
      _MGLog((uint64_t)v34, 374, @"Unsupported type.", v29, v30, v31, v32, v33, v36);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported type.", buf, 2u);
      }
      Mutable = 0;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v20 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v20) {
      id v26 = v20 + 1;
    }
    else {
      id v26 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v26, 358, @"Failed to retrieve data %@:%@", v21, v22, v23, v24, v25, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    CFDataRef v13 = 0;
  }
LABEL_21:

  return (__CFString *)v13;
}

- (void)copyPropertyFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  CFDataRef v12 = [(MGIOKitHelper *)self copyServiceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (!v12)
  {
    CFDataRef v13 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v13) {
      unsigned int v19 = v13 + 1;
    }
    else {
      unsigned int v19 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v19, 394, @"Failed to retrieve data %@:%@", v14, v15, v16, v17, v18, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
  }

  return v12;
}

- (__CFData)copyDataFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  CFDataRef v12 = [(MGIOKitHelper *)self copyServiceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (!v12)
  {
    id v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22) {
      v28 = v22 + 1;
    }
    else {
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v28, 415, @"Failed to retrieve data %@:%@", v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CFDataRef v13 = v12;
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    uint64_t v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 421, @"Unsupported type: %@", v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }
    CFRelease(v13);
LABEL_14:
    CFDataRef v13 = 0;
  }

  return (__CFData *)v13;
}

- (__CFData)copyDataFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  CFDataRef v12 = [(MGIOKitHelper *)self copyDeviceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (!v12)
  {
    id v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22) {
      v28 = v22 + 1;
    }
    else {
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v28, 440, @"Failed to retrieve data %@:%@", v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CFDataRef v13 = v12;
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    uint64_t v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 446, @"Unsupported type: %@", v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }
    CFRelease(v13);
LABEL_14:
    CFDataRef v13 = 0;
  }

  return (__CFData *)v13;
}

- (__CFBoolean)copyBooleanFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  CFDataRef v12 = [(MGIOKitHelper *)self copyServiceTreeProperty:v10 withFirstChar:v8 propertyName:v11 withPropertyFirstChar:v6];
  if (!v12)
  {
    id v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22) {
      v28 = v22 + 1;
    }
    else {
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v28, 467, @"Failed to retrieve data %@:%@", v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CFDataRef v13 = v12;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    uint64_t v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 473, @"Unsupported type: %@", v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_19D70E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }
    CFRelease(v13);
LABEL_14:
    CFDataRef v13 = 0;
  }

  return (__CFBoolean *)v13;
}

- (__CFArray)iteratorCopyBusyServiceNames
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  io_object_t v4 = IOIteratorNext(self->devIterator);
  if (v4)
  {
    io_object_t v5 = v4;
    uint64_t v6 = MEMORY[0x1E4F14500];
    do
    {
      CFStringRef v7 = IOObjectCopyClass(v5);
      if (v7)
      {
        CFStringRef v8 = v7;
        uint32_t busyState = -1;
        if (IOServiceGetBusyState(v5, &busyState))
        {
          uint64_t v9 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
          if (v9) {
            uint64_t v15 = v9 + 1;
          }
          else {
            uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
          }
          _MGLog((uint64_t)v15, 499, @"Failed to get busy state for service: %@", v10, v11, v12, v13, v14, (char)v8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v27 = v8;
            _os_log_impl(&dword_19D70E000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get busy state for service: %@", buf, 0xCu);
          }
        }
        else if (busyState)
        {
          uint64_t v16 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
          if (v16) {
            id v22 = v16 + 1;
          }
          else {
            id v22 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
          }
          _MGLog((uint64_t)v22, 495, @"Found busy service: %@: busyState: %d", v17, v18, v19, v20, v21, (char)v8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v27 = v8;
            __int16 v28 = 1024;
            uint32_t v29 = busyState;
            _os_log_impl(&dword_19D70E000, v6, OS_LOG_TYPE_DEFAULT, "Found busy service: %@: busyState: %d", buf, 0x12u);
          }
          CFArrayAppendValue(Mutable, v8);
        }
        CFRelease(v8);
      }
      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(self->devIterator);
    }
    while (v5);
  }
  Copy = CFArrayCreateCopy(0, Mutable);
  CFRelease(Mutable);
  return Copy;
}

@end