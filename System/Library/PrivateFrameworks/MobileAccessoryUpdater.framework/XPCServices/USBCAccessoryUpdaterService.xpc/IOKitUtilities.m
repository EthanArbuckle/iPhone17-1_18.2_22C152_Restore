@interface IOKitUtilities
+ (int)arrayForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(id *)a5;
+ (int)isRegistryEntry:(unsigned int)a3 descendentOfRegistryEntry:(unsigned int)a4 outValue:(BOOL *)a5;
+ (int)uint32ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(unsigned int *)a5;
+ (int)uint64ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(unint64_t *)a5;
+ (int)uint8ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(char *)a5;
@end

@implementation IOKitUtilities

+ (int)uint8ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(char *)a5
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 0;
    *a5 = [CFProperty unsignedCharValue];
  }
  else
  {
    int v7 = -536870160;
  }

  return v7;
}

+ (int)uint32ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(unsigned int *)a5
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 0;
    *a5 = [CFProperty unsignedLongValue];
  }
  else
  {
    int v7 = -536870160;
  }

  return v7;
}

+ (int)uint64ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(unint64_t *)a5
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  if (CFProperty) {
    int v7 = 0;
  }
  else {
    int v7 = -536870212;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = -536870160;
  }
  if (!v8) {
    *a5 = (unint64_t)[CFProperty unsignedLongLongValue];
  }

  return v8;
}

+ (int)arrayForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(id *)a5
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 0;
    *a5 = CFProperty;
  }
  else
  {
    int v7 = -536870160;
  }

  return v7;
}

+ (int)isRegistryEntry:(unsigned int)a3 descendentOfRegistryEntry:(unsigned int)a4 outValue:(BOOL *)a5
{
  int result = -536870206;
  if (a3 && a4 && a5)
  {
    io_registry_entry_t v9 = a3;
    do
    {
      io_object_t v10 = v9;
      if (v9 == a4) {
        break;
      }
      io_registry_entry_t parent = 0;
      int result = IORegistryEntryGetParentEntry(v9, "IOService", &parent);
      if (result) {
        return result;
      }
      if (v10 != a3) {
        IOObjectRelease(v10);
      }
      io_registry_entry_t v9 = parent;
    }
    while (parent);
    int result = 0;
    *a5 = v10 == a4;
  }
  return result;
}

@end