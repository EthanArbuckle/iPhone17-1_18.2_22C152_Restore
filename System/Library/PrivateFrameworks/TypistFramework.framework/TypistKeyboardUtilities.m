@interface TypistKeyboardUtilities
+ (BOOL)allOneTimeActionsAlreadyTriggered;
+ (BOOL)getAutoCapitalizationPrefSetting;
+ (BOOL)getAutoCorrectionPrefSetting;
+ (BOOL)getCapsLockPrefSetting;
+ (BOOL)getCheckSpellingPrefSetting;
+ (BOOL)getDictationEnabled;
+ (BOOL)getFuzzyPinyinPrefSetting;
+ (BOOL)getGestureKeyPrefSetting;
+ (BOOL)getHWKeyboardCapsLockRomanSwitchPrefSetting;
+ (BOOL)getKeyPaddlePrefSetting;
+ (BOOL)getPeriodShortcutPrefSetting;
+ (BOOL)getPredictivePrefSetting;
+ (BOOL)getSmallDisplayPrefSetting;
+ (BOOL)getSmartDashesPrefSetting;
+ (BOOL)getSmartFullWidthSetting;
+ (BOOL)getSmartQuotesPrefSetting;
+ (BOOL)getTypologyEnabled;
+ (BOOL)hasFaceID;
+ (BOOL)hasHomeButton;
+ (BOOL)hasMarkedText;
+ (BOOL)inhibitGlobalAlerts:(BOOL)a3;
+ (BOOL)isDictationSupported:(id)a3;
+ (BOOL)isFloating;
+ (BOOL)setKeyboardDictation:(BOOL)a3;
+ (BOOL)setPrefSettings:(id)a3;
+ (BOOL)shouldShowDictationKey;
+ (BOOL)shouldShowGlobeKey;
+ (BOOL)supportsPencil;
+ (BOOL)triggerAllTIOneTimeActions;
+ (BOOL)waitForKeyboardPlane:(id)a3;
+ (CGPoint)floatingKeyboardDraggablePoint;
+ (CGPoint)generateGaussianPoint:(CGPoint)a3 withSeed:(int64_t)a4 andSigma:(double)a5;
+ (CGPoint)generateGaussianPointWithMean:(CGPoint)a3 andSigma:(double)a4;
+ (CGPoint)generateUniformPointWithMean:(CGPoint)a3 andBounds:(CGVector)a4;
+ (CGPoint)generateUniformPointWithMean:(CGPoint)a3 andRange:(unsigned int)a4;
+ (CGRect)findKeyBoundsInKeyboard:(id)a3;
+ (id)appendKeyboardForKeyboardSetting:(id)a3;
+ (id)canonicalConversion:(id)a3;
+ (id)captureCurrentKeyboardImage;
+ (id)convertRecapCommands:(id)a3;
+ (id)convertRecapCommandsFromListOfActions:(id)a3;
+ (id)deviceInfo;
+ (id)formattedKeyplaneName;
+ (id)generateKeyboardList;
+ (id)getAggregatedTIPreferences;
+ (id)getHwRevision;
+ (id)getKeyboardsForKeyboardSetting;
+ (id)getMobileGestalt:(id)a3;
+ (id)getNandCapacity;
+ (id)getOneHandedKeyboardHandBias;
+ (id)getRegionCodeFromKeyboardID:(id)a3;
+ (id)getRootViewControllerViaScene;
+ (id)getSameScreenSizeModel;
+ (id)getScreenSize;
+ (id)getTrainBuildVersion:(id)a3;
+ (id)getUIDeviceOrientationAsString;
+ (id)markedText;
+ (id)removeKeyboardForKeyboardSetting:(id)a3;
+ (id)replaceWaitForKeyboardPlane:(id)a3 withWait:(double)a4;
+ (id)searchForViewInKeyboardWindow:(id)a3;
+ (id)searchForWindow:(id)a3;
+ (id)setKeyboardForKeyboardSetting:(id)a3;
+ (id)setOneHandedKeyboardHandBias:(id)a3;
+ (id)sharedFBSOrientationObserver;
+ (id)sharedRecapInlinePlayer;
+ (id)timeInStringFromTimeInterval:(double)a3;
+ (id)validateProbability:(id)a3;
+ (int)getShuangpinPrefSetting;
+ (int)getWubiPrefSetting;
+ (int)touchScanRate;
+ (int64_t)getUIDeviceOrientationFromString:(id)a3;
+ (int64_t)getUIInterfaceOrientation;
+ (int64_t)toUIDeviceOrientation:(int64_t)a3;
+ (int64_t)toUIInterfaceOrientation:(int64_t)a3;
+ (void)correctForRotation:(CGVector *)a3 orientation:(int64_t)a4;
+ (void)killKbd;
+ (void)launchRecap:(id)a3;
+ (void)launchRecap:(id)a3 completion:(id)a4;
+ (void)launchRecapWithSyntheticEventStream:(id)a3;
+ (void)logToFile:(BOOL)a3;
+ (void)logToSTDERR:(BOOL)a3;
+ (void)runCommandLineProcess:(char *)a3;
+ (void)runOnMainThread:(id)a3;
+ (void)setAirplaneMode:(BOOL)a3;
+ (void)setDoNotDisturb:(BOOL)a3;
+ (void)setFloatingKeyboard:(BOOL)a3;
+ (void)setRecapFastMode:(BOOL)a3;
+ (void)setTapTouchRadius:(id)a3;
+ (void)tearDownRecapInlinePlayer;
+ (void)waitFor:(double)a3;
@end

@implementation TypistKeyboardUtilities

+ (CGPoint)generateGaussianPoint:(CGPoint)a3 withSeed:(int64_t)a4 andSigma:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  srand48(a4);
  do
  {
    double v7 = drand48() * 2.0 + -1.0;
    double v8 = drand48() * 2.0 + -1.0;
    double v9 = v8 * v8 + v7 * v7;
  }
  while (v9 >= 1.0);
  double v10 = sqrt(log(v8 * v8 + v7 * v7) * -2.0 / v9);
  double v11 = v8 * v10;
  double v12 = x + v7 * v10 * a5;
  double v13 = y + v11 * a5;
  result.double y = v13;
  result.double x = v12;
  return result;
}

