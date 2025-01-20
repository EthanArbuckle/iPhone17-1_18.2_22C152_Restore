void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x1C87498F0);
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
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

void sub_1C19532D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1955C30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C195695C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1956C90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1956F50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C19576BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

__CFString *SKUIMediaQueryNetworkTypeString(uint64_t a1)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIMediaQueryNetworkTypeString_cold_1();
  }
  uint64_t v2 = @"none";
  uint64_t v3 = @"wifi";
  if (a1 != 1000) {
    uint64_t v3 = 0;
  }
  if (a1) {
    uint64_t v2 = v3;
  }
  if ((unint64_t)(a1 - 1) >= 8) {
    return v2;
  }
  else {
    return @"cellular";
  }
}

void sub_1C195CAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C195CC44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C195F5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1960170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C1963070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19631F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1C19633C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIAppearanceStyleBarButtonItem(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIAppearanceStyleBarButtonItem_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  SUBarButtonItemApplyStyling();
}

void SKUIAppearanceStyleNavigationBar(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIAppearanceStyleNavigationBar_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  SUNavigationBarApplyStyling();
}

id SKUITintedImage(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        SKUITintedImage_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [v7 size];
  double v17 = v16;
  double v19 = v18;
  [v7 scale];
  CGFloat v21 = v20;
  v25.width = v17;
  v25.height = v19;
  UIGraphicsBeginImageContextWithOptions(v25, 0, v21);
  [v5 set];

  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = v17;
  v26.size.height = v19;
  UIRectFill(v26);
  objc_msgSend(v7, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v17, v19, 1.0);

  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v17, v19);
  v22 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v22;
}

id SKUIBundle()
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v0) {
        SKUIBundle_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
      }
    }
  }
  BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ios.StoreKitUI"];

  return v8;
}

BOOL SKUIAllowsLandscapePhone()
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v0) {
        SKUIAllowsLandscapePhone_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
      }
    }
  }
  int v8 = SKUIAllowsLandscapePhone_sValue;
  if (SKUIAllowsLandscapePhone_sValue == 255)
  {
    uint64_t v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 _referenceBounds];
    SKUIAllowsLandscapePhone_sValue = v10 == 736.0;

    int v8 = SKUIAllowsLandscapePhone_sValue;
  }
  return v8 != 0;
}

BOOL SKUIImageExistsWithResourceName(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIImageExistsWithResourceName_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if (!SKUIImageExistsWithResourceName_sBundle)
  {
    uint64_t v10 = SKUIBundle();
    uint64_t v11 = (void *)SKUIImageExistsWithResourceName_sBundle;
    SKUIImageExistsWithResourceName_sBundle = v10;
  }
  unint64_t v12 = 0;
  uint64_t v13 = (void **)__StoreKitUIResources;
  do
  {
    uint64_t v14 = *v13;
    v13 += 3;
    char v15 = [v14 isEqualToString:v1];
    if (v12 > 0x94) {
      break;
    }
    ++v12;
  }
  while ((v15 & 1) == 0);
  if (v15) {
    goto LABEL_16;
  }
  unint64_t v16 = 0;
  double v17 = (void **)__UIKitResources;
  do
  {
    double v18 = *v17;
    v17 += 3;
    int v19 = [v18 isEqualToString:v1];
    if (v16 > 2) {
      break;
    }
    ++v16;
  }
  while (!v19);
  if ((v19 & 1) != 0
    || ([(id)__ExternalResources objectForKey:v1],
        double v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
LABEL_16:
    BOOL v21 = 1;
  }
  else
  {
    v23 = [(id)__ExternalResourceManager imageForResourceName:v1];
    BOOL v21 = v23 != 0;
  }
  return v21;
}

id SKUIImageWithResourceName(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        SKUIImageWithResourceName_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
        if (v1) {
          goto LABEL_5;
        }
LABEL_40:
        id v30 = 0;
        goto LABEL_41;
      }
    }
  }
  if (!v1) {
    goto LABEL_40;
  }
LABEL_5:
  uint64_t v10 = [0 objectForKey:v1];
  if (!v10)
  {
    if (!SKUIImageWithResourceName_sBundle)
    {
      uint64_t v11 = SKUIBundle();
      unint64_t v12 = (void *)SKUIImageWithResourceName_sBundle;
      SKUIImageWithResourceName_sBundle = v11;
    }
    for (uint64_t i = 0; i != 450; i += 3)
    {
      if ([(__CFString *)__StoreKitUIResources[i] isEqualToString:v1])
      {
        unint64_t v16 = &__StoreKitUIResources[i];
        BOOL v17 = LOBYTE(__StoreKitUIResources[i + 2]) == 0;
        int v15 = LOBYTE(__StoreKitUIResources[i + 2]) != 0;
        int v14 = v17;
        uint64_t v10 = [MEMORY[0x1E4FB1818] imageNamed:v16[1] inBundle:SKUIImageWithResourceName_sBundle];
        if (!v10) {
          goto LABEL_16;
        }
        goto LABEL_24;
      }
    }
    int v14 = 0;
    int v15 = 1;
LABEL_16:
    uint64_t v18 = 0;
    while (([(__CFString *)__UIKitResources[v18] isEqualToString:v1] & 1) == 0)
    {
      v18 += 3;
      if (v18 == 12) {
        goto LABEL_22;
      }
    }
    uint64_t v10 = [MEMORY[0x1E4FB1818] kitImageNamed:__UIKitResources[v18 + 1]];
    if (v10) {
      goto LABEL_25;
    }
    int v14 = 0;
    int v15 = 1;
LABEL_22:
    int v19 = [(id)__ExternalResources objectForKey:v1];
    if (v19)
    {
      double v20 = v19;
      int v15 = [v19 alwaysTemplate];
      int v14 = v15 ^ 1;
      BOOL v21 = (void *)MEMORY[0x1E4FB1818];
      v22 = [v20 imageName];
      v23 = [v20 bundle];
      uint64_t v10 = [v21 imageNamed:v22 inBundle:v23];

      if (v10)
      {
LABEL_24:
        if (v15)
        {
LABEL_25:
          v24 = v10;
          uint64_t v25 = 2;
LABEL_30:
          uint64_t v27 = [v24 imageWithRenderingMode:v25];

          uint64_t v10 = (void *)v27;
          goto LABEL_31;
        }
LABEL_28:
        if (!v14) {
          goto LABEL_31;
        }
        v24 = v10;
        uint64_t v25 = 1;
        goto LABEL_30;
      }
    }
    uint64_t v26 = [MEMORY[0x1E4FB1818] imageNamed:v1 inBundle:SKUIImageWithResourceName_sBundle];
    if (v26
      || ([(id)__ExternalResourceManager imageForResourceName:v1],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v10 = (void *)v26;
      if (v15) {
        goto LABEL_25;
      }
      goto LABEL_28;
    }
LABEL_31:
    uint64_t v28 = 0;
    while (![(__CFString *)__SKImagesThatFlip[v28] isEqualToString:v1])
    {
      if (++v28 == 3) {
        goto LABEL_36;
      }
    }
    uint64_t v29 = [v10 imageFlippedForRightToLeftLayoutDirection];

    uint64_t v10 = (void *)v29;
  }
LABEL_36:
  id v30 = v10;

LABEL_41:

  return v30;
}

void SKUIResourceImageSetRegisterWithBundle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        SKUIResourceImageSetRegisterWithBundle_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  SKUIResourceImageSetRegisterWithBundleAlwaysTemplate(v3, v4, 0);
}

void SKUIResourceImageSetRegisterWithBundleAlwaysTemplate(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [v5 count];
  if (v6 && v15)
  {
    if (!__ExternalResources)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      BOOL v17 = (void *)__ExternalResources;
      __ExternalResources = (uint64_t)v16;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke;
    v18[3] = &unk_1E6423478;
    id v19 = v6;
    char v20 = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v18];
  }
}

void __SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = objc_alloc_init(SKUIExternalResourceImage);
  [(SKUIExternalResourceImage *)v7 setImageName:v5];

  [(SKUIExternalResourceImage *)v7 setBundle:*(void *)(a1 + 32)];
  [(SKUIExternalResourceImage *)v7 setAlwaysTemplate:*(unsigned __int8 *)(a1 + 40)];
  [(id)__ExternalResources setObject:v7 forKey:v6];
}

void SKUISetExternalResourceManager(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUISetExternalResourceManager_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = (void *)__ExternalResourceManager;
  __ExternalResourceManager = (uint64_t)v1;
}

id SKUILinkArrowImage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUILinkArrowImage_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [MEMORY[0x1E4FB1818] imageNamed:@"ChevronSeeAll" inBundle:v3];
  uint64_t v14 = SKUITintedImage(v13, 0, v4);

  return v14;
}

id SKUILinkArrowButton(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v14) {
        SKUILinkArrowButton_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  v22 = [MEMORY[0x1E4FB1818] imageNamed:@"ChevronSeeAll" inBundle:v9];
  v23 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [v23 setTitle:v13 forState:0];

  v24 = [v23 titleLabel];
  [v24 setFont:v10];

  [v23 setTitleColor:v12 forState:0];
  [v23 setTitleColor:v11 forState:1];
  uint64_t v25 = [v22 _flatImageWithColor:v12];

  [v23 setImage:v25 forState:0];
  uint64_t v26 = [v22 _flatImageWithColor:v11];

  [v23 setImage:v26 forState:1];
  [v22 size];
  objc_msgSend(v23, "setTitleEdgeInsets:", 0.0, -(v27 + 5.0), 0.0, 0.0);
  objc_msgSend(v23, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v29 = v28;
  double v31 = v30;
  objc_msgSend(v23, "titleRectForContentRect:", 0.0, 0.0, v28, v30);
  objc_msgSend(v23, "setImageEdgeInsets:", 1.0, v32 + 5.0, 0.0, 0.0);
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v29 + 5.0, v31);

  return v23;
}

id SKUIMoreDisclosureImage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIMoreDisclosureImage_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [MEMORY[0x1E4FB1818] imageNamed:@"MoreDisclosureTriangleMask" inBundle:v3];
  BOOL v14 = SKUITintedImage(v13, 0, v4);

  return v14;
}

id SKUISearchNoResultsImage(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUISearchNoResultsImage_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [MEMORY[0x1E4FB1818] imageNamed:@"ProxyGraphicSearch" inBundle:v1];

  return v10;
}

void SKUIRangesForFormatString(void *a1, void *a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v12) {
        SKUIRangesForFormatString_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  unint64_t v20 = [v11 rangeOfString:@"%1$@"];
  uint64_t v22 = v21;
  unint64_t v23 = [v11 rangeOfString:@"%2$@"];
  uint64_t v25 = v24;

  id v26 = v9;
  id v27 = v10;
  double v28 = v27;
  BOOL v29 = v20 > v23;
  if (v20 > v23) {
    unint64_t v30 = v23;
  }
  else {
    unint64_t v30 = v20;
  }
  if (v20 > v23) {
    unint64_t v23 = v20;
  }
  else {
    uint64_t v25 = v22;
  }
  if (v29) {
    id v31 = v27;
  }
  else {
    id v31 = v26;
  }
  if (v29) {
    double v32 = v26;
  }
  else {
    double v32 = v27;
  }
  uint64_t v33 = [v31 length];
  unint64_t v34 = v23 - v25 + v33;
  uint64_t v35 = [v32 length];
  if (v31 == v26) {
    unint64_t v36 = v30;
  }
  else {
    unint64_t v36 = v34;
  }
  if (v31 == v26) {
    uint64_t v37 = v33;
  }
  else {
    uint64_t v37 = v35;
  }
  if (v31 == v26) {
    unint64_t v38 = v34;
  }
  else {
    unint64_t v38 = v30;
  }
  *a4 = v36;
  a4[1] = v37;
  if (v31 == v26) {
    uint64_t v39 = v35;
  }
  else {
    uint64_t v39 = v33;
  }
  *a5 = v38;
  a5[1] = v39;
}

void sub_1C1966C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1967B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C1967EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void _telephonyNotification(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)SKUICoreTelephonyFramework();
  uint64_t v7 = *(const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v6);
  uint64_t v8 = *(const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v6);
  id v9 = *(const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v6);
  id v10 = *(const void **)SKUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v6);
  if (CFEqual(a2, v7))
  {
    id v11 = @"onOperatorChange";
LABEL_6:
    id v12 = a4;
    uint64_t v13 = [v12 appContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___telephonyNotification_block_invoke;
    v15[3] = &unk_1E6423548;
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

void sub_1C19690CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C196A3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
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

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void SKUIStoreAssetResourceLoaderConfigureWithDelegate(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIStoreAssetResourceLoaderConfigureWithDelegate_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [v4 setDelegate:v3 queue:MEMORY[0x1E4F14428]];
  objc_setAssociatedObject(v4, (const void *)_SKUIStoreAssetResourceLoaderDelegateAssociatedObjectKeyStrongDelegate, v3, (void *)1);
}

void sub_1C196D6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1C196DBE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C196E364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C196EA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C196EB44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SKUICacheCodingDecodeArray(void *a1, objc_class *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUICacheCodingDecodeArray_cold_1();
  }
  id v4 = [MEMORY[0x1E4F1CA48] array];
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
        uint64_t v12 = objc_msgSend(v11, "initWithCacheRepresentation:", v10, (void)v14);
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

id SKUICacheCodingEncodeArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUICacheCodingEncodeArray_cold_1();
  }
  BOOL v2 = [MEMORY[0x1E4F1CA48] array];
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

uint64_t __SoftwareLibraryChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _reloadSoftwareLibrary];
}

void sub_1C197830C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

SKUILibraryItem *SKUILibraryItemForStoreIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(SKUILibraryItem);
  [(SKUILibraryItem *)v2 setStoreIdentifier:v1];

  return v2;
}

BOOL SKUIItemStateCenterUseAppstoredPurchases(void *a1)
{
  id v1 = a1;
  if (SKUIItemStateCenterUseAppstorePurchasesSwitchEnabled()) {
    BOOL v2 = [v1 itemKind] == 12 || objc_msgSend(v1, "itemKind") == 17;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

void sub_1C197A568(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
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

{
}

void sub_1C1982754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1C1982C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __PurchaseHistoryChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _reloadPurchaseHistory];
}

void sub_1C1982FF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1983164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19832EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1983BC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C1983EFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C19842F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIItemStateCenterUseAppstorePurchasesSwitchEnabled()
{
  BOOL v0 = [MEMORY[0x1E4F28B50] mainBundle];
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

uint64_t SKUIItemKindForString(uint64_t a1)
{
  uint64_t v2 = 0;
  while (![(id)qword_1E6423DC8[v2 + 1] isEqualToString:a1])
  {
    v2 += 2;
    if (v2 == 50) {
      return 0;
    }
  }
  return qword_1E6423DC8[v2];
}

BOOL SKUIItemKindIsSoftwareKind(uint64_t a1)
{
  return a1 == 12 || a1 == 17;
}

uint64_t SKUIItemDeviceFamilyIsUniversal(unsigned __int8 a1)
{
  return a1 & ((a1 & 6) != 0);
}

BOOL SKUIItemDeviceFamilyIsTVOnly(char a1)
{
  return (a1 & 0xF) == 8;
}

BOOL SKUIItemKindIsToneKind(uint64_t a1)
{
  return a1 == 11 || a1 == 16;
}

id SKUIItemScreenshotsForDictionary(void *a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [v1 objectForKey:*MEMORY[0x1E4FA87E0]];
  objc_opt_class();
  v40 = (void *)v3;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_48;
  }
  id v39 = v1;
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  uint64_t v6 = (uint64_t)v5;

  uint64_t v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    uint64_t v9 = [v40 objectForKey:*MEMORY[0x1E4FA87C8]];
    if (!v9)
    {
      long long v10 = [v40 objectForKey:*MEMORY[0x1E4FA87D8]];
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
        long long v10 = [v40 objectForKey:*MEMORY[0x1E4FA87D0]];
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
  long long v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 bounds];
  double v13 = v12;

  if (v13 <= 480.0
    || ([v40 objectForKey:*MEMORY[0x1E4FA87D8]], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v10 = [v40 objectForKey:*MEMORY[0x1E4FA87D0]];
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
  unint64_t v38 = v10;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v17) {
    goto LABEL_46;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v55;
  id v42 = v16;
  v43 = v2;
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
      uint64_t v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = v20;
        id v22 = v21;
        unint64_t v23 = objc_alloc_init(SKUIScreenshot);
        uint64_t v24 = [[SKUIArtwork alloc] initWithArtworkDictionary:v22];

        [(SKUIScreenshot *)v23 setArtwork:v24 forVariant:@"high-dpi"];
        [(SKUIScreenshot *)v23 setArtwork:v24 forVariant:@"low-dpi"];
        uint64_t v25 = v23;
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = v20;
        id v26 = v21;
        unint64_t v23 = objc_alloc_init(SKUIScreenshot);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v25 = (SKUIScreenshot *)v26;
        uint64_t v27 = [(SKUIScreenshot *)v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
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
              unint64_t v34 = [[SKUIArtwork alloc] initWithArtworkDictionary:v33];
              uint64_t v35 = [(SKUIArtwork *)v34 width];
              if (v35 >= [(SKUIArtwork *)v34 height])
              {
                if (SKUIArtworkSizeDeltaIsBetter(v35 + v48, v30))
                {
                  [(SKUIScreenshot *)v23 setArtwork:v34 forVariant:@"high-dpi"];
                  uint64_t v30 = v35 + v48;
                }
                uint64_t v36 = v35 + v46;
                if (!SKUIArtworkSizeDeltaIsBetter(v36, v31)) {
                  goto LABEL_38;
                }
              }
              else
              {
                if (SKUIArtworkSizeDeltaIsBetter(v35 + v49, v30))
                {
                  [(SKUIScreenshot *)v23 setArtwork:v34 forVariant:@"high-dpi"];
                  uint64_t v30 = v35 + v49;
                }
                uint64_t v36 = v35 + v47;
                if ((SKUIArtworkSizeDeltaIsBetter(v36, v31) & 1) == 0) {
                  goto LABEL_38;
                }
              }
              [(SKUIScreenshot *)v23 setArtwork:v34, @"low-dpi", v38 forVariant];
              uint64_t v31 = v36;
LABEL_38:

              continue;
            }
          }
          uint64_t v28 = [(SKUIScreenshot *)v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (!v28)
          {
LABEL_41:

            uint64_t v24 = (SKUIArtwork *)v23;
            id v16 = v42;
            uint64_t v2 = v43;
            uint64_t v19 = v41;
            uint64_t v18 = v44;
            if ([(SKUIScreenshot *)v23 numberOfVariants] >= 1)
            {
LABEL_42:
              objc_msgSend(v2, "addObject:", v23, v38);
              unint64_t v23 = (SKUIScreenshot *)v24;
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

void sub_1C198D634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C198DA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIColorWithHTMLCode(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIColorWithHTMLCode_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [v1 length];
  uint64_t v11 = v10;
  if (v10 == 8 || v10 == 6)
  {
    double v12 = objc_msgSend(v1, "substringWithRange:", 0, 2);
    uint64_t v13 = SKUIHexValueWithString(v12);

    uint64_t v14 = objc_msgSend(v1, "substringWithRange:", 2, 2);
    uint64_t v15 = SKUIHexValueWithString(v14);

    id v16 = objc_msgSend(v1, "substringWithRange:", 4, 2);
    uint64_t v17 = SKUIHexValueWithString(v16);

    if (v11 == 8)
    {
      uint64_t v18 = objc_msgSend(v1, "substringWithRange:", 6, 2);
      uint64_t v19 = SKUIHexValueWithString(v18);
    }
    else
    {
      uint64_t v19 = 255;
    }
    uint64_t v20 = 0;
    if ((unint64_t)v13 <= 0xFF
      && (unint64_t)v17 <= 0xFF
      && (unint64_t)v15 <= 0xFF
      && (unint64_t)v19 <= 0xFF)
    {
      uint64_t v20 = [MEMORY[0x1E4FB1618] colorWithRed:(double)v13 / 255.0 green:(double)v15 / 255.0 blue:(double)v17 / 255.0 alpha:(double)v19 / 255.0];
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

BOOL SKUIColorSchemeStyleForColor(void *a1)
{
  id v1 = a1;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    if (v1) {
      goto LABEL_5;
    }
LABEL_13:
    BOOL v2 = 0;
    goto LABEL_14;
  }
  SKUIColorSchemeStyleForColor_cold_1();
  if (!v1) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v8 = 0;
  double v9 = 0.0;
  uint64_t v7 = 0;
  if ([v1 getHue:&v8 saturation:&v7 brightness:&v9 alpha:0])
  {
    BOOL v2 = v9 < 0.5;
  }
  else
  {
    double v6 = 0.0;
    int v3 = [v1 getWhite:&v6 alpha:0];
    uint64_t v4 = 2;
    if (v6 < 0.5) {
      uint64_t v4 = 3;
    }
    if (v3) {
      BOOL v2 = v4;
    }
    else {
      BOOL v2 = 0;
    }
  }
LABEL_14:

  return v2;
}

id SKUIBorderColorWithBackgroundColor(void *a1)
{
  id v1 = a1;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)))
  {
    if (v1) {
      goto LABEL_5;
    }
LABEL_6:
    uint64_t v10 = (void *)MEMORY[0x1E4FB1618];
    double v11 = 0.2;
    double v12 = 0.0;
    goto LABEL_8;
  }
  SKUIBorderColorWithBackgroundColor_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  if (!v1) {
    goto LABEL_6;
  }
LABEL_5:
  switch(SKUIColorSchemeStyleForColor(v1))
  {
    case 1:
    case 3:
      uint64_t v10 = (void *)MEMORY[0x1E4FB1618];
      double v11 = 0.15;
      double v12 = 1.0;
      break;
    default:
      goto LABEL_6;
  }
LABEL_8:
  uint64_t v13 = [v10 colorWithWhite:v12 alpha:v11];

  return v13;
}

id SKUIColorForStyleWithBrightness(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  id v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v12) {
        SKUIColorForStyleWithBrightness_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
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
      break;
    default:
      a6 = 0.0;
      break;
  }
  uint64_t v20 = SKUIColorByAdjustingBrightness(v11, a6);

  return v20;
}

id SKUIColorByAdjustingBrightness(void *a1, float a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIColorByAdjustingBrightness_cold_1();
  }
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (![v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8]
    || ([MEMORY[0x1E4FB1618] colorWithHue:v11 saturation:v10 brightness:v9 + a2 alpha:v8],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v6 = 0.0;
    double v7 = 0.0;
    if (([v3 getWhite:&v7 alpha:&v6] & 1) == 0
      || ([MEMORY[0x1E4FB1618] colorWithWhite:v7 + a2 alpha:v6],
          (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v4 = v3;
    }
  }

  return v4;
}

id SKUIColorForStyleWithAlpha(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  id v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v12) {
        SKUIColorForStyleWithAlpha_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
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
      break;
    default:
      a6 = 0.0;
      break;
  }
  uint64_t v20 = SKUIColorWithAlpha(v11, a6);

  return v20;
}

id SKUIColorWithAlpha(void *a1, float a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        SKUIColorWithAlpha_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v16 = 0.0;
  double v17 = 0.0;
  double v15 = 0.0;
  if (![v3 getHue:&v17 saturation:&v16 brightness:&v15 alpha:0]
    || ([MEMORY[0x1E4FB1618] colorWithHue:v17 saturation:v16 brightness:v15 alpha:a2],
        (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v14 = 0.0;
    if (([v3 getWhite:&v14 alpha:0] & 1) == 0
      || ([MEMORY[0x1E4FB1618] colorWithWhite:v14 alpha:a2],
          (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v12 = v3;
    }
  }

  return v12;
}

uint64_t SKUIHexValueWithString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIHexValueWithString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  unsigned int v13 = 0;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v1];

  int v11 = [v10 scanHexInt:&v13];
  if (v11) {
    return v13;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

id SKUITableViewGroupedBackgroundColor()
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        SKUITableViewGroupedBackgroundColor_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
      }
    }
  }
  uint64_t v8 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];

  return v8;
}

void SKUIGetImagesFromView(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a1;
  [v7 bounds];
  v27.width = v8;
  v27.height = v9;
  UIGraphicsBeginImageContextWithOptions(v27, 1, 0.0);
  uint64_t v10 = [v7 layer];

  [v10 renderInContext:UIGraphicsGetCurrentContext()];
  int v11 = UIGraphicsGetImageFromCurrentImageContext();
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
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v14, "imageOrientation"), v13);
  CGImageRelease(v17);
  if (a2) {
    *a2 = v18;
  }
  id v25 = v14;
  uint64_t v19 = (CGImage *)[v25 CGImage];
  [v25 size];
  CGFloat v21 = v13 * v20;
  [v25 size];
  v29.size.height = v13 * (v22 - a4);
  v29.origin.x = 0.0;
  v29.origin.y = v13 * a4;
  v29.size.width = v21;
  unint64_t v23 = CGImageCreateWithImageInRect(v19, v29);
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", v23, objc_msgSend(v25, "imageOrientation"), v13);
  CGImageRelease(v23);
  if (a3) {
    *a3 = v24;
  }
}

id SKUINavigationItemsShallowCopy(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  if ([v1 count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [v1 objectAtIndex:v3];
      id v5 = objc_alloc_init(MEMORY[0x1E4FB19F0]);
      uint64_t v6 = [v4 title];
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

id SKUIStackedBarSpringAnimationForExpandCollapse(void *a1, double a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 layer];
  [v6 position];
  double v8 = v7;
  double v10 = v9;

  [v5 frame];
  double v12 = v8 + a2 - v11;
  [v5 frame];
  double v14 = v10 + a3 - v13;
  double v15 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v15 setDamping:26.0];
  [v15 setDuration:1.0];
  [v15 setFillMode:*MEMORY[0x1E4F39F98]];
  [v15 setMass:1.0];
  [v15 setStiffness:250.0];
  double v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v15 setTimingFunction:v16];

  [v15 setVelocity:0.0];
  double v17 = (void *)MEMORY[0x1E4F29238];
  uint64_t v18 = [v5 layer];
  [v18 position];
  uint64_t v19 = objc_msgSend(v17, "valueWithCGPoint:");
  [v15 setFromValue:v19];

  double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v12, v14);
  [v15 setToValue:v20];

  CGFloat v21 = [v5 layer];
  [v21 addAnimation:v15 forKey:@"ExpandCollapse"];

  double v22 = [v5 layer];

  objc_msgSend(v22, "setPosition:", v12, v14);

  return v15;
}

uint64_t SKUIArtworkSizeDeltaIsBetter(uint64_t a1, uint64_t a2)
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

void sub_1C1997D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19984A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
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

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

{
}

void sub_1C199932C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19996A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1999E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIIconColorsForColorScheme(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIIconColorsForColorScheme_cold_1();
  }
  double v8 = [v7 backgroundColor];
  if (v8)
  {
    double v9 = SKUIColorForStyleWithBrightness(v8, [v7 schemeStyle], -0.05, 0.25, -0.05, 0.25);
    double v10 = SKUIColorForStyleWithBrightness(v8, [v7 schemeStyle], -0.2, 0.0, -0.2, 0.05);
    double v11 = SKUIColorForStyleWithBrightness(v8, [v7 schemeStyle], -0.7, -0.2, -0.7, 0.0);
    double v12 = SKUIColorForStyleWithAlpha(v11, [v7 schemeStyle], 0.3, 1.0, 0.3, 0.3);

    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.95 alpha:1.0];
  double v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
  double v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.3 alpha:0.3];
  if (a2) {
LABEL_7:
  }
    *a2 = v9;
LABEL_8:
  if (a3) {
    *a3 = v10;
  }
  if (a4) {
    *a4 = v12;
  }
}

void SKUIIconFrameForIconSize(double *a1, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIIconFrameForIconSize_cold_1();
  }
  if (a5 != *MEMORY[0x1E4F1DB30] || a6 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v15 = a5 / a3;
    if (a5 / a3 >= a6 / a4) {
      double v15 = a6 / a4;
    }
    a3 = ceil(a3 * v15);
    a4 = ceil(a4 * v15);
  }
  double v16 = 0.0;
  if (a7 > 0.0) {
    double v16 = 1.0;
  }
  if (a1)
  {
    *a1 = a3 + a7 * 2.0;
    a1[1] = a4 + a7 * 2.0;
  }
  if (a2)
  {
    *a2 = a7;
    a2[1] = v16;
    a2[2] = a3;
    a2[3] = a4;
  }
}

