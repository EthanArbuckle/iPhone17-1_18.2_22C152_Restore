@interface PPMClient
+ (id)sharedInstanceWithClientRepresentation:(id)a3 error:(id *)a4;
+ (id)sharedInstanceWithClientRepresentation:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)activityStartedWithLevel:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)activityStoppedWithLevel:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)admissionCheckWithLevel:(id)a3 options:(id)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)endInteraction:(id *)a3;
- (BOOL)pushTelemetryToPPM:(__CFDictionary *)a3 error:(id *)a4;
- (BOOL)registerForNotificationsWithError:(id *)a3 handler:(id)a4;
- (BOOL)setupIOKitUserClientWith:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (PPMClient)initWithClientIdentifier:(id)a3;
- (PPMClientUserClientInterface)userClient;
- (int)getClientNumber:(id)a3;
- (unsigned)connect;
- (unsigned)version;
- (void)setConnect:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setUserClient:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation PPMClient

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)pushTelemetryToPPM:(__CFDictionary *)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v6 = [(PPMClient *)self identifier];
  int v7 = [(PPMClient *)self getClientNumber:v6];

  if (v7 == -1)
  {
    NSLog(&cfstr_PpmErrorUnsupp_3.isa);
    return 0;
  }
  bzero(&v30, 0xA54uLL);
  int v29 = v7;
  int Count = CFDictionaryGetCount(a3);
  int v9 = Count;
  if (v7 != 7)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    memset(keys, 0, sizeof(keys));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    *(_OWORD *)values = 0u;
    long long v34 = 0u;
    CFDictionaryGetKeysAndValues(a3, (const void **)keys, (const void **)values);
    unsigned int v30 = v9;
    if (!v9) {
      return [(PPMClientUserClientInterface *)self->userClient pushTelemetry:self->connect userDictRef:&v29] == 0;
    }
    unint64_t v23 = 0;
    v24 = v31;
    v25 = v32;
    v26 = @"PPM Error: failed to get keys from telemetry\n";
    while (1)
    {
      if (!CFStringGetCString((CFStringRef)keys[v23], v24, 128, 0x600u)) {
        goto LABEL_29;
      }
      if (!CFNumberGetValue((CFNumberRef)values[v23], kCFNumberIntType, v25)) {
        break;
      }
      ++v23;
      v24 += 128;
      ++v25;
      if (v23 >= v30) {
        return [(PPMClientUserClientInterface *)self->userClient pushTelemetry:self->connect userDictRef:&v29] == 0;
      }
    }
    v26 = @"PPM Error: failed to get values from telemetry\n";
LABEL_29:
    NSLog(&v26->isa);
    return 0;
  }
  if (Count >= 9)
  {
    NSLog(&cfstr_PpmErrorSpaceN.isa);
    return 0;
  }
  uint64_t v10 = 0;
  unsigned int v30 = 0;
  while (1)
  {
    v11 = kDefinedBasebandTelemetryKeys[v10];
    Value = CFDictionaryGetValue(a3, v11);
    if (Value)
    {
      v13 = Value;
      if (CFStringCompare(v11, @"kPPMTxHistogram", 0) || (CFTypeID v14 = CFGetTypeID(v13), v14 != CFArrayGetTypeID()))
      {
        CFTypeID v21 = CFGetTypeID(v13);
        if (v21 == CFNumberGetTypeID())
        {
          CFStringGetCString(v11, &v31[128 * (unint64_t)v30], 128, 0x8000100u);
          CFNumberGetValue((CFNumberRef)v13, kCFNumberIntType, &v32[v30++]);
        }
        else
        {
          CFTypeID v22 = CFGetTypeID(v13);
          NSLog(&cfstr_PpmErrorBaseba_0.isa, v11, v22);
        }
        goto LABEL_19;
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      *(_OWORD *)values = 0u;
      long long v34 = 0u;
      int v15 = CFArrayGetCount((CFArrayRef)v13);
      int v16 = v15;
      if (v15 >= 13)
      {
        NSLog(&cfstr_PpmErrorBaseba.isa);
        return 0;
      }
      v54.length = v15;
      v54.location = 0;
      CFArrayGetValues((CFArrayRef)v13, v54, (const void **)values);
      if (v16 >= 1) {
        break;
      }
    }
LABEL_19:
    if (++v10 == 7) {
      return [(PPMClientUserClientInterface *)self->userClient pushTelemetry:self->connect userDictRef:&v29] == 0;
    }
  }
  uint64_t v17 = 0;
  while (1)
  {
    int valuePtr = 0;
    if (!CFNumberGetValue((CFNumberRef)values[v17], kCFNumberIntType, &valuePtr)) {
      break;
    }
    if (valuePtr)
    {
      v18 = &v31[128 * (unint64_t)v30];
      long long v46 = xmmword_21E67F1C8;
      long long v47 = unk_21E67F1D8;
      long long v48 = xmmword_21E67F1E8;
      long long v49 = unk_21E67F1F8;
      strcpy((char *)keys, "kPPMTxHistogramBin");
      BYTE3(keys[2]) = unk_21E67F19B;
      HIDWORD(keys[2]) = unk_21E67F19C;
      keys[3] = (void *)unk_21E67F1A0;
      long long v44 = xmmword_21E67F1A8;
      long long v45 = unk_21E67F1B8;
      __sprintf_chk(v52, 0, 0x20uLL, "%d", v17);
      v19 = (const char *)__strcat_chk();
      strcpy(v18, v19);
      unsigned int v20 = v30;
      v32[v30] = valuePtr;
      unsigned int v30 = v20 + 1;
    }
    if (v16 == ++v17) {
      goto LABEL_19;
    }
  }
  NSLog(&cfstr_PpmErrorFailed.isa);
  return 0;
}

