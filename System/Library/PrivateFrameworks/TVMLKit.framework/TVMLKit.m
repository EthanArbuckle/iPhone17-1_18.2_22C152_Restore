void sub_230B50168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24)
{
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  id *v30;
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak((id *)(v32 - 112));
  _Unwind_Resume(a1);
}

void sub_230B5275C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t TVShouldConstrainToPortait()
{
  if (TVShouldConstrainToPortait_sOnceToken != -1) {
    dispatch_once(&TVShouldConstrainToPortait_sOnceToken, &__block_literal_global_300);
  }
  return TVShouldConstrainToPortait_tvConstrainToPortrait;
}

uint64_t __TVShouldConstrainToPortait_block_invoke()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  int v2 = MGGetSInt32Answer();
  v3 = [MEMORY[0x263F1C920] mainScreen];
  v4 = [v3 fixedCoordinateSpace];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  double Width = CGRectGetWidth(v18);
  uint64_t result = MGGetBoolAnswer();
  if (v1)
  {
    char v15 = 0;
  }
  else
  {
    BOOL v17 = Width < 375.0 || v2 == 5;
    char v15 = v17 & ~(_BYTE)result;
  }
  TVShouldConstrainToPortait_tvConstrainToPortrait = v15;
  return result;
}

CGFloat _TVMLRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

CGFloat _TVMLRectMakeWithDirectionalOriginRelativeToBoundingRect(int a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    double v15 = a2 - CGRectGetMinX(v17);
    v18.origin.x = a6;
    v18.origin.y = a7;
    v18.size.width = a8;
    v18.size.height = a9;
    return CGRectGetMaxX(v18) - v15 - a4;
  }
  return a2;
}

double TVRowMetricsMakeWithCellMetrics@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 48);
  *(void *)(a2 + 24) = *(void *)(a1 + 32);
  *(void *)(a2 + 32) = v2;
  uint64_t v3 = *(void *)(a1 + 80);
  *(void *)(a2 + 40) = *(void *)(a1 + 64);
  *(void *)(a2 + 48) = v3;
  uint64_t v4 = *(void *)(a1 + 112);
  *(void *)(a2 + 56) = *(void *)(a1 + 96);
  *(void *)(a2 + 64) = v4;
  double result = *(double *)(a1 + 128);
  *(double *)(a2 + 72) = result;
  return result;
}

void TVRowMetricsMakeWithList(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = a1;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x7010000000;
  CGRect v16 = &unk_230C43B61;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 firstObject];
  double v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "tv_rowMetricsValue");
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __TVRowMetricsMakeWithList_block_invoke;
  v10[3] = &unk_264BA6698;
  CGFloat v12 = &v13;
  id v6 = v3;
  id v11 = v6;
  [v6 enumerateObjectsUsingBlock:v10];
  double v7 = v14;
  long long v8 = *((_OWORD *)v14 + 5);
  a2[2] = *((_OWORD *)v14 + 4);
  a2[3] = v8;
  a2[4] = *((_OWORD *)v7 + 6);
  long long v9 = *((_OWORD *)v7 + 3);
  *a2 = *((_OWORD *)v7 + 2);
  a2[1] = v9;

  _Block_object_dispose(&v13, 8);
}

void sub_230B593AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __TVRowMetricsMakeWithList_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = 0;
    if (v5) {
      objc_msgSend(v5, "tv_rowMetricsValue", 0);
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + 0.0;
    if (objc_msgSend(*(id *)(a1 + 32), "count", v7) - 1 == a3)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 72) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 88) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 104) = 0;
    }
  }
}

BOOL TVRowMetricsEqualToRowMetrics(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

uint64_t TVCellMetricsEqualToCellMetrics(float64x2_t *a1, float64x2_t *a2)
{
  BOOL v2 = a1->f64[0] == a2->f64[0] && a1->f64[1] == a2->f64[1];
  if (v2
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[1], a2[1]), (int32x4_t)vceqq_f64(a1[2], a2[2]))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[3], a2[3]), (int32x4_t)vceqq_f64(a1[4], a2[4]))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[5], a2[5]), (int32x4_t)vceqq_f64(a1[6], a2[6]))), 0xFuLL))) & 1) != 0)
  {
    char v3 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[7], a2[7]), (int32x4_t)vceqq_f64(a1[8], a2[8]))), 0xFuLL)));
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