void sub_1C199DFB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
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

{
}

void sub_1C199E7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C199EF64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getCNComposeRecipientViewDidChangeNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  BOOL v0 = (void **)getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  uint64_t v8 = getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  if (!getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke;
    v4[3] = &unk_1E6424310;
    v4[4] = &v5;
    __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke((uint64_t)v4);
    BOOL v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    BOOL v3 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  uint64_t v1 = *v0;

  return v1;
}

void sub_1C19A1D48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C19A3FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __ContactsAutocompleteUILibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6424330;
    uint64_t v7 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary = _sl_dlopen();
    BOOL v3 = (void *)v5[0];
    uint64_t v2 = (void *)ContactsAutocompleteUILibraryCore_frameworkLibrary;
    if (ContactsAutocompleteUILibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      BOOL v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)ContactsAutocompleteUILibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "CNComposeRecipientViewDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __ContactsAutocompleteUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsAutocompleteUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1C19A4AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1C19A5A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

{
}

uint64_t SKUIImageTreatmentForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIImageTreatmentForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ([v1 isEqualToString:@"app"])
  {
    uint64_t v10 = 1;
  }
  else if ([v1 isEqualToString:@"artist-circle"])
  {
    uint64_t v10 = 10;
  }
  else if ([v1 isEqualToString:@"brick"])
  {
    uint64_t v10 = 2;
  }
  else if ([v1 isEqualToString:@"evergreen"])
  {
    uint64_t v10 = 3;
  }
  else if ([v1 isEqualToString:@"left-to-right-linear-gradient"])
  {
    uint64_t v10 = 4;
  }
  else if ([v1 isEqualToString:@"parallax"])
  {
    uint64_t v10 = 13;
  }
  else if ([v1 isEqualToString:@"product"])
  {
    uint64_t v10 = 5;
  }
  else if ([v1 isEqualToString:@"radio"])
  {
    uint64_t v10 = 7;
  }
  else if ([v1 isEqualToString:@"radial-gradient"])
  {
    uint64_t v10 = 12;
  }
  else if ([v1 isEqualToString:@"tint"])
  {
    uint64_t v10 = 6;
  }
  else if ([v1 isEqualToString:@"uber"])
  {
    uint64_t v10 = 8;
  }
  else if ([v1 isEqualToString:@"uber-banner"])
  {
    uint64_t v10 = 9;
  }
  else if ([v1 isEqualToString:@"watch-app"])
  {
    uint64_t v10 = 11;
  }
  else if ([v1 isEqualToString:@"watch-product"])
  {
    uint64_t v10 = 14;
  }
  else if ([v1 isEqualToString:@"voyager-app"])
  {
    uint64_t v10 = 15;
  }
  else if ([v1 isEqualToString:@"tv-app"])
  {
    uint64_t v10 = 16;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1C19A8560(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SKUIErrorDocumentTitle(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIErrorDocumentTitle_cold_1();
  }
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.AppStore"])
  {
    uint64_t v4 = @"CANNOT_CONNECT_TO_APP_STORE";
    if (!v1) {
      goto LABEL_15;
    }
LABEL_10:
    uint64_t v5 = [v1 localizedStringForKey:v4];
    goto LABEL_16;
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
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  uint64_t v4 = @"CANNOT_CONNECT_TO_IBOOKS_STORE";
  if (v1) {
    goto LABEL_10;
  }
LABEL_15:
  uint64_t v5 = +[SKUIClientContext localizedStringForKey:v4 inBundles:0];
LABEL_16:
  uint64_t v6 = (void *)v5;

  return v6;
}

void sub_1C19AAAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19AB1E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C19AC748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id SKUIPageComponentClassForComponentType(uint64_t a1)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIPageComponentClassForComponentType_cold_1();
  }
  if ((unint64_t)(a1 - 1) > 0x1A) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = objc_opt_class();
  }

  return v2;
}

uint64_t SKUIPageComponentTypeForBlockType(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIPageComponentTypeForBlockType_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ([v1 isEqualToString:@"accountButtons"])
  {
    uint64_t v10 = 1;
  }
  else if ([v1 isEqualToString:@"counter"])
  {
    uint64_t v10 = 2;
  }
  else if ([v1 isEqualToString:@"divider"])
  {
    uint64_t v10 = 4;
  }
  else if ([v1 isEqualToString:@"editorial"])
  {
    uint64_t v10 = 5;
  }
  else if ([v1 isEqualToString:@"expand"])
  {
    uint64_t v10 = 19;
  }
  else if ([v1 isEqualToString:@"flowcase"])
  {
    uint64_t v10 = 6;
  }
  else if ([v1 isEqualToString:@"gallery"])
  {
    uint64_t v10 = 7;
  }
  else if ([v1 isEqualToString:@"grid"])
  {
    uint64_t v10 = 8;
  }
  else if ([v1 isEqualToString:@"lockup"])
  {
    uint64_t v10 = 9;
  }
  else if ([v1 isEqualToString:@"media"])
  {
    uint64_t v10 = 10;
  }
  else if ([v1 isEqualToString:@"popup"])
  {
    uint64_t v10 = 11;
  }
  else if ([v1 isEqualToString:@"quicklinks"])
  {
    uint64_t v10 = 12;
  }
  else if ([v1 isEqualToString:@"row"])
  {
    uint64_t v10 = 3;
  }
  else if ([v1 isEqualToString:@"showcase"])
  {
    uint64_t v10 = 13;
  }
  else if ([v1 isEqualToString:@"spacer"])
  {
    uint64_t v10 = 14;
  }
  else if ([v1 isEqualToString:@"swoosh"])
  {
    uint64_t v10 = 15;
  }
  else if ([v1 isEqualToString:@"tabs"])
  {
    uint64_t v10 = 11;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t SKUIPageComponentTypeForFeaturedContentKind(uint64_t a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIPageComponentTypeForFeaturedContentKind_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
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
      goto LABEL_8;
    case 260:
    case 261:
    case 268:
      return result;
    case 266:
      uint64_t result = 12;
      break;
    default:
      if ((unint64_t)(a1 - 304) >= 2) {
LABEL_8:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t SKUIPageComponentFontWeightForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIPageComponentFontWeightForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ([v1 isEqualToString:@"light"])
  {
    uint64_t v10 = 1;
  }
  else if ([v1 isEqualToString:@"medium"])
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id SKUIStorePageItemsWithStorePlatformDictionary(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        SKUIStorePageItemsWithStorePlatformDictionary_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v6 || ([v5 objectForKey:v6], (double v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v16 = [v5 objectForKey:@"lockup"];
    if (!v16)
    {
      double v17 = [v5 allKeys];
      if ([v17 count] == 1)
      {
        uint64_t v18 = [v17 objectAtIndex:0];
        double v16 = [v5 objectForKey:v18];
      }
      else
      {
        double v16 = 0;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [v16 objectForKey:*MEMORY[0x1E4FA87C0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __SKUIStorePageItemsWithStorePlatformDictionary_block_invoke;
      v21[3] = &unk_1E6424628;
      uint64_t v23 = a3;
      id v22 = v15;
      [v19 enumerateKeysAndObjectsUsingBlock:v21];
    }
  }

  return v15;
}

void __SKUIStorePageItemsWithStorePlatformDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1C8749310]();
  BOOL v7 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithLookupDictionary:v5];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

uint64_t SKUIStorePageTypeIsProductPage(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIStorePageTypeIsProductPage_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ([v1 isEqualToString:@"software"]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v1 isEqualToString:@"mobileSoftwareBundle"];
  }

  return v10;
}

void sub_1C19B27F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
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

void sub_1C19B2B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1C19B4E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19B514C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19B6024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19B97AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19BA634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

id SKUIBadgeImageFromText(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIBadgeImageFromText_cold_1();
  }
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__12;
  uint64_t v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  if (SKUIBadgeImageFromText_sOnce != -1) {
    dispatch_once(&SKUIBadgeImageFromText_sOnce, &__block_literal_global_6);
  }
  if ([v5 length])
  {
    uint64_t v7 = SKUIBadgeImageFromText_sBadgeImageQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __SKUIBadgeImageFromText_block_invoke_2;
    v10[3] = &unk_1E6424948;
    id v11 = v5;
    id v12 = v6;
    uint64_t v13 = &v15;
    char v14 = a3;
    dispatch_sync(v7, v10);
  }
  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void sub_1C19BBC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __SKUIBadgeImageFromText_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreKitUI.SKUIBadgeImage", 0);
  id v1 = (void *)SKUIBadgeImageFromText_sBadgeImageQueue;
  SKUIBadgeImageFromText_sBadgeImageQueue = (uint64_t)v0;

  BOOL v2 = SKUIBadgeImageFromText_sBadgeImageQueue;
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  dispatch_set_target_queue(v2, v3);

  id v4 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  id v5 = (void *)SKUIBadgeImageFromText_sBadgeImageCache;
  SKUIBadgeImageFromText_sBadgeImageCache = (uint64_t)v4;

  id v6 = (void *)SKUIBadgeImageFromText_sBadgeImageCache;

  return [v6 setCountLimit:10];
}

void __SKUIBadgeImageFromText_block_invoke_2(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) description];
  id v5 = (void *)[v2 initWithFormat:@"%@:%@", v3, v4];

  uint64_t v6 = [(id)SKUIBadgeImageFromText_sBadgeImageCache objectForKey:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
    uint64_t v10 = *MEMORY[0x1E4FB0700];
    v24[0] = *MEMORY[0x1E4FB06F8];
    v24[1] = v10;
    uint64_t v11 = *(void *)(a1 + 40);
    v25[0] = v9;
    v25[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [*(id *)(a1 + 32) sizeWithAttributes:v12];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    CGFloat v19 = v18;
    v26.width = v14 + 6.0;
    v26.height = v16;
    UIGraphicsBeginImageContextWithOptions(v26, 0, v19);

    [*(id *)(a1 + 40) set];
    id v20 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v14 + 6.0, v16, 1.0);
    [v20 stroke];
    objc_msgSend(*(id *)(a1 + 32), "drawInRect:withAttributes:", v12, 3.5, -0.5, v14, v16);
    uint64_t v21 = UIGraphicsGetImageFromCurrentImageContext();
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    UIGraphicsEndImageContext();
    if (*(unsigned char *)(a1 + 56)) {
      [(id)SKUIBadgeImageFromText_sBadgeImageCache setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v5];
    }
  }
}

void sub_1C19BC770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C19BC8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19BCCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C19BD42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1C19BF20C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 120), 8);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C19BF390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C19BFB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19BFD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19C312C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1C19C3338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C19C35A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C19C37F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C19C6118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19C64F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIGiftAmountButtonsWithAmounts(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
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
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_alloc_init(SKUIGiftAmountButton);
        uint64_t v10 = objc_msgSend(v8, "displayLabel", (void)v12);
        [(SKUIGiftAmountButton *)v9 setTitle:v10 forState:0];

        [(SKUIGiftAmountButton *)v9 sizeToFit];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_1C19C7AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1C19C8A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1C19CBE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19CC224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19CF384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19D2424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_1C19D58A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
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

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1C19D5A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19D9238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19D9A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19D9D40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C19DBE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19DE2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19DEBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1C19E12F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

{
}

void sub_1C19E1810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t SKUITrackListColumnIdentifierForViewElement(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUITrackListColumnIdentifierForViewElement_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [v1 elementType];
  uint64_t v11 = 2;
  if (v10 > 79)
  {
    if (v10 > 137)
    {
      if (v10 != 138)
      {
        if (v10 != 141) {
          goto LABEL_26;
        }
        goto LABEL_21;
      }
      if (([v1 labelViewStyle] & 0xFFFFFFFFFFFFFFFELL) == 4) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    else if (v10 == 80)
    {
      uint64_t v11 = 5;
    }
    else if (v10 == 90)
    {
      uint64_t v12 = [v1 flattenedChildren];
      uint64_t v13 = [v12 firstObject];
      uint64_t v11 = SKUITrackListColumnIdentifierForViewElement();
    }
  }
  else
  {
    if (v10 > 11)
    {
      if ((unint64_t)(v10 - 12) >= 2 && v10 != 50) {
        goto LABEL_26;
      }
LABEL_21:
      uint64_t v11 = 1;
      goto LABEL_26;
    }
    uint64_t v14 = 3;
    if (v10 != 9) {
      uint64_t v14 = 2;
    }
    if (v10 == 8) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v14;
    }
  }
LABEL_26:

  return v11;
}

void sub_1C19E2188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19E2420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19E2B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C19E4564(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C19E5600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C19E583C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C19E661C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19E7D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1C19E8D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C19E9100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19EADCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19EC534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C19EC964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIViewElementDateWithString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIViewElementDateWithString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if (!SKUIViewElementDateWithString_sInputFormatter1)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v11 = (void *)SKUIViewElementDateWithString_sInputFormatter1;
    SKUIViewElementDateWithString_sInputFormatter1 = (uint64_t)v10;

    [(id)SKUIViewElementDateWithString_sInputFormatter1 setDateFormat:@"yyyy-MM-dd"];
    [(id)SKUIViewElementDateWithString_sInputFormatter1 setLenient:1];
    uint64_t v12 = (void *)SKUIViewElementDateWithString_sInputFormatter1;
    uint64_t v13 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v12 setLocale:v13];
  }
  if (!SKUIViewElementDateWithString_sInputFormatter2)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v15 = (void *)SKUIViewElementDateWithString_sInputFormatter2;
    SKUIViewElementDateWithString_sInputFormatter2 = (uint64_t)v14;

    [(id)SKUIViewElementDateWithString_sInputFormatter2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [(id)SKUIViewElementDateWithString_sInputFormatter2 setLenient:1];
    uint64_t v16 = (void *)SKUIViewElementDateWithString_sInputFormatter2;
    uint64_t v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v16 setLocale:v17];
  }
  if (!SKUIViewElementDateWithString_sInputFormatter3)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v19 = (void *)SKUIViewElementDateWithString_sInputFormatter3;
    SKUIViewElementDateWithString_sInputFormatter3 = (uint64_t)v18;

    [(id)SKUIViewElementDateWithString_sInputFormatter3 setDateFormat:@"yyyy-MM-dd'T'hh:mm:ss'Z'"];
    [(id)SKUIViewElementDateWithString_sInputFormatter3 setLenient:1];
    id v20 = (void *)SKUIViewElementDateWithString_sInputFormatter3;
    uint64_t v21 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v20 setLocale:v21];
  }
  uint64_t v22 = [(id)SKUIViewElementDateWithString_sInputFormatter1 dateFromString:v1];
  if (!v22)
  {
    uint64_t v22 = [(id)SKUIViewElementDateWithString_sInputFormatter2 dateFromString:v1];
    if (!v22)
    {
      uint64_t v22 = [(id)SKUIViewElementDateWithString_sInputFormatter3 dateFromString:v1];
    }
  }

  return v22;
}

void SKUIViewElementTextDeadlockFix(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        SKUIViewElementTextDeadlockFix_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 appContext];
  if (v13)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __SKUIViewElementTextDeadlockFix_block_invoke;
    v20[3] = &unk_1E6424D48;
    id v14 = &v21;
    id v21 = v3;
    id v15 = v3;
    [v13 evaluate:v20 completionBlock:0];
  }
  else
  {
    uint64_t v16 = dispatch_get_global_queue(-32768, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __SKUIViewElementTextDeadlockFix_block_invoke_2;
    v18[3] = &unk_1E6422020;
    id v14 = &v19;
    id v19 = v3;
    id v17 = v3;
    dispatch_async(v16, v18);
  }
}

uint64_t SKUIGraphicsDeviceHasASTCSupport()
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        SKUIGraphicsDeviceHasASTCSupport_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
      }
    }
  }
  if (SKUIGraphicsDeviceHasASTCSupport_onceToken != -1) {
    dispatch_once(&SKUIGraphicsDeviceHasASTCSupport_onceToken, &__block_literal_global_11);
  }
  return SKUIGraphicsDeviceHasASTCSupport_supportsASTC;
}

uint64_t __SKUIGraphicsDeviceHasASTCSupport_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  SKUIGraphicsDeviceHasASTCSupport_supportsASTC = result;
  return result;
}

double SKUIGraphicsMatchViewBorderToStroke(void *a1, double a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIGraphicsMatchViewBorderToStroke_cold_1();
  }
  [v3 contentScaleFactor];
  double v5 = round(a2 * 0.5 * v4) / v4;

  return v5;
}

CFMutableDataRef SKUIGraphicsCreateASTCDataFromImage(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIGraphicsCreateASTCDataFromImage_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        SKUIGraphicsCreateASTCDataFromImage_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  if (SoftLinkImageIO_onceToken != -1) {
    dispatch_once(&SoftLinkImageIO_onceToken, &__block_literal_global_61);
  }
  CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t v19 = weak_CGImageDestinationCreateWithData(Mutable, @"org.khronos.ktx", 1, 0);
  if (v19)
  {
    id v20 = (const void *)v19;
    v24[0] = weak_kCGImagePropertyEncoder;
    v24[1] = weak_kCGImagePropertyASTCBlockSize;
    v25[0] = weak_kCGImagePropertyASTCEncoder;
    v25[1] = &unk_1F1D61C10;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    weak_CGImageDestinationAddImage(v20, a1, v21);
    char v22 = weak_CGImageDestinationFinalize(v20);
    CFRelease(v20);
    if ((v22 & 1) == 0)
    {
      NSLog(&cfstr_SCouldNotConve.isa, "CFDataRef  _Nullable SKUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
      CFRelease(Mutable);
      CFMutableDataRef Mutable = 0;
    }
  }
  else
  {
    NSLog(&cfstr_SCouldNotCreat.isa, "CFDataRef  _Nullable SKUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef SKUIGraphicsCreateASTCDataFromBitmapContext(CGContext *a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIGraphicsCreateASTCDataFromBitmapContext_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  CGImageRef Image = CGBitmapContextCreateImage(a1);
  if (Image)
  {
    uint64_t v11 = Image;
    ASTCDataFromCGImageRef Image = SKUIGraphicsCreateASTCDataFromImage((uint64_t)Image);
    CGImageRelease(v11);
  }
  else
  {
    NSLog(&cfstr_SCouldNotCreat_0.isa, "CFDataRef  _Nullable SKUIGraphicsCreateASTCDataFromBitmapContext(CGContextRef _Nonnull)");
    return 0;
  }
  return ASTCDataFromImage;
}

SKUICompressedImage *SKUIGraphicsGetASTCImageFromCurrentImageContext(double a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIGraphicsGetASTCImageFromCurrentImageContext_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext
    && (CFMutableDataRef ASTCDataFromBitmapContext = SKUIGraphicsCreateASTCDataFromBitmapContext(CurrentContext)) != 0)
  {
    CFMutableDataRef v12 = ASTCDataFromBitmapContext;
    if (fabs(a1) < 2.22044605e-16)
    {
      uint64_t v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v13 scale];
      a1 = v14;
    }
    uint64_t v15 = [[SKUICompressedImage alloc] initWithData:v12 scale:a1];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void *__SoftLinkImageIO_block_invoke()
{
  BOOL v0 = (void *)SKUIImageIOFramework();
  if (!v0) {
    __SoftLinkImageIO_block_invoke_cold_1();
  }
  uint64_t v1 = v0;
  weak_kCGImagePropertyEncoder = *(void *)SKUIWeakLinkedSymbolForString("kCGImagePropertyEncoder", v0);
  if (!weak_kCGImagePropertyEncoder) {
    __SoftLinkImageIO_block_invoke_cold_2();
  }
  weak_kCGImagePropertyASTCBlockSize = *(void *)SKUIWeakLinkedSymbolForString("kCGImagePropertyASTCBlockSize", v1);
  if (!weak_kCGImagePropertyASTCBlockSize) {
    __SoftLinkImageIO_block_invoke_cold_3();
  }
  weak_kCGImagePropertyASTCEncoder = *(void *)SKUIWeakLinkedSymbolForString("kCGImagePropertyASTCEncoder", v1);
  if (!weak_kCGImagePropertyASTCEncoder) {
    __SoftLinkImageIO_block_invoke_cold_4();
  }
  weak_CGImageDestinationCreateWithData = SKUIWeakLinkedSymbolForString("CGImageDestinationCreateWithData", v1);
  if (!weak_CGImageDestinationCreateWithData) {
    __SoftLinkImageIO_block_invoke_cold_5();
  }
  weak_CGImageDestinationAddCGImageRef Image = SKUIWeakLinkedSymbolForString("CGImageDestinationAddImage", v1);
  if (!weak_CGImageDestinationAddImage) {
    __SoftLinkImageIO_block_invoke_cold_6();
  }
  uint64_t result = SKUIWeakLinkedSymbolForString("CGImageDestinationFinalize", v1);
  weak_CGImageDestinationFinalize = result;
  if (!result) {
    __SoftLinkImageIO_block_invoke_cold_7();
  }
  return result;
}

void sub_1C19F7114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C19FDF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A00480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_1C1A00B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_1C1A0302C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id SKUIResourceLoaderGetNameForObject(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIResourceLoaderGetNameForObject_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  CFMutableDataRef v12 = NSStringFromClass(v11);
  uint64_t v13 = [v10 stringWithFormat:@"%@:%p", v12, v1];

  return v13;
}

BOOL SKUIResourceLoadCountMapClear(uint64_t a1, uint64_t a2)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIResourceLoadCountMapClear_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = 2;
  if (a2 != 1) {
    uint64_t v12 = a2 == 0;
  }
  uint64_t v13 = *(void *)(a1 + 8 * v12);
  if (v13 >= 1) {
    *(void *)(a1 + 8 * v12) = 0;
  }
  return v13 > 0;
}

uint64_t SKUIResourceLoadCountMapDecrement(uint64_t a1, uint64_t a2)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIResourceLoadCountMapDecrement_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = a2 == 0;
  if (a2 == 1) {
    uint64_t v12 = 2;
  }
  uint64_t result = *(void *)(a1 + 8 * v12);
  if (result >= 1) {
    *(void *)(a1 + 8 * v12) = --result;
  }
  return result;
}

uint64_t SKUIResourceLoadCountMapGet(uint64_t a1, uint64_t a2)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIResourceLoadCountMapGet_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = a2 == 0;
  if (a2 == 1) {
    uint64_t v12 = 2;
  }
  return *(void *)(a1 + 8 * v12);
}

void sub_1C1A0568C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A057C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void SKUIResourceLoadCountMapIncrement(uint64_t a1, uint64_t a2)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIResourceLoadCountMapIncrement_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = a2 == 0;
  if (a2 == 1) {
    uint64_t v12 = 2;
  }
  ++*(void *)(a1 + 8 * v12);
}

void SKUIEditorialStyleForDictionary(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  *(_OWORD *)a2 = xmmword_1C1CCB470;
  *(void *)(a2 + 16) = 0x4120000041600000;
  *(void *)(a2 + 24) = 2;
  *(void *)(a2 + 32) = 0x40A0000041880000;
  id v13 = v3;
  BOOL v4 = [v3 objectForKey:@"align"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)a2 = SKUIPageComponentAlignmentForString(v4);
  }
  uint64_t v5 = [v13 objectForKey:@"bodySize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)(a2 + 16) = SKUIEditorialBodySizeForString(v5);
    *(void *)(a2 + 8) = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 floatValue];
    *(_DWORD *)(a2 + 16) = v6;
  }
  uint64_t v7 = [v13 objectForKey:@"bodyWeight"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(a2 + 8) = SKUIPageComponentFontWeightForString(v7);
  }
  uint64_t v8 = [v13 objectForKey:@"titleSize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)(a2 + 20) = SKUIEditorialLinkSpacingForString(v8);
    *(float *)(a2 + 32) = SKUIEditorialTitleSizeForString(v8);
    *(void *)(a2 + 24) = SKUIEditorialTitleWeightForString(v8);
    *(float *)(a2 + 36) = SKUIEditorialTitleSpacingForString(v8);
  }
  else if (objc_opt_respondsToSelector())
  {
    [v8 floatValue];
    *(_DWORD *)(a2 + 32) = v9;
  }
  uint64_t v10 = [v13 objectForKey:@"titleSpacing"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 floatValue];
    *(_DWORD *)(a2 + 36) = v11;
  }
  uint64_t v12 = [v13 objectForKey:@"titleWeight"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(a2 + 24) = SKUIPageComponentFontWeightForString(v12);
  }
}

uint64_t SKUICTTextAlignmentForPageComponentAlignment(unint64_t a1)
{
  unsigned int v1 = 0x1020000u >> (8 * a1);
  if (a1 >= 4) {
    LOBYTE(v1) = 2;
  }
  return v1 & 3;
}

float SKUIEditorialBodySizeForString(void *a1)
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

uint64_t SKUIEditorialBodyWeightForString()
{
  return 1;
}

double SKUIEditorialStyleDefault@<D0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1C1CCB470;
  *(void *)(a1 + 16) = 0x4120000041600000;
  *(void *)(a1 + 24) = 2;
  double result = 2048.0005;
  *(void *)(a1 + 32) = 0x40A0000041880000;
  return result;
}

uint64_t SKUIPageComponentAlignmentForString(void *a1)
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

float SKUIEditorialLinkSpacingForString(void *a1)
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

float SKUIEditorialTitleSizeForString(void *a1)
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

uint64_t SKUIEditorialTitleWeightForString(void *a1)
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

float SKUIEditorialTitleSpacingForString(void *a1)
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

double SKUITextLayoutSizeForCTFrame(const __CTFrame *a1, CFIndex a2)
{
  Path = CTFrameGetPath(a1);
  CGRect BoundingBox = CGPathGetBoundingBox(Path);
  double width = BoundingBox.size.width;
  CFArrayRef Lines = CTFrameGetLines(a1);
  CFIndex Count = CFArrayGetCount(Lines);
  if (a2 && Count > a2)
  {
    origins.x = 0.0;
    origins.y = 0.0;
    v12.x = 0.0;
    v12.y = 0.0;
    v14.location = 0;
    v14.length = 1;
    CTFrameGetLineOrigins(a1, v14, &v12);
    CFIndex v8 = a2 - 1;
    v15.location = v8;
    v15.length = 1;
    CTFrameGetLineOrigins(a1, v15, &origins);
    ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v8);
    CTLineGetBoundsWithOptions(ValueAtIndex, 0x14uLL);
  }
  float v10 = width;
  return ceilf(v10);
}

void sub_1C1A09454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A098E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A09B60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A0A8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

void sub_1C1A0F448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A0F6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A0FB18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C1A12394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1A13888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  double result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_1C1A13D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1A147CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C1A19154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A198A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A1C7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A1CC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A1D25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1C1A1D728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAMSURLParserClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6425B68;
    uint64_t v6 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AMSURLParser");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAMSURLParserClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAMSURLParserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
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
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6425B80;
    uint64_t v3 = 0;
    AppleMediaServicesUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  BOOL v0 = (void *)v1[0];
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    BOOL v0 = (void *)abort_report_np();
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

SKUIRedeemInputViewController *__getAMSUIWebViewControllerClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesUILibrary();
  uint64_t result = (SKUIRedeemInputViewController *)objc_getClass("AMSUIWebViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSUIWebViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SKUIRedeemInputViewController *)__getAMSUIWebViewControllerClass_block_invoke_cold_1();
    return [(SKUIRedeemInputViewController *)v3 initWithRedeemCategory:v5];
  }
  return result;
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

