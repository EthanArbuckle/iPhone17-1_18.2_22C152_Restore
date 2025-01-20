@interface PFWallpaperCompoundDeviceConfiguration
+ (BOOL)deviceSupportsLandscapeConfiguration;
+ (BOOL)supportsSecureCoding;
+ (PFWallpaperCompoundDeviceConfiguration)configurationWithDeviceName:(id)a3;
+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4;
+ (id)callServicesConfigurationWithScreenSize:(CGSize)a3 titleBounds:(CGRect)a4 parallaxPadding:(CGSize)a5;
+ (id)compoundDeviceConfigurationFromDictionary:(id)a3 error:(id *)a4;
+ (id)deviceCallServicesConfigurationWithTitleBounds:(CGRect)a3;
+ (id)deviceConfiguration;
+ (id)genericCallServicesConfigurationWithTitleBounds:(CGRect)a3;
+ (id)genericConfiguration;
+ (id)genericPadConfiguration;
+ (id)knownDeviceConfigurations;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutConfiguration:(id)a3;
- (CGSize)deviceSize;
- (PFParallaxLayoutConfiguration)landscapeConfiguration;
- (PFParallaxLayoutConfiguration)portraitConfiguration;
- (PFWallpaperCompoundDeviceConfiguration)initWithCoder:(id)a3;
- (PFWallpaperCompoundDeviceConfiguration)initWithPortraitConfiguration:(id)a3 landscapeConfiguration:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFWallpaperCompoundDeviceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeConfiguration, 0);

  objc_storeStrong((id *)&self->_portraitConfiguration, 0);
}

- (PFParallaxLayoutConfiguration)landscapeConfiguration
{
  return self->_landscapeConfiguration;
}

- (PFParallaxLayoutConfiguration)portraitConfiguration
{
  return self->_portraitConfiguration;
}

- (CGSize)deviceSize
{
  double width = self->_deviceSize.width;
  double height = self->_deviceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PFWallpaperCompoundDeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portrait"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"landscape"];

  v7 = [(PFWallpaperCompoundDeviceConfiguration *)self initWithPortraitConfiguration:v5 landscapeConfiguration:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PFWallpaperCompoundDeviceConfiguration *)self portraitConfiguration];
  [v4 encodeObject:v5 forKey:@"portrait"];

  id v6 = [(PFWallpaperCompoundDeviceConfiguration *)self landscapeConfiguration];
  [v4 encodeObject:v6 forKey:@"landscape"];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PFParallaxLayoutConfiguration *)self->_portraitConfiguration debugDescription];
  id v6 = [(PFParallaxLayoutConfiguration *)self->_landscapeConfiguration debugDescription];
  [(PFParallaxLayoutConfiguration *)self->_portraitConfiguration screenScale];
  v8 = [v3 stringWithFormat:@"<%@:%p portrait:%@ landscape:%@ screenScale:%f>", v4, self, v5, v6, v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PFParallaxLayoutConfiguration *)self->_portraitConfiguration description];
  id v6 = [(PFParallaxLayoutConfiguration *)self->_landscapeConfiguration description];
  [(PFParallaxLayoutConfiguration *)self->_portraitConfiguration screenScale];
  v8 = [v3 stringWithFormat:@"<%@:%p portrait:%@ landscape:%@ screenScale:%f>", v4, self, v5, v6, v7];

  return v8;
}

- (id)dictionaryRepresentation
{
  v3 = [(PFParallaxLayoutConfiguration *)self->_portraitConfiguration dictionaryRepresentation];
  uint64_t v4 = [(PFParallaxLayoutConfiguration *)self->_landscapeConfiguration dictionaryRepresentation];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:&unk_1EF7CB1A8];
  id v6 = v5;
  if (v3) {
    [v5 setObject:v3 forKeyedSubscript:@"portrait"];
  }
  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"landscape"];
  }

  return v6;
}

