void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id StocksAttributionString()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [MEMORY[0x263F1C6B0] imageNamed:@"yahooAttributionLogo" inBundle:v0];
  v2 = [v1 imageWithRenderingMode:2];

  v3 = [v0 localizedStringForKey:@"STOCKS_ATTRIBUTION" value:0 table:0];
  v4 = [v0 localizedStringForKey:@"STOCK" value:0 table:0];
  uint64_t v5 = [v3 rangeOfString:v4 options:1];
  uint64_t v7 = v6;
  v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
  if (v7)
  {
    if (MKBDeviceUnlockedSinceBoot() || MKBGetDeviceLockState() == 3)
    {
      uint64_t v9 = +[NetPreferences sharedPreferences];
      v10 = [v9 backsideLogoURL];

      if (!v10)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          StocksAttributionString_cold_2();
        }
        goto LABEL_11;
      }
      uint64_t v11 = *MEMORY[0x263F1C258];
      v12 = +[NetPreferences sharedPreferences];
      uint64_t v13 = [v12 backsideLogoURL];
    }
    else
    {
      v20 = +[NetPreferences sharedPreferences];
      v21 = [v20 defaultBacksideLogoURL];

      if (!v21)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          StocksAttributionString_cold_3();
        }
        goto LABEL_11;
      }
      uint64_t v11 = *MEMORY[0x263F1C258];
      v12 = +[NetPreferences sharedPreferences];
      uint64_t v13 = [v12 defaultBacksideLogoURL];
    }
    v14 = (void *)v13;
    objc_msgSend(v8, "addAttribute:value:range:", v11, v13, v5, v7);

LABEL_11:
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F1C2D8], MEMORY[0x263EFFA88], v5, v7);
    goto LABEL_12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    StocksAttributionString_cold_1((uint64_t)v4, (uint64_t)v3);
  }
LABEL_12:
  v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  v16 = objc_opt_new();
  [v16 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  [v16 setImage:v2];
  v17 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v16];
  v18 = (void *)[v17 mutableCopy];

  objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x263F1C220], &unk_26D5E8E50, 0, objc_msgSend(v18, "length"));
  [v8 appendAttributedString:v15];
  [v8 appendAttributedString:v18];

  return v8;
}

void sub_222EE20C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_222EE22E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222EE2884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t pseudoRandomFloatStringInRange(unint64_t a1, unint64_t a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / (float)(0x7FFFFFFF / a2)) + (float)a1));
}

id randomStringOfLength(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F089D8] string];
  if (a1)
  {
    uint64_t v5 = &_os_log_internal;
    do
    {
      if (a2)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%c", ((int)random() % 26 + 97));
      }
      else
      {
        uint64_t v8 = 0;
        uint64_t v8 = random() % 0x7FFF;
        uint64_t v6 = (void *)[[NSString alloc] initWithBytes:&v8 length:4 encoding:2617245952];
        if (!v6 && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v10 = v8;
          _os_log_impl(&dword_222ED9000, v5, OS_LOG_TYPE_DEFAULT, "Got a bad character %#llX", buf, 0xCu);
        }
      }
      [v4 appendString:v6];

      --a1;
    }
    while (a1);
  }

  return v4;
}

uint64_t stocksDidUpdateRemotely(uint64_t a1, void *a2)
{
  return [a2 stocksDidUpdateRemotely];
}

void sub_222EE657C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id StocksLogForCategory(uint64_t a1)
{
  if (StocksLogForCategory_onceToken != -1) {
    dispatch_once(&StocksLogForCategory_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)StocksLogForCategory_loggingTypes;
  v3 = [NSNumber numberWithUnsignedInteger:a1];
  v4 = [v2 objectForKey:v3];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = (void *)&_os_log_internal;
  }
  id v6 = v4;

  return v6;
}

