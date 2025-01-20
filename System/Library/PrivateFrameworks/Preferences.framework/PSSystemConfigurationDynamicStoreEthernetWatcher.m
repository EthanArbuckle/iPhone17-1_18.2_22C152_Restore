@interface PSSystemConfigurationDynamicStoreEthernetWatcher
+ (id)sharedManager;
- (BOOL)hasEthernetNetworkInterfaces;
- (BOOL)isHiddenEthernetInterface:(__SCNetworkInterface *)a3;
- (PSSystemConfigurationDynamicStoreEthernetWatcher)init;
- (id)ethernetNetworkInterfaces;
- (void)dealloc;
- (void)ethernetDynamicStoreDidChange;
- (void)registerForEthernetAdapterNotifications;
@end

@implementation PSSystemConfigurationDynamicStoreEthernetWatcher

- (BOOL)hasEthernetNetworkInterfaces
{
  v2 = [(PSSystemConfigurationDynamicStoreEthernetWatcher *)self ethernetNetworkInterfaces];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)ethernetNetworkInterfaces
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = socket(30, 1, 0);
  if (v4 < 0)
  {
    CFArrayRef v5 = 0;
    goto LABEL_20;
  }
  CFArrayRef v5 = SCNetworkInterfaceCopyAll();
  uint64_t v6 = [(__CFArray *)v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    v19 = v3;
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = (const __SCNetworkInterface *)[(__CFArray *)v5 objectAtIndex:i];
      unsigned int valuePtr = 0;
      *(_OWORD *)__dst = 0u;
      long long v22 = 0u;
      if (v9)
      {
        v10 = v9;
        v11 = SCNetworkInterfaceGetBSDName(v9);
        id v12 = v11;
        if (v11)
        {
          v13 = [v11 substringToIndex:2];
          int v14 = [v13 isEqualToString:@"en"];

          if (v14)
          {
            if (![(PSSystemConfigurationDynamicStoreEthernetWatcher *)self isHiddenEthernetInterface:v10])
            {
              CFNumberRef IOInterfaceType = (const __CFNumber *)_SCNetworkInterfaceGetIOInterfaceType();
              if (IOInterfaceType)
              {
                CFNumberGetValue(IOInterfaceType, kCFNumberSInt32Type, &valuePtr);
                if (valuePtr == 6)
                {
                  CFNumberRef FamilyType = (const __CFNumber *)_SCNetworkInterfaceGetFamilyType();
                  if (FamilyType)
                  {
                    CFNumberGetValue(FamilyType, kCFNumberSInt32Type, &valuePtr);
                    if (valuePtr == 2)
                    {
                      CFNumberRef FamilySubType = (const __CFNumber *)_SCNetworkInterfaceGetFamilySubType();
                      if (FamilySubType)
                      {
                        CFNumberGetValue(FamilySubType, kCFNumberSInt32Type, &valuePtr);
                        if (valuePtr <= 1)
                        {
                          id v12 = v12;
                          strncpy(__dst, (const char *)[v12 UTF8String], 0x10uLL);
                          if (ioctl(v4, 0xC020698EuLL, __dst) || (BYTE3(v22) & 0x20) == 0) {
                            [v19 addObject:v10];
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    BOOL v3 = v19;
LABEL_20:
    if (v4 == -1) {
      goto LABEL_22;
    }
  }
  close(v4);
LABEL_22:

  return v3;
}

- (BOOL)isHiddenEthernetInterface:(__SCNetworkInterface *)a3
{
  *(void *)mainPort = 0;
  io_registry_entry_t parent = 0;
  uint64_t IORegistryEntryID = _SCNetworkInterfaceGetIORegistryEntryID();
  if (!IORegistryEntryID)
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  uint64_t v4 = IORegistryEntryID;
  IOMasterPort(*MEMORY[0x1E4F14638], &mainPort[1]);
  mach_port_t v5 = mainPort[1];
  if (!mainPort[1])
  {
    io_object_t v8 = 0;
LABEL_9:
    if (mainPort[0]) {
      IOObjectRelease(mainPort[0]);
    }
    if (v8) {
      IOObjectRelease(v8);
    }
    goto LABEL_13;
  }
  CFDictionaryRef v6 = IORegistryEntryIDMatching(v4);
  IOServiceGetMatchingServices(v5, v6, mainPort);
  if (mainPort[0])
  {
    io_object_t v7 = IOIteratorNext(mainPort[0]);
    io_object_t v8 = v7;
    if (v7 && (IORegistryEntryGetParentEntry(v7, "IOService", &parent), parent))
    {
      if (IOObjectConformsTo(parent, "AppleUSBDeviceNCMData")) {
        LOBYTE(v5) = 1;
      }
      else {
        LOBYTE(v5) = IOObjectConformsTo(parent, "AppleUSBEthernetDevice") != 0;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
    goto LABEL_9;
  }
  LOBYTE(v5) = 0;
LABEL_13:
  if (parent) {
    IOObjectRelease(parent);
  }
LABEL_15:
  if (mainPort[1]) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], mainPort[1]);
  }
  return v5;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PSSystemConfigurationDynamicStoreEthernetWatcher_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_cacheOnce_160 != -1) {
    dispatch_once(&sharedManager_cacheOnce_160, block);
  }
  v2 = (void *)sharedManager_gSharedEthernetWatcherInstance;
  return v2;
}

uint64_t __65__PSSystemConfigurationDynamicStoreEthernetWatcher_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_gSharedEthernetWatcherInstance;
  sharedManager_gSharedEthernetWatcherInstance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (PSSystemConfigurationDynamicStoreEthernetWatcher)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSSystemConfigurationDynamicStoreEthernetWatcher;
  uint64_t v2 = [(PSSystemConfigurationDynamicStoreEthernetWatcher *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(PSSystemConfigurationDynamicStoreEthernetWatcher *)v2 registerForEthernetAdapterNotifications];
  }
  return v3;
}

- (void)registerForEthernetAdapterNotifications
{
  v29.version = 0;
  memset(&v29.retain, 0, 24);
  v29.info = self;
  if (!self->_dynamicStore)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v4 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.preferences.EthernetMananger", (SCDynamicStoreCallBack)__registerForEthernetAdapterNotificationsCallback, &v29);
    self->_dynamicStore = v4;
    if (v4)
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(v3, v4, 0);
      self->_dynamicStoreSource = RunLoopSource;
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_dynamicStoreSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        if (Mutable)
        {
          io_object_t v8 = Mutable;
          CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F41AC8];
          CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F41B10];
          CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
          if (NetworkGlobalEntity)
          {
            CFStringRef v12 = NetworkGlobalEntity;
            CFArrayAppendValue(v8, NetworkGlobalEntity);
            CFRelease(v12);
            CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F41B18];
            CFStringRef v14 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v9, (CFStringRef)*MEMORY[0x1E4F41B18]);
            if (v14)
            {
              CFStringRef v15 = v14;
              CFArrayAppendValue(v8, v14);
              CFRelease(v15);
              CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(v3, v9);
              if (NetworkInterface)
              {
                CFStringRef v17 = NetworkInterface;
                CFArrayAppendValue(v8, NetworkInterface);
                CFRelease(v17);
                CFMutableArrayRef v18 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
                if (v18)
                {
                  v19 = v18;
                  CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F41AB8];
                  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v9, (CFStringRef)*MEMORY[0x1E4F41AB8], v10);
                  if (NetworkServiceEntity)
                  {
                    CFStringRef v22 = NetworkServiceEntity;
                    CFArrayAppendValue(v19, NetworkServiceEntity);
                    CFRelease(v22);
                    CFStringRef v23 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v9, v20, v13);
                    if (v23)
                    {
                      CFStringRef v24 = v23;
                      CFArrayAppendValue(v19, v23);
                      CFRelease(v24);
                      CFStringRef v25 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, (CFStringRef)*MEMORY[0x1E4F41AC0], v20, (CFStringRef)*MEMORY[0x1E4F41B20]);
                      if (v25)
                      {
                        CFStringRef v26 = v25;
                        CFArrayAppendValue(v19, v25);
                        CFRelease(v26);
                        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v3, v9, v20, (CFStringRef)*MEMORY[0x1E4F41B28]);
                        if (NetworkInterfaceEntity)
                        {
                          CFStringRef v28 = NetworkInterfaceEntity;
                          CFArrayAppendValue(v19, NetworkInterfaceEntity);
                          CFRelease(v28);
                          SCDynamicStoreSetNotificationKeys(self->_dynamicStore, v8, v19);
                        }
                      }
                    }
                  }
                  CFRelease(v19);
                }
              }
            }
          }
          CFRelease(v8);
        }
      }
    }
  }
}

- (void)dealloc
{
  if (self->_dynamicStoreSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_dynamicStoreSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_dynamicStoreSource);
  }
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSSystemConfigurationDynamicStoreEthernetWatcher;
  [(PSSystemConfigurationDynamicStoreEthernetWatcher *)&v5 dealloc];
}

- (void)ethernetDynamicStoreDidChange
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.Preferences.Ethernet" object:0];
}

@end