+ (CGPoint)generateGaussianPointWithMean:(CGPoint)a3 andSigma:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  do
  {
    double v6 = drand48() * 2.0 + -1.0;
    double v7 = drand48() * 2.0 + -1.0;
    double v8 = v7 * v7 + v6 * v6;
  }
  while (v8 >= 1.0);
  double v9 = sqrt(log(v7 * v7 + v6 * v6) * -2.0 / v8);
  double v10 = v7 * v9;
  double v11 = x + v6 * v9 * a4;
  double v12 = y + v10 * a4;
  result.double y = v12;
  result.double x = v11;
  return result;
}

+ (CGPoint)generateUniformPointWithMean:(CGPoint)a3 andRange:(unsigned int)a4
{
  objc_msgSend(a1, "generateUniformPointWithMean:andBounds:", a3.x, a3.y, (double)a4, (double)a4);
  result.double y = v5;
  result.double x = v4;
  return result;
}

+ (CGPoint)generateUniformPointWithMean:(CGPoint)a3 andBounds:(CGVector)a4
{
  ddouble y = a4.dy;
  double y = a3.y;
  double x = a3.x;
  double v7 = (double)(int)(arc4random_uniform((a4.dx + a4.dx)) - (int)a4.dx);
  uint32_t v8 = arc4random_uniform((dy + dy));
  double v9 = x + v7;
  double v10 = y + (double)(int)(v8 - (int)dy);
  result.double y = v10;
  result.double x = v9;
  return result;
}

+ (id)validateProbability:(id)a3
{
  [a3 doubleValue];
  if (v3 >= 0.0)
  {
    if (v3 <= 1.0)
    {
      double v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    }
    else
    {
      double v4 = &unk_270C6EA50;
    }
  }
  else
  {
    double v4 = &unk_270C6EA40;
  }
  return v4;
}

+ (void)logToSTDERR:(BOOL)a3
{
}

+ (void)logToFile:(BOOL)a3
{
}

+ (void)waitFor:(double)a3
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    double v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
    [v6 runUntilDate:v4];
  }
  else
  {
    double v5 = (void *)MEMORY[0x263F08B88];
    [v5 sleepForTimeInterval:a3];
  }
}

+ (void)runOnMainThread:(id)a3
{
  double v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

+ (id)canonicalConversion:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 decomposedStringWithCanonicalMapping];

    id v6 = [v5 precomposedStringWithCanonicalMapping];

    double v7 = [v6 precomposedStringWithCompatibilityMapping];

    double v4 = [v7 stringByReplacingOccurrencesOfString:@"–" withString:@"-"];
  }
  return v4;
}

+ (id)timeInStringFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02ld:%02ld:%02ld", (uint64_t)a3 / 3600, (uint64_t)a3 / 60 % 60, (uint64_t)a3 % 60);
}

+ (void)runCommandLineProcess:(char *)a3
{
  if (a3)
  {
    id v3 = *a3;
    if (*a3)
    {
      pid_t v4 = 0;
      posix_spawn(&v4, v3, 0, 0, a3, (char *const *)*MEMORY[0x263EF8878]);
      waitpid(v4, 0, 0);
    }
  }
}

+ (void)killKbd
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(_OWORD *)__argv = xmmword_2655596E8;
  long long v8 = *(_OWORD *)&off_2655596F8;
  pid_t v6 = 0;
  posix_spawn(&v6, "/usr/bin/killall", 0, 0, __argv, (char *const *)*MEMORY[0x263EF8878]);
  waitpid(v6, 0, 0);
  int v2 = 19;
  do
  {
    int v3 = v2;
    +[TypistKeyboardUtilities waitFor:0.2];
    pid_t v4 = popen("/usr/local/bin/pidof kbd", "r");
    double v5 = fgets(killKbd_buffer, 128, v4);
    pclose(v4);
    if (!v5) {
      break;
    }
    int v2 = v3 - 1;
  }
  while (v3);
}

+ (id)generateKeyboardList
{
  uint64_t v5 = 0;
  pid_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  long long v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = (id)objc_opt_new();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__TypistKeyboardUtilities_generateKeyboardList__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__TypistKeyboardUtilities_generateKeyboardList__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t CurrentIdiom = UIKeyboardGetCurrentIdiom();
  UIKeyboardGetSupportedInputModes();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(CurrentIdiom + 1) > 4 || ((1 << (CurrentIdiom + 1)) & 0x19) == 0)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v26)
    {
      uint64_t v28 = a1;
      uint64_t v24 = *(void *)v34;
      id v10 = (void *)MEMORY[0x263EFFA68];
      uint64_t v25 = CurrentIdiom;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(obj);
          }
          double v12 = UIKeyboardGetSupportedHardwareKeyboardsForInputMode();
          double v13 = UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom();
          if (!v12 || ![v12 count])
          {

            double v12 = &unk_270C6F690;
          }
          uint64_t v27 = v11;
          if (CurrentIdiom == 1)
          {
            uint64_t v14 = [v10 arrayByAddingObjectsFromArray:&unk_270C6F678];

            id v10 = (void *)v14;
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = objc_msgSend(v12, "objectAtIndexedSubscript:", 0, obj);
                v21 = UIKeyboardInputModeWithNewHWLayout();

                v22 = UIKeyboardInputModeWithNewSWLayout();
                if (([v10 containsObject:v22] & 1) == 0) {
                  [*(id *)(*(void *)(*(void *)(v28 + 32) + 8) + 40) addObject:v22];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v17);
          }

          uint64_t v11 = v27 + 1;
          uint64_t CurrentIdiom = v25;
        }
        while (v27 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v26);
    }
    else
    {
      id v10 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"ERROR: The device under test does not appear to have software input support known to Typist", v3, v4, v5, v6, v7, v8, (char)obj);
  }
}

+ (int)touchScanRate
{
  id v2 = [MEMORY[0x263F62CC0] currentEnvironment];
  int v3 = [v2 touchScanRate];

  return v3;
}

