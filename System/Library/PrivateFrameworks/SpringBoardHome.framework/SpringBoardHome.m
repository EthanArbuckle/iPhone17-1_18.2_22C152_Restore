double SBHRTLAwarePositionInFloatRange(uint64_t a1, int a2, long double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 2;
  if (a2) {
    v4 = 0;
  }
  v5 = 1;
  v6 = 2;
  if (!a2) {
    v6 = 0;
  }
  if (a1) {
    v6 = 0;
  }
  if (a1 != 1) {
    v5 = v6;
  }
  if (a1 == 2) {
    v7 = v4;
  }
  else {
    v7 = v5;
  }
  return SBHPositionInFloatRange(v7, a3, a4);
}

double SBHPositionInFloatRange(uint64_t a1, long double a2, double a3)
{
  if (a1 == 2)
  {
    double v5 = a2 + a3;
    return nexttoward(v5, a2);
  }
  else if (a1 == 1)
  {
    return a2 + nexttoward(a3 * 0.5, a2);
  }
  else
  {
    double result = 0.0;
    if (!a1) {
      return a2;
    }
  }
  return result;
}

double SBHIntersectionFloatRange(double result, double a2, double a3, double a4)
{
  double v4 = a3 + a4;
  if (result <= a3 && a3 < result + a2) {
    double v5 = a3;
  }
  else {
    double v5 = 0.0;
  }
  if (a3 > result || result >= v4) {
    return v5;
  }
  return result;
}

double SBHIconListLayoutCalculateHorizontalColumnBump(unint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a2 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = a2;
  }
  unint64_t v11 = v10 - 1;
  double v12 = (double)(unint64_t)a2;
  SBFFloatFloorForScale();
  double v14 = a5 - (v13 * (double)(v10 - 1) + a3 * v12);
  int v15 = (int)v14;
  if (a6 == 3.0 && v11 == 3) {
    return (double)(v15 * a1) / 3.0;
  }
  if (!v15)
  {
    float v17 = v14 * a6;
    if (v11 == vcvtps_s32_f32(v17)) {
      return (double)a1 / a6;
    }
  }
  unint64_t v19 = v15 & ~((v11 & 1) == 0);
  double v18 = 0.0;
  if ((int)v19 >= 1 && v11 > v19)
  {
    if (v10 >= 9)
    {
      v21 = (int *)malloc_type_calloc(v10 - 1, 4uLL, 0x100004052888210uLL);
      v22 = v21;
    }
    else
    {
      v21 = 0;
      v22 = (int *)&v31;
    }
    bzero(v22, 4 * v11);
    if ((v19 & 1) == 0
      || ((v11 & 0x80000000) == 0 ? (int v23 = v11) : (int v23 = v11 + 1),
          v22[v23 >> 1] = 1,
          LODWORD(v19) = v19 - 1,
          v19))
    {
      if (v11) {
        int v24 = 2;
      }
      else {
        int v24 = 1;
      }
      int v25 = v24 + (v11 >> 1) - 1;
      v26 = &v22[(int)(v11 >> 1) - 1];
      unsigned int v27 = v19 + 2;
      do
      {
        *v26-- = 1;
        v22[v25++] = 1;
        v27 -= 2;
      }
      while (v27 > 2);
    }
    double v18 = 0.0;
    if (a1 >= v11) {
      unint64_t v28 = v11;
    }
    else {
      unint64_t v28 = a1;
    }
    for (; v28; --v28)
    {
      int v29 = *v22++;
      double v18 = v18 + (double)v29;
    }
    free(v21);
  }
  return v18;
}

id SBLogIcon()
{
  if (SBLogIcon_onceToken != -1) {
    dispatch_once(&SBLogIcon_onceToken, &__block_literal_global_30);
  }
  v0 = (void *)SBLogIcon___logObj;
  return v0;
}

double SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (v6 && ![v6 isEqualToString:@"SBHIconGridSizeClassDefault"])
    {
      if (objc_opt_respondsToSelector())
      {
        [v5 iconImageInfoForGridSizeClass:v7 orientation:a2];
LABEL_10:
        double v9 = v8;
        goto LABEL_11;
      }
      if (objc_opt_respondsToSelector())
      {
        [v5 iconImageInfoForGridSizeClass:v7];
        goto LABEL_10;
      }
    }
    [v5 iconImageInfo];
    goto LABEL_10;
  }
  double v9 = 50.0;
LABEL_11:

  return v9;
}

uint64_t SBIconCoordinateGetGridCellIndex(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  if (SBIconCoordinateIsNotFound(a1, a2)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a1 + (a2 - 1) * a3 - 1;
  }
}

BOOL SBIconCoordinateIsNotFound(uint64_t a1, uint64_t a2)
{
  return a2 == 0x7FFFFFFFFFFFFFFFLL || a1 == 0x7FFFFFFFFFFFFFFFLL;
}

unint64_t SBIconCoordinateMakeWithGridCellIndex(unint64_t a1, unsigned __int16 a2)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a1 % a2 + 1;
  }
}

void sub_1D7F13B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1D7F14BB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D7F14C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBHIconGridRangeEnumerateCellIndexes(uint64_t a1, int a2, unsigned __int16 a3, void *a4)
{
  v7 = a4;
  uint64_t v8 = HIWORD(a2);
  if (HIWORD(a2))
  {
    uint64_t v9 = 0;
    uint64_t v10 = (unsigned __int16)a2;
    while (1)
    {
      uint64_t v11 = v9 * a3 + a1;
      if (!__CFADD__(v9 * a3, a1))
      {
        if (v10) {
          break;
        }
      }
LABEL_8:
      if (++v9 == v8) {
        goto LABEL_9;
      }
    }
    uint64_t v12 = v10;
    while (1)
    {
      char v13 = 0;
      v7[2](v7, v11, &v13);
      if (v13) {
        break;
      }
      ++v11;
      if (!--v12) {
        goto LABEL_8;
      }
    }
  }
LABEL_9:
}

void setIndex(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, unint64_t *a6)
{
  if (a2) {
    __int16 v7 = a2;
  }
  else {
    __int16 v7 = -1;
  }
  if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
    __int16 v8 = 0;
  }
  else {
    __int16 v8 = v7;
  }
  if (HIDWORD(a1))
  {
    NSLog(&cfstr_KeyIndexIsTooL.isa, a1);
    return;
  }
  if (a1 <= 0x3F)
  {
    *(_WORD *)(a3 + 2 * (a4 + a1)) = v8;
    return;
  }
  unint64_t v11 = a1 - 64;
  uint64_t v12 = (char *)*a5;
  if (a1 - 64 >= *a6)
  {
    unint64_t v13 = a1 & 0xFFFFFFFFFFFFFFC0;
    unint64_t v14 = v13 + 64;
    if (v12)
    {
      uint64_t v12 = (char *)reallocf(v12, 2 * v14);
      *a5 = v12;
      if (v12)
      {
        int v15 = v12;
        bzero(&v12[2 * *a6], 2 * (v14 - *a6));
LABEL_16:
        bzero(&v15[2 * *a6], 2 * (v14 - *a6));
        uint64_t v12 = (char *)*a5;
LABEL_18:
        *a6 = v14;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v12 = (char *)malloc_type_calloc(v13 + 64, 2uLL, 0x1000040BDFB0063uLL);
      int v15 = v12;
      *a5 = v12;
      if (v12) {
        goto LABEL_16;
      }
    }
    unint64_t v14 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (v12) {
    *(_WORD *)&v12[2 * v11] = v8;
  }
}

NSString *SBHContentSizeCategoryClip(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  __int16 v7 = a3;
  if (v5)
  {
    __int16 v8 = (NSString *)v5;
    NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v8, v7);
    uint64_t v10 = v7;
    if (v9 == NSOrderedDescending
      || (v11 = UIContentSizeCategoryCompareToCategory(v8, v6), uint64_t v10 = v6, v11 == NSOrderedAscending))
    {
      uint64_t v12 = v10;

      __int16 v8 = v12;
    }
  }
  else
  {
    __int16 v8 = v6;
  }

  return v8;
}

double SBHIconListLayoutListIconSpacingWithDefault(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  if (objc_opt_respondsToSelector())
  {
    [v5 iconSpacingForOrientation:a2];
    a3 = v6;
  }

  return a3;
}

CGFloat SBHCalculateIconSpacing(unsigned __int16 a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGFloat v8 = a5 + 0.0;
  CGFloat v9 = a4 + 0.0;
  CGFloat v10 = a2 - (a5 + a7);
  CGFloat v11 = a3 - (a4 + a6);
  v15.origin.x = a5 + 0.0;
  v15.origin.y = a4 + 0.0;
  v15.size.width = v10;
  v15.size.height = v11;
  int v12 = a1;
  CGFloat v13 = CGRectGetWidth(v15) - (double)a1 * a8;
  v16.origin.x = v8;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  CGRectGetHeight(v16);
  return v13 / (double)(v12 - 1);
}

uint64_t SBHIconListLayoutShowsLabels(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 showsLabels];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

void sub_1D7F1A7A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 208));
  _Unwind_Resume(a1);
}

BOOL SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

void sub_1D7F1E540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F1F1C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

BOOL SBRootFolderPageStateIsOnLeadingCustomPage(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

id SBIconViewQueryingIconViewForIconInLocation(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v26 = 0;
  unsigned int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  int v29 = __Block_byref_object_copy__12;
  v30 = __Block_byref_object_dispose__12;
  id v31 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __SBIconViewQueryingIconViewForIconInLocation_block_invoke;
  v20[3] = &unk_1E6AB14D8;
  int v24 = &v26;
  id v21 = v7;
  id v22 = v8;
  id v23 = v9;
  uint64_t v25 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBIconViewQueryingIconViewForIconInLocation_block_invoke_2;
  v15[3] = &unk_1E6AB1500;
  unint64_t v19 = &v26;
  id v10 = v21;
  id v16 = v10;
  id v11 = v22;
  id v17 = v11;
  id v12 = v23;
  id v18 = v12;
  SBIconViewQueryingOptionalMethodImplementation(v10, a4, (uint64_t)sel_iconViewForIcon_location_options_, v20, v15);
  id v13 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v13;
}

void sub_1D7F1FB70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void SBIconViewQueryingOptionalMethodImplementation(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a1;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    if (((*((uint64_t (**)(id, id))v9 + 2))(v9, v8) & 1) == 0)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __SBIconViewQueryingOptionalMethodImplementation_block_invoke;
      v11[3] = &unk_1E6AB1528;
      id v12 = v9;
      SBIconViewQueryingEnumerateIconViewQueryable(v8, a2, v11);
    }
  }
  else
  {
    v10[2](v10);
  }
}

BOOL __SBIconViewQueryingIconViewForIconInLocation_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40) location:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

void sub_1D7F1FE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBIconViewQueryingEnumerateIconViewQueryable(void *a1, uint64_t a2, void *a3)
{
  id v6 = a1;
  id v5 = a3;
  if (a2 & 0x10) != 0 && (objc_opt_respondsToSelector()) {
    [v6 enumerateIconViewQueryableChildrenWithOptions:a2 usingBlock:v5];
  }
}

uint64_t __SBIconViewQueryingOptionalMethodImplementation_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a4 = 1;
  }
  return result;
}

uint64_t SBVisibleColumnRangeGetVisibleColumnsForIconListIndex(unint64_t *a1, unint64_t a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = a1[2];
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v4 >= v3)
  {
    unint64_t v7 = a1[3];
    unint64_t v8 = a1[1];
    BOOL v9 = v3 != v4 || v7 >= v8;
    BOOL v10 = !v9;
    if (v3 <= a2 && !v10 && v4 >= a2)
    {
      if (v3 == a2 && v4 == a2)
      {
        return v8;
      }
      else if (v3 == a2)
      {
        return v8;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void sub_1D7F20E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D7F216E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __SBIconViewQueryingHandleMethodRecursion_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

    if (!v8) {
      return;
    }
    goto LABEL_5;
  }
  char v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  if (v7) {
LABEL_5:
  }
    *a4 = 1;
}

void sub_1D7F22C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogIconImageCache()
{
  if (SBLogIconImageCache_onceToken != -1) {
    dispatch_once(&SBLogIconImageCache_onceToken, &__block_literal_global_3_0);
  }
  v0 = (void *)SBLogIconImageCache___logObj;
  return v0;
}

void sub_1D7F24178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHStringForIconGridSize(int a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%u×%u", (unsigned __int16)a1, HIWORD(a1));
}

id SBLogLegibility()
{
  if (SBLogLegibility_onceToken != -1) {
    dispatch_once(&SBLogLegibility_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)SBLogLegibility___logObj;
  return v0;
}

id SBLogIconLabelImageCache()
{
  if (SBLogIconLabelImageCache_onceToken != -1) {
    dispatch_once(&SBLogIconLabelImageCache_onceToken, &__block_literal_global_9_0);
  }
  v0 = (void *)SBLogIconLabelImageCache___logObj;
  return v0;
}

id _SBClockIconGetCalendar()
{
  if (_SBClockIconInitialize___once != -1) {
    dispatch_once(&_SBClockIconInitialize___once, &__block_literal_global_304);
  }
  v0 = (void *)__calendar;
  return v0;
}

id SBLogClock()
{
  if (SBLogClock_onceToken != -1) {
    dispatch_once(&SBLogClock_onceToken, &__block_literal_global_63_0);
  }
  v0 = (void *)SBLogClock___logObj;
  return v0;
}

void sub_1D7F2934C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBIconLocationGroupContainsLocation(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = SBGetIconLocationGroups();
  id v6 = [v5 objectForKey:v4];

  if (v3) {
    uint64_t v7 = [v6 containsObject:v3];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

id SBGetIconLocationGroups()
{
  v0 = (void *)SBGetIconLocationGroups_groups;
  if (!SBGetIconLocationGroups_groups)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v2 = (void *)SBGetIconLocationGroups_groups;
    SBGetIconLocationGroups_groups = (uint64_t)v1;

    id v3 = (void *)SBGetIconLocationGroups_groups;
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationRoot", @"SBIconLocationRootWithWidgets", 0);
    [v3 setObject:v4 forKey:@"SBIconLocationGroupRoot"];

    id v5 = (void *)SBGetIconLocationGroups_groups;
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationDock", @"SBIconLocationFloatingDock", 0);
    [v5 setObject:v6 forKey:@"SBIconLocationGroupDock"];

    uint64_t v7 = (void *)SBGetIconLocationGroups_groups;
    int v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationFloatingDock", 0);
    [v7 setObject:v8 forKey:@"SBIconLocationGroupFloatingDock"];

    BOOL v9 = (void *)SBGetIconLocationGroups_groups;
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationAppLibrary", @"SBIconLocationAppLibraryOverlay", @"SBIconLocationAppLibraryCategoryPod", @"SBIconLocationAppLibraryCategoryPodRecents", @"SBIconLocationAppLibraryCategoryPodSuggestions", @"SBIconLocationAppLibraryCategoryPodAdditionalItems", @"SBIconLocationAppLibraryCategoryPodExpanded", @"SBIconLocationAppLibrarySearch", 0);
    [v9 setObject:v10 forKey:@"SBIconLocationGroupAppLibrary"];

    id v11 = (void *)SBGetIconLocationGroups_groups;
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationTodayView", @"SBIconLocationTodayViewOverlay", 0);
    [v11 setObject:v12 forKey:@"SBIconLocationGroupTodayView"];

    uint64_t v13 = (void *)SBGetIconLocationGroups_groups;
    unint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationAddWidgetSheet", @"SBIconLocationWidgetConfiguration", @"SBIconLocationStackConfiguration", 0);
    [v13 setObject:v14 forKey:@"SBIconLocationGroupWidgetConfiguration"];

    uint64_t v15 = (void *)SBGetIconLocationGroups_groups;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIconLocationRoot", @"SBIconLocationRootWithWidgets", @"SBIconLocationDock", @"SBIconLocationFloatingDock", @"SBIconLocationFolder", @"SBIconLocationTodayView", 0);
    [v15 setObject:v16 forKey:@"SBIconLocationGroupIconHierarchy"];

    v0 = (void *)SBGetIconLocationGroups_groups;
  }
  return v0;
}

void sub_1D7F2A17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F2A468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F2A54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F2AEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1D7F2B028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F2BC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7F2D3F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D7F2FD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F30A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F33F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBHIconListLayoutMaximumIconCount(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 numberOfRowsForOrientation:1];
  uint64_t v3 = [v1 numberOfColumnsForOrientation:1];

  return v3 * v2;
}

double SBHIconListLayoutFolderIconGridCellSpacing(void *a1)
{
  id v1 = a1;
  double v2 = 2.0;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v1 folderIconVisualConfiguration];
    [v3 gridCellSpacing];
    double v2 = v4;
  }
  return v2;
}

double SBHIconListLayoutFolderIconGridCellSize(void *a1)
{
  id v1 = a1;
  double v2 = 12.0;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v1 folderIconVisualConfiguration];
    [v3 gridCellSize];
    double v2 = v4;
  }
  return v2;
}

CGFloat SBHIconListLayoutListIconSpacingForListSize(void *a1, uint64_t a2, double a3, double a4)
{
  id v7 = a1;
  unsigned __int16 v8 = SBHIconListLayoutListGridSize(v7, a2);
  [v7 layoutInsetsForOrientation:a2];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v7 iconImageInfo];
  double v18 = v17;

  return SBHCalculateIconSpacing(v8, a3, a4, v10, v12, v14, v16, v18);
}

uint64_t SBHIconListLayoutListGridSize(void *a1, uint64_t a2)
{
  id v3 = a1;
  unsigned __int16 v4 = [v3 numberOfColumnsForOrientation:a2];
  LOWORD(a2) = [v3 numberOfRowsForOrientation:a2];

  return v4 | ((unsigned __int16)a2 << 16);
}

uint64_t SBHIconListLayoutIconSpacingAxisMatchingBehavior(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 iconSpacingAxisMatchingBehavior];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

BOOL SBHIconGridSizeEqualToIconGridSize(int a1, int a2)
{
  return a2 == a1;
}

void sub_1D7F3A120(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D7F3A36C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id SBHBundle()
{
  if (SBHBundle___onceToken != -1) {
    dispatch_once(&SBHBundle___onceToken, &__block_literal_global_40);
  }
  v0 = (void *)SBHBundle___springBoardHomeBundle;
  return v0;
}

id SBLogWidgets()
{
  if (SBLogWidgets_onceToken != -1) {
    dispatch_once(&SBLogWidgets_onceToken, &__block_literal_global_42);
  }
  v0 = (void *)SBLogWidgets___logObj;
  return v0;
}

void sub_1D7F3DE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBVisibleColumnRangeIsEmpty(unint64_t *a1)
{
  unint64_t v1 = *a1;
  BOOL result = 1;
  if (*a1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v2 = a1[2];
    if (v2 >= v1 && (v1 != v2 || a1[3] >= a1[1])) {
      return 0;
    }
  }
  return result;
}

void sub_1D7F3E8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F3F8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogHomeScreenUsageMonitor()
{
  if (SBLogHomeScreenUsageMonitor_onceToken != -1) {
    dispatch_once(&SBLogHomeScreenUsageMonitor_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)SBLogHomeScreenUsageMonitor___logObj;
  return v0;
}

void sub_1D7F40DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F412C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBVisibleColumnRangeEqualToRange(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t SBFolderRelativeListIndex(void *a1)
{
  if (a1) {
    return [a1 sbListIndex];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

__CFString *SBStringFromVisibleColumnRange(void *a1)
{
  if (*a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v1 = @"none";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"{%lu,%lu}..{%lu,%lu}", *a1, a1[1], a1[2], a1[3]);
    unint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

double SBIconBadgeViewCalculateAccessoryCenter(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBIconBadgeViewCalculateAccessoryCenter_block_invoke;
  v15[3] = &__block_descriptor_97_e5_d8__0l;
  char v16 = a1;
  *(double *)&void v15[4] = a6;
  *(double *)&v15[5] = a7;
  *(double *)&v15[6] = a8;
  *(double *)&v15[7] = a9;
  *(CGFloat *)&v15[8] = a2;
  *(CGFloat *)&v15[9] = a3;
  *(CGFloat *)&v15[10] = a4;
  *(CGFloat *)&v15[11] = a5;
  double v13 = __SBIconBadgeViewCalculateAccessoryCenter_block_invoke((uint64_t)v15);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMinY(v17);
  return v13;
}

double __SBIconBadgeViewCalculateAccessoryCenter_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96)) {
    return *(double *)(a1 + 32) * 0.5 - *(double *)(a1 + 48);
  }
  else {
    return *(double *)(a1 + 48) + CGRectGetMaxX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 32) * -0.5;
  }
}

double SBHIconListLayoutIconAccessorySize(void *a1)
{
  id v1 = a1;
  double v2 = 26.0;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 iconAccessoryVisualConfiguration];
    [v3 size];
    double v2 = v4;
  }
  return v2;
}

double SBHIconListLayoutIconAccessoryOffset(void *a1)
{
  id v1 = a1;
  double v2 = 11.0;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v1 iconAccessoryVisualConfiguration];
    [v3 offset];
    double v2 = v4;
  }
  return v2;
}

id SBIconAccessoryCountedMap()
{
  if (SBIconAccessoryCountedMap_onceToken != -1) {
    dispatch_once(&SBIconAccessoryCountedMap_onceToken, &__block_literal_global_76);
  }
  v0 = (void *)SBIconAccessoryCountedMap___accessoryCountedMap;
  return v0;
}

id SBIconViewQueryingBestIconViewForIcon(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = a3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = SBIconViewQueryingIconViewForIconInLocation(v7, v8, *(void **)(*((void *)&v22 + 1) + 8 * i), a4);
        if (v14)
        {
          char v16 = (void *)v14;
          id v18 = v9;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = a4 | 0x10;
  char v16 = SBIconViewQueryingFirstIconViewForIcon(v7, v8, v15);
  if (!v16)
  {
    if ([v8 isApplicationIcon])
    {
      CGRect v17 = [v8 applicationBundleID];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __SBIconViewQueryingBestIconViewForIcon_block_invoke;
      v20[3] = &unk_1E6AADB28;
      id v21 = v17;
      id v18 = v17;
      char v16 = SBIconViewQueryingFirstIconViewForIconPassingTest(v7, v15, v20);

LABEL_13:
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

uint64_t _touchesContainNonIndirectTouch(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "type", (void)v6) != 1)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

BOOL SBRootFolderPageStateIsSearch(uint64_t a1)
{
  return ((a1 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

void sub_1D7F4FD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

id SBLogCommon()
{
  if (SBLogCommon_onceToken != -1) {
    dispatch_once(&SBLogCommon_onceToken, &__block_literal_global_12_1);
  }
  v0 = (void *)SBLogCommon___logObj;
  return v0;
}

double SBHDisplayCornerRadiusForScreenType(uint64_t a1)
{
  double result = 0.0;
  if ((unint64_t)(a1 - 3) <= 0x2C) {
    return dbl_1D81E4C90[a1 - 3];
  }
  return result;
}

__CFString *SBHStringFromContentVisibility(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E6AB3A58[a1];
  }
}

uint64_t SBRootFolderPageStateVerticalGroupForRootFolderPageState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5) {
    return 0;
  }
  else {
    return qword_1D81E51E0[a1 + 1];
  }
}

BOOL SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 + 1) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_1D81E51E0[a2 + 1];
  }
  return v2 == a1;
}

uint64_t SBHScreenTypeForCurrentDevice()
{
  if (SBHScreenTypeForCurrentDevice_onceToken != -1) {
    dispatch_once(&SBHScreenTypeForCurrentDevice_onceToken, &__block_literal_global_11);
  }
  return SBHScreenTypeForCurrentDevice_screenType;
}

uint64_t __SBIconViewQueryingDisplayingIconView_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) isDisplayingIconView:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void sub_1D7F56D20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void SBIconViewQueryingHandleMethodRecursion(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __SBIconViewQueryingHandleMethodRecursion_block_invoke;
  v13[3] = &unk_1E6AB1438;
  id v15 = v10;
  uint64_t v16 = a3;
  id v14 = v9;
  id v11 = v10;
  id v12 = v9;
  SBIconViewQueryingEnumerateIconViewQueryable(a1, a2, v13);
}

void sub_1D7F574D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

void sub_1D7F578B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D7F57AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double SBHEdgeInsetsInvert(double a1)
{
  return -a1;
}

void sub_1D7F5ACC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F5ADEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F5D9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7F5F058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7F5F2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F5F598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBIconViewQueryingDisplayingIconView(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBIconViewQueryingDisplayingIconView_block_invoke;
  v15[3] = &unk_1E6AB1460;
  id v18 = &v20;
  id v16 = v5;
  id v17 = v6;
  uint64_t v19 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __SBIconViewQueryingDisplayingIconView_block_invoke_2;
  v11[3] = &unk_1E6AB1488;
  id v14 = &v20;
  id v7 = v16;
  id v12 = v7;
  id v8 = v17;
  id v13 = v8;
  SBIconViewQueryingOptionalMethodImplementation(v7, a3, (uint64_t)sel_isDisplayingIconView_options_, v15, v11);
  uint64_t v9 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void sub_1D7F604F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D7F62384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, id *a15, id *a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

id SBLogProactiveAppLibrary()
{
  if (SBLogProactiveAppLibrary_onceToken != -1) {
    dispatch_once(&SBLogProactiveAppLibrary_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)SBLogProactiveAppLibrary___logObj;
  return v0;
}

id NSDictionaryFromSBHLibraryCategoryMapRefreshOptions(unint64_t a1)
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 & 1;
  uint64_t v2 = (a1 >> 2) & 1;
  uint64_t v3 = (a1 >> 3) & 1;
  v10[0] = @"fetch proactive categories";
  double v4 = [NSNumber numberWithBool:(a1 >> 1) & 1];
  v11[0] = v4;
  v10[1] = @"fetch categories";
  id v5 = [NSNumber numberWithBool:v2];
  v11[1] = v5;
  v10[2] = @"startFromScratch";
  id v6 = [NSNumber numberWithBool:v1];
  v11[2] = v6;
  v10[3] = @"refreshNow";
  id v7 = [NSNumber numberWithBool:v3];
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

void sub_1D7F62DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1D7F63104(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D7F642EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_1D7F6497C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F6977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F699DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F69B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F6CED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id SBHConfigurationIdentifierFromDataSource(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v2 = [v1 configurationStorageIdentifier];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id SBHUniqueIdentifierOfDataSource(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v2 = [v1 uniqueIdentifier];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id SBHContainerBundleIdentifierForDataSource(void *a1)
{
  id v1 = a1;
  uint64_t v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (self,
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_isKindOfClass(),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = [v1 containerBundleIdentifier];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

double SBHUnionFloatRange(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

uint64_t SBHStringFromFloatRange(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%f, %f}", *(void *)&a1, *(void *)&a2];
}

void sub_1D7F7CBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1D7F7D1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_1D7F7D4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
}

void sub_1D7F7DC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7F7E760(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D7F7F560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F80EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7F819A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F821F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_1D7F82DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_1D7F831A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1D7F8380C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F83E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
}

void sub_1D7F84054(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1D7F844F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_1D7F84CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,os_activity_scope_state_s state)
{
}

void sub_1D7F853CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_1D7F8558C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_1D7F8584C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1D7F859E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_1D7F85AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void SBIconResizeHandleMetricsForIconResizingSettings(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v25 = a1;
  double v3 = 0.0;
  if (([v25 resizeHandleFollowsIconCornerRadius] & 1) == 0)
  {
    [v25 resizeHandleCornerRadius];
    double v3 = v4;
  }
  unsigned int v5 = [v25 resizeHandleUsesTruncatedSectorHitArea];
  if (v5)
  {
    [v25 resizeHandleTruncatedSectorHitAreaTopInset];
    uint64_t v7 = v6;
    [v25 resizeHandleTruncatedSectorHitAreaLeadingInset];
    uint64_t v9 = v8;
    [v25 resizeHandleTruncatedSectorHitAreaBottomInset];
    uint64_t v11 = v10;
    [v25 resizeHandleTruncatedSectorHitAreaTrailingInset];
  }
  else
  {
    [v25 resizeHandleHitAreaTopInset];
    uint64_t v7 = v13;
    [v25 resizeHandleHitAreaLeadingInset];
    uint64_t v9 = v14;
    [v25 resizeHandleHitAreaBottomInset];
    uint64_t v11 = v15;
    [v25 resizeHandleHitAreaTrailingInset];
  }
  uint64_t v16 = v12;
  [v25 resizeHandleLineWidth];
  double v18 = v17;
  [v25 resizeHandleLineLength];
  double v20 = v19;
  [v25 resizeHandleHorizontalOffset];
  double v22 = v21;
  [v25 resizeHandleVerticalOffset];
  *(void *)&long long v24 = v7;
  *((void *)&v24 + 1) = v9;
  SBIconResizeHandleMetricsMake(v5, a2, v18, v20, v3, v22, v23, v24, v11, v16);
}

uint64_t SBHEmitEvent()
{
  return MEMORY[0x1F41138B8]();
}

void sub_1D7F92538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

SBHIconGridSizeClassSizeMap *SBHIconListLayoutIconGridSizeClassSizes(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 iconGridSizeClassSizesForOrientation:a2];
  }
  else if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 iconGridSizeClassSizes];
  }
  else
  {
    double v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  }
  unsigned int v5 = v4;

  return v5;
}

id SBHIconListLayoutSupportedIconGridSizeClasses(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    [v1 supportedIconGridSizeClasses];
  }
  else {
  uint64_t v2 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
  }

  return v2;
}

uint64_t SBHIconListLayoutSupportsIconGridSizeClass(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = SBHIconListLayoutSupportedIconGridSizeClasses(a1);
  uint64_t v5 = [v4 containsGridSizeClass:v3];

  return v5;
}

BOOL SBHIconListLayoutListGridSizeMatchesListLayout(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = SBHIconListLayoutListGridSize(a1, a3);
  int v7 = SBHIconListLayoutListGridSize(v5, a3);

  return SBHIconGridSizeEqualToIconGridSize(v6, v7);
}

BOOL SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [a1 layoutForIconLocation:v7];
  uint64_t v10 = [v8 layoutForIconLocation:v7];

  BOOL v11 = SBHIconListLayoutListGridSizeMatchesListLayout(v9, v10, a4);
  return v11;
}

double SBHIconListLayoutListIconSpacing(void *a1, uint64_t a2)
{
  return SBHIconListLayoutListIconSpacingWithDefault(a1, a2, *MEMORY[0x1E4F1DB30]);
}

double SBHIconListLayoutIconImageInfoForGridSizeClass(void *a1, void *a2)
{
  return SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(a1, 1, a2);
}

double SBHIconListLayoutExtraIconImageSizeForGridSizeClass(void *a1, uint64_t a2, void *a3)
{
  double v5 = *MEMORY[0x1E4F1DB30];
  id v6 = a3;
  id v7 = a1;
  double v8 = SBHIconListLayoutListIconSpacingWithDefault(v7, a2, v5);
  double v10 = SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacingAndOrientation(v7, 1, v6, v8, v9, 0.0);

  return v10;
}

double SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacing(void *a1, void *a2, double a3, double a4, double a5)
{
  return SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacingAndOrientation(a1, 1, a2, a3, a4, a5);
}

double SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacingAndOrientation(void *a1, uint64_t a2, void *a3, double a4, double a5, double a6)
{
  id v10 = a1;
  BOOL v11 = a3;
  uint64_t v12 = v11;
  double v13 = *MEMORY[0x1E4F1DB30];
  if (@"SBHIconGridSizeClassDefault" != v11
    && ([(__CFString *)v11 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    uint64_t v14 = SBHIconListLayoutIconGridSizeClassSizes(v10, a2);
    unsigned __int16 v15 = [v14 gridSizeForGridSizeClass:v12];
    double v16 = SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v10, a2, @"SBHIconGridSizeClassDefault");
    double v18 = v17;
    double v19 = SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v10, a2, v12);
    if (a6 <= 0.0)
    {
      int v22 = v15;
      int v23 = v15 - 1;
      double v24 = 0.0;
    }
    else
    {
      [v10 layoutInsetsForOrientation:1];
      int v22 = v15;
      int v23 = v15 - 1;
      double v24 = SBHIconListLayoutCalculateHorizontalColumnBump(v23, [v10 numberOfColumnsForOrientation:1], v16, a4, a6 - v20 - v21, v18);
    }
    double v13 = v19 - (a4 * (double)v23 + v16 * (double)v22 + v24);
  }
  return v13;
}

double SBHIconListLayoutLargestExtraIconImageSize(void *a1, uint64_t a2)
{
  id v3 = a1;
  double v4 = +[SBHIconGridSizeClassDomain globalDomain];
  double v5 = SBHIconListLayoutLargestExtraIconImageSizeInDomain(v3, a2, v4);

  return v5;
}

double SBHIconListLayoutLargestExtraIconImageSizeInDomain(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = SBHIconListLayoutSupportedIconGridSizeClasses(v5);
  double v8 = (long long *)MEMORY[0x1E4F1DB30];
  double v9 = SBHIconListLayoutListIconSpacingWithDefault(v5, a2, *MEMORY[0x1E4F1DB30]);
  uint64_t v11 = v10;
  uint64_t v21 = 0;
  int v22 = (double *)&v21;
  uint64_t v23 = 0x3010000000;
  double v24 = &unk_1D821E08B;
  long long v25 = *v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBHIconListLayoutLargestExtraIconImageSizeInDomain_block_invoke;
  v15[3] = &unk_1E6AAD588;
  id v12 = v5;
  double v17 = &v21;
  uint64_t v18 = a2;
  double v19 = v9;
  uint64_t v20 = v11;
  id v16 = v12;
  [v7 enumerateGridSizeClassesInDomain:v6 usingBlock:v15];
  double v13 = v22[4];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void sub_1D7F9364C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SBHIconListLayoutLargestExtraIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  double v3 = SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacingAndOrientation(*(void **)(a1 + 32), *(void *)(a1 + 48), a2, *(double *)(a1 + 56), *(double *)(a1 + 64), 0.0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3 > *(double *)(v5 + 32))
  {
    *(double *)(v5 + 32) = v3;
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  if (v4 > *(double *)(v5 + 40)) {
    *(double *)(v5 + 40) = v4;
  }
}

id SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[SBHIconGridSizeClassDomain globalDomain];
  double v3 = SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain(v1, v2);

  return v3;
}

id SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  double v17 = __Block_byref_object_dispose__1;
  uint64_t v18 = @"SBHIconGridSizeClassDefault";
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain_block_invoke;
  v8[3] = &unk_1E6AAD5B0;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = v12;
  uint64_t v11 = &v13;
  [v4 enumerateGridSizeClassesUsingBlock:v8];
  id v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_1D7F9389C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void __SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  double v4 = SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(*(void **)(a1 + 32), 1, v8);
  double v6 = v4 * v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

id SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[SBHIconGridSizeClassDomain globalDomain];
  id v3 = SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain(v1, v2);

  return v3;
}

id SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  double v17 = __Block_byref_object_dispose__1;
  uint64_t v18 = @"SBHIconGridSizeClassDefault";
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain_block_invoke;
  v8[3] = &unk_1E6AAD5B0;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = v12;
  uint64_t v11 = &v13;
  [v4 enumerateGridSizeClassesUsingBlock:v8];
  id v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_1D7F93B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v4 = SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(*(void **)(a1 + 32), 1, v6);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

id SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[SBHIconGridSizeClassDomain globalDomain];
  id v3 = SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain(v1, v2);

  return v3;
}

id SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  double v17 = __Block_byref_object_dispose__1;
  uint64_t v18 = @"SBHIconGridSizeClassDefault";
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain_block_invoke;
  v8[3] = &unk_1E6AAD5B0;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = v12;
  uint64_t v11 = &v13;
  [v4 enumerateGridSizeClassesUsingBlock:v8];
  id v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_1D7F93DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(*(void **)(a1 + 32), 1, v6);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

double SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(void *a1, uint64_t a2)
{
  id v3 = a1;
  SBHIconListLayoutExtraIconImageSizeForGridSizeClass(v3, a2, @"SBHIconGridSizeClassLarge");
  double v5 = v4 * 0.5;
  [v3 layoutInsetsForOrientation:a2];
  double v7 = v6;

  return v7 - v5;
}

double SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsetsWithIconSpacing(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  id v9 = a1;
  uint64_t v10 = SBHIconListLayoutIconGridSizeClassSizes(v9, a2);
  uint64_t v11 = @"SBHIconGridSizeClassLarge";
  if (([v10 hasGridSizeForGridSizeClass:@"SBHIconGridSizeClassLarge"] & 1) != 0
    || (uint64_t v11 = @"SBHIconGridSizeClassMedium",
        ([v10 hasGridSizeForGridSizeClass:@"SBHIconGridSizeClassMedium"] & 1) != 0))
  {
    id v12 = v11;
    SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacingAndOrientation(v9, 1, v12, a3, a4, a5);
    double v14 = v13 * 0.5;
    [v9 layoutInsetsForOrientation:a2];
    double v16 = v15 - v14;
  }
  else
  {
    double v16 = *MEMORY[0x1E4FB2848];
  }

  return v16;
}

id SBHIconListLayoutLabelVisualConfiguration(void *a1)
{
  id v1 = (void *)*MEMORY[0x1E4FB2608];
  id v2 = a1;
  id v3 = [v1 preferredContentSizeCategory];
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = SBHIconListLayoutLabelVisualConfigurationForContentSizeCategory(v2, v3, IsBoldTextEnabled);

  return v5;
}

SBHIconLabelVisualConfiguration *SBHIconListLayoutLabelVisualConfigurationForContentSizeCategory(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    double v7 = [v5 labelVisualConfigurationForContentSizeCategory:v6 options:a3];
  }
  else
  {
    double v7 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  }
  id v8 = v7;

  return v8;
}

__CFString *SBHIconListLayoutRotatedLayoutGridCellClusterSizeClass(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 rotatedLayoutClusterGridSizeClass];
  }
  else
  {
    id v2 = @"SBHIconGridSizeClassDefault";
  }
  id v3 = v2;

  return v3;
}

double SBHIconListLayoutDefaultEditingAnimationStrengthForGridSize(int a1)
{
  int v1 = HIWORD(a1);
  if (HIWORD(a1) <= (unsigned __int16)a1) {
    int v1 = (unsigned __int16)a1;
  }
  if (v1 <= 1) {
    int v1 = 1;
  }
  return 1.0 / (double)v1;
}

double SBHIconListLayoutEditingAnimationStrengthForGridSizeClass(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if (objc_opt_respondsToSelector())
  {
    [v4 editingAnimationStrengthForGridSizeClass:v3];
    double v6 = v5;
  }
  else
  {
    double v7 = SBHIconListLayoutIconGridSizeClassSizes(v4, 1);

    unsigned int v8 = [v7 gridSizeForGridSizeClass:v3];
    int v9 = HIWORD(v8);
    if (HIWORD(v8) <= (unsigned __int16)v8) {
      int v9 = (unsigned __int16)v8;
    }
    if (v9 <= 1) {
      int v9 = 1;
    }
    double v6 = 1.0 / (double)v9;
    id v4 = v7;
  }

  return v6;
}

__CFString *SBHStringForDragRejectionReason(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_1E6AAD5F8[a1];
  }
}

id getAPUISuggestionsWidgetViewControllerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAPUISuggestionsWidgetViewControllerClass_softClass;
  uint64_t v7 = getAPUISuggestionsWidgetViewControllerClass_softClass;
  if (!getAPUISuggestionsWidgetViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAPUISuggestionsWidgetViewControllerClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getAPUISuggestionsWidgetViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D7F97C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUISuggestionsWidgetViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppPredictionUIWidgetLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AAD668;
    uint64_t v6 = 0;
    AppPredictionUIWidgetLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("APUISuggestionsWidgetViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getAPUISuggestionsWidgetViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAPUISuggestionsWidgetViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUIWidgetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUIWidgetLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1D7F981C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t SBVisibleColumnRangeMaxIconListIndex(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL) {
    return a1[2] + 1;
  }
  return result;
}

uint64_t SBVisibleColumnRangeGetNextColumn(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    unint64_t v7 = *a1;
    unint64_t v8 = a1[2];
    BOOL v9 = *a1 != 0x7FFFFFFFFFFFFFFFLL && v8 >= v7;
    if (v9
      && ((unint64_t v10 = a1[3], v11 = a1[1], v7 == v8) ? (v12 = v10 >= v11) : (v12 = 1),
          v12 && (v10 + 1 < a2 ? (unint64_t v13 = v10 + 1) : (++v8, unint64_t v13 = 0), v8 < a3)))
    {
      if (a4) {
        *a4 = v8;
      }
      if (a5) {
        *a5 = v13;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SBVisibleColumnRangeGetPreviousColumn(unint64_t *a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  if (a2 && a3)
  {
    unint64_t v6 = *a1;
    if (*a1 != 0x7FFFFFFFFFFFFFFFLL
      && (v6 || a1[1])
      && (unint64_t v7 = a1[2], v7 >= v6)
      && ((unint64_t v8 = a1[1], v6 != v7) || a1[3] >= v8))
    {
      if (v8) {
        unint64_t v10 = a1[1];
      }
      else {
        unint64_t v10 = a2;
      }
      if (a4) {
        *a4 = (__PAIR128__(v6, v8) - 1) >> 64;
      }
      if (a5) {
        *a5 = v10 - 1;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

BOOL SBVisibleColumnRangeContainsIconListIndex(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[2];
  if (*a1 == 0x7FFFFFFFFFFFFFFFLL || v3 < v2) {
    return 0;
  }
  return (v2 != v3 || a1[3] >= a1[1]) && v2 <= a2 && v3 >= a2;
}

void SBVisibleColumnRangeEnumerateContainedIconListIndexes(unint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v13 = a3;
  unint64_t v5 = *a1;
  unint64_t v6 = a1[2];
  if (*a1 != 0x7FFFFFFFFFFFFFFFLL && v6 >= v5)
  {
    BOOL v8 = a1[3] < a1[1] && v5 == v6;
    unint64_t v9 = v6 + 1;
    if (!v8 && v5 < v9)
    {
      do
      {
        if (v5 == *a1)
        {
          uint64_t v11 = a1[1];
          uint64_t v12 = a2 - v11;
        }
        else
        {
          uint64_t v11 = 0;
          if (v5 == a1[2]) {
            uint64_t v12 = a1[3];
          }
          else {
            uint64_t v12 = -1;
          }
        }
        v13[2](v13, v5++, v11, v12);
      }
      while (v9 != v5);
    }
  }
}

BOOL SBVisibleColumnRangeContainsVisibleColumnRange(void *a1, void *a2)
{
  BOOL result = 0;
  if (*a1 <= *a2 && (*a1 != *a2 || a1[1] <= a2[1]))
  {
    unint64_t v2 = a1[2];
    unint64_t v3 = a2[2];
    if (v2 >= v3 && (v2 != v3 || a1[3] >= a2[3])) {
      return 1;
    }
  }
  return result;
}

uint64_t *SBVisibleColumnRangeUnion@<X0>(uint64_t *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t v3 = *result;
  if ((unint64_t)*result >= *a2)
  {
    if ((unint64_t)*result <= *a2)
    {
      *(void *)a3 = v3;
      unint64_t v4 = result[1];
      if (v4 >= a2[1]) {
        unint64_t v4 = a2[1];
      }
    }
    else
    {
      *(void *)a3 = *a2;
      unint64_t v4 = a2[1];
    }
  }
  else
  {
    *(void *)a3 = v3;
    unint64_t v4 = result[1];
  }
  *(void *)(a3 + 8) = v4;
  unint64_t v5 = result[2];
  unint64_t v6 = a2[2];
  if (v5 <= v6)
  {
    if (v5 >= v6)
    {
      *(void *)(a3 + 16) = v5;
      unint64_t v7 = result[3];
      if (v7 <= a2[3]) {
        unint64_t v7 = a2[3];
      }
    }
    else
    {
      *(void *)(a3 + 16) = v6;
      unint64_t v7 = a2[3];
    }
  }
  else
  {
    *(void *)(a3 + 16) = v5;
    unint64_t v7 = result[3];
  }
  *(void *)(a3 + 24) = v7;
  return result;
}

void sub_1D7F98E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ControlCenterUIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ControlCenterUIKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AAD790;
    uint64_t v6 = 0;
    ControlCenterUIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!ControlCenterUIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CCUICustomContentModuleBackgroundViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCCUICustomContentModuleBackgroundViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

uint64_t __ControlCenterUIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ControlCenterUIKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1D7F9C36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7F9D314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9D4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9D608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9D7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9D914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9DD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9DEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9E074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7F9E6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1D7FA01B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FA04AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FA2018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FA4080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FA5F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FA8A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FAD074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FADAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FAF188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FAF5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SBHScreenTypeForCurrentDevice_block_invoke()
{
  if (__sb__runningInSpringBoard())
  {
    __sb__mainScreenReferenceBounds();
    double v1 = v0;
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    BOOL v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 _referenceBounds];
    double v1 = v9;
    double v3 = v10;
    double v5 = v11;
    double v7 = v12;
  }
  if (__sb__runningInSpringBoard())
  {
    __sb__mainScreenScale();
    double v14 = v13;
  }
  else
  {
    double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
    double v14 = v16;
  }
  uint64_t v17 = SBFEffectiveArtworkSubtype();
  unsigned int v18 = SBFEffectiveDeviceClass();
  uint64_t v19 = SBFEffectiveHomeButtonType();
  uint64_t result = _SBHScreenTypeLookup(v18, v19, v17, &__block_literal_global_3, &__block_literal_global_6, &__block_literal_global_13, v1, v3, v5, v7, v14);
  SBHScreenTypeForCurrentDevice_screenType = result;
  return result;
}

BOOL __SBHScreenTypeForCurrentDevice_block_invoke_2()
{
  return MGGetSInt32Answer() == 7;
}

uint64_t __SBHScreenTypeForCurrentDevice_block_invoke_3()
{
  int v0 = MGIsDeviceOfType();
  int v1 = MGIsDeviceOfType();
  int v2 = MGIsDeviceOfType();
  int v3 = MGIsDeviceOfType();
  int v4 = MGIsDeviceOfType();
  return v2 | v3 | v0 | v1 | v4 | MGIsDeviceOfType();
}

uint64_t __SBHScreenTypeForCurrentDevice_block_invoke_4()
{
  SBFEffectiveDisplayCornerRadius();
  return BSFloatEqualToFloat();
}

uint64_t _SBHScreenTypeLookup(unsigned int a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = ___SBHScreenTypeLookup_block_invoke;
  v41[3] = &unk_1E6AAE050;
  *(double *)&v41[6] = a9;
  *(double *)&v41[7] = a10;
  *(double *)&v41[8] = a11;
  v41[9] = a3;
  v41[10] = a2;
  v41[4] = &v46;
  v41[5] = &v42;
  SBHEnumerateScreenTypes((uint64_t)v41);
  if (!*((unsigned char *)v43 + 24))
  {
    if (a1 == 2)
    {
      if (a2 == 2)
      {
        if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 42;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 40;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 39;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 37;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 38;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 36;
        }
        else
        {
          int v40 = BSSizeGreaterThanOrEqualToSize();
          int v22 = v47;
          if (v40) {
            uint64_t v23 = 41;
          }
          else {
            uint64_t v23 = 34;
          }
        }
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        int v22 = v47;
        uint64_t v23 = 33;
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        int v22 = v47;
        uint64_t v23 = 32;
      }
      else
      {
        int v25 = BSSizeGreaterThanOrEqualToSize();
        int v22 = v47;
        if (v25) {
          uint64_t v23 = 31;
        }
        else {
          uint64_t v23 = 29;
        }
      }
    }
    else
    {
      if (a1 > 1) {
        goto LABEL_33;
      }
      if (a2 == 2)
      {
        if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 23;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 13;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 5;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 21;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          int v22 = v47;
          uint64_t v23 = 11;
        }
        else
        {
          int v39 = BSSizeGreaterThanOrEqualToSize();
          int v22 = v47;
          if (v39) {
            uint64_t v23 = 3;
          }
          else {
            uint64_t v23 = 4;
          }
        }
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        int v22 = v47;
        uint64_t v23 = 2;
      }
      else
      {
        int v24 = BSSizeGreaterThanOrEqualToSize();
        int v22 = v47;
        if (!v24)
        {
          v47[3] = 0;
          goto LABEL_33;
        }
        uint64_t v23 = 1;
      }
    }
    v22[3] = v23;
  }
LABEL_33:
  switch(v47[3])
  {
    case 9:
    case 15:
      BOOL v26 = v20[2](v20) == 0;
      uint64_t v27 = 9;
      uint64_t v28 = 15;
      goto LABEL_40;
    case 10:
    case 16:
      BOOL v26 = v20[2](v20) == 0;
      uint64_t v27 = 10;
      uint64_t v28 = 16;
      goto LABEL_40;
    case 11:
    case 17:
      BOOL v26 = v20[2](v20) == 0;
      uint64_t v27 = 11;
      uint64_t v28 = 17;
      goto LABEL_40;
    case 12:
    case 18:
      BOOL v26 = v20[2](v20) == 0;
      uint64_t v27 = 12;
      uint64_t v28 = 18;
      goto LABEL_40;
    case 13:
    case 19:
      BOOL v26 = v20[2](v20) == 0;
      uint64_t v27 = 13;
      uint64_t v28 = 19;
      goto LABEL_40;
    case 14:
    case 20:
      BOOL v26 = v20[2](v20) == 0;
      uint64_t v27 = 14;
      uint64_t v28 = 20;
LABEL_40:
      if (!v26) {
        uint64_t v27 = v28;
      }
      v47[3] = v27;
      break;
    case 29:
    case 30:
      int v29 = v19[2](v19);
      v30 = v47;
      if (v29) {
        uint64_t v31 = 30;
      }
      else {
        uint64_t v31 = 29;
      }
      goto LABEL_49;
    case 35:
    case 36:
      int v32 = v21[2](v21);
      v30 = v47;
      if (v32) {
        uint64_t v31 = 35;
      }
      else {
        uint64_t v31 = 36;
      }
LABEL_49:
      v30[3] = v31;
      break;
    default:
      break;
  }
  if (os_variant_has_internal_content())
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4FA60A0]);
    v34 = [v33 overriddenScreenType];
    v35 = v34;
    if (v34)
    {
      uint64_t v36 = SBHScreenTypeForShortString(v34);
      v47[3] = v36;
    }
  }
  uint64_t v37 = v47[3];
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v37;
}

void sub_1D7FB21CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

uint64_t SBHScreenTypeForDeviceAndDisplayContexts(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = *MEMORY[0x1E4FB34E8];
  id v5 = a2;
  uint64_t v6 = [v3 deviceInfoIntegerValueForKey:v4];
  LODWORD(v4) = [v3 deviceInfoIntegerValueForKey:*MEMORY[0x1E4FB34D0]];
  uint64_t v7 = [v5 artworkSubtype];
  BOOL v8 = [v5 displayConfiguration];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [v5 displayConfiguration];

  [v17 pointScale];
  double v19 = v18;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke_3;
  v23[3] = &unk_1E6AAE008;
  id v24 = v3;
  id v20 = v3;
  uint64_t v21 = _SBHScreenTypeLookup(v4, v6, v7, &__block_literal_global_15, &__block_literal_global_17, v23, v10, v12, v14, v16, v19);

  return v21;
}

uint64_t __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke()
{
  return 0;
}

uint64_t __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke_2()
{
  return 1;
}

uint64_t __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) deviceInfoFloatValueForKey:*MEMORY[0x1E4FB34D8]];
  return BSFloatEqualToFloat();
}

uint64_t SBHScreenTypeLookup(unsigned int a1, uint64_t a2, uint64_t a3, int a4, double a5, double a6, double a7, double a8, double a9)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __SBHScreenTypeLookup_block_invoke;
  v16[3] = &__block_descriptor_35_e5_B8__0l;
  __int16 v17 = a4;
  char v18 = BYTE2(a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __SBHScreenTypeLookup_block_invoke_2;
  v13[3] = &__block_descriptor_35_e5_B8__0l;
  __int16 v14 = a4;
  char v15 = BYTE2(a4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __SBHScreenTypeLookup_block_invoke_3;
  v10[3] = &__block_descriptor_35_e5_B8__0l;
  __int16 v11 = a4;
  char v12 = BYTE2(a4);
  return _SBHScreenTypeLookup(a1, a2, a3, v16, v13, v10, a5, a6, a7, a8, a9);
}

uint64_t __SBHScreenTypeLookup_block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t __SBHScreenTypeLookup_block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t __SBHScreenTypeLookup_block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 34);
}

void sub_1D7FB277C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = objc_alloc(MEMORY[0x1E4FA69E8]);
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v7 = @"apps.ipad.landscape";
  }
  else {
    uint64_t v7 = @"apps.iphone";
  }
  BOOL v8 = (void *)[v4 initWithSystemImageName:v7];
  [v3 setIcon:v8];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.rearrange-icons"];
  return v3;
}

id _SBCreateShareApplicationShortcutItemWithLocalizedTitle(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v5 = a1;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"square.and.arrow.up"];
  [v6 setIcon:v7];

  [v6 setLocalizedTitle:v5];
  [v6 setType:@"com.apple.springboardhome.application-shortcut-item.share"];
  if (v3)
  {
    uint64_t v10 = *MEMORY[0x1E4F3C3A8];
    v11[0] = v3;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v6 setUserInfo:v8];
  }
  return v6;
}

id _SBCreateAppProtectionApplicationShortcutItemForBundleIdentifier(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  int v1 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:a1];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  id v2 = [MEMORY[0x1E4F4B830] sharedInstance];
  id v15 = 0;
  char v3 = [v2 getPreferredEnablementAction:&v17 preferredEnableableFeature:&v16 forSubject:v1 error:&v15];
  id v4 = v15;

  if (v3)
  {
    id v5 = [MEMORY[0x1E4F4B838] sharedManager];
    id v6 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    uint64_t v7 = [v5 systemImageNameForEnablementAction:v17 ofFeature:v16];
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:v7];
    [v6 setIcon:v8];
    double v9 = [v5 titleForEnablementAction:v17 ofFeature:v16];
    [v6 setLocalizedTitle:v9];

    v18[0] = kSBHIconAppProtectionFeatureUserInfoKey;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v16];
    v18[1] = kSBHIconAppProtectionActionUserInfoKey;
    v19[0] = v10;
    __int16 v11 = [NSNumber numberWithUnsignedInteger:v17];
    v19[1] = v11;
    char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    [v6 setUserInfo:v12];

    [v6 setType:@"com.apple.springboardhome.application-shortcut-item.app-protection"];
  }
  else
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Error fetching preferred app protection enablement action", v14, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

id _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"trash"];
  [v3 setIcon:v4];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.delete-app"];
  return v3;
}

id _SBCreateHideAppSuggestionApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"minus.circle"];
  [v3 setIcon:v4];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.hide-app-suggestion"];
  return v3;
}

id _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"minus.circle"];
  [v3 setIcon:v4];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.remove-app"];
  return v3;
}

id _SBCreateConfigureStackApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"rectangle.stack"];
  [v3 setIcon:v4];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.configure-stack"];
  return v3;
}

id _SBCreateConfigureWidgetApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"info.circle"];
  [v3 setIcon:v4];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.configure-widget"];
  return v3;
}

id _SBCreateRemoveWidgetApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4FA69D0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"minus.circle"];
  [v3 setIcon:v4];

  [v3 setLocalizedTitle:v2];
  [v3 setType:@"com.apple.springboardhome.application-shortcut-item.remove-widget"];
  return v3;
}

id SBHContainingBundleRecordForWidgetWithBundleIdentifier(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x1E4F223A0];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithBundleIdentifier:v2 error:0];

  id v4 = [v3 containingBundleRecord];

  return v4;
}

id SBHContainingBundleIdentifierForWidgetWithBundleIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = SBHContainingBundleRecordForWidgetWithBundleIdentifier(v1);
    id v3 = [v2 bundleIdentifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D7FC6E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FC814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FC8F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FC935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1D7FCAFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHMultitaskingApplicationSupportedShortcutActionMaskFromSBSMask(char a1)
{
  return a1 & 0x1F;
}

uint64_t SBHMultitaskingApplicationSupportedShortcutActionMaskToSBSMask(char a1)
{
  return a1 & 0x1F;
}

double SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(uint64_t a1)
{
  double result = 35.0;
  if (a1 != 1) {
    return 30.0;
  }
  return result;
}

void SBHStyleTintButtonSharedInit(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  id v3 = v1[93];
  v1[93] = (id)v2;

  [v1 addSubview:v1[93]];
  [v1[93] setContentMode:1];
  [v1 _updateFilters];
  id v4 = self;
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v6 = (id)[v1 registerForTraitChanges:v5 withTarget:v1 action:sel__updateFilters];
}

BOOL SBHHardwareSupportsHomeScreenSearchAffordance()
{
  BOOL result = SBHHardwareSupportsSearchAffordancePresentationAnimation();
  if (result) {
    return SBFEffectiveHomeButtonType() == 2;
  }
  return result;
}

BOOL SBHHardwareSupportsSearchAffordancePresentationAnimation()
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v0 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    id v1 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v0 = [v1 userInterfaceIdiom] == 1;
  }
  return !v0;
}

BOOL SBHHomeScreenSearchAffordanceEnabled()
{
  BOOL result = SBHHardwareSupportsSearchAffordancePresentationAnimation();
  if (result)
  {
    BOOL result = SBHHardwareSupportsSearchAffordancePresentationAnimation();
    if (result) {
      return SBFEffectiveHomeButtonType() == 2;
    }
  }
  return result;
}

void sub_1D7FD3DB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getDMFApplicationPolicyMonitorClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!DeviceManagementLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __DeviceManagementLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AAE848;
    uint64_t v6 = 0;
    DeviceManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!DeviceManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("DMFApplicationPolicyMonitor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getDMFApplicationPolicyMonitorClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getDMFApplicationPolicyMonitorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DeviceManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DeviceManagementLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1D7FD7EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

uint64_t CHSWidgetFamilyForATXStackLayoutSize(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return qword_1D81E50D8[a1];
  }
}

uint64_t SBHItemAtIndexIsOfSize(void *a1, unint64_t a2)
{
  id v3 = a1;
  if ([v3 count] <= a2)
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v4 = [v3 objectAtIndex:a2];
    uint64_t v5 = [v4 integerValue];

    if (v4) {
      BOOL v6 = v5 == 1;
    }
    else {
      BOOL v6 = 1;
    }
    uint64_t v7 = v6;
  }

  return v7;
}

uint64_t SBHSizeClassForItemAtIndex(void *a1, unint64_t a2)
{
  id v3 = a1;
  if ([v3 count] <= a2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndex:a2];
    uint64_t v5 = [v4 integerValue];
  }
  return v5;
}

void sub_1D7FE281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE3D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1D7FE3F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE4148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE4328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE44F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE46A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE4830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE49B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE4B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE4E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7FE985C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FEC190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(v69);
  objc_destroyWeak(v71);
  objc_destroyWeak(v70);
  objc_destroyWeak(v72);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(&a65);
  objc_destroyWeak(&a66);
  objc_destroyWeak(&a69);
  _Unwind_Resume(a1);
}

__CFString *SBHStringForIconImageStyleConfigurationType(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E6AAEDF0[a1];
  }
}

void sub_1D7FF47A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FF63B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_1D7FF7E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FF9690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7FFFEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80001D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80006B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
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

void sub_1D800085C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80009DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8002408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8002940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8002EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBFolderRelativeIconIndex(void *a1)
{
  if (a1) {
    return [a1 sbIconIndex];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

uint64_t SBFolderRelativeSubFolderPath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "bs_subpathFromPosition:", 2);
}

void sub_1D80061EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D800687C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80075BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8008328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8008928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8008C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8008F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8009340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8009894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8009F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D800BA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D800C308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D800CA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D800CC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D800DBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D800DF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBFolderIndexPathsAreOnSamePage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v3 length];
  if (v5 >= 2
    && (unint64_t v6 = v5, v5 == [v4 length])
    && (uint64_t v7 = [v3 indexAtPosition:0], v7 == objc_msgSend(v4, "indexAtPosition:", 0)))
  {
    uint64_t v8 = 2;
    do
    {
      unint64_t v9 = v8 - 1;
      if (v6 == v8) {
        break;
      }
      uint64_t v10 = [v3 indexAtPosition:v8 - 1];
      uint64_t v11 = [v4 indexAtPosition:v8++ - 1];
    }
    while (v10 == v11);
    BOOL v12 = v9 >= v6 - 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

__CFString *SBStringForRootFolderPageState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5) {
    return 0;
  }
  else {
    return off_1E6AAF6F8[a1 + 1];
  }
}

BOOL SBRootFolderPageStateIsOnIconPage(unint64_t a1)
{
  return a1 < 2;
}

BOOL SBRootFolderPageStateIsOnTrailingCustomPage(uint64_t a1)
{
  return a1 == 4;
}

BOOL SBRootFolderPageStateIsOnHorizontalScrollingPlane(unint64_t a1)
{
  return (a1 & 1) == 0 && a1 < 5;
}

BOOL SBRootFolderPageStateVerticalGroupMatches(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 + 1) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_1D81E51E0[a1 + 1];
  }
  if ((unint64_t)(a2 + 1) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1D81E51E0[a2 + 1];
  }
  return v2 == v3;
}

void sub_1D8012FA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D801A2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1D801AE80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id SBHomeAccessibilityTintColor(unint64_t a1, void *a2)
{
  id v4 = 0;
  SBHomeAccessibilityTintColorAndStyle(a1, a2, &v4, 0);
  id v2 = v4;
  return v2;
}

void SBHomeAccessibilityTintColorAndStyle(unint64_t a1, void *a2, void *a3, uint64_t *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    uint64_t v9 = 2;
LABEL_8:
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  double v14 = 0.0;
  uint64_t v9 = 0;
  uint64_t v10 = v7;
  if (![v7 getHue:&v16 saturation:&v15 brightness:&v14 alpha:0]) {
    goto LABEL_8;
  }
  double v11 = 0.0;
  if (a1 <= 3) {
    double v11 = dbl_1D81E52B0[a1];
  }
  if (v14 >= 0.9)
  {
    double v12 = 0.392156863;
    if (a1 == 1)
    {
      double v12 = 1.0;
      double v11 = 0.9;
    }
    uint64_t v9 = 2;
  }
  else
  {
    double v12 = dbl_1D81E5290[v14 < 0.4];
    uint64_t v9 = 1;
  }
  double v13 = [MEMORY[0x1E4FB1618] colorWithWhite:v12 alpha:v11];
  uint64_t v10 = SBFComposedColor();

  if (a3) {
LABEL_9:
  }
    *a3 = v10;
LABEL_10:
  if (a4) {
    *a4 = v9;
  }
}

uint64_t SBHomeAccessibilityTintLegibilityStyle(unint64_t a1, void *a2)
{
  uint64_t v3 = 0;
  SBHomeAccessibilityTintColorAndStyle(a1, a2, 0, &v3);
  return v3;
}

id SBHomeAccessibilityTintLegibiliitySettings(unint64_t a1, void *a2)
{
  id v6 = 0;
  uint64_t v7 = 0;
  SBHomeAccessibilityTintColorAndStyle(a1, a2, &v6, &v7);
  id v2 = v6;
  id v3 = objc_alloc(MEMORY[0x1E4FB21E0]);
  id v4 = (void *)[v3 initWithStyle:v7 contentColor:v2];

  return v4;
}

BOOL SBHIsHomeButtonDevice()
{
  BOOL v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  BOOL v1 = [v0 homeButtonType] != 2;

  return v1;
}

uint64_t SBHIsSpotlightFloatingWindowEnabled()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  BOOL v0 = (void *)getSPUIDefaultsClass_softClass;
  uint64_t v7 = getSPUIDefaultsClass_softClass;
  if (!getSPUIDefaultsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSPUIDefaultsClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getSPUIDefaultsClass_block_invoke((uint64_t)v3);
    BOOL v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return [v1 enableFloatingWindow];
}

void sub_1D801DFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBHWeatherWidgetTestIntent()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v1 = [@"/Td6WFoAAAD/EtlBAgAhARYAAAB0L+Wj4B9IEJ5dADEcCbwef02oFXxbODFLJ6lFXbr0DHqsTF+vT2q/BDIO2FiDjAilU8tTgPSYbYL/W/B+tKbY3nJzTUcH6BiMVSyTpgss1A43qH34miQjtY882XmTB5YsDJCDZKn3deWhWBlsU+ghAa7WiEaYuXEUwKu0DpWTO6Hp2+PNqAV8fm0dpVJSfPL6p4fxICk3P5mr+dO4KCIpxFMhPp32uUW0wrIR7QzXEocL5erNDyDo1s+4uOj44VWkbBieWt7QhZJgjHYWKXPj7OGx7eB6y2FuoY/Mv/glFZEq0RpF1CFr88QR3zPm/FuvhGxVombp5p8pvf9Xd28ymUT6b9YJq0g+cmYDw6Xlw2JDpAQw26AVNS/oPgvV0E1JOpFvWhsBJIgNQWFWdtlfps2kUMbobXg9RphWrh+AryoGWjeO1PKAMYuaydjkmJlA0E/wktQh3J51ojZ45SOhz3CqLqsJWUVTNuHv1lDQvUmb/OCTWB4JA/JxWQ9hKGWei+VKs0R8gIijsnsie/nAZIFI0yW94AkcVHw5d4+hygxntBgA+A1M6KjpSP6HJTQHqOAhCfyKrqg9Pax7BL0JwmI9JUfbMmXDDkEdPTBs/fd8EQDc6Aq6rJ8pCkJaXPEgPYz/1abq6f+TskilLkqEgjJLwbo78+07z2BrW2tQK0kJs42aqwa4mEbK7OdbMLgc9P2JuY9nvM5C0bUkrOEucLqBJ/mbn4+NdW0tSu5L0imDBfMlZ9sAWrrHgBHYB2QNFwqMZ5jOKdNBN1cihTCCVIWN+ni+nTNbgwbhfftqBn9elUerixeWg1+zGDesSl/HiPTIAk4qNgCFc0JH4+VrktML1Ojhab0aKhVdkmEQhb8jVcIDUWe0QGD3aWcP4Cnsf9EkSVhgdvGbiKIJ7yIVljyJXmcCdD+NFhIPNpzf4Xfqf81IROLpoQojUU7KcMvy9KUEtckfnNG+64JQVhXcmcyb42aMBXkl9yuliTmVANiZmxEPEnNSgR+GtCHmV2NPgCY7RCaNQUuYtduBu1U9AZ8a782pLYYjeTlYdaTyxXXc2c/DVuc3NnEw2SDcWv6pUUz+2g3W7GxRngI0eaK4YcZ/8bQQIcgtPfejYybGeYXzILpEIZ7mDJl1/c+22iipEMAUIIBLDKuNneaC7pcAUBM3SqAolEMV6zaL0QhwKJ3M9TzDrUTa9D5Z0w+KUCfCeCnOoOBaPf+XFueEKfhaSlU8OSrGAYiBxFlkQsflpswJmlWv5j+GsOMjEhy5SRVlTMMm6srHZq0fGpdZiFfAD2fgVhXTIOWqwb1Dp7OW3nHv2FGrmhGviP5+mjx8PFgmA0h7gJF4LxQXYjFy9kEyMB756QM6pezthoLNk5y8o0cLcNoTP1KoTRPFh+BOnt9Pu3yQkC74EKaSWf4FDPTLsLxROz8N1qaKBtNW/4i7y/yJ1x2zHndy7EubdURmsXV0Oa2HnD5cA6XqSATr7rooeKL7vBOcQuweSV3vLiRT+2PZYpodhU6BdjmShivpKw9VeEelJ9Yb9qrNVNffJKfY2nQm4OZgAMj4X9Xdcw84uqEYFABKutHnD1PMwjX6D49pEA8a/NciM/jY/lPyWHnpYBaatVD0opE0GhVKgA/dZ7tVbafzY7gYw2XAe7jCnjh8oL9otkmPMqR+gCBqUmmw1hR5+8mZEBpdIP00CTBKL+fZMcIOeHPmjg58jD5TNcCaerWMkOFeqdNIG8l/swSucvLdXjNaan71fVA5fTzG228sXIEmvUB551XqUw3h64R4iB/1c+p8zPWTboe5ALndoKDbSVx6QfE80qYvelZ/+W/MGCNAbhP7+B/YSDC0vxMkHTtmqGnjgcr/z3Bvhcq4UHp9Ffwy29HgrAIS+RTr913SkvpcDh+YOe0D813wn/z8XSMULPYsYGDrNOkRLMKHjRPdVxm0YfCPdobZdFbz1vbjK8T2NZ++G4j8lIW+R1nlAQyxC/8qn8ehhjHT0sG9g2YJnfj4PHwGRy6y3RlM8zNLU5A2SGeOcJsHUEpZkz4woU/KX0YzFDegzfpkEEXNgH7Iw4uvRjtQZA9SZ2iZNZ8ILlg578gvbmCpOnHgxw7ND4EepEDvnG3N2i7NfPBM5mccWRKQ1sR8hmHtEgfKuHuzaEEpdSK+SI2KetQhUrC4dMxqy9sEGiZKeZZqJWN7IsbRMd92txDb8U9TvgugSkgPSc67337xSJLMR9dkPbPJNO5H1PiVdqQK90sAS8cVZCJG/Dt1333tZa2I8S+zOXvFdb2kSSE/ZI7kpuM4GTtam1f8F4FpZppLimoUy1PdJrH789aD2pBtU/584JDMzrdVDEJy8GeqegcCmb11Na7AuFoUsdQArBH50c4v7Qm4725/IAa+BfGoARI2WymTcpiSMa1j1SyWjr+WQjJvEJa7kHfTozhm8hZYWY1R3ec8l9S5DCZTic9tR701+GPVZ51e4bYDFIr+xzfEwh0YjmAJpk5uquwMvunz8n5M1ttWlgoXi5Scca" stringByAppendingString:@"lbVtjvJQkShqq/aVRu02btidukA5bqPbMPavQZ7BmnshthaSkkXiVrb2UqwatMRZHUS20r0A1JWt4H0niatxwGi7sE87eWgFoHhXbcNICaPpOm4HdtLfr5UI0lrpzb+0X5wojvWF8uqLHeKSaZZPNUY0N+wkvvIkmwieEmAstAHoNRRBHo75/HblGKLPmrzpnGUM99GaVsBru5ZWngawSUJxh0AtTGuMiXTbmZ8Wv6mgxAtsY6ThV4pOnaz+MHgK5xgslyh/BsljBi2tfJG4BBMCYcadVcUrSDNg9L0kXZuD8mNWmidQUWcwlV+RjvzK6Wr48BKPDG9nW/xnIam4/PFadfYY9MS7AkX1INN2tSprt6mD9aO+6hc86cc0tRwWZWHi01yH7t3U+KGjJPG1lOnb1Yroda2/7b+RP0jE37TG8ZlhJ1gmdyBQdzoR68mCAOpXO7XmM/VsPP1tFUMcXCipgPAbewqyxvrpKSWqN/BCba8YSrVhteqdFvWWsPfVYqf10GqnDWG99zAsdZz8h2htgDxSQAvvB9eJAj/pL4ZKgtAYZ9uCEWwWV1OJPsulI5aa+J5XMbORotvp2d9Gdr4gzkH5LpcAKU4Lm3qlXl3Tq0yL5gt0qvHUJ/0u0xPT2IEzhWP8ZMY1YHripF1yIOqEG2P6iuGrw/PcUc1Rr6z7WV2kSWMjEi85n9jHQ2pq93Qkqh5rx2k+7/W0s+55pz7A4z5ZruxyEtyAygXRh55iROgrmbDG1+4EdPYKQF4FdGY04wwC78yN2mb5x364VKO40zCbSgF1dGOJ9Z36eLIMHiYYNE6igscIssCtoR29X1H13DTUz+ZBLIRVBhrt35ogXJbIfLTWvSuBgauT5lyAH5n6h+mDU2qo5iIwFSJUwo+fuOzQ7xSrJfE2CSD1WZqdWJqUvLuuOicCbkaDk6pe3VaTM3dj+T8c63cpex9xpUWpCS3PFNgqeB+J6YbDQKT5VzJrUpP3yCXP5DkGh26PUdf58q8xk8Krfnb3o1bc2/37rZT6BLjUrNem/imKMWZSWF4tEI1nOY/f94vzpHXE0Jv0fdVav/JszNZxK+NHxHWgbUvY7nGcnuwZxl1nKVs0NPB4yRGunidFv6aHf9namJK306PxFB0bsi1oKSy7lk1kKFzNtWttM8+v2ui0CmIMLqy9RX6DgUGjnTpW6c9pnWpT+T4+iS0lEJ7DrfQE7QhFCsYKaJKZ8H12vIRGgmBgvPctewkQjhdgVtGKb77o+zXScldBznf8qj8LCQyDmxO4UXfVlmC+kjKdgtyBiGAyMOBY3EYfqF7QaX/5Lgg2T00ABKqnh5MZada3dwkvftr9RP20RDiPvBqF8VSovluEi9iFSGezeR2Sy/WH3ps0XZtfYtRxJxsgnd3w0+SwhEHGrJN20xVoi9H9Kv2QX/E9iEiNxuh/oXsd9qNG+R2IaBIGSqRLIgnRQQX6tMJ1sNoDhI9rshr69qibkJ7YJerHfBRPS9/Tlha06QysbjxWZKiZZprOKgEi/1uwcLM+qkb7boPVEMsn9Xm5Uuxdwh9bMkb2wM8y2lI/HQzU13fO6c0rirgL3tNBHl7WpyZdMsB9LadrYPJr0aVyMCRrVYr1WtDcNTJDaS+3wNhx7rx64eeSyY0ZsgRsIFpvOfD+bw8vfQaD7+rPehKE7kgCWw+04YXkLNiUaCiI7UKUfYvXW2DJ9tIvHslN4Rfmm186nB2MTrBrg2DjZu1GRT0OH7NWA0QfVq8Uh+JXyw0hb69QrCHt6V3mgw09z4VBgp4m9DJWoliqsGWP1wvsFFO8XDFWIDc9gh8ninLtWM/Q3OnbG3vnwJ5vMLBxUx2zopY28IVfQ1mWOB6KrMD5tam2N7asj1KwDQELAO4J4TQBNEn/cDN+Ck/SLVCYcCQrB+7G6N5Q3rzu69pgwni7uDV/Xyz+umZe4rYUiLBXhvdf69z5Z2vmAqroR7Tp+qvZP3TcTWyAKwLv6t2nuGLSha9mUnTaGHu8Sxwnoc2dFhsUOjAY8GgDRJ6pK0J4y+caxJ5+XuPPJKM3wGFr4JV+W3aMei+6ba81jFVmGZHQWurKW82PnNMoe66Dw/YH3YJz8t8K1ie0E5uCJMa/d6F2o16/hgEY1o/7LkPSq2JCN41GH4dEiuZKTcxLwZRktdhZ2SR1mSQ/plj7AMUXq5oAZe2o4FC/FSNfoU4vzD5DwG4uSzOO72HAKYERFit8DqFT2C4mPET7/vdSFIHhJnfdrXZ6vjK5eSv0BfEXkR90gIOWA0VK42FoFZ+huxaAZHqQf4wiVq9CWXbR5oO57AthJK0ThopXuuLG52xhkFNrjoKMRHDsHmVvurSZPFCr8YuEm6Vr2p+YoHB+HoZMPiDR0CpNjYD8jQ6JkOuO9761xGysBeMgWiQ7ACYqjcsk9sRctzV179n0WA6t8FhrPKMawKtkfvKzCg09nisQ6oa7Jrladh8VWUXnTxR4WkCZp+VzK5btbC9tOFLTjN1wj7+CYeHKwpRvDBjzvVhGeIxnFZuk+L7tl9SgaPqzIEBFR+2lWw/GLRKMPqG3VjY2M/I/1QxaMsv/5LId6DNLSrbChI79wWt77+FwrfHB0Uf6CuwgnaCbhLM+mIC9vxX1XH1Mhf0kTojyXRx/s7U45S/PKuD72PMhLZIfkEvo9A8IMKSR7R0xB80NwLQve+80qjUcXYoseXaHbQqiqjHwgm4iLXuIflvkALJ3Bw9r8KhE+DvuLQxm9BsJv2ZJSXVAx+kvNd3k/NV+Rk6naePSlYWeHF2l4pOBmO9Glrss5eNvd9a3K3+K7B40WfEHVbuaVImlQKSco9sJDN1YWr8wlVDilQItsqtEwSLtMIvRPnoXB8IlFMOGHSe2BQYGu0ryFxJoAj6yirHh42xXD75oi/cqv/WF8b1xoY8z2IVQW/WeXcwJiAUwnK631QC+jaopxjL4Iu/eHjgxX3Fv2esrZXM6ZTsicc/ir7IaAxfovgVsTFuoOEzE0KrKN8WcB+0d577i2xQSMO8c79D3qxCzKtn6FviWQ6YsvOk1AkWt41+HOLXPiMCIIoxFsgLEQ2h2DlLf8a8diW9nxeLUe3RZMSdF0GO8W9wRb8kVaHUsFTA0fV9odBSEXtxMtAlfviJkic3WGl3lqUEgAAAAABsiHJPgAAAQlGTagACvwCAAAAAABZWg=="];
  id v2 = (void *)[v0 initWithBase64EncodedString:v1 options:1];
  id v3 = [v2 decompressedDataUsingAlgorithm:2 error:0];

  uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

void SBHUIViewAnimateHighlight(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 traitCollection];
  BOOL v5 = [v4 userInterfaceStyle] == 2;

  if (a2) {
    double v6 = dbl_1D81E52A0[v5];
  }
  else {
    double v6 = 1.0;
  }
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __SBHUIViewAnimateHighlight_block_invoke;
  double v12 = &unk_1E6AAC838;
  id v7 = v3;
  id v13 = v7;
  double v14 = v6;
  uint64_t v8 = _Block_copy(&v9);
  if (a2) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v8, v9, v10, v11, v12);
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:", v8, 0.47, v9, v10, v11, v12);
  }
}

uint64_t __SBHUIViewAnimateHighlight_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alpha];
  if (v3 != *(double *)(a1 + 40))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "setAlpha:");
  }
  return result;
}

Class __getSPUIDefaultsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SpotlightUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SpotlightUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AAFA00;
    uint64_t v6 = 0;
    SpotlightUILibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SpotlightUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SPUIDefaults");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getSPUIDefaultsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSPUIDefaultsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpotlightUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpotlightUILibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *SBHStringFromUIInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E6AAFA40[a1 - 1];
  }
}

void sub_1D8020270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1D8020460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D8020634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D8020800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D8020A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D8020C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D8021038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D802139C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SBLogIcon_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Icon");
  id v1 = (void *)SBLogIcon___logObj;
  SBLogIcon___logObj = (uint64_t)v0;
}

void __SBLogIconImageCache_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "IconImageCache");
  id v1 = (void *)SBLogIconImageCache___logObj;
  SBLogIconImageCache___logObj = (uint64_t)v0;
}

id SBLogFolderIconImageCache()
{
  if (SBLogFolderIconImageCache_onceToken != -1) {
    dispatch_once(&SBLogFolderIconImageCache_onceToken, &__block_literal_global_6_0);
  }
  os_log_t v0 = (void *)SBLogFolderIconImageCache___logObj;
  return v0;
}

void __SBLogFolderIconImageCache_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "FolderIconImageCache");
  id v1 = (void *)SBLogFolderIconImageCache___logObj;
  SBLogFolderIconImageCache___logObj = (uint64_t)v0;
}

void __SBLogIconLabelImageCache_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "IconLabelImageCache");
  id v1 = (void *)SBLogIconLabelImageCache___logObj;
  SBLogIconLabelImageCache___logObj = (uint64_t)v0;
}

void __SBLogCommon_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Common");
  id v1 = (void *)SBLogCommon___logObj;
  SBLogCommon___logObj = (uint64_t)v0;
}

id SBLogRecentsDocumentExtension()
{
  if (SBLogRecentsDocumentExtension_onceToken != -1) {
    dispatch_once(&SBLogRecentsDocumentExtension_onceToken, &__block_literal_global_15_0);
  }
  os_log_t v0 = (void *)SBLogRecentsDocumentExtension___logObj;
  return v0;
}

void __SBLogRecentsDocumentExtension_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "RecentsDocumentExtension");
  id v1 = (void *)SBLogRecentsDocumentExtension___logObj;
  SBLogRecentsDocumentExtension___logObj = (uint64_t)v0;
}

void __SBLogProactiveAppLibrary_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "ProactiveAppLibrary");
  id v1 = (void *)SBLogProactiveAppLibrary___logObj;
  SBLogProactiveAppLibrary___logObj = (uint64_t)v0;
}

void __SBLogHomeScreenUsageMonitor_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "HomeScreenUsageMonitor");
  id v1 = (void *)SBLogHomeScreenUsageMonitor___logObj;
  SBLogHomeScreenUsageMonitor___logObj = (uint64_t)v0;
}

id SBLogLibrarySearchController()
{
  if (SBLogLibrarySearchController_onceToken != -1) {
    dispatch_once(&SBLogLibrarySearchController_onceToken, &__block_literal_global_24);
  }
  os_log_t v0 = (void *)SBLogLibrarySearchController___logObj;
  return v0;
}

void __SBLogLibrarySearchController_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "LibrarySearchController");
  id v1 = (void *)SBLogLibrarySearchController___logObj;
  SBLogLibrarySearchController___logObj = (uint64_t)v0;
}

id SBLogContinuity()
{
  if (SBLogContinuity_onceToken != -1) {
    dispatch_once(&SBLogContinuity_onceToken, &__block_literal_global_27);
  }
  os_log_t v0 = (void *)SBLogContinuity___logObj;
  return v0;
}

void __SBLogContinuity_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Continuity");
  id v1 = (void *)SBLogContinuity___logObj;
  SBLogContinuity___logObj = (uint64_t)v0;
}

id SBLogLibrary()
{
  if (SBLogLibrary_onceToken != -1) {
    dispatch_once(&SBLogLibrary_onceToken, &__block_literal_global_30);
  }
  os_log_t v0 = (void *)SBLogLibrary___logObj;
  return v0;
}

void __SBLogLibrary_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Library");
  id v1 = (void *)SBLogLibrary___logObj;
  SBLogLibrary___logObj = (uint64_t)v0;
}

id SBLogIconContextMenu()
{
  if (SBLogIconContextMenu_onceToken != -1) {
    dispatch_once(&SBLogIconContextMenu_onceToken, &__block_literal_global_33);
  }
  os_log_t v0 = (void *)SBLogIconContextMenu___logObj;
  return v0;
}

void __SBLogIconContextMenu_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "IconContextMenu");
  id v1 = (void *)SBLogIconContextMenu___logObj;
  SBLogIconContextMenu___logObj = (uint64_t)v0;
}

id SBLogAppPlaceholder()
{
  if (SBLogAppPlaceholder_onceToken != -1) {
    dispatch_once(&SBLogAppPlaceholder_onceToken, &__block_literal_global_36_0);
  }
  os_log_t v0 = (void *)SBLogAppPlaceholder___logObj;
  return v0;
}

void __SBLogAppPlaceholder_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "AppPlaceholder");
  id v1 = (void *)SBLogAppPlaceholder___logObj;
  SBLogAppPlaceholder___logObj = (uint64_t)v0;
}

id SBLogTelemetrySignposts()
{
  if (SBLogTelemetrySignposts_onceToken != -1) {
    dispatch_once(&SBLogTelemetrySignposts_onceToken, &__block_literal_global_39_0);
  }
  os_log_t v0 = (void *)SBLogTelemetrySignposts___logObj;
  return v0;
}

void __SBLogTelemetrySignposts_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "TelemetrySignposts");
  id v1 = (void *)SBLogTelemetrySignposts___logObj;
  SBLogTelemetrySignposts___logObj = (uint64_t)v0;
}

void __SBLogWidgets_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Widgets");
  id v1 = (void *)SBLogWidgets___logObj;
  SBLogWidgets___logObj = (uint64_t)v0;
}

id SBLogWidgetMultiplexing()
{
  if (SBLogWidgetMultiplexing_onceToken != -1) {
    dispatch_once(&SBLogWidgetMultiplexing_onceToken, &__block_literal_global_45);
  }
  os_log_t v0 = (void *)SBLogWidgetMultiplexing___logObj;
  return v0;
}

void __SBLogWidgetMultiplexing_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "WidgetMultiplexing");
  id v1 = (void *)SBLogWidgetMultiplexing___logObj;
  SBLogWidgetMultiplexing___logObj = (uint64_t)v0;
}

id SBLogWidgetIntent()
{
  if (SBLogWidgetIntent_onceToken != -1) {
    dispatch_once(&SBLogWidgetIntent_onceToken, &__block_literal_global_48);
  }
  os_log_t v0 = (void *)SBLogWidgetIntent___logObj;
  return v0;
}

void __SBLogWidgetIntent_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "WidgetIntent");
  id v1 = (void *)SBLogWidgetIntent___logObj;
  SBLogWidgetIntent___logObj = (uint64_t)v0;
}

id SBLogWidgetCleanup()
{
  if (SBLogWidgetCleanup_onceToken != -1) {
    dispatch_once(&SBLogWidgetCleanup_onceToken, &__block_literal_global_51);
  }
  os_log_t v0 = (void *)SBLogWidgetCleanup___logObj;
  return v0;
}

void __SBLogWidgetCleanup_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "WidgetCleanup");
  id v1 = (void *)SBLogWidgetCleanup___logObj;
  SBLogWidgetCleanup___logObj = (uint64_t)v0;
}

id SBLogWidgetDiscoverabilityMigration()
{
  if (SBLogWidgetDiscoverabilityMigration_onceToken != -1) {
    dispatch_once(&SBLogWidgetDiscoverabilityMigration_onceToken, &__block_literal_global_54);
  }
  os_log_t v0 = (void *)SBLogWidgetDiscoverabilityMigration___logObj;
  return v0;
}

void __SBLogWidgetDiscoverabilityMigration_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "WidgetDiscoverabilityMigration");
  id v1 = (void *)SBLogWidgetDiscoverabilityMigration___logObj;
  SBLogWidgetDiscoverabilityMigration___logObj = (uint64_t)v0;
}

id SBLogWidgetResizing()
{
  if (SBLogWidgetResizing_onceToken != -1) {
    dispatch_once(&SBLogWidgetResizing_onceToken, &__block_literal_global_57_0);
  }
  os_log_t v0 = (void *)SBLogWidgetResizing___logObj;
  return v0;
}

void __SBLogWidgetResizing_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "WidgetResizing");
  id v1 = (void *)SBLogWidgetResizing___logObj;
  SBLogWidgetResizing___logObj = (uint64_t)v0;
}

id SBLogSelectedApplicationDataSource()
{
  if (SBLogSelectedApplicationDataSource_onceToken != -1) {
    dispatch_once(&SBLogSelectedApplicationDataSource_onceToken, &__block_literal_global_60);
  }
  os_log_t v0 = (void *)SBLogSelectedApplicationDataSource___logObj;
  return v0;
}

void __SBLogSelectedApplicationDataSource_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "SelectedApplicationDataSource");
  id v1 = (void *)SBLogSelectedApplicationDataSource___logObj;
  SBLogSelectedApplicationDataSource___logObj = (uint64_t)v0;
}

void __SBLogClock_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Clock");
  id v1 = (void *)SBLogClock___logObj;
  SBLogClock___logObj = (uint64_t)v0;
}

void __SBLogLegibility_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Legibility");
  id v1 = (void *)SBLogLegibility___logObj;
  SBLogLegibility___logObj = (uint64_t)v0;
}

id SBLogLabels()
{
  if (SBLogLabels_onceToken != -1) {
    dispatch_once(&SBLogLabels_onceToken, &__block_literal_global_69_0);
  }
  os_log_t v0 = (void *)SBLogLabels___logObj;
  return v0;
}

void __SBLogLabels_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Labels");
  id v1 = (void *)SBLogLabels___logObj;
  SBLogLabels___logObj = (uint64_t)v0;
}

id SBLogProtectedApps()
{
  if (SBLogProtectedApps_onceToken != -1) {
    dispatch_once(&SBLogProtectedApps_onceToken, &__block_literal_global_72_0);
  }
  os_log_t v0 = (void *)SBLogProtectedApps___logObj;
  return v0;
}

void __SBLogProtectedApps_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "ProtectedApps");
  id v1 = (void *)SBLogProtectedApps___logObj;
  SBLogProtectedApps___logObj = (uint64_t)v0;
}

id SBLogAddWidgetSheet()
{
  if (SBLogAddWidgetSheet_onceToken != -1) {
    dispatch_once(&SBLogAddWidgetSheet_onceToken, &__block_literal_global_75);
  }
  os_log_t v0 = (void *)SBLogAddWidgetSheet___logObj;
  return v0;
}

void __SBLogAddWidgetSheet_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "AddWidgetSheet");
  id v1 = (void *)SBLogAddWidgetSheet___logObj;
  SBLogAddWidgetSheet___logObj = (uint64_t)v0;
}

id SBLogIconStylePicker()
{
  if (SBLogIconStylePicker_onceToken != -1) {
    dispatch_once(&SBLogIconStylePicker_onceToken, &__block_literal_global_78_0);
  }
  os_log_t v0 = (void *)SBLogIconStylePicker___logObj;
  return v0;
}

void __SBLogIconStylePicker_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "IconStylePicker");
  id v1 = (void *)SBLogIconStylePicker___logObj;
  SBLogIconStylePicker___logObj = (uint64_t)v0;
}

id SBLogIconImageView()
{
  if (SBLogIconImageView_onceToken != -1) {
    dispatch_once(&SBLogIconImageView_onceToken, &__block_literal_global_81);
  }
  os_log_t v0 = (void *)SBLogIconImageView___logObj;
  return v0;
}

void __SBLogIconImageView_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "IconImageView");
  id v1 = (void *)SBLogIconImageView___logObj;
  SBLogIconImageView___logObj = (uint64_t)v0;
}

void sub_1D8025AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8026238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBHAppDragLocalContextStartLocationFromSBSLocation(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0xC) {
    return 0;
  }
  return result;
}

uint64_t SBHAppDragLocalContextStartLocationToSBSLocation(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0xC) {
    return 0;
  }
  return result;
}

void sub_1D8032940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUIAppPredictionViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppPredictionUIWidgetLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AAFF70;
    uint64_t v6 = 0;
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("APUIAppPredictionViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getAPUIAppPredictionViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAPUIAppPredictionViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUIWidgetLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUIWidgetLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id SBHWidgetViewControllerDescriptionsForSysdiagnose(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = SBHWidgetViewControllerSysdiagnoseDescription(v8);
        objc_msgSend(v2, "setObject:forKey:", v9, v8, (void)v11);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

id SBHWidgetViewControllerSysdiagnoseDescription(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "sbh_underlyingAvocadoHostViewControllers");
  id v3 = objc_opt_new();
  if ([v2 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __SBHWidgetViewControllerSysdiagnoseDescription_block_invoke;
    v11[3] = &unk_1E6AB0000;
    id v12 = v3;
    objc_msgSend(v2, "bs_each:", v11);
  }
  else
  {
    uint64_t v4 = NSString;
    uint64_t v5 = objc_opt_class();
    if ([v1 isViewLoaded]) {
      uint64_t v6 = @"Y";
    }
    else {
      uint64_t v6 = @"N";
    }
    if (objc_msgSend(v1, "bs_isAppearingOrAppeared")) {
      uint64_t v7 = @"Y";
    }
    else {
      uint64_t v7 = @"N";
    }
    uint64_t v8 = [v4 stringWithFormat:@"<%@:%p l:%@ v:%@>", v5, v1, v6, v7];
    [v3 addObject:v8];
  }
  uint64_t v9 = [v3 componentsJoinedByString:@"\n"];

  return v9;
}

void __SBHWidgetViewControllerSysdiagnoseDescription_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 widget];
  uint64_t v5 = [v4 intentReference];
  id v12 = [v5 intent];

  uint64_t v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = @"Y";
  if ([v3 isViewLoaded]) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  if (!objc_msgSend(v3, "bs_isAppearingOrAppeared")) {
    uint64_t v8 = @"N";
  }
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "_indexingHash"));
  long long v11 = [v6 stringWithFormat:@"<%@:%p l:%@ v:%@ i:%@>", v7, v3, v9, v8, v10];

  [*(id *)(a1 + 32) addObject:v11];
}

void sub_1D8036490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8036F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCPSWebClipStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ClipServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AB0078;
    uint64_t v6 = 0;
    ClipServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!ClipServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CPSWebClipStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getCPSWebClipStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCPSWebClipStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ClipServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClipServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getIXAppInstallCoordinatorClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!InstallCoordinationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __InstallCoordinationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AB0090;
    uint64_t v6 = 0;
    InstallCoordinationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!InstallCoordinationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("IXAppInstallCoordinator");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getIXAppInstallCoordinatorClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getIXAppInstallCoordinatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __InstallCoordinationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  InstallCoordinationLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void sub_1D803CA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D803D9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1D8041864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8041AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1D8046348(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D8046450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1D8048A9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8048B1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D80497DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D804A2C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D804A8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t SBHSpecialWidgetDescriptorTypeForKind(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSiri"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSmartStack"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"SBHSpecialAvocadoDescriptorKindAppPredictions"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

double SBHZPositionForScale(double a1, double a2)
{
  return (1.0 / a1 + -1.0) / a2;
}

double SBHInterpolateEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + (a5 - a1) * a9;
}

double SBHDirectionalEdgeInsetsByClearingEdges(char a1)
{
  if (a1) {
    return 0.0;
  }
  return result;
}

double SBHDirectionalEdgeInsetsInsetRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1) {
    a7 = a9;
  }
  return a2 + a7;
}

double SBHAlignSizeInRectUsingBaseline(double a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v8.origin.x = a4;
  v8.origin.y = a5;
  v8.size.width = a6;
  v8.size.height = a7;
  CGRectGetMaxY(v8);
  return 0.0;
}

double SBHCenterNormalizedFromLayerAnchorPoint(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  uint64_t v10 = [v1 layer];
  [v10 anchorPoint];
  double v15 = v11;

  [v1 center];
  double v13 = v12;

  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  CGRectGetHeight(v16);
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  return v13 + CGRectGetWidth(v17) * (0.5 - v15);
}

id SBHPinViewWithinView(void *a1, void *a2)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  char v18 = [v4 leadingAnchor];
  CGRect v17 = [v3 leadingAnchor];
  CGRect v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  CGFloat v5 = [v4 trailingAnchor];
  double v6 = [v3 trailingAnchor];
  CGFloat v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  double v8 = [v4 topAnchor];
  CGFloat v9 = [v3 topAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  double v11 = [v4 bottomAnchor];

  double v12 = [v3 bottomAnchor];

  double v13 = [v11 constraintEqualToAnchor:v12];
  void v19[3] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v14];
  return v14;
}

double SBHEdgeInsetsForTransformingRectIntoRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v20.origin.x = a5;
  v20.origin.y = a6;
  v20.size.width = a7;
  v20.size.height = a8;
  double MinY = CGRectGetMinY(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  double v19 = MinY - CGRectGetMinY(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  CGRectGetMinX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  CGRectGetMinX(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGRectGetMaxY(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetMaxY(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetMaxX(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetMaxX(v27);
  return v19;
}

BOOL SBHSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 >= a3;
}

double SBHSizeScaledToFill(double a1, double a2, double a3, double a4)
{
  return a3 * fmax(a1 / a3, a2 / a4);
}

double SBHSizeScaleSizeToFill(double a1, double a2, double a3, double a4)
{
  return fmax(a1 / a3, a2 / a4);
}

double SBHSizeScaled(double a1, double a2, double a3)
{
  return a1 * a3;
}

double SBHSizeCeiling(double a1)
{
  return ceil(a1);
}

double SBHSizeConstrain(double result, double a2, double a3, double a4, double a5)
{
  if (result < a3) {
    double result = a3;
  }
  if (result > a5) {
    return a5;
  }
  return result;
}

void SBHCGRectIntersectionAsPercentage(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (CGRectIntersectsRect(*(CGRect *)&a1, *(CGRect *)&a5))
  {
    v16.origin.x = a1;
    v16.origin.y = a2;
    v16.size.width = a3;
    v16.size.height = a4;
    v17.origin.x = a5;
    v17.origin.y = a6;
    v17.size.width = a7;
    v17.size.height = a8;
    CGRectIntersection(v16, v17);
  }
}

double SBHNormalizedRectFromSubRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  double MinX = CGRectGetMinX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  double v20 = MinX / CGRectGetWidth(v22);
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  CGRectGetMinY(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGRectGetHeight(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetWidth(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetWidth(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetHeight(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  CGRectGetHeight(v28);
  return v20;
}

double SBHSubRectFromNormalizedRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  double MinX = CGRectGetMinX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  double v20 = MinX * CGRectGetWidth(v22);
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  CGRectGetMinY(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGRectGetHeight(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetWidth(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetWidth(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetHeight(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  CGRectGetHeight(v28);
  return v20;
}

double SBHPointScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double SBHPointVectorMake(double a1, double a2, double a3)
{
  return a3 - a1;
}

double SBHPointDotProduct(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double SBHPointCrossProduct(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return ((a3 - a1) * (a6 - a4) - (a4 - a2) * (a5 - a3)) * ((a3 - a1) * (a6 - a4) - (a4 - a2) * (a5 - a3));
}

double SBHNearestPointInLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a1 - a3;
  double v7 = a5 - a3;
  double v8 = ((a2 - a4) * (a6 - a4) + v6 * v7) / (v7 * v7 + (a6 - a4) * (a6 - a4));
  double v9 = 0.0;
  if (v8 >= 0.0)
  {
    double v9 = v8;
    if (v8 > 1.0) {
      double v9 = 1.0;
    }
  }
  return a3 + v7 * v9;
}

double SBHPointAtDistanceFromPointToPoint(double a1, double a2, double a3, double a4, double a5)
{
  UIDistanceBetweenPoints();
  return a1 - (a1 - a3) * a5 / v8;
}

uint64_t SBHPolygonContainsPoint(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (a2)
  {
    uint64_t v4 = 0;
    char v5 = 0;
    uint64_t v6 = a2 - 1;
    double v7 = (double *)(a1 + 8);
    do
    {
      double v8 = *v7;
      double v9 = *(double *)(a1 + 16 * v6 + 8);
      BOOL v10 = *v7 <= a4 && a4 < v9;
      if (v10 || (a4 < v8 ? (BOOL v11 = v9 > a4) : (BOOL v11 = 1), !v11))
      {
        if (a3 < *(v7 - 1) + (a4 - v8) * (*(double *)(a1 + 16 * v6) - *(v7 - 1)) / (v9 - v8)) {
          v5 ^= 1u;
        }
      }
      uint64_t v6 = v4++;
      v7 += 2;
      --a2;
    }
    while (a2);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

double SBHPolygonNearestPointToPoint(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char v8 = SBHPolygonContainsPoint(a1, a2, a3, a4);
  if (!a2 || (v8 & 1) != 0) {
    return a3;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a2 - 1;
  BOOL v11 = (double *)(a1 + 8);
  double v12 = 0.0;
  double v13 = a3;
  do
  {
    double v14 = *(v11 - 1);
    double v15 = *v11;
    if (v10) {
      uint64_t v16 = v9 + 1;
    }
    else {
      uint64_t v16 = 0;
    }
    CGRect v17 = (double *)(a1 + 16 * v16);
    double v18 = *v17 - v14;
    double v19 = v17[1] - v15;
    double v20 = v19 * v19 + v18 * v18;
    double v21 = ((a4 - v15) * v19 + (a3 - v14) * v18) / v20;
    double v22 = 0.0;
    if (v21 >= 0.0)
    {
      double v22 = ((a4 - v15) * v19 + (a3 - v14) * v18) / v20;
      if (v21 > 1.0) {
        double v22 = 1.0;
      }
    }
    uint64_t v23 = v9 + 1;
    double v24 = v14 + v18 * v22;
    UIDistanceBetweenPoints();
    if (v25 < v12 || v9 == 0)
    {
      double v13 = v24;
      double v12 = v25;
    }
    --v10;
    v11 += 2;
    ++v9;
  }
  while (v23 != a2);
  return v13;
}

uint64_t SBHPolygonFindConvexHullPoints(const void *a1, size_t count, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (count < 0xB)
  {
    uint64_t v6 = 0;
    double v7 = (double *)&v16;
  }
  else
  {
    uint64_t v6 = (double *)malloc_type_calloc(count, 0x10uLL, 0x1000040451B5BE8uLL);
    double v7 = v6;
  }
  memmove(v7, a1, 16 * count);
  CFMergeSortArray();
  uint64_t v8 = 0;
  size_t v9 = 0;
  do
  {
    uint64_t v10 = &v7[2 * v9];
    *(_OWORD *)(a3 + 16 * v8) = *(_OWORD *)v10;
    size_t v9 = (v9 + 1) % count;
    size_t v11 = 0;
    double v12 = *v10;
    double v13 = v10[1];
    double v14 = v7 + 1;
    do
    {
      if ((uint64_t)((*v14 - v13) * (v7[2 * v9] - *(v14 - 1)) - (*(v14 - 1) - v12) * (v7[2 * v9 + 1] - *v14)) < 0) {
        size_t v9 = v11;
      }
      ++v11;
      v14 += 2;
    }
    while (count != v11);
    ++v8;
  }
  while (v9);
  free(v6);
  return v8;
}

uint64_t comparePointX(double *a1, double *a2)
{
  return MEMORY[0x1F410C1A0](*a1, *a2);
}

double SBHPolygonCreateRectangleFromLine(double *a1, double a2, double a3, double a4, double a5, double a6)
{
  char v12 = BSFloatApproximatelyEqualToFloat();
  double v13 = 0.0;
  if (v12)
  {
    double v14 = a6;
  }
  else
  {
    char v15 = BSFloatApproximatelyEqualToFloat();
    double v14 = 0.0;
    if (v15)
    {
      double v13 = a6;
    }
    else
    {
      double v16 = atan((a5 - a3) / (a4 - a2));
      __double2 v17 = __sincos_stret(v16);
      double v14 = v17.__cosval * a6;
      double v13 = v17.__sinval * a6;
    }
  }
  *a1 = a2 + v14;
  a1[1] = a3 - v13;
  a1[2] = a4 + v14;
  a1[3] = a5 - v13;
  a1[4] = a4 - v14;
  a1[5] = a5 + v13;
  double result = a3 + v13;
  a1[6] = a2 - v14;
  a1[7] = result;
  return result;
}

void sub_1D804D4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8050A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D805132C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1D8051FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8054A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCCUICAPackageDescriptionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CCUICAPackageDescription");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCCUICAPackageDescriptionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCCUICAPackageDescriptionClass_block_invoke_cold_1();
    ControlCenterUIKitLibrary();
  }
}

void ControlCenterUIKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ControlCenterUIKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ControlCenterUIKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6AB0838;
    uint64_t v3 = 0;
    ControlCenterUIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!ControlCenterUIKitLibraryCore_frameworkLibrary_0)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ControlCenterUIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ControlCenterUIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

SBHIconGridSizeClassSet *__getCCUILabeledRoundButtonViewControllerClass_block_invoke(uint64_t a1)
{
  ControlCenterUIKitLibrary();
  uint64_t result = (SBHIconGridSizeClassSet *)objc_getClass("CCUILabeledRoundButtonViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCCUILabeledRoundButtonViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getCCUILabeledRoundButtonViewControllerClass_block_invoke_cold_1();
    return +[SBHIconGridSizeClassSet allocWithZone:v5];
  }
  return result;
}

id getCNMonogrammerClass()
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getCNMonogrammerClass_softClass;
  uint64_t v7 = getCNMonogrammerClass_softClass;
  if (!getCNMonogrammerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNMonogrammerClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getCNMonogrammerClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D805A888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D805B1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNMonogrammerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ContactsUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6AB08C8;
    uint64_t v6 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!ContactsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CNMonogrammer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getCNMonogrammerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCNMonogrammerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

void __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNContactStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactStoreClass_block_invoke_cold_1();
    ContactsLibrary();
  }
}

void ContactsLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ContactsLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6AB08E0;
    uint64_t v3 = 0;
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ContactsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNMutableContactClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNMutableContact");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNMutableContactClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getCNMutableContactClass_block_invoke_cold_1();
    return (Class)+[SBHLibraryCategoryIdentifier categoryWithLocalizedDisplayName:v5 categoryID:v6 categoryIndex:v7];
  }
  return result;
}

void sub_1D805BEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void SBHScreenBounds(uint64_t a1)
{
  long long v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  switch(a1)
  {
    case 1:
      double v11 = 0.0;
      break;
    case 3:
      double v11 = 1.57079633;
      break;
    case 4:
      double v11 = -1.57079633;
      break;
    default:
      double v11 = 3.14159265;
      if (a1 != 2) {
        double v11 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&v12, v11);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGRectApplyAffineTransform(v13, &v12);
}

void __SBHBundle_block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x1E4F28B50];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleForClass:v3];
  long long v2 = (void *)SBHBundle___springBoardHomeBundle;
  SBHBundle___springBoardHomeBundle = v1;
}

id SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice()
{
  if (SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_onceToken != -1) {
    dispatch_once(&SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = _Block_copy((const void *)SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_handler);
  return v0;
}

void __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke()
{
  double v0 = __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_2();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_3;
  aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&aBlock[4] = v0;
  uint64_t v1 = _Block_copy(aBlock);
  long long v2 = (void *)SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_handler;
  SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_handler = (uint64_t)v1;
}

double __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_2()
{
  double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  double result = 0.25;
  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 0.25);
    uint64_t v4 = objc_msgSend(v3, "sbf_homescreenBlurGraphicsQuality");

    double result = 0.25;
    if (v4 == 100) {
      return 0.5;
    }
  }
  return result;
}

double __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_3(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) / a2;
}

void sub_1D8064ED8(_Unwind_Exception *a1)
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

void sub_1D806735C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8069ED4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D806B5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1D806D640(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D806F2AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SBHStringForIconCoordinate(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"(%ld,%ld)", a1, a2);
}

void sub_1D80748C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8074D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8076B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
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

void sub_1D807BA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D807D05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBIconViewQueryingFirstIconViewForIcon(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__12;
  double v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBIconViewQueryingFirstIconViewForIcon_block_invoke;
  v15[3] = &unk_1E6AB1460;
  uint64_t v18 = &v20;
  id v16 = v5;
  id v17 = v6;
  uint64_t v19 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __SBIconViewQueryingFirstIconViewForIcon_block_invoke_2;
  v11[3] = &unk_1E6AB1488;
  uint64_t v14 = &v20;
  id v7 = v16;
  id v12 = v7;
  id v8 = v17;
  id v13 = v8;
  SBIconViewQueryingOptionalMethodImplementation(v7, a3, (uint64_t)sel_firstIconViewForIcon_options_, v15, v11);
  id v9 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v9;
}

void sub_1D8081404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

BOOL __SBIconViewQueryingFirstIconViewForIcon_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) firstIconViewForIcon:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

void __SBIconViewQueryingFirstIconViewForIcon_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) firstIconViewForIcon:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id SBIconViewQueryingFirstIconViewForIconPassingTest(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__12;
  double v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __SBIconViewQueryingFirstIconViewForIconPassingTest_block_invoke;
  v12[3] = &unk_1E6AB14B0;
  char v15 = &v17;
  id v7 = v5;
  id v13 = v7;
  uint64_t v16 = a2;
  id v8 = v6;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __SBIconViewQueryingFirstIconViewForIconPassingTest_block_invoke_2;
  v11[3] = &unk_1E6AAD648;
  void v11[4] = &v17;
  SBIconViewQueryingOptionalMethodImplementation(v7, a2, (uint64_t)sel_firstIconViewWithOptions_iconPassingTest_, v12, v11);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void sub_1D8081684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __SBIconViewQueryingFirstIconViewForIconPassingTest_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) firstIconViewWithOptions:*(void *)(a1 + 56) iconPassingTest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

void __SBIconViewQueryingFirstIconViewForIconPassingTest_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __SBIconViewQueryingIconViewForIconInLocation_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40) location:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __SBIconViewQueryingBestIconViewForIcon_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 applicationBundleID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t SBIconViewQueryingDisplayingIcon(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBIconViewQueryingDisplayingIcon_block_invoke;
  v15[3] = &unk_1E6AB1460;
  uint64_t v18 = &v20;
  id v16 = v5;
  id v17 = v6;
  uint64_t v19 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __SBIconViewQueryingDisplayingIcon_block_invoke_2;
  v11[3] = &unk_1E6AB1488;
  id v14 = &v20;
  id v7 = v16;
  id v12 = v7;
  id v8 = v17;
  id v13 = v8;
  SBIconViewQueryingOptionalMethodImplementation(v7, a3, (uint64_t)sel_isDisplayingIcon_options_, v15, v11);
  uint64_t v9 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void sub_1D8081928(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __SBIconViewQueryingDisplayingIcon_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) isDisplayingIcon:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __SBIconViewQueryingDisplayingIcon_block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDisplayingIcon:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t SBIconViewQueryingDisplayingIconInLocation(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v26 = 0;
  CGRect v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __SBIconViewQueryingDisplayingIconInLocation_block_invoke;
  v20[3] = &unk_1E6AB14D8;
  double v24 = &v26;
  id v21 = v7;
  id v22 = v8;
  id v23 = v9;
  uint64_t v25 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __SBIconViewQueryingDisplayingIconInLocation_block_invoke_2;
  v15[3] = &unk_1E6AB1500;
  uint64_t v19 = &v26;
  id v10 = v21;
  id v16 = v10;
  id v11 = v22;
  id v17 = v11;
  id v12 = v23;
  id v18 = v12;
  SBIconViewQueryingOptionalMethodImplementation(v10, a4, (uint64_t)sel_isDisplayingIcon_inLocation_options_, v20, v15);
  uint64_t v13 = *((unsigned __int8 *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v13;
}

void sub_1D8081B88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __SBIconViewQueryingDisplayingIconInLocation_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) isDisplayingIcon:*(void *)(a1 + 40) inLocation:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

uint64_t __SBIconViewQueryingDisplayingIconInLocation_block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDisplayingIcon:*(void *)(a1 + 40) inLocation:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __SBIconViewQueryingDisplayingIconView_block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDisplayingIconView:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_1D8083F84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void getRootMetrics(unint64_t a1, char a2, uint64_t a3)
{
  v53[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a2 & 0x18;
  BOOL v7 = v6 != 0;
  switch(a1)
  {
    case 0uLL:
      int v8 = 0;
      uint64_t v9 = 0;
      uint64_t v12 = 0;
      uint64_t v10 = 8u;
      uint64_t v11 = 0x28u;
      break;
    case 1uLL:
      int v8 = 0;
      uint64_t v9 = 0x90u;
      uint64_t v10 = 0x98u;
      uint64_t v11 = 0xB8u;
      uint64_t v12 = v9;
      break;
    case 2uLL:
      int v8 = 0;
      uint64_t v9 = 0x120u;
      uint64_t v10 = 0x128u;
      uint64_t v11 = 0x148u;
      uint64_t v12 = v9;
      break;
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x14uLL:
    case 0x18uLL:
    case 0x1CuLL:
      int v8 = 0;
      uint64_t v9 = 0x1B0u;
      uint64_t v10 = 0x1B8u;
      uint64_t v11 = 0x1D8u;
      uint64_t v12 = v9;
      break;
    case 4uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
    case 0x16uLL:
    case 0x1AuLL:
      int v8 = 0;
      uint64_t v9 = 0x240u;
      uint64_t v10 = 0x248u;
      uint64_t v11 = 0x268u;
      uint64_t v12 = v9;
      break;
    case 5uLL:
    case 7uLL:
      int v8 = 0;
      uint64_t v9 = 0x2D0u;
      uint64_t v10 = 0x2D8u;
      uint64_t v11 = 0x2F8u;
      uint64_t v12 = v9;
      break;
    case 0xBuLL:
    case 0x11uLL:
      int v8 = 0;
      uint64_t v9 = 0x360u;
      uint64_t v10 = 0x368u;
      uint64_t v11 = 0x388u;
      uint64_t v12 = v9;
      break;
    case 0xDuLL:
    case 0x13uLL:
      int v8 = 0;
      uint64_t v9 = 0x3F0u;
      uint64_t v10 = 0x3F8u;
      uint64_t v11 = 0x418u;
      uint64_t v12 = v9;
      break;
    case 0x15uLL:
      int v8 = 0;
      BOOL v7 = 0;
      BOOL v13 = v6 == 0;
      uint64_t v9 = 1152;
      uint64_t v14 = 1224;
      goto LABEL_17;
    case 0x17uLL:
      int v8 = 0;
      uint64_t v9 = 0x510u;
      uint64_t v10 = 0x518u;
      uint64_t v11 = 0x538u;
      uint64_t v12 = v9;
      break;
    case 0x19uLL:
      int v8 = 0;
      BOOL v7 = 0;
      BOOL v13 = v6 == 0;
      uint64_t v9 = 1440;
      uint64_t v14 = 1512;
LABEL_17:
      if (!v13) {
        uint64_t v9 = v14;
      }
      uint64_t v10 = v9 + 8;
      uint64_t v11 = v9 + 40;
      uint64_t v12 = v9;
      break;
    case 0x1BuLL:
      int v8 = 0;
      uint64_t v9 = 0x630u;
      uint64_t v10 = 0x638u;
      uint64_t v11 = 0x658u;
      uint64_t v12 = v9;
      break;
    case 0x1DuLL:
    case 0x29uLL:
      int v8 = 1;
      uint64_t v12 = 0x6C0u;
      uint64_t v9 = 0x708u;
      uint64_t v10 = 0x710u;
      uint64_t v11 = 0x730u;
      break;
    case 0x1EuLL:
      int v8 = 1;
      uint64_t v12 = 0x7E0u;
      uint64_t v9 = 0x828u;
      uint64_t v10 = 0x830u;
      uint64_t v11 = 0x850u;
      break;
    case 0x1FuLL:
      int v8 = 1;
      uint64_t v12 = 0x900u;
      uint64_t v9 = 0x948u;
      uint64_t v10 = 0x950u;
      uint64_t v11 = 0x970u;
      break;
    case 0x20uLL:
      int v8 = 1;
      uint64_t v12 = 0xA20u;
      uint64_t v9 = 0xA68u;
      uint64_t v10 = 0xA70u;
      uint64_t v11 = 0xA90u;
      break;
    case 0x21uLL:
    case 0x28uLL:
      int v8 = 1;
      uint64_t v12 = 0xB40u;
      uint64_t v9 = 0xB88u;
      uint64_t v10 = 0xB90u;
      uint64_t v11 = 0xBB0u;
      break;
    case 0x22uLL:
      int v8 = 1;
      uint64_t v12 = 0x10E0u;
      uint64_t v9 = 0x1128u;
      uint64_t v10 = 0x1130u;
      uint64_t v11 = 0x1150u;
      break;
    case 0x23uLL:
    case 0x24uLL:
      int v8 = 1;
      uint64_t v12 = 0xC60u;
      uint64_t v9 = 0xCA8u;
      uint64_t v10 = 0xCB0u;
      uint64_t v11 = 0xCD0u;
      break;
    case 0x25uLL:
      int v8 = 1;
      uint64_t v12 = 0xD80u;
      uint64_t v9 = 0xDC8u;
      uint64_t v10 = 0xDD0u;
      uint64_t v11 = 0xDF0u;
      break;
    case 0x26uLL:
      int v8 = 1;
      uint64_t v12 = 0xEA0u;
      uint64_t v9 = 0xEE8u;
      uint64_t v10 = 0xEF0u;
      uint64_t v11 = 0xF10u;
      break;
    case 0x27uLL:
      int v8 = 1;
      uint64_t v12 = 0xFC0u;
      uint64_t v9 = 0x1008u;
      uint64_t v10 = 0x1010u;
      uint64_t v11 = 0x1030u;
      break;
    case 0x2AuLL:
      int v8 = 1;
      uint64_t v12 = 0x1200u;
      uint64_t v9 = 0x1248u;
      uint64_t v10 = 0x1250u;
      uint64_t v11 = 0x1270u;
      break;
    case 0x2BuLL:
      int v8 = 1;
      uint64_t v12 = 0x1320u;
      uint64_t v9 = 0x1368u;
      uint64_t v10 = 0x1370u;
      uint64_t v11 = 0x1390u;
      break;
    case 0x2CuLL:
      int v8 = 1;
      uint64_t v12 = 0x1440u;
      uint64_t v9 = 0x1488u;
      uint64_t v10 = 0x1490u;
      uint64_t v11 = 0x14B0u;
      break;
    case 0x2DuLL:
      int v8 = 1;
      uint64_t v12 = 0x1680u;
      uint64_t v9 = 0x16C8u;
      uint64_t v10 = 0x16D0u;
      uint64_t v11 = 0x16F0u;
      break;
    case 0x2EuLL:
      int v8 = 1;
      uint64_t v12 = 0x1560u;
      uint64_t v9 = 0x15A8u;
      uint64_t v10 = 0x15B0u;
      uint64_t v11 = 0x15D0u;
      break;
    case 0x2FuLL:
      int v8 = 1;
      uint64_t v12 = 0x17A0u;
      uint64_t v9 = 0x17E8u;
      uint64_t v10 = 0x17F0u;
      uint64_t v11 = 0x1810u;
      break;
    default:
      int v8 = 0;
      BOOL v7 = 0;
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      uint64_t v12 = 0;
      break;
  }
  char v15 = (long long *)((char *)&defaultRootMetrics + v10);
  id v16 = (long long *)((char *)&defaultRootMetrics + v11);
  *(_DWORD *)a3 = *(_DWORD *)((char *)&defaultRootMetrics + v12);
  long long v17 = *v15;
  *(_OWORD *)(a3 + 24) = v15[1];
  *(_OWORD *)(a3 + _Block_object_dispose(&STACK[0x228], 8) = v17;
  long long v18 = *v16;
  *(_OWORD *)(a3 + 56) = v16[1];
  *(_OWORD *)(a3 + 40) = v18;
  *(_DWORD *)(a3 + 72) = *(_DWORD *)((char *)&defaultRootMetrics + v9);
  long long v19 = v15[1];
  *(_OWORD *)(a3 + 80) = *v15;
  *(_OWORD *)(a3 + 96) = v19;
  long long v20 = v16[1];
  *(_OWORD *)(a3 + 112) = *v16;
  *(_OWORD *)(a3 + 12_Block_object_dispose(&STACK[0x228], 8) = v20;
  if (SBHScreenTypeIsPad(a1))
  {
    id v21 = _SBHDefaultIconGridSizeClassIconImageInfos(a1, a2);
    [v21 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];

    SBHDefaultIconImageSize(a1, a2 & 0xE7);
    SBHDefaultIconImageSize(a1, a2 | 8);
    SBHGetScreenSpecification(a1, (uint64_t)&v52);
    if (v8)
    {
      SBFFloatCeilForScale();
      UIEdgeInsetsSubtract();
      *(void *)(a3 + _Block_object_dispose(&STACK[0x228], 8) = v22;
      *(void *)(a3 + 16) = v23;
      *(void *)(a3 + 24) = v24;
      *(void *)(a3 + 32) = v25;
    }
    if (v7)
    {
      SBFFloatCeilForScale();
      UIEdgeInsetsSubtract();
      *(void *)(a3 + _Block_object_dispose(&STACK[0x228], 8) = v26;
      *(void *)(a3 + 16) = v27;
      *(void *)(a3 + 24) = v28;
      *(void *)(a3 + 32) = v29;
      UIEdgeInsetsSubtract();
      *(void *)(a3 + 40) = v30;
      *(void *)(a3 + 4_Block_object_dispose(&STACK[0x228], 8) = v31;
      *(void *)(a3 + 56) = v32;
      *(void *)(a3 + 64) = v33;
      UIEdgeInsetsSubtract();
      *(void *)(a3 + 80) = v34;
      *(void *)(a3 + 8_Block_object_dispose(&STACK[0x228], 8) = v35;
      *(void *)(a3 + 96) = v36;
      *(void *)(a3 + 104) = v37;
      UIEdgeInsetsSubtract();
      *(void *)(a3 + 112) = v38;
      *(void *)(a3 + 120) = v39;
      *(void *)(a3 + 12_Block_object_dispose(&STACK[0x228], 8) = v40;
      *(void *)(a3 + 136) = v41;
    }
  }
  if (SBHScreenTypeIsPhone(a1) && (SBHScreenTypeHasHomeButton(a1) & 1) == 0)
  {
    v53[0] = a3 + 8;
    v53[1] = a3 + 80;
    double v42 = _SBHDefaultTopLayoutInsetAdjustment(a1, a2);
    uint64_t v43 = 0;
    char v44 = 1;
    do
    {
      char v45 = v44;
      uint64_t v46 = (double *)v53[v43];
      double v47 = v46[1];
      uint64_t v48 = objc_msgSend(MEMORY[0x1E4FB33B0], "sbh_displayEdgeInfoForScreenType:", a1);
      uint64_t v49 = [v48 safeAreaInsetsPortrait];
      [v49 topInset];
      double v51 = v42 + v47 + v50;

      char v44 = 0;
      v46[2] = v46[2] - (v51 - *v46);
      *uint64_t v46 = v51;
      uint64_t v43 = 1;
    }
    while ((v45 & 1) != 0);
  }
}

uint64_t SBHIconGridSizeClassToStackLayoutSize(void *a1)
{
  uint64_t v1 = SBHGetIconGridSizeClassInfoValue(a1, @"SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

id SBHStackLayoutSizeToIconGridSizeClass(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __SBHStackLayoutSizeToIconGridSizeClass_block_invoke;
  v3[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v3[4] = a1;
  uint64_t v1 = SBHGetIconGridSizeClassPassingTest(v3);
  return v1;
}

BOOL __SBHStackLayoutSizeToIconGridSizeClass_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:@"SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize"];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

uint64_t PosterUIFoundationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PosterUIFoundationLibraryCore_frameworkLibrary;
  uint64_t v5 = PosterUIFoundationLibraryCore_frameworkLibrary;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E6AB1678;
    long long v7 = *(_OWORD *)&off_1E6AB1688;
    v3[3] = _sl_dlopen();
    PosterUIFoundationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1D8087A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PosterUIFoundationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PosterUIFoundationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterUIFoundationLibrary()
{
  uint64_t v0 = PosterUIFoundationLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPUIMutableStylePickerConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIMutableStylePickerConfigurationClass_softClass;
  uint64_t v7 = getPUIMutableStylePickerConfigurationClass_softClass;
  if (!getPUIMutableStylePickerConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIMutableStylePickerConfigurationClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getPUIMutableStylePickerConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8087C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIMutableStylePickerConfigurationClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIMutableStylePickerConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPUIMutableStylePickerConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPUIMutableStylePickerConfigurationClass_block_invoke_cold_1();
    return (Class)getPUIStylePickerComponentsClass(v3);
  }
  return result;
}

id getPUIStylePickerComponentsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIStylePickerComponentsClass_softClass;
  uint64_t v7 = getPUIStylePickerComponentsClass_softClass;
  if (!getPUIStylePickerComponentsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIStylePickerComponentsClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getPUIStylePickerComponentsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8087D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIStylePickerComponentsClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIStylePickerComponents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPUIStylePickerComponentsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPUIStylePickerComponentsClass_block_invoke_cold_1();
    return (Class)getPUIStylePickerHomeScreenConfigurationClass();
  }
  return result;
}

id getPUIStylePickerHomeScreenConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIStylePickerHomeScreenConfigurationClass_softClass;
  uint64_t v7 = getPUIStylePickerHomeScreenConfigurationClass_softClass;
  if (!getPUIStylePickerHomeScreenConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIStylePickerHomeScreenConfigurationClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getPUIStylePickerHomeScreenConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8087E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIStylePickerHomeScreenConfigurationClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIStylePickerHomeScreenConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPUIStylePickerHomeScreenConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPUIStylePickerHomeScreenConfigurationClass_block_invoke_cold_1();
    return (Class)getPUIMutableStylePickerHomeScreenConfigurationClass(v3);
  }
  return result;
}

id getPUIMutableStylePickerHomeScreenConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  uint64_t v7 = getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  if (!getPUIMutableStylePickerHomeScreenConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8087FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIMutableStylePickerHomeScreenConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPUIMutableStylePickerHomeScreenConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  }
  else
  {
    uint64_t v3 = __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1();
    return (Class)getPUIStylePickerViewControllerClass(v3);
  }
  return result;
}

id getPUIStylePickerViewControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIStylePickerViewControllerClass_softClass;
  uint64_t v7 = getPUIStylePickerViewControllerClass_softClass;
  if (!getPUIStylePickerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIStylePickerViewControllerClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getPUIStylePickerViewControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8088100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIStylePickerViewControllerClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIStylePickerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPUIStylePickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPUIStylePickerViewControllerClass_block_invoke_cold_1();
    return (Class)getPUIGradientViewClass(v3);
  }
  return result;
}

id getPUIGradientViewClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIGradientViewClass_softClass;
  uint64_t v7 = getPUIGradientViewClass_softClass;
  if (!getPUIGradientViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIGradientViewClass_block_invoke;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getPUIGradientViewClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D808823C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIGradientViewClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIGradientView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPUIGradientViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPUIGradientViewClass_block_invoke_cold_1();
    return (Class)_SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(v3);
  }
  return result;
}

id _SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    id v1 = (id *)MEMORY[0x1E4FA6160];
  }
  else {
    id v1 = (id *)qword_1E6AB16C0[a1 - 1];
  }
  return *v1;
}

uint64_t _PUIHomeScreenStyleTypeFromSBIconUserInterfaceStyleType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4FA6168]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA6170]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA6158]])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void SBHHomeScreenDefaultsSetPUIStylePickerHomeScreenConfiguration(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Updating home screen configuration: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "sbh_setHomeScreenConfiguration:", v3);
  uint64_t v6 = SBLogIcon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Updated home screen configuration: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

id SBHIconImageStyleConfigurationFromUserDefaults(void *a1)
{
  id v1 = objc_msgSend(a1, "sbh_homeScreenConfiguration");
  if (v1)
  {
    uint64_t v2 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void SBHHomeScreenDefaultsSetIconImageStyleConfiguration(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 homeScreenConfiguration];
  objc_msgSend(v3, "sbh_setHomeScreenConfiguration:", v4);
}

id SBHHomeScreenDefaultsIconTintColor(void *a1)
{
  id v1 = objc_msgSend(a1, "sbh_homeScreenConfiguration");
  if ([v1 styleType] == 3)
  {
    uint64_t v2 = [v1 accentColor];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void SBHHomeScreenDefaultsSetIconTintColor(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc_init((Class)getPUIMutableStylePickerHomeScreenConfigurationClass());
  id v7 = v5;
  if (v3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  [v5 setStyleType:v6];
  [v7 setAccentColor:v3];

  SBHHomeScreenDefaultsSetPUIStylePickerHomeScreenConfiguration(v4, v7);
}

void sub_1D8088B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
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

void sub_1D808BDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1D808CB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D808CE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D808D2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D808E214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t _SBIconListIsCoordinateValidForGridSize(uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5)
{
  unint64_t v5 = a1 - 1;
  unint64_t v6 = a1 - 1 + (unsigned __int16)a3;
  if ((a3 & 0xFFFE) != 0 && v6 <= (unsigned __int16)a4)
  {
    if ((a5 & 2) == 0
      && a1 != 1
      && (unsigned __int16)a4 - (unint64_t)(unsigned __int16)a3 != v5
      && v5 % (unsigned __int16)a3)
    {
      return 0;
    }
  }
  else if (v6 > (unsigned __int16)a4)
  {
    return 0;
  }
  return (a2 - 1 + (unint64_t)HIWORD(a3) <= HIWORD(a4)) & ((((a2 - 1) & 1) == 0) | ((a3 & 0xFFFE0000) == 0) | a5);
}

void sub_1D808F56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D808FA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

void sub_1D8090070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D8091580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

void sub_1D8093518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_1D80936D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80939B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8094280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8096024(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D8098410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D809860C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D8099370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1D809AB80(_Unwind_Exception *a1)
{
}

void sub_1D809B3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D809CFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D809E374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D809E50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D809E774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D809E9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1D809EEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 176), 8);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D80A0FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80A29B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _SBIconListIsColumnValidForGridSize(unint64_t a1, unint64_t a2, unsigned __int16 a3, char a4)
{
  unint64_t v5 = a1 + a3;
  BOOL result = v5 <= a2;
  if ((a3 & 0xFFFE) != 0 && v5 <= a2)
  {
    BOOL result = 1;
    if ((a4 & 2) == 0)
    {
      if (a1)
      {
        if (a2 - a3 != a1) {
          return a1 % a3 == 0;
        }
      }
    }
  }
  return result;
}

uint64_t _SBIconListIsRowValidForGridSize(uint64_t a1, int a2, int a3, unsigned int a4)
{
  return (a1 + (unint64_t)HIWORD(a2) <= HIWORD(a3)) & (((a1 & 1) == 0) | ((a2 & 0xFFFE0000) == 0) | a4);
}

void sub_1D80A5084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80A5610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

BOOL tapInsideView(void *a1, void *a2)
{
  id v3 = a2;
  [a1 locationInView:v3];
  BOOL v6 = 0;
  if (v4 >= 0.0)
  {
    double v7 = v5;
    if (v5 >= 0.0)
    {
      double v8 = v4;
      [v3 bounds];
      if (v8 <= v9)
      {
        [v3 bounds];
        BOOL v6 = v7 <= v10;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

void sub_1D80B2E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBHGetApplicationIconImage(void *a1, char a2, double a3, double a4, double a5)
{
  id v9 = a1;
  double v10 = +[SBHIconImageAppearance defaultAppearance];
  uint64_t v11 = SBHGetApplicationIconImageWithImageAppearance(v9, v10, a2, a3, a4, a5);

  return v11;
}

id SBHGetApplicationIconImageWithImageAppearance(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F6F248];
  id v13 = a2;
  uint64_t v14 = (void *)[[v12 alloc] initWithBundleIdentifier:v11];
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a4, a5, a6);
  SBHModifyImageDescriptorWithImageAppearance(v15, v13, a3);

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v16 = SBLogIconImageCache();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138413058;
      id v24 = v11;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 2048;
      double v28 = a5;
      __int16 v29 = 1024;
      int v30 = [v15 shouldApplyMask];
      _os_log_debug_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEBUG, "Main thread load of icon image for app %@ of size %fx%f, masked: %{BOOL}u", (uint8_t *)&v23, 0x26u);
    }
  }
  uint64_t v17 = [v14 prepareImageForDescriptor:v15];
  long long v18 = v17;
  if (v17)
  {
    long long v19 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v20 = [v17 CGImage];
    [v18 scale];
    id v21 = objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void SBHModifyImageDescriptorWithImageAppearance(void *a1, void *a2, char a3)
{
  id v13 = a1;
  id v5 = a2;
  uint64_t v6 = [v5 appearanceType];
  if (v6 == 3)
  {
    [v13 setBackground:1];
    double v8 = v13;
    uint64_t v7 = 2;
    goto LABEL_5;
  }
  if (v6 != 2)
  {
    uint64_t v7 = v6 == 1;
    double v8 = v13;
LABEL_5:
    [v8 setAppearance:v7];
    goto LABEL_6;
  }
  id v9 = [v5 tintColor];
  [v13 setAppearance:2];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F6F1C8]);
    id v11 = v9;
    uint64_t v12 = objc_msgSend(v10, "initWithCGColor:", objc_msgSend(v11, "CGColor"));
    [v13 setTintColor:v12];
  }
LABEL_6:
  [v13 setShouldApplyMask:(a3 & 1) == 0];
}

id SBHIconServicesAddDebugImageOverlayWithImageAppearance(void *a1)
{
  id v1 = a1;
  return v1;
}

id SBHImageDescriptorWithTraitCollection(void *a1, char a2, double a3, double a4, double a5)
{
  id v9 = (objc_class *)MEMORY[0x1E4F6F258];
  id v10 = a1;
  id v11 = objc_msgSend([v9 alloc], "initWithSize:scale:", a3, a4, a5);
  SBHModifyImageDescriptorWithTraitCollection(v11, (uint64_t)v10, a2);

  return v11;
}

void SBHModifyImageDescriptorWithTraitCollection(void *a1, uint64_t a2, char a3)
{
  id v5 = (void *)MEMORY[0x1E4FB1E20];
  id v6 = a1;
  objc_msgSend(v5, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  SBHModifyImageDescriptorWithImageAppearance(v6, v7, a3);
}

id SBHGetApplicationIconImageWithTraitCollection(void *a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  id v11 = (void *)MEMORY[0x1E4FB1E20];
  id v12 = a1;
  id v13 = objc_msgSend(v11, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  uint64_t v14 = SBHGetApplicationIconImageWithImageAppearance(v12, v13, a3, a4, a5, a6);

  return v14;
}

id SBHGetApplicationIconLayer(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = +[SBHIconImageAppearance defaultAppearance];
  id v13 = SBHGetApplicationIconLayerWithImageAppearance(v11, v12, a2, a3, a4, a5, a6);

  return v13;
}

id SBHGetApplicationIconLayerWithImageAppearance(void *a1, void *a2, char a3, double a4, double a5, double a6, double a7)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  uint64_t v14 = (objc_class *)MEMORY[0x1E4F6F248];
  id v15 = a2;
  uint64_t v16 = (void *)[[v14 alloc] initWithBundleIdentifier:v13];
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a4, a5, a6);
  SBHModifyImageDescriptorWithImageAppearance(v17, v15, a3);

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    long long v18 = SBLogIconImageCache();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v30 = 138413058;
      id v31 = v13;
      __int16 v32 = 2048;
      double v33 = a4;
      __int16 v34 = 2048;
      double v35 = a5;
      __int16 v36 = 1024;
      int v37 = [v17 shouldApplyMask];
      _os_log_debug_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEBUG, "Main thread load of icon layer for app %@ of size %fx%f, masked: %{BOOL}u", (uint8_t *)&v30, 0x26u);
    }
  }
  long long v19 = [v16 prepareImageForDescriptor:v17];
  id v20 = [v19 CALayer];
  if (!v20)
  {
    if (v19)
    {
      id v21 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v22 = [v19 CGImage];
      [v19 scale];
      int v23 = objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 0);
      id v24 = v23;
      if (v23)
      {
        [v23 size];
        double v26 = v25;
        double v28 = v27;
        id v20 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
        objc_msgSend(v20, "setBounds:", 0.0, 0.0, v26, v28);
        id v24 = v24;
        objc_msgSend(v20, "setContents:", objc_msgSend(v24, "CGImage"));
        if ([v17 shouldApplyMask])
        {
          [v20 setCornerRadius:a7];
          [v20 setCornerCurve:*MEMORY[0x1E4F39EA8]];
        }
        goto LABEL_12;
      }
    }
    else
    {
      id v24 = 0;
    }
    id v20 = 0;
LABEL_12:
  }
  return v20;
}

id SBHGetApplicationIconLayerWithTraitCollection(void *a1, uint64_t a2, char a3, double a4, double a5, double a6, double a7)
{
  id v13 = (void *)MEMORY[0x1E4FB1E20];
  id v14 = a1;
  id v15 = objc_msgSend(v13, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  uint64_t v16 = SBHGetApplicationIconLayerWithImageAppearance(v14, v15, a3, a4, a5, a6, a7);

  return v16;
}

id SBHTintedImageFromTintableImage(void *a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [v4 scale];
  double v10 = v9;
  id v11 = objc_alloc(MEMORY[0x1E4F6F1E8]);
  id v12 = v4;
  uint64_t v13 = [v12 CGImage];

  id v14 = (void *)[v11 initWithCGImage:v13 scale:v10];
  id v15 = objc_alloc(MEMORY[0x1E4F6F248]);
  v26[0] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  uint64_t v17 = (void *)[v15 initWithImages:v16];

  long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v6, v8, v10);
  [v18 setAppearance:2];
  id v19 = objc_alloc(MEMORY[0x1E4F6F1C8]);
  id v20 = v3;
  uint64_t v21 = [v20 CGColor];

  uint64_t v22 = (void *)[v19 initWithCGColor:v21];
  [v18 setTintColor:v22];
  int v23 = [v17 prepareImageForDescriptor:v18];
  id v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:scale:orientation:", objc_msgSend(v23, "CGImage"), 0, v10);

  return v24;
}

void SBHCacheIconImagesForApplications(void *a1, char a2, double a3, double a4, double a5)
{
}

void SBHCacheIconImagesForApplicationsWithTraitCollection(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  uint64_t v13 = imageDescriptorsForCachingIconImagesForApplicationsWithTraitCollection(v11, (uint64_t)v12, a3, a4, a5, a6);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
        id v20 = (void *)MEMORY[0x1D9484600](v15);
        id v21 = objc_alloc(MEMORY[0x1E4F6F248]);
        uint64_t v22 = objc_msgSend(v21, "initWithBundleIdentifier:", v19, (void)v23);
        [v22 prepareImagesForImageDescriptors:v13];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v16 = v15;
    }
    while (v15);
  }
}

id imageDescriptorsForCachingIconImagesForApplicationsWithTraitCollection(void *a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  id v11 = (void *)MEMORY[0x1E4FB1E20];
  id v12 = a1;
  uint64_t v13 = objc_msgSend(v11, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  id v14 = imageDescriptorsForCachingIconImagesForApplicationsWithImageAppearance(v13, a3, a4, a5, a6);

  return v14;
}

void SBHCacheIconImagesForApplicationsWithImageAppearance(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  uint64_t v13 = imageDescriptorsForCachingIconImagesForApplicationsWithImageAppearance(v12, a3, a4, a5, a6);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
        id v20 = (void *)MEMORY[0x1D9484600](v15);
        id v21 = objc_alloc(MEMORY[0x1E4F6F248]);
        uint64_t v22 = objc_msgSend(v21, "initWithBundleIdentifier:", v19, (void)v23);
        [v22 prepareImagesForImageDescriptors:v13];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v16 = v15;
    }
    while (v15);
  }
}

id imageDescriptorsForCachingIconImagesForApplicationsWithImageAppearance(void *a1, char a2, double a3, double a4, double a5)
{
  id v9 = a1;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a2)
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a3, a4, a5);
    SBHModifyImageDescriptorWithImageAppearance(v11, v9, 0);
    [v10 addObject:v11];
  }
  if ((a2 & 2) != 0)
  {
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a3, a4, a5);
    SBHModifyImageDescriptorWithImageAppearance(v12, v9, 1);
    [v10 addObject:v12];
  }
  return v10;
}

uint64_t SBHHasCachedIconImagesForApplications(void *a1, char a2, double a3, double a4, double a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = imageDescriptorsForCachingIconImagesForApplicationsWithTraitCollection(v9, 0, a2, a3, a4, a5);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v9;
  uint64_t v28 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v12 = *(void *)v34;
    unint64_t v13 = 0x1E4F6F000uLL;
    uint64_t v27 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1D9484600]();
        uint64_t v17 = (void *)[objc_alloc(*(Class *)(v13 + 584)) initWithBundleIdentifier:v15];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v18 = v10;
        id v19 = v10;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v30;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v30 != v22) {
                objc_enumerationMutation(v19);
              }
              long long v24 = objc_msgSend(v17, "imageForDescriptor:", *(void *)(*((void *)&v29 + 1) + 8 * i), v27);

              if (!v24)
              {

                uint64_t v25 = 0;
                id v10 = v18;
                goto LABEL_19;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        ++v14;
        id v10 = v18;
        uint64_t v12 = v27;
        unint64_t v13 = 0x1E4F6F000;
      }
      while (v14 != v28);
      uint64_t v25 = 1;
      uint64_t v28 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v28);
  }
  else
  {
    uint64_t v25 = 1;
  }
LABEL_19:

  return v25;
}

uint64_t SBHIconServicesOptionsForImageOptions(int a1)
{
  return ~a1 & 1;
}

uint64_t SBHIconServicesCacheOptionsForImageOptions(char a1)
{
  if (a1) {
    return 1;
  }
  else {
    return 2;
  }
}

id SBHIconServicesAddDebugImageOverlayWithTraitCollection(void *a1)
{
  id v1 = a1;
  return v1;
}

double _SBScaleIconZoomAnimatorCameraPositionToScaleModelPointToTargetPoint(double a1, double a2, double a3, double a4, double a5)
{
  double result = 1.0;
  if (a5 > 1.0) {
    return -(a3 - a5 * a1) / (a5 + -1.0);
  }
  return result;
}

void sub_1D80B791C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 144));
  _Unwind_Resume(a1);
}

void sub_1D80B8A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIXUninstallOptionsClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("IXUninstallOptions");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIXUninstallOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIXUninstallOptionsClass_block_invoke_cold_1();
    InstallCoordinationLibrary();
  }
}

void InstallCoordinationLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!InstallCoordinationLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __InstallCoordinationLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6AB24D0;
    uint64_t v3 = 0;
    InstallCoordinationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!InstallCoordinationLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __InstallCoordinationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  InstallCoordinationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getIXAppInstallCoordinatorClass_block_invoke_0(uint64_t a1)
{
  InstallCoordinationLibrary();
  Class result = objc_getClass("IXAppInstallCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIXAppInstallCoordinatorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SBHFloatingDockVisualConfiguration *)__getIXAppInstallCoordinatorClass_block_invoke_cold_1();
    return (Class)[(SBHFloatingDockVisualConfiguration *)v3 copyWithZone:v5];
  }
  return result;
}

uint64_t SBHLibraryPresentationErrorForCode(uint64_t a1)
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHLibraryPresentationErrorDomain" code:a1 userInfo:MEMORY[0x1E4F1CC08]];
}

uint64_t SBHLibraryPresentationErrorForCodeWithInfo(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHLibraryPresentationErrorDomain" code:a1 userInfo:a2];
}

uint64_t SBSLibraryPodPresentationErrorCodeForErrorCode(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 9) {
    return 0;
  }
  return result;
}

id __BSSafeCast(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    if (objc_opt_isKindOfClass()) {
      SEL v4 = v3;
    }
    else {
      SEL v4 = 0;
    }
  }
  else
  {
    SEL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void sub_1D80C0F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1D80C110C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C12A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C1438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C1600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C1768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C18A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C19E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C1B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C1DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C1FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C21D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D80C23B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D80C424C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80C7D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D80C81B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D80C9368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D80CD284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CHSWidgetFamilyForSBHIconGridSizeClass(void *a1)
{
  uint64_t v1 = SBHGetIconGridSizeClassInfoValue(a1, @"SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

id SBHIconGridSizeClassForCHSWidgetFamily(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __SBHIconGridSizeClassForCHSWidgetFamily_block_invoke;
  v3[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v3[4] = a1;
  uint64_t v1 = SBHGetIconGridSizeClassPassingTest(v3);
  return v1;
}

BOOL __SBHIconGridSizeClassForCHSWidgetFamily_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

uint64_t SBHFilterKnownCHSWidgetFamilies(uint64_t a1)
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __SBHFilterKnownCHSWidgetFamilies_block_invoke;
  v4[3] = &unk_1E6AB2960;
  v4[4] = &v5;
  SBHEnumerateIconGridSizeClasses(v4);
  uint64_t v2 = v6[3] & a1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1D80CFBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SBHFilterKnownCHSWidgetFamilies_block_invoke(uint64_t a1, void *a2)
{
  SBHGetIconGridSizeClassInfoValue(a2, @"SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v4 integerValue];
  if (v3) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1 << v3;
  }
}

void sub_1D80CFE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D00CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D1C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D80D1F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D223C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D24D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D2A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D2DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D3168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D32BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D80D4528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBTreeNodeContainsDescendantIndexPath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  if ([v4 length])
  {
    unint64_t v6 = 0;
    uint64_t v7 = v5;
    while (1)
    {
      uint64_t v8 = [v7 children];
      unint64_t v9 = [v8 count];
      unint64_t v10 = [v4 indexAtPosition:v6];
      if (v10 >= v9) {
        break;
      }
      uint64_t v11 = [v8 objectAtIndex:v10];

      ++v6;
      uint64_t v7 = (void *)v11;
      if (v6 >= [v4 length])
      {
        uint64_t v12 = 1;
        uint64_t v7 = (void *)v11;
        goto LABEL_8;
      }
    }

    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
    uint64_t v7 = v5;
  }
LABEL_8:

  return v12;
}

id SBTreeNodeGetDescendantAtIndexPath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  unint64_t v6 = v5;
  if ([v4 length])
  {
    unint64_t v7 = 0;
    uint64_t v8 = v5;
    do
    {
      unint64_t v9 = [v8 children];
      unint64_t v10 = [v9 count];
      unint64_t v11 = [v4 indexAtPosition:v7];
      if (v11 >= v10)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Index %lu out of bounds for children array of length %lu", v11, v10);
        id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
        objc_exception_throw(v13);
      }
      unint64_t v6 = [v9 objectAtIndex:v11];

      ++v7;
      uint64_t v8 = v6;
    }
    while (v7 < [v4 length]);
  }

  return v6;
}

uint64_t SBTreeNodeIsDescendantOfTreeNode(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 parent];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      uint64_t v6 = [v5 isEqual:v3];
      if (v6) {
        break;
      }
      uint64_t v7 = [v5 parent];

      id v5 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id SBTreeNodeGetIndexPathForDescendantTreeNode(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqual:v4])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = v4;
    uint64_t v8 = [v7 parent];
    if (v8)
    {
      unint64_t v9 = (void *)v8;
      while (1)
      {
        unint64_t v10 = [v9 children];
        uint64_t v11 = [v10 indexOfObject:v7];

        uint64_t v12 = [NSNumber numberWithInteger:v11];
        [v6 addObject:v12];

        if ([v9 isEqual:v3]) {
          break;
        }
        id v13 = v9;

        unint64_t v9 = [v13 parent];

        id v7 = v13;
        if (!v9)
        {
          id v5 = 0;
          id v7 = v13;
          goto LABEL_16;
        }
      }
      id v14 = v6;
      size_t v15 = [v14 count];
      if (v15)
      {
        size_t v16 = v15;
        if (v15 >= 0x10)
        {
          uint64_t v17 = (char *)malloc_type_calloc(v15, 4uLL, 0x100004052888210uLL);
          uint64_t v18 = v17;
        }
        else
        {
          uint64_t v17 = 0;
          uint64_t v18 = &v21;
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = ___SBTreeNodeIndexPathFromReverseOfNSArray_block_invoke;
        v20[3] = &__block_descriptor_48_e25_v32__0__NSNumber_8Q16_B24l;
        void v20[4] = v18;
        v20[5] = v16;
        [v14 enumerateObjectsWithOptions:2 usingBlock:v20];
        id v5 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v18 length:v16];
        free(v17);
      }
      else
      {
        id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
      }
    }
    else
    {
      id v5 = 0;
    }
LABEL_16:
  }
  return v5;
}

void SBTreeNodeInformOfAncestryChange(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  [v1 ancestryDidChange];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = objc_msgSend(v1, "children", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        SBTreeNodeInformOfAncestryChange(*(void *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

id SBTreeNodeGetRootNode(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 parent];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = [v2 parent];
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4;

        uint64_t v4 = [v5 parent];
        uint64_t v3 = v5;
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = v3;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void SBTreeNodeSetParent(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 setParent:a2];
  SBTreeNodeInformOfAncestryChange(v3);
}

void SBIconLocationGroupAddLocation(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  uint64_t v4 = SBGetIconLocationGroups();
  uint64_t v5 = [v4 objectForKey:v8];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 addObject:v3];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithObject:v3];

    [v4 setObject:v7 forKey:v8];
    id v3 = (id)v7;
  }
}

__CFString *SBIconLocationSelectLocationWithWidgets(void *a1, int a2)
{
  id v3 = a1;
  int v4 = [(__CFString *)v3 isEqualToString:@"SBIconLocationRoot"];
  uint64_t v5 = @"SBIconLocationRootWithWidgets";
  if (!v4 || (a2 & 1) == 0)
  {
    if ([(__CFString *)v3 isEqualToString:@"SBIconLocationRootWithWidgets"] ^ 1 | a2) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = @"SBIconLocationRoot";
    }
  }
  uint64_t v6 = v5;

  return v6;
}

uint64_t SBHIconGridSizeGetArea(int a1)
{
  return HIWORD(a1) * (unsigned __int16)a1;
}

uint64_t SBHIconGridSizeGetPerimeter(unint64_t a1)
{
  return 2 * (unsigned __int16)a1 + ((a1 >> 15) & 0x1FFFE);
}

uint64_t SBHIconGridSizeGetSmallestDimension(uint64_t result)
{
  if ((unsigned __int16)result >= WORD1(result)) {
    return WORD1(result);
  }
  else {
    return (unsigned __int16)result;
  }
}

uint64_t SBHIconGridSizeGetLargestDimension(uint64_t result)
{
  if ((unsigned __int16)result <= WORD1(result)) {
    return WORD1(result);
  }
  else {
    return (unsigned __int16)result;
  }
}

BOOL SBHIconGridSizeIsPortrait(int a1)
{
  return HIWORD(a1) > (unsigned __int16)a1;
}

BOOL SBHIconGridSizeIsLandscape(int a1)
{
  return HIWORD(a1) < (unsigned __int16)a1;
}

uint64_t SBHIconGridSizeRotate(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1;
  return (v2 >> 16);
}

uint64_t SBHIconGridSizeRotateWithOptions(uint64_t result, char a2)
{
  HIDWORD(v3) = result;
  LODWORD(v3) = result;
  unsigned int v2 = v3 >> 16;
  if ((a2 & 2) != 0) {
    return v2;
  }
  else {
    return result;
  }
}

BOOL SBHIconGridSizeIsDefault(int a1)
{
  return a1 == 65537;
}

BOOL SBHIconGridSizeIsEmpty(int a1)
{
  return (a1 & 0xFFFF0000) == 0 || (unsigned __int16)a1 == 0;
}

BOOL SBHIconGridSizeContainsCellIndex(int a1, unint64_t a2)
{
  return HIWORD(a1) * (unint64_t)(unsigned __int16)a1 > a2;
}

id SBHStringForGridCellInfoOptions(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"ReversedOrder"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"RotatedGrid"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 addObject:@"AllowGaps"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v3 addObject:@"IconReordering"];
  if ((a1 & 0x10) != 0) {
LABEL_6:
  }
    [v3 addObject:@"FlippedGrid"];
LABEL_7:
  int v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

unint64_t SBHIconGridDistanceBetweenGridCellIndexes(unint64_t a1, unint64_t a2, unsigned __int16 a3)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v3 = a1 % a3 + 1;
  }
  if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v4 = a2 % a3 + 1;
  }
  return v4 - v3;
}

uint64_t SBHIconGridDistanceBetweenGridRanges(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  unsigned __int16 v6 = a4;
  SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  v12.i64[0] = 0;
  if ((_WORD)v11) {
    BOOL v13 = (v11 & 0xFFFF0000) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    unint64_t v14 = 0;
    int v15 = HIWORD(a2);
    uint64_t v16 = a1 + (unsigned __int16)a2 - 1;
    int v17 = a5;
    unint64_t v18 = v16 + (v15 - 1) * (unint64_t)a5;
    unint64_t v19 = a1 + v17 * (uint64_t)(v15 - 1);
    uint64_t v20 = a3 + v6 - 1;
    int64x2_t v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    do
    {
      int64x2_t v27 = v12;
      if (v14 >= 0xC) {
        unint64_t v21 = v19;
      }
      else {
        unint64_t v21 = v18;
      }
      if (v14 < 8) {
        unint64_t v21 = v16;
      }
      if (v14 >= 4) {
        unint64_t v22 = v21;
      }
      else {
        unint64_t v22 = a1;
      }
      if ((v14 & 3) != 0) {
        unint64_t v23 = v20;
      }
      else {
        unint64_t v23 = a3;
      }
      v24.i64[0] = SBHIconGridDistanceBetweenGridCellIndexes(v22, v23, a5);
      v24.i64[1] = v25;
      int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vabsq_s64(v27), (uint64x2_t)vabsq_s64(v24)), (int8x16_t)v24, (int8x16_t)v27);
      ++v14;
    }
    while (v14 != 16);
  }
  return v12.i64[0];
}

uint64_t SBHIconGridRangeIntersection(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 != 0x7FFFFFFFFFFFFFFFLL && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = a1 / a5;
    unint64_t v9 = a1 % a5;
    unint64_t v10 = a3 / a5;
    unint64_t v11 = a3 % a5;
    if (v9 + (unsigned __int16)a2 > v11)
    {
      unint64_t v12 = v11 + (unsigned __int16)a4;
      if (v12 > v9)
      {
        unint64_t v13 = v8 + HIWORD(a2);
        if (v13 > v10)
        {
          unint64_t v14 = v10 + HIWORD(a4);
          if (v14 > v8)
          {
            if (v9 <= v11) {
              unint64_t v9 = a3 % a5;
            }
            if (v8 > v10) {
              unint64_t v10 = v8;
            }
            return v9 + v10 * a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t SBHIconGridRangeMaxCellIndexOnRow(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  return a1 + a2 + a3 * a4;
}

unint64_t SBHIconGridRangeMaxCellIndex(uint64_t a1, int a2, unsigned __int16 a3)
{
  return a1 + (unsigned __int16)a2 + (HIWORD(a2) - 1) * (unint64_t)a3;
}

uint64_t SBHIconGridRangeMinCellIndexOnRow(uint64_t a1, uint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  return a1 + a3 * a4;
}

__CFString *SBStringForIconListDragHitRegion(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"inside"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"center"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 addObject:@"top"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 addObject:@"bottom"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  [v3 addObject:@"left"];
  if ((a1 & 0x20) != 0) {
LABEL_7:
  }
    [v3 addObject:@"right"];
LABEL_8:
  if ([v3 count])
  {
    unint64_t v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    unint64_t v4 = @"none";
  }

  return v4;
}

__CFString *SBHStringForIconListIconSpacingAxisMatchingBehavior(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E6AB2D50[a1];
  }
}

void SBHRegisterIconGridSizeClass(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[SBHIconGridSizeClassDomain globalDomain];
  [v5 registerIconGridSizeClass:v4 info:v3];
}

void SBHRegisterIconGridSizeClasses(void *a1)
{
  id v1 = a1;
  id v2 = +[SBHIconGridSizeClassDomain globalDomain];
  [v2 registerIconGridSizeClasses:v1];
}

id SBHGetIconGridSizeClassInfoValue(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[SBHIconGridSizeClassDomain globalDomain];
  unsigned __int16 v6 = [v5 infoValueForGridSizeClass:v4 forKey:v3];

  return v6;
}

id SBHGetIconGridSizeClassPassingTest(void *a1)
{
  id v1 = a1;
  id v2 = +[SBHIconGridSizeClassDomain globalDomain];
  id v3 = [v2 iconGridSizeClassPassingTest:v1];

  return v3;
}

id SBHStringForIconGridSizeClass(void *a1)
{
  id v1 = a1;
  id v2 = +[SBHIconGridSizeClassDomain globalDomain];
  id v3 = [v2 descriptionForGridSizeClass:v1];

  if (!v3) {
    id v3 = v1;
  }

  return v3;
}

id SBHShortStringForIconGridSizeClass(void *a1)
{
  id v1 = a1;
  id v2 = +[SBHIconGridSizeClassDomain globalDomain];
  id v3 = [v2 shortDescriptionForGridSizeClass:v1];

  return v3;
}

id SBHIconGridSizeClassForString(void *a1)
{
  id v1 = a1;
  id v2 = +[SBHIconGridSizeClassDomain globalDomain];
  id v3 = [v2 gridSizeClassForDescription:v1];

  return v3;
}

void SBHEnumerateIconGridSizeClasses(void *a1)
{
  id v1 = a1;
  id v2 = +[SBHIconGridSizeClassDomain globalDomain];
  [v2 enumerateGridSizeClassesUsingBlock:v1];
}

void SBHEnumerateFilteredIconGridSizeClasses(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[SBHIconGridSizeClassDomain globalDomain];
  [v5 enumerateGridSizeClassesFilteredBySet:v4 usingBlock:v3];
}

void SBHIconGridSizeClassGroupAddGridSizeClass(void *a1, void *a2)
{
  id v11 = a1;
  id v3 = a2;
  id v4 = (void *)SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups;
  if (!SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"SBHIconGridSizeClassGroupBuiltIn", @"SBHIconGridSizeClassGroupBuiltInNonDefault", 0);
    unsigned __int16 v6 = (void *)SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups;
    SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups = v5;

    id v4 = (void *)SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups;
  }
  if (([v4 containsObject:v11] & 1) == 0)
  {
    uint64_t v7 = SBGetGridSizeClassGroups();
    unint64_t v8 = [v7 objectForKey:v11];
    unint64_t v9 = v8;
    if (v8)
    {
      [v8 addObject:v3];
    }
    else
    {
      unint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:v3];
      [v7 setObject:v10 forKey:v11];
    }
  }
}

id SBGetGridSizeClassGroups()
{
  uint64_t v0 = (void *)SBGetGridSizeClassGroups_groups;
  if (!SBGetGridSizeClassGroups_groups)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v2 = (void *)SBGetGridSizeClassGroups_groups;
    SBGetGridSizeClassGroups_groups = (uint64_t)v1;

    id v3 = (void *)SBGetGridSizeClassGroups_groups;
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBHIconGridSizeClassDefault", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassExtraLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
    [v3 setObject:v4 forKey:@"SBHIconGridSizeClassGroupAll"];

    uint64_t v5 = (void *)SBGetGridSizeClassGroups_groups;
    unsigned __int16 v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassExtraLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
    [v5 setObject:v6 forKey:@"SBHIconGridSizeClassGroupAllNonDefault"];

    uint64_t v7 = (void *)SBGetGridSizeClassGroups_groups;
    unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBHIconGridSizeClassDefault", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassExtraLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
    [v7 setObject:v8 forKey:@"SBHIconGridSizeClassGroupBuiltIn"];

    unint64_t v9 = (void *)SBGetGridSizeClassGroups_groups;
    unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassExtraLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
    [v9 setObject:v10 forKey:@"SBHIconGridSizeClassGroupBuiltInNonDefault"];

    uint64_t v0 = (void *)SBGetGridSizeClassGroups_groups;
  }
  return v0;
}

uint64_t SBHIconGridSizeClassGroupContainsGridSizeClass(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = SBGetGridSizeClassGroups();
  unsigned __int16 v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 containsObject:v3];
  return v7;
}

id SBHIconGridSizeClassGroupGetSizeClasses(void *a1)
{
  id v1 = a1;
  id v2 = SBGetGridSizeClassGroups();
  id v3 = [v2 objectForKey:v1];

  id v4 = (void *)[v3 copy];
  return v4;
}

uint64_t SBHIconLocationIsAppPrediction(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (void *)getAPUIIconLocationAppPredictionsSymbolLoc_ptr;
  uint64_t v10 = getAPUIIconLocationAppPredictionsSymbolLoc_ptr;
  if (!getAPUIIconLocationAppPredictionsSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke;
    v6[3] = &unk_1E6AAD648;
    v6[4] = &v7;
    __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke((uint64_t)v6);
    id v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsAppPrediction_cold_1 = (_Unwind_Exception *)SBHIconLocationIsAppPrediction_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsAppPrediction_cold_1);
  }
  uint64_t v3 = [v1 isEqualToString:*v2];

  return v3;
}

id SBHIconGridRangeCellIndexes(uint64_t a1, int a2, unsigned __int16 a3)
{
  unsigned __int16 v6 = [MEMORY[0x1E4F28E60] indexSet];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __SBHIconGridRangeCellIndexes_block_invoke;
  v9[3] = &unk_1E6AB0430;
  id v7 = v6;
  id v10 = v7;
  SBHIconGridRangeEnumerateCellIndexes(a1, a2, a3, v9);

  return v7;
}

uint64_t __SBHIconGridRangeCellIndexes_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

void SBHIconGridRangeEnumerateSubranges(unint64_t a1, int a2, int a3, unsigned __int16 a4, char a5, void *a6)
{
  long long v29 = a6;
  unsigned int v30 = a3;
  if (a5) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = (unsigned __int16)a3;
  }
  if (a5) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = HIWORD(a3);
  }
  uint64_t v26 = v11;
  unint64_t v27 = HIWORD(a2);
  if (HIWORD(a2))
  {
    char v12 = a5;
    unint64_t v13 = (unsigned __int16)a2;
    uint64_t v25 = a5 & 6;
    int v14 = a3;
    int v15 = a2;
    unint64_t v28 = 0;
    uint64_t v24 = (unsigned __int16)a2 - 1;
    while (!v13)
    {
LABEL_24:
      v28 += v26;
      if (v28 >= v27) {
        goto LABEL_25;
      }
    }
    unint64_t v16 = 0;
    unint64_t v17 = v27 + ~v28;
    if (!v25) {
      unint64_t v17 = v28;
    }
    uint64_t v18 = v24;
    unint64_t v19 = a1 + v17 * a4;
    while (1)
    {
      uint64_t v20 = (v12 & 4) != 0 ? v18 : v16;
      unint64_t v21 = v19 + v20;
      char v32 = 0;
      if (SBHIconGridRangeIntersection(a1, v15, v19 + v20, v14, a4) == v19 + v20 && v22 == v30)
      {
        v29[2](v29, v21, v30, &v32);
        if (v32) {
          break;
        }
      }
      v16 += v10;
      v18 -= v10;
      if (v16 >= v13) {
        goto LABEL_24;
      }
    }
  }
LABEL_25:
}

BOOL SBHIconGridRangeContainsIconGridRange(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  uint64_t v7 = SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  BOOL v9 = ((v8 ^ a4) & 0xFFFF0000) == 0 && (unsigned __int16)v8 == (unsigned __int16)a4;
  return v7 == a3 && v9;
}

void SBHIconGridRangeEnumerateRows(unint64_t a1, int a2, unsigned __int16 a3, char a4, void *a5)
{
  id v9 = a5;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __SBHIconGridRangeEnumerateRows_block_invoke;
  v11[3] = &unk_1E6AB18D8;
  id v10 = v9;
  id v12 = v10;
  unint64_t v13 = v14;
  SBHIconGridRangeEnumerateSubranges(a1, a2, (unsigned __int16)a2 | 0x10000, a3, a4, v11);

  _Block_object_dispose(v14, 8);
}

void sub_1D80D8078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SBHIconGridRangeEnumerateRows_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t SBHIconGridRangeCellIndexBelowColumn(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a1 + a4 + (unint64_t)(HIWORD(a2) * (unsigned __int16)a3) >= HIWORD(a3)
                                                                                      * (unint64_t)(unsigned __int16)a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else {
    return a1 + a4 + HIWORD(a2) * (unsigned __int16)a3;
  }
}

uint64_t SBHIconGridRangeCellIndexAboveColumn(unint64_t a1, uint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  if (a1 >= a3) {
    return a1 + a4 - a3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

unint64_t SBHIconGridRangeRowForCellIndex(unint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 / a4 - a1 / a4;
}

unint64_t SBHIconGridRangeColumnForCellIndex(unint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 % a4 + a1 / a4 * a4 - a1;
}

unint64_t SBHIconGridRangeRelativeCellIndexForCellIndex(unint64_t a1, unsigned __int16 a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 % a4 + a1 / a4 * a4 - a1 + (a3 / a4 - a1 / a4) * a2;
}

unint64_t SBHIconGridRangeCellIndexForRelativeCellIndex(unint64_t a1, unsigned __int16 a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 % a2 + a1 % a4 + (a3 / a2 + a1 / a4) * a4;
}

unint64_t SBHIconGridRangeRelativeRowForRelativeCellIndex(uint64_t a1, unsigned __int16 a2, unint64_t a3)
{
  return a3 / a2;
}

unint64_t SBHIconGridRangeRelativeColumnForRelativeCellIndex(uint64_t a1, unsigned __int16 a2, unint64_t a3)
{
  return a3 % a2;
}

uint64_t SBHIconGridRangeCellIndexForCorner(uint64_t result, int a2, char a3, unsigned __int16 a4)
{
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) != 0)
    {
      return result + (unsigned __int16)a2 - 1;
    }
    else
    {
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
      int v5 = HIWORD(a2) - 1;
      if ((a3 & 4) != 0) {
        uint64_t v4 = result + v5 * (unint64_t)a4;
      }
      unint64_t v6 = result + (unsigned __int16)a2 + v5 * (unint64_t)a4 - 1;
      if ((a3 & 8) != 0) {
        return v6;
      }
      else {
        return v4;
      }
    }
  }
  return result;
}

void SBHIconGridRangeEnumerateCorners(uint64_t a1, int a2, unsigned __int16 a3, void *a4)
{
  uint64_t v7 = a4;
  char v10 = 0;
  v7[2](v7, 1, a1, &v10);
  if (!v10)
  {
    uint64_t v8 = a1 + (unsigned __int16)a2 - 1;
    v7[2](v7, 2, v8, &v10);
    if (!v10)
    {
      int v9 = HIWORD(a2) - 1;
      v7[2](v7, 8, v8 + v9 * (unint64_t)a3, &v10);
      if (!v10) {
        v7[2](v7, 4, v9 * (unint64_t)a3 + a1, &v10);
      }
    }
  }
}

uint64_t SBHIconGridRangeContainsCellIndex(uint64_t a1, int a2, uint64_t a3, unsigned __int16 a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __SBHIconGridRangeContainsCellIndex_block_invoke;
  v6[3] = &unk_1E6AB2CF0;
  v6[4] = &v7;
  void v6[5] = a3;
  SBHIconGridRangeEnumerateCellIndexes(a1, a2, a4, v6);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_1D80D83A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SBHIconGridRangeContainsCellIndex_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 40) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

unint64_t SBHIconGridRangeAddCellIndex(unint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  return SBHIconGridRangeUnion(a1, a2, a3, 65537, a4);
}

unint64_t SBHIconGridRangeUnion(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned __int16 a5)
{
  if (a1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return a1;
    }
    else
    {
      unint64_t v5 = a1 / a5;
      unint64_t v6 = a1 % a5;
      if (v6 >= a3 % a5) {
        unint64_t v6 = a3 % a5;
      }
      if (v5 >= a3 / a5) {
        unint64_t v5 = a3 / a5;
      }
      return v6 + v5 * a5;
    }
  }
  return a3;
}

id SBHIconGridRangeCellIndexesNotInIconGridRange(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __SBHIconGridRangeCellIndexesNotInIconGridRange_block_invoke;
  v13[3] = &unk_1E6AB2910;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  int v17 = a5;
  id v11 = v10;
  id v14 = v11;
  SBHIconGridRangeEnumerateCellIndexes(a1, a2, a5, v13);

  return v11;
}

uint64_t __SBHIconGridRangeCellIndexesNotInIconGridRange_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 40), *(void *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if ((result & 1) == 0)
  {
    unint64_t v5 = *(void **)(a1 + 32);
    return [v5 addIndex:a2];
  }
  return result;
}

BOOL SBHIconGridRangeEqualToIconGridRange(uint64_t a1, int a2, uint64_t a3, int a4)
{
  BOOL v4 = ((a4 ^ a2) & 0xFFFF0000) == 0 && (unsigned __int16)a4 == (unsigned __int16)a2;
  return a1 == a3 && v4;
}

uint64_t SBHStringForIconGridRange(uint64_t a1, int a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu:%u×%u", a1, (unsigned __int16)a2, HIWORD(a2));
}

id SBHLayoutDescriptionForIconGridRange(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v7 = [MEMORY[0x1E4F28E78] string];
  if (a3 >= 0x10000)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    do
    {
      int v10 = (unsigned __int16)a3;
      if ((_WORD)a3)
      {
        do
        {
          unint64_t v3 = v3 & 0xFFFFFFFF00000000 | a3;
          if (SBHIconGridRangeContainsCellIndex(a1, a2, v9, v3)) {
            id v11 = @"*\t";
          }
          else {
            id v11 = @"-\t";
          }
          [v7 appendString:v11];
          ++v9;
          --v10;
        }
        while (v10);
      }
      [v7 appendString:@"\n"];
      ++v8;
    }
    while (v8 != HIWORD(a3));
  }
  return v7;
}

unint64_t SBHIconGridRangeGetBounds@<X0>(unint64_t result@<X0>, int a2@<W1>, unsigned __int16 a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = result / a3;
  unint64_t v5 = result % a3;
  *a4 = v5;
  a4[1] = v5 + (unsigned __int16)a2;
  a4[2] = v4;
  a4[3] = v4 + HIWORD(a2);
  return result;
}

uint64_t SBHIconGridRangeBoundsGetRange(uint64_t *a1, unsigned __int16 a2)
{
  uint64_t v3 = *a1;
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    return v3 + a1[2] * a2;
  }
  return result;
}

BOOL SBHIconGridRangeIntersects(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  return (v5 & 0xFFFF0000) != 0 && (unsigned __int16)v5 != 0;
}

BOOL SBHIconGridRangeIsEmpty(uint64_t a1, int a2)
{
  return (a2 & 0xFFFF0000) == 0 || (unsigned __int16)a2 == 0;
}

uint64_t SBHIconGridRangeDivide(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, unsigned __int16 a7)
{
  unint64_t v7 = a2 >> 16;
  switch(a6)
  {
    case 0:
      *(void *)a3 = result;
      *(_WORD *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = a5;
      *(_WORD *)(a3 + 10) = WORD1(a2);
      *(void *)a4 = result + a5;
      goto LABEL_5;
    case 1:
      *(void *)a3 = result;
      *(_WORD *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = a2;
      *(_WORD *)(a3 + 10) = a5;
      *(void *)a4 = result + a7 * (unint64_t)a5;
      goto LABEL_7;
    case 2:
      *(void *)a3 = result + (unsigned __int16)a2 - a5;
      *(_WORD *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = a5;
      *(_WORD *)(a3 + 10) = WORD1(a2);
      *(void *)a4 = result;
LABEL_5:
      *(_WORD *)(a4 + _Block_object_dispose(&STACK[0x220], 8) = a2 - a5;
      goto LABEL_8;
    case 3:
      *(void *)a3 = result + a7 * WORD1(a2) - a7 * a5;
      *(_WORD *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = a2;
      *(_WORD *)(a3 + 10) = a5;
      *(void *)a4 = result;
LABEL_7:
      *(_WORD *)(a4 + _Block_object_dispose(&STACK[0x220], 8) = a2;
      LOWORD(v7) = WORD1(a2) - a5;
LABEL_8:
      *(_WORD *)(a4 + 10) = v7;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBHIconGridRangeInset(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v6 = a4;
  __int16 v7 = a3;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v9 = a1 % (unsigned __int16)a5 + 1;
    unint64_t v10 = a1 / (unsigned __int16)a5 + 1;
  }
  uint64_t v11 = v9 + a3;
  uint64_t v12 = v10 + a4;
  if ((uint64_t)(v10 + a4) <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v10 + a4;
  }
  if (v11 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v9 + a3;
  }
  if (SBIconCoordinateIsNotFound(v14, v13)) {
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v15 = v14 + (v13 - 1) * (unsigned __int16)a5 - 1;
  }
  __int16 v16 = v11 - 1;
  int v17 = v12 - 1;
  if (v11 > 0) {
    __int16 v16 = 0;
  }
  unsigned __int16 v18 = a2 - 2 * v7 + v16;
  if (v12 > 0) {
    int v17 = 0;
  }
  return SBHIconGridRangeIntersection(v15, ((v17 - 2 * v6 + HIWORD(a2)) << 16) | v18, 0, a5, a5);
}

unint64_t SBHIconGridRangeSubrangeIncludingCellIndex(unint64_t a1, unsigned __int16 a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v9 = a5;
  }
  else
  {
    unint64_t v9 = a5;
    unint64_t v8 = a3 % a5 + 1;
    unint64_t v7 = a3 / a5 + 1;
  }
  uint64_t v10 = (uint64_t)(v8 - 1) / (unsigned __int16)a4 * (unsigned __int16)a4;
  uint64_t v11 = (uint64_t)(v7 - 1) / HIWORD(a4) * HIWORD(a4);
  BOOL IsNotFound = SBIconCoordinateIsNotFound(v10 + 1, v11 + 1);
  unint64_t v13 = v10 + v11 * v9;
  if (IsNotFound) {
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v13 % a2 + a1 % v9 + (v13 / a2 + a1 / v9) * v9;
}

uint64_t SBHIconGridRangeAnchoredEdges(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  uint64_t v9 = SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  uint64_t v12 = v9 + v11 + (v10 - 1) * (unint64_t)a5 - 1;
  uint64_t v13 = SBHIconGridRangeContainsCellIndex(a3, (unsigned __int16)a4 | 0x10000u, v9, a5);
  if (SBHIconGridRangeContainsCellIndex(a3 - a5 + a5 * HIWORD(a4), (unsigned __int16)a4 | 0x10000u, v12, a5))uint64_t v14 = v13 | 4; {
  else
  }
    uint64_t v14 = v13;
  if (SBHIconGridRangeContainsCellIndex(a3, a4 & 0xFFFF0000 | 1, v9, a5)) {
    uint64_t v15 = v14 | 2;
  }
  else {
    uint64_t v15 = v14;
  }
  if (SBHIconGridRangeContainsCellIndex(a3 + (unsigned __int16)a4 - 1, a4 & 0xFFFF0000 | 1, v12, a5)) {
    return v15 | 8;
  }
  else {
    return v15;
  }
}

uint64_t SBHIconGridRangeTouchedEdges(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  if (SBHIconGridRangeIntersection(a1, a2, a3, (HIWORD(a4) << 16) | (unsigned __int16)a4, a5) != 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v10 = a1 / a5;
  unint64_t v11 = a1 % a5;
  unint64_t v12 = v10 + HIWORD(a2);
  unint64_t v13 = a3 / a5;
  unint64_t v14 = a3 % a5;
  unint64_t v15 = v13 + HIWORD(a4);
  unint64_t v16 = v10 - HIWORD(a4);
  if (v10 < HIWORD(a4)) {
    unint64_t v16 = 0;
  }
  BOOL v17 = v13 >= v16;
  BOOL v18 = v15 <= v12 + HIWORD(a4);
  uint64_t v19 = 2;
  if (v11 != v14 + (unsigned __int16)a4 || !v17 || !v18) {
    uint64_t v19 = 0;
  }
  BOOL v20 = !v17 || !v18;
  unint64_t v21 = v11 + (unsigned __int16)a2;
  uint64_t v22 = v19 | 8;
  if (v20) {
    uint64_t v22 = 0;
  }
  unint64_t v23 = v11 - (unsigned __int16)a4;
  if (v11 < (unsigned __int16)a4) {
    unint64_t v23 = 0;
  }
  BOOL v24 = v14 >= v23;
  BOOL v25 = v14 <= v21;
  if (v21 == v14) {
    uint64_t v26 = v22;
  }
  else {
    uint64_t v26 = v19;
  }
  int v27 = v24 && v25;
  BOOL v20 = v27 == 0;
  uint64_t v28 = v26 | (v10 == v15) & v27;
  if (!v20) {
    uint64_t v26 = v28 | 4;
  }
  if (v12 == v13) {
    return v26;
  }
  else {
    return v28;
  }
}

void SBHIconGridRangeEnumerateTouchingRanges(unint64_t a1, int a2, int a3, unsigned int a4, char a5, void *a6)
{
  id v11 = a6;
  unint64_t v12 = v11;
  uint64_t v13 = (unsigned __int16)a3;
  if ((_WORD)a3)
  {
    int v14 = HIWORD(a3);
    if (HIWORD(a3))
    {
      if ((_WORD)a4 && (a4 & 0xFFFF0000) != 0)
      {
        char v46 = a5;
        double v47 = v11;
        int v45 = a3;
        a3 = (unsigned __int16)a3;
        uint64_t v44 = a4;
        int v48 = HIWORD(a4);
        int v39 = 2 * v14 + HIWORD(a4);
        unsigned __int16 v43 = a4 + 2 * a3;
        unsigned int v38 = v43 * v14;
        int v41 = v14;
        uint64_t v42 = v38 + (unsigned __int16)a3;
        unint64_t v15 = a1 % (unsigned __int16)a4 + (v38 + a3) % v43 + (a1 / (unsigned __int16)a4 + (v38 + a3) / v43) * v43;
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v17 = 0;
        unint64_t v50 = v15;
        uint64_t v18 = HIWORD(a2) + 1;
        unint64_t v19 = v15 + (unsigned __int16)a2;
        do
        {
          BOOL v20 = [NSNumber numberWithUnsignedInteger:v19 + v17 * v43];
          [v16 addObject:v20];

          ++v17;
          --v18;
        }
        while (v18);
        __int16 v21 = v39;
        if (v48 == 0xFFFF) {
          __int16 v21 = -1;
        }
        __int16 v40 = v21;
        uint64_t v49 = v43 * (uint64_t)(HIWORD(a2) - 1);
        if ((unsigned __int16)a3 + (unsigned __int16)a2 != 1)
        {
          uint64_t v22 = 0;
          uint64_t v23 = (unsigned __int16)a3 + (unsigned __int16)a2 - 1;
          do
          {
            BOOL v24 = [NSNumber numberWithUnsignedInteger:v49 + v43 + v19 + ~v22];
            [v16 addObject:v24];

            ++v22;
            --v23;
          }
          while (v23);
        }
        uint64_t v25 = 0;
        int v37 = (unsigned __int16)a2;
        uint64_t v26 = v41 + HIWORD(a2);
        do
        {
          int v27 = [NSNumber numberWithUnsignedInteger:v49 + v43 + v50 - ((unsigned __int16)a3 + v25 * v43)];
          [v16 addObject:v27];

          ++v25;
          --v26;
        }
        while (v26);
        uint64_t v28 = v37 + (unsigned __int16)a3 + 1;
        do
        {
          long long v29 = [NSNumber numberWithUnsignedInteger:v50 - (v13 + v38) + v26];
          [v16 addObject:v29];

          ++v26;
          --v28;
        }
        while (v28);
        int v30 = v41 - 1;
        if (v41 != 1)
        {
          uint64_t v31 = 0;
          unint64_t v32 = v19 - v43 * v30;
          uint64_t v33 = v30;
          do
          {
            long long v34 = [NSNumber numberWithUnsignedInteger:v32 + v31 * v43];
            [v16 addObject:v34];

            ++v31;
            --v33;
          }
          while (v33);
        }
        id v35 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __SBHIconGridRangeEnumerateTouchingRanges_block_invoke;
        v51[3] = &unk_1E6AB2D18;
        int v56 = v45;
        unsigned __int16 v57 = v43;
        __int16 v58 = v40;
        char v59 = v46 & 1;
        uint64_t v54 = v42;
        uint64_t v55 = v44;
        id v52 = v35;
        unint64_t v12 = v47;
        id v53 = v47;
        id v36 = v35;
        [v16 enumerateObjectsUsingBlock:v51];
      }
    }
  }
}

void __SBHIconGridRangeEnumerateTouchingRanges_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 unsignedIntegerValue];
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  int v6 = *(_DWORD *)(a1 + 68);
  if (SBHIconGridRangeIntersection(v4, *(_DWORD *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56), v6) == v4
    && v5 == v7)
  {
    if (*(unsigned char *)(a1 + 72)) {
      goto LABEL_7;
    }
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v9 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __SBHIconGridRangeEnumerateTouchingRanges_block_invoke_2;
    v13[3] = &unk_1E6AB1A40;
    v13[5] = v4;
    v13[6] = v5;
    int v14 = v6;
    void v13[4] = &v15;
    [v9 enumerateIndexesUsingBlock:v13];
    int v10 = *((unsigned __int8 *)v16 + 24);
    _Block_object_dispose(&v15, 8);
    if (!v10)
    {
LABEL_7:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __SBHIconGridRangeEnumerateTouchingRanges_block_invoke_3;
      v11[3] = &unk_1E6AB0430;
      id v12 = *(id *)(a1 + 32);
      SBHIconGridRangeEnumerateCellIndexes(v4, v5, *(_DWORD *)(a1 + 68), v11);
    }
  }
}

void sub_1D80D91D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SBHIconGridRangeEnumerateTouchingRanges_block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 40), *(void *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __SBHIconGridRangeEnumerateTouchingRanges_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

uint64_t SBHIconGridRangeOffset(unint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  if (a3)
  {
    uint64_t v9 = 0;
    unint64_t v11 = (unsigned __int16)a4;
    uint64_t v12 = v5;
    unint64_t v18 = v6;
    uint64_t v19 = v5;
    while (2)
    {
      uint64_t v13 = v5;
      unint64_t v14 = v6;
      switch(a2)
      {
        case 0:
          v6 += v11;
          BOOL v16 = SBHIconGridRangeIntersection(0, a4, v14 + v11, v12, a4) == v6 && v15 == v12;
          uint64_t v5 = v12;
          if (v16) {
            goto LABEL_17;
          }
          goto LABEL_20;
        case 1:
          v6 -= v11;
          if (v14 < v11) {
            goto LABEL_20;
          }
          uint64_t v5 = v12;
          if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_20;
          }
          goto LABEL_17;
        case 2:
          if (!v6)
          {
            unint64_t v6 = 0;
            break;
          }
          --v6;
          if (v14 / v11 != (v14 - 1) / v11)
          {
LABEL_20:
            uint64_t v5 = v13;
            unint64_t v6 = v14;
            break;
          }
LABEL_17:
          if (a3 != ++v9) {
            continue;
          }
          uint64_t v9 = a3;
          break;
        case 3:
          if (v6 / v11 != (v6 + (unsigned __int16)v5) / v11) {
            goto LABEL_20;
          }
          ++v6;
          goto LABEL_17;
        default:
          uint64_t v9 = 0;
          unint64_t v6 = v18;
          uint64_t v5 = v19;
          goto LABEL_21;
      }
      break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_21:
  *a1 = v6;
  a1[1] = v5;
  return v9;
}

uint64_t SBHIconGridRangeFitInsideIconGridRange(unint64_t a1, int a2, unint64_t a3, uint64_t a4, int a5)
{
  unsigned __int16 v5 = a5;
  uint64_t v6 = a4;
  unint64_t v7 = a3;
  BOOL v12 = SBHIconGridRangeIntersection(a1, a2, a3, a4, a5) == a3 && v11 == v6;
  if (v12) {
    goto LABEL_30;
  }
  if ((unsigned __int16)a2 >= (unsigned __int16)v6 && HIWORD(a2) >= WORD1(v6))
  {
    unint64_t v13 = a1 / v5;
    unint64_t v14 = a1 % v5;
    unint64_t v15 = v7 / v5;
    unint64_t v16 = v7 % v5;
    unint64_t v27 = v7;
    uint64_t v28 = v6;
    unint64_t v17 = v14 - v16;
    if (v14 <= v16)
    {
      unint64_t v18 = v14 + (unsigned __int16)a2;
      unint64_t v19 = v16 + (unsigned __int16)v6;
      BOOL v20 = v19 >= v18;
      unint64_t v21 = v19 - v18;
      if (v21 == 0 || !v20) {
        goto LABEL_18;
      }
      do
      {
        if (!v7) {
          break;
        }
        if (v7 / v5 != (v7 - 1) / v5) {
          break;
        }
        --v7;
        --v21;
      }
      while (v21);
    }
    else
    {
      do
      {
        if (v7 / v5 != ((unsigned __int16)v6 + v7) / v5) {
          break;
        }
        ++v7;
        --v17;
      }
      while (v17);
    }
    unint64_t v27 = v7;
LABEL_18:
    if (v13 > v15)
    {
      SBHIconGridRangeOffset(&v27, 0, v13 - v15, a5);
      return v27;
    }
    unint64_t v22 = v13 + HIWORD(a2);
    unint64_t v23 = v15 + WORD1(v6);
    BOOL v20 = v23 >= v22;
    unint64_t v24 = v23 - v22;
    if (v24 == 0 || !v20) {
      return v7;
    }
    if (v7 >= v5 && v7 - v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v6;
      do
      {
        unint64_t v25 = v7 - v5;
        if (!--v24) {
          break;
        }
        if (v7 - v5 < v5) {
          break;
        }
        BOOL v12 = 2 * v5 + 0x7FFFFFFFFFFFFFFFLL == v7;
        v7 -= v5;
      }
      while (!v12);
      unint64_t v7 = v25;
    }
LABEL_30:
    uint64_t v28 = v6;
    return v7;
  }
  LODWORD(v2_Block_object_dispose(&STACK[0x220], 8) = 0;
  return 0x7FFFFFFFFFFFFFFFLL;
}

unint64_t SBHIconGridRangeExtendToGridEdges(unint64_t result, uint64_t a2, char a3, unsigned __int16 a4)
{
  if ((a3 & 2) == 0)
  {
    if ((a3 & 8) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    if ((a3 & 1) == 0) {
      return result;
    }
    goto LABEL_10;
  }
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFELL;
  }
  else {
    unint64_t v4 = result % a4;
  }
  result -= v4;
  if ((a3 & 8) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((a3 & 1) == 0) {
    return result;
  }
LABEL_10:
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFELL;
    uint64_t v6 = a4;
  }
  else
  {
    uint64_t v6 = a4;
    unint64_t v5 = result / a4;
  }
  result -= v5 * v6;
  return result;
}

uint64_t SBHStringForIconImageInfo(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.1f×%.1f scale:%.1f corner:%.1f", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

uint64_t SBIconResizeHandleMetricsMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, long long a8, uint64_t a9, uint64_t a10)
{
  *(double *)a2 = a3;
  *(double *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = a7;
  *(void *)(a2 + 40) = result;
  *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x220], 8) = a8;
  *(void *)(a2 + 64) = a9;
  *(void *)(a2 + 72) = a10;
  return result;
}

uint64_t SBIconResizeHandleMetricsEqualToIconResizeHandleMetrics(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2
    && *(double *)(a1 + 8) == *(double *)(a2 + 8)
    && *(double *)(a1 + 16) == *(double *)(a2 + 16)
    && *(double *)(a1 + 24) == *(double *)(a2 + 24)
    && *(double *)(a1 + 32) == *(double *)(a2 + 32)
    && *(void *)(a1 + 40) == *(void *)(a2 + 40))
  {
    char v2 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a2 + 64)))), 0xFuLL)));
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

__CFString *SBHStringForFixedIconLocationBehavior(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E6AB2D68[a1];
  }
}

__CFString *SBHStringForIconLayoutBehavior(char a1)
{
  char v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1) {
    [v2 addObject:@"allowedOnAnyRow"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"allowedOnAnyColumn"];
  }
  if ([v3 count])
  {
    unint64_t v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    unint64_t v4 = @"default";
  }

  return v4;
}

void *__getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_1)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AppPredictionUIWidgetLibraryCore_block_invoke_1;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6AB2D38;
    uint64_t v7 = 0;
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v3 = (void *)v5[0];
    char v2 = (void *)AppPredictionUIWidgetLibraryCore_frameworkLibrary_1;
    if (AppPredictionUIWidgetLibraryCore_frameworkLibrary_1)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  char v2 = (void *)AppPredictionUIWidgetLibraryCore_frameworkLibrary_1;
LABEL_5:
  uint64_t result = dlsym(v2, "APUIIconLocationAppPredictions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAPUIIconLocationAppPredictionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUIWidgetLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUIWidgetLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1D80DD5A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1D80DDB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
}

void sub_1D80DE6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
}

void sub_1D80DF424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D80E2434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D80E79DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t pressesContainSelect(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (pressIsSelect(*(void **)(*((void *)&v6 + 1) + 8 * i)))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

void sub_1D80E8E64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
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

BOOL pressIsSelect(void *a1)
{
  id v1 = a1;
  if ([v1 type] == 4)
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t v3 = [v1 key];
    BOOL v2 = [v3 keyCode] == 81 && objc_msgSend(v3, "modifierFlags") == 0x100000;
  }
  return v2;
}

BOOL __pressesWithoutSelect_block_invoke(uint64_t a1, void *a2)
{
  return !pressIsSelect(a2);
}

void sub_1D80F0B68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D80F0D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SBStringForIconDragContextState(unint64_t a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_1E6AB3250[a1];
  }
}

id _SBHIconLibraryQueryCanonicalizedString(void *a1, void *a2, void *a3)
{
  uint64_t v5 = _SBHIconLibraryQueryCanonicalizedString_onceToken;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  if (v5 != -1) {
    dispatch_once(&_SBHIconLibraryQueryCanonicalizedString_onceToken, &__block_literal_global_88);
  }
  long long v9 = [v8 stringByTrimmingCharactersInSet:_SBHIconLibraryQueryCanonicalizedString_queryDisallowedCharacterSet];

  int v10 = [v9 componentsSeparatedByCharactersInSet:v6];

  uint64_t v11 = objc_msgSend(v10, "bs_filter:", &__block_literal_global_94_0);
  BOOL v12 = [v11 componentsJoinedByString:v7];

  return v12;
}

void sub_1D80F348C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBHContentSizeCategoryOneSmallerThanSizeCategory(void *a1)
{
  uint64_t v1 = a1;
  NSComparisonResult v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB2778]);
  uint64_t v3 = (void *)*MEMORY[0x1E4FB2780];
  if (v2)
  {
    NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB2780]);
    uint64_t v3 = (void *)*MEMORY[0x1E4FB2788];
    if (v4)
    {
      NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]);
      uint64_t v3 = (void *)*MEMORY[0x1E4FB2790];
      if (v5)
      {
        NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]);
        uint64_t v3 = (void *)*MEMORY[0x1E4FB2798];
        if (v6)
        {
          NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB2798]);
          uint64_t v3 = (void *)*MEMORY[0x1E4FB27B0];
          if (v7)
          {
            NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]);
            uint64_t v3 = (void *)*MEMORY[0x1E4FB27B8];
            if (v8)
            {
              NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27B8]);
              uint64_t v3 = (void *)*MEMORY[0x1E4FB27C0];
              if (v9)
              {
                NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]);
                uint64_t v3 = (void *)*MEMORY[0x1E4FB27D0];
                if (v10)
                {
                  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]);
                  uint64_t v3 = (void *)*MEMORY[0x1E4FB27D8];
                  if (v11)
                  {
                    NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27D8]);
                    uint64_t v3 = (void *)*MEMORY[0x1E4FB27E8];
                    if (v12)
                    {
                      NSComparisonResult v13 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27E8]);
                      uint64_t v3 = (void *)*MEMORY[0x1E4FB27C8];
                      if (v13)
                      {
                        if (UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27C8])) {
                          uint64_t v3 = (void *)*MEMORY[0x1E4FB27F0];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v14 = v3;

  return v14;
}

BOOL SBHContentSizeCategoryIsEqualToCategory(NSString *a1, NSString *a2)
{
  return UIContentSizeCategoryCompareToCategory(a1, a2) == NSOrderedSame;
}

BOOL SBHContentSizeCategoryIsInRange(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  SBHContentSizeCategoryClip(v5, a2, a3);
  NSComparisonResult v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v5, v6);

  return v7 == NSOrderedSame;
}

void sub_1D80F6734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

BOOL SBLibraryUseSectionsForQuery(void *a1)
{
  uint64_t v1 = [a1 searchString];
  BOOL v2 = [v1 length] == 0;

  return v2;
}

id SBHLibrarySectionIdentifierForSectionWithIndex(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 sectionTitles];
  NSComparisonResult v4 = [v3 objectAtIndexedSubscript:a2];

  id v5 = [NSString stringWithFormat:@"section-(%ld)-%@-indexable", a2, v4];

  return v5;
}

uint64_t __SBHLibrarySortedIdentifiersForIcons_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sbh_iconLibraryItemIdentifier");
}

void sub_1D8102010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8106830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8108964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D810A9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHDefaultScreenSizeBucket(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 0x2D) {
    return 0;
  }
  else {
    return qword_1D81E7580[a1 - 2];
  }
}

uint64_t SBHLibraryScreenSizeBucket(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 0x2D) {
    return 0;
  }
  else {
    return qword_1D81E76F0[a1 - 2];
  }
}

uint64_t SBHDefaultIconSizeBucket(uint64_t a1, char a2)
{
  switch(a1)
  {
    case 0:
      return 112;
    case 1:
    case 8:
      return 120;
    case 2:
    case 3:
    case 6:
    case 9:
    case 11:
    case 14:
    case 15:
    case 17:
    case 20:
    case 21:
    case 24:
    case 25:
    case 28:
      return 1800;
    case 4:
    case 10:
    case 12:
    case 16:
    case 18:
    case 22:
    case 26:
      return 1680;
    case 5:
    case 13:
    case 19:
    case 23:
    case 27:
      return 1920;
    case 7:
      return 128;
    case 29:
    case 31:
    case 32:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 41:
    case 43:
    case 44:
    case 46:
      BOOL v3 = (a2 & 8) == 0;
      uint64_t v4 = 152;
      uint64_t v5 = 120;
      goto LABEL_9;
    case 30:
    case 34:
      BOOL v3 = (a2 & 8) == 0;
      uint64_t v4 = 152;
      uint64_t v5 = 128;
      goto LABEL_9;
    case 33:
    case 40:
    case 42:
    case 45:
    case 47:
      BOOL v3 = (a2 & 8) == 0;
      uint64_t v4 = 167;
      uint64_t v5 = 136;
LABEL_9:
      if (v3) {
        uint64_t result = v5;
      }
      else {
        uint64_t result = v4;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

double SBHDefaultIconImageSizeForIconSizeBucket(uint64_t a1, unint64_t a2, char a3)
{
  double v3 = 0.0;
  if (a1 <= 151)
  {
    if (a1 > 127)
    {
      if (a1 == 128) {
        goto LABEL_19;
      }
      if (a1 == 136) {
        double v3 = 68.0;
      }
    }
    else
    {
      if (a1 == 112)
      {
LABEL_18:
        uint64_t v4 = 0x404C000000000000;
        goto LABEL_21;
      }
      if (a1 == 120)
      {
LABEL_10:
        uint64_t v4 = 0x404E000000000000;
LABEL_21:
        double v3 = *(double *)&v4;
      }
    }
  }
  else
  {
    if (a1 > 1679)
    {
      if (a1 != 1920)
      {
        if (a1 != 1800)
        {
          if (a1 != 1680) {
            goto LABEL_22;
          }
          goto LABEL_18;
        }
        goto LABEL_10;
      }
LABEL_19:
      uint64_t v4 = 0x4050000000000000;
      goto LABEL_21;
    }
    if (a1 == 152)
    {
      uint64_t v4 = 0x4053000000000000;
      goto LABEL_21;
    }
    if (a1 == 167) {
      double v3 = 83.5;
    }
  }
LABEL_22:
  double v5 = 0.0;
  if ((a3 & 0x18) != 0 && a2 <= 0x1C) {
    double v5 = dbl_1D81E7860[a2];
  }
  return v3 + v5;
}

double SBHDefaultIconImageSize(unint64_t a1, char a2)
{
  uint64_t v4 = SBHDefaultIconSizeBucket(a1, a2);
  return SBHDefaultIconImageSizeForIconSizeBucket(v4, a1, a2);
}

double SBHDefaultIconImageScale(uint64_t a1, char a2)
{
  uint64_t v2 = SBHDefaultIconSizeBucket(a1, a2);
  double result = 0.0;
  if (v2 > 1679)
  {
    if (v2 == 1680 || v2 == 1800 || v2 == 1920) {
      return 3.0;
    }
  }
  else
  {
    double v4 = 2.0;
    if (((1 << (v2 - 112)) & 0x80010001010101) == 0) {
      double v4 = 0.0;
    }
    if ((unint64_t)(v2 - 112) <= 0x37) {
      return v4;
    }
  }
  return result;
}

double SBHDefaultIconImageContinuousCornerRadius(double a1)
{
  if (a1 == 56.0) {
    return 12.6;
  }
  double v1 = 13.5;
  if (a1 != 60.0)
  {
    if (a1 == 64.0)
    {
      return 14.4;
    }
    else if (a1 == 76.0)
    {
      return 17.125;
    }
    else if (a1 == 83.5)
    {
      return 18.75;
    }
    else
    {
      return a1 * 0.225;
    }
  }
  return v1;
}

SBHMutableIconGridSizeClassSizeMap *SBHDefaultGridSizeClassSizes(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = objc_alloc_init(SBHMutableIconGridSizeClassSizeMap);
  [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:65537 forGridSizeClass:@"SBHIconGridSizeClassDefault"];
  if (!SBHScreenTypeIsPad(a1) || ([v3 isEqualToString:@"SBIconLocationAppLibrary"] & 1) == 0)
  {
    uint64_t v5 = 131074;
    if (SBHScreenTypeIsPad(a1))
    {
      [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:65537 forGridSizeClass:@"SBHIconGridSizeClassSmall"];
      [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:65538 forGridSizeClass:@"SBHIconGridSizeClassMedium"];
      uint64_t v6 = 131076;
      uint64_t v7 = 196610;
      NSComparisonResult v8 = SBHIconGridSizeClassExtraLarge;
      NSComparisonResult v9 = SBHIconGridSizeClassNewsLargeTall;
      NSComparisonResult v10 = SBHIconGridSizeClassLarge;
    }
    else
    {
      uint64_t v7 = 262148;
      [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:131074 forGridSizeClass:@"SBHIconGridSizeClassSmall"];
      uint64_t v5 = 131076;
      uint64_t v6 = 393220;
      NSComparisonResult v8 = SBHIconGridSizeClassNewsLargeTall;
      NSComparisonResult v9 = SBHIconGridSizeClassLarge;
      NSComparisonResult v10 = SBHIconGridSizeClassMedium;
    }
    [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:v5 forGridSizeClass:*v10];
    [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:v7 forGridSizeClass:*v9];
    [(SBHMutableIconGridSizeClassSizeMap *)v4 setGridSize:v6 forGridSizeClass:*v8];
  }

  return v4;
}

double SBHDefaultWidgetContinuousCornerRadius(unint64_t a1)
{
  double result = 0.0;
  if (a1 <= 0x2F) {
    return dbl_1D81E7948[a1];
  }
  return result;
}

double SBHDefaultWidgetContentMargins(unint64_t a1)
{
  uint64_t v2 = _SBHDefaultIconGridSizeClassIconImageInfos(a1, 0);
  [v2 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
  SBHGetScreenSpecification(a1, (uint64_t)v6);
  BSFloatRoundForScale();
  double v4 = v3;

  return v4;
}

SBHMutableIconGridSizeClassIconImageInfoMap *_SBHDefaultIconGridSizeClassIconImageInfos(unint64_t a1, char a2)
{
  double v4 = SBHDefaultIconImageScale(a1, a2);
  switch(a1)
  {
    case 0uLL:
    case 4uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
      goto LABEL_13;
    case 1uLL:
      double v5 = 148.0;
      double v6 = 324.0;
      double v7 = 321.0;
      double v8 = 500.0;
      goto LABEL_14;
    case 2uLL:
      double v5 = 157.0;
      double v6 = 351.0;
      double v7 = 348.0;
      double v8 = 545.0;
      goto LABEL_14;
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x14uLL:
    case 0x18uLL:
    case 0x1CuLL:
      double v5 = 155.0;
      double v6 = 345.0;
      double v7 = 329.0;
      double v8 = 535.0;
      goto LABEL_14;
    case 5uLL:
    case 7uLL:
      double v5 = 169.0;
      double v6 = 379.0;
      double v7 = 360.0;
      double v8 = 589.0;
      goto LABEL_14;
    case 0xBuLL:
    case 0x11uLL:
    case 0x15uLL:
    case 0x19uLL:
      if ((a2 & 0x10) == 0)
      {
        double v10 = dbl_1D81E7570[a1 == 21];
        double v5 = 158.0;
        double v6 = 354.0;
        double v7 = 338.0;
        double v8 = 550.0;
        goto LABEL_23;
      }
      double v5 = 165.0;
      double v10 = 349.0;
      *(double *)&uint64_t v11 = 571.0;
      goto LABEL_35;
    case 0xDuLL:
    case 0x13uLL:
    case 0x17uLL:
    case 0x1BuLL:
      double v5 = 170.0;
      double v6 = 382.0;
      double v7 = 364.0;
      double v8 = 594.0;
      goto LABEL_14;
    case 0x16uLL:
    case 0x1AuLL:
      if ((a2 & 0x10) != 0)
      {
        double v5 = 138.0;
        double v10 = 290.0;
        *(double *)&uint64_t v11 = 487.0;
LABEL_35:
        double v21 = *(double *)&v11;
        double v22 = v10;
        double v7 = v10;
      }
      else
      {
LABEL_13:
        double v5 = 141.0;
        double v6 = 311.0;
        double v7 = 292.0;
        double v8 = 481.0;
LABEL_14:
        double v10 = v7;
LABEL_23:
        if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(a1))
        {
          UIRoundToScale();
          double v5 = v5 + v12;
          double v10 = v10 + v12;
          double v6 = v6 + v12;
          double v7 = v7 + v12;
          double v8 = v8 + v12;
        }
        double v21 = v8;
        double v22 = v6;
      }
      uint64_t v13 = SBHDefaultIconSizeBucket(a1, a2);
      double v14 = SBHDefaultIconImageSizeForIconSizeBucket(v13, a1, a2);
      double v16 = v15;
      if (v14 == 56.0)
      {
        double v17 = 12.6;
      }
      else
      {
        double v17 = 13.5;
        if (v14 != 60.0)
        {
          if (v14 == 64.0)
          {
            double v17 = 14.4;
          }
          else if (v14 == 76.0)
          {
            double v17 = 17.125;
          }
          else if (v14 == 83.5)
          {
            double v17 = 18.75;
          }
          else
          {
            double v17 = v14 * 0.225;
          }
        }
      }
      double v18 = SBHDefaultWidgetContinuousCornerRadius(a1);
      unint64_t v19 = objc_alloc_init(SBHMutableIconGridSizeClassIconImageInfoMap);
      [(SBHMutableIconGridSizeClassIconImageInfoMap *)v19 setIconImageInfo:@"SBHIconGridSizeClassDefault", v14, v16, v4, v17 forGridSizeClass];
      [(SBHMutableIconGridSizeClassIconImageInfoMap *)v19 setIconImageInfo:@"SBHIconGridSizeClassSmall", v5, v5, v4, v18 forGridSizeClass];
      [(SBHMutableIconGridSizeClassIconImageInfoMap *)v19 setIconImageInfo:@"SBHIconGridSizeClassMedium", v10, v5, v4, v18 forGridSizeClass];
      [(SBHMutableIconGridSizeClassIconImageInfoMap *)v19 setIconImageInfo:@"SBHIconGridSizeClassLarge", v10, v22, v4, v18 forGridSizeClass];
      [(SBHMutableIconGridSizeClassIconImageInfoMap *)v19 setIconImageInfo:@"SBHIconGridSizeClassExtraLarge", v7, v22, v4, v18 forGridSizeClass];
      [(SBHMutableIconGridSizeClassIconImageInfoMap *)v19 setIconImageInfo:@"SBHIconGridSizeClassNewsLargeTall", v10, v21, v4, v18 forGridSizeClass];
      return v19;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x22uLL:
    case 0x29uLL:
    case 0x2EuLL:
      double v5 = 120.0;
      double v6 = 260.0;
      double v7 = 540.0;
      *(double *)&uint64_t v9 = 400.0;
      goto LABEL_8;
    case 0x1FuLL:
      double v5 = 124.0;
      double v6 = 272.0;
      double v7 = 568.0;
      double v8 = 420.0;
      goto LABEL_22;
    case 0x20uLL:
      double v5 = 132.0;
      double v6 = 288.0;
      double v7 = 600.0;
      double v8 = 444.0;
      goto LABEL_22;
    case 0x21uLL:
    case 0x28uLL:
    case 0x2DuLL:
      double v5 = 160.0;
      double v6 = 356.0;
      double v7 = 748.0;
      double v8 = 552.0;
      goto LABEL_22;
    case 0x23uLL:
    case 0x24uLL:
    case 0x26uLL:
    case 0x2BuLL:
      double v5 = 136.0;
      double v6 = 300.0;
      double v7 = 628.0;
      *(double *)&uint64_t v9 = 464.0;
LABEL_8:
      double v8 = *(double *)&v9;
      goto LABEL_22;
    case 0x25uLL:
    case 0x27uLL:
    case 0x2CuLL:
      double v5 = 162.0;
      double v6 = 350.0;
      double v7 = 726.0;
      double v8 = 538.0;
      goto LABEL_22;
    case 0x2AuLL:
    case 0x2FuLL:
      double v5 = 188.0;
      double v6 = 412.0;
      double v7 = 860.0;
      double v8 = 636.0;
LABEL_22:
      double v10 = v6;
      goto LABEL_23;
    default:
      double v8 = 0.0;
      double v7 = 0.0;
      double v6 = 0.0;
      double v10 = 0.0;
      double v5 = 0.0;
      goto LABEL_23;
  }
}

double SBHDefaultWidgetScaleFactor(unint64_t a1)
{
  double v2 = 1.0;
  if (!SBHScreenTypeIsPhone(a1))
  {
    double v3 = _SBHDefaultIconGridSizeClassIconImageInfos(a1, 0);
    [v3 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
    double v2 = v4 / _SBHDefaultSmallWidgetCanvasDimension(a1);
  }
  return v2;
}

double _SBHDefaultSmallWidgetCanvasDimension(unint64_t a1)
{
  double v2 = _SBHDefaultIconGridSizeClassIconImageInfos(a1, 0);
  [v2 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
  double v4 = v3;
  unint64_t v5 = a1 - 29;
  if (a1 - 29 <= 0x11 && ((0x35AFFu >> v5) & 1) != 0) {
    double v4 = dbl_1D81E7C98[v5];
  }

  return v4;
}

id _SBHLayoutOptionsKeyTypeForListLayoutProvider(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 layoutOptions];
    double v3 = [NSNumber numberWithUnsignedInteger:v2];
  }
  else
  {
    double v3 = &unk_1F300EF98;
  }

  return v3;
}

id _SBHDefaultIconGridSizeClassEditingAnimationStrengths(void *a1, uint64_t a2)
{
  double v3 = SBHDefaultGridSizeClassSizes(a2, a1);
  BOOL IsPad = SBHScreenTypeIsPad(a2);
  BOOL v5 = IsPad;
  if (IsPad)
  {
    double v6 = +[SBHIconGridSizeClassDomain builtInDomain];
    double v7 = [v6 allGridSizeClasses];
  }
  else
  {
    double v7 = 0;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___SBHDefaultIconGridSizeClassEditingAnimationStrengths_block_invoke;
  v15[3] = &unk_1E6AB38C8;
  BOOL v19 = v5;
  id v16 = v3;
  id v17 = v7;
  id v9 = v8;
  id v18 = v9;
  id v10 = v7;
  id v11 = v3;
  SBHEnumerateIconGridSizeClasses(v15);
  double v12 = v18;
  id v13 = v9;

  return v13;
}

id SBHStringForDefaultListLayoutProviderLayoutOptions(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v3 = v2;
  if ((a1 & 4) != 0)
  {
    [v2 addObject:@"ExtendedFloatingDockCapacity"];
    if ((a1 & 8) == 0)
    {
LABEL_3:
      if ((a1 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"LargeDefaultSizedIcons"];
  if ((a1 & 0x10) != 0) {
LABEL_4:
  }
    [v3 addObject:@"LargeNonDefaultSizedIcons"];
LABEL_5:
  double v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

uint64_t _SBHEquivalentPhoneScreenTypeForScreenType(unint64_t a1)
{
  if (a1 > 0x2F) {
    return 0;
  }
  else {
    return qword_1D81E7D28[a1];
  }
}

double _SBHDefaultDockPlatterMetrics(unint64_t a1, char a2)
{
  switch(a1)
  {
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
      return 10.0;
    case 4uLL:
      return 7.0;
    case 5uLL:
    case 7uLL:
      return 12.0;
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
      goto LABEL_12;
    case 0xBuLL:
    case 0x11uLL:
    case 0x15uLL:
      if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(a1)) {
        return 12.0;
      }
      else {
        return 12.0;
      }
    case 0xDuLL:
    case 0x13uLL:
    case 0x17uLL:
      return 14.0;
    case 0xEuLL:
    case 0x14uLL:
    case 0x18uLL:
      return 9.0;
    case 0x16uLL:
    case 0x1AuLL:
      if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(a1)) {
        double v2 = 10.0;
      }
      else {
LABEL_12:
      }
        double v2 = 8.0;
      break;
    case 0x19uLL:
      double v2 = 17.0;
      break;
    case 0x1BuLL:
      double v2 = 17.0;
      break;
    case 0x1CuLL:
      double v2 = 14.0;
      if ((a2 & 0x18) != 0) {
        SBHScreenTypeIsPhone(0x1CuLL);
      }
      break;
    default:
      double v2 = 0.0;
      break;
  }
  return v2;
}

double _SBHDefaultDockAdditionalIconInset(unint64_t a1, char a2)
{
  double result = 0.0;
  if (a1 <= 0x1C)
  {
    if (((1 << a1) & 0xA251400) != 0)
    {
      if ((a2 & 0x18) != 0)
      {
        BOOL IsPhone = SBHScreenTypeIsPhone(a1);
        double result = 2.0;
        double v5 = 3.0;
        if (a1 == 25) {
          double v5 = 9.0;
        }
        if (IsPhone) {
          return v5;
        }
      }
      else
      {
        return 2.0;
      }
    }
    else if (((1 << a1) & 0x14400000) != 0)
    {
      if ((a2 & 0x18) == 0 || (v6 = SBHScreenTypeIsPhone(a1), double result = 7.0, !v6))
      {
        double result = 2.0;
        if (a1 == 26) {
          return 4.0;
        }
      }
    }
  }
  return result;
}

double _SBHDefaultDockCornerRadiusAdjustment(unint64_t a1, char a2)
{
  double result = 0.0;
  if (a1 <= 0x1C)
  {
    if (((1 << a1) & 0x651400) != 0)
    {
      if ((a2 & 0x18) == 0) {
        return -2.0;
      }
      BOOL IsPhone = SBHScreenTypeIsPhone(a1);
      double result = -2.0;
      BOOL v5 = a1 == 22;
      double v6 = -1.0;
      double v7 = 2.0;
    }
    else
    {
      if (((1 << a1) & 0xA000000) != 0) {
        return -6.0;
      }
      if (((1 << a1) & 0x14000000) == 0) {
        return result;
      }
      if ((a2 & 0x18) == 0) {
        return -6.0;
      }
      BOOL IsPhone = SBHScreenTypeIsPhone(a1);
      double result = -6.0;
      BOOL v5 = a1 == 26;
      double v6 = -4.0;
      double v7 = -1.0;
    }
    if (v5) {
      double v6 = v7;
    }
    if (IsPhone) {
      return v6;
    }
  }
  return result;
}

double _SBHDefaultCategoryPodIconInset(unint64_t a1)
{
  if (SBHScreenTypeIsPhone(a1))
  {
    uint64_t v2 = SBHDefaultScreenSizeBucket(a1);
    double v3 = (double *)&unk_1D81E7EA8;
  }
  else
  {
    uint64_t v2 = SBHLibraryScreenSizeBucket(a1);
    double v3 = (double *)&unk_1D81E7EC0;
  }
  return v3[v2];
}

uint64_t _SBHDefaultNumberOfRowsAndColumnsInFolders(uint64_t a1)
{
  if (SBHScreenTypeIsPad(a1)) {
    return 4;
  }
  else {
    return 3;
  }
}

double _SBHDefaultTopLayoutInsetAdjustment(uint64_t a1, char a2)
{
  if ((unint64_t)(a1 - 3) < 0x16) {
    return -10.0;
  }
  if (a1 == 25)
  {
    if ((a2 & 0x18) == 0) {
      return -7.0;
    }
    BOOL IsPhone = SBHScreenTypeIsPhone(0x19uLL);
    double result = -6.0;
    if (!IsPhone) {
      return -7.0;
    }
  }
  else if (a1 == 27)
  {
    return -8.0;
  }
  else
  {
    double result = 0.0;
    if (a1 == 26) {
      return -10.0;
    }
  }
  return result;
}

id SBHCreateAppLibraryGhostPodView(void *a1, void *a2)
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  id v83 = a1;
  id v74 = a2;
  id v82 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  int v3 = 0;
  v73 = @"SBIconLocationAppLibraryCategoryPodAdditionalItems";
  do
  {
    int v84 = v3;
    objc_msgSend(v83, "iconInsets", v73);
    double v76 = v5;
    double v77 = v4;
    double v75 = v6;
    double v8 = v7;
    [v83 iconContentScale];
    double v10 = v9;
    [v83 iconSize];
    double v13 = v11;
    double v14 = v12;
    if (v84 == 3)
    {
      id v15 = v83;
      id v78 = v74;
      v85 = v15;
      [v15 iconSize];
      id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      BSRectWithSize();
      id v17 = objc_msgSend(v16, "initWithFrame:");
      v80 = [v78 layoutForIconLocation:v73];
      double v18 = SBHIconListLayoutFolderIconGridCellSize(v80);
      double v20 = v19;
      int v21 = 0;
      double v22 = -(v18 + SBHIconListLayoutFolderIconGridCellSpacing(v80));
      double v24 = -(v20 + v23);
      do
      {
        [v85 iconContentScale];
        uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v18, v20, v25);
        id v27 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        BSRectWithSize();
        uint64_t v28 = objc_msgSend(v27, "initWithFrame:");
        long long v29 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_63];
        [v28 setBackgroundColor:v29];
        [v26 continuousCornerRadius];
        objc_msgSend(v28, "_setContinuousCornerRadius:");

        switch(v21)
        {
          case 0:
            int v30 = [v28 topAnchor];
            uint64_t v31 = [v17 centerYAnchor];
            unint64_t v32 = [v30 constraintEqualToAnchor:v31 constant:v24];
            location[0] = v32;
            uint64_t v33 = [v28 leadingAnchor];
            long long v34 = [v17 centerXAnchor];
            id v35 = [v33 constraintEqualToAnchor:v34 constant:v22];
            location[1] = v35;
            id v36 = location;
            goto LABEL_9;
          case 1:
            int v30 = [v28 topAnchor];
            uint64_t v31 = [v17 centerYAnchor];
            unint64_t v32 = [v30 constraintEqualToAnchor:v31 constant:v24];
            v97[0] = v32;
            uint64_t v33 = [v28 leadingAnchor];
            long long v34 = [v17 centerXAnchor];
            id v35 = [v33 constraintEqualToAnchor:v34 constant:0.0];
            v97[1] = v35;
            id v36 = (id *)v97;
            goto LABEL_9;
          case 2:
            int v30 = [v28 topAnchor];
            uint64_t v31 = [v17 centerYAnchor];
            unint64_t v32 = [v30 constraintEqualToAnchor:v31 constant:0.0];
            v96[0] = v32;
            uint64_t v33 = [v28 leadingAnchor];
            long long v34 = [v17 centerXAnchor];
            id v35 = [v33 constraintEqualToAnchor:v34 constant:v22];
            v96[1] = v35;
            id v36 = (id *)v96;
            goto LABEL_9;
          case 3:
            int v30 = [v28 topAnchor];
            uint64_t v31 = [v17 centerYAnchor];
            unint64_t v32 = [v30 constraintEqualToAnchor:v31 constant:0.0];
            v95[0] = v32;
            uint64_t v33 = [v28 leadingAnchor];
            long long v34 = [v17 centerXAnchor];
            id v35 = [v33 constraintEqualToAnchor:v34 constant:0.0];
            v95[1] = v35;
            id v36 = (id *)v95;
LABEL_9:
            int v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];

            break;
          default:
            int v37 = 0;
            break;
        }
        unsigned int v38 = [v28 widthAnchor];
        int v39 = [v38 constraintEqualToConstant:v18];
        v94[0] = v39;
        __int16 v40 = [v28 heightAnchor];
        int v41 = [v40 constraintEqualToConstant:v20];
        v94[1] = v41;
        uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
        unsigned __int16 v43 = [v37 arrayByAddingObjectsFromArray:v42];

        [v17 addSubview:v28];
        [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
        [MEMORY[0x1E4F28DC8] activateConstraints:v43];

        ++v21;
      }
      while (v21 != 4);
    }
    else
    {
      uint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v11, v12, v10);
      id v45 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      BSRectWithSize();
      id v17 = objc_msgSend(v45, "initWithFrame:");
      char v46 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_63];
      [v17 setBackgroundColor:v46];
      [v44 continuousCornerRadius];
      objc_msgSend(v17, "_setContinuousCornerRadius:");
    }
    double v47 = [MEMORY[0x1E4FB1BA8] mainScreen];
    int v48 = [v47 traitCollection];
    uint64_t v49 = [v48 userInterfaceStyle];

    [v17 setFilterForUserInterface:v49];
    objc_initWeak(location, v17);
    unint64_t v50 = self;
    v93 = v50;
    double v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __SBHCreateAppLibraryGhostPodView_block_invoke;
    v87[3] = &unk_1E6AB38F0;
    objc_copyWeak(&v88, location);
    id v52 = (id)[v17 registerForTraitChanges:v51 withHandler:v87];

    switch(v84)
    {
      case 2:
        v79 = [v17 bottomAnchor];
        v86 = [v82 bottomAnchor];
        v81 = [v79 constraintEqualToAnchor:v86 constant:-v76];
        v90[0] = v81;
        id v53 = [v17 leadingAnchor];
        uint64_t v54 = [v82 leadingAnchor];
        uint64_t v55 = [v53 constraintEqualToAnchor:v54 constant:v77];
        v90[1] = v55;
        int v56 = [v17 widthAnchor];
        unsigned __int16 v57 = [v56 constraintEqualToConstant:v13];
        v90[2] = v57;
        __int16 v58 = [v17 heightAnchor];
        char v59 = [v58 constraintEqualToConstant:v14];
        v90[3] = v59;
        uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:4];
        goto LABEL_20;
      case 1:
        v79 = [v17 topAnchor];
        v86 = [v82 topAnchor];
        v81 = [v79 constraintEqualToAnchor:v86 constant:v8];
        v91[0] = v81;
        id v53 = [v17 trailingAnchor];
        uint64_t v54 = [v82 trailingAnchor];
        uint64_t v55 = [v53 constraintEqualToAnchor:v54 constant:-v75];
        v91[1] = v55;
        int v56 = [v17 widthAnchor];
        unsigned __int16 v57 = [v56 constraintEqualToConstant:v13];
        v91[2] = v57;
        __int16 v58 = [v17 heightAnchor];
        char v59 = [v58 constraintEqualToConstant:v14];
        v91[3] = v59;
        uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:4];
        goto LABEL_20;
      case 0:
        v79 = [v17 topAnchor];
        v86 = [v82 topAnchor];
        v81 = [v79 constraintEqualToAnchor:v86 constant:v8];
        v92[0] = v81;
        id v53 = [v17 leadingAnchor];
        uint64_t v54 = [v82 leadingAnchor];
        uint64_t v55 = [v53 constraintEqualToAnchor:v54 constant:v77];
        v92[1] = v55;
        int v56 = [v17 widthAnchor];
        unsigned __int16 v57 = [v56 constraintEqualToConstant:v13];
        v92[2] = v57;
        __int16 v58 = [v17 heightAnchor];
        char v59 = [v58 constraintEqualToConstant:v14];
        v92[3] = v59;
        uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];
LABEL_20:
        v61 = (void *)v60;
LABEL_21:

        goto LABEL_22;
      case 3:
        v62 = [v74 layoutForIconLocation:v73];
        double v63 = SBHIconListLayoutFolderIconGridCellSize(v62);
        double v65 = v64;
        v79 = v62;
        double v66 = SBHIconListLayoutFolderIconGridCellSpacing(v62);
        double v68 = v67;
        v86 = [v17 centerXAnchor];
        v81 = [v82 trailingAnchor];
        double v69 = v66 + v63 * 2.0;
        id v53 = [v86 constraintEqualToAnchor:v81 constant:v69 * -0.5 - v76];
        v89[0] = v53;
        uint64_t v54 = [v17 centerYAnchor];
        uint64_t v55 = [v82 bottomAnchor];
        double v70 = v68 + v65 * 2.0;
        int v56 = [v54 constraintEqualToAnchor:v55 constant:v70 * -0.5 - v75];
        v89[1] = v56;
        unsigned __int16 v57 = [v17 widthAnchor];
        __int16 v58 = [v57 constraintEqualToConstant:v69];
        v89[2] = v58;
        char v59 = [v17 heightAnchor];
        v71 = [v59 constraintEqualToConstant:v70];
        v89[3] = v71;
        v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];

        goto LABEL_21;
    }
    v61 = 0;
LABEL_22:
    [v82 addSubview:v17];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [MEMORY[0x1E4F28DC8] activateConstraints:v61];

    objc_destroyWeak(&v88);
    objc_destroyWeak(location);

    int v3 = v84 + 1;
  }
  while (v84 != 3);

  return v82;
}

void sub_1D810D424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 176));
  _Unwind_Resume(a1);
}

void __SBHCreateAppLibraryGhostPodView_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = [v6 traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    [WeakRetained setFilterForUserInterface:v5];
  }
}

id __drawShadedIcon_block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.07;
    double v3 = 1.0;
  }
  else
  {
    double v2 = 0.12;
    double v3 = 0.0;
  }
  double v4 = [MEMORY[0x1E4FB1618] colorWithWhite:v3 alpha:v2];
  return v4;
}

void sub_1D810F050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 232), 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
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

id SBIconIndexCompleteNodePath(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = [a1 nodesAlongIndexPath:v3 consumedIndexes:0];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v3 length];

  id v7 = 0;
  if (v5 == v6 + 1) {
    id v7 = v4;
  }

  return v7;
}

id SBIconIndexDebugStringForNodeIdentifier(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v1];
  }
  id v3 = v2;

  return v3;
}

void sub_1D811A054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1D811F0E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D812194C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8128728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D812A53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

void sub_1D812BCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1D813144C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

void sub_1D81335DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D8133CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, id *a12)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 160));
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v12 - 168));
  _Unwind_Resume(a1);
}

void sub_1D8135F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D81370B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8137CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813BB3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D813BE28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D813C2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813C454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813C634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813C7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813C970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813CB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813CCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813CED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813D374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D813D57C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D813FB48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D8140FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1D8143984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D8145AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8146960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8149848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
}

void sub_1D814AC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAPUIAppPredictionViewControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppPredictionUIWidgetLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6AB4890;
    uint64_t v6 = 0;
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("APUIAppPredictionViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getAPUIAppPredictionViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAPUIAppPredictionViewControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUIWidgetLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUIWidgetLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1D8150950(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id SBHIconDragItemWithIconAndIconView(void *a1, void *a2, void *a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v61 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v61 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:&__block_literal_global_65];
  char v59 = [v5 nodeIdentifier];
  __int16 v58 = [v5 applicationBundleID];
  id v53 = [v5 draggingUserActivity];
  double v8 = @"SBHIconGridSizeClassDefault";
  double v9 = v8;
  uint64_t v54 = v7;
  uint64_t v55 = v6;
  if (!v6)
  {
    obja = v8;
    id v65 = 0;
    int v56 = 0;
    uint64_t v11 = 0;
    unsigned __int16 v57 = 0;
    uint64_t v10 = 0;
    goto LABEL_48;
  }
  uint64_t v10 = [v6 draggingLaunchActions];
  unsigned __int16 v57 = [v6 draggingLaunchURL];
  uint64_t v11 = [v6 draggingStartLocation];
  if ([v5 isWidgetIcon]) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  if (v13)
  {
    uint64_t v52 = v11;
    uint64_t v60 = v10;
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = [v13 activeDataSource];
    int v56 = [v14 uniqueIdentifier];

    uint64_t v50 = [v13 gridSizeClass];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v51 = v13;
    id obj = [v13 iconDataSources];
    uint64_t v15 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (!v15) {
      goto LABEL_34;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v72;
    while (1)
    {
      uint64_t v18 = 0;
      id v62 = (id)v16;
      do
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(obj);
        }
        double v19 = *(void **)(*((void *)&v71 + 1) + 8 * v18);
        double v20 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v22 = v17;
          id v23 = v19;
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          double v25 = [v23 kind];
          if (v25) {
            [v24 setObject:v25 forKey:@"kind"];
          }
          uint64_t v26 = objc_msgSend(v23, "uniqueIdentifier", v50);
          if (v26) {
            [v24 setObject:v26 forKey:@"uniqueIdentifier"];
          }
          id v27 = [v23 extensionBundleIdentifier];
          if (v27) {
            [v24 setObject:v27 forKey:@"extensionBundleIdentifier"];
          }
          uint64_t v28 = [v23 containerBundleIdentifier];
          if (v28) {
            [v24 setObject:v28 forKey:@"containerBundleIdentifier"];
          }
          long long v29 = [v23 supportedGridSizeClasses];
          if (v29) {
            [v24 setObject:v29 forKey:@"supportedGridSizeClasses"];
          }
          [v65 addObject:v24];

          uint64_t v17 = v22;
          uint64_t v16 = (uint64_t)v62;
        }
        else
        {
          int v30 = self;
          char v31 = objc_opt_isKindOfClass();

          if ((v31 & 1) == 0) {
            goto LABEL_32;
          }
          id v32 = v19;
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          double v25 = [v32 uniqueIdentifier];
          if (v25) {
            [v24 setObject:v25 forKey:@"uniqueIdentifier"];
          }
          uint64_t v26 = [(id)objc_opt_class() elementIdentifier];
          if (v26) {
            [v24 setObject:v26 forKey:@"elementIdentifier"];
          }
          id v27 = objc_msgSend(v32, "supportedGridSizeClasses", v50);
          if (v27) {
            [v24 setObject:v27 forKey:@"supportedGridSizeClasses"];
          }
          [v65 addObject:v24];
        }

LABEL_32:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (!v16)
      {
LABEL_34:

        double v9 = (__CFString *)v50;
        id v13 = v51;
        uint64_t v10 = v60;
        uint64_t v11 = v52;
        goto LABEL_37;
      }
    }
  }
  id v65 = 0;
  int v56 = 0;
LABEL_37:
  uint64_t v33 = objc_alloc_init(SBIconViewDragInfo);
  [(SBIconViewDragInfo *)v33 setUniqueIdentifier:v59];
  [(SBIconViewDragInfo *)v33 setApplicationBundleIdentifier:v58];
  [(SBIconViewDragInfo *)v33 setLaunchURL:v57];
  [(SBIconViewDragInfo *)v33 setStartLocation:v11];
  if (v13)
  {
    [(SBIconViewDragInfo *)v33 setActiveCustomIconDataSourceUniqueIdentifier:v56];
    [(SBIconViewDragInfo *)v33 setCustomIconDataSourceConfigurations:v65];
    [(SBIconViewDragInfo *)v33 setGridSizeClass:v9];
  }
  obja = v9;
  id v70 = 0;
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v70, v50);
  id v35 = v70;
  if (v34)
  {
    if ((unint64_t)[v34 length] <= 0x2000)
    {
      [v61 setTeamData:v34];
      goto LABEL_47;
    }
    id v36 = SBLogIconDragging();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      SBHIconDragItemWithIconAndIconView_cold_2((uint64_t)v33, v36);
    }
  }
  else
  {
    id v36 = SBLogIconDragging();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      SBHIconDragItemWithIconAndIconView_cold_1((uint64_t)v35, (uint64_t)v33, v36);
    }
  }

LABEL_47:
LABEL_48:
  if ([v5 isFolderIcon])
  {
    int v37 = [v5 folder];
    unsigned int v38 = [v37 leafIcons];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v40 = v38;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v67 != v43) {
            objc_enumerationMutation(v40);
          }
          id v45 = [*(id *)(*((void *)&v66 + 1) + 8 * i) uniqueIdentifier];
          if (v45) {
            [v39 addObject:v45];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v42);
    }
  }
  else
  {
    id v39 = 0;
  }
  char v46 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v61];
  double v47 = (void *)[objc_alloc(MEMORY[0x1E4FA6998]) initWithUniqueIdentifier:v59 withLaunchActions:v10 startLocation:SBHAppDragLocalContextStartLocationToSBSLocation(v11)];
  [v47 setApplicationBundleIdentifier:v58];
  [v47 setLaunchURL:v57];
  int v48 = [v5 representedSceneIdentifier];
  [v47 setDraggedSceneIdentifier:v48];

  [v47 setSourceLocal:1];
  [v47 setUserActivity:v53];
  [v47 setContainedIconIdentifiers:v39];
  [v47 setActiveCustomIconDataSourceUniqueIdentifier:v56];
  [v47 setCustomIconDataSourceConfigurations:v65];
  [v47 setGridSizeClass:obja];
  objc_msgSend(v46, "sbh_setAppDragLocalContext:", v47);

  return v46;
}

uint64_t __SBHIconDragItemWithIconAndIconView_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9B8];
  id v3 = a2;
  uint64_t v4 = [v2 data];
  v3[2](v3, v4, 0);

  return 0;
}

__CFString *SBHIconLocationForSBHAppDragLocalContextStartLocation(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationUnknown";
      break;
    case 1:
      uint64_t v2 = SBIconLocationRoot;
      goto LABEL_14;
    case 2:
      uint64_t v2 = SBIconLocationStackConfiguration;
      goto LABEL_14;
    case 3:
      uint64_t v2 = SBIconLocationAddWidgetSheet;
      goto LABEL_14;
    case 4:
      uint64_t v2 = SBIconLocationAppLibrary;
      goto LABEL_14;
    case 5:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationSpotlight";
      break;
    case 6:
      uint64_t v2 = SBIconLocationFloatingDock;
      goto LABEL_14;
    case 7:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationFloatingDockSuggestions";
      break;
    case 8:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationWindow";
      break;
    case 9:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationNotification";
      break;
    case 10:
      uint64_t v2 = SBIconLocationTodayView;
LABEL_14:
      uint64_t v1 = *v2;
      break;
    case 11:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationSwitcher";
      break;
    case 12:
      uint64_t v1 = @"SBHAppDragLocalContextStartLocationShelf";
      break;
    default:
      uint64_t v1 = 0;
      break;
  }
  return v1;
}

void sub_1D8153A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _SBIconIsLeafIconAndNotWidgetIcon(void *a1)
{
  id v1 = a1;
  if ([v1 isLeafIcon]) {
    uint64_t v2 = [v1 isWidgetIcon] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1D8154A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8154EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8158DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

BOOL SBIconImageInfoEqualToIconImageInfo(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 == a5 && a2 == a6 && a3 == a7 && a4 == a8;
}

BOOL SBIconImageInfoSizeAndScaleEqualToIconImageInfo(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 == a5 && a2 == a6 && a3 == a7;
}

void sub_1D8160AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 168));
  _Unwind_Resume(a1);
}

void sub_1D8160B10()
{
}

void sub_1D8160B18()
{
}

void sub_1D8160CAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D8160DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D8160EDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D8160FF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D816110C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D8161224(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D816133C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void SBHAddWidgetSheetCompactViewIconMetricsForScale(uint64_t a1@<X8>, double a2@<D0>)
{
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = 0u;
  *(void *)a1 = 0x4030000000000000;
  *(double *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = SBIconImageInfoMake(48.0, 48.0, a2, 12.0);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
}

void SBHAddWidgetSheetSplitViewIconMetricsForScale(uint64_t a1@<X8>, double a2@<D0>)
{
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = 0u;
  *(void *)a1 = 0x4028000000000000;
  *(double *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = SBIconImageInfoMake(32.0, 32.0, a2, 10.0);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
}

void SBHAddWidgetSheetListViewIconMetricsForScale(uint64_t a1@<X8>, double a2@<D0>)
{
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 29.0, 29.0, a2);
  [v12 size];
  double v5 = v4;
  double v7 = v6;
  [v12 continuousCornerRadius];
  *(double *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = SBIconImageInfoMake(v5, v7, a2, v8);
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v11;
}

uint64_t SBHWidgetFilteringParametersNone()
{
  return 0;
}

BOOL SBHStackLayoutMetricsEqualToMetrics(double *a1, double *a2)
{
  if (*a1 != *a2 || a1[6] != a2[6] || a1[5] != a2[5] || a1[7] != a2[7]) {
    return 0;
  }
  if (a1[1] != a2[1] || a1[2] != a2[2]) {
    return 0;
  }
  if (a1[4] == a2[4]) {
    return a1[3] == a2[3];
  }
  return 0;
}

id SBViewClassForIconLabelAccessoryType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_opt_class();
  }
  return v2;
}

void sub_1D8165D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8165FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8166434(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D816665C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation@<Q0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_onceToken != -1) {
    dispatch_once(&SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_onceToken, &__block_literal_global_72);
  }
  if (SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sCurrentScreenType == a1)
  {
    if ((unint64_t)(a2 - 3) > 1) {
      double v6 = &SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sPortraitMetrics;
    }
    else {
      double v6 = &SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sLandscapeMetrics;
    }
    long long v8 = v6[5];
    *(_OWORD *)(a3 + 64) = v6[4];
    *(_OWORD *)(a3 + 80) = v8;
    *(_OWORD *)(a3 + 96) = v6[6];
    *(void *)(a3 + 112) = *((void *)v6 + 14);
    long long v9 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v9;
    __n128 result = (__n128)v6[2];
    long long v10 = v6[3];
    *(__n128 *)(a3 + 32) = result;
    *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x220], 8) = v10;
  }
  else
  {
    _uncachedMetricsForScreenTypeAndInterfaceOrientation(a1, a2, a3);
  }
  return result;
}

void __SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_block_invoke()
{
  uint64_t v0 = SBHScreenTypeForCurrentDevice();
  if (SBHScreenTypeIsPad(v0))
  {
    SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sCurrentScreenType = v0;
    _uncachedMetricsForScreenTypeAndInterfaceOrientation(v0, 3, (uint64_t)&SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sLandscapeMetrics);
    _uncachedMetricsForScreenTypeAndInterfaceOrientation(v0, 1, (uint64_t)&SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sPortraitMetrics);
  }
}

void _uncachedMetricsForScreenTypeAndInterfaceOrientation(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x220], 8) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  unint64_t v5 = a2 - 3;
  double v6 = 0.0;
  *(_OWORD *)a3 = 0u;
  double v7 = 0.0;
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      double v7 = 16.0;
      goto LABEL_10;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x29uLL:
    case 0x2EuLL:
      BOOL v8 = v5 >= 2;
      double v9 = 20.0;
      goto LABEL_8;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2BuLL:
    case 0x2CuLL:
      BOOL v8 = v5 >= 2;
      double v9 = 24.0;
LABEL_8:
      if (!v8) {
        double v7 = v9;
      }
      goto LABEL_10;
    case 0x21uLL:
    case 0x28uLL:
    case 0x2AuLL:
    case 0x2DuLL:
    case 0x2FuLL:
      double v7 = 36.0;
      if (v5 >= 2) {
        double v7 = 0.0;
      }
      goto LABEL_10;
    case 0x22uLL:
      double v18 = 57.5;
      if (v5 >= 2) {
        double v18 = 0.0;
      }
      *(double *)a3 = v18;
LABEL_31:
      double v19 = 19.0;
      if (v5 < 2) {
        double v19 = 26.0;
      }
      *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v19;
LABEL_34:
      BOOL v20 = v5 < 2;
      int v21 = &unk_1D81E91A0;
LABEL_64:
      *(void *)(a3 + 16) = v21[v20];
      *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
      *(void *)(a3 + 24) = v16.i64[0];
      *(void *)(a3 + 32) = v16.i64[0];
LABEL_65:
      double v12 = 16.0;
      goto LABEL_88;
    default:
LABEL_10:
      *(double *)a3 = v7;
      switch(a1)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
          double v6 = 24.0;
          goto LABEL_18;
        case 3uLL:
        case 4uLL:
        case 6uLL:
        case 9uLL:
        case 0x18uLL:
        case 0x1CuLL:
          double v6 = 16.0;
          goto LABEL_18;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x29uLL:
          BOOL v10 = v5 >= 2;
          double v6 = 19.0;
          double v11 = 20.0;
          goto LABEL_16;
        case 0x1FuLL:
          double v22 = 16.0;
          if (v5 < 2) {
            double v22 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v22;
LABEL_38:
          BOOL v23 = v5 < 2;
          id v24 = (double *)&unk_1D81E9170;
          goto LABEL_85;
        case 0x20uLL:
          double v25 = 17.0;
          if (v5 < 2) {
            double v25 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v25;
LABEL_42:
          *(void *)(a3 + 16) = qword_1D81E9160[v5 < 2];
          *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
          *(void *)(a3 + 24) = v16.i64[0];
          *(void *)(a3 + 32) = v16.i64[0];
LABEL_43:
          *(void *)(a3 + 40) = 0x4038000000000000;
LABEL_89:
          double v38 = 1.0;
          goto LABEL_90;
        case 0x21uLL:
        case 0x28uLL:
          BOOL v10 = v5 >= 2;
          double v6 = 16.0;
          double v11 = 26.0;
          goto LABEL_16;
        case 0x22uLL:
          goto LABEL_31;
        case 0x23uLL:
        case 0x24uLL:
          BOOL v10 = v5 >= 2;
          double v6 = 15.5;
          double v11 = 24.0;
LABEL_16:
          if (!v10) {
            double v6 = v11;
          }
          goto LABEL_18;
        case 0x25uLL:
          double v26 = 15.5;
          if (v5 < 2) {
            double v26 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v26;
LABEL_47:
          BOOL v27 = v5 >= 2;
          double v28 = 180.5;
          double v29 = 288.0;
          goto LABEL_74;
        case 0x26uLL:
          double v30 = 17.5;
          if (v5 < 2) {
            double v30 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v30;
LABEL_51:
          BOOL v20 = v5 < 2;
          int v21 = &unk_1D81E9150;
          goto LABEL_64;
        case 0x27uLL:
          double v31 = 17.5;
          if (v5 < 2) {
            double v31 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v31;
LABEL_55:
          BOOL v23 = v5 < 2;
          id v24 = (double *)&unk_1D81E9130;
          goto LABEL_85;
        case 0x2AuLL:
          double v32 = 16.0;
          if (v5 < 2) {
            double v32 = 26.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v32;
LABEL_59:
          BOOL v27 = v5 >= 2;
          double v28 = 256.0;
          double v29 = 290.0;
          goto LABEL_74;
        case 0x2BuLL:
          double v33 = 17.5;
          if (v5 < 2) {
            double v33 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v33;
LABEL_63:
          BOOL v20 = v5 < 2;
          int v21 = &unk_1D81E9140;
          goto LABEL_64;
        case 0x2CuLL:
          double v34 = 17.5;
          if (v5 < 2) {
            double v34 = 24.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v34;
LABEL_69:
          BOOL v23 = v5 < 2;
          id v24 = (double *)&unk_1D81E9120;
          goto LABEL_85;
        case 0x2DuLL:
          double v35 = 16.0;
          if (v5 < 2) {
            double v35 = 26.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v35;
LABEL_73:
          BOOL v27 = v5 >= 2;
          double v28 = 232.0;
          double v29 = 276.0;
LABEL_74:
          if (!v27) {
            double v28 = v29;
          }
          goto LABEL_86;
        case 0x2EuLL:
          double v36 = 19.0;
          if (v5 < 2) {
            double v36 = 20.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v36;
LABEL_80:
          BOOL v23 = v5 < 2;
          id v24 = (double *)&unk_1D81E9180;
          goto LABEL_85;
        case 0x2FuLL:
          double v37 = 16.0;
          if (v5 < 2) {
            double v37 = 26.0;
          }
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v37;
LABEL_84:
          BOOL v23 = v5 < 2;
          id v24 = (double *)&unk_1D81E9110;
LABEL_85:
          double v28 = v24[v23];
LABEL_86:
          *(double *)(a3 + 16) = v28;
          *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
          *(void *)(a3 + 24) = v16.i64[0];
          *(void *)(a3 + 32) = v16.i64[0];
LABEL_87:
          double v12 = 26.0;
          break;
        default:
LABEL_18:
          *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v6;
          double v12 = 0.0;
          double v13 = 0.0;
          switch(a1)
          {
            case 0uLL:
            case 1uLL:
            case 2uLL:
            case 5uLL:
            case 7uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xBuLL:
            case 0xCuLL:
            case 0xDuLL:
            case 0xEuLL:
            case 0xFuLL:
            case 0x10uLL:
            case 0x11uLL:
            case 0x12uLL:
            case 0x13uLL:
            case 0x14uLL:
            case 0x15uLL:
            case 0x16uLL:
            case 0x17uLL:
            case 0x19uLL:
            case 0x1AuLL:
            case 0x1BuLL:
              double v13 = 249.0;
              goto LABEL_26;
            case 3uLL:
            case 4uLL:
            case 6uLL:
            case 9uLL:
            case 0x18uLL:
            case 0x1CuLL:
              double v13 = 232.0;
              goto LABEL_26;
            case 0x1DuLL:
            case 0x1EuLL:
            case 0x29uLL:
              double v13 = dbl_1D81E9190[v5 < 2];
              goto LABEL_26;
            case 0x1FuLL:
              goto LABEL_38;
            case 0x20uLL:
              goto LABEL_42;
            case 0x21uLL:
            case 0x28uLL:
              BOOL v14 = v5 >= 2;
              double v13 = 224.0;
              double v15 = 266.0;
              goto LABEL_24;
            case 0x22uLL:
              goto LABEL_34;
            case 0x23uLL:
            case 0x24uLL:
              BOOL v14 = v5 >= 2;
              double v13 = 216.0;
              double v15 = 268.0;
LABEL_24:
              if (!v14) {
                double v13 = v15;
              }
              goto LABEL_26;
            case 0x25uLL:
              goto LABEL_47;
            case 0x26uLL:
              goto LABEL_51;
            case 0x27uLL:
              goto LABEL_55;
            case 0x2AuLL:
              goto LABEL_59;
            case 0x2BuLL:
              goto LABEL_63;
            case 0x2CuLL:
              goto LABEL_69;
            case 0x2DuLL:
              goto LABEL_73;
            case 0x2EuLL:
              goto LABEL_80;
            case 0x2FuLL:
              goto LABEL_84;
            default:
LABEL_26:
              *(double *)(a3 + 16) = v13;
              *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
              *(void *)(a3 + 24) = v16.i64[0];
              *(void *)(a3 + 32) = v16.i64[0];
              switch(a1)
              {
                case 0uLL:
                case 1uLL:
                case 2uLL:
                case 3uLL:
                case 4uLL:
                case 5uLL:
                case 6uLL:
                case 7uLL:
                case 8uLL:
                case 9uLL:
                case 0xAuLL:
                case 0xBuLL:
                case 0xCuLL:
                case 0xDuLL:
                case 0xEuLL:
                case 0xFuLL:
                case 0x10uLL:
                case 0x11uLL:
                case 0x12uLL:
                case 0x13uLL:
                case 0x14uLL:
                case 0x15uLL:
                case 0x16uLL:
                case 0x17uLL:
                case 0x18uLL:
                case 0x19uLL:
                case 0x1AuLL:
                case 0x1BuLL:
                case 0x1CuLL:
                  double v12 = 20.0;
                  goto LABEL_88;
                case 0x1DuLL:
                case 0x1EuLL:
                case 0x1FuLL:
                case 0x21uLL:
                case 0x23uLL:
                case 0x25uLL:
                case 0x27uLL:
                case 0x28uLL:
                case 0x29uLL:
                case 0x2AuLL:
                case 0x2CuLL:
                case 0x2DuLL:
                case 0x2EuLL:
                case 0x2FuLL:
                  goto LABEL_87;
                case 0x20uLL:
                  goto LABEL_43;
                case 0x22uLL:
                case 0x24uLL:
                case 0x26uLL:
                case 0x2BuLL:
                  goto LABEL_65;
                default:
                  goto LABEL_88;
              }
          }
      }
LABEL_88:
      *(double *)(a3 + 40) = v12;
      switch(a1)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x25uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x2AuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2FuLL:
          goto LABEL_89;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x22uLL:
        case 0x29uLL:
        case 0x2EuLL:
          BOOL v43 = v5 >= 2;
          double v38 = 0.95;
          goto LABEL_121;
        case 0x23uLL:
        case 0x24uLL:
        case 0x26uLL:
        case 0x2BuLL:
          BOOL v43 = v5 >= 2;
          double v38 = 0.875;
LABEL_121:
          if (!v43) {
            double v38 = 1.0;
          }
          break;
        default:
          double v38 = 0.0;
          break;
      }
LABEL_90:
      *(double *)(a3 + 4_Block_object_dispose(&STACK[0x220], 8) = v38;
      switch(a1)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
          int64x2_t v39 = vdupq_n_s64(0x405DC00000000000uLL);
          break;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x22uLL:
        case 0x29uLL:
        case 0x2EuLL:
          v16.i64[0] = v5;
          v17.i64[0] = 2;
          int8x16_t v40 = (int8x16_t)vdupq_lane_s64(vcgtq_u64(v17, v16).i64[0], 0);
          int8x16_t v41 = *(int8x16_t *)MEMORY[0x1E4F1DB30];
          unint64_t v42 = 0x405C800000000000;
          goto LABEL_96;
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x25uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x2AuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2FuLL:
          int64x2_t v39 = *(int64x2_t *)MEMORY[0x1E4F1DB30];
          break;
        case 0x23uLL:
        case 0x24uLL:
        case 0x26uLL:
        case 0x2BuLL:
          v16.i64[0] = v5;
          v17.i64[0] = 2;
          int8x16_t v40 = (int8x16_t)vdupq_lane_s64(vcgtq_u64(v17, v16).i64[0], 0);
          int8x16_t v41 = *(int8x16_t *)MEMORY[0x1E4F1DB30];
          unint64_t v42 = 0x405DC00000000000;
LABEL_96:
          int64x2_t v39 = (int64x2_t)vbslq_s8(v40, v41, (int8x16_t)vdupq_n_s64(v42));
          break;
        default:
          int64x2_t v39 = 0uLL;
          break;
      }
      *(int64x2_t *)(a3 + 56) = v39;
      if (a1 >= 0x1D)
      {
        if (a1 - 29 >= 0x13)
        {
          uint64_t v44 = 0;
        }
        else
        {
          uint64_t v44 = 4;
          if (v5 < 2) {
            uint64_t v44 = 5;
          }
        }
      }
      else
      {
        uint64_t v44 = 2;
      }
      *(void *)(a3 + 72) = v44;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      if (a1 <= 0x2F)
      {
        uint64_t v46 = qword_1D81E91B0[a1];
        uint64_t v47 = 0x4046800000000000;
      }
      *(void *)(a3 + 80) = v47;
      *(void *)(a3 + 8_Block_object_dispose(&STACK[0x220], 8) = v46;
      if (a1 <= 0x2F) {
        uint64_t v45 = qword_1D81E9330[a1];
      }
      *(void *)(a3 + 112) = v45;
      if (a1 >= 0x1D)
      {
        if (a1 - 29 >= 0x13)
        {
          double v48 = 0.0;
        }
        else
        {
          double v48 = 50.0;
          if (v5 < 2) {
            double v48 = 30.0;
          }
        }
      }
      else
      {
        double v48 = 5.0;
      }
      *(double *)(a3 + 96) = v48;
      if (a1 > 0x2F)
      {
        double v49 = 0.0;
      }
      else if (((1 << a1) & 0xEFFFDA7) != 0)
      {
        double v49 = 24.0;
      }
      else if (((1 << a1) & 0xFFFFE0000000) != 0)
      {
        double v49 = 50.0;
        if (v5 < 2) {
          double v49 = 46.0;
        }
      }
      else
      {
        double v49 = 21.0;
      }
      *(double *)(a3 + 104) = v49;
      return;
  }
}

double _addWidgetSheetTrailingPadding(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 - 3;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 25:
    case 26:
    case 27:
      return 24.0;
    case 3:
    case 4:
    case 6:
    case 9:
    case 24:
    case 28:
      return 16.0;
    case 29:
    case 30:
    case 41:
    case 46:
      BOOL v4 = v2 >= 2;
      double result = 16.0;
      double v5 = 20.0;
      goto LABEL_13;
    case 31:
    case 38:
    case 43:
      BOOL v4 = v2 >= 2;
      double result = 18.0;
      goto LABEL_12;
    case 32:
      BOOL v4 = v2 >= 2;
      double result = 17.5;
      goto LABEL_12;
    case 33:
    case 40:
    case 45:
      BOOL v4 = v2 >= 2;
      double result = 18.0;
      double v5 = 29.0;
      goto LABEL_13;
    case 34:
      BOOL v4 = v2 >= 2;
      double result = 16.0;
      double v5 = 26.0;
      goto LABEL_13;
    case 35:
    case 36:
      BOOL v4 = v2 >= 2;
      double result = 19.5;
LABEL_12:
      double v5 = 24.0;
LABEL_13:
      if (!v4) {
        return v5;
      }
      return result;
    case 37:
      BOOL v6 = v2 >= 2;
      double result = 49.5;
      double v7 = 16.0;
      goto LABEL_18;
    case 39:
    case 44:
      BOOL v6 = v2 >= 2;
      double result = 60.5;
      double v7 = 18.0;
      goto LABEL_18;
    case 42:
    case 47:
      BOOL v6 = v2 >= 2;
      double result = 59.0;
      double v7 = 30.0;
LABEL_18:
      if (v6) {
        double result = v7;
      }
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

void sub_1D816BED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void sub_1D816C78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

BOOL _SBHTraitEnvironmentIsAccessibilityTextSize(void *a1)
{
  uint64_t v1 = [a1 traitCollection];
  unint64_t v2 = [v1 preferredContentSizeCategory];

  if (v2) {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);
  }
  else {
    BOOL IsAccessibilityCategory = 0;
  }

  return IsAccessibilityCategory;
}

void sub_1D8172940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8175100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D81762DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8178648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8178A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBHWidgetMetricsSpecificationWithLayoutProviderScreenTypeAndFamilies(void *a1)
{
  id v1 = a1;
  id v5 = objc_alloc_init(MEMORY[0x1E4F58D60]);
  id v2 = v1;
  CHSWidgetFamilyMaskEnumerateFamilies();
  id v3 = v5;

  return v3;
}

id SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = [a2 layoutForIconLocation:@"SBIconLocationRoot"];
  if (objc_opt_respondsToSelector())
  {
    SBHIconGridSizeClassForCHSWidgetFamily(a1);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v5 iconImageInfoForGridSizeClass:v6];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    if (v6 != @"SBHIconGridSizeClassSmall")
    {
      char v13 = [(__CFString *)v6 isEqualToString:@"SBHIconGridSizeClassSmall"];
      double v7 = v8;
      if ((v13 & 1) == 0) {
        objc_msgSend(v5, "iconImageInfoForGridSizeClass:", @"SBHIconGridSizeClassSmall", v8);
      }
    }
    double v44 = v12;
    double v45 = v10;
    double v41 = v7;
    if (a3 - 2 > 0x2D) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = qword_1D81E94D0[a3 - 2];
    }
    double v16 = *MEMORY[0x1E4FB2848];
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v19 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v5, "widgetContentMargins", v16, v17, v18, v19);
    }
    CHSEdgeInsetsMake();
    double v42 = v21;
    double v43 = v20;
    double v23 = v22;
    double v25 = v24;
    if (objc_opt_respondsToSelector()) {
      [v5 widgetContentMarginsWithBackgroundRemoved];
    }
    CHSEdgeInsetsMake();
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    id v34 = v5;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v34 widgetScaleFactor], double v36 = v35, BSFloatIsZero()))
    {
      double v36 = 1.0;
      if (!SBHScreenTypeIsPhone(a3)) {
        double v36 = v41 / _SBHDefaultSmallWidgetCanvasDimension(a3);
      }
    }

    if ((BSFloatIsOne() & 1) == 0)
    {
      double v8 = v8 / v36;
      double v44 = v44 / v36;
      double v45 = v45 / v36;
      double v42 = v42 / v36;
      double v43 = v43 / v36;
      double v23 = v23 / v36;
      double v25 = v25 / v36;
      double v27 = v27 / v36;
      double v29 = v29 / v36;
      double v31 = v31 / v36;
      double v33 = v33 / v36;
    }
    if (objc_opt_respondsToSelector())
    {
      if ([v34 widgetsSupportDynamicText]) {
        uint64_t v37 = 1;
      }
      else {
        uint64_t v37 = 2;
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
    id v38 = objc_alloc(MEMORY[0x1E4F58E78]);
    int64x2_t v39 = objc_msgSend(v38, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", *MEMORY[0x1E4F58BC0], *(double *)(MEMORY[0x1E4F58BC0] + 8), *(double *)(MEMORY[0x1E4F58BC0] + 16), *(double *)(MEMORY[0x1E4F58BC0] + 24), *MEMORY[0x1E4F58BC0], *(double *)(MEMORY[0x1E4F58BC0] + 8), *(double *)(MEMORY[0x1E4F58BC0] + 16), *(double *)(MEMORY[0x1E4F58BC0] + 24), *(void *)&v43, *(void *)&v42, *(void *)&v23, *(void *)&v25, *(void *)&v27, *(void *)&v29, *(void *)&v31, *(void *)&v33);
    double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F58E80]), "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:", v14, v39, v37, v8, v45, v44, v36);
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

void __SBHWidgetMetricsSpecificationWithLayoutProviderScreenTypeAndFamilies_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(a2, *(void **)(a1 + 40), *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setMetrics:v4 forFamily:a2];
}

void sub_1D817D5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHSearchIconImageSymbolConfiguration()
{
  return [MEMORY[0x1E4FB1830] configurationWithWeight:4];
}

uint64_t SBHFeatureEnabled(uint64_t a1)
{
  char v1 = a1;
  if (a1) {
    LODWORD(result) = 0;
  }
  else {
    LODWORD(result) = _os_feature_enabled_impl();
  }
  if ((overriddenEnabledFeatures & (1 << v1)) != 0) {
    return 1;
  }
  else {
    return result;
  }
}

uint64_t SBHOverrideFeatureEnabled(uint64_t result, int a2)
{
  int v2 = 1 << result;
  if (a2) {
    uint64_t v3 = overriddenEnabledFeatures | v2;
  }
  else {
    uint64_t v3 = overriddenEnabledFeatures & ~v2;
  }
  overriddenEnabledFeatures = v3;
  return result;
}

void __SBIconAccessoryCountedMap_block_invoke()
{
  uint64_t v0 = objc_alloc_init(SBCountedMap);
  char v1 = (void *)SBIconAccessoryCountedMap___accessoryCountedMap;
  SBIconAccessoryCountedMap___accessoryCountedMap = (uint64_t)v0;
}

__CFString *SBHStringForIconImageAppearanceType(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E6AB5390[a1];
  }
}

uint64_t SBHEnumerateScreenTypes(uint64_t a1)
{
  uint64_t v2 = 0;
  do
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 16))(a1, v2, &v5);
    if (v5) {
      break;
    }
  }
  while (v2++ != 47);
  return result;
}

unint64_t SBHScreenTypeHasHomeButton(unint64_t a1)
{
  return (a1 > 0x2F) | (0x3E0000007uLL >> a1) & 1;
}

unint64_t SBHScreenTypeIsMoreSpace(unint64_t a1)
{
  return (a1 > 0x2E) | (0x14A000000000uLL >> a1) & 1;
}

unint64_t SBHScreenTypeIsZoomed(unint64_t a1)
{
  return (a1 > 0x2F) | (0x420015555550uLL >> a1) & 1;
}

BOOL SBHScreenTypeIsPad(uint64_t a1)
{
  return (unint64_t)(a1 - 29) < 0x13;
}

BOOL SBHScreenTypeIsPhone(unint64_t a1)
{
  return a1 < 0x1D;
}

__CFString *SBHStringForScreenType(unint64_t a1)
{
  if (a1 > 0x2F) {
    return 0;
  }
  else {
    return off_1E6AB53B0[a1];
  }
}

__CFString *SBHShortStringForScreenType(unint64_t a1)
{
  if (a1 > 0x2F) {
    return 0;
  }
  else {
    return off_1E6AB5530[a1];
  }
}

uint64_t SBHScreenTypeForShortString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"N61"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"N56"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"N41"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"D22"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"D22Zoomed"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"D33"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"D33Zoomed"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"N84"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"N84Zoomed"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"D52"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"D52Zoomed"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"D53"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"D53Zoomed"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"D54"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"D54Zoomed"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"D16"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"D16Zoomed"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"D63"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"D63Zoomed"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"D64"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"D64Zoomed"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"D73"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqualToString:@"D73Zoomed"])
  {
    uint64_t v2 = 22;
  }
  else if ([v1 isEqualToString:@"D74"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqualToString:@"D74Zoomed"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"D93"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"D93Zoomed"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqualToString:@"D94"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqualToString:@"D94Zoomed"])
  {
    uint64_t v2 = 28;
  }
  else if ([v1 isEqualToString:@"J1"])
  {
    uint64_t v2 = 29;
  }
  else if ([v1 isEqualToString:@"J85"])
  {
    uint64_t v2 = 30;
  }
  else if ([v1 isEqualToString:@"J171"])
  {
    uint64_t v2 = 31;
  }
  else if ([v1 isEqualToString:@"J207"])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:@"J99"])
  {
    uint64_t v2 = 33;
  }
  else if ([v1 isEqualToString:@"J310"])
  {
    uint64_t v2 = 34;
  }
  else if ([v1 isEqualToString:@"J271"])
  {
    uint64_t v2 = 35;
  }
  else if ([v1 isEqualToString:@"J307"])
  {
    uint64_t v2 = 36;
  }
  else if ([v1 isEqualToString:@"J307MoreSpace"])
  {
    uint64_t v2 = 37;
  }
  else if ([v1 isEqualToString:@"J317"])
  {
    uint64_t v2 = 38;
  }
  else if ([v1 isEqualToString:@"J317MoreSpace"])
  {
    uint64_t v2 = 39;
  }
  else if ([v1 isEqualToString:@"J320"])
  {
    uint64_t v2 = 40;
  }
  else if ([v1 isEqualToString:@"J320Zoomed"])
  {
    uint64_t v2 = 41;
  }
  else if ([v1 isEqualToString:@"J320MoreSpace"])
  {
    uint64_t v2 = 42;
  }
  else if ([v1 isEqualToString:@"J717"])
  {
    uint64_t v2 = 43;
  }
  else if ([v1 isEqualToString:@"J717MoreSpace"])
  {
    uint64_t v2 = 44;
  }
  else if ([v1 isEqualToString:@"J720"])
  {
    uint64_t v2 = 45;
  }
  else if ([v1 isEqualToString:@"J720Zoomed"])
  {
    uint64_t v2 = 46;
  }
  else if ([v1 isEqualToString:@"J720MoreSpace"])
  {
    uint64_t v2 = 47;
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t SBHGetScreenSpecification@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if ((unint64_t)(result - 3) > 0x2C) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_1D81E9710[result - 3];
  }
  *(void *)(a2 + 32) = v2;
  switch(result)
  {
    case 0:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 16);
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 568;
      goto LABEL_58;
    case 1:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 32);
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 569;
      goto LABEL_58;
    case 2:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 48);
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 570;
      goto LABEL_58;
    case 3:
      long long v10 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
      goto LABEL_22;
    case 4:
      long long v10 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
LABEL_22:
      *(_OWORD *)a2 = v10;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2436;
      goto LABEL_58;
    case 5:
      long long v11 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 112);
      goto LABEL_25;
    case 6:
      long long v11 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
LABEL_25:
      *(_OWORD *)a2 = v11;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2688;
      goto LABEL_58;
    case 7:
      long long v12 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 112);
      goto LABEL_28;
    case 8:
      long long v12 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
LABEL_28:
      *(_OWORD *)a2 = v12;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 1792;
      goto LABEL_58;
    case 9:
    case 15:
      long long v4 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
      goto LABEL_9;
    case 10:
    case 16:
      long long v4 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
LABEL_9:
      *(_OWORD *)a2 = v4;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2340;
      goto LABEL_58;
    case 11:
    case 17:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 96);
      goto LABEL_11;
    case 12:
    case 18:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
LABEL_11:
      *(_OWORD *)a2 = v3;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2532;
      goto LABEL_58;
    case 13:
    case 19:
      long long v7 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 128);
      goto LABEL_14;
    case 14:
    case 20:
      long long v7 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
LABEL_14:
      *(_OWORD *)a2 = v7;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2778;
      goto LABEL_58;
    case 21:
      long long v13 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 144);
      goto LABEL_31;
    case 22:
      long long v13 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
LABEL_31:
      *(_OWORD *)a2 = v13;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2556;
      goto LABEL_58;
    case 23:
      long long v14 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 160);
      goto LABEL_34;
    case 24:
      long long v14 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
LABEL_34:
      *(_OWORD *)a2 = v14;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2796;
      goto LABEL_58;
    case 25:
      long long v15 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 176);
      goto LABEL_37;
    case 26:
      long long v15 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
LABEL_37:
      *(_OWORD *)a2 = v15;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2622;
      goto LABEL_58;
    case 27:
      long long v16 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 192);
      goto LABEL_40;
    case 28:
      long long v16 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
LABEL_40:
      *(_OWORD *)a2 = v16;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2868;
      goto LABEL_58;
    case 29:
    case 30:
    case 41:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 208);
      *(void *)(a2 + 16) = 0x4000000000000000;
      return result;
    case 31:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 224);
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2160;
      goto LABEL_58;
    case 32:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 240);
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2224;
      goto LABEL_58;
    case 33:
    case 40:
      long long v8 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 256);
      goto LABEL_50;
    case 34:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 272);
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2266;
      goto LABEL_58;
    case 35:
    case 36:
      long long v9 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 320);
      goto LABEL_45;
    case 37:
      long long v9 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 336);
LABEL_45:
      *(_OWORD *)a2 = v9;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2360;
      goto LABEL_58;
    case 38:
      long long v17 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 352);
      goto LABEL_48;
    case 39:
      long long v17 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 368);
LABEL_48:
      *(_OWORD *)a2 = v17;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2388;
      goto LABEL_58;
    case 42:
      long long v8 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 432);
LABEL_50:
      *(_OWORD *)a2 = v8;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2732;
      goto LABEL_58;
    case 43:
      long long v18 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 384);
      goto LABEL_53;
    case 44:
      long long v18 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 400);
LABEL_53:
      *(_OWORD *)a2 = v18;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2420;
      goto LABEL_58;
    case 45:
      long long v19 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 448);
      goto LABEL_57;
    case 46:
      long long v19 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 304);
      goto LABEL_57;
    case 47:
      long long v19 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 464);
LABEL_57:
      *(_OWORD *)a2 = v19;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2752;
LABEL_58:
      *(void *)(a2 + 16) = v5;
      *(void *)(a2 + 24) = v6;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBHScreenSpecificationEqualToScreenSpecification(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(double *)(a1 + 16) == *(double *)(a2 + 16);
  if (*(double *)a1 != *(double *)a2) {
    BOOL v3 = 0;
  }
  uint64_t result = *(double *)(a1 + 8) == *(double *)(a2 + 8) && v3;
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    if (v6) {
      BOOL v7 = v5 == v6;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t result = result;
    }
    else {
      uint64_t result = 0;
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 != -1)
  {
    uint64_t v9 = *(void *)(a2 + 32);
    unsigned int v10 = ((v8 != 2) ^ (v9 == 2)) & result;
    if (v9 == -1) {
      return result;
    }
    else {
      return v10;
    }
  }
  return result;
}

void sub_1D818ACC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a9);
  _Unwind_Resume(a1);
}

uint64_t __buildIconComparatorForIconsFromRelevancyMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 leafIdentifier];
  uint64_t v9 = [v7 objectForKey:v8];

  unsigned int v10 = *(void **)(a1 + 32);
  long long v11 = [v6 leafIdentifier];
  long long v12 = [v10 objectForKey:v11];

  if (v9 && v12)
  {
    uint64_t v13 = [v9 compare:v12];
    if (v13 != -1)
    {
      if (!v13)
      {
        uint64_t v14 = [v5 localizedCompareDisplayNames:v6];
        goto LABEL_18;
      }
LABEL_8:
      uint64_t v14 = -1;
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (v9 && !v12) {
    goto LABEL_8;
  }
  if (!v9 && v12)
  {
LABEL_11:
    uint64_t v14 = 1;
    goto LABEL_18;
  }
  uint64_t v15 = [v5 localizedCompareDisplayNames:v6];
  if (v15 == 1) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v15 == -1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v16;
  }
LABEL_18:

  return v14;
}

void sub_1D818DC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D818E2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D818E480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D818FE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getAPUISuggestionsWidgetViewControllerClass_0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAPUISuggestionsWidgetViewControllerClass_softClass_0;
  uint64_t v7 = getAPUISuggestionsWidgetViewControllerClass_softClass_0;
  if (!getAPUISuggestionsWidgetViewControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAPUISuggestionsWidgetViewControllerClass_block_invoke_0;
    v3[3] = &unk_1E6AAD648;
    v3[4] = &v4;
    __getAPUISuggestionsWidgetViewControllerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D81921BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUISuggestionsWidgetViewControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppPredictionUIWidgetLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6AB58F8;
    uint64_t v6 = 0;
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("APUISuggestionsWidgetViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAPUISuggestionsWidgetViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAPUISuggestionsWidgetViewControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUIWidgetLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUIWidgetLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void sub_1D819D4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1D819F84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D81A0A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SBHStringForFolderViewPageType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E6AB5AD0[a1];
  }
}

uint64_t APUIIconAppearanceForSBHIconImageAppearanceType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1D81E9A10[a1 - 1];
  }
}

char *sub_1D81A483C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = &v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo];
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  *(void *)&v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView] = 0;
  v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible] = 1;
  v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView] = 1;
  swift_unknownObjectWeakInit();
  uint64_t v10 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  id v11 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  long long v12 = v4;
  *(void *)&v4[v10] = objc_msgSend(v11, sel_init);
  uint64_t v13 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView;
  *(void *)&v12[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v14 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  *(void *)&v12[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v15 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView;
  *(void *)&v12[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v16 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView;
  *(void *)&v12[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v17 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView;
  *(void *)&v12[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint] = 0;
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint] = 0;
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint] = 0;
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint] = 0;
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint] = 0;
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint] = 0;
  uint64_t v18 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews;
  *(void *)&v12[v18] = objc_msgSend(self, sel_weakToWeakObjectsMapTable);
  *(void *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines] = 2;

  v130.receiver = v12;
  v130.super_class = (Class)SBHAddWidgetSheetIconListCell;
  long long v19 = (char *)objc_msgSendSuper2(&v130, sel_initWithFrame_, a1, a2, a3, a4);
  id v111 = objc_msgSend(v19, sel_contentView);
  uint64_t v128 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView;
  double v20 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView];
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v20, sel_setAxis_, 0);
  objc_msgSend(v20, sel_setAlignment_, 3);
  objc_msgSend(v20, sel_setSpacing_, 8.0);
  objc_msgSend(v111, sel_addSubview_, v20);
  uint64_t v21 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView;
  double v22 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView];
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  double v23 = (double *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo];
  objc_msgSend(v22, sel__setContinuousCornerRadius_, *(double *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 24]);
  id v24 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 6, 2, 14.0);
  double v25 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView];
  uint64_t v26 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  uint64_t v126 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  id v127 = v24;
  objc_msgSend(v25, sel_setPreferredSymbolConfiguration_, v24);
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  double v27 = self;
  id v28 = v25;
  id v29 = objc_msgSend(v27, sel_whiteColor);
  objc_msgSend(v28, sel_setTintColor_, v29);

  objc_msgSend(*(id *)&v19[v21], sel_addSubview_, *(void *)&v19[v26]);
  double v30 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel];
  uint64_t v31 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  uint64_t v117 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  double v32 = self;
  uint64_t v33 = *MEMORY[0x1E4FB2950];
  double v34 = *MEMORY[0x1E4FB09D0];
  id v35 = v30;
  id v36 = objc_msgSend(v32, sel__preferredFontForTextStyle_weight_, v33, v34);
  objc_msgSend(v35, sel_setFont_, v36);

  uint64_t v37 = *(void **)&v19[v31];
  objc_msgSend(v37, sel_setNumberOfLines_, 2);
  objc_msgSend(v37, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v37, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v37, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v38 = *(void **)&v19[v128];
  int64x2_t v39 = *(void **)&v19[v21];
  uint64_t v124 = v21;
  objc_msgSend(v38, sel_addArrangedSubview_, v39);
  objc_msgSend(v38, sel_addArrangedSubview_, v37);
  int8x16_t v40 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView];
  uint64_t v41 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView;
  objc_msgSend(v40, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v111, (SEL)&selRef_addEmptyListRemovingLeastRecentlyHiddenListIfNecessary, v40);
  id v42 = objc_msgSend(v39, sel_widthAnchor);
  id v43 = objc_msgSend(v42, sel_constraintEqualToConstant_, *v23);

  id v44 = objc_msgSend(*(id *)&v19[v21], sel_heightAnchor);
  id v45 = objc_msgSend(v44, (SEL)&selRef_containerBundleIdentifierForDataSource_ + 2, v23[1]);

  uint64_t v46 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint];
  *(void *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint] = v43;
  id v122 = v43;

  uint64_t v47 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint];
  *(void *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint] = v45;
  id v120 = v45;

  id v48 = objc_msgSend(*(id *)&v19[v128], sel_leadingAnchor);
  id v49 = objc_msgSend(v111, (SEL)&selRef_isMemberOfClass_ + 2);
  id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

  id v51 = objc_msgSend(*(id *)&v19[v128], sel_trailingAnchor);
  id v52 = objc_msgSend(v111, (SEL)&selRef_subarrayWithRange_ + 4);
  id v53 = objc_msgSend(v51, (SEL)&selRef_constraintEqualToAnchor_ + 6, v52);

  uint64_t v54 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint];
  *(void *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint] = v50;
  id v115 = v50;

  uint64_t v55 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint];
  *(void *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint] = v53;
  id v56 = v53;

  id v57 = objc_msgSend(*(id *)&v19[v128], sel_bottomAnchor);
  uint64_t v112 = v41;
  id v58 = objc_msgSend(*(id *)&v19[v41], sel_topAnchor);
  id v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v58, 0.0);

  uint64_t v60 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint];
  *(void *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint] = v59;
  id v113 = v59;

  id v61 = objc_msgSend(v111, sel_topAnchor);
  id v62 = objc_msgSend(*(id *)&v19[v41], sel_topAnchor);
  id v63 = objc_msgSend(v61, (SEL)&selRef_constraintEqualToConstant_ + 7, v62, -8.0);

  double v64 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint];
  *(void *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint] = v63;
  id v125 = v63;

  uint64_t v65 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView;
  long long v66 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView];
  objc_msgSend(v66, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v67 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
  aBlock[4] = sub_1D81A5648;
  void aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D81A77E4;
  aBlock[3] = &block_descriptor_24;
  long long v68 = _Block_copy(aBlock);
  id v69 = v66;
  id v70 = objc_msgSend(v67, sel_initWithDynamicProvider_, v68);
  _Block_release(v68);
  swift_release();
  objc_msgSend(v69, sel_setBackgroundColor_, v70);

  long long v71 = *(void **)&v19[v65];
  objc_msgSend(v71, sel__setContinuousCornerRadius_, 0.5);
  objc_msgSend(v111, sel_addSubview_, v71);
  id v119 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889740);
  uint64_t v72 = swift_allocObject();
  *(_OWORD *)(v72 + 16) = xmmword_1D81E9A40;
  id v73 = objc_msgSend(*(id *)&v19[v128], sel_topAnchor);
  id v74 = objc_msgSend(v111, sel_topAnchor);
  id v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_, v74);

  *(void *)(v72 + 32) = v75;
  *(void *)(v72 + 40) = v115;
  *(void *)(v72 + 4_Block_object_dispose(&STACK[0x220], 8) = v56;
  double v76 = *(void **)&v19[v128];
  id v116 = v115;
  id v114 = v56;
  id v77 = objc_msgSend(v76, sel_heightAnchor);
  id v78 = objc_msgSend(*(id *)&v19[v117], sel_heightAnchor);
  id v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_constant_, v78, 54.0);

  *(void *)(v72 + 56) = v79;
  *(void *)(v72 + 64) = v113;
  v80 = *(void **)&v19[v112];
  id v118 = v113;
  id v81 = objc_msgSend(v80, sel_leadingAnchor);
  id v82 = objc_msgSend(v111, sel_leadingAnchor);
  id v83 = objc_msgSend(v81, sel_constraintEqualToAnchor_, v82);

  *(void *)(v72 + 72) = v83;
  id v84 = objc_msgSend(*(id *)&v19[v112], sel_trailingAnchor);
  id v85 = objc_msgSend(v111, sel_trailingAnchor);
  id v86 = objc_msgSend(v84, (SEL)&selRef_constraintEqualToAnchor_ + 6, v85);

  *(void *)(v72 + 80) = v86;
  id v87 = objc_msgSend(*(id *)&v19[v112], sel_bottomAnchor);
  id v88 = objc_msgSend(v111, sel_bottomAnchor);
  sub_1D81A56D4();
  id v90 = objc_msgSend(v87, sel_constraintEqualToAnchor_constant_, v88, -(v89 + 4.0 + 24.0 + 1.0));

  *(void *)(v72 + 8_Block_object_dispose(&STACK[0x220], 8) = v90;
  *(void *)(v72 + 96) = v122;
  *(void *)(v72 + 104) = v120;
  v91 = *(void **)&v19[v126];
  id v123 = v122;
  id v121 = v120;
  id v92 = objc_msgSend(v91, sel_centerXAnchor);
  id v93 = objc_msgSend(*(id *)&v19[v124], sel_centerXAnchor);
  id v94 = objc_msgSend(v92, sel_constraintEqualToAnchor_, v93);

  *(void *)(v72 + 112) = v94;
  id v95 = objc_msgSend(*(id *)&v19[v126], sel_centerYAnchor);
  id v96 = objc_msgSend(*(id *)&v19[v124], sel_centerYAnchor);
  id v97 = objc_msgSend(v95, sel_constraintEqualToAnchor_, v96);

  *(void *)(v72 + 120) = v97;
  id v98 = objc_msgSend(*(id *)&v19[v65], sel_leadingAnchor);
  id v99 = objc_msgSend(*(id *)&v19[v128], sel_leadingAnchor);
  id v100 = objc_msgSend(v98, sel_constraintEqualToAnchor_constant_, v99, -4.0);

  *(void *)(v72 + 12_Block_object_dispose(&STACK[0x220], 8) = v100;
  id v101 = objc_msgSend(*(id *)&v19[v65], sel_trailingAnchor);
  id v102 = objc_msgSend(*(id *)&v19[v128], sel_trailingAnchor);
  id v103 = objc_msgSend(v101, sel_constraintEqualToAnchor_, v102);

  *(void *)(v72 + 136) = v103;
  id v104 = objc_msgSend(*(id *)&v19[v65], sel_heightAnchor);
  id v105 = objc_msgSend(v104, sel_constraintEqualToConstant_, 1.0);

  *(void *)(v72 + 144) = v105;
  id v106 = objc_msgSend(*(id *)&v19[v65], sel_bottomAnchor);
  id v107 = objc_msgSend(v111, sel_bottomAnchor);
  id v108 = objc_msgSend(v106, sel_constraintEqualToAnchor_, v107);

  *(void *)(v72 + 152) = v108;
  aBlock[0] = v72;
  sub_1D81B1F88();
  sub_1D81A7E58(0, &qword_1EA889748);
  v109 = (void *)sub_1D81B1F78();
  swift_bridgeObjectRelease();
  objc_msgSend(v119, sel_activateConstraints_, v109);

  sub_1D81A57D0();
  return v19;
}

id sub_1D81A5648(void *a1)
{
  id v2 = objc_msgSend(a1, sel_userInterfaceStyle);
  BOOL v3 = self;
  uint64_t v4 = &selRef_systemFillColor;
  if (v2 != (id)2) {
    uint64_t v4 = &selRef_separatorColor;
  }
  id v5 = [v3 *v4];
  id v6 = objc_msgSend(v5, sel_resolvedColorWithTraitCollection_, a1);

  return v6;
}

void sub_1D81A56D4()
{
  id v1 = objc_msgSend(self, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E4FB28E0], 256);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_lineHeight);
    uint64_t v3 = *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines];
    objc_msgSend(v2, sel_leading);
    if (!__OFSUB__(v3, 1))
    {
      id v4 = objc_msgSend(v0, sel_traitCollection);
      objc_msgSend(v4, sel_displayScale);

      UICeilToScale();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

id sub_1D81A57D0()
{
  id v1 = objc_msgSend(v0, sel_iconListView);
  if (v1 && (id v2 = v1, v3 = objc_msgSend(v1, sel_layout), v2, v3))
  {
    objc_msgSend(v3, sel_layoutInsetsForOrientation_, 1);
    double v5 = v4;
    double v7 = v6;
    swift_unknownObjectRelease();
  }
  else
  {
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  id result = *(id *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint];
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  objc_msgSend(result, sel_setConstant_, v5 + 4.0);
  id result = *(id *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint];
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  return objc_msgSend(result, sel_setConstant_, -v7);
}

void __swiftcall SBHAddWidgetSheetIconListCell.init(coder:)(SBHAddWidgetSheetIconListCell_optional *__return_ptr retstr, NSCoder coder)
{
}

id sub_1D81A59FC(double a1, double a2, double a3, double a4)
{
  double v5 = (double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  id result = (id)SBIconImageInfoEqualToIconImageInfo(*(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo), *(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 8), *(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 16), *(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 24), a1, a2, a3, a4);
  if (result) {
    return result;
  }
  id result = *(id *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  objc_msgSend(result, sel_setConstant_, *v5);
  id result = *(id *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint);
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  objc_msgSend(result, sel_setConstant_, v5[1]);
  double v7 = *(void **)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
  double v8 = v5[3];
  return objc_msgSend(v7, sel__setContinuousCornerRadius_, v8);
}

void sub_1D81A5D2C(void *a1)
{
  id v8 = a1;
  if (a1)
  {
    unsigned __int8 v2 = objc_msgSend(a1, sel_isSymbolImage);
    id v3 = *(void **)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
    if (v2)
    {
      id v4 = 0;
      int v5 = 1;
      goto LABEL_7;
    }
    a1 = v8;
  }
  else
  {
    id v3 = *(void **)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
  }
  id v4 = a1;
  int v5 = 0;
LABEL_7:
  objc_msgSend(v3, sel_setImage_, v4);

  double v6 = *(void **)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView);
  if (v5) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  objc_msgSend(v6, sel_setImage_, v7);
}

void sub_1D81A5EF8(void *a1)
{
  unsigned __int8 v2 = *(void **)&v1[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView];
  if (v2)
  {
    id v3 = v1;
    id v4 = *(void **)&v1[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView];
    id v5 = v2;
    objc_msgSend(v4, sel_addSubview_, v5);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_iconSpacing);
    double v7 = v6;
    double v9 = v8;
    sub_1D81A56D4();
    double v11 = v10 + 4.0 + 4.0;
    if (v9 > v11) {
      double v12 = v9;
    }
    else {
      double v12 = v11;
    }
    objc_msgSend(v5, sel_setIconSpacing_, v7, v12);
    uint64_t v13 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889740);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1D81E9A50;
    id v15 = objc_msgSend(v5, sel_leadingAnchor);
    id v16 = objc_msgSend(v4, sel_leadingAnchor);
    id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    *(void *)(v14 + 32) = v17;
    id v18 = objc_msgSend(v5, sel_trailingAnchor);
    id v19 = objc_msgSend(v4, sel_trailingAnchor);
    id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

    *(void *)(v14 + 40) = v20;
    id v21 = objc_msgSend(v5, sel_bottomAnchor);
    id v22 = objc_msgSend(v4, sel_bottomAnchor);
    id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

    *(void *)(v14 + 4_Block_object_dispose(&STACK[0x220], 8) = v23;
    id v24 = objc_msgSend(v5, sel_topAnchor);
    id v25 = objc_msgSend(v4, sel_topAnchor);
    id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

    *(void *)(v14 + 56) = v26;
    sub_1D81B1F88();
    sub_1D81A7E58(0, &qword_1EA889748);
    double v27 = (void *)sub_1D81B1F78();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_activateConstraints_, v27, v14);

    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = v3;
    *(void *)(v28 + 24) = v5;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_1D81A7ED4;
    *(void *)(v29 + 24) = v28;
    v35[4] = sub_1D81A7F0C;
    v35[5] = v29;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 1107296256;
    v35[2] = sub_1D81A664C;
    v35[3] = &block_descriptor;
    double v30 = _Block_copy(v35);
    id v31 = v5;
    id v32 = v3;
    swift_retain();
    swift_release();
    objc_msgSend(v31, sel_enumerateIconViewsUsingBlock_, v30);
    _Block_release(v30);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v31, sel_addLayoutObserver_, v32);
      id v34 = objc_msgSend(v32, sel_contentView);
      objc_msgSend(v34, sel_setNeedsLayout);

      sub_1D81A57D0();
      swift_release();
    }
  }
  else if (a1)
  {
    objc_msgSend(a1, sel_removeFromSuperview);
  }
}

void sub_1D81A638C(void *a1, void *a2)
{
  id v5 = *(void **)&v2[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews];
  id v6 = objc_msgSend(v5, sel_objectForKey_, a1);

  if (!v6)
  {
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
    objc_msgSend(v7, sel_setNumberOfLines_, *(void *)&v2[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines]);
    id v8 = objc_msgSend(a1, sel_icon);
    double v9 = v8;
    if (v8)
    {
      id v10 = objc_msgSend(v8, sel_displayName);

      sub_1D81B1F68();
      double v9 = (void *)sub_1D81B1F58();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v7, sel_setText_, v9);

    id v11 = objc_msgSend(self, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E4FB28E0], 256);
    if (v11)
    {
      double v12 = v11;
      objc_msgSend(v7, sel_setFont_, v11);

      id v13 = objc_msgSend(self, sel_labelColor);
      objc_msgSend(v7, sel_setTextColor_, v13);

      objc_msgSend(v7, sel_setTextAlignment_, 1);
      objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
      objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      objc_msgSend(v5, sel_setObject_forKey_, v7, a1);
      id v16 = objc_msgSend(a1, sel_contentContainerView);
      objc_msgSend(v16, sel_addSubview_, v7);
      id v14 = objc_msgSend(v2, sel_visualStylingProvider);
      if (v14)
      {
        id v15 = v14;
        objc_msgSend(v14, sel_automaticallyUpdateView_withStyle_, v7, 1);
      }
      sub_1D81A6CFC(v7, v16, a1, a2);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1D81A664C(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_1D81A674C()
{
  uint64_t v1 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView), sel_setHidden_, (*(unsigned char *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView) & 1) == 0);
  id result = *(id *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  objc_msgSend(result, sel_setActive_, *(unsigned __int8 *)(v0 + v1));
  id result = *(id *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  BOOL v3 = (*(unsigned char *)(v0 + v1) & 1) == 0;
  return objc_msgSend(result, sel_setActive_, v3);
}

void sub_1D81A688C(void *a1)
{
  uint64_t v2 = v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_visualStylingProvider;
  BOOL v3 = (void *)MEMORY[0x1D9484CA0](v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_visualStylingProvider);
  uint64_t v4 = swift_unknownObjectWeakAssign();
  id v5 = (void *)MEMORY[0x1D9484CA0](v4);
  id v6 = v5;
  if (v3)
  {
    if (v5)
    {

      if (v3 == v6)
      {

LABEL_19:

        return;
      }
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_19;
    }
  }
  id v7 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews), sel_objectEnumerator);
  if (v7)
  {
    id v8 = v7;
    while (1)
    {
      if (objc_msgSend(v8, sel_nextObject))
      {
        sub_1D81B2028();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v14, 0, sizeof(v14));
      }
      sub_1D81A7DF0((uint64_t)v14, (uint64_t)&v15);
      if (!*((void *)&v16 + 1))
      {

        goto LABEL_24;
      }
      sub_1D81A7E58(0, &qword_1EA889738);
      if ((swift_dynamicCast() & 1) == 0) {
        break;
      }
      double v9 = *(void **)&v14[0];
      if (v3)
      {
        id v10 = v3;
        objc_msgSend(v10, sel_stopAutomaticallyUpdatingView_, v9);
        objc_msgSend(v9, sel_mt_removeAllVisualStyling);
      }
      id v11 = (void *)MEMORY[0x1D9484CA0](v2);
      if (v11)
      {
        double v12 = v11;
        objc_msgSend(v11, sel_automaticallyUpdateView_withStyle_, v9, 1);
      }
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
LABEL_24:
    sub_1D81A7D4C((uint64_t)&v15);
  }
}

Swift::Void __swiftcall SBHAddWidgetSheetIconListCell.prepareForReuse()()
{
  v5.super_class = (Class)SBHAddWidgetSheetIconListCell;
  objc_msgSendSuper2(&v5, sel_prepareForReuse);
  objc_msgSend(v0, sel_setTitle_, 0);
  objc_msgSend(v0, sel_setIconImage_, 0);
  objc_msgSend(v0, sel_setIconBackgroundColor_, 0);
  id v1 = objc_msgSend(v0, sel_iconListView);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_model);

    if (v3)
    {

      sub_1D81A7E58(0, &qword_1EA889660);
      uint64_t v4 = (void *)sub_1D81B1F78();
      objc_msgSend(v3, sel_setIcons_, v4);
    }
  }
  objc_msgSend(v0, sel_setSeparatorVisible_, 1);
  objc_msgSend(v0, sel_setWantsHeaderView_, 1);
}

Swift::Bool __swiftcall SBHAddWidgetSheetIconListCell._descendantsShouldHighlight()()
{
  return 0;
}

Swift::Void __swiftcall SBHAddWidgetSheetIconListCell.iconListView(_:didAdd:)(SBIconListView *_, SBIconView *didAdd)
{
}

void sub_1D81A6CFC(void *a1, void *a2, id a3, void *a4)
{
  id v9 = objc_msgSend(a3, sel_icon);
  id v10 = &selRef_composedApplicationShortcutItems;
  if (!v9) {
    goto LABEL_10;
  }
  id v11 = v9;
  id v12 = objc_msgSend(a4, sel_model);
  if (!v12)
  {

LABEL_10:
    if (qword_1EA889658 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1D81B1F28();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EA88A130);
    id v25 = a3;
    id v26 = sub_1D81B1F18();
    os_log_type_t v27 = sub_1D81B1FD8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138412290;
      rect_16a = a1;
      double v30 = a2;
      id v31 = v25;
      id v10 = &selRef_composedApplicationShortcutItems;
      sub_1D81B2018();
      *uint64_t v29 = v25;

      a2 = v30;
      a1 = rect_16a;
      _os_log_impl(&dword_1D7F0A000, v26, v27, "Unable to get icon and model for icon view: %@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889750);
      swift_arrayDestroy();
      MEMORY[0x1D9484C40](v29, -1, -1);
      MEMORY[0x1D9484C40](v28, -1, -1);
    }
    else
    {
    }
    goto LABEL_29;
  }
  id v13 = v12;
  id v14 = objc_msgSend(v12, sel_indexForIcon_, v11);
  uint64_t v15 = sub_1D81B1ED8();
  if ((v15 & 0x8000000000000000) == 0 && v14 == (id)v15)
  {
    if (qword_1EA889658 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1D81B1F28();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EA88A130);
    id v17 = v11;
    id v18 = sub_1D81B1F18();
    os_log_type_t v19 = sub_1D81B1FD8();
    if (os_log_type_enabled(v18, v19))
    {
      rect = v13;
      id v20 = (uint8_t *)swift_slowAlloc();
      id v21 = (void *)swift_slowAlloc();
      *(_DWORD *)id v20 = 138412290;
      id v22 = v17;
      sub_1D81B2018();
      void *v21 = v11;

      _os_log_impl(&dword_1D7F0A000, v18, v19, "Unable to get index for icon: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889750);
      swift_arrayDestroy();
      id v23 = v21;
      id v10 = &selRef_composedApplicationShortcutItems;
      MEMORY[0x1D9484C40](v23, -1, -1);
      MEMORY[0x1D9484C40](v20, -1, -1);
    }
    else
    {
    }
LABEL_29:
    id v68 = objc_msgSend(a1, sel_widthAnchor, rect);
    id v69 = objc_msgSend(a2, sel_widthAnchor);
    id v67 = objc_msgSend(v68, v10[94], v69, 16.0);

    double v63 = 4.0;
    goto LABEL_30;
  }
  rect_8 = a2;
  rect_16 = a1;
  id v32 = objc_msgSend(a4, sel_layoutMetrics);
  id v33 = objc_msgSend(a4, sel_iconCoordinateForIndex_metrics_, v14, v32);
  uint64_t v35 = v34;
  if (SBIconCoordinateIsNotFound((uint64_t)v33, v34))
  {
    if (qword_1EA889658 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1D81B1F28();
    __swift_project_value_buffer(v36, (uint64_t)qword_1EA88A130);
    id v37 = v11;
    id v38 = sub_1D81B1F18();
    os_log_type_t v39 = sub_1D81B1FD8();
    if (os_log_type_enabled(v38, v39))
    {
      rect = v13;
      int8x16_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      *(_DWORD *)int8x16_t v40 = 138412290;
      id v42 = v37;
      sub_1D81B2018();
      *uint64_t v41 = v11;

      _os_log_impl(&dword_1D7F0A000, v38, v39, "Unable to get coordinate for icon: %@", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889750);
      swift_arrayDestroy();
      MEMORY[0x1D9484C40](v41, -1, -1);
      MEMORY[0x1D9484C40](v40, -1, -1);
    }
    else
    {
    }
    a2 = rect_8;
    a1 = rect_16;
    id v10 = &selRef_composedApplicationShortcutItems;
    goto LABEL_29;
  }
  objc_msgSend(a4, sel_rectForCellAtIconCoordinate_metrics_, v33, v35, v32);
  CGFloat recta = v43;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  id v50 = objc_msgSend(v11, sel_gridSizeClass);
  unsigned int v51 = objc_msgSend(a4, sel_iconGridSizeForClass_, v50);

  id v52 = v32;
  objc_msgSend(a4, sel_rectForDefaultSizedCellsOfSize_startingAtCoordinate_metrics_, v51, v33, v35, v32);
  CGFloat x = v85.origin.x;
  CGFloat y = v85.origin.y;
  CGFloat width = v85.size.width;
  CGFloat height = v85.size.height;
  double v57 = CGRectGetWidth(v85);
  id v58 = objc_msgSend(v4, sel_window);
  if (!v58) {
    goto LABEL_25;
  }
  id v59 = v58;
  id v60 = objc_msgSend(v58, sel_windowScene);

  if (!v60) {
    goto LABEL_25;
  }
  id v61 = objc_msgSend(v60, sel_interfaceOrientation);

  id v62 = objc_msgSend(objc_msgSend(a4, sel_layout), sel_numberOfColumnsForOrientation_, v61);
  id v52 = v32;
  swift_unknownObjectRelease();
  if (v62 == (id)(unsigned __int16)v51)
  {

    double v63 = 4.0;
  }
  else
  {
LABEL_25:
    v86.origin.CGFloat x = x;
    v86.origin.CGFloat y = y;
    v86.size.CGFloat width = width;
    v86.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v86);
    v87.origin.CGFloat x = recta;
    v87.origin.CGFloat y = v45;
    v87.size.CGFloat width = v47;
    v87.size.CGFloat height = v49;
    double v65 = CGRectGetMaxY(v87);

    double v63 = MaxY - v65 + 4.0;
  }
  a2 = rect_8;
  id v66 = objc_msgSend(a1, sel_widthAnchor);
  id v67 = objc_msgSend(v66, sel_constraintEqualToConstant_, v57 + 16.0);

  id v10 = &selRef_composedApplicationShortcutItems;
LABEL_30:
  id v70 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889740);
  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_1D81E9A60;
  id v72 = objc_msgSend(a1, sel_centerXAnchor);
  id v73 = objc_msgSend(a2, sel_centerXAnchor);
  id v74 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v73);

  *(void *)(v71 + 32) = v74;
  *(void *)(v71 + 40) = v67;
  id v75 = v67;
  id v76 = objc_msgSend(a1, sel_topAnchor);
  id v77 = objc_msgSend(a2, sel_bottomAnchor);
  id v78 = objc_msgSend(v76, v10[94], v77, v63);

  *(void *)(v71 + 4_Block_object_dispose(&STACK[0x220], 8) = v78;
  sub_1D81B1F88();
  sub_1D81A7E58(0, &qword_1EA889748);
  id v79 = (void *)sub_1D81B1F78();
  swift_bridgeObjectRelease();
  objc_msgSend(v70, sel_activateConstraints_, v79);
}

Swift::Void __swiftcall SBHAddWidgetSheetIconListCell.iconListView(_:didRemove:)(SBIconListView *_, SBIconView *didRemove)
{
}

id sub_1D81A77E4(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  objc_super v5 = (void *)v3();
  swift_release();

  return v5;
}

void sub_1D81A784C(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_1D81A7858@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = 0;
  return result;
}

void _sSo29SBHAddWidgetSheetIconListCellC15SpringBoardHomeE5coderABSgSo7NSCoderC_tcfc_0()
{
  id v1 = &v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo];
  *id v1 = 0u;
  v1[1] = 0u;
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView] = 0;
  v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible] = 1;
  v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView] = 1;
  swift_unknownObjectWeakInit();
  uint64_t v2 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v3 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v4 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v5 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView;
  *(void *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v6 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v7 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint] = 0;
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint] = 0;
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint] = 0;
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint] = 0;
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint] = 0;
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint] = 0;
  uint64_t v8 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews;
  *(void *)&v0[v8] = objc_msgSend(self, sel_weakToWeakObjectsMapTable);
  *(void *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines] = 2;

  sub_1D81B2038();
  __break(1u);
}

void sub_1D81A7A60(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews];
  id v7 = objc_msgSend(v4, sel_objectForKey_, a1);
  id v5 = objc_msgSend(v2, sel_visualStylingProvider);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_stopAutomaticallyUpdatingView_, v7);
  }
  if (v7) {
    objc_msgSend(v7, sel_removeFromSuperview);
  }
  objc_msgSend(v4, sel_removeObjectForKey_, a1);
}

uint64_t type metadata accessor for SBHAddWidgetSheetIconListCell(uint64_t a1)
{
  return sub_1D81A7E58(a1, &qword_1EA889708);
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *id result = *a2;
  return result;
}

uint64_t sub_1D81A7B58(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D81A7B78(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)id result = a2 - 1;
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
  *(unsigned char *)(result + 4) = v3;
  return result;
}

void type metadata accessor for SBHIconGridSize(uint64_t a1)
{
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x220], 8) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_1D81A7BD0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D81A7BF0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x220], 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 80) = v3;
  return result;
}

void type metadata accessor for SBIconResizeHandleMetrics(uint64_t a1)
{
}

uint64_t sub_1D81A7C44(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D81A7C84(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D81A7CA4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&STACK[0x220], 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for SBIconImageInfo(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1D81A7CF0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D81A7D10(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&STACK[0x220], 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for SBIconCoordinate(uint64_t a1)
{
}

uint64_t sub_1D81A7D4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889730);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_1D81A7DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D81A7E58(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D81A7E94()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1D81A7ED4(void *a1)
{
  sub_1D81A638C(a1, *(void **)(v1 + 24));
}

uint64_t sub_1D81A7EFC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D81A7F0C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for SBIconResizeHandleHitAreaShape(uint64_t a1)
{
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_1D81A7FE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id static SBLeafIcon.iconWithUniqueLeafIdentifier()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_initWithUniqueLeafIdentifier);
}

uint64_t sub_1D81A814C(_OWORD *a1, void *a2, double a3, double a4, double a5, CGFloat a6)
{
  id v7 = v6;
  uint64_t ObjectType = swift_getObjectType();
  id v14 = &v7[OBJC_IVAR___SBHIconResizeHandle_hitArea];
  *id v14 = 0u;
  v14[1] = 0u;
  uint64_t v15 = &v7[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
  *uint64_t v15 = 0;
  v15[1] = 0;
  *(void *)&v7[OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer] = 0;
  v7[OBJC_IVAR___SBHIconResizeHandle_isHighlighted] = 0;
  v7[OBJC_IVAR___SBHIconResizeHandle__isResizing] = 0;
  v7[OBJC_IVAR___SBHIconResizeHandle_isDarkStyle] = 0;
  *(void *)&v7[OBJC_IVAR___SBHIconResizeHandle_shapeLayer] = 0;
  uint64_t v16 = &v7[OBJC_IVAR___SBHIconResizeHandle_metrics];
  long long v17 = a1[3];
  v16[2] = a1[2];
  v16[3] = v17;
  void v16[4] = a1[4];
  long long v18 = a1[1];
  *uint64_t v16 = *a1;
  v16[1] = v18;
  os_log_type_t v19 = (double *)&v7[OBJC_IVAR___SBHIconResizeHandle_iconImageInfo];
  *os_log_type_t v19 = a3;
  v19[1] = a4;
  v19[2] = a5;
  void v19[3] = a6;
  *(void *)&v7[OBJC_IVAR___SBHIconResizeHandle_backgroundView] = a2;
  id v20 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v21 = v7;
  id v86 = a2;
  id v22 = objc_msgSend(v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v23 = OBJC_IVAR___SBHIconResizeHandle_whiteTintView;
  *(void *)&v21[OBJC_IVAR___SBHIconResizeHandle_whiteTintView] = v22;
  uint64_t v24 = self;
  id v25 = v22;
  id v26 = objc_msgSend(v24, sel_whiteColor);
  objc_msgSend(v25, sel_setBackgroundColor_, v26);

  objc_msgSend(*(id *)&v21[v23], sel_setAlpha_, 0.42);
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v28 = OBJC_IVAR___SBHIconResizeHandle_highlightView;
  *(void *)&v21[OBJC_IVAR___SBHIconResizeHandle_highlightView] = v27;
  id v29 = v27;
  id v30 = objc_msgSend(v24, sel_blackColor);
  objc_msgSend(v29, sel_setBackgroundColor_, v30);

  id v31 = *(void **)&v21[v28];
  objc_msgSend(v31, sel_setAlpha_, 0.0);
  id v32 = objc_msgSend(v31, sel_layer);
  id v33 = (id)*MEMORY[0x1E4F3A308];
  objc_msgSend(v32, sel_setCompositingFilter_, v33);

  v92.receiver = v21;
  v92.super_class = (Class)SBHIconResizeHandle;
  id v34 = objc_msgSendSuper2(&v92, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v35 = objc_msgSend(v34, sel_traitCollection);
  objc_msgSend(v35, sel_displayScale);

  BSFloatCeilForScale();
  CGFloat v37 = -v36;
  v98.origin.CGFloat x = 0.0;
  v98.origin.CGFloat y = 0.0;
  v98.size.CGFloat width = a6;
  v98.size.CGFloat height = a6;
  CGRect v99 = CGRectInset(v98, v37, v37);
  CGFloat x = v99.origin.x;
  CGFloat y = v99.origin.y;
  CGFloat width = v99.size.width;
  CGFloat height = v99.size.height;
  id v42 = self;
  double v43 = (CGFloat *)swift_allocObject();
  *((void *)v43 + 2) = v34;
  v43[3] = x;
  v43[4] = y;
  v43[5] = width;
  v43[6] = height;
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = sub_1D81AA0F8;
  *(void *)(v44 + 24) = v43;
  *(void *)&long long v95 = sub_1D81AA118;
  *((void *)&v95 + 1) = v44;
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v94 = sub_1D81A8B78;
  *((void *)&v94 + 1) = &block_descriptor_9;
  CGFloat v45 = _Block_copy(&aBlock);
  double v46 = (char *)v34;
  swift_retain();
  swift_release();
  objc_msgSend(v42, sel_performWithoutAnimation_, v45);
  _Block_release(v45);
  LOBYTE(v34) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v34)
  {
    __break(1u);
  }
  else
  {
    long long v94 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 16];
    long long v95 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 32];
    long long v96 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 48];
    long long v97 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 64];
    long long aBlock = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics];
    sub_1D81A9BC4((uint64_t)&aBlock, (uint64_t)objc_msgSend(v46, sel_effectiveUserInterfaceLayoutDirection), (uint64_t)v88, a6);
    uint64_t v48 = v88[0];
    CGRect v85 = (void *)v88[0];
    uint64_t v49 = v88[1];
    uint64_t v50 = v88[2];
    long long v83 = v89;
    uint64_t v51 = v90;
    uint64_t v52 = v91;
    id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C88]), sel_init);
    objc_msgSend(v53, sel_setPath_, v48);
    uint64_t v54 = *(void **)&v46[OBJC_IVAR___SBHIconResizeHandle_shapeLayer];
    *(void *)&v46[OBJC_IVAR___SBHIconResizeHandle_shapeLayer] = v53;
    id v84 = v53;

    uint64_t v55 = &v46[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
    *(void *)uint64_t v55 = v49;
    *((void *)v55 + 1) = v50;
    id v56 = &v46[OBJC_IVAR___SBHIconResizeHandle_hitArea];
    *(_OWORD *)id v56 = v83;
    *((void *)v56 + 2) = v51;
    *((void *)v56 + 3) = v52;
    id v57 = objc_msgSend(v46, sel_layer);
    objc_msgSend(v57, sel_setMask_, v84);

    id v58 = objc_msgSend(v46, sel_layer);
    objc_msgSend(v58, sel_setHitTestsAsOpaque_, 1);

    sub_1D81B1F68();
    id v59 = objc_allocWithZone(MEMORY[0x1E4F39BC0]);
    id v60 = (void *)sub_1D81B1F58();
    swift_bridgeObjectRelease();
    id v61 = objc_msgSend(v59, sel_initWithType_, v60);

    id v62 = (void *)sub_1D81B1F58();
    objc_msgSend(v61, sel_setName_, v62);

    double v63 = (void *)sub_1D81B1FC8();
    double v64 = (void *)sub_1D81B1F58();
    objc_msgSend(v61, sel_setValue_forKey_, v63, v64);

    sub_1D81B1F68();
    id v65 = objc_allocWithZone(MEMORY[0x1E4F39BC0]);
    id v66 = (void *)sub_1D81B1F58();
    swift_bridgeObjectRelease();
    id v67 = objc_msgSend(v65, sel_initWithType_, v66);

    id v68 = (void *)sub_1D81B1F58();
    objc_msgSend(v67, sel_setName_, v68);

    id v69 = (void *)sub_1D81B1FC8();
    id v70 = (void *)sub_1D81B1F58();
    objc_msgSend(v67, sel_setValue_forKey_, v69, v70);

    id v71 = objc_msgSend(v46, sel_layer);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889858);
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_1D81E9B80;
    uint64_t v73 = sub_1D81A7E58(0, &qword_1EA889860);
    *(void *)(v72 + 32) = v61;
    *(void *)(v72 + 8_Block_object_dispose(&STACK[0x220], 8) = v73;
    *(void *)(v72 + 56) = v73;
    *(void *)(v72 + 64) = v67;
    id v74 = v61;
    id v75 = v67;
    id v76 = (void *)sub_1D81B1F78();
    swift_bridgeObjectRelease();
    objc_msgSend(v71, sel_setFilters_, v76);

    objc_msgSend(v46, sel_addSubview_, v86);
    objc_msgSend(v46, sel_addSubview_, *(void *)&v46[OBJC_IVAR___SBHIconResizeHandle_whiteTintView]);
    objc_msgSend(v46, sel_addSubview_, *(void *)&v46[OBJC_IVAR___SBHIconResizeHandle_highlightView]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA889868);
    uint64_t v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_1D81E9B90;
    uint64_t v78 = sub_1D81B1F48();
    uint64_t v79 = MEMORY[0x1E4FB0EE0];
    *(void *)(v77 + 32) = v78;
    *(void *)(v77 + 40) = v79;
    uint64_t v80 = swift_allocObject();
    *(CGFloat *)(v80 + 16) = a6;
    *(void *)(v80 + 24) = v84;
    *(void *)(v80 + 32) = ObjectType;
    type metadata accessor for SBHIconResizeHandle(v80);
    id v81 = v46;
    id v82 = v84;
    sub_1D81B1FF8();
    swift_release();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    return (uint64_t)v81;
  }
  return result;
}

id sub_1D81A8A98(char *a1, double a2, double a3, double a4, double a5)
{
  objc_msgSend(a1, sel_setFrame_);
  id v10 = objc_msgSend(a1, sel_backgroundView);
  objc_msgSend(v10, sel_setFrame_, a2, a3, a4, a5);

  objc_msgSend(*(id *)&a1[OBJC_IVAR___SBHIconResizeHandle_whiteTintView], sel_setFrame_, a2, a3, a4, a5);
  id v11 = *(void **)&a1[OBJC_IVAR___SBHIconResizeHandle_highlightView];
  return objc_msgSend(v11, sel_setFrame_, a2, a3, a4, a5);
}

uint64_t sub_1D81A8B78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

__n128 sub_1D81A8BA0(char *a1, double a2, uint64_t a3, void *a4)
{
  id v7 = objc_msgSend(a1, sel_effectiveUserInterfaceLayoutDirection);
  objc_msgSend(a1, sel_metrics);
  id v8 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);

  sub_1D81A9BC4((uint64_t)&v22, (uint64_t)v7, (uint64_t)v18, a2);
  id v9 = (void *)v18[0];
  uint64_t v10 = v18[1];
  uint64_t v11 = v18[2];
  __n128 v17 = v19;
  unint64_t v12 = v20;
  unint64_t v13 = v21;
  objc_msgSend(a4, sel_setPath_, v18[0]);

  id v14 = &a1[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
  *(void *)id v14 = v10;
  *((void *)v14 + 1) = v11;
  uint64_t v15 = (__n128 *)&a1[OBJC_IVAR___SBHIconResizeHandle_hitArea];
  __n128 result = v17;
  *uint64_t v15 = v17;
  v15[1].n128_u64[0] = v12;
  v15[1].n128_u64[1] = v13;
  return result;
}

void __swiftcall SBHIconResizeHandle.init(coder:)(SBHIconResizeHandle *__return_ptr retstr, NSCoder coder)
{
}

Swift::Void __swiftcall SBHIconResizeHandle.layoutSubviews()()
{
  objc_msgSend(v0, sel_bounds);
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = objc_msgSend(v0, sel_backgroundView);
  objc_msgSend(v9, sel_setFrame_, v2, v4, v6, v8);

  objc_msgSend(*(id *)&v0[OBJC_IVAR___SBHIconResizeHandle_whiteTintView], sel_setFrame_, v2, v4, v6, v8);
  uint64_t v10 = *(void **)&v0[OBJC_IVAR___SBHIconResizeHandle_highlightView];
  objc_msgSend(v10, sel_setFrame_, v2, v4, v6, v8);
}

CGSize __swiftcall SBHIconResizeHandle.sizeThatFits(_:)(CGSize a1)
{
  objc_msgSend(v1, sel_iconImageInfo, a1.width, a1.height);
  double v3 = v2;
  double v4 = v2;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

void sub_1D81A9064(char a1)
{
  uint64_t v2 = OBJC_IVAR___SBHIconResizeHandle_isHighlighted;
  if (v1[OBJC_IVAR___SBHIconResizeHandle_isHighlighted] != (a1 & 1))
  {
    id v13 = objc_msgSend(v1, sel_layer);
    if (v1[v2] == 1)
    {
      double v3 = (void *)sub_1D81B1F98();
      double v4 = (void *)sub_1D81B1F58();
      objc_msgSend(v13, sel_setValue_forKeyPath_, v3, v4);

      id v5 = objc_msgSend(v1, sel_traitCollection);
      objc_msgSend(v5, sel_userInterfaceStyle);

      double v6 = (void *)sub_1D81B1F98();
      double v7 = (void *)sub_1D81B1F58();
      objc_msgSend(v13, sel_setValue_forKeyPath_, v6, v7);

      objc_msgSend(*(id *)&v1[OBJC_IVAR___SBHIconResizeHandle_highlightView], sel_setAlpha_, 0.533333333);
    }
    else
    {
      double v8 = self;
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v13;
      *(void *)(v9 + 24) = v1;
      aBlock[4] = sub_1D81AA0A0;
      void aBlock[5] = v9;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1D81A93C8;
      aBlock[3] = &block_descriptor_0;
      uint64_t v10 = _Block_copy(aBlock);
      id v11 = v13;
      unint64_t v12 = v1;
      swift_release();
      objc_msgSend(v8, sel_animateWithDuration_animations_, v10, 0.3);

      _Block_release(v10);
    }
  }
}

id sub_1D81A92D8(void *a1, uint64_t a2)
{
  double v4 = (void *)sub_1D81B1F98();
  id v5 = (void *)sub_1D81B1F58();
  objc_msgSend(a1, sel_setValue_forKeyPath_, v4, v5);

  double v6 = (void *)sub_1D81B1F98();
  double v7 = (void *)sub_1D81B1F58();
  objc_msgSend(a1, sel_setValue_forKeyPath_, v6, v7);

  double v8 = *(void **)(a2 + OBJC_IVAR___SBHIconResizeHandle_highlightView);
  return objc_msgSend(v8, sel_setAlpha_, 0.0);
}

uint64_t sub_1D81A93C8(uint64_t a1)
{
  double v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Bool __swiftcall SBHIconResizeHandle._shouldAnimateProperty(withKey:)(Swift::String_optional withKey)
{
  object = withKey.value._object;
  if (!withKey.value._object) {
    goto LABEL_12;
  }
  uint64_t countAndFlagsBits = withKey.value._countAndFlagsBits;
  if (withKey.value._countAndFlagsBits == 0xD000000000000027 && withKey.value._object == (void *)0x80000001D81FE7A0) {
    return 1;
  }
  char v5 = sub_1D81B2058();
  BOOL v6 = object == (void *)0x80000001D81FE770 && countAndFlagsBits == 0xD000000000000027;
  unsigned __int8 v4 = 1;
  if (!v6 && (v5 & 1) == 0 && (sub_1D81B2058() & 1) == 0)
  {
    object = (void *)sub_1D81B1F58();
LABEL_12:
    v8.receiver = v1;
    v8.super_class = (Class)SBHIconResizeHandle;
    unsigned __int8 v4 = objc_msgSendSuper2(&v8, sel__shouldAnimatePropertyWithKey_, object);
  }
  return v4;
}

id SBHIconResizeHandle.touchesBegan(_:with:)(uint64_t a1, uint64_t a2)
{
  return sub_1D81A9838(a1, a2, (SEL *)&selRef_touchesBegan_withEvent_, 1);
}

id SBHIconResizeHandle.touchesCancelled(_:with:)(uint64_t a1, uint64_t a2)
{
  sub_1D81A7E58(0, &qword_1EA8897F0);
  sub_1D81A9FE4();
  unsigned __int8 v4 = (void *)sub_1D81B1FA8();
  v6.receiver = v2;
  v6.super_class = (Class)SBHIconResizeHandle;
  objc_msgSendSuper2(&v6, sel_touchesCancelled_withEvent_, v4, a2);

  id result = objc_msgSend(v2, sel_isResizing);
  if ((result & 1) == 0) {
    return objc_msgSend(v2, sel_setHighlighted_, 0);
  }
  return result;
}

id SBHIconResizeHandle.touchesEnded(_:with:)(uint64_t a1, uint64_t a2)
{
  return sub_1D81A9838(a1, a2, (SEL *)&selRef_touchesEnded_withEvent_, 0);
}

id sub_1D81A9838(uint64_t a1, uint64_t a2, SEL *a3, char a4)
{
  sub_1D81A7E58(0, &qword_1EA8897F0);
  sub_1D81A9FE4();
  objc_super v8 = (void *)sub_1D81B1FA8();
  v10.receiver = v4;
  v10.super_class = (Class)SBHIconResizeHandle;
  objc_msgSendSuper2(&v10, *a3, v8, a2);

  return objc_msgSend(v4, sel_setHighlighted_, a4 & 1);
}

uint64_t sub_1D81A98F8(void *a1, uint64_t a2, uint64_t a3, void *a4, SEL *a5, char a6)
{
  sub_1D81A7E58(0, &qword_1EA8897F0);
  sub_1D81A9FE4();
  sub_1D81B1FB8();
  id v10 = a4;
  id v11 = a1;
  unint64_t v12 = (void *)sub_1D81B1FA8();
  v14.receiver = v11;
  v14.super_class = (Class)SBHIconResizeHandle;
  objc_msgSendSuper2(&v14, *a5, v12, v10);

  objc_msgSend(v11, sel_setHighlighted_, a6 & 1);
  return swift_bridgeObjectRelease();
}

void __swiftcall SBHIconResizeHandle.init(frame:)(SBHIconResizeHandle *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

void SBHIconResizeHandle.init(frame:)()
{
}

void sub_1D81A9B30(void *a1)
{
  uint64_t v3 = OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer;
  if (*(void *)&v1[OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer])
  {
    objc_msgSend(v1, sel_removeGestureRecognizer_);
    unsigned __int8 v4 = *(void **)&v1[v3];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  *(void *)&v1[v3] = a1;
  id v5 = a1;

  if (*(void *)&v1[v3])
  {
    objc_msgSend(v1, sel_addGestureRecognizer_);
  }
}

void sub_1D81A9BC4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v8 = *(double *)a1;
  double v40 = *(double *)a1 * 0.5;
  BSFloatCeilForScale();
  double v11 = *(double *)(a1 + 16);
  double v10 = *(double *)(a1 + 24);
  if (a2 == 1) {
    double v10 = -v10;
  }
  double v12 = v9 + v10;
  double v38 = v9;
  double v13 = v9 + *(double *)(a1 + 32);
  double v14 = 0.0;
  if (BSFloatGreaterThanFloat()) {
    double v15 = v11;
  }
  else {
    double v15 = a4;
  }
  double v16 = *(double *)(a1 + 8);
  CGMutablePathRef Mutable = CGPathCreateMutable();
  double v39 = a4;
  if (BSFloatGreaterThanFloat() && BSFloatLessThanFloat()) {
    double v14 = (1.57079633 - v16 / v15) * 0.5;
  }
  if (a2 == 1)
  {
    double v18 = v13 + a4 - v15;
    double v19 = v14 + 1.57079633;
    double v20 = 3.14159265 - v14;
    double v41 = v18;
    double v42 = v12 + v15;
    sub_1D81B1FE8();
  }
  else
  {
    double v21 = v12 + a4 - v15;
    double v22 = v13 + a4 - v15;
    double v20 = 1.57079633 - v14;
    double v41 = v22;
    double v42 = v21;
    sub_1D81B1FE8();
    double v19 = v14;
  }
  uint64_t v23 = sub_1D81B2008();
  double v24 = *(double *)(a1 + 48);
  double v25 = *(double *)(a1 + 56);
  double v26 = *(double *)(a1 + 64);
  double v27 = *(double *)(a1 + 72);
  if (*(void *)(a1 + 40))
  {

    double v28 = v15 - v40 + v25;
    if (a2 == 1) {
      double v29 = -v24 / v15;
    }
    else {
      double v29 = -v26 / v15;
    }
    if (a2 == 1) {
      double v30 = -v26 / v15;
    }
    else {
      double v30 = -v24 / v15;
    }
    double v31 = v19 - v30;
    double v32 = v8 - v25 - v27;
    double v33 = v29 + v20 - v19 + v30;
  }
  else
  {
    SBHDirectionalEdgeInsetsGetEdgeInsets();
    double v35 = v34;
    double v37 = v36;

    double v28 = UIEdgeInsetsInsetRect(v38, v38, v39, v39, v35, v37);
  }
  *(void *)a3 = v23;
  *(double *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = v42;
  *(double *)(a3 + 16) = v41;
  *(double *)(a3 + 24) = v28;
  *(double *)(a3 + 32) = v31;
  *(double *)(a3 + 40) = v32;
  *(double *)(a3 + 4_Block_object_dispose(&STACK[0x220], 8) = v33;
}

void _sSo19SBHIconResizeHandleC15SpringBoardHomeE5coderABSo7NSCoderC_tcfc_0()
{
  double v1 = &v0[OBJC_IVAR___SBHIconResizeHandle_hitArea];
  *double v1 = 0u;
  v1[1] = 0u;
  uint64_t v2 = &v0[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
  *uint64_t v2 = 0;
  v2[1] = 0;
  *(void *)&v0[OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer] = 0;
  v0[OBJC_IVAR___SBHIconResizeHandle_isHighlighted] = 0;
  v0[OBJC_IVAR___SBHIconResizeHandle__isResizing] = 0;
  v0[OBJC_IVAR___SBHIconResizeHandle_isDarkStyle] = 0;
  *(void *)&v0[OBJC_IVAR___SBHIconResizeHandle_shapeLayer] = 0;

  sub_1D81B2038();
  __break(1u);
}

BOOL _sSo19SBHIconResizeHandleC15SpringBoardHomeE5point6inside4withSbSo7CGPointV_So7UIEventCSgtF_0(CGFloat a1, long double a2)
{
  objc_msgSend(v2, sel_metrics);
  if (v8 == 1)
  {
    CGFloat v5 = a1 - *(double *)&v2[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
    long double v6 = a2 - *(double *)&v2[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin + 8];
    a1 = sqrt(v5 * v5 + v6 * v6);
    a2 = atan(v6 / v5);
    if (BSFloatLessThanFloat())
    {
      a2 = a2 + 3.14159265;
    }
    else if (BSFloatLessThanFloat())
    {
      a2 = a2 + 6.28318531;
    }
  }
  v9.double x = a1;
  v9.double y = a2;
  return CGRectContainsPoint(*(CGRect *)&v2[OBJC_IVAR___SBHIconResizeHandle_hitArea], v9);
}

unint64_t sub_1D81A9FE4()
{
  unint64_t result = qword_1EA8897F8;
  if (!qword_1EA8897F8)
  {
    sub_1D81A7E58(255, &qword_1EA8897F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8897F8);
  }
  return result;
}

uint64_t type metadata accessor for SBHIconResizeHandle(uint64_t a1)
{
  return sub_1D81A7E58(a1, &qword_1EA889850);
}

uint64_t sub_1D81AA060()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1D81AA0A0()
{
  return sub_1D81A92D8(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1D81AA0C0()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

id sub_1D81AA0F8()
{
  return sub_1D81A8A98(*(char **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_1D81AA108()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D81AA118()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D81AA140()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

double sub_1D81AA178(char *a1, uint64_t a2)
{
  *(void *)&double result = sub_1D81A8BA0(a1, *(double *)(v2 + 16), a2, (void *)*(void *)(v2 + 24)).n128_u64[0];
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1D81AA228(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + *a4) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

unint64_t sub_1D81AA4E4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone((Class)SBHAddWidgetSheetConfiguration), sel_init);
  objc_msgSend(v4, sel_setListLayoutProvider_, objc_msgSend(v2, sel_listLayoutProvider));
  swift_unknownObjectRelease();
  objc_msgSend(v4, sel_setIconViewProvider_, objc_msgSend(v2, sel_iconViewProvider));
  swift_unknownObjectRelease();
  id v5 = objc_msgSend(v2, sel_gridSizeClassDomain);
  objc_msgSend(v4, sel_setGridSizeClassDomain_, v5);

  id v6 = objc_msgSend(v2, sel_gridSizeClassForContentWidth);
  objc_msgSend(v4, sel_setGridSizeClassForContentWidth_, v6);

  objc_msgSend(v4, sel_setStyle_, objc_msgSend(v2, sel_style));
  objc_msgSend(v4, sel_setBackgroundMaterial_, objc_msgSend(v2, sel_backgroundMaterial));
  id v7 = objc_msgSend(v2, sel_searchPlaceholderText);
  objc_msgSend(v4, sel_setSearchPlaceholderText_, v7);

  id v8 = objc_msgSend(v2, sel_searchTintColor);
  objc_msgSend(v4, sel_setSearchTintColor_, v8);

  objc_msgSend(v4, sel_setApplicationCellIncludesGalleryListView_, objc_msgSend(v2, sel_applicationCellIncludesGalleryListView));
  objc_msgSend(v4, sel_setContentContainsInteractiveUIControls_, objc_msgSend(v2, sel_contentContainsInteractiveUIControls));
  objc_msgSend(v4, sel_setWantsCustomApplicationsSection_, objc_msgSend(v2, sel_wantsCustomApplicationsSection));
  unint64_t result = type metadata accessor for SBHAddWidgetSheetConfiguration();
  a1[3] = result;
  *a1 = v4;
  return result;
}

void __swiftcall SBHAddWidgetSheetConfiguration.init()(SBHAddWidgetSheetConfiguration *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id SBHAddWidgetSheetConfiguration.init()()
{
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_listLayoutProvider) = 0;
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_iconViewProvider) = 0;
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain) = 0;
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth) = 0;
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_style) = 0;
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_backgroundMaterial) = 2;
  id v1 = (void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchPlaceholderText);
  *id v1 = 0;
  v1[1] = 0;
  *(void *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_applicationCellIncludesGalleryListView) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_contentContainsInteractiveUIControls) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_wantsCustomApplicationsSection) = 0;
  v3.super_class = (Class)SBHAddWidgetSheetConfiguration;
  return objc_msgSendSuper2(&v3, sel_init);
}

unint64_t type metadata accessor for SBHAddWidgetSheetConfiguration()
{
  unint64_t result = qword_1EA8898C8;
  if (!qword_1EA8898C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA8898C8);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

BOOL SBIconCoordinate.isNotFound.getter(uint64_t a1, uint64_t a2)
{
  return SBIconCoordinateIsNotFound(a1, a2);
}

void SBIconLocationGroup.add(_:)(void *a1, void *a2)
{
}

uint64_t SBIconLocationGroup.contains(_:)(void *a1, void *a2)
{
  return SBIconLocationGroupContainsLocation(a2, a1);
}

__CFString *SBIconLocation.withWidgets(_:)(char a1, void *a2)
{
  uint64_t v2 = SBIconLocationSelectLocationWithWidgets(a2, a1 & 1);
  return v2;
}

double sub_1D81AAA94()
{
  double result = *(double *)&SBIconCoordinateNotFound;
  xmmword_1EA8898D0 = SBIconCoordinateNotFound;
  return result;
}

uint64_t static SBIconCoordinate.notFound.getter()
{
  if (qword_1EA889640 != -1) {
    swift_once();
  }
  return xmmword_1EA8898D0;
}

uint64_t SBIconCoordinate.description.getter(uint64_t a1, uint64_t a2)
{
  id v2 = (id)SBHStringForIconCoordinate(a1, a2);
  uint64_t v3 = sub_1D81B1F68();

  return v3;
}

uint64_t sub_1D81AAB4C()
{
  id v1 = (id)SBHStringForIconCoordinate(*v0, v0[1]);
  uint64_t v2 = sub_1D81B1F68();

  return v2;
}

BOOL static SBIconImageInfo.== infix(_:_:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return SBIconImageInfoEqualToIconImageInfo(a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL sub_1D81AABB4(double *a1, double *a2)
{
  return SBIconImageInfoEqualToIconImageInfo(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

Swift::Bool __swiftcall SBIconImageInfo.hasEqualSizeAndScale(to:)(SBIconImageInfo to)
{
  return SBIconImageInfoSizeAndScaleEqualToIconImageInfo(v1, v2, v3, v4, to.size.width, to.size.height, to.scale);
}

uint64_t SBIconImageInfo.description.getter(double a1, double a2, double a3, double a4)
{
  id v4 = (id)SBHStringForIconImageInfo(a1, a2, a3, a4);
  uint64_t v5 = sub_1D81B1F68();

  return v5;
}

uint64_t sub_1D81AAC70()
{
  id v1 = (id)SBHStringForIconImageInfo(*v0, v0[1], v0[2], v0[3]);
  uint64_t v2 = sub_1D81B1F68();

  return v2;
}

uint64_t static SBIconResizeHandleMetrics.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 32);
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v6;
  uint64_t v17 = v4;
  uint64_t v18 = v5;
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v19 = *(_OWORD *)(a1 + 48);
  long long v20 = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v8;
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  long long v9 = *(_OWORD *)(a2 + 64);
  long long v14 = *(_OWORD *)(a2 + 48);
  long long v15 = v9;
  return SBIconResizeHandleMetricsEqualToIconResizeHandleMetrics((uint64_t)v16, (uint64_t)v11);
}

uint64_t sub_1D81AAD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  long long v6 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v6;
  uint64_t v17 = v2;
  uint64_t v18 = v3;
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v19 = *(_OWORD *)(a1 + 48);
  long long v20 = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v8;
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  long long v9 = *(_OWORD *)(a2 + 64);
  long long v14 = *(_OWORD *)(a2 + 48);
  long long v15 = v9;
  return SBIconResizeHandleMetricsEqualToIconResizeHandleMetrics((uint64_t)v16, (uint64_t)v11);
}

void SBHIconGridSizeClassGroup.add(_:)(void *a1, void *a2)
{
}

uint64_t SBHIconGridSizeClassGroup.contains(_:)(void *a1, void *a2)
{
  return SBHIconGridSizeClassGroupContainsGridSizeClass(a2, a1);
}

BOOL static SBHIconGridSize.== infix(_:_:)(int a1, int a2)
{
  return SBHIconGridSizeEqualToIconGridSize(a1, a2);
}

BOOL sub_1D81AADE8(int *a1, int *a2)
{
  return SBHIconGridSizeEqualToIconGridSize(*a1, *a2);
}

uint64_t SBHIconGridSize.area.getter(int a1)
{
  return SBHIconGridSizeGetArea(a1);
}

uint64_t SBHIconGridSize.perimeter.getter(unsigned int a1)
{
  return SBHIconGridSizeGetPerimeter(a1);
}

uint64_t SBHIconGridSize.smallestDimension.getter(unsigned int a1)
{
  return SBHIconGridSizeGetSmallestDimension(a1);
}

uint64_t SBHIconGridSize.largestDimension.getter(unsigned int a1)
{
  return SBHIconGridSizeGetLargestDimension(a1);
}

BOOL SBHIconGridSize.isPortrait.getter(int a1)
{
  return SBHIconGridSizeIsPortrait(a1);
}

BOOL SBHIconGridSize.isLandscape.getter(int a1)
{
  return SBHIconGridSizeIsLandscape(a1);
}

SBHIconGridSize __swiftcall SBHIconGridSize.rotated()()
{
  return (SBHIconGridSize)SBHIconGridSizeRotate(v0);
}

BOOL SBHIconGridSize.isDefault.getter(int a1)
{
  return SBHIconGridSizeIsDefault(a1);
}

BOOL SBHIconGridSize.isEmpty.getter(int a1)
{
  return SBHIconGridSizeIsEmpty(a1);
}

Swift::Bool __swiftcall SBHIconGridSize.contains(cellIndex:)(Swift::UInt cellIndex)
{
  return SBHIconGridSizeContainsCellIndex(v1, cellIndex);
}

Swift::UInt __swiftcall SBHIconGridSize.gridCellIndex(for:)(__C::SBIconCoordinate a1)
{
  return SBIconCoordinateGetGridCellIndex(a1.column, a1.row, v1);
}

__C::SBIconCoordinate __swiftcall SBHIconGridSize.coordinate(for:)(Swift::UInt a1)
{
  Swift::Int v2 = SBIconCoordinateMakeWithGridCellIndex(a1, v1);
  result.row = v3;
  result.column = v2;
  return result;
}

void sub_1D81AAEFC()
{
  dword_1EA8898E0 = 65537;
}

uint64_t static SBHIconGridSize.default.getter()
{
  return sub_1D81AAF7C(&qword_1EA889648, (unsigned int *)&dword_1EA8898E0);
}

void sub_1D81AAF3C()
{
  dword_1EA8898E4 = 0;
}

uint64_t static SBHIconGridSize.empty.getter()
{
  return sub_1D81AAF7C(&qword_1EA889650, (unsigned int *)&dword_1EA8898E4);
}

uint64_t sub_1D81AAF7C(void *a1, unsigned int *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *a2;
}

uint64_t SBHIconGridSize.description.getter(int a1)
{
  id v1 = (id)SBHStringForIconGridSize(a1);
  uint64_t v2 = sub_1D81B1F68();

  return v2;
}

uint64_t sub_1D81AB008()
{
  id v1 = (id)SBHStringForIconGridSize(*v0);
  uint64_t v2 = sub_1D81B1F68();

  return v2;
}

id sub_1D81AB058()
{
  uint64_t v0 = sub_1D81B1F28();
  __swift_allocate_value_buffer(v0, qword_1EA88A130);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA88A130);
  id result = SBLogAddWidgetSheet();
  if (result) {
    return (id)sub_1D81B1F38();
  }
  __break(1u);
  return result;
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

uint64_t SBHPageManagementIcon.canReceiveGrabbedIcon.getter()
{
  return 0;
}

uint64_t SBHPageManagementIcon.canBeReceivedByIcon.getter()
{
  return 0;
}

uint64_t SBHPageManagementIcon.canBeAddedToSubfolder.getter()
{
  return 0;
}

uint64_t SBHPageManagementIcon.canBeAddedToMultiItemDrag.getter()
{
  return 0;
}

void __swiftcall SBHPageManagementIcon.init(leafIdentifier:applicationBundleID:)(SBHPageManagementIcon *__return_ptr retstr, Swift::String leafIdentifier, Swift::String_optional applicationBundleID)
{
  object = applicationBundleID.value._object;
  uint64_t v4 = (void *)sub_1D81B1F58();
  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v5 = (void *)sub_1D81B1F58();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithLeafIdentifier_applicationBundleID_, v4, v5);
}

void SBHPageManagementIcon.init(leafIdentifier:applicationBundleID:)()
{
}

unint64_t type metadata accessor for SBHPageManagementIcon()
{
  unint64_t result = qword_1EA8898F0;
  if (!qword_1EA8898F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA8898F0);
  }
  return result;
}

uint64_t sub_1D81AB40C()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getAPUISuggestionsWidgetViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke_cold_1(v0);
}

void __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2_cold_1(v0, v1);
}

uint64_t __getDMFApplicationPolicyMonitorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:](v0);
}

uint64_t __getSPUIDefaultsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBHIconLayoutHidingCompoundAssertion dealloc](v0);
}

uint64_t __getAPUIAppPredictionViewControllerClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke_cold_1(v0, v1, v2);
}

uint64_t __getCPSWebClipStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIXAppInstallCoordinatorClass_block_invoke_cold_1(v0);
}

uint64_t __getIXAppInstallCoordinatorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBHWidgetInsertionRippleIconAnimator animateWithCompletion:](v0);
}

uint64_t __getCCUICAPackageDescriptionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCCUILabeledRoundButtonViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCCUILabeledRoundButtonViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBSApplicationShortcutItem(SBHAdditions) sb_buildIconImageWithApplicationBundleURL:image:systemImageName:](v0);
}

uint64_t __getCNMonogrammerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNContactStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNMutableContactClass_block_invoke_cold_1(v0);
}

uint64_t __getCNMutableContactClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBHIconLayoutHidingAssertion dealloc](v0);
}

uint64_t __getPUIMutableStylePickerConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPUIStylePickerComponentsClass_block_invoke_cold_1(v0);
}

uint64_t __getPUIStylePickerComponentsClass_block_invoke_cold_1()
{
  return __getPUIStylePickerHomeScreenConfigurationClass_block_invoke_cold_1();
}

uint64_t __getPUIStylePickerHomeScreenConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPUIStylePickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPUIStylePickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPUIGradientViewClass_block_invoke_cold_1(v0);
}

void __getPUIGradientViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[SBIconListModel insertIcons:atIndex:options:](v0);
}

uint64_t __getIXUninstallOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SBLeafIcon _noteActiveDataSourceDidGenerateImageNotification:](v0);
}

uint64_t SBHIconLocationIsAppPrediction_cold_1()
{
  dlerror();
  int v0 = abort_report_np();
  return __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3_cold_1(v0, v1, v2);
}

void SBHIconDragItemWithIconAndIconView_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Skipping setTeamData on the provider. Drag info data is nil with error:%@ for dragInfo:%@.", (uint8_t *)&v3, 0x16u);
}

void SBHIconDragItemWithIconAndIconView_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Skipping setTeamData on the provider. Drag info data is too large for dragInfo:%@.", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1D81B1ED8()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1D81B1EE8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D81B1EF8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1D81B1F08()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D81B1F18()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D81B1F28()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D81B1F38()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1D81B1F48()
{
  return MEMORY[0x1F4165B78]();
}

uint64_t sub_1D81B1F58()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D81B1F68()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D81B1F78()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D81B1F88()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D81B1F98()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1D81B1FA8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1D81B1FB8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D81B1FC8()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1D81B1FD8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D81B1FE8()
{
  return MEMORY[0x1F40D96F8]();
}

uint64_t sub_1D81B1FF8()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1D81B2008()
{
  return MEMORY[0x1F40D9758]();
}

uint64_t sub_1D81B2018()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D81B2028()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D81B2038()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D81B2048()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1D81B2058()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1F410C1F8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueAssertNotMain()
{
  return MEMORY[0x1F410C298]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1F410C2D8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F410C310]();
}

uint64_t BSFloatCeilForScale()
{
  return MEMORY[0x1F410C320]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x1F410C330]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1F410C340]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1F410C358]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSIntervalFractionForValue()
{
  return MEMORY[0x1F410C3D0]();
}

uint64_t BSIntervalMax()
{
  return MEMORY[0x1F410C3E8]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1F410C408]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1F410C4D0]();
}

uint64_t BSRectCenteredAboutPoint()
{
  return MEMORY[0x1F410C528]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1F410C530]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1F410C608]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1F410C610]();
}

uint64_t BSSizeGreaterThanOrEqualToSize()
{
  return MEMORY[0x1F410C620]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x1F410C698]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1F410C6F8]();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return MEMORY[0x1F410C700]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1F40F4A58]();
}

uint64_t CAColorMatrixMakeContrast()
{
  return MEMORY[0x1F40F4A60]();
}

uint64_t CAColorMatrixMakeMultiplyColor()
{
  return MEMORY[0x1F40F4A68]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1F40F4A80]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1F40F4D08](t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

uint64_t CFMergeSortArray()
{
  return MEMORY[0x1F40D7CA8]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9860](context);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9998](gray, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x1F40D9D30]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
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

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t CHSEdgeInsetsMake()
{
  return MEMORY[0x1F4111770]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1F4111798]();
}

uint64_t CHSWidgetFamilyMaskContainsFamily()
{
  return MEMORY[0x1F41117A8]();
}

uint64_t CHSWidgetFamilyMaskDescription()
{
  return MEMORY[0x1F41117B0]();
}

uint64_t CHSWidgetFamilyMaskEnumerateFamilies()
{
  return MEMORY[0x1F41117B8]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

uint64_t FBSInstallTypeIsCloudDemoted()
{
  return MEMORY[0x1F411A1B0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x1F417CE40]();
}

uint64_t MTMaterialRecipeForUIBlurEffectStyle()
{
  return MEMORY[0x1F412C678]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1F4166A98](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

uint64_t NSStringFromCHUISWidgetColorScheme()
{
  return MEMORY[0x1F4111840]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AB8](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

uint64_t NSStringFromFBSApplicationPlaceholderProgressState()
{
  return MEMORY[0x1F411A238]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AC0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *__cdecl NSStringFromUIOffset(UIOffset offset)
{
  return (NSString *)MEMORY[0x1F4166AC8]((__n128)offset, *(__n128 *)&offset.vertical);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

uint64_t SBFApplyParallaxSettingsToView()
{
  return MEMORY[0x1F415BB08]();
}

uint64_t SBFApplyParallaxSettingsToViewWithFactor()
{
  return MEMORY[0x1F415BB10]();
}

uint64_t SBFBoolEquals()
{
  return MEMORY[0x1F415BB30]();
}

uint64_t SBFComposedColor()
{
  return MEMORY[0x1F415BB40]();
}

uint64_t SBFEdgeInsetsRelativeToRectEdge()
{
  return MEMORY[0x1F415BB58]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1F415BB68]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1F415BB70]();
}

uint64_t SBFEffectiveDisplayCornerRadius()
{
  return MEMORY[0x1F415BB78]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1F415BB80]();
}

uint64_t SBFEqualStrings()
{
  return MEMORY[0x1F415BB90]();
}

uint64_t SBFFloatCeilForScale()
{
  return MEMORY[0x1F415BBA0]();
}

uint64_t SBFFloatEqualsFloat()
{
  return MEMORY[0x1F415BBA8]();
}

uint64_t SBFFloatFloorForScale()
{
  return MEMORY[0x1F415BBB0]();
}

uint64_t SBFFloatRoundForScale()
{
  return MEMORY[0x1F415BBB8]();
}

uint64_t SBFInterfaceOrientationMaskContainsInterfaceOrientation()
{
  return MEMORY[0x1F415BBC8]();
}

uint64_t SBFIsChamoisExternalDisplayControllerAvailable()
{
  return MEMORY[0x1F415BBD8]();
}

uint64_t SBFPointEqualToPointAtScale()
{
  return MEMORY[0x1F415BC70]();
}

uint64_t SBFPreheatImageData()
{
  return MEMORY[0x1F415BC78]();
}

uint64_t SBFRectRoundForScale()
{
  return MEMORY[0x1F415BC88]();
}

uint64_t SBFSafeCast()
{
  return MEMORY[0x1F415BC90]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1F415BCF8]();
}

uint64_t SBLogFocusModes()
{
  return MEMORY[0x1F415C198]();
}

uint64_t SBLogIconDragging()
{
  return MEMORY[0x1F415C1C0]();
}

uint64_t SBLogReusableViewCache()
{
  return MEMORY[0x1F415BD08]();
}

uint64_t SBLogRootController()
{
  return MEMORY[0x1F415C260]();
}

uint64_t SBLogSpotlight()
{
  return MEMORY[0x1F415C280]();
}

uint64_t SBRectWithSize()
{
  return MEMORY[0x1F415C5D0]();
}

uint64_t SBSCreateOpenApplicationService()
{
  return MEMORY[0x1F415C330]();
}

uint64_t SBStringFromAnimationUpdateMode()
{
  return MEMORY[0x1F415BD18]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4166B28]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4166B88]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4166B90]();
}

uint64_t UIContentSizeCategoryClip()
{
  return MEMORY[0x1F415C6B8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4166BB8]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
}

uint64_t UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper()
{
  return MEMORY[0x1F4166BC8]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1F4166BD8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1F4166BE0]();
}

uint64_t UIEdgeInsetsMin()
{
  return MEMORY[0x1F4166BE8]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1F4166C00]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1F4166C08]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4166DF8]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4166E08]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4166E18]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4166E28]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4166E30]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectContainInRect()
{
  return MEMORY[0x1F4166E58]();
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1F4166E90]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4166EE8]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1F4166EF0]();
}

uint64_t WFWidgetGetDefaultColors()
{
  return MEMORY[0x1F4176DE8]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _SBFLoggingMethodProem()
{
  return MEMORY[0x1F415BD30]();
}

uint64_t _UIScrollViewNotifyForScrollView()
{
  return MEMORY[0x1F4167080]();
}

uint64_t _UISheetMinimumTopInset()
{
  return MEMORY[0x1F4167088]();
}

uint64_t _UIUpdateCycleRegisterIdleObserver()
{
  return MEMORY[0x1F41670D8]();
}

uint64_t _UIUpdateCycleUnregisterIdleObserver()
{
  return MEMORY[0x1F41670E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __MDQueryCreateStringByAddingBackslashEscapes()
{
  return MEMORY[0x1F412F3F8]();
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1F415C4D0]();
}

uint64_t __sb__mainScreenScale()
{
  return MEMORY[0x1F415C4D8]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1F415C4E0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x1F40CA528](a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t convertDampingRatioAndResponseToTensionAndFriction()
{
  return MEMORY[0x1F415BDC0]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1F417A390]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

long double nexttoward(long double __x, long double __y)
{
  MEMORY[0x1F40CD008](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}