void sub_230B5C300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_230B5CEEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_230B5DE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __textImageUnicodeImageMapping_block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = @"􀥆";
  v2[1] = @"􀥇";
  v3[0] = @"house.circle";
  v3[1] = @"house.circle.fill";
  v2[2] = @"􀎳";
  v2[3] = @"􀎴";
  v3[2] = @"tv.circle";
  v3[3] = @"tv.circle.fill";
  v2[4] = @"􀍉";
  v2[5] = @"􀍋";
  v3[4] = @"video";
  v3[5] = @"video.circle";
  v2[6] = @"􀍌";
  v2[7] = @"􀒩";
  v3[6] = @"video.circle.fill";
  v3[7] = @"mic.circle";
  v2[8] = @"􀒪";
  v3[8] = @"mic.circle.fill";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)textImageUnicodeImageMapping_mapping;
  textImageUnicodeImageMapping_mapping = v0;
}

void sub_230B6181C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_230B61C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B61E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SizeClassString(uint64_t a1)
{
  if (SizeClassString_onceToken != -1) {
    dispatch_once(&SizeClassString_onceToken, &__block_literal_global_609);
  }
  uint64_t v2 = (void *)SizeClassString_sizeClassStrings;
  char v3 = [NSNumber numberWithInteger:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (!v4) {
    uint64_t v4 = @"unspecified";
  }
  id v6 = v4;

  return v6;
}

void __getAMSUIDynamicViewControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSUIDynamicViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSUIDynamicViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSUIDynamicViewControllerClass_block_invoke_cold_1();
    AppleMediaServicesUILibrary();
  }
}

void AppleMediaServicesUILibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264BA6960;
    uint64_t v3 = 0;
    AppleMediaServicesUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppleMediaServicesUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAMSUIMarketingItemViewControllerClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesUILibrary();
  Class result = objc_getClass("AMSUIMarketingItemViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSUIMarketingItemViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAMSUIMarketingItemViewControllerClass_block_invoke_cold_1();
    return (Class)__UserInterfaceString_block_invoke(v3);
  }
  return result;
}

void __UserInterfaceString_block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E59E1A0;
  v2[1] = &unk_26E59E1B8;
  v3[0] = @"phone";
  v3[1] = @"pad";
  v2[2] = &unk_26E59E1D0;
  v2[3] = &unk_26E59E1E8;
  v3[2] = @"tv";
  v3[3] = @"carPlay";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)UserInterfaceString_userInterfaceStrings;
  UserInterfaceString_userInterfaceStrings = v0;
}

void __SizeClassString_block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E59E1B8;
  v2[1] = &unk_26E59E1D0;
  v3[0] = @"compact";
  v3[1] = @"regular";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)SizeClassString_sizeClassStrings;
  SizeClassString_sizeClassStrings = v0;
}

