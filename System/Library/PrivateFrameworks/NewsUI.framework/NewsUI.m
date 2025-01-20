id NUTranslationAnimationTimingFunction()
{
  void *v0;
  uint64_t vars8;

  if (NUTranslationAnimationTimingFunction_onceToken != -1) {
    dispatch_once(&NUTranslationAnimationTimingFunction_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)NUTranslationAnimationTimingFunction_timingFunction;

  return v0;
}

void sub_2221CA0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221CA370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221CA8BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id NUSharedLog()
{
  if (NUSharedLog_once != -1) {
    dispatch_once(&NUSharedLog_once, &__block_literal_global);
  }
  v0 = (void *)NUSharedLog_result;

  return v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2221CD358(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2221CE514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221CF230(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2221CFAE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_2221CFDD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2221D015C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id NUArticleLoadLog()
{
  if (NUArticleLoadLog_once != -1) {
    dispatch_once(&NUArticleLoadLog_once, &__block_literal_global_10);
  }
  v0 = (void *)NUArticleLoadLog_result;

  return v0;
}

void sub_2221D0308(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2221D0B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __NUTranslationAnimationTimingFunction_block_invoke(double a1, double a2, double a3, double a4)
{
  LODWORD(a1) = 1046807010;
  LODWORD(a2) = 971075999;
  LODWORD(a3) = 1037082936;
  LODWORD(a4) = 1065254902;
  NUTranslationAnimationTimingFunction_timingFunction = [MEMORY[0x263F15808] functionWithControlPoints:a1 :a2 :a3 :a4];

  return MEMORY[0x270F9A758]();
}

uint64_t __NUSharedLog_block_invoke()
{
  NUSharedLog_result = (uint64_t)os_log_create("com.apple.news", "NewsUI");

  return MEMORY[0x270F9A758]();
}

uint64_t __NUArticleLoadLog_block_invoke()
{
  NUArticleLoadLog_result = (uint64_t)os_log_create("com.apple.news", "ArticleLoad");

  return MEMORY[0x270F9A758]();
}

id NURSSLog()
{
  if (NURSSLog_once != -1) {
    dispatch_once(&NURSSLog_once, &__block_literal_global_4);
  }
  v0 = (void *)NURSSLog_result;

  return v0;
}

uint64_t __NURSSLog_block_invoke()
{
  NURSSLog_result = (uint64_t)os_log_create("com.apple.news", "RSS");

  return MEMORY[0x270F9A758]();
}

id NUNowPlayingLog()
{
  if (NUNowPlayingLog_once != -1) {
    dispatch_once(&NUNowPlayingLog_once, &__block_literal_global_7);
  }
  v0 = (void *)NUNowPlayingLog_result;

  return v0;
}

uint64_t __NUNowPlayingLog_block_invoke()
{
  NUNowPlayingLog_result = (uint64_t)os_log_create("com.apple.news", "NowPlaying");

  return MEMORY[0x270F9A758]();
}

void sub_2221D24D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221D2958(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2221D2B94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2221D327C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2221D3F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_2221D40F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2221D4330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id NUBundle()
{
  if (NUBundle_onceToken != -1) {
    dispatch_once(&NUBundle_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)NUBundle_bundle;

  return v0;
}

uint64_t __NUBundle_block_invoke()
{
  NUBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

void sub_2221D7ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2221DA26C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2221DBBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL NUDeviceIsScreenSizeLessThanOrEqualToPhone4(double a1, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    double v4 = a3;
  }
  else {
    double v4 = a4;
  }
  return v4 < 568.0;
}

BOOL NUDeviceIsScreenSizeLessThanOrEqualToPhone5(double a1, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    double v4 = a3;
  }
  else {
    double v4 = a4;
  }
  return v4 <= 568.0;
}

BOOL NUDeviceIsScreenSizeLessThanOrEqualToPhone6(double a1, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    double v4 = a3;
  }
  else {
    double v4 = a4;
  }
  return v4 <= 667.0;
}

BOOL NUDeviceIsScreenSizeLessThanOrEqualToPhone6Plus(double a1, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    double v4 = a3;
  }
  else {
    double v4 = a4;
  }
  return v4 <= 736.0;
}

BOOL NUDeviceIsScreenSizeLessThanOrEqualToPadPro(double a1, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    double v4 = a3;
  }
  else {
    double v4 = a4;
  }
  return v4 == 1366.0;
}

id NUDeviceTraitLookup()
{
  if (NUDeviceTraitLookup_onceToken != -1) {
    dispatch_once(&NUDeviceTraitLookup_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)NUDeviceTraitLookup_deviceTrait;

  return v0;
}

void __NUDeviceTraitLookup_block_invoke()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;

  v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  switch(v6)
  {
    case -1:
    case 2:
    case 3:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __NUDeviceTraitLookup_block_invoke_cold_2();
      }
      goto LABEL_6;
    case 0:
      if (v2 >= v4) {
        double v8 = v2;
      }
      else {
        double v8 = v4;
      }
      uint64_t v9 = 64;
      if (v8 < 568.0) {
        uint64_t v9 = 65;
      }
      if (v8 <= 568.0) {
        v9 |= 2uLL;
      }
      uint64_t v7 = v9 | 4;
      if (v8 <= 736.0)
      {
        if (v8 <= 667.0) {
          v9 |= 4uLL;
        }
        uint64_t v7 = v9 | 8;
      }
      break;
    case 1:
      if (v2 >= v4) {
        double v10 = v2;
      }
      else {
        double v10 = v4;
      }
      if (v10 == 1366.0) {
        uint64_t v7 = 112;
      }
      else {
        uint64_t v7 = 80;
      }
      break;
    default:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __NUDeviceTraitLookup_block_invoke_cold_1();
      }
LABEL_6:
      uint64_t v7 = 64;
      break;
  }
  v11 = [[NUDeviceTrait alloc] initWithDeviceTraitSize:v7];
  v12 = (void *)NUDeviceTraitLookup_deviceTrait;
  NUDeviceTraitLookup_deviceTrait = (uint64_t)v11;
}

void _NUCrawlView(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  char v14 = 0;
  v6[2](v6, v5, 0, &v14);
  if (!v14)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___NUCrawlView_block_invoke_2;
    v10[3] = &unk_2645FEAD0;
    v12 = v15;
    uint64_t v13 = a2;
    v11 = v6;
    ___NUCrawlView_block_invoke_2((uint64_t)v10);
    uint64_t v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)MEMORY[0x223C968A0](v7, v8);
    ((void (**)(void, void *, id, char *))v7)[2](v7, v9, v5, &v14);
  }
  _Block_object_dispose(v15, 8);
}