void __StocksLogForCategory_block_invoke()
{
  id v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  os_log_t v0 = os_log_create("com.apple.stocks", "serviceLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v0, &unk_26D5E8EC8);

  os_log_t v1 = os_log_create("com.apple.stocks", "syncLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v1, &unk_26D5E8EE0);

  os_log_t v2 = os_log_create("com.apple.stocks", "duetLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v2, &unk_26D5E8EF8);

  os_log_t v3 = os_log_create("com.apple.stocks", "widgetLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v3, &unk_26D5E8F10);

  os_log_t v4 = os_log_create("com.apple.stocks", "watchlistLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v4, &unk_26D5E8F28);

  uint64_t v5 = [v7 copy];
  id v6 = (void *)StocksLogForCategory_loggingTypes;
  StocksLogForCategory_loggingTypes = v5;
}

void sub_222EEB3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void __parseEntryIntoStruct_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    if ([v9 isEqualToString:@"close"])
    {
      [v7 doubleValue];
      *(void *)(*(void *)(a1 + 48) + 8) = v8;
    }
    else if ([v9 isEqualToString:@"volume"])
    {
      *(void *)(*(void *)(a1 + 48) + 16) = [v7 longLongValue];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

__CFString *OAuthURLEncodedString(CFStringRef originalString)
{
  os_log_t v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], originalString, 0, @":/?#[]@!$&’()*+,;='",
                       0x8000100u);

  return v1;
}

id ParameterString(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v1 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v8 = NSString;
        id v9 = [v1 objectForKeyedSubscript:v7];
        uint64_t v10 = OAuthURLEncodedString(v9);
        uint64_t v11 = [v8 stringWithFormat:@"%@=%@", v7, v10];
        [v2 addObject:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  v12 = [v2 sortedArrayUsingSelector:sel_compare_];
  uint64_t v13 = [v12 componentsJoinedByString:@"&"];

  return v13;
}

id ProductVersion()
{
  if (ProductVersion_onceToken != -1) {
    dispatch_once(&ProductVersion_onceToken, &__block_literal_global_165);
  }
  os_log_t v0 = (void *)ProductVersion_ProductVersion;

  return v0;
}

void __ProductVersion_block_invoke()
{
  id v3 = (id)[objc_alloc(NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  os_log_t v0 = [v3 objectForKey:@"ProductVersion"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)ProductVersion_ProductVersion;
  ProductVersion_ProductVersion = v1;
}

id ClientInfo()
{
  if (ClientInfo_onceToken != -1) {
    dispatch_once(&ClientInfo_onceToken, &__block_literal_global_167);
  }
  os_log_t v0 = (void *)ClientInfo_ClientInfo;

  return v0;
}

void __ClientInfo_block_invoke()
{
  os_log_t v0 = NSString;
  ProductVersion();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"vendor=\"Apple\" model=\"Stocks\"; version=\"1.0.0.%@\"", v3];;
  id v2 = (void *)ClientInfo_ClientInfo;
  ClientInfo_ClientInfo = v1;
}

id DeviceInfo()
{
  if (DeviceInfo_onceToken != -1) {
    dispatch_once(&DeviceInfo_onceToken, &__block_literal_global_172);
  }
  os_log_t v0 = (void *)DeviceInfo_DeviceInfo;

  return v0;
}

void __DeviceInfo_block_invoke()
{
  os_log_t v0 = NSString;
  ProductVersion();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"make=\"Apple\" model=\"iPhone\"; os=\"iPhone\"; osver=\"%@\"", v3];;
  id v2 = (void *)DeviceInfo_DeviceInfo;
  DeviceInfo_DeviceInfo = v1;
}

id _ConsumerSecret()
{
  if (_ConsumerSecret_onceToken != -1) {
    dispatch_once(&_ConsumerSecret_onceToken, &__block_literal_global_177);
  }
  os_log_t v0 = (void *)_ConsumerSecret_ConsumerSecretString;

  return v0;
}

__CFString *_ConsumerKey()
{
  return @"dj0yJmk9cU51ZlhUZ2ZneDBJJmQ9WVdrOU1rOVVlWE5vTkhNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hNw--";
}

id CreateCredential()
{
  id v0 = objc_alloc_init(MEMORY[0x263F5B5B0]);
  [v0 setConsumerKey:@"dj0yJmk9cU51ZlhUZ2ZneDBJJmQ9WVdrOU1rOVVlWE5vTkhNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hNw--"];
  uint64_t v1 = _ConsumerSecret();
  [v0 setConsumerSecret:v1];

  return v0;
}

void sub_222EF09F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ShouldSwapColorsForLocale(void *a1)
{
  id v1 = a1;
  if (ShouldSwapColorsForLocale_onceToken != -1) {
    dispatch_once(&ShouldSwapColorsForLocale_onceToken, &__block_literal_global_8);
  }
  id v2 = [v1 countryCode];
  if (v2) {
    uint64_t v3 = [(id)ShouldSwapColorsForLocale_countryCodesToSwap containsObject:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __ShouldSwapColorsForLocale_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D5E9828];
  uint64_t v1 = ShouldSwapColorsForLocale_countryCodesToSwap;
  ShouldSwapColorsForLocale_countryCodesToSwap = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_222EF82B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_222EFA448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222EFC0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222EFC4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222F00104(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222F0021C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void GizmoSettingsChanged(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[StocksPreferences sharedPreferences];
  [v3 synchronize];

  uint64_t v4 = +[StocksPreferences sharedPreferences];
  id v6 = [v4 objectForKey:@"stocks"];

  [v2 setLocalStockListFromSyncableStockList:v6];
  [v2 saveListChanges];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:StockListDidChangeNotification object:0];
}

void StockWasModified(int a1, int a2, CFStringRef theString2)
{
  if (CFStringCompare((CFStringRef)StockWasAddedDarwinNotification, theString2, 0))
  {
    if (CFStringCompare((CFStringRef)StockWasMovedDarwinNotification, theString2, 0))
    {
      if (CFStringCompare((CFStringRef)StockWasDeletedDarwinNotification, theString2, 0)) {
        return;
      }
      id v4 = +[StockManager sharedManager];
      [v4 _checkForDeletedStocks];
    }
    else
    {
      id v4 = +[StockManager sharedManager];
      [v4 _checkForMovedStocks];
    }
  }
  else
  {
    id v4 = +[StockManager sharedManager];
    [v4 _checkForAddedStocks];
  }
}

void sub_222F10A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RoundToPixel(double a1)
{
  double v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", *(double *)&gScale);
    [v3 scale];
    gScale = v4;

    double v2 = *(double *)&gScale;
  }
  return round(v2 * a1) / v2;
}

double RoundRectToPixel(double a1)
{
  double v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    uint64_t v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 scale];
    gScale = v4;

    double v2 = *(double *)&gScale;
  }
  double v5 = v2;
  if (v2 == -1.0)
  {
    id v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 scale];
    gScale = v7;

    double v5 = *(double *)&gScale;
  }
  double v8 = v5;
  if (v5 == -1.0)
  {
    id v9 = [MEMORY[0x263F1C920] mainScreen];
    [v9 scale];
    gScale = v10;

    double v8 = *(double *)&gScale;
  }
  if (v8 == -1.0)
  {
    uint64_t v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 scale];
    gScale = v12;
  }
  return round(a1 * v2) / v2;
}

double FloorToPixel(double a1)
{
  double v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", *(double *)&gScale);
    [v3 scale];
    gScale = v4;

    double v2 = *(double *)&gScale;
  }
  return floor(v2 * a1) / v2;
}

double CeilToPixel(double a1)
{
  double v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", *(double *)&gScale);
    [v3 scale];
    gScale = v4;

    double v2 = *(double *)&gScale;
  }
  return ceil(v2 * a1) / v2;
}

