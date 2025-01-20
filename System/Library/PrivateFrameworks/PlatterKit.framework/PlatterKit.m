void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D93DF6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93E0630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93E45B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_1D93E4808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1D93E4950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1D93E4D58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_1D93E50DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D93E5DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D93E69C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D93EC5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93EC764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id UIViewForPLPillContentItem(void *a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = UILabelForPLPillContentItem(v3, a2);
  v5 = [v3 text];
  if (v5)
  {
  }
  else
  {
    v6 = [v3 attributedText];

    if (!v6)
    {
      [v4 setText:@" "];
      int v7 = 0;
      goto LABEL_5;
    }
  }
  int v7 = 1;
LABEL_5:
  v8 = [v3 accessoryView];

  if (v8
    && (([v3 accessoryView], (v8 = objc_claimAutoreleasedReturnValue()) != 0)
      ? (int v9 = v7)
      : (int v9 = 0),
        v9 == 1))
  {
    if ([v4 _shouldReverseLayoutDirection]) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 2;
    }
    [v4 setTextAlignment:v10];
    id v11 = objc_alloc(MEMORY[0x1E4F42E20]);
    v21[0] = v4;
    v21[1] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v13 = (void *)[v11 initWithArrangedSubviews:v12];

    [v13 setAxis:0];
    [v13 setAlignment:3];
    [v13 setDistribution:1];
    [v13 setSpacing:4.0];
  }
  else
  {
    if (v7)
    {
      id v14 = v4;
    }
    else
    {
      [v4 intrinsicContentSize];
      double v16 = v15;
      [v8 intrinsicContentSize];
      if (v16 < v17) {
        double v16 = v17;
      }
      v18 = [v8 heightAnchor];
      v19 = [v18 constraintEqualToConstant:v16];
      [v19 setActive:1];

      id v14 = v8;
      v8 = v14;
    }
    v13 = v14;
  }

  return v13;
}

void sub_1D93ED19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

void PLConfigureUILabelWithPLPillContentItemStyle(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v17 = a1;
  int v7 = a4;
  v8 = (id *)MEMORY[0x1E4F43870];
  if (a2 != 7) {
    v8 = (id *)MEMORY[0x1E4F43890];
  }
  int v9 = (void *)MEMORY[0x1E4F4F8B8];
  id v10 = *v8;
  id v11 = [v9 preferredFontProvider];
  v12 = [v11 preferredFontForTextStyle:v10 hiFontStyle:12 contentSizeCategory:v7];

  [v17 setFont:v12];
  uint64_t v13 = 1;
  [v17 setTextAlignment:1];
  [v17 setLineBreakMode:0];
  [v17 setMarqueeEnabled:a3];
  if ((a3 & 1) == 0)
  {
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43778], v7) == NSOrderedAscending) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 2;
    }
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43768], v7) == NSOrderedAscending) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = v14;
    }
  }
  [v17 setNumberOfLines:v13];
  switch(a2)
  {
    case 0:
    case 1:
    case 6:
    case 7:
      uint64_t v15 = [MEMORY[0x1E4F428B8] labelColor];
      goto LABEL_16;
    case 2:
      uint64_t v15 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      goto LABEL_16;
    case 3:
      uint64_t v15 = [MEMORY[0x1E4F428B8] systemOrangeColor];
      goto LABEL_16;
    case 4:
      uint64_t v15 = [MEMORY[0x1E4F428B8] systemRedColor];
      goto LABEL_16;
    case 5:
      uint64_t v15 = [MEMORY[0x1E4F428B8] systemBlueColor];
LABEL_16:
      double v16 = (void *)v15;
      [v17 setTextColor:v15];

      break;
    default:
      break;
  }
}

id UILabelForPLPillContentItem(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F42B38];
  id v5 = a2;
  id v6 = objc_alloc_init(v4);
  PLConfigureUILabelWithPLPillContentItemStyle(v6, [v3 style], objc_msgSend(v3, "isSolo") ^ 1, v5);

  int v7 = [v3 text];

  if (v7)
  {
    [v6 setAttributedText:0];
    v8 = [v3 text];
    [v6 setText:v8];
  }
  int v9 = [v3 attributedText];

  if (v9)
  {
    [v6 setText:0];
    id v10 = [v3 attributedText];
    [v6 setAttributedText:v10];
  }
  return v6;
}