- (PFWallpaperCompoundDeviceConfiguration)initWithPortraitConfiguration:(id)a3 landscapeConfiguration:(id)a4
{
  id v6 = (PFParallaxLayoutConfiguration *)a3;
  uint64_t v7 = (PFParallaxLayoutConfiguration *)a4;
  if (v6)
  {
    v8 = v7;
    v17.receiver = self;
    v17.super_class = (Class)PFWallpaperCompoundDeviceConfiguration;
    v9 = [(PFWallpaperCompoundDeviceConfiguration *)&v17 init];
    portraitConfiguration = v9->_portraitConfiguration;
    v9->_portraitConfiguration = v6;
    v11 = v6;

    landscapeConfiguration = v9->_landscapeConfiguration;
    v9->_landscapeConfiguration = v8;

    return v9;
  }
  else
  {
    v14 = (PFWallpaperCompoundDeviceConfiguration *)_PFAssertFailHandler();
    return (PFWallpaperCompoundDeviceConfiguration *)[(PFWallpaperCompoundDeviceConfiguration *)v14 isEqualToLayoutConfiguration:v16];
  }
}

- (BOOL)isEqualToLayoutConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_landscapeConfiguration) {
      goto LABEL_3;
    }
    v12 = [v4 landscapeConfiguration];

    if (!v12)
    {
      portraitConfiguration = self->_portraitConfiguration;
      v8 = [v5 portraitConfiguration];
      BOOL v11 = [(PFParallaxLayoutConfiguration *)portraitConfiguration isEqualToLayoutConfiguration:v8];
LABEL_11:

      goto LABEL_12;
    }
    if (self->_landscapeConfiguration)
    {
LABEL_3:
      id v6 = [v5 landscapeConfiguration];

      if (v6)
      {
        uint64_t v7 = self->_portraitConfiguration;
        v8 = [v5 portraitConfiguration];
        if ([(PFParallaxLayoutConfiguration *)v7 isEqualToLayoutConfiguration:v8])
        {
          landscapeConfiguration = self->_landscapeConfiguration;
          v10 = [v5 landscapeConfiguration];
          BOOL v11 = [(PFParallaxLayoutConfiguration *)landscapeConfiguration isEqualToLayoutConfiguration:v10];
        }
        else
        {
          BOOL v11 = 0;
        }
        goto LABEL_11;
      }
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PFWallpaperCompoundDeviceConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PFWallpaperCompoundDeviceConfiguration *)self isEqualToLayoutConfiguration:v4];
  }

  return v5;
}

+ (id)knownDeviceConfigurations
{
  if (knownDeviceConfigurations_onceToken != -1) {
    dispatch_once(&knownDeviceConfigurations_onceToken, &__block_literal_global_162_10323);
  }
  v2 = (void *)knownDeviceConfigurations_namedConfigs;

  return v2;
}

