@interface MGWrapper
+ (id)sharedMGWrapper;
- (BOOL)MGIsDeviceOneOfType:(int64_t)a3;
- (BOOL)MGIsDeviceOneOfTypes:(id)a3;
- (BOOL)isDeviceIPad;
- (BOOL)isDeviceIPhone;
- (BOOL)isDeviceIPod;
- (BOOL)isDeviceVision;
- (BOOL)isHeySiriAlwaysOn;
- (BOOL)isIPadWithVolumePowerSameSide;
- (BOOL)isPlusIPhone;
- (BOOL)isRunningOnSimulator;
- (BOOL)isSmallIPhone;
- (BOOL)isSmallestIPhone;
- (BOOL)supportsSideButtonActivation;
- (id)deviceClass;
- (id)deviceClassiPad;
- (id)deviceClassiPhone;
- (int64_t)getSimulatorDevice;
@end

@implementation MGWrapper

+ (id)sharedMGWrapper
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__MGWrapper_sharedMGWrapper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMGWrapper_onceToken != -1) {
    dispatch_once(&sharedMGWrapper_onceToken, block);
  }
  v2 = (void *)sharedMGWrapper_sharedMGWrapper;
  return v2;
}

uint64_t __28__MGWrapper_sharedMGWrapper__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedMGWrapper_sharedMGWrapper;
  sharedMGWrapper_sharedMGWrapper = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (BOOL)isRunningOnSimulator
{
  return 0;
}

- (BOOL)isPlusIPhone
{
  if ([(MGWrapper *)self MGIsDeviceOneOfType:4]
    || [(MGWrapper *)self MGIsDeviceOneOfType:7])
  {
    return 1;
  }
  return [(MGWrapper *)self MGIsDeviceOneOfType:9];
}

- (BOOL)isSmallIPhone
{
  if ([(MGWrapper *)self MGIsDeviceOneOfType:2]
    || [(MGWrapper *)self MGIsDeviceOneOfType:6])
  {
    return 1;
  }
  return [(MGWrapper *)self MGIsDeviceOneOfType:8];
}

- (BOOL)isSmallestIPhone
{
  if ([(MGWrapper *)self MGIsDeviceOneOfType:1]) {
    return 1;
  }
  return [(MGWrapper *)self MGIsDeviceOneOfType:10];
}

- (BOOL)supportsSideButtonActivation
{
  if (![(MGWrapper *)self isRunningOnSimulator]) {
    return MGGetSInt32Answer() == 2;
  }
  return [(MGWrapper *)self MGIsDeviceOneOfTypes:&unk_26EB98E48];
}

- (int64_t)getSimulatorDevice
{
  uint64_t v2 = [NSString stringWithUTF8String:getenv("SIMULATOR_DEVICE_NAME")];
  v3 = [&unk_26EB98F70 objectForKey:v2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isHeySiriAlwaysOn
{
  if ([(MGWrapper *)self isRunningOnSimulator])
  {
    int64_t v3 = [(MGWrapper *)self getSimulatorDevice];
    int64_t v4 = [NSNumber numberWithInteger:v3];
    char v5 = [&unk_26EB98E60 containsObject:v4];

    return v5;
  }
  else
  {
    return MGGetBoolAnswer();
  }
}

- (id)deviceClass
{
  if ([(MGWrapper *)self isRunningOnSimulator])
  {
    int64_t v3 = [MEMORY[0x263F82670] currentDevice];
    int64_t v4 = [v3 model];
    char v5 = [(MGWrapper *)self deviceClassiPad];
    int v6 = [v4 containsString:v5];

    if (v6) {
      [(MGWrapper *)self deviceClassiPad];
    }
    else {
    v7 = [(MGWrapper *)self deviceClassiPhone];
    }
  }
  else
  {
    v7 = (void *)MGCopyAnswer();
  }
  return v7;
}

- (BOOL)isDeviceIPad
{
  uint64_t v2 = [(MGWrapper *)self deviceClass];
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (BOOL)isDeviceIPhone
{
  uint64_t v2 = [(MGWrapper *)self deviceClass];
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

- (BOOL)isDeviceIPod
{
  uint64_t v2 = [(MGWrapper *)self deviceClass];
  char v3 = [v2 isEqualToString:@"iPod"];

  return v3;
}

- (BOOL)isDeviceVision
{
  uint64_t v2 = [(MGWrapper *)self deviceClass];
  char v3 = [v2 isEqualToString:@"RealityDevice"];

  return v3;
}

- (BOOL)isIPadWithVolumePowerSameSide
{
  if ([(MGWrapper *)self MGIsDeviceOneOfType:31]) {
    return 1;
  }
  return [(MGWrapper *)self MGIsDeviceOneOfType:32];
}

- (BOOL)MGIsDeviceOneOfTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[MGWrapper MGIsDeviceOneOfType:](self, "MGIsDeviceOneOfType:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue", (void)v11)))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)MGIsDeviceOneOfType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      LOBYTE(v5) = MGIsDeviceOneOfType();
      break;
    default:
      int v5 = [(MGWrapper *)self isRunningOnSimulator];
      if (v5) {
        LOBYTE(v5) = [(MGWrapper *)self getSimulatorDevice] == a3;
      }
      break;
  }
  return v5;
}

- (id)deviceClassiPad
{
  return @"iPad";
}

- (id)deviceClassiPhone
{
  return @"iPhone";
}

@end