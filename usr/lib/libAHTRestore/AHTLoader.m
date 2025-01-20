@interface AHTLoader
+ (BOOL)errorFromAfuKextResult:(int)a3 error:(id *)a4;
+ (BOOL)errorFromKernel:(int)a3 error:(id *)a4;
+ (id)allDevices;
+ (id)bootloaderPropertiesForImageTag:(unsigned int)a3;
+ (id)registryPropertiesForService:(unsigned int)a3;
+ (id)withName:(id)a3;
+ (id)withService:(unsigned int)a3;
- (AHTLoader)initWithService:(unsigned int)a3;
- (BOOL)loadImage:(id)a3 payloadOnly:(BOOL)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)open:(id *)a3;
- (BOOL)overrideFDR:(id)a3 fdrClass:(id)a4 fdrSubclass:(id)a5 error:(id *)a6;
- (BOOL)overrideNextLoadOptions:(unint64_t)a3 error:(id *)a4;
- (NSString)name;
- (id)description;
- (id)fullDescription;
- (unsigned)connect;
- (unsigned)imageTag;
- (unsigned)loadingGroup;
- (unsigned)service;
- (void)close;
- (void)dealloc;
- (void)setConnect:(unsigned int)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation AHTLoader

+ (id)allDevices
{
  v13[1] = *MEMORY[0x263EF8340];
  io_iterator_t existing = 0;
  v2 = objc_opt_new();
  CFDictionaryRef v3 = IOServiceMatching("AppleFirmwareUpdateKext");
  if (v3 && !IOServiceGetMatchingServices(0, v3, &existing))
  {
    uint64_t v5 = IOIteratorNext(existing);
    if (v5)
    {
      uint64_t v6 = v5;
      do
      {
        v7 = +[AHTLoader withService:v6];
        IOObjectRelease(v6);
        if (v7) {
          [v2 addObject:v7];
        }

        uint64_t v6 = IOIteratorNext(existing);
      }
      while (v6);
    }
    IOObjectRelease(existing);
    v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:0 comparator:&__block_literal_global];
    v13[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v2 sortUsingDescriptors:v9];

    id v10 = v2;
  }
  else
  {
    id v4 = v2;
  }

  return v2;
}

uint64_t __23__AHTLoader_allDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 loadingGroup];
  if (v6 >= [v5 loadingGroup])
  {
    unsigned int v8 = [v4 loadingGroup];
    uint64_t v7 = v8 > [v5 loadingGroup];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)withName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[AHTLoader allDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 name];
        char v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)withService:(unsigned int)a3
{
  id v3 = [[AHTLoader alloc] initWithService:*(void *)&a3];

  return v3;
}

- (AHTLoader)initWithService:(unsigned int)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AHTLoader;
  id v4 = [(AHTLoader *)&v13 init];
  id v5 = v4;
  uint64_t v6 = 0;
  if (a3 && v4)
  {
    if (!IOObjectConformsTo(a3, "AppleFirmwareUpdateKext")) {
      goto LABEL_8;
    }
    v5->_service = a3;
    IOObjectRetain(a3);
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFProperty = (NSString *)IORegistryEntryCreateCFProperty(a3, @"AHTLoaderName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    name = v5->_name;
    v5->_name = CFProperty;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v10 = (void *)IORegistryEntryCreateCFProperty(a3, @"Image Tag", v7, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5->_imageTag = [v10 unsignedIntValue];
        v11 = (void *)IORegistryEntryCreateCFProperty(a3, @"LoadingGroup", v7, 0);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v5->_loadingGroup = [v11 unsignedIntValue];
          uint64_t v6 = v5;
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    else
    {
LABEL_8:
      uint64_t v6 = 0;
    }
  }

  return v6;
}

+ (id)bootloaderPropertiesForImageTag:(unsigned int)a3
{
  io_iterator_t existing = 0;
  mach_port_t v4 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v5 = IOServiceMatching("AppleHIDTransportBootloader");
  if (IOServiceGetMatchingServices(v4, v5, &existing))
  {
    id v6 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v7 = IOIteratorNext(existing);
      if (!v7) {
        break;
      }
      io_object_t v8 = v7;
      v9 = +[AHTLoader registryPropertiesForService:v7];
      char v10 = [v9 objectForKeyedSubscript:@"image-tag"];
      int v11 = [v10 unsignedIntValue];

      if (v11 == a3) {
        id v6 = v9;
      }
      else {
        id v6 = 0;
      }
      IOObjectRelease(v8);

      if (v6) {
        goto LABEL_10;
      }
    }
    id v6 = 0;
LABEL_10:
    IOObjectRelease(existing);
  }

  return v6;
}