void sub_1D93F0D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F1530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1D93F31DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F36B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F3884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F3A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F3D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F3FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F51FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D93F65A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double PLMainScreenScale()
{
  if (PLMainScreenScale___once != -1) {
    dispatch_once(&PLMainScreenScale___once, &__block_literal_global_1);
  }
  return *(double *)&PLMainScreenScale___cachedScale;
}

void __PLMainScreenScale_block_invoke()
{
  id v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 scale];
  PLMainScreenScale___cachedScale = v0;
}

id PlatterKitFrameworkBundle()
{
  if (PlatterKitFrameworkBundle___once != -1) {
    dispatch_once(&PlatterKitFrameworkBundle___once, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)PlatterKitFrameworkBundle___bundle;
  return v0;
}

uint64_t __PlatterKitFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = PlatterKitFrameworkBundle___bundle;
  PlatterKitFrameworkBundle___bundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t BSUIDateFormatStyleFromPLDateFormatStyle(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((unint64_t)(a1 + 1) >= 3)
  {
    v2 = PLLogGeneral;
    if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR)) {
      BSUIDateFormatStyleFromPLDateFormatStyle_cold_1(v1, v2);
    }
    return -1;
  }
  return v1;
}

double PLContentViewHeightForContentSizeCategory(void *a1, unint64_t a2, double a3)
{
  uint64_t v5 = *MEMORY[0x1E4F437D0];
  id v6 = a1;
  int v7 = [v6 isEqualToString:v5];
  v8 = (void *)*MEMORY[0x1E4F437B0];
  if (!v7) {
    v8 = v6;
  }
  id v9 = v8;

  if ([v9 isEqualToString:*MEMORY[0x1E4F437A0]])
  {
    double v10 = 50.0;
    if (a3 != 0.0) {
      double v10 = 56.0;
    }
    BOOL v11 = a2 >= 2;
    uint64_t v12 = 0x404D000000000000;
  }
  else
  {
    if ([v9 isEqualToString:*MEMORY[0x1E4F43798]])
    {
      double v10 = 50.0;
      double v13 = 62.0;
      if (a3 != 0.0) {
        double v10 = 62.0;
      }
      BOOL v11 = a2 >= 2;
      goto LABEL_30;
    }
    if ([v9 isEqualToString:*MEMORY[0x1E4F43790]])
    {
      double v10 = 50.0;
      if (a3 != 0.0) {
        double v10 = 65.0;
      }
      BOOL v11 = a2 >= 2;
      uint64_t v12 = 0x4051000000000000;
    }
    else
    {
      if ([v9 isEqualToString:*MEMORY[0x1E4F43780]])
      {
        double v10 = 50.0;
        if (a3 != 0.0) {
          double v10 = 76.0;
        }
        BOOL v11 = a2 >= 2;
        double v13 = 78.0;
        goto LABEL_30;
      }
      if ([v9 isEqualToString:*MEMORY[0x1E4F43778]])
      {
        double v10 = 53.0;
        if (a3 != 0.0) {
          double v10 = 84.0;
        }
        BOOL v11 = a2 >= 2;
        uint64_t v12 = 0x4056000000000000;
      }
      else if ([v9 isEqualToString:*MEMORY[0x1E4F43770]])
      {
        double v10 = dbl_1D9406D10[a3 != 0.0];
        BOOL v11 = a2 >= 2;
        uint64_t v12 = 0x4059000000000000;
      }
      else if ([v9 isEqualToString:*MEMORY[0x1E4F43768]])
      {
        double v10 = dbl_1D9406D00[a3 != 0.0];
        BOOL v11 = a2 >= 2;
        uint64_t v12 = 0x405C000000000000;
      }
      else
      {
        if (![v9 isEqualToString:*MEMORY[0x1E4F43760]])
        {
          double v14 = 50.0;
          goto LABEL_33;
        }
        double v10 = dbl_1D9406CF0[a3 != 0.0];
        BOOL v11 = a2 >= 2;
        uint64_t v12 = 0x4060000000000000;
      }
    }
  }
  double v13 = *(double *)&v12;
LABEL_30:
  if (v11) {
    double v14 = v13;
  }
  else {
    double v14 = v10;
  }
LABEL_33:

  return v14;
}