void sub_230B66CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B678A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B70A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double ImpressionableRectVisibleFactor(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  double v16 = Width * CGRectGetHeight(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  double v17 = CGRectGetWidth(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  return v16 / (v17 * CGRectGetHeight(v22));
}

uint64_t ActuallyVisibleView(void *a1)
{
  id v1 = a1;
  if (([v1 isHidden] & 1) != 0 || (objc_msgSend(v1, "alpha"), v2 == 0.0))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v5 = [v1 superview];
    if (v5)
    {
      id v6 = (void *)v5;
      while (([v6 isHidden] & 1) == 0)
      {
        [v6 alpha];
        if (v7 <= 0.0) {
          break;
        }
        uint64_t v8 = [v6 superview];

        id v6 = (void *)v8;
        if (!v8)
        {
          uint64_t v3 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = 0;
LABEL_12:
    }
    else
    {
      uint64_t v3 = 1;
    }
  }

  return v3;
}

double ImpressionVisibilityFactor(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v2 = v1;
  }
  else {
    double v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = [v3 window];
  uint64_t v5 = (void *)v4;
  double v6 = 0.0;
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v3 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [v3 superview];
    objc_msgSend(v5, "convertRect:fromView:", v16, v9, v11, v13, v15);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    [v5 bounds];
    v35.origin.CGFloat x = v18;
    v35.origin.CGFloat y = v20;
    v35.size.CGFloat width = v22;
    v35.size.CGFloat height = v24;
    CGRect v31 = CGRectIntersection(v30, v35);
    CGRect v32 = CGRectIntegral(v31);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    [v3 bounds];
    CGRect v34 = CGRectIntegral(v33);
    double v6 = ImpressionableRectVisibleFactor(x, y, width, height, v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  }

  return v6;
}

void _TVAppTemplateImpressionableTestAndAddToMultableArray(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
    _TVAppTemplateImpressionableTestAndAddToMultableArray_cold_1(v8);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = objc_msgSend(v6, "tv_impressionableElementsForDocument:", v7);
LABEL_6:
    double v10 = (void *)v9;
    [v5 addObjectsFromArray:v9];
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v6 impressionableElementsContainedInDocument:v7];
    goto LABEL_6;
  }
  double v10 = objc_msgSend(v6, "tv_associatedIKViewElement");
  if (v10) {
    [v5 addObject:v10];
  }
LABEL_7:
}

id TVMonogramImageWithConfiguration(void *a1)
{
  id v1 = a1;
  double v2 = [_TVMonogramDescription alloc];
  id v3 = [v1 firstName];
  uint64_t v4 = [v1 lastName];
  id v5 = [v1 font];
  id v6 = [(_TVMonogramDescription *)v2 initWithFirstName:v3 lastName:v4 imageURL:0 font:v5];

  id v7 = [v1 text];
  [(_TVMonogramDescription *)v6 setText:v7];

  double v8 = [v1 bgColor];
  [(_TVMonogramDescription *)v6 setFillColor:v8];

  [v1 diameter];
  double v10 = v9;
  [v1 diameter];
  -[_TVMonogramDescription setSize:](v6, "setSize:", v10, v11);
  [v1 focusedSizeIncrease];
  -[_TVMonogramDescription setUpscaleAdjustment:](v6, "setUpscaleAdjustment:");
  [v1 diameter];
  [(_TVMonogramDescription *)v6 setCornerRadius:fabs(v12 * 0.5)];
  double v13 = [v1 textColor];

  [(_TVMonogramDescription *)v6 setTextColor:v13];
  double v14 = +[_TVMonogramInitialsSilhouetteImageGenerator monogramImageWithDescription:v6];

  return v14;
}

void sub_230B76B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B85A7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230B87C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_230B8B4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B8B9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B8C1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  objc_destroyWeak(v29);
  objc_destroyWeak(&a28);
  _Block_object_dispose(&a29, 8);
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

void sub_230B903A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B91400(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id _TVMLLocString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[TVMLUtilities TVMLKitBundle];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_26E5657A8 table:v3];

  return v6;
}

void sub_230B92228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B97EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
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

void sub_230B9CBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B9CCD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230B9E10C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