void __67__PFWallpaperCompoundDeviceConfiguration_knownDeviceConfigurations__block_invoke()
{
  v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:24];
  v41 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1170.0, 2532.0, 3.0, 81.0, 388.0, 1008.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v40 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v41 landscapeConfiguration:0];
  [v43 setObject:v40 forKeyedSubscript:@"iPhone12"];
  [v43 setObject:v40 forKeyedSubscript:@"iPhone13"];
  [v43 setObject:v40 forKeyedSubscript:@"iPhone12Pro"];
  [v43 setObject:v40 forKeyedSubscript:@"iPhone13Pro"];
  v39 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 0x4053800000000000, 0x4068000000000000);
  v38 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v39 landscapeConfiguration:0];
  [v43 setObject:v38 forKeyedSubscript:@"iPhone12Zoom"];
  [v43 setObject:v38 forKeyedSubscript:@"iPhone13Zoom"];
  [v43 setObject:v38 forKeyedSubscript:@"iPhone12ProZoom"];
  [v43 setObject:v38 forKeyedSubscript:@"iPhone13ProZoom"];
  v37 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1284.0, 2778.0, 3.0, 96.0, 430.0, 1092.0, 0x4053800000000000, 0x4068000000000000);
  v36 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v37 landscapeConfiguration:0];
  [v43 setObject:v36 forKeyedSubscript:@"iPhone12ProMax"];
  [v43 setObject:v36 forKeyedSubscript:@"iPhone13ProMax"];
  v35 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 388.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v34 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v35 landscapeConfiguration:0];
  [v43 setObject:v34 forKeyedSubscript:@"iPhone12ProMaxZoom"];
  [v43 setObject:v34 forKeyedSubscript:@"iPhone13ProMaxZoom"];
  v33 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 388.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v32 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v33 landscapeConfiguration:0];
  [v43 setObject:v32 forKeyedSubscript:@"iPhone12Mini"];
  [v43 setObject:v32 forKeyedSubscript:@"iPhone13Mini"];
  v31 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 960.0, 2079.0, 3.0, 72.0, 388.0, 816.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v30 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v31 landscapeConfiguration:0];
  [v43 setObject:v30 forKeyedSubscript:@"iPhone12MiniZoom"];
  [v43 setObject:v30 forKeyedSubscript:@"iPhone13MiniZoom"];
  v29 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 388.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v28 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v29 landscapeConfiguration:0];
  [v43 setObject:v28 forKeyedSubscript:@"iPhoneX"];
  [v43 setObject:v28 forKeyedSubscript:@"iPhoneXS"];
  [v43 setObject:v28 forKeyedSubscript:@"iPhone11Pro"];
  v42 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 960.0, 2079.0, 3.0, 72.0, 331.0, 816.0, 178.0, 0x4053800000000000, 0x4068000000000000);
  v27 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v42 landscapeConfiguration:0];
  [v43 setObject:v27 forKeyedSubscript:@"iPhoneXZoom"];
  [v43 setObject:v27 forKeyedSubscript:@"iPhoneXSZoom"];
  [v43 setObject:v27 forKeyedSubscript:@"iPhone11ProZoom"];
  v26 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1242.0, 2688.0, 3.0, 0x4053800000000000, 0x4068000000000000);
  v25 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v26 landscapeConfiguration:0];
  [v43 setObject:v25 forKeyedSubscript:@"iPhoneXSMax"];
  [v43 setObject:v25 forKeyedSubscript:@"iPhone11ProMax"];
  v24 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 750.0, 1334.0, 2.0, 52.0, 185.0, 646.0, 118.0, 0x4053800000000000, 0x4068000000000000);
  v23 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v24 landscapeConfiguration:0];
  [v43 setObject:v23 forKeyedSubscript:@"iPhone8"];
  [v43 setObject:v23 forKeyedSubscript:@"iPhoneSE"];
  v22 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 640.0, 1136.0, 2.0, 52.0, 185.0, 536.0, 118.0, 0x4053800000000000, 0x4068000000000000);
  v21 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v22 landscapeConfiguration:0];
  [v43 setObject:v21 forKeyedSubscript:@"iPhone8Zoom"];
  [v43 setObject:v21 forKeyedSubscript:@"iPhoneSEZoom"];
  v20 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 828.0, 1792.0, 2.0, 56.0, 429.0, 716.0, 152.0, 0x4053800000000000, 0x4068000000000000);
  v0 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v20 landscapeConfiguration:0];
  [v43 setObject:v0 forKeyedSubscript:@"iPhoneXR"];

  v19 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 750.0, 1624.0, 2.0, 48.0, 392.0, 654.0, 141.0, 0x4053800000000000, 0x4068000000000000);
  v1 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v19 landscapeConfiguration:0];
  [v43 setObject:v1 forKeyedSubscript:@"iPhoneXRZoom"];

  v18 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1080.0, 1920.0, 2.0, 84.0, 286.0, 1074.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  objc_super v17 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v18 landscapeConfiguration:0];
  [v43 setObject:v17 forKeyedSubscript:@"iPhone8Plus"];
  v2 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1179.0, 2556.0, 3.0, 78.0, 571.0, 1023.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v3 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v2 landscapeConfiguration:0];
  [v43 setObject:v3 forKeyedSubscript:@"iPhone14Pro"];

  id v4 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1290.0, 2796.0, 3.0, 90.0, 572.0, 1110.0, 228.0, 0x4053800000000000, 0x4068000000000000);
  BOOL v5 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v4 landscapeConfiguration:0];
  [v43 setObject:v5 forKeyedSubscript:@"iPhone14ProMax"];

  id v6 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 515.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  uint64_t v7 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v6 landscapeConfiguration:0];
  [v43 setObject:v7 forKeyedSubscript:@"iPhone14ProMaxZoom"];

  v8 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1179.0, 2556.0, 3.0, 78.0, 571.0, 1023.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v9 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v8 landscapeConfiguration:0];
  [v43 setObject:v9 forKeyedSubscript:@"iPhone15Pro"];

  v10 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 960.0, 2079.0, 3.0, 45.0, 455.0, 870.0, 178.0, 0x4053800000000000, 0x4068000000000000);
  BOOL v11 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v10 landscapeConfiguration:0];
  [v43 setObject:v11 forKeyedSubscript:@"iPhone15ProZoom"];

  v12 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1668.0, 2388.0, 2.0, 478.0, 257.0, 712.0, 186.0, 0x4053800000000000, 0x4068000000000000);
  v13 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 2388.0, 1668.0, 2.0, 838.0, 257.0, 712.0, 186.0, 0x4053800000000000, 0x4068000000000000);
  v14 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v12 landscapeConfiguration:v13];
  [v43 setObject:v14 forKeyedSubscript:@"iPadPro11Inch"];
  uint64_t v15 = [v43 copy];
  id v16 = (void *)knownDeviceConfigurations_namedConfigs;
  knownDeviceConfigurations_namedConfigs = v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)compoundDeviceConfigurationFromDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"portrait"];
    v8 = +[PFParallaxLayoutConfiguration layoutConfigurationFromDictionary:v7 error:a4];

    if (v8)
    {
      v9 = [v5 objectForKeyedSubscript:@"landscape"];

      if (!v9
        || ([v5 objectForKeyedSubscript:@"landscape"],
            v10 = objc_claimAutoreleasedReturnValue(),
            +[PFParallaxLayoutConfiguration layoutConfigurationFromDictionary:v10 error:a4], v9 = objc_claimAutoreleasedReturnValue(), v10, v9))
      {
        BOOL v11 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v8 landscapeConfiguration:v9];

        goto LABEL_9;
      }
    }
  }
  else
  {
    v8 = +[PFParallaxLayoutConfiguration layoutConfigurationFromDictionary:v5 error:a4];
    if (v8)
    {
      BOOL v11 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v8 landscapeConfiguration:0];
      goto LABEL_9;
    }
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