void sub_1C1A21BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1C1A21DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A23644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1A23834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A25100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A25ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A27368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIChartGetTitle(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIChartGetTitle_cold_1();
  }
  uint64_t v7 = (void *)SKUIChartGetTitle_sChartIndexFormatter;
  if (!SKUIChartGetTitle_sChartIndexFormatter)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    int v9 = (void *)SKUIChartGetTitle_sChartIndexFormatter;
    SKUIChartGetTitle_sChartIndexFormatter = (uint64_t)v8;

    [(id)SKUIChartGetTitle_sChartIndexFormatter setNumberStyle:1];
    [(id)SKUIChartGetTitle_sChartIndexFormatter setUsesGroupingSeparator:0];
    uint64_t v7 = (void *)SKUIChartGetTitle_sChartIndexFormatter;
  }
  uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  uint64_t v11 = [v7 stringFromNumber:v10];

  if (v5) {
    [v5 localizedStringForKey:@"CHART_ITEM_TITLE_FORMAT"];
  }
  else {
  uint64_t v12 = +[SKUIClientContext localizedStringForKey:@"CHART_ITEM_TITLE_FORMAT" inBundles:0];
  }
  uint64_t v13 = [NSString stringWithValidatedFormat:v12, @"%@%@", 0, v11, v6 validFormatSpecifiers error];

  return v13;
}

void sub_1C1A27DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A287BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C1A28A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A2A77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A3090C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v15 = a1;
  *(_OWORD *)a2 = xmmword_1C1CCB590;
  *(void *)(a2 + 16) = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v3 = [v15 elementType] == 72;
  SEL v4 = v15;
  if (v3)
  {
    id v5 = [v15 children];
    if ([v5 count] != 2)
    {
LABEL_11:

      SEL v4 = v15;
      goto LABEL_12;
    }
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 attributes];
    id v8 = [v7 objectForKey:@"type"];
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
      long long v14 = xmmword_1C1CCB5A0;
    }
    else
    {
      long long v14 = xmmword_1C1CCB470;
    }
    *(unsigned char *)a2 = 1;
    *(_OWORD *)(a2 + 8) = v14;
    goto LABEL_10;
  }
LABEL_12:
}

void sub_1C1A36904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SKUIEditorialLayoutOrientationForInterfaceOrientation(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL SKUIEditorialLayoutOrientationForView(void *a1)
{
  [a1 bounds];
  return v1 > v2;
}

void sub_1C1A39774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A39B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_1C1A3A3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A3B4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void SKUILockupStyleForDictionary(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  *(_OWORD *)a3 = xmmword_1C1CCB650;
  *(void *)(a3 + 16) = 2142;
  uint64_t v7 = [v5 objectForKey:@"orientation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = SKUILockupLayoutStyleForString(v7);
    *(void *)(a3 + 8) = v8;
    uint64_t v9 = v8 & 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v5 objectForKey:@"artworkSize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = SKUILockupSizeForString(v10);
    *(void *)a3 = v11;
  }
  else
  {
    uint64_t v11 = 2;
  }
  uint64_t v12 = [v5 objectForKey:@"fields"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = v11;
    id v21 = v10;
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
          uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 |= SKUILockupFieldForString(v19);
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
    uint64_t v10 = v21;
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

uint64_t SKUILockupFieldForString(void *a1)
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

id SKUILockupItemCountString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 itemKind] != 17)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  if (!SKUILockupItemCountString_sFormatter)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v8 = (void *)SKUILockupItemCountString_sFormatter;
    SKUILockupItemCountString_sFormatter = (uint64_t)v7;

    [(id)SKUILockupItemCountString_sFormatter setNumberStyle:1];
    if (v4) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = +[SKUIClientContext localizedStringForKey:@"APP_BUNDLE_LOCKUP_APP_COUNT" inBundles:0];
    goto LABEL_8;
  }
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = [v4 localizedStringForKey:@"APP_BUNDLE_LOCKUP_APP_COUNT"];
LABEL_8:
  uint64_t v9 = (void *)v5;
  uint64_t v10 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v3, "numberOfChildItems"));
  uint64_t v11 = NSString;
  uint64_t v12 = [(id)SKUILockupItemCountString_sFormatter stringFromNumber:v10];
  id v6 = [v11 stringWithValidatedFormat:v9, @"%@", 0, v12 validFormatSpecifiers error];

LABEL_9:

  return v6;
}

uint64_t SKUILockupLayoutStyleForString(void *a1)
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

uint64_t SKUILockupSizeForString(void *a1)
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

double SKUILockupStyleDefault@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 2;
  *(_OWORD *)a1 = xmmword_1C1CCB650;
  *(void *)(a1 + 16) = 2142;
  return result;
}

BOOL SKUILockupStyleEqualToLockupStyle(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

BOOL SKUILockupLayoutStyleIsHorizontal(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

void sub_1C1A3D464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUICollectionViewCellForView(void *a1)
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
      id v4 = [v2 superview];

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
    id v4 = 0;
  }

  return v3;
}

id SKUICollectionViewForView(void *a1)
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
      id v4 = [v2 superview];

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
    id v4 = 0;
  }

  return v3;
}

void sub_1C1A3F6E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A3FC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A402F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A4051C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1A40C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1C1A41A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1C1A43334(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

CGFloat CGRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    CGRectWithFlippedOriginRelativeToBoundingRect_cold_1();
  }
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.double width = a7;
  v16.size.height = a8;
  double v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.double width = a7;
  v17.size.height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

id SKUIStackedBarNavAnimationController(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id)[v8 view];
  id v11 = (id)[v9 view];
  uint64_t v12 = [v9 view];
  [v12 layoutSubviews];

  uint64_t v13 = [v8 SKUIStackedBar];
  uint64_t v14 = [v9 SKUIStackedBar];
  uint64_t v15 = (void *)v14;
  id v16 = 0;
  if (v13 && v14)
  {
    [v13 _resetNewOffset];
    [v15 _resetNewOffset];
    CGRect v17 = SKUINavigationControllerGetItemsForViewController(v7, v8);
    [v13 setItems:v17];

    [v13 sizeToFit];
    uint64_t v18 = [v8 contentScrollView];

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
      uint64_t v22 = [v8 contentScrollView];
      SKUIScrollViewSetContentInsets(v22, "com.apple.StoreKitUI.stackedBarInset", v21, 0.0, 0.0, 0.0);
    }
    id v23 = SKUINavigationControllerGetItemsForViewController(v7, v9);
    [v15 setItems:v23];

    [v15 sizeToFit];
    long long v24 = [v9 contentScrollView];

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
      CGRect v28 = [v9 contentScrollView];
      SKUIScrollViewSetContentInsets(v28, "com.apple.StoreKitUI.stackedBarInset", v27, 0.0, 0.0, 0.0);
    }
    if (a2 == 1)
    {
      uint64_t v29 = off_1E6420FB8;
      uint64_t v30 = v8;
      goto LABEL_17;
    }
    if (a2 == 2)
    {
      uint64_t v29 = off_1E6420FB0;
      uint64_t v30 = v9;
LABEL_17:
      id v16 = objc_alloc_init(*v29);
      [v16 setFromBar:v13];
      [v16 setToBar:v15];
      [v30 SKUIStackedBarSplit];
      objc_msgSend(v16, "setSplit:");
      goto LABEL_19;
    }
    id v16 = 0;
  }
LABEL_19:

  return v16;
}

id SKUINavigationControllerGetItemsForViewController(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = objc_msgSend(v3, "viewControllers", 0);
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

  uint64_t v13 = [v3 viewControllers];
  char v14 = [v13 containsObject:v4];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [v4 navigationItem];
    [v5 addObject:v15];
  }

  return v5;
}

void SKUIStackedBarNavDidShow(void *a1, void *a2)
{
  id v12 = a1;
  id v3 = a2;
  id v4 = [v3 SKUIStackedBar];
  if (v4)
  {
    uint64_t v5 = SKUINavigationControllerGetItemsForViewController(v12, v3);
    [v4 setItems:v5];

    [v4 frame];
    if (CGRectGetHeight(v14) == 0.0) {
      [v4 sizeToFit];
    }
    id v6 = [v3 contentScrollView];

    if (v6)
    {
      objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
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
      SKUIScrollViewSetContentInsets(v11, "com.apple.StoreKitUI.stackedBarInset", v10, 0.0, 0.0, 0.0);
    }
  }
}

void SKUIScrollViewSetContentInsets(void *a1, const void *a2, double a3, double a4, double a5, double a6)
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
    double v10 = *MEMORY[0x1E4FB2848];
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
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
    uint64_t v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", a3, a4, a5, a6);
    objc_setAssociatedObject(object, a2, v48, (void *)1);
  }
}

void SKUIImageRectForBounds()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIImageRectForBounds_cold_1();
  }
  SKUIImageRectForBoundsAndPadding();
}

void SKUIImageRectForBoundsAndPadding()
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v0) {
      SKUIImageRectForBoundsAndPadding_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
}

void SKUIViewSetBottomBorderColor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIViewSetBottomBorderColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [v3 viewWithTag:1397441090];
  double v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v15 scale];
      double v17 = 1.0 / v16;

      [v3 bounds];
      double v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, v18 - v17, v19, v17);
      [v14 setAutoresizingMask:10];
      [v14 setTag:1397441090];
      [v3 addSubview:v14];
    }
    [v14 setBackgroundColor:v4];
  }
  else
  {
    [v13 removeFromSuperview];
  }
}

void SKUIViewSetTopBorderColor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIViewSetTopBorderColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [v3 viewWithTag:1397445698];
  double v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v15 scale];
      double v17 = 1.0 / v16;

      [v3 bounds];
      double v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v18, v17);
      [v14 setAutoresizingMask:2];
      [v14 setTag:1397445698];
      [v3 addSubview:v14];
    }
    [v14 setBackgroundColor:v4];
  }
  else
  {
    [v13 removeFromSuperview];
  }
}

double SKUILockupImageSizeForLockupSize(unint64_t a1, uint64_t a2)
{
  if (a2 == 2 || a2 == 6)
  {
    if (a1 < 6)
    {
      uint64_t v2 = (double *)&unk_1C1CCB750;
      return v2[a1];
    }
    return 120.0;
  }
  else if (a2 == 8)
  {
    if (a1 < 6)
    {
      uint64_t v2 = (double *)&unk_1C1CCB6F0;
      return v2[a1];
    }
    return 175.0;
  }
  else
  {
    if (a1 <= 5)
    {
      uint64_t v2 = (double *)&unk_1C1CCB780;
      return v2[a1];
    }
    return 125.0;
  }
}

uint64_t SKUILockupImageStyleForItemKind(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6) {
    return 0;
  }
  else {
    return qword_1C1CCB7B0[a1 - 2];
  }
}

void sub_1C1A4EDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A4F038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A50CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&STACK[0x348], 8);
  _Block_object_dispose((const void *)(v62 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A52004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A52370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A527C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
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

void sub_1C1A52A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1C1A52DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A53308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUILockupViewTypeForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUILockupViewTypeForString_cold_1();
  }
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

void sub_1C1A56D1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1A571E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIFacebookViewElementTypeForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIFacebookViewElementTypeForString_cold_1();
  }
  uint64_t v2 = [v1 isEqualToString:@"large"];

  return v2;
}

void sub_1C1A5B6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1A5BD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A5C184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A5C30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChildren(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        SKUIViewElementAccumulatePersonalizationLibraryItemsForChildren_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "personalizationLibraryItems", (void)v19);
        if (v18) {
          [v3 unionSet:v18];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

void sub_1C1A5CCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChild(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIViewElementAccumulatePersonalizationLibraryItemsForChild_cold_1();
  }
  BOOL v5 = [v4 personalizationLibraryItems];
  if (v5) {
    [v3 unionSet:v5];
  }
}

uint64_t SKUIViewElementAlignmentForStyle(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIViewElementAlignmentForStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [v1 textAlignment];
  if (!v10)
  {
    uint64_t v10 = [v1 elementAlignment];
    if (!v10)
    {
      uint64_t v11 = [v1 elementPosition];
      if ((unint64_t)(v11 - 1) > 8) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = qword_1C1CCBA10[v11 - 1];
      }
    }
  }

  return v10;
}

id SKUIViewElementFontWithStyle(void *a1)
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIViewElementFontWithStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [v1 textStyle];
  if (!v10) {
    goto LABEL_29;
  }
  if (SKUIViewElementFontWithStyle_sOnce != -1) {
    dispatch_once(&SKUIViewElementFontWithStyle_sOnce, &__block_literal_global_18);
  }
  value = 0;
  if (!NSMapMember((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, v10, 0, &value)) {
    goto LABEL_29;
  }
  uint64_t v11 = [v1 textScale];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v14 = value;
    goto LABEL_15;
  }
  if (![v11 isEqualToString:@"none"])
  {
    double v47 = 0;
    BOOL v15 = NSMapMember((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, v12, 0, &v47);
    uint64_t v14 = value;
    if (v15)
    {
      uint64_t v13 = SKUIFontLimitedPreferredFontForTextStyle((uint64_t)value, (uint64_t)v47);
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v13 = SKUIFontPreferredFontForTextStyle((uint64_t)v14);
    goto LABEL_16;
  }
  uint64_t v13 = SKUIFontForTextStyle((uint64_t)value);
LABEL_16:
  uint64_t v16 = (void *)v13;
  uint64_t v17 = [v1 fontWeight];
  uint64_t v18 = v17;
  if (!v16 || !v17) {
    goto LABEL_28;
  }
  if ([v17 isEqualToString:@"medium"])
  {
    v60[0] = *MEMORY[0x1E4FB0908];
    long long v19 = [v16 familyName];
    v60[1] = *MEMORY[0x1E4FB0918];
    v61[0] = v19;
    v61[1] = @"Medium";
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];

LABEL_20:
    long long v21 = [v16 fontDescriptor];
    long long v22 = [v21 fontDescriptorByAddingAttributes:v20];

    goto LABEL_26;
  }
  if ([v18 isEqualToString:@"bold"])
  {
    double v23 = [v16 fontDescriptor];
    long long v20 = v23;
    uint64_t v24 = 2;
  }
  else
  {
    if (![v18 isEqualToString:@"condensed-bold"])
    {
      if ([v18 isEqualToString:@"light"])
      {
        uint64_t v58 = *MEMORY[0x1E4FB0948];
        uint64_t v59 = *MEMORY[0x1E4F244C8];
        unint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = &v59;
        double v36 = &v58;
      }
      else if ([v18 isEqualToString:@"ultra-light"])
      {
        uint64_t v56 = *MEMORY[0x1E4FB0948];
        uint64_t v57 = *MEMORY[0x1E4F244F8];
        unint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = &v57;
        double v36 = &v56;
      }
      else
      {
        if (![v18 isEqualToString:@"thin"]) {
          goto LABEL_28;
        }
        uint64_t v54 = *MEMORY[0x1E4FB0948];
        uint64_t v55 = *MEMORY[0x1E4F244E8];
        unint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = &v55;
        double v36 = &v54;
      }
      long long v20 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
      goto LABEL_20;
    }
    double v23 = [v16 fontDescriptor];
    long long v20 = v23;
    uint64_t v24 = 66;
  }
  long long v22 = [v23 fontDescriptorWithSymbolicTraits:v24];
LABEL_26:

  if (v22)
  {
    uint64_t v25 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v22 size:0.0];

    uint64_t v16 = (void *)v25;
  }
LABEL_28:

  if (v16) {
    goto LABEL_48;
  }
LABEL_29:
  [v1 fontSize];
  double v27 = v26;
  if (v26 <= 0.00000011920929)
  {
    uint64_t v16 = 0;
    goto LABEL_48;
  }
  double v28 = [v1 fontWeight];
  if ([v28 isEqualToString:@"medium"])
  {
    double v29 = (void *)MEMORY[0x1E4FB08E0];
    double v30 = (double *)MEMORY[0x1E4FB09D0];
    goto LABEL_45;
  }
  if ([v28 isEqualToString:@"bold"])
  {
    double v29 = (void *)MEMORY[0x1E4FB08E0];
    double v30 = (double *)MEMORY[0x1E4FB09B8];
    goto LABEL_45;
  }
  if (![v28 isEqualToString:@"condensed-bold"])
  {
    if ([v28 isEqualToString:@"light"])
    {
      double v29 = (void *)MEMORY[0x1E4FB08E0];
      double v30 = (double *)MEMORY[0x1E4FB09C8];
    }
    else if ([v28 isEqualToString:@"ultra-light"])
    {
      double v29 = (void *)MEMORY[0x1E4FB08E0];
      double v30 = (double *)MEMORY[0x1E4FB09F8];
    }
    else
    {
      int v37 = [v28 isEqualToString:@"thin"];
      double v29 = (void *)MEMORY[0x1E4FB08E0];
      if (!v37)
      {
        uint64_t v38 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v27];
        goto LABEL_46;
      }
      double v30 = (double *)MEMORY[0x1E4FB09E8];
    }
LABEL_45:
    uint64_t v38 = [v29 systemFontOfSize:v27 weight:*v30];
LABEL_46:
    uint64_t v16 = (void *)v38;
    goto LABEL_47;
  }
  double v31 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v27 weight:*MEMORY[0x1E4FB09B8]];
  double v32 = [v31 fontDescriptor];

  uint64_t v33 = [v32 fontDescriptorWithSymbolicTraits:66];

  uint64_t v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v33 size:0.0];

LABEL_47:
LABEL_48:
  double v39 = [v16 fontDescriptor];
  uint64_t v52 = *MEMORY[0x1E4FB0910];
  uint64_t v40 = *MEMORY[0x1E4FB0960];
  v49[0] = *MEMORY[0x1E4FB0968];
  v49[1] = v40;
  v50[0] = &unk_1F1D61CA0;
  v50[1] = &unk_1F1D61CB8;
  double v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  long long v51 = v41;
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  long long v53 = v42;
  double v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  double v44 = [v39 fontDescriptorByAddingAttributes:v43];

  double v45 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v44 size:0.0];

  return v45;
}

void __SKUIViewElementFontWithStyle_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:0];
  id v1 = (void *)SKUIViewElementFontWithStyle_sTextScaleMap;
  SKUIViewElementFontWithStyle_sTextScaleMap = v0;

  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"x-small", (const void *)1);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"small", (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"medium", (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"large", (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"x-large", (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"xx-large", (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, @"xxx-large", (const void *)7);
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:0];
  uint64_t v3 = (void *)SKUIViewElementFontWithStyle_sTextStyleMap;
  SKUIViewElementFontWithStyle_sTextStyleMap = v2;

  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"body", (const void *)1);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"body-short", (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"callout", (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"callout-short", (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"caption1", (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"caption1-medium-short", (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"caption1-short", (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"caption2", (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"caption2-short", (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"caption3", (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"footnote", (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"footnote-short", (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"headline", (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"headline-short", (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"subhead", (const void *)0x10);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"subhead-short", (const void *)0x11);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"subhead2", (const void *)0x12);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"subhead2-medium-short", (const void *)0x13);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"subhead2-short", (const void *)0x14);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"subhead2-tall", (const void *)0x15);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-1", (const void *)0x16);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-2", (const void *)0x17);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-3", (const void *)0x18);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-4", (const void *)0x19);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-5", (const void *)0x1A);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, @"super-headline-5-medium-short", (const void *)0x1B);
  uint64_t v4 = (NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap;

  NSMapInsertKnownAbsent(v4, @"super-headline-5-short", (const void *)0x1C);
}

id SKUIViewElementPlainColorWithIKColor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        SKUIViewElementPlainColorWithIKColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ([v3 colorType] == 1)
  {
    id v13 = v4;
  }
  else
  {
    id v13 = [v3 color];
  }
  uint64_t v14 = v13;

  return v14;
}

id SKUIViewElementPlainColorWithStyle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        SKUIViewElementPlainColorWithStyle_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [v3 ikColor];
  uint64_t v14 = SKUIViewElementPlainColorWithIKColor(v13, v4);

  return v14;
}

uint64_t SKUIViewElementNSTextAlignmentForIKElementAlignment(uint64_t a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIViewElementNSTextAlignmentForIKElementAlignment_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ((unint64_t)(a1 - 2) >= 4) {
    return 0;
  }
  else {
    return a1 - 1;
  }
}

double SKUIViewElementMarginForStyle(void *a1, char *a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIViewElementMarginForStyle_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 valueForStyle:*MEMORY[0x1E4F6EFD0]];
  if (!v12)
  {
    uint64_t v12 = [v3 valueForStyle:@"itml-margin"];
    if (!v12)
    {
      char v15 = 0;
      double v14 = *MEMORY[0x1E4FB2848];
      if (!a2) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  [v12 UIEdgeInsetsValue];
  double v14 = v13;

  char v15 = 1;
  if (a2) {
LABEL_8:
  }
    *a2 = v15;
LABEL_9:

  return v14;
}

double SKUIViewElementPaddingForStyle(void *a1, char *a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIViewElementPaddingForStyle_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 valueForStyle:*MEMORY[0x1E4F6EFD8]];
  if (!v12)
  {
    uint64_t v12 = [v3 valueForStyle:@"itml-padding"];
    if (!v12)
    {
      char v15 = 0;
      double v14 = *MEMORY[0x1E4FB2848];
      if (!a2) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  [v12 UIEdgeInsetsValue];
  double v14 = v13;

  char v15 = 1;
  if (a2) {
LABEL_8:
  }
    *a2 = v15;
LABEL_9:

  return v14;
}

void sub_1C1A61020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1C1A611D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A615A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A617F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1C1A64648(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void SKUIConsoleLogFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIConsoleLogFormat_cold_1();
  }
  uint64_t v16 = &a9;
  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __SKUIConsoleLogFormat_block_invoke;
  v14[3] = &unk_1E6424D48;
  id v15 = v12;
  id v13 = v12;
  [v11 evaluate:v14 completionBlock:0];
}

void __SKUIConsoleLogFormat_block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"console"];
  BOOL v4 = [v3 objectForKeyedSubscript:@"log"];
  v7[0] = *(void *)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v6 = (id)[v4 callWithArguments:v5];
}

void SKUIConsoleLogObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIConsoleLogObjects_cold_1();
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __SKUIConsoleLogObjects_block_invoke;
  v6[3] = &unk_1E6424D48;
  id v7 = v4;
  id v5 = v4;
  [v3 evaluate:v6 completionBlock:0];
}

void __SKUIConsoleLogObjects_block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 objectForKeyedSubscript:@"console"];
  id v3 = [v5 objectForKeyedSubscript:@"log"];
  id v4 = (id)[v3 callWithArguments:*(void *)(a1 + 32)];
}

void sub_1C1A709B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A70DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A710E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A717B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
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

void sub_1C1A71DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A72860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A72A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A735B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A73E14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1A77548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
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

void sub_1C1A79768(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C1A79860(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1A79A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1A79BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A7E240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1A7FCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void sub_1C1A7FF8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A804C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A85A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1C1A85CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A86880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A86B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A86F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__39(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
}

void sub_1C1A8C190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void SKUIInitializeDOMFeatureFactory()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIInitializeDOMFeatureFactory_cold_1();
  }
  if (SKUIInitializeDOMFeatureFactory_sOnce != -1) {
    dispatch_once(&SKUIInitializeDOMFeatureFactory_sOnce, &__block_literal_global_23);
  }
}

void __SKUIInitializeDOMFeatureFactory_block_invoke()
{
  uint64_t v0 = objc_opt_class();
  SKUIRegisterDOMFeatureFactory(v0);
  uint64_t v1 = objc_opt_class();
  SKUIRegisterDOMFeatureFactory(v1);
  uint64_t v2 = objc_opt_class();
  SKUIRegisterDOMFeatureFactory(v2);
  id v3 = objc_opt_class();
  SKUIRegisterDOMFeatureFactory(v3);
  id v4 = objc_opt_class();

  SKUIRegisterDOMFeatureFactory(v4);
}

void SKUIRegisterDOMFeatureFactory(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIRegisterDOMFeatureFactory_cold_1();
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [a1 possibleFeatureNames];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [MEMORY[0x1E4F6F090] registerClass:a1 forFeatureName:*(void *)(*((void *)&v8 + 1) + 8 * i)];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v7 = (void *)MEMORY[0x1E4F6F090];
    uint64_t v2 = [a1 featureName];
    [v7 registerClass:a1 forFeatureName:v2];
  }
}

void sub_1C1A8D9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A92658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

void SKUIScrollViewLayoutTopBackgroundColor(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIScrollViewLayoutTopBackgroundColor_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  long long v10 = [v1 viewWithTag:1095975495];
  if (v10) {
    __LayoutTopBackgroundColor(v1, v10);
  }
}

void __LayoutTopBackgroundColor(void *a1, void *a2)
{
  id v10 = a2;
  [a1 bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double v9 = v8;

  objc_msgSend(v10, "setFrame:", v4, -v9, v6, v9);
}

void SKUIScrollViewLayoutTopBackgroundColorForProductPage(void *a1, double a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        SKUIScrollViewLayoutTopBackgroundColorForProductPage_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 viewWithTag:1095975495];
  if (v12)
  {
    [v3 bounds];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 bounds];
    double v19 = v18 + v18;

    objc_msgSend(v12, "setFrame:", v14, a2 - v19, v16, v19);
  }
}

void SKUIScrollViewSetTopBackgroundColor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIScrollViewSetTopBackgroundColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [v3 viewWithTag:1095975495];
  id v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [v14 setAutoresizingMask:2];
      [v14 setTag:1095975495];
      [v3 _addContentSubview:v14 atBack:1];
    }
    [v14 setBackgroundColor:v4];
    __LayoutTopBackgroundColor(v3, v14);
  }
  else
  {
    [v13 removeFromSuperview];
  }
}

void sub_1C1A992F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A995A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A99684(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1A99940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1A99A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1A99D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A99FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1C1A9A24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1A9A980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9C078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 232), 8);
  _Block_object_dispose((const void *)(v58 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9C54C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9D0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9D7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9DD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9E124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9EF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9F20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1A9FEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AA28F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1AA5F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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
    SKUIRedeemInputViewController *result = NAN;
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
    SKUIRedeemInputViewController *result = v16;
  }
  return result;
}

void sub_1C1AAEE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1C1AAF528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C1AB094C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1AB264C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