void sub_230B9F300(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_230B9F750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FindScrollViewFromView(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (([v1 contentSize], v3 = v2, double v5 = v4, objc_msgSend(v1, "bounds"), v3 <= v7)
      ? (BOOL v8 = v5 <= v6)
      : (BOOL v8 = 0),
        v8))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = objc_msgSend(v1, "subviews", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v16 = FindScrollViewFromView(v15);

          if (v16)
          {
            id v9 = v15;

            goto LABEL_17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v1;
  }
LABEL_17:

  return v9;
}

void sub_230B9FCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230B9FE28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id FindTestableViewForElement(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  double v4 = objc_msgSend(v3, "tv_associatedIKViewElement");
  double v5 = [v4 attributes];
  double v6 = [v5 objectForKey:@"scrollTest"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a2) {
        *a2 = v6;
      }
      id v7 = v3;
LABEL_20:
      double v14 = v7;
      goto LABEL_33;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a2) {
        *a2 = v6;
      }
      id v7 = [v3 view];
      goto LABEL_20;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_31:
      double v14 = 0;
      goto LABEL_33;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v8 = objc_msgSend(v3, "subviews", 0);
    uint64_t v15 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
LABEL_24:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = FindTestableViewForElement(*(void *)(*((void *)&v20 + 1) + 8 * v18), a2);
        if (v13) {
          goto LABEL_32;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v16) {
            goto LABEL_24;
          }
          break;
        }
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v8 = [v3 childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v9) {
    goto LABEL_30;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v25;
LABEL_9:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v25 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = FindTestableViewForElement(*(void *)(*((void *)&v24 + 1) + 8 * v12), a2);
    if (v13) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10) {
        goto LABEL_9;
      }
      goto LABEL_30;
    }
  }
LABEL_32:
  double v14 = (void *)v13;

LABEL_33:
  return v14;
}

void sub_230BA190C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  objc_destroyWeak((id *)(v28 - 112));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_230BA2118(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_230BA2740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BA5658(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_230BABF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BAC014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_230BAFAF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_230BAFCD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id TVFontFromElement(void *a1)
{
  uint64_t v1 = [a1 style];
  double v2 = +[TVMLUtilities fontFromStyle:v1];

  return v2;
}

uint64_t TVFocusedSizeIncreaseForSize()
{
  return +[TVMLUtilities focusedSizeIncreaseForSize:upscaleFactor:](TVMLUtilities, "focusedSizeIncreaseForSize:upscaleFactor:");
}

id TVIndexPathForFirstItemAttributeValue(uint64_t a1)
{
  return +[TVMLUtilities indexPathForFirstItemAttributeValue:a1];
}

void sub_230BB1238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_230BB290C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BB6440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

id _TVCreateSpinnerImage(void *a1, double a2)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  id v3 = a1;
  double v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  double v7 = v6 * a2;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v9 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v7, 8uLL, 0, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v9) {
    goto LABEL_12;
  }
  CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
  CGContextSetLineWidth(v9, ceil(v7 * 0.1));
  CGContextSetLineCap(v9, kCGLineCapRound);
  double v10 = v7 * 0.5;
  double v20 = v7 * 0.5 * 0.5;
  double v21 = v7 * 0.5 * 0.9;
  CGFloat v24 = 0.0;
  CGFloat v25 = 0.0;
  double v22 = 1.0;
  CGFloat v23 = 0.0;
  int v11 = [v3 getRed:&v25 green:&v24 blue:&v23 alpha:&v22];
  uint64_t v12 = 30;
  do
  {
    CGContextBeginPath(v9);
    __double2 v13 = __sincos_stret((double)v12 / 180.0 * 3.14159265);
    CGContextMoveToPoint(v9, v10 + v20 * v13.__sinval, v10 + -v20 * v13.__cosval);
    CGContextAddLineToPoint(v9, v10 + v21 * v13.__sinval, v10 + -v21 * v13.__cosval);
    uint64_t v14 = v12 - 360;
    if ((unint64_t)v12 >= 0x168) {
      uint64_t v15 = v12 - 360;
    }
    else {
      uint64_t v15 = v12;
    }
    double v16 = (double)v15 / -360.0 + 1.0;
    if (v11)
    {
      components[0] = v25;
      components[1] = v24;
      components[2] = v23;
      components[3] = v16 * v22;
      CGContextSetStrokeColorSpace(v9, DeviceRGB);
      CGContextSetStrokeColor(v9, components);
    }
    else
    {
      CGContextSetGrayStrokeColor(v9, 1.0, v16);
    }
    CGContextStrokePath(v9);
    v12 += 30;
  }
  while ((unint64_t)(v14 + 360) < 0x14B);
  CGImageRef Image = CGBitmapContextCreateImage(v9);
  CFRelease(v9);
  if (Image)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:Image];
    CFRelease(Image);
  }
  else
  {
LABEL_12:
    uint64_t v18 = 0;
  }

  return v18;
}

