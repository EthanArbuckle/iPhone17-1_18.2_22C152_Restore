void sub_507C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_509C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5178;
  block[3] = &unk_103F0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_5178(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (*((unsigned char *)WeakRetained + 112))
    {
      if (v3)
      {
        [WeakRetained[8] invalidate];
        objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
      }
      else
      {
        v4 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 40);
          int v6 = 138412290;
          uint64_t v7 = v5;
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Error Acquiring Assertion for Lockscreen Plugin: %@", (uint8_t *)&v6, 0xCu);
        }
      }
    }
    else
    {
      [v3 invalidate];
    }
  }
}

void *sub_587C(void *result, int a2, uint64_t a3)
{
  switch(a2)
  {
    case 3:
      if (!*((unsigned char *)result + 40)) {
        return objc_msgSend(*(id *)(result[4] + 80), "willDisappear", a3);
      }
      break;
    case 2:
      if (!*((unsigned char *)result + 40)) {
        return objc_msgSend(*(id *)(result[4] + 80), "didAppear", a3);
      }
      break;
    case 1:
      int v3 = *((unsigned __int8 *)result + 40);
      uint64_t v4 = result[4];
      if (v3) {
        return [(id)v4 _insertViewControllerIfNeeded:*(void *)(v4 + 88)];
      }
      else {
        return [*(id *)(v4 + 80) setOffscreen:1];
      }
  }
  return result;
}

void sub_5AB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_5ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[10] setExternalizedAuthenticationContext:v3];
  [WeakRetained _updateViewState];
  [WeakRetained[11] fadeOutUIWithCompletion:0];
  [WeakRetained[11] invalidate];
  uint64_t v5 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5BE0;
  v6[3] = &unk_10468;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v5 _presentPassesAnimated:1 completion:v6];
  objc_destroyWeak(&v7);
}

void sub_5BCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_5BE0(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v6 = WeakRetained;
    uint64_t v2 = [WeakRetained[11] view];
    [v2 removeFromSuperview];

    id v3 = v6[11];
    v6[11] = 0;

    uint64_t v4 = [v6 view];
    uint64_t v5 = +[UIColor clearColor];
    [v4 setBackgroundColor:v5];

    WeakRetained = v6;
  }
}

void sub_5D30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allObjects];
  id v3 = objc_msgSend(v2, "pk_indexDictionaryByApplyingBlock:", &stru_104D0);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(*(void *)(a1 + 40) + 24);
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v14 = 0;
    uint64_t v6 = *(void *)v17;
    do
    {
      id v7 = 0;
      id v13 = v5;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v7);
        v9 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v8];
        id v10 = [v3 objectForKey:v8];
        if (v10 && ([v9 isEqualToPassIncludingMetadata:v10] & 1) == 0)
        {
          id v11 = *(void **)(*(void *)(a1 + 40) + 32);
          id v12 = [v9 uniqueID];
          [v11 setObject:v10 forKey:v12];

          id v5 = v13;
          [*(id *)(*(void *)(a1 + 40) + 80) reloadCardAtIndex:(char *)v7 + v14];
        }

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      v14 += (uint64_t)v7;
    }
    while (v5);
  }
}

NSCopying *__cdecl sub_5F34(id a1, PKPass *a2)
{
  return (NSCopying *)[(PKPass *)a2 uniqueID];
}

id sub_6324(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAnimatingPresentation:0];
}

id sub_6330(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFadeAlpha:1.0];
}

void sub_633C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(double *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_63F4;
  v4[3] = &unk_10548;
  id v5 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:v4 animations:v3];
}

id sub_63F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSubviewAlpha:1.0];
}

uint64_t sub_6988(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pluginAgent];
  [v2 deactivatePluginController:*(void *)(a1 + 32)];

  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

id sub_6A04(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setSubviewAlpha:0.0];
}

id sub_6A1C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setFadeAlpha:0.0];
}

uint64_t sub_6A34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t sub_6D84(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_7060(uint64_t a1)
{
  return PKOpenApplication(*(NSNotification **)(a1 + 32));
}

void sub_7380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGColorRef sub_739C(uint64_t a1)
{
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(a1 + 32) CGColor]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_73D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_A034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A058(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = *((_DWORD *)v3 + 21) - 1;
    *((_DWORD *)v3 + 21) = v4;
    if (*(unsigned char *)(a1 + 36))
    {
      if (*((_DWORD *)v3 + 20) == *(_DWORD *)(a1 + 32))
      {
        id v6 = v3;
        id v5 = (void *)*((void *)v3 + 7);
        if (*(unsigned char *)(a1 + 37)) {
          [v5 didBecomeVisibleAnimated:1];
        }
        else {
          [v5 didBecomeHiddenAnimated:1];
        }
        id v3 = v6;
      }
      int v4 = *((_DWORD *)v3 + 21);
    }
    if (!v4 && !*((unsigned char *)v3 + 76))
    {
      id v7 = v3;
      [*((id *)v3 + 7) configureWithConfiguration:0 context:0 options:0];
      id v3 = v7;
    }
  }
}