+ (id)getMobileGestalt:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MGCopyAnswer();
  if (v4)
  {
    uint64_t v5 = (__CFString *)v4;
    if ([v3 isEqualToString:@"HWModelStr"])
    {
      uint64_t v6 = [(__CFString *)v5 rangeOfString:@"AP" options:4];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = -[__CFString stringByReplacingCharactersInRange:withString:](v5, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_270C5A038);

        uint64_t v5 = (__CFString *)v8;
      }
    }
  }
  else
  {
    uint64_t v5 = @"_Cannot_Obtain_";
  }

  return v5;
}

+ (id)getHwRevision
{
  id v2 = (void *)MGCopyAnswer();
  id v3 = [NSString alloc];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"CFG#"];
  uint64_t v5 = (void *)[v3 initWithData:v4 encoding:4];

  uint64_t v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/-"];
  uint64_t v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  if ((unint64_t)[v7 count] < 2)
  {
    uint64_t v11 = @"MP";
  }
  else
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [v7 objectAtIndexedSubscript:0];
    id v10 = [v7 objectAtIndexedSubscript:1];
    uint64_t v11 = [v8 stringWithFormat:@"%@/%@", v9, v10];
  }
  return v11;
}

+ (id)getNandCapacity
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("IOMedia");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  CFDictionaryRef v5 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"Controller Characteristics", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    uint64_t v7 = objc_msgSend((id)CFDictionaryGetValue(v5, @"capacity"), "integerValue") / 1000000000;
    IOObjectRelease(MatchingService);
    CFRelease(v6);
    objc_msgSend(NSString, "stringWithFormat:", @"%ldGB", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = @"_Cannot_Obtain_";
  }
  return v8;
}

+ (id)getTrainBuildVersion:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v4 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  CFDictionaryRef v5 = [MEMORY[0x263F08B08] scannerWithString:v3];
  [v5 scanInteger:&v11];
  uint64_t v10 = 0;
  [v5 scanCharactersFromSet:v4 intoString:&v10];
  [v5 scanInteger:&v11];
  if ([v3 hasPrefix:@"15A"])
  {
    CFDictionaryRef v6 = @"Tigris";
  }
  else if ([v3 hasPrefix:@"15B"])
  {
    CFDictionaryRef v6 = @"Bursa";
  }
  else if ([v3 hasPrefix:@"15C"])
  {
    CFDictionaryRef v6 = @"Cinar";
  }
  else if ([v3 hasPrefix:@"15D"])
  {
    CFDictionaryRef v6 = @"Dalaman";
  }
  else if ([v3 hasPrefix:@"15E"])
  {
    CFDictionaryRef v6 = @"Emet";
  }
  else if ([v3 hasPrefix:@"15F"])
  {
    CFDictionaryRef v6 = @"Fatsa";
  }
  else if ([v3 hasPrefix:@"15G"])
  {
    CFDictionaryRef v6 = @"TigrisG";
  }
  else if ([v3 hasPrefix:@"16A"])
  {
    CFDictionaryRef v6 = @"Peace";
  }
  else if ([v3 hasPrefix:@"16B"])
  {
    CFDictionaryRef v6 = @"PeaceB";
  }
  else if ([v3 hasPrefix:@"16C"])
  {
    CFDictionaryRef v6 = @"PeaceC";
  }
  else if ([v3 hasPrefix:@"16D"])
  {
    CFDictionaryRef v6 = @"PeaceD";
  }
  else if ([v3 hasPrefix:@"16E"])
  {
    CFDictionaryRef v6 = @"PeaceE";
  }
  else if ([v3 hasPrefix:@"17A"])
  {
    CFDictionaryRef v6 = @"Yukon";
  }
  else if ([v3 hasPrefix:@"17B"])
  {
    CFDictionaryRef v6 = @"YukonB";
  }
  else if ([v3 hasPrefix:@"17C"])
  {
    CFDictionaryRef v6 = @"YukonC";
  }
  else if ([v3 hasPrefix:@"17D"])
  {
    CFDictionaryRef v6 = @"YukonD";
  }
  else
  {
    int v7 = [v3 hasPrefix:@"17E"];
    CFDictionaryRef v6 = &stru_270C5A038;
    if (v7) {
      CFDictionaryRef v6 = @"YukonE";
    }
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@%@", v6, v3];

  return v8;
}

+ (id)getSameScreenSizeModel
{
  mach_port_t v2 = [a1 getScreenSize];
  id v3 = [&unk_270C6F990 objectForKeyedSubscript:v2];

  return v3;
}

+ (id)deviceInfo
{
  v19[9] = *MEMORY[0x263EF8340];
  mach_port_t v2 = +[TypistKeyboardUtilities getMobileGestalt:@"BuildVersion"];
  v19[0] = v2;
  v18[0] = @"buildVersion";
  v18[1] = @"serialNumber";
  uint64_t v17 = +[TypistKeyboardUtilities getMobileGestalt:@"SerialNumber"];
  v19[1] = v17;
  v18[2] = @"hardwareModel";
  uint64_t v16 = +[TypistKeyboardUtilities getMobileGestalt:@"HWModelStr"];
  v19[2] = v16;
  v18[3] = @"regionInfo";
  id v3 = +[TypistKeyboardUtilities getMobileGestalt:@"RegionInfo"];
  v19[3] = v3;
  v18[4] = @"nandCapacity";
  uint64_t v4 = +[TypistKeyboardUtilities getNandCapacity];
  v19[4] = v4;
  v18[5] = @"hardwareRevision";
  CFDictionaryRef v5 = +[TypistKeyboardUtilities getHwRevision];
  v19[5] = v5;
  v18[6] = @"build";
  CFDictionaryRef v6 = +[TypistKeyboardUtilities getTrainBuildVersion:v2];
  v19[6] = v6;
  v18[7] = @"dateGenerated";
  int v7 = NSString;
  uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  uint64_t v9 = [v7 stringWithFormat:@"%@", v8];
  v19[7] = v9;
  v18[8] = @"displaySize";
  uint64_t v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 bounds];
  v21.width = v11;
  v21.height = v12;
  double v13 = NSStringFromCGSize(v21);
  v19[8] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:9];

  return v14;
}

+ (BOOL)hasFaceID
{
  return MEMORY[0x270F95FB8](@"8olRm6C1xqr7AJGpLRnpSw", a2);
}