void sub_2221DFF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void NUCrawlView(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __NUCrawlView_block_invoke;
  v7[3] = &unk_2645FEAF8;
  id v8 = v5;
  id v6 = v5;
  _NUCrawlView(a1, a2, v7);
}

uint64_t __NUCrawlView_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id NUCrawlViewAndCollect(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  uint64_t v7 = objc_opt_new();
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  char v14 = __NUCrawlViewAndCollect_block_invoke;
  v15 = &unk_2645FEB20;
  id v16 = v7;
  id v17 = v5;
  id v8 = v7;
  id v9 = v5;
  NUCrawlView(v6, a2, &v12);

  double v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

void __NUCrawlViewAndCollect_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

id NUFirstViewPassing(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __NUFirstViewPassing_block_invoke;
  v10[3] = &unk_2645FEB48;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  NUCrawlView(v5, a2, v10);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void sub_2221E0774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __NUFirstViewPassing_block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v8 = a2;
  char v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = v8;
  if ((v5 & 1) == 0) {
    id v7 = *(void **)(v6 + 40);
  }
  objc_storeStrong((id *)(v6 + 40), v7);
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

BOOL NUViewContainsViewOfClass(void *a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __NUViewContainsViewOfClass_block_invoke;
  v6[3] = &__block_descriptor_40_e16_B16__0__UIView_8lu32l8;
  v6[4] = a3;
  id v3 = NUFirstViewPassing(a1, a2, v6);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __NUViewContainsViewOfClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void _NUCrawlViewController(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  char v13 = 0;
  v6[2](v6, v5, 0, &v13);
  if (!v13)
  {
    if (a2 == 2)
    {
      id v7 = v11;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      id v8 = ___NUCrawlViewController_block_invoke_3;
    }
    else
    {
      if (a2 != 1)
      {
        id v9 = 0;
        goto LABEL_8;
      }
      id v7 = v12;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      id v8 = ___NUCrawlViewController_block_invoke_2;
    }
    v7[2] = v8;
    v7[3] = &unk_2645FEB90;
    v7[5] = v14;
    void v7[4] = v6;
    id v9 = (void (**)(void, void, void, void))MEMORY[0x223C968A0](v7);

LABEL_8:
    double v10 = (void *)MEMORY[0x223C968A0](v9);
    ((void (**)(void, void *, id, char *))v9)[2](v9, v10, v5, &v13);
  }
  _Block_object_dispose(v14, 8);
}

void sub_2221E0A54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void NUCrawlViewController(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __NUCrawlViewController_block_invoke;
  v7[3] = &unk_2645FEBB8;
  id v8 = v5;
  id v6 = v5;
  _NUCrawlViewController(a1, a2, v7);
}

uint64_t __NUCrawlViewController_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id NUCrawlViewControllerAndCollect(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  id v7 = objc_opt_new();
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  char v14 = __NUCrawlViewControllerAndCollect_block_invoke;
  uint64_t v15 = &unk_2645FEBE0;
  id v16 = v7;
  id v17 = v5;
  id v8 = v7;
  id v9 = v5;
  NUCrawlViewController(v6, a2, &v12);

  double v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

void __NUCrawlViewControllerAndCollect_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

id NUFirstViewControllerPassing(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __NUFirstViewControllerPassing_block_invoke;
  v10[3] = &unk_2645FEC08;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  NUCrawlViewController(v5, a2, v10);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void sub_2221E123C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NUFirstViewControllerPassing_block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v8 = a2;
  char v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = v8;
  if ((v5 & 1) == 0) {
    id v7 = *(void **)(v6 + 40);
  }
  objc_storeStrong((id *)(v6 + 40), v7);
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

BOOL NUViewControllerContainsViewControllerOfClass(void *a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __NUViewControllerContainsViewControllerOfClass_block_invoke;
  v6[3] = &__block_descriptor_40_e26_B16__0__UIViewController_8lu32l8;
  v6[4] = a3;
  id v3 = NUFirstViewControllerPassing(a1, a2, v6);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __NUViewControllerContainsViewControllerOfClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id NUViewHierarchy(void *a1)
{
  id v1 = a1;
  double v2 = objc_opt_new();
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __NUViewHierarchy_block_invoke_2;
  id v9 = &unk_2645FEC70;
  id v10 = v2;
  id v11 = &__block_literal_global_16;
  id v3 = v2;
  _NUCrawlView(v1, 2, &v6);

  BOOL v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

id __NUViewHierarchy_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  for (i = objc_opt_new(); a3; --a3)
    [i appendString:@"     "];
  uint64_t v6 = [v4 description];
  [i appendFormat:@"%@\n", v6];

  uint64_t v7 = (void *)[i copy];

  return v7;
}

void __NUViewHierarchy_block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v2];
}

id NUViewControllerHierarchy(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __NUViewControllerHierarchy_block_invoke_2;
  id v9 = &unk_2645FECB8;
  id v10 = v2;
  id v11 = &__block_literal_global_23;
  id v3 = v2;
  _NUCrawlViewController(v1, 2, &v6);

  id v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

id __NUViewControllerHierarchy_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  for (i = objc_opt_new(); a3; --a3)
    [i appendString:@"     "];
  uint64_t v6 = [v4 description];
  [i appendFormat:@"%@\n", v6];

  uint64_t v7 = (void *)[i copy];

  return v7;
}

void __NUViewControllerHierarchy_block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v2];
}

void sub_2221E2ABC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak((id *)(v6 - 128));
  _Unwind_Resume(a1);
}

void sub_2221E3430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, id *a12, id *a13)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v13 - 168));
  _Unwind_Resume(a1);
}