void _SKUIOffscreenRenderOperationPopRenderingContext(void *a1, void *a2)
{
  v45[2] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x3032000000;
  double v32 = __Block_byref_object_copy__17;
  uint64_t v33 = __Block_byref_object_dispose__18;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__17;
  uint64_t v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  id v4 = _SKUIOffscreenRenderOperationGetRendererStackAccessQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SKUIOffscreenRenderOperationPopRenderingContext_block_invoke;
  block[3] = &unk_1E64272A8;
  block[4] = &v29;
  block[5] = &v23;
  dispatch_barrier_sync(v4, block);
  if (!v30[5] || !v24[5])
  {
    uint64_t v40 = 0;
    double v41 = &v40;
    uint64_t v42 = 0x2020000000;
    BOOL v5 = (id *)getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
    uint64_t v43 = getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
    if (!getkEAGLContextPropertyAcceleratedSymbolLoc_ptr)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      int v37 = __getkEAGLContextPropertyAcceleratedSymbolLoc_block_invoke;
      uint64_t v38 = &unk_1E6424310;
      double v39 = &v40;
      double v6 = (void *)OpenGLESLibrary();
      float v7 = dlsym(v6, "kEAGLContextPropertyAccelerated");
      *(void *)(v39[1] + 24) = v7;
      getkEAGLContextPropertyAcceleratedSymbolLoc_ptr = *(void *)(v39[1] + 24);
      BOOL v5 = (id *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v5) {
      goto LABEL_17;
    }
    id v8 = *v5;
    v44[0] = v8;
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    v45[0] = MEMORY[0x1E4F1CC38];
    uint64_t v40 = 0;
    double v41 = &v40;
    uint64_t v42 = 0x2020000000;
    float v10 = (id *)getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
    uint64_t v43 = getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
    if (!getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      int v37 = __getkEAGLContextPropertyClientRetainReleaseSymbolLoc_block_invoke;
      uint64_t v38 = &unk_1E6424310;
      double v39 = &v40;
      uint64_t v11 = (void *)OpenGLESLibrary();
      double v12 = dlsym(v11, "kEAGLContextPropertyClientRetainRelease");
      *(void *)(v39[1] + 24) = v12;
      getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr = *(void *)(v39[1] + 24);
      float v10 = (id *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v10)
    {
LABEL_17:
      dlerror();
      abort_report_np();
      __break(1u);
    }
    id v13 = *v10;
    v44[1] = v13;
    v45[1] = v9;
    BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

    uint64_t v15 = [objc_alloc((Class)getEAGLContextClass()) initWithAPI:3 properties:v14];
    uint64_t v16 = (void *)v24[5];
    v24[5] = v15;

    uint64_t v17 = v24[5];
    if (!v17)
    {
      uint64_t v18 = [objc_alloc((Class)getEAGLContextClass()) initWithAPI:2 properties:v14];
      double v19 = (void *)v24[5];
      v24[5] = v18;

      uint64_t v17 = v24[5];
    }
    uint64_t v20 = [MEMORY[0x1E4F39C60] rendererWithEAGLContext:v17 options:0];
    long long v21 = (void *)v30[5];
    v30[5] = v20;
  }
  if (a2) {
    *a2 = (id) v24[5];
  }
  if (a1) {
    *a1 = (id) v30[5];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

void sub_1C1AB2BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  BOOL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getEAGLContextClass_softClass;
  uint64_t v7 = getEAGLContextClass_softClass;
  if (!getEAGLContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getEAGLContextClass_block_invoke;
    v3[3] = &unk_1E6424310;
    v3[4] = &v4;
    __getEAGLContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C1AB2CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SKUIglGetError()
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getglGetErrorSymbolLoc_ptr;
  uint64_t v7 = getglGetErrorSymbolLoc_ptr;
  if (!getglGetErrorSymbolLoc_ptr)
  {
    id v1 = (void *)OpenGLESLibrary();
    v5[3] = (uint64_t)dlsym(v1, "glGetError");
    getglGetErrorSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    id v3 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0();
}

uint64_t _SKUIglBindFramebuffer(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v2 = (uint64_t (*)(uint64_t, uint64_t))getglBindFramebufferSymbolLoc_ptr;
  uint64_t v9 = getglBindFramebufferSymbolLoc_ptr;
  if (!getglBindFramebufferSymbolLoc_ptr)
  {
    id v3 = (void *)OpenGLESLibrary();
    v7[3] = (uint64_t)dlsym(v3, "glBindFramebuffer");
    getglBindFramebufferSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    BOOL v2 = (uint64_t (*)(uint64_t, uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    BOOL v5 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(36160, a1);
}

void _SKUIOffscreenRenderOperationPushRenderingContext(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    uint64_t v6 = _SKUIOffscreenRenderOperationGetRendererStackAccessQueue();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = ___SKUIOffscreenRenderOperationPushRenderingContext_block_invoke;
    v7[3] = &unk_1E6421FF8;
    id v8 = v3;
    id v9 = v5;
    dispatch_barrier_async(v6, v7);
  }
}

void *__Block_byref_object_copy__44(uint64_t a1, uint64_t a2)
{
  double result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
}

uint64_t IOSurfaceLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!IOSurfaceLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __IOSurfaceLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6427270;
    uint64_t v5 = 0;
    IOSurfaceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = IOSurfaceLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!IOSurfaceLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t OpenGLESLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!OpenGLESLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __OpenGLESLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6427288;
    uint64_t v5 = 0;
    OpenGLESLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = OpenGLESLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!OpenGLESLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

Class __getEAGLContextClass_block_invoke(uint64_t a1)
{
  OpenGLESLibrary();
  Class result = objc_getClass("EAGLContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEAGLContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getEAGLContextClass_block_invoke_cold_1();
    return (Class)__getkIOSurfaceWidthSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getkIOSurfaceWidthSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkIOSurfaceWidthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceHeightSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkIOSurfaceHeightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceBytesPerElementSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceBytesPerElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkIOSurfaceBytesPerElementSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfacePixelFormatSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfacePixelFormat");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkIOSurfacePixelFormatSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkIOSurfaceIsGlobalSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "kIOSurfaceIsGlobal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkIOSurfaceIsGlobalSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIOSurfaceCreateSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  Class result = dlsym(v2, "IOSurfaceCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIOSurfaceCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglClearColorSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glClearColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglClearColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglClearSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glClear");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglClearSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglGetErrorSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glGetError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglGetErrorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglBindFramebufferSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glBindFramebuffer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglBindFramebufferSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglDeleteFramebuffersSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glDeleteFramebuffers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglDeleteFramebuffersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglDeleteTexturesSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  Class result = dlsym(v2, "glDeleteTextures");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
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

uint64_t _SKUIglBindTexture(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v2 = (uint64_t (*)(uint64_t, uint64_t))getglBindTextureSymbolLoc_ptr;
  id v9 = getglBindTextureSymbolLoc_ptr;
  if (!getglBindTextureSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)OpenGLESLibrary();
    v7[3] = (uint64_t)dlsym(v3, "glBindTexture");
    getglBindTextureSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    BOOL v2 = (uint64_t (*)(uint64_t, uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(3553, a1);
}

uint64_t _SKUIglTexParameteri(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  long long v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getglTexParameteriSymbolLoc_ptr;
  uint64_t v11 = getglTexParameteriSymbolLoc_ptr;
  if (!getglTexParameteriSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)OpenGLESLibrary();
    v9[3] = (uint64_t)dlsym(v5, "glTexParameteri");
    getglTexParameteriSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    long long v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    uint64_t v7 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(3553, a1, a2);
}

void *__getglGenTexturesSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glGenTextures");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglGenTexturesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglBindTextureSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glBindTexture");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglBindTextureSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIOSurfaceGetWidthSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  uint64_t result = dlsym(v2, "IOSurfaceGetWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIOSurfaceGetWidthSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIOSurfaceGetHeightSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)IOSurfaceLibrary();
  uint64_t result = dlsym(v2, "IOSurfaceGetHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIOSurfaceGetHeightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglTexParameteriSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glTexParameteri");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglTexParameteriSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglGenFramebuffersSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glGenFramebuffers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglGenFramebuffersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglFramebufferTexture2DSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glFramebufferTexture2D");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglFramebufferTexture2DSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getglViewportSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "glViewport");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getglViewportSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _SKUIOffscreenRenderOperationGetRendererStackAccessQueue()
{
  if (_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken != -1) {
    dispatch_once(&_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken, &__block_literal_global_86);
  }
  uint64_t v0 = (void *)_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;

  return v0;
}

void *__getkEAGLContextPropertyAcceleratedSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "kEAGLContextPropertyAccelerated");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkEAGLContextPropertyAcceleratedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkEAGLContextPropertyClientRetainReleaseSymbolLoc_block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)OpenGLESLibrary();
  uint64_t result = dlsym(v2, "kEAGLContextPropertyClientRetainRelease");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C1AB64F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
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

void SKUINavigationBarController_SetTitleView(void *a1, void *a2)
{
  id v3 = a2;
  id v7 = a1;
  long long v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_setTitleView_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(id, char *, id))Implementation)(v7, sel_setTitleView_, v3);
}

void sub_1C1ABAF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__n128 _SKUIIndexBarControlInitialization(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    _SKUIIndexBarControlInitialization_cold_1();
  }
  BOOL v2 = [MEMORY[0x1E4FB1618] clearColor];
  [v1 setBackgroundColor:v2];

  [v1 setContentMode:3];
  [v1 setDeliversTouchesForGesturesToSuperview:0];
  [v1 setExclusiveTouch:1];
  *(_OWORD *)(v1 + 584) = xmmword_1C1CCBDE0;
  *(_OWORD *)(v1 + 600) = xmmword_1C1CCBDE0;
  v1[481] = 1;
  v1[482] = 1;
  v1[483] = 1;
  v1[484] = 1;
  __asm { FMOV            V0.2D, #-3.0 }
  *(_OWORD *)(v1 + 616) = _Q0;
  *(_OWORD *)(v1 + 632) = _Q0;

  return result;
}

void sub_1C1ABD2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1ABD634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C1ABD800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1ABE0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1C1ABE9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1ABEB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1ABED24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1ABEED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C1ABF148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AC551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1C1AC5B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIGetFamilyMemberImage(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIGetFamilyMemberImage_cold_1();
  }
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v11 && !v9 && !v10) {
    goto LABEL_17;
  }
  uint64_t v13 = SKUIAppleAccountUIFramework();
  id v14 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Aauiprofilepic.isa, v13));
  [v14 setPictureStyle:0];
  [v14 setPictureDiameter:60.0];
  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = SKUIAppleAccountFramework();
  id v16 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Aafamilymember.isa, v15));
  [v16 setFirstName:v7];
  [v16 setLastName:v8];
  [v16 setPersonID:v10];
  [v16 setAppleID:v9];
  uint64_t v17 = [v14 profilePictureForFamilyMember:v16];

  if (!v17)
  {
LABEL_17:
    uint64_t v18 = SKUIContactsUIFramework();
    double v19 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Cnmonogrammer.isa, v18)), "initWithStyle:diameter:", 0, 60.0);
    uint64_t v20 = v19;
    if (v12) {
      [v19 monogramForPersonWithFirstName:v7 lastName:v8];
    }
    else {
    uint64_t v17 = [v19 silhouetteMonogram];
    }
  }

  return v17;
}

void sub_1C1AC9034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1ACA360(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C1ACB698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1ACC55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1ACEA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1ACECD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1ACEED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1ACF220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C1ACF7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
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

void sub_1C1AD0770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AD0FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __RequestImage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 resourceName];
  uint64_t v6 = v5;
  if (!v5)
  {
    id v9 = [v4 requestIdentifierForViewElement:v3];
    if (v9)
    {
      uint64_t v11 = [v4 resourceLoader];
      id v7 = objc_msgSend(v11, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));

      if (v7)
      {
        int v12 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      id v14 = [v4 transientRequestIdentifierForViewElement:v3];
      if (v14)
      {
        uint64_t v15 = [v4 resourceLoader];
        id v7 = objc_msgSend(v15, "cachedResourceForRequestIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));
      }
      else
      {
        id v7 = 0;
      }
      int v12 = [v4 dataConsumerForImageElement:v3];
      [v4 loadImageForImageElement:v3 reason:1 dataConsumer:v12];

      if (v7) {
        goto LABEL_20;
      }
      if (v12) {
        goto LABEL_16;
      }
    }
    int v12 = [v4 dataConsumerForImageElement:v3];
LABEL_16:
    [v4 loadImageForImageElement:v3 reason:1 dataConsumer:v12];
    id v16 = [v3 style];
    uint64_t v17 = [v16 imageTreatment];
    uint64_t v18 = SKUIImageTreatmentForString(v17);

    if (v18 == 7 || ![v12 isImagePlaceholderAvailable])
    {
      id v7 = [v4 placeholderImageForImageElement:v3 dataConsumer:v12];
    }
    else
    {
      double v19 = [v3 style];
      uint64_t v20 = [v19 imagePlaceholderBackgroundColor];
      long long v21 = [v20 color];

      id v7 = [v12 imagePlaceholderForColor:v21];
    }
    goto LABEL_20;
  }
  id v7 = SKUIImageWithResourceName(v5);
  id v8 = [v3 style];
  id v9 = [v8 imageMaskColor];

  if (!v9) {
    goto LABEL_21;
  }
  id v10 = [v9 color];

  if (v10) {
    [v9 color];
  }
  else {
  int v12 = [v4 tintColor];
  }
  uint64_t v13 = [v7 _flatImageWithColor:v12];

  id v7 = (void *)v13;
LABEL_20:

LABEL_21:

  return v7;
}

void sub_1C1ADEEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1ADFDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v24 - 160));
  _Unwind_Resume(a1);
}

void sub_1C1ADFFB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1AE0C94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void SKUIConfigureDownloadsCellView(void *a1, void *a2, void *a3, unsigned int a4, void *a5)
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v32 = a5;
  id v33 = a3;
  id v9 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIConfigureDownloadsCellView_cold_1();
  }
  uint64_t v37 = *MEMORY[0x1E4FB06F8];
  uint64_t v10 = v37;
  uint64_t v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  v39[0] = v11;
  uint64_t v38 = *MEMORY[0x1E4FB0700];
  uint64_t v12 = v38;
  uint64_t v13 = [MEMORY[0x1E4FB1618] _labelColor];
  v39[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v37 count:2];

  v35[0] = v10;
  uint64_t v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  v35[1] = v12;
  v36[0] = v15;
  id v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
  v36[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

  id v18 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v19 = [v8 valueForProperty:*MEMORY[0x1E4FA8660]];
  if (v19)
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19 attributes:v14];
    [v18 appendAttributedString:v20];
  }
  uint64_t v31 = (void *)v19;
  long long v21 = [v8 valueForProperty:*MEMORY[0x1E4FA8538]];
  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v23 = [NSString stringWithFormat:@" – %@", v21];
    uint64_t v24 = (void *)[v22 initWithString:v23 attributes:v17];
    [v18 appendAttributedString:v24];
  }
  uint64_t v25 = [v8 valueForProperty:*MEMORY[0x1E4FA8588]];
  double v26 = [v8 valueForProperty:*MEMORY[0x1E4FA8570]];
  if ([v26 BOOLValue]) {
    uint64_t v27 = [v25 isEqual:*MEMORY[0x1E4FA84F0]];
  }
  else {
    uint64_t v27 = 0;
  }

  if ([v25 isEqualToString:*MEMORY[0x1E4FA84F8]])
  {
    uint64_t v28 = 2;
  }
  else if ([v25 isEqualToString:*MEMORY[0x1E4FA8520]])
  {
    uint64_t v28 = 2;
  }
  else
  {
    uint64_t v28 = v27;
  }
  [v9 setAttributedTitle:v18];
  uint64_t v29 = SKUIDownloadsStatusString(v8, v32);

  [v9 setSubtitle:v29];
  double v30 = [v8 valueForExternalProperty:*MEMORY[0x1E4FA8460]];
  [v30 doubleValue];
  objc_msgSend(v9, "setProgress:");

  [v9 setImage:v33];
  [v9 setButtonType:v28];
  [v9 setIsPad:a4];
}

id SKUIDownloadsStatusString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIDownloadsStatusString_cold_1();
  }
  uint64_t v5 = [v3 valueForProperty:*MEMORY[0x1E4FA8588]];
  if ([v5 isEqualToString:*MEMORY[0x1E4FA84F8]])
  {
    if (v4)
    {
      uint64_t v6 = @"DOWNLOAD_ERROR";
LABEL_18:
      uint64_t v10 = [v4 localizedStringForKey:v6 inTable:@"Download"];
LABEL_25:
      uint64_t v13 = (void *)v10;
      goto LABEL_26;
    }
    id v9 = @"DOWNLOAD_ERROR";
    goto LABEL_24;
  }
  id v7 = [v3 valueForProperty:*MEMORY[0x1E4FA85A0]];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    if (v4)
    {
      uint64_t v6 = @"RESTRICTED";
      goto LABEL_18;
    }
    id v9 = @"RESTRICTED";
LABEL_24:
    uint64_t v10 = +[SKUIClientContext localizedStringForKey:v9 inBundles:0 inTable:@"Download"];
    goto LABEL_25;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4FA8520]])
  {
    if (v4)
    {
      uint64_t v6 = @"TAP_TO_RESUME";
      goto LABEL_18;
    }
    id v9 = @"TAP_TO_RESUME";
    goto LABEL_24;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4FA8530]])
  {
    if (v4)
    {
      uint64_t v6 = @"WAITING";
      goto LABEL_18;
    }
    id v9 = @"WAITING";
    goto LABEL_24;
  }
  uint64_t v11 = [v3 valueForExternalProperty:*MEMORY[0x1E4FA8468]];
  if (![v11 length])
  {
    if (([v5 isEqualToString:*MEMORY[0x1E4FA84F0]] & 1) == 0) {
      goto LABEL_40;
    }
    uint64_t v15 = [v3 valueForExternalProperty:*MEMORY[0x1E4FA8448]];
    uint64_t v16 = [v15 longLongValue];

    uint64_t v17 = [v3 valueForExternalProperty:*MEMORY[0x1E4FA8450]];
    uint64_t v18 = [v17 longLongValue];

    uint64_t v19 = [v3 valueForExternalProperty:*MEMORY[0x1E4FA8460]];
    [v19 doubleValue];
    double v21 = v20;

    BOOL v22 = v16 < 1 || v18 < 1;
    if (v22 && v21 < 0.01)
    {
      if (v4)
      {
        uint64_t v23 = @"UNKNOWN_PROGRESS";
LABEL_42:
        id v12 = [v4 localizedStringForKey:v23 inTable:@"Download"];
        goto LABEL_49;
      }
      uint64_t v24 = @"UNKNOWN_PROGRESS";
      goto LABEL_48;
    }
    if (v16 >= v18 && v21 >= 1.0)
    {
LABEL_40:
      if (v4)
      {
        uint64_t v23 = @"PROCESSING_DOWNLOAD";
        goto LABEL_42;
      }
      uint64_t v24 = @"PROCESSING_DOWNLOAD";
LABEL_48:
      id v12 = +[SKUIClientContext localizedStringForKey:v24 inBundles:0 inTable:@"Download"];
      goto LABEL_49;
    }
    uint64_t v25 = [v3 valueForExternalProperty:*MEMORY[0x1E4FA8458]];
    [v25 doubleValue];
    double v27 = v26;

    if (v27 < 0.0)
    {
      uint64_t v28 = [MEMORY[0x1E4F28B68] stringFromByteCount:v16 countStyle:1];
      uint64_t v29 = [MEMORY[0x1E4F28B68] stringFromByteCount:v18 countStyle:0];
      if (v4) {
        [v4 localizedStringForKey:@"DATA_PROGRESS" inTable:@"Download"];
      }
      else {
      id v32 = +[SKUIClientContext localizedStringForKey:@"DATA_PROGRESS" inBundles:0 inTable:@"Download"];
      }
      uint64_t v13 = [NSString stringWithValidatedFormat:v32, @"%@%@", 0, v28, v29 validFormatSpecifiers error];

      goto LABEL_50;
    }
    uint64_t v30 = v16 & ~(v16 >> 63);
    if (v30 <= v18) {
      uint64_t v31 = v18;
    }
    else {
      uint64_t v31 = v16 & ~(v16 >> 63);
    }
    if (v4) {
      [v4 localizedStringForKey:@"TIME_FORMAT" inTable:@"Download"];
    }
    else {
    id v33 = +[SKUIClientContext localizedStringForKey:@"TIME_FORMAT" inBundles:0 inTable:@"Download"];
    }
    id v34 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v33, @"%d%d", 0, v27 / 0x3CuLL, v27 % 0x3C);
    if (v16 < 1 || !v31)
    {
      if (v4) {
        [v4 localizedStringForKey:@"PERCENTAGE_PROGRESS" inTable:@"Download"];
      }
      else {
      double v39 = +[SKUIClientContext localizedStringForKey:@"PERCENTAGE_PROGRESS" inBundles:0 inTable:@"Download"];
      }
      uint64_t v13 = [NSString stringWithValidatedFormat:v39, @"%ld%@", 0, (uint64_t)(v21 * 100.0), v34 validFormatSpecifiers error];
      goto LABEL_75;
    }
    uint64_t v43 = v33;
    uint64_t v35 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v36 = [v35 userInterfaceIdiom];

    if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (v4)
      {
        uint64_t v37 = @"TIME_PROGRESS_LONG";
LABEL_68:
        uint64_t v38 = [v4 localizedStringForKey:v37 inTable:@"Download"];
LABEL_74:
        double v39 = (void *)v38;
        double v41 = [MEMORY[0x1E4F28B68] stringFromByteCount:v30 countStyle:1];
        uint64_t v42 = [MEMORY[0x1E4F28B68] stringFromByteCount:v31 countStyle:0];
        uint64_t v13 = [NSString stringWithValidatedFormat:v39, @"%@%@%@", 0, v41, v42, v34 validFormatSpecifiers error];

        id v33 = v43;
LABEL_75:

        goto LABEL_50;
      }
      uint64_t v40 = @"TIME_PROGRESS_LONG";
    }
    else
    {
      if (v4)
      {
        uint64_t v37 = @"TIME_PROGRESS";
        goto LABEL_68;
      }
      uint64_t v40 = @"TIME_PROGRESS";
    }
    uint64_t v38 = +[SKUIClientContext localizedStringForKey:v40 inBundles:0 inTable:@"Download"];
    goto LABEL_74;
  }
  id v12 = v11;
LABEL_49:
  uint64_t v13 = v12;
LABEL_50:

LABEL_26:

  return v13;
}

void sub_1C1AE503C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1AE530C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
}

void *__Block_byref_object_copy__50(uint64_t a1, uint64_t a2)
{
  __n128 result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
}

void sub_1C1AEB9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AEC14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AEC55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AEC790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

id SKUIReuseIdentifierForView(void *a1)
{
  return objc_getAssociatedObject(a1, "com.apple.StoreKitUI.viewReuse.ID");
}

void sub_1C1AEDE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1AF26E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AF2C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1AF3A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1C1AF3FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

id SKUIFontForTextStyle(uint64_t a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIFontForTextStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = _SKUIFontDescriptorGetFontForTextStyle(a1, (void *)*MEMORY[0x1E4FB27D0]);

  return v10;
}

id _SKUIFontDescriptorGetFontForTextStyle(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1 - 1;
  uint64_t v5 = 0;
  double v6 = 1.0;
  char v7 = 1;
  uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24808];
  switch(v4)
  {
    case 0:
      goto LABEL_34;
    case 1:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24848];
      goto LABEL_34;
    case 2:
      uint64_t v5 = 0;
      goto LABEL_7;
    case 3:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_7:
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24810];
      goto LABEL_34;
    case 4:
      uint64_t v5 = 0;
      goto LABEL_10;
    case 5:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_10:
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24818];
      goto LABEL_34;
    case 6:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24850];
      goto LABEL_34;
    case 7:
      uint64_t v5 = 0;
      goto LABEL_14;
    case 8:
      char v7 = 0;
      uint64_t v5 = 0x8000;
LABEL_14:
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24820];
      goto LABEL_34;
    case 9:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24820];
      double v6 = 0.909090909;
      goto LABEL_34;
    case 10:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24828];
      goto LABEL_34;
    case 11:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24858];
      goto LABEL_34;
    case 12:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24838];
      goto LABEL_34;
    case 13:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24860];
      goto LABEL_34;
    case 14:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24878];
      goto LABEL_34;
    case 15:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24870];
      goto LABEL_34;
    case 16:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24868];
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
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24870];
      double v6 = 0.933333333;
      goto LABEL_34;
    case 21:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24838];
      double v6 = 2.05882353;
      goto LABEL_34;
    case 22:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24838];
      double v6 = 1.35294118;
      goto LABEL_34;
    case 23:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24838];
      double v6 = 1.29411765;
      goto LABEL_34;
    case 24:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24838];
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
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24838];
      double v6 = 1.05882353;
      goto LABEL_34;
    case 28:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24888];
      goto LABEL_34;
    case 29:
      uint64_t v5 = 0;
      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F24890];
LABEL_34:
      uint64_t v9 = *v8;
      if (!*v8) {
        goto LABEL_44;
      }
      if (_SKUIFontDescriptorGetCache_onceToken != -1) {
        dispatch_once(&_SKUIFontDescriptorGetCache_onceToken, &__block_literal_global_34);
      }
      id v10 = (id)_SKUIFontDescriptorGetCache_fontDescriptorCache;
      uint64_t v11 = [[_SKUIFontDescriptorCacheKey alloc] initWithTextStyle:v9 sizeCategory:v3];
      id v12 = [v10 objectForKey:v11];
      if (!v12)
      {
        uint64_t v13 = (void *)CTFontDescriptorCreateWithTextStyle();
        id v14 = v13;
        if ((v7 & 1) == 0)
        {
          uint64_t v15 = [v13 fontDescriptorWithSymbolicTraits:v5];

          id v14 = (void *)v15;
        }
        uint64_t v29 = *MEMORY[0x1E4FB0910];
        uint64_t v16 = *MEMORY[0x1E4FB0960];
        v26[0] = *MEMORY[0x1E4FB0968];
        v26[1] = v16;
        v27[0] = &unk_1F1D61DA8;
        v27[1] = &unk_1F1D61DC0;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        uint64_t v28 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        v30[0] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        id v12 = [v14 fontDescriptorByAddingAttributes:v19];

        [v10 setObject:v12 forKey:v11];
      }
      double v20 = 0.0;
      if (fabs(v6) >= 2.22044605e-16)
      {
        double v21 = [v12 objectForKey:*MEMORY[0x1E4FB0920]];
        [v21 floatValue];
        float v23 = v6 * v22;
        double v20 = ceilf(v23);
      }
      uint64_t v24 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:v20];

      break;
    default:
LABEL_44:
      uint64_t v24 = 0;
      break;
  }

  return v24;
}

id SKUIFontLimitedPreferredFontForTextStyle(uint64_t a1, uint64_t a2)
{
  v23[13] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        SKUIFontLimitedPreferredFontForTextStyle_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  id v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v13 = [v12 preferredContentSizeCategory];

  id v14 = v13;
  uint64_t v15 = (void *)*MEMORY[0x1E4FB27D0];
  char v16 = [v14 isEqualToString:*MEMORY[0x1E4FB27D0]];
  uint64_t v17 = (id *)MEMORY[0x1E4FB27D8];
  if (v16)
  {
    uint64_t v18 = 4;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB27D8]])
  {
    uint64_t v18 = 3;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB27C0]])
  {
    uint64_t v18 = 5;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB27E8]])
  {
    uint64_t v18 = 2;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB27B8]])
  {
    uint64_t v18 = 6;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB27B0]])
  {
    uint64_t v18 = 7;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB27C8]])
  {
    uint64_t v18 = 1;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB2798]])
  {
    uint64_t v18 = 8;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB2790]])
  {
    uint64_t v18 = 9;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB2788]])
  {
    uint64_t v18 = 10;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB2780]])
  {
    uint64_t v18 = 11;
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FB2778]])
  {
    uint64_t v18 = 12;
  }
  else
  {
    uint64_t v18 = 4;
  }

  if (v18 <= a2)
  {
    id v19 = v14;
  }
  else
  {
    v23[0] = 0;
    v23[1] = (id)*MEMORY[0x1E4FB27C8];
    v23[2] = (id)*MEMORY[0x1E4FB27E8];
    v23[3] = *v17;
    v23[4] = v15;
    v23[5] = (id)*MEMORY[0x1E4FB27C0];
    v23[6] = (id)*MEMORY[0x1E4FB27B8];
    v23[7] = (id)*MEMORY[0x1E4FB27B0];
    v23[8] = (id)*MEMORY[0x1E4FB2798];
    v23[9] = (id)*MEMORY[0x1E4FB2790];
    v23[10] = (id)*MEMORY[0x1E4FB2788];
    v23[11] = (id)*MEMORY[0x1E4FB2780];
    v23[12] = (id)*MEMORY[0x1E4FB2778];
    id v19 = (id)v23[a2];
    for (uint64_t i = 12; i != -1; --i)
  }
  double v21 = _SKUIFontDescriptorGetFontForTextStyle(a1, v19);

  return v21;
}

id SKUIFontPreferredFontForTextStyle(uint64_t a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIFontPreferredFontForTextStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v11 = [v10 preferredContentSizeCategory];

  id v12 = _SKUIFontDescriptorGetFontForTextStyle(a1, v11);

  return v12;
}