+ (BOOL)hasHomeButton
{
  return MEMORY[0x270F95FB8](@"HV7WDiidgMf7lwAu++Lk5w", a2);
}

+ (BOOL)supportsPencil
{
  return MEMORY[0x270F95FB8](@"yhHcB0iH0d1XzPO/CFd3ow", a2);
}

+ (id)getScreenSize
{
  mach_port_t v2 = NSString;
  GSMainScreenPixelSize();
  uint64_t v4 = (int)v3;
  GSMainScreenPixelSize();
  CFDictionaryRef v6 = objc_msgSend(v2, "stringWithFormat:", @"%dx%d", v4, (int)v5);
  if ([v6 isEqualToString:@"1536x2048"])
  {
    int v7 = NSString;
    uint64_t v8 = +[TypistKeyboardUtilities getMobileGestalt:@"main-screen-pitch"];
    uint64_t v9 = [v7 stringWithFormat:@"%@", v8];

    if ([v9 isEqualToString:@"326"])
    {
      uint64_t v10 = [v6 stringByAppendingString:@"Mini"];

      CFDictionaryRef v6 = (void *)v10;
    }
  }
  return v6;
}

+ (int64_t)toUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)toUIInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)sharedFBSOrientationObserver
{
  if (sharedFBSOrientationObserver_sharedFBSOrientationObserverToken != -1) {
    dispatch_once(&sharedFBSOrientationObserver_sharedFBSOrientationObserverToken, &__block_literal_global_0);
  }
  mach_port_t v2 = (void *)sharedFBSOrientationObserver_sharedFBSOrientationObserver;
  return v2;
}

uint64_t __71__TypistKeyboardUtilities_SystemSettings__sharedFBSOrientationObserver__block_invoke()
{
  sharedFBSOrientationObserver_sharedFBSOrientationObserver = (uint64_t)objc_alloc_init(MEMORY[0x263F3F798]);
  return MEMORY[0x270F9A758]();
}

+ (int64_t)getUIInterfaceOrientation
{
  mach_port_t v2 = [a1 sharedFBSOrientationObserver];
  int64_t v3 = [v2 activeInterfaceOrientation];

  if ((unint64_t)(v3 - 1) >= 4) {
    return 0;
  }
  else {
    return v3;
  }
}

+ (id)getUIDeviceOrientationAsString
{
  uint64_t v2 = [a1 getUIInterfaceOrientation];
  if ((unint64_t)(v2 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_265559730[v2 - 1];
  }
}

+ (int64_t)getUIDeviceOrientationFromString:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"Portrait"])
  {
    if ([v3 caseInsensitiveCompare:@"PortraitUpsideDown"])
    {
      if ([v3 caseInsensitiveCompare:@"LandscapeLeft"]) {
        int64_t v4 = 4 * ([v3 caseInsensitiveCompare:@"LandscapeRight"] == 0);
      }
      else {
        int64_t v4 = 3;
      }
    }
    else
    {
      int64_t v4 = 2;
    }
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

+ (void)setDoNotDisturb:(BOOL)a3
{
  v4[6] = *MEMORY[0x263EF8340];
  id v3 = "0";
  if (a3) {
    id v3 = "1";
  }
  v4[0] = "/usr/local/bin/coreautomationd";
  v4[1] = "-command";
  v4[2] = "settings.setDNDManualEnabled:";
  v4[3] = "-int";
  v4[4] = v3;
  void v4[5] = 0;
  +[TypistKeyboardUtilities runCommandLineProcess:v4];
}

+ (void)setAirplaneMode:(BOOL)a3
{
  v4[6] = *MEMORY[0x263EF8340];
  id v3 = "NO";
  if (a3) {
    id v3 = "YES";
  }
  v4[0] = "/usr/local/bin/coreautomationd";
  v4[1] = "-command";
  v4[2] = "networking.setAirplaneModeEnabled:";
  v4[3] = "-BOOL";
  v4[4] = v3;
  void v4[5] = 0;
  +[TypistKeyboardUtilities runCommandLineProcess:v4];
}

+ (id)sharedRecapInlinePlayer
{
  uint64_t v8 = (void *)_inlinePlayer;
  if (!_inlinePlayer)
  {
    TYLog(@"Creating a new instance of Recap's inline player", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v12);
    id v9 = objc_alloc_init(MEMORY[0x263F62CD8]);
    uint64_t v10 = (void *)_inlinePlayer;
    _inlinePlayer = (uint64_t)v9;

    uint64_t v8 = (void *)_inlinePlayer;
  }
  return v8;
}

+ (void)tearDownRecapInlinePlayer
{
  if (_inlinePlayer)
  {
    TYLog(@"Tearing down Recap's inline player", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
    [(id)_inlinePlayer tearDown];
    uint64_t v8 = (void *)_inlinePlayer;
    _inlinePlayer = 0;
  }
}

+ (void)setTapTouchRadius:(id)a3
{
}

+ (void)setRecapFastMode:(BOOL)a3
{
}

+ (void)launchRecap:(id)a3
{
}

+ (void)launchRecap:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  if (v5 && [v5 count])
  {
    uint64_t v25 = v6;
    uint64_t v7 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v5;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          char v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
          double v13 = +[TypistKeyboardUtilities formattedKeyplaneName];
          if ([v12 commandType])
          {
            TYLog(@"\n### Recap Command [%@]:\n%@\n###", v14, v15, v16, v17, v18, v19, v20, (char)v13);
            CGSize v21 = +[TypistKeyboardUtilities sharedRecapInlinePlayer];
            v22 = [v12 eventStream];
            [v21 prewarmForEventStream:v22 completion:0];

            v23 = [v12 eventStream];
            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __66__TypistKeyboardUtilities_RecapUtilities__launchRecap_completion___block_invoke;
            v29[3] = &unk_265559650;
            uint64_t v24 = v28;
            long long v30 = v24;
            [v21 playEventStream:v23 options:v7 completion:v29];

            dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
          }
          else if (!+[TypistKeyboardUtilities waitForKeyboardPlane:v12])
          {

            uint64_t v6 = v25;
            id v5 = v26;
            goto LABEL_17;
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v6 = v25;
    id v5 = v26;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_17:
}

intptr_t __66__TypistKeyboardUtilities_RecapUtilities__launchRecap_completion___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)launchRecapWithSyntheticEventStream:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x263F08958]);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke;
  v13[3] = &unk_265559710;
  v13[4] = v14;
  uint64_t v6 = (void (**)(void))MEMORY[0x261210570](v13);
  uint64_t v7 = +[TypistKeyboardUtilities sharedRecapInlinePlayer];
  [v7 prewarmForEventStream:v3 completion:0];

  uint64_t v8 = +[TypistKeyboardUtilities sharedRecapInlinePlayer];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke_2;
  v10[3] = &unk_265559758;
  id v9 = v5;
  id v11 = v9;
  char v12 = v14;
  [v8 playEventStream:v3 options:v4 completion:v10];

  v6[2](v6);
  _Block_object_dispose(v14, 8);
}

