@interface UIDevice(SFAdditions)
- (BOOL)sf_hasHardwareHomeButton;
- (BOOL)sf_isAudioAccessory;
- (BOOL)sf_isChinaRegionCellularDevice;
- (BOOL)sf_isiPad;
- (BOOL)sf_isiPhone;
- (BOOL)sf_isiPod;
- (id)sf_colorCodedSerialNumber;
- (id)sf_configString;
- (id)sf_deviceSubTypeString;
- (id)sf_deviceType;
- (id)sf_monthAndYearOfManufacture;
- (id)sf_plantCode;
- (id)sf_productType;
- (id)sf_regionCode;
- (id)sf_regulatoryDeviceVariant;
- (id)sf_screenClassString;
- (id)sf_serialNumber;
- (id)sf_serialNumberQRImage;
- (id)sf_udidString;
- (uint64_t)sf_deviceSupportsDisplayZoom;
- (uint64_t)sf_inRetailKioskMode;
- (uint64_t)sf_isAppleTV;
- (uint64_t)sf_isCarrierInstall;
- (uint64_t)sf_isInternalInstall;
- (uint64_t)sf_weekOfManufacture;
- (uint64_t)sf_yearOfManufacture;
@end

@implementation UIDevice(SFAdditions)

- (BOOL)sf_isiPad
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

- (uint64_t)sf_isCarrierInstall
{
  if (sf_isCarrierInstall___onceToken != -1) {
    dispatch_once(&sf_isCarrierInstall___onceToken, &__block_literal_global_15);
  }
  return sf_isCarrierInstall___carrierInstall;
}

- (uint64_t)sf_isInternalInstall
{
  if (sf_isInternalInstall___onceToken != -1) {
    dispatch_once(&sf_isInternalInstall___onceToken, &__block_literal_global_6);
  }
  return sf_isInternalInstall___internalInstall;
}

- (BOOL)sf_isiPhone
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

- (uint64_t)sf_isAppleTV
{
  return 0;
}

- (BOOL)sf_isAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

- (BOOL)sf_isiPod
{
  return MGGetSInt32Answer() == 2;
}

- (BOOL)sf_hasHardwareHomeButton
{
  return MGGetSInt32Answer() != 2;
}

- (BOOL)sf_isChinaRegionCellularDevice
{
  if (sf_isChinaRegionCellularDevice___greenTeaCapabilityToken != -1) {
    dispatch_once(&sf_isChinaRegionCellularDevice___greenTeaCapabilityToken, &__block_literal_global_20);
  }
  BOOL result = (sf_isChinaRegionCellularDevice___greenTea | CFPreferencesGetAppBooleanValue(@"fakeGreenTea", @"com.apple.preferences.cn", 0)) != 0;
  sf_isChinaRegionCellularDevice___greenTea = result;
  return result;
}

- (id)sf_serialNumber
{
  v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  BOOL v1 = [v0 serialNumber];

  return v1;
}

- (uint64_t)sf_yearOfManufacture
{
  v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  uint64_t v1 = [v0 yearForWeekOfManufacture];

  return v1;
}

- (uint64_t)sf_weekOfManufacture
{
  v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  uint64_t v1 = [v0 weekOfManufacture];

  return v1;
}

- (id)sf_monthAndYearOfManufacture
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"year";
  v0 = NSNumber;
  uint64_t v1 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  v2 = objc_msgSend(v0, "numberWithUnsignedInteger:", objc_msgSend(v1, "yearOfManufacture"));
  v8[1] = @"month";
  v9[0] = v2;
  v3 = NSNumber;
  v4 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "monthOfManufacture"));
  v9[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)sf_configString
{
  if (sf_configString_onceToken != -1) {
    dispatch_once(&sf_configString_onceToken, &__block_literal_global_43);
  }
  v0 = (void *)sf_configString___config;
  return v0;
}