void sub_230BBB454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

id _TVStackMakeImageView()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
  [v0 setUserInteractionEnabled:0];
  [v0 setOpaque:1];
  [v0 setClipsToBounds:1];
  return v0;
}

void sub_230BBCA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

unint64_t _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(unint64_t a1, unint64_t a2)
{
  if (!dword_26AC2C9EC) {
    mach_timebase_info((mach_timebase_info_t)&_TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds_sTimebaseInfo);
  }
  if (a2 >= a1) {
    return (a2 - a1)
  }
         * _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds_sTimebaseInfo
         / dword_26AC2C9EC
         / 0x3E8;
  else {
    return 0;
  }
}

void sub_230BBFB04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_230BC09D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_230BC0DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BC88CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_230BCD008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
}

void sub_230BCE0D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t _TVSetupLoggingObjects()
{
  os_log_t v0 = os_log_create("com.apple.TVMLKit", "System");
  uint64_t v1 = (void *)TVMLKitLogObject;
  TVMLKitLogObject = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.TVMLKit", "Image");
  uint64_t v3 = (void *)TVMLKitImageLogObject;
  TVMLKitImageLogObject = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.TVMLKit", "Video");
  double v5 = (void *)TVMLKitVideoLogObject;
  TVMLKitVideoLogObject = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.TVMLKit", "ScreenSaver");
  double v7 = (void *)TVMLKitScreenSaverLogObject;
  TVMLKitScreenSaverLogObject = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.TVMLKit", "Performance");
  uint64_t v9 = TVMLKitPerformanceLogObject;
  TVMLKitPerformanceLogObject = (uint64_t)v8;
  return MEMORY[0x270F9A758](v8, v9);
}

uint64_t _TVSetupSignpostLoggingObject()
{
  os_log_t v0 = os_log_create("com.apple.TVMLKit", "Signpost");
  uint64_t v1 = TVMLKitSignpostLogObject;
  TVMLKitSignpostLogObject = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t IsPerformanceLoggingEnabled()
{
  if (IsPerformanceLoggingEnabled_onceToken != -1) {
    dispatch_once(&IsPerformanceLoggingEnabled_onceToken, &__block_literal_global_29);
  }
  return IsPerformanceLoggingEnabled_isEnabled;
}

uint64_t __IsPerformanceLoggingEnabled_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PerformanceLoggingEnabled", @"com.apple.TVMLKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    IsPerformanceLoggingEnabled_isEnabled = result == 1;
  }
  return result;
}