uint64_t __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    do
      CGPoint result = +[TypistKeyboardUtilities waitFor:0.02];
    while (!*(unsigned char *)(*(void *)(*(void *)(v1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tryLock];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v3 = *(void **)(a1 + 32);
    return [v3 unlock];
  }
  return result;
}

+ (id)convertRecapCommands:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x261210360]();
  id v5 = objc_opt_new();
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"actions"];
      id v9 = v8;
      if (v8 && [v8 count]) {
        [v5 addObjectsFromArray:v9];
      }

      ++v6;
    }
    while ([v3 count] > v6);
  }
  uint64_t v10 = +[TypistKeyboardUtilities convertRecapCommandsFromListOfActions:v5];

  return v10;
}

+ (id)convertRecapCommandsFromListOfActions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_opt_new();
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    long long v31 = __Block_byref_object_copy__0;
    long long v32 = __Block_byref_object_dispose__0;
    id v33 = (id)objc_opt_new();
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__0;
    id v26 = __Block_byref_object_dispose__0;
    id v27 = (id)objc_opt_new();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __81__TypistKeyboardUtilities_RecapUtilities__convertRecapCommandsFromListOfActions___block_invoke;
    char v15 = &unk_265559780;
    uint64_t v17 = v20;
    uint64_t v18 = &v28;
    uint64_t v19 = &v22;
    id v6 = v5;
    id v16 = v6;
    [v4 enumerateObjectsUsingBlock:&v12];
    if (objc_msgSend((id)v29[5], "length", v12, v13, v14, v15))
    {
      uint64_t v7 = [TYRecapCommand alloc];
      uint64_t v8 = [(TYRecapCommand *)v7 initWithCommandType:1 commandString:v29[5] commandDescription:v23[5]];
      [v6 addObject:v8];
    }
    id v9 = v16;
    id v10 = v6;

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __81__TypistKeyboardUtilities_RecapUtilities__convertRecapCommandsFromListOfActions___block_invoke(uint64_t a1, void *a2)
{
  id v55 = a2;
  id v3 = [v55 objectForKeyedSubscript:@"action"];
  if ([v3 isEqualToString:@"waitfor"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v4 = [[TYRecapCommand alloc] initWithCommandType:1 commandString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) commandDescription:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [*(id *)(a1 + 32) addObject:v4];
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    id v11 = [TYRecapCommand alloc];
    uint64_t v12 = NSString;
    uint64_t v13 = [v55 objectForKeyedSubscript:@"plane"];
    uint64_t v14 = [v12 stringWithFormat:@"%@ %@ ", v3, v13];
    char v15 = NSString;
    id v16 = [v55 objectForKeyedSubscript:@"plane"];
    uint64_t v17 = [v15 stringWithFormat:@"Waiting for plane: %@", v16];
    uint64_t v18 = [(TYRecapCommand *)v11 initWithCommandType:0 commandString:v14 commandDescription:v17];

    [*(id *)(a1 + 32) addObject:v18];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"wait"])
  {
    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v18 = [v55 objectForKeyedSubscript:@"time"];
    [v19 appendFormat:@"%@ %@ ", v3, v18];
LABEL_7:

    goto LABEL_26;
  }
  if ([v3 isEqualToString:@"drag"])
  {
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    char v21 = [v55 objectForKeyedSubscript:@"x"];
    uint64_t v22 = [v55 objectForKeyedSubscript:@"y"];
    v23 = [v55 objectForKeyedSubscript:@"time"];
    if (v23)
    {
      uint64_t v24 = [v55 objectForKeyedSubscript:@"time"];
      [v20 appendFormat:@"d %@ %@ %@ ", v21, v22, v24];
    }
    else
    {
      [v20 appendFormat:@"d %@ %@ %@ ", v21, v22, @"0.7"];
    }

    uint64_t v30 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    long long v31 = [v55 objectForKeyedSubscript:@"key"];
    [v30 appendFormat:@", dragging to %@", v31];
LABEL_24:

    goto LABEL_25;
  }
  if (([v3 isEqualToString:@"flick"] & 1) != 0
    || ([v3 isEqualToString:@"flick-down"] & 1) != 0
    || ([v3 isEqualToString:@"flick-down-left"] & 1) != 0
    || ([v3 isEqualToString:@"flick-down-right"] & 1) != 0
    || ([v3 isEqualToString:@"flick-up"] & 1) != 0
    || ([v3 isEqualToString:@"flick-left"] & 1) != 0
    || [v3 isEqualToString:@"flick-right"])
  {
    uint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v26 = [v55 objectForKeyedSubscript:@"x"];
    id v27 = [v55 objectForKeyedSubscript:@"y"];
    uint64_t v28 = [v55 objectForKeyedSubscript:@"time"];
    if (v28)
    {
      long long v29 = [v55 objectForKeyedSubscript:@"time"];
      [v25 appendFormat:@"f %@ %@ %@ ", v26, v27, v29];
    }
    else
    {
      [v25 appendFormat:@"f %@ %@ %@ ", v26, v27, @"0.1"];
    }

    long long v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    long long v31 = [v55 objectForKeyedSubscript:@"key"];
    [v32 appendFormat:@", flicking to %@", v31];
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"taphold"])
  {
    if (_touchRadiusOverride)
    {
      uint64_t v18 = [NSString stringWithFormat:@"r %@ ", _touchRadiusOverride];
    }
    else
    {
      uint64_t v18 = &stru_270C5A038;
    }
    uint64_t v39 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v40 = [v55 objectForKeyedSubscript:@"x"];
    v41 = [v55 objectForKeyedSubscript:@"y"];
    uint64_t v42 = [v55 objectForKeyedSubscript:@"time"];
    v43 = (void *)v42;
    v44 = @"0.75";
    if (v42) {
      v44 = (__CFString *)v42;
    }
    [v39 appendFormat:@"t %@ %@ %@%@ ", v40, v41, v18, v44];

    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length]) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) appendString:@", "];
    }
    v45 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v46 = [v55 objectForKeyedSubscript:@"key"];
    [v45 appendFormat:@"Tap+hold %@", v46];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"mt"])
  {
    id v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v34 = [v55 objectForKeyedSubscript:@"argumentList"];
    [v33 appendFormat:@"mt %@", v34];

    long long v35 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v36 = @"multitouch: ";
  }
  else
  {
    if (![v3 isEqualToString:@"st"])
    {
      if (_touchRadiusOverride)
      {
        uint64_t v18 = [NSString stringWithFormat:@"r %@ ", _touchRadiusOverride];
      }
      else
      {
        uint64_t v18 = &stru_270C5A038;
      }
      v47 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v48 = [v55 objectForKeyedSubscript:@"x"];
      v49 = [v55 objectForKeyedSubscript:@"y"];
      [v47 appendFormat:@"t %@ %@ %@", v48, v49, v18];

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        v50 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v51 = [v50 length];
        v52 = @", ";
        if (!v51) {
          v52 = &stru_270C5A038;
        }
        [v50 appendFormat:@"%@Tapping ", v52];
      }
      v53 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v54 = [v55 objectForKeyedSubscript:@"key"];
      [v53 appendFormat:@"%@", v54];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_7;
    }
    v37 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v38 = [v55 objectForKeyedSubscript:@"argumentList"];
    [v37 appendFormat:@"st %@", v38];

    long long v35 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v36 = @"stylustouch: ";
  }
  [v35 appendFormat:v36];