- (id)sf_colorCodedSerialNumber
{
  id v2 = objc_alloc(MEMORY[0x263F086A0]);
  v3 = objc_msgSend(a1, "sf_serialNumber");
  v4 = (void *)[v2 initWithString:v3];

  if (v4)
  {
    if ([v4 length] == 12)
    {
      v5 = (void *)MEMORY[0x263F089D8];
      v6 = [v4 string];
      v7 = [v5 stringWithString:v6];

      [v7 insertString:@" " atIndex:3];
      [v7 insertString:@" " atIndex:6];
      [v7 insertString:@" " atIndex:10];
      v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v7];
      uint64_t v9 = *MEMORY[0x263F1C240];
      v10 = [MEMORY[0x263F1C550] orangeColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, 3);

      v11 = [MEMORY[0x263F1C550] purpleColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v11, 4, 1);

      v12 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v12, 5, 1);

      v13 = [MEMORY[0x263F1C550] brownColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v13, 7, 3);

      v14 = [MEMORY[0x263F1C550] blueColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v14, 11, 4);

      id v15 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v8];
    }
    else
    {
      id v15 = v4;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)sf_deviceSubTypeString
{
  if (sf_deviceSubTypeString_onceToken != -1) {
    dispatch_once(&sf_deviceSubTypeString_onceToken, &__block_literal_global_56);
  }
  v0 = (void *)sf_deviceSubTypeString_deviceSubTypeString;
  return v0;
}

- (id)sf_screenClassString
{
  int v0 = MGGetSInt32Answer();
  if (sf_screenClassString_token != -1) {
    dispatch_once(&sf_screenClassString_token, &__block_literal_global_106);
  }
  uint64_t v1 = NSString;
  id v2 = [(id)sf_screenClassString_screenClass objectForKeyedSubscript:@"main-screen-width"];
  v3 = [(id)sf_screenClassString_screenClass objectForKeyedSubscript:@"main-screen-height"];
  v4 = [(id)sf_screenClassString_screenClass objectForKeyedSubscript:@"main-screen-scale"];
  uint64_t v5 = [(id)sf_screenClassString_screenClass objectForKeyedSubscript:@"main-screen-pitch"];
  v6 = (void *)v5;
  v7 = &stru_26C60E030;
  if (v0 == -1) {
    v7 = @" (Invalid)";
  }
  v8 = [v1 stringWithFormat:@"%@x%@x%@x%@%@", v2, v3, v4, v5, v7];

  return v8;
}

- (id)sf_regionCode
{
  if (sf_regionCode___onceToken != -1) {
    dispatch_once(&sf_regionCode___onceToken, &__block_literal_global_127);
  }
  int v0 = (void *)sf_regionCode___regionCode;
  return v0;
}

- (id)sf_plantCode
{
  int v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  uint64_t v1 = [v0 plantCode];

  return v1;
}

- (id)sf_udidString
{
  int v0 = (void *)MGCopyAnswer();
  return v0;
}

- (uint64_t)sf_deviceSupportsDisplayZoom
{
  if (sf_deviceSupportsDisplayZoom_onceToken != -1) {
    dispatch_once(&sf_deviceSupportsDisplayZoom_onceToken, &__block_literal_global_135);
  }
  return sf_deviceSupportsDisplayZoom__supportsDisplayZoom;
}

- (id)sf_productType
{
  int v0 = (void *)MGCopyAnswer();
  return v0;
}

- (id)sf_deviceType
{
  int v0 = (void *)MGCopyAnswer();
  return v0;
}

- (id)sf_regulatoryDeviceVariant
{
  int v0 = (void *)MGCopyAnswer();
  return v0;
}

- (id)sf_serialNumberQRImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UIDevice_SFAdditions__sf_serialNumberQRImage__block_invoke;
  block[3] = &unk_2642479A8;
  block[4] = a1;
  if (sf_serialNumberQRImage_onceToken != -1) {
    dispatch_once(&sf_serialNumberQRImage_onceToken, block);
  }
  return (id)sf_serialNumberQRImage_qrCodeImageByTransform;
}

- (uint64_t)sf_inRetailKioskMode
{
  return MEMORY[0x270ED8070]("PreferencesFramework", "ForcedRetailKioskMode");
}

@end