id sub_A134(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(a1 + 32) + 84);
  [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void sub_A198(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_A59C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Wallet isn't supported on iPads", v1, 2u);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return _CGColorRetain(color);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t PKDeviceLocked()
{
  return _PKDeviceLocked();
}

uint64_t PKEqualObjects()
{
  return _PKEqualObjects();
}

uint64_t PKIsLowEndDevice()
{
  return _PKIsLowEndDevice();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKMagicCurve()
{
  return _PKMagicCurve();
}

uint64_t PKPassFrontFaceContentSize()
{
  return _PKPassFrontFaceContentSize();
}

uint64_t PKPassHeightAdjustmentForStyle()
{
  return _PKPassHeightAdjustmentForStyle();
}

uint64_t PKPassKitCoreBundle()
{
  return _PKPassKitCoreBundle();
}

uint64_t PKPassMaxFrontSize()
{
  return _PKPassMaxFrontSize();
}

uint64_t PKPassViewFrontSize()
{
  return _PKPassViewFrontSize();
}

uint64_t PKRelevancyLocationServicesEnabled()
{
  return _PKRelevancyLocationServicesEnabled();
}

uint64_t PKSizeAlignedInRect()
{
  return _PKSizeAlignedInRect();
}

uint64_t PKUIGetMinScreenType()
{
  return _PKUIGetMinScreenType();
}

uint64_t PKUIPerformWithEffectiveTraitCollection()
{
  return _PKUIPerformWithEffectiveTraitCollection();
}

uint64_t PKValueAddedServicesEnabledForPass()
{
  return _PKValueAddedServicesEnabledForPass();
}

uint64_t PKViewVisibilityStateAdvanceState()
{
  return _PKViewVisibilityStateAdvanceState();
}

uint64_t SBUIGetUserAgent()
{
  return _SBUIGetUserAgent();
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__createCoverSheetViewController(void *a1, const char *a2, ...)
{
  return [a1 _createCoverSheetViewController];
}

id objc_msgSend__createPassesView(void *a1, const char *a2, ...)
{
  return [a1 _createPassesView];
}

id objc_msgSend__dequeueRecycledPage(void *a1, const char *a2, ...)
{
  return [a1 _dequeueRecycledPage];
}

id objc_msgSend__dismissIfAppropriate(void *a1, const char *a2, ...)
{
  return [a1 _dismissIfAppropriate];
}

id objc_msgSend__overlayStyle(void *a1, const char *a2, ...)
{
  return [a1 _overlayStyle];
}

id objc_msgSend__refreshBrightnessForFrontmostPass(void *a1, const char *a2, ...)
{
  return [a1 _refreshBrightnessForFrontmostPass];
}

id objc_msgSend__updateAlphasAndBacklight(void *a1, const char *a2, ...)
{
  return [a1 _updateAlphasAndBacklight];
}

id objc_msgSend__updateNumberOfPages(void *a1, const char *a2, ...)
{
  return [a1 _updateNumberOfPages];
}

id objc_msgSend__updatePageControl(void *a1, const char *a2, ...)
{
  return [a1 _updatePageControl];
}

id objc_msgSend__updatePageScrollViewContentSize(void *a1, const char *a2, ...)
{
  return [a1 _updatePageScrollViewContentSize];
}

id objc_msgSend__updatePassFooterViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updatePassFooterViewIfNecessary];
}

id objc_msgSend__updateViewState(void *a1, const char *a2, ...)
{
  return [a1 _updateViewState];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_barcode(void *a1, const char *a2, ...)
{
  return [a1 barcode];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_cardCount(void *a1, const char *a2, ...)
{
  return [a1 cardCount];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return [a1 currentIndex];
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return [a1 currentPage];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultDuration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_disableIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 disableIdleTimer];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_enableIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 enableIdleTimer];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasLocationRelevancyInfo(void *a1, const char *a2, ...)
{
  return [a1 hasLocationRelevancyInfo];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAccessPass(void *a1, const char *a2, ...)
{
  return [a1 isAccessPass];
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return [a1 isDecelerating];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return [a1 isDragging];
}

id objc_msgSend_isInRestrictedMode(void *a1, const char *a2, ...)
{
  return [a1 isInRestrictedMode];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return [a1 isTracking];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_loadContentSync(void *a1, const char *a2, ...)
{
  return [a1 loadContentSync];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_markAsHavingReceivedLocation(void *a1, const char *a2, ...)
{
  return [a1 markAsHavingReceivedLocation];
}

id objc_msgSend_numberOfPages(void *a1, const char *a2, ...)
{
  return [a1 numberOfPages];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_pass(void *a1, const char *a2, ...)
{
  return [a1 pass];
}

id objc_msgSend_passType(void *a1, const char *a2, ...)
{
  return [a1 passType];
}

id objc_msgSend_passUniqueID(void *a1, const char *a2, ...)
{
  return [a1 passUniqueID];
}

id objc_msgSend_passView(void *a1, const char *a2, ...)
{
  return [a1 passView];
}

id objc_msgSend_pluginAgent(void *a1, const char *a2, ...)
{
  return [a1 pluginAgent];
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return [a1 prepareForReuse];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_secureElementPass(void *a1, const char *a2, ...)
{
  return [a1 secureElementPass];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedStaticResources(void *a1, const char *a2, ...)
{
  return [a1 sharedStaticResources];
}

id objc_msgSend_sizeOfFront(void *a1, const char *a2, ...)
{
  return [a1 sizeOfFront];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startEvaluation(void *a1, const char *a2, ...)
{
  return [a1 startEvaluation];
}

id objc_msgSend_startIndex(void *a1, const char *a2, ...)
{
  return [a1 startIndex];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_translatedView(void *a1, const char *a2, ...)
{
  return [a1 translatedView];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}