void sub_1C1AF9CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C1AFAC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUIButtonViewTypeForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIButtonViewTypeForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ([v1 isEqualToString:@"buy"])
  {
    uint64_t v10 = 2;
  }
  else if ([v1 isEqualToString:@"download"])
  {
    uint64_t v10 = 3;
  }
  else if ([v1 isEqualToString:@"link"])
  {
    uint64_t v10 = 7;
  }
  else if ([v1 isEqualToString:@"image"])
  {
    uint64_t v10 = 5;
  }
  else if ([v1 isEqualToString:@"imagetext"])
  {
    uint64_t v10 = 6;
  }
  else
  {
    if ([v1 isEqualToString:@"textonly"]) {
      goto LABEL_16;
    }
    if ([v1 isEqualToString:@"done"])
    {
      uint64_t v10 = 8;
      goto LABEL_33;
    }
    if ([v1 isEqualToString:@"sample"])
    {
      uint64_t v10 = 4;
      goto LABEL_33;
    }
    if ([v1 isEqualToString:@"back"])
    {
      uint64_t v10 = 1;
      goto LABEL_33;
    }
    if ([v1 isEqualToString:@"cancel"])
    {
      uint64_t v10 = 10;
      goto LABEL_33;
    }
    if ([v1 isEqualToString:@"destructive"])
    {
      uint64_t v10 = 11;
      goto LABEL_33;
    }
    if ([v1 isEqualToString:@"disabled"])
    {
LABEL_16:
      uint64_t v10 = 9;
    }
    else if ([v1 isEqualToString:@"play"])
    {
      uint64_t v10 = 12;
    }
    else if ([v1 isEqualToString:@"thin"])
    {
      uint64_t v10 = 13;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
LABEL_33:

  return v10;
}

void sub_1C1AFB098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
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

BOOL SKUIIKViewElementTypeIsButton(unint64_t a1)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUIIKViewElementTypeIsButton_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  BOOL result = 1;
  if (a1 > 0x32 || ((1 << a1) & 0x4000000003000) == 0) {
    return a1 == 141;
  }
  return result;
}

void sub_1C1AFC0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B00C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B01538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B01BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B02AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void SKUIInitializeViewElementStyleFactory()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIInitializeViewElementStyleFactory_cold_1();
  }
  if (SKUIInitializeViewElementStyleFactory___onceToken != -1) {
    dispatch_once(&SKUIInitializeViewElementStyleFactory___onceToken, &__block_literal_global_36);
  }
}

uint64_t __SKUIInitializeViewElementStyleFactory_block_invoke()
{
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-lockup-min-width" withType:1 inherited:0];
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-shelf-layout" withType:3 inherited:0];
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-shelf-zooming-layout-peeking-item-width" withType:1 inherited:0];
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-shelf-zooming-layout-inter-item-spacing" withType:1 inherited:0];
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-shelf-zooming-layout-item-width" withType:1 inherited:0];
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-shelf-zooming-layout-zoomed-item-width" withType:1 inherited:0];
  [MEMORY[0x1E4F6F1A8] registerStyle:@"itml-shelf-zooming-layout-element-placement" withType:3 inherited:0];
  uint64_t v0 = (void *)MEMORY[0x1E4F6F1A8];

  return [v0 registerStyle:@"itml-segmented-control-width" withType:3 inherited:0];
}

void sub_1C1B0451C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
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

void sub_1C1B07D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1C1B093BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56(uint64_t a1)
{
}

void sub_1C1B0A5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B0ABA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1B0ACFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B0AE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B1075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIWishlistItemPropertiesWithItem(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIWishlistItemPropertiesWithItem_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [v1 cacheRepresentation];
  uint64_t v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:0];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [v12 setObject:v11 forKey:*MEMORY[0x1E4FA89C0]];
    uint64_t v13 = [v1 itemIdentifier];
    uint64_t v14 = [NSNumber numberWithLongLong:v13];
    [v12 setObject:v14 forKey:*MEMORY[0x1E4FA89C8]];

    uint64_t v15 = [v1 itemKindString];
    if (v15) {
      [v12 setObject:v15 forKey:*MEMORY[0x1E4FA89D0]];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id SKUIWishlistOperationQueue()
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        SKUIWishlistOperationQueue_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
      }
    }
  }
  uint64_t v8 = (void *)SKUIWishlistOperationQueue_sQueue;
  if (!SKUIWishlistOperationQueue_sQueue)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v10 = (void *)SKUIWishlistOperationQueue_sQueue;
    SKUIWishlistOperationQueue_sQueue = (uint64_t)v9;

    [(id)SKUIWishlistOperationQueue_sQueue setMaxConcurrentOperationCount:1];
    [(id)SKUIWishlistOperationQueue_sQueue setName:@"com.apple.StoreKitUI.SSWishlist"];
    uint64_t v8 = (void *)SKUIWishlistOperationQueue_sQueue;
  }

  return v8;
}

void sub_1C1B10C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B11DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B1345C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B13538(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1B13880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B13984(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1B13C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUITracklistAttributedStringForButton(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        SKUITracklistAttributedStringForButton_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  uint64_t v14 = [v4 buttonTitleStyle];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v4 style];
  }
  uint64_t v17 = v16;

  uint64_t v18 = SKUIViewElementFontWithStyle(v17);
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x1E4FB08E0] fontWithName:@"HelveticaNeue-Medium" size:9.0];
  }
  id v19 = [v5 tintColor];
  double v20 = SKUIViewElementPlainColorWithStyle(v17, v19);

  if (!v20)
  {
    double v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  }
  double v21 = [v4 buttonText];
  float v22 = [v21 attributedStringWithDefaultFont:v18 foregroundColor:v20 textAlignment:1 style:v17];

  return v22;
}

id SKUITracklistAttributedStringForLabel(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        SKUITracklistAttributedStringForLabel_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  id v16 = [v6 style];
  uint64_t v17 = SKUIViewElementFontWithStyle(v16);
  uint64_t v18 = [v7 tintColor];

  id v19 = SKUIViewElementPlainColorWithStyle(v16, v18);

  if (v5 && !v19)
  {
    if ([v5 isEnabled])
    {
      id v19 = 0;
    }
    else
    {
      id v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    }
  }
  unint64_t v20 = [v6 labelViewStyle];
  if (v20 <= 5)
  {
    if (((1 << v20) & 0xB) != 0)
    {
      if (!v17)
      {
        uint64_t v17 = SKUIFontPreferredFontForTextStyle(5);
        if (v19) {
          goto LABEL_25;
        }
        goto LABEL_18;
      }
LABEL_17:
      if (v19) {
        goto LABEL_25;
      }
      goto LABEL_18;
    }
    if (((1 << v20) & 0x24) != 0)
    {
      if (v17) {
        goto LABEL_17;
      }
      float v22 = SKUIFontForTextStyle(21);
      float v23 = (void *)MEMORY[0x1E4FB08E0];
      [v22 pointSize];
      uint64_t v17 = objc_msgSend(v23, "fontWithName:size:", @"HelveticaNeue-Medium");

      if (!v19)
      {
LABEL_18:
        uint64_t v21 = [MEMORY[0x1E4FB1618] blackColor];
LABEL_19:
        id v19 = (void *)v21;
      }
    }
    else
    {
      if (!v17)
      {
        uint64_t v17 = SKUIFontPreferredFontForTextStyle(5);
      }
      if (!v19)
      {
        uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
        goto LABEL_19;
      }
    }
  }
LABEL_25:
  uint64_t v24 = [v6 text];
  uint64_t v25 = [v24 attributedStringWithDefaultFont:v17 foregroundColor:v19 style:v16];

  return v25;
}

void sub_1C1B14674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B15500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1B15774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B15A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B15F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B16C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUITabBarControllerGetActiveNavigationController(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 selectedViewController];
  uint64_t v3 = [v1 transientViewController];
  if (!v3)
  {
    if (!v2)
    {
      id v9 = 0;
      goto LABEL_22;
    }
    id v5 = SKUITabBarControllerGetMoreNavigationController(v1);
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
          uint64_t v12 = [v9 visibleViewController];
          uint64_t v13 = [v12 childViewController];
          objc_opt_class();
          char v14 = objc_opt_isKindOfClass();

          if (v14)
          {
            uint64_t v15 = [v12 childViewController];
            id v16 = [v15 leftNavigationDocumentController];
            uint64_t v24 = [v16 navigationController];

            uint64_t v17 = [v15 rightNavigationDocumentController];
            uint64_t v18 = [v17 navigationController];

            id v19 = v18;
            if (v18 || (id v19 = v24) != 0)
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

id SKUITabBarControllerGetMoreNavigationController(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 moreNavigationController];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id SKUITabBarControllerGetFloatingOverlayViewController(void *a1)
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

void SKUITabBarControllerSetFloatingOverlayViewControllerAnimated(void *a1, void *a2, uint64_t a3)
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

void sub_1C1B1E02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B20448(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B20C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C1B235D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t __Block_byref_object_copy__60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__60(uint64_t a1)
{
}

void sub_1C1B2464C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B24E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C1B24FA4(_Unwind_Exception *a1)
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
  *(void *)((char *)this + 293) = 0;
  *((void *)this + 36) = 0;
}

void sub_1C1B25C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1B25E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SKUIShareSheetActivityTypeForUIActivityType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F43590]])
  {
    uint64_t v2 = @"airdrop";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F435D0]])
  {
    uint64_t v2 = @"facebook";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F435B0]])
  {
    uint64_t v2 = @"mail";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F435C0]])
  {
    uint64_t v2 = @"message";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F435A0]])
  {
    uint64_t v2 = @"pasteboard";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F435F8]])
  {
    uint64_t v2 = @"sina-weibo";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F435E0]])
  {
    uint64_t v2 = @"tencent-weibo";
  }
  else
  {
    uint64_t v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_1C1B28F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B29408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1C1B2A8FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B2AB9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B2D74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__62(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{
}

void sub_1C1B2FEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
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

void sub_1C1B302B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B308CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B30BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id SKUIStringFromProductLockupLayoutSizing(CGSize *a1)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIStringFromProductLockupLayoutSizing_cold_1();
  }
  uint64_t v2 = NSString;
  uint64_t v3 = NSStringFromCGSize(a1[3]);
  id v4 = NSStringFromCGSize(a1[4]);
  id v5 = NSStringFromCGSize(a1[2]);
  id v6 = NSStringFromCGSize(*a1);
  id v7 = NSStringFromCGSize(a1[1]);
  unint64_t v8 = [v2 stringWithFormat:@"{ Top-Left: %@, Top-Right: %@, Middle-Left: %@, Bottom-Left: %@, Bottom-Right: %@ }", v3, v4, v5, v6, v7];

  return v8;
}

void sub_1C1B31778(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B31A24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C1B3231C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B3286C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C1B35018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B358AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1B36FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B37268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B376EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1C1B379A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B37EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B380D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIViewControllerIsVisible(void *a1)
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
  uint64_t v3 = [v2 window];
  if (v3) {
    uint64_t v4 = [v2 isHidden] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

id SKUIViewControllerGetAncestorTabBarController(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 tabBarController];
  if ([v2 conformsToProtocol:&unk_1F1DDE008])
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
    while (v3 && ![v3 conformsToProtocol:&unk_1F1DDE008]);
  }

  return v3;
}

id SKUIViewControllerGetTopMostViewController(void *a1)
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

BOOL SKUIViewControllerIsDescendent(void *a1, void *a2)
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
        unint64_t v8 = v7;
        id v7 = [v7 parentViewController];
      }
      while (v7 && v7 != v4);
    }
  }

  return v7 == v4;
}

void sub_1C1B3D4BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B3E444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1C1B3EEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

uint64_t __Block_byref_object_copy__65(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
}

void sub_1C1B3F32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B3F670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C1B42FB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B45350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B45F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1B46330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B46828(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B474C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void *__Block_byref_object_copy__67(uint64_t a1, uint64_t a2)
{
  BOOL result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__67(uint64_t a1)
{
}

void sub_1C1B49F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__5_0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6_0(uint64_t a1)
{
}

void sub_1C1B4A3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B4E860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B50540(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 168));
  _Unwind_Resume(a1);
}

void sub_1C1B511F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C1B51D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B52034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1B5460C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B54C10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

BOOL SKUINearMeIsEnabledForAuthorizationStatus(int a1)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUINearMeIsEnabledForAuthorizationStatus_cold_1();
  }
  return (a1 - 3) < 2;
}

BOOL SKUILocationIsAccurate(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUILocationIsAccurate_cold_1();
  }
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

void sub_1C1B56B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIItemCollectionItemPageRangeForCollectionView(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = objc_msgSend(v5, "indexPathForItemAtPoint:", a2, a3);
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

uint64_t SKUIItemCollectionItemPageRangeForTableView(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = objc_msgSend(v5, "indexPathForRowAtPoint:", a2, a3);
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

uint64_t SKUIItemCollectionVisibleItemRangeForCollectionView(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 indexPathsForVisibleItems];
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

uint64_t SKUIItemCollectionVisibleItemRangeForTableView(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 indexPathsForVisibleRows];
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

void sub_1C1B5A168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B5A368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__70(uint64_t a1)
{
}

void *__Block_byref_object_copy__5_1(uint64_t a1, uint64_t a2)
{
  BOOL result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6_1(uint64_t a1)
{
}

void sub_1C1B5B298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B5DEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B5DFE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1B5E908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__71(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__71(uint64_t a1)
{
}

void sub_1C1B5ED4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B5EFFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1B6012C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1B61368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B61680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B647AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B65270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B66950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

id getAMSURLParserClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  BOOL v0 = (void *)getAMSURLParserClass_softClass_0;
  uint64_t v7 = getAMSURLParserClass_softClass_0;
  if (!getAMSURLParserClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAMSURLParserClass_block_invoke_0;
    v3[3] = &unk_1E6424310;
    v3[4] = &v4;
    __getAMSURLParserClass_block_invoke_0((uint64_t)v3);
    BOOL v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C1B66A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAMSURLParserClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSURLParser");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSURLParserClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSURLParserClass_block_invoke_cold_1();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6428C60;
    uint64_t v3 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  BOOL v0 = (void *)v1[0];
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
  {
    BOOL v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

SKUIWishlistViewController *__getAMSBagClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  uint64_t result = (SKUIWishlistViewController *)objc_getClass("AMSBag");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSBagClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SKUIWishlistViewController *)__getAMSBagClass_block_invoke_cold_1();
    return [(SKUIWishlistViewController *)v3 initWithNibName:v5 bundle:v6];
  }
  return result;
}

void __AccountsChanged(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____AccountsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void sub_1C1B69014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B694C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B6A37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B6AD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
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

void sub_1C1B6C9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1B6E1C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C1B6F8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B6FB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B70C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id SKUIRequiredVisibilitySetForLocalizedIndexedCollation()
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        SKUIRequiredVisibilitySetForLocalizedIndexedCollation_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
      }
    }
  }
  uint64_t v8 = [MEMORY[0x1E4FB1960] currentCollation];
  uint64_t v9 = [v8 sectionIndexTitles];
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        int v18 = [&unk_1F1D620D8 containsObject:v17];
        if (v18 & 1) != 0 || ((v14 ^ 1))
        {
          v14 |= v18 ^ 1;
          [v10 addObject:v17];
        }
        else
        {
          int v14 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = objc_msgSend(v11, "reverseObjectEnumerator", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    int v22 = 0;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        int v26 = [&unk_1F1D620D8 containsObject:v25];
        if (v26 & 1) != 0 || ((v22 ^ 1))
        {
          v22 |= v26 ^ 1;
          [v10 addObject:v25];
        }
        else
        {
          int v22 = 1;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  return v10;
}

id SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  long long v10 = [NSString stringWithFormat:@"systemBucketID-%@", v1];

  return v10;
}

void sub_1C1B72AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIInitializeViewElementFactory()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIInitializeViewElementFactory_cold_1();
  }
  if (SKUIInitializeViewElementFactory_sOnce != -1) {
    dispatch_once(&SKUIInitializeViewElementFactory_sOnce, &__block_literal_global_44);
  }
}

uint64_t __SKUIInitializeViewElementFactory_block_invoke()
{
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"accountButtons" elementType:1];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"actions" elementType:3];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"activity" elementType:116];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"activityIndicator" elementType:4];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"asset" elementType:5];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"background" elementType:7];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"backgroundImage" elementType:49];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"badge" elementType:8];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"b" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"browse" elementType:10];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"br" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"button" elementType:12];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"card" elementType:14];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"carousel" elementType:15];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"circle" elementType:59];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"collectionList" elementType:20];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"column" elementType:21];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"content" elementType:26];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"commentTemplate" elementType:25];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"contentUnavailable" elementType:27];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"counter" elementType:28];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"countLimit" elementType:60];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"date" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"decorationImage" elementType:29];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"templateDefinition" elementType:136];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"description" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"divider" elementType:32];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"duration" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"entityProviderList" elementType:35];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"expand" elementType:36];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"facebook" elementType:38];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"filterBar" elementType:40];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"footer" elementType:41];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"fullscreenImg" elementType:42];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"grid" elementType:45];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"group" elementType:46];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"header" elementType:48];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"i" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"imageDeck" elementType:51];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"imageGrid" elementType:154];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"img" elementType:49];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"indexBar" elementType:53];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"indexBarEntry" elementType:54];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"indexBarEntryList" elementType:55];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"info" elementType:56];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"infoList" elementType:57];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"input" elementType:58];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"item" elementType:59];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"label" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"limitList" elementType:61];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"list" elementType:62];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"lockup" elementType:66];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"menu" elementType:69];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"menuBar" elementType:70];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"menuItem" elementType:72];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"nativeViewPlaceholderTemplate" elementType:73];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"navigationBar" elementType:74];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"navigationTitle" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"nearByApps" elementType:76];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"notice" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"number" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"offer" elementType:77];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"option" elementType:59];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"ordinal" elementType:80];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"palette" elementType:75];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"placeholder" elementType:86];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"popularity" elementType:9];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"predicateList" elementType:89];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"previewControl" elementType:90];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"progressIndicator" elementType:95];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"propertyPredicate" elementType:88];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"pullToRefresh" elementType:99];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"response" elementType:102];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"reviewList" elementType:104];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"review" elementType:103];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"row" elementType:105];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"section" elementType:108];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"segmentedBar" elementType:109];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"segmentedControl" elementType:109];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"select" elementType:69];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"settingsEditProfile" elementType:111];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"settingsFamily" elementType:112];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"settingsField" elementType:113];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"settingsProfile" elementType:114];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"shelf" elementType:118];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"signInControl" elementType:120];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"socialActivities" elementType:123];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"sortDescriptor" elementType:125];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"sortDescriptorList" elementType:126];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"spacer" elementType:127];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"stackList" elementType:131];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"span" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"split" elementType:128];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"starBar" elementType:133];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"starHistogram" elementType:134];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"starRating" elementType:135];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"subtitle" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"text" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"title" elementType:138];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"tomatoRating" elementType:144];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"toolbar" elementType:145];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"track" elementType:146];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"trackList" elementType:147];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"url" elementType:151];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"video" elementType:152];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"adFeedback" elementType:108];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"reason" elementType:59];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"charityTemplate" elementType:16];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"chartsTemplate" elementType:17];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"contentUnavailableTemplate" elementType:27];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"dialogTemplate" elementType:31];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"editorTemplate" elementType:34];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"exploreTemplate" elementType:37];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"familySetupTemplate" elementType:39];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"giftTemplate" elementType:44];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"loadingTemplate" elementType:65];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"reportAConcernTemplate" elementType:101];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"settingsTemplate" elementType:115];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"signInTemplate" elementType:121];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"menuBarTemplate" elementType:71];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"onboardingTemplate" elementType:85];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"panelTemplate" elementType:83];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"playlist" elementType:87];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"physicalCirclesTemplate" elementType:85];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"previewTemplate" elementType:91];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"productTemplate" elementType:93];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"redeemTemplate" elementType:98];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"shareTemplate" elementType:117];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"splitViewTemplate" elementType:129];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"stackTemplate" elementType:132];
  [MEMORY[0x1E4F6F198] registerClass:objc_opt_class() forElementName:@"trendingSearchTemplate" elementType:148];
  BOOL v0 = (void *)MEMORY[0x1E4F6F198];
  uint64_t v1 = objc_opt_class();

  return [v0 registerClass:v1 forElementName:@"writeAReviewTemplate" elementType:153];
}

void sub_1C1B76CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B78754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1C1B794F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B799A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B7A59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B7AA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
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

SKUIMessageBanner *SKUIFamilyAlertMessageBanner(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v71 = a2;
  uint64_t v5 = +[SKUIFamilyCircleController sharedController];
  uint64_t v6 = [v5 iCloudFamily];
  v66 = v5;
  uint64_t v7 = [v5 familyCircle];
  uint64_t v8 = [MEMORY[0x1E4FA8100] defaultStore];
  v72 = [v8 activeAccount];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v9 = [v6 members];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v73 objects:v97 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v74 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if ([v15 isMe])
        {
          id v16 = v15;

          uint64_t v12 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v73 objects:v97 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
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
    uint64_t v24 = [v72 uniqueIdentifier];
    char v25 = [v23 isEqual:v24];

    if ((v25 & 1) == 0)
    {
      *a3 = 1;
LABEL_36:
      if (v4) {
        [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH"];
      }
      else {
      uint64_t v29 = +[SKUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH" inBundles:0];
      }
      if (v4) {
        [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT"];
      }
      else {
      v68 = +[SKUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT" inBundles:0];
      }
      v64 = [NSString stringWithValidatedFormat:v29, @"%@", 0, v68 validFormatSpecifiers error];
      unsigned int v63 = 0;
      goto LABEL_48;
    }
    int v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v27 = [v26 BOOLForKey:@"SKUIHideFamilyBanner"];

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
  int v18 = [v12 iTunesAccountDSID];
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
    uint64_t v29 = +[SKUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2" inBundles:0];
    }
    if (v4) {
      [v4 localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT"];
    }
    else {
    uint64_t v30 = +[SKUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT" inBundles:0];
    }
    long long v31 = NSString;
    long long v32 = [v12 appleID];
    v68 = (void *)v30;
    v64 = [v31 stringWithValidatedFormat:v29, @"%@%@", 0, v32, v30 validFormatSpecifiers error];

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
      v64 = 0;
      v68 = 0;
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
  uint64_t v29 = +[SKUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE" inBundles:0];
  }
  if (v4) {
    [v4 localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT"];
  }
  else {
  v68 = +[SKUIClientContext localizedStringForKey:@"PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT" inBundles:0];
  }
  v64 = [NSString stringWithValidatedFormat:v29, @"%@", 0, v68 validFormatSpecifiers error];
  *a3 = 3;
  unsigned int v63 = 1;
LABEL_48:
  long long v33 = [MEMORY[0x1E4FA81D8] sharedConfig];
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
  v65 = v6;
  if (v36)
  {
    uint64_t v62 = [v6 members];
    uint64_t v37 = v29;
    uint64_t v38 = [v62 count];
    uint64_t v39 = [v12 iTunesAccountDSID];
    uint64_t v40 = [v72 uniqueIdentifier];
    uint64_t v41 = *a3;
    int v81 = 138414082;
    v82 = v7;
    __int16 v83 = 2112;
    v84 = v6;
    __int16 v85 = 2048;
    uint64_t v86 = v38;
    uint64_t v29 = v37;
    __int16 v87 = 2112;
    v88 = v12;
    __int16 v89 = 2112;
    v90 = v39;
    __int16 v91 = 2112;
    v92 = v72;
    __int16 v93 = 2112;
    uint64_t v94 = v40;
    uint64_t v42 = (void *)v40;
    __int16 v95 = 2048;
    uint64_t v96 = v41;
    LODWORD(v61) = 82;
    uint64_t v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43) {
      goto LABEL_57;
    }
    long long v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v81, v61);
    free(v43);
    SSFileLog();
  }

LABEL_57:
  v70 = (void *)v29;
  if (v29)
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v44 setAlignment:1];
    [v44 setLineBreakMode:4];
    v79[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v45 = v79[0];
    double v46 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    uint64_t v47 = *MEMORY[0x1E4FB0700];
    v80[0] = v46;
    v80[1] = v71;
    uint64_t v48 = *MEMORY[0x1E4FB0738];
    v79[1] = v47;
    v79[2] = v48;
    v80[2] = v44;
    uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];

    v77[0] = v45;
    long long v50 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    v78[0] = v50;
    v77[1] = v47;
    long long v51 = [MEMORY[0x1E4FB1618] blackColor];
    v77[2] = v48;
    v78[1] = v51;
    v78[2] = v44;
    uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];

    long long v53 = v64;
    uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v64 attributes:v52];
    uint64_t v55 = [v64 rangeOfString:v68];
    objc_msgSend(v54, "setAttributes:range:", v49, v55, v56);

    if (v54)
    {
      uint64_t v57 = objc_alloc_init(SKUIMessageBanner);
      [(SKUIMessageBanner *)v57 setAttributedMessage:v54];
      [(SKUIMessageBanner *)v57 setShowsClearButton:v63];
    }
    else
    {
      uint64_t v57 = 0;
    }
    uint64_t v58 = v67;
    uint64_t v59 = v65;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = v67;
    long long v53 = v64;
    uint64_t v59 = v65;
  }

  return v57;
}

void sub_1C1B7BDA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1C1B7C5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B7CF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1B7D1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B7DDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy__76(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{
}

void sub_1C1B7E800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B7F858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_1C1B7FB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B81904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SKUIPageForCollectionView(void *a1)
{
  id v1 = a1;
  [v1 contentOffset];
  double v3 = v2;
  [v1 frame];
  double v5 = v4;

  return llround(v3 / v5);
}

void sub_1C1B88818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B88E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1B89C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1B8AE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B8C9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B8D5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1C1B8EBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B8EDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B8F160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B8F9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

id SKUIPopoverBackdropViewForView(void *a1)
{
  id v1 = a1;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    if (v1) {
      goto LABEL_5;
    }
LABEL_9:
    id v3 = 0;
    goto LABEL_10;
  }
  SKUIPopoverBackdropViewForView_cold_1();
  if (!v1) {
    goto LABEL_9;
  }
LABEL_5:
  double v2 = 0;
  do
  {
    id v3 = v1;

    id v1 = [v3 superview];

    double v2 = v3;
  }
  while (v1);
LABEL_10:
  objc_opt_class();
  double v4 = __ChildViewWithClass(v3);
  objc_opt_class();
  double v5 = __ChildViewWithClass(v4);

  return v5;
}

id __ChildViewWithClass(void *a1)
{
  id v1 = [a1 subviews];
  double v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = [v2 count];
  if (v3 < 1)
  {
LABEL_7:
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [v2 objectAtIndex:v5];
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v7 = [v6 subviews];
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

void sub_1C1B9261C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void SKUIPhysicalCircleConstantsWithTraitCollection(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIPhysicalCircleConstantsWithTraitCollection_cold_1();
  }
  *(_OWORD *)a2 = xmmword_1C1CCC2C0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = xmmword_1C1CCC2D0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(void *)(a2 + 48) = 0x4000000000000000;
  uint64_t v4 = [v3 horizontalSizeClass];
  double v5 = 10.0;
  if (v4 == 2) {
    double v5 = 12.0;
  }
  *(double *)(a2 + 56) = v5;
}

uint64_t SKUIStatusBarAlertStyleFromString(void *a1)
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

id SKUIStatusBarAlertStyleGetColor(void *a1)
{
  switch((unint64_t)a1)
  {
    case 0uLL:
      a1 = objc_msgSend(MEMORY[0x1E4FB1618], "systemBlueColor", v1);
      goto LABEL_9;
    case 1uLL:
      a1 = objc_msgSend(MEMORY[0x1E4FB1618], "systemGreenColor", v1);
      goto LABEL_9;
    case 2uLL:
      a1 = objc_msgSend(MEMORY[0x1E4FB1618], "systemRedColor", v1);
      goto LABEL_9;
    case 3uLL:
      a1 = objc_msgSend(MEMORY[0x1E4FB1618], "systemPurpleColor", v1);
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

void sub_1C1B999EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_1C1B9A4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1C1B9A770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1B9CAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C1B9CC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B9E30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1C1B9E4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B9ED38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v14 - 96));
  _Unwind_Resume(a1);
}

void sub_1C1B9F514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1B9FD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BA12C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BA1974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak((id *)(v41 - 248));
  _Unwind_Resume(a1);
}

id SKUIMessageBannerAttributedString(void *a1, void *a2)
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIMessageBannerAttributedString_cold_1();
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v5 setAlignment:1];
  [v5 setLineBreakMode:4];
  v23[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v6 = v23[0];
  uint64_t v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v24[0] = v7;
  v24[1] = v4;
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  v23[1] = v8;
  v23[2] = v9;
  void v24[2] = v5;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  v21[0] = v6;
  uint64_t v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  v22[0] = v11;
  v21[1] = v8;
  uint64_t v12 = [MEMORY[0x1E4FB1618] blackColor];
  v21[2] = v9;
  v22[1] = v12;
  v22[2] = v5;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (v3) {
    [v3 localizedStringForKey:@"ASK_PERMISSION_MESSAGE" inTable:@"ProductPage"];
  }
  else {
  uint64_t v14 = +[SKUIClientContext localizedStringForKey:@"ASK_PERMISSION_MESSAGE" inBundles:0 inTable:@"ProductPage"];
  }
  if (v3) {
    [v3 localizedStringForKey:@"ASK_PERMISSION_MESSAGE_HIGHLIGHT" inTable:@"ProductPage"];
  }
  else {
  uint64_t v15 = +[SKUIClientContext localizedStringForKey:@"ASK_PERMISSION_MESSAGE_HIGHLIGHT" inBundles:0 inTable:@"ProductPage"];
  }
  uint64_t v16 = [NSString stringWithValidatedFormat:v14, @"%@", 0, v15 validFormatSpecifiers error];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v16 attributes:v13];
  uint64_t v18 = [v16 rangeOfString:v15];
  objc_msgSend(v17, "setAttributes:range:", v10, v18, v19);

  return v17;
}

