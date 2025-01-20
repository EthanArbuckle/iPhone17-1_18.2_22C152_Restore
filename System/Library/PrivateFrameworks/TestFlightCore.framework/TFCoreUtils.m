@interface TFCoreUtils
+ (BOOL)tf_deviceHasFaceID;
+ (BOOL)tf_deviceHasTopPowerButton;
+ (id)tf_screenshotInstructionImageDict;
@end

@implementation TFCoreUtils

+ (id)tf_screenshotInstructionImageDict
{
  v18[1] = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(a1, "tf_deviceHasFaceID");
  if ([MEMORY[0x263F27BF8] deviceIsiPad])
  {
    if (v3)
    {
      v17 = @"TFScreenshotInstructionDeviceImageKey";
      v18[0] = @"ipad-face-id";
      v4 = NSDictionary;
      v5 = (__CFString **)v18;
      v6 = &v17;
    }
    else
    {
      v15 = @"TFScreenshotInstructionDeviceImageKey";
      v16 = @"ipad-touch-id";
      v4 = NSDictionary;
      v5 = &v16;
      v6 = &v15;
    }
  }
  else if (objc_msgSend(a1, "tf_deviceHasTopPowerButton"))
  {
    v13 = @"TFScreenshotInstructionDeviceImageKey";
    v14 = @"iphone-touch-id-top-power";
    v4 = NSDictionary;
    v5 = &v14;
    v6 = &v13;
  }
  else if (v3)
  {
    v11 = @"TFScreenshotInstructionDeviceImageKey";
    v12 = @"iphone-face-id";
    v4 = NSDictionary;
    v5 = &v12;
    v6 = &v11;
  }
  else
  {
    v9 = @"TFScreenshotInstructionDeviceImageKey";
    v10 = @"iphone-touch-id";
    v4 = NSDictionary;
    v5 = &v10;
    v6 = &v9;
  }
  v7 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:1];

  return v7;
}

+ (BOOL)tf_deviceHasFaceID
{
  if (tf_deviceHasFaceID_onceToken != -1) {
    dispatch_once(&tf_deviceHasFaceID_onceToken, &__block_literal_global_5);
  }
  return tf_deviceHasFaceID_hasFaceID;
}

uint64_t __33__TFCoreUtils_tf_deviceHasFaceID__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  tf_deviceHasFaceID_hasFaceID = result;
  return result;
}

+ (BOOL)tf_deviceHasTopPowerButton
{
  v2 = [MEMORY[0x263F27BF8] productType];
  char v3 = [v2 containsString:@"iPhone8,4"];
  char v4 = v3 | [v2 containsString:@"iPod"];

  return v4;
}

@end