+ (PFWallpaperCompoundDeviceConfiguration)configurationWithDeviceName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 knownDeviceConfigurations];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return (PFWallpaperCompoundDeviceConfiguration *)v6;
}

+ (BOOL)deviceSupportsLandscapeConfiguration
{
  if (deviceSupportsLandscapeConfiguration_onceToken[0] != -1) {
    dispatch_once(deviceSupportsLandscapeConfiguration_onceToken, &__block_literal_global_142_10417);
  }
  return deviceSupportsLandscapeConfiguration_isPad;
}

void __78__PFWallpaperCompoundDeviceConfiguration_deviceSupportsLandscapeConfiguration__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  deviceSupportsLandscapeConfiguration_isPad = CFEqual(v0, @"iPad") != 0;
  if (v0)
  {
    CFRelease(v0);
  }
}

+ (id)deviceConfiguration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PFWallpaperCompoundDeviceConfiguration_deviceConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceConfiguration_onceToken[0] != -1) {
    dispatch_once(deviceConfiguration_onceToken, block);
  }
  v2 = (void *)deviceConfiguration_sDeviceConfiguration;

  return v2;
}

void __61__PFWallpaperCompoundDeviceConfiguration_deviceConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v2 = PFDeviceLockScreenApproximateTimeRectNormalized(1);
  double v34 = v3;
  double v5 = v4;
  double v7 = v6;
  double v8 = PFDeviceScreenSize();
  double v10 = v9;
  double v11 = PFDeviceScreenScale();
  double v12 = PFDeviceScreenScale();
  double v33 = v12 * 26.0;
  double v13 = v12 * 64.0;
  if (v8 <= v10) {
    double v14 = v8;
  }
  else {
    double v14 = v10;
  }
  if (v8 <= v10) {
    double v8 = v10;
  }
  v38.origin.double x = v2;
  v38.origin.double y = v34;
  v38.size.double width = v5;
  v38.size.double height = v7;
  if (CGRectIsEmpty(v38))
  {
    double v15 = v14;
    double v16 = v14;
    double v17 = v8;
    +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 1, v16, v8, v11);
    v18 = (PFParallaxLayoutConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Using fallback device configurations:\n\tportrait: %{public}@\n\t", buf, 0xCu);
    }
    double v19 = v11;
    double v20 = v15;
    double v21 = v13;
  }
  else
  {
    v22 = [PFParallaxLayoutConfiguration alloc];
    double v32 = v14;
    double v23 = v14;
    double v17 = v8;
    v18 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:](v22, "initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:", v23, v8, v11, v2, v34, v5, v7, *(void *)&v33, *(void *)&v13);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using SBS device configurations:\n\tportrait: %{public}@\n\t", buf, 0xCu);
    }
    double v19 = v11;
    double v20 = v32;
    double v21 = v13;
  }
  if ([*(id *)(a1 + 32) deviceSupportsLandscapeConfiguration])
  {
    double v24 = v17;
    v39.origin.double x = PFDeviceLockScreenApproximateTimeRectNormalized(2);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    if (CGRectIsEmpty(v39))
    {
      +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 2, v24, v20, v19);
      v29 = (PFParallaxLayoutConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v29;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Using fallback device configurations:\n\tlandscape: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v29 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:", v24, v20, v19, x, y, width, height, *(void *)&v33, *(void *)&v21);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v29;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using SBS device configurations:\n\tlandscape: %{public}@\n\t", buf, 0xCu);
      }
    }
  }
  else
  {
    v29 = 0;
  }
  v30 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v18 landscapeConfiguration:v29];
  v31 = (void *)deviceConfiguration_sDeviceConfiguration;
  deviceConfiguration_sDeviceConfiguration = (uint64_t)v30;
}