void sub_1C1BA4ED0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1BA5800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1C1BAB620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BAC3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1C1BAC714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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
  id v3 = (void *)*((void *)this + 1);
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
            int v26 = (double *)(*(void *)this + v14);
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
      id v3 = (unsigned char *)result;
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
            char v20 = (char *)__p;
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
            *id v5 = v9;
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
                int v26 = (void *)(*(void *)this + v24);
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
                  void v44[2] = v29;
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
                uint64_t v43 = (_OWORD *)(*(void *)this + 32 * v39);
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

void sub_1C1BAD278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ImageAnalyzer::PickBackgroundColor(ITColor *this)
{
  double var3 = this[11].var3;
  id v3 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
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
  long long v5 = &xmmword_1C1CCC000;
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
      long long v5 = &xmmword_1C1CCC000;
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
    long long v5 = &xmmword_1C1CCC000;
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
  long long v5 = &xmmword_1C1CCC000;
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
  uint64_t v52 = (long long *)&this[2];
  double v54 = this[2].var1;
  double v53 = this[2].var2;
  double v55 = this[2].var3;
  uint64_t v56 = (long long *)&this[3];
  double v57 = *((double *)v5 + 101);
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
        id v71 = &ITColor::kWhite;
        goto LABEL_46;
      }
      long long v76 = &ITColor::kWhite;
    }
    else
    {
      if (v4)
      {
        double v67 = this[1].var0;
        double v68 = this[1].var1;
        double v69 = this[1].var2;
        double v70 = this[1].var3;
        id v71 = &ITColor::kBlack;
LABEL_46:
        double BlendedColorWithFraction = ITColor::CreateBlendedColorWithFraction((ITColor *)v71, 0.0500000007, *(ITColor *)&v67);
LABEL_50:
        this[2].double var0 = BlendedColorWithFraction;
        this[2].double var1 = v73;
        this[2].double var2 = v74;
        this[2].double var3 = v75;
        goto LABEL_51;
      }
      long long v76 = &ITColor::kBlack;
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
      __int16 v83 = &ITColor::kWhite;
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
  __int16 v83 = &ITColor::kBlack;
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
    *uint64_t v52 = *v56;
    *(_OWORD *)&this[2].double var2 = v92;
    *uint64_t v56 = v91;
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
      *uint64_t v8 = v10;
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
            long long *v23 = *v13;
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

void sub_1C1BAE1C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
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
      _OWORD *v25 = v27;
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

void sub_1C1BAE978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  __cxa_throw(exception, (struct type_info *)off_1E6421DF8, MEMORY[0x1E4FBA1C8]);
}

void sub_1C1BAEBBC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
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
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
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
          *double v14 = *(_OWORD *)a1;
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
          void v26[2] = v37;
        }
        else
        {
          __n128 v27 = *v24;
          __n128 v28 = v24[2];
          v26[1] = v24[1];
          void v26[2] = v28;
          __n128 *v26 = v27;
          __n128 v29 = v36;
          __n128 *v24 = v35;
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
      void v44[2] = v7[2];
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
          void v7[2] = v27;
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
        __n128 *v25 = result;
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
    void v30[2] = v11[2];
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
          void v50[2] = v38;
          long long v40 = *v12;
          long long v41 = v12[2];
          v49[1] = v12[1];
          void v49[2] = v41;
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
      long long *v18 = v27;
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
      long long *v18 = v25;
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
        void v30[2] = v10[2];
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
            void v18[4] = v19;
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
          _OWORD *v22 = v26;
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
  void v60[2] = a2[2];
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
    v52[2] = v45;
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
  v52[2] = v55;
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
      void v50[2] = v55;
      long long v12 = v9[4];
      v49[0] = v9[3];
      v49[1] = v12;
      void v49[2] = v9[5];
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
    long long *v18 = v25;
    do
    {
      v44[0] = v53;
      v44[1] = v54;
      void v44[2] = v55;
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
      v41[2] = v33;
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
      void v44[2] = *(a2 - 1);
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
      v41[2] = v49;
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
      long long *v18 = v19;
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
      v41[2] = a2[-1];
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
    v41[2] = v21;
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
      v52[2] = a2[2];
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
        void v50[2] = *(_OWORD *)(a1 + 32);
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
        v41[2] = *(_OWORD *)(a1 + 32);
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
          *__n128 v14 = v26;
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
      v52[2] = v7[2];
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
          void v7[2] = v14[2];
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
          void v44[2] = v50;
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
        _OWORD *v18 = v22;
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
        void v36[2] = v11[2];
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
            void v21[4] = *(_OWORD *)((char *)v6 + v20);
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
            void v30[2] = *(v21 - 2);
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
          void v27[2] = v34;
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
      void v35[2] = v6[2];
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
          long long *v18 = *(v18 - 4);
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
  void v80[3] = v10;
  long long v11 = a1[1];
  v79[0] = *a1;
  v79[1] = v11;
  long long v12 = a1[3];
  v79[2] = a1[2];
  void v79[3] = v12;
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
    void v78[3] = v28;
    long long v29 = a2[1];
    v77[0] = *a2;
    v77[1] = v29;
    long long v30 = a2[3];
    v77[2] = a2[2];
    void v77[3] = v30;
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
      void v60[2] = v13[2];
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
    *char v13 = v30;
    v13[1] = v31;
    long long v33 = v70;
    long long v34 = v71;
    long long v35 = v73;
    v23[2] = v72;
    _OWORD v23[3] = v35;
    long long *v23 = v33;
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
      v52[2] = *(a2 - 2);
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
      void v22[3] = v26;
      long long *v22 = v23;
      v22[1] = v24;
      do
      {
        long long v30 = v21[6];
        long long v31 = v21[7];
        long long v33 = v21[4];
        long long v32 = v21[5];
        v21 += 4;
        long long v34 = *a3;
        void v50[2] = v30;
        _OWORD v50[3] = v31;
        v50[0] = v33;
        v50[1] = v32;
        v49[0] = v57;
        v49[1] = v58;
        void v49[2] = v59;
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
  *char v13 = v43;
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
      v52[2] = a2[-2];
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
      *char v13 = v17;
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
    void v50[2] = v22[2];
    _OWORD v50[3] = v27;
    __n128 v28 = v21[3];
    __n128 v30 = *v21;
    __n128 v29 = v21[1];
    void v49[2] = v21[2];
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
        void v44[2] = v47;
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
      _OWORD *v40 = v45;
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
    v52[2] = a2[2];
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
      void v50[2] = a1[2];
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

void sub_1C1BB339C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BB65E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1C1BBB504(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C1BBFC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
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

uint64_t SKUICardElementTypeForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUICardElementTypeForString_cold_1();
  }
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

void sub_1C1BC17DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
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

void sub_1C1BC1E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BC4DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIAccountsFramework()
{
  if (SKUIAccountsFramework_sOnce != -1) {
    dispatch_once(&SKUIAccountsFramework_sOnce, &__block_literal_global_52);
  }
  return SKUIAccountsFramework_sHandle;
}

void *__SKUIAccountsFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 1);
  SKUIAccountsFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIAccountsUIFramework()
{
  if (SKUIAccountsUIFramework_sOnce != -1) {
    dispatch_once(&SKUIAccountsUIFramework_sOnce, &__block_literal_global_3);
  }
  return SKUIAccountsUIFramework_sHandle;
}

void *__SKUIAccountsUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI", 1);
  SKUIAccountsUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIAppleAccountFramework()
{
  if (SKUIAppleAccountFramework_sOnce != -1) {
    dispatch_once(&SKUIAppleAccountFramework_sOnce, &__block_literal_global_6);
  }
  return SKUIAppleAccountFramework_sHandle;
}

void *__SKUIAppleAccountFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 1);
  SKUIAppleAccountFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIAppleAccountUIFramework()
{
  if (SKUIAppleAccountUIFramework_sOnce != -1) {
    dispatch_once(&SKUIAppleAccountUIFramework_sOnce, &__block_literal_global_9_0);
  }
  return SKUIAppleAccountUIFramework_sHandle;
}

void *__SKUIAppleAccountUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 1);
  SKUIAppleAccountUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIAskPermissionFramework()
{
  if (SKUIAskPermissionFramework_sOnce != -1) {
    dispatch_once(&SKUIAskPermissionFramework_sOnce, &__block_literal_global_12_0);
  }
  return SKUIAskPermissionFramework_sHandle;
}

void *__SKUIAskPermissionFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/AskPermission.framework/AskPermission", 1);
  SKUIAskPermissionFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIAudioToolboxFramework()
{
  if (SKUIAudioToolboxFramework_sOnce != -1) {
    dispatch_once(&SKUIAudioToolboxFramework_sOnce, &__block_literal_global_15_0);
  }
  return SKUIAudioToolboxFramework_sHandle;
}

void *__SKUIAudioToolboxFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 1);
  SKUIAudioToolboxFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIAVFoundationFramework()
{
  if (SKUIAVFoundationFramework_sOnce != -1) {
    dispatch_once(&SKUIAVFoundationFramework_sOnce, &__block_literal_global_18);
  }
  return SKUIAVFoundationFramework_sHandle;
}

void *__SKUIAVFoundationFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  SKUIAVFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIContactsAutocompleteUIFramework()
{
  if (SKUIContactsAutocompleteUIFramework_sOnce != -1) {
    dispatch_once(&SKUIContactsAutocompleteUIFramework_sOnce, &__block_literal_global_21);
  }
  return SKUIContactsAutocompleteUIFramework_sHandle;
}

void *__SKUIContactsAutocompleteUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/ContactsAutocompleteUI.framework/ContactsAutocompleteUI", 1);
  SKUIContactsAutocompleteUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIContactsFramework()
{
  if (SKUIContactsFramework_sOnce != -1) {
    dispatch_once(&SKUIContactsFramework_sOnce, &__block_literal_global_24);
  }
  return SKUIContactsFramework_sHandle;
}

void *__SKUIContactsFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/Contacts.framework/Contacts", 1);
  SKUIContactsFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIContactsUIFramework()
{
  if (SKUIContactsUIFramework_sOnce != -1) {
    dispatch_once(&SKUIContactsUIFramework_sOnce, &__block_literal_global_27_0);
  }
  return SKUIContactsUIFramework_sHandle;
}

void *__SKUIContactsUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 1);
  SKUIContactsUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUICoreImageFramework()
{
  if (SKUICoreImageFramework_sOnce != -1) {
    dispatch_once(&SKUICoreImageFramework_sOnce, &__block_literal_global_30);
  }
  return SKUICoreImageFramework_sHandle;
}

void *__SKUICoreImageFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 1);
  SKUICoreImageFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUICoreTelephonyFramework()
{
  if (SKUICoreTelephonyFramework_sOnce != -1) {
    dispatch_once(&SKUICoreTelephonyFramework_sOnce, &__block_literal_global_33_0);
  }
  return SKUICoreTelephonyFramework_sHandle;
}

void *__SKUICoreTelephonyFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
  SKUICoreTelephonyFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIFamilyCircleFramework()
{
  if (SKUIFamilyCircleFramework_sOnce != -1) {
    dispatch_once(&SKUIFamilyCircleFramework_sOnce, &__block_literal_global_36);
  }
  return SKUIFamilyCircleFramework_sHandle;
}

void *__SKUIFamilyCircleFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 1);
  SKUIFamilyCircleFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIIAdFramework()
{
  if (SKUIIAdFramework_sOnce != -1) {
    dispatch_once(&SKUIIAdFramework_sOnce, &__block_literal_global_39);
  }
  return SKUIIAdFramework_sHandle;
}

void *__SKUIIAdFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/iAd.framework/iAd", 1);
  SKUIIAdFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIMediaPlayerFramework()
{
  if (SKUIMediaPlayerFramework_sOnce != -1) {
    dispatch_once(&SKUIMediaPlayerFramework_sOnce, &__block_literal_global_42_0);
  }
  return SKUIMediaPlayerFramework_sHandle;
}

void *__SKUIMediaPlayerFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer", 1);
  SKUIMediaPlayerFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIMediaPlayerUIFramework()
{
  if (SKUIMediaPlayerUIFramework_sOnce != -1) {
    dispatch_once(&SKUIMediaPlayerUIFramework_sOnce, &__block_literal_global_45);
  }
  return SKUIMediaPlayerUIFramework_sHandle;
}

void *__SKUIMediaPlayerUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/MediaPlayerUI.framework/MediaPlayerUI", 1);
  SKUIMediaPlayerUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIMobileCoreServicesFramework()
{
  if (SKUIMobileCoreServicesFramework_sOnce != -1) {
    dispatch_once(&SKUIMobileCoreServicesFramework_sOnce, &__block_literal_global_48);
  }
  return SKUIMobileCoreServicesFramework_sHandle;
}

void *__SKUIMobileCoreServicesFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  SKUIMobileCoreServicesFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIMPUFoundationFramework()
{
  if (SKUIMPUFoundationFramework_sOnce != -1) {
    dispatch_once(&SKUIMPUFoundationFramework_sOnce, &__block_literal_global_51);
  }
  return SKUIMPUFoundationFramework_sHandle;
}

void *__SKUIMPUFoundationFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/MPUFoundation.framework/MPUFoundation", 1);
  SKUIMPUFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIPassKitCoreFramework()
{
  if (SKUIPassKitCoreFramework_sOnce != -1) {
    dispatch_once(&SKUIPassKitCoreFramework_sOnce, &__block_literal_global_54);
  }
  return SKUIPassKitCoreFramework_sHandle;
}

void *__SKUIPassKitCoreFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/PassKitCore.framework/PassKitCore", 1);
  SKUIPassKitCoreFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIPassKitUIFramework()
{
  if (SKUIPassKitUIFramework_sOnce != -1) {
    dispatch_once(&SKUIPassKitUIFramework_sOnce, &__block_literal_global_57);
  }
  return SKUIPassKitUIFramework_sHandle;
}

void *__SKUIPassKitUIFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/PassKitUI.framework/PassKitUI", 1);
  SKUIPassKitUIFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIPhysicsKitFramework()
{
  if (SKUIPhysicsKitFramework_sOnce != -1) {
    dispatch_once(&SKUIPhysicsKitFramework_sOnce, &__block_literal_global_60);
  }
  return SKUIPhysicsKitFramework_sHandle;
}

void *__SKUIPhysicsKitFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/PhysicsKit.framework/PhysicsKit", 1);
  SKUIPhysicsKitFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUISocialFramework()
{
  if (SKUISocialFramework_sOnce != -1) {
    dispatch_once(&SKUISocialFramework_sOnce, &__block_literal_global_63);
  }
  return SKUISocialFramework_sHandle;
}

void *__SKUISocialFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  SKUISocialFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUISpringBoardServicesFramework()
{
  if (SKUISpringBoardServicesFramework_sOnce != -1) {
    dispatch_once(&SKUISpringBoardServicesFramework_sOnce, &__block_literal_global_66);
  }
  return SKUISpringBoardServicesFramework_sHandle;
}

void *__SKUISpringBoardServicesFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 1);
  SKUISpringBoardServicesFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIWebCoreFramework()
{
  if (SKUIWebCoreFramework_sOnce != -1) {
    dispatch_once(&SKUIWebCoreFramework_sOnce, &__block_literal_global_69);
  }
  return SKUIWebCoreFramework_sHandle;
}

void *__SKUIWebCoreFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/WebCore.framework/WebCore", 1);
  SKUIWebCoreFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIImageIOFramework()
{
  if (SKUIImageIOFramework_sOnce != -1) {
    dispatch_once(&SKUIImageIOFramework_sOnce, &__block_literal_global_72);
  }
  return SKUIImageIOFramework_sHandle;
}

void *__SKUIImageIOFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  SKUIImageIOFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUICoreLocationFramework()
{
  if (SKUICoreLocationFramework_sOnce != -1) {
    dispatch_once(&SKUICoreLocationFramework_sOnce, &__block_literal_global_75);
  }
  return SKUICoreLocationFramework_sHandle;
}

void *__SKUICoreLocationFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 1);
  SKUICoreLocationFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUICoreMediaFramework()
{
  if (SKUICoreMediaFramework_sOnce != -1) {
    dispatch_once(&SKUICoreMediaFramework_sOnce, &__block_literal_global_78);
  }
  return SKUICoreMediaFramework_sHandle;
}

void *__SKUICoreMediaFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 1);
  SKUICoreMediaFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUICelestialFramework()
{
  if (SKUICelestialFramework_sOnce != -1) {
    dispatch_once(&SKUICelestialFramework_sOnce, &__block_literal_global_81);
  }
  return SKUICelestialFramework_sHandle;
}

void *__SKUICelestialFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 1);
  SKUICelestialFramework_sHandle = (uint64_t)result;
  return result;
}

uint64_t SKUIVideoSubscriberAccountFramework()
{
  if (SKUIVideoSubscriberAccountFramework_sOnce != -1) {
    dispatch_once(&SKUIVideoSubscriberAccountFramework_sOnce, &__block_literal_global_84);
  }
  return SKUIVideoSubscriberAccountFramework_sHandle;
}

void *__SKUIVideoSubscriberAccountFramework_block_invoke()
{
  __n128 result = dlopen("/System/Library/Frameworks/VideoSubscriberAccount.framework/VideoSubscriberAccount", 1);
  SKUIVideoSubscriberAccountFramework_sHandle = (uint64_t)result;
  return result;
}

void *SKUIWeakLinkedSymbolForString(char *__symbol, void *__handle)
{
  if (__handle) {
    return dlsym(__handle, __symbol);
  }
  else {
    return 0;
  }
}

id SKUIWeakLinkedClassForString(NSString *a1, uint64_t a2)
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
        v17.origin.x = 0.0;
        v17.origin.y = 0.0;
        v17.size.double width = 1.0;
        v17.size.height = 1.0;
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
  int64x2_t v3 = (int64x2_t)vshlq_u64(v2, (uint64x2_t)xmmword_1C1CCC480);
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
  uint64_t v5 = *MEMORY[0x1E4F143B8];
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
  uint64_t v6 = *MEMORY[0x1E4F143B8];
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

void sub_1C1BC99F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1C1BC9C70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C1BC9E1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1BCA0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BCADA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BCB2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BCBD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BD4000(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1BD4674(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C1BD4C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __SKUIImagePlaceholderCornerPathBlockCreate_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
}

uint64_t __SKUIImagePlaceholderCornerPathBlockCreate_block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

void sub_1C1BD6710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BD8E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BD8FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1BD9224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIMetricsMediaEventTypeForPlaybackState(unint64_t a1)
{
  uint64_t has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    uint64_t has_internal_content = _os_feature_enabled_impl();
    if (has_internal_content)
    {
      uint64_t has_internal_content = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (has_internal_content) {
        SKUIMetricsMediaEventTypeForPlaybackState_cold_1(has_internal_content, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if (a1 <= 2) {
    uint64_t has_internal_content = (uint64_t)**((id **)&unk_1E6429DD8 + a1);
  }

  return (id)has_internal_content;
}

void sub_1C1BDC920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BDD320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BDE70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1BDED64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BDF258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
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

void sub_1C1BE9700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BEA704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1BEA9A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [v4 style];
  uint64_t v14 = [v4 elementType];
  if (v14 == 49)
  {
    __n128 v21 = [v4 resourceName];
    double v16 = v21;
    if (v21)
    {
      SKUIImageWithResourceName(v21);
      double v17 = (SKUIArtwork *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        BOOL v20 = 0;
        goto LABEL_15;
      }
      uint64_t v22 = +[SKUIIndexBarEntryDescriptor entryDescriptorWithImage:v17];
    }
    else
    {
      __n128 v23 = [SKUIArtwork alloc];
      __n128 v24 = [v4 URL];
      [v4 size];
      double v17 = -[SKUIArtwork initWithURL:size:](v23, "initWithURL:size:", v24);

      uint64_t v22 = +[SKUIIndexBarEntryDescriptor entryDescriptorWithArtwork:v17];
    }
    BOOL v20 = (void *)v22;
  }
  else
  {
    if (v14 != 138)
    {
      BOOL v20 = 0;
      goto LABEL_16;
    }
    double v15 = [v4 style];
    double v16 = SKUIViewElementPlainColorWithStyle(v15, 0);

    double v17 = [v4 text];
    double v18 = SKUIViewElementFontWithStyle(v13);
    BOOL v19 = [(SKUIArtwork *)v17 attributedStringWithDefaultFont:v18 foregroundColor:v16];
    BOOL v20 = +[SKUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:v19];
  }
LABEL_15:

LABEL_16:
  objc_msgSend(v20, "setVisibilityPriority:", objc_msgSend(v3, "visibilityPriority"));

  return v20;
}

void sub_1C1BEC4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BECCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BED0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__90(uint64_t a1, uint64_t a2)
{
  double result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__90(uint64_t a1)
{
}

void sub_1C1BEECFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C1BEEF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1BF03C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t storeShouldReverseLayoutDirection()
{
  if (didSetAtLeastOnce != -1) {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
  }
  return shouldFlipForRTL;
}

void __storeShouldReverseLayoutDirection_block_invoke()
{
  id v0 = +[SKUIClientContext defaultContext];
  _SKUISetShouldReverseLayoutDirectionWithContext(v0);
}

void _SKUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  id v16 = a1;
  uint64_t v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v2 = [v1 BOOLForKey:@"SKForceRightToLeftWritingDirection"];

  if (v2)
  {
    shouldFlipForRTL = 1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 infoDictionary];
    BOOL v5 = [v4 objectForKeyedSubscript:@"SKRespectClientUserInterfaceLayoutDirection"];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v8 = [v7 keyWindow];
      uint64_t v9 = [v8 semanticContentAttribute];

      shouldFlipForRTL = [MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:v9] == 1;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CA20];
      uint64_t v11 = [v16 valueForConfigurationKey:@"locale"];
      uint64_t v12 = [v10 localeWithLocaleIdentifier:v11];

      uint64_t v13 = (void *)MEMORY[0x1E4FB0850];
      uint64_t v14 = [v12 objectForKey:*MEMORY[0x1E4F1C438]];
      uint64_t v15 = [v13 defaultWritingDirectionForLanguage:v14];

      if (v15 == 1) {
        shouldFlipForRTL = 1;
      }
    }
  }
}

uint64_t storeSemanticContentAttribute()
{
  if (didSetAtLeastOnce != -1) {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
  }
  if (shouldFlipForRTL) {
    return 4;
  }
  else {
    return 3;
  }
}

void SKUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUISetShouldReverseLayoutDirectionWithContext_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if (didSetAtLeastOnce != -1) {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_5);
  }
  _SKUISetShouldReverseLayoutDirectionWithContext(v1);
}

void SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v16) {
        SKUIRectByApplyingUserInterfaceLayoutDirectionInRect_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  _SKUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SKUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    if (didSetAtLeastOnce != -1) {
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
    }
    if (shouldFlipForRTL)
    {
LABEL_5:
      v21.origin.x = a6;
      v21.origin.y = a7;
      v21.size.double width = a8;
      v21.size.height = a9;
      double MaxX = CGRectGetMaxX(v21);
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.double width = a4;
      v22.size.height = a5;
      double v18 = MaxX - CGRectGetMinX(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.double width = a4;
      v23.size.height = a5;
      double v19 = v18 - CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.double width = a4;
      v24.size.height = a5;
      CGRectGetMinY(v24);
      v25.origin.x = a2;
      v25.origin.y = a3;
      v25.size.double width = a4;
      v25.size.height = a5;
      CGRectGetWidth(v25);
      v26.origin.x = a2;
      v26.origin.y = a3;
      v26.size.double width = a4;
      v26.size.height = a5;
      CGRectGetHeight(v26);
      return v19;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1) {
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_17_0);
    }
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1) {
      goto LABEL_5;
    }
  }
  return a2;
}

void SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v16) {
        SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  _SKUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

void SKUIRectByRemovingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIRectByRemovingUserInterfaceLayoutDirectionInRect_cold_1();
  }
  _SKUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SKUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    if (didSetAtLeastOnce != -1) {
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
    }
    if (shouldFlipForRTL)
    {
LABEL_5:
      v20.origin.x = a6;
      v20.origin.y = a7;
      v20.size.double width = a8;
      v20.size.height = a9;
      double MaxX = CGRectGetMaxX(v20);
      v21.origin.x = a2;
      v21.origin.y = a3;
      v21.size.double width = a4;
      v21.size.height = a5;
      double v18 = MaxX - CGRectGetMaxX(v21);
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.double width = a4;
      v22.size.height = a5;
      CGRectGetMinY(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.double width = a4;
      v23.size.height = a5;
      CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.double width = a4;
      v24.size.height = a5;
      CGRectGetHeight(v24);
      return v18;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1) {
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_17_0);
    }
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1) {
      goto LABEL_5;
    }
  }
  return a2;
}

CGFloat SKUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SKUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __shouldReverseLayoutDirection_block_invoke()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v1 = [v0 keyWindow];
  uint64_t v2 = [v1 semanticContentAttribute];

  uint64_t result = [MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:v2];
  if (result == 1) {
    shouldReverseLayoutDirection_shouldFlipForRTL = 1;
  }
  return result;
}

void sub_1C1BF38B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__92(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__92(uint64_t a1)
{
}

double SKUISpacePageComponentHeightForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUISpacePageComponentHeightForString_cold_1();
  }
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

void sub_1C1BF7CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BF81B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1BF8D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1C1BF91E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1BFAED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
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

void sub_1C1BFCB60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
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

double SKUIBrickItemSize()
{
  id v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1)
  {
    double v2 = 210.0;
  }
  else
  {
    float v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 bounds];
    double v5 = v4;

    if (v5 <= 375.0)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v6 bounds];
      double v8 = v7;

      double v2 = dbl_1C1CCB9C0[v8 > 320.0];
    }
    else
    {
      double v2 = 175.0;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = v10;

  return v2 * v11;
}

void sub_1C1BFD6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__95(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__95(uint64_t a1)
{
}

void sub_1C1BFE154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1C1C00134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C0456C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1C0596C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C1C05FDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1C1C0929C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C09764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__96(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__96(uint64_t a1)
{
}

void sub_1C1C0A540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C1C0B0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double SKUIAttributedStringGetLineHeight(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    SKUIAttributedStringGetLineHeight_cold_1();
  }
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = [v1 length];
  uint64_t v3 = *MEMORY[0x1E4FB06F8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __SKUIAttributedStringGetLineHeight_block_invoke;
  double v6[3] = &unk_1E642A338;
  void v6[4] = &v7;
  objc_msgSend(v1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_1C1C0B484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SKUIAttributedStringGetLineHeight_block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 _bodyLeading];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = v5;
  return result;
}

void SKUIGetLayoutProperties(uint64_t a1, uint64_t a2, void *a3, double *a4)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIGetLayoutProperties_cold_1();
  }
  if (a2 < 1)
  {
    double v10 = 0.0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = a1 + 24;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      if (*(unsigned char *)(v9 + 16))
      {
        double v12 = v11 + v10;
        double v13 = *(double *)v9;
        double v11 = *(double *)(v9 + 8);
        double v15 = *(double *)(v9 - 16);
        double v14 = *(double *)(v9 - 8);
        *(double *)(*a3 + 8 * vITColor::ITColor((ITColor *)this + 8) = v12 - v14;
        double v10 = v12 + v15 - v13 - v14;
      }
      v9 += 48;
      ++v8;
    }
    while (a2 != v8);
  }
  *a4 = v10;
}