void sub_230BCFB38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_230BCFCB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230BD1DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230BD3564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_230BD3A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_230BD6224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BD9894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230BDF374(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_230BE13DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _TVBlurredImageWithOptionsAndOverlayColorForImage(void *a1, char a2, void *a3, double a4, double a5, double a6)
{
  v56[1] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = a3;
  if (!v11) {
    goto LABEL_19;
  }
  double v13 = (a2 & 4) != 0 ? 0.0 : a6 + a6;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v15 = (double)(unint64_t)a4;
  double v16 = (double)(unint64_t)a5;
  uint64_t v17 = CGBitmapContextCreate(0, (unint64_t)(v15 + v13 * 2.0), (unint64_t)(v16 + v13 * 2.0), 8uLL, 0, DeviceRGB, 0x2002u);
  CFRelease(DeviceRGB);
  if (!v17) {
    goto LABEL_19;
  }
  uint64_t v18 = (CGImage *)[v11 CGImage];
  v58.origin.double x = v13;
  v58.origin.double y = v13;
  v58.size.double width = v15;
  v58.size.double height = v16;
  CGContextDrawImage(v17, v58, v18);
  CGImageRef Image = CGBitmapContextCreateImage(v17);
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(v17);
  double x = ClipBoundingBox.origin.x;
  double y = ClipBoundingBox.origin.y;
  double width = ClipBoundingBox.size.width;
  double height = ClipBoundingBox.size.height;
  CFRelease(v17);
  if (Image)
  {
    if (_TVBlurredImageWithOptionsAndOverlayColorForImage___once != -1) {
      dispatch_once(&_TVBlurredImageWithOptionsAndOverlayColorForImage___once, &__block_literal_global_32);
    }
    CGFloat v24 = (void *)MEMORY[0x263F00650];
    uint64_t v55 = *MEMORY[0x263F008F0];
    CGFloat v25 = [MEMORY[0x263EFF9D0] null];
    v56[0] = v25;
    long long v26 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
    long long v27 = [v24 imageWithCGImage:Image options:v26];

    CFRelease(Image);
    if ((a2 & 8) != 0)
    {
      uint64_t v53 = *MEMORY[0x263F00988];
      v54 = &unk_26E59ECC8;
      uint64_t v28 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v29 = [v27 imageByApplyingFilter:@"CIColorControls" withInputParameters:v28];

      long long v27 = (void *)v29;
    }
    if ((a2 & 4) != 0)
    {
      uint64_t v30 = [v27 imageByClampingToExtent];

      long long v27 = (void *)v30;
    }
    uint64_t v51 = *MEMORY[0x263F00980];
    CGRect v31 = [NSNumber numberWithDouble:a6];
    v52 = v31;
    CGRect v32 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    CGRect v33 = [v27 imageByApplyingFilter:@"CIGaussianBlur" withInputParameters:v32];

    if (v12)
    {
      CGRect v34 = (void *)MEMORY[0x263F00650];
      CGRect v35 = objc_msgSend(MEMORY[0x263F00608], "colorWithCGColor:", objc_msgSend(v12, "CGColor"));
      v36 = [v34 imageWithColor:v35];

      uint64_t v37 = [v36 imageByCompositingOverImage:v33];

      CGRect v33 = (void *)v37;
    }
    if ((a2 & 2) != 0)
    {
      v38 = [MEMORY[0x263F00640] filterWithName:@"CIRandomGenerator"];
      v39 = [v38 outputImage];

      v40 = [MEMORY[0x263F00680] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v49[0] = @"inputRVector";
      v49[1] = @"inputGVector";
      v50[0] = v40;
      v50[1] = v40;
      v50[2] = v40;
      v49[2] = @"inputBVector";
      v49[3] = @"inputAVector";
      v41 = [MEMORY[0x263F00680] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.05];
      v50[3] = v41;
      v42 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
      v43 = [v39 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v42];

      uint64_t v44 = [v43 imageByCompositingOverImage:v33];

      CGRect v33 = (void *)v44;
    }
    uint64_t v45 = objc_msgSend((id)_TVBlurredImageWithOptionsAndOverlayColorForImage___ciContext, "createCGImage:fromRect:", v33, x, y, width, height);
    if (v45)
    {
      v46 = (const void *)v45;
      v47 = [MEMORY[0x263F1C6B0] imageWithCGImage:v45 scale:0 orientation:1.0];
      CFRelease(v46);
    }
    else
    {
      v47 = 0;
    }
  }
  else
  {
LABEL_19:
    v47 = 0;
  }

  return v47;
}

id _TVNoiseImageOfSize(int a1, double a2, double a3)
{
  v25[1] = *MEMORY[0x263EF8340];
  os_log_t v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  BOOL v12 = a2 != v8 || a3 != v10 || a1 == 0;
  if (v12
    || ([MEMORY[0x263F1C6B0] _noiseImage], (double v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v14 = (void *)MEMORY[0x263F00628];
    uint64_t v24 = *MEMORY[0x263F00858];
    double v15 = [MEMORY[0x263EFF9D0] null];
    v25[0] = v15;
    double v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v17 = [v14 contextWithOptions:v16];

    uint64_t v18 = [MEMORY[0x263F00640] filterWithName:@"CIRandomGenerator"];
    uint64_t v19 = [MEMORY[0x263F00640] filterWithName:@"CIColorMonochrome"];
    double v20 = [v18 valueForKey:@"outputImage"];
    [v19 setValue:v20 forKey:@"inputImage"];

    double v21 = [v19 valueForKey:*MEMORY[0x263F009D0]];
    double v22 = (const void *)objc_msgSend(v17, "createCGImage:fromRect:", v21, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a2, a3);

    if (v22)
    {
      double v13 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v22];
      CFRelease(v22);
    }
    else
    {
      double v13 = 0;
    }
  }
  return v13;
}

id _TVNoisePattern()
{
  os_log_t v0 = [MEMORY[0x263F1C6B0] _noiseImage];
  uint64_t v1 = [MEMORY[0x263F1C550] colorWithPatternImage:v0];

  return v1;
}

void sub_230BE54E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_230BE73EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void commonInit(void *a1)
{
  id v1 = a1;
  [v1 setOpaque:0];
  [v1 setBackgroundColor:0];
  [v1 setClipsToBounds:0];
}

uint64_t IsTemplateMediaType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"tv-template"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"-tv-template"];
  }

  return v2;
}