LABEL_25:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_26:
}

+ (BOOL)waitForKeyboardPlane:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v5 = [v3 commandString];
  uint64_t v6 = [v5 stringByTrimmingCharactersInSet:v4];
  uint64_t v7 = [v6 componentsSeparatedByCharactersInSet:v4];

  uint64_t v8 = [v7 lastObject];
  [(objc_class *)+[TypistKeyboardData keyboardData] switchToPlane:v8];
  int v9 = 20;
  while (1)
  {
    [MEMORY[0x263F08B88] sleepForTimeInterval:0.15];
    if (currentKeyboardPlaneIsSameAs(v8)) {
      break;
    }
    if (!--v9) {
      goto LABEL_6;
    }
  }
  TYLog(@"Waiting done. Expected keyboard plane has been detected.", v10, v11, v12, v13, v14, v15, v16, v26);
LABEL_6:
  char IsSameAs = currentKeyboardPlaneIsSameAs(v8);
  if ((IsSameAs & 1) == 0)
  {
    uint64_t v18 = [NSNumber numberWithDouble:3.0];
    TYLogl(OS_LOG_TYPE_ERROR, @"### Expected keyboard plane not detected! Timeout after %@ seconds; Recap operation aborted!",
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      (char)v18);
  }
  return IsSameAs;
}

+ (id)replaceWaitForKeyboardPlane:(id)a3 withWait:(double)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)[a3 copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (![v10 commandType])
        {
          uint64_t v11 = NSString;
          uint64_t v12 = [NSNumber numberWithDouble:a4];
          uint64_t v13 = [v11 stringWithFormat:@"wait %@ ", v12];
          uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Waiting %f in lieu of detecting keyplane availability", *(void *)&a4);
          [v10 updateCommand:1 commandString:v13 commandDescription:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (BOOL)setPrefSettings:(id)a3
{
  id v3 = a3;
  id v4 = (id)[(objc_class *)+[TypistKeyboardData keyboardData] setTIPreferences:v3];
  id v5 = (id)[(objc_class *)+[TypistKeyboardData keyboardData] setKeyboardUISettings:v3];

  return 1;
}

+ (id)getKeyboardsForKeyboardSetting
{
  uint64_t v2 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  id v3 = [v2 valueForKey:0];

  return v3;
}

+ (id)setKeyboardForKeyboardSetting:(id)a3
{
  id v3 = a3;
  id v4 = +[TypistKeyboardData keyboardData];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, 0);

  uint64_t v6 = [(objc_class *)v4 setKeyboards:v5];

  return v6;
}

+ (id)appendKeyboardForKeyboardSetting:(id)a3
{
  id v3 = a3;
  id v4 = +[TypistKeyboardData keyboardData];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, 0);

  uint64_t v6 = [(objc_class *)v4 addKeyboards:v5];

  return v6;
}

+ (id)removeKeyboardForKeyboardSetting:(id)a3
{
  id v3 = a3;
  id v4 = +[TypistKeyboardData keyboardData];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, 0);

  uint64_t v6 = [(objc_class *)v4 removeKeyboards:v5];

  return v6;
}

+ (BOOL)setKeyboardDictation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TypistKeyboardData keyboardData];
  id v5 = NSDictionary;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  uint64_t v7 = [v5 dictionaryWithObject:v6 forKey:@"dictation"];
  uint64_t v8 = [(objc_class *)v4 setKeyboardUISettings:v7];
  int v9 = [v8 objectForKeyedSubscript:@"dictation"];
  BOOL v10 = v9 != 0;

  return v10;
}