double SKUIScaleSizeToFit(double a1, double a2, double a3, double a4)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIScaleSizeToFit_cold_1();
  }
  double v8 = a2 / a4;
  if (a1 / a3 < a2 / a4) {
    double v8 = a1 / a3;
  }
  return ceil(a3 * v8);
}

void sub_1C1C0E59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C0E938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C0FF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C1098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CGColorSpaceGetSRGB()
{
  if (CGColorSpaceGetSRGB::sOnceToken != -1) {
    dispatch_once(&CGColorSpaceGetSRGB::sOnceToken, &__block_literal_global_61);
  }
  return CGColorSpaceGetSRGB::sSpace;
}

void __CGColorSpaceGetSRGB_block_invoke()
{
  p_inst_props = &OBJC_PROTOCOL___SKUILinkHandler.inst_props;
  while (1)
  {
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2000000000;
    double v13 = 0;
    id v1 = (__objc2_prop_list ***)p_inst_props[467];
    double v13 = v1;
    if (!v1)
    {
      uint64_t v2 = (void *)ColorSyncLibrary();
      v11[3] = (uint64_t)dlsym(v2, "kColorSyncSRGBProfile");
      p_inst_props[467] = (__objc2_prop_list *)v11[3];
      id v1 = (__objc2_prop_list ***)v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v1)
    {
      getCNComposeRecipientViewDidChangeNotification_cold_1();
LABEL_19:
      getCNComposeRecipientViewDidChangeNotification_cold_1();
      goto LABEL_20;
    }
    p_inst_props = *v1;
    {
      getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = 0;
    }
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2000000000;
    double v3 = (uint64_t (*)(__objc2_prop_list **))getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
    double v13 = (__objc2_prop_list ***)getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
    if (!getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr)
    {
      double v4 = (void *)ColorSyncLibrary();
      v11[3] = (uint64_t)dlsym(v4, "ColorSyncProfileCreateWithName");
      getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = (_UNKNOWN *)v11[3];
      double v3 = (uint64_t (*)(__objc2_prop_list **))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v3) {
      goto LABEL_19;
    }
    uint64_t v5 = v3(p_inst_props);
    if (!v5) {
      return;
    }
    p_inst_props = (__objc2_prop_list **)v5;
    {
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = 0;
    }
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2000000000;
    uint64_t v6 = (uint64_t (*)(__objc2_prop_list **, void))getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    double v13 = (__objc2_prop_list ***)getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    if (!getColorSyncProfileCopyDataSymbolLoc(void)::ptr)
    {
      uint64_t v7 = (void *)ColorSyncLibrary();
      v11[3] = (uint64_t)dlsym(v7, "ColorSyncProfileCopyData");
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = (_UNKNOWN *)v11[3];
      uint64_t v6 = (uint64_t (*)(__objc2_prop_list **, void))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (v6) {
      break;
    }
LABEL_20:
    getCNComposeRecipientViewDidChangeNotification_cold_1();
LABEL_21:
    {
      p_inst_props[467] = 0;
    }
  }
  uint64_t v8 = v6(p_inst_props, 0);
  if (v8)
  {
    uint64_t v9 = (const void *)v8;
    CGColorSpaceGetSRGB::sSpace = MEMORY[0x1C8748570]();
    CFRelease(v9);
  }
  CFRelease(p_inst_props);
}

void sub_1C1C110E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL42getColorSyncProfileCreateWithNameSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ColorSyncLibrary();
  uint64_t result = dlsym(v2, "ColorSyncProfileCreateWithName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ColorSyncLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  {
    ColorSyncLibraryCore(char **)::frameworkLibrary = 0;
  }
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 0x40000000;
    v3[3] = ___ZL20ColorSyncLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_tmp_4;
    void v3[5] = v3;
    long long v4 = xmmword_1E642A478;
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
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getkColorSyncSRGBProfileSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL36getColorSyncProfileCopyDataSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ColorSyncLibrary();
  uint64_t result = dlsym(v2, "ColorSyncProfileCopyData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = result;
  getColorSyncProfileCopyDataSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C1C123AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C12B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1C1C1309C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C1C133E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C1C14BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C15170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C15EF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
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

uint64_t SKUIProductPageFragmentWithURL(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUIProductPageFragmentWithURL_cold_1();
  }
  uint64_t v2 = [v1 fragment];
  if ([v2 isEqualToString:@"reviews"])
  {
    uint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"related"])
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1C1C18A84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C1C19394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1C1DBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1C1C1E9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C1F2E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t SKUIUserInterfaceIdiom(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1 || (uint64_t v3 = [v1 userInterfaceIdiomOverride], v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    long long v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v3 = [v4 userInterfaceIdiom];
  }
  return v3;
}

double SKUICompactThreshold()
{
  if (SKUICompactThreshold_onceToken != -1) {
    dispatch_once(&SKUICompactThreshold_onceToken, &__block_literal_global_504);
  }
  return *(double *)&SKUICompactThreshold_threshold;
}

void __SKUICompactThreshold_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v8 = -337121064;
  long long v7 = xmmword_1C1CCC7E8;
  int v6 = 450980336;
  long long v5 = xmmword_1C1CCC7FC;
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
      uint64_t v3 = v2;
      int v4 = objc_msgSend(v2, "intValue", &v5, 0);
      CFRelease(v1);

      if (v4 == 2436) {
LABEL_2:
      }
        SKUICompactThreshold_threshold = 0x4089600000000000;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

id SKUIXEventSearchDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"search", @"type", 0);
  int v6 = v5;
  if (v3) {
    [v5 setObject:v3 forKey:@"term"];
  }
  if (v4) {
    [v6 setObject:v4 forKey:@"url"];
  }

  return v6;
}

uint64_t SKUIXEventSidepackDictionary(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"sidePack", @"type", a1, @"sidePackData", 0);
}

void sub_1C1C25190(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1C2539C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1C26B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C27074(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1C27960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C2874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
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

void sub_1C1C29A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C2A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C2BE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

uint64_t __Block_byref_object_copy__100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__100(uint64_t a1)
{
}

void sub_1C1C313D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C1C3167C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C31924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C32000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C32260(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1C3243C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C1C325E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1C336C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C33B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C1C3486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C35F14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
}

void sub_1C1C36F2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C1C38878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1C1C389D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C1C38D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C3902C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id SKUIVideoPreviewPlayPlayableVideoWithAsset(void *a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  id v16 = v5;
  id v17 = v6;
  id v18 = v7;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v19) {
        SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  uint64_t v27 = [v17 contentURL];
  if (!v27)
  {
    __n128 v38 = 0;
    goto LABEL_22;
  }
  __n128 v28 = (void *)SKUIAVFoundationFramework();
  id v29 = *(id *)SKUIWeakLinkedSymbolForString("AVURLAssetInheritURIQueryComponentFromReferencingURIKey", v28);
  v67.value = (CMTimeValue)v29;
  v68.value = MEMORY[0x1E4F1CC38];
  __n128 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  if (v16 && [v16 kind])
  {
    __n128 v31 = (void *)SKUIAVFoundationFramework();
    id v32 = *(id *)SKUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationOptionsKey", v31);
    __n128 v33 = (void *)SKUIAVFoundationFramework();
    id v34 = *(id *)SKUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationServiceIdentifierKey", v33);
    uint64_t v35 = [v16 kind];
    if (v35 == 1)
    {
      id v64 = v18;
      id v36 = v34;
      __n128 v37 = @"com.apple.itunesstore.movies.preview.cloud";
    }
    else
    {
      if (v35 != 2)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v64 = v18;
      id v36 = v34;
      __n128 v37 = @"com.apple.itunesstore.tvshows.preview.cloud";
    }
    __n128 v39 = (void *)[v30 mutableCopy];
    id v65 = v36;
    long long v66 = v37;
    __n128 v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    [v39 setObject:v40 forKey:v32];
    uint64_t v41 = [v39 copy];

    id v34 = v36;
    __n128 v30 = (void *)v41;
    id v18 = v64;
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v42 = SKUIAVFoundationFramework();
  __n128 v38 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Avurlasset.isa, v42)), "initWithURL:options:", v27, v30);
  __n128 v43 = +[SKUIStoreAssetResourceLoaderDelegate storeAssetResourceLoaderDelegateForPlayableAsset:v17 clientContext:v18];
  if (v43)
  {
    __n128 v44 = [v38 resourceLoader];
    SKUIStoreAssetResourceLoaderConfigureWithDelegate(v44, v43);
  }
LABEL_22:

  if (v38)
  {
    __n128 v45 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithAsset:v38];
    __n128 v46 = (void *)[objc_alloc(MEMORY[0x1E4F16608]) initWithPlayerItem:v45];
    id v47 = objc_alloc_init(MEMORY[0x1E4F16750]);
    [v47 setPlayer:v46];
    [v47 setExitsFullScreenWhenPlaybackEnds:1];
    id v48 = v46;
    id v49 = v17;
    if (os_variant_has_internal_content())
    {
      if (_os_feature_enabled_impl())
      {
        BOOL v50 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
        if (v50) {
          SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_1(v50, v51, v52, v53, v54, v55, v56, v57);
        }
      }
    }
    [v49 initialPlaybackTime];
    memset(&v68, 0, sizeof(v68));
    CMTimeMakeWithSeconds(&v68, v58, 1000000);
    CMTime v67 = v68;
    [v48 seekToTime:&v67];
    long long v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v59 postNotificationName:@"SKUIVideoPreviewDidStartNotification" object:0];

    uint64_t v60 = [v49 storeItemIdentifier];
    SKUIVideoPreviewObservePlayer(v48, v60);
    __n128 v61 = [MEMORY[0x1E4FB8890] sessionManager];
    id v62 = (id)[v61 stopAllAudioPlayerSessions];

    [v48 play];
  }
  else
  {
    id v47 = 0;
  }

  return v47;
}

id SKUIVideoPreviewPlayPlayableAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUIVideoPreviewPlayPlayableAsset_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = SKUIVideoPreviewPlayPlayableVideoWithAsset(0, v3, v4);

  return v13;
}

void SKUIVideoPreviewDismissOnEnterBackground(void *a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUIVideoPreviewDismissOnEnterBackground_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = objc_getAssociatedObject(v1, "com.apple.StoreKitUI.MoviePlayer.BackgroundObserver");
  BOOL v11 = v10 == 0;

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, v1);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __SKUIVideoPreviewDismissOnEnterBackground_block_invoke;
    aBlock[3] = &unk_1E642ABA8;
    objc_copyWeak(&v23, &location);
    uint64_t v13 = _Block_copy(aBlock);
    uint64_t v14 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v15 = [MEMORY[0x1E4F28F08] mainQueue];
    id v16 = [v12 addObserverForName:*MEMORY[0x1E4FB2640] object:v14 queue:v15 usingBlock:v13];

    id v17 = [MEMORY[0x1E4F28F08] mainQueue];
    id v18 = [v12 addObserverForName:@"SKUIVideoPreviewDismissNotification" object:0 queue:v17 usingBlock:v13];

    BOOL v19 = [_SKUIVideoPreviewNotificationObserver alloc];
    v25[0] = v16;
    v25[1] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v21 = [(_SKUIVideoPreviewNotificationObserver *)v19 initWithObservers:v20];

    objc_setAssociatedObject(v1, "com.apple.StoreKitUI.MoviePlayer.BackgroundObserver", v21, (void *)1);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void sub_1C1C3A4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __SKUIVideoPreviewDismissOnEnterBackground_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id object = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:0 completion:0];
    objc_setAssociatedObject(object, "com.apple.StoreKitUI.MoviePlayer.BackgroundObserver", 0, (void *)1);
    id WeakRetained = object;
  }
}

void SKUIVideoPreviewObservePlayer(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        SKUIVideoPreviewObservePlayer_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SKUIVideoPreviewObservePlayer_block_invoke_3;
  block[3] = &unk_1E64238C0;
  id v16 = &__block_literal_global_64;
  if (SKUIVideoPreviewObservePlayer_sOnce != -1)
  {
    dispatch_once(&SKUIVideoPreviewObservePlayer_sOnce, block);
    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (a2)
  {
LABEL_7:
    uint64_t v12 = (void *)[objc_alloc(NSNumber) initWithLongLong:a2];
    uint64_t v13 = [v3 currentItem];
    objc_setAssociatedObject(v13, "com.apple.StoreKitUI.MoviePlayerItemID", v12, (void *)1);
  }
LABEL_8:
  uint64_t v14 = [v3 currentItem];
  objc_setAssociatedObject(v14, "com.apple.StoreKitUI.MoviePlayerTrackingKey", MEMORY[0x1E4F1CC38], (void *)1);
}

void __SKUIVideoPreviewObservePlayer_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 object];
  BOOL v4 = objc_getAssociatedObject(v3, "com.apple.StoreKitUI.MoviePlayerItemID");
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    uint64_t v5 = [v3 accessLog];
    uint64_t v6 = [v5 events];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __SKUIVideoPreviewObservePlayer_block_invoke_2;
    v11[3] = &unk_1E642ABF0;
    v11[4] = &v12;
    [v6 enumerateObjectsUsingBlock:v11];

    if (v13[3] >= 5.0)
    {
      [v4 longLongValue];
      uint64_t v7 = (void *)SUCreatePreviewHistoryOperation();
      uint64_t v8 = [MEMORY[0x1E4FB8838] mainQueue];
      [v8 addOperation:v7];
    }
    _Block_object_dispose(&v12, 8);
  }
  uint64_t v9 = objc_getAssociatedObject(v3, "com.apple.StoreKitUI.MoviePlayerTrackingKey");
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"SKUIVideoPreviewDidEndNotification" object:0];
  }
}

void sub_1C1C3A870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SKUIVideoPreviewObservePlayer_block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 durationWatched];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 2ITColor::ITColor((ITColor *)this + 4) = v5;
  return result;
}

void __SKUIVideoPreviewObservePlayer_block_invoke_3(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = *MEMORY[0x1E4F16020];
  double v3 = [MEMORY[0x1E4F28F08] mainQueue];
  id v4 = (id)[v8 addObserverForName:v2 object:0 queue:v3 usingBlock:*(void *)(a1 + 32)];

  uint64_t v5 = *MEMORY[0x1E4F16030];
  uint64_t v6 = [MEMORY[0x1E4F28F08] mainQueue];
  id v7 = (id)[v8 addObserverForName:v5 object:0 queue:v6 usingBlock:*(void *)(a1 + 32)];
}

void SKUICollectionViewUpdatePerspectiveCells(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    SKUICollectionViewUpdatePerspectiveCells_cold_1();
    if (v4) {
      goto LABEL_5;
    }
LABEL_18:
    id v5 = [v3 visibleCells];
    goto LABEL_19;
  }
  if (!v4) {
    goto LABEL_18;
  }
LABEL_5:
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsIndex:", objc_msgSend(v11, "section")))
        {
          uint64_t v12 = [v3 cellForItemAtIndexPath:v11];
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

LABEL_19:
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
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __SKUICollectionViewUpdatePerspectiveCells_block_invoke;
  v31[3] = &__block_descriptor_48_e55_q24__0__UICollectionViewCell_8__UICollectionViewCell_16l;
  *(CGFloat *)&_OWORD v31[4] = MidX;
  *(CGFloat *)&v31[5] = MidY;
  BOOL v19 = [v5 sortedArrayWithOptions:0 usingComparator:v31];

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
        uint64_t v25 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        if (objc_msgSend(v25, "conformsToProtocol:", &unk_1F1DA49A8, (void)v27))
        {
          [v25 updateForChangedDistanceFromVanishingPoint];
          uint64_t v26 = [v25 superview];
          [v26 sendSubviewToBack:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v22);
  }
}

uint64_t __SKUICollectionViewUpdatePerspectiveCells_block_invoke(uint64_t a1, void *a2, void *a3)
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

void sub_1C1C40B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C40DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C41368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
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

void sub_1C1C41A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
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

id _SKUIErrorFromError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  int v3 = [v2 isEqualToString:@"SKUIMacErrorDomain"];

  if (v3)
  {
    uint64_t v4 = [v1 code];
    if (v4 == 2) {
      uint64_t v5 = 7;
    }
    else {
      uint64_t v5 = 4 * (v4 == 1);
    }
    double v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:v5 userInfo:v6];
  }
  else
  {
    id v7 = v1;
  }

  return v7;
}

void sub_1C1C474FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1C1C47774(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C1C47920(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C1C47BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SKUIDecodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        SKUIDecodeRestorableStateWithCoder_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  id v16 = [v7 decodeObjectOfClass:objc_opt_class() forKey:v6];

  if (v16)
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v16 error:0];
    [v5 decodeRestorableStateWithCoder:v17];
    [v17 finishDecoding];
  }
}

void SKUIEncodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8)
      {
        SKUIEncodeRestorableStateWithCoder_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
        if (!v7) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
  }
  if (v7)
  {
LABEL_5:
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v7 encodeRestorableStateWithCoder:v16];
    id v17 = [v16 encodedData];
    [v5 encodeObject:v17 forKey:v6];
  }
LABEL_6:
}

void *__Block_byref_object_copy__104(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__104(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__6_0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7_0(uint64_t a1)
{
}

void sub_1C1C49834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t (*SKUIMetricsLaunchApplicationWithIdentifier(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  uint64_t v4 = (void *)SKUISpringBoardServicesFramework();
  uint64_t result = (uint64_t (*)(uint64_t, uint64_t))SKUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifier", v4);
  if (result)
  {
    return (uint64_t (*)(uint64_t, uint64_t))result(a1, a2);
  }
  return result;
}

uint64_t (*SKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  uint64_t v10 = (void *)SKUISpringBoardServicesFramework();
  uint64_t result = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SKUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions", v10);
  if (result)
  {
    return (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))result(a1, a2, a3, a4, a5);
  }
  return result;
}

id SKUIMetricsNavigationTypeFromNavigationControllerOperation(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = (id *)MEMORY[0x1E4FA88C0];
LABEL_5:
    id v3 = *v2;
    return v3;
  }
  if (a1 == 2)
  {
    uint64_t v2 = (id *)MEMORY[0x1E4FA88B8];
    goto LABEL_5;
  }
  id v3 = 0;
  return v3;
}

void SKUIMetricsOpenSensitiveURL(void *a1, void *a2)
{
  id v9 = a1;
  id v3 = (void *)MEMORY[0x1E4FB1438];
  id v4 = a2;
  id v5 = [v3 sharedApplication];
  id v6 = [v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 application:v5 recordExitMetricsEventWithURL:v9];
  }
  uint64_t v7 = SKUIMobileCoreServicesFramework();
  BOOL v8 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Lsapplicationw.isa, v7), "defaultWorkspace");
  [v8 openSensitiveURL:v9 withOptions:v4];
}

void SKUIMetricsOpenURL(void *a1)
{
  id v3 = a1;
  uint64_t v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v2 = [v1 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 application:v1 recordExitMetricsEventWithURL:v3];
  }
  [v1 openURL:v3 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

void SKUIMetricsSetClickEventPositionWithPoint(void *a1, double a2, double a3)
{
  id v5 = (void *)MEMORY[0x1E4FB1BA8];
  id v6 = a1;
  uint64_t v7 = [v5 mainScreen];
  [v7 scale];
  double v9 = v8;

  uint64_t v10 = [NSNumber numberWithInteger:(uint64_t)(a2 * v9)];
  [v6 setPositionX:v10];

  id v11 = [NSNumber numberWithInteger:(uint64_t)(a3 * v9)];
  [v6 setPositionY:v11];
}

void SKUIMetricsSetClickEventPositionWithView(void *a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v8 = a1;
    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", 0);
    double v5 = v4;
    double v7 = v6;

    SKUIMetricsSetClickEventPositionWithPoint(v8, v5, v7);
  }
}

__CFString *SKUIMetricsWindowOrientationForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_1E642AE10[a1 - 1];
  }
}

void sub_1C1C4C4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy__105(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__105(uint64_t a1)
{
}

void SKUINavigationControllerWillShowViewController(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUINavigationControllerWillShowViewController_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v3 lastOperation];
  if (v13 == 2)
  {
    id v14 = [v3 disappearingViewController];
    id v15 = v4;
  }
  else
  {
    if (v13 != 1)
    {
      id v14 = v4;
      uint64_t v16 = 0;
      goto LABEL_11;
    }
    id v14 = v4;
    id v15 = [v3 disappearingViewController];
  }
  uint64_t v16 = v15;
LABEL_11:
  uint64_t v17 = [v3 navigationBar];
  uint64_t v18 = [v17 _backdropViewLayerGroupName];

  BOOL v19 = [v14 SKUIPinnedHeaderView];
  [v19 setGroupName:v18];

  id v20 = [v16 SKUIPinnedHeaderView];
  [v20 setGroupName:0];
}

void SKUINavigationControllerDidShowViewController(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        SKUINavigationControllerDidShowViewController_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v3 navigationBar];
  id v14 = [v13 _backdropViewLayerGroupName];

  id v15 = [v4 SKUIPinnedHeaderView];

  [v15 setGroupName:v14];
}

void SKUIScrollViewSetPinnedHeaderContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        SKUIScrollViewSetPinnedHeaderContentInsets_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  __SKUIScrollViewSetKeyedContentInsets(v9, "com.apple.iTunesStoreUI.pinnedHeaderInset", 0, a2, a3, a4, a5);
}

void __SKUIScrollViewSetKeyedContentInsets(void *a1, const void *a2, int a3, double a4, double a5, double a6, double a7)
{
  id object = a1;
  uint64_t v11 = objc_getAssociatedObject(object, a2);
  uint64_t v12 = v11;
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
    double v14 = *MEMORY[0x1E4FB2848];
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
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
    long long v34 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", v41, v42, a6, a7);
    objc_setAssociatedObject(object, a2, v34, (void *)1);
  }
}

void SKUIScrollViewSetDefaultContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        SKUIScrollViewSetDefaultContentInsets_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  __SKUIScrollViewSetKeyedContentInsets(v9, "com.apple.iTunesStoreUI.defaultHeaderInset", 1, a2, a3, a4, a5);
}

double SKUILayoutGuideInsets(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        SKUILayoutGuideInsets_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  id v10 = v1;
  uint64_t v11 = [v10 parentViewController];
  if (v11)
  {
    uint64_t v12 = v10;
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
      id v13 = v11;

      uint64_t v11 = [v13 parentViewController];

      uint64_t v12 = v13;
      if (!v11) {
        goto LABEL_13;
      }
    }
    id v13 = v12;
  }
  else
  {
    id v13 = v10;
  }
LABEL_13:
  uint64_t v14 = [v13 topLayoutGuide];
  [v14 length];
  double v16 = v15;
  uint64_t v17 = [v13 bottomLayoutGuide];
  [v17 length];

  return v16;
}

void sub_1C1C500BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUILabelViewStyleForString(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUILabelViewStyleForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  if ([v1 isEqualToString:@"title"])
  {
    uint64_t v10 = 5;
  }
  else if ([v1 isEqualToString:@"subtitle"])
  {
    uint64_t v10 = 4;
  }
  else if ([v1 isEqualToString:@"notice"])
  {
    uint64_t v10 = 3;
  }
  else if ([v1 isEqualToString:@"description"])
  {
    uint64_t v10 = 1;
  }
  else if ([v1 isEqualToString:@"navigationTitle"])
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1C1C5223C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

id SKUILabelStringAttributesWithSpanElement(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        SKUILabelStringAttributesWithSpanElement_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = [v1 style];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = SKUIViewElementFontWithStyle(v10);
  if (v12) {
    [v11 setObject:v12 forKey:*MEMORY[0x1E4FB06F8]];
  }
  id v13 = [v10 ikColor];
  uint64_t v14 = [v13 color];

  if (v14) {
    [v11 setObject:v14 forKey:*MEMORY[0x1E4FB0700]];
  }
  if (![v11 count])
  {

    id v11 = 0;
  }

  return v11;
}

BOOL _SKUIScrollViewIsCompetingWithScrollView(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 panGestureRecognizer];
  if (_SKUIScrollViewCanScrollHorizontally(v3)) {
    int v6 = [v5 _canPanHorizontally];
  }
  else {
    int v6 = 0;
  }
  if (_SKUIScrollViewCanScrollVertically(v3)) {
    int v7 = [v5 _canPanVertically];
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = [v4 panGestureRecognizer];
  if (_SKUIScrollViewCanScrollHorizontally(v4)) {
    int v9 = [v8 _canPanHorizontally];
  }
  else {
    int v9 = 0;
  }
  CanScrollVerticallCGFloat y = _SKUIScrollViewCanScrollVertically(v4);
  if (CanScrollVertically) {
    CanScrollVerticallCGFloat y = [v8 _canPanVertically];
  }
  BOOL v12 = v6 != v9 && v7 != CanScrollVertically;

  return v12;
}

uint64_t _SKUIScrollViewWantsToBeginTrackingImmediately(void *a1)
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
      uint64_t v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
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

void sub_1C1C53C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SKUIScrollViewCanScrollHorizontally(void *a1)
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

uint64_t _SKUIScrollViewCanScrollVertically(void *a1)
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

uint64_t sub_1C1C53F7C()
{
  uint64_t v0 = type metadata accessor for SKLogger();
  __swift_allocate_value_buffer(v0, qword_1EA2C0F50);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA2C0F50);
  return sub_1C1C9A448();
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

uint64_t type metadata accessor for SKLogger()
{
  uint64_t result = qword_1EA2C0670;
  if (!qword_1EA2C0670) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for SKUIReviewInAppControllerResult()
{
  if (!qword_1EA2C0668)
  {
    ForeignTypeMetaint data = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA2C0668);
    }
  }
}

uint64_t sub_1C1C54124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();
  double v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1C1C54190(uint64_t a1)
{
  uint64_t v2 = sub_1C1C9A458();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1C1C541F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1C1C54258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1C1C542BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1C1C54320(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1C1C54384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C1C54398);
}

uint64_t sub_1C1C54398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1C1C54408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C1C5441C);
}