- (int)getClientNumber:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.duet.ppm-attr.stck"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.duet.ppm-attr.wifi"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"com.apple.duet.ppm-attr.bsbd"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (PPMClient)initWithClientIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPMClient;
  v6 = [(PPMClient *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->identifier, a3);
  }

  return v7;
}

+ (id)sharedInstanceWithClientRepresentation:(id)a3 error:(id *)a4
{
  return (id)[a1 sharedInstanceWithClientRepresentation:a3 options:0 error:a4];
}

+ (id)sharedInstanceWithClientRepresentation:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__PPMClient_sharedInstanceWithClientRepresentation_options_error___block_invoke;
  block[3] = &unk_2644B9C68;
  id v11 = v5;
  uint64_t v6 = sharedInstanceWithClientRepresentation_options_error__onceToken;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&sharedInstanceWithClientRepresentation_options_error__onceToken, block);
  }
  id v8 = (id)sharedInstanceWithClientRepresentation_options_error__sharedInstance;

  return v8;
}

void __66__PPMClient_sharedInstanceWithClientRepresentation_options_error___block_invoke(uint64_t a1)
{
  v1 = [[PPMClient alloc] initWithClientIdentifier:*(void *)(a1 + 32)];
  v2 = (void *)sharedInstanceWithClientRepresentation_options_error__sharedInstance;
  sharedInstanceWithClientRepresentation_options_error__sharedInstance = (uint64_t)v1;

  id v3 = (void *)sharedInstanceWithClientRepresentation_options_error__sharedInstance;
  if (sharedInstanceWithClientRepresentation_options_error__sharedInstance)
  {
    int v4 = [(id)sharedInstanceWithClientRepresentation_options_error__sharedInstance identifier];
    char v5 = [v3 setupIOKitUserClientWith:v4 error:0];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (void *)sharedInstanceWithClientRepresentation_options_error__sharedInstance;
      sharedInstanceWithClientRepresentation_options_error__sharedInstance = 0;
    }
  }
}

