@interface ICDeviceSupport
+ (BOOL)deviceIsMac;
+ (BOOL)deviceIsSimulator;
+ (BOOL)deviceIsVision;
+ (BOOL)deviceIsWAPICapable;
+ (BOOL)deviceSupportsFirstGenPencil;
+ (BOOL)deviceSupportsPencil;
+ (BOOL)deviceSupportsSystemPaper;
+ (BOOL)isRunningDuoTests;
+ (BOOL)isRunningInApp;
+ (BOOL)isRunningUnitTests;
+ (BOOL)processIsSiri;
+ (CGSize)notesDeviceDrawingSize;
+ (NSString)deviceName;
+ (NSString)productBuildVersion;
+ (NSString)productName;
+ (NSString)productVersion;
+ (id)notesProductType;
@end

@implementation ICDeviceSupport

+ (BOOL)deviceIsMac
{
  return 0;
}

void __37__ICDeviceSupport_isRunningUnitTests__block_invoke()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v2 environment];
  v1 = [v0 objectForKeyedSubscript:@"IC_TEST_PLAN"];
  isRunningUnitTests_isRunningUnitTests = [v1 length] != 0;
}

+ (BOOL)processIsSiri
{
  id v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C144D90];
  v3 = [MEMORY[0x263F08AB0] processInfo];
  v4 = [v3 processName];
  char v5 = [v2 containsObject:v4];

  return v5;
}

void __41__ICDeviceSupport_notesDeviceDrawingSize__block_invoke(uint64_t a1)
{
  v35[14] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  char v3 = objc_msgSend(v2, "ic_isAppExtension");

  if (v3)
  {
    double v4 = 1.0;
    double v5 = 1024.0;
    double v6 = 768.0;
  }
  else
  {
    int v7 = MGGetSInt32Answer();
    int v8 = MGGetSInt32Answer();
    MGGetFloat32Answer();
    double v5 = (double)v7;
    double v6 = (double)v8;
    double v4 = v9;
  }
  if (v6 <= v5) {
    double v10 = v6;
  }
  else {
    double v10 = v5;
  }
  if (v6 > v5) {
    double v5 = v6;
  }
  if (v5 <= 2048.0 || v10 <= 1536.0)
  {
    double v12 = 2.0;
    if (v4 <= 2.0) {
      double v12 = v4;
    }
    double v13 = v12 * *(double *)&notesDeviceDrawingSize_drawingSize_0;
    double v10 = v12 * *(double *)&notesDeviceDrawingSize_drawingSize_1;
  }
  else
  {
    double v13 = round(v10 * 1.33333333);
  }
  notesDeviceDrawingSize_drawingSize_1 = *(void *)&v10;
  notesDeviceDrawingSize_drawingSize_0 = *(void *)&v13;
  v31 = [*(id *)(a1 + 32) notesProductType];
  v34[0] = @"iPhone4,1";
  v33 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1024.0, 768.0);
  v35[0] = v33;
  v34[1] = @"iPhone5,1";
  v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[1] = v32;
  v34[2] = @"iPhone5,2";
  v30 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[2] = v30;
  v34[3] = @"iPhone5,3";
  v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[3] = v29;
  v34[4] = @"iPhone5,4";
  v28 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[4] = v28;
  v34[5] = @"iPhone6,1";
  v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1024.0, 768.0);
  v35[5] = v14;
  v34[6] = @"iPhone6,2";
  v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1024.0, 768.0);
  v35[6] = v15;
  v34[7] = @"iPhone8,4";
  v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1024.0, 768.0);
  v35[7] = v16;
  v34[8] = @"iPhone7,2";
  v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[8] = v17;
  v34[9] = @"iPhone8,1";
  v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[9] = v18;
  v34[10] = @"iPhone9,1";
  v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[10] = v19;
  v34[11] = @"iPhone9,3";
  v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1280.0, 960.0);
  v35[11] = v20;
  v34[12] = @"iPod5,1";
  v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1024.0, 768.0);
  v35[12] = v21;
  v34[13] = @"iPod7,1";
  v22 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1024.0, 768.0);
  v35[13] = v22;
  v23 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:14];

  v24 = [v23 objectForKeyedSubscript:v31];
  v25 = v24;
  if (v24)
  {
    [v24 CGSizeValue];
    notesDeviceDrawingSize_drawingSize_0 = v26;
    notesDeviceDrawingSize_drawingSize_1 = v27;
  }
}