uint64_t sub_1C1C5441C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1C9A458();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1C1C54490()
{
  uint64_t result = sub_1C1C9A458();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1C1C5451C(void *a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(void, void, void))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA2C0680);
  MEMORY[0x1F4188790](v9 - 8);
  double v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SKLogger();
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  double v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  double v17 = (char *)&v53 - v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 1ITColor::ITColor((ITColor *)this + 6) = a5;
  if (!a3)
  {
    uint64_t v29 = sub_1C1C9A488();
    uint64_t v31 = v30;
    objc_allocWithZone(MEMORY[0x1E4F28C58]);
    _Block_copy(a5);
    id v32 = sub_1C1C55D7C(v29, v31, 7, 0);
    if (qword_1EA2C0660 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v12, (uint64_t)qword_1EA2C0F50);
    sub_1C1C55E2C(v33, (uint64_t)v17);
    os_log_type_t v34 = sub_1C1C9A4F8();
    double v35 = sub_1C1C9A438();
    os_log_type_t v36 = v34;
    if (os_log_type_enabled(v35, v34))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v54 = v38;
      *(_DWORD *)uint64_t v37 = 136446466;
      uint64_t v53 = sub_1C1C5608C(0, 0xE000000000000000, &v54);
      sub_1C1C9A508();
      *(_WORD *)(v37 + 1ITColor::ITColor((ITColor *)this + 2) = 2082;
      uint64_t v53 = sub_1C1C5608C(0xD000000000000037, 0x80000001C1D00A80, &v54);
      sub_1C1C9A508();
      _os_log_impl(&dword_1C1950000, v35, v36, "%{public}s%{public}s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87498F0](v38, -1, -1);
      MEMORY[0x1C87498F0](v37, -1, -1);
    }

    sub_1C1C55E90((uint64_t)v17);
    id v39 = v32;
    goto LABEL_19;
  }
  if (!a1)
  {
    _Block_copy(a5);
LABEL_14:
    uint64_t v40 = sub_1C1C9A488();
    uint64_t v42 = v41;
    id v43 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    id v44 = sub_1C1C55D7C(v40, v42, 0, 0);
    if (qword_1EA2C0660 != -1) {
      swift_once();
    }
    uint64_t v45 = __swift_project_value_buffer(v12, (uint64_t)qword_1EA2C0F50);
    sub_1C1C55E2C(v45, (uint64_t)v15);
    os_log_type_t v46 = sub_1C1C9A4F8();
    id v47 = sub_1C1C9A438();
    os_log_type_t v48 = v46;
    if (os_log_type_enabled(v47, v46))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v54 = v50;
      *(_DWORD *)uint64_t v49 = 136446466;
      uint64_t v53 = sub_1C1C5608C(0, 0xE000000000000000, &v54);
      sub_1C1C9A508();
      *(_WORD *)(v49 + 1ITColor::ITColor((ITColor *)this + 2) = 2082;
      uint64_t v53 = sub_1C1C5608C(0xD00000000000002BLL, 0x80000001C1D00AC0, &v54);
      sub_1C1C9A508();
      _os_log_impl(&dword_1C1950000, v47, v48, "%{public}s%{public}s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87498F0](v50, -1, -1);
      MEMORY[0x1C87498F0](v49, -1, -1);
    }

    sub_1C1C55E90((uint64_t)v15);
    id v39 = v44;
LABEL_19:
    uint64_t v51 = v39;
    uint64_t v52 = (void *)sub_1C1C9A3D8();
    ((void (**)(void, void, void *))a5)[2](a5, 0, v52);
    swift_release();

    goto LABEL_20;
  }
  _Block_copy(a5);
  swift_bridgeObjectRetain();
  id v19 = objc_msgSend(a1, sel_view);
  if (v19)
  {
    double v20 = v19;
    id v21 = objc_msgSend(v19, sel_window);

    if (v21)
    {
      id v22 = objc_msgSend(v21, sel_windowScene);

      if (v22)
      {
        id v23 = objc_msgSend(self, sel_currentProcess);
        id v24 = objc_allocWithZone((Class)sub_1C1C9A408());
        uint64_t v25 = sub_1C1C9A3F8();
        uint64_t v26 = sub_1C1C9A4D8();
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v26);
        double v27 = (void *)swift_allocObject();
        void v27[2] = 0;
        v27[3] = 0;
        v27[4] = a4;
        v27[5] = v25;
        v27[6] = v22;
        v27[7] = sub_1C1C55CE0;
        v27[8] = v18;
        id v28 = a4;
        swift_retain();
        sub_1C1C559D8((uint64_t)v11, (uint64_t)&unk_1EA2C0690, (uint64_t)v27);
        swift_release();
        swift_release();
LABEL_20:
        _Block_release(a5);
        return;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  _Block_release(a5);
  __break(1u);
}

uint64_t sub_1C1C54BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 1ITColor::ITColor((ITColor *)this + 6) = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_1C1C56C78;
  return sub_1C1C54C70(a5, a6, a7, a8);
}

uint64_t sub_1C1C54C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[22] = a3;
  v4[23] = a4;
  v4[20] = a1;
  v4[21] = a2;
  v4[24] = type metadata accessor for SKLogger();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  uint64_t v5 = sub_1C1C9A3E8();
  v4[29] = v5;
  v4[30] = *(void *)(v5 - 8);
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C1C54D9C, 0, 0);
}

uint64_t sub_1C1C54D9C()
{
  sub_1C1C9A428();
  swift_allocObject();
  v0[33] = sub_1C1C9A418();
  sub_1C1C56B88();
  id v1 = sub_1C1C55CE8();
  v0[34] = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, id))((int)*MEMORY[0x1E4F4DEE8] + MEMORY[0x1E4F4DEE8]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[35] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1C1C54EAC;
  uint64_t v3 = v0[32];
  uint64_t v5 = v0[20];
  uint64_t v4 = v0[21];
  return v7(v3, v4, v5, v1);
}

uint64_t sub_1C1C54EAC()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  *(void *)(v4 + 28ITColor::ITColor((ITColor *)this + 8) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_1C1C556EC;
  }
  else {
    uint64_t v5 = sub_1C1C54F90;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1C1C54F90()
{
  uint64_t v60 = v0;
  if (qword_1EA2C0660 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = __swift_project_value_buffer(*(void *)(v0 + 192), (uint64_t)qword_1EA2C0F50);
  sub_1C1C55E2C(v2, v1);
  OUTLINED_FUNCTION_4();
  sub_1C1C9A528();
  uint64_t v3 = v59;
  *(void *)(v0 + 6ITColor::ITColor((ITColor *)this + 4) = v58;
  *(void *)(v0 + 7ITColor::ITColor((ITColor *)this + 2) = v3;
  OUTLINED_FUNCTION_7();
  sub_1C1C9A498();
  sub_1C1C9A558();
  uint64_t v5 = *(void *)(v0 + 64);
  unint64_t v4 = *(void *)(v0 + 72);
  os_log_type_t v6 = sub_1C1C9A4E8();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1C1C9A438();
  os_log_type_t v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v9 = OUTLINED_FUNCTION_10();
    uint64_t v10 = OUTLINED_FUNCTION_8();
    uint64_t v58 = v10;
    *(_DWORD *)uint64_t v9 = 136446466;
    *(void *)(v0 + 14ITColor::ITColor((ITColor *)this + 4) = OUTLINED_FUNCTION_3(v10, v11, v12);
    sub_1C1C9A508();
    *(_WORD *)(v9 + 1ITColor::ITColor((ITColor *)this + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 15ITColor::ITColor((ITColor *)this + 2) = sub_1C1C5608C(v5, v4, &v58);
    sub_1C1C9A508();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1950000, v7, v8, "%{public}s%{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = *(void *)(v0 + 248);
  uint64_t v14 = *(void *)(v0 + 256);
  uint64_t v15 = *(void *)(v0 + 232);
  uint64_t v16 = *(void *)(v0 + 240);
  sub_1C1C55E90(*(void *)(v0 + 224));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v13, v14, v15);
  int v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 88))(v13, v15);
  if (v17 == *MEMORY[0x1E4F4DEC8])
  {
    uint64_t v18 = *(id **)(v0 + 248);
    uint64_t v19 = OUTLINED_FUNCTION_9();
    v20(v19);

    id v21 = 0;
    uint64_t v22 = 3;
    goto LABEL_20;
  }
  if (v17 == *MEMORY[0x1E4F4DEC0])
  {
    id v23 = *(id **)(v0 + 248);
    uint64_t v24 = *(void *)(v0 + 216);
    uint64_t v25 = OUTLINED_FUNCTION_9();
    v26(v25);
    id v21 = *v23;
    sub_1C1C55E2C(v2, v24);
    OUTLINED_FUNCTION_4();
    sub_1C1C9A528();
    uint64_t v27 = v59;
    *(void *)(v0 + 3ITColor::ITColor((ITColor *)this + 2) = v58;
    *(void *)(v0 + 40) = v27;
    OUTLINED_FUNCTION_7();
    sub_1C1C9A498();
    *(void *)(v0 + 120) = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA2C06B8);
    sub_1C1C9A558();
    uint64_t v29 = *(void *)(v0 + 32);
    unint64_t v28 = *(void *)(v0 + 40);
    os_log_type_t v30 = sub_1C1C9A4F8();
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_1C1C9A438();
    if (os_log_type_enabled(v31, v30))
    {
      uint64_t v32 = OUTLINED_FUNCTION_10();
      uint64_t v33 = OUTLINED_FUNCTION_8();
      uint64_t v58 = v33;
      *(_DWORD *)uint64_t v32 = 136446466;
      *(void *)(v0 + 12ITColor::ITColor((ITColor *)this + 8) = OUTLINED_FUNCTION_3(v33, v34, v35);
      sub_1C1C9A508();
      *(_WORD *)(v32 + 1ITColor::ITColor((ITColor *)this + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 13ITColor::ITColor((ITColor *)this + 6) = sub_1C1C5608C(v29, v28, &v58);
      sub_1C1C9A508();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1950000, v31, v30, "%{public}s%{public}s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    sub_1C1C55E90(*(void *)(v0 + 216));
  }
  else
  {
    if (v17 == *MEMORY[0x1E4F4DED0])
    {
      id v21 = 0;
      uint64_t v22 = 1;
      goto LABEL_20;
    }
    sub_1C1C55E2C(v2, *(void *)(v0 + 208));
    OUTLINED_FUNCTION_4();
    sub_1C1C9A528();
    uint64_t v36 = v59;
    *(void *)(v0 + 4ITColor::ITColor((ITColor *)this + 8) = v58;
    *(void *)(v0 + 5ITColor::ITColor((ITColor *)this + 6) = v36;
    OUTLINED_FUNCTION_7();
    sub_1C1C9A498();
    sub_1C1C9A558();
    uint64_t v38 = *(void *)(v0 + 48);
    unint64_t v37 = *(void *)(v0 + 56);
    os_log_type_t v39 = sub_1C1C9A4F8();
    swift_bridgeObjectRetain_n();
    uint64_t v40 = sub_1C1C9A438();
    if (os_log_type_enabled(v40, v39))
    {
      uint64_t v41 = OUTLINED_FUNCTION_10();
      uint64_t v42 = OUTLINED_FUNCTION_8();
      uint64_t v58 = v42;
      *(_DWORD *)uint64_t v41 = 136446466;
      *(void *)(v0 + 9ITColor::ITColor((ITColor *)this + 6) = OUTLINED_FUNCTION_3(v42, v43, v44);
      sub_1C1C9A508();
      *(_WORD *)(v41 + 1ITColor::ITColor((ITColor *)this + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 10ITColor::ITColor((ITColor *)this + 4) = sub_1C1C5608C(v38, v37, &v58);
      sub_1C1C9A508();
      OUTLINED_FUNCTION_11();
      _os_log_impl(&dword_1C1950000, v40, v39, "%{public}s%{public}s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();

      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_11();
    }
    uint64_t v46 = *(void *)(v0 + 240);
    uint64_t v45 = *(void *)(v0 + 248);
    uint64_t v47 = *(void *)(v0 + 232);
    sub_1C1C55E90(*(void *)(v0 + 208));
    uint64_t v48 = sub_1C1C9A488();
    uint64_t v50 = v49;
    id v51 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    id v21 = sub_1C1C55D7C(v48, v50, 0, 0);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
  }
  uint64_t v22 = 0;
LABEL_20:
  uint64_t v52 = *(void **)(v0 + 272);
  uint64_t v53 = *(void *)(v0 + 256);
  uint64_t v54 = *(void *)(v0 + 232);
  uint64_t v55 = *(void *)(v0 + 240);
  (*(void (**)(uint64_t, id))(v0 + 176))(v22, v21);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v53, v54);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v56();
}

uint64_t sub_1C1C556EC()
{
  uint64_t v15 = v0;

  if (qword_1EA2C0660 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = __swift_project_value_buffer(*(void *)(v0 + 192), (uint64_t)qword_1EA2C0F50);
  sub_1C1C55E2C(v3, v2);
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  sub_1C1C9A528();
  *(void *)(v0 + 1ITColor::ITColor((ITColor *)this + 6) = 0;
  *(void *)(v0 + 2ITColor::ITColor((ITColor *)this + 4) = 0xE000000000000000;
  OUTLINED_FUNCTION_7();
  sub_1C1C9A498();
  *(void *)(v0 + 11ITColor::ITColor((ITColor *)this + 2) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA2C06B8);
  sub_1C1C9A558();
  sub_1C1C9A498();
  uint64_t v5 = *(void *)(v0 + 16);
  unint64_t v4 = *(void *)(v0 + 24);
  os_log_type_t v6 = sub_1C1C9A4F8();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1C1C9A438();
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v8 = OUTLINED_FUNCTION_10();
    v14[0] = OUTLINED_FUNCTION_8();
    *(_DWORD *)uint64_t v8 = 136446466;
    *(void *)(v0 + 8ITColor::ITColor((ITColor *)this + 8) = sub_1C1C5608C(0, 0xE000000000000000, v14);
    sub_1C1C9A508();
    *(_WORD *)(v8 + 1ITColor::ITColor((ITColor *)this + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 80) = sub_1C1C5608C(v5, v4, v14);
    sub_1C1C9A508();
    OUTLINED_FUNCTION_11();
    _os_log_impl(&dword_1C1950000, v7, v6, "%{public}s%{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_11();
  }
  uint64_t v9 = *(void **)(v0 + 288);
  uint64_t v10 = *(void (**)(void, void *))(v0 + 176);
  sub_1C1C55E90(*(void *)(v0 + 200));
  id v11 = v9;
  v10(0, v9);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v12();
}

uint64_t sub_1C1C559D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C1C9A4D8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1C1C56A38(a1);
  }
  else
  {
    sub_1C1C9A4C8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C1C9A4B8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 1ITColor::ITColor((ITColor *)this + 6) = a2;
  *(void *)(v7 + 2ITColor::ITColor((ITColor *)this + 4) = a3;
  return swift_task_create();
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

void sub_1C1C55C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1C1C9A3D8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_1C1C55CA8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C1C55CE0(uint64_t a1, uint64_t a2)
{
  sub_1C1C55C38(a1, a2, *(void *)(v2 + 16));
}

id sub_1C1C55CE8()
{
  uint64_t v0 = (void *)sub_1C1C9A478();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_1C1C9A478();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bagForProfile_profileVersion_, v0, v1);

  return v2;
}

id sub_1C1C55D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_1C1C9A478();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_1C1C9A468();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_1C1C55E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SKLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1C55E90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SKLogger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C1C55EEC(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 1ITColor::ITColor((ITColor *)this + 6) = v4;
  void *v4 = v2;
  v4[1] = sub_1C1C55FC8;
  return v6(a1);
}

uint64_t sub_1C1C55FC8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v3();
}

uint64_t sub_1C1C5608C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C1C56160(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C1C56C18((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C1C56C18((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C1C56160(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1C1C562B8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C1C9A518();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1C1C56390(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1C1C9A548();
    if (!v8)
    {
      uint64_t result = sub_1C1C9A568();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_1C1C562B8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C1C9A578();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1C1C56390(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C1C56428(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1C1C56604(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1C1C56604((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 1ITColor::ITColor((ITColor *)this + 6) = v4 + 1;
  *(unsigned char *)(v2 + 32 + vITColor::ITColor((ITColor *)this + 4) = 0;
  return v2;
}

uint64_t sub_1C1C56428(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1C1C9A4A8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_1C1C5659C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1C1C9A538();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1C1C9A578();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1C1C9A568();
  __break(1u);
  return result;
}

void *sub_1C1C5659C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA2C06C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C1C56604(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA2C06C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + ITColor::ITColor((ITColor *)this + 2) = v8;
    *((void *)v10 + ITColor::ITColor((ITColor *)this + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C1C567B4(v13, v8, v12);
    *(void *)(a4 + 1ITColor::ITColor((ITColor *)this + 6) = 0;
  }
  else
  {
    sub_1C1C566DC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C1C566DC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C1C9A578();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1C1C567B4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C1C9A578();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1C1C56844()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1C1C5689C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 1ITColor::ITColor((ITColor *)this + 6) = v11;
  void *v11 = v2;
  v11[1] = sub_1C1C56978;
  return sub_1C1C54BAC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C1C56978()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v3();
}

uint64_t sub_1C1C56A38(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA2C0680);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C1C56A98()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1C56AD0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 1ITColor::ITColor((ITColor *)this + 6) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C1C56978;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA2C0698 + dword_1EA2C0698);
  return v6(a1, v4);
}

unint64_t sub_1C1C56B88()
{
  unint64_t result = qword_1EA2C06B0;
  if (!qword_1EA2C06B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA2C06B0);
  }
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

uint64_t sub_1C1C56C18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 2ITColor::ITColor((ITColor *)this + 4) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  return sub_1C1C5608C(0, 0xE000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1C1C56D28()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void SKUIMediaQueryNetworkTypeString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIMediaQueryNetworkTypeString";
}

void SKUIAppearanceStyleBarButtonItem_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIAppearanceStyleNavigationBar_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUITintedImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIBundle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIAllowsLandscapePhone_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIImageExistsWithResourceName_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIImageWithResourceName_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIResourceImageSetRegisterWithBundle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUISetExternalResourceManager_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUILinkArrowImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUILinkArrowButton_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIMoreDisclosureImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUISearchNoResultsImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIRangesForFormatString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIStoreAssetResourceLoaderConfigureWithDelegate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUICacheCodingDecodeArray_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUICacheCodingDecodeArray";
}

void SKUICacheCodingEncodeArray_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUICacheCodingEncodeArray";
}

void SKUIColorWithHTMLCode_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIColorSchemeStyleForColor_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIColorSchemeStyleForColor";
}

void SKUIBorderColorWithBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIColorForStyleWithBrightness_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIColorByAdjustingBrightness_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIColorByAdjustingBrightness";
}

void SKUIColorForStyleWithAlpha_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIColorWithAlpha_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIHexValueWithString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUITableViewGroupedBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIIconColorsForColorScheme_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIIconColorsForColorScheme";
}

void SKUIIconFrameForIconSize_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIIconFrameForIconSize";
}

uint64_t getCNComposeRecipientViewDidChangeNotification_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[SKUIURLResolverDataConsumer objectForData:response:error:](v0);
}

void SKUIImageTreatmentForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIErrorDocumentTitle_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIErrorDocumentTitle";
}

void SKUIPageComponentClassForComponentType_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIPageComponentClassForComponentType";
}

void SKUIPageComponentTypeForBlockType_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIPageComponentTypeForFeaturedContentKind_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIPageComponentFontWeightForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIStorePageItemsWithStorePlatformDictionary_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIStorePageTypeIsProductPage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIBadgeImageFromText_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIBadgeImageFromText";
}

void SKUITrackListColumnIdentifierForViewElement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementDateWithString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementTextDeadlockFix_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIGraphicsDeviceHasASTCSupport_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIGraphicsMatchViewBorderToStroke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIGraphicsMatchViewBorderToStroke";
}

void SKUIGraphicsCreateASTCDataFromImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIGraphicsCreateASTCDataFromImage_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIGraphicsCreateASTCDataFromBitmapContext_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIGraphicsGetASTCImageFromCurrentImageContext_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __SoftLinkImageIO_block_invoke_cold_1()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 28, "imageIOFramework != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_2()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 31, "weak_kCGImagePropertyEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_3()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 34, "weak_kCGImagePropertyASTCBlockSize != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_4()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 37, "weak_kCGImagePropertyASTCEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_5()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 40, "weak_CGImageDestinationCreateWithData != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_6()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 43, "weak_CGImageDestinationAddImage != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_7()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 46, "weak_CGImageDestinationFinalize != NULL");
}

void SKUIResourceLoaderGetNameForObject_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIResourceLoadCountMapClear_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIResourceLoadCountMapDecrement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIResourceLoadCountMapGet_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIResourceLoadCountMapIncrement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getAMSURLParserClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSUIDynamicViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIDynamicViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSUIWebViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIWebViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SKUIRedeemInputViewController initWithRedeemCategory:](v0);
}

void SKUIChartGetTitle_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIChartGetTitle";
}

void CGRectWithFlippedOriginRelativeToBoundingRect_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "CGRectWithFlippedOriginRelativeToBoundingRect";
}

void SKUIImageRectForBounds_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIImageRectForBounds";
}

void SKUIImageRectForBoundsAndPadding_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewSetBottomBorderColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewSetTopBorderColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUILockupViewTypeForString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUILockupViewTypeForString";
}

void SKUIFacebookViewElementTypeForString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIFacebookViewElementTypeForString";
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChildren_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChild_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIViewElementAccumulatePersonalizationLibraryItemsForChild";
}

void SKUIViewElementAlignmentForStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementFontWithStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementPlainColorWithIKColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementPlainColorWithStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementNSTextAlignmentForIKElementAlignment_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementMarginForStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementPaddingForStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIConsoleLogFormat_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIConsoleLogFormat";
}

void SKUIConsoleLogObjects_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIConsoleLogObjects";
}

void SKUIInitializeDOMFeatureFactory_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIInitializeDOMFeatureFactory";
}

void SKUIRegisterDOMFeatureFactory_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIRegisterDOMFeatureFactory";
}

void SKUIScrollViewLayoutTopBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIScrollViewLayoutTopBackgroundColorForProductPage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIScrollViewSetTopBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getEAGLContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[SKUIProductPageAction actionWithType:](v0);
}

void _SKUIIndexBarControlInitialization_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "_SKUIIndexBarControlInitialization";
}

void SKUIGetFamilyMemberImage_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIGetFamilyMemberImage";
}

void SKUIConfigureDownloadsCellView_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIConfigureDownloadsCellView";
}

void SKUIDownloadsStatusString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIDownloadsStatusString";
}

void SKUIFontForTextStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIFontLimitedPreferredFontForTextStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIFontPreferredFontForTextStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIButtonViewTypeForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIIKViewElementTypeIsButton_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIInitializeViewElementStyleFactory_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIInitializeViewElementStyleFactory";
}

void SKUIWishlistItemPropertiesWithItem_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIWishlistOperationQueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUITracklistAttributedStringForButton_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUITracklistAttributedStringForLabel_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIStringFromProductLockupLayoutSizing_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIStringFromProductLockupLayoutSizing";
}

void SKUINearMeIsEnabledForAuthorizationStatus_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUINearMeIsEnabledForAuthorizationStatus";
}

void SKUILocationIsAccurate_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUILocationIsAccurate";
}

uint64_t __getAMSBagClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SKUIWishlistViewController initWithNibName:bundle:](v0);
}

void SKUIRequiredVisibilitySetForLocalizedIndexedCollation_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIInitializeViewElementFactory_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIInitializeViewElementFactory";
}

void SKUIPopoverBackdropViewForView_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIPopoverBackdropViewForView";
}

void SKUIPhysicalCircleConstantsWithTraitCollection_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIPhysicalCircleConstantsWithTraitCollection";
}

void SKUIMessageBannerAttributedString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIMessageBannerAttributedString";
}

void SKUICardElementTypeForString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUICardElementTypeForString";
}

void SKUIMetricsMediaEventTypeForPlaybackState_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUISetShouldReverseLayoutDirectionWithContext_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIRectByApplyingUserInterfaceLayoutDirectionInRect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIRectByRemovingUserInterfaceLayoutDirectionInRect_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIRectByRemovingUserInterfaceLayoutDirectionInRect";
}

void SKUISpacePageComponentHeightForString_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUISpacePageComponentHeightForString";
}

void SKUIAttributedStringGetLineHeight_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIAttributedStringGetLineHeight";
}

void SKUIGetLayoutProperties_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIGetLayoutProperties";
}

void SKUIScaleSizeToFit_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIScaleSizeToFit";
}

void SKUIProductPageFragmentWithURL_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUIProductPageFragmentWithURL";
}

void SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIVideoPreviewPlayPlayableAsset_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIVideoPreviewDismissOnEnterBackground_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIVideoPreviewObservePlayer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUICollectionViewUpdatePerspectiveCells_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "SKUICollectionViewUpdatePerspectiveCells";
}

void SKUIDecodeRestorableStateWithCoder_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIEncodeRestorableStateWithCoder_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUINavigationControllerWillShowViewController_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUINavigationControllerDidShowViewController_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIScrollViewSetPinnedHeaderContentInsets_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIScrollViewSetDefaultContentInsets_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUILayoutGuideInsets_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUILabelViewStyleForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUILabelStringAttributesWithSpanElement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_1C1C9A3D8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C1C9A3E8()
{
  return MEMORY[0x1F410A968]();
}

uint64_t sub_1C1C9A3F8()
{
  return MEMORY[0x1F410A980]();
}

uint64_t sub_1C1C9A408()
{
  return MEMORY[0x1F410A988]();
}

uint64_t sub_1C1C9A418()
{
  return MEMORY[0x1F410A9B0]();
}

uint64_t sub_1C1C9A428()
{
  return MEMORY[0x1F410A9B8]();
}

uint64_t sub_1C1C9A438()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C1C9A448()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C1C9A458()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C1C9A468()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C1C9A478()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C1C9A488()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C1C9A498()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C1C9A4A8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C1C9A4B8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C1C9A4C8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C1C9A4D8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C1C9A4E8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C1C9A4F8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C1C9A508()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C1C9A518()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C1C9A528()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C1C9A538()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C1C9A548()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C1C9A558()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C1C9A568()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C1C9A578()
{
  return MEMORY[0x1F4185398]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
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

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
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
  return MEMORY[0x1F40D53B0]();
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

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1F40D9840](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCProfile(CFDataRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B50](data);
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
  return (CGGradientRef)MEMORY[0x1F40DA768](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
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
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1F4109338]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x1F4109358]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF390](name, matrix, size);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x1F40DF420]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1F40DF6B8](frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return (CGPathRef)MEMORY[0x1F40DF6C0](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1 = MEMORY[0x1F40DF6D0](frame);
  result.length = v2;
  result.id location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x1F40DF700](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1F40DF778](line, *(void *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x1F40DF810](line);
  result.length = v2;
  result.id location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  MEMORY[0x1F40DF818](line);
  return result;
}

uint64_t ISDictionaryValueForCaseInsensitiveString()
{
  return MEMORY[0x1F4177C60]();
}

uint64_t ISErrorIsEqual()
{
  return MEMORY[0x1F4177C68]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1F40E7198](table, key, originalKey, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment)
{
  return MEMORY[0x1F4165098](ctTextAlignment);
}

uint64_t SKGetRatingStarsImage()
{
  return MEMORY[0x1F40F7C38]();
}

uint64_t SSDebugFileLevel()
{
  return MEMORY[0x1F415C900]();
}

uint64_t SSDebugLevel()
{
  return MEMORY[0x1F415C908]();
}

uint64_t SSDebugLog()
{
  return MEMORY[0x1F415C910]();
}

uint64_t SSDebugShouldLogNetworkTimingMetrics()
{
  return MEMORY[0x1F415C918]();
}

uint64_t SSDialogGetDaemonDialogState()
{
  return MEMORY[0x1F415C928]();
}

uint64_t SSDownloadKindIsEBookKind()
{
  return MEMORY[0x1F415C930]();
}

uint64_t SSDownloadKindIsSoftwareKind()
{
  return MEMORY[0x1F415C938]();
}

uint64_t SSError()
{
  return MEMORY[0x1F415C940]();
}

uint64_t SSFileIsLocalWritable()
{
  return MEMORY[0x1F415C948]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x1F415C950]();
}

uint64_t SSGetStringForNetworkType()
{
  return MEMORY[0x1F415C958]();
}

uint64_t SSVAddMediaSocialHeadersToURLRequest()
{
  return MEMORY[0x1F415C960]();
}

uint64_t SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest()
{
  return MEMORY[0x1F415C968]();
}

uint64_t SSVDefaultUserAgent()
{
  return MEMORY[0x1F415C970]();
}

uint64_t SSVGetMetricsPageDescriptionWithPlatformDictionary()
{
  return MEMORY[0x1F415C980]();
}

uint64_t SSVProtocolRedirectURLForResponse()
{
  return MEMORY[0x1F415C988]();
}

uint64_t SSVStoreFrontIdentifierForAccount()
{
  return MEMORY[0x1F415C990]();
}

uint64_t SUBarButtonItemApplyStyling()
{
  return MEMORY[0x1F4177C70]();
}

uint64_t SUCreateHTMLForPlainText()
{
  return MEMORY[0x1F4177C78]();
}

uint64_t SUCreatePreviewHistoryOperation()
{
  return MEMORY[0x1F4177C80]();
}

uint64_t SUNavigationBarApplyStyling()
{
  return MEMORY[0x1F4177C88]();
}

uint64_t SUWebScriptNameForSelector2()
{
  return MEMORY[0x1F4177C90]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4166B28]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4166B90]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1F4166BB0]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4166BB8]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1F4166C10]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

uint64_t UIITunesStoreResolvedURLForHTTPURL()
{
  return MEMORY[0x1F4166C70]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x1F4166DB8]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x1F4166DC0]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
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

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814E0](cls, protocol);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
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
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
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

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

void srand48(uint64_t a1)
{
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}