+ (BOOL)isDictationSupported:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  id v5 = [v3 componentsSeparatedByString:@"@"];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 componentsSeparatedByString:@"_"];
  uint64_t v8 = [v7 componentsJoinedByString:@"-"];

  if (v8)
  {
    char v9 = [MEMORY[0x263F284E8] dictationIsSupportedForLanguageCode:v8 error:0];
  }
  else
  {
LABEL_4:
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)shouldShowDictationKey
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  id v3 = [v2 objectForKeyedSubscript:@"shouldShowDictationKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)shouldShowGlobeKey
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  id v3 = [v2 objectForKeyedSubscript:@"shouldShowGlobeKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)allOneTimeActionsAlreadyTriggered
{
  uint64_t v2 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  if ([v2 oneTimeActionCompleted:*MEMORY[0x263F7E730]])
  {
    id v3 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
    if ([v3 oneTimeActionCompleted:*MEMORY[0x263F7E948]])
    {
      char v4 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
      if ([v4 oneTimeActionCompleted:*MEMORY[0x263F7E758]])
      {
        id v5 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
        char v6 = [v5 oneTimeActionCompleted:*MEMORY[0x263F7E728]];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)triggerAllTIOneTimeActions
{
  TYLog(@"Triggering all one time actions to YES", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v13);
  uint64_t v8 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v8 didTriggerOneTimeAction:*MEMORY[0x263F7E730]];

  char v9 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v9 didTriggerOneTimeAction:*MEMORY[0x263F7E948]];

  BOOL v10 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v10 didTriggerOneTimeAction:*MEMORY[0x263F7E758]];

  uint64_t v11 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v11 didTriggerOneTimeAction:*MEMORY[0x263F7E728]];

  return +[TypistKeyboardUtilities allOneTimeActionsAlreadyTriggered];
}

+ (BOOL)inhibitGlobalAlerts:(BOOL)a3
{
  uint64_t v3 = assertion;
  if (a3)
  {
    if (!assertion)
    {
      uint64_t v3 = SBSAlertItemsSuppressionAssertionCreate();
LABEL_6:
      assertion = v3;
    }
  }
  else if (assertion)
  {
    CFRelease((CFTypeRef)assertion);
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  return v3 != 0;
}

+ (BOOL)getAutoCapitalizationPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E7C0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getAutoCorrectionPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E7C8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getCheckSpellingPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E7E0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getPeriodShortcutPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E828]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getCapsLockPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E7D8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getPredictivePrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E830]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getFuzzyPinyinPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E740]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getKeyPaddlePrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E7B8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getSmartQuotesPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E878]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getSmartDashesPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E868]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getGestureKeyPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F1D398]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getSmallDisplayPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"LowerCaseKeyboard"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getTypologyEnabled
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E940]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getDictationEnabled
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"dictation"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)getSmartFullWidthSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E870]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (int)getShuangpinPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E860]];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)getHWKeyboardCapsLockRomanSwitchPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E748]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (int)getWubiPrefSetting
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getTIPreferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E950]];
  int v4 = [v3 intValue];

  return v4;
}

+ (id)getAggregatedTIPreferences
{
  uint64_t v2 = +[TypistKeyboardData keyboardData];
  return (id)[(objc_class *)v2 getTIPreferences];
}

+ (id)getOneHandedKeyboardHandBias
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F7E7D0]];
  int v4 = v3;
  if (!v3) {
    uint64_t v3 = @"Unknown";
  }
  uint64_t v5 = v3;

  return v5;
}

+ (id)setOneHandedKeyboardHandBias:(id)a3
{
  id v3 = a3;
  int v4 = +[TypistKeyboardData keyboardData];
  uint64_t v5 = *MEMORY[0x263F7E7D0];
  uint64_t v6 = [NSDictionary dictionaryWithObject:v3 forKey:*MEMORY[0x263F7E7D0]];

  uint64_t v7 = [(objc_class *)v4 setKeyboardUISettings:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  return v8;
}

+ (BOOL)isFloating
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getKeyboardUISettings];
  id v3 = [v2 objectForKeyedSubscript:@"floatingKeyboard"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (void)setFloatingKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = +[TypistKeyboardData keyboardData];
  uint64_t v5 = NSDictionary;
  id v8 = [NSNumber numberWithBool:v3];
  uint64_t v6 = [v5 dictionaryWithObject:v8 forKey:@"floatingKeyboard"];
  id v7 = (id)[(objc_class *)v4 setKeyboardUISettings:v6];
}

+ (CGPoint)floatingKeyboardDraggablePoint
{
  uint64_t v2 = +[TypistKeyboardData keyboardData];
  [(objc_class *)v2 floatingKeyboardDraggablePoint];
  result.double y = v4;
  result.double x = v3;
  return result;
}

+ (id)getRegionCodeFromKeyboardID:(id)a3
{
  double v3 = [a3 componentsSeparatedByString:@"@"];
  double v4 = (void *)MEMORY[0x263F08B70];
  uint64_t v5 = [v3 objectAtIndexedSubscript:0];
  uint64_t v6 = [v4 matchText:v5 withPattern:@"_[a-zA-Z]+-"];

  if (v6)
  {
    id v7 = [v3 objectAtIndexedSubscript:0];
    uint64_t v8 = [v6 range];
    BOOL v10 = objc_msgSend(v7, "substringWithRange:", v8, v9);

    uint64_t v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-_"];
    uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];
LABEL_5:

    goto LABEL_6;
  }
  char v13 = (void *)MEMORY[0x263F08B70];
  uint64_t v14 = [v3 objectAtIndexedSubscript:0];
  BOOL v10 = [v13 matchText:v14 withPattern:@"[a-zA-Z]+_[a-zA-Z]+"];

  if (v10)
  {
    uint64_t v15 = [v3 objectAtIndexedSubscript:0];
    uint64_t v16 = [v10 range];
    uint64_t v11 = objc_msgSend(v15, "substringWithRange:", v16, v17);

    long long v18 = [v11 componentsSeparatedByString:@"_"];
    uint64_t v12 = [v18 objectAtIndexedSubscript:1];

    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_6:

  return v12;
}

+ (void)correctForRotation:(CGVector *)a3 orientation:(int64_t)a4
{
  switch(a4)
  {
    case 4:
      ddouble y = a3->dy;
      ddouble x = -a3->dx;
LABEL_7:
      a3->ddouble x = dy;
      a3->ddouble y = dx;
      return;
    case 3:
      ddouble x = a3->dx;
      ddouble y = -a3->dy;
      goto LABEL_7;
    case 2:
      *(float64x2_t *)a3 = vnegq_f64(*(float64x2_t *)a3);
      break;
  }
}