- (void)dealloc
{
  [(AHTLoader *)self close];
  IOObjectRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)AHTLoader;
  [(AHTLoader *)&v3 dealloc];
}

- (BOOL)open:(id *)a3
{
  if (self->_connect) {
    return 1;
  }
  uint64_t v5 = IOServiceOpen(self->_service, *MEMORY[0x263EF8960], 0, &self->_connect);

  return +[AHTLoader errorFromKernel:v5 error:a3];
}

- (void)close
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_io_connect_t connect = 0;
  }
}

- (id)description
{
  objc_super v3 = NSString;
  mach_port_t v4 = [(AHTLoader *)self name];
  uint64_t v5 = [v3 stringWithFormat:@"%@ (%c%c%c%c)", v4, ((int)-[AHTLoader imageTag](self, "imageTag") >> 24), ((int)(-[AHTLoader imageTag](self, "imageTag") << 8) >> 24), ((__int16)-[AHTLoader imageTag](self, "imageTag") >> 8), (char)-[AHTLoader imageTag](self, "imageTag")];

  return v5;
}

- (id)fullDescription
{
  objc_super v3 = [(AHTLoader *)self description];
  mach_port_t v4 = +[AHTLoader bootloaderPropertiesForImageTag:[(AHTLoader *)self imageTag]];
  uint64_t v5 = [NSString stringWithFormat:@"\n\n%-20s | %-60s | %-20s\n", "Description", "Result", "Time (ms)"];
  id v6 = [v3 stringByAppendingString:v5];

  uint64_t v7 = NSString;
  uint64_t v9 = __28__AHTLoader_fullDescription__block_invoke(v8, @"-", 0x14u);
  uint64_t v10 = __28__AHTLoader_fullDescription__block_invoke(v9, @"-", 0x3Cu);
  int v11 = [v7 stringWithFormat:@"%s | %s | %s\n", v9, v10, __28__AHTLoader_fullDescription__block_invoke(v10, @"-", 0x14u)];
  long long v12 = [v6 stringByAppendingString:v11];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __28__AHTLoader_fullDescription__block_invoke_2;
  v21[3] = &unk_264D013B0;
  id v22 = v4;
  id v13 = v4;
  long long v14 = (void (**)(void, void))MEMORY[0x237E30A00](v21);
  long long v15 = ((void (**)(void, const char *))v14)[2](v14, "LoadImage");
  v16 = [v12 stringByAppendingFormat:@"%@\n", v15];

  uint64_t v17 = ((void (**)(void, const char *))v14)[2](v14, "LoadFirmware");
  v18 = [v16 stringByAppendingFormat:@"%@\n", v17];

  v19 = [v18 stringByAppendingString:@"\n"];

  return v19;
}

uint64_t __28__AHTLoader_fullDescription__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  id v3 = [&stru_26EAF0388 stringByPaddingToLength:a3 withString:a2 startingAtIndex:0];
  uint64_t v4 = [v3 UTF8String];

  return v4;
}