void sub_230BEBDA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_230BEFFD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_230BF0A9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_230BF0BE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230BF0EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BF1004(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230BF3190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230BF6BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230BF864C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
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

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230BF9C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_230BFC7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230BFF664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230C00A50(_Unwind_Exception *a1)
{
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

uint64_t __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230FC9DC0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void sub_230C059FC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_230C08398(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Block_object_dispose((const void *)(v2 - 128), 8);
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

void sub_230C09608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230C09A6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230C09BB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_230C0A388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_230C0AAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230C0B958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230C0BF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_230C0C12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t AMPCFStringGetCharacterAtIndex(UniChar *buffer, int64_t a2, uint64_t *a3)
{
  if (a2 < 0 || (int64_t v6 = *((void *)buffer + 36), v6 <= a2))
  {
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = *((void *)buffer + 33);
  if (v7)
  {
    UniChar v8 = *(_WORD *)(v7 + 2 * (*((void *)buffer + 35) + a2));
  }
  else
  {
    uint64_t v12 = *((void *)buffer + 34);
    if (v12)
    {
      UniChar v8 = *(char *)(v12 + *((void *)buffer + 35) + a2);
    }
    else
    {
      if (*((void *)buffer + 38) <= a2 || (int64_t v13 = *((void *)buffer + 37), v13 > a2))
      {
        int64_t v14 = a2 - 4;
        if ((unint64_t)a2 < 4) {
          int64_t v14 = 0;
        }
        if (v14 + 128 < v6) {
          int64_t v6 = v14 + 128;
        }
        *((void *)buffer + 37) = v14;
        *((void *)buffer + 3_Block_object_dispose(&STACK[0x400], 8) = v6;
        v24.location = *((void *)buffer + 35) + v14;
        v24.length = v6 - v14;
        CFStringGetCharacters(*((CFStringRef *)buffer + 32), v24, buffer);
        int64_t v13 = *((void *)buffer + 37);
      }
      UniChar v8 = buffer[a2 - v13];
    }
  }
  uint64_t v9 = v8;
  if (v8 >> 10 != 54 || (int64_t v15 = *((void *)buffer + 36), v15 - 1 <= a2))
  {
LABEL_6:
    uint64_t v10 = 1;
    if (!a3) {
      return v9;
    }
LABEL_7:
    *a3 = v10;
    return v9;
  }
  int64_t v16 = a2 + 1;
  uint64_t v17 = *((void *)buffer + 33);
  if (v17)
  {
    UniChar v18 = *(_WORD *)(v17 + 2 * (*((void *)buffer + 35) + v16));
  }
  else
  {
    uint64_t v19 = *((void *)buffer + 34);
    if (v19)
    {
      UniChar v18 = *(char *)(v19 + *((void *)buffer + 35) + v16);
    }
    else
    {
      if (*((void *)buffer + 38) <= v16 || (int64_t v20 = *((void *)buffer + 37), v20 > v16))
      {
        int64_t v21 = v16 - 4;
        if ((unint64_t)v16 < 4) {
          int64_t v21 = 0;
        }
        if (v21 + 128 < v15) {
          int64_t v15 = v21 + 128;
        }
        *((void *)buffer + 37) = v21;
        *((void *)buffer + 3_Block_object_dispose(&STACK[0x400], 8) = v15;
        v25.location = *((void *)buffer + 35) + v21;
        v25.length = v15 - v21;
        CFStringGetCharacters(*((CFStringRef *)buffer + 32), v25, buffer);
        int64_t v20 = *((void *)buffer + 37);
      }
      UniChar v18 = buffer[v16 - v20];
    }
  }
  int v22 = v18 & 0xFC00;
  unsigned int v23 = (v9 << 10) + v18 - 56613888;
  uint64_t v10 = 1;
  if (v22 == 56320)
  {
    uint64_t v10 = 2;
    uint64_t v9 = v23;
  }
  else
  {
    uint64_t v9 = v9;
  }
  if (a3) {
    goto LABEL_7;
  }
  return v9;
}

void __defaultParagraphStyle_block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v2 setAlignment:4];
  [v2 setBaseWritingDirection:0];
  [v2 setLineBreakMode:0];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)defaultParagraphStyle_defaultLTRParagraphStyleAttribute;
  defaultParagraphStyle_defaultLTRParagraphStyleAttribute = v0;
}

void __defaultParagraphStyle_block_invoke_2()
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v2 setAlignment:4];
  [v2 setBaseWritingDirection:-1];
  [v2 setLineBreakMode:0];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)defaultParagraphStyle_defaultNaturalParagraphStyleAttribute;
  defaultParagraphStyle_defaultNaturalParagraphStyleAttribute = v0;
}