+ (id)formattedKeyplaneName
{
  uint64_t v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getVisibleKeyplaneName];
  if ([v2 containsString:@"_"])
  {
    double v3 = [v2 componentsSeparatedByString:@"_"];
    double v4 = [v3 lastObject];
    uint64_t v5 = [v4 lowercaseString];

    uint64_t v2 = (void *)v5;
  }
  return v2;
}

+ (id)searchForWindow:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__TypistKeyboardUtilities_KeyboardUI__searchForWindow___block_invoke;
  v7[3] = &unk_265559758;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __55__TypistKeyboardUtilities_KeyboardUI__searchForWindow___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        NSClassFromString(*(NSString **)(a1 + 32));
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (id)searchForViewInKeyboardWindow:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__TypistKeyboardUtilities_KeyboardUI__searchForViewInKeyboardWindow___block_invoke;
  v7[3] = &unk_265559758;
  id v4 = v3;
  id v8 = v4;
  long long v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __69__TypistKeyboardUtilities_KeyboardUI__searchForViewInKeyboardWindow___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = +[TypistKeyboardUtilities searchForWindow:@"UIRemoteKeyboardWindow"];
  [v2 allSubViews];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        NSClassFromString(*(NSString **)(a1 + 32));
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (CGRect)findKeyBoundsInKeyboard:(id)a3
{
  id v3 = a3;
  [(objc_class *)+[TypistKeyboardData keyboardData] findKeyBoundsInKeyboard:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

+ (id)getRootViewControllerViaScene
{
  id v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 connectedScenes];

  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__4;
  double v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__TypistKeyboardUtilities_KeyboardUI__getRootViewControllerViaScene__block_invoke;
  v6[3] = &unk_2655599C8;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__TypistKeyboardUtilities_KeyboardUI__getRootViewControllerViaScene__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (![v3 activationState] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v3 windows];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "isKeyWindow", (void)v13))
          {
            uint64_t v10 = [v9 rootViewController];
            uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
            id v12 = *(void **)(v11 + 40);
            *(void *)(v11 + 40) = v10;

            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

+ (id)captureCurrentKeyboardImage
{
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__4;
  v60 = __Block_byref_object_dispose__4;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = (double *)&v50;
  uint64_t v52 = 0x4010000000;
  v53 = &unk_26042309E;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x4010000000;
  v47 = &unk_26042309E;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4;
  uint64_t v42 = __Block_byref_object_dispose__4;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = (double *)&v32;
  uint64_t v34 = 0x3010000000;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  long long v35 = &unk_26042309E;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke;
  v31[3] = &unk_2655599F0;
  v31[4] = &v56;
  v31[5] = &v44;
  +[TypistKeyboardUtilities runOnMainThread:v31];
  if (v57[5])
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_2;
    v30[3] = &unk_265559A18;
    v30[4] = &v50;
    v30[5] = &v56;
    v30[6] = &v32;
    +[TypistKeyboardUtilities runOnMainThread:v30];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_3;
    v29[3] = &unk_265559710;
    void v29[4] = &v38;
    +[TypistKeyboardUtilities runOnMainThread:v29];
    [(id)v39[5] size];
    double v9 = v8;
    [(id)v39[5] size];
    if (v9 >= v10)
    {
      long long v16 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v17 = [v16 model];
      int v18 = [v17 isEqualToString:@"iPhone"];

      if (v18)
      {
        double v19 = v33[4];
        [(id)v39[5] size];
        CGFloat v13 = v20;
        [(id)v39[5] size];
        double v12 = -v19;
        double v14 = v21 - v33[4];
        double v11 = 0.0;
      }
      else
      {
        double v22 = v33[5];
        [(id)v39[5] size];
        double v11 = v22 - v23;
        double v12 = -v33[4];
        CGFloat v13 = v51[6];
        double v14 = v51[7];
      }
    }
    else
    {
      double v11 = -v33[4];
      double v12 = -v33[5];
      CGFloat v13 = v51[6];
      double v14 = v51[7] + v45[6];
    }
    [(id)v39[5] scale];
    CGFloat v25 = v24;
    v63.width = v13;
    v63.height = v14;
    UIGraphicsBeginImageContextWithOptions(v63, 0, v25);
    objc_msgSend((id)v39[5], "drawAtPoint:", v11, v12);
    UIGraphicsGetImageFromCurrentImageContext();
    char v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    id v27 = UIImagePNGRepresentation(v26);
    if (v27)
    {
      long long v15 = UIImagePNGRepresentation(v26);
    }
    else
    {
      long long v15 = 0;
    }
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, @"ERROR: No active keyboard found to capture", v2, v3, v4, v5, v6, v7, v29[0]);
    long long v15 = 0;
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v15;
}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F1C710] activeKeyboard];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v12 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v5 = [v12 delegate];
  uint64_t v6 = [v5 window];
  [v6 safeAreaInsets];
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8);
  void v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_2(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) bounds];
  uint64_t v2 = *(void **)(a1[4] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  uint64_t v7 = *(void **)(*(void *)(a1[5] + 8) + 40);
  [v7 origin];
  double v9 = v8;
  double v11 = v10;
  id v19 = [MEMORY[0x263F1C408] sharedApplication];
  id v12 = [v19 delegate];
  CGFloat v13 = [v12 window];
  double v14 = [v13 rootViewController];
  long long v15 = [v14 view];
  objc_msgSend(v7, "convertPoint:toView:", v15, v9, v11);
  uint64_t v16 = *(void *)(a1[6] + 8);
  *(void *)(v16 + 32) = v17;
  *(void *)(v16 + 40) = v18;
}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F1C688] defaultFormat];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        id v8 = objc_alloc(MEMORY[0x263F1C680]);
        double v9 = [v7 layer];
        [v9 bounds];
        id v12 = objc_msgSend(v8, "initWithSize:format:", v2, v10, v11);

        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_4;
        v17[3] = &unk_265559A40;
        v17[4] = v7;
        uint64_t v13 = [v12 imageWithActions:v17];
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        long long v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 layer];
  [v2 bounds];
  objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
}

+ (BOOL)hasMarkedText
{
  id v2 = +[TypistKeyboardData keyboardData];
  return [(objc_class *)v2 hasMarkedText];
}

+ (id)markedText
{
  id v2 = +[TypistKeyboardData keyboardData];
  return (id)[(objc_class *)v2 markedText];
}

@end