void sub_1D93FBE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  if ((v11 & 4) != 0) {
    objc_destroyWeak(v13);
  }
  if ((v12 & 2) != 0) {
    objc_destroyWeak(location);
  }
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_1D93FCBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PLViewAnimationOptionsForAnimationCurve(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return 0;
  }
  else {
    return ((a1 - 1) << 16) + 0x10000;
  }
}

void PLSetViewFrameMaintainingTransform(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  double v10 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  if (v9) {
    [v9 transform];
  }
  char v11 = (void *)MEMORY[0x1E4F42FF0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __PLSetViewFrameMaintainingTransform_block_invoke;
  v20[3] = &unk_1E6B5F800;
  id v12 = v10;
  id v21 = v12;
  [v11 performWithoutAnimation:v20];
  objc_msgSend(v12, "setFrame:", a2, a3, a4, a5);
  double v13 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  long long v17 = v22;
  v15[2] = __PLSetViewFrameMaintainingTransform_block_invoke_2;
  v15[3] = &unk_1E6B5FED8;
  id v16 = v12;
  long long v18 = v23;
  long long v19 = v24;
  id v14 = v12;
  [v13 performWithoutAnimation:v15];
}

uint64_t __PLSetViewFrameMaintainingTransform_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __PLSetViewFrameMaintainingTransform_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id PLCAMediaTimingFunctionForViewAnimationCurve(unint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a1 <= 5) {
    unint64_t v5 = a1;
  }
  else {
    unint64_t v5 = 0;
  }
  switch(v5)
  {
    case 1uLL:
      id v6 = (void *)MEMORY[0x1E4F39C10];
      int v7 = (void *)MEMORY[0x1E4F3A488];
      goto LABEL_11;
    case 2uLL:
      id v6 = (void *)MEMORY[0x1E4F39C10];
      int v7 = (void *)MEMORY[0x1E4F3A498];
      goto LABEL_11;
    case 3uLL:
      id v6 = (void *)MEMORY[0x1E4F39C10];
      int v7 = (void *)MEMORY[0x1E4F3A4A0];
      goto LABEL_11;
    case 4uLL:
      LODWORD(a2) = 1059648963;
      LODWORD(a4) = 1051260355;
      LODWORD(a5) = 1.0;
      v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:a2 :0.0 :a4 :a5];
      goto LABEL_12;
    case 5uLL:
      id v6 = (void *)MEMORY[0x1E4F39C10];
      int v7 = (void *)MEMORY[0x1E4F3A480];
      goto LABEL_11;
    default:
      id v6 = (void *)MEMORY[0x1E4F39C10];
      int v7 = (void *)MEMORY[0x1E4F3A490];
LABEL_11:
      v8 = [v6 functionWithName:*v7];
LABEL_12:
      return v8;
  }
}

void PLRegisterPlatterKitLogging()
{
  if (PLRegisterPlatterKitLogging_onceToken != -1) {
    dispatch_once(&PLRegisterPlatterKitLogging_onceToken, &__block_literal_global_3);
  }
}

uint64_t __PLRegisterPlatterKitLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)PLLogSubsystem, "General");
  uint64_t v1 = (void *)PLLogGeneral;
  PLLogGeneral = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)PLLogSubsystem, "Transition");
  id v3 = (void *)PLLogTransition;
  PLLogTransition = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)PLLogSubsystem, "Interaction");
  uint64_t v5 = PLLogInteraction;
  PLLogInteraction = (uint64_t)v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

void BSUIDateFormatStyleFromPLDateFormatStyle_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D93DD000, a2, OS_LOG_TYPE_ERROR, "Undefined date format style: %{public}ld", (uint8_t *)&v2, 0xCu);
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x1F410C3E0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MTIsUIBlurEffectStyleDynamic()
{
  return MEMORY[0x1F412C670]();
}

uint64_t MTMaterialRecipeForUIBlurEffectStyle()
{
  return MEMORY[0x1F412C678]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4102D50]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4102D60]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4102D78]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4102D88]();
}

uint64_t UIRectContainInRect()
{
  return MEMORY[0x1F4102D98]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4102E10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}