void sub_2221E3AF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2221E3DAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2221E5B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2221E83F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221E8A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221E8FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221EA378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221EA51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221EA6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221EA868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221EDD90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2221F2060(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2221F2830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2221F2988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_2221F33C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NUTraitOptionFromUITraitCollection(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 horizontalSizeClass];
  if (v2 == 2)
  {
    unint64_t v6 = [v1 verticalSizeClass];
    if (v6 <= 2)
    {
      uint64_t v5 = qword_222201888[v6];
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v5 = 16;
    goto LABEL_11;
  }
  if (v2 != 1) {
    goto LABEL_10;
  }
  uint64_t v3 = [v1 verticalSizeClass];
  uint64_t v4 = 1;
  if (v3 != 1) {
    uint64_t v4 = 2;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 16;
  }
LABEL_11:

  return v5;
}

void sub_2221F5728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2221F8B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221F8FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2221F9404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __NUDeviceTraitLookup_block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
  int v1 = 136315906;
  uint64_t v2 = "id<NUDeviceTrait> NUDeviceTraitLookup()_block_invoke";
  __int16 v3 = 2080;
  uint64_t v4 = "NUDeviceTrait.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2221C5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void __NUDeviceTraitLookup_block_invoke_cold_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
  int v1 = 136315906;
  uint64_t v2 = "id<NUDeviceTrait> NUDeviceTraitLookup()_block_invoke";
  __int16 v3 = 2080;
  uint64_t v4 = "NUDeviceTrait.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2221C5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
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

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x270EE9CD8](fontURL, *(void *)&scope, error);
}

BOOL CTFontManagerUnregisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x270EE9CE8](fontURL, *(void *)&scope, error);
}

uint64_t FCCachedThumbnailForHeadline()
{
  return MEMORY[0x270F4EFE0]();
}

uint64_t FCDefaultsReadEndpointEnvironment()
{
  return MEMORY[0x270F4EFF8]();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return MEMORY[0x270F4F018]();
}

uint64_t FCDynamicCast()
{
  return MEMORY[0x270F4F020]();
}

uint64_t FCInferQualityOfServiceFromRelativePriority()
{
  return MEMORY[0x270F4F030]();
}

uint64_t FCPerformBlockOnMainThread()
{
  return MEMORY[0x270F4F040]();
}

uint64_t FCProtocolCast()
{
  return MEMORY[0x270F4F050]();
}

uint64_t FCThumbnailForHeadline()
{
  return MEMORY[0x270F4F068]();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return MEMORY[0x270F4F078]();
}

uint64_t FCURLForContainerizedUserAccountDocumentDirectory()
{
  return MEMORY[0x270F4F080]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x270F50028]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakOrQueueIfNeeded()
{
  return MEMORY[0x270F80A20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityFocusedElements()
{
  return MEMORY[0x270F80AC0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}