id __28__AHTLoader_fullDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSString stringWithFormat:@"AHTBootload%sResult", a2];
  id v6 = [v4 objectForKeyedSubscript:v5];

  mach_error_t v7 = [v6 unsignedIntValue];
  if (v6)
  {
    uint64_t v8 = [NSString stringWithUTF8String:mach_error_string(v7)];
  }
  else
  {
    uint64_t v8 = @"N/A";
  }
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [NSString stringWithFormat:@"AHTBootload%sTimeMs", a2];
  int v11 = [v9 objectForKeyedSubscript:v10];

  uint64_t v12 = [v11 unsignedIntValue];
  if (v11)
  {
    [NSString stringWithFormat:@"%u", v12];
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = @"N/A";
  }
  long long v14 = NSString;
  long long v15 = v8;
  uint64_t v16 = [(__CFString *)v15 UTF8String];
  uint64_t v17 = v13;
  v18 = [v14 stringWithFormat:@"%-20s | %-60s | %-20s", a2, v16, -[__CFString UTF8String](v17, "UTF8String")];

  return v18;
}

+ (BOOL)errorFromKernel:(int)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    mach_error_t v7 = [NSString stringWithUTF8String:mach_error_string(a3)];
    v11[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a4 = [v6 errorWithDomain:@"AppleHIDTransportSupport" code:a3 userInfo:v8];
  }
  return a3 == 0;
}

+ (BOOL)errorFromAfuKextResult:(int)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    if (a3 == 1)
    {
      id v6 = @"kFWDownloadFailure";
    }
    else if (a3 == 2)
    {
      id v6 = @"kFWDownloadAsync";
    }
    else
    {
      [NSString stringWithFormat:@"Unknown FWDownloadStatus: 0x%08X", *(void *)&a3];
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    mach_error_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = v6;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a4 = [v7 errorWithDomain:@"AppleHIDTransportSupport" code:a3 userInfo:v8];
  }
  return a3 == 0;
}

- (BOOL)loadImage:(id)a3 payloadOnly:(BOOL)a4 options:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  input[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  input[0] = [v10 bytes];
  uint64_t v11 = [v10 length];

  input[1] = v11;
  input[2] = v8;
  input[3] = a5;
  if (![(AHTLoader *)self open:a6]) {
    return 0;
  }
  uint64_t v12 = IOConnectCallScalarMethod(self->_connect, 0, input, 4u, 0, 0);
  id v13 = +[AHTLoader bootloaderPropertiesForImageTag:[(AHTLoader *)self imageTag]];
  long long v14 = [v13 objectForKeyedSubscript:@"AHTBootloadLoadImageResult"];
  long long v15 = v14;
  if (v13 && v14) {
    BOOL v16 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", [v14 intValue], a6);
  }
  else {
    BOOL v16 = +[AHTLoader errorFromAfuKextResult:v12 error:a6];
  }
  BOOL v17 = v16;

  return v17;
}

- (BOOL)overrideFDR:(id)a3 fdrClass:(id)a4 fdrSubclass:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  long long v14 = v13;
  if (v12)
  {
    long long v14 = [NSString stringWithFormat:@"%@/%@", v13, v12];
  }
  long long v15 = [v14 dataUsingEncoding:4];
  BOOL v16 = [objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:[v10 length] + [v15 length]];
  [v16 appendData:v15];
  [v16 appendData:v10];
  id v17 = v16;
  input[0] = [v17 bytes];
  input[1] = [v17 length];
  input[2] = [v15 length];
  long long v21 = xmmword_237DA02B0;
  if ([(AHTLoader *)self open:a6]) {
    BOOL v18 = +[AHTLoader errorFromKernel:IOConnectCallScalarMethod(self->_connect, 1u, input, 5u, 0, 0) error:a6];
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)overrideNextLoadOptions:(unint64_t)a3 error:(id *)a4
{
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(a4) = +[AHTLoader errorFromKernel:IORegistryEntrySetCFProperty(self->_service, @"AIDNextLoadOptions", v6) error:a4];

  return (char)a4;
}

+ (id)registryPropertiesForService:(unsigned int)a3
{
  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)) {
    CFMutableDictionaryRef v3 = 0;
  }
  else {
    CFMutableDictionaryRef v3 = properties;
  }

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)imageTag
{
  return self->_imageTag;
}

- (unsigned)loadingGroup
{
  return self->_loadingGroup;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_io_connect_t connect = a3;
}

- (void).cxx_destruct
{
}

@end