+ (id)deviceCallServicesConfigurationWithTitleBounds:(CGRect)a3
{
  double v4 = PFDeviceScreenSize();

  return (id)objc_msgSend(a1, "callServicesConfigurationWithScreenSize:titleBounds:parallaxPadding:", v4);
}

+ (id)genericCallServicesConfigurationWithTitleBounds:(CGRect)a3
{
  double v4 = PFDeviceScreenSize();

  return (id)objc_msgSend(a1, "callServicesConfigurationWithScreenSize:titleBounds:parallaxPadding:", v4);
}

+ (id)callServicesConfigurationWithScreenSize:(CGSize)a3 titleBounds:(CGRect)a4 parallaxPadding:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.height;
  double v12 = a3.width;
  if (CGRectIsEmpty(a4))
  {
    double v17 = (void *)_PFAssertFailHandler();
    return +[PFWallpaperCompoundDeviceConfiguration genericPadConfiguration];
  }
  else
  {
    double v19 = v7;
    if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration])
    {
      double v13 = 2.0;
    }
    else
    {
      double v13 = 3.0;
    }
    double v14 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:", v12, v11, v13, x, y, v8, v19, *(void *)&width, *(void *)&height);
    double v15 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v14 landscapeConfiguration:0];

    return v15;
  }
}

+ (id)genericPadConfiguration
{
  double v2 = [PFWallpaperCompoundDeviceConfiguration alloc];
  double v3 = +[PFParallaxLayoutConfiguration genericPadConfigurationForOrientation:1];
  double v4 = +[PFParallaxLayoutConfiguration genericPadConfigurationForOrientation:2];
  double v5 = [(PFWallpaperCompoundDeviceConfiguration *)v2 initWithPortraitConfiguration:v3 landscapeConfiguration:v4];

  return v5;
}

+ (id)genericConfiguration
{
  double v2 = [PFWallpaperCompoundDeviceConfiguration alloc];
  double v3 = +[PFParallaxLayoutConfiguration genericConfigurationForOrientation:1];
  double v4 = +[PFParallaxLayoutConfiguration genericConfigurationForOrientation:2];
  double v5 = [(PFWallpaperCompoundDeviceConfiguration *)v2 initWithPortraitConfiguration:v3 landscapeConfiguration:v4];

  return v5;
}

+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v7 = [PFWallpaperCompoundDeviceConfiguration alloc];
  double v8 = +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 1, width, height, a4);
  double v9 = +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 2, width, height, a4);
  double v10 = [(PFWallpaperCompoundDeviceConfiguration *)v7 initWithPortraitConfiguration:v8 landscapeConfiguration:v9];

  return v10;
}

@end