void __defaultParagraphStyle_block_invoke_3()
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v2 setAlignment:4];
  [v2 setBaseWritingDirection:1];
  [v2 setLineBreakMode:0];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)defaultParagraphStyle_defaultRTLParagraphStyleAttribute;
  defaultParagraphStyle_defaultRTLParagraphStyleAttribute = v0;
}

void sub_230C13E34(_Unwind_Exception *a1)
{
}

void sub_230C15124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
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

void sub_230C16D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_230C1A458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_230C1A86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(&location);
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

void sub_230C1D7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _TVCollectionViewValidIndexPath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  if (v3 && (unint64_t v6 = [v4 numberOfSections], objc_msgSend(v3, "section") < v6))
  {
    unint64_t v7 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v3, "section"));
    BOOL v8 = [v3 row] < v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void sub_230C1E61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230C21590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230C21E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void sub_230C24198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __getAMSUIDynamicViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSUIMarketingItemViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIMarketingItemViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return _TVAppTemplateImpressionableTestAndAddToMultableArray_cold_1(v0);
}

void _TVAppTemplateImpressionableTestAndAddToMultableArray_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "\"_TVAppTemplateImpressionableTestAndAddToMultableArray\" has been deprecated. Please use the corresponding category extension \"imp_impressionableElementsForDocument:\" for UIView or UIViewController accordingly.", v1, 2u);
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  MEMORY[0x270EDDFC8]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
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

uint64_t CGContextClear()
{
  return MEMORY[0x270EE5E30]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
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

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
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

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x270EE6768](image, mask);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x270EE67F0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x270EE6888](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE6FD8](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
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
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t CNStringContainsNonLatinCharacters()
{
  return MEMORY[0x270F18640]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F05FC0](lhs, rhs);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x270F05FE0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F06208]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F06218]();
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

uint64_t _AXSHighContrastFocusIndicatorsEnabled()
{
  return MEMORY[0x270F90828]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return MEMORY[0x270F06330]();
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x270F06338]();
}

uint64_t _UICreateCGImageFromIOSurfaceWithOptions()
{
  return MEMORY[0x270F06340]();
}

uint64_t _UIImageSymbolConfigurationTextualSummary()
{
  return MEMORY[0x270F06378]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9A438](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270ED9B50](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x270ED9B68](a1, a2, *(void *)&a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void method_exchangeImplementations(Method m1, Method m2)
{
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

void objc_moveWeak(id *to, id *from)
{
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x270F994D8](*(void *)&c);
}