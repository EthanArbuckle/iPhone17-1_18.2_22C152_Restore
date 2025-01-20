@interface TSDCapabilities
+ (id)currentCapabilities;
+ (id)currentCapabilitiesOverride;
+ (void)setCurrentCapabilitiesOverride:(id)a3;
- (BOOL)hasLightningPort;
- (BOOL)isMetalCapable;
- (BOOL)isRendererH3OrBelow;
- (BOOL)isRendererH4OrBelow;
- (BOOL)isRendererH5OrBelow;
- (BOOL)p_isMetalCapable;
- (CGSize)maximumHardcodedTextureSize;
- (CGSize)maximumMetalTextureSizeForDevice:(id)a3;
- (CGSize)maximumTextureSize;
- (TSDCapabilities)init;
- (int64_t)device;
- (int64_t)deviceType;
- (int64_t)platform;
- (int64_t)renderer;
- (void)p_setupDevice;
- (void)p_setupPlatform;
@end

@implementation TSDCapabilities

- (void)p_setupPlatform
{
  self->_platform = 1;
}

- (void)p_setupDevice
{
  v3 = (void *)[MEMORY[0x263F1C5C0] platformString];
  if ([v3 hasPrefix:@"iPod3,"])
  {
    unint64_t v4 = 1;
LABEL_5:
    int64x2_t v5 = vdupq_n_s64(v4);
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPod4,"])
  {
    unint64_t v4 = 2;
    goto LABEL_5;
  }
  if ([v3 hasPrefix:@"iPod5,"])
  {
    int64x2_t v5 = (int64x2_t)xmmword_22383A9A0;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPhone2,"])
  {
    int64x2_t v5 = (int64x2_t)xmmword_22383A9B0;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPhone3,"])
  {
    int64x2_t v5 = (int64x2_t)xmmword_22383A9C0;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPhone4,"])
  {
    int64x2_t v5 = (int64x2_t)xmmword_22383A9D0;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPhone5,"])
  {
    int64x2_t v5 = (int64x2_t)xmmword_22383A9E0;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPad1,"])
  {
    int64x2_t v5 = (int64x2_t)xmmword_22383A9F0;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"iPad2,"])
  {
    char v6 = [v3 hasPrefix:@"iPad2,1"];
    int64x2_t v5 = (int64x2_t)xmmword_22383AA20;
    if (v6) {
      goto LABEL_6;
    }
    long long v14 = xmmword_22383AA20;
    if (([v3 hasPrefix:@"iPad2,2"] & 1) == 0)
    {
      char v7 = [v3 hasPrefix:@"iPad2,3"];
      int64x2_t v5 = (int64x2_t)xmmword_22383AA20;
      if (v7) {
        goto LABEL_6;
      }
      if (objc_msgSend(v3, "hasPrefix:", @"iPad2,4", COERCE_DOUBLE(9)))
      {
        int64x2_t v5 = (int64x2_t)xmmword_22383AA30;
        goto LABEL_6;
      }
      char v12 = [v3 hasPrefix:@"iPad2,5"];
      int64x2_t v5 = (int64x2_t)xmmword_22383AA40;
      if (v12) {
        goto LABEL_6;
      }
      long long v14 = xmmword_22383AA40;
      if (([v3 hasPrefix:@"iPad2,6"] & 1) == 0)
      {
        char v13 = [v3 hasPrefix:@"iPad2,7"];
        int64x2_t v5 = (int64x2_t)xmmword_22383AA40;
        if ((v13 & 1) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
LABEL_29:
    int64x2_t v5 = (int64x2_t)v14;
    goto LABEL_6;
  }
  if (![v3 hasPrefix:@"iPad3,"]) {
    goto LABEL_7;
  }
  char v8 = [v3 hasPrefix:@"iPad3,1"];
  int64x2_t v5 = (int64x2_t)xmmword_22383AA00;
  if ((v8 & 1) == 0)
  {
    long long v14 = xmmword_22383AA00;
    if (([v3 hasPrefix:@"iPad3,2"] & 1) == 0)
    {
      char v9 = [v3 hasPrefix:@"iPad3,3"];
      int64x2_t v5 = (int64x2_t)xmmword_22383AA00;
      if (v9) {
        goto LABEL_6;
      }
      char v10 = objc_msgSend(v3, "hasPrefix:", @"iPad3,4", COERCE_DOUBLE(10));
      int64x2_t v5 = (int64x2_t)xmmword_22383AA10;
      if (v10) {
        goto LABEL_6;
      }
      long long v14 = xmmword_22383AA10;
      if (([v3 hasPrefix:@"iPad3,5"] & 1) == 0)
      {
        int v11 = [v3 hasPrefix:@"iPad3,6"];
        int64x2_t v5 = (int64x2_t)xmmword_22383AA10;
        if (!v11) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
    goto LABEL_29;
  }
LABEL_6:
  *(int64x2_t *)&self->_device = v5;
LABEL_7:
  self->_deviceType = TSDCapabilitiesDeviceTypeFromHWModelString(v3);
}

- (TSDCapabilities)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCapabilities;
  v2 = [(TSDCapabilities *)&v4 init];
  if (v2)
  {
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_55);
    }
    [(TSDCapabilities *)v2 p_setupPlatform];
    [(TSDCapabilities *)v2 p_setupDevice];
  }
  return v2;
}

uint64_t __23__TSDCapabilities_init__block_invoke()
{
  uint64_t result = objc_opt_new();
  s_virtualScreenToMaximumTextureSizeDict = result;
  return result;
}

+ (id)currentCapabilities
{
  if (currentCapabilities_sOnce != -1) {
    dispatch_once(&currentCapabilities_sOnce, &__block_literal_global_98);
  }
  id v2 = (id)currentCapabilities_sCurrentCapabilities;

  return v2;
}

TSDCapabilities *__38__TSDCapabilities_currentCapabilities__block_invoke()
{
  uint64_t result = objc_alloc_init(TSDCapabilities);
  currentCapabilities_sCurrentCapabilities = (uint64_t)result;
  return result;
}

- (BOOL)isRendererH3OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 2;
}

- (BOOL)isRendererH4OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 5;
}

- (BOOL)isRendererH5OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 7;
}

- (BOOL)hasLightningPort
{
  return (self->_device > 0x26uLL) | (0x3FFFFFF88EuLL >> self->_device) & 1;
}

- (CGSize)maximumTextureSize
{
  if (self->_platform == 1 && ![(TSDCapabilities *)self isRendererH3OrBelow]) {
    uint64_t v2 = 0x40B0000000000000;
  }
  else {
    uint64_t v2 = 0x40A0000000000000;
  }
  double v3 = *(double *)&v2;
  double v4 = *(double *)&v2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumHardcodedTextureSize
{
  int64_t platform = self->_platform;
  if ((unint64_t)(platform - 2) < 2)
  {
    uint64_t v5 = 0x40C0000000000000;
    goto LABEL_6;
  }
  double v4 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (!platform)
  {
    char v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDCapabilities maximumHardcodedTextureSize]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCapabilities.m"), 328, @"Unknown platform!");
    goto LABEL_8;
  }
  if (platform == 1)
  {
    uint64_t v5 = 0x40B0000000000000;
LABEL_6:
    double v3 = *(double *)&v5;
    double v4 = *(double *)&v5;
  }
LABEL_8:
  double v8 = v4;
  double v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)maximumMetalTextureSizeForDevice:(id)a3
{
  [(TSDCapabilities *)self maximumHardcodedTextureSize];
  double v6 = v5;
  double v8 = v7;
  if ([(TSDCapabilities *)self isMetalCapable])
  {
    if (([a3 supportsFeatureSet:0] & 1) != 0
      || ([a3 supportsFeatureSet:1] & 1) != 0)
    {
      *(double *)&uint64_t v9 = 4096.0;
    }
    else
    {
      if (([a3 supportsFeatureSet:2] & 1) == 0
        && ([a3 supportsFeatureSet:3] & 1) == 0
        && ([a3 supportsFeatureSet:5] & 1) == 0
        && ([a3 supportsFeatureSet:6] & 1) == 0
        && ([a3 supportsFeatureSet:8] & 1) == 0)
      {
        if ([a3 supportsFeatureSet:9]) {
          double v6 = 8192.0;
        }
        else {
          double v6 = 16384.0;
        }
        goto LABEL_12;
      }
      *(double *)&uint64_t v9 = 8192.0;
    }
    double v6 = *(double *)&v9;
LABEL_12:
    double v8 = v6;
  }
  double v10 = v6;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)p_isMetalCapable
{
  return MTLCreateSystemDefaultDevice() != 0;
}

- (BOOL)isMetalCapable
{
  return 0;
}

+ (id)currentCapabilitiesOverride
{
  return (id)sCurrentCapabilitiesOverride;
}

+ (void)setCurrentCapabilitiesOverride:(id)a3
{
  sCurrentCapabilitiesOverride = (uint64_t)a3;
}

- (int64_t)platform
{
  return self->_platform;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)device
{
  return self->_device;
}

- (int64_t)renderer
{
  return self->_renderer;
}

@end