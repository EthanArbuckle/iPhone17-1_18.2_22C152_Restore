@interface ZoomServicesGreyCommandInfo
+ (BOOL)isZoomGreyFeatureOn;
+ (id)_pairedDevice;
+ (id)defaultActions;
+ (id)defaultCustomizeGestures;
+ (id)nameForAction:(unint64_t)a3;
+ (id)symbolNameForAction:(unint64_t)a3;
@end

@implementation ZoomServicesGreyCommandInfo

+ (id)defaultCustomizeGestures
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26D3A9470;
  v4[1] = &unk_26D3A94A0;
  v5[0] = &unk_26D3A9488;
  v5[1] = &unk_26D3A94B8;
  v4[2] = &unk_26D3A94D0;
  v4[3] = &unk_26D3A94E8;
  v5[2] = &unk_26D3A9488;
  v5[3] = &unk_26D3A9488;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)defaultActions
{
  return &unk_26D3A9530;
}

+ (id)nameForAction:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_2645BB8B8[a3];
  }
}

+ (id)symbolNameForAction:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_2645BB8D8[a3];
  }
}

+ (BOOL)isZoomGreyFeatureOn
{
  char v2 = _os_feature_enabled_impl();
  v3 = [(id)objc_opt_class() _pairedDevice];
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1FD8E157-2B7C-45B6-B939-FFB8BE14E27F"];
  char v5 = [v3 supportsCapability:v4];

  return v2 & v5;
}

+ (id)_pairedDevice
{
  char v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  char v5 = [v4 firstObject];

  v6 = [v5 valueForProperty:*MEMORY[0x263F575B8]];
  if ([v6 BOOLValue]) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }
  id v8 = v7;

  return v8;
}

@end