double RoundToPixelWatch(double a1)
{
  double v2 = *(double *)&gScaleWatch;
  if (*(double *)&gScaleWatch == -1.0)
  {
    Class v3 = (Class)_WKInterfaceDevice;
    if (_WKInterfaceDevice) {
      goto LABEL_5;
    }
    if (!dlopen("/System/Library/Frameworks/WatchKit.framework/WatchKit", 2))
    {
      Class v3 = (Class)_WKInterfaceDevice;
      if (!_WKInterfaceDevice) {
        return round(*(double *)&gScaleWatch * a1) / *(double *)&gScaleWatch;
      }
      goto LABEL_5;
    }
    Class v3 = NSClassFromString(&cfstr_Wkinterfacedev.isa);
    _WKInterfaceDevice = (uint64_t)v3;
    if (v3)
    {
LABEL_5:
      uint64_t v4 = -[objc_class performSelector:](v3, "performSelector:", sel_currentDevice, v2);
      [v4 screenScale];
      gScaleWatch = v5;
    }
  }
  return round(*(double *)&gScaleWatch * a1) / *(double *)&gScaleWatch;
}

void sub_222F13F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id SCKDatabaseLog()
{
  if (SCKDatabaseLog_onceToken != -1) {
    dispatch_once(&SCKDatabaseLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)SCKDatabaseLog_databaseLog;

  return v0;
}

uint64_t __SCKDatabaseLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.stocks", "SCKDatabase");
  uint64_t v1 = SCKDatabaseLog_databaseLog;
  SCKDatabaseLog_databaseLog = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_222F18FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_222F1B8FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_222F1BE2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_222F1D9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_222F1E268(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_222F1E7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void StocksAttributionString_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v5 = [v4 objectAtIndex:0];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "#Attribution Warning! Missing (%@) from string (%@)! (Lang: %@)", (uint8_t *)&v6, 0x20u);
}

void StocksAttributionString_cold_2()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "#Attribution Warning! Missing backsideLogoURL", v0, 2u);
}

void StocksAttributionString_cold_3()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "#Attribution Warning! Missing defaultBacksideLogoURL", v0, 2u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4868](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x270EE4898](allocator, formatter, date);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

CGPathRef CGContextCopyPath(CGContextRef c)
{
  return (CGPathRef)MEMORY[0x270EE5EA8](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGGradientRef CGGradientRetain(CGGradientRef gradient)
{
  return (CGGradientRef)MEMORY[0x270EE66B0](gradient);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x270F0CD30]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F06218]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CPTimeFormatIs24HourMode()
{
  return MEMORY[0x270F0CE10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x270F9A518](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

void srandom(unsigned int a1)
{
}