+ (id)notesProductType
{
  if (notesProductType_onceToken != -1) {
    dispatch_once(&notesProductType_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)notesProductType_productType;
  return v2;
}

+ (BOOL)deviceSupportsPencil
{
  if (deviceSupportsPencil_onceToken != -1) {
    dispatch_once(&deviceSupportsPencil_onceToken, &__block_literal_global_67);
  }
  return deviceSupportsPencil_supportsPencil;
}

+ (BOOL)isRunningUnitTests
{
  if (isRunningUnitTests_onceToken != -1) {
    dispatch_once(&isRunningUnitTests_onceToken, &__block_literal_global_98);
  }
  return isRunningUnitTests_isRunningUnitTests;
}

+ (CGSize)notesDeviceDrawingSize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ICDeviceSupport_notesDeviceDrawingSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (notesDeviceDrawingSize_onceToken != -1) {
    dispatch_once(&notesDeviceDrawingSize_onceToken, block);
  }
  double v2 = *(double *)&notesDeviceDrawingSize_drawingSize_0;
  double v3 = *(double *)&notesDeviceDrawingSize_drawingSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __39__ICDeviceSupport_deviceSupportsPencil__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  deviceSupportsPencil_supportsPencil = result;
  return result;
}

uint64_t __35__ICDeviceSupport_notesProductType__block_invoke()
{
  notesProductType_productType = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (BOOL)deviceIsVision
{
  return 0;
}

+ (BOOL)deviceSupportsFirstGenPencil
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ICDeviceSupport_deviceSupportsFirstGenPencil__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceSupportsFirstGenPencil_onceToken != -1) {
    dispatch_once(&deviceSupportsFirstGenPencil_onceToken, block);
  }
  return deviceSupportsFirstGenPencil_supportsFirstGenPencil;
}

uint64_t __47__ICDeviceSupport_deviceSupportsFirstGenPencil__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) deviceSupportsPencil];
  if (result)
  {
    uint64_t result = MGIsDeviceOneOfType();
    deviceSupportsFirstGenPencil_supportsFirstGenPencil = result;
  }
  return result;
}

+ (BOOL)deviceSupportsSystemPaper
{
  if (deviceSupportsSystemPaper_onceToken != -1) {
    dispatch_once(&deviceSupportsSystemPaper_onceToken, &__block_literal_global_89);
  }
  return deviceSupportsSystemPaper_supportsSystemPaper;
}

uint64_t __44__ICDeviceSupport_deviceSupportsSystemPaper__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  deviceSupportsSystemPaper_supportsSystemPaper = result ^ 1;
  return result;
}

+ (BOOL)deviceIsSimulator
{
  return 0;
}

+ (BOOL)deviceIsWAPICapable
{
  return MGGetBoolAnswer();
}

+ (BOOL)isRunningDuoTests
{
  if (isRunningDuoTests_onceToken != -1) {
    dispatch_once(&isRunningDuoTests_onceToken, &__block_literal_global_103);
  }
  return isRunningDuoTests_isRunningDuoTests;
}

void __36__ICDeviceSupport_isRunningDuoTests__block_invoke()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v2 environment];
  v1 = [v0 objectForKeyedSubscript:@"XCTestBundlePath"];
  isRunningDuoTests_isRunningDuoTests = [v1 containsString:@"DuoTests.xctest"];
}

+ (BOOL)isRunningInApp
{
  if (isRunningInApp_onceToken != -1) {
    dispatch_once(&isRunningInApp_onceToken, &__block_literal_global_111);
  }
  return isRunningInApp_isRunningInApp;
}

void __33__ICDeviceSupport_isRunningInApp__block_invoke()
{
  ICNotesAppBundleIdentifier();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  isRunningInApp_isRunningInApp = [v2 isEqualToString:v1];
}

+ (NSString)deviceName
{
  if (deviceName_onceToken != -1) {
    dispatch_once(&deviceName_onceToken, &__block_literal_global_113);
  }
  id v2 = (void *)deviceName_deviceName;
  return (NSString *)v2;
}

uint64_t __29__ICDeviceSupport_deviceName__block_invoke()
{
  deviceName_deviceName = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)productName
{
  id v2 = [MEMORY[0x263F4A818] sharedInstance];
  double v3 = [v2 productName];

  return (NSString *)v3;
}

+ (NSString)productVersion
{
  id v2 = [MEMORY[0x263F4A818] sharedInstance];
  double v3 = [v2 productVersion];

  return (NSString *)v3;
}

+ (NSString)productBuildVersion
{
  id v2 = [MEMORY[0x263F4A818] sharedInstance];
  double v3 = [v2 productBuildVersion];

  return (NSString *)v3;
}

@end