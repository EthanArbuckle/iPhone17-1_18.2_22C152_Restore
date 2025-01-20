uint64_t SUUIUserInterfaceIdiom(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (!v1 || (v3 = [v1 userInterfaceIdiomOverride], v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    v3 = [v4 userInterfaceIdiom];
  }
  return v3;
}

BOOL SUUIAllowsLandscapePhone()
{
  int v0 = SUUIAllowsLandscapePhone_sValue;
  if (SUUIAllowsLandscapePhone_sValue == 255)
  {
    v1 = [MEMORY[0x263F82B60] mainScreen];
    [v1 _referenceBounds];
    SUUIAllowsLandscapePhone_sValue = v2 == 736.0;

    int v0 = SUUIAllowsLandscapePhone_sValue;
  }
  return v0 != 0;
}

uint64_t storeSemanticContentAttribute()
{
  if (didSetAtLeastOnce != -1) {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
  }
  if (shouldFlipForRTL) {
    return 4;
  }
  else {
    return 3;
  }
}

id SUUITabBarControllerGetMoreNavigationController(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    double v2 = [v1 moreNavigationController];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

void __storeShouldReverseLayoutDirection_block_invoke()
{
  id v0 = +[SUUIClientContext defaultContext];
  _SUUISetShouldReverseLayoutDirectionWithContext(v0);
}

void _SUUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  id v16 = a1;
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v2 = [v1 BOOLForKey:@"SKForceRightToLeftWritingDirection"];

  if (v2)
  {
    shouldFlipForRTL = 1;
  }
  else
  {
    v3 = [MEMORY[0x263F086E0] mainBundle];
    v4 = [v3 infoDictionary];
    v5 = [v4 objectForKeyedSubscript:@"SKRespectClientUserInterfaceLayoutDirection"];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      v7 = [MEMORY[0x263F82438] sharedApplication];
      v8 = [v7 keyWindow];
      uint64_t v9 = [v8 semanticContentAttribute];

      shouldFlipForRTL = [MEMORY[0x263F82E00] userInterfaceLayoutDirectionForSemanticContentAttribute:v9] == 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x263EFF960];
      v11 = [v16 valueForConfigurationKey:@"locale"];
      v12 = [v10 localeWithLocaleIdentifier:v11];

      v13 = (void *)MEMORY[0x263F81658];
      v14 = [v12 objectForKey:*MEMORY[0x263EFF508]];
      uint64_t v15 = [v13 defaultWritingDirectionForLanguage:v14];

      if (v15 == 1) {
        shouldFlipForRTL = 1;
      }
    }
  }
}

double SUUICompactThreshold()
{
  if (SUUICompactThreshold_onceToken != -1) {
    dispatch_once(&SUUICompactThreshold_onceToken, &__block_literal_global_516);
  }
  return *(double *)&SUUICompactThreshold_threshold;
}

void SUUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  uint64_t v1 = didSetAtLeastOnce;
  id v2 = a1;
  id v3 = v2;
  if (v1 != -1)
  {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_2_0);
    id v2 = v3;
  }
  _SUUISetShouldReverseLayoutDirectionWithContext(v2);
}

uint64_t SUUIBundle()
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileStoreUI"];
}

void sub_25659A18C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void __SUUICompactThreshold_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v8 = -337121064;
  long long v7 = xmmword_2568A1350;
  int v6 = 450980336;
  long long v5 = xmmword_2568A1364;
  if (MGIsDeviceOneOfType()) {
    goto LABEL_2;
  }
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    uint64_t v2 = CFDictionaryGetValue(v0, @"ArtworkDeviceSubType");
    if (v2)
    {
      id v3 = v2;
      int v4 = objc_msgSend(v2, "intValue", &v5, 0);
      CFRelease(v1);

      if (v4 == 2436) {
LABEL_2:
      }
        SUUICompactThreshold_threshold = 0x4089600000000000;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

void SUUINavigationControllerWillShowViewController(void *a1, void *a2)
{
  id v12 = a1;
  id v3 = a2;
  uint64_t v4 = [v12 lastOperation];
  if (v4 == 2)
  {
    id v5 = [v12 disappearingViewController];
    id v6 = v3;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    id v5 = v3;
    id v6 = [v12 disappearingViewController];
LABEL_5:
    long long v7 = v6;
    goto LABEL_7;
  }
  id v5 = v3;
  long long v7 = 0;
LABEL_7:
  int v8 = [v12 navigationBar];
  uint64_t v9 = [v8 _backdropViewLayerGroupName];

  v10 = [v5 SUUIPinnedHeaderView];
  [v10 setGroupName:v9];

  v11 = [v7 SUUIPinnedHeaderView];
  [v11 setGroupName:0];
}

void SUUINavigationControllerDidShowViewController(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 navigationBar];
  id v6 = [v4 _backdropViewLayerGroupName];

  id v5 = [v3 SUUIPinnedHeaderView];

  [v5 setGroupName:v6];
}

void SUUIScrollViewSetPinnedHeaderContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
}

void __SUUIScrollViewSetKeyedContentInsets(void *a1, const void *a2, int a3, double a4, double a5, double a6, double a7)
{
  id object = a1;
  v11 = objc_getAssociatedObject(object, a2);
  id v12 = v11;
  if (v11)
  {
    [v11 UIEdgeInsetsValue];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x263F834E8];
    double v16 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v18 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v20 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  [object contentInset];
  if (v16 != a5 || v14 != a4 || v20 != a7 || v18 != a6)
  {
    double v39 = v23;
    double v40 = v24;
    double v37 = v18;
    double v38 = v22;
    double v28 = v16;
    double v29 = v21;
    [object contentOffset];
    double v35 = v31;
    double v36 = v30;
    double v41 = a4;
    double v42 = a5;
    double v32 = a4 - v14;
    double v33 = a5 - v28 + v38;
    objc_msgSend(object, "setContentInset:", v32 + v29, v33, a6 - v37 + v39, a7 - v20 + v40);
    objc_msgSend(object, "setScrollIndicatorInsets:", v32 + v29, v33, a6 - v37 + v39, a7 - v20 + v40);
    if (a3) {
      objc_msgSend(object, "setContentOffset:", v36, v35 - v32);
    }
    v34 = objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", v41, v42, a6, a7);
    objc_setAssociatedObject(object, a2, v34, (void *)1);
  }
}

void SUUIScrollViewSetDefaultContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
}

double SUUILayoutGuideInsets(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 parentViewController];
  if (v2)
  {
    id v3 = v1;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v4 = v2;

      uint64_t v2 = [v4 parentViewController];

      id v3 = v4;
      if (!v2) {
        goto LABEL_9;
      }
    }
    id v4 = v3;
  }
  else
  {
    id v4 = v1;
  }
LABEL_9:
  id v5 = [v4 topLayoutGuide];
  [v5 length];
  double v7 = v6;
  int v8 = [v4 bottomLayoutGuide];
  [v8 length];

  return v7;
}

void sub_2565A1B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565A1D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_2565A1EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565A557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2565A5934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565A6E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565A9E24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2565AAA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565AAE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565AB0BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2565ABE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

void sub_2565AD2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void *__Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

{
}

void sub_2565AE20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2565AFE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

{
}

void sub_2565B0068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565B08BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v14 - 96));
  _Unwind_Resume(a1);
}

void sub_2565B1098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565B18FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565B2E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565B34F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak((id *)(v41 - 248));
  _Unwind_Resume(a1);
}

void sub_2565B6388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2565B6684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565BCE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565BD19C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2565BED58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

{
}

void sub_2565C0FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565C4930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565C5D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t SUUICardElementTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"activity"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"billboard"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"editorial"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"programmed"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_2565C7158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

{
}

BOOL SUUINearMeIsEnabledForAuthorizationStatus(int a1)
{
  return (a1 - 3) < 2;
}

BOOL SUUILocationIsAccurate(void *a1)
{
  id v1 = a1;
  [v1 horizontalAccuracy];
  double v3 = v2;
  id v4 = [v1 timestamp];

  BOOL v5 = 0;
  if (v3 > 0.00000011920929 && v3 <= 5000.0)
  {
    if (v4)
    {
      [v4 timeIntervalSinceNow];
      BOOL v5 = v6 >= -30.0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }

  return v5;
}

void sub_2565C7F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565CCDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void SUUIStoreAssetResourceLoaderConfigureWithDelegate(void *a1, void *a2)
{
  id v3 = a2;
  id object = a1;
  [object setDelegate:v3 queue:MEMORY[0x263EF83A0]];
  objc_setAssociatedObject(object, (const void *)_SUUIStoreAssetResourceLoaderDelegateAssociatedObjectKeyStrongDelegate, v3, (void *)1);
}

void sub_2565CD42C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2565CE03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_2565CE40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565CE904(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void SUUIGetImagesFromView(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a1;
  [v7 bounds];
  v27.width = v8;
  v27.height = v9;
  UIGraphicsBeginImageContextWithOptions(v27, 1, 0.0);
  v10 = [v7 layer];

  [v10 renderInContext:UIGraphicsGetCurrentContext()];
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v11 scale];
  double v13 = v12;
  id v14 = v11;
  double v15 = (CGImage *)[v14 CGImage];
  [v14 size];
  v28.size.width = v13 * v16;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.height = v13 * a4;
  double v17 = CGImageCreateWithImageInRect(v15, v28);
  double v18 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v14, "imageOrientation"), v13);
  CGImageRelease(v17);
  if (a2) {
    *a2 = v18;
  }
  id v25 = v14;
  double v19 = (CGImage *)[v25 CGImage];
  [v25 size];
  CGFloat v21 = v13 * v20;
  [v25 size];
  v29.size.height = v13 * (v22 - a4);
  v29.origin.x = 0.0;
  v29.origin.y = v13 * a4;
  v29.size.width = v21;
  double v23 = CGImageCreateWithImageInRect(v19, v29);
  double v24 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:scale:orientation:", v23, objc_msgSend(v25, "imageOrientation"), v13);
  CGImageRelease(v23);
  if (a3) {
    *a3 = v24;
  }
}

id SUUINavigationItemsShallowCopy(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  if ([v1 count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [v1 objectAtIndex:v3];
      id v5 = objc_alloc_init(MEMORY[0x263F829C8]);
      double v6 = [v4 title];
      [v5 setTitle:v6];

      objc_msgSend(v5, "setHidesBackButton:", objc_msgSend(v4, "hidesBackButton"));
      id v7 = [v4 prompt];
      [v5 setPrompt:v7];

      objc_msgSend(v5, "setLeftItemsSupplementBackButton:", objc_msgSend(v4, "leftItemsSupplementBackButton"));
      [v2 addObject:v5];

      ++v3;
    }
    while (v3 < [v1 count]);
  }

  return v2;
}

id SUUIStackedBarSpringAnimationForExpandCollapse(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = [v5 layer];
  [v6 position];
  double v8 = v7;
  double v10 = v9;

  [v5 frame];
  double v12 = v8 + a2 - v11;
  [v5 frame];
  double v14 = v10 + a3 - v13;
  double v15 = [MEMORY[0x263F15890] animationWithKeyPath:@"position"];
  [v15 setDamping:26.0];
  [v15 setDuration:1.0];
  [v15 setFillMode:*MEMORY[0x263F15AA0]];
  [v15 setMass:1.0];
  [v15 setStiffness:250.0];
  double v16 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v15 setTimingFunction:v16];

  [v15 setVelocity:0.0];
  double v17 = (void *)MEMORY[0x263F08D40];
  double v18 = [v5 layer];
  [v18 position];
  double v19 = objc_msgSend(v17, "valueWithCGPoint:");
  [v15 setFromValue:v19];

  double v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v12, v14);
  [v15 setToValue:v20];

  CGFloat v21 = [v5 layer];
  [v21 addAnimation:v15 forKey:@"ExpandCollapse"];

  double v22 = [v5 layer];

  objc_msgSend(v22, "setPosition:", v12, v14);
  return v15;
}

BOOL SUUIEditorialLayoutOrientationForInterfaceOrientation(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL SUUIEditorialLayoutOrientationForView(void *a1)
{
  [a1 bounds];
  return v1 > v2;
}

void sub_2565D6D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_2565D8E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565DA7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565DAAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIPopoverBackdropViewForView(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    double v2 = v1;
    unint64_t v3 = 0;
    do
    {
      id v4 = v2;

      double v2 = [v4 superview];

      unint64_t v3 = v4;
    }
    while (v2);
  }
  else
  {
    id v4 = 0;
  }
  objc_opt_class();
  id v5 = __ChildViewWithClass(v4);
  objc_opt_class();
  double v6 = __ChildViewWithClass(v5);

  return v6;
}

id __ChildViewWithClass(void *a1)
{
  id v1 = [a1 subviews];
  double v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = [v2 count];
  if (v3 < 1)
  {
LABEL_7:
    double v6 = 0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    while (1)
    {
      double v6 = [v2 objectAtIndex:v5];
      if (objc_opt_isKindOfClass()) {
        break;
      }
      double v7 = [v6 subviews];
      if ([v7 count])
      {
        [v2 addObjectsFromArray:v7];
        uint64_t v4 = [v2 count];
      }

      if (++v5 >= v4) {
        goto LABEL_7;
      }
    }
  }

  return v6;
}

uint64_t CGColorSpaceGetSRGB()
{
  if (CGColorSpaceGetSRGB::sOnceToken != -1) {
    dispatch_once(&CGColorSpaceGetSRGB::sOnceToken, &__block_literal_global_4);
  }
  return CGColorSpaceGetSRGB::sSpace;
}

void __CGColorSpaceGetSRGB_block_invoke()
{
  {
    getkColorSyncSRGBProfileSymbolLoc(void)::ptr = 0;
  }
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2000000000;
  CFDictionaryRef v0 = (uint64_t *)getkColorSyncSRGBProfileSymbolLoc(void)::ptr;
  double v14 = (void *)getkColorSyncSRGBProfileSymbolLoc(void)::ptr;
  if (!getkColorSyncSRGBProfileSymbolLoc(void)::ptr)
  {
    id v1 = (void *)ColorSyncLibrary();
    v12[3] = (uint64_t)dlsym(v1, "kColorSyncSRGBProfile");
    getkColorSyncSRGBProfileSymbolLoc(void)::ptr = v12[3];
    CFDictionaryRef v0 = (uint64_t *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v0) {
    __CGColorSpaceGetSRGB_block_invoke_cold_1();
  }
  uint64_t v2 = *v0;
  {
    getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = 0;
  }
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v3 = (uint64_t (*)(uint64_t))getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
  double v14 = getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
  if (!getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr)
  {
    uint64_t v4 = (void *)ColorSyncLibrary();
    v12[3] = (uint64_t)dlsym(v4, "ColorSyncProfileCreateWithName");
    getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = (_UNKNOWN *)v12[3];
    uint64_t v3 = (uint64_t (*)(uint64_t))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3) {
    __CGColorSpaceGetSRGB_block_invoke_cold_1();
  }
  uint64_t v5 = v3(v2);
  if (v5)
  {
    double v6 = (const void *)v5;
    {
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = 0;
    }
    uint64_t v11 = 0;
    double v12 = &v11;
    uint64_t v13 = 0x2000000000;
    double v7 = (uint64_t (*)(const void *, void))getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    double v14 = getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    if (!getColorSyncProfileCopyDataSymbolLoc(void)::ptr)
    {
      double v8 = (void *)ColorSyncLibrary();
      v12[3] = (uint64_t)dlsym(v8, "ColorSyncProfileCopyData");
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = (_UNKNOWN *)v12[3];
      double v7 = (uint64_t (*)(const void *, void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v7) {
      __CGColorSpaceGetSRGB_block_invoke_cold_1();
    }
    uint64_t v9 = v7(v6, 0);
    if (v9)
    {
      double v10 = (const void *)v9;
      CGColorSpaceGetSRGB::sSpace = MEMORY[0x25A2A8E20]();
      CFRelease(v10);
    }
    CFRelease(v6);
  }
}

void sub_2565DD3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL42getColorSyncProfileCreateWithNameSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ColorSyncLibrary();
  result = dlsym(v2, "ColorSyncProfileCreateWithName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ColorSyncLibrary(void)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  {
    ColorSyncLibraryCore(char **)::frameworkLibrary = 0;
  }
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 0x40000000;
    v3[3] = ___ZL20ColorSyncLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_tmp_4;
    v3[5] = v3;
    long long v4 = xmmword_265401920;
    uint64_t v5 = 0;
    ColorSyncLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ColorSyncLibraryCore(char **)::frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_8;
  }
  if (v3[0]) {
LABEL_8:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL20ColorSyncLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ColorSyncLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL33getkColorSyncSRGBProfileSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncSRGBProfile");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncSRGBProfileSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL36getColorSyncProfileCopyDataSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ColorSyncLibrary();
  uint64_t result = dlsym(v2, "ColorSyncProfileCopyData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getColorSyncProfileCopyDataSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2565E0618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

double *__SK_RGBtoHSV(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 >= a5) {
    double v6 = a4;
  }
  else {
    double v6 = a5;
  }
  if (v6 < a6) {
    double v6 = a6;
  }
  float v7 = v6;
  double v8 = v7;
  *a3 = v7;
  if (v7 == 0.0)
  {
    void *result = NAN;
    *a2 = 0.0;
    *a3 = 0.0;
  }
  else
  {
    if (a4 <= a5) {
      double v9 = a4;
    }
    else {
      double v9 = a5;
    }
    if (v9 > a6) {
      double v9 = a6;
    }
    float v10 = v9;
    float v11 = v7 - v10;
    *a2 = (float)(v11 / v7);
    double v12 = v11;
    if (v8 == a4)
    {
      double v13 = (a5 - a6) / v12;
    }
    else
    {
      BOOL v14 = v8 == a5;
      double v15 = (a4 - a5) / v12 + 4.0;
      double v13 = (a6 - a4) / v12 + 2.0;
      if (!v14) {
        double v13 = v15;
      }
    }
    double v16 = v13 * 60.0;
    if (v16 < 0.0) {
      double v16 = v16 + 360.0;
    }
    void *result = v16;
  }
  return result;
}

void sub_2565E362C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565E42E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_2565E6BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565E7150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_2565E7E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565E8814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2565E95A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565EA36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_2565EBB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIPageComponentClassForComponentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x1A)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_opt_class();
  }
  return v2;
}

uint64_t SUUIPageComponentTypeForBlockType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"accountButtons"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"counter"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"divider"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"editorial"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"expand"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"flowcase"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"gallery"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"grid"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"lockup"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"media"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"popup"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"quicklinks"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"row"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"showcase"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"spacer"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"swoosh"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"tabs"])
  {
    uint64_t v2 = 11;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SUUIPageComponentTypeForFeaturedContentKind(uint64_t a1)
{
  uint64_t result = 15;
  switch(a1)
  {
    case 257:
      uint64_t result = 10;
      break;
    case 258:
      uint64_t result = 18;
      break;
    case 259:
    case 262:
    case 263:
    case 264:
    case 265:
    case 267:
      goto LABEL_4;
    case 260:
    case 261:
    case 268:
      return result;
    case 266:
      uint64_t result = 12;
      break;
    default:
      if ((unint64_t)(a1 - 304) >= 2) {
LABEL_4:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t SUUIPageComponentFontWeightForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"light"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"medium"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_2565EF2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_2565EF610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_2565F1984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565F1C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565F2B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565F629C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2565F7124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2565FB528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_2565FBF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t (*SUUIMetricsLaunchApplicationWithIdentifier(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  long long v4 = (void *)SUUISpringBoardServicesFramework();
  uint64_t result = (uint64_t (*)(uint64_t, uint64_t))SUUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifier", v4);
  if (result)
  {
    return (uint64_t (*)(uint64_t, uint64_t))result(a1, a2);
  }
  return result;
}

uint64_t (*SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  uint64_t v10 = (void *)SUUISpringBoardServicesFramework();
  uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SUUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions", v10);
  if (result)
  {
    return (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))result(a1, a2, a3, a4, a5);
  }
  return result;
}

id SUUIMetricsNavigationTypeFromNavigationControllerOperation(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = (id *)MEMORY[0x263F7BB98];
LABEL_5:
    id v3 = *v2;
    return v3;
  }
  if (a1 == 2)
  {
    uint64_t v2 = (id *)MEMORY[0x263F7BB90];
    goto LABEL_5;
  }
  id v3 = 0;
  return v3;
}

void SUUIMetricsOpenSensitiveURL(void *a1, void *a2)
{
  id v9 = a1;
  id v3 = (void *)MEMORY[0x263F82438];
  id v4 = a2;
  uint64_t v5 = [v3 sharedApplication];
  double v6 = [v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 application:v5 recordExitMetricsEventWithURL:v9];
  }
  uint64_t v7 = SUUIMobileCoreServicesFramework();
  uint64_t v8 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Lsapplicationw.isa, v7), "defaultWorkspace");
  [v8 openSensitiveURL:v9 withOptions:v4];
}

void SUUIMetricsOpenURL(void *a1)
{
  id v3 = a1;
  uint64_t v1 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v2 = [v1 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 application:v1 recordExitMetricsEventWithURL:v3];
  }
  [v1 openURL:v3 options:MEMORY[0x263EFFA78] completionHandler:0];
}

void SUUIMetricsSetClickEventPositionWithPoint(void *a1, double a2, double a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F82B60];
  id v6 = a1;
  uint64_t v7 = [v5 mainScreen];
  [v7 scale];
  double v9 = v8;

  uint64_t v10 = [NSNumber numberWithInteger:(uint64_t)(a2 * v9)];
  [v6 setPositionX:v10];

  id v11 = [NSNumber numberWithInteger:(uint64_t)(a3 * v9)];
  [v6 setPositionY:v11];
}

void SUUIMetricsSetClickEventPositionWithView(void *a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v8 = a1;
    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", 0);
    double v5 = v4;
    double v7 = v6;

    SUUIMetricsSetClickEventPositionWithPoint(v8, v5, v7);
  }
}

__CFString *SUUIMetricsWindowOrientationForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_265402130[a1 - 1];
  }
}

id SUUIColorWithHTMLCode(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  if (v2 == 8 || v2 == 6)
  {
    uint64_t v4 = v2;
    double v5 = objc_msgSend(v1, "substringWithRange:", 0, 2);
    uint64_t v6 = SUUIHexValueWithString(v5);

    double v7 = objc_msgSend(v1, "substringWithRange:", 2, 2);
    uint64_t v8 = SUUIHexValueWithString(v7);

    double v9 = objc_msgSend(v1, "substringWithRange:", 4, 2);
    uint64_t v10 = SUUIHexValueWithString(v9);

    if (v4 == 8)
    {
      id v11 = objc_msgSend(v1, "substringWithRange:", 6, 2);
      uint64_t v12 = SUUIHexValueWithString(v11);
    }
    else
    {
      uint64_t v12 = 255;
    }
    uint64_t v13 = 0;
    if ((unint64_t)v6 <= 0xFF
      && (unint64_t)v10 <= 0xFF
      && (unint64_t)v8 <= 0xFF
      && (unint64_t)v12 <= 0xFF)
    {
      uint64_t v13 = [MEMORY[0x263F825C8] colorWithRed:(double)v6 / 255.0 green:(double)v8 / 255.0 blue:(double)v10 / 255.0 alpha:(double)v12 / 255.0];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

BOOL SUUIColorSchemeStyleForColor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    uint64_t v8 = 0;
    if ([v1 getHue:&v9 saturation:&v8 brightness:&v10 alpha:0])
    {
      BOOL v3 = v10 < 0.5;
    }
    else
    {
      double v7 = 0.0;
      int v4 = [v2 getWhite:&v7 alpha:0];
      uint64_t v5 = 2;
      if (v7 < 0.5) {
        uint64_t v5 = 3;
      }
      if (v4) {
        BOOL v3 = v5;
      }
      else {
        BOOL v3 = 0;
      }
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

id SUUIBorderColorWithBackgroundColor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    switch(SUUIColorSchemeStyleForColor(v1))
    {
      case 1:
      case 3:
        BOOL v3 = (void *)MEMORY[0x263F825C8];
        double v4 = 0.15;
        double v5 = 1.0;
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    BOOL v3 = (void *)MEMORY[0x263F825C8];
    double v4 = 0.2;
    double v5 = 0.0;
  }
  uint64_t v6 = [v3 colorWithWhite:v5 alpha:v4];

  return v6;
}

id SUUIColorForStyleWithBrightness(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  switch(a2)
  {
    case 0:
      a6 = a3;
      break;
    case 1:
      a6 = a4;
      break;
    case 2:
      a6 = a5;
      break;
    case 3:
      return SUUIColorByAdjustingBrightness(a1, a6);
    default:
      a6 = 0.0;
      break;
  }
  return SUUIColorByAdjustingBrightness(a1, a6);
}

id SUUIColorByAdjustingBrightness(void *a1, float a2)
{
  id v3 = a1;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (![v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8]
    || ([MEMORY[0x263F825C8] colorWithHue:v11 saturation:v10 brightness:v9 + a2 alpha:v8],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v6 = 0.0;
    double v7 = 0.0;
    if (([v3 getWhite:&v7 alpha:&v6] & 1) == 0
      || ([MEMORY[0x263F825C8] colorWithWhite:v7 + a2 alpha:v6],
          (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v4 = v3;
    }
  }

  return v4;
}

id SUUIColorForStyleWithAlpha(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  switch(a2)
  {
    case 0:
      a6 = a3;
      break;
    case 1:
      a6 = a4;
      break;
    case 2:
      a6 = a5;
      break;
    case 3:
      return SUUIColorWithAlpha(a1, a6);
    default:
      a6 = 0.0;
      break;
  }
  return SUUIColorWithAlpha(a1, a6);
}

id SUUIColorWithAlpha(void *a1, float a2)
{
  id v3 = a1;
  double v8 = 0.0;
  double v9 = 0.0;
  double v7 = 0.0;
  if (![v3 getHue:&v9 saturation:&v8 brightness:&v7 alpha:0]
    || ([MEMORY[0x263F825C8] colorWithHue:v9 saturation:v8 brightness:v7 alpha:a2],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v6 = 0.0;
    if (([v3 getWhite:&v6 alpha:0] & 1) == 0
      || ([MEMORY[0x263F825C8] colorWithWhite:v6 alpha:a2],
          (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v4 = v3;
    }
  }

  return v4;
}

uint64_t SUUIHexValueWithString(void *a1)
{
  unsigned int v5 = 0;
  id v1 = (objc_class *)MEMORY[0x263F08B08];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithString:v2];

  LODWORD(v2) = [v3 scanHexInt:&v5];
  if (v2) {
    return v5;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

uint64_t SUUITableViewGroupedBackgroundColor()
{
  return [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
}

void sub_2565FF3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_2565FF5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256600308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_2566005D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_25660077C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_256600A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256604930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

{
}

uint64_t SUUIImageTreatmentForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"app"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"artist-circle"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"brick"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"evergreen"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"left-to-right-linear-gradient"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"parallax"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"product"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"radio"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"radial-gradient"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"tint"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"uber"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"uber-banner"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"watch-app"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"watch-product"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"voyager-app"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"tv-app"])
  {
    uint64_t v2 = 16;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void SUUIViewSetBottomBorderColor(void *a1, void *a2)
{
  id v11 = a1;
  id v3 = a2;
  id v4 = [v11 viewWithTag:1397441090];
  unsigned int v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      double v6 = [MEMORY[0x263F82B60] mainScreen];
      [v6 scale];
      double v8 = 1.0 / v7;

      [v11 bounds];
      unsigned int v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, v9 - v8, v10, v8);
      [v5 setAutoresizingMask:10];
      [v5 setTag:1397441090];
      [v11 addSubview:v5];
    }
    [v5 setBackgroundColor:v3];
  }
  else
  {
    [v4 removeFromSuperview];
  }
}

void SUUIViewSetTopBorderColor(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  id v4 = [v10 viewWithTag:1397445698];
  unsigned int v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      double v6 = [MEMORY[0x263F82B60] mainScreen];
      [v6 scale];
      double v8 = 1.0 / v7;

      [v10 bounds];
      unsigned int v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v9, v8);
      [v5 setAutoresizingMask:2];
      [v5 setTag:1397445698];
      [v10 addSubview:v5];
    }
    [v5 setBackgroundColor:v3];
  }
  else
  {
    [v4 removeFromSuperview];
  }
}

void sub_256609CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_25660AAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIViewElementDateWithString(void *a1)
{
  id v1 = a1;
  if (!SUUIViewElementDateWithString_sInputFormatter1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08790]);
    id v3 = (void *)SUUIViewElementDateWithString_sInputFormatter1;
    SUUIViewElementDateWithString_sInputFormatter1 = (uint64_t)v2;

    [(id)SUUIViewElementDateWithString_sInputFormatter1 setDateFormat:@"yyyy-MM-dd"];
    [(id)SUUIViewElementDateWithString_sInputFormatter1 setLenient:1];
    id v4 = (void *)SUUIViewElementDateWithString_sInputFormatter1;
    unsigned int v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
    [v4 setLocale:v5];
  }
  if (!SUUIViewElementDateWithString_sInputFormatter2)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
    double v7 = (void *)SUUIViewElementDateWithString_sInputFormatter2;
    SUUIViewElementDateWithString_sInputFormatter2 = (uint64_t)v6;

    [(id)SUUIViewElementDateWithString_sInputFormatter2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [(id)SUUIViewElementDateWithString_sInputFormatter2 setLenient:1];
    double v8 = (void *)SUUIViewElementDateWithString_sInputFormatter2;
    double v9 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
    [v8 setLocale:v9];
  }
  if (!SUUIViewElementDateWithString_sInputFormatter3)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F08790]);
    id v11 = (void *)SUUIViewElementDateWithString_sInputFormatter3;
    SUUIViewElementDateWithString_sInputFormatter3 = (uint64_t)v10;

    [(id)SUUIViewElementDateWithString_sInputFormatter3 setDateFormat:@"yyyy-MM-dd'T'hh:mm:ss'Z'"];
    [(id)SUUIViewElementDateWithString_sInputFormatter3 setLenient:1];
    uint64_t v12 = (void *)SUUIViewElementDateWithString_sInputFormatter3;
    uint64_t v13 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
    [v12 setLocale:v13];
  }
  uint64_t v14 = [(id)SUUIViewElementDateWithString_sInputFormatter1 dateFromString:v1];
  if (!v14)
  {
    uint64_t v14 = [(id)SUUIViewElementDateWithString_sInputFormatter2 dateFromString:v1];
    if (!v14)
    {
      uint64_t v14 = [(id)SUUIViewElementDateWithString_sInputFormatter3 dateFromString:v1];
    }
  }

  return v14;
}

void SUUIViewElementTextDeadlockFix(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 appContext];
  if (v4)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SUUIViewElementTextDeadlockFix_block_invoke;
    v11[3] = &unk_2654022D0;
    unsigned int v5 = &v12;
    id v12 = v3;
    id v6 = v3;
    [v4 evaluate:v11 completionBlock:0];
  }
  else
  {
    double v7 = dispatch_get_global_queue(-32768, 0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __SUUIViewElementTextDeadlockFix_block_invoke_2;
    v9[3] = &unk_265400980;
    unsigned int v5 = &v10;
    id v10 = v3;
    id v8 = v3;
    dispatch_async(v7, v9);
  }
}

void sub_25660CC1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_25660E43C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_25660F870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_25660FE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_256610150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_25661103C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_2566120B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25661305C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256613F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566140C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_256614D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256615090(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_2566163C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2_0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3_0(uint64_t a1)
{
}

id SUUIResourceLoaderGetNameForObject(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = [v1 stringWithFormat:@"%@:%p", v4, v2];

  return v5;
}

void sub_256617054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256617188(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25661B39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25661B950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25661CEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256623BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256623D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566242B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_2566249DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

uint64_t SUUIGetLayoutProperties(uint64_t result, uint64_t a2, void *a3, double *a4)
{
  if (a2 < 1)
  {
    double v6 = 0.0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = result + 24;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      if (*(unsigned char *)(v5 + 16))
      {
        double v8 = v7 + v6;
        double v9 = *(double *)v5;
        double v7 = *(double *)(v5 + 8);
        double v11 = *(double *)(v5 - 16);
        double v10 = *(double *)(v5 - 8);
        *(double *)(*a3 + 8 * v4) = v8 - v10;
        double v6 = v8 + v11 - v9 - v10;
      }
      v5 += 48;
      ++v4;
    }
    while (a2 != v4);
  }
  *a4 = v6;
  return result;
}

double SUUIScaleSizeToFit(double a1, double a2, double a3, double a4)
{
  double v4 = a1 / a3;
  double v5 = a2 / a4;
  if (v4 < v5) {
    double v5 = v4;
  }
  return ceil(a3 * v5);
}

void sub_2566295C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25662BF24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25662CC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25662CF84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25662D244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25662D9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_256634950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2566373D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void sub_2566377D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256637DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256638100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id SUUIStringFromProductLockupLayoutSizing(CGSize *a1)
{
  uint64_t v2 = NSString;
  id v3 = NSStringFromCGSize(a1[3]);
  double v4 = NSStringFromCGSize(a1[4]);
  double v5 = NSStringFromCGSize(a1[2]);
  double v6 = NSStringFromCGSize(*a1);
  double v7 = NSStringFromCGSize(a1[1]);
  double v8 = [v2 stringWithFormat:@"{ Top-Left: %@, Top-Right: %@, Middle-Left: %@, Bottom-Left: %@, Bottom-Right: %@ }", v3, v4, v5, v6, v7];

  return v8;
}

void sub_256638958(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_256638BF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25663E120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void sub_25663F5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_25663F788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566403A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566416D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_256642A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566438D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256643E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256644024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2566446C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2566454AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void sub_256646DB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_256647B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void sub_256648020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_256648A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_25664C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25664CDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25664D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25664DED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void sub_25664F020(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_25664F920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25664FB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256650C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void sub_256659D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_25665A2C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25665AA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25665B0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25665B1D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25665BB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void sub_25665D780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

uint64_t SUUITrackListColumnIdentifierForViewElement(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 elementType];
  uint64_t v3 = 2;
  if (v2 > 79)
  {
    if (v2 > 137)
    {
      if (v2 != 138)
      {
        if (v2 != 141) {
          goto LABEL_22;
        }
        goto LABEL_17;
      }
      if (([v1 labelViewStyle] & 0xFFFFFFFFFFFFFFFELL) == 4) {
        uint64_t v3 = 4;
      }
      else {
        uint64_t v3 = 2;
      }
    }
    else if (v2 == 80)
    {
      uint64_t v3 = 5;
    }
    else if (v2 == 90)
    {
      double v4 = [v1 flattenedChildren];
      double v5 = [v4 firstObject];
      uint64_t v3 = SUUITrackListColumnIdentifierForViewElement();
    }
  }
  else
  {
    if (v2 > 11)
    {
      if ((unint64_t)(v2 - 12) >= 2 && v2 != 50) {
        goto LABEL_22;
      }
LABEL_17:
      uint64_t v3 = 1;
      goto LABEL_22;
    }
    uint64_t v6 = 3;
    if (v2 != 9) {
      uint64_t v6 = 2;
    }
    if (v2 == 8) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = v6;
    }
  }
LABEL_22:

  return v3;
}

void sub_25665E0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25665E348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v15 = a1;
  *(_OWORD *)a2 = xmmword_2568A0F00;
  *(void *)(a2 + 16) = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v3 = [v15 elementType] == 72;
  double v4 = v15;
  if (v3)
  {
    double v5 = [v15 children];
    if ([v5 count] != 2)
    {
LABEL_11:

      double v4 = v15;
      goto LABEL_12;
    }
    uint64_t v6 = [v5 firstObject];
    double v7 = [v6 attributes];
    uint64_t v8 = [v7 objectForKey:@"type"];
    int v9 = [v8 isEqualToString:@"product"];

    uint64_t v10 = [v5 lastObject];
    uint64_t v11 = [v10 attributes];
    uint64_t v12 = [v11 objectForKey:@"type"];
    int v13 = [v12 isEqualToString:@"product"];

    if (!v9 || v13)
    {
      if ((v9 | v13 ^ 1))
      {
LABEL_10:

        goto LABEL_11;
      }
      long long v14 = xmmword_2568A0F20;
    }
    else
    {
      long long v14 = xmmword_2568A0F10;
    }
    *(unsigned char *)a2 = 1;
    *(_OWORD *)(a2 + 8) = v14;
    goto LABEL_10;
  }
LABEL_12:
}

void sub_256663448(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_256663654(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_256663FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void sub_256664868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIBadgeImageFromText(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__29;
  uint64_t v19 = __Block_byref_object_dispose__29;
  id v20 = 0;
  if (SUUIBadgeImageFromText_sOnce != -1) {
    dispatch_once(&SUUIBadgeImageFromText_sOnce, &__block_literal_global_16);
  }
  if ([v5 length])
  {
    double v7 = SUUIBadgeImageFromText_sBadgeImageQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __SUUIBadgeImageFromText_block_invoke_2;
    v10[3] = &unk_265403660;
    id v11 = v5;
    id v12 = v6;
    int v13 = &v15;
    char v14 = a3;
    dispatch_sync(v7, v10);
  }
  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void sub_2566661A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

uint64_t __SUUIBadgeImageFromText_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIBadgeImage", 0);
  id v1 = (void *)SUUIBadgeImageFromText_sBadgeImageQueue;
  SUUIBadgeImageFromText_sBadgeImageQueue = (uint64_t)v0;

  uint64_t v2 = SUUIBadgeImageFromText_sBadgeImageQueue;
  BOOL v3 = dispatch_get_global_queue(0, 0);
  dispatch_set_target_queue(v2, v3);

  id v4 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  id v5 = (void *)SUUIBadgeImageFromText_sBadgeImageCache;
  SUUIBadgeImageFromText_sBadgeImageCache = (uint64_t)v4;

  id v6 = (void *)SUUIBadgeImageFromText_sBadgeImageCache;
  return [v6 setCountLimit:10];
}

void __SUUIBadgeImageFromText_block_invoke_2(uint64_t a1)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) description];
  id v5 = (void *)[v2 initWithFormat:@"%@:%@", v3, v4];

  uint64_t v6 = [(id)SUUIBadgeImageFromText_sBadgeImageCache objectForKey:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v9 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
    uint64_t v10 = *MEMORY[0x263F81500];
    v24[0] = *MEMORY[0x263F814F0];
    v24[1] = v10;
    uint64_t v11 = *(void *)(a1 + 40);
    v25[0] = v9;
    v25[1] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [*(id *)(a1 + 32) sizeWithAttributes:v12];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [MEMORY[0x263F82B60] mainScreen];
    [v17 scale];
    CGFloat v19 = v18;
    v26.width = v14 + 6.0;
    v26.height = v16;
    UIGraphicsBeginImageContextWithOptions(v26, 0, v19);

    [*(id *)(a1 + 40) set];
    id v20 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v14 + 6.0, v16, 1.0);
    [v20 stroke];
    objc_msgSend(*(id *)(a1 + 32), "drawInRect:withAttributes:", v12, 3.5, -0.5, v14, v16);
    uint64_t v21 = UIGraphicsGetImageFromCurrentImageContext();
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    double v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    UIGraphicsEndImageContext();
    if (*(unsigned char *)(a1 + 56)) {
      [(id)SUUIBadgeImageFromText_sBadgeImageCache setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v5];
    }
  }
}

void sub_256669A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIChartGetTitle(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (void *)SUUIChartGetTitle_sChartIndexFormatter;
  if (!SUUIChartGetTitle_sChartIndexFormatter)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08A30]);
    int v9 = (void *)SUUIChartGetTitle_sChartIndexFormatter;
    SUUIChartGetTitle_sChartIndexFormatter = (uint64_t)v8;

    [(id)SUUIChartGetTitle_sChartIndexFormatter setNumberStyle:1];
    [(id)SUUIChartGetTitle_sChartIndexFormatter setUsesGroupingSeparator:0];
    uint64_t v7 = (void *)SUUIChartGetTitle_sChartIndexFormatter;
  }
  uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  uint64_t v11 = [v7 stringFromNumber:v10];

  if (v5) {
    [v5 localizedStringForKey:@"CHART_ITEM_TITLE_FORMAT"];
  }
  else {
  id v12 = +[SUUIClientContext localizedStringForKey:@"CHART_ITEM_TITLE_FORMAT" inBundles:0];
  }
  double v13 = [NSString stringWithValidatedFormat:v12, @"%@%@", 0, v11, v6 validFormatSpecifiers error];

  return v13;
}

void sub_25667062C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void sub_2566718B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256674B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void sub_256674F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
}

void sub_256676748(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2566769F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2566772EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25667783C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_256679FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25667BBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25667F7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void sub_256681FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

void sub_25668311C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566834B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256683D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566844BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256689314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566895A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566899E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_25668B820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_25668BAF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_25668BC9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25668BF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25668CC24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25668D13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIStorePageItemsWithStorePlatformDictionary(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v6 || ([v5 objectForKey:v6], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = [v5 objectForKey:@"lockup"];
    if (!v8)
    {
      uint64_t v9 = [v5 allKeys];
      if ([v9 count] == 1)
      {
        uint64_t v10 = [v9 objectAtIndex:0];
        id v8 = [v5 objectForKey:v10];
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v8 objectForKey:*MEMORY[0x263F7BA90]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __SUUIStorePageItemsWithStorePlatformDictionary_block_invoke;
      v13[3] = &unk_265403BE8;
      uint64_t v15 = a3;
      id v14 = v7;
      [v11 enumerateKeysAndObjectsUsingBlock:v13];
    }
  }

  return v7;
}

void __SUUIStorePageItemsWithStorePlatformDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x25A2A9B80]();
  id v7 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithLookupDictionary:v5];
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

uint64_t SUUIStorePageTypeIsProductPage(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"software"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"mobileSoftwareBundle"];
  }

  return v2;
}

void sub_2566911D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566914F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_256691C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_256696334(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_256698070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256698550(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_256698750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
}

void sub_2566989DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25669B740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36(uint64_t a1)
{
}

void sub_25669BDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25669C1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25669C380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SUUIViewElementAccumulatePersonalizationLibraryItemsForChildren(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) personalizationLibraryItems];
        if (v9) {
          [v3 unionSet:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void sub_25669CD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void SUUIViewElementAccumulatePersonalizationLibraryItemsForChild(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = [a2 personalizationLibraryItems];
  if (v3) {
    [v4 unionSet:v3];
  }
}

uint64_t SUUIViewElementAlignmentForStyle(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 textAlignment];
  if (!v2)
  {
    uint64_t v2 = [v1 elementAlignment];
    if (!v2)
    {
      uint64_t v3 = [v1 elementPosition];
      if ((unint64_t)(v3 - 1) > 8) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = qword_2568A1068[v3 - 1];
      }
    }
  }

  return v2;
}

id SUUIViewElementFontWithStyle(void *a1)
{
  v53[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 textStyle];
  if (!v2) {
    goto LABEL_25;
  }
  if (SUUIViewElementFontWithStyle_sOnce != -1) {
    dispatch_once(&SUUIViewElementFontWithStyle_sOnce, &__block_literal_global_20);
  }
  value = 0;
  if (!NSMapMember((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, v2, 0, &value)) {
    goto LABEL_25;
  }
  uint64_t v3 = [v1 textScale];
  id v4 = v3;
  if (!v3)
  {
    uint64_t v6 = value;
    goto LABEL_11;
  }
  if (![v3 isEqualToString:@"none"])
  {
    double v39 = 0;
    BOOL v7 = NSMapMember((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, v4, 0, &v39);
    uint64_t v6 = value;
    if (v7)
    {
      uint64_t v5 = SUUIFontLimitedPreferredFontForTextStyle((uint64_t)value, (uint64_t)v39);
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v5 = SUUIFontPreferredFontForTextStyle((uint64_t)v6);
    goto LABEL_12;
  }
  uint64_t v5 = SUUIFontForTextStyle((uint64_t)value);
LABEL_12:
  uint64_t v8 = (void *)v5;
  uint64_t v9 = [v1 fontWeight];
  long long v10 = v9;
  if (!v8 || !v9) {
    goto LABEL_24;
  }
  if ([v9 isEqualToString:@"medium"])
  {
    v52[0] = *MEMORY[0x263F81738];
    long long v11 = [v8 familyName];
    v52[1] = *MEMORY[0x263F81758];
    v53[0] = v11;
    v53[1] = @"Medium";
    long long v12 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

LABEL_16:
    long long v13 = [v8 fontDescriptor];
    uint64_t v14 = [v13 fontDescriptorByAddingAttributes:v12];

    goto LABEL_22;
  }
  if ([v10 isEqualToString:@"bold"])
  {
    uint64_t v15 = [v8 fontDescriptor];
    long long v12 = v15;
    uint64_t v16 = 2;
  }
  else
  {
    if (![v10 isEqualToString:@"condensed-bold"])
    {
      if ([v10 isEqualToString:@"light"])
      {
        uint64_t v50 = *MEMORY[0x263F81798];
        uint64_t v51 = *MEMORY[0x263F03A38];
        CGSize v26 = NSDictionary;
        uint64_t v27 = &v51;
        CGRect v28 = &v50;
      }
      else if ([v10 isEqualToString:@"ultra-light"])
      {
        uint64_t v48 = *MEMORY[0x263F81798];
        uint64_t v49 = *MEMORY[0x263F03A60];
        CGSize v26 = NSDictionary;
        uint64_t v27 = &v49;
        CGRect v28 = &v48;
      }
      else
      {
        if (![v10 isEqualToString:@"thin"]) {
          goto LABEL_24;
        }
        uint64_t v46 = *MEMORY[0x263F81798];
        uint64_t v47 = *MEMORY[0x263F03A50];
        CGSize v26 = NSDictionary;
        uint64_t v27 = &v47;
        CGRect v28 = &v46;
      }
      long long v12 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
      goto LABEL_16;
    }
    uint64_t v15 = [v8 fontDescriptor];
    long long v12 = v15;
    uint64_t v16 = 66;
  }
  uint64_t v14 = [v15 fontDescriptorWithSymbolicTraits:v16];
LABEL_22:

  if (v14)
  {
    uint64_t v17 = [MEMORY[0x263F81708] fontWithDescriptor:v14 size:0.0];

    uint64_t v8 = (void *)v17;
  }
LABEL_24:

  if (v8) {
    goto LABEL_44;
  }
LABEL_25:
  [v1 fontSize];
  double v19 = v18;
  if (v18 <= 0.00000011920929)
  {
    uint64_t v8 = 0;
    goto LABEL_44;
  }
  id v20 = [v1 fontWeight];
  if ([v20 isEqualToString:@"medium"])
  {
    uint64_t v21 = (void *)MEMORY[0x263F81708];
    uint64_t v22 = (double *)MEMORY[0x263F81828];
    goto LABEL_41;
  }
  if ([v20 isEqualToString:@"bold"])
  {
    uint64_t v21 = (void *)MEMORY[0x263F81708];
    uint64_t v22 = (double *)MEMORY[0x263F81800];
    goto LABEL_41;
  }
  if (![v20 isEqualToString:@"condensed-bold"])
  {
    if ([v20 isEqualToString:@"light"])
    {
      uint64_t v21 = (void *)MEMORY[0x263F81708];
      uint64_t v22 = (double *)MEMORY[0x263F81818];
    }
    else if ([v20 isEqualToString:@"ultra-light"])
    {
      uint64_t v21 = (void *)MEMORY[0x263F81708];
      uint64_t v22 = (double *)MEMORY[0x263F81860];
    }
    else
    {
      int v29 = [v20 isEqualToString:@"thin"];
      uint64_t v21 = (void *)MEMORY[0x263F81708];
      if (!v29)
      {
        uint64_t v30 = [MEMORY[0x263F81708] systemFontOfSize:v19];
        goto LABEL_42;
      }
      uint64_t v22 = (double *)MEMORY[0x263F81848];
    }
LABEL_41:
    uint64_t v30 = [v21 systemFontOfSize:v19 weight:*v22];
LABEL_42:
    uint64_t v8 = (void *)v30;
    goto LABEL_43;
  }
  double v23 = [MEMORY[0x263F81708] systemFontOfSize:v19 weight:*MEMORY[0x263F81800]];
  double v24 = [v23 fontDescriptor];

  id v25 = [v24 fontDescriptorWithSymbolicTraits:66];

  uint64_t v8 = [MEMORY[0x263F81708] fontWithDescriptor:v25 size:0.0];

LABEL_43:
LABEL_44:
  uint64_t v31 = [v8 fontDescriptor];
  uint64_t v44 = *MEMORY[0x263F81748];
  uint64_t v32 = *MEMORY[0x263F817B0];
  v41[0] = *MEMORY[0x263F817B8];
  v41[1] = v32;
  v42[0] = &unk_2705D0B20;
  v42[1] = &unk_2705D0B38;
  double v33 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  v43 = v33;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  v45 = v34;
  uint64_t v35 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  double v36 = [v31 fontDescriptorByAddingAttributes:v35];

  uint64_t v37 = [MEMORY[0x263F81708] fontWithDescriptor:v36 size:0.0];

  return v37;
}

void __SUUIViewElementFontWithStyle_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:1282 capacity:0];
  id v1 = (void *)SUUIViewElementFontWithStyle_sTextScaleMap;
  SUUIViewElementFontWithStyle_sTextScaleMap = v0;

  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"x-small", (const void *)1);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"small", (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"medium", (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"large", (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"x-large", (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"xx-large", (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, @"xxx-large", (const void *)7);
  uint64_t v2 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:1282 capacity:0];
  uint64_t v3 = (void *)SUUIViewElementFontWithStyle_sTextStyleMap;
  SUUIViewElementFontWithStyle_sTextStyleMap = v2;

  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"body", (const void *)1);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"body-short", (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"callout", (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"callout-short", (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"caption1", (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"caption1-medium-short", (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"caption1-short", (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"caption2", (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"caption2-short", (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"caption3", (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"footnote", (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"footnote-short", (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"headline", (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"headline-short", (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"subhead", (const void *)0x10);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"subhead-short", (const void *)0x11);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"subhead2", (const void *)0x12);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"subhead2-medium-short", (const void *)0x13);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"subhead2-short", (const void *)0x14);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"subhead2-tall", (const void *)0x15);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-1", (const void *)0x16);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-2", (const void *)0x17);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-3", (const void *)0x18);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-4", (const void *)0x19);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-5", (const void *)0x1A);
  NSMapInsertKnownAbsent((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-5-medium-short", (const void *)0x1B);
  id v4 = (NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap;
  NSMapInsertKnownAbsent(v4, @"super-headline-5-short", (const void *)0x1C);
}

id SUUIViewElementPlainColorWithIKColor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 colorType] == 1)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v3 color];
  }
  uint64_t v6 = v5;

  return v6;
}

id SUUIViewElementPlainColorWithStyle(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 ikColor];
  id v5 = SUUIViewElementPlainColorWithIKColor(v4, v3);

  return v5;
}

uint64_t SUUIViewElementNSTextAlignmentForIKElementAlignment(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 4) {
    return 0;
  }
  else {
    return a1 - 1;
  }
}

double SUUIViewElementMarginForStyle(void *a1, char *a2)
{
  id v3 = a1;
  id v4 = [v3 valueForStyle:*MEMORY[0x263F4B388]];
  if (!v4)
  {
    id v4 = [v3 valueForStyle:@"itml-margin"];
    if (!v4)
    {
      char v7 = 0;
      double v6 = *MEMORY[0x263F834E8];
      if (!a2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  [v4 UIEdgeInsetsValue];
  double v6 = v5;

  char v7 = 1;
  if (a2) {
LABEL_4:
  }
    *a2 = v7;
LABEL_5:

  return v6;
}

double SUUIViewElementPaddingForStyle(void *a1, char *a2)
{
  id v3 = a1;
  id v4 = [v3 valueForStyle:*MEMORY[0x263F4B390]];
  if (!v4)
  {
    id v4 = [v3 valueForStyle:@"itml-padding"];
    if (!v4)
    {
      char v7 = 0;
      double v6 = *MEMORY[0x263F834E8];
      if (!a2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  [v4 UIEdgeInsetsValue];
  double v6 = v5;

  char v7 = 1;
  if (a2) {
LABEL_4:
  }
    *a2 = v7;
LABEL_5:

  return v6;
}

void sub_25669F490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_25669FE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566A2E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566A35BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void SUUILockupStyleForDictionary(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  *(_OWORD *)a3 = xmmword_2568A10C0;
  *(void *)(a3 + 16) = 2142;
  char v7 = [v5 objectForKey:@"orientation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = SUUILockupLayoutStyleForString(v7);
    *(void *)(a3 + 8) = v8;
    uint64_t v9 = v8 & 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  long long v10 = [v5 objectForKey:@"artworkSize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = SUUILockupSizeForString(v10);
    *(void *)a3 = v11;
  }
  else
  {
    uint64_t v11 = 2;
  }
  long long v12 = [v5 objectForKey:@"fields"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = v11;
    uint64_t v21 = v10;
    uint64_t v22 = v9;
    id v23 = v6;
    *(void *)(a3 + 16) = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          double v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 |= SUUILockupFieldForString(v19);
            *(void *)(a3 + 16) = v16;
          }
          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    uint64_t v9 = v22;
    id v6 = v23;
    uint64_t v11 = v20;
    long long v10 = v21;
  }
  if (!objc_msgSend(v6, "layoutStyle", v20, v21, v22, v23, (void)v24))
  {
    if (v11 != 4)
    {
      if (v11 != 5) {
        goto LABEL_19;
      }
      *(void *)a3 = 4;
    }
    if (v9) {
      *(void *)(a3 + 8) = 0;
    }
  }
LABEL_19:
}

uint64_t SUUILockupFieldForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"artistName"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"artwork"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"buyButton"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"genreName"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"itemCount"])
  {
    uint64_t v2 = 128;
  }
  else if ([v1 isEqualToString:@"name"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"releaseDate"])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:@"userRating"])
  {
    uint64_t v2 = 64;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id SUUILockupItemCountString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 itemKind] != 17)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  if (!SUUILockupItemCountString_sFormatter)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
    uint64_t v8 = (void *)SUUILockupItemCountString_sFormatter;
    SUUILockupItemCountString_sFormatter = (uint64_t)v7;

    [(id)SUUILockupItemCountString_sFormatter setNumberStyle:1];
    if (v4) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = +[SUUIClientContext localizedStringForKey:@"APP_BUNDLE_LOCKUP_APP_COUNT" inBundles:0];
    goto LABEL_8;
  }
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = [v4 localizedStringForKey:@"APP_BUNDLE_LOCKUP_APP_COUNT"];
LABEL_8:
  uint64_t v9 = (void *)v5;
  long long v10 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v3, "numberOfChildItems"));
  uint64_t v11 = NSString;
  long long v12 = [(id)SUUILockupItemCountString_sFormatter stringFromNumber:v10];
  id v6 = [v11 stringWithValidatedFormat:v9, @"%@", 0, v12 validFormatSpecifiers error];

LABEL_9:
  return v6;
}

uint64_t SUUILockupLayoutStyleForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"V"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"V2"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"H2"];
  }

  return v2;
}

uint64_t SUUILockupSizeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"XS"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"S"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"L"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"XL"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"XXL"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

double SUUILockupStyleDefault@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 2;
  *(_OWORD *)a1 = xmmword_2568A10C0;
  *(void *)(a1 + 16) = 2142;
  return result;
}

BOOL SUUILockupStyleEqualToLockupStyle(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

BOOL SUUILockupLayoutStyleIsHorizontal(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

void sub_2566A6348(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_2566A6C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
}

void SUUIScrollViewLayoutTopBackgroundColor(void *a1)
{
  id v2 = a1;
  id v1 = [v2 viewWithTag:1095975495];
  if (v1) {
    __LayoutTopBackgroundColor(v2, v1);
  }
}

void __LayoutTopBackgroundColor(void *a1, void *a2)
{
  id v10 = a2;
  [a1 bounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 bounds];
  double v9 = v8;

  objc_msgSend(v10, "setFrame:", v4, -v9, v6, v9);
}

void SUUIScrollViewLayoutTopBackgroundColorForProductPage(void *a1, double a2)
{
  id v11 = a1;
  double v3 = [v11 viewWithTag:1095975495];
  if (v3)
  {
    [v11 bounds];
    double v5 = v4;
    double v7 = v6;
    double v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 bounds];
    double v10 = v9 + v9;

    objc_msgSend(v3, "setFrame:", v5, a2 - v10, v7, v10);
  }
}

void SUUIScrollViewSetTopBackgroundColor(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  double v4 = [v6 viewWithTag:1095975495];
  id v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
      [v5 setAutoresizingMask:2];
      [v5 setTag:1095975495];
      [v6 _addContentSubview:v5 atBack:1];
    }
    [v5 setBackgroundColor:v3];
    __LayoutTopBackgroundColor(v6, v5);
  }
  else
  {
    [v4 removeFromSuperview];
  }
}

void *__Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
  double result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
}

void sub_2566B2AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2566B2D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIAppearanceStyleBarButtonItem()
{
  return MEMORY[0x270F88B38]();
}

uint64_t SUUIAppearanceStyleNavigationBar()
{
  return MEMORY[0x270F88B68]();
}

id SUUITintedImage(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  [v7 size];
  double v9 = v8;
  double v11 = v10;
  [v7 scale];
  CGFloat v13 = v12;
  v17.width = v9;
  v17.height = v11;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v13);
  [v5 set];

  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v9;
  v18.size.height = v11;
  UIRectFill(v18);
  objc_msgSend(v7, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v9, v11, 1.0);

  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v9, v11);
  uint64_t v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v14;
}

BOOL SUUIImageExistsWithResourceName(void *a1)
{
  id v1 = a1;
  if (!SUUIImageExistsWithResourceName_sBundle)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileStoreUI"];
    id v3 = (void *)SUUIImageExistsWithResourceName_sBundle;
    SUUIImageExistsWithResourceName_sBundle = v2;
  }
  unint64_t v4 = 0;
  id v5 = (void **)__iTunesStoreUIResources;
  do
  {
    id v6 = *v5;
    v5 += 3;
    char v7 = [v6 isEqualToString:v1];
    if (v4 > 0x94) {
      break;
    }
    ++v4;
  }
  while ((v7 & 1) == 0);
  if (v7) {
    goto LABEL_12;
  }
  unint64_t v8 = 0;
  double v9 = (void **)__UIKitResources;
  do
  {
    double v10 = *v9;
    v9 += 3;
    int v11 = [v10 isEqualToString:v1];
    if (v8 > 2) {
      break;
    }
    ++v8;
  }
  while (!v11);
  if ((v11 & 1) != 0
    || ([(id)__ExternalResources objectForKey:v1],
        double v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
LABEL_12:
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v15 = [(id)__ExternalResourceManager imageForResourceName:v1];
    BOOL v13 = v15 != 0;
  }
  return v13;
}

id SUUIImageWithResourceName(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [0 objectForKey:v1];
    if (!v2)
    {
      if (!SUUIImageWithResourceName_sBundle)
      {
        uint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileStoreUI"];
        unint64_t v4 = (void *)SUUIImageWithResourceName_sBundle;
        SUUIImageWithResourceName_sBundle = v3;
      }
      for (uint64_t i = 0; i != 450; i += 3)
      {
        if ([(__CFString *)__iTunesStoreUIResources[i] isEqualToString:v1])
        {
          double v9 = &__iTunesStoreUIResources[i];
          BOOL v10 = LOBYTE(__iTunesStoreUIResources[i + 2]) == 0;
          int v7 = LOBYTE(__iTunesStoreUIResources[i + 2]) != 0;
          int v6 = v10;
          uint64_t v2 = [MEMORY[0x263F827E8] imageNamed:v9[1] inBundle:SUUIImageWithResourceName_sBundle];
          if (!v2) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
      int v6 = 0;
      int v7 = 1;
LABEL_14:
      uint64_t v11 = 0;
      while (([(__CFString *)__UIKitResources[v11] isEqualToString:v1] & 1) == 0)
      {
        v11 += 3;
        if (v11 == 12) {
          goto LABEL_20;
        }
      }
      uint64_t v2 = [MEMORY[0x263F827E8] kitImageNamed:__UIKitResources[v11 + 1]];
      if (v2) {
        goto LABEL_23;
      }
      int v6 = 0;
      int v7 = 1;
LABEL_20:
      double v12 = [(id)__ExternalResources objectForKey:v1];
      if (v12)
      {
        BOOL v13 = v12;
        int v7 = [v12 alwaysTemplate];
        int v6 = v7 ^ 1;
        uint64_t v14 = (void *)MEMORY[0x263F827E8];
        uint64_t v15 = [v13 imageName];
        uint64_t v16 = [v13 bundle];
        uint64_t v2 = [v14 imageNamed:v15 inBundle:v16];

        if (v2)
        {
LABEL_22:
          if (v7)
          {
LABEL_23:
            CGSize v17 = v2;
            uint64_t v18 = 2;
LABEL_29:
            uint64_t v20 = [v17 imageWithRenderingMode:v18];

            uint64_t v2 = (void *)v20;
            goto LABEL_30;
          }
LABEL_27:
          if (!v6) {
            goto LABEL_30;
          }
          CGSize v17 = v2;
          uint64_t v18 = 1;
          goto LABEL_29;
        }
      }
      uint64_t v19 = [MEMORY[0x263F827E8] imageNamed:v1 inBundle:SUUIImageWithResourceName_sBundle];
      if (v19
        || ([(id)__ExternalResourceManager imageForResourceName:v1],
            (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v2 = (void *)v19;
        if (v7) {
          goto LABEL_23;
        }
        goto LABEL_27;
      }
LABEL_30:
      uint64_t v21 = 0;
      while (![(__CFString *)__SKImagesThatFlip[v21] isEqualToString:v1])
      {
        if (++v21 == 3) {
          goto LABEL_35;
        }
      }
      uint64_t v22 = [v2 imageFlippedForRightToLeftLayoutDirection];

      uint64_t v2 = (void *)v22;
    }
LABEL_35:
    id v8 = v2;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void SUUIResourceImageSetRegisterWithBundle(void *a1, void *a2)
{
}

void SUUIResourceImageSetRegisterWithBundleAlwaysTemplate(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  int v7 = [MEMORY[0x263F08B88] mainThread];

  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    double v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void SUUIResourceImageSetRegisterWithBundleAlwaysTemplate(NSDictionary *__strong, NSBundle *__strong, BOOL)");
    [v11 handleFailureInFunction:v12 file:@"StoreUIAppearance.m" lineNumber:425 description:@"Registering a new resource image set with iTunesStoreUI is only supported on the main thread."];
  }
  uint64_t v8 = [v5 count];
  if (v6 && v8)
  {
    if (!__ExternalResources)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      BOOL v10 = (void *)__ExternalResources;
      __ExternalResources = (uint64_t)v9;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __SUUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke;
    v13[3] = &unk_265405338;
    id v14 = v6;
    char v15 = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
  }
}

void __SUUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  int v7 = objc_alloc_init(SUUIExternalResourceImage);
  [(SUUIExternalResourceImage *)v7 setImageName:v5];

  [(SUUIExternalResourceImage *)v7 setBundle:*(void *)(a1 + 32)];
  [(SUUIExternalResourceImage *)v7 setAlwaysTemplate:*(unsigned __int8 *)(a1 + 40)];
  [(id)__ExternalResources setObject:v7 forKey:v6];
}

void SUUISetExternalResourceManager(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F08B88] mainThread];

  if (!v2)
  {
    unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"void SUUISetExternalResourceManager(__strong id<SUUIExternalResourceManager>)"];
    [v4 handleFailureInFunction:v5 file:@"StoreUIAppearance.m" lineNumber:441 description:@"Registering a new resource image set with iTunesStoreUI is only supported on the main thread."];
  }
  uint64_t v3 = (void *)__ExternalResourceManager;
  __ExternalResourceManager = (uint64_t)v1;
}

id SUUILinkArrowImage(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F827E8];
  id v4 = a2;
  id v5 = [v3 imageNamed:@"ChevronSeeAll" inBundle:a1];
  id v6 = SUUITintedImage(v5, 0, v4);

  return v6;
}

id SUUILinkArrowButton(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = (void *)MEMORY[0x263F827E8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = [v9 imageNamed:@"ChevronSeeAll" inBundle:a1];
  char v15 = [MEMORY[0x263F824E8] buttonWithType:0];
  [v15 setTitle:v13 forState:0];

  uint64_t v16 = [v15 titleLabel];
  [v16 setFont:v10];

  [v15 setTitleColor:v12 forState:0];
  [v15 setTitleColor:v11 forState:1];
  CGSize v17 = [v14 _flatImageWithColor:v12];

  [v15 setImage:v17 forState:0];
  uint64_t v18 = [v14 _flatImageWithColor:v11];

  [v15 setImage:v18 forState:1];
  [v14 size];
  objc_msgSend(v15, "setTitleEdgeInsets:", 0.0, -(v19 + 5.0), 0.0, 0.0);
  objc_msgSend(v15, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v15, "titleRectForContentRect:", 0.0, 0.0, v20, v22);
  objc_msgSend(v15, "setImageEdgeInsets:", 1.0, v24 + 5.0, 0.0, 0.0);
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v21 + 5.0, v23);

  return v15;
}

id SUUIMoreDisclosureImage(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F827E8];
  id v4 = a2;
  id v5 = [v3 imageNamed:@"MoreDisclosureTriangleMask" inBundle:a1];
  id v6 = SUUITintedImage(v5, 0, v4);

  return v6;
}

uint64_t SUUISearchNoResultsImage(uint64_t a1)
{
  return [MEMORY[0x263F827E8] imageNamed:@"ProxyGraphicSearch" inBundle:a1];
}

void SUUIRangesForFormatString(void *a1, void *a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a1;
  unint64_t v12 = [v11 rangeOfString:@"%1$@"];
  uint64_t v14 = v13;
  unint64_t v15 = [v11 rangeOfString:@"%2$@"];
  uint64_t v17 = v16;

  id v29 = v9;
  id v18 = v10;
  if (v12 <= v15)
  {
    unint64_t v19 = v15;
  }
  else
  {
    uint64_t v14 = v17;
    unint64_t v19 = v12;
  }
  if (v12 > v15) {
    id v20 = v18;
  }
  else {
    id v20 = v29;
  }
  if (v12 > v15) {
    double v21 = v29;
  }
  else {
    double v21 = v18;
  }
  if (v12 <= v15) {
    unint64_t v15 = v12;
  }
  uint64_t v22 = [v20 length];
  uint64_t v23 = v19 - v14 + v22;
  uint64_t v24 = [v21 length];
  if (v20 == v29) {
    unint64_t v25 = v15;
  }
  else {
    unint64_t v25 = v23;
  }
  if (v20 == v29) {
    uint64_t v26 = v22;
  }
  else {
    uint64_t v26 = v24;
  }
  if (v20 == v29) {
    unint64_t v27 = v23;
  }
  else {
    unint64_t v27 = v15;
  }
  *a4 = v25;
  a4[1] = v26;
  if (v20 == v29) {
    uint64_t v28 = v24;
  }
  else {
    uint64_t v28 = v22;
  }
  *a5 = v27;
  a5[1] = v28;
}

void sub_2566B92E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566B9588(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2566B9A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566BD864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40(uint64_t a1)
{
}

void sub_2566BDB18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2566BE054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566C1F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566C2660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
}

void sub_2566C34EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566C3860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566C8160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2566C887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2566C9518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566C98E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
}

void sub_2566CA544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ToggleImageColorUtilitiesTempFileCommand()
{
  sUseImageColorUtilitiesTempFile ^= 1u;
  return 1;
}

uint64_t GetToggleImageColorUtilitiesTempFileState()
{
  return sUseImageColorUtilitiesTempFile;
}

void ImageAnalyzer::ImageAnalyzer(ImageAnalyzer *this)
{
  *(void *)this = 0;
  *((void *)this + ITColor::ITColor((ITColor *)this + 1) = 0;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 2ITColor::ITColor((ITColor *)this + 1) = 0u;
  *((_OWORD *)this + 2ITColor::ITColor((ITColor *)this + 2) = 0u;
  *((_OWORD *)this + 2ITColor::ITColor((ITColor *)this + 3) = 0u;
}

void ImageAnalyzer::~ImageAnalyzer(ImageAnalyzer *this)
{
  uint64_t v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(void *)this = 0;
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    free(v3);
    *((void *)this + ITColor::ITColor((ITColor *)this + 1) = 0;
  }
  id v4 = (void *)*((void *)this + 43);
  if (v4)
  {
    *((void *)this + 4ITColor::ITColor((ITColor *)this + 4) = v4;
    operator delete(v4);
  }
  id v5 = (void *)*((void *)this + 40);
  if (v5)
  {
    *((void *)this + 4ITColor::ITColor((ITColor *)this + 1) = v5;
    operator delete(v5);
  }
}

uint64_t ImageAnalyzer::AnalyzeImage(ImageAnalyzer *this, CGContext *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = ImageAnalyzer::GenerateColorMaps(this, a2);
  if (result)
  {
    uint64_t result = ImageAnalyzer::QuantizeColorMaps(this);
    if (result)
    {
      ImageAnalyzer::PickBackgroundColor((ITColor *)this);
      ImageAnalyzer::PickTextColors((ITColor *)this);
      ImageAnalyzer::DoPostImageAnalysis((ITColor *)this);
      return 1;
    }
  }
  return result;
}

uint64_t ImageAnalyzer::GenerateColorMaps(ImageAnalyzer *this, CGContextRef context)
{
  if (!context) {
    return 0;
  }
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(context);
  int Width = CGBitmapContextGetWidth(context);
  int Height = CGBitmapContextGetHeight(context);
  uint64_t result = 0;
  if (Height == 22 && Width == 22)
  {
    ITColor::ITColor(&v32);
    __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(context);
    uint64_t result = (uint64_t)CGBitmapContextGetData(context);
    uint64_t v29 = result;
    if (result)
    {
      uint64_t result = (uint64_t)malloc_type_calloc((22 * Width), 0x20uLL, 0x1000040E0EAB150uLL);
      *(void *)this = result;
      if (result)
      {
        uint64_t v11 = 0;
        int v12 = BitmapInfo & 0x3000;
        uint64_t v13 = 1;
        uint64_t v14 = 24;
        do
        {
          uint64_t v15 = 0;
          uint64_t v31 = v14;
          do
          {
            size_t v16 = v29 + BytesPerRow * v13 + v15;
            if (v12) {
              uint64_t v17 = 6;
            }
            else {
              uint64_t v17 = 5;
            }
            if (v12) {
              uint64_t v18 = 5;
            }
            else {
              uint64_t v18 = 6;
            }
            if (v12) {
              uint64_t v19 = 4;
            }
            else {
              uint64_t v19 = 7;
            }
            LOBYTE(vITColor::ITColor((ITColor *)this + 8) = *(unsigned char *)(v16 + v17);
            LOBYTE(vITColor::ITColor((ITColor *)this + 9) = *(unsigned char *)(v16 + v18);
            LOBYTE(v10) = *(unsigned char *)(v16 + v19);
            ITColor::ITColor(&v33, (double)*(unint64_t *)&v8 / 255.0, (double)*(unint64_t *)&v9 / 255.0, (double)v10 / 255.0, 1.0);
            ITColor v32 = v33;
            double HSVColor = ITColor::GetHSVColor(&v33);
            uint64_t v22 = v21;
            uint64_t v24 = v23;
            ITColor::GetLuminance(&v33);
            uint64_t v25 = *(void *)this;
            uint64_t v26 = (double *)(*(void *)this + v14);
            *(v26 - ITColor::ITColor((ITColor *)this + 3) = HSVColor;
            uint64_t v27 = v25 + v11 + 8 * v15;
            *(void *)(v27 + ITColor::ITColor((ITColor *)this + 8) = v22;
            *(void *)(v27 + 1ITColor::ITColor((ITColor *)this + 6) = v24;
            double *v26 = v28;
            double v9 = *((double *)this + 47);
            double v8 = v28 + v9;
            *((double *)this + 4ITColor::ITColor((ITColor *)this + 7) = v8;
            v15 += 4;
            v14 += 32;
          }
          while (v15 != 80);
          ++v13;
          uint64_t v14 = v31 + 640;
          v11 += 640;
        }
        while (v13 != 21);
        *((double *)this + 4ITColor::ITColor((ITColor *)this + 7) = v8 / 400.0;
        return 1;
      }
    }
  }
  return result;
}

uint64_t ImageAnalyzer::QuantizeColorMaps(ImageAnalyzer *this)
{
  uint64_t result = (uint64_t)malloc_type_calloc(0x190uLL, 8uLL, 0x100004000313F17uLL);
  *((void *)this + ITColor::ITColor((ITColor *)this + 1) = result;
  if (result)
  {
    uint64_t result = (uint64_t)malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
    if (result)
    {
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = 0;
      id v5 = 0;
      unint64_t v6 = 0;
      __p = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v7 = 1;
      do
      {
        if (!v3[v6])
        {
          double v8 = (double *)(*(void *)this + 32 * v6);
          double v9 = *v8;
          double v10 = v8[1];
          double v11 = v8[2];
          double v12 = v8[3];
          double v13 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)result, v6 - 20 * ((unsigned __int16)v6 / 0x14u), (unsigned __int16)v6 / 0x14u);
          double v14 = v13;
          uint64_t v48 = v5;
          if (v5 >= v49)
          {
            unint64_t v15 = 0x5555555555555556 * (((char *)v49 - (char *)v5) >> 4);
            if (v15 <= 1) {
              unint64_t v15 = 1;
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v49 - (char *)v5) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
              unint64_t v16 = 0x555555555555555;
            }
            else {
              unint64_t v16 = v15;
            }
            uint64_t v17 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>((uint64_t)&v49, v16);
            *uint64_t v17 = v9;
            v17[1] = v10;
            v17[2] = v11;
            v17[3] = v12;
            *((_DWORD *)v17 + ITColor::ITColor((ITColor *)this + 8) = v6;
            v17[5] = v14;
            id v20 = (char *)__p;
            uint64_t v19 = v48;
            uint64_t v21 = v17;
            if (v48 != __p)
            {
              do
              {
                long long v22 = *((_OWORD *)v19 - 3);
                long long v23 = *((_OWORD *)v19 - 1);
                *((_OWORD *)v21 - ITColor::ITColor((ITColor *)this + 2) = *((_OWORD *)v19 - 2);
                *((_OWORD *)v21 - ITColor::ITColor((ITColor *)this + 1) = v23;
                *((_OWORD *)v21 - ITColor::ITColor((ITColor *)this + 3) = v22;
                v21 -= 6;
                v19 -= 6;
              }
              while (v19 != (double *)v20);
              uint64_t v19 = (double *)v20;
            }
            id v5 = v17 + 6;
            __p = v21;
            uint64_t v48 = v17 + 6;
            uint64_t v49 = &v17[6 * v18];
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            double *v5 = v9;
            v5[1] = v10;
            v5[2] = v11;
            v5[3] = v12;
            *((_DWORD *)v5 + ITColor::ITColor((ITColor *)this + 8) = v6;
            v5[5] = v13;
            v5 += 6;
          }
          uint64_t v48 = v5;
          *(double *)(*((void *)this + 1) + 8 * vITColor::ITColor((ITColor *)this + 6) = v14;
          v3[v6] = 1;
          if (v6 <= 0x18E)
          {
            uint64_t v24 = v4;
            uint64_t v25 = v7;
            do
            {
              if (!v3[v25])
              {
                uint64_t v26 = (void *)(*(void *)this + v24);
                uint64_t v27 = (unsigned int (*)(void, void))v26[4];
                double v28 = (unsigned int (*)(void, void))v26[5];
                uint64_t v29 = (unsigned int (*)(void, void))v26[6];
                uint64_t v30 = (unsigned int (*)(void, void))v26[7];
                BOOL v31 = isCloseToColor(0, v9, v10, v11, v12, *(double *)&v27, *(double *)&v28, *(double *)&v29, *(double *)&v30, 0.0799999982);
                if (v31)
                {
                  double v32 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)v31, v25 - 20 * ((unsigned __int16)v25 / 0x14u), (unsigned __int16)v25 / 0x14u);
                  v44[0] = v27;
                  v44[1] = v28;
                  v44[2] = v29;
                  v44[3] = v30;
                  int v45 = v25;
                  double v46 = v32;
                  ImageAnalyzer::AddQuantizeColorEntryToSet(v33, (double *)v44, &__p);
                  v3[v25] = 1;
                }
              }
              ++v25;
              v24 += 32;
            }
            while (v25 != 400);
            id v5 = v48;
          }
          uint64_t result = (uint64_t)__p;
          if (v5 != __p)
          {
            v44[0] = (unsigned int (*)(void, void))CompareQuantizeSortcolor;
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>((long long *)__p, (long long *)v5, v44, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)__p) >> 4)), 1);
            id v5 = (double *)__p;
            uint64_t v34 = *((unsigned int *)__p + 8);
            double v35 = *((double *)__p + 5);
            unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (((char *)v48 - (unsigned char *)__p) >> 4);
            if (v36 >= 2)
            {
              uint64_t v37 = (double *)((char *)__p + 88);
              unint64_t v38 = v36 - 1;
              do
              {
                uint64_t v39 = *((unsigned int *)v37 - 2);
                double v40 = *v37;
                if (!v3[v39]) {
                  v3[v39] = 1;
                }
                double v35 = v35 + v40;
                v37 += 6;
                uint64_t v41 = (_OWORD *)(*(void *)this + 32 * v34);
                long long v42 = v41[1];
                v43 = (_OWORD *)(*(void *)this + 32 * v39);
                _OWORD *v43 = *v41;
                v43[1] = v42;
                --v38;
              }
              while (v38);
            }
            *(double *)(*((void *)this + 1) + 8 * v3ITColor::ITColor((ITColor *)this + 4) = v35;
          }
        }
        ++v6;
        ++v7;
        v4 += 32;
      }
      while (v6 != 400);
      free(v3);
      if (__p)
      {
        uint64_t v48 = (double *)__p;
        operator delete(__p);
      }
      return 1;
    }
  }
  return result;
}

void sub_2566CB3C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ImageAnalyzer::PickBackgroundColor(ITColor *this)
{
  double var3 = this[11].var3;
  uint64_t v3 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
  long long v4 = *((_OWORD *)*v3 + 1);
  *(_OWORD *)&this[1].var0 = *(_OWORD *)*v3;
  *(_OWORD *)&this[1].var2 = v4;
  long long v5 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v31.var2 = v5;
  if (ITColor::GetContrastWithLuminance(&v31, 0.180000007) < 1.29999995)
  {
    double ContrastWithLuminance = ITColor::GetContrastWithLuminance(this + 1, 0.180000007);
    unint64_t v7 = (unint64_t)((unsigned char *)v3[1] - (unsigned char *)*v3) >> 5;
    if ((int)v7 >= 2)
    {
      double v8 = ContrastWithLuminance;
      if (v7 == 2) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 3;
      }
      for (uint64_t i = 1; i != v9; ++i)
      {
        double v11 = *(double **)&this[10].var3;
        double v12 = v11[i];
        if (v12 <= 0.0) {
          break;
        }
        double v13 = *v11 / v12;
        if (v13 <= 0.9 || v13 >= 1.112) {
          break;
        }
        double v14 = ITColor::GetContrastWithLuminance((ITColor *)*v3 + i, 0.180000007);
        if (v14 > v8)
        {
          unint64_t v15 = (char *)*v3 + 32 * i;
          long long v16 = v15[1];
          *(_OWORD *)&this[1].var0 = *v15;
          *(_OWORD *)&this[1].var2 = v16;
          double v8 = v14;
        }
      }
    }
  }
  long long v17 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v31.var2 = v17;
  if (ITColor::GetContrastWithLuminance(&v31, 0.180000007) < 1.29999995)
  {
    double HSVColor = ITColor::GetHSVColor(this + 1);
    double v20 = v19;
    double v22 = v21;
    double v28 = HSVColor;
    double v29 = v19;
    double v30 = v21;
    if (var3 < 0.180000007
      || (long long v23 = *(_OWORD *)&this[1].var2,
          *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0,
          *(_OWORD *)&v31.var2 = v23,
          ITColor::GetLuminance(&v31),
          v24 < 0.180000007))
    {
      double v29 = v20 * 1.10000002;
      double v30 = v22 * 0.800000012;
    }
    this[1].var0 = ITColor::CreateFromHSVColor(&v28);
    this[1].var1 = v25;
    this[1].var2 = v26;
    this[1].double var3 = v27;
  }
}

void ImageAnalyzer::PickTextColors(ITColor *this)
{
  uint64_t v2 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
  unint64_t v3 = (unsigned char *)v2[1] - (unsigned char *)*v2;
  unint64_t v4 = v3 >> 5;
  long long v5 = &qword_2568A1000;
  if ((v3 >> 5) < 2)
  {
    BOOL v41 = 0;
    char v42 = 0;
    goto LABEL_29;
  }
  unint64_t v6 = v2;
  double ContrastWithColor = ITColor::GetContrastWithColor((ITColor *)*v2 + 1, this + 1);
  uint64_t v8 = 0;
  int v9 = 0;
  unint64_t v10 = (v3 >> 5);
  int v11 = 1;
  unsigned int v93 = v4;
  unsigned int v94 = v4;
  unsigned int v12 = 1;
  unsigned int v95 = 1;
  double v13 = ContrastWithColor;
  do
  {
    double v14 = (char *)*v6 + v8;
    long long v15 = v14[1];
    *(_OWORD *)&v96.double var0 = *v14;
    *(_OWORD *)&v96.double var2 = v15;
    if ((v9 & 1) == 0)
    {
      double var0 = this[1].var0;
      double var1 = this[1].var1;
      double var2 = this[1].var2;
      double var3 = this[1].var3;
      ITColor v98 = v96;
      v97.double var0 = var0;
      v97.double var1 = var1;
      v97.double var2 = var2;
      v97.double var3 = var3;
      ITColor v99 = v96;
      ITColor::GetLuminance(&v99);
      BOOL v21 = v20 >= 0.180000007;
      v99.double var0 = var0;
      v99.double var1 = var1;
      v99.double var2 = var2;
      v99.double var3 = var3;
      ITColor::GetLuminance(&v99);
      if (((v21 ^ (v22 >= 0.180000007)) & 1) != 0 && ITColor::GetContrastWithColor(&v98, &v97) >= 4.5999999)
      {
        ImageAnalyzer::EnhanceContrastWithColor(v96, this[1], 0.449999988);
        this[2].double var0 = v23;
        this[2].double var1 = v24;
        this[2].double var2 = v25;
        this[2].double var3 = v26;
        int v9 = 1;
        unsigned int v94 = v11;
      }
    }
    double v27 = ITColor::GetContrastWithColor(&v96, this + 1);
    if (v27 > v13)
    {
      if (v27 <= ContrastWithColor)
      {
        double v13 = v27;
        unsigned int v95 = v11 - 1;
      }
      else
      {
        double v13 = ContrastWithColor;
        double ContrastWithColor = v27;
        unsigned int v95 = v12;
        unsigned int v12 = v11 - 1;
      }
    }
    ++v11;
    v8 += 32;
  }
  while (32 * v10 != v8);
  if (v94 >= v93)
  {
LABEL_16:
    ITColor::ITColor(&v99);
    int v36 = 0;
    if (v9)
    {
      LODWORD(vITColor::ITColor((ITColor *)this + 4) = v93;
      long long v5 = &qword_2568A1000;
      goto LABEL_25;
    }
    LOBYTE(v2ITColor::ITColor((ITColor *)this + 8) = 1;
    goto LABEL_18;
  }
  int v28 = 0;
  uint64_t v29 = 32 * v94;
  uint64_t v30 = v94;
  while (1)
  {
    ITColor v31 = (double *)((char *)*v6 + v29);
    double v32 = *v31;
    double v33 = v31[1];
    double v34 = v31[2];
    double v35 = v31[3];
    v100.double var0 = *v31;
    v100.double var1 = v33;
    v100.double var2 = v34;
    v100.double var3 = v35;
    if (contrastsEnoughWithColor(v100, this[1])) {
      break;
    }
    int v28 = ++v30 >= v10;
    v29 += 32;
    if (v10 == v30) {
      goto LABEL_16;
    }
  }
  v102.double var0 = v32;
  v102.double var1 = v33;
  v102.double var2 = v34;
  v102.double var3 = v35;
  ImageAnalyzer::EnhanceContrastWithColor(v102, this[1], 0.449999988);
  this[3].double var0 = v43;
  this[3].double var1 = v44;
  this[3].double var2 = v45;
  this[3].double var3 = v46;
  if (v9 & ~v28)
  {
    char v42 = 1;
    int v36 = 1;
    LODWORD(vITColor::ITColor((ITColor *)this + 4) = v93;
    long long v5 = &qword_2568A1000;
    goto LABEL_28;
  }
  ITColor::ITColor(&v99);
  int v36 = 1;
  if ((v9 & 1) == 0)
  {
LABEL_18:
    ImageAnalyzer::EnhanceContrastWithColor(*((ITColor *)*v6 + v12), this[1], 0.200000003);
    ITColor v99 = v101;
    if (contrastsEnoughWithColor(v101, this[1]))
    {
      ImageAnalyzer::EnhanceContrastWithColor(v99, this[1], 0.449999988);
      this[2].double var0 = v37;
      this[2].double var1 = v38;
      this[2].double var2 = v39;
      this[2].double var3 = v40;
      LOBYTE(vITColor::ITColor((ITColor *)this + 9) = 1;
    }
  }
  LODWORD(vITColor::ITColor((ITColor *)this + 4) = v93;
  long long v5 = &qword_2568A1000;
  if (v28)
  {
LABEL_25:
    ImageAnalyzer::EnhanceContrastWithColor(*((ITColor *)*v6 + v95), this[1], 0.200000003);
    ITColor v99 = v103;
    if (contrastsEnoughWithColor(v103, this[1]))
    {
      ImageAnalyzer::EnhanceContrastWithColor(v99, this[1], 0.449999988);
      this[3].double var0 = v47;
      this[3].double var1 = v48;
      this[3].double var2 = v49;
      this[3].double var3 = v50;
      int v36 = 1;
    }
  }
  char v42 = v9;
LABEL_28:
  BOOL v41 = v36 != 0;
LABEL_29:
  long long v51 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v99.double var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v99.double var2 = v51;
  ITColor::GetLuminance(&v99);
  v52 = (long long *)&this[2];
  double v54 = this[2].var1;
  double v53 = this[2].var2;
  double v55 = this[2].var3;
  v56 = (long long *)&this[3];
  double v57 = *((double *)v5 + 42);
  if (v58 >= v57)
  {
    v99.double var0 = this[2].var0;
    v99.double var1 = v54;
    v99.double var2 = v53;
    v99.double var3 = v55;
    ITColor::GetLuminance(&v99);
    if (v59 >= v57) {
      char v42 = 0;
    }
    long long v60 = *(_OWORD *)&this[3].var2;
    *(_OWORD *)&v99.double var0 = *(_OWORD *)&this[3].var0;
    *(_OWORD *)&v99.double var2 = v60;
    ITColor::GetLuminance(&v99);
    if (v61 >= v57) {
      BOOL v41 = 0;
    }
    if (v42) {
      goto LABEL_51;
    }
LABEL_41:
    long long v65 = *(_OWORD *)&this[1].var2;
    *(_OWORD *)&v99.double var0 = *(_OWORD *)&this[1].var0;
    *(_OWORD *)&v99.double var2 = v65;
    ITColor::GetLuminance(&v99);
    if (v66 < v57)
    {
      if (v4)
      {
        double v67 = this[1].var0;
        double v68 = this[1].var1;
        double v69 = this[1].var2;
        double v70 = this[1].var3;
        v71 = &ITColor::kWhite;
        goto LABEL_46;
      }
      v76 = &ITColor::kWhite;
    }
    else
    {
      if (v4)
      {
        double v67 = this[1].var0;
        double v68 = this[1].var1;
        double v69 = this[1].var2;
        double v70 = this[1].var3;
        v71 = &ITColor::kBlack;
LABEL_46:
        double BlendedColorWithFraction = ITColor::CreateBlendedColorWithFraction((ITColor *)v71, 0.0500000007, *(ITColor *)&v67);
LABEL_50:
        this[2].double var0 = BlendedColorWithFraction;
        this[2].double var1 = v73;
        this[2].double var2 = v74;
        this[2].double var3 = v75;
        goto LABEL_51;
      }
      v76 = &ITColor::kBlack;
    }
    double BlendedColorWithFraction = *(double *)v76;
    double v73 = *((double *)v76 + 1);
    double v74 = *((double *)v76 + 2);
    double v75 = *((double *)v76 + 3);
    goto LABEL_50;
  }
  v99.double var0 = this[2].var0;
  v99.double var1 = v54;
  v99.double var2 = v53;
  v99.double var3 = v55;
  ITColor::GetLuminance(&v99);
  if (v62 < v57) {
    char v42 = 0;
  }
  long long v63 = *(_OWORD *)&this[3].var2;
  *(_OWORD *)&v99.double var0 = *(_OWORD *)&this[3].var0;
  *(_OWORD *)&v99.double var2 = v63;
  ITColor::GetLuminance(&v99);
  if (v64 < v57) {
    BOOL v41 = 0;
  }
  if ((v42 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_51:
  if (v41) {
    goto LABEL_62;
  }
  long long v77 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v99.double var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v99.double var2 = v77;
  ITColor::GetLuminance(&v99);
  if (v78 < v57)
  {
    if (v4)
    {
      double v79 = this[1].var0;
      double v80 = this[1].var1;
      double v81 = this[1].var2;
      double v82 = this[1].var3;
      v83 = &ITColor::kWhite;
      goto LABEL_57;
    }
    v88 = &ITColor::kWhite;
LABEL_60:
    double v84 = *(double *)v88;
    double v85 = *((double *)v88 + 1);
    double v86 = *((double *)v88 + 2);
    double v87 = *((double *)v88 + 3);
    goto LABEL_61;
  }
  if (!v4)
  {
    v88 = &ITColor::kBlack;
    goto LABEL_60;
  }
  double v79 = this[1].var0;
  double v80 = this[1].var1;
  double v81 = this[1].var2;
  double v82 = this[1].var3;
  v83 = &ITColor::kBlack;
LABEL_57:
  double v84 = ITColor::CreateBlendedColorWithFraction((ITColor *)v83, 0.100000001, *(ITColor *)&v79);
LABEL_61:
  this[3].double var0 = v84;
  this[3].double var1 = v85;
  this[3].double var2 = v86;
  this[3].double var3 = v87;
LABEL_62:
  double v89 = ITColor::GetContrastWithColor(this + 2, this + 1);
  if (ITColor::GetContrastWithColor(this + 3, this + 1) > v89)
  {
    long long v91 = *v52;
    long long v90 = *(_OWORD *)&this[2].var2;
    long long v92 = *(_OWORD *)&this[3].var2;
    long long *v52 = *v56;
    *(_OWORD *)&this[2].double var2 = v92;
    long long *v56 = v91;
    *(_OWORD *)&this[3].double var2 = v90;
  }
}

void ImageAnalyzer::DoPostImageAnalysis(ITColor *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this + 2;
  unint64_t v3 = this + 1;
  this[4].double var0 = ITColor::CreateBlendedColorWithFraction(this + 2, 0.200000003, this[1]);
  unint64_t v4 = v1 + 4;
  v1[4].double var1 = v5;
  v1[4].double var2 = v6;
  v1[4].double var3 = v7;
  uint64_t v8 = v1 + 3;
  v1[5].double var0 = ITColor::CreateBlendedColorWithFraction(v1 + 3, 0.200000003, *v3);
  v1[5].double var1 = v9;
  v1 += 5;
  v1->double var2 = v10;
  v1->double var3 = v11;
  ImageAnalyzer::CalculateOneShadowColor(v12, v2, v3);
  v1[1].double var0 = v13;
  v1[1].double var1 = v14;
  v1[1].double var2 = v15;
  v1[1].double var3 = v16;
  ImageAnalyzer::CalculateOneShadowColor(v17, v8, v3);
  v1[3].double var0 = v18;
  v1[3].double var1 = v19;
  v1[3].double var2 = v20;
  v1[3].double var3 = v21;
  ImageAnalyzer::CalculateOneShadowColor(v22, v4, v3);
  v1[2].double var0 = v23;
  v1[2].double var1 = v24;
  v1[2].double var2 = v25;
  v1[2].double var3 = v26;
  ImageAnalyzer::CalculateOneShadowColor(v27, v1, v3);
  v1[4].double var0 = v28;
  v1[4].double var1 = v29;
  v1[4].double var2 = v30;
  v1[4].double var3 = v31;
}

void ImageAnalyzer::AddQuantizeColorEntryToSet(uint64_t a1, double *a2, void **a3)
{
  double v5 = a3[1];
  if (v5 == *a3)
  {
    uint64_t v8 = a3[1];
LABEL_7:
    unint64_t v9 = (unint64_t)a3[2];
    if ((unint64_t)v8 >= v9)
    {
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - v5) >> 4);
      unint64_t v14 = v13 + 1;
      if (v13 + 1 > 0x555555555555555) {
        std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (void)v5) >> 4);
      if (2 * v15 > v14) {
        unint64_t v14 = 2 * v15;
      }
      if (v15 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v16 = 0x555555555555555;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16) {
        long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>((uint64_t)(a3 + 2), v16);
      }
      else {
        long long v17 = 0;
      }
      double v18 = &v17[48 * v13];
      double v19 = &v17[48 * v16];
      long long v20 = *(_OWORD *)a2;
      long long v21 = *((_OWORD *)a2 + 2);
      *((_OWORD *)v18 + ITColor::ITColor((ITColor *)this + 1) = *((_OWORD *)a2 + 1);
      *((_OWORD *)v18 + ITColor::ITColor((ITColor *)this + 2) = v21;
      *(_OWORD *)double v18 = v20;
      unsigned int v12 = v18 + 48;
      double v23 = (char *)*a3;
      double v22 = (char *)a3[1];
      if (v22 != *a3)
      {
        do
        {
          long long v24 = *((_OWORD *)v22 - 3);
          long long v25 = *((_OWORD *)v22 - 1);
          *((_OWORD *)v18 - ITColor::ITColor((ITColor *)this + 2) = *((_OWORD *)v22 - 2);
          *((_OWORD *)v18 - ITColor::ITColor((ITColor *)this + 1) = v25;
          *((_OWORD *)v18 - ITColor::ITColor((ITColor *)this + 3) = v24;
          v18 -= 48;
          v22 -= 48;
        }
        while (v22 != v23);
        double v22 = (char *)*a3;
      }
      *a3 = v18;
      a3[1] = v12;
      a3[2] = v19;
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      long long v10 = *(_OWORD *)a2;
      long long v11 = *((_OWORD *)a2 + 2);
      v8[1] = *((_OWORD *)a2 + 1);
      v8[2] = v11;
      _OWORD *v8 = v10;
      unsigned int v12 = v8 + 3;
    }
    a3[1] = v12;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    double v5 = *a3;
    while (!isCloseToColor(0, *a2, a2[1], a2[2], a2[3], *(double *)&v5[v6], *(double *)&v5[v6 + 8], *(double *)&v5[v6 + 16], *(double *)&v5[v6 + 24], 0.0799999982))
    {
      ++v7;
      double v5 = *a3;
      uint64_t v8 = a3[1];
      v6 += 48;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (unsigned char *)*a3) >> 4) <= v7) {
        goto LABEL_7;
      }
    }
    *(double *)((char *)*a3 + v6 + 40) = a2[5] + *(double *)((char *)*a3 + v6 + 40);
  }
}

BOOL isCloseToColor(ITColor *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  if (a1 && (a3 < 0.0500000007 && a7 < 0.0500000007 || a5 < 0.0149999997 && a9 < 0.0149999997))
  {
    v34.double var0 = ITColor::CreateFromHSVDoubles(a1, a2, a3, a4);
    v34.double var1 = v23;
    v34.double var2 = v24;
    v34.double var3 = v25;
    v33.double var0 = ITColor::CreateFromHSVDoubles(v26, a6, a7, a8);
    v33.double var1 = v27;
    v33.double var2 = v28;
    v33.double var3 = v29;
    if (ITColor::GetContrastWithColor(&v34, &v33) <= 1.65999997) {
      return 1;
    }
  }
  if (vabdd_f64(a3, a7) > a10 || vabdd_f64(a4, a8) > a10) {
    return 0;
  }
  if (vabdd_f64(a2, a6) <= a10) {
    return 1;
  }
  double v30 = a2 + 1.0;
  if (a2 >= a10) {
    double v30 = a2;
  }
  double v31 = a6 + 1.0;
  if (a6 >= a10) {
    double v31 = a6;
  }
  return vabdd_f64(v30, v31) <= a10;
}

double ImageAnalyzer::WeightForPointOnEdge(ImageAnalyzer *this, unsigned int a2, unsigned int a3)
{
  double v3 = (double)a2;
  if (a2 <= 4 && a3 <= 4)
  {
    double v4 = (double)a3;
    double v5 = 4.00000006 - v3;
    goto LABEL_4;
  }
  if (a2 > 4)
  {
    if (a2 >= 0x10 && a3 <= 4)
    {
      double v4 = (double)a3;
      double v5 = 15.9999999 - v3;
LABEL_4:
      double v6 = 4.00000006 - v4;
      if (v5 >= 1.0) {
        double v7 = v5 * 0.75;
      }
      else {
        double v7 = 0.75;
      }
      if (v6 >= 1.0) {
        double v8 = v6 * 0.75;
      }
      else {
        double v8 = 0.75;
      }
      if (v8 <= v7) {
        double v8 = v7;
      }
      goto LABEL_22;
    }
    double v8 = 1.0;
    if (a2 < 0x10) {
      goto LABEL_22;
    }
    double v9 = 15.9999999;
  }
  else
  {
    double v9 = 4.00000006;
  }
  double v10 = v9 - v3;
  double v8 = 0.75;
  if (v10 >= 1.0) {
    double v8 = v10 * 0.75;
  }
LABEL_22:
  double result = 1.0;
  if (v8 >= 1.0) {
    return v8;
  }
  return result;
}

BOOL CompareQuantizeSortcolor(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 40) > *(double *)(a2 + 40);
}

void **ImageAnalyzer::DominantColors(ImageAnalyzer *this)
{
  uint64_t v1 = (void **)((char *)this + 320);
  if (*((void *)this + 41) == *((void *)this + 40))
  {
    double v45 = 0;
    double v46 = 0;
    uint64_t v47 = 0;
    ITColor::ITColor(&v43);
    uint64_t v4 = 0;
    for (uint64_t i = 0; i != 3200; i += 8)
    {
      if (*(double *)(*((void *)this + 1) + i) >= 1.0)
      {
        v42[0] = *(double *)(*((void *)this + 1) + i);
        v43.double var0 = ITColor::CreateFromHSVDoubles(v3, *(double *)(*(void *)this + v4), *(double *)(*(void *)this + v4 + 8), *(double *)(*(void *)this + v4 + 16));
        v43.double var1 = v6;
        v43.double var2 = v7;
        v43.double var3 = v8;
        uint64_t v44 = *(void *)(*(void *)this + v4 + 24);
        ImageAnalyzer::AddDominantColorEntryToSet(v9, v42, (void **)&v45);
      }
      v4 += 32;
    }
    double v10 = v46;
    if (v46 != v45)
    {
      double v48 = CompareSortColor;
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(v45, v46, (unsigned int (**)(void, void))&v48, 126 - 2 * __clz(((char *)v46 - (char *)v45) >> 6), 1);
      std::vector<ITColor>::reserve(v1, ((char *)v46 - (char *)v45) >> 6);
      long long v11 = (void **)((char *)this + 344);
      std::vector<double>::reserve((void **)this + 43, ((char *)v46 - (char *)v45) >> 6);
      double v10 = v46;
      if (v46 != v45)
      {
        unint64_t v12 = 0;
        double v10 = v45;
        do
        {
          unint64_t v13 = &v10[4 * v12 + 1];
          unint64_t v14 = (char *)*((void *)this + 41);
          unint64_t v15 = *((void *)this + 42);
          if ((unint64_t)v14 >= v15)
          {
            uint64_t v18 = (v14 - (unsigned char *)*v1) >> 5;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 59) {
              std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v20 = v15 - (void)*v1;
            if (v20 >> 4 > v19) {
              unint64_t v19 = v20 >> 4;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v21 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            if (v21) {
              double v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>((uint64_t)this + 336, v21);
            }
            else {
              double v22 = 0;
            }
            double v23 = (long long *)&v22[32 * v18];
            long long v24 = v13[1];
            *double v23 = *v13;
            v23[1] = v24;
            double v26 = (char *)*((void *)this + 40);
            double v25 = (char *)*((void *)this + 41);
            double v27 = v23;
            if (v25 != v26)
            {
              do
              {
                long long v28 = *((_OWORD *)v25 - 1);
                *(v27 - ITColor::ITColor((ITColor *)this + 2) = *((_OWORD *)v25 - 2);
                *(v27 - ITColor::ITColor((ITColor *)this + 1) = v28;
                v27 -= 2;
                v25 -= 32;
              }
              while (v25 != v26);
              double v25 = (char *)*v1;
            }
            long long v17 = v23 + 2;
            *((void *)this + 40) = v27;
            *((void *)this + 4ITColor::ITColor((ITColor *)this + 1) = v23 + 2;
            *((void *)this + 4ITColor::ITColor((ITColor *)this + 2) = &v22[32 * v21];
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            long long v16 = v10[4 * v12 + 2];
            *(_OWORD *)unint64_t v14 = *v13;
            *((_OWORD *)v14 + ITColor::ITColor((ITColor *)this + 1) = v16;
            long long v17 = v14 + 32;
          }
          *((void *)this + 4ITColor::ITColor((ITColor *)this + 1) = v17;
          double v29 = &v45[4 * v12];
          double v31 = (char *)*((void *)this + 44);
          unint64_t v30 = *((void *)this + 45);
          if ((unint64_t)v31 >= v30)
          {
            ITColor v33 = (char *)*v11;
            uint64_t v34 = (v31 - (unsigned char *)*v11) >> 3;
            unint64_t v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 61) {
              std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v36 = v30 - (void)v33;
            if (v36 >> 2 > v35) {
              unint64_t v35 = v36 >> 2;
            }
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v35;
            }
            if (v37)
            {
              double v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)this + 360, v37);
              ITColor v33 = (char *)*((void *)this + 43);
              double v31 = (char *)*((void *)this + 44);
            }
            else
            {
              double v38 = 0;
            }
            double v39 = &v38[8 * v34];
            *(void *)double v39 = *(void *)v29;
            double v32 = v39 + 8;
            while (v31 != v33)
            {
              uint64_t v40 = *((void *)v31 - 1);
              v31 -= 8;
              *((void *)v39 - ITColor::ITColor((ITColor *)this + 1) = v40;
              v39 -= 8;
            }
            *((void *)this + 4ITColor::ITColor((ITColor *)this + 3) = v39;
            *((void *)this + 4ITColor::ITColor((ITColor *)this + 4) = v32;
            *((void *)this + 4ITColor::ITColor((ITColor *)this + 5) = &v38[8 * v37];
            if (v33) {
              operator delete(v33);
            }
          }
          else
          {
            *(void *)double v31 = *(void *)v29;
            double v32 = v31 + 8;
          }
          *((void *)this + 4ITColor::ITColor((ITColor *)this + 4) = v32;
          ++v12;
          double v10 = v45;
        }
        while (v12 < ((char *)v46 - (char *)v45) >> 6);
      }
    }
    if (v10)
    {
      double v46 = v10;
      operator delete(v10);
    }
  }
  return v1;
}

void sub_2566CC310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL IsLightColor(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)&v4.double var0 = *a1;
  *(_OWORD *)&v4.double var2 = v1;
  ITColor::GetLuminance(&v4);
  return v2 >= 0.180000007;
}

void ImageAnalyzer::EnhanceContrastWithColor(ITColor a1, ITColor a2, double a3)
{
  double var3 = a2.var3;
  double var2 = a2.var2;
  double var1 = a2.var1;
  double var0 = a2.var0;
  ITColor v16 = a1;
  double HSVColor = ITColor::GetHSVColor(&v16);
  double v9 = v8;
  double v11 = v10;
  ITColor::GetLuminance(&v16);
  v16.double var0 = var0;
  v16.double var1 = var1;
  v16.double var2 = var2;
  v16.double var3 = var3;
  ITColor::GetLuminance(&v16);
  double v13 = 1.0 - (1.0 - v11) * a3;
  if (v14 >= 0.180000007) {
    double v13 = v11 * a3;
  }
  ITColor::CreateFromHSVDoubles(v12, HSVColor, v9, v13);
}

BOOL contrastsEnoughWithColor(ITColor a1, ITColor a2)
{
  double var3 = a2.var3;
  double var2 = a2.var2;
  double var1 = a2.var1;
  double var0 = a2.var0;
  ITColor v11 = a1;
  ITColor v10 = a2;
  ITColor v12 = a1;
  ITColor::GetLuminance(&v12);
  BOOL v7 = v6 >= 0.180000007;
  v12.double var0 = var0;
  v12.double var1 = var1;
  v12.double var2 = var2;
  v12.double var3 = var3;
  ITColor::GetLuminance(&v12);
  return v7 != v8 >= 0.180000007 && ITColor::GetContrastWithColor(&v11, &v10) >= 3.0999999;
}

BOOL ImageAnalyzer::GetColorLuminanceTypeOfColor(ImageAnalyzer *this, ITColor a2)
{
  ITColor v4 = a2;
  ITColor::GetLuminance(&v4);
  return v2 < 0.180000007;
}

double ImageAnalyzer::CalculateAlternateTextColorForColor(ITColor *this, ITColor *a2)
{
  return ITColor::CreateBlendedColorWithFraction(a2, 0.200000003, this[1]);
}

void ImageAnalyzer::CalculateOneShadowColor(ImageAnalyzer *this, ITColor *a2, ITColor *a3)
{
  ITColor::ITColor(&v14);
  ITColor::GetLuminance(a2);
  double v6 = v5;
  ITColor::GetLuminance(a3);
  if (v6 >= v7) {
    double v8 = &ITColor::kBlack;
  }
  else {
    double v8 = &ITColor::kWhite;
  }
  long long v9 = v8[1];
  *(_OWORD *)&v14.double var0 = *v8;
  *(_OWORD *)&v14.double var2 = v9;
  ITColor::GetLuminance(&v14);
  double v11 = v10;
  ITColor::GetLuminance(a3);
  double v13 = vabdd_f64(v11, v12);
  ITColor::CreateBlendedColorWithFraction(&v14, 1.0 - ((v13 + v13) * -0.599999994 + 1.0), *a3);
}

double ImageAnalyzer::GetBorderMarginInPercentage(ImageAnalyzer *this)
{
  return *((double *)this + 46);
}

double ImageAnalyzer::GetBorderMarginInPixels(ImageAnalyzer *this)
{
  double v1 = *((double *)this + 3);
  if (v1 <= *((double *)this + 2)) {
    double v1 = *((double *)this + 2);
  }
  return ceil(v1 * *((double *)this + 46));
}

double ImageAnalyzer::MakeDesaturatedTextColorFor(ImageAnalyzer *this, ITColor a2)
{
  ITColor v7 = a2;
  double HSVColor = ITColor::GetHSVColor(&v7);
  v6[2] = v3;
  v6[0] = HSVColor;
  v6[1] = v4 * 0.800000012;
  return ITColor::CreateFromHSVColor(v6);
}

void ImageAnalyzer::AddDominantColorEntryToSet(uint64_t a1, double *a2, void **a3)
{
  double v5 = a3[1];
  if (v5 == *a3)
  {
    double v25 = a3[1];
LABEL_7:
    unint64_t v26 = (unint64_t)a3[2];
    if ((unint64_t)v25 >= v26)
    {
      uint64_t v31 = ((char *)v25 - v5) >> 6;
      unint64_t v32 = v31 + 1;
      if ((unint64_t)(v31 + 1) >> 58) {
        std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v33 = v26 - (void)v5;
      if (v33 >> 5 > v32) {
        unint64_t v32 = v33 >> 5;
      }
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v34 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v32;
      }
      if (v34) {
        unint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortColorEntry>>((uint64_t)(a3 + 2), v34);
      }
      else {
        unint64_t v35 = 0;
      }
      uint64_t v36 = &v35[64 * v31];
      unint64_t v37 = &v35[64 * v34];
      long long v38 = *(_OWORD *)a2;
      long long v39 = *((_OWORD *)a2 + 1);
      long long v40 = *((_OWORD *)a2 + 3);
      *((_OWORD *)v36 + ITColor::ITColor((ITColor *)this + 2) = *((_OWORD *)a2 + 2);
      *((_OWORD *)v36 + ITColor::ITColor((ITColor *)this + 3) = v40;
      *(_OWORD *)uint64_t v36 = v38;
      *((_OWORD *)v36 + ITColor::ITColor((ITColor *)this + 1) = v39;
      unint64_t v30 = v36 + 64;
      char v42 = (char *)*a3;
      BOOL v41 = (char *)a3[1];
      if (v41 != *a3)
      {
        do
        {
          long long v43 = *((_OWORD *)v41 - 4);
          long long v44 = *((_OWORD *)v41 - 3);
          long long v45 = *((_OWORD *)v41 - 1);
          *((_OWORD *)v36 - ITColor::ITColor((ITColor *)this + 2) = *((_OWORD *)v41 - 2);
          *((_OWORD *)v36 - ITColor::ITColor((ITColor *)this + 1) = v45;
          *((_OWORD *)v36 - ITColor::ITColor((ITColor *)this + 4) = v43;
          *((_OWORD *)v36 - ITColor::ITColor((ITColor *)this + 3) = v44;
          v36 -= 64;
          v41 -= 64;
        }
        while (v41 != v42);
        BOOL v41 = (char *)*a3;
      }
      *a3 = v36;
      a3[1] = v30;
      a3[2] = v37;
      if (v41) {
        operator delete(v41);
      }
    }
    else
    {
      long long v27 = *(_OWORD *)a2;
      long long v28 = *((_OWORD *)a2 + 1);
      long long v29 = *((_OWORD *)a2 + 3);
      v25[2] = *((_OWORD *)a2 + 2);
      void v25[3] = v29;
      *double v25 = v27;
      v25[1] = v28;
      unint64_t v30 = v25 + 4;
    }
    a3[1] = v30;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    double v5 = *a3;
    while (1)
    {
      double v8 = (double *)&v5[v6];
      double v9 = v8[4];
      double v10 = v8[5];
      long long v11 = *((_OWORD *)a2 + 2);
      long long v46 = *((_OWORD *)v8 + 1);
      *(_OWORD *)&v47.double var0 = *((_OWORD *)a2 + 1);
      *(_OWORD *)&v47.double var2 = v11;
      double HSVColor = ITColor::GetHSVColor(&v47);
      double v14 = v13;
      double v16 = v15;
      ITColor::GetLuminance(&v47);
      double v18 = v17;
      *(_OWORD *)&v47.double var0 = v46;
      v47.double var2 = v9;
      v47.double var3 = v10;
      double v19 = ITColor::GetHSVColor(&v47);
      double v21 = v20;
      double v23 = v22;
      ITColor::GetLuminance(&v47);
      if (isCloseToColor((ITColor *)1, HSVColor, v14, v16, v18, v19, v21, v23, v24, 0.0700000003)) {
        break;
      }
      ++v7;
      double v5 = *a3;
      double v25 = a3[1];
      v6 += 64;
      if (v7 >= ((char *)v25 - (unsigned char *)*a3) >> 6) {
        goto LABEL_7;
      }
    }
    *(double *)((char *)*a3 + vITColor::ITColor((ITColor *)this + 6) = *a2 + *(double *)((char *)*a3 + v6);
  }
}

BOOL CompareSortColor(double *a1, double *a2)
{
  return *a1 > *a2;
}

void std::vector<ITColor>::reserve(void **a1, unint64_t a2)
{
  double v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 5)
  {
    if (a2 >> 59) {
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    double v9 = &v6[32 * v8];
    long long v11 = (char *)*a1;
    double v10 = (char *)a1[1];
    double v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - ITColor::ITColor((ITColor *)this + 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - ITColor::ITColor((ITColor *)this + 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      double v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  double v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    double v9 = &v6[8 * v8];
    double v10 = (char *)*a1;
    long long v11 = (char *)a1[1];
    double v12 = v7;
    if (v11 != *a1)
    {
      double v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - ITColor::ITColor((ITColor *)this + 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL AnalyzeImagePlease(BOOL result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (CGContext *)result;
    ImageAnalyzer::ImageAnalyzer((ImageAnalyzer *)v18);
    if (ImageAnalyzer::AnalyzeImage((ImageAnalyzer *)v18, v3))
    {
      double v4 = v19;
      double v5 = v20;
      double v6 = v21;
      *(double *)a2 = v19;
      *(double *)(a2 + ITColor::ITColor((ITColor *)this + 8) = v5;
      *(double *)(a2 + 1ITColor::ITColor((ITColor *)this + 6) = v6;
      double v7 = *(double *)&v22;
      *(_OWORD *)(a2 + 2ITColor::ITColor((ITColor *)this + 4) = v22;
      *(_OWORD *)(a2 + 40) = v23;
      *(_OWORD *)(a2 + 5ITColor::ITColor((ITColor *)this + 6) = v24;
      *(_OWORD *)(a2 + 7ITColor::ITColor((ITColor *)this + 2) = v25;
      *(_OWORD *)(a2 + 8ITColor::ITColor((ITColor *)this + 8) = v26;
      *(_OWORD *)(a2 + 10ITColor::ITColor((ITColor *)this + 4) = v27;
      *(_OWORD *)(a2 + 120) = v28;
      *(_OWORD *)(a2 + 13ITColor::ITColor((ITColor *)this + 6) = v29;
      uint64_t v8 = v32;
      *(_OWORD *)(a2 + 15ITColor::ITColor((ITColor *)this + 2) = v30;
      *(_OWORD *)(a2 + 16ITColor::ITColor((ITColor *)this + 8) = v31;
      *(void *)(a2 + 18ITColor::ITColor((ITColor *)this + 4) = v8;
      long long v9 = v34;
      *(_OWORD *)(a2 + 22ITColor::ITColor((ITColor *)this + 4) = v33;
      *(_OWORD *)(a2 + 240) = v9;
      long long v10 = v36;
      *(_OWORD *)(a2 + 19ITColor::ITColor((ITColor *)this + 2) = v35;
      *(_OWORD *)(a2 + 20ITColor::ITColor((ITColor *)this + 8) = v10;
      long long v11 = v38;
      *(_OWORD *)(a2 + 25ITColor::ITColor((ITColor *)this + 6) = v37;
      *(_OWORD *)(a2 + 27ITColor::ITColor((ITColor *)this + 2) = v11;
      *(unsigned char *)(a2 + 29ITColor::ITColor((ITColor *)this + 6) = 1;
      v40.double var0 = v4;
      v40.double var1 = v5;
      v40.double var2 = v6;
      v40.double var3 = v7;
      ITColor::GetLuminance(&v40);
      *(unsigned char *)(a2 + 29ITColor::ITColor((ITColor *)this + 7) = v12 >= 0.180000007;
      long long v13 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)&v40.double var0 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)&v40.double var2 = v13;
      ITColor::GetLuminance(&v40);
      *(unsigned char *)(a2 + 29ITColor::ITColor((ITColor *)this + 8) = v14 >= 0.180000007;
      long long v15 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)&v40.double var0 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v40.double var2 = v15;
      ITColor::GetLuminance(&v40);
      *(unsigned char *)(a2 + 29ITColor::ITColor((ITColor *)this + 9) = v16 >= 0.180000007;
      double v17 = v39;
      *(unsigned char *)(a2 + 300) = v39 > 0.0;
      *(double *)(a2 + 28ITColor::ITColor((ITColor *)this + 8) = v17;
      ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v18);
      return *(unsigned char *)(a2 + 296) != 0;
    }
    else
    {
      ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v18);
      return 0;
    }
  }
  return result;
}

void sub_2566CCB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double AnalyzedImageColors::GetSelectionColorForState(AnalyzedImageColors *this, int a2, int a3)
{
  if (!*((unsigned char *)this + 296)) {
    return 0.333;
  }
  if (a2 && a3) {
    return *((double *)this + 8);
  }
  if (a2)
  {
    if (*((unsigned char *)this + 297)) {
      double v4 = &ITColor::kBlack;
    }
    else {
      double v4 = &ITColor::kWhite;
    }
    double v5 = 0.25;
  }
  else
  {
    if (*((unsigned char *)this + 297)) {
      double v4 = &ITColor::kBlack;
    }
    else {
      double v4 = &ITColor::kWhite;
    }
    double v5 = 0.150000006;
  }
  return ITColor::ColorWithAlphaComponent((ITColor *)v4, v5);
}

double ITColor::ColorWithAlphaComponent(ITColor *this, double a2)
{
  ITColor::ITColor(&v3, this->var0, this->var1, this->var2, a2);
  return v3.var0;
}

double AnalyzedImageColors::GetSelectedRowTextColorForState(AnalyzedImageColors *this, int a2, int a3)
{
  if (*((unsigned char *)this + 296))
  {
    if (a2 && a3)
    {
      long long v3 = *((_OWORD *)this + 5);
      *(_OWORD *)&v7.double var0 = *((_OWORD *)this + 4);
      *(_OWORD *)&v7.double var2 = v3;
      ITColor::GetLuminance(&v7);
      if (v4 < 0.180000007) {
        double v5 = &ITColor::kWhite;
      }
      else {
        double v5 = &ITColor::kBlack;
      }
    }
    else if (*((unsigned char *)this + 297))
    {
      double v5 = &ITColor::kBlack;
    }
    else
    {
      double v5 = &ITColor::kWhite;
    }
  }
  else
  {
    double v5 = &ITColor::kWhite;
  }
  return *(double *)v5;
}

BOOL IsLightLuminance(double a1)
{
  return a1 >= 0.180000007;
}

void std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265400520, MEMORY[0x263F8C060]);
}

void sub_2566CCDB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  double v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

_OWORD *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,sortQuantizeColorEntry*>(uint64_t a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(void, void))
{
  if ((_OWORD *)a1 != a2)
  {
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) / 48;
    if ((uint64_t)a2 - a1 >= 49)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      double v12 = (__n128 *)(a1 + 48 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    long long v13 = a2;
    if (a2 != a3)
    {
      double v14 = a2;
      do
      {
        long long v15 = (unsigned int (*)(_OWORD *, _OWORD *))*a4;
        long long v16 = v14[1];
        v34[0] = *v14;
        v34[1] = v16;
        v34[2] = v14[2];
        long long v17 = *(_OWORD *)(a1 + 16);
        v33[0] = *(_OWORD *)a1;
        v33[1] = v17;
        v33[2] = *(_OWORD *)(a1 + 32);
        if (v15(v34, v33))
        {
          long long v18 = *v14;
          long long v19 = v14[1];
          long long v20 = v14[2];
          long long v22 = *(_OWORD *)(a1 + 16);
          long long v21 = *(_OWORD *)(a1 + 32);
          _OWORD *v14 = *(_OWORD *)a1;
          v14[1] = v22;
          v14[2] = v21;
          *(_OWORD *)(a1 + 1ITColor::ITColor((ITColor *)this + 6) = v19;
          *(_OWORD *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = v20;
          *(_OWORD *)a1 = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 3;
      }
      while (v14 != a3);
      long long v13 = a3;
    }
    if (v8 >= 49)
    {
      int64_t v23 = v8 / 0x30uLL;
      long long v24 = (__n128 *)(a2 - 3);
      do
      {
        __n128 v25 = *(__n128 *)(a1 + 16);
        __n128 v35 = *(__n128 *)a1;
        __n128 v36 = v25;
        __n128 v37 = *(__n128 *)(a1 + 32);
        long long v26 = (__n128 *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((_OWORD *)a1, (unsigned int (**)(_OWORD *, _OWORD *))a4, v23);
        if (v24 == v26)
        {
          __n128 v30 = v36;
          __n128 *v26 = v35;
          v26[1] = v30;
          v26[2] = v37;
        }
        else
        {
          __n128 v27 = *v24;
          __n128 v28 = v24[2];
          v26[1] = v24[1];
          v26[2] = v28;
          __n128 *v26 = v27;
          __n128 v29 = v36;
          *long long v24 = v35;
          v24[1] = v29;
          void v24[2] = v37;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (uint64_t)&v26[3], a4, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)&v26[3] - a1) >> 4));
        }
        v24 -= 3;
      }
      while (v23-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, unsigned int (**a2)(void, void), uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v48 = v4;
    uint64_t v49 = v5;
    ITColor v7 = a4;
    uint64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 4)))
    {
      uint64_t v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 4)) | 1;
      long long v13 = (__n128 *)(a1 + 48 * v12);
      uint64_t v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 4) + 2;
      if (v14 < a3)
      {
        long long v15 = *a2;
        __n128 v16 = v13[1];
        v47[0] = *v13;
        v47[1] = v16;
        __n128 v17 = v13[3];
        v47[2] = v13[2];
        __n128 v18 = v13[4];
        __n128 v19 = v13[5];
        v46[0] = v17;
        v46[1] = v18;
        v46[2] = v19;
        if (v15(v47, v46))
        {
          v13 += 3;
          uint64_t v12 = v14;
        }
      }
      long long v20 = *a2;
      __n128 v21 = v13[1];
      v45[0] = *v13;
      v45[1] = v21;
      v45[2] = v13[2];
      __n128 v22 = v7[1];
      v44[0] = *v7;
      v44[1] = v22;
      v44[2] = v7[2];
      if ((((uint64_t (*)(_OWORD *, _OWORD *))v20)(v45, v44) & 1) == 0)
      {
        __n128 v24 = v7[1];
        __n128 v41 = *v7;
        __n128 v42 = v24;
        __n128 v43 = v7[2];
        do
        {
          __n128 v25 = v13;
          __n128 v26 = *v13;
          __n128 v27 = v13[2];
          v7[1] = v13[1];
          v7[2] = v27;
          __n128 *v7 = v26;
          if (v9 < v12) {
            break;
          }
          uint64_t v28 = (2 * v12) | 1;
          long long v13 = (__n128 *)(a1 + 48 * v28);
          if (2 * v12 + 2 < a3)
          {
            __n128 v29 = *a2;
            __n128 v30 = v13[1];
            v40[0] = *v13;
            v40[1] = v30;
            __n128 v31 = v13[3];
            v40[2] = v13[2];
            __n128 v32 = v13[4];
            __n128 v33 = v13[5];
            v39[0] = v31;
            v39[1] = v32;
            v39[2] = v33;
            if (v29(v40, v39))
            {
              v13 += 3;
              uint64_t v28 = 2 * v12 + 2;
            }
          }
          long long v34 = *a2;
          __n128 v35 = v13[1];
          v38[0] = *v13;
          v38[1] = v35;
          v38[2] = v13[2];
          v37[0] = v41;
          v37[1] = v42;
          v37[2] = v43;
          ITColor v7 = v25;
          uint64_t v12 = v28;
        }
        while (!v34(v38, v37));
        __n128 result = v41;
        __n128 v36 = v43;
        v25[1] = v42;
        v25[2] = v36;
        *__n128 v25 = result;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(_OWORD *a1, unsigned int (**a2)(_OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[3 * v6 + 3];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      uint64_t v12 = *a2;
      long long v14 = v9[1];
      long long v13 = v9[2];
      v21[0] = *v9;
      v21[1] = v14;
      v21[2] = v13;
      long long v15 = v9[3];
      long long v16 = v9[5];
      v20[1] = v9[4];
      v20[2] = v16;
      v20[0] = v15;
      if (v12(v21, v20))
      {
        v9 += 3;
        uint64_t v10 = v11;
      }
    }
    long long v17 = *v9;
    long long v18 = v9[2];
    a1[1] = v9[1];
    a1[2] = v18;
    *a1 = v17;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(void, void), uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v31 = v4;
    uint64_t v32 = v5;
    unint64_t v9 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v10 = *a3;
    uint64_t v11 = (_OWORD *)(a1 + 48 * v9);
    long long v12 = v11[1];
    v30[0] = *v11;
    v30[1] = v12;
    v30[2] = v11[2];
    long long v13 = *(_OWORD *)(a2 - 32);
    v29[0] = *(_OWORD *)(a2 - 48);
    v29[1] = v13;
    v29[2] = *(_OWORD *)(a2 - 16);
    if (v10(v30, v29))
    {
      long long v15 = (_OWORD *)(a2 - 48);
      long long v16 = *(_OWORD *)(a2 - 32);
      long long v26 = *(_OWORD *)(a2 - 48);
      long long v27 = v16;
      long long v28 = *(_OWORD *)(a2 - 16);
      do
      {
        long long v17 = v11;
        long long v18 = *v11;
        long long v19 = v11[2];
        v15[1] = v11[1];
        v15[2] = v19;
        *long long v15 = v18;
        if (!v9) {
          break;
        }
        unint64_t v9 = (v9 - 1) >> 1;
        long long v20 = *a3;
        uint64_t v11 = (_OWORD *)(a1 + 48 * v9);
        long long v21 = v11[1];
        v25[0] = *v11;
        v25[1] = v21;
        v25[2] = v11[2];
        v24[0] = v26;
        v24[1] = v27;
        void v24[2] = v28;
        char v22 = v20(v25, v24);
        long long v15 = v17;
      }
      while ((v22 & 1) != 0);
      long long v23 = v27;
      *long long v17 = v26;
      v17[1] = v23;
      double result = *(double *)&v28;
      v17[2] = v28;
    }
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(long long *a1, long long *a2, unsigned int (**a3)(void, void), uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = a2 - 3;
  long long v12 = a1;
LABEL_2:
  uint64_t v13 = 1 - a4;
  while (1)
  {
    a1 = v12;
    uint64_t v14 = v13;
    uint64_t v15 = (char *)a2 - (char *)v12;
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (a2 - v12);
    if (!(!v6 & v5))
    {
      switch(v16)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          __n128 v37 = *a3;
          long long v39 = *(a2 - 2);
          long long v38 = *(a2 - 1);
          v50[0] = *(a2 - 3);
          v50[1] = v39;
          v50[2] = v38;
          long long v40 = *v12;
          long long v41 = v12[2];
          v49[1] = v12[1];
          v49[2] = v41;
          v49[0] = v40;
          if (v37(v50, v49))
          {
            long long v42 = *v12;
            long long v43 = v12[2];
            long long v52 = v12[1];
            long long v53 = v43;
            long long v51 = v42;
            long long v44 = *v11;
            long long v45 = *(a2 - 1);
            v12[1] = *(a2 - 2);
            v12[2] = v45;
            long long *v12 = v44;
            long long v46 = v52;
            long long *v11 = v51;
            *(a2 - ITColor::ITColor((ITColor *)this + 2) = v46;
            *(a2 - ITColor::ITColor((ITColor *)this + 1) = v53;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v12, v12 + 3, a2 - 3, a3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)v12, (__n128 *)v12 + 3, (__n128 *)v12 + 6, (__n128 *)a2 - 3, a3);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)v12, (__n128 *)v12 + 3, (__n128 *)v12 + 6, (__n128 *)v12 + 9, (__n128 *)a2 - 3, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v15 <= 1151)
    {
      if (a5) {
        std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((uint64_t)v12, a2, (uint64_t (**)(void, void))a3);
      }
      else {
        std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((uint64_t)v12, a2, (uint64_t (**)(void, void))a3);
      }
      return;
    }
    if (v14 == 1) {
      break;
    }
    unint64_t v17 = v16 >> 1;
    long long v18 = &v12[3 * (v16 >> 1)];
    if ((unint64_t)v15 >= 0x1801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v12, &v12[3 * (v16 >> 1)], a2 - 3, a3);
      uint64_t v19 = 3 * v17;
      long long v20 = &v12[3 * v17 - 3];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v12 + 3, v20, a2 - 6, a3);
      long long v21 = v12 + 6;
      char v22 = &v12[v19 + 3];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v21, v22, a2 - 9, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v20, v18, v22, a3);
      long long v23 = *a1;
      long long v24 = a1[2];
      long long v52 = a1[1];
      long long v53 = v24;
      long long v51 = v23;
      long long v25 = *v18;
      long long v26 = v18[2];
      a1[1] = v18[1];
      a1[2] = v26;
      *a1 = v25;
      long long v27 = v51;
      long long v28 = v53;
      v18[1] = v52;
      v18[2] = v28;
      *long long v18 = v27;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(&v12[3 * (v16 >> 1)], v12, a2 - 3, a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    __n128 v29 = *a3;
    long long v31 = *(a1 - 2);
    long long v30 = *(a1 - 1);
    v48[0] = *(a1 - 3);
    v48[1] = v31;
    v48[2] = v30;
    long long v32 = *a1;
    long long v33 = a1[2];
    v47[1] = a1[1];
    v47[2] = v33;
    v47[0] = v32;
    if ((((uint64_t (*)(_OWORD *, _OWORD *))v29)(v48, v47) & 1) == 0)
    {
      long long v12 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(a1, a2, (uint64_t (**)(void, void))a3);
      goto LABEL_18;
    }
LABEL_13:
    long long v34 = (__n128 *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(a1, a2, (uint64_t (**)(void, void))a3);
    if ((v35 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v36 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)a1, v34, a3);
    long long v12 = (long long *)&v34[3];
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v34 + 3, (__n128 *)a2, a3))
    {
      a4 = -v14;
      a2 = (long long *)v34;
      if (v36) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v13 = v14 + 1;
    if (!v36)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(a1, v34, a3, -v14, a5 & 1);
      long long v12 = (long long *)&v34[3];
LABEL_18:
      a5 = 0;
      a4 = -v14;
      goto LABEL_2;
    }
  }
  if (v12 != a2) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,sortQuantizeColorEntry*>((uint64_t)v12, a2, a2, a3);
  }
}

  uint64_t v11 = a2 - 4;
  long long v12 = a1;
LABEL_2:
  uint64_t v13 = 1 - a4;
  while (1)
  {
    a1 = v12;
    uint64_t v14 = v13;
    uint64_t v15 = (char *)a2 - (char *)v12;
    unint64_t v16 = ((char *)a2 - (char *)v12) >> 6;
    if (!(!v6 & v5))
    {
      switch(v16)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          long long v38 = *a3;
          long long v39 = *(a2 - 1);
          long long v41 = *(a2 - 4);
          long long v40 = *(a2 - 3);
          v56[2] = *(a2 - 2);
          v56[3] = v39;
          v56[0] = v41;
          v56[1] = v40;
          long long v42 = v12[3];
          long long v44 = *v12;
          long long v43 = v12[1];
          v55[2] = v12[2];
          v55[3] = v42;
          v55[0] = v44;
          v55[1] = v43;
          if (v38(v56, v55))
          {
            long long v45 = *v12;
            long long v46 = v12[1];
            ITColor v47 = v12[3];
            double v59 = v12[2];
            long long v60 = v47;
            double v57 = v45;
            double v58 = v46;
            uint64_t v48 = *v11;
            uint64_t v49 = *(a2 - 3);
            double v50 = *(a2 - 1);
            v12[2] = *(a2 - 2);
            v12[3] = v50;
            long long *v12 = v48;
            v12[1] = v49;
            long long v51 = v58;
            long long *v11 = v57;
            *(a2 - ITColor::ITColor((ITColor *)this + 3) = v51;
            long long v52 = v60;
            *(a2 - ITColor::ITColor((ITColor *)this + 2) = v59;
            *(a2 - ITColor::ITColor((ITColor *)this + 1) = v52;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v12, v12 + 4, a2 - 4, a3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)v12, (__n128 *)v12 + 4, (__n128 *)v12 + 8, (__n128 *)a2 - 4, a3);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v12, (__n128 *)v12 + 4, (__n128 *)v12 + 8, (__n128 *)v12 + 12, (__n128 *)a2 - 4, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v15 <= 1535)
    {
      if (a5) {
        std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v12, a2, (uint64_t (**)(void, void))a3);
      }
      else {
        std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v12, a2, (uint64_t (**)(void, void))a3);
      }
      return;
    }
    if (v14 == 1) {
      break;
    }
    unint64_t v17 = v16 >> 1;
    long long v18 = &v12[4 * (v16 >> 1)];
    if ((unint64_t)v15 > 0x2000)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v12, &v12[4 * (v16 >> 1)], a2 - 4, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v12 + 4, v18 - 4, a2 - 8, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v12 + 8, &v12[4 * v17 + 4], a2 - 12, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v18 - 4, v18, &v12[4 * v17 + 4], a3);
      uint64_t v19 = *v12;
      long long v20 = v12[1];
      long long v21 = v12[3];
      double v59 = v12[2];
      long long v60 = v21;
      double v57 = v19;
      double v58 = v20;
      char v22 = *v18;
      long long v23 = v18[1];
      long long v24 = v18[3];
      v12[2] = v18[2];
      v12[3] = v24;
      long long *v12 = v22;
      v12[1] = v23;
      long long v25 = v57;
      long long v26 = v58;
      long long v27 = v60;
      v18[2] = v59;
      v18[3] = v27;
      *long long v18 = v25;
      v18[1] = v26;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(&v12[4 * (v16 >> 1)], v12, a2 - 4, a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    long long v28 = *a3;
    __n128 v29 = *(v12 - 1);
    long long v31 = *(v12 - 4);
    long long v30 = *(v12 - 3);
    v54[2] = *(v12 - 2);
    v54[3] = v29;
    v54[0] = v31;
    v54[1] = v30;
    long long v32 = v12[3];
    long long v34 = *v12;
    long long v33 = v12[1];
    v53[2] = v12[2];
    v53[3] = v32;
    v53[0] = v34;
    v53[1] = v33;
    if ((((uint64_t (*)(_OWORD *, _OWORD *))v28)(v54, v53) & 1) == 0)
    {
      long long v12 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(v12, a2, (uint64_t (**)(void, void))a3);
      goto LABEL_18;
    }
LABEL_13:
    char v35 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(v12, a2, (uint64_t (**)(void, void))a3);
    if ((v36 & 1) == 0) {
      goto LABEL_16;
    }
    __n128 v37 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v12, (__n128 *)v35, a3);
    long long v12 = v35 + 4;
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)(v35 + 4), (__n128 *)a2, a3))
    {
      a4 = -v14;
      a2 = v35;
      if (v37) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v13 = v14 + 1;
    if (!v37)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(a1, v35, a3, -v14, a5 & 1);
      long long v12 = v35 + 4;
LABEL_18:
      a5 = 0;
      a4 = -v14;
      goto LABEL_2;
    }
  }
  if (v12 != a2) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,sortColorEntry*>((uint64_t)v12, a2, a2, a3);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t result, long long *a2, uint64_t (**a3)(void, void))
{
  if ((long long *)result != a2)
  {
    uint64_t v31 = v3;
    uint64_t v32 = v4;
    char v6 = (_OWORD *)result;
    uint64_t v7 = (long long *)(result + 48);
    if ((long long *)(result + 48) != a2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = (long long *)result;
      do
      {
        uint64_t v11 = v10;
        uint64_t v10 = v7;
        long long v12 = *a3;
        long long v13 = v10[1];
        v30[0] = *v10;
        v30[1] = v13;
        v30[2] = v10[2];
        long long v14 = *v11;
        long long v15 = v11[2];
        v29[1] = v11[1];
        v29[2] = v15;
        v29[0] = v14;
        double result = v12(v30, v29);
        if (result)
        {
          long long v16 = v10[1];
          long long v26 = *v10;
          long long v27 = v16;
          long long v28 = v10[2];
          uint64_t v17 = v9;
          while (1)
          {
            long long v18 = (_OWORD *)((char *)v6 + v17);
            long long v19 = *(_OWORD *)((char *)v6 + v17 + 16);
            v18[3] = *(_OWORD *)((char *)v6 + v17);
            v18[4] = v19;
            v18[5] = *(_OWORD *)((char *)v6 + v17 + 32);
            if (!v17) {
              break;
            }
            long long v20 = *a3;
            v25[0] = v26;
            v25[1] = v27;
            v25[2] = v28;
            long long v21 = *(v18 - 2);
            v24[0] = *(v18 - 3);
            v24[1] = v21;
            void v24[2] = *(v18 - 1);
            double result = v20(v25, v24);
            v17 -= 48;
            if ((result & 1) == 0)
            {
              char v22 = (_OWORD *)((char *)v6 + v17 + 48);
              goto LABEL_10;
            }
          }
          char v22 = v6;
LABEL_10:
          long long v23 = v27;
          *char v22 = v26;
          v22[1] = v23;
          v22[2] = v28;
        }
        uint64_t v7 = v10 + 3;
        v9 += 48;
      }
      while (v10 + 3 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t result, long long *a2, uint64_t (**a3)(void, void))
{
  if ((long long *)result != a2)
  {
    uint64_t v30 = v3;
    uint64_t v31 = v4;
    char v6 = (long long *)result;
    for (uint64_t i = (long long *)(result + 48); v6 + 3 != a2; uint64_t i = v6 + 3)
    {
      uint64_t v9 = v6;
      char v6 = i;
      uint64_t v10 = *a3;
      long long v11 = v6[1];
      v29[0] = *v6;
      v29[1] = v11;
      v29[2] = v6[2];
      long long v12 = *v9;
      long long v13 = v9[2];
      v28[1] = v9[1];
      v28[2] = v13;
      v28[0] = v12;
      double result = v10(v29, v28);
      if (result)
      {
        long long v14 = v6[1];
        long long v25 = *v6;
        long long v26 = v14;
        long long v27 = v6[2];
        long long v15 = v6;
        do
        {
          long long v16 = v15 - 3;
          long long v17 = *(v15 - 2);
          long long v18 = *(v15 - 1);
          long long v19 = *(v15 - 4);
          *long long v15 = *(v15 - 3);
          v15[1] = v17;
          v15[2] = v18;
          long long v20 = *a3;
          v24[0] = v25;
          v24[1] = v26;
          void v24[2] = v27;
          long long v21 = *(v15 - 6);
          v23[1] = *(v15 - 5);
          v23[2] = v19;
          v23[0] = v21;
          double result = v20(v24, v23);
          long long v15 = v16;
        }
        while ((result & 1) != 0);
        long long v22 = v26;
        *long long v16 = v25;
        v16[1] = v22;
        v16[2] = v27;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(void, void))
{
  uint64_t v8 = *a4;
  long long v9 = a2[1];
  v60[0] = *a2;
  v60[1] = v9;
  v60[2] = a2[2];
  long long v10 = a1[1];
  v59[0] = *a1;
  v59[1] = v10;
  v59[2] = a1[2];
  char v11 = v8(v60, v59);
  long long v12 = *a4;
  if (v11)
  {
    long long v13 = a3[1];
    v54[0] = *a3;
    v54[1] = v13;
    v54[2] = a3[2];
    long long v14 = a2[1];
    v53[0] = *a2;
    v53[1] = v14;
    v53[2] = a2[2];
    if (v12(v54, v53))
    {
      long long v15 = *a1;
      long long v16 = a1[1];
      long long v17 = a1[2];
      long long v19 = a3[1];
      long long v18 = a3[2];
      *a1 = *a3;
      a1[1] = v19;
      a1[2] = v18;
      a3[2] = v17;
      uint64_t result = 1;
LABEL_9:
      *a3 = v15;
      a3[1] = v16;
      return result;
    }
    long long v38 = *a1;
    long long v39 = a1[1];
    long long v40 = a1[2];
    long long v42 = a2[1];
    long long v41 = a2[2];
    *a1 = *a2;
    a1[1] = v42;
    a1[2] = v41;
    a2[1] = v39;
    a2[2] = v40;
    *a2 = v38;
    long long v43 = *a4;
    long long v44 = *a3;
    long long v45 = a3[2];
    v52[1] = a3[1];
    void v52[2] = v45;
    long long v46 = *a2;
    long long v47 = a2[1];
    v51[2] = a2[2];
    v52[0] = v44;
    v51[0] = v46;
    v51[1] = v47;
    if (v43(v52, v51))
    {
      long long v15 = *a2;
      long long v16 = a2[1];
      long long v48 = a2[2];
      long long v50 = a3[1];
      long long v49 = a3[2];
      *a2 = *a3;
      a2[1] = v50;
      a2[2] = v49;
      a3[2] = v48;
      uint64_t result = 2;
      goto LABEL_9;
    }
  }
  else
  {
    long long v21 = a3[1];
    v58[0] = *a3;
    v58[1] = v21;
    v58[2] = a3[2];
    long long v22 = a2[1];
    v57[0] = *a2;
    v57[1] = v22;
    v57[2] = a2[2];
    uint64_t result = ((uint64_t (*)(_OWORD *, _OWORD *))v12)(v58, v57);
    if (!result) {
      return result;
    }
    long long v23 = *a2;
    long long v24 = a2[1];
    long long v25 = a2[2];
    long long v27 = a3[1];
    long long v26 = a3[2];
    *a2 = *a3;
    a2[1] = v27;
    a2[2] = v26;
    a3[1] = v24;
    a3[2] = v25;
    *a3 = v23;
    long long v28 = *a4;
    long long v29 = *a2;
    long long v30 = a2[2];
    v56[1] = a2[1];
    v56[2] = v30;
    long long v31 = *a1;
    long long v32 = a1[1];
    v55[2] = a1[2];
    v56[0] = v29;
    v55[0] = v31;
    v55[1] = v32;
    if (v28(v56, v55))
    {
      long long v33 = *a1;
      long long v34 = a1[1];
      long long v35 = a1[2];
      long long v37 = a2[1];
      long long v36 = a2[2];
      *a1 = *a2;
      a1[1] = v37;
      a1[2] = v36;
      a2[1] = v34;
      a2[2] = v35;
      uint64_t result = 2;
      *a2 = v33;
      return result;
    }
  }
  return 1;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(long long *a1, long long *a2, uint64_t (**a3)(void, void))
{
  uint64_t v4 = a2;
  long long v6 = a1[1];
  long long v53 = *a1;
  long long v54 = v6;
  long long v55 = a1[2];
  uint64_t v7 = *a3;
  v52[0] = v53;
  v52[1] = v6;
  void v52[2] = v55;
  long long v8 = *(a2 - 2);
  v51[0] = *(a2 - 3);
  v51[1] = v8;
  v51[2] = *(a2 - 1);
  if (v7(v52, v51))
  {
    long long v9 = a1;
    do
    {
      long long v10 = v9 + 3;
      char v11 = *a3;
      v50[0] = v53;
      v50[1] = v54;
      v50[2] = v55;
      long long v12 = v9[4];
      v49[0] = v9[3];
      v49[1] = v12;
      v49[2] = v9[5];
      char v13 = v11(v50, v49);
      long long v9 = v10;
    }
    while ((v13 & 1) == 0);
  }
  else
  {
    long long v14 = a1 + 3;
    do
    {
      long long v10 = v14;
      if (v14 >= v4) {
        break;
      }
      long long v15 = *a3;
      v48[0] = v53;
      v48[1] = v54;
      v48[2] = v55;
      long long v16 = v10[1];
      v47[0] = *v10;
      v47[1] = v16;
      v47[2] = v10[2];
      int v17 = v15(v48, v47);
      long long v14 = v10 + 3;
    }
    while (!v17);
  }
  if (v10 >= v4)
  {
    long long v18 = v4;
  }
  else
  {
    do
    {
      long long v18 = v4 - 3;
      long long v19 = *a3;
      v46[0] = v53;
      v46[1] = v54;
      v46[2] = v55;
      long long v20 = *(v4 - 2);
      v45[0] = *(v4 - 3);
      v45[1] = v20;
      v45[2] = *(v4 - 1);
      v4 -= 3;
    }
    while ((v19(v46, v45) & 1) != 0);
  }
  while (v10 < v18)
  {
    long long v21 = *v10;
    long long v22 = v10[2];
    long long v57 = v10[1];
    long long v58 = v22;
    long long v56 = v21;
    long long v23 = *v18;
    long long v24 = v18[2];
    v10[1] = v18[1];
    v10[2] = v24;
    long long *v10 = v23;
    long long v25 = v56;
    long long v26 = v58;
    v18[1] = v57;
    v18[2] = v26;
    *long long v18 = v25;
    do
    {
      v44[0] = v53;
      v44[1] = v54;
      v44[2] = v55;
      long long v28 = v10[3];
      long long v27 = v10[4];
      long long v29 = v10[5];
      v10 += 3;
      long long v30 = (unsigned int (*)(void, void))*a3;
      v43[1] = v27;
      v43[2] = v29;
      v43[0] = v28;
    }
    while (!v30(v44, v43));
    do
    {
      v42[0] = v53;
      v42[1] = v54;
      double v42[2] = v55;
      long long v32 = *(v18 - 3);
      long long v31 = *(v18 - 2);
      long long v33 = *(v18 - 1);
      v18 -= 3;
      long long v34 = *a3;
      v41[1] = v31;
      void v41[2] = v33;
      v41[0] = v32;
    }
    while ((v34(v42, v41) & 1) != 0);
  }
  long long v35 = v10 - 3;
  if (v10 - 3 != a1)
  {
    long long v36 = *v35;
    long long v37 = *(v10 - 1);
    a1[1] = *(v10 - 2);
    a1[2] = v37;
    *a1 = v36;
  }
  long long v38 = v53;
  long long v39 = v55;
  *(v10 - ITColor::ITColor((ITColor *)this + 2) = v54;
  *(v10 - ITColor::ITColor((ITColor *)this + 1) = v39;
  *long long v35 = v38;
  return v10;
}

long long *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(long long *a1, long long *a2, uint64_t (**a3)(void, void))
{
  uint64_t v6 = 0;
  long long v7 = a1[1];
  long long v47 = *a1;
  long long v48 = v7;
  long long v49 = a1[2];
  do
  {
    long long v8 = *a3;
    long long v9 = a1[v6 + 4];
    v46[0] = a1[v6 + 3];
    v46[1] = v9;
    v46[2] = a1[v6 + 5];
    v45[0] = v47;
    v45[1] = v48;
    v45[2] = v49;
    v6 += 3;
  }
  while ((v8(v46, v45) & 1) != 0);
  long long v10 = &a1[v6];
  char v11 = &a1[v6 - 3];
  if (v6 == 3)
  {
    while (v10 < a2)
    {
      long long v15 = *a3;
      long long v12 = a2 - 3;
      long long v16 = *(a2 - 2);
      v44[0] = *(a2 - 3);
      v44[1] = v16;
      v44[2] = *(a2 - 1);
      v43[0] = v47;
      v43[1] = v48;
      v43[2] = v49;
      a2 -= 3;
      if (v15(v44, v43)) {
        goto LABEL_9;
      }
    }
    long long v12 = a2;
  }
  else
  {
    do
    {
      long long v12 = a2 - 3;
      char v13 = (unsigned int (*)(void, void))*a3;
      long long v14 = *(a2 - 2);
      v42[0] = *(a2 - 3);
      v42[1] = v14;
      double v42[2] = *(a2 - 1);
      v41[0] = v47;
      v41[1] = v48;
      void v41[2] = v49;
      a2 -= 3;
    }
    while (!v13(v42, v41));
  }
LABEL_9:
  if (v10 < v12)
  {
    int v17 = v10;
    long long v18 = v12;
    do
    {
      long long v20 = v17[1];
      long long v50 = *v17;
      long long v19 = v50;
      long long v51 = v20;
      long long v52 = v17[2];
      long long v21 = v52;
      long long v22 = *v18;
      long long v23 = v18[2];
      v17[1] = v18[1];
      v17[2] = v23;
      *int v17 = v22;
      v18[1] = v20;
      v18[2] = v21;
      *long long v18 = v19;
      do
      {
        long long v25 = v17[4];
        long long v24 = v17[5];
        long long v26 = v17[3];
        v17 += 3;
        long long v27 = *a3;
        v40[0] = v26;
        v40[1] = v25;
        v40[2] = v24;
        v39[1] = v48;
        v39[2] = v49;
        v39[0] = v47;
      }
      while ((v27(v40, v39) & 1) != 0);
      do
      {
        long long v29 = *(v18 - 2);
        long long v28 = *(v18 - 1);
        long long v30 = *(v18 - 3);
        v18 -= 3;
        long long v31 = (unsigned int (*)(void, void))*a3;
        v38[0] = v30;
        v38[1] = v29;
        v38[2] = v28;
        v37[1] = v48;
        v37[2] = v49;
        v37[0] = v47;
      }
      while (!v31(v38, v37));
    }
    while (v17 < v18);
    char v11 = v17 - 3;
  }
  if (v11 != a1)
  {
    long long v32 = *v11;
    long long v33 = v11[2];
    a1[1] = v11[1];
    a1[2] = v33;
    *a1 = v32;
  }
  long long v34 = v47;
  long long v35 = v49;
  v11[1] = v48;
  v11[2] = v35;
  long long *v11 = v34;
  return v11;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, unsigned int (**a3)(void, void))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      long long v8 = *a3;
      __n128 v9 = a2[-2];
      v41[0] = a2[-3];
      v41[1] = v9;
      void v41[2] = a2[-1];
      __n128 v10 = a1[1];
      v40[0] = *a1;
      v40[1] = v10;
      v40[2] = a1[2];
      if (v8(v41, v40))
      {
        char v11 = a2 - 3;
        __n128 v12 = *a1;
        __n128 v13 = a1[1];
        __n128 v14 = a1[2];
        __n128 v16 = a2[-2];
        __n128 v15 = a2[-1];
        *a1 = a2[-3];
        a1[1] = v16;
        a1[2] = v15;
        v11[1] = v13;
        v11[2] = v14;
        __n128 *v11 = v12;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (__n128 *)a1[3].n128_u64, (__n128 *)a2[-3].n128_u64, a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 3, a1 + 6, a2 - 3, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3, a3);
      return 1;
    default:
      int v17 = a1 + 6;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (__n128 *)a1[3].n128_u64, (__n128 *)a1[6].n128_u64, a3);
      long long v18 = a1 + 9;
      if (&a1[9] == a2) {
        return 1;
      }
      uint64_t v19 = 0;
      int v20 = 0;
      break;
  }
  while (1)
  {
    long long v21 = *a3;
    __n128 v22 = v18[1];
    v39[0] = *v18;
    v39[1] = v22;
    v39[2] = v18[2];
    __n128 v23 = *v17;
    __n128 v24 = v17[2];
    v38[1] = v17[1];
    v38[2] = v24;
    v38[0] = v23;
    if (v21(v39, v38))
    {
      __n128 v25 = v18[1];
      __n128 v35 = *v18;
      __n128 v36 = v25;
      __n128 v37 = v18[2];
      uint64_t v26 = v19;
      while (1)
      {
        long long v27 = (_OWORD *)((char *)a1->n128_u64 + v26);
        long long v28 = *(long long *)((char *)&a1[7] + v26);
        v27[9] = *(__n128 *)((char *)&a1[6] + v26);
        v27[10] = v28;
        v27[11] = *(__n128 *)((char *)&a1[8] + v26);
        if (v26 == -96) {
          break;
        }
        long long v29 = *a3;
        v34[0] = v35;
        v34[1] = v36;
        v34[2] = v37;
        long long v30 = v27[4];
        v33[0] = v27[3];
        v33[1] = v30;
        v33[2] = v27[5];
        v26 -= 48;
        if ((((uint64_t (*)(_OWORD *, _OWORD *))v29)(v34, v33) & 1) == 0)
        {
          long long v31 = (__n128 *)((char *)a1 + v26 + 144);
          goto LABEL_12;
        }
      }
      long long v31 = a1;
LABEL_12:
      __n128 v32 = v36;
      *long long v31 = v35;
      v31[1] = v32;
      v31[2] = v37;
      if (++v20 == 8) {
        return &v18[3] == a2;
      }
    }
    int v17 = v18;
    v19 += 48;
    v18 += 3;
    if (v18 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, unsigned int (**a5)(void, void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a2, a3, a5);
  __n128 v10 = *a5;
  __n128 v11 = a4[1];
  v43[0] = *a4;
  v43[1] = v11;
  v43[2] = a4[2];
  __n128 v12 = a3[1];
  v42[0] = *a3;
  v42[1] = v12;
  double v42[2] = a3[2];
  if (v10(v43, v42))
  {
    __n128 v14 = *a3;
    __n128 v15 = a3[1];
    __n128 v16 = a3[2];
    __n128 v18 = a4[1];
    __n128 v17 = a4[2];
    *a3 = *a4;
    a3[1] = v18;
    a3[2] = v17;
    a4[1] = v15;
    a4[2] = v16;
    *a4 = v14;
    uint64_t v19 = *a5;
    __n128 v20 = *a3;
    __n128 v21 = a3[2];
    v41[1] = a3[1];
    void v41[2] = v21;
    __n128 v22 = *a2;
    __n128 v23 = a2[1];
    v40[2] = a2[2];
    v41[0] = v20;
    v40[0] = v22;
    v40[1] = v23;
    if (v19(v41, v40))
    {
      __n128 v24 = *a2;
      __n128 v25 = a2[1];
      __n128 v26 = a2[2];
      __n128 v28 = a3[1];
      __n128 v27 = a3[2];
      *a2 = *a3;
      a2[1] = v28;
      a2[2] = v27;
      a3[1] = v25;
      a3[2] = v26;
      *a3 = v24;
      long long v29 = *a5;
      __n128 v30 = *a2;
      __n128 v31 = a2[2];
      v39[1] = a2[1];
      v39[2] = v31;
      __n128 v32 = *a1;
      __n128 v33 = a1[1];
      v38[2] = a1[2];
      v39[0] = v30;
      v38[0] = v32;
      v38[1] = v33;
      if (v29(v39, v38))
      {
        __n128 result = *a1;
        __n128 v34 = a1[1];
        __n128 v35 = a1[2];
        __n128 v37 = a2[1];
        __n128 v36 = a2[2];
        *a1 = *a2;
        a1[1] = v37;
        a1[2] = v36;
        a2[1] = v34;
        a2[2] = v35;
        *a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, unsigned int (**a6)(void, void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  __n128 v12 = *a6;
  __n128 v13 = a5[1];
  v57[0] = *a5;
  v57[1] = v13;
  v57[2] = a5[2];
  __n128 v14 = a4[1];
  v56[0] = *a4;
  v56[1] = v14;
  v56[2] = a4[2];
  if (v12(v57, v56))
  {
    __n128 v16 = *a4;
    __n128 v17 = a4[1];
    __n128 v18 = a4[2];
    __n128 v20 = a5[1];
    __n128 v19 = a5[2];
    *a4 = *a5;
    a4[1] = v20;
    a4[2] = v19;
    a5[1] = v17;
    a5[2] = v18;
    *a5 = v16;
    __n128 v21 = *a6;
    __n128 v22 = *a4;
    __n128 v23 = a4[2];
    v55[1] = a4[1];
    v55[2] = v23;
    __n128 v24 = *a3;
    __n128 v25 = a3[1];
    v54[2] = a3[2];
    v55[0] = v22;
    v54[0] = v24;
    v54[1] = v25;
    if (v21(v55, v54))
    {
      __n128 v26 = *a3;
      __n128 v27 = a3[1];
      __n128 v28 = a3[2];
      __n128 v30 = a4[1];
      __n128 v29 = a4[2];
      *a3 = *a4;
      a3[1] = v30;
      a3[2] = v29;
      a4[1] = v27;
      a4[2] = v28;
      *a4 = v26;
      __n128 v31 = *a6;
      __n128 v32 = *a3;
      __n128 v33 = a3[2];
      v53[1] = a3[1];
      v53[2] = v33;
      __n128 v34 = *a2;
      __n128 v35 = a2[1];
      void v52[2] = a2[2];
      v53[0] = v32;
      v52[0] = v34;
      v52[1] = v35;
      if (v31(v53, v52))
      {
        __n128 v36 = *a2;
        __n128 v37 = a2[1];
        __n128 v38 = a2[2];
        __n128 v40 = a3[1];
        __n128 v39 = a3[2];
        *a2 = *a3;
        a2[1] = v40;
        a2[2] = v39;
        a3[1] = v37;
        a3[2] = v38;
        *a3 = v36;
        long long v41 = *a6;
        __n128 v42 = *a2;
        __n128 v43 = a2[2];
        v51[1] = a2[1];
        v51[2] = v43;
        __n128 v44 = *(__n128 *)a1;
        long long v45 = *(_OWORD *)(a1 + 16);
        v50[2] = *(_OWORD *)(a1 + 32);
        v51[0] = v42;
        v50[0] = v44;
        v50[1] = v45;
        if (v41(v51, v50))
        {
          __n128 result = *(__n128 *)a1;
          __n128 v46 = *(__n128 *)(a1 + 16);
          __n128 v47 = *(__n128 *)(a1 + 32);
          __n128 v49 = a2[1];
          __n128 v48 = a2[2];
          *(__n128 *)a1 = *a2;
          *(__n128 *)(a1 + 1ITColor::ITColor((ITColor *)this + 6) = v49;
          *(__n128 *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = v48;
          a2[1] = v46;
          a2[2] = v47;
          *a2 = result;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortColorEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

_OWORD *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,sortColorEntry*>(uint64_t a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(void, void))
{
  if ((_OWORD *)a1 != a2)
  {
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) >> 6;
    if ((uint64_t)a2 - a1 >= 65)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      __n128 v12 = (__n128 *)(a1 + (v10 << 6));
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a4, v9, v12);
        v12 -= 4;
        --v11;
      }
      while (v11);
    }
    __n128 v13 = a2;
    if (a2 != a3)
    {
      __n128 v14 = a2;
      do
      {
        __n128 v15 = (unsigned int (*)(_OWORD *, _OWORD *))*a4;
        long long v16 = v14[1];
        v42[0] = *v14;
        v42[1] = v16;
        long long v17 = v14[3];
        double v42[2] = v14[2];
        _OWORD v42[3] = v17;
        long long v18 = *(_OWORD *)(a1 + 16);
        v41[0] = *(_OWORD *)a1;
        v41[1] = v18;
        long long v19 = *(_OWORD *)(a1 + 48);
        void v41[2] = *(_OWORD *)(a1 + 32);
        _OWORD v41[3] = v19;
        if (v15(v42, v41))
        {
          long long v21 = v14[2];
          long long v20 = v14[3];
          long long v23 = *v14;
          long long v22 = v14[1];
          long long v24 = *(_OWORD *)(a1 + 48);
          long long v26 = *(_OWORD *)a1;
          long long v25 = *(_OWORD *)(a1 + 16);
          v14[2] = *(_OWORD *)(a1 + 32);
          v14[3] = v24;
          _OWORD *v14 = v26;
          v14[1] = v25;
          *(_OWORD *)a1 = v23;
          *(_OWORD *)(a1 + 1ITColor::ITColor((ITColor *)this + 6) = v22;
          *(_OWORD *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = v21;
          *(_OWORD *)(a1 + 4ITColor::ITColor((ITColor *)this + 8) = v20;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 4;
      }
      while (v14 != a3);
      __n128 v13 = a3;
    }
    if (v8 >= 65)
    {
      uint64_t v27 = (unint64_t)v8 >> 6;
      __n128 v28 = (__n128 *)(a2 - 4);
      do
      {
        __n128 v29 = *(__n128 *)(a1 + 16);
        __n128 v43 = *(__n128 *)a1;
        __n128 v44 = v29;
        __n128 v30 = *(__n128 *)(a1 + 48);
        __n128 v45 = *(__n128 *)(a1 + 32);
        __n128 v46 = v30;
        __n128 v31 = (__n128 *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (unsigned int (**)(_OWORD *, _OWORD *))a4, v27);
        if (v28 == v31)
        {
          __n128 v37 = v44;
          *__n128 v31 = v43;
          v31[1] = v37;
          __n128 v38 = v46;
          v31[2] = v45;
          v31[3] = v38;
        }
        else
        {
          __n128 v32 = *v28;
          __n128 v33 = v28[1];
          __n128 v34 = v28[3];
          v31[2] = v28[2];
          v31[3] = v34;
          *__n128 v31 = v32;
          v31[1] = v33;
          __n128 v35 = v44;
          *__n128 v28 = v43;
          v28[1] = v35;
          __n128 v36 = v46;
          v28[2] = v45;
          _OWORD v28[3] = v36;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (uint64_t)&v31[4], a4, ((uint64_t)&v31[4] - a1) >> 6);
        }
        v28 -= 4;
      }
      while (v27-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, unsigned int (**a2)(void, void), uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v56 = v4;
    uint64_t v57 = v5;
    long long v7 = a4;
    int64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= ((uint64_t)a4 - a1) >> 6)
    {
      uint64_t v12 = ((uint64_t)a4 - a1) >> 5;
      uint64_t v13 = v12 + 1;
      __n128 v14 = (__n128 *)(a1 + ((v12 + 1) << 6));
      uint64_t v15 = v12 + 2;
      if (v12 + 2 < a3)
      {
        long long v16 = *a2;
        __n128 v17 = v14[1];
        v55[0] = *v14;
        v55[1] = v17;
        __n128 v18 = v14[3];
        v55[2] = v14[2];
        _OWORD v55[3] = v18;
        __n128 v19 = v14[5];
        v54[0] = v14[4];
        v54[1] = v19;
        __n128 v20 = v14[7];
        v54[2] = v14[6];
        _OWORD v54[3] = v20;
        if (v16(v55, v54))
        {
          v14 += 4;
          uint64_t v13 = v15;
        }
      }
      long long v21 = *a2;
      __n128 v22 = v14[1];
      v53[0] = *v14;
      v53[1] = v22;
      __n128 v23 = v14[3];
      v53[2] = v14[2];
      _OWORD v53[3] = v23;
      __n128 v24 = v7[1];
      v52[0] = *v7;
      v52[1] = v24;
      __n128 v25 = v7[3];
      void v52[2] = v7[2];
      _OWORD v52[3] = v25;
      if ((((uint64_t (*)(_OWORD *, _OWORD *))v21)(v53, v52) & 1) == 0)
      {
        __n128 v27 = v7[1];
        __n128 v48 = *v7;
        __n128 v49 = v27;
        __n128 v28 = v7[3];
        __n128 v50 = v7[2];
        __n128 v51 = v28;
        do
        {
          __n128 v29 = v14;
          __n128 v30 = *v14;
          __n128 v31 = v14[1];
          __n128 v32 = v14[3];
          v7[2] = v14[2];
          v7[3] = v32;
          __n128 *v7 = v30;
          v7[1] = v31;
          if (v9 < v13) {
            break;
          }
          uint64_t v33 = (2 * v13) | 1;
          __n128 v14 = (__n128 *)(a1 + (v33 << 6));
          if (2 * v13 + 2 < a3)
          {
            __n128 v34 = *a2;
            __n128 v35 = v14[1];
            v47[0] = *v14;
            v47[1] = v35;
            __n128 v36 = v14[3];
            v47[2] = v14[2];
            _OWORD v47[3] = v36;
            __n128 v37 = v14[5];
            v46[0] = v14[4];
            v46[1] = v37;
            __n128 v38 = v14[7];
            v46[2] = v14[6];
            _OWORD v46[3] = v38;
            if (v34(v47, v46))
            {
              v14 += 4;
              uint64_t v33 = 2 * v13 + 2;
            }
          }
          __n128 v39 = *a2;
          __n128 v40 = v14[1];
          v45[0] = *v14;
          v45[1] = v40;
          __n128 v41 = v14[3];
          v45[2] = v14[2];
          _OWORD v45[3] = v41;
          v44[0] = v48;
          v44[1] = v49;
          v44[2] = v50;
          _OWORD v44[3] = v51;
          long long v7 = v29;
          uint64_t v13 = v33;
        }
        while (!v39(v45, v44));
        __n128 result = v48;
        __n128 v42 = v49;
        __n128 v43 = v51;
        v29[2] = v50;
        _OWORD v29[3] = v43;
        *__n128 v29 = result;
        v29[1] = v42;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, unsigned int (**a2)(_OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    int64_t v9 = &a1[4 * v6 + 4];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      uint64_t v12 = *a2;
      long long v13 = v9[3];
      long long v15 = *v9;
      long long v14 = v9[1];
      void v24[2] = v9[2];
      _OWORD v24[3] = v13;
      v24[0] = v15;
      v24[1] = v14;
      long long v16 = v9[7];
      long long v18 = v9[4];
      long long v17 = v9[5];
      v23[2] = v9[6];
      _OWORD v23[3] = v16;
      v23[0] = v18;
      v23[1] = v17;
      if (v12(v24, v23))
      {
        v9 += 4;
        uint64_t v10 = v11;
      }
    }
    long long v19 = *v9;
    long long v20 = v9[1];
    long long v21 = v9[3];
    a1[2] = v9[2];
    a1[3] = v21;
    *a1 = v19;
    a1[1] = v20;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(void, void), uint64_t a4)
{
  unint64_t v6 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v39 = v4;
    uint64_t v40 = v5;
    uint64_t v10 = *a3;
    unint64_t v11 = v6 >> 1;
    uint64_t v12 = (_OWORD *)(a1 + (v6 >> 1 << 6));
    long long v13 = v12[1];
    v38[0] = *v12;
    v38[1] = v13;
    long long v14 = v12[3];
    v38[2] = v12[2];
    _OWORD v38[3] = v14;
    long long v15 = *(_OWORD *)(a2 - 48);
    v37[0] = *(_OWORD *)(a2 - 64);
    v37[1] = v15;
    long long v16 = *(_OWORD *)(a2 - 16);
    v37[2] = *(_OWORD *)(a2 - 32);
    _OWORD v37[3] = v16;
    if (v10(v38, v37))
    {
      long long v18 = (_OWORD *)(a2 - 64);
      long long v19 = *(_OWORD *)(a2 - 48);
      long long v33 = *(_OWORD *)(a2 - 64);
      long long v34 = v19;
      long long v20 = *(_OWORD *)(a2 - 16);
      long long v35 = *(_OWORD *)(a2 - 32);
      long long v36 = v20;
      do
      {
        long long v21 = v12;
        long long v22 = *v12;
        long long v23 = v12[1];
        long long v24 = v12[3];
        v18[2] = v12[2];
        v18[3] = v24;
        *long long v18 = v22;
        v18[1] = v23;
        if (!v11) {
          break;
        }
        __n128 v25 = *a3;
        unint64_t v11 = (v11 - 1) >> 1;
        uint64_t v12 = (_OWORD *)(a1 + (v11 << 6));
        long long v26 = v12[1];
        v32[0] = *v12;
        v32[1] = v26;
        long long v27 = v12[3];
        v32[2] = v12[2];
        v32[3] = v27;
        v31[0] = v33;
        v31[1] = v34;
        v31[2] = v35;
        v31[3] = v36;
        char v28 = v25(v32, v31);
        long long v18 = v21;
      }
      while ((v28 & 1) != 0);
      long long v29 = v34;
      *long long v21 = v33;
      v21[1] = v29;
      double result = *(double *)&v35;
      long long v30 = v36;
      v21[2] = v35;
      _OWORD v21[3] = v30;
    }
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(long long *a1, long long *a2, unsigned int (**a3)(void, void), uint64_t a4, char a5)
{
uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t result, long long *a2, uint64_t (**a3)(void, void))
{
  if ((long long *)result != a2)
  {
    uint64_t v38 = v3;
    uint64_t v39 = v4;
    char v6 = (_OWORD *)result;
    uint64_t v7 = (long long *)(result + 64);
    if ((long long *)(result + 64) != a2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = (long long *)result;
      do
      {
        unint64_t v11 = v10;
        uint64_t v10 = v7;
        uint64_t v12 = *a3;
        long long v13 = v10[1];
        v37[0] = *v10;
        v37[1] = v13;
        long long v14 = v10[3];
        v37[2] = v10[2];
        _OWORD v37[3] = v14;
        long long v15 = v11[3];
        long long v17 = *v11;
        long long v16 = v11[1];
        v36[2] = v11[2];
        v36[3] = v15;
        v36[0] = v17;
        v36[1] = v16;
        double result = v12(v37, v36);
        if (result)
        {
          long long v18 = v10[1];
          long long v32 = *v10;
          long long v33 = v18;
          long long v19 = v10[3];
          long long v34 = v10[2];
          long long v35 = v19;
          uint64_t v20 = v9;
          while (1)
          {
            long long v21 = (_OWORD *)((char *)v6 + v20);
            long long v22 = *(_OWORD *)((char *)v6 + v20 + 16);
            v21[4] = *(_OWORD *)((char *)v6 + v20);
            v21[5] = v22;
            long long v23 = *(_OWORD *)((char *)v6 + v20 + 48);
            v21[6] = *(_OWORD *)((char *)v6 + v20 + 32);
            v21[7] = v23;
            if (!v20) {
              break;
            }
            long long v24 = *a3;
            v31[0] = v32;
            v31[1] = v33;
            v31[2] = v34;
            v31[3] = v35;
            long long v25 = *(v21 - 3);
            v30[0] = *(v21 - 4);
            v30[1] = v25;
            long long v26 = *(v21 - 1);
            v30[2] = *(v21 - 2);
            _OWORD v30[3] = v26;
            double result = v24(v31, v30);
            v20 -= 64;
            if ((result & 1) == 0)
            {
              long long v27 = (_OWORD *)((char *)v6 + v20 + 64);
              goto LABEL_10;
            }
          }
          long long v27 = v6;
LABEL_10:
          long long v28 = v33;
          *long long v27 = v32;
          v27[1] = v28;
          long long v29 = v35;
          v27[2] = v34;
          v27[3] = v29;
        }
        uint64_t v7 = v10 + 4;
        v9 += 64;
      }
      while (v10 + 4 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t result, long long *a2, uint64_t (**a3)(void, void))
{
  if ((long long *)result != a2)
  {
    uint64_t v36 = v3;
    uint64_t v37 = v4;
    char v6 = (long long *)result;
    for (uint64_t i = (long long *)(result + 64); v6 + 4 != a2; uint64_t i = v6 + 4)
    {
      uint64_t v9 = v6;
      char v6 = i;
      uint64_t v10 = *a3;
      long long v11 = v6[1];
      v35[0] = *v6;
      v35[1] = v11;
      long long v12 = v6[3];
      v35[2] = v6[2];
      v35[3] = v12;
      long long v13 = v9[3];
      long long v15 = *v9;
      long long v14 = v9[1];
      v34[2] = v9[2];
      _OWORD v34[3] = v13;
      v34[0] = v15;
      v34[1] = v14;
      double result = v10(v35, v34);
      if (result)
      {
        long long v16 = v6[1];
        long long v30 = *v6;
        long long v31 = v16;
        long long v17 = v6[3];
        long long v32 = v6[2];
        long long v33 = v17;
        long long v18 = v6;
        do
        {
          long long v19 = v18 - 4;
          long long v20 = *(v18 - 3);
          *long long v18 = *(v18 - 4);
          v18[1] = v20;
          long long v21 = *(v18 - 1);
          v18[2] = *(v18 - 2);
          v18[3] = v21;
          long long v22 = *a3;
          v29[0] = v30;
          v29[1] = v31;
          v29[2] = v32;
          _OWORD v29[3] = v33;
          long long v23 = *(v18 - 8);
          long long v24 = *(v18 - 7);
          long long v25 = *(v18 - 5);
          v28[2] = *(v18 - 6);
          _OWORD v28[3] = v25;
          v28[0] = v23;
          v28[1] = v24;
          double result = v22(v29, v28);
          long long v18 = v19;
        }
        while ((result & 1) != 0);
        long long v26 = v31;
        *long long v19 = v30;
        v19[1] = v26;
        long long v27 = v33;
        v19[2] = v32;
        v19[3] = v27;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(void, void))
{
  uint64_t v8 = *a4;
  long long v9 = a2[1];
  v80[0] = *a2;
  v80[1] = v9;
  long long v10 = a2[3];
  v80[2] = a2[2];
  v80[3] = v10;
  long long v11 = a1[1];
  v79[0] = *a1;
  v79[1] = v11;
  long long v12 = a1[3];
  v79[2] = a1[2];
  v79[3] = v12;
  char v13 = v8(v80, v79);
  long long v14 = *a4;
  if (v13)
  {
    long long v15 = a3[1];
    v74[0] = *a3;
    v74[1] = v15;
    long long v16 = a3[3];
    v74[2] = a3[2];
    v74[3] = v16;
    long long v17 = a2[1];
    v73[0] = *a2;
    v73[1] = v17;
    long long v18 = a2[3];
    v73[2] = a2[2];
    v73[3] = v18;
    if (v14(v74, v73))
    {
      long long v20 = a1[2];
      long long v19 = a1[3];
      long long v22 = *a1;
      long long v21 = a1[1];
      long long v23 = a3[3];
      long long v25 = *a3;
      long long v24 = a3[1];
      a1[2] = a3[2];
      a1[3] = v23;
      *a1 = v25;
      a1[1] = v24;
      *a3 = v22;
      a3[1] = v21;
      uint64_t result = 1;
LABEL_9:
      a3[2] = v20;
      a3[3] = v19;
      return result;
    }
    long long v53 = a1[2];
    long long v52 = a1[3];
    long long v55 = *a1;
    long long v54 = a1[1];
    long long v56 = a2[3];
    long long v58 = *a2;
    long long v57 = a2[1];
    a1[2] = a2[2];
    a1[3] = v56;
    *a1 = v58;
    a1[1] = v57;
    *a2 = v55;
    a2[1] = v54;
    a2[2] = v53;
    a2[3] = v52;
    long long v59 = *a4;
    long long v60 = *a3;
    long long v61 = a3[1];
    long long v62 = a3[3];
    v72[2] = a3[2];
    v72[3] = v62;
    v72[0] = v60;
    v72[1] = v61;
    long long v63 = *a2;
    long long v64 = a2[1];
    long long v65 = a2[3];
    v71[2] = a2[2];
    v71[3] = v65;
    v71[0] = v63;
    v71[1] = v64;
    if (v59(v72, v71))
    {
      long long v20 = a2[2];
      long long v19 = a2[3];
      long long v67 = *a2;
      long long v66 = a2[1];
      long long v68 = a3[3];
      long long v70 = *a3;
      long long v69 = a3[1];
      a2[2] = a3[2];
      a2[3] = v68;
      *a2 = v70;
      a2[1] = v69;
      *a3 = v67;
      a3[1] = v66;
      uint64_t result = 2;
      goto LABEL_9;
    }
  }
  else
  {
    long long v27 = a3[1];
    v78[0] = *a3;
    v78[1] = v27;
    long long v28 = a3[3];
    v78[2] = a3[2];
    v78[3] = v28;
    long long v29 = a2[1];
    v77[0] = *a2;
    v77[1] = v29;
    long long v30 = a2[3];
    v77[2] = a2[2];
    v77[3] = v30;
    uint64_t result = ((uint64_t (*)(_OWORD *, _OWORD *))v14)(v78, v77);
    if (!result) {
      return result;
    }
    long long v32 = a2[2];
    long long v31 = a2[3];
    long long v34 = *a2;
    long long v33 = a2[1];
    long long v35 = a3[3];
    long long v37 = *a3;
    long long v36 = a3[1];
    a2[2] = a3[2];
    a2[3] = v35;
    *a2 = v37;
    a2[1] = v36;
    *a3 = v34;
    a3[1] = v33;
    a3[2] = v32;
    a3[3] = v31;
    uint64_t v38 = *a4;
    long long v39 = *a2;
    long long v40 = a2[1];
    long long v41 = a2[3];
    v76[2] = a2[2];
    v76[3] = v41;
    v76[0] = v39;
    v76[1] = v40;
    long long v42 = *a1;
    long long v43 = a1[1];
    long long v44 = a1[3];
    v75[2] = a1[2];
    v75[3] = v44;
    v75[0] = v42;
    v75[1] = v43;
    if (v38(v76, v75))
    {
      long long v46 = a1[2];
      long long v45 = a1[3];
      long long v48 = *a1;
      long long v47 = a1[1];
      long long v49 = a2[3];
      long long v51 = *a2;
      long long v50 = a2[1];
      a1[2] = a2[2];
      a1[3] = v49;
      *a1 = v51;
      a1[1] = v50;
      *a2 = v48;
      a2[1] = v47;
      uint64_t result = 2;
      a2[2] = v46;
      a2[3] = v45;
      return result;
    }
  }
  return 1;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(long long *a1, long long *a2, uint64_t (**a3)(void, void))
{
  uint64_t v4 = a2;
  long long v6 = a1[1];
  long long v66 = *a1;
  long long v67 = v6;
  long long v7 = a1[3];
  long long v68 = a1[2];
  long long v69 = v7;
  uint64_t v8 = *a3;
  v65[0] = v66;
  v65[1] = v6;
  v65[2] = v68;
  v65[3] = v7;
  long long v9 = *(a2 - 4);
  long long v10 = *(a2 - 3);
  long long v11 = *(a2 - 1);
  v64[2] = *(a2 - 2);
  v64[3] = v11;
  v64[0] = v9;
  v64[1] = v10;
  if (v8(v65, v64))
  {
    long long v12 = a1;
    do
    {
      char v13 = v12 + 4;
      long long v14 = *a3;
      v63[0] = v66;
      v63[1] = v67;
      v63[2] = v68;
      v63[3] = v69;
      long long v15 = v12[5];
      v62[0] = v12[4];
      v62[1] = v15;
      long long v16 = v12[7];
      v62[2] = v12[6];
      v62[3] = v16;
      char v17 = v14(v63, v62);
      long long v12 = v13;
    }
    while ((v17 & 1) == 0);
  }
  else
  {
    long long v18 = a1 + 4;
    do
    {
      char v13 = v18;
      if (v18 >= v4) {
        break;
      }
      long long v19 = *a3;
      v61[0] = v66;
      v61[1] = v67;
      v61[2] = v68;
      v61[3] = v69;
      long long v20 = v13[1];
      v60[0] = *v13;
      v60[1] = v20;
      long long v21 = v13[3];
      v60[2] = v13[2];
      v60[3] = v21;
      int v22 = v19(v61, v60);
      long long v18 = v13 + 4;
    }
    while (!v22);
  }
  if (v13 >= v4)
  {
    long long v23 = v4;
  }
  else
  {
    do
    {
      long long v23 = v4 - 4;
      long long v24 = *a3;
      v59[0] = v66;
      v59[1] = v67;
      v59[2] = v68;
      _OWORD v59[3] = v69;
      long long v25 = *(v4 - 3);
      v58[0] = *(v4 - 4);
      v58[1] = v25;
      long long v26 = *(v4 - 1);
      v58[2] = *(v4 - 2);
      _OWORD v58[3] = v26;
      v4 -= 4;
    }
    while ((v24(v59, v58) & 1) != 0);
  }
  while (v13 < v23)
  {
    long long v27 = *v13;
    long long v28 = v13[1];
    long long v29 = v13[3];
    long long v72 = v13[2];
    long long v73 = v29;
    long long v70 = v27;
    long long v71 = v28;
    long long v30 = *v23;
    long long v31 = v23[1];
    long long v32 = v23[3];
    v13[2] = v23[2];
    v13[3] = v32;
    long long *v13 = v30;
    v13[1] = v31;
    long long v33 = v70;
    long long v34 = v71;
    long long v35 = v73;
    v23[2] = v72;
    _OWORD v23[3] = v35;
    *long long v23 = v33;
    v23[1] = v34;
    do
    {
      v57[0] = v66;
      v57[1] = v67;
      v57[2] = v68;
      _OWORD v57[3] = v69;
      long long v36 = v13[6];
      long long v37 = v13[7];
      long long v39 = v13[4];
      long long v38 = v13[5];
      v13 += 4;
      long long v40 = (unsigned int (*)(void, void))*a3;
      v56[2] = v36;
      _OWORD v56[3] = v37;
      v56[0] = v39;
      v56[1] = v38;
    }
    while (!v40(v57, v56));
    do
    {
      v55[0] = v66;
      v55[1] = v67;
      v55[2] = v68;
      _OWORD v55[3] = v69;
      long long v41 = *(v23 - 2);
      long long v42 = *(v23 - 1);
      long long v44 = *(v23 - 4);
      long long v43 = *(v23 - 3);
      v23 -= 4;
      long long v45 = *a3;
      v54[2] = v41;
      _OWORD v54[3] = v42;
      v54[0] = v44;
      v54[1] = v43;
    }
    while ((v45(v55, v54) & 1) != 0);
  }
  long long v46 = v13 - 4;
  if (v13 - 4 != a1)
  {
    long long v47 = *v46;
    long long v48 = *(v13 - 3);
    long long v49 = *(v13 - 1);
    a1[2] = *(v13 - 2);
    a1[3] = v49;
    *a1 = v47;
    a1[1] = v48;
  }
  long long v50 = v66;
  long long v51 = v67;
  long long v52 = v69;
  *(v13 - ITColor::ITColor((ITColor *)this + 2) = v68;
  *(v13 - ITColor::ITColor((ITColor *)this + 1) = v52;
  *long long v46 = v50;
  *(v13 - ITColor::ITColor((ITColor *)this + 3) = v51;
  return v13;
}

long long *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(long long *a1, long long *a2, uint64_t (**a3)(void, void))
{
  uint64_t v6 = 0;
  long long v7 = a1[1];
  long long v57 = *a1;
  long long v58 = v7;
  long long v8 = a1[3];
  long long v59 = a1[2];
  long long v60 = v8;
  do
  {
    long long v9 = *a3;
    long long v10 = a1[v6 + 5];
    v56[0] = a1[v6 + 4];
    v56[1] = v10;
    long long v11 = a1[v6 + 7];
    v56[2] = a1[v6 + 6];
    _OWORD v56[3] = v11;
    v55[0] = v57;
    v55[1] = v58;
    v55[2] = v59;
    _OWORD v55[3] = v60;
    v6 += 4;
  }
  while ((v9(v56, v55) & 1) != 0);
  long long v12 = &a1[v6];
  char v13 = &a1[v6 - 4];
  if (v6 == 4)
  {
    while (v12 < a2)
    {
      long long v18 = *a3;
      long long v14 = a2 - 4;
      long long v19 = *(a2 - 3);
      v54[0] = *(a2 - 4);
      v54[1] = v19;
      long long v20 = *(a2 - 1);
      v54[2] = *(a2 - 2);
      _OWORD v54[3] = v20;
      v53[0] = v57;
      v53[1] = v58;
      v53[2] = v59;
      _OWORD v53[3] = v60;
      a2 -= 4;
      if (v18(v54, v53)) {
        goto LABEL_9;
      }
    }
    long long v14 = a2;
  }
  else
  {
    do
    {
      long long v14 = a2 - 4;
      long long v15 = (unsigned int (*)(void, void))*a3;
      long long v16 = *(a2 - 3);
      v52[0] = *(a2 - 4);
      v52[1] = v16;
      long long v17 = *(a2 - 1);
      void v52[2] = *(a2 - 2);
      _OWORD v52[3] = v17;
      v51[0] = v57;
      v51[1] = v58;
      v51[2] = v59;
      _OWORD v51[3] = v60;
      a2 -= 4;
    }
    while (!v15(v52, v51));
  }
LABEL_9:
  if (v12 < v14)
  {
    long long v21 = v12;
    int v22 = v14;
    do
    {
      long long v24 = v21[1];
      long long v61 = *v21;
      long long v23 = v61;
      long long v62 = v24;
      long long v26 = v21[3];
      long long v63 = v21[2];
      long long v25 = v63;
      long long v64 = v26;
      long long v28 = v22[2];
      long long v27 = v22[3];
      long long v29 = v22[1];
      *long long v21 = *v22;
      v21[1] = v29;
      v21[2] = v28;
      _OWORD v21[3] = v27;
      v22[2] = v25;
      v22[3] = v26;
      *int v22 = v23;
      v22[1] = v24;
      do
      {
        long long v30 = v21[6];
        long long v31 = v21[7];
        long long v33 = v21[4];
        long long v32 = v21[5];
        v21 += 4;
        long long v34 = *a3;
        v50[2] = v30;
        _OWORD v50[3] = v31;
        v50[0] = v33;
        v50[1] = v32;
        v49[0] = v57;
        v49[1] = v58;
        v49[2] = v59;
        _OWORD v49[3] = v60;
      }
      while ((v34(v50, v49) & 1) != 0);
      do
      {
        long long v35 = *(v22 - 2);
        long long v36 = *(v22 - 1);
        long long v38 = *(v22 - 4);
        long long v37 = *(v22 - 3);
        v22 -= 4;
        long long v39 = (unsigned int (*)(void, void))*a3;
        v48[2] = v35;
        _OWORD v48[3] = v36;
        v48[0] = v38;
        v48[1] = v37;
        v47[0] = v57;
        v47[1] = v58;
        v47[2] = v59;
        _OWORD v47[3] = v60;
      }
      while (!v39(v48, v47));
    }
    while (v21 < v22);
    char v13 = v21 - 4;
  }
  if (v13 != a1)
  {
    long long v40 = *v13;
    long long v41 = v13[1];
    long long v42 = v13[3];
    a1[2] = v13[2];
    a1[3] = v42;
    *a1 = v40;
    a1[1] = v41;
  }
  long long v43 = v57;
  long long v44 = v58;
  long long v45 = v60;
  v13[2] = v59;
  v13[3] = v45;
  long long *v13 = v43;
  v13[1] = v44;
  return v13;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, unsigned int (**a3)(void, void))
{
  uint64_t v6 = ((uint64_t)a2 - a1) >> 6;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      long long v8 = *a3;
      __n128 v9 = a2[-3];
      v52[0] = a2[-4];
      v52[1] = v9;
      __n128 v10 = a2[-1];
      void v52[2] = a2[-2];
      _OWORD v52[3] = v10;
      long long v11 = *(_OWORD *)(a1 + 16);
      v51[0] = *(_OWORD *)a1;
      v51[1] = v11;
      long long v12 = *(_OWORD *)(a1 + 48);
      v51[2] = *(_OWORD *)(a1 + 32);
      _OWORD v51[3] = v12;
      if (!v8(v52, v51)) {
        return 1;
      }
      char v13 = a2 - 4;
      __n128 v15 = *(__n128 *)(a1 + 32);
      __n128 v14 = *(__n128 *)(a1 + 48);
      __n128 v17 = *(__n128 *)a1;
      __n128 v16 = *(__n128 *)(a1 + 16);
      __n128 v18 = a2[-1];
      __n128 v20 = a2[-4];
      __n128 v19 = a2[-3];
      *(__n128 *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = a2[-2];
      *(__n128 *)(a1 + 4ITColor::ITColor((ITColor *)this + 8) = v18;
      *(__n128 *)a1 = v20;
      *(__n128 *)(a1 + 1ITColor::ITColor((ITColor *)this + 6) = v19;
      __n128 *v13 = v17;
      v13[1] = v16;
      BOOL result = 1;
      v13[2] = v15;
      v13[3] = v14;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (__n128 *)a2[-4].n128_u64, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), a2 - 4, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), a2 - 4, a3);
      return 1;
    default:
      long long v21 = (__n128 *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (_OWORD *)(a1 + 128), a3);
      int v22 = (__n128 *)(a1 + 192);
      if ((__n128 *)(a1 + 192) == a2) {
        return 1;
      }
      uint64_t v23 = 0;
      int v24 = 0;
      break;
  }
  while (1)
  {
    long long v25 = *a3;
    __n128 v26 = v22[1];
    v50[0] = *v22;
    v50[1] = v26;
    __n128 v27 = v22[3];
    v50[2] = v22[2];
    _OWORD v50[3] = v27;
    __n128 v28 = v21[3];
    __n128 v30 = *v21;
    __n128 v29 = v21[1];
    v49[2] = v21[2];
    _OWORD v49[3] = v28;
    v49[0] = v30;
    v49[1] = v29;
    if (v25(v50, v49))
    {
      __n128 v31 = v22[1];
      __n128 v45 = *v22;
      __n128 v46 = v31;
      __n128 v32 = v22[3];
      __n128 v47 = v22[2];
      __n128 v48 = v32;
      uint64_t v33 = v23;
      while (1)
      {
        long long v34 = (_OWORD *)(a1 + v33);
        long long v35 = *(_OWORD *)(a1 + v33 + 144);
        v34[12] = *(_OWORD *)(a1 + v33 + 128);
        v34[13] = v35;
        long long v36 = *(_OWORD *)(a1 + v33 + 176);
        v34[14] = *(_OWORD *)(a1 + v33 + 160);
        v34[15] = v36;
        if (v33 == -128) {
          break;
        }
        long long v37 = *a3;
        v44[0] = v45;
        v44[1] = v46;
        v44[2] = v47;
        _OWORD v44[3] = v48;
        long long v38 = v34[5];
        v43[0] = v34[4];
        v43[1] = v38;
        long long v39 = v34[7];
        v43[2] = v34[6];
        _OWORD v43[3] = v39;
        v33 -= 64;
        if ((((uint64_t (*)(_OWORD *, _OWORD *))v37)(v44, v43) & 1) == 0)
        {
          long long v40 = (_OWORD *)(a1 + v33 + 192);
          goto LABEL_12;
        }
      }
      long long v40 = (_OWORD *)a1;
LABEL_12:
      __n128 v41 = v46;
      *long long v40 = v45;
      v40[1] = v41;
      __n128 v42 = v48;
      v40[2] = v47;
      _OWORD v40[3] = v42;
      if (++v24 == 8) {
        return &v22[4] == a2;
      }
    }
    long long v21 = v22;
    v23 += 64;
    v22 += 4;
    if (v22 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, unsigned int (**a5)(void, void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a2, a3, a5);
  __n128 v10 = *a5;
  __n128 v11 = a4[1];
  v55[0] = *a4;
  v55[1] = v11;
  __n128 v12 = a4[3];
  v55[2] = a4[2];
  _OWORD v55[3] = v12;
  __n128 v13 = a3[1];
  v54[0] = *a3;
  v54[1] = v13;
  __n128 v14 = a3[3];
  v54[2] = a3[2];
  _OWORD v54[3] = v14;
  if (v10(v55, v54))
  {
    __n128 v17 = a3[2];
    __n128 v16 = a3[3];
    __n128 v19 = *a3;
    __n128 v18 = a3[1];
    __n128 v20 = a4[3];
    __n128 v22 = *a4;
    __n128 v21 = a4[1];
    a3[2] = a4[2];
    a3[3] = v20;
    *a3 = v22;
    a3[1] = v21;
    *a4 = v19;
    a4[1] = v18;
    a4[2] = v17;
    a4[3] = v16;
    uint64_t v23 = *a5;
    __n128 v24 = *a3;
    __n128 v25 = a3[1];
    __n128 v26 = a3[3];
    v53[2] = a3[2];
    _OWORD v53[3] = v26;
    v53[0] = v24;
    v53[1] = v25;
    __n128 v27 = *a2;
    __n128 v28 = a2[1];
    __n128 v29 = a2[3];
    void v52[2] = a2[2];
    _OWORD v52[3] = v29;
    v52[0] = v27;
    v52[1] = v28;
    if (v23(v53, v52))
    {
      __n128 v31 = a2[2];
      __n128 v30 = a2[3];
      __n128 v33 = *a2;
      __n128 v32 = a2[1];
      __n128 v34 = a3[3];
      __n128 v36 = *a3;
      __n128 v35 = a3[1];
      a2[2] = a3[2];
      a2[3] = v34;
      *a2 = v36;
      a2[1] = v35;
      *a3 = v33;
      a3[1] = v32;
      a3[2] = v31;
      a3[3] = v30;
      long long v37 = *a5;
      __n128 v38 = *a2;
      __n128 v39 = a2[1];
      __n128 v40 = a2[3];
      v51[2] = a2[2];
      _OWORD v51[3] = v40;
      v51[0] = v38;
      v51[1] = v39;
      __n128 v41 = *a1;
      __n128 v42 = a1[1];
      __n128 v43 = a1[3];
      v50[2] = a1[2];
      _OWORD v50[3] = v43;
      v50[0] = v41;
      v50[1] = v42;
      if (v37(v51, v50))
      {
        __n128 v44 = a1[2];
        __n128 result = a1[3];
        __n128 v46 = *a1;
        __n128 v45 = a1[1];
        __n128 v47 = a2[3];
        __n128 v49 = *a2;
        __n128 v48 = a2[1];
        a1[2] = a2[2];
        a1[3] = v47;
        *a1 = v49;
        a1[1] = v48;
        *a2 = v46;
        a2[1] = v45;
        a2[2] = v44;
        a2[3] = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, unsigned int (**a6)(void, void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  __n128 v12 = *a6;
  __n128 v13 = a5[1];
  v73[0] = *a5;
  v73[1] = v13;
  __n128 v14 = a5[3];
  v73[2] = a5[2];
  v73[3] = v14;
  __n128 v15 = a4[1];
  v72[0] = *a4;
  v72[1] = v15;
  __n128 v16 = a4[3];
  v72[2] = a4[2];
  v72[3] = v16;
  if (v12(v73, v72))
  {
    __n128 v19 = a4[2];
    __n128 v18 = a4[3];
    __n128 v21 = *a4;
    __n128 v20 = a4[1];
    __n128 v22 = a5[3];
    __n128 v24 = *a5;
    __n128 v23 = a5[1];
    a4[2] = a5[2];
    a4[3] = v22;
    *a4 = v24;
    a4[1] = v23;
    *a5 = v21;
    a5[1] = v20;
    a5[2] = v19;
    a5[3] = v18;
    __n128 v25 = *a6;
    __n128 v26 = *a4;
    __n128 v27 = a4[1];
    __n128 v28 = a4[3];
    v71[2] = a4[2];
    v71[3] = v28;
    v71[0] = v26;
    v71[1] = v27;
    __n128 v29 = *a3;
    __n128 v30 = a3[1];
    __n128 v31 = a3[3];
    v70[2] = a3[2];
    v70[3] = v31;
    v70[0] = v29;
    v70[1] = v30;
    if (v25(v71, v70))
    {
      __n128 v33 = a3[2];
      __n128 v32 = a3[3];
      __n128 v35 = *a3;
      __n128 v34 = a3[1];
      __n128 v36 = a4[3];
      __n128 v38 = *a4;
      __n128 v37 = a4[1];
      a3[2] = a4[2];
      a3[3] = v36;
      *a3 = v38;
      a3[1] = v37;
      *a4 = v35;
      a4[1] = v34;
      a4[2] = v33;
      a4[3] = v32;
      __n128 v39 = *a6;
      __n128 v40 = *a3;
      __n128 v41 = a3[1];
      __n128 v42 = a3[3];
      v69[2] = a3[2];
      v69[3] = v42;
      v69[0] = v40;
      v69[1] = v41;
      __n128 v43 = *a2;
      __n128 v44 = a2[1];
      __n128 v45 = a2[3];
      v68[2] = a2[2];
      v68[3] = v45;
      v68[0] = v43;
      v68[1] = v44;
      if (v39(v69, v68))
      {
        __n128 v47 = a2[2];
        __n128 v46 = a2[3];
        __n128 v49 = *a2;
        __n128 v48 = a2[1];
        __n128 v50 = a3[3];
        __n128 v52 = *a3;
        __n128 v51 = a3[1];
        a2[2] = a3[2];
        a2[3] = v50;
        *a2 = v52;
        a2[1] = v51;
        *a3 = v49;
        a3[1] = v48;
        a3[2] = v47;
        a3[3] = v46;
        long long v53 = *a6;
        __n128 v54 = *a2;
        __n128 v55 = a2[1];
        __n128 v56 = a2[3];
        v67[2] = a2[2];
        v67[3] = v56;
        v67[0] = v54;
        v67[1] = v55;
        __n128 v57 = *(__n128 *)a1;
        long long v58 = *(_OWORD *)(a1 + 16);
        long long v59 = *(_OWORD *)(a1 + 48);
        v66[2] = *(_OWORD *)(a1 + 32);
        v66[3] = v59;
        v66[0] = v57;
        v66[1] = v58;
        if (v53(v67, v66))
        {
          __n128 v60 = *(__n128 *)(a1 + 32);
          __n128 result = *(__n128 *)(a1 + 48);
          __n128 v62 = *(__n128 *)a1;
          __n128 v61 = *(__n128 *)(a1 + 16);
          __n128 v63 = a2[3];
          __n128 v65 = *a2;
          __n128 v64 = a2[1];
          *(__n128 *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = a2[2];
          *(__n128 *)(a1 + 4ITColor::ITColor((ITColor *)this + 8) = v63;
          *(__n128 *)a1 = v65;
          *(__n128 *)(a1 + 1ITColor::ITColor((ITColor *)this + 6) = v64;
          *a2 = v62;
          a2[1] = v61;
          a2[2] = v60;
          a2[3] = result;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t SUUIAccountsFramework()
{
  if (SUUIAccountsFramework_sOnce != -1) {
    dispatch_once(&SUUIAccountsFramework_sOnce, &__block_literal_global_25);
  }
  return SUUIAccountsFramework_sHandle;
}

void *__SUUIAccountsFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 1);
  SUUIAccountsFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIAccountsUIFramework()
{
  if (SUUIAccountsUIFramework_sOnce != -1) {
    dispatch_once(&SUUIAccountsUIFramework_sOnce, &__block_literal_global_3);
  }
  return SUUIAccountsUIFramework_sHandle;
}

void *__SUUIAccountsUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI", 1);
  SUUIAccountsUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIAppleAccountFramework()
{
  if (SUUIAppleAccountFramework_sOnce != -1) {
    dispatch_once(&SUUIAppleAccountFramework_sOnce, &__block_literal_global_6);
  }
  return SUUIAppleAccountFramework_sHandle;
}

void *__SUUIAppleAccountFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 1);
  SUUIAppleAccountFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIAppleAccountUIFramework()
{
  if (SUUIAppleAccountUIFramework_sOnce != -1) {
    dispatch_once(&SUUIAppleAccountUIFramework_sOnce, &__block_literal_global_9_0);
  }
  return SUUIAppleAccountUIFramework_sHandle;
}

void *__SUUIAppleAccountUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 1);
  SUUIAppleAccountUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIAskPermissionFramework()
{
  if (SUUIAskPermissionFramework_sOnce != -1) {
    dispatch_once(&SUUIAskPermissionFramework_sOnce, &__block_literal_global_12_0);
  }
  return SUUIAskPermissionFramework_sHandle;
}

void *__SUUIAskPermissionFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AskPermission.framework/AskPermission", 1);
  SUUIAskPermissionFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIAudioToolboxFramework()
{
  if (SUUIAudioToolboxFramework_sOnce != -1) {
    dispatch_once(&SUUIAudioToolboxFramework_sOnce, &__block_literal_global_15);
  }
  return SUUIAudioToolboxFramework_sHandle;
}

void *__SUUIAudioToolboxFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 1);
  SUUIAudioToolboxFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIAVFoundationFramework()
{
  if (SUUIAVFoundationFramework_sOnce != -1) {
    dispatch_once(&SUUIAVFoundationFramework_sOnce, &__block_literal_global_18);
  }
  return SUUIAVFoundationFramework_sHandle;
}

void *__SUUIAVFoundationFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  SUUIAVFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIContactsAutocompleteUIFramework()
{
  if (SUUIContactsAutocompleteUIFramework_sOnce != -1) {
    dispatch_once(&SUUIContactsAutocompleteUIFramework_sOnce, &__block_literal_global_21);
  }
  return SUUIContactsAutocompleteUIFramework_sHandle;
}

void *__SUUIContactsAutocompleteUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/ContactsAutocompleteUI.framework/ContactsAutocompleteUI", 1);
  SUUIContactsAutocompleteUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIContactsFramework()
{
  if (SUUIContactsFramework_sOnce != -1) {
    dispatch_once(&SUUIContactsFramework_sOnce, &__block_literal_global_24);
  }
  return SUUIContactsFramework_sHandle;
}

void *__SUUIContactsFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/Contacts.framework/Contacts", 1);
  SUUIContactsFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIContactsUIFramework()
{
  if (SUUIContactsUIFramework_sOnce != -1) {
    dispatch_once(&SUUIContactsUIFramework_sOnce, &__block_literal_global_27);
  }
  return SUUIContactsUIFramework_sHandle;
}

void *__SUUIContactsUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 1);
  SUUIContactsUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUICoreImageFramework()
{
  if (SUUICoreImageFramework_sOnce != -1) {
    dispatch_once(&SUUICoreImageFramework_sOnce, &__block_literal_global_30);
  }
  return SUUICoreImageFramework_sHandle;
}

void *__SUUICoreImageFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 1);
  SUUICoreImageFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUICoreTelephonyFramework()
{
  if (SUUICoreTelephonyFramework_sOnce != -1) {
    dispatch_once(&SUUICoreTelephonyFramework_sOnce, &__block_literal_global_33);
  }
  return SUUICoreTelephonyFramework_sHandle;
}

void *__SUUICoreTelephonyFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
  SUUICoreTelephonyFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIFamilyCircleFramework()
{
  if (SUUIFamilyCircleFramework_sOnce != -1) {
    dispatch_once(&SUUIFamilyCircleFramework_sOnce, &__block_literal_global_36);
  }
  return SUUIFamilyCircleFramework_sHandle;
}

void *__SUUIFamilyCircleFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 1);
  SUUIFamilyCircleFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIIAdFramework()
{
  if (SUUIIAdFramework_sOnce != -1) {
    dispatch_once(&SUUIIAdFramework_sOnce, &__block_literal_global_39);
  }
  return SUUIIAdFramework_sHandle;
}

void *__SUUIIAdFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/iAd.framework/iAd", 1);
  SUUIIAdFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIMediaPlayerFramework()
{
  if (SUUIMediaPlayerFramework_sOnce != -1) {
    dispatch_once(&SUUIMediaPlayerFramework_sOnce, &__block_literal_global_42);
  }
  return SUUIMediaPlayerFramework_sHandle;
}

void *__SUUIMediaPlayerFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer", 1);
  SUUIMediaPlayerFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIMediaPlayerUIFramework()
{
  if (SUUIMediaPlayerUIFramework_sOnce != -1) {
    dispatch_once(&SUUIMediaPlayerUIFramework_sOnce, &__block_literal_global_45);
  }
  return SUUIMediaPlayerUIFramework_sHandle;
}

void *__SUUIMediaPlayerUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/MediaPlayerUI.framework/MediaPlayerUI", 1);
  SUUIMediaPlayerUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIMobileCoreServicesFramework()
{
  if (SUUIMobileCoreServicesFramework_sOnce != -1) {
    dispatch_once(&SUUIMobileCoreServicesFramework_sOnce, &__block_literal_global_48);
  }
  return SUUIMobileCoreServicesFramework_sHandle;
}

void *__SUUIMobileCoreServicesFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  SUUIMobileCoreServicesFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIMPUFoundationFramework()
{
  if (SUUIMPUFoundationFramework_sOnce != -1) {
    dispatch_once(&SUUIMPUFoundationFramework_sOnce, &__block_literal_global_51);
  }
  return SUUIMPUFoundationFramework_sHandle;
}

void *__SUUIMPUFoundationFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/MPUFoundation.framework/MPUFoundation", 1);
  SUUIMPUFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIPassKitCoreFramework()
{
  if (SUUIPassKitCoreFramework_sOnce != -1) {
    dispatch_once(&SUUIPassKitCoreFramework_sOnce, &__block_literal_global_54);
  }
  return SUUIPassKitCoreFramework_sHandle;
}

void *__SUUIPassKitCoreFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/PassKitCore.framework/PassKitCore", 1);
  SUUIPassKitCoreFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIPassKitUIFramework()
{
  if (SUUIPassKitUIFramework_sOnce != -1) {
    dispatch_once(&SUUIPassKitUIFramework_sOnce, &__block_literal_global_57);
  }
  return SUUIPassKitUIFramework_sHandle;
}

void *__SUUIPassKitUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/PassKitUI.framework/PassKitUI", 1);
  SUUIPassKitUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIPhysicsKitFramework()
{
  if (SUUIPhysicsKitFramework_sOnce != -1) {
    dispatch_once(&SUUIPhysicsKitFramework_sOnce, &__block_literal_global_60);
  }
  return SUUIPhysicsKitFramework_sHandle;
}

void *__SUUIPhysicsKitFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/PhysicsKit.framework/PhysicsKit", 1);
  SUUIPhysicsKitFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUISocialFramework()
{
  if (SUUISocialFramework_sOnce != -1) {
    dispatch_once(&SUUISocialFramework_sOnce, &__block_literal_global_63);
  }
  return SUUISocialFramework_sHandle;
}

void *__SUUISocialFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  SUUISocialFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUISpringBoardServicesFramework()
{
  if (SUUISpringBoardServicesFramework_sOnce != -1) {
    dispatch_once(&SUUISpringBoardServicesFramework_sOnce, &__block_literal_global_66);
  }
  return SUUISpringBoardServicesFramework_sHandle;
}

void *__SUUISpringBoardServicesFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 1);
  SUUISpringBoardServicesFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIWebCoreFramework()
{
  if (SUUIWebCoreFramework_sOnce != -1) {
    dispatch_once(&SUUIWebCoreFramework_sOnce, &__block_literal_global_69);
  }
  return SUUIWebCoreFramework_sHandle;
}

void *__SUUIWebCoreFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/WebCore.framework/WebCore", 1);
  SUUIWebCoreFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIImageIOFramework()
{
  if (SUUIImageIOFramework_sOnce != -1) {
    dispatch_once(&SUUIImageIOFramework_sOnce, &__block_literal_global_72);
  }
  return SUUIImageIOFramework_sHandle;
}

void *__SUUIImageIOFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  SUUIImageIOFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUICoreLocationFramework()
{
  if (SUUICoreLocationFramework_sOnce != -1) {
    dispatch_once(&SUUICoreLocationFramework_sOnce, &__block_literal_global_75);
  }
  return SUUICoreLocationFramework_sHandle;
}

void *__SUUICoreLocationFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 1);
  SUUICoreLocationFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUICoreMediaFramework()
{
  if (SUUICoreMediaFramework_sOnce != -1) {
    dispatch_once(&SUUICoreMediaFramework_sOnce, &__block_literal_global_78);
  }
  return SUUICoreMediaFramework_sHandle;
}

void *__SUUICoreMediaFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 1);
  SUUICoreMediaFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUICelestialFramework()
{
  if (SUUICelestialFramework_sOnce != -1) {
    dispatch_once(&SUUICelestialFramework_sOnce, &__block_literal_global_81);
  }
  return SUUICelestialFramework_sHandle;
}

void *__SUUICelestialFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 1);
  SUUICelestialFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SUUIVideoSubscriberAccountFramework()
{
  if (SUUIVideoSubscriberAccountFramework_sOnce != -1) {
    dispatch_once(&SUUIVideoSubscriberAccountFramework_sOnce, &__block_literal_global_84);
  }
  return SUUIVideoSubscriberAccountFramework_sHandle;
}

void *__SUUIVideoSubscriberAccountFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/VideoSubscriberAccount.framework/VideoSubscriberAccount", 1);
  SUUIVideoSubscriberAccountFramework_sHandle = (uint64_t)result;
  return result;
}

void *SUUIWeakLinkedSymbolForString(char *__symbol, void *__handle)
{
  if (__handle) {
    return dlsym(__handle, __symbol);
  }
  else {
    return 0;
  }
}

id SUUIWeakLinkedClassForString(NSString *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = NSClassFromString(a1);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_2566D2D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
}

void sub_2566D40D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566DE094(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2566DE8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566DEF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566DF3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __RequestImage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = [v3 resourceName];
  uint64_t v6 = v5;
  if (!v5)
  {
    __n128 v9 = [v4 requestIdentifierForViewElement:v3];
    if (v9)
    {
      __n128 v11 = [v4 resourceLoader];
      long long v7 = objc_msgSend(v11, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));

      if (v7)
      {
        __n128 v12 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      __n128 v14 = [v4 transientRequestIdentifierForViewElement:v3];
      if (v14)
      {
        __n128 v15 = [v4 resourceLoader];
        long long v7 = objc_msgSend(v15, "cachedResourceForRequestIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));
      }
      else
      {
        long long v7 = 0;
      }
      __n128 v12 = [v4 dataConsumerForImageElement:v3];
      [v4 loadImageForImageElement:v3 reason:1 dataConsumer:v12];

      if (v7) {
        goto LABEL_20;
      }
      if (v12) {
        goto LABEL_16;
      }
    }
    __n128 v12 = [v4 dataConsumerForImageElement:v3];
LABEL_16:
    [v4 loadImageForImageElement:v3 reason:1 dataConsumer:v12];
    __n128 v16 = [v3 style];
    __n128 v17 = [v16 imageTreatment];
    uint64_t v18 = SUUIImageTreatmentForString(v17);

    if (v18 == 7 || ![v12 isImagePlaceholderAvailable])
    {
      long long v7 = [v4 placeholderImageForImageElement:v3 dataConsumer:v12];
    }
    else
    {
      __n128 v19 = [v3 style];
      __n128 v20 = [v19 imagePlaceholderBackgroundColor];
      __n128 v21 = [v20 color];

      long long v7 = [v12 imagePlaceholderForColor:v21];
    }
    goto LABEL_20;
  }
  long long v7 = SUUIImageWithResourceName(v5);
  long long v8 = [v3 style];
  __n128 v9 = [v8 imageMaskColor];

  if (!v9) {
    goto LABEL_21;
  }
  __n128 v10 = [v9 color];

  if (v10) {
    [v9 color];
  }
  else {
  __n128 v12 = [v4 tintColor];
  }
  uint64_t v13 = [v7 _flatImageWithColor:v12];

  long long v7 = (void *)v13;
LABEL_20:

LABEL_21:
  return v7;
}

id SUUIVideoPreviewPlayPlayableVideoWithAsset(void *a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v5;
  __n128 v9 = [v6 contentURL];
  if (!v9)
  {
    __n128 v19 = 0;
    goto LABEL_14;
  }
  __n128 v10 = (void *)SUUIAVFoundationFramework();
  id v11 = *(id *)SUUIWeakLinkedSymbolForString("AVURLAssetInheritURIQueryComponentFromReferencingURIKey", v10);
  v40.value = (CMTimeValue)v11;
  v41.value = MEMORY[0x263EFFA88];
  __n128 v12 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  if (v8 && [v8 kind])
  {
    uint64_t v13 = (void *)SUUIAVFoundationFramework();
    id v14 = *(id *)SUUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationOptionsKey", v13);
    __n128 v15 = (void *)SUUIAVFoundationFramework();
    id v16 = *(id *)SUUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationServiceIdentifierKey", v15);
    uint64_t v17 = [v8 kind];
    if (v17 == 1)
    {
      id v37 = v7;
      uint64_t v18 = @"com.apple.itunesstore.movies.preview.cloud";
    }
    else
    {
      if (v17 != 2)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v37 = v7;
      uint64_t v18 = @"com.apple.itunesstore.tvshows.preview.cloud";
    }
    __n128 v20 = (void *)[v12 mutableCopy];
    id v38 = v16;
    __n128 v39 = v18;
    __n128 v21 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [v20 setObject:v21 forKey:v14];
    uint64_t v22 = [v20 copy];

    __n128 v12 = (void *)v22;
    id v7 = v37;
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v23 = SUUIAVFoundationFramework();
  __n128 v19 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Avurlasset.isa, v23)), "initWithURL:options:", v9, v12);
  __n128 v24 = +[SUUIStoreAssetResourceLoaderDelegate storeAssetResourceLoaderDelegateForPlayableAsset:v6 clientContext:v7];
  if (v24)
  {
    __n128 v25 = [v19 resourceLoader];
    SUUIStoreAssetResourceLoaderConfigureWithDelegate(v25, v24);
  }
LABEL_14:

  if (v19)
  {
    __n128 v26 = (void *)[objc_alloc(MEMORY[0x263EFA800]) initWithAsset:v19];
    __n128 v27 = (void *)[objc_alloc(MEMORY[0x263EFA7F0]) initWithPlayerItem:v26];
    id v28 = objc_alloc_init(MEMORY[0x263EFA9C8]);
    [v28 setPlayer:v27];
    [v28 setExitsFullScreenWhenPlaybackEnds:1];
    id v29 = v6;
    id v30 = v27;
    [v29 initialPlaybackTime];
    memset(&v41, 0, sizeof(v41));
    CMTimeMakeWithSeconds(&v41, v31, 1000000);
    CMTime v40 = v41;
    [v30 seekToTime:&v40];
    __n128 v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 postNotificationName:@"SUUIVideoPreviewDidStartNotification" object:0];

    uint64_t v33 = [v29 storeItemIdentifier];
    SUUIVideoPreviewObservePlayer(v30, v33);
    __n128 v34 = [MEMORY[0x263F895C8] sessionManager];
    id v35 = (id)[v34 stopAllAudioPlayerSessions];

    [v30 play];
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

id SUUIVideoPreviewPlayPlayableAsset(void *a1, void *a2)
{
  return SUUIVideoPreviewPlayPlayableVideoWithAsset(0, a1, a2);
}

void SUUIVideoPreviewDismissOnEnterBackground(void *a1)
{
  v16[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = objc_getAssociatedObject(v1, "com.apple.iTunesStoreUI.MoviePlayer.BackgroundObserver");

  if (!v2)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    objc_initWeak(&location, v1);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __SUUIVideoPreviewDismissOnEnterBackground_block_invoke;
    aBlock[3] = &unk_265405860;
    objc_copyWeak(&v14, &location);
    id v4 = _Block_copy(aBlock);
    id v5 = [MEMORY[0x263F82438] sharedApplication];
    id v6 = [MEMORY[0x263F08A48] mainQueue];
    id v7 = [v3 addObserverForName:*MEMORY[0x263F83330] object:v5 queue:v6 usingBlock:v4];

    id v8 = [MEMORY[0x263F08A48] mainQueue];
    __n128 v9 = [v3 addObserverForName:@"SUUIVideoPreviewDismissNotification" object:0 queue:v8 usingBlock:v4];

    __n128 v10 = [_SUUIVideoPreviewNotificationObserver alloc];
    v16[0] = v7;
    v16[1] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    __n128 v12 = [(_SUUIVideoPreviewNotificationObserver *)v10 initWithObservers:v11];

    objc_setAssociatedObject(v1, "com.apple.iTunesStoreUI.MoviePlayer.BackgroundObserver", v12, (void *)1);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void sub_2566E8EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __SUUIVideoPreviewDismissOnEnterBackground_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id object = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:0 completion:0];
    objc_setAssociatedObject(object, "com.apple.iTunesStoreUI.MoviePlayer.BackgroundObserver", 0, (void *)1);
    id WeakRetained = object;
  }
}

void SUUIVideoPreviewObservePlayer(void *a1, uint64_t a2)
{
  id v3 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __SUUIVideoPreviewObservePlayer_block_invoke_3;
  block[3] = &unk_265403930;
  id v8 = &__block_literal_global_28;
  if (SUUIVideoPreviewObservePlayer_sOnce != -1)
  {
    dispatch_once(&SUUIVideoPreviewObservePlayer_sOnce, block);
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a2)
  {
LABEL_3:
    id v4 = (void *)[objc_alloc(NSNumber) initWithLongLong:a2];
    id v5 = [v3 currentItem];
    objc_setAssociatedObject(v5, "com.apple.iTunesStoreUI.MoviePlayerItemID", v4, (void *)1);
  }
LABEL_4:
  id v6 = [v3 currentItem];
  objc_setAssociatedObject(v6, "com.apple.iTunesStoreUI.MoviePlayerTrackingKey", MEMORY[0x263EFFA88], (void *)1);
}

void __SUUIVideoPreviewObservePlayer_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 object];
  id v4 = objc_getAssociatedObject(v3, "com.apple.iTunesStoreUI.MoviePlayerItemID");
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    id v5 = [v3 accessLog];
    id v6 = [v5 events];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SUUIVideoPreviewObservePlayer_block_invoke_2;
    v11[3] = &unk_2654058A8;
    void v11[4] = &v12;
    [v6 enumerateObjectsUsingBlock:v11];

    if (v13[3] >= 5.0)
    {
      [v4 longLongValue];
      id v7 = (void *)SUCreatePreviewHistoryOperation();
      id v8 = [MEMORY[0x263F894E0] mainQueue];
      [v8 addOperation:v7];
    }
    _Block_object_dispose(&v12, 8);
  }
  __n128 v9 = objc_getAssociatedObject(v3, "com.apple.iTunesStoreUI.MoviePlayerTrackingKey");
  if (v9)
  {
    __n128 v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"SUUIVideoPreviewDidEndNotification" object:0];
  }
}

void sub_2566E9220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SUUIVideoPreviewObservePlayer_block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 durationWatched];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = v5;
  return result;
}

void __SUUIVideoPreviewObservePlayer_block_invoke_3(uint64_t a1)
{
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v2 = *MEMORY[0x263EFA050];
  double v3 = [MEMORY[0x263F08A48] mainQueue];
  id v4 = (id)[v8 addObserverForName:v2 object:0 queue:v3 usingBlock:*(void *)(a1 + 32)];

  uint64_t v5 = *MEMORY[0x263EFA060];
  id v6 = [MEMORY[0x263F08A48] mainQueue];
  id v7 = (id)[v8 addObserverForName:v5 object:0 queue:v6 usingBlock:*(void *)(a1 + 32)];
}

void sub_2566EB51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
}

void sub_2566EDDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__45(uint64_t a1)
{
}

void sub_2566EDF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566F1008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{
}

void sub_2566F239C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566F26A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIViewControllerIsVisible(void *a1)
{
  id v1 = a1;
  if ([v1 isViewLoaded])
  {
    uint64_t v2 = [v1 view];
  }
  else
  {
    uint64_t v2 = 0;
  }
  double v3 = [v2 window];
  if (v3) {
    uint64_t v4 = [v2 isHidden] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

id SUUIViewControllerGetAncestorTabBarController(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 tabBarController];
  if ([v2 conformsToProtocol:&unk_27064BD90])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = v1;
    do
    {
      uint64_t v4 = v3;
      id v3 = [v3 parentViewController];
    }
    while (v3 && ![v3 conformsToProtocol:&unk_27064BD90]);
  }

  return v3;
}

id SUUIViewControllerGetTopMostViewController(void *a1)
{
  for (id i = a1; ; id i = (id)v2)
  {
    uint64_t v2 = [i presentedViewController];
    if (!v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([i topViewController], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          break;
        }
        uint64_t v2 = [i focusedViewController];
        if (!v2) {
          break;
        }
      }
    }
  }
  return i;
}

BOOL SUUIViewControllerIsDescendent(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v5;
  id v7 = v5;
  if (v5)
  {
    id v7 = v5;
    if (v5 != v4)
    {
      id v7 = v5;
      do
      {
        id v8 = v7;
        id v7 = [v7 parentViewController];
      }
      while (v7 && v7 != v4);
    }
  }

  return v7 == v4;
}

void sub_2566F8004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2566F8164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AnalyzedImageColors::AnalyzedImageColors(AnalyzedImageColors *this)
{
  ITColor::ITColor((ITColor *)this);
  ITColor::ITColor(v2 + 1);
  ITColor::ITColor((ITColor *)this + 2);
  ITColor::ITColor((ITColor *)this + 3);
  ITColor::ITColor((ITColor *)this + 4);
  ITColor::ITColor((ITColor *)this + 5);
  ITColor::ITColor((ITColor *)this + 6);
  ITColor::ITColor((ITColor *)this + 7);
  ITColor::ITColor((ITColor *)this + 8);
  *(void *)((char *)this + 29ITColor::ITColor((ITColor *)this + 3) = 0;
  *((void *)this + 3ITColor::ITColor((ITColor *)this + 6) = 0;
}

void sub_2566F9B74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2566FA8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

uint64_t __Block_byref_object_copy__47(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47(uint64_t a1)
{
}

void sub_2566FB1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566FB4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566FB588(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2566FB844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2566FB93C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2566FBC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566FBE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
}

void sub_2566FC0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2566FC7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566FDEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 232), 8);
  _Block_object_dispose((const void *)(v58 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_2566FE3C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2566FEF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566FF648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566FFBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2566FFFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256700C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256700F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256701BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256704FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

void _SUUIOffscreenRenderOperationPopRenderingContext(void *a1, void *a2)
{
  v49[2] = *MEMORY[0x263EF8340];
  uint64_t v33 = 0;
  __n128 v34 = &v33;
  uint64_t v35 = 0x3032000000;
  __n128 v36 = __Block_byref_object_copy__14;
  id v37 = __Block_byref_object_dispose__15;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__14;
  Float64 v31 = __Block_byref_object_dispose__15;
  id v32 = 0;
  id v4 = _SUUIOffscreenRenderOperationGetRendererStackAccessQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___SUUIOffscreenRenderOperationPopRenderingContext_block_invoke;
  block[3] = &unk_265405DF8;
  void block[4] = &v33;
  block[5] = &v27;
  dispatch_barrier_sync(v4, block);
  if (v34[5] && v28[5]) {
    goto LABEL_12;
  }
  uint64_t v44 = 0;
  __n128 v45 = &v44;
  uint64_t v46 = 0x2020000000;
  id v5 = (id *)getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
  uint64_t v47 = getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
  if (!getkEAGLContextPropertyAcceleratedSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    CMTime v41 = __getkEAGLContextPropertyAcceleratedSymbolLoc_block_invoke;
    uint64_t v42 = &unk_265405DA0;
    __n128 v43 = &v44;
    id v6 = (void *)OpenGLESLibrary();
    id v7 = dlsym(v6, "kEAGLContextPropertyAccelerated");
    *(void *)(v43[1] + 2ITColor::ITColor((ITColor *)this + 4) = v7;
    getkEAGLContextPropertyAcceleratedSymbolLoc_ptr = *(void *)(v43[1] + 24);
    id v5 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v5)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"NSString *getkEAGLContextPropertyAccelerated(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"SUUIOffscreenRenderOperation.m", 46, @"%s", dlerror());

    goto LABEL_19;
  }
  id v8 = *v5;
  v48[0] = v8;
  uint64_t v9 = MEMORY[0x263EFFA88];
  v49[0] = MEMORY[0x263EFFA88];
  uint64_t v44 = 0;
  __n128 v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v10 = (id *)getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
  uint64_t v47 = getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
  if (!getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    CMTime v41 = __getkEAGLContextPropertyClientRetainReleaseSymbolLoc_block_invoke;
    uint64_t v42 = &unk_265405DA0;
    __n128 v43 = &v44;
    uint64_t v11 = (void *)OpenGLESLibrary();
    uint64_t v12 = dlsym(v11, "kEAGLContextPropertyClientRetainRelease");
    *(void *)(v43[1] + 2ITColor::ITColor((ITColor *)this + 4) = v12;
    getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr = *(void *)(v43[1] + 24);
    uint64_t v10 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v10)
  {
    __n128 v24 = [MEMORY[0x263F08690] currentHandler];
    __n128 v25 = [NSString stringWithUTF8String:"NSString *getkEAGLContextPropertyClientRetainRelease(void)"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"SUUIOffscreenRenderOperation.m", 47, @"%s", dlerror());

LABEL_19:
    __break(1u);
  }
  id v13 = *v10;
  v48[1] = v13;
  v49[1] = v9;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

  uint64_t v15 = [objc_alloc((Class)getEAGLContextClass()) initWithAPI:3 properties:v14];
  uint64_t v16 = (void *)v28[5];
  v28[5] = v15;

  uint64_t v17 = v28[5];
  if (!v17)
  {
    uint64_t v18 = [objc_alloc((Class)getEAGLContextClass()) initWithAPI:2 properties:v14];
    uint64_t v19 = (void *)v28[5];
    v28[5] = v18;

    uint64_t v17 = v28[5];
  }
  uint64_t v20 = [MEMORY[0x263F15860] rendererWithEAGLContext:v17 options:0];
  __n128 v21 = (void *)v34[5];
  v34[5] = v20;

LABEL_12:
  if (a2) {
    *a2 = (id) v28[5];
  }
  if (a1) {
    *a1 = (id) v34[5];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void sub_25670560C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose((const void *)(v9 - 152), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id getEAGLContextClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getEAGLContextClass_softClass;
  uint64_t v7 = getEAGLContextClass_softClass;
  if (!getEAGLContextClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getEAGLContextClass_block_invoke;
    v3[3] = &unk_265405DA0;
    v3[4] = &v4;
    __getEAGLContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25670571C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SUUIglGetError()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getglGetErrorSymbolLoc_ptr;
  uint64_t v6 = getglGetErrorSymbolLoc_ptr;
  if (!getglGetErrorSymbolLoc_ptr)
  {
    id v1 = (void *)OpenGLESLibrary();
    v4[3] = (uint64_t)dlsym(v1, "glGetError");
    getglGetErrorSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    _SUUIglGetError_cold_1();
  }
  return v0();
}

void sub_256705814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SUUIglBindFramebuffer(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))getglBindFramebufferSymbolLoc_ptr;
  id v8 = getglBindFramebufferSymbolLoc_ptr;
  if (!getglBindFramebufferSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)OpenGLESLibrary();
    double v6[3] = (uint64_t)dlsym(v3, "glBindFramebuffer");
    getglBindFramebufferSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    _SUUIglBindFramebuffer_cold_1();
  }
  return v2(36160, a1);
}

void sub_256705920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _SUUIOffscreenRenderOperationPushRenderingContext(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 && v4)
  {
    uint64_t v6 = _SUUIOffscreenRenderOperationGetRendererStackAccessQueue();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___SUUIOffscreenRenderOperationPushRenderingContext_block_invoke;
    v7[3] = &unk_265400890;
    id v8 = v3;
    id v9 = v5;
    dispatch_barrier_async(v6, v7);
  }
}

void *__Block_byref_object_copy__49(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
}

uint64_t IOSurfaceLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!IOSurfaceLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __IOSurfaceLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_265405DC0;
    uint64_t v4 = 0;
    IOSurfaceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = IOSurfaceLibraryCore_frameworkLibrary;
  if (!IOSurfaceLibraryCore_frameworkLibrary) {
    IOSurfaceLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t OpenGLESLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!OpenGLESLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __OpenGLESLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_265405DD8;
    uint64_t v4 = 0;
    OpenGLESLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = OpenGLESLibraryCore_frameworkLibrary;
  if (!OpenGLESLibraryCore_frameworkLibrary) {
    OpenGLESLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

Class __getEAGLContextClass_block_invoke(uint64_t a1)
{
  OpenGLESLibrary();
  Class result = objc_getClass("EAGLContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getEAGLContextClass_block_invoke_cold_1();
  }
  getEAGLContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceWidthSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkIOSurfaceWidthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceHeightSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkIOSurfaceHeightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceBytesPerElementSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceBytesPerElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkIOSurfaceBytesPerElementSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfacePixelFormatSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfacePixelFormat");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkIOSurfacePixelFormatSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceIsGlobalSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceIsGlobal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkIOSurfaceIsGlobalSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIOSurfaceCreateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "IOSurfaceCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getIOSurfaceCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglClearColorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glClearColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglClearColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglClearSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glClear");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglClearSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglGetErrorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glGetError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglGetErrorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglBindFramebufferSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glBindFramebuffer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglBindFramebufferSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglDeleteFramebuffersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glDeleteFramebuffers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglDeleteFramebuffersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglDeleteTexturesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glDeleteTextures");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglDeleteTexturesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IOSurfaceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IOSurfaceLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __OpenGLESLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OpenGLESLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t _SUUIglBindTexture(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))getglBindTextureSymbolLoc_ptr;
  id v8 = getglBindTextureSymbolLoc_ptr;
  if (!getglBindTextureSymbolLoc_ptr)
  {
    long long v3 = (void *)OpenGLESLibrary();
    double v6[3] = (uint64_t)dlsym(v3, "glBindTexture");
    getglBindTextureSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    _SUUIglBindTexture_cold_1();
  }
  return v2(3553, a1);
}

void sub_256706820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SUUIglTexParameteri(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getglTexParameteriSymbolLoc_ptr;
  uint64_t v10 = getglTexParameteriSymbolLoc_ptr;
  if (!getglTexParameteriSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)OpenGLESLibrary();
    v8[3] = (uint64_t)dlsym(v5, "glTexParameteri");
    getglTexParameteriSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4) {
    _SUUIglTexParameteri_cold_1();
  }
  return v4(3553, a1, a2);
}

void sub_256706934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getglGenTexturesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glGenTextures");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglGenTexturesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglBindTextureSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glBindTexture");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglBindTextureSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIOSurfaceGetWidthSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  uint64_t result = dlsym(v2, "IOSurfaceGetWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getIOSurfaceGetWidthSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIOSurfaceGetHeightSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IOSurfaceLibrary();
  uint64_t result = dlsym(v2, "IOSurfaceGetHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getIOSurfaceGetHeightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglTexParameteriSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glTexParameteri");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglTexParameteriSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglGenFramebuffersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glGenFramebuffers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglGenFramebuffersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglFramebufferTexture2DSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glFramebufferTexture2D");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglFramebufferTexture2DSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglViewportSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glViewport");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getglViewportSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _SUUIOffscreenRenderOperationGetRendererStackAccessQueue()
{
  if (_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken != -1) {
    dispatch_once(&_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken, &__block_literal_global_92);
  }
  uint64_t v0 = (void *)_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
  return v0;
}

void *__getkEAGLContextPropertyAcceleratedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "kEAGLContextPropertyAccelerated");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkEAGLContextPropertyAcceleratedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkEAGLContextPropertyClientRetainReleaseSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "kEAGLContextPropertyClientRetainRelease");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2567072FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double SUUIAttributedStringGetLineHeight(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = [v1 length];
  uint64_t v3 = *MEMORY[0x263F814F0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __SUUIAttributedStringGetLineHeight_block_invoke;
  double v6[3] = &unk_265405E28;
  v6[4] = &v7;
  objc_msgSend(v1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_256707688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SUUIAttributedStringGetLineHeight_block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 _bodyLeading];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = v5;
  return result;
}

void sub_256707F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2567095C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
}

void sub_25670A238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25670A6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25670A980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25670AD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__51(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__51(uint64_t a1)
{
}

void sub_25670B5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25670E878(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__52(uint64_t a1)
{
}

void sub_2567126FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256712D00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__53(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__53(uint64_t a1)
{
}

void sub_256714FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256715EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_2567160FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256716B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256716FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256717318(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_256717ADC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id SUUIXEventSearchDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", @"search", @"type", 0);
  uint64_t v6 = v5;
  if (v3) {
    [v5 setObject:v3 forKey:@"term"];
  }
  if (v4) {
    [v6 setObject:v4 forKey:@"url"];
  }

  return v6;
}

uint64_t SUUIXEventSidepackDictionary(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", @"sidePack", @"type", a1, @"sidePackData", 0);
}

Class __getAMSBagClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_265406310;
    uint64_t v5 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleMediaServicesLibraryCore_frameworkLibrary) {
    __getAMSBagClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AMSBag");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSBagClass_block_invoke_cold_2();
  }
  getAMSBagClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_256719278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25671C448(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__54(uint64_t a1)
{
}

void sub_25671D034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__55(uint64_t a1)
{
}

void sub_25671D140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25671D274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIFontForTextStyle(uint64_t a1)
{
  return _SUUIFontDescriptorGetFontForTextStyle(a1, (void *)*MEMORY[0x263F83468]);
}

id _SUUIFontDescriptorGetFontForTextStyle(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = a1 - 1;
  uint64_t v5 = 0;
  double v6 = 1.0;
  char v7 = 1;
  id v8 = (uint64_t *)MEMORY[0x263F03CE0];
  switch(v4)
  {
    case 0:
      goto LABEL_34;
    case 1:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D20];
      goto LABEL_34;
    case 2:
      uint64_t v5 = 0;
      goto LABEL_7;
    case 3:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_7:
      id v8 = (uint64_t *)MEMORY[0x263F03CE8];
      goto LABEL_34;
    case 4:
      uint64_t v5 = 0;
      goto LABEL_10;
    case 5:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_10:
      id v8 = (uint64_t *)MEMORY[0x263F03CF0];
      goto LABEL_34;
    case 6:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D28];
      goto LABEL_34;
    case 7:
      uint64_t v5 = 0;
      goto LABEL_14;
    case 8:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_14:
      id v8 = (uint64_t *)MEMORY[0x263F03CF8];
      goto LABEL_34;
    case 9:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03CF8];
      double v6 = 0.909090909;
      goto LABEL_34;
    case 10:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D00];
      goto LABEL_34;
    case 11:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D30];
      goto LABEL_34;
    case 12:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D10];
      goto LABEL_34;
    case 13:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D38];
      goto LABEL_34;
    case 14:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D50];
      goto LABEL_34;
    case 15:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D48];
      goto LABEL_34;
    case 16:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D40];
      goto LABEL_34;
    case 17:
      uint64_t v5 = 0;
      goto LABEL_25;
    case 18:
    case 19:
      char v7 = 0;
      uint64_t v5 = 0x8000;
      goto LABEL_25;
    case 20:
      char v7 = 0;
      uint64_t v5 = 0x10000;
LABEL_25:
      id v8 = (uint64_t *)MEMORY[0x263F03D48];
      double v6 = 0.933333333;
      goto LABEL_34;
    case 21:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D10];
      double v6 = 2.05882353;
      goto LABEL_34;
    case 22:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D10];
      double v6 = 1.35294118;
      goto LABEL_34;
    case 23:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D10];
      double v6 = 1.29411765;
      goto LABEL_34;
    case 24:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D10];
      double v6 = 1.17647059;
      goto LABEL_34;
    case 25:
      uint64_t v5 = 0;
      goto LABEL_31;
    case 26:
    case 27:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_31:
      id v8 = (uint64_t *)MEMORY[0x263F03D10];
      double v6 = 1.05882353;
      goto LABEL_34;
    case 28:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D58];
      goto LABEL_34;
    case 29:
      uint64_t v5 = 0;
      id v8 = (uint64_t *)MEMORY[0x263F03D60];
LABEL_34:
      uint64_t v9 = *v8;
      if (!*v8) {
        goto LABEL_44;
      }
      if (_SUUIFontDescriptorGetCache_onceToken != -1) {
        dispatch_once(&_SUUIFontDescriptorGetCache_onceToken, &__block_literal_global_37);
      }
      id v10 = (id)_SUUIFontDescriptorGetCache_fontDescriptorCache;
      uint64_t v11 = [[_SUUIFontDescriptorCacheKey alloc] initWithTextStyle:v9 sizeCategory:v3];
      uint64_t v12 = [v10 objectForKey:v11];
      if (!v12)
      {
        uint64_t v13 = (void *)CTFontDescriptorCreateWithTextStyle();
        uint64_t v14 = v13;
        if ((v7 & 1) == 0)
        {
          uint64_t v15 = [v13 fontDescriptorWithSymbolicTraits:v5];

          uint64_t v14 = (void *)v15;
        }
        uint64_t v29 = *MEMORY[0x263F81748];
        uint64_t v16 = *MEMORY[0x263F817B0];
        v26[0] = *MEMORY[0x263F817B8];
        v26[1] = v16;
        v27[0] = &unk_2705D0BE0;
        v27[1] = &unk_2705D0BF8;
        uint64_t v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
        id v28 = v17;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
        v30[0] = v18;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
        uint64_t v12 = [v14 fontDescriptorByAddingAttributes:v19];

        [v10 setObject:v12 forKey:v11];
      }
      double v20 = 0.0;
      if (fabs(v6) >= 2.22044605e-16)
      {
        __n128 v21 = [v12 objectForKey:*MEMORY[0x263F81768]];
        [v21 floatValue];
        float v23 = v6 * v22;
        double v20 = ceilf(v23);
      }
      __n128 v24 = [MEMORY[0x263F81708] fontWithDescriptor:v12 size:v20];

      break;
    default:
LABEL_44:
      __n128 v24 = 0;
      break;
  }

  return v24;
}

id SUUIFontLimitedPreferredFontForTextStyle(uint64_t a1, uint64_t a2)
{
  v15[13] = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v5 = [v4 preferredContentSizeCategory];

  id v6 = v5;
  char v7 = (void *)*MEMORY[0x263F83468];
  char v8 = [v6 isEqualToString:*MEMORY[0x263F83468]];
  uint64_t v9 = (id *)MEMORY[0x263F83470];
  if (v8)
  {
    uint64_t v10 = 4;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83470]])
  {
    uint64_t v10 = 3;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83450]])
  {
    uint64_t v10 = 5;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83488]])
  {
    uint64_t v10 = 2;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83440]])
  {
    uint64_t v10 = 6;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83430]])
  {
    uint64_t v10 = 7;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83458]])
  {
    uint64_t v10 = 1;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83420]])
  {
    uint64_t v10 = 8;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83418]])
  {
    uint64_t v10 = 9;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83410]])
  {
    uint64_t v10 = 10;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83408]])
  {
    uint64_t v10 = 11;
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F83400]])
  {
    uint64_t v10 = 12;
  }
  else
  {
    uint64_t v10 = 4;
  }

  if (v10 <= a2)
  {
    id v11 = v6;
  }
  else
  {
    v15[0] = 0;
    v15[1] = (id)*MEMORY[0x263F83458];
    v15[2] = (id)*MEMORY[0x263F83488];
    v15[3] = *v9;
    v15[4] = v7;
    v15[5] = (id)*MEMORY[0x263F83450];
    v15[6] = (id)*MEMORY[0x263F83440];
    v15[7] = (id)*MEMORY[0x263F83430];
    v15[8] = (id)*MEMORY[0x263F83420];
    v15[9] = (id)*MEMORY[0x263F83418];
    v15[10] = (id)*MEMORY[0x263F83410];
    v15[11] = (id)*MEMORY[0x263F83408];
    v15[12] = (id)*MEMORY[0x263F83400];
    id v11 = (id)v15[a2];
    for (uint64_t i = 12; i != -1; --i)
  }
  uint64_t v13 = _SUUIFontDescriptorGetFontForTextStyle(a1, v11);

  return v13;
}

id SUUIFontPreferredFontForTextStyle(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  id v3 = [v2 preferredContentSizeCategory];

  uint64_t v4 = _SUUIFontDescriptorGetFontForTextStyle(a1, v3);

  return v4;
}

void sub_25671E5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56(uint64_t a1)
{
}

id SUUIErrorDocumentTitle(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.AppStore"])
  {
    uint64_t v4 = @"CANNOT_CONNECT_TO_APP_STORE";
    if (!v1) {
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v5 = [v1 localizedStringForKey:v4];
    goto LABEL_12;
  }
  if (([v3 isEqualToString:@"com.apple.iBooks"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"com.apple.MobileSMS"]) {
      uint64_t v4 = @"CANNOT_CONNECT_TO_IMESSAGE_STORE";
    }
    else {
      uint64_t v4 = @"CANNOT_CONNECT_TO_ITUNES_STORE";
    }
    if (!v1) {
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  uint64_t v4 = @"CANNOT_CONNECT_TO_IBOOKS_STORE";
  if (v1) {
    goto LABEL_6;
  }
LABEL_11:
  uint64_t v5 = +[SUUIClientContext localizedStringForKey:v4 inBundles:0];
LABEL_12:
  id v6 = (void *)v5;

  return v6;
}

void sub_2567206CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__57(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__57(uint64_t a1)
{
}

void sub_256721130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567212E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__58(uint64_t a1)
{
}

void sub_2567225F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_256722C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25672313C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__59(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__59(uint64_t a1)
{
}

void *__Block_byref_object_copy__60(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__60(uint64_t a1)
{
}

void sub_256723BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void SUUIInitializeViewElementFactory()
{
  if (SUUIInitializeViewElementFactory_sOnce != -1) {
    dispatch_once(&SUUIInitializeViewElementFactory_sOnce, &__block_literal_global_38);
  }
}

uint64_t __SUUIInitializeViewElementFactory_block_invoke()
{
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"accountButtons" elementType:1];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"actions" elementType:3];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"activity" elementType:116];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"activityIndicator" elementType:4];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"asset" elementType:5];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"background" elementType:7];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"backgroundImage" elementType:49];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"badge" elementType:8];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"b" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"browse" elementType:10];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"br" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"button" elementType:12];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"card" elementType:14];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"carousel" elementType:15];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"circle" elementType:59];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"collectionList" elementType:20];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"column" elementType:21];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"content" elementType:26];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"commentTemplate" elementType:25];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"contentUnavailable" elementType:27];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"counter" elementType:28];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"countLimit" elementType:60];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"date" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"decorationImage" elementType:29];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"templateDefinition" elementType:136];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"description" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"divider" elementType:32];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"duration" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"entityProviderList" elementType:35];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"expand" elementType:36];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"facebook" elementType:38];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"filterBar" elementType:40];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"footer" elementType:41];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"fullscreenImg" elementType:42];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"grid" elementType:45];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"group" elementType:46];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"header" elementType:48];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"i" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"imageDeck" elementType:51];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"imageGrid" elementType:154];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"img" elementType:49];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"indexBar" elementType:53];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"indexBarEntry" elementType:54];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"indexBarEntryList" elementType:55];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"info" elementType:56];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"infoList" elementType:57];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"input" elementType:58];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"item" elementType:59];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"label" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"limitList" elementType:61];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"list" elementType:62];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"lockup" elementType:66];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"menu" elementType:69];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"menuBar" elementType:70];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"menuItem" elementType:72];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"nativeViewPlaceholderTemplate" elementType:73];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"navigationBar" elementType:74];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"navigationTitle" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"nearByApps" elementType:76];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"notice" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"number" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"offer" elementType:77];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"option" elementType:59];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"ordinal" elementType:80];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"palette" elementType:75];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"placeholder" elementType:86];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"popularity" elementType:9];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"predicateList" elementType:89];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"previewControl" elementType:90];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"progressIndicator" elementType:95];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"propertyPredicate" elementType:88];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"pullToRefresh" elementType:99];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"response" elementType:102];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"reviewList" elementType:104];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"review" elementType:103];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"row" elementType:105];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"section" elementType:108];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"segmentedBar" elementType:109];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"segmentedControl" elementType:109];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"select" elementType:69];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"settingsEditProfile" elementType:111];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"settingsFamily" elementType:112];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"settingsField" elementType:113];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"settingsProfile" elementType:114];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"shelf" elementType:118];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"signInControl" elementType:120];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"socialActivities" elementType:123];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"sortDescriptor" elementType:125];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"sortDescriptorList" elementType:126];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"spacer" elementType:127];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"stackList" elementType:131];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"span" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"split" elementType:128];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"starBar" elementType:133];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"starHistogram" elementType:134];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"starRating" elementType:135];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"subtitle" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"text" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"title" elementType:138];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"tomatoRating" elementType:144];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"toolbar" elementType:145];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"track" elementType:146];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"trackList" elementType:147];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"url" elementType:151];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"video" elementType:152];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"adFeedback" elementType:108];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"reason" elementType:59];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"charityTemplate" elementType:16];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"chartsTemplate" elementType:17];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"contentUnavailableTemplate" elementType:27];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"dialogTemplate" elementType:31];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"editorTemplate" elementType:34];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"exploreTemplate" elementType:37];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"familySetupTemplate" elementType:39];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"giftTemplate" elementType:44];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"loadingTemplate" elementType:65];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"reportAConcernTemplate" elementType:101];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"settingsTemplate" elementType:115];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"signInTemplate" elementType:121];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"menuBarTemplate" elementType:71];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"onboardingTemplate" elementType:85];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"panelTemplate" elementType:83];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"playlist" elementType:87];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"physicalCirclesTemplate" elementType:85];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"previewTemplate" elementType:91];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"productTemplate" elementType:93];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"redeemTemplate" elementType:98];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"shareTemplate" elementType:117];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"splitViewTemplate" elementType:129];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"stackTemplate" elementType:132];
  [MEMORY[0x263F4B4D8] registerClass:objc_opt_class() forElementName:@"trendingSearchTemplate" elementType:148];
  uint64_t v0 = (void *)MEMORY[0x263F4B4D8];
  uint64_t v1 = objc_opt_class();
  return [v0 registerClass:v1 forElementName:@"writeAReviewTemplate" elementType:153];
}

void sub_256728360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__61(uint64_t a1)
{
}

void _telephonyNotification(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  id v6 = (void *)SUUICoreTelephonyFramework();
  char v7 = *(const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v6);
  char v8 = *(const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v6);
  uint64_t v9 = *(const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v6);
  uint64_t v10 = *(const void **)SUUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v6);
  if (CFEqual(a2, v7))
  {
    id v11 = @"onOperatorChange";
LABEL_6:
    id v12 = a4;
    uint64_t v13 = [v12 appContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___telephonyNotification_block_invoke;
    v15[3] = &unk_265405AA8;
    id v16 = v12;
    uint64_t v17 = v11;
    id v14 = v12;
    [v13 evaluate:v15 completionBlock:0];

    return;
  }
  if (CFEqual(a2, v9) || CFEqual(a2, v8))
  {
    id v11 = @"onRegistrationChange";
    goto LABEL_6;
  }
  if (CFEqual(a2, v10))
  {
    id v11 = @"onPhoneNumberChange";
    goto LABEL_6;
  }
}

id ___telephonyNotification_block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) invokeMethod:*(void *)(a1 + 40) withArguments:0];
}

void sub_25672B20C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 120), 8);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_25672B390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25672BB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25672BD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25672F12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_25672F338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25672F5A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_25672F7F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SUUIMessageBannerAttributedString(void *a1, void *a2)
{
  _OWORD v24[3] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x263F81650]);
  [v5 setAlignment:1];
  [v5 setLineBreakMode:4];
  v23[0] = *MEMORY[0x263F814F0];
  uint64_t v6 = v23[0];
  char v7 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
  uint64_t v8 = *MEMORY[0x263F81500];
  v24[0] = v7;
  v24[1] = v4;
  uint64_t v9 = *MEMORY[0x263F81540];
  v23[1] = v8;
  v23[2] = v9;
  void v24[2] = v5;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

  v21[0] = v6;
  id v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
  v22[0] = v11;
  v21[1] = v8;
  id v12 = [MEMORY[0x263F825C8] blackColor];
  v21[2] = v9;
  v22[1] = v12;
  v22[2] = v5;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (v3) {
    [v3 localizedStringForKey:@"ASK_PERMISSION_MESSAGE" inTable:@"ProductPage"];
  }
  else {
  id v14 = +[SUUIClientContext localizedStringForKey:@"ASK_PERMISSION_MESSAGE" inBundles:0 inTable:@"ProductPage"];
  }
  if (v3) {
    [v3 localizedStringForKey:@"ASK_PERMISSION_MESSAGE_HIGHLIGHT" inTable:@"ProductPage"];
  }
  else {
  uint64_t v15 = +[SUUIClientContext localizedStringForKey:@"ASK_PERMISSION_MESSAGE_HIGHLIGHT" inBundles:0 inTable:@"ProductPage"];
  }
  id v16 = [NSString stringWithValidatedFormat:v14, @"%@", 0, v15 validFormatSpecifiers error];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v16 attributes:v13];
  uint64_t v18 = [v16 rangeOfString:v15];
  objc_msgSend(v17, "setAttributes:range:", v10, v18, v19);

  return v17;
}

void sub_256733C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256734DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256735BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_256736F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_25673758C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id SUUIReuseIdentifierForView(void *a1)
{
  return objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.viewReuse.ID");
}

void sub_256737C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

id _SUUIErrorFromError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  int v3 = [v2 isEqualToString:@"SUUIMacErrorDomain"];

  if (v3)
  {
    uint64_t v4 = [v1 code];
    if (v4 == 2) {
      uint64_t v5 = 7;
    }
    else {
      uint64_t v5 = 4 * (v4 == 1);
    }
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:v1 forKeyedSubscript:*MEMORY[0x263F08608]];
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:v5 userInfo:v6];
  }
  else
  {
    id v7 = v1;
  }

  return v7;
}

uint64_t SUUILabelViewStyleForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"title"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"subtitle"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"notice"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"description"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"navigationTitle"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_256739E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__62(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{
}

id SUUILabelStringAttributesWithSpanElement(void *a1)
{
  id v1 = [a1 style];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v3 = SUUIViewElementFontWithStyle(v1);
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x263F814F0]];
  }
  uint64_t v4 = [v1 ikColor];
  uint64_t v5 = [v4 color];

  if (v5) {
    [v2 setObject:v5 forKey:*MEMORY[0x263F81500]];
  }
  if (![v2 count])
  {

    id v2 = 0;
  }

  return v2;
}

void sub_25673F1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__63(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__63(uint64_t a1)
{
}

void sub_25673FEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567405E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

double SUUILockupImageSizeForLockupSize(unint64_t a1, uint64_t a2)
{
  if (a2 == 2 || a2 == 6)
  {
    if (a1 < 6)
    {
      id v2 = (double *)&unk_2568A14D8;
      return v2[a1];
    }
    return 120.0;
  }
  else if (a2 == 8)
  {
    if (a1 < 6)
    {
      id v2 = (double *)&unk_2568A1478;
      return v2[a1];
    }
    return 175.0;
  }
  else
  {
    if (a1 <= 5)
    {
      id v2 = (double *)&unk_2568A1508;
      return v2[a1];
    }
    return 125.0;
  }
}

uint64_t SUUILockupImageStyleForItemKind(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6) {
    return 0;
  }
  else {
    return qword_2568A1538[a1 - 2];
  }
}

void sub_25674437C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256745C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256746054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIGiftAmountButtonsWithAmounts(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_alloc_init(SUUIGiftAmountButton);
        uint64_t v10 = objc_msgSend(v8, "displayLabel", (void)v12);
        [(SUUIGiftAmountButton *)v9 setTitle:v10 forState:0];

        [(SUUIGiftAmountButton *)v9 sizeToFit];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_256746E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567495FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__64(uint64_t a1)
{
}

void sub_256749838(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_25674A618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25674B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25674C27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__65(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
}

CGFloat CGRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  double v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

uint64_t SUUIItemCollectionItemPageRangeForCollectionView(void *a1, double a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v5, "indexPathForItemAtPoint:", a2, a3);
  if (v6)
  {
    id v7 = [v5 collectionViewLayout];
    [v5 bounds];
    [v7 itemSize];
    [v5 bounds];
    [v7 itemSize];
    uint64_t v8 = [v6 item];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t SUUIItemCollectionItemPageRangeForTableView(void *a1, double a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v5, "indexPathForRowAtPoint:", a2, a3);
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 item];
    uint64_t v9 = v8 & ~(v8 >> 63);
    [v5 rowHeight];
    if (v10 > 0.0)
    {
      [v5 bounds];
      [v5 rowHeight];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t SUUIItemCollectionVisibleItemRangeForCollectionView(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 indexPathsForVisibleItems];
  if ([v1 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "item", (void)v10);
          if (v6 >= v8) {
            uint64_t v6 = v8;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

    [v2 count];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t SUUIItemCollectionVisibleItemRangeForTableView(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 indexPathsForVisibleRows];
  if ([v1 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "row", (void)v10);
          if (v6 >= v8) {
            uint64_t v6 = v8;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

    [v2 count];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_25674FDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567503CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__66(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__66(uint64_t a1)
{
}

void SUUIConfigureDownloadsCellView(void *a1, void *a2, void *a3, unsigned int a4, void *a5)
{
  v40[2] = *MEMORY[0x263EF8340];
  id v8 = a2;
  uint64_t v38 = *MEMORY[0x263F814F0];
  uint64_t v9 = v38;
  long long v10 = (void *)MEMORY[0x263F81708];
  id v33 = a5;
  id v34 = a3;
  id v11 = a1;
  long long v12 = [v10 systemFontOfSize:14.0];
  v40[0] = v12;
  uint64_t v39 = *MEMORY[0x263F81500];
  uint64_t v13 = v39;
  double v14 = [MEMORY[0x263F825C8] labelColor];
  v40[1] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v38 count:2];

  v36[0] = v9;
  CGRect v16 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  v36[1] = v13;
  v37[0] = v16;
  CGRect v17 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  v37[1] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  id v19 = objc_alloc_init(MEMORY[0x263F089B8]);
  uint64_t v20 = [v8 valueForProperty:*MEMORY[0x263F7B738]];
  if (v20)
  {
    __n128 v21 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v20 attributes:v15];
    [v19 appendAttributedString:v21];
  }
  id v32 = (void *)v20;
  float v22 = [v8 valueForProperty:*MEMORY[0x263F7B5F0]];
  if (v22)
  {
    id v23 = objc_alloc(MEMORY[0x263F086A0]);
    __n128 v24 = [NSString stringWithFormat:@" – %@", v22];
    __n128 v25 = (void *)[v23 initWithString:v24 attributes:v18];
    [v19 appendAttributedString:v25];
  }
  __n128 v26 = [v8 valueForProperty:*MEMORY[0x263F7B628]];
  uint64_t v27 = [v8 valueForProperty:*MEMORY[0x263F7B610]];
  if ([v27 BOOLValue]) {
    uint64_t v28 = [v26 isEqual:*MEMORY[0x263F7B5C0]];
  }
  else {
    uint64_t v28 = 0;
  }

  if ([v26 isEqualToString:*MEMORY[0x263F7B5C8]])
  {
    uint64_t v29 = 2;
  }
  else if ([v26 isEqualToString:*MEMORY[0x263F7B5E0]])
  {
    uint64_t v29 = 2;
  }
  else
  {
    uint64_t v29 = v28;
  }
  [v11 setAttributedTitle:v19];
  id v30 = SUUIDownloadsStatusString(v8, v33);

  [v11 setSubtitle:v30];
  Float64 v31 = [v8 valueForExternalProperty:*MEMORY[0x263F7B558]];
  [v31 doubleValue];
  objc_msgSend(v11, "setProgress:");

  [v11 setImage:v34];
  [v11 setButtonType:v29];
  [v11 setIsPad:a4];
}

id SUUIDownloadsStatusString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 valueForProperty:*MEMORY[0x263F7B628]];
  if ([v5 isEqualToString:*MEMORY[0x263F7B5C8]])
  {
    if (v4)
    {
      uint64_t v6 = @"DOWNLOAD_ERROR";
LABEL_14:
      uint64_t v10 = [v4 localizedStringForKey:v6 inTable:@"Download"];
LABEL_21:
      uint64_t v13 = (void *)v10;
      goto LABEL_22;
    }
    uint64_t v9 = @"DOWNLOAD_ERROR";
    goto LABEL_20;
  }
  id v7 = [v3 valueForProperty:*MEMORY[0x263F7B638]];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    if (v4)
    {
      uint64_t v6 = @"RESTRICTED";
      goto LABEL_14;
    }
    uint64_t v9 = @"RESTRICTED";
LABEL_20:
    uint64_t v10 = +[SUUIClientContext localizedStringForKey:v9 inBundles:0 inTable:@"Download"];
    goto LABEL_21;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F7B5E0]])
  {
    if (v4)
    {
      uint64_t v6 = @"TAP_TO_RESUME";
      goto LABEL_14;
    }
    uint64_t v9 = @"TAP_TO_RESUME";
    goto LABEL_20;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F7B5E8]])
  {
    if (v4)
    {
      uint64_t v6 = @"WAITING";
      goto LABEL_14;
    }
    uint64_t v9 = @"WAITING";
    goto LABEL_20;
  }
  id v11 = [v3 valueForExternalProperty:*MEMORY[0x263F7B560]];
  if (![v11 length])
  {
    if (([v5 isEqualToString:*MEMORY[0x263F7B5C0]] & 1) == 0) {
      goto LABEL_36;
    }
    uint64_t v15 = [v3 valueForExternalProperty:*MEMORY[0x263F7B540]];
    uint64_t v16 = [v15 longLongValue];

    CGRect v17 = [v3 valueForExternalProperty:*MEMORY[0x263F7B548]];
    uint64_t v18 = [v17 longLongValue];

    id v19 = [v3 valueForExternalProperty:*MEMORY[0x263F7B558]];
    [v19 doubleValue];
    double v21 = v20;

    BOOL v22 = v16 < 1 || v18 < 1;
    if (v22 && v21 < 0.01)
    {
      if (v4)
      {
        id v23 = @"UNKNOWN_PROGRESS";
LABEL_38:
        id v12 = [v4 localizedStringForKey:v23 inTable:@"Download"];
        goto LABEL_45;
      }
      __n128 v24 = @"UNKNOWN_PROGRESS";
      goto LABEL_44;
    }
    if (v16 >= v18 && v21 >= 1.0)
    {
LABEL_36:
      if (v4)
      {
        id v23 = @"PROCESSING_DOWNLOAD";
        goto LABEL_38;
      }
      __n128 v24 = @"PROCESSING_DOWNLOAD";
LABEL_44:
      id v12 = +[SUUIClientContext localizedStringForKey:v24 inBundles:0 inTable:@"Download"];
      goto LABEL_45;
    }
    __n128 v25 = [v3 valueForExternalProperty:*MEMORY[0x263F7B550]];
    [v25 doubleValue];
    double v27 = v26;

    if (v27 < 0.0)
    {
      if (v4) {
        [v4 localizedStringForKey:@"DATA_PROGRESS" inTable:@"Download"];
      }
      else {
      uint64_t v28 = +[SUUIClientContext localizedStringForKey:@"DATA_PROGRESS" inBundles:0 inTable:@"Download"];
      }
      uint64_t v29 = NSString;
      id v30 = CPFSSizeStrings();
      Float64 v31 = CPFSSizeStrings();
      uint64_t v13 = [v29 stringWithValidatedFormat:v28, @"%@%@", 0, v30, v31 validFormatSpecifiers error];

      goto LABEL_46;
    }
    if ((v16 & ~(v16 >> 63)) > v18) {
      uint64_t v18 = v16 & ~(v16 >> 63);
    }
    if (v4) {
      [v4 localizedStringForKey:@"TIME_FORMAT" inTable:@"Download"];
    }
    else {
    id v32 = +[SUUIClientContext localizedStringForKey:@"TIME_FORMAT" inBundles:0 inTable:@"Download"];
    }
    id v33 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v32, @"%d%d", 0, v27 / 0x3CuLL, v27 % 0x3C);
    if (v16 < 1 || !v18)
    {
      if (v4) {
        [v4 localizedStringForKey:@"PERCENTAGE_PROGRESS" inTable:@"Download"];
      }
      else {
      uint64_t v38 = +[SUUIClientContext localizedStringForKey:@"PERCENTAGE_PROGRESS" inBundles:0 inTable:@"Download"];
      }
      uint64_t v13 = [NSString stringWithValidatedFormat:v38, @"%ld%@", 0, (uint64_t)(v21 * 100.0), v33 validFormatSpecifiers error];
      goto LABEL_70;
    }
    __n128 v43 = v32;
    id v34 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v35 = [v34 userInterfaceIdiom];

    if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (v4)
      {
        __n128 v36 = @"TIME_PROGRESS_LONG";
LABEL_63:
        uint64_t v37 = [v4 localizedStringForKey:v36 inTable:@"Download"];
LABEL_69:
        uint64_t v38 = (void *)v37;
        uint64_t v40 = NSString;
        CMTime v41 = CPFSSizeStrings();
        uint64_t v42 = CPFSSizeStrings();
        uint64_t v13 = [v40 stringWithValidatedFormat:v38, @"%@%@%@", 0, v41, v42, v33 validFormatSpecifiers error];

        id v32 = v43;
LABEL_70:

        goto LABEL_46;
      }
      uint64_t v39 = @"TIME_PROGRESS_LONG";
    }
    else
    {
      if (v4)
      {
        __n128 v36 = @"TIME_PROGRESS";
        goto LABEL_63;
      }
      uint64_t v39 = @"TIME_PROGRESS";
    }
    uint64_t v37 = +[SUUIClientContext localizedStringForKey:v39 inBundles:0 inTable:@"Download"];
    goto LABEL_69;
  }
  id v12 = v11;
LABEL_45:
  uint64_t v13 = v12;
LABEL_46:

LABEL_22:
  return v13;
}

void sub_2567547F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__67(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__67(uint64_t a1)
{
}

void sub_25675612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIGetFamilyMemberImage(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v7) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v12 && !v9 && !v10) {
    goto LABEL_13;
  }
  uint64_t v14 = SUUIAppleAccountUIFramework();
  id v15 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Aauiprofilepic.isa, v14));
  [v15 setPictureStyle:0];
  [v15 setPictureDiameter:60.0];
  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v16 = SUUIAppleAccountFramework();
  id v17 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Aafamilymember.isa, v16));
  [v17 setFirstName:v7];
  [v17 setLastName:v8];
  [v17 setPersonID:v11];
  [v17 setAppleID:v9];
  uint64_t v18 = [v15 profilePictureForFamilyMember:v17];

  if (!v18)
  {
LABEL_13:
    uint64_t v19 = SUUIContactsUIFramework();
    double v20 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Cnmonogrammer.isa, v19)), "initWithStyle:diameter:", 0, 60.0);
    double v21 = v20;
    if (v13) {
      [v20 monogramForPersonWithFirstName:v7 lastName:v8];
    }
    else {
    uint64_t v18 = [v20 silhouetteMonogram];
    }
  }
  return v18;
}

void sub_256759524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUICacheCodingDecodeArray(void *a1, objc_class *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [a2 alloc];
        BOOL v12 = objc_msgSend(v11, "initWithCacheRepresentation:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

id SUUICacheCodingEncodeArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "cacheRepresentation", (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

void SUUICollectionViewUpdatePerspectiveCells(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = [v3 indexPathsForVisibleItems];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsIndex:", objc_msgSend(v11, "section")))
          {
            long long v12 = [v3 cellForItemAtIndexPath:v11];
            if (v12) {
              [v5 addObject:v12];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = [v3 visibleCells];
  }
  [v3 bounds];
  CGFloat x = v39.origin.x;
  CGFloat y = v39.origin.y;
  CGFloat width = v39.size.width;
  CGFloat height = v39.size.height;
  CGFloat MidX = CGRectGetMidX(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v40);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __SUUICollectionViewUpdatePerspectiveCells_block_invoke;
  v31[3] = &__block_descriptor_48_e55_q24__0__UICollectionViewCell_8__UICollectionViewCell_16l;
  *(CGFloat *)&_OWORD v31[4] = MidX;
  *(CGFloat *)&v31[5] = MidY;
  uint64_t v19 = [v5 sortedArrayWithOptions:0 usingComparator:v31];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        __n128 v25 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        if (objc_msgSend(v25, "conformsToProtocol:", &unk_270640F38, (void)v27))
        {
          [v25 updateForChangedDistanceFromVanishingPoint];
          double v26 = [v25 superview];
          [v26 sendSubviewToBack:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v22);
  }
}

uint64_t __SUUICollectionViewUpdatePerspectiveCells_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 center];
  [v4 center];

  UIDistanceBetweenPoints();
  double v6 = v5;
  UIDistanceBetweenPoints();
  if (v6 < v7) {
    return -1;
  }
  else {
    return v6 > v7;
  }
}

void sub_25675D238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__68(uint64_t a1)
{
}

void sub_256760534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25676159C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

double SUUITextLayoutSizeForCTFrame(const __CTFrame *a1, CFIndex a2)
{
  Path = CTFrameGetPath(a1);
  BoundingBoCGFloat x = CGPathGetBoundingBox(Path);
  double width = BoundingBox.size.width;
  CFArrayRef Lines = CTFrameGetLines(a1);
  CFIndex Count = CFArrayGetCount(Lines);
  if (a2 && Count > a2)
  {
    origins.CGFloat x = 0.0;
    origins.CGFloat y = 0.0;
    v12.CGFloat x = 0.0;
    v12.CGFloat y = 0.0;
    v14.id location = 0;
    v14.length = 1;
    CTFrameGetLineOrigins(a1, v14, &v12);
    CFIndex v8 = a2 - 1;
    v15.id location = v8;
    v15.length = 1;
    CTFrameGetLineOrigins(a1, v15, &origins);
    ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v8);
    CTLineGetBoundsWithOptions(ValueAtIndex, 0x14uLL);
  }
  float v10 = width;
  return ceilf(v10);
}

uint64_t SUUIStatusBarAlertStyleFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"information"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"success"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"failure"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"other"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id SUUIStatusBarAlertStyleGetColor(void *a1)
{
  switch((unint64_t)a1)
  {
    case 0uLL:
      a1 = objc_msgSend(MEMORY[0x263F825C8], "systemBlueColor", v1);
      goto LABEL_9;
    case 1uLL:
      a1 = objc_msgSend(MEMORY[0x263F825C8], "systemGreenColor", v1);
      goto LABEL_9;
    case 2uLL:
      a1 = objc_msgSend(MEMORY[0x263F825C8], "systemRedColor", v1);
      goto LABEL_9;
    case 3uLL:
      a1 = objc_msgSend(MEMORY[0x263F825C8], "systemPurpleColor", v1);
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

void sub_256765E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__69(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__69(uint64_t a1)
{
}

void sub_25676602C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SUUIShareSheetActivityTypeForUIActivityType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F1CFA0]])
  {
    uint64_t v2 = @"airdrop";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1CFD8]])
  {
    uint64_t v2 = @"facebook";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1CFB8]])
  {
    uint64_t v2 = @"mail";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1CFC8]])
  {
    uint64_t v2 = @"message";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1CFB0]])
  {
    uint64_t v2 = @"pasteboard";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D000]])
  {
    uint64_t v2 = @"sina-weibo";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1CFE8]])
  {
    uint64_t v2 = @"tencent-weibo";
  }
  else
  {
    uint64_t v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_256766EF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_25676740C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2567683FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25676C128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25676C5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__70(uint64_t a1)
{
}

SUUIMessageBanner *SUUIFamilyAlertMessageBanner(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v71 = a2;
  double v5 = +[SUUIFamilyCircleController sharedController];
  double v6 = [v5 iCloudFamily];
  long long v66 = v5;
  double v7 = [v5 familyCircle];
  CFIndex v8 = [MEMORY[0x263F7B0E8] defaultStore];
  long long v72 = [v8 activeAccount];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v9 = [v6 members];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v73 objects:v97 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    CGPoint v12 = 0;
    uint64_t v13 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v74 != v13) {
          objc_enumerationMutation(v9);
        }
        CFRange v15 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if ([v15 isMe])
        {
          id v16 = v15;

          CGPoint v12 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v73 objects:v97 count:16];
    }
    while (v11);
  }
  else
  {
    CGPoint v12 = 0;
  }

  *a3 = 0;
  id v67 = v4;
  if (!v7)
  {
    uint64_t v21 = [v6 members];
    uint64_t v22 = [v21 count];

    if (!v22) {
      goto LABEL_21;
    }
    uint64_t v23 = [v12 iTunesAccountDSID];
    __n128 v24 = [v72 uniqueIdentifier];
    char v25 = [v23 isEqual:v24];

    if ((v25 & 1) == 0)
    {
      *a3 = 1;
LABEL_36:
      if (v4) {
        [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH"];
      }
      else {
      uint64_t v29 = +[SUUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH" inBundles:0];
      }
      if (v4) {
        [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT"];
      }
      else {
      long long v68 = +[SUUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT" inBundles:0];
      }
      __n128 v64 = [NSString stringWithValidatedFormat:v29, @"%@", 0, v68 validFormatSpecifiers error];
      unsigned int v63 = 0;
      goto LABEL_48;
    }
    double v26 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v27 = [v26 BOOLForKey:@"SUUIUserDefaultsKeyHideFamilyBanner"];

    if (v27) {
      goto LABEL_21;
    }
    goto LABEL_27;
  }
  if (!v6 || !v12) {
    goto LABEL_21;
  }
  uint64_t v17 = [v12 iTunesAccountDSID];

  if (!v17)
  {
LABEL_27:
    *a3 = 3;
    goto LABEL_28;
  }
  uint64_t v18 = [v12 iTunesAccountDSID];
  uint64_t v19 = [v72 uniqueIdentifier];
  char v20 = [v18 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    *a3 = 2;
LABEL_25:
    if (v4) {
      [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2"];
    }
    else {
    uint64_t v29 = +[SUUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2" inBundles:0];
    }
    if (v4) {
      [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT"];
    }
    else {
    uint64_t v30 = +[SUUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT" inBundles:0];
    }
    Float64 v31 = NSString;
    long long v32 = [v12 appleID];
    long long v68 = (void *)v30;
    __n128 v64 = [v31 stringWithValidatedFormat:v29, @"%@%@", 0, v32, v30 validFormatSpecifiers error];

    unsigned int v63 = 0;
    *a3 = 2;
    goto LABEL_48;
  }
LABEL_21:
  uint64_t v28 = *a3;
  if (*a3 != 3)
  {
    if (v28 == 2) {
      goto LABEL_25;
    }
    if (v28 != 1)
    {
      unsigned int v63 = 0;
      __n128 v64 = 0;
      long long v68 = 0;
      uint64_t v29 = 0;
      goto LABEL_48;
    }
    goto LABEL_36;
  }
LABEL_28:
  if (v4) {
    [v4 localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE"];
  }
  else {
  uint64_t v29 = +[SUUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE" inBundles:0];
  }
  if (v4) {
    [v4 localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT"];
  }
  else {
  long long v68 = +[SUUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT" inBundles:0];
  }
  __n128 v64 = [NSString stringWithValidatedFormat:v29, @"%@", 0, v68 validFormatSpecifiers error];
  *a3 = 3;
  unsigned int v63 = 1;
LABEL_48:
  long long v33 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v34 = [v33 shouldLog];
  if ([v33 shouldLogToDisk]) {
    v34 |= 2u;
  }
  long long v35 = [v33 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
    int v36 = v34;
  }
  else {
    int v36 = v34 & 2;
  }
  __n128 v65 = v6;
  if (v36)
  {
    __n128 v62 = [v6 members];
    uint64_t v37 = v29;
    uint64_t v38 = [v62 count];
    uint64_t v39 = [v12 iTunesAccountDSID];
    uint64_t v40 = [v72 uniqueIdentifier];
    uint64_t v41 = *a3;
    int v81 = 138414082;
    double v82 = v7;
    __int16 v83 = 2112;
    double v84 = v6;
    __int16 v85 = 2048;
    uint64_t v86 = v38;
    uint64_t v29 = v37;
    __int16 v87 = 2112;
    v88 = v12;
    __int16 v89 = 2112;
    long long v90 = v39;
    __int16 v91 = 2112;
    long long v92 = v72;
    __int16 v93 = 2112;
    uint64_t v94 = v40;
    uint64_t v42 = (void *)v40;
    __int16 v95 = 2048;
    uint64_t v96 = v41;
    LODWORD(v6ITColor::ITColor((ITColor *)this + 1) = 82;
    __n128 v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43) {
      goto LABEL_57;
    }
    long long v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v81, v61);
    free(v43);
    SSFileLog();
  }

LABEL_57:
  long long v70 = (void *)v29;
  if (v29)
  {
    id v44 = objc_alloc_init(MEMORY[0x263F81650]);
    [v44 setAlignment:1];
    [v44 setLineBreakMode:4];
    v79[0] = *MEMORY[0x263F814F0];
    uint64_t v45 = v79[0];
    uint64_t v46 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    uint64_t v47 = *MEMORY[0x263F81500];
    v80[0] = v46;
    v80[1] = v71;
    uint64_t v48 = *MEMORY[0x263F81540];
    v79[1] = v47;
    v79[2] = v48;
    v80[2] = v44;
    __n128 v49 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:3];

    v77[0] = v45;
    __n128 v50 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    v78[0] = v50;
    v77[1] = v47;
    __n128 v51 = [MEMORY[0x263F825C8] blackColor];
    v77[2] = v48;
    v78[1] = v51;
    v78[2] = v44;
    __n128 v52 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];

    long long v53 = v64;
    __n128 v54 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v64 attributes:v52];
    uint64_t v55 = [v64 rangeOfString:v68];
    objc_msgSend(v54, "setAttributes:range:", v49, v55, v56);

    if (v54)
    {
      __n128 v57 = objc_alloc_init(SUUIMessageBanner);
      [(SUUIMessageBanner *)v57 setAttributedMessage:v54];
      [(SUUIMessageBanner *)v57 setShowsClearButton:v63];
    }
    else
    {
      __n128 v57 = 0;
    }
    uint64_t v58 = v67;
    long long v59 = v65;
  }
  else
  {
    __n128 v54 = 0;
    __n128 v57 = 0;
    uint64_t v58 = v67;
    long long v53 = v64;
    long long v59 = v65;
  }

  return v57;
}

unint64_t SUUIPageForCollectionView(void *a1)
{
  id v1 = a1;
  [v1 contentOffset];
  double v3 = v2;
  [v1 frame];
  double v5 = v4;

  return llround(v3 / v5);
}

void sub_25676E1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25676E824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__71(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__71(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__3_0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4_0(uint64_t a1)
{
}

void sub_25676FEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_256770514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__72(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__72(uint64_t a1)
{
}

void SUUIConsoleLogFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = &a9;
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = a1;
  uint64_t v13 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __SUUIConsoleLogFormat_block_invoke;
  v15[3] = &unk_2654022D0;
  id v16 = v13;
  id v14 = v13;
  [v12 evaluate:v15 completionBlock:0];
}

void __SUUIConsoleLogFormat_block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  double v3 = [a2 objectForKeyedSubscript:@"console"];
  double v4 = [v3 objectForKeyedSubscript:@"log"];
  v7[0] = *(void *)(a1 + 32);
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v6 = (id)[v4 callWithArguments:v5];
}

void SUUIConsoleLogObjects(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __SUUIConsoleLogObjects_block_invoke;
  v5[3] = &unk_2654022D0;
  id v6 = v3;
  id v4 = v3;
  [a1 evaluate:v5 completionBlock:0];
}

void __SUUIConsoleLogObjects_block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 objectForKeyedSubscript:@"console"];
  id v3 = [v5 objectForKeyedSubscript:@"log"];
  id v4 = (id)[v3 callWithArguments:*(void *)(a1 + 32)];
}

void sub_2567728D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

uint64_t SUUIProductPageFragmentWithURL(void *a1)
{
  id v1 = [a1 fragment];
  if ([v1 isEqualToString:@"reviews"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"related"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_256776EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25677762C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2567781F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t __Block_byref_object_copy__73(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__73(uint64_t a1)
{
}

void SUUINavigationBarController_SetTitleView(void *a1, void *a2)
{
  id v3 = a2;
  id v7 = a1;
  id v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_setTitleView_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(id, char *, id))Implementation)(v7, sel_setTitleView_, v3);
}

uint64_t storeShouldReverseLayoutDirection()
{
  if (didSetAtLeastOnce != -1) {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
  }
  return shouldFlipForRTL;
}

CGFloat SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SUUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    if (didSetAtLeastOnce != -1) {
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
    }
    if (shouldFlipForRTL)
    {
LABEL_5:
      v21.origin.CGFloat x = a6;
      v21.origin.CGFloat y = a7;
      v21.size.double width = a8;
      v21.size.CGFloat height = a9;
      double MaxX = CGRectGetMaxX(v21);
      v22.origin.CGFloat x = a2;
      v22.origin.CGFloat y = a3;
      v22.size.double width = a4;
      v22.size.CGFloat height = a5;
      double v18 = MaxX - CGRectGetMinX(v22);
      v23.origin.CGFloat x = a2;
      v23.origin.CGFloat y = a3;
      v23.size.double width = a4;
      v23.size.CGFloat height = a5;
      double v19 = v18 - CGRectGetWidth(v23);
      v24.origin.CGFloat x = a2;
      v24.origin.CGFloat y = a3;
      v24.size.double width = a4;
      v24.size.CGFloat height = a5;
      CGRectGetMinY(v24);
      v25.origin.CGFloat x = a2;
      v25.origin.CGFloat y = a3;
      v25.size.double width = a4;
      v25.size.CGFloat height = a5;
      CGRectGetWidth(v25);
      v26.origin.CGFloat x = a2;
      v26.origin.CGFloat y = a3;
      v26.size.double width = a4;
      v26.size.CGFloat height = a5;
      CGRectGetHeight(v26);
      return v19;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1) {
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_14_0);
    }
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1) {
      goto LABEL_5;
    }
  }
  return a2;
}

CGFloat SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat SUUIRectByRemovingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SUUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    if (didSetAtLeastOnce != -1) {
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
    }
    if (shouldFlipForRTL)
    {
LABEL_5:
      v20.origin.CGFloat x = a6;
      v20.origin.CGFloat y = a7;
      v20.size.double width = a8;
      v20.size.CGFloat height = a9;
      double MaxX = CGRectGetMaxX(v20);
      v21.origin.CGFloat x = a2;
      v21.origin.CGFloat y = a3;
      v21.size.double width = a4;
      v21.size.CGFloat height = a5;
      double v18 = MaxX - CGRectGetMaxX(v21);
      v22.origin.CGFloat x = a2;
      v22.origin.CGFloat y = a3;
      v22.size.double width = a4;
      v22.size.CGFloat height = a5;
      CGRectGetMinY(v22);
      v23.origin.CGFloat x = a2;
      v23.origin.CGFloat y = a3;
      v23.size.double width = a4;
      v23.size.CGFloat height = a5;
      CGRectGetWidth(v23);
      v24.origin.CGFloat x = a2;
      v24.origin.CGFloat y = a3;
      v24.size.double width = a4;
      v24.size.CGFloat height = a5;
      CGRectGetHeight(v24);
      return v18;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1) {
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_14_0);
    }
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1) {
      goto LABEL_5;
    }
  }
  return a2;
}

CGFloat SUUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __shouldReverseLayoutDirection_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F82438] sharedApplication];
  id v1 = [v0 keyWindow];
  uint64_t v2 = [v1 semanticContentAttribute];

  uint64_t result = [MEMORY[0x263F82E00] userInterfaceLayoutDirectionForSemanticContentAttribute:v2];
  if (result == 1) {
    shouldReverseLayoutDirection_shouldFlipForRTL = 1;
  }
  return result;
}

void sub_25677BCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__74(uint64_t a1)
{
}

void sub_25677C818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_25677E2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25677E6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25678005C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

void sub_256781B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
}

void sub_256781F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256782158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256782318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256782618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_256782B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__75(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__75(uint64_t a1)
{
}

void sub_256783B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256784398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567857BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__76(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{
}

void sub_256786AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256787268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567876B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256787794(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_256787ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256787BE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_256787EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUITracklistAttributedStringForButton(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 buttonTitleStyle];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 style];
  }
  uint64_t v9 = v8;

  uint64_t v10 = SUUIViewElementFontWithStyle(v9);
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-Medium" size:9.0];
  }
  uint64_t v11 = [v5 tintColor];
  id v12 = SUUIViewElementPlainColorWithStyle(v9, v11);

  if (!v12)
  {
    id v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  }
  uint64_t v13 = [v4 buttonText];
  id v14 = [v13 attributedStringWithDefaultFont:v10 foregroundColor:v12 textAlignment:1 style:v9];

  return v14;
}

id SUUITracklistAttributedStringForLabel(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 style];
  uint64_t v9 = SUUIViewElementFontWithStyle(v8);
  uint64_t v10 = [v7 tintColor];

  uint64_t v11 = SUUIViewElementPlainColorWithStyle(v8, v10);

  if (v5 && !v11)
  {
    if ([v5 isEnabled])
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    }
  }
  unint64_t v12 = [v6 labelViewStyle];
  if (v12 <= 5)
  {
    if (((1 << v12) & 0xB) != 0)
    {
      if (!v9)
      {
        uint64_t v9 = SUUIFontPreferredFontForTextStyle(5);
        if (v11) {
          goto LABEL_22;
        }
        goto LABEL_14;
      }
LABEL_13:
      if (v11) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (((1 << v12) & 0x24) == 0)
    {
      if (v9)
      {
        if (v11) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v9 = SUUIFontPreferredFontForTextStyle(5);
        if (v11) {
          goto LABEL_22;
        }
      }
      uint64_t v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
      goto LABEL_15;
    }
    if (v9) {
      goto LABEL_13;
    }
    id v14 = SUUIFontForTextStyle(21);
    uint64_t v15 = (void *)MEMORY[0x263F81708];
    [v14 pointSize];
    uint64_t v9 = objc_msgSend(v15, "fontWithName:size:", @"HelveticaNeue-Medium");

    if (!v11)
    {
LABEL_14:
      uint64_t v13 = [MEMORY[0x263F825C8] blackColor];
LABEL_15:
      uint64_t v11 = (void *)v13;
    }
  }
LABEL_22:
  id v16 = [v6 text];
  uint64_t v17 = [v16 attributedStringWithDefaultFont:v9 foregroundColor:v11 style:v8];

  return v17;
}

void sub_256788728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567895B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__77(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__77(uint64_t a1)
{
}

void sub_256789828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256789B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_256789FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25678ACE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25678C6B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25678CB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256790EF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_256791564(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_256791B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUITabBarControllerGetActiveNavigationController(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 selectedViewController];
  id v3 = [v1 transientViewController];
  if (!v3)
  {
    if (!v2)
    {
      id v9 = 0;
      goto LABEL_22;
    }
    id v5 = SUUITabBarControllerGetMoreNavigationController(v1);
    id v6 = [v1 allViewControllers];
    id v7 = v6;
    if (v5
      && (unint64_t v8 = [v6 indexOfObjectIdenticalTo:v2], v8 >= objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5)))
    {
      id v21 = v5;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v2;
        uint64_t v10 = [v9 visibleViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unint64_t v12 = [v9 visibleViewController];
          uint64_t v13 = [v12 childViewController];
          objc_opt_class();
          char v14 = objc_opt_isKindOfClass();

          if (v14)
          {
            uint64_t v15 = [v12 childViewController];
            id v16 = [v15 leftNavigationDocumentController];
            CGRect v24 = [v16 navigationController];

            uint64_t v17 = [v15 rightNavigationDocumentController];
            double v18 = [v17 navigationController];

            double v19 = v18;
            if (v18 || (double v19 = v24) != 0)
            {
              id v20 = v19;

              id v9 = v20;
            }
          }
        }
        goto LABEL_21;
      }
      id v21 = [v2 navigationController];
    }
    id v9 = v21;
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 navigationController];
  }
  id v9 = v4;
LABEL_22:
  id v22 = v9;

  return v22;
}

id SUUITabBarControllerGetFloatingOverlayViewController(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 floatingOverlayViewController];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(void *a1, void *a2, uint64_t a3)
{
  id v6 = a1;
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v6 setFloatingOverlayViewController:v5 animated:a3];
  }
  else if (v6 && v5)
  {
    NSLog(&cfstr_ErrorTryingToS.isa, v6);
  }
}

void sub_256792FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIIndexBarEntryDescriptorForIndexBarEntryViewElement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 style];
  uint64_t v6 = [v4 elementType];
  if (v6 == 49)
  {
    uint64_t v13 = [v4 resourceName];
    unint64_t v8 = v13;
    if (v13)
    {
      SUUIImageWithResourceName(v13);
      id v9 = (SUUIArtwork *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        unint64_t v12 = 0;
        goto LABEL_11;
      }
      uint64_t v14 = +[SUUIIndexBarEntryDescriptor entryDescriptorWithImage:v9];
    }
    else
    {
      uint64_t v15 = [SUUIArtwork alloc];
      id v16 = [v4 URL];
      [v4 size];
      id v9 = -[SUUIArtwork initWithURL:size:](v15, "initWithURL:size:", v16);

      uint64_t v14 = +[SUUIIndexBarEntryDescriptor entryDescriptorWithArtwork:v9];
    }
    unint64_t v12 = (void *)v14;
  }
  else
  {
    if (v6 != 138)
    {
      unint64_t v12 = 0;
      goto LABEL_12;
    }
    id v7 = [v4 style];
    unint64_t v8 = SUUIViewElementPlainColorWithStyle(v7, 0);

    id v9 = [v4 text];
    uint64_t v10 = SUUIViewElementFontWithStyle(v5);
    uint64_t v11 = [(SUUIArtwork *)v9 attributedStringWithDefaultFont:v10 foregroundColor:v8];
    unint64_t v12 = +[SUUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:v11];
  }
LABEL_11:

LABEL_12:
  objc_msgSend(v12, "setVisibilityPriority:", objc_msgSend(v3, "visibilityPriority"));

  return v12;
}

void sub_256795858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256795C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256796830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_256796CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id SUUIRequiredVisibilitySetForLocalizedIndexedCollation()
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F82928] currentCollation];
  id v1 = [v0 sectionIndexTitles];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:3];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        int v10 = [&unk_2705D0A30 containsObject:v9];
        if (v10 & 1) != 0 || ((v6 ^ 1))
        {
          v6 |= v10 ^ 1;
          [v2 addObject:v9];
        }
        else
        {
          int v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * j);
        int v18 = [&unk_2705D0A30 containsObject:v17];
        if (v18 & 1) != 0 || ((v14 ^ 1))
        {
          v14 |= v18 ^ 1;
          [v2 addObject:v17];
        }
        else
        {
          int v14 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  return v2;
}

uint64_t SUUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle(uint64_t a1)
{
  return [NSString stringWithFormat:@"systemBucketID-%@", a1];
}

void sub_25679BCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25679BE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__78(uint64_t a1)
{
}

void sub_25679C08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25679D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__79(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__79(uint64_t a1)
{
}

void sub_25679D4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SUUIInitializeDOMFeatureFactory()
{
  if (SUUIInitializeDOMFeatureFactory_sOnce != -1) {
    dispatch_once(&SUUIInitializeDOMFeatureFactory_sOnce, &__block_literal_global_51);
  }
}

void __SUUIInitializeDOMFeatureFactory_block_invoke()
{
  uint64_t v0 = objc_opt_class();
  SUUIRegisterDOMFeatureFactory(v0);
  id v1 = objc_opt_class();
  SUUIRegisterDOMFeatureFactory(v1);
  uint64_t v2 = objc_opt_class();
  SUUIRegisterDOMFeatureFactory(v2);
  id v3 = objc_opt_class();
  SUUIRegisterDOMFeatureFactory(v3);
  uint64_t v4 = objc_opt_class();
  SUUIRegisterDOMFeatureFactory(v4);
}

void SUUIRegisterDOMFeatureFactory(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [a1 possibleFeatureNames];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          [MEMORY[0x263F4B428] registerClass:a1 forFeatureName:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = (void *)MEMORY[0x263F4B428];
    id v8 = [a1 featureName];
    objc_msgSend(v7, "registerClass:forFeatureName:", a1);
  }
}

void sub_2567A2CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__80(uint64_t a1)
{
}

uint64_t SUUIArtworkSizeDeltaIsBetter(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 > 0 && a1 < a2;
  if (a2 < 0) {
    BOOL v3 = a1 > a2;
  }
  if (a1) {
    int v4 = v3;
  }
  else {
    int v4 = 1;
  }
  if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (a2) {
    return v5;
  }
  else {
    return 0;
  }
}

id getCNComposeRecipientViewDidChangeNotification()
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  uint64_t v7 = getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  if (!getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke;
    v3[3] = &unk_265405DA0;
    v3[4] = &v4;
    __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getCNComposeRecipientViewDidChangeNotification_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_2567A46F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567A4D54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2567A6FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __ContactsAutocompleteUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2654078C0;
    uint64_t v6 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v2 = (void *)ContactsAutocompleteUILibraryCore_frameworkLibrary;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary) {
    __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "CNComposeRecipientViewDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __ContactsAutocompleteUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsAutocompleteUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_2567A9E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__81(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__81(uint64_t a1)
{
}

void sub_2567AA038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567AA404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567AA650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_2567AC0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__82(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__82(uint64_t a1)
{
}

void sub_2567ACC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2567AD390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567AE574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567B2ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567B2EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567B3110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__83(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__83(uint64_t a1)
{
}

void sub_2567B4884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__84(uint64_t a1)
{
}

void sub_2567B6BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__85(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__85(uint64_t a1)
{
}

void sub_2567B72F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567B8EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

uint64_t __SUUIImagePlaceholderCornerPathBlockCreate_block_invoke()
{
  return objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:");
}

uint64_t __SUUIImagePlaceholderCornerPathBlockCreate_block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

void sub_2567BFA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567C036C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SUUIItemKindForString(uint64_t a1)
{
  uint64_t v2 = 0;
  while (![(id)qword_265407D70[v2 + 1] isEqualToString:a1])
  {
    v2 += 2;
    if (v2 == 50) {
      return 0;
    }
  }
  return qword_265407D70[v2];
}

BOOL SUUIItemKindIsSoftwareKind(uint64_t a1)
{
  return a1 == 12 || a1 == 17;
}

uint64_t SUUIItemDeviceFamilyIsUniversal(unsigned __int8 a1)
{
  return a1 & ((a1 & 6) != 0);
}

BOOL SUUIItemDeviceFamilyIsTVOnly(char a1)
{
  return (a1 & 0xF) == 8;
}

BOOL SUUIItemKindIsToneKind(uint64_t a1)
{
  return a1 == 11 || a1 == 16;
}

id SUUIItemScreenshotsForDictionary(void *a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [v1 objectForKey:*MEMORY[0x263F7BAB0]];
  objc_opt_class();
  uint64_t v40 = (void *)v3;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_48;
  }
  id v39 = v1;
  uint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  uint64_t v6 = (uint64_t)v5;

  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    uint64_t v9 = [v40 objectForKey:*MEMORY[0x263F7BA98]];
    if (!v9)
    {
      long long v10 = [v40 objectForKey:*MEMORY[0x263F7BAA8]];
      uint64_t v49 = -320 * v6;
      uint64_t v47 = -196 * v6;
      id v1 = v39;
      if (v10)
      {
        uint64_t v48 = -568 * v6;
        uint64_t v15 = -348;
      }
      else
      {
        long long v10 = [v40 objectForKey:*MEMORY[0x263F7BAA0]];
        uint64_t v48 = -480 * v6;
        uint64_t v15 = -294;
      }
      uint64_t v46 = v6 * v15;
      goto LABEL_14;
    }
    long long v10 = (void *)v9;
    uint64_t v46 = -300 * v6;
    uint64_t v47 = -225 * v6;
    uint64_t v48 = -1024 * v6;
    uint64_t v49 = -768 * v6;
    goto LABEL_9;
  }
  uint64_t v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 bounds];
  double v13 = v12;

  if (v13 <= 480.0
    || ([v40 objectForKey:*MEMORY[0x263F7BAA8]], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v10 = [v40 objectForKey:*MEMORY[0x263F7BAA0]];
    uint64_t v48 = -480 * v6;
    uint64_t v49 = -320 * v6;
    uint64_t v46 = -294 * v6;
    uint64_t v47 = -196 * v6;
LABEL_9:
    id v1 = v39;
    goto LABEL_14;
  }
  uint64_t v48 = -568 * v6;
  uint64_t v49 = -320 * v6;
  uint64_t v46 = -348 * v6;
  uint64_t v47 = -196 * v6;
  id v1 = v39;
  long long v10 = (void *)v14;
LABEL_14:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_47;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v38 = v10;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v17) {
    goto LABEL_46;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v55;
  id v42 = v16;
  __n128 v43 = v2;
  uint64_t v41 = *(void *)v55;
  do
  {
    uint64_t v20 = 0;
    uint64_t v44 = v18;
    do
    {
      if (*(void *)v55 != v19) {
        objc_enumerationMutation(v16);
      }
      long long v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = v20;
        id v22 = v21;
        long long v23 = objc_alloc_init(SUUIScreenshot);
        long long v24 = [[SUUIArtwork alloc] initWithArtworkDictionary:v22];

        [(SUUIScreenshot *)v23 setArtwork:v24 forVariant:@"high-dpi"];
        [(SUUIScreenshot *)v23 setArtwork:v24 forVariant:@"low-dpi"];
        long long v25 = v23;
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = v20;
        id v26 = v21;
        long long v23 = objc_alloc_init(SUUIScreenshot);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v25 = (SUUIScreenshot *)v26;
        uint64_t v27 = [(SUUIScreenshot *)v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (!v27) {
          goto LABEL_41;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v51;
        uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        while (1)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v33 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v34 = [[SUUIArtwork alloc] initWithArtworkDictionary:v33];
              uint64_t v35 = [(SUUIArtwork *)v34 width];
              if (v35 >= [(SUUIArtwork *)v34 height])
              {
                if (SUUIArtworkSizeDeltaIsBetter(v35 + v48, v30))
                {
                  [(SUUIScreenshot *)v23 setArtwork:v34 forVariant:@"high-dpi"];
                  uint64_t v30 = v35 + v48;
                }
                uint64_t v36 = v35 + v46;
                if (!SUUIArtworkSizeDeltaIsBetter(v36, v31)) {
                  goto LABEL_38;
                }
              }
              else
              {
                if (SUUIArtworkSizeDeltaIsBetter(v35 + v49, v30))
                {
                  [(SUUIScreenshot *)v23 setArtwork:v34 forVariant:@"high-dpi"];
                  uint64_t v30 = v35 + v49;
                }
                uint64_t v36 = v35 + v47;
                if ((SUUIArtworkSizeDeltaIsBetter(v36, v31) & 1) == 0) {
                  goto LABEL_38;
                }
              }
              [(SUUIScreenshot *)v23 setArtwork:v34, @"low-dpi", v38 forVariant];
              uint64_t v31 = v36;
LABEL_38:

              continue;
            }
          }
          uint64_t v28 = [(SUUIScreenshot *)v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (!v28)
          {
LABEL_41:

            long long v24 = (SUUIArtwork *)v23;
            id v16 = v42;
            uint64_t v2 = v43;
            uint64_t v19 = v41;
            uint64_t v18 = v44;
            if ([(SUUIScreenshot *)v23 numberOfVariants] >= 1)
            {
LABEL_42:
              objc_msgSend(v2, "addObject:", v23, v38);
              long long v23 = (SUUIScreenshot *)v24;
            }

            uint64_t v20 = v45;
            break;
          }
        }
      }
      ++v20;
    }
    while (v20 != v18);
    uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
  }
  while (v18);
LABEL_46:

  long long v10 = v38;
  id v1 = v39;
LABEL_47:

LABEL_48:
  return v2;
}

uint64_t __Block_byref_object_copy__86(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__86(uint64_t a1)
{
}

void SUUIInitializeViewElementStyleFactory()
{
  if (SUUIInitializeViewElementStyleFactory___onceToken != -1) {
    dispatch_once(&SUUIInitializeViewElementStyleFactory___onceToken, &__block_literal_global_55);
  }
}

uint64_t __SUUIInitializeViewElementStyleFactory_block_invoke()
{
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-lockup-min-width" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-shelf-layout" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-shelf-zooming-layout-peeking-item-width" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-shelf-zooming-layout-inter-item-spacing" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-shelf-zooming-layout-item-width" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-shelf-zooming-layout-zoomed-item-width" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"itml-shelf-zooming-layout-element-placement" withType:3 inherited:0];
  uint64_t v0 = (void *)MEMORY[0x263F4B4E8];
  return [v0 registerStyle:@"itml-segmented-control-width" withType:3 inherited:0];
}

void sub_2567CB468(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2567CBD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__87(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__87(uint64_t a1)
{
}

void sub_2567D10C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567D1E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__88(uint64_t a1)
{
}

uint64_t SUUIGraphicsDeviceHasASTCSupport()
{
  if (SUUIGraphicsDeviceHasASTCSupport_onceToken != -1) {
    dispatch_once(&SUUIGraphicsDeviceHasASTCSupport_onceToken, &__block_literal_global_56);
  }
  return SUUIGraphicsDeviceHasASTCSupport_supportsASTC;
}

uint64_t __SUUIGraphicsDeviceHasASTCSupport_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  SUUIGraphicsDeviceHasASTCSupport_supportsASTC = result;
  return result;
}

double SUUIGraphicsMatchViewBorderToStroke(void *a1, double a2)
{
  double v2 = a2 * 0.5;
  [a1 contentScaleFactor];
  return round(v2 * v3) / v3;
}

CFMutableDataRef SUUIGraphicsCreateASTCDataFromImage(uint64_t a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  if (SoftLinkImageIO_onceToken != -1) {
    dispatch_once(&SoftLinkImageIO_onceToken, &__block_literal_global_58);
  }
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v3 = weak_CGImageDestinationCreateWithData(Mutable, @"org.khronos.ktx", 1, 0);
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    v8[0] = weak_kCGImagePropertyEncoder;
    v8[1] = weak_kCGImagePropertyASTCBlockSize;
    v9[0] = weak_kCGImagePropertyASTCEncoder;
    v9[1] = &unk_2705D0DD8;
    double v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    weak_CGImageDestinationAddImage(v4, a1, v5);
    char v6 = weak_CGImageDestinationFinalize(v4);
    CFRelease(v4);
    if ((v6 & 1) == 0)
    {
      NSLog(&cfstr_SCouldNotConve.isa, "CFDataRef  _Nullable SUUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
      CFRelease(Mutable);
      CFMutableDataRef Mutable = 0;
    }
  }
  else
  {
    NSLog(&cfstr_SCouldNotCreat.isa, "CFDataRef  _Nullable SUUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef SUUIGraphicsCreateASTCDataFromBitmapContext(CGContext *a1)
{
  CGImageRef Image = CGBitmapContextCreateImage(a1);
  if (Image)
  {
    double v2 = Image;
    ASTCDataFromCGImageRef Image = SUUIGraphicsCreateASTCDataFromImage((uint64_t)Image);
    CGImageRelease(v2);
    return ASTCDataFromImage;
  }
  else
  {
    NSLog(&cfstr_SCouldNotCreat_0.isa, "CFDataRef  _Nullable SUUIGraphicsCreateASTCDataFromBitmapContext(CGContextRef _Nonnull)");
    return 0;
  }
}

SUUICompressedImage *SUUIGraphicsGetASTCImageFromCurrentImageContext(double a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext
    && (CFMutableDataRef ASTCDataFromBitmapContext = SUUIGraphicsCreateASTCDataFromBitmapContext(CurrentContext)) != 0)
  {
    CFMutableDataRef v4 = ASTCDataFromBitmapContext;
    if (fabs(a1) < 2.22044605e-16)
    {
      double v5 = [MEMORY[0x263F82B60] mainScreen];
      [v5 scale];
      a1 = v6;
    }
    uint64_t v7 = [[SUUICompressedImage alloc] initWithData:v4 scale:a1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

void sub_2567D55C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__89(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__89(uint64_t a1)
{
}

void SUUIIconColorsForColorScheme(void *a1, void *a2, void *a3, void *a4)
{
  id v12 = a1;
  uint64_t v7 = [v12 backgroundColor];
  if (v7)
  {
    uint64_t v8 = SUUIColorForStyleWithBrightness(v7, [v12 schemeStyle], -0.05, 0.25, -0.05, 0.25);
    uint64_t v9 = SUUIColorForStyleWithBrightness(v7, [v12 schemeStyle], -0.2, 0.0, -0.2, 0.05);
    uint64_t v10 = SUUIColorForStyleWithBrightness(v7, [v12 schemeStyle], -0.7, -0.2, -0.7, 0.0);
    uint64_t v11 = SUUIColorForStyleWithAlpha(v10, [v12 schemeStyle], 0.3, 1.0, 0.3, 0.3);

    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = [MEMORY[0x263F825C8] colorWithWhite:0.95 alpha:1.0];
  uint64_t v9 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
  uint64_t v11 = [MEMORY[0x263F825C8] colorWithWhite:0.3 alpha:0.3];
  if (a2) {
LABEL_3:
  }
    *a2 = v8;
LABEL_4:
  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v11;
  }
}

double *SUUIIconFrameForIconSize(double *result, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a5 != *MEMORY[0x263F001B0] || a6 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v8 = a5 / a3;
    double v9 = a6 / a4;
    if (v8 >= v9) {
      double v8 = v9;
    }
    a3 = ceil(a3 * v8);
    a4 = ceil(a4 * v8);
  }
  double v10 = 0.0;
  if (a7 > 0.0) {
    double v10 = 1.0;
  }
  if (result)
  {
    void *result = a3 + a7 * 2.0;
    result[1] = a4 + a7 * 2.0;
  }
  if (a2)
  {
    *a2 = a7;
    a2[1] = v10;
    a2[2] = a3;
    a2[3] = a4;
  }
  return result;
}

void sub_2567DB098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567DBA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SUUILockupViewTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"grid"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"list"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"shelf"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"product"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"brick"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"editorial"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"caption"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"tabular"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_2567DFE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_2567E04A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

double SUUISpacePageComponentHeightForString(void *a1)
{
  id v1 = a1;
  double v2 = 1.0;
  if (([v1 isEqualToString:@"XS"] & 1) == 0)
  {
    double v2 = 5.0;
    if (([v1 isEqualToString:@"S"] & 1) == 0)
    {
      double v2 = 7.0;
      if (([v1 isEqualToString:@"M"] & 1) == 0)
      {
        double v2 = 10.0;
        if (([v1 isEqualToString:@"L"] & 1) == 0)
        {
          double v2 = 25.0;
          if (([v1 isEqualToString:@"XL"] & 1) == 0)
          {
            if ([v1 isEqualToString:@"XXL"])
            {
              double v2 = 100.0;
            }
            else
            {
              [v1 floatValue];
              double v2 = v3;
            }
          }
        }
      }
    }
  }

  return v2;
}

void sub_2567E21C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2567E22BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2567E2474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__90(uint64_t a1)
{
}

void sub_2567E2618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567E8F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567E8FF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2567E98E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__91(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{
}

void sub_2567E9CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567E9F74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2567EB098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2567EC324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567EC68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567EF2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567EFDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567F0D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

Class __getAMSURLParserClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AppleMediaServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2654084B8;
    uint64_t v5 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0) {
    __getAMSURLParserClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AMSURLParser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSURLParserClass_block_invoke_cold_2();
  }
  getAMSURLParserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_2567F2D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567F582C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2567F5A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567F75E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&STACK[0x348], 8);
  _Block_object_dispose((const void *)(v62 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_2567F8874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567F8BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567F9030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__92(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__92(uint64_t a1)
{
}

void sub_2567F92D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2567F9624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2567F9B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIFacebookViewElementTypeForString(void *a1)
{
  return [a1 isEqualToString:@"large"];
}

void sub_2567FA810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567FAC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567FAF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567FB614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__93(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__93(uint64_t a1)
{
}

void sub_2567FBC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567FC6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567FC8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2567FD418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_2567FDC74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL _SUUIScrollViewIsCompetingWithScrollView(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 panGestureRecognizer];
  if (_SUUIScrollViewCanScrollHorizontally(v3)) {
    int v6 = [v5 _canPanHorizontally];
  }
  else {
    int v6 = 0;
  }
  if (_SUUIScrollViewCanScrollVertically(v3)) {
    int v7 = [v5 _canPanVertically];
  }
  else {
    int v7 = 0;
  }
  double v8 = [v4 panGestureRecognizer];
  if (_SUUIScrollViewCanScrollHorizontally(v4)) {
    int v9 = [v8 _canPanHorizontally];
  }
  else {
    int v9 = 0;
  }
  CanScrollVerticallCGFloat y = _SUUIScrollViewCanScrollVertically(v4);
  if (CanScrollVertically) {
    CanScrollVerticallCGFloat y = [v8 _canPanVertically];
  }
  BOOL v12 = v6 != v9 && v7 != CanScrollVertically;

  return v12;
}

uint64_t _SUUIScrollViewWantsToBeginTrackingImmediately(void *a1)
{
  id v1 = a1;
  if (([v1 isDecelerating] & 1) == 0)
  {
    id v2 = v1;
    if (([v2 isDecelerating] & 1) == 0
      && ([v2 isDragging] & 1) == 0
      && ([v2 isTracking] & 1) == 0)
    {

LABEL_29:
      uint64_t v38 = 0;
      goto LABEL_22;
    }
    [v2 contentOffset];
    double v43 = v4;
    double v44 = v3;
    uint64_t v5 = [v2 traitCollection];
    [v5 displayScale];
    double v7 = v6;

    if (v7 < 0.00000011920929)
    {
      double v8 = [MEMORY[0x263F82B60] mainScreen];
      [v8 scale];
      double v7 = v9;
    }
    [v2 contentInset];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v2 contentSize];
    double v20 = -v13;
    if (v7 == 1.0 || v7 == 0.0)
    {
      double v22 = round(v20);
      double v24 = round(-v11);
      double v26 = round(v17 + v18);
      double v42 = round(v15 + v19);
      double v30 = round(v17 + v13 + v18);
      double v33 = round(v15 + v11 + v19);
    }
    else
    {
      double v21 = floor(v20);
      double v22 = v21 + round(v7 * (v20 - v21)) / v7;
      double v23 = floor(-v11);
      double v24 = v23 + round(v7 * (-v11 - v23)) / v7;
      double v25 = floor(v17 + v18);
      double v26 = v25 + round(v7 * (v17 + v18 - v25)) / v7;
      double v27 = floor(v15 + v19);
      double v42 = v27 + round(v7 * (v15 + v19 - v27)) / v7;
      double v28 = v17 + v13 + v18;
      double v29 = floor(v28);
      double v30 = v29 + round(v7 * (v28 - v29)) / v7;
      double v31 = v15 + v11 + v19;
      double v32 = floor(v31);
      double v33 = v32 + round(v7 * (v31 - v32)) / v7;
    }
    [v2 bounds];
    if (v44 < v22 || (v34 >= v30 ? (double v36 = v30) : (double v36 = v34), v44 <= v26 - v36 ? (v37 = v43 < v24) : (v37 = 1), v37))
    {
    }
    else
    {
      if (v35 >= v33) {
        double v40 = v33;
      }
      else {
        double v40 = v35;
      }
      double v41 = v42 - v40;

      if (v43 <= v41) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v38 = [v1 tracksImmediatelyWhileDecelerating];
LABEL_22:

  return v38;
}

void sub_2567FF358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SUUIScrollViewCanScrollHorizontally(void *a1)
{
  id v1 = a1;
  [v1 contentInset];
  double v3 = v2;
  double v5 = v4;
  [v1 contentSize];
  double v7 = v6;
  [v1 bounds];
  if (v5 + v3 + v7 <= v8)
  {
    if ([v1 alwaysBounceHorizontal]) {
      uint64_t v9 = [v1 bouncesHorizontally];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t _SUUIScrollViewCanScrollVertically(void *a1)
{
  id v1 = a1;
  [v1 contentInset];
  double v3 = v2;
  double v5 = v4;
  [v1 contentSize];
  double v7 = v6;
  [v1 bounds];
  if (v5 + v3 + v7 <= v8)
  {
    if ([v1 alwaysBounceVertical]) {
      uint64_t v9 = [v1 bouncesVertically];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

void sub_256800C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2568010D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256801F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_2568024A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void ITColor::ITColor(ITColor *this)
{
  this->double var0 = 0.0;
  this->double var1 = 0.0;
  this->double var2 = 0.0;
  this->double var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3, double a4)
{
  this->double var0 = a2;
  this->double var1 = a3;
  this->double var2 = a4;
  this->double var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3, double a4, double a5)
{
  this->double var0 = a2;
  this->double var1 = a3;
  this->double var2 = a4;
  this->double var3 = a5;
}

void ITColor::ITColor(ITColor *this, CGColorRef color)
{
  this->double var0 = 0.0;
  this->double var1 = 0.0;
  this->double var2 = 0.0;
  this->double var3 = 1.0;
  Components = CGColorGetComponents(color);
  switch(CGColorGetNumberOfComponents(color))
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      this->double var3 = Components[1];
LABEL_3:
      double v5 = *Components;
      this->double var1 = *Components;
      this->double var2 = v5;
      this->double var0 = v5;
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      this->double var3 = Components[3];
LABEL_5:
      this->double var0 = *Components;
      this->double var1 = Components[1];
      this->double var2 = Components[2];
      break;
    default:
      break;
  }
  ColorSpace = CGColorGetColorSpace(color);
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  this->double var0 = ITColor::ConvertColorSpace(this, ColorSpace, SRGB);
  this->double var1 = v8;
  this->double var2 = v9;
  this->double var3 = v10;
}

double ITColor::ConvertColorSpace(ITColor *this, CGColorSpaceRef space, CGColorSpace *cf2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int data = 0;
  if (!space || !cf2 || !CFEqual(space, cf2))
  {
    long long v7 = *(_OWORD *)&this->var2;
    *(_OWORD *)components = *(_OWORD *)&this->var0;
    long long v15 = v7;
    double v8 = CGColorCreate(space, components);
    if (v8)
    {
      double v9 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, cf2, 0x4002u);
      double v10 = v9;
      if (v9)
      {
        CGContextSetFillColorWithColor(v9, v8);
        v17.origin.CGFloat x = 0.0;
        v17.origin.CGFloat y = 0.0;
        v17.size.double width = 1.0;
        v17.size.CGFloat height = 1.0;
        CGContextFillRect(v10, v17);
        LOBYTE(v1ITColor::ITColor((ITColor *)this + 1) = BYTE1(data);
        double v6 = (double)v11 / 255.0;
LABEL_10:
        CGColorRelease(v8);
        CGContextRelease(v10);
        return v6;
      }
    }
    else
    {
      double v10 = 0;
    }
    double v6 = 0.0;
    goto LABEL_10;
  }
  return this->var0;
}

void ITColor::ITColor(ITColor *this, const RGBColor *a2, double a3, double a4, double a5)
{
  LOWORD(aITColor::ITColor((ITColor *)this + 3) = a2->red;
  double v5 = (double)*(unint64_t *)&a3 / 65535.0;
  LOWORD(aITColor::ITColor((ITColor *)this + 5) = a2->green;
  this->double var0 = v5;
  this->double var1 = (double)*(unint64_t *)&a5 / 65535.0;
  LOWORD(vITColor::ITColor((ITColor *)this + 5) = a2->blue;
  this->double var2 = (double)*(unint64_t *)&v5 / 65535.0;
  this->double var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3)
{
  this->double var0 = a2;
  this->double var1 = a2;
  this->double var2 = a2;
  this->double var3 = a3;
}

uint64_t ITColor::GetARGBBits(ITColor *this)
{
  uint32x2_t v1 = vshl_u32((uint32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(*(float64x2_t *)&this->var0, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)))), (uint32x2_t)0x800000010);
  return v1.i32[0] | (this->var2 * 255.0) | v1.i32[1] | ((this->var3 * 255.0) << 24);
}

unint64_t ITColor::operator RGBColor(uint64_t a1)
{
  int32x2_t v1 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(*(float64x2_t *)(a1 + 8), (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL))));
  v2.i64[0] = v1.u32[0];
  v2.i64[1] = v1.u32[1];
  int64x2_t v3 = (int64x2_t)vshlq_u64(v2, (uint64x2_t)xmmword_2568A1A30);
  return vorrq_s8((int8x16_t)vdupq_laneq_s64(v3, 1), (int8x16_t)v3).u64[0] | (int)(*(double *)a1 * 65535.0);
}

BOOL ITColor::operator==(double *a1, double *a2)
{
  return *a2 == *a1 && a2[1] == a1[1] && a2[2] == a1[2] && a2[3] == a1[3];
}

BOOL ITColor::operator!=(double *a1, double *a2)
{
  return *a2 != *a1 || a2[1] != a1[1] || a2[2] != a1[2] || a2[3] != a1[3];
}

CGColorRef ITColor::CreateCGColor(ITColor *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v1 = *(_OWORD *)&this->var2;
  v4[0] = *(_OWORD *)&this->var0;
  v4[1] = v1;
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  return CGColorCreate(SRGB, (const CGFloat *)v4);
}

double ITColor::CreateFromHSVColor(double *a1)
{
  double v4 = 0.0;
  double v2 = 0.0;
  double v3 = 0.0;
  HSV2RGB(*a1, a1[1], a1[2], &v4, &v3, &v2);
  return v4;
}

double *HSV2RGB(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
  if (a2 > 1.0) {
    a2 = 1.0;
  }
  if (a2 >= 0.0) {
    double v6 = a2;
  }
  else {
    double v6 = 0.0;
  }
  if (a3 <= 1.0) {
    double v7 = a3;
  }
  else {
    double v7 = 1.0;
  }
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  if (v6 == 0.0)
  {
    void *result = v7;
    *a5 = v7;
  }
  else
  {
    if (a1 > 1.0) {
      a1 = 1.0;
    }
    if (a1 >= 0.0) {
      double v8 = a1 * 6.0;
    }
    else {
      double v8 = 0.0;
    }
    int v9 = (int)v8;
    double v10 = v6 * v7 * (v8 - (double)(int)v8);
    double v11 = v7 - v6 * v7;
    double v12 = v11 + v10;
    if (v11 + v10 > 1.0) {
      double v12 = 1.0;
    }
    double v13 = v7 - v10;
    if (v13 > 1.0) {
      double v13 = 1.0;
    }
    double v14 = v11;
    if (v9) {
      double v15 = v13;
    }
    else {
      double v15 = v12;
    }
    if (v14 <= 1.0) {
      double v16 = v14;
    }
    else {
      double v16 = 1.0;
    }
    double v17 = v7;
    switch(v9)
    {
      case 0:
      case 5:
        break;
      case 1:
      case 4:
        double v17 = v15;
        break;
      default:
        double v17 = v16;
        break;
    }
    void *result = v17;
    double v18 = v7;
    if ((v9 - 1) >= 2)
    {
      BOOL v19 = v9 == 3 || v9 == 0;
      double v18 = v15;
      if (!v19) {
        double v18 = v16;
      }
    }
    *a5 = v18;
    if ((v9 - 3) >= 2)
    {
      BOOL v20 = v9 == 5 || v9 == 2;
      double v7 = v15;
      if (!v20) {
        double v7 = v16;
      }
    }
  }
  *a6 = v7;
  return result;
}

double ITColor::CreateFromHSVDoubles(ITColor *this, double a2, double a3, double a4)
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  HSV2RGB(a2, a3, a4, &v7, &v6, &v5);
  return v7;
}

double ITColor::GetHSVColor(ITColor *this)
{
  RGB2HSV(this->var0, this->var1, this->var2, &v2, (double *)&v3, (double *)&v4);
  return v2;
}

double *RGB2HSV(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
  if (a1 >= 1.0) {
    a1 = 1.0;
  }
  double v6 = 0.0;
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a2 >= 1.0) {
    a2 = 1.0;
  }
  if (a2 < 0.0) {
    a2 = 0.0;
  }
  if (a3 >= 1.0) {
    a3 = 1.0;
  }
  if (a3 >= 0.0) {
    double v7 = a3;
  }
  else {
    double v7 = 0.0;
  }
  if (a2 <= a1) {
    double v8 = a1;
  }
  else {
    double v8 = a2;
  }
  if (a2 >= a1) {
    double v9 = a1;
  }
  else {
    double v9 = a2;
  }
  if (v7 <= a1) {
    double v10 = a1;
  }
  else {
    double v10 = v7;
  }
  if (v7 >= a1) {
    double v11 = a1;
  }
  else {
    double v11 = v7;
  }
  if (a2 <= v7) {
    double v8 = v10;
  }
  if (a2 >= v7) {
    double v9 = v11;
  }
  if (v8 <= 1.0) {
    double v12 = v8;
  }
  else {
    double v12 = 1.0;
  }
  *a6 = v12;
  if (v8 == 0.0)
  {
    *a5 = 0.0;
  }
  else
  {
    double v13 = v8 - v9;
    double v14 = v13 / v8;
    if (v13 / v8 <= 1.0)
    {
      *a5 = v14;
      if (v14 == 0.0) {
        goto LABEL_51;
      }
    }
    else
    {
      *a5 = 1.0;
    }
    if (v13 == 0.0)
    {
      double v15 = 0.0;
      double v16 = 0.0;
    }
    else
    {
      double v6 = (v8 - a1) / v13;
      double v15 = (v8 - a2) / v13;
      double v16 = (v8 - v7) / v13;
    }
    if (a1 == v8)
    {
      double v17 = v16 - v15;
    }
    else if (a2 == v8)
    {
      double v17 = v6 + 2.0 - v16;
    }
    else
    {
      double v17 = v15 + 4.0 - v6;
    }
    double v18 = v17 / 6.0;
    if (v18 < 0.0) {
      double v18 = v18 + 1.0;
    }
    if (v18 <= 1.0) {
      double v6 = v18;
    }
    else {
      double v6 = 1.0;
    }
  }
LABEL_51:
  void *result = v6;
  return result;
}

double ITColor::GetHSVColorForRGBValues(ITColor *this, double a2, double a3, double a4)
{
  RGB2HSV(a2, a3, a4, &v5, (double *)&v6, (double *)&v7);
  return v5;
}

double ITColor::GetHSVColorForRGBValues(ITColor *this, unsigned int a2, unsigned int a3)
{
  RGB2HSV((double)this / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, &v4, (double *)&v5, (double *)&v6);
  return v4;
}

void ITColor::GetLuminance(ITColor *this)
{
  uint64_t v1 = 0;
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v4 = *(_OWORD *)&this->var0;
  double var2 = this->var2;
  do
  {
    double v2 = *(double *)((char *)&v4 + v1);
    if (v2 <= 0.0392800011) {
      double v3 = v2 / 12.9200001;
    }
    else {
      double v3 = pow((v2 + 0.0549999997) / 1.05499995, 2.4);
    }
    *(double *)((char *)&v4 + vITColor::ITColor((ITColor *)this + 1) = v3;
    v1 += 8;
  }
  while (v1 != 24);
}

double ITColor::GetContrastWithColor(ITColor *this, ITColor *a2)
{
  ITColor::GetLuminance(a2);
  double v4 = v3;
  ITColor::GetLuminance(this);
  if (v5 <= v4) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  if (v5 > v4) {
    double v5 = v4;
  }
  return (v6 + 0.0500000007) / (v5 + 0.0500000007);
}

double ITColor::GetContrastWithLuminance(ITColor *this, double a2)
{
  ITColor::GetLuminance(this);
  if (v3 <= a2) {
    double v4 = a2;
  }
  else {
    double v4 = v3;
  }
  if (v3 > a2) {
    double v3 = a2;
  }
  return (v4 + 0.0500000007) / (v3 + 0.0500000007);
}

double ITColor::GetHueDistanceFromColor(double *a1, double *a2)
{
  double v2 = *a1;
  double v3 = *a2;
  double result = vabdd_f64(*a1, *a2);
  if (result > 0.5)
  {
    double result = v3 + 1.0 - v2;
    if (v2 <= v3) {
      return v2 + 1.0 - v3;
    }
  }
  return result;
}

BOOL ITColor::IsCloseToColor(ITColor *this, ITColor *a2, double a3)
{
  if (a3 <= 0.0 || a3 >= 1.0) {
    return 0;
  }
  double HSVColor = ITColor::GetHSVColor(this);
  double v8 = v7;
  double v10 = v9;
  double v11 = ITColor::GetHSVColor(a2);
  if (vabdd_f64(v8, v13) > a3 || vabdd_f64(v10, v12) > a3) {
    return 0;
  }
  if (vabdd_f64(HSVColor, v11) <= a3) {
    return 1;
  }
  double v14 = HSVColor + 1.0;
  if (HSVColor >= a3) {
    double v14 = HSVColor;
  }
  if (v11 < a3) {
    double v11 = v11 + 1.0;
  }
  return vabdd_f64(v14, v11) <= a3;
}

double ITColor::CreateBlendedColorWithFraction(ITColor *this, double a2, ITColor a3)
{
  if (a2 < 1.0)
  {
    if (a2 <= 0.0) {
      a3.double var0 = this->var0;
    }
    else {
      a3.double var0 = (1.0 - a2) * this->var0 + a3.var0 * a2;
    }
  }
  return a3.var0;
}

__CFString *SUUIMediaQueryNetworkTypeString(uint64_t a1)
{
  uint64_t v1 = @"none";
  double v2 = @"wifi";
  if (a1 != 1000) {
    double v2 = 0;
  }
  if (a1) {
    uint64_t v1 = v2;
  }
  if ((unint64_t)(a1 - 1) >= 8) {
    return v1;
  }
  else {
    return @"cellular";
  }
}

void sub_256805DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256806A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256806ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2568074B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_256807A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAMSUIDynamicViewControllerClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesUILibrary();
  Class result = objc_getClass("AMSUIDynamicViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSUIDynamicViewControllerClass_block_invoke_cold_1();
  }
  getAMSUIDynamicViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AppleMediaServicesUILibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __AppleMediaServicesUILibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_2654088D8;
    uint64_t v2 = 0;
    AppleMediaServicesUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary) {
    AppleMediaServicesUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __AppleMediaServicesUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getAMSUIWebViewControllerClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesUILibrary();
  Class result = objc_getClass("AMSUIWebViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSUIWebViewControllerClass_block_invoke_cold_1();
  }
  getAMSUIWebViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_25680EB7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_25680F890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25680FC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id SUUIStackedBarNavAnimationController(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id)[v8 view];
  id v11 = (id)[v9 view];
  uint64_t v12 = [v9 view];
  [v12 layoutSubviews];

  double v13 = [v8 SUUIStackedBar];
  uint64_t v14 = [v9 SUUIStackedBar];
  uint64_t v15 = (void *)v14;
  id v16 = 0;
  if (v13 && v14)
  {
    [v13 _resetNewOffset];
    [v15 _resetNewOffset];
    double v17 = SUUINavigationControllerGetItemsForViewController(v7, v8);
    [v13 setItems:v17];

    [v13 sizeToFit];
    double v18 = [v8 contentScrollView];

    if (v18)
    {
      int v19 = [v13 splitViewStyle];
      [v13 frame];
      if (v19) {
        double v21 = v20;
      }
      else {
        double v21 = v20 + -20.0;
      }
      double v22 = [v8 contentScrollView];
      SUUIScrollViewSetContentInsets(v22, "com.apple.iTunesStoreUI.stackedBarInset", v21, 0.0, 0.0, 0.0);
    }
    double v23 = SUUINavigationControllerGetItemsForViewController(v7, v9);
    [v15 setItems:v23];

    [v15 sizeToFit];
    double v24 = [v9 contentScrollView];

    if (v24)
    {
      int v25 = [v15 splitViewStyle];
      [v15 frame];
      if (v25) {
        double v27 = v26;
      }
      else {
        double v27 = v26 + -20.0;
      }
      double v28 = [v9 contentScrollView];
      SUUIScrollViewSetContentInsets(v28, "com.apple.iTunesStoreUI.stackedBarInset", v27, 0.0, 0.0, 0.0);
    }
    if (a2 == 1)
    {
      double v29 = off_2653FF980;
      double v30 = v8;
      goto LABEL_17;
    }
    if (a2 == 2)
    {
      double v29 = off_2653FF978;
      double v30 = v9;
LABEL_17:
      id v16 = objc_alloc_init(*v29);
      [v16 setFromBar:v13];
      [v16 setToBar:v15];
      [v30 SUUIStackedBarSplit];
      objc_msgSend(v16, "setSplit:");
      goto LABEL_19;
    }
    id v16 = 0;
  }
LABEL_19:

  return v16;
}

id SUUINavigationControllerGetItemsForViewController(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  double v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v6 = objc_msgSend(v3, "viewControllers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = [v11 navigationItem];
      [v5 addObject:v12];

      if (v11 == v4) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  double v13 = [v3 viewControllers];
  char v14 = [v13 containsObject:v4];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [v4 navigationItem];
    [v5 addObject:v15];
  }
  return v5;
}

void SUUIStackedBarNavDidShow(void *a1, void *a2)
{
  id v12 = a1;
  id v3 = a2;
  id v4 = [v3 SUUIStackedBar];
  if (v4)
  {
    double v5 = SUUINavigationControllerGetItemsForViewController(v12, v3);
    [v4 setItems:v5];

    [v4 frame];
    if (CGRectGetHeight(v14) == 0.0) {
      [v4 sizeToFit];
    }
    double v6 = [v3 contentScrollView];

    if (v6)
    {
      objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      double v8 = v7;
      if ([v4 splitViewStyle])
      {
        [v4 frame];
        double v10 = v9;
      }
      else
      {
        double v10 = v8 + -20.0;
      }
      id v11 = [v3 contentScrollView];
      SUUIScrollViewSetContentInsets(v11, "com.apple.iTunesStoreUI.stackedBarInset", v10, 0.0, 0.0, 0.0);
    }
  }
}

void SUUIScrollViewSetContentInsets(void *a1, const void *a2, double a3, double a4, double a5, double a6)
{
  id object = a1;
  double v7 = objc_getAssociatedObject(object, a2);
  double v8 = v7;
  if (v7)
  {
    [v7 UIEdgeInsetsValue];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x263F834E8];
    double v12 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v14 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v16 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  [object contentInset];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [object scrollIndicatorInsets];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  if (v12 != a4 || v10 != a3 || v16 != a6 || v14 != a5)
  {
    double v36 = a3 - v10;
    double v37 = v36 + v18;
    double v38 = a4 - v12;
    double v39 = a4 - v12 + v20;
    double v40 = a5 - v14;
    double v41 = a5 - v14 + v22;
    double v42 = a6 - v16;
    double v43 = a6 - v16 + v24;
    double v44 = v26;
    double v45 = v28;
    double v46 = v30;
    double v47 = v32;
    objc_msgSend(object, "setContentInset:", v37, v39, v41, v43);
    objc_msgSend(object, "setScrollIndicatorInsets:", v36 + v44, v38 + v45, v40 + v46, v42 + v47);
    uint64_t v48 = objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", a3, a4, a5, a6);
    objc_setAssociatedObject(object, a2, v48, (void *)1);
  }
}

void sub_256813264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__94(uint64_t a1)
{
}

void *__Block_byref_object_copy__95(uint64_t a1, uint64_t a2)
{
  Class result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__95(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__2_1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3_1(uint64_t a1)
{
}

void sub_25681558C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256817290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256818D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_25681B5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__96(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__96(uint64_t a1)
{
}

void sub_25681B92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25681D90C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25681DFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25681E9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIButtonViewTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"buy"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"download"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"link"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"image"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"imagetext"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    if ([v1 isEqualToString:@"textonly"]) {
      goto LABEL_12;
    }
    if ([v1 isEqualToString:@"done"])
    {
      uint64_t v2 = 8;
      goto LABEL_29;
    }
    if ([v1 isEqualToString:@"sample"])
    {
      uint64_t v2 = 4;
      goto LABEL_29;
    }
    if ([v1 isEqualToString:@"back"])
    {
      uint64_t v2 = 1;
      goto LABEL_29;
    }
    if ([v1 isEqualToString:@"cancel"])
    {
      uint64_t v2 = 10;
      goto LABEL_29;
    }
    if ([v1 isEqualToString:@"destructive"])
    {
      uint64_t v2 = 11;
      goto LABEL_29;
    }
    if ([v1 isEqualToString:@"disabled"])
    {
LABEL_12:
      uint64_t v2 = 9;
    }
    else if ([v1 isEqualToString:@"play"])
    {
      uint64_t v2 = 12;
    }
    else if ([v1 isEqualToString:@"thin"])
    {
      uint64_t v2 = 13;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
LABEL_29:

  return v2;
}

void sub_25681EE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__97(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__97(uint64_t a1)
{
}

BOOL SUUIIKViewElementTypeIsButton(unint64_t a1)
{
  BOOL result = 1;
  if (a1 > 0x32 || ((1 << a1) & 0x4000000003000) == 0) {
    return a1 == 141;
  }
  return result;
}

void sub_256821498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__98(uint64_t a1)
{
}

void sub_25682163C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2568230FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__99(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__99(uint64_t a1)
{
}

void sub_256823654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_256823FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__100(uint64_t a1)
{
}

void sub_25682445C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2568247A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t SUUIPhysicalCircleConstantsWithTraitCollection@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = xmmword_2568A1E30;
  *(_OWORD *)(a2 + 1ITColor::ITColor((ITColor *)this + 6) = 0u;
  *(_OWORD *)(a2 + 3ITColor::ITColor((ITColor *)this + 2) = xmmword_2568A1E40;
  *(_OWORD *)(a2 + 4ITColor::ITColor((ITColor *)this + 8) = 0u;
  *(void *)(a2 + 4ITColor::ITColor((ITColor *)this + 8) = 0x4000000000000000;
  uint64_t result = [a1 horizontalSizeClass];
  double v4 = 10.0;
  if (result == 2) {
    double v4 = 12.0;
  }
  *(double *)(a2 + 5ITColor::ITColor((ITColor *)this + 6) = v4;
  return result;
}

void sub_256827EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2568280E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2568283BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256828C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__101(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__101(uint64_t a1)
{
}

void sub_25682C4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25682C994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25682CC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_25682CD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__102(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__102(uint64_t a1)
{
}

void sub_25682D0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25682D3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_25682E518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_256835B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SoftwareLibraryChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _reloadSoftwareLibrary];
}

void sub_2568369E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

SUUILibraryItem *SUUILibraryItemForStoreIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(SUUILibraryItem);
  [(SUUILibraryItem *)v2 setStoreIdentifier:v1];

  return v2;
}

BOOL SUUIItemStateCenterUseAppstoredPurchases(void *a1)
{
  id v1 = a1;
  if (SUUIItemStateCenterUseAppstorePurchasesSwitchEnabled()) {
    BOOL v2 = [v1 itemKind] == 12 || objc_msgSend(v1, "itemKind") == 17;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

void sub_256838C3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__103(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__103(uint64_t a1)
{
}

void sub_256840E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_256841340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __PurchaseHistoryChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _reloadPurchaseHistory];
}

void sub_2568416C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_256841838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2568419C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256842298(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2568425D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2568429C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SUUIItemStateCenterUseAppstorePurchasesSwitchEnabled()
{
  uint64_t v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (([v1 isEqualToString:@"com.apple.AppStore"] & 1) != 0
    || [v1 isEqualToString:@"com.apple.ios.StoreKitUIService"])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseAppstoredPurchases", @"com.apple.AppStore", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v3 = AppBooleanValue == 0;
    }
    else {
      BOOL v3 = 0;
    }
    uint64_t v4 = !v3;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_256848B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256849A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v24 - 160));
  _Unwind_Resume(a1);
}

void sub_256849C58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25684A934(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_25684BAE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25684EDC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_25684F064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25684F30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25684F9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25684FC48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25684FE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25684FFC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __AccountsChanged(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ____AccountsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_25685124C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2568516FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2568525B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_256852D58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_256852FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double SUUIImageRectForBounds(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return SUUIImageRectForBoundsAndPadding(a1, a2, a3, a4, a5, a6, a7, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
}

double SUUIImageRectForBoundsAndPadding(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  BOOL v18 = a11 == *(double *)(MEMORY[0x263F834E8] + 8);
  if (a10 != *MEMORY[0x263F834E8]) {
    BOOL v18 = 0;
  }
  if (a13 != *(double *)(MEMORY[0x263F834E8] + 24)) {
    BOOL v18 = 0;
  }
  BOOL v19 = a12 == *(double *)(MEMORY[0x263F834E8] + 16);
  double v20 = a11 + a13;
  double v21 = a10 + a12;
  if (v18 && v19) {
    double v20 = 0.0;
  }
  double v22 = a6 - v20;
  if (v18 && v19) {
    double v21 = 0.0;
  }
  double v23 = a7 - v21;
  if (a1 == 1)
  {
    double v25 = v22 / a2;
    if (v22 / a2 < v23 / a3) {
      double v25 = v23 / a3;
    }
    double v24 = ceil(a2 * v25);
    return floor((v22 - v24) * 0.5);
  }
  if (!a1)
  {
    double v24 = floor(a2 * (v23 / a3));
    if (a2 <= 0.0) {
      double v24 = v22;
    }
    if (a3 < a2) {
      double v24 = v22;
    }
    return floor((v22 - v24) * 0.5);
  }
  return *MEMORY[0x263F001A8];
}

void sub_256855D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2568560BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_256858194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIWishlistItemPropertiesWithItem(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 cacheRepresentation];
  BOOL v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    [v4 setObject:v3 forKey:*MEMORY[0x263F7BD40]];
    uint64_t v5 = [v1 itemIdentifier];
    double v6 = [NSNumber numberWithLongLong:v5];
    [v4 setObject:v6 forKey:*MEMORY[0x263F7BD48]];

    uint64_t v7 = [v1 itemKindString];
    if (v7) {
      [v4 setObject:v7 forKey:*MEMORY[0x263F7BD50]];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id SUUIWishlistOperationQueue()
{
  uint64_t v0 = (void *)SUUIWishlistOperationQueue_sQueue;
  if (!SUUIWishlistOperationQueue_sQueue)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F08A48]);
    uint64_t v2 = (void *)SUUIWishlistOperationQueue_sQueue;
    SUUIWishlistOperationQueue_sQueue = (uint64_t)v1;

    [(id)SUUIWishlistOperationQueue_sQueue setMaxConcurrentOperationCount:1];
    [(id)SUUIWishlistOperationQueue_sQueue setName:@"com.apple.iTunesStoreUI.SSWishlist"];
    uint64_t v0 = (void *)SUUIWishlistOperationQueue_sQueue;
  }
  return v0;
}

void sub_2568585E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _SUUIIndexBarControlInitialization(void *a1)
{
  id v1 = (void *)MEMORY[0x263F825C8];
  double v8 = a1;
  uint64_t v2 = [v1 clearColor];
  [v8 setBackgroundColor:v2];

  [v8 setContentMode:3];
  [v8 setDeliversTouchesForGesturesToSuperview:0];
  [v8 setExclusiveTouch:1];
  *(_OWORD *)(v8 + 58ITColor::ITColor((ITColor *)this + 4) = xmmword_2568A1F10;
  *(_OWORD *)(v8 + 600) = xmmword_2568A1F10;
  v8[481] = 1;
  v8[482] = 1;
  v8[483] = 1;
  v8[484] = 1;
  __asm { FMOV            V0.2D, #-3.0 }
  *(_OWORD *)(v8 + 61ITColor::ITColor((ITColor *)this + 6) = _Q0;
  *(_OWORD *)(v8 + 63ITColor::ITColor((ITColor *)this + 2) = _Q0;
}

void sub_25685A1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25685A53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__104(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__104(uint64_t a1)
{
}

void sub_25685A708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25685AFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_25685B938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_25685BAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25685BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25685BE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_25685C0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25685E6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__105(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__105(uint64_t a1)
{
}

void sub_25685E864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIMetricsMediaEventTypeForPlaybackState(id a1)
{
  if ((unint64_t)a1 <= 2) {
    a1 = **((id **)&unk_2654094D8 + (void)a1);
  }
  return a1;
}

id SUUICollectionViewCellForView(void *a1)
{
  uint64_t v1 = [a1 superview];
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v3 = v2;
      }
      else {
        id v3 = 0;
      }
      uint64_t v4 = [v2 superview];

      if (v3) {
        break;
      }
      uint64_t v2 = v4;
    }
    while (v4);
  }
  else
  {
    id v3 = 0;
    uint64_t v4 = 0;
  }

  return v3;
}

id SUUICollectionViewForView(void *a1)
{
  uint64_t v1 = [a1 superview];
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v3 = v2;
      }
      else {
        id v3 = 0;
      }
      uint64_t v4 = [v2 superview];

      if (v3) {
        break;
      }
      uint64_t v2 = v4;
    }
    while (v4);
  }
  else
  {
    id v3 = 0;
    uint64_t v4 = 0;
  }

  return v3;
}

void SUUIEditorialStyleForDictionary(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  *(_OWORD *)a2 = xmmword_2568A0F10;
  *(void *)(a2 + 1ITColor::ITColor((ITColor *)this + 6) = 0x4120000041600000;
  *(void *)(a2 + 2ITColor::ITColor((ITColor *)this + 4) = 2;
  *(void *)(a2 + 3ITColor::ITColor((ITColor *)this + 2) = 0x40A0000041880000;
  id v13 = v3;
  uint64_t v4 = [v3 objectForKey:@"align"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)a2 = SUUIPageComponentAlignmentForString(v4);
  }
  uint64_t v5 = [v13 objectForKey:@"bodySize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)(a2 + 1ITColor::ITColor((ITColor *)this + 6) = SUUIEditorialBodySizeForString(v5);
    *(void *)(a2 + ITColor::ITColor((ITColor *)this + 8) = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 floatValue];
    *(_DWORD *)(a2 + 1ITColor::ITColor((ITColor *)this + 6) = v6;
  }
  uint64_t v7 = [v13 objectForKey:@"bodyWeight"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(a2 + ITColor::ITColor((ITColor *)this + 8) = SUUIPageComponentFontWeightForString(v7);
  }
  double v8 = [v13 objectForKey:@"titleSize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)(a2 + 20) = SUUIEditorialLinkSpacingForString(v8);
    *(float *)(a2 + 3ITColor::ITColor((ITColor *)this + 2) = SUUIEditorialTitleSizeForString(v8);
    *(void *)(a2 + 2ITColor::ITColor((ITColor *)this + 4) = SUUIEditorialTitleWeightForString(v8);
    *(float *)(a2 + 3ITColor::ITColor((ITColor *)this + 6) = SUUIEditorialTitleSpacingForString(v8);
  }
  else if (objc_opt_respondsToSelector())
  {
    [v8 floatValue];
    *(_DWORD *)(a2 + 3ITColor::ITColor((ITColor *)this + 2) = v9;
  }
  uint64_t v10 = [v13 objectForKey:@"titleSpacing"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 floatValue];
    *(_DWORD *)(a2 + 3ITColor::ITColor((ITColor *)this + 6) = v11;
  }
  uint64_t v12 = [v13 objectForKey:@"titleWeight"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(a2 + 2ITColor::ITColor((ITColor *)this + 4) = SUUIPageComponentFontWeightForString(v12);
  }
}

uint64_t SUUICTTextAlignmentForPageComponentAlignment(unint64_t a1)
{
  unsigned int v1 = 0x1020000u >> (8 * a1);
  if (a1 >= 4) {
    LOBYTE(vITColor::ITColor((ITColor *)this + 1) = 2;
  }
  return v1 & 3;
}

float SUUIEditorialBodySizeForString(void *a1)
{
  id v1 = a1;
  float v2 = 11.0;
  if (([v1 isEqualToString:@"XS"] & 1) == 0)
  {
    float v2 = 12.0;
    if (([v1 isEqualToString:@"S"] & 1) == 0)
    {
      float v2 = 17.0;
      if (([v1 isEqualToString:@"M"] & 1) == 0)
      {
        float v2 = 24.0;
        if (([v1 isEqualToString:@"L"] & 1) == 0)
        {
          [v1 floatValue];
          float v2 = v3;
        }
      }
    }
  }

  return v2;
}

uint64_t SUUIEditorialBodyWeightForString()
{
  return 1;
}

double SUUIEditorialStyleDefault@<D0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_2568A0F10;
  *(void *)(a1 + 1ITColor::ITColor((ITColor *)this + 6) = 0x4120000041600000;
  *(void *)(a1 + 2ITColor::ITColor((ITColor *)this + 4) = 2;
  double result = 2048.0005;
  *(void *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = 0x40A0000041880000;
  return result;
}

uint64_t SUUIPageComponentAlignmentForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"left"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"right"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"center"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

float SUUIEditorialLinkSpacingForString(void *a1)
{
  id v1 = a1;
  float v2 = 10.0;
  if (([v1 isEqualToString:@"XS"] & 1) == 0)
  {
    float v2 = 9.0;
    if (([v1 isEqualToString:@"S"] & 1) == 0)
    {
      float v2 = 12.0;
      if (([v1 isEqualToString:@"M"] & 1) == 0)
      {
        float v2 = 14.0;
        if (([v1 isEqualToString:@"L"] & 1) == 0)
        {
          [v1 floatValue];
          float v2 = v3;
        }
      }
    }
  }

  return v2;
}

float SUUIEditorialTitleSizeForString(void *a1)
{
  id v1 = a1;
  float v2 = 14.0;
  if (([v1 isEqualToString:@"XS"] & 1) == 0)
  {
    float v2 = 17.0;
    if (([v1 isEqualToString:@"S"] & 1) == 0)
    {
      float v2 = 25.0;
      if (([v1 isEqualToString:@"M"] & 1) == 0)
      {
        if ([v1 isEqualToString:@"L"])
        {
          float v2 = 42.0;
        }
        else
        {
          [v1 floatValue];
          float v2 = v3;
        }
      }
    }
  }

  return v2;
}

uint64_t SUUIEditorialTitleWeightForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"XS"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"S"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"M"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 2;
  }

  return v2;
}

float SUUIEditorialTitleSpacingForString(void *a1)
{
  id v1 = a1;
  float v2 = 2.0;
  if (([v1 isEqualToString:@"XS"] & 1) == 0)
  {
    float v2 = 13.0;
    if (([v1 isEqualToString:@"M"] & 1) == 0)
    {
      if ([v1 isEqualToString:@"L"]) {
        float v2 = 18.0;
      }
      else {
        float v2 = 5.0;
      }
    }
  }

  return v2;
}

double SUUIBrickItemSize()
{
  uint64_t v0 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1)
  {
    double v2 = 210.0;
  }
  else
  {
    float v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 bounds];
    double v5 = v4;

    if (v5 <= 375.0)
    {
      int v6 = [MEMORY[0x263F82B60] mainScreen];
      [v6 bounds];
      double v8 = v7;

      double v2 = dbl_2568A1260[v8 > 320.0];
    }
    else
    {
      double v2 = 175.0;
    }
  }
  int v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  double v11 = v10;

  return v2 * v11;
}

void SUUIDecodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = a1;
  double v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:v5];

  if (v7)
  {
    double v8 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v7 error:0];
    [v9 decodeRestorableStateWithCoder:v8];
    [v8 finishDecoding];
  }
}

void SUUIEncodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = (objc_class *)MEMORY[0x263F08910];
    id v6 = a3;
    id v7 = a2;
    id v8 = a1;
    id v10 = (id)[[v5 alloc] initRequiringSecureCoding:1];
    [v6 encodeRestorableStateWithCoder:v10];

    id v9 = [v10 encodedData];
    [v8 encodeObject:v9 forKey:v7];
  }
}

void sub_2568661F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__106(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__106(uint64_t a1)
{
}

const char *sub_256866530()
{
  return "MobileStore";
}

const char *sub_256866544(char a1)
{
  double result = "tv_stop_pages";
  switch(a1)
  {
    case 1:
      double result = "stop_page_respected_onboarding";
      break;
    case 2:
      double result = "always_show_tv_stop_pages";
      break;
    case 3:
      double result = "alternate_stop_page_design";
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2568665C8(char a1)
{
  unint64_t result = 0x5F706F74735F7674;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_256866674(unsigned __int8 *a1, char *a2)
{
  return sub_256866680(*a1, *a2);
}

uint64_t sub_256866680(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xED00007365676170;
  unint64_t v3 = 0x5F706F74735F7674;
  uint64_t v4 = a1;
  unint64_t v5 = 0x5F706F74735F7674;
  unint64_t v6 = 0xED00007365676170;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001ELL;
      id v7 = "stop_page_respected_onboarding";
      goto LABEL_5;
    case 2:
      unint64_t v6 = 0x80000002568B39D0;
      unint64_t v5 = 0xD000000000000019;
      break;
    case 3:
      unint64_t v5 = 0xD00000000000001ALL;
      id v7 = "alternate_stop_page_design";
LABEL_5:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0xD00000000000001ELL;
      id v8 = "stop_page_respected_onboarding";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0x80000002568B39D0;
      unint64_t v3 = 0xD000000000000019;
      break;
    case 3:
      unint64_t v3 = 0xD00000000000001ALL;
      id v8 = "alternate_stop_page_design";
LABEL_10:
      unint64_t v2 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v9 = 1;
  }
  else {
    char v9 = sub_256870560();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_256866818()
{
  return sub_256866820();
}

uint64_t sub_256866820()
{
  return sub_2568705A0();
}

uint64_t sub_256866914()
{
  return sub_25686691C();
}

uint64_t sub_25686691C()
{
  sub_256870400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2568669FC()
{
  return sub_256866A04();
}

uint64_t sub_256866A04()
{
  return sub_2568705A0();
}

uint64_t sub_256866AF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25686BE38();
  *a1 = result;
  return result;
}

unint64_t sub_256866B24@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2568665C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

const char *sub_256866B50()
{
  unint64_t result = "tv_stop_pages";
  switch(*v0)
  {
    case 1:
      unint64_t result = "stop_page_respected_onboarding";
      break;
    case 2:
      unint64_t result = "always_show_tv_stop_pages";
      break;
    case 3:
      unint64_t result = "alternate_stop_page_design";
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_256866BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_256870280();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (*(void *)(a1 + 16)
      && (unint64_t v15 = sub_25686B9C8(7107189, 0xE300000000000000), (v16 & 1) != 0)
      && (sub_25686BEE8(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v29), (swift_dynamicCast() & 1) != 0))
    {
      sub_256870270();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        swift_bridgeObjectRelease();
        sub_25686CCA0((uint64_t)v6, &qword_269F6AE40);
      }
      else
      {
        BOOL v19 = v6;
        double v20 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v20(v10, v19, v7);
        if (*(void *)(a1 + 16)
          && (unint64_t v21 = sub_25686B9C8(0x6874646977, 0xE500000000000000), (v22 & 1) != 0)
          && (sub_25686BEE8(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v29), (swift_dynamicCast() & 1) != 0))
        {
          uint64_t v23 = v28;
          if (*(void *)(a1 + 16) && (unint64_t v24 = sub_25686B9C8(0x746867696568, 0xE600000000000000), (v25 & 1) != 0))
          {
            sub_25686BEE8(*(void *)(a1 + 56) + 32 * v24, (uint64_t)&v29);
          }
          else
          {
            long long v29 = 0u;
            long long v30 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v30 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v26 = v28;
              v20(v14, v10, v7);
              double v27 = &v14[*(int *)(v11 + 20)];
              *(void *)double v27 = v23;
              *((void *)v27 + ITColor::ITColor((ITColor *)this + 1) = v26;
              sub_25686BF44((uint64_t)v14, a2);
              uint64_t v17 = 0;
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a2, v17, 1, v11);
            }
          }
          else
          {
            sub_25686CCA0((uint64_t)&v29, &qword_269F6AE48);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v17 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a2, v17, 1, v11);
}

uint64_t sub_256866F9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_256870280();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

double sub_256867004()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for SUUIStopPageViewController.PageArtwork(0) + 20));
}

uint64_t sub_256867064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = sub_2568703D0();
  LOBYTE(aITColor::ITColor((ITColor *)this + 4) = a4(v5);
  swift_bridgeObjectRelease();
  return a4 & 1;
}

id SUUIStopPageViewController.__allocating_init(tabIdentifier:replacementAppAdamId:title:subtitle:artworkDictionar:deeplinkUrl:purchasesUrl:wishlistButtonTitle:showWishlistButton:clientContext:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, uint64_t a11, char a12, void *a13)
{
  id v20 = objc_allocWithZone(v13);
  id v21 = sub_25686C3FC(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, a12, a13);

  return v21;
}

id SUUIStopPageViewController.init(tabIdentifier:replacementAppAdamId:title:subtitle:artworkDictionar:deeplinkUrl:purchasesUrl:wishlistButtonTitle:showWishlistButton:clientContext:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *a15)
{
  id v15 = sub_25686C3FC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);

  return v15;
}

uint64_t variable initialization expression of SUUIStopPageViewController.lockupView()
{
  return 0;
}

id sub_2568674CC(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_256867510()
{
  *(void *)&v0[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView] = 0;

  sub_256870520();
  __break(1u);
}

Swift::Void __swiftcall SUUIStopPageViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v31 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE50);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (objc_class *)type metadata accessor for SUUIStopPageViewController(0);
  v37.receiver = v1;
  v37.super_class = v11;
  objc_msgSendSuper2(&v37, sel_viewDidLoad);
  id v12 = objc_msgSend(v1, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v13 = v12;
  id v14 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v13, sel_setBackgroundColor_, v14);

  uint64_t v15 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_replacementAppAdamId];
  uint64_t v16 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_replacementAppAdamId + 8];
  uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageTitle + 8];
  uint64_t v35 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageTitle];
  uint64_t v36 = v15;
  uint64_t v18 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageSubtitle + 8];
  uint64_t v34 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageSubtitle];
  sub_25686E958((uint64_t)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageArtwork], (uint64_t)v10, &qword_269F6AE50);
  sub_25686E958((uint64_t)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_deeplinkUrl], (uint64_t)v7, &qword_269F6AE40);
  sub_25686E958((uint64_t)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_purchasesUrl], (uint64_t)v5, &qword_269F6AE40);
  uint64_t v19 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_wishlistButtonTitle];
  uint64_t v20 = *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_wishlistButtonTitle + 8];
  double v32 = v5;
  uint64_t v33 = v19;
  unsigned __int8 v21 = v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_showWishlistButton];
  char v22 = *(void **)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_clientContext];
  objc_allocWithZone((Class)type metadata accessor for SUUIStopPageViewController.StopPageLockup());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = v22;
  unint64_t v24 = sub_2568680CC(v36, v16, v35, v17, v34, v18, (uint64_t)v10, (uint64_t)v7, (uint64_t)v32, v33, v20, v21, v23);
  uint64_t v25 = OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView;
  uint64_t v26 = *(void **)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView];
  *(void *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView] = v24;

  id v27 = objc_msgSend(v1, sel_view);
  if (!v27)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!*(void *)&v1[v25])
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v28 = v27;
  objc_msgSend(v27, sel_addSubview_);

  id v29 = objc_msgSend(v1, sel_navigationController);
  if (v29)
  {
    long long v30 = v29;
    objc_msgSend(v29, sel_setNavigationBarHidden_animated_, 1, 0);
  }
}

uint64_t SUUIStopPageViewController.supportedInterfaceOrientations.getter()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (v1) {
    return 30;
  }
  else {
    return 2;
  }
}

Swift::Void __swiftcall SUUIStopPageViewController.viewDidLayoutSubviews()()
{
  v37.receiver = v0;
  v37.super_class = (Class)type metadata accessor for SUUIStopPageViewController(0);
  objc_msgSendSuper2(&v37, sel_viewDidLayoutSubviews);
  uint64_t v1 = OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView];
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v3 = v2;
  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_bounds);
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v3, sel_sizeThatFits_, v7, v9);
  double v11 = v10;
  double v13 = v12;

  id v14 = *(void **)&v0[v1];
  if (!v14)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v15 = v14;
  id v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v17 = v16;
  objc_msgSend(v16, sel_bounds);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v38.origin.CGFloat x = v19;
  v38.origin.CGFloat y = v21;
  v38.size.double width = v23;
  v38.size.CGFloat height = v25;
  double MidX = CGRectGetMidX(v38);
  id v27 = objc_msgSend(v0, sel_view);
  if (v27)
  {
    uint64_t v28 = v27;
    objc_msgSend(v27, sel_bounds);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    v39.origin.CGFloat x = v30;
    v39.origin.CGFloat y = v32;
    v39.size.double width = v34;
    v39.size.CGFloat height = v36;
    objc_msgSend(v15, sel_setFrame_, MidX - v11 * 0.5, CGRectGetMidY(v39) - v13 * 0.5, v11, v13);

    return;
  }
LABEL_11:
  __break(1u);
}

Swift::Void __swiftcall SUUIStopPageViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  Class isa = a1.value.super.isa;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for SUUIStopPageViewController(0);
  objc_msgSendSuper2(&v13, sel_traitCollectionDidChange_, isa);
  if (isa) {
    Class isa = (Class)[(objc_class *)isa preferredContentSizeCategory];
  }
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (isa)
  {
    uint64_t v5 = sub_2568703D0();
    uint64_t v7 = v6;
    if (v5 == sub_2568703D0() && v7 == v8)
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    char v10 = sub_256870560();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10) {
      return;
    }
  }
  else
  {
  }
  id v11 = objc_msgSend(v1, sel_view);
  if (v11)
  {
    double v12 = v11;
    objc_msgSend(v11, sel_setNeedsLayout);
  }
  else
  {
    __break(1u);
  }
}

id SUUIStopPageViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_2568703A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SUUIStopPageViewController.init(nibName:bundle:)()
{
}

id SUUIStopPageViewController.__deallocating_deinit()
{
  return sub_25686B090(0, (uint64_t (*)(void))type metadata accessor for SUUIStopPageViewController);
}

void sub_256868024()
{
  qword_269F6B9A8 = 0x406C400000000000;
  qword_269F6B9B0 = 0x405F000000000000;
}

void sub_256868044()
{
  qword_269F6B9C0 = 0x4046000000000000;
  qword_269F6B9C8 = 0x4046000000000000;
}

void sub_25686805C()
{
  qword_269F6B9D8 = 0x403E000000000000;
}

void sub_25686806C()
{
  qword_269F6B9E8 = 0x402E000000000000;
}

void sub_25686807C()
{
  qword_269F6B9F8 = 0x403E000000000000;
}

void sub_25686808C()
{
  qword_269F6BA08 = 0x402E000000000000;
}

void sub_25686809C()
{
  qword_269F6BA18 = 0x4014000000000000;
}

void sub_2568680AC()
{
  qword_269F6BA28 = 0x4032000000000000;
}

void sub_2568680BC()
{
  qword_269F6BA38 = 0x404C000000000000;
}

char *sub_2568680CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, void *a13)
{
  id v14 = v13;
  uint64_t v98 = a8;
  uint64_t v90 = a5;
  uint64_t v91 = a6;
  LODWORD(v9ITColor::ITColor((ITColor *)this + 3) = a12;
  uint64_t v88 = a11;
  uint64_t v89 = a3;
  uint64_t v95 = a9;
  uint64_t v96 = a7;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE50);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v94 = (uint64_t)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  uint64_t v92 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v87 = (uint64_t)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView;
  id v20 = objc_allocWithZone(MEMORY[0x263F82828]);
  CGFloat v21 = v13;
  *(void *)&v14[v19] = objc_msgSend(v20, sel_init);
  double v22 = &v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  *(void *)double v22 = 0;
  *((void *)v22 + ITColor::ITColor((ITColor *)this + 1) = 0;
  uint64_t v23 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel;
  *(void *)&v21[v23] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v24 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel;
  *(void *)&v21[v24] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v25 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton;
  *(void *)&v21[v25] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25380]), sel_init);
  uint64_t v26 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton;
  *(void *)&v21[v26] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
  *(void *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton] = 0;
  *(void *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton] = 0;
  uint64_t v27 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoaderOperationQueue;
  *(void *)&v21[v27] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible] = 0;
  v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable] = 2;
  if (a2)
  {
    id v28 = objc_allocWithZone(MEMORY[0x263F25350]);
    double v29 = (void *)sub_2568703A0();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v28, sel_initWithStringValue_, v29);

    id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25378]), sel_initWithID_kind_context_, v30, *MEMORY[0x263F25330], *MEMORY[0x263F25308]);
  }
  else
  {
    id v31 = 0;
  }
  *(void *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_lockupRequest] = v31;
  CGFloat v32 = *(void **)&v21[v27];
  objc_msgSend(v32, sel_setMaxConcurrentOperationCount_, 1);
  id v33 = objc_msgSend(objc_allocWithZone((Class)SUUIResourceLoader), sel_initWithOperationQueue_, v32);
  *(void *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoader] = v33;
  CGFloat v34 = &v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_wishlistButtonTitle];
  uint64_t v35 = v88;
  *(void *)CGFloat v34 = a10;
  *((void *)v34 + ITColor::ITColor((ITColor *)this + 1) = v35;
  v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_showWishlistButton] = v93 & 1;
  *(void *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_clientContext] = a13;
  id v93 = a13;

  CGFloat v36 = (objc_class *)type metadata accessor for SUUIStopPageViewController.StopPageLockup();
  v99.receiver = v21;
  v99.super_class = v36;
  id v37 = objc_msgSendSuper2(&v99, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  double v38 = *MEMORY[0x263F834E8];
  double v39 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v40 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v41 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v42 = (char *)v37;
  objc_msgSend(v42, sel_setLayoutMargins_, v38, v39, v40, v41);
  uint64_t v43 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel;
  double v44 = *(void **)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel];
  double v45 = self;
  uint64_t v46 = *MEMORY[0x263F83610];
  id v47 = v44;
  id v48 = objc_msgSend(v45, sel_preferredFontForTextStyle_, v46);
  id v49 = sub_256868ABC(*MEMORY[0x263F81800]);

  objc_msgSend(v47, sel_setFont_, v49);
  long long v50 = *(void **)&v42[v43];
  objc_msgSend(v50, sel_setTextAlignment_, 1);
  objc_msgSend(v50, sel_setNumberOfLines_, 3);
  id v51 = v50;
  long long v52 = (void *)sub_2568703A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v51, sel_setText_, v52);

  uint64_t v53 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel;
  uint64_t v54 = *MEMORY[0x263F83570];
  id v55 = *(id *)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel];
  id v56 = objc_msgSend(v45, sel_preferredFontForTextStyle_, v54);
  objc_msgSend(v55, sel_setFont_, v56);

  long long v57 = *(void **)&v42[v53];
  objc_msgSend(v57, sel_setTextAlignment_, 1);
  objc_msgSend(v57, sel_setNumberOfLines_, 4);
  uint64_t v58 = self;
  id v59 = v57;
  id v60 = objc_msgSend(v58, sel_secondaryLabelColor);
  objc_msgSend(v59, sel_setTextColor_, v60);

  id v61 = *(id *)&v42[v53];
  uint64_t v62 = (void *)sub_2568703A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v61, sel_setText_, v62);

  uint64_t v63 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView;
  objc_msgSend(v42, sel_addSubview_, *(void *)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView]);
  objc_msgSend(v42, sel_addSubview_, *(void *)&v42[v43]);
  objc_msgSend(v42, sel_addSubview_, *(void *)&v42[v53]);
  __n128 v64 = *(void **)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
  objc_msgSend(v42, sel_addSubview_, v64);
  uint64_t v65 = v98;
  uint64_t v66 = v95;
  sub_2568699A0(v98, v95);
  objc_msgSend(v64, sel_setLockupSize_, *MEMORY[0x263F25348]);
  objc_msgSend(v64, sel_setAlpha_, 0.0);
  objc_msgSend(v64, sel_setShowsPlaceholderContent_, 0);
  objc_msgSend(v64, sel_setDelegate_, v42);
  objc_msgSend(v64, sel_setRequest_, *(void *)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_lockupRequest]);
  uint64_t v67 = v96;
  uint64_t v68 = v94;
  sub_25686E958(v96, v94, &qword_269F6AE50);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v92 + 48))(v68, 1, v97) == 1)
  {
    sub_25686CCA0(v68, &qword_269F6AE50);
    id v69 = *(id *)&v42[v63];
    long long v70 = (void *)sub_2568703A0();
    id v71 = objc_msgSend(self, sel_imageNamed_, v70);

    objc_msgSend(v69, sel_setImage_, v71);
    if (qword_269F6B9A0 != -1) {
      swift_once();
    }
    CGFloat width = *(double *)&qword_269F6B9A8;
    CGFloat height = *(double *)&qword_269F6B9B0;

    sub_25686CCA0(v66, &qword_269F6AE40);
    sub_25686CCA0(v65, &qword_269F6AE40);
    sub_25686CCA0(v67, &qword_269F6AE50);
  }
  else
  {
    uint64_t v74 = v87;
    sub_25686BF44(v68, v87);
    id v75 = objc_msgSend(objc_allocWithZone((Class)SUUIArtworkRequest), sel_init);
    long long v76 = (void *)sub_256870250();
    objc_msgSend(v75, sel_setCacheKey_, v76);

    id v77 = objc_msgSend(objc_allocWithZone((Class)SUUIImageDataConsumer), sel_init);
    objc_msgSend(v75, sel_setDataConsumer_, v77);
    double v78 = (void *)sub_256870250();
    objc_msgSend(v75, sel_setURL_, v78);

    objc_msgSend(v75, sel_setDelegate_, v42);
    objc_msgSend(*(id *)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoader], sel_loadResourceWithRequest_reason_, v75, 1);
    id v79 = *(id *)&v42[v63];
    id v80 = objc_msgSend(v58, sel_secondarySystemBackgroundColor);
    objc_msgSend(v79, sel_setBackgroundColor_, v80);

    if (qword_269F6B9A0 != -1) {
      swift_once();
    }
    uint64_t v81 = qword_269F6B9A8;
    uint64_t v82 = qword_269F6B9B0;

    sub_25686CCA0(v66, &qword_269F6AE40);
    sub_25686CCA0(v98, &qword_269F6AE40);
    sub_25686CCA0(v67, &qword_269F6AE50);
    sub_25686E9BC(v74);
    CGSize v83 = CGSize.maxSize(fitting:)((CGSize)__PAIR128__(v82, v81));
    CGFloat width = v83.width;
    CGFloat height = v83.height;
  }
  double v84 = (CGFloat *)&v42[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  *double v84 = width;
  v84[1] = height;
  return v42;
}

id sub_256868ABC(double a1)
{
  id v3 = objc_msgSend(v1, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 1ITColor::ITColor((ITColor *)this + 6) = xmmword_2568A1F70;
  uint64_t v5 = (void *)*MEMORY[0x263F817A0];
  *(void *)(inited + 3ITColor::ITColor((ITColor *)this + 2) = *MEMORY[0x263F817A0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE78);
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 1ITColor::ITColor((ITColor *)this + 6) = xmmword_2568A1F70;
  id v7 = (void *)*MEMORY[0x263F81850];
  *(void *)(v6 + 3ITColor::ITColor((ITColor *)this + 2) = *MEMORY[0x263F81850];
  *(double *)(v6 + 40) = a1;
  id v8 = v5;
  id v9 = v7;
  unint64_t v10 = sub_25686AAD8(v6);
  *(void *)(inited + 6ITColor::ITColor((ITColor *)this + 4) = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE80);
  *(void *)(inited + 40) = v10;
  sub_25686ABE4(inited);
  type metadata accessor for AttributeName(0);
  sub_25686D658(&qword_269F6AE88, type metadata accessor for AttributeName);
  id v11 = (void *)sub_256870340();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v3, sel_fontDescriptorByAddingAttributes_, v11);

  objc_msgSend(v1, sel_pointSize);
  id v14 = objc_msgSend(self, sel_fontWithDescriptor_size_, v12, v13);

  return v14;
}

CGSize __swiftcall CGSize.maxSize(fitting:)(CGSize fitting)
{
  if (fitting.height == 0.0)
  {
    if (v2 == 0.0 || (double v3 = v1 / v2, v1 / v2 >= 0.0))
    {
LABEL_12:
      double v6 = v2 / v1;
      if (v1 == 0.0) {
        double v6 = 0.0;
      }
      fitting.CGFloat height = v6 * fitting.width;
      return fitting;
    }
  }
  else
  {
    double v4 = fitting.width / fitting.height;
    if (v2 == 0.0)
    {
      if (v4 <= 0.0) {
        goto LABEL_12;
      }
      double v3 = v1 / v2;
    }
    else
    {
      double v3 = v1 / v2;
      if (v1 / v2 >= v4) {
        goto LABEL_12;
      }
    }
  }
  double v5 = 0.0;
  if (v2 != 0.0) {
    double v5 = v3;
  }
  fitting.CGFloat width = v5 * fitting.height;
  return fitting;
}

double sub_256868D20()
{
  objc_msgSend(v0, sel_layoutMargins);
  double v2 = v1;
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_bounds);
  CGRectGetWidth(v4);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_bounds);
  CGRectGetWidth(v5);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return v2;
}

id sub_256868E00(unsigned char *a1)
{
  double v2 = *(void **)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
  uint64_t v3 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible;
  if (a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  objc_msgSend(v2, sel_setAlpha_, v4);
  if (a1[v3]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  objc_msgSend(*(id *)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_setAlpha_, v5);
  double v6 = *(void **)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v6)
  {
    if (a1[v3]) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    objc_msgSend(v6, sel_setAlpha_, v7);
  }
  uint64_t v8 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton;
  id v9 = *(void **)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
  if (v9)
  {
    objc_msgSend(v9, sel_setUserInteractionEnabled_, 1);
    unint64_t v10 = *(void **)&a1[v8];
    if (v10)
    {
      double v11 = 0.0;
      if (a1[v3]) {
        double v11 = 1.0;
      }
      objc_msgSend(v10, sel_setAlpha_, v11);
    }
  }
  return objc_msgSend(a1, sel_setNeedsLayout);
}

uint64_t sub_256868F08(uint64_t a1)
{
  double v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_256868F4C(id result)
{
  uint64_t v2 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable;
  int v3 = v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable];
  if (v3 == 2)
  {
    if (result == 2) {
      return result;
    }
    uint64_t v4 = 0;
  }
  else
  {
    if result != 2 && ((((result & 1) == 0) ^ v3)) {
      return result;
    }
    uint64_t v4 = v3 & 1;
  }
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton], sel_setHidden_, v4);
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_setHidden_, (v1[v2] & 1) == 0);
  double v5 = *(void **)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v5) {
    objc_msgSend(v5, sel_setHidden_, (v1[v2] & 1) == 0);
  }
  return objc_msgSend(v1, sel_setNeedsLayout);
}

double sub_25686903C(double a1, double a2)
{
  double v5 = *(double *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  if (qword_269F6B9B8 != -1) {
    swift_once();
  }
  double v6 = v5 + *(double *)&qword_269F6B9C0 + *(double *)&qword_269F6B9C8;
  if (qword_269F6B9D0 != -1) {
    swift_once();
  }
  double v7 = v6 + *(double *)&qword_269F6B9D8;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel], sel_sizeThatFits_, v7, 1.79769313e308);
  if (qword_269F6B9E0 != -1) {
    swift_once();
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel], sel_sizeThatFits_, v7, 1.79769313e308);
  if (qword_269F6B9F0 != -1) {
    swift_once();
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton], sel_sizeThatFits_, a1, a2);
  if (qword_269F6BA00 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void **)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v8)
  {
    id v9 = v8;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v9, sel_sizeThatFits_, v10, v11);
    if (qword_269F6BA10 != -1) {
      swift_once();
    }
  }
  id v12 = *(void **)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v13, sel_sizeThatFits_, v14, v15);
  }
  return v7;
}

void sub_25686936C()
{
  v71.receiver = v0;
  v71.super_class = (Class)type metadata accessor for SUUIStopPageViewController.StopPageLockup();
  objc_msgSendSuper2(&v71, sel_layoutSubviews);
  double v1 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView];
  v72.origin.CGFloat x = sub_256868D20();
  CGFloat MidX = CGRectGetMidX(v72);
  int v3 = (double *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  CGFloat v4 = MidX
     - *(double *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize]
     * 0.5;
  v73.origin.CGFloat x = sub_256868D20();
  objc_msgSend(v1, sel_setFrame_, v4, CGRectGetMinY(v73), *v3, v3[1]);
  double v5 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v5, sel_sizeThatFits_, v6, v7);
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v0, sel_bounds);
  double v12 = CGRectGetMidX(v74) - v9 * 0.5;
  objc_msgSend(v1, sel_frame);
  double MaxY = CGRectGetMaxY(v75);
  if (qword_269F6B9D0 != -1) {
    swift_once();
  }
  objc_msgSend(v5, sel_setFrame_, v12, MaxY + *(double *)&qword_269F6B9D8, v9, v11);
  double v14 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v14, sel_sizeThatFits_, v15, v16);
  double v18 = v17;
  double v20 = v19;
  objc_msgSend(v0, sel_bounds);
  double v21 = CGRectGetMidX(v76) + v18 * -0.5;
  objc_msgSend(v5, sel_frame);
  double v22 = CGRectGetMaxY(v77);
  if (qword_269F6B9E0 != -1) {
    swift_once();
  }
  objc_msgSend(v14, sel_setFrame_, v21, v22 + *(double *)&qword_269F6B9E8, v18, v20);
  uint64_t v23 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v23, sel_sizeThatFits_, v24, v25);
  double v27 = v26;
  double v29 = v28;
  objc_msgSend(v0, sel_bounds);
  double v30 = CGRectGetMidX(v78) + v27 * -0.5;
  objc_msgSend(v14, sel_frame);
  double v31 = CGRectGetMaxY(v79);
  if (qword_269F6B9F0 != -1) {
    swift_once();
  }
  objc_msgSend(v23, sel_setFrame_, v30, v31 + *(double *)&qword_269F6B9F8, v27, v29);
  CGFloat v32 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v32, sel_sizeThatFits_, v33, v34);
  double v36 = v35;
  double v38 = v37;
  objc_msgSend(v0, sel_bounds);
  double v39 = CGRectGetMidX(v80);
  objc_msgSend(v23, sel_frame);
  double MidY = CGRectGetMidY(v81);
  if (qword_269F6BA30 != -1) {
    swift_once();
  }
  if (*(double *)&qword_269F6BA38 > v36) {
    double v41 = *(double *)&qword_269F6BA38;
  }
  else {
    double v41 = v36;
  }
  objc_msgSend(v32, sel_setFrame_, v39 - v36 * 0.5, MidY - v38 * 0.5, v41, v38);
  uint64_t v42 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton;
  uint64_t v43 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v43)
  {
    id v44 = v43;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v44, sel_sizeThatFits_, v45, v46);
    double v48 = v47;
    double v50 = v49;
    id v51 = v44;
    objc_msgSend(v0, sel_bounds);
    double v52 = CGRectGetMidX(v82) + v48 * -0.5;
    objc_msgSend(v32, sel_frame);
    double v53 = CGRectGetMaxY(v83);
    if (qword_269F6BA00 != -1) {
      swift_once();
    }
    objc_msgSend(v51, sel_setFrame_, v52, v53 + *(double *)&qword_269F6BA08, v48, v50);
  }
  uint64_t v54 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
  if (v54)
  {
    id v55 = *(void **)&v0[v42];
    if (v55)
    {
      id v56 = v54;
      id v57 = v55;
      if ((objc_msgSend(v57, sel_isHidden) & 1) == 0)
      {
        objc_msgSend(v57, sel_alpha);
        if (v58 > 0.0)
        {
          objc_msgSend(v57, sel_frame);
          double v59 = CGRectGetMaxY(v84);
          if (qword_269F6BA10 != -1) {
            swift_once();
          }
          double v60 = *(double *)&qword_269F6BA18;

          double v61 = v59 + v60;
LABEL_28:
          objc_msgSend(v0, sel_bounds);
          objc_msgSend(v54, sel_sizeThatFits_, v64, v65);
          double v67 = v66;
          double v69 = v68;
          id v70 = v54;
          objc_msgSend(v0, sel_bounds);
          objc_msgSend(v70, sel_setFrame_, CGRectGetMidX(v86) + v67 * -0.5, v61, v67, v69);

          return;
        }
      }
    }
    else
    {
      id v62 = v54;
    }
    objc_msgSend(v32, sel_frame);
    double v63 = CGRectGetMaxY(v85);
    if (qword_269F6BA00 != -1) {
      swift_once();
    }
    double v61 = v63 + *(double *)&qword_269F6BA08;
    goto LABEL_28;
  }
}

uint64_t sub_2568699A0(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  CGRect v73 = (char *)a1;
  uint64_t v74 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40);
  uint64_t v71 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v72 = v5;
  uint64_t v83 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6B030);
  MEMORY[0x270FA5388](v6 - 8);
  CGRect v77 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2568702A0();
  MEMORY[0x270FA5388](v8 - 8);
  CGRect v82 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_256870390();
  MEMORY[0x270FA5388](v10 - 8);
  double v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6B038);
  MEMORY[0x270FA5388](v13 - 8);
  double v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_256870450();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  double v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2568704C0();
  uint64_t v81 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  double v63 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  CGRect v84 = (char *)&v62 - v24;
  MEMORY[0x270FA5388](v23);
  double v26 = (char *)&v62 - v25;
  double v27 = *(void **)&v3[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton];
  objc_msgSend(v27, sel_setAlpha_, 0.0);
  objc_msgSend(v27, sel_setHidden_, 1);
  sub_2568704B0();
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x263F821B8], v16);
  sub_256870460();
  swift_allocObject();
  id v70 = v3;
  swift_unknownObjectWeakInit();
  sub_256870330();
  uint64_t v28 = sub_256870320();
  uint64_t v29 = *(void *)(v28 - 8);
  double v30 = *(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56);
  uint64_t v78 = v29 + 56;
  v30(v15, 0, 1, v28);
  sub_256870480();
  if (qword_269F6BA20 != -1) {
    swift_once();
  }
  sub_256870470();
  CGRect v86 = &type metadata for MobileStore;
  unint64_t v87 = sub_25686D974();
  v85[0] = 3;
  sub_2568702F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
  CGRect v79 = v30;
  uint64_t v80 = v28;
  double v69 = v12;
  double v65 = v15;
  sub_256870380();
  type metadata accessor for SUUIStopPageViewController(0);
  ObjCClassFromMetaint data = swift_getObjCClassFromMetadata();
  CGFloat v32 = self;
  uint64_t v68 = ObjCClassFromMetadata;
  id v33 = objc_msgSend(v32, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_256870290();
  sub_2568703E0();
  sub_2568704A0();
  uint64_t v34 = v81;
  double v35 = (char *)(v81 + 16);
  CGRect v75 = *(void (**)(char *, char *, uint64_t))(v81 + 16);
  double v36 = v77;
  v75(v77, v26, v20);
  uint64_t v66 = v20;
  CGRect v76 = *(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56);
  v76(v36, 0, 1, v20);
  sub_2568704D0();
  uint64_t v64 = sub_25686E668(0, &qword_269F6B048);
  double v37 = v27;
  uint64_t v38 = v83;
  sub_25686E958((uint64_t)v73, v83, &qword_269F6AE40);
  uint64_t v39 = *(unsigned __int8 *)(v71 + 80);
  uint64_t v71 = (v39 + 16) & ~v39;
  v72 += v71;
  uint64_t v40 = v71;
  CGRect v73 = v26;
  uint64_t v67 = v39 | 7;
  uint64_t v41 = swift_allocObject();
  sub_25686EA18(v38, v41 + v40, &qword_269F6AE40);
  uint64_t v42 = (void *)sub_256870440();
  objc_msgSend(v37, sel_addAction_forControlEvents_, v42, 64);

  uint64_t v43 = v70;
  objc_msgSend(v70, sel_addSubview_, v37);
  id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
  objc_msgSend(v44, sel_setHidden_, 1);
  objc_msgSend(v44, sel_setAlpha_, 0.0);
  double v45 = v84;
  sub_256870490();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  double v46 = v65;
  sub_256870330();
  v79(v46, 0, 1, v80);
  sub_256870480();
  sub_256870380();
  type metadata accessor for SUUIStopPageViewController(0);
  id v47 = objc_msgSend(self, sel_bundleForClass_, v68);
  sub_256870290();
  uint64_t v48 = v66;
  sub_2568703E0();
  sub_2568704A0();
  CGRect v82 = v35;
  v75(v36, v45, v48);
  uint64_t v49 = v48;
  double v69 = (char *)(v34 + 56);
  v76(v36, 0, 1, v48);
  sub_2568704D0();
  uint64_t v50 = v83;
  sub_25686E958(v74, v83, &qword_269F6AE40);
  uint64_t v51 = swift_allocObject();
  sub_25686EA18(v50, v51 + v71, &qword_269F6AE40);
  double v52 = (void *)sub_256870440();
  objc_msgSend(v44, sel_addAction_forControlEvents_, v52, 64);

  objc_msgSend(v43, sel_addSubview_, v44);
  double v53 = *(void **)&v43[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  *(void *)&v43[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton] = v44;
  id v54 = v44;

  if (v43[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_showWishlistButton] == 1)
  {
    id v55 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
    objc_msgSend(v55, sel_setUserInteractionEnabled_, 0);
    objc_msgSend(v55, sel_setAlpha_, 0.0);
    id v56 = v63;
    sub_256870490();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_256870330();
    v79(v46, 0, 1, v80);
    sub_256870480();
    swift_bridgeObjectRetain();
    sub_2568704A0();
    id v57 = v77;
    v75(v77, v56, v49);
    v76(v57, 0, 1, v49);
    sub_2568704D0();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    double v58 = (void *)sub_256870440();
    objc_msgSend(v55, sel_addAction_forControlEvents_, v58, 64);

    objc_msgSend(v43, sel_addSubview_, v55);
    double v59 = *(void **)&v43[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
    *(void *)&v43[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton] = v55;

    double v60 = *(void (**)(char *, uint64_t))(v81 + 8);
    v60(v56, v49);
  }
  else
  {

    double v60 = *(void (**)(char *, uint64_t))(v81 + 8);
  }
  v60(v84, v49);
  return ((uint64_t (*)(char *, uint64_t))v60)(v73, v49);
}

void sub_25686A5E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x25A2AA1A0](v5);
  uint64_t v7 = sub_256870230();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, a1, v7);
  if (v6)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    swift_getKeyPath();
    id v9 = objc_msgSend(v6, sel_traitCollection);
    id v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);
    double v11 = 13.0;
    if ((sub_256870430() & 1) == 0)
    {
      double v11 = 15.0;
      if ((sub_256870430() & 1) == 0)
      {
        sub_256870430();
        double v11 = 18.0;
      }
    }
    objc_msgSend(self, sel_systemFontOfSize_weight_, v11, *MEMORY[0x263F81800]);

    sub_25686DDB8();
    sub_256870220();
  }
}

uint64_t sub_25686A7A8()
{
  return sub_256870370() & 1;
}

uint64_t sub_25686A804()
{
  return sub_256870360();
}

void sub_25686A84C()
{
}

void sub_25686A874()
{
}

void sub_25686A890(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25686E958(a1, (uint64_t)v4, &qword_269F6AE40);
  uint64_t v5 = sub_256870280();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    uint64_t v7 = (void *)sub_256870250();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  SUUIMetricsOpenSensitiveURL(v7, 0);
}

void sub_25686A9AC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x25A2AA1A0](v5);
  uint64_t v7 = sub_256870230();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, a1, v7);
  if (v6)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    swift_getKeyPath();
    id v9 = objc_msgSend(v6, sel_traitCollection);
    sub_25686DFA4(v9);

    sub_25686DDB8();
    sub_256870220();
  }
}

unint64_t sub_25686AAD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F6B090);
  uint64_t v2 = (void *)sub_256870530();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_25686BA40((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + vITColor::ITColor((ITColor *)this + 9) = v6;
    *(void *)(v2[7] + vITColor::ITColor((ITColor *)this + 9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25686ABE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F6B080);
  uint64_t v2 = sub_256870530();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25686E958(v6, (uint64_t)&v13, &qword_269F6B088);
    uint64_t v7 = v13;
    unint64_t result = sub_25686BA40(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25686DCF4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25686AD14(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F6B058);
  uint64_t v2 = sub_256870530();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25686E958(v6, (uint64_t)v15, &qword_269F6B060);
    unint64_t result = sub_25686BAD0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 3ITColor::ITColor((ITColor *)this + 2) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 1ITColor::ITColor((ITColor *)this + 6) = v11;
    unint64_t result = (unint64_t)sub_25686DCF4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25686AE7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_25686AF04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2568703D0();
  uint64_t v5 = v4;
  if (v3 == sub_2568703D0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  char v8 = sub_256870560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_8:
    uint64_t v9 = (void *)*(unsigned __int8 *)(a2
                                    + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable);
    *(unsigned char *)(a2
             + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable) = 1;
    return sub_256868F4C(v9);
  }
  uint64_t v9 = (void *)*(unsigned __int8 *)(a2
                                  + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable);
  *(unsigned char *)(a2
           + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable) = 0;
  return sub_256868F4C(v9);
}

id sub_25686B078(uint64_t a1)
{
  return sub_25686B090(a1, type metadata accessor for SUUIStopPageViewController.StopPageLockup);
}

id sub_25686B090(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

double CGSize.horizontalFraction.getter(double a1, double a2)
{
  double result = a1 / a2;
  if (a2 == 0.0) {
    return 0.0;
  }
  return result;
}

double CGSize.verticalFraction.getter(double a1, double a2)
{
  double v2 = a2 / a1;
  BOOL v3 = a1 == 0.0;
  double result = 0.0;
  if (!v3) {
    return v2;
  }
  return result;
}

uint64_t sub_25686B1E0()
{
  return MEMORY[0x270EF17B0](*v0);
}

uint64_t sub_25686B1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x25A2A8770](a1, &v6);
  char v4 = v7;
  uint64_t v5 = v6;
  if (v7) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + ITColor::ITColor((ITColor *)this + 8) = v4;
  return result;
}

uint64_t sub_25686B23C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  char v8 = 1;
  char v3 = MEMORY[0x25A2A8780](a1, &v7);
  char v4 = v8;
  uint64_t v5 = v7;
  if (v8) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + ITColor::ITColor((ITColor *)this + 8) = v4;
  return v3 & 1;
}

void sub_25686B294(double *a1@<X8>)
{
  *a1 = MEMORY[0x25A2A8790]();
}

uint64_t sub_25686B2BC(uint64_t a1, uint64_t a2)
{
  return sub_25686B8A8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25686B2E4(uint64_t a1, id *a2)
{
  uint64_t result = sub_2568703B0();
  *a2 = 0;
  return result;
}

uint64_t sub_25686B35C(uint64_t a1, id *a2)
{
  char v3 = sub_2568703C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25686B3DC@<X0>(uint64_t *a1@<X8>)
{
  sub_2568703D0();
  uint64_t v2 = sub_2568703A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25686B42C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2568703D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25686B458()
{
  uint64_t v0 = sub_2568703D0();
  uint64_t v2 = v1;
  if (v0 == sub_2568703D0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_256870560();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_25686B4E4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + ITColor::ITColor((ITColor *)this + 8) = 0;
  return result;
}

double sub_25686B4F4@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t sub_25686B500()
{
  return sub_256870540();
}

uint64_t sub_25686B5C8()
{
  sub_25686D658(&qword_269F6B0B8, type metadata accessor for ASCAppState);
  sub_25686D658((unint64_t *)&unk_269F6B0C0, type metadata accessor for ASCAppState);
  return sub_256870540();
}

uint64_t sub_25686B684()
{
  sub_25686D658(&qword_269F6AE88, type metadata accessor for AttributeName);
  sub_25686D658(&qword_269F6B028, type metadata accessor for AttributeName);
  return sub_256870540();
}

uint64_t sub_25686B740@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2568703A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25686B788()
{
  sub_25686D658(&qword_269F6B018, type metadata accessor for TraitKey);
  sub_25686D658(&qword_269F6B020, type metadata accessor for TraitKey);
  return sub_256870540();
}

uint64_t sub_25686B844()
{
  return MEMORY[0x270F9DDC0](*v0);
}

uint64_t sub_25686B84C()
{
  return sub_256870590();
}

uint64_t sub_25686B880(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return MEMORY[0x270F9FC40](a1, v2);
}

uint64_t sub_25686B890(uint64_t a1, uint64_t a2)
{
  return sub_25686B8A8(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25686B8A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2568703D0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25686B8EC()
{
  sub_2568703D0();
  sub_256870400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25686B940()
{
  sub_2568703D0();
  sub_256870580();
  sub_256870400();
  uint64_t v0 = sub_2568705A0();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_25686B9B4(double *a1, double *a2)
{
  return *a1 == *a2;
}

unint64_t sub_25686B9C8(uint64_t a1, uint64_t a2)
{
  sub_256870580();
  sub_256870400();
  uint64_t v4 = sub_2568705A0();
  return sub_25686BB14(a1, a2, v4);
}

unint64_t sub_25686BA40(uint64_t a1)
{
  sub_2568703D0();
  sub_256870580();
  sub_256870400();
  uint64_t v2 = sub_2568705A0();
  swift_bridgeObjectRelease();
  return sub_25686BBF8(a1, v2);
}

unint64_t sub_25686BAD0(uint64_t a1)
{
  uint64_t v2 = sub_2568704F0();
  return sub_25686BD70(a1, v2);
}

unint64_t sub_25686BB14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    long long v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_256870560() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_256870560() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25686BBF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2568703D0();
    uint64_t v8 = v7;
    if (v6 == sub_2568703D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_256870560();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2568703D0();
          uint64_t v15 = v14;
          if (v13 == sub_2568703D0() && v15 == v16) {
            break;
          }
          char v18 = sub_256870560();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_25686BD70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25686DD04(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2A89B0](v9, a1);
      sub_25686DD60((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25686BE38()
{
  unint64_t v0 = sub_256870550();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for SUUIStopPageViewController.PageArtwork(uint64_t a1)
{
  return sub_25686CC44(a1, qword_269F6BC90);
}

uint64_t sub_25686BEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 2ITColor::ITColor((ITColor *)this + 4) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25686BF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE7Enabled3forSbSS_tFZ_0()
{
  uint64_t v1 = sub_2568703F0();
  uint64_t v2 = v0;
  if (v1 == 30324 && v0 == 0xE200000000000000
    || (sub_256870560() & 1) != 0
    || v1 == 0x736569766F6DLL && v2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    char v7 = &type metadata for MobileStore;
    unint64_t v8 = sub_25686D974();
    v6[0] = 0;
    char v4 = sub_2568702F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v4 & 1;
  }
  char v3 = sub_256870560();
  swift_bridgeObjectRelease();
  char v4 = 0;
  if (v3) {
    goto LABEL_9;
  }
  return v4 & 1;
}

uint64_t _s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE23BagValueOverrideEnabled3forSbSS_tFZ_0()
{
  uint64_t v1 = sub_2568703F0();
  uint64_t v2 = v0;
  if (v1 == 30324 && v0 == 0xE200000000000000
    || (sub_256870560() & 1) != 0
    || v1 == 0x736569766F6DLL && v2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = sub_256870560();
    swift_bridgeObjectRelease();
    char v4 = 0;
    if ((v3 & 1) == 0) {
      return v4 & 1;
    }
  }
  if (os_variant_has_internal_content())
  {
    char v7 = &type metadata for MobileStore;
    unint64_t v8 = sub_25686D974();
    v6[0] = 2;
    char v4 = sub_2568702F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

uint64_t sub_25686C1DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2568702A0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_256870390();
  MEMORY[0x270FA5388](v5 - 8);
  if ((a1 != 0x736569766F6DLL || a2 != 0xE600000000000000)
    && (sub_256870560() & 1) == 0
    && (a1 != 30324 || a2 != 0xE200000000000000)
    && (sub_256870560() & 1) == 0)
  {
    return 0;
  }
  sub_256870380();
  type metadata accessor for SUUIStopPageViewController(0);
  ObjCClassFromMetaint data = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_256870290();
  return sub_2568703E0();
}

id sub_25686C3FC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *a15)
{
  uint64_t v70 = a2;
  uint64_t v71 = a7;
  uint64_t v66 = a5;
  uint64_t v69 = a1;
  uint64_t v20 = sub_2568702A0();
  MEMORY[0x270FA5388](v20 - 8);
  v65[1] = (char *)v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_256870390();
  MEMORY[0x270FA5388](v22 - 8);
  v65[0] = (char *)v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v68 = (uint64_t)v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v65 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  CGFloat v32 = (char *)v65 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)v65 - v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE50);
  MEMORY[0x270FA5388](v35 - 8);
  double v37 = (char *)v65 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView] = 0;
  if (!a4)
  {
    uint64_t v38 = v69;
    if (v69 == 0x736569766F6DLL && v70 == 0xE600000000000000
      || (sub_256870560() & 1) != 0
      || v38 == 30324 && v70 == 0xE200000000000000
      || (sub_256870560() & 1) != 0)
    {
      a4 = 0xEA00000000003934;
      a3 = 0x3538373034373131;
    }
    else
    {
      a3 = 0;
      a4 = 0;
    }
  }
  uint64_t v67 = v29;
  uint64_t v72 = a10;
  uint64_t v39 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_replacementAppAdamId];
  *uint64_t v39 = a3;
  v39[1] = a4;
  uint64_t v40 = v15;
  uint64_t v41 = v69;
  if (a6)
  {
    uint64_t v42 = v71;
    uint64_t v43 = v66;
  }
  else
  {
    uint64_t v43 = sub_25686C1DC(v69, v70);
    a6 = v44;
    uint64_t v42 = v71;
  }
  uint64_t v71 = a11;
  double v45 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageTitle];
  uint64_t *v45 = v43;
  v45[1] = a6;
  uint64_t v46 = v70;
  if (!a8)
  {
    uint64_t v42 = sub_25686C1DC(v41, v70);
    a8 = v47;
  }
  uint64_t v48 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageSubtitle];
  *uint64_t v48 = v42;
  v48[1] = a8;
  sub_256866BCC(a9, (uint64_t)v37);
  sub_25686EA18((uint64_t)v37, (uint64_t)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageArtwork], &qword_269F6AE50);
  sub_25686E958(v72, (uint64_t)v32, &qword_269F6AE40);
  uint64_t v49 = sub_256870280();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
  if (v51(v32, 1, v49) == 1)
  {
    if (v41 == 0x736569766F6DLL && v46 == 0xE600000000000000
      || (sub_256870560() & 1) != 0
      || v41 == 30324 && v46 == 0xE200000000000000
      || (sub_256870560() & 1) != 0)
    {
      sub_256870270();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v34, 1, 1, v49);
    }
    sub_25686CCA0((uint64_t)v32, &qword_269F6AE40);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v34, v32, v49);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v34, 0, 1, v49);
  }
  uint64_t v53 = a13;
  sub_25686EA18((uint64_t)v34, (uint64_t)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_deeplinkUrl], &qword_269F6AE40);
  uint64_t v54 = v68;
  sub_25686E958(v71, v68, &qword_269F6AE40);
  if (v51((char *)v54, 1, v49) == 1)
  {
    uint64_t v55 = v69;
    if (v69 == 0x736569766F6DLL && v46 == 0xE600000000000000
      || (sub_256870560() & 1) != 0
      || v55 == 30324 && v46 == 0xE200000000000000
      || (sub_256870560() & 1) != 0)
    {
      uint64_t v56 = (uint64_t)v67;
      sub_256870270();
    }
    else
    {
      uint64_t v56 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v67, 1, 1, v49);
    }
    swift_bridgeObjectRelease();
    sub_25686CCA0(v54, &qword_269F6AE40);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v56 = (uint64_t)v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v67, v54, v49);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v56, 0, 1, v49);
  }
  sub_25686EA18(v56, (uint64_t)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_purchasesUrl], &qword_269F6AE40);
  if (!a13)
  {
    sub_256870380();
    type metadata accessor for SUUIStopPageViewController(0);
    ObjCClassFromMetaint data = swift_getObjCClassFromMetadata();
    id v58 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_256870290();
    a12 = sub_2568703E0();
    uint64_t v53 = v59;
  }
  double v60 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_wishlistButtonTitle];
  *double v60 = a12;
  v60[1] = v53;
  v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_showWishlistButton] = a14 & 1;
  *(void *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_clientContext] = a15;
  id v61 = a15;

  uint64_t v62 = (objc_class *)type metadata accessor for SUUIStopPageViewController(0);
  v73.receiver = v15;
  v73.super_class = v62;
  id v63 = objc_msgSendSuper2(&v73, sel_initWithNibName_bundle_, 0, 0);
  sub_25686CCA0(v71, &qword_269F6AE40);
  sub_25686CCA0(v72, &qword_269F6AE40);
  return v63;
}

uint64_t type metadata accessor for SUUIStopPageViewController(uint64_t a1)
{
  return sub_25686CC44(a1, (uint64_t *)&unk_269F6BC80);
}

uint64_t sub_25686CC44(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for SUUIStopPageViewController.StopPageLockup()
{
  return self;
}

uint64_t sub_25686CCA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

unint64_t sub_25686CD14()
{
  unint64_t result = qword_269F6AE90;
  if (!qword_269F6AE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F6AE90);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  const char *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MobileStore(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MobileStore(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    const char *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + ITColor::ITColor((ITColor *)this + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25686CED4);
      case 4:
        *(_DWORD *)(result + ITColor::ITColor((ITColor *)this + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + ITColor::ITColor((ITColor *)this + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + ITColor::ITColor((ITColor *)this + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          const char *result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_25686CEFC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25686CF08(unsigned char *result, char a2)
{
  const char *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MobileStore()
{
  return &type metadata for MobileStore;
}

uint64_t sub_25686CF20()
{
  return type metadata accessor for SUUIStopPageViewController(0);
}

void sub_25686CF28()
{
  sub_25686D064(319, &qword_269F6AEA0, (void (*)(uint64_t))type metadata accessor for SUUIStopPageViewController.PageArtwork);
  if (v0 <= 0x3F)
  {
    sub_25686D064(319, &qword_269F6AEA8, MEMORY[0x263F06EA8]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_25686D064(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2568704E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_25686D0B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_256870280();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25686D184(uint64_t a1)
{
  uint64_t v2 = sub_256870280();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25686D1E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_256870280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25686D264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_256870280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t sub_25686D2F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_256870280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25686D36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_256870280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25686D3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25686D3FC);
}

uint64_t sub_25686D3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_256870280();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25686D468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25686D47C);
}

uint64_t sub_25686D47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_256870280();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25686D4EC()
{
  uint64_t result = sub_256870280();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25686D58C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25686D5AC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + ITColor::ITColor((ITColor *)this + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 1ITColor::ITColor((ITColor *)this + 6) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for Weight(uint64_t a1)
{
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

uint64_t sub_25686D610()
{
  return sub_25686D658(&qword_269F6AFB8, type metadata accessor for AttributeName);
}

uint64_t sub_25686D658(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25686D6A0()
{
  return sub_25686D658(&qword_269F6AFC0, type metadata accessor for AttributeName);
}

uint64_t sub_25686D6E8()
{
  return sub_25686D658(&qword_269F6AFC8, type metadata accessor for TraitKey);
}

uint64_t sub_25686D730()
{
  return sub_25686D658(&qword_269F6AFD0, type metadata accessor for TraitKey);
}

uint64_t sub_25686D778()
{
  return sub_25686D658(&qword_269F6AFD8, type metadata accessor for TraitKey);
}

uint64_t sub_25686D7C0()
{
  return sub_25686D658(&qword_269F6AFE0, type metadata accessor for Weight);
}

uint64_t sub_25686D808()
{
  return sub_25686D658(&qword_269F6AFE8, type metadata accessor for Weight);
}

uint64_t sub_25686D850()
{
  return sub_25686D658(&qword_269F6AFF0, type metadata accessor for Weight);
}

uint64_t sub_25686D898()
{
  return sub_25686D658(&qword_269F6AFF8, type metadata accessor for AttributeName);
}

unint64_t sub_25686D8E0()
{
  unint64_t result = qword_269F6B010;
  if (!qword_269F6B010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F6B010);
  }
  return result;
}

uint64_t sub_25686D934()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25686D96C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25686A5E0(a1, v2, a2);
}

unint64_t sub_25686D974()
{
  unint64_t result = qword_269F6B040;
  if (!qword_269F6B040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F6B040);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_25686DA20(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25686A9AC(a1, v2, a2);
}

uint64_t objectdestroy_40Tm()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = sub_256870280();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_25686DB60()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40) - 8);
  sub_25686A890(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

void sub_25686DBB8()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x25A2AA1A0](v0 + 16);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = objc_retain(*(id *)(v1
                           + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_clientContext));

    __swift_instantiateConcreteTypeFromMangledName(&qword_269F6B050);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 1ITColor::ITColor((ITColor *)this + 6) = xmmword_2568A1F70;
    uint64_t v5 = MEMORY[0x263F8D310];
    sub_256870510();
    *(void *)(inited + 9ITColor::ITColor((ITColor *)this + 6) = v5;
    strcpy((char *)(inited + 72), "goToWishlist");
    *(unsigned char *)(inited + 8ITColor::ITColor((ITColor *)this + 5) = 0;
    *(_WORD *)(inited + 8ITColor::ITColor((ITColor *)this + 6) = -5120;
    sub_25686AD14(inited);
    uint64_t v6 = (void *)sub_256870340();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_sendOnXEventWithDictionary_completionBlock_, v6, 0, 1701869940, 0xE400000000000000);
  }
}

_OWORD *sub_25686DCF4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25686DD04(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25686DD60(uint64_t a1)
{
  return a1;
}

unint64_t sub_25686DDB8()
{
  unint64_t result = qword_269F6B068;
  if (!qword_269F6B068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F6B068);
  }
  return result;
}

uint64_t sub_25686DE0C()
{
  return 8;
}

uint64_t sub_25686DE18()
{
  return swift_release();
}

uint64_t sub_25686DE20(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_25686DE2C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_25686DE38()
{
  uint64_t v1 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  long long v2 = &v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  *long long v2 = 0;
  v2[1] = 0;
  uint64_t v3 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v4 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v5 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton;
  *(void *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25380]), sel_init);
  uint64_t v6 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton] = 0;
  uint64_t v7 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoaderOperationQueue;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible] = 0;
  v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable] = 2;

  sub_256870520();
  __break(1u);
}

id sub_25686DFA4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  double v2 = 13.0;
  if ((sub_256870430() & 1) == 0)
  {
    double v2 = 15.0;
    if ((sub_256870430() & 1) == 0)
    {
      sub_256870430();
      double v2 = 18.0;
    }
  }
  id v3 = objc_msgSend(self, sel_systemFontOfSize_weight_, v2, *MEMORY[0x263F81838]);

  return v3;
}

uint64_t sub_25686E068()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 1ITColor::ITColor((ITColor *)this + 6) = v0;
  double v2 = self;
  id v3 = v0;
  if (objc_msgSend(v2, sel_isMainThread))
  {
    int v4 = *((unsigned __int8 *)v3
         + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible);
    *((unsigned char *)v3
    + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible) = 1;
    if (v4 == 1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_25686E668(0, &qword_269F6B078);
    uint64_t v6 = sub_256870420();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 1ITColor::ITColor((ITColor *)this + 6) = sub_25686E764;
    *(void *)(v7 + 2ITColor::ITColor((ITColor *)this + 4) = v1;
    id v3 = (void *)swift_allocObject();
    v3[2] = sub_25686EBC4;
    v3[3] = v7;
    uint64_t v22 = sub_25686EBC4;
    uint64_t v23 = v3;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_25686AE7C;
    uint64_t v21 = &block_descriptor_71;
    uint64_t v8 = _Block_copy(&v18);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v6, v8);

    swift_release();
    _Block_release(v8);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 1ITColor::ITColor((ITColor *)this + 6) = v3;
  char v11 = *(void **)((char *)v3
                 + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton);
  uint64_t v12 = v3;
  id v13 = objc_msgSend(v11, sel_superview);

  if (v13
    || (id v14 = objc_msgSend(*(id *)&v12[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_superview), v14, v14))
  {
    uint64_t v15 = self;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 1ITColor::ITColor((ITColor *)this + 6) = sub_25686E950;
    *(void *)(v16 + 2ITColor::ITColor((ITColor *)this + 4) = v10;
    uint64_t v22 = sub_25686EBC4;
    uint64_t v23 = (void *)v16;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_256868F08;
    uint64_t v21 = &block_descriptor_80;
    long long v17 = _Block_copy(&v18);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_animateWithDuration_delay_options_animations_completion_, 4, v17, 0, 0.2, 0.0);
    swift_release();
    _Block_release(v17);
    return swift_release();
  }
  sub_256868E00(v12);
  swift_release();
LABEL_3:
  return swift_release();
}

uint64_t sub_25686E408(void *a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 1ITColor::ITColor((ITColor *)this + 6) = a1;
  *(void *)(v3 + 2ITColor::ITColor((ITColor *)this + 4) = v1;
  int v4 = self;
  id v5 = v1;
  id v6 = a1;
  if (objc_msgSend(v4, sel_isMainThread))
  {
    sub_25686AF04((uint64_t)v6, (uint64_t)v5);
    return swift_release();
  }
  else
  {
    sub_25686E668(0, &qword_269F6B078);
    uint64_t v8 = sub_256870420();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 1ITColor::ITColor((ITColor *)this + 6) = sub_25686E660;
    *(void *)(v9 + 2ITColor::ITColor((ITColor *)this + 4) = v3;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 1ITColor::ITColor((ITColor *)this + 6) = sub_25686E6DC;
    *(void *)(v10 + 2ITColor::ITColor((ITColor *)this + 4) = v9;
    void v13[4] = sub_25686E6DC;
    v13[5] = v10;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_25686AE7C;
    v13[3] = &block_descriptor;
    char v11 = _Block_copy(v13);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v8, v11);

    swift_release();
    _Block_release(v11);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25686E620()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_25686E660()
{
  return sub_25686AF04(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25686E668(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_25686E6A4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25686E6DC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25686E704()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3ITColor::ITColor((ITColor *)this + 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_25686E72C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25686E764()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  char v2 = v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible];
  v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible] = 1;
  if ((v2 & 1) == 0)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 1ITColor::ITColor((ITColor *)this + 6) = v1;
    int v4 = *(void **)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
    id v5 = v1;
    id v6 = objc_msgSend(v4, sel_superview);

    if (v6
      || (id v7 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_superview), v7, v7))
    {
      uint64_t v8 = self;
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 1ITColor::ITColor((ITColor *)this + 6) = sub_25686EBF4;
      *(void *)(v9 + 2ITColor::ITColor((ITColor *)this + 4) = v3;
      void v11[4] = sub_25686EBC4;
      void v11[5] = v9;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 1107296256;
      v11[2] = sub_256868F08;
      v11[3] = &block_descriptor_91;
      uint64_t v10 = _Block_copy(v11);
      swift_retain();
      swift_release();
      objc_msgSend(v8, sel_animateWithDuration_delay_options_animations_completion_, 4, v10, 0, 0.2, 0.0);
      swift_release();
      _Block_release(v10);
    }
    else
    {
      sub_256868E00(v5);
      swift_release();
    }
  }
}

uint64_t sub_25686E940()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_25686E950()
{
  return sub_256868E00(*(unsigned char **)(v0 + 16));
}

uint64_t sub_25686E958(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25686E9BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25686EA18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void type metadata accessor for ASCAppState(uint64_t a1)
{
}

void sub_25686EA90(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    ForeignTypeMetaint data = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25686EAD8()
{
  return sub_25686D658(&qword_269F6B0A0, type metadata accessor for ASCAppState);
}

uint64_t sub_25686EB20()
{
  return sub_25686D658(&qword_269F6B0A8, type metadata accessor for ASCAppState);
}

uint64_t sub_25686EB68()
{
  return sub_25686D658(&qword_269F6B0B0, type metadata accessor for ASCAppState);
}

void sub_25686EBB0()
{
}

uint64_t sub_25686EC00()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_25686EC10()
{
  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetaint data = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269F6C8B8 = (uint64_t)result;
  return result;
}

uint64_t sub_25686EC64(uint64_t a1)
{
  return sub_25686EE0C(a1, qword_269F6C8E0);
}

uint64_t sub_25686EC90()
{
  return sub_25686EED4(&qword_269F6C8C0, (uint64_t)qword_269F6C8E0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25686ECEC@<X0>(uint64_t a1@<X8>)
{
  return sub_25686EF4C(&qword_269F6C8C0, (uint64_t)qword_269F6C8E0, a1);
}

uint64_t sub_25686ED10(uint64_t a1)
{
  return sub_25686EE0C(a1, qword_269F6C8F8);
}

uint64_t sub_25686ED34()
{
  return sub_25686EED4(&qword_269F6C8C8, (uint64_t)qword_269F6C8F8);
}

uint64_t sub_25686ED58@<X0>(uint64_t a1@<X8>)
{
  return sub_25686EF4C(&qword_269F6C8C8, (uint64_t)qword_269F6C8F8, a1);
}

uint64_t sub_25686ED7C(uint64_t a1)
{
  return sub_25686EE0C(a1, qword_269F6C910);
}

uint64_t sub_25686EDA0()
{
  return sub_25686EED4(&qword_269F6C8D0, (uint64_t)qword_269F6C910);
}

uint64_t sub_25686EDC4@<X0>(uint64_t a1@<X8>)
{
  return sub_25686EF4C(&qword_269F6C8D0, (uint64_t)qword_269F6C910, a1);
}

uint64_t sub_25686EDE8(uint64_t a1)
{
  return sub_25686EE0C(a1, qword_269F6C928);
}

uint64_t sub_25686EE0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_256870310();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269F6C8B0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269F6C8B8;
  return sub_256870300();
}

uint64_t sub_25686EEB0()
{
  return sub_25686EED4(&qword_269F6C8D8, (uint64_t)qword_269F6C928);
}

uint64_t sub_25686EED4(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_256870310();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_25686EF28@<X0>(uint64_t a1@<X8>)
{
  return sub_25686EF4C(&qword_269F6C8D8, (uint64_t)qword_269F6C928, a1);
}

uint64_t sub_25686EF4C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_256870310();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void __CGColorSpaceGetSRGB_block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1(v0);
}

void _SUUIglGetError_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"GLenum _SUUIglGetError(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIOffscreenRenderOperation.m", 43, @"%s", dlerror());

  __break(1u);
}

void _SUUIglBindFramebuffer_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SUUIglBindFramebuffer(GLenum, GLuint)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIOffscreenRenderOperation.m", 34, @"%s", dlerror());

  __break(1u);
}

void IOSurfaceLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *IOSurfaceLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUUIOffscreenRenderOperation.m", 23, @"%s", *a1);

  __break(1u);
}

void OpenGLESLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *OpenGLESLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUUIOffscreenRenderOperation.m", 19, @"%s", *a1);

  __break(1u);
}

void __getEAGLContextClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getEAGLContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIOffscreenRenderOperation.m", 20, @"Unable to find class %s", "EAGLContext");

  __break(1u);
}

void _SUUIglBindTexture_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SUUIglBindTexture(GLenum, GLuint)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIOffscreenRenderOperation.m", 35, @"%s", dlerror());

  __break(1u);
}

void _SUUIglTexParameteri_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SUUIglTexParameteri(GLenum, GLenum, GLint)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIOffscreenRenderOperation.m", 44, @"%s", dlerror());

  __break(1u);
}

void __getAMSBagClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppleMediaServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUUIClientContext.m", 37, @"%s", *a1);

  __break(1u);
}

void __getAMSBagClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAMSBagClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIClientContext.m", 38, @"Unable to find class %s", "AMSBag");

  __break(1u);
}

void getCNComposeRecipientViewDidChangeNotification_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCNComposeRecipientViewDidChangeNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIGiftComposeViewController.m", 43, @"%s", dlerror());

  __break(1u);
}

void __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ContactsAutocompleteUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUUIGiftComposeViewController.m", 42, @"%s", *a1);

  __break(1u);
}

void __SoftLinkImageIO_block_invoke_cold_1()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 27, "imageIOFramework != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_2()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 30, "weak_kCGImagePropertyEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_3()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 33, "weak_kCGImagePropertyASTCBlockSize != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_4()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 36, "weak_kCGImagePropertyASTCEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_5()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 39, "weak_CGImageDestinationCreateWithData != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_6()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 42, "weak_CGImageDestinationAddImage != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_7()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SUUIGraphics.m", 45, "weak_CGImageDestinationFinalize != NULL");
}

void __getAMSURLParserClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppleMediaServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUUIApplicationController.m", 85, @"%s", *a1);

  __break(1u);
}

void __getAMSURLParserClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAMSURLParserClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIApplicationController.m", 86, @"Unable to find class %s", "AMSURLParser");

  __break(1u);
}

void __getAMSUIDynamicViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAMSUIDynamicViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIURLResolver.m", 37, @"Unable to find class %s", "AMSUIDynamicViewController");

  __break(1u);
}

void AppleMediaServicesUILibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppleMediaServicesUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUUIURLResolver.m", 36, @"%s", *a1);

  __break(1u);
}

void __getAMSUIWebViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAMSUIWebViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIURLResolver.m", 38, @"Unable to find class %s", "AMSUIWebViewController");

  __break(1u);
  sub_256870210();
}

uint64_t sub_256870210()
{
  return MEMORY[0x270F816C0]();
}

uint64_t sub_256870220()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_256870230()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_256870240()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_256870250()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_256870260()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_256870270()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_256870280()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_256870290()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2568702A0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2568702C0()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t sub_2568702D0()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t sub_2568702E0()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t sub_2568702F0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_256870300()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_256870310()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_256870320()
{
  return MEMORY[0x270F823E0]();
}

uint64_t sub_256870330()
{
  return MEMORY[0x270F823F8]();
}

uint64_t sub_256870340()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_256870350()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_256870360()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_256870370()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_256870380()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_256870390()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2568703A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2568703B0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2568703C0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2568703D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2568703E0()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2568703F0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_256870400()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_256870420()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_256870430()
{
  return MEMORY[0x270F826B8]();
}

uint64_t sub_256870440()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_256870450()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_256870460()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_256870470()
{
  return MEMORY[0x270F829E0]();
}

uint64_t sub_256870480()
{
  return MEMORY[0x270F82AB0]();
}

uint64_t sub_256870490()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_2568704A0()
{
  return MEMORY[0x270F82B18]();
}

uint64_t sub_2568704B0()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_2568704C0()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_2568704D0()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_2568704E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2568704F0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_256870500()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_256870510()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_256870520()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_256870530()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_256870540()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_256870550()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_256870560()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_256870580()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_256870590()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2568705A0()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB978](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x270EE43B0](alloc, str, attributes);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B90]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E90](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

uint64_t CFURLCacheRemoveAllCachedResponses()
{
  return MEMORY[0x270EE2920]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCProfile(CFDataRef data)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA0](data);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
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

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x270EE6680](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x270EE6748](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t CPFSSizeStrings()
{
  return MEMORY[0x270F0CD38]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x270F0CD98]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x270F0CDA0]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x270EE9A80]();
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AF8](name, matrix, size);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x270EE9B78]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x270EE9C30]();
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x270EE9D18](frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return (CGPathRef)MEMORY[0x270EE9D20](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1 = MEMORY[0x270EE9D30](frame);
  result.length = v2;
  result.id location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x270EE9D68](line, *(void *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x270EE9DB0](line, options);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x270EE9DF0](line);
  result.length = v2;
  result.id location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  MEMORY[0x270EE9DF8](line);
  return result;
}

uint64_t ISDictionaryValueForCaseInsensitiveString()
{
  return MEMORY[0x270F88AE8]();
}

uint64_t ISErrorIsEqual()
{
  return MEMORY[0x270F88B00]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A20](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x270EF2B30](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x270EF2B50](table, key, originalKey, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment)
{
  return MEMORY[0x270F80B18](ctTextAlignment);
}

uint64_t SKGetRatingStarsImage()
{
  return MEMORY[0x270EFE738]();
}

uint64_t SSDebugFileLevel()
{
  return MEMORY[0x270F78E28]();
}

uint64_t SSDebugLevel()
{
  return MEMORY[0x270F78E30]();
}

uint64_t SSDebugLog()
{
  return MEMORY[0x270F78E38]();
}

uint64_t SSDialogGetDaemonDialogState()
{
  return MEMORY[0x270F78E78]();
}

uint64_t SSDownloadKindIsEBookKind()
{
  return MEMORY[0x270F78E90]();
}

uint64_t SSDownloadKindIsSoftwareKind()
{
  return MEMORY[0x270F78E98]();
}

uint64_t SSError()
{
  return MEMORY[0x270F78EA0]();
}

uint64_t SSFileIsLocalWritable()
{
  return MEMORY[0x270F78EC0]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x270F78EC8]();
}

uint64_t SSGetStringForNetworkType()
{
  return MEMORY[0x270F78EE8]();
}

uint64_t SSVAddMediaSocialHeadersToURLRequest()
{
  return MEMORY[0x270F78F50]();
}

uint64_t SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest()
{
  return MEMORY[0x270F78F98]();
}

uint64_t SSVDefaultUserAgent()
{
  return MEMORY[0x270F78FA0]();
}

uint64_t SSVGetMetricsPageDescriptionWithPlatformDictionary()
{
  return MEMORY[0x270F78FB8]();
}

uint64_t SSVProtocolRedirectURLForResponse()
{
  return MEMORY[0x270F78FC8]();
}

uint64_t SSVStoreFrontIdentifierForAccount()
{
  return MEMORY[0x270F78FD0]();
}

uint64_t SUCreateHTMLForPlainText()
{
  return MEMORY[0x270F88B50]();
}

uint64_t SUCreatePreviewHistoryOperation()
{
  return MEMORY[0x270F88B58]();
}

uint64_t SUWebScriptNameForSelector2()
{
  return MEMORY[0x270F88B90]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x270F82C10]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F82C50]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x270F82CA0]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x270F82CE8]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x270F82CF0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x270F82D28]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIITunesStoreResolvedURLForHTTPURL()
{
  return MEMORY[0x270F82DB0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x270F82E20]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x270F82E28]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x270F82E60]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F82E88]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F82E90]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F82E98]();
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A420](cls, protocol);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

void srand48(uint64_t a1)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}