- (BOOL)registerForNotificationsWithError:(id *)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  *(void *)existing = 0;
  uint64_t v6 = dispatch_queue_create("ppmNotificationQueue", 0);
  mach_port_t v7 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v8 = IOServiceMatching("ApplePPM");
  uint64_t MatchingServices = IOServiceGetMatchingServices(v7, v8, &existing[1]);
  if (MatchingServices)
  {
    NSLog(&cfstr_PpmErrorIoserv.isa, MatchingServices, *(void *)existing);
LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = IOIteratorNext(existing[1]);
  if (v10)
  {
    uint64_t v11 = v10;
    while (1)
    {
      memset(v20, 0, 128);
      memset(v19, 0, sizeof(v19));
      if (MEMORY[0x223C2DF50](v11, v20)) {
        v20[0] = 0;
      }
      gNotifyPort = (uint64_t)IONotificationPortCreate(v7);
      IONotificationPortSetDispatchQueue((IONotificationPortRef)gNotifyPort, v6);
      uint64_t v12 = MEMORY[0x223C2DF60](v11, "IOService", v19);
      if (v12)
      {
        NSLog(&cfstr_PpmErrorIoregi.isa, v12, *(void *)existing);
        IONotificationPortDestroy((IONotificationPortRef)gNotifyPort);
        goto LABEL_13;
      }
      uint64_t v13 = IOServiceAddInterestNotification((IONotificationPortRef)gNotifyPort, v11, "IOGeneralInterest", (IOServiceInterestCallback)budgetNotificationCallback, self, existing);
      if (v13) {
        break;
      }
      IOObjectRelease(v11);
      uint64_t v11 = IOIteratorNext(existing[1]);
      if (!v11) {
        goto LABEL_10;
      }
    }
    NSLog(&cfstr_PpmErrorIoserv_0.isa, v13, *(void *)existing);
LABEL_13:
    IOObjectRelease(v11);
    goto LABEL_14;
  }
LABEL_10:
  IOObjectRelease(existing[1]);
  uint64_t v14 = MEMORY[0x223C2E130](v5);
  int v15 = (void *)handler;
  handler = v14;

  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)setupIOKitUserClientWith:(id)a3 error:(id *)a4
{
  id v5 = a3;
  *(void *)existing = 0;
  mach_port_t v6 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v7 = IOServiceMatching("ApplePPM");
  uint64_t MatchingServices = IOServiceGetMatchingServices(v6, v7, existing);
  if (!MatchingServices)
  {
    io_object_t v11 = IOIteratorNext(existing[0]);
    if (!v11)
    {
      IOObjectRelease(existing[0]);
      NSLog(&cfstr_PpmErrorNoMatc.isa);
      goto LABEL_3;
    }
    io_service_t v12 = v11;
    uint64_t v13 = (task_port_t *)MEMORY[0x263EF8960];
    do
    {
      uint64_t v14 = IOServiceOpen(v12, *v13, 0, &existing[1]);
      if (v14)
      {
        NSLog(&cfstr_PpmErrorIoserv_1.isa, v14);
        IOObjectRelease(v12);
        goto LABEL_3;
      }
      IOObjectRelease(v12);
      io_service_t v12 = IOIteratorNext(existing[0]);
    }
    while (v12);
    IOObjectRelease(existing[0]);
    int v15 = objc_alloc_init(PPMClientUserClientInterface);
    if (v15)
    {
      [(PPMClient *)self setUserClient:v15];
      uint64_t v16 = [(PPMClient *)self getClientNumber:v5];
      if (v16 == -1)
      {
        NSLog(&cfstr_PpmErrorUnsupp.isa);
      }
      else
      {
        uint64_t v17 = v16;
        [(PPMClient *)self setIdentifier:v5];
        uint64_t v18 = [(PPMClientUserClientInterface *)self->userClient openPPMUserClient:existing[1] clientNumber:v17];
        if (!v18)
        {
          [(PPMClient *)self setConnect:existing[1]];
          BOOL v9 = 1;
          goto LABEL_17;
        }
        NSLog(&cfstr_PpmErrorOpenpp.isa, v18);
      }
    }
    BOOL v9 = 0;
LABEL_17:

    goto LABEL_4;
  }
  NSLog(&cfstr_PpmErrorIoserv.isa, MatchingServices);
LABEL_3:
  BOOL v9 = 0;
LABEL_4:

  return v9;
}

- (BOOL)admissionCheckWithLevel:(id)a3 options:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v8 = a3;
  BOOL v9 = (void (**)(id, BOOL, void))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = [v8 intValue];
  }
  else {
    uint64_t v10 = 1;
  }
  int v18 = 0;
  io_object_t v11 = [(PPMClient *)self identifier];
  NSLog(&cfstr_PpmAdmissionch.isa, v11, v10, v8);

  io_service_t v12 = [(PPMClient *)self identifier];
  uint64_t v13 = [(PPMClient *)self getClientNumber:v12];

  if (v13 == -1)
  {
    NSLog(&cfstr_PpmErrorUnsupp_0.isa, v17);
    goto LABEL_8;
  }
  uint64_t v14 = [(PPMClientUserClientInterface *)self->userClient admissionCheckOfValuePPM:self->connect clientNumber:v13 level:v10 result:&v18];
  if (v14)
  {
    NSLog(&cfstr_PpmErrorAdmiss.isa, v14);
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  if (v9) {
    v9[2](v9, v18 != 0, MEMORY[0x263EFFA78]);
  }
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)activityStoppedWithLevel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = [v6 intValue];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [(PPMClient *)self identifier];
  uint64_t v9 = [(PPMClient *)self getClientNumber:v8];

  if (v9 == -1)
  {
    NSLog(&cfstr_PpmErrorUnsupp_1.isa);
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = [(PPMClientUserClientInterface *)self->userClient stopActivity:self->connect clientNumber:v9 level:v7] == 0;
  }

  return v10;
}

- (BOOL)endInteraction:(id *)a3
{
  return 1;
}

- (BOOL)activityStartedWithLevel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = [v6 intValue];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [(PPMClient *)self identifier];
  uint64_t v9 = [(PPMClient *)self getClientNumber:v8];

  if (v9 == -1)
  {
    NSLog(&cfstr_PpmErrorUnsupp_2.isa);
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = [(PPMClientUserClientInterface *)self->userClient startActivity:self->connect clientNumber:v9 level:v7] == 0;
  }

  return v10;
}

- (PPMClientUserClientInterface)userClient
{
  return (PPMClientUserClientInterface *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserClient:(id)a3
{
}

- (unsigned)connect
{
  return self->connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->connect = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)version
{
  return self->version;
}

- (void)setVersion:(unsigned int)a3
{
  self->version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->userClient, 0);
}

@end