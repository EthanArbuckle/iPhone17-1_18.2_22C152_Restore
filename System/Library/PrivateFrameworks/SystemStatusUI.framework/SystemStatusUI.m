void sub_1D7E3E9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7E3F278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7E428F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

id STUIStatusBarGetVisualProviderClassForScreen(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 _isEmbeddedScreen];
  int v6 = v5;
  if (v5)
  {
    NativeVisualProviderClassForScreenWithVisualProviderInfo = (void *)STUIStatusBarMainVisualProviderClass;
    if (STUIStatusBarMainVisualProviderClass) {
      goto LABEL_18;
    }
  }
  if (v5)
  {
    v8 = +[STUIStatusBarSettingsDomain rootSettings];
    v9 = [v8 visualProviderSettings];
    v10 = [v9 visualProviderClassName];

    if ([(NSString *)v10 length])
    {
      Class v11 = NSClassFromString(v10);
      if (v11)
      {
        NativeVisualProviderClassForScreenWithVisualProviderInfo = v11;
        Superclass = v11;
        while (!class_conformsToProtocol(Superclass, (Protocol *)&unk_1F2FB0A80))
        {
          Superclass = class_getSuperclass(Superclass);
          if (!Superclass) {
            goto LABEL_9;
          }
        }
        NSLog(&cfstr_WarningUsingOv.isa, NativeVisualProviderClassForScreenWithVisualProviderInfo);
        goto LABEL_15;
      }
    }
LABEL_9:
  }
  NativeVisualProviderClassForScreenWithVisualProviderInfo = STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo(v3, v4);
  if (NativeVisualProviderClassForScreenWithVisualProviderInfo) {
    goto LABEL_16;
  }
  [v3 _unjailedReferenceBounds];
  CGFloat Width = CGRectGetWidth(v26);
  [v3 _nativeScale];
  uint64_t v15 = v14;
  v16 = [v3 traitCollection];
  uint64_t v17 = [v16 userInterfaceIdiom];

  [v3 _displayCornerRadius];
  v10 = [NSString stringWithFormat:@"No status bar visual provider for screen %@ (width: %.2f, scale: %.2f, idiom: %ld, cornerRadius: %.2f). Please see rdar://45025538.", v3, *(void *)&Width, v15, v17, v18];
  v19 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    _os_log_impl(&dword_1D7E39000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  NativeVisualProviderClassForScreenWithVisualProviderInfo = objc_opt_class();
LABEL_15:

LABEL_16:
  if (v6) {
    STUIStatusBarMainVisualProviderClass = (uint64_t)NativeVisualProviderClassForScreenWithVisualProviderInfo;
  }
LABEL_18:
  id v20 = NativeVisualProviderClassForScreenWithVisualProviderInfo;

  return v20;
}

void sub_1D7E491CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x218]);
  _Unwind_Resume(a1);
}

void sub_1D7E4B8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

id STUIStatusBarGetPriorityComparator()
{
  if (STUIStatusBarGetPriorityComparator_onceToken != -1) {
    dispatch_once(&STUIStatusBarGetPriorityComparator_onceToken, &__block_literal_global_14);
  }
  v0 = _Block_copy((const void *)STUIStatusBarGetPriorityComparator_priorityComparator);
  return v0;
}

void sub_1D7E4D11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _updateSquishyRegionForDynamicValues(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  if ([v5 maxNumberOfVisibleItems] == a2
    && ([v5 itemDynamicScale], vabdd_f64(a3, v6) <= 0.0001))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [v5 setMaxNumberOfVisibleItems:a2];
    [v5 setItemDynamicScale:a3];
    uint64_t v7 = 1;
  }

  return v7;
}

id STUIStatusBarAddLumaView(void *a1, void *a2, void *a3, uint64_t a4, double a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = objc_alloc(MEMORY[0x1E4FB21E8]);
  v13 = objc_msgSend(v12, "initWithTransitionBoundaries:delegate:frame:", 0, 0.4, 0.7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (a4 == 2)
  {
    uint64_t v14 = [v13 trailingAnchor];
    uint64_t v15 = [v11 trailingAnchor];
  }
  else
  {
    if (a4 == 1)
    {
      uint64_t v14 = [v13 leadingAnchor];
      [v11 leadingAnchor];
    }
    else
    {
      uint64_t v14 = [v13 centerXAnchor];
      [v11 centerXAnchor];
    uint64_t v15 = };
  }
  v16 = (void *)v15;
  uint64_t v17 = [v14 constraintEqualToAnchor:v15];
  [v10 addObject:v17];

  uint64_t v18 = [v13 topAnchor];
  v19 = [v9 topAnchor];
  id v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
  [v10 addObject:v20];

  v21 = [v13 centerYAnchor];
  v22 = [v11 centerYAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];

  LODWORD(v24) = 1144750080;
  [v23 setPriority:v24];
  [v10 addObject:v23];
  v25 = [v13 layer];
  objc_opt_class();
  double v26 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v25 scale];
    double v28 = v27;
    [v9 _currentScreenScale];
    if (v29 > 0.0)
    {
      double v30 = v29;
      if (v28 * (v29 * a5) < 32.0)
      {
        [v25 setScale:1.0];
        double v26 = 32.0 / v30;
      }
    }
  }
  v31 = [v13 widthAnchor];
  v32 = v31;
  if (v26 >= a5) {
    a5 = v26;
  }
  v33 = [v31 constraintEqualToConstant:a5];
  [v10 addObject:v33];

  v34 = [v13 heightAnchor];
  v35 = [v34 constraintEqualToConstant:a5];
  [v10 addObject:v35];

  [v9 insertSubview:v13 atIndex:0];
  return v13;
}

void scaleForWidth(void *a1)
{
  v1 = [a1 lastObject];
  [v1 doubleValue];
}

void sub_1D7E53B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t numberOfItemsForWidth(void *a1, double a2)
{
  id v3 = a1;
  if ([v3 count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [v3 objectAtIndexedSubscript:v4];
      [v5 doubleValue];
      double v7 = v6 * 0.846;

      if (v7 >= a2) {
        break;
      }
      if (++v4 >= (unint64_t)[v3 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v4 = [v3 count];
  }

  return v4;
}

uint64_t __STUIStatusBarGetPriorityComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 priority];
  if (v6 <= [v5 priority])
  {
    uint64_t v8 = [v4 priority];
    uint64_t v7 = v8 < [v5 priority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
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

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __STUIStatusBarAddDefaultAnimationReposition_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0
    && ([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 48) addSubAnimation:*(void *)(a1 + 56) forDisplayItemWithIdentifier:v3];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void sub_1D7E594C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7E5974C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7E59B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7E59D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7E5A374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a57, 8);
  objc_destroyWeak(location);
  objc_destroyWeak(&a66);
  _Unwind_Resume(a1);
}

double _avoidanceFrameInLocalCoordinateSpace(void *a1)
{
  id v1 = a1;
  v2 = [v1 statusBar];
  id v3 = [v1 statusBar];

  [v3 avoidanceFrame];
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  memset(&v15, 0, sizeof(v15));
  if (v2) {
    [v2 _effectiveScaleTransform];
  }
  CGAffineTransform v14 = v15;
  if (!CGAffineTransformIsIdentity(&v14))
  {
    CGAffineTransform v13 = v15;
    CGAffineTransformInvert(&v14, &v13);
    CGAffineTransform v15 = v14;
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    *(void *)&double v5 = (unint64_t)CGRectApplyAffineTransform(v16, &v14);
  }

  return v5;
}

void sub_1D7E5F30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __STUIStatusBarDefaultRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id STUIStatusBarDynamicSplitDefaultAnimation(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x4010000000;
  v14[3] = "";
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v15 = *MEMORY[0x1E4F1DB28];
  long long v16 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke;
  v13[3] = &unk_1E6AA3810;
  v13[4] = v17;
  v13[5] = v14;
  double v6 = +[STUIStatusBarAnimation animationWithBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke_2;
  v12[3] = &unk_1E6AA3E90;
  v12[4] = v14;
  [v6 setPrepareBlock:v12];
  [v6 setDelaysAnimatingItems:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke_3;
  v11[3] = &unk_1E6AA3FF8;
  v11[4] = v17;
  STUIStatusBarAddDefaultAnimationReposition(v3, v6, v4, v11);
  CGFloat v7 = (void *)MEMORY[0x1E4F1CAD0];
  double v8 = [v3 orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  CGFloat v9 = [v7 setWithArray:v8];
  [v6 setDelayedDisplayItemPlacements:v9];

  [v6 setPriority:-100];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v17, 8);

  return v6;
}

void sub_1D7E60484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void STUIStatusBarAddDefaultAnimationReposition(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v29 = a2;
  id v8 = a3;
  id v27 = a4;
  double v26 = [MEMORY[0x1E4F1CA80] set];
  CGFloat v9 = [v7 statusBar];
  double v28 = v8;
  double v10 = [v9 stateForDisplayItemWithIdentifier:v8];
  CGFloat v11 = [v10 potentialPlacementRegionIdentifiers];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * v15);
        uint64_t v17 = [v7 statusBar];
        id v18 = [v17 regions];
        v19 = [v18 objectForKeyedSubscript:v16];

        id v20 = STUIStatusBarDefaultRepositionAnimation(v19, v27, 0, 100.0, 20.0);
        [v20 setIdentifier:@"defaultAnimationReposition"];
        [v20 setPriority:-200];
        v21 = [v7 statusBar];
        uint64_t v39 = v16;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        v23 = [v21 displayItemIdentifiersInRegionsWithIdentifiers:v22];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __STUIStatusBarAddDefaultAnimationReposition_block_invoke;
        v30[3] = &unk_1E6AA4188;
        id v31 = v28;
        id v32 = v26;
        id v33 = v29;
        id v34 = v20;
        id v24 = v20;
        [v23 enumerateObjectsUsingBlock:v30];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }
}

id STUIStatusBarInternalRepositionAnimation(void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  id v29 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke;
  v24[3] = &unk_1E6AA4228;
  id v13 = v11;
  id v25 = v13;
  id v27 = v28;
  id v14 = v10;
  id v26 = v14;
  uint64_t v15 = +[STUIStatusBarAnimation animationWithBlock:v24];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_5;
  v19[3] = &unk_1E6AA4250;
  id v16 = v9;
  char v23 = a2;
  id v20 = v16;
  v22 = v28;
  id v17 = v12;
  id v21 = v17;
  [v15 setPrepareBlock:v19];

  _Block_object_dispose(v28, 8);
  return v15;
}

void sub_1D7E60A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STUIStatusBarDefaultRepositionAnimation(void *a1, void *a2, void *a3, double a4, double a5)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __STUIStatusBarDefaultRepositionAnimation_block_invoke;
  v13[3] = &__block_descriptor_48_e24_v24__0___v___8___v__B_16l;
  *(double *)&v13[4] = a4;
  *(double *)&v13[5] = a5;
  id v7 = a3;
  id v8 = a2;
  id v9 = a1;
  id v10 = _Block_copy(v13);
  id v11 = STUIStatusBarInternalRepositionAnimation(v9, 1, v10, v8, v7);

  return v11;
}

void sub_1D7E613E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);
  _Unwind_Resume(a1);
}

void __STUIStatusBarInternalRepositionAnimation_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[4];
  if (!v10 || (*(unsigned int (**)(uint64_t, id))(v10 + 16))(v10, v8))
  {
    id v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
    id v12 = [v8 identifier];
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      [v13 CGRectValue];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [v8 absoluteFrame];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
    }
    else
    {
      CGFloat v23 = *MEMORY[0x1E4F1DB28];
      CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v21 = v29;
      double v19 = v27;
      double v17 = v25;
      double v15 = *MEMORY[0x1E4F1DB28];
    }
    v48.origin.x = v23;
    v48.origin.y = v25;
    v48.size.width = v27;
    v48.size.height = v29;
    if (CGRectIsEmpty(v48))
    {
      v49.origin.x = v23;
      v49.origin.y = v25;
      v49.size.width = v27;
      v49.size.height = v29;
      v52.origin.x = v15;
      v52.origin.y = v17;
      v52.size.width = v19;
      v52.size.height = v21;
      CGRectEqualToRect(v49, v52);
    }
    else
    {
      v50.origin.x = v15;
      v50.origin.y = v17;
      v50.size.width = v19;
      v50.size.height = v21;
      BOOL IsEmpty = CGRectIsEmpty(v50);
      v51.origin.x = v23;
      v51.origin.y = v25;
      v51.size.width = v27;
      v51.size.height = v29;
      v53.origin.x = v15;
      v53.origin.y = v17;
      v53.size.width = v19;
      v53.size.height = v21;
      if (!CGRectEqualToRect(v51, v53) && !IsEmpty && [v8 isEnabled])
      {
        id v31 = [v8 view];
        [v31 _removeAllRetargetableAnimations:1];

        objc_msgSend(v8, "setAbsoluteFrame:", v15, v17, v19, v21);
        uint64_t v32 = a1[5];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_2;
        v42[3] = &unk_1E6AA38D8;
        id v33 = v8;
        id v43 = v33;
        CGFloat v44 = v23;
        CGFloat v45 = v25;
        CGFloat v46 = v27;
        CGFloat v47 = v29;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_3;
        v40[3] = &unk_1E6AA4200;
        id v41 = v9;
        (*(void (**)(uint64_t, void *, void *))(v32 + 16))(v32, v42, v40);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_4;
        v34[3] = &unk_1E6AA38D8;
        id v35 = v33;
        CGFloat v36 = v23;
        CGFloat v37 = v25;
        CGFloat v38 = v27;
        CGFloat v39 = v29;
        [v7 addTimeout:v34 withHandler:2.0];

LABEL_14:
        goto LABEL_15;
      }
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    goto LABEL_14;
  }
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_15:
}

uint64_t __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 region];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

void __STUIStatusBarDefaultRepositionAnimation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4FB1EB0];
  double v8 = *(double *)(a1 + 32);
  double v9 = *(double *)(a1 + 40);
  id v13 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __STUIStatusBarDefaultRepositionAnimation_block_invoke_2;
  v14[3] = &unk_1E6AA4278;
  id v15 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __STUIStatusBarDefaultRepositionAnimation_block_invoke_3;
  v12[3] = &unk_1E6AA3900;
  id v10 = v6;
  id v11 = v5;
  [v7 _animateUsingSpringWithTension:0 friction:v14 interactive:v12 animations:v8 completion:v9];
}

void __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a2 type];
  id v10 = [v7 region];
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (v9 == 2)
  {
    double v14 = [v7 view];
    [v14 _removeAllRetargetableAnimations:1];

    objc_msgSend(v7, "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  }
  else
  {
    [v7 setAlpha:0.0];
    CGAffineTransformMakeScale(&v17, 0.85, 0.85);
    CGAffineTransform v16 = v17;
    [v7 setTransform:&v16];
  }
  if (v9 == 1) {
    double v15 = 0.3;
  }
  else {
    double v15 = 0.0;
  }
  STUIStatusBarDynamicSplitPerformBaseAnimation(v7, v9 == 2, 0, v9 == 2, v8, 0.85, 0.25, v15);
}

void STUIStatusBarDynamicSplitPerformBaseAnimation(void *a1, int a2, char a3, int a4, void *a5, double a6, double a7, double a8)
{
  id v14 = a1;
  double v15 = (void *)MEMORY[0x1E4F39B48];
  id v16 = a5;
  CGAffineTransform v17 = [v15 animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  double v18 = [v14 view];
  double v19 = [v18 layer];
  double v20 = [v19 presentationLayer];
  double v21 = [v20 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];

  if (a2)
  {
    if (v21) {
      double v22 = v21;
    }
    else {
      double v22 = &unk_1F2F9CC70;
    }
    CGFloat v23 = &unk_1F2F9CC80;
  }
  else if (v21)
  {
    [v21 doubleValue];
    if (v24 == 0.0) {
      double v22 = &unk_1F2F9CC80;
    }
    else {
      double v22 = v21;
    }
    CGFloat v23 = &unk_1F2F9CC70;
  }
  else
  {
    CGFloat v23 = &unk_1F2F9CC70;
    double v22 = &unk_1F2F9CC80;
  }
  [v17 setFromValue:v22];
  [v17 setToValue:v23];
  [v17 setDuration:a7];
  CGFloat v25 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v17 setTimingFunction:v25];

  [v17 setBeginTimeMode:@"relative"];
  [v17 setBeginTime:a8];
  double v26 = [v14 view];
  CGFloat v27 = [v26 layer];
  [v27 addAnimation:v17 forKey:@"blur"];

  double v28 = (void *)MEMORY[0x1E4FB1EB0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __STUIStatusBarDynamicSplitPerformBaseAnimation_block_invoke;
  v32[3] = &unk_1E6AA3FD0;
  if (a4) {
    uint64_t v29 = 4;
  }
  else {
    uint64_t v29 = 0;
  }
  char v35 = a2;
  char v36 = a3;
  id v33 = v14;
  double v34 = a6;
  id v30 = v14;
  [v28 animateWithDuration:v29 delay:v32 options:v16 animations:a7 completion:a8];
}

uint64_t __STUIStatusBarDynamicSplitPerformBaseAnimation_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = *(unsigned __int8 *)(a1 + 49);
  id v4 = *(void **)(a1 + 32);
  if (v2)
  {
    if (v3)
    {
      [v4 setDynamicHidingAlpha:0.0];
      CGAffineTransformMakeScale(&v19, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
      id v5 = *(void **)(a1 + 32);
      CGAffineTransform v18 = v19;
      id v6 = &v18;
      return [v5 setDynamicHidingTransform:v6];
    }
    [v4 setAlpha:0.0];
    CGAffineTransformMakeScale(&v17, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
    uint64_t v9 = *(void **)(a1 + 32);
    CGAffineTransform v16 = v17;
    id v10 = &v16;
  }
  else
  {
    if (v3)
    {
      [v4 setDynamicHidingAlpha:1.0];
      id v5 = *(void **)(a1 + 32);
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v15[0] = *MEMORY[0x1E4F1DAB8];
      v15[1] = v7;
      v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      id v6 = (CGAffineTransform *)v15;
      return [v5 setDynamicHidingTransform:v6];
    }
    [v4 setAlpha:1.0];
    uint64_t v9 = *(void **)(a1 + 32);
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v12 = *MEMORY[0x1E4F1DAB8];
    long long v13 = v11;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v10 = (CGAffineTransform *)&v12;
  }
  return objc_msgSend(v9, "setTransform:", v10, v12, v13, v14);
}

id _STUIStatusBar_Log()
{
  if (_STUIStatusBar_Log_onceToken != -1) {
    dispatch_once(&_STUIStatusBar_Log_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)_STUIStatusBar_Log___StatusBar_LOG;
  return v0;
}

void sub_1D7E635F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if (*(unsigned char *)(a1 + 56)) {
      [v7 displayItemAbsolutePresentationFrames];
    }
    else {
    uint64_t v8 = [v7 displayItemAbsoluteFrames];
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    double v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v8;
  }
  else if (v6)
  {
    int v9 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v10 = [v6 identifier];
    long long v11 = (void *)v10;
    if (v9)
    {
      uint64_t v37 = v10;
      long long v12 = (void *)MEMORY[0x1E4F29238];
      [v6 absolutePresentationFrame];
      v34[0] = v13;
      v34[1] = v14;
      v34[2] = v15;
      v34[3] = v16;
      CGAffineTransform v17 = [v12 valueWithBytes:v34 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v38[0] = v17;
      CGAffineTransform v18 = (void *)MEMORY[0x1E4F1C9E8];
      CGAffineTransform v19 = (void **)v38;
      double v20 = &v37;
    }
    else
    {
      uint64_t v35 = v10;
      CGFloat v23 = (void *)MEMORY[0x1E4F29238];
      [v6 absoluteFrame];
      v33[0] = v24;
      v33[1] = v25;
      v33[2] = v26;
      v33[3] = v27;
      CGAffineTransform v17 = [v23 valueWithBytes:v33 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      char v36 = v17;
      CGAffineTransform v18 = (void *)MEMORY[0x1E4F1C9E8];
      CGAffineTransform v19 = &v36;
      double v20 = &v35;
    }
    uint64_t v28 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
    id v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(uint64_t, void))(v31 + 16))(v31, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }

  return 1;
}

uint64_t __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 type] == 2)
  {
    id v6 = [v5 region];
    int v7 = [v6 isEnabled];

    if (v7)
    {
      [v5 absoluteFrame];
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
      v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      uint64_t v13 = 1;
      [v5 setFloating:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

void sub_1D7E644B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __STUIStatusBarDefaultRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D7E665E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D7E66760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7E66B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t STUIStyleOverridesForBackgroundActivityIdentifiers(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 |= STUIStyleOverrideForBackgroundActivityIdentifier(*(void **)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
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

uint64_t sub_1D7E68390(uint64_t a1)
{
  return a1;
}

uint64_t sub_1D7E683BC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE60);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(v0 + 40);
  char v7 = *(unsigned char *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE58);
  sub_1D7ECA3B0();
  swift_retain();
  swift_retain();
  *(void *)uint64_t v3 = sub_1D7ECA0D0();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE68);
  sub_1D7E68AD8((uint64_t *)v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE70);
  sub_1D7E767B4(&qword_1EA87BE78, &qword_1EA87BE60);
  sub_1D7E68FF8();
  sub_1D7E767B4(&qword_1EA87BE88, &qword_1EA87BE70);
  sub_1D7ECA350();
  swift_release();
  return swift_release();
}

uint64_t sub_1D7E6858C@<X0>(uint64_t a1@<X8>)
{
  sub_1D7ECA120();
  uint64_t v2 = sub_1D7ECA1F0();
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  char v6 = v5 & 1;
  sub_1D7ECA120();
  uint64_t v7 = sub_1D7ECA1F0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_1D7ECA120();
  uint64_t v14 = sub_1D7ECA1F0();
  uint64_t v16 = v15;
  uint64_t v17 = v2;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v23;
  LOBYTE(v2) = v18 & 1;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v22;
  *(_WORD *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v11;
  *(_WORD *)(a1 + 72) = 257;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(unsigned char *)(a1 + 96) = v18 & 1;
  *(void *)(a1 + 104) = v19;
  *(_WORD *)(a1 + 112) = 514;
  uint64_t v20 = v17;
  sub_1D7E764DC(v17, v23, v6);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v14, v16, v2);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v14, v16, v2);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v20, v23, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E68778@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C128);
  char v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  v6(a2, v4, v5);
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C190);
  v6(a2 + v7[12], a1[1], v5);
  uint64_t v8 = a2 + v7[16];
  uint64_t v9 = a1[2];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a2 + v7[20];
  uint64_t v12 = a1[3];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = a2 + v7[24];
  uint64_t v15 = a1[4];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C110);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = a2 + v7[28];
  uint64_t v18 = a1[5];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = a2 + v7[32];
  uint64_t v21 = a1[6];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = a2 + v7[36];
  uint64_t v24 = a1[7];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  uint64_t v26 = a2 + v7[40];
  uint64_t v27 = a1[8];
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  uint64_t v29 = a2 + v7[44];
  uint64_t v30 = a1[9];
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
  uint64_t v32 = a2 + v7[48];
  uint64_t v33 = a1[10];
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0E0);
  uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16);
  return v35(v32, v33, v34);
}

uint64_t sub_1D7E68AD8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1D7ECA040();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  ((void (*)(void))MEMORY[0x1F4188790])();
  char v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3D0);
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3D8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3E0);
  uint64_t v12 = *(void *)(v44 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3E8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v36 - v18;
  sub_1D7E76D20((uint64_t)(a1 + 2), (uint64_t)v49, &qword_1EA87C3F0);
  sub_1D7E76D20((uint64_t)v49, (uint64_t)v50, &qword_1EA87C3F0);
  uint64_t v45 = a2;
  if (v50[1]
    && (uint64_t v38 = v50[0],
        sub_1D7E76D20((uint64_t)(a1 + 4), (uint64_t)v48, &qword_1EA87C408),
        sub_1D7E76D20((uint64_t)v48, (uint64_t)&v51, &qword_1EA87C408),
        v51))
  {
    uint64_t v37 = v51;
    sub_1D7E76C34((uint64_t)v49);
    sub_1D7E68390((uint64_t)v48);
    uint64_t v46 = sub_1D7ECA300();
    sub_1D7ECA030();
    sub_1D7ECA230();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v41);
    swift_release();
    uint64_t v20 = sub_1D7ECA2D0();
    uint64_t v21 = v42;
    uint64_t v22 = v43;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v11, v9, v43);
    *(void *)&v11[*(int *)(v39 + 36)] = v20;
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
    sub_1D7E76C60((uint64_t)v11, (uint64_t)v14, &qword_1EA87C3D8);
    uint64_t v23 = v44;
    *(void *)&v14[*(int *)(v44 + 36)] = v37;
    sub_1D7E76CC4((uint64_t)v11, &qword_1EA87C3D8);
    sub_1D7E76D20((uint64_t)v14, (uint64_t)v19, &qword_1EA87C3E0);
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
    uint64_t v23 = v44;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v19, v24, 1, v23);
  uint64_t v25 = a1[1];
  uint64_t v46 = *a1;
  uint64_t v47 = v25;
  sub_1D7E76BE0();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_1D7ECA200();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_1D7E76C60((uint64_t)v19, (uint64_t)v17, &qword_1EA87C3E8);
  uint64_t v33 = v45;
  sub_1D7E76C60((uint64_t)v17, v45, &qword_1EA87C3E8);
  uint64_t v34 = v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C400) + 48);
  *(void *)uint64_t v34 = v26;
  *(void *)(v34 + 8) = v28;
  *(unsigned char *)(v34 + 16) = v32;
  *(void *)(v34 + 24) = v30;
  sub_1D7E764DC(v26, v28, v32);
  swift_bridgeObjectRetain();
  sub_1D7E76CC4((uint64_t)v19, &qword_1EA87C3E8);
  sub_1D7E764EC(v26, v28, v32);
  swift_bridgeObjectRelease();
  return sub_1D7E76CC4((uint64_t)v17, &qword_1EA87C3E8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1D7E68FF8()
{
  unint64_t result = qword_1EA87BE80;
  if (!qword_1EA87BE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87BE80);
  }
  return result;
}

uint64_t sub_1D7E69054()
{
  return sub_1D7ECA240();
}

uint64_t sub_1D7E69070()
{
  return sub_1D7E683BC();
}

uint64_t sub_1D7E690B4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v45 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE98);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v36 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEA0);
  uint64_t v42 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v35 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEA8);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v44 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v40 = (char *)&v34 - v9;
  uint64_t v43 = sub_1D7ECA2C0();
  long long v10 = v1[3];
  long long v48 = v1[2];
  long long v49 = v10;
  long long v50 = v1[4];
  long long v11 = v1[1];
  long long v46 = *v1;
  long long v47 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE90);
  sub_1D7ECA3B0();
  long long v13 = v51;
  uint64_t v39 = v51;
  char v14 = v52[0];
  long long v38 = *(_OWORD *)&v52[8];
  uint64_t v15 = *(void *)&v52[24];
  uint64_t v16 = *((void *)&v53 + 1);
  uint64_t v37 = v53;
  long long v17 = v54;
  swift_getKeyPath();
  long long v51 = v13;
  v52[0] = v14;
  *(_OWORD *)&v52[8] = v38;
  *(void *)&v52[24] = v15;
  *(void *)&long long v53 = v37;
  uint64_t v18 = v41;
  *((void *)&v53 + 1) = v16;
  long long v54 = v17;
  sub_1D7ECA3A0();
  uint64_t v19 = (uint64_t)v40;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  long long v20 = v46;
  char v21 = v47;
  long long v22 = v2[3];
  *(_OWORD *)&v52[16] = v2[2];
  long long v53 = v22;
  long long v54 = v2[4];
  long long v23 = v2[1];
  long long v51 = *v2;
  *(_OWORD *)CGRect v52 = v23;
  MEMORY[0x1D94822A0](&v46, v12);
  char v24 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = 1;
  if (sub_1D7E76DA4(v24, 1))
  {
    uint64_t v26 = v36;
    sub_1D7E69548(v2, v36);
    char v27 = sub_1D7ECA1C0();
    uint64_t v28 = v35;
    sub_1D7E76C60((uint64_t)v26, v35, &qword_1EA87BE98);
    uint64_t v29 = v28 + *(int *)(v18 + 36);
    *(unsigned char *)uint64_t v29 = v27;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(unsigned char *)(v29 + 40) = 1;
    sub_1D7E76CC4((uint64_t)v26, &qword_1EA87BE98);
    sub_1D7E76D20(v28, v19, &qword_1EA87BEA0);
    uint64_t v25 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v19, v25, 1, v18);
  uint64_t v30 = v44;
  sub_1D7E76C60(v19, v44, &qword_1EA87BEA8);
  char v31 = v45;
  *uint64_t v45 = 0x656469727265764FLL;
  v31[1] = 0xE800000000000000;
  v31[2] = 0xD000000000000021;
  v31[3] = 0x80000001D7ED9660;
  v31[4] = v43;
  *(_OWORD *)(v31 + 5) = v20;
  *((unsigned char *)v31 + 56) = v21;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEB0);
  sub_1D7E76C60(v30, (uint64_t)v31 + *(int *)(v32 + 48), &qword_1EA87BEA8);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D7E76CC4(v19, &qword_1EA87BEA8);
  sub_1D7E76CC4(v30, &qword_1EA87BEA8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E69548@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  v105 = a2;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C390);
  uint64_t v111 = *(void *)(v104 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v104);
  v103 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  v110 = (char *)&v91 - v5;
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB0) - 8;
  uint64_t v6 = MEMORY[0x1F4188790](v101);
  uint64_t v114 = (uint64_t)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v117 = (uint64_t)&v91 - v8;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF88);
  uint64_t v113 = *(void *)(v107 - 8);
  MEMORY[0x1F4188790](v107);
  v106 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C398) - 8;
  MEMORY[0x1F4188790](v99);
  v98 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3A0) - 8;
  uint64_t v11 = MEMORY[0x1F4188790](v100);
  uint64_t v112 = (uint64_t)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v116 = (uint64_t)&v91 - v13;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C318);
  uint64_t v109 = *(void *)(v102 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v102);
  v108 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v115 = (char *)&v91 - v16;
  uint64_t v17 = sub_1D7ECA120();
  v96 = v18;
  *(void *)&long long v97 = v17;
  LODWORD(v94) = v19;
  v95 = v20;
  long long v21 = a1[1];
  long long v22 = a1[3];
  long long v137 = a1[2];
  long long v138 = v22;
  long long v23 = a1[3];
  long long v139 = a1[4];
  long long v24 = a1[1];
  long long v135 = *a1;
  long long v136 = v24;
  long long v121 = v137;
  long long v122 = v23;
  long long v123 = a1[4];
  long long v119 = v135;
  long long v120 = v21;
  v118 = (void (*)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BE90);
  sub_1D7ECA3B0();
  long long v25 = v124;
  LOBYTE(a1) = v125;
  long long v93 = v126;
  uint64_t v27 = v127;
  uint64_t v26 = v128;
  uint64_t v29 = v129;
  uint64_t v28 = v130;
  uint64_t v30 = v131;
  swift_getKeyPath();
  long long v124 = v25;
  LOBYTE(v125) = (_BYTE)a1;
  long long v126 = v93;
  uint64_t v127 = v27;
  uint64_t v128 = v26;
  uint64_t v129 = v29;
  uint64_t v130 = v28;
  uint64_t v131 = v30;
  sub_1D7ECA3A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  long long v124 = v119;
  uint64_t v125 = v120;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C320);
  sub_1D7E76600();
  sub_1D7ECA360();
  uint64_t v31 = sub_1D7ECA120();
  uint64_t v94 = v32;
  v95 = (void (*)(uint64_t, char *, uint64_t))v31;
  int v92 = v33;
  *(void *)&long long v93 = v34;
  long long v121 = v137;
  long long v122 = v138;
  long long v123 = v139;
  long long v119 = v135;
  long long v120 = v136;
  sub_1D7ECA3B0();
  long long v35 = v124;
  LOBYTE(a1) = v125;
  long long v97 = v126;
  uint64_t v36 = v127;
  uint64_t v37 = v128;
  uint64_t v39 = v129;
  uint64_t v38 = v130;
  uint64_t v40 = v131;
  swift_getKeyPath();
  long long v124 = v35;
  LOBYTE(v125) = (_BYTE)a1;
  long long v126 = v97;
  uint64_t v127 = v36;
  uint64_t v128 = v37;
  uint64_t v129 = v39;
  uint64_t v130 = v38;
  uint64_t v131 = v40;
  sub_1D7ECA3A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  *(void *)&long long v97 = nullsub_1;
  v96 = nullsub_1;
  uint64_t v41 = v106;
  sub_1D7ECA420();
  sub_1D7ECA410();
  sub_1D7ECA010();
  uint64_t v42 = v113;
  uint64_t v43 = *(void (**)(uint64_t, char *, uint64_t))(v113 + 16);
  uint64_t v94 = v113 + 16;
  v95 = v43;
  uint64_t v44 = (uint64_t)v98;
  uint64_t v45 = v107;
  v43((uint64_t)v98, v41, v107);
  long long v46 = (_OWORD *)(v44 + *(int *)(v99 + 44));
  long long v47 = v133;
  *long long v46 = v132;
  v46[1] = v47;
  v46[2] = v134;
  long long v48 = *(void (**)(char *, uint64_t))(v42 + 8);
  uint64_t v113 = v42 + 8;
  uint64_t v99 = (uint64_t)v48;
  v48(v41, v45);
  uint64_t v49 = sub_1D7ECA140();
  uint64_t v50 = v112;
  sub_1D7E76C60(v44, v112, &qword_1EA87C398);
  long long v51 = (uint64_t *)(v50 + *(int *)(v100 + 44));
  *long long v51 = v49;
  v51[1] = (uint64_t)sub_1D7E76DA0;
  v51[2] = 0;
  sub_1D7E76CC4(v44, &qword_1EA87C398);
  sub_1D7E76D20(v50, v116, &qword_1EA87C3A0);
  *(void *)&long long v100 = sub_1D7ECA120();
  v98 = v52;
  int v92 = v53;
  *(void *)&long long v93 = v54;
  long long v121 = v137;
  long long v122 = v138;
  long long v123 = v139;
  long long v119 = v135;
  long long v120 = v136;
  sub_1D7ECA3B0();
  long long v55 = v124;
  LOBYTE(v49) = v125;
  long long v91 = v126;
  uint64_t v56 = v127;
  uint64_t v57 = v128;
  uint64_t v58 = v129;
  uint64_t v59 = v130;
  uint64_t v60 = v131;
  swift_getKeyPath();
  long long v124 = v55;
  LOBYTE(v125) = v49;
  long long v126 = v91;
  uint64_t v127 = v56;
  uint64_t v128 = v57;
  uint64_t v129 = v58;
  uint64_t v130 = v59;
  uint64_t v131 = v60;
  sub_1D7ECA3A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v61 = v106;
  sub_1D7ECA420();
  uint64_t v62 = sub_1D7ECA140();
  uint64_t v63 = v114;
  uint64_t v64 = v107;
  v95(v114, v61, v107);
  v65 = (uint64_t *)(v63 + *(int *)(v101 + 44));
  uint64_t *v65 = v62;
  v65[1] = (uint64_t)sub_1D7E76DA0;
  v65[2] = 0;
  ((void (*)(char *, uint64_t))v99)(v61, v64);
  sub_1D7E76D20(v63, v117, &qword_1EA87BFB0);
  uint64_t v113 = sub_1D7ECA120();
  v106 = v67;
  uint64_t v107 = v66;
  LODWORD(v101) = v68;
  long long v121 = v137;
  long long v122 = v138;
  long long v123 = v139;
  long long v119 = v135;
  long long v120 = v136;
  sub_1D7ECA3B0();
  long long v69 = v124;
  LOBYTE(v62) = v125;
  long long v100 = v126;
  uint64_t v70 = v127;
  uint64_t v71 = v128;
  uint64_t v73 = v129;
  uint64_t v72 = v130;
  uint64_t v74 = v131;
  swift_getKeyPath();
  long long v124 = v69;
  LOBYTE(v125) = v62;
  long long v126 = v100;
  uint64_t v127 = v70;
  uint64_t v128 = v71;
  uint64_t v129 = v73;
  uint64_t v130 = v72;
  uint64_t v131 = v74;
  sub_1D7ECA3A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  long long v124 = v119;
  uint64_t v125 = v120;
  type metadata accessor for STStatusBarDataCellularType(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3A8);
  sub_1D7E75B48(&qword_1EA87C3B0, type metadata accessor for STStatusBarDataCellularType);
  sub_1D7E767B4(&qword_1EA87C3B8, &qword_1EA87C3A8);
  v75 = v110;
  sub_1D7ECA360();
  v76 = v108;
  v77 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
  uint64_t v78 = v102;
  v77(v108, v115, v102);
  sub_1D7E76C60(v116, v112, &qword_1EA87C3A0);
  uint64_t v79 = v114;
  sub_1D7E76C60(v117, v114, &qword_1EA87BFB0);
  v118 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
  v80 = v103;
  v81 = v75;
  uint64_t v82 = v104;
  v118(v103, v81, v104);
  v83 = v105;
  v84 = v76;
  uint64_t v85 = v78;
  v77(v105, v84, v78);
  v86 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3C0);
  uint64_t v87 = v112;
  sub_1D7E76C60(v112, (uint64_t)&v83[v86[12]], &qword_1EA87C3A0);
  sub_1D7E76C60(v79, (uint64_t)&v83[v86[16]], &qword_1EA87BFB0);
  v118(&v83[v86[20]], v80, v82);
  v88 = *(void (**)(char *, uint64_t))(v111 + 8);
  v88(v110, v82);
  sub_1D7E76CC4(v117, &qword_1EA87BFB0);
  sub_1D7E76CC4(v116, &qword_1EA87C3A0);
  v89 = *(void (**)(char *, uint64_t))(v109 + 8);
  v89(v115, v85);
  v88(v80, v82);
  sub_1D7E76CC4(v114, &qword_1EA87BFB0);
  sub_1D7E76CC4(v87, &qword_1EA87C3A0);
  return ((uint64_t (*)(char *, uint64_t))v89)(v108, v85);
}

uint64_t sub_1D7E6A128()
{
  return sub_1D7E6C4E4(5, (uint64_t)sub_1D7E6A144);
}

uint64_t sub_1D7E6A148@<X0>(void *a1@<X8>)
{
  v150 = a1;
  uint64_t v149 = sub_1D7ECA3E0();
  uint64_t v166 = *(void *)(v149 - 8);
  uint64_t v1 = MEMORY[0x1F4188790](v149);
  v180 = &v147[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  v178 = &v147[-v4];
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v161 = &v147[-v6];
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  v160 = &v147[-v8];
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v159 = &v147[-v10];
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v177 = &v147[-v12];
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v181 = &v147[-v14];
  MEMORY[0x1F4188790](v13);
  v165 = &v147[-v15];
  sub_1D7ECA120();
  uint64_t v179 = sub_1D7ECA1F0();
  uint64_t v162 = v16;
  uint64_t v163 = v17;
  int v164 = v18 & 1;
  sub_1D7ECA3D0();
  sub_1D7ECA120();
  uint64_t v19 = sub_1D7ECA1F0();
  uint64_t v169 = v19;
  uint64_t v185 = v21;
  uint64_t v186 = v20;
  int v23 = v22 & 1;
  sub_1D7ECA120();
  uint64_t v174 = sub_1D7ECA1F0();
  uint64_t v25 = v24;
  uint64_t v184 = v26;
  int v28 = v27 & 1;
  sub_1D7ECA120();
  uint64_t v29 = sub_1D7ECA1F0();
  uint64_t v170 = v30;
  uint64_t v183 = v31;
  int v33 = v32 & 1;
  sub_1D7ECA120();
  uint64_t v34 = sub_1D7ECA1F0();
  uint64_t v36 = v35;
  uint64_t v168 = v37;
  LOBYTE(v253[0]) = v23;
  v252[0] = v28;
  int v39 = v38 & 1;
  v249[0] = v33;
  LOBYTE(v319[0]) = v23;
  char v40 = v23;
  LODWORD(v172) = v23;
  LOBYTE(v262[0]) = 0;
  LOBYTE(v261[0]) = 0;
  LOBYTE(v260[0]) = v28;
  LOBYTE(v23) = v28;
  LODWORD(v173) = v28;
  LOBYTE(v239[0]) = 0;
  LOBYTE(v202[0]) = 0;
  LOBYTE(v320[0]) = v33;
  LOBYTE(v28) = v33;
  LODWORD(v175) = v33;
  LOBYTE(v258[0]) = 0;
  LOBYTE(v224) = 0;
  LOBYTE(v203) = v39;
  LOBYTE(v257[0]) = 0;
  LOBYTE(v256[0]) = 0;
  sub_1D7E764DC(v19, v186, v40);
  swift_bridgeObjectRetain();
  uint64_t v41 = v174;
  sub_1D7E764DC(v174, v25, v23);
  swift_bridgeObjectRetain();
  uint64_t v171 = v29;
  uint64_t v42 = v170;
  sub_1D7E764DC(v29, v170, v28);
  swift_bridgeObjectRetain();
  uint64_t v43 = v34;
  uint64_t v182 = v36;
  LODWORD(v176) = v39;
  sub_1D7E764DC(v34, v36, v39);
  uint64_t v44 = v168;
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v43, v36, v39);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v29, v42, v249[0]);
  swift_bridgeObjectRelease();
  uint64_t v45 = v41;
  sub_1D7E764EC(v41, v25, v252[0]);
  uint64_t v46 = v184;
  swift_bridgeObjectRelease();
  uint64_t v47 = v169;
  uint64_t v48 = v186;
  sub_1D7E764EC(v169, v186, v253[0]);
  uint64_t v49 = v185;
  swift_bridgeObjectRelease();
  *(void *)&long long v224 = v47;
  *((void *)&v224 + 1) = v48;
  LOBYTE(v225) = v172;
  DWORD1(v225) = *(_DWORD *)((char *)v319 + 3);
  *(_DWORD *)((char *)&v225 + 1) = v319[0];
  *((void *)&v225 + 1) = v49;
  *(void *)&long long v226 = 1;
  BYTE8(v226) = 0;
  HIDWORD(v226) = *(_DWORD *)((char *)v262 + 3);
  *(_DWORD *)((char *)&v226 + 9) = v262[0];
  *(void *)&long long v227 = 1;
  WORD4(v227) = 0;
  HIWORD(v227) = WORD2(v203);
  *(_DWORD *)((char *)&v227 + 10) = v203;
  *(void *)&long long v228 = v45;
  *((void *)&v228 + 1) = v25;
  LOBYTE(v229) = v173;
  DWORD1(v229) = *(_DWORD *)((char *)v261 + 3);
  *(_DWORD *)((char *)&v229 + 1) = v261[0];
  *((void *)&v229 + 1) = v46;
  *(void *)&long long v230 = 2;
  BYTE8(v230) = 0;
  HIDWORD(v230) = *(_DWORD *)((char *)v260 + 3);
  *(_DWORD *)((char *)&v230 + 9) = v260[0];
  *(void *)&long long v231 = 2;
  WORD4(v231) = 0;
  HIWORD(v231) = v257[1];
  *(_DWORD *)((char *)&v231 + 10) = v257[0];
  *(void *)&long long v232 = v171;
  *((void *)&v232 + 1) = v42;
  LOBYTE(v233) = v175;
  DWORD1(v233) = *(_DWORD *)((char *)v239 + 3);
  *(_DWORD *)((char *)&v233 + 1) = v239[0];
  *((void *)&v233 + 1) = v183;
  *(void *)&long long v234 = 3;
  BYTE8(v234) = 0;
  HIDWORD(v234) = *(_DWORD *)((char *)v202 + 3);
  *(_DWORD *)((char *)&v234 + 9) = v202[0];
  *(void *)&long long v235 = 3;
  WORD4(v235) = 0;
  HIWORD(v235) = v256[1];
  *(_DWORD *)((char *)&v235 + 10) = v256[0];
  *(void *)&long long v236 = v43;
  *((void *)&v236 + 1) = v182;
  LOBYTE(v237) = v176;
  DWORD1(v237) = *(_DWORD *)((char *)v320 + 3);
  *(_DWORD *)((char *)&v237 + 1) = v320[0];
  *((void *)&v237 + 1) = v44;
  *(void *)&v238[0] = 4;
  BYTE8(v238[0]) = 0;
  HIDWORD(v238[0]) = *(_DWORD *)((char *)v258 + 3);
  *(_DWORD *)((char *)v238 + 9) = v258[0];
  *(void *)&v238[1] = 4;
  WORD4(v238[1]) = 0;
  sub_1D7ECA3D0();
  sub_1D7ECA120();
  uint64_t v183 = sub_1D7ECA1F0();
  uint64_t v184 = v50;
  uint64_t v185 = v51;
  LODWORD(v42) = v52 & 1;
  sub_1D7ECA120();
  uint64_t v53 = sub_1D7ECA1F0();
  uint64_t v176 = v54;
  uint64_t v182 = v55;
  LODWORD(v46) = v56 & 1;
  sub_1D7ECA120();
  uint64_t v57 = sub_1D7ECA1F0();
  uint64_t v186 = v58;
  uint64_t v175 = v59;
  LODWORD(v48) = v60 & 1;
  sub_1D7ECA120();
  uint64_t v167 = sub_1D7ECA1F0();
  uint64_t v158 = v61;
  uint64_t v172 = v62;
  LODWORD(v49) = v63 & 1;
  sub_1D7ECA120();
  uint64_t v64 = sub_1D7ECA1F0();
  uint64_t v173 = v65;
  uint64_t v174 = v66;
  LOBYTE(v196) = v42;
  LOBYTE(v192) = v46;
  LODWORD(v25) = v67 & 1;
  unsigned __int8 v324 = v48;
  LOBYTE(v47) = v49;
  char v323 = v49;
  LOBYTE(v222[0]) = v42;
  char v68 = v42;
  int v156 = v42;
  int v157 = v46;
  LOBYTE(v221[0]) = 0;
  LOBYTE(v220[0]) = 0;
  LOBYTE(v219[0]) = v46;
  LOBYTE(v218[0]) = 0;
  LOBYTE(v195[0]) = 0;
  LOBYTE(v194[0]) = v48;
  LOBYTE(v42) = v48;
  LODWORD(v168) = v48;
  LOBYTE(v191[0]) = 0;
  LOBYTE(v190[0]) = 0;
  LOBYTE(v254) = v49;
  LODWORD(v169) = v49;
  LOBYTE(v250) = 0;
  LOBYTE(v246) = 0;
  LOBYTE(v242) = v25;
  LOBYTE(v200) = 0;
  LOBYTE(v198) = 0;
  *(_DWORD *)((char *)v258 + 3) = *(_DWORD *)((char *)v319 + 3);
  LODWORD(v258[0]) = v319[0];
  LOWORD(v241[1]) = v248[1];
  v241[0] = v248[0];
  *(_DWORD *)((char *)&v203 + 3) = *(_DWORD *)((char *)v262 + 3);
  LODWORD(v203) = v262[0];
  *(_DWORD *)((char *)v257 + 3) = *(_DWORD *)((char *)v261 + 3);
  v257[0] = v261[0];
  LOWORD(v240[1]) = v245[1];
  v240[0] = v245[0];
  *(_DWORD *)((char *)v256 + 3) = *(_DWORD *)((char *)v260 + 3);
  v256[0] = v260[0];
  *(_DWORD *)((char *)v253 + 3) = *(_DWORD *)((char *)v239 + 3);
  v253[0] = v239[0];
  LOWORD(v223[1]) = v244[1];
  v223[0] = v244[0];
  *(_DWORD *)&v252[3] = *(_DWORD *)((char *)v202 + 3);
  *(_DWORD *)v252 = v202[0];
  *(_DWORD *)&v249[3] = *(_DWORD *)((char *)v320 + 3);
  *(_DWORD *)v249 = v320[0];
  sub_1D7E764DC(v183, v185, v68);
  swift_bridgeObjectRetain();
  uint64_t v155 = v53;
  sub_1D7E764DC(v53, v176, v46);
  swift_bridgeObjectRetain();
  uint64_t v69 = v57;
  sub_1D7E764DC(v57, v186, v42);
  swift_bridgeObjectRetain();
  uint64_t v70 = v167;
  uint64_t v71 = v158;
  sub_1D7E764DC(v167, v158, v47);
  swift_bridgeObjectRetain();
  uint64_t v171 = v64;
  uint64_t v72 = v173;
  LODWORD(v170) = v25;
  sub_1D7E764DC(v64, v173, v25);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v64, v72, v25);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v70, v71, v323);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v57, v186, v324);
  swift_bridgeObjectRelease();
  uint64_t v73 = v155;
  uint64_t v74 = v176;
  sub_1D7E764EC(v155, v176, v192);
  uint64_t v75 = v182;
  swift_bridgeObjectRelease();
  uint64_t v76 = v183;
  uint64_t v77 = v185;
  sub_1D7E764EC(v183, v185, v196);
  uint64_t v78 = v184;
  swift_bridgeObjectRelease();
  v239[0] = v76;
  v239[1] = v77;
  LOBYTE(v239[2]) = v156;
  HIDWORD(v239[2]) = *(_DWORD *)((char *)v319 + 3);
  *(_DWORD *)((char *)&v239[2] + 1) = v319[0];
  v239[3] = v78;
  v239[4] = 5;
  LOBYTE(v239[5]) = 0;
  HIDWORD(v239[5]) = *(_DWORD *)((char *)v262 + 3);
  *(_DWORD *)((char *)&v239[5] + 1) = v262[0];
  v239[6] = 5;
  LOWORD(v239[7]) = 0;
  HIWORD(v239[7]) = v260[1];
  *(_DWORD *)((char *)&v239[7] + 2) = v260[0];
  v239[8] = v73;
  v239[9] = v74;
  LOBYTE(v239[10]) = v157;
  HIDWORD(v239[10]) = *(_DWORD *)((char *)v261 + 3);
  *(_DWORD *)((char *)&v239[10] + 1) = v261[0];
  v239[11] = v75;
  v239[12] = 6;
  LOBYTE(v239[13]) = 0;
  HIDWORD(v239[13]) = *(_DWORD *)((char *)v258 + 3);
  *(_DWORD *)((char *)&v239[13] + 1) = v258[0];
  v239[14] = 6;
  LOWORD(v239[15]) = 0;
  HIWORD(v239[15]) = v241[1];
  *(_DWORD *)((char *)&v239[15] + 2) = v241[0];
  v239[16] = v69;
  v239[17] = v186;
  LOBYTE(v239[18]) = v168;
  HIDWORD(v239[18]) = *(_DWORD *)((char *)&v203 + 3);
  *(_DWORD *)((char *)&v239[18] + 1) = v203;
  v239[19] = v175;
  v239[20] = 7;
  LOBYTE(v239[21]) = 0;
  HIDWORD(v239[21]) = *(_DWORD *)((char *)v257 + 3);
  *(_DWORD *)((char *)&v239[21] + 1) = v257[0];
  v239[22] = 7;
  LOWORD(v239[23]) = 0;
  HIWORD(v239[23]) = v240[1];
  *(_DWORD *)((char *)&v239[23] + 2) = v240[0];
  v239[24] = v70;
  v239[25] = v71;
  LOBYTE(v239[26]) = v169;
  HIDWORD(v239[26]) = *(_DWORD *)((char *)v256 + 3);
  *(_DWORD *)((char *)&v239[26] + 1) = v256[0];
  v239[27] = v172;
  v239[28] = 8;
  LOBYTE(v239[29]) = 0;
  HIDWORD(v239[29]) = *(_DWORD *)((char *)v253 + 3);
  *(_DWORD *)((char *)&v239[29] + 1) = v253[0];
  v239[30] = 8;
  LOWORD(v239[31]) = 0;
  HIWORD(v239[31]) = v223[1];
  *(_DWORD *)((char *)&v239[31] + 2) = v223[0];
  v239[32] = v171;
  v239[33] = v173;
  LOBYTE(v239[34]) = v170;
  *(_DWORD *)((char *)&v239[34] + 1) = *(_DWORD *)v252;
  HIDWORD(v239[34]) = *(_DWORD *)&v252[3];
  v239[35] = v174;
  v239[36] = 9;
  LOBYTE(v239[37]) = 0;
  *(_DWORD *)((char *)&v239[37] + 1) = *(_DWORD *)v249;
  HIDWORD(v239[37]) = *(_DWORD *)&v249[3];
  v239[38] = 9;
  LOWORD(v239[39]) = 0;
  sub_1D7ECA3D0();
  sub_1D7ECA120();
  uint64_t v79 = sub_1D7ECA1F0();
  uint64_t v182 = v80;
  uint64_t v183 = v79;
  uint64_t v167 = v81;
  LODWORD(v71) = v82 & 1;
  sub_1D7ECA120();
  uint64_t v184 = sub_1D7ECA1F0();
  uint64_t v185 = v83;
  uint64_t v85 = v84;
  LODWORD(v77) = v86 & 1;
  sub_1D7ECA120();
  uint64_t v169 = sub_1D7ECA1F0();
  uint64_t v170 = v87;
  uint64_t v186 = v88;
  LODWORD(v78) = v89 & 1;
  sub_1D7ECA120();
  uint64_t v90 = sub_1D7ECA1F0();
  uint64_t v171 = v91;
  uint64_t v172 = v90;
  uint64_t v173 = v92;
  LODWORD(v76) = v93 & 1;
  sub_1D7ECA120();
  uint64_t v94 = sub_1D7ECA1F0();
  uint64_t v175 = v95;
  uint64_t v176 = v96;
  LOBYTE(v192) = v71;
  unsigned __int8 v324 = v77;
  char v98 = v97 & 1;
  LODWORD(v174) = v97 & 1;
  char v323 = v78;
  char v322 = v76;
  v252[0] = v71;
  char v99 = v71;
  int v154 = v71;
  LODWORD(v155) = v77;
  v249[0] = 0;
  LOBYTE(v248[0]) = 0;
  LOBYTE(v245[0]) = v77;
  LOBYTE(v71) = v77;
  LOBYTE(v244[0]) = 0;
  LOBYTE(v241[0]) = 0;
  LOBYTE(v240[0]) = v78;
  LOBYTE(v77) = v78;
  int v156 = v78;
  int v157 = v76;
  LOBYTE(v190[0]) = 0;
  LOBYTE(v254) = 0;
  LOBYTE(v250) = v76;
  LOBYTE(v78) = v76;
  LOBYTE(v246) = 0;
  LOBYTE(v242) = 0;
  LOBYTE(v200) = v98;
  LOBYTE(v198) = 0;
  LOBYTE(v196) = 0;
  *(_DWORD *)((char *)&v203 + 3) = *(_DWORD *)((char *)v319 + 3);
  LODWORD(v203) = v319[0];
  LOWORD(v195[1]) = v257[1];
  v195[0] = v257[0];
  *(_DWORD *)((char *)v223 + 3) = *(_DWORD *)((char *)v262 + 3);
  v223[0] = v262[0];
  *(_DWORD *)((char *)v222 + 3) = *(_DWORD *)((char *)v261 + 3);
  v222[0] = v261[0];
  LOWORD(v194[1]) = v256[1];
  v194[0] = v256[0];
  *(_DWORD *)((char *)v221 + 3) = *(_DWORD *)((char *)v260 + 3);
  v221[0] = v260[0];
  *(_DWORD *)((char *)v220 + 3) = *(_DWORD *)((char *)v202 + 3);
  v220[0] = v202[0];
  LOWORD(v191[1]) = v253[1];
  v191[0] = v253[0];
  *(_DWORD *)((char *)v219 + 3) = *(_DWORD *)((char *)v320 + 3);
  v219[0] = v320[0];
  *(_DWORD *)((char *)v218 + 3) = *(_DWORD *)((char *)v258 + 3);
  v218[0] = v258[0];
  sub_1D7E764DC(v183, v182, v99);
  swift_bridgeObjectRetain();
  uint64_t v168 = v85;
  sub_1D7E764DC(v184, v85, v71);
  swift_bridgeObjectRetain();
  uint64_t v100 = v169;
  sub_1D7E764DC(v169, v186, v77);
  swift_bridgeObjectRetain();
  uint64_t v101 = v171;
  uint64_t v102 = v172;
  sub_1D7E764DC(v172, v171, v78);
  swift_bridgeObjectRetain();
  uint64_t v158 = v94;
  uint64_t v103 = v175;
  LOBYTE(v78) = v174;
  sub_1D7E764DC(v94, v175, v174);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v94, v103, v78);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v102, v101, v322);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v100, v186, v323);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v184, v168, v324);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v183, v182, v192);
  swift_bridgeObjectRelease();
  *(_DWORD *)((char *)v257 + 3) = *(_DWORD *)((char *)v319 + 3);
  v257[0] = v319[0];
  *(_DWORD *)((char *)v256 + 3) = *(_DWORD *)((char *)v262 + 3);
  v256[0] = v262[0];
  __int16 v255 = v260[1];
  int v254 = v260[0];
  *(_DWORD *)((char *)v253 + 3) = *(_DWORD *)((char *)v261 + 3);
  v253[0] = v261[0];
  *(_DWORD *)&v252[3] = *(_DWORD *)((char *)&v203 + 3);
  *(_DWORD *)v252 = v203;
  __int16 v251 = v195[1];
  int v250 = v195[0];
  *(_DWORD *)&v249[3] = *(_DWORD *)((char *)v223 + 3);
  *(_DWORD *)v249 = v223[0];
  *(_DWORD *)((char *)v248 + 3) = *(_DWORD *)((char *)v222 + 3);
  v248[0] = v222[0];
  __int16 v247 = v194[1];
  int v246 = v194[0];
  *(_DWORD *)((char *)v245 + 3) = *(_DWORD *)((char *)v221 + 3);
  v245[0] = v221[0];
  *(_DWORD *)((char *)v244 + 3) = *(_DWORD *)((char *)v220 + 3);
  v244[0] = v220[0];
  __int16 v243 = v191[1];
  int v242 = v191[0];
  *(_DWORD *)((char *)v241 + 3) = *(_DWORD *)((char *)v219 + 3);
  v241[0] = v219[0];
  *(_DWORD *)((char *)v240 + 3) = *(_DWORD *)((char *)v218 + 3);
  v240[0] = v218[0];
  uint64_t v104 = v159;
  sub_1D7ECA3D0();
  sub_1D7ECA120();
  uint64_t v105 = sub_1D7ECA1F0();
  uint64_t v152 = v106;
  uint64_t v153 = v105;
  uint64_t v151 = v107;
  LOBYTE(v103) = v108;
  unsigned __int8 v324 = v164;
  char v323 = 0;
  char v322 = 0;
  uint64_t v109 = *(void (**)(char *, char *, uint64_t))(v166 + 16);
  v110 = v160;
  uint64_t v111 = v149;
  v109(v160, v165, v149);
  long long v215 = v236;
  long long v216 = v237;
  v217[0] = v238[0];
  *(_OWORD *)((char *)v217 + 10) = *(_OWORD *)((char *)v238 + 10);
  long long v211 = v232;
  long long v212 = v233;
  long long v213 = v234;
  long long v214 = v235;
  long long v207 = v228;
  long long v208 = v229;
  long long v209 = v230;
  long long v210 = v231;
  long long v203 = v224;
  long long v204 = v225;
  long long v205 = v226;
  long long v206 = v227;
  uint64_t v112 = v161;
  v109(v161, v181, v111);
  memcpy(v202, v239, 0x13AuLL);
  v109(v178, v177, v111);
  v223[0] = v257[0];
  *(_DWORD *)((char *)v223 + 3) = *(_DWORD *)((char *)v257 + 3);
  *(_DWORD *)((char *)v222 + 3) = *(_DWORD *)((char *)v256 + 3);
  v222[0] = v256[0];
  __int16 v201 = v255;
  int v200 = v254;
  *(_DWORD *)((char *)v221 + 3) = *(_DWORD *)((char *)v253 + 3);
  v221[0] = v253[0];
  *(_DWORD *)((char *)v220 + 3) = *(_DWORD *)&v252[3];
  v220[0] = *(_DWORD *)v252;
  __int16 v199 = v251;
  int v198 = v250;
  *(_DWORD *)((char *)v219 + 3) = *(_DWORD *)&v249[3];
  v219[0] = *(_DWORD *)v249;
  *(_DWORD *)((char *)v218 + 3) = *(_DWORD *)((char *)v248 + 3);
  v218[0] = v248[0];
  __int16 v197 = v247;
  int v196 = v246;
  *(_DWORD *)((char *)v195 + 3) = *(_DWORD *)((char *)v245 + 3);
  v195[0] = v245[0];
  *(_DWORD *)((char *)v194 + 3) = *(_DWORD *)((char *)v244 + 3);
  v194[0] = v244[0];
  __int16 v193 = v243;
  int v192 = v242;
  *(_DWORD *)((char *)v191 + 3) = *(_DWORD *)((char *)v241 + 3);
  v191[0] = v241[0];
  *(_DWORD *)((char *)v190 + 3) = *(_DWORD *)((char *)v240 + 3);
  v190[0] = v240[0];
  v109(v180, v104, v111);
  char v189 = v103 & 1;
  char v188 = 0;
  char v187 = 0;
  unsigned __int8 v113 = v324;
  int v148 = v324;
  char v114 = v323;
  char v115 = v322;
  uint64_t v116 = v150;
  void *v150 = v179;
  v116[1] = v162;
  *((unsigned char *)v116 + 16) = v113;
  v116[3] = v163;
  v116[4] = 0;
  *((unsigned char *)v116 + 40) = v114;
  v116[6] = 0;
  *((unsigned char *)v116 + 56) = 0;
  *((unsigned char *)v116 + 57) = v115;
  uint64_t v117 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C3C8);
  v109((char *)v116 + v117[12], v110, v111);
  uint64_t v118 = v117[16];
  long long v119 = v214;
  v258[12] = v215;
  v258[13] = v216;
  long long v120 = v216;
  v259[0] = v217[0];
  *(_OWORD *)((char *)v259 + 10) = *(_OWORD *)((char *)v217 + 10);
  long long v121 = v211;
  long long v122 = v210;
  v258[8] = v211;
  v258[9] = v212;
  long long v123 = v212;
  long long v124 = v213;
  v258[10] = v213;
  v258[11] = v214;
  long long v125 = v207;
  long long v126 = v206;
  v258[4] = v207;
  v258[5] = v208;
  long long v127 = v208;
  long long v128 = v209;
  v258[6] = v209;
  v258[7] = v210;
  v258[0] = v203;
  v258[1] = v204;
  uint64_t v129 = (_OWORD *)((char *)v116 + v118);
  v129[12] = v215;
  v129[13] = v120;
  v129[14] = v217[0];
  *(_OWORD *)((char *)v129 + 234) = *(_OWORD *)((char *)v217 + 10);
  v129[8] = v121;
  v129[9] = v123;
  v129[10] = v124;
  v129[11] = v119;
  v129[4] = v125;
  v129[5] = v127;
  v129[6] = v128;
  v129[7] = v122;
  long long v130 = v204;
  *uint64_t v129 = v203;
  v129[1] = v130;
  long long v131 = v205;
  long long v132 = v206;
  v129[2] = v205;
  v129[3] = v126;
  long long v133 = (char *)v116 + v117[20];
  v258[2] = v131;
  v258[3] = v132;
  uint64_t v134 = v111;
  v109(v133, v112, v111);
  long long v135 = (char *)v116 + v117[24];
  memcpy(v260, v202, 0x13AuLL);
  memcpy(v135, v202, 0x13AuLL);
  v109((char *)v116 + v117[28], v178, v111);
  uint64_t v136 = v117[32];
  v261[0] = v183;
  v261[1] = v182;
  *(_DWORD *)((char *)&v261[2] + 1) = v223[0];
  HIDWORD(v261[2]) = *(_DWORD *)((char *)v223 + 3);
  v261[3] = v167;
  v261[4] = 10;
  *(_DWORD *)((char *)&v261[5] + 1) = v222[0];
  HIDWORD(v261[5]) = *(_DWORD *)((char *)v222 + 3);
  v261[6] = 10;
  HIWORD(v261[7]) = v201;
  *(_DWORD *)((char *)&v261[7] + 2) = v200;
  v261[8] = v184;
  v261[9] = v168;
  HIDWORD(v261[10]) = *(_DWORD *)((char *)v221 + 3);
  *(_DWORD *)((char *)&v261[10] + 1) = v221[0];
  v261[11] = v185;
  v261[12] = 11;
  HIDWORD(v261[13]) = *(_DWORD *)((char *)v220 + 3);
  *(_DWORD *)((char *)&v261[13] + 1) = v220[0];
  v261[14] = 11;
  LOWORD(v261[15]) = 0;
  HIWORD(v261[15]) = v199;
  *(_DWORD *)((char *)&v261[15] + 2) = v198;
  v261[16] = v169;
  v261[17] = v186;
  *(_DWORD *)((char *)&v261[18] + 1) = v219[0];
  HIDWORD(v261[18]) = *(_DWORD *)((char *)v219 + 3);
  v261[19] = v170;
  v261[20] = 12;
  HIDWORD(v261[21]) = *(_DWORD *)((char *)v218 + 3);
  *(_DWORD *)((char *)&v261[21] + 1) = v218[0];
  v261[22] = 12;
  LOWORD(v261[23]) = 0;
  HIWORD(v261[23]) = v197;
  *(_DWORD *)((char *)&v261[23] + 2) = v196;
  v261[24] = v172;
  v261[25] = v171;
  HIDWORD(v261[26]) = *(_DWORD *)((char *)v195 + 3);
  *(_DWORD *)((char *)&v261[26] + 1) = v195[0];
  *(_DWORD *)((char *)&v261[34] + 1) = v191[0];
  *(_DWORD *)((char *)&v261[37] + 1) = v190[0];
  v261[27] = v173;
  v261[28] = 13;
  *(_DWORD *)((char *)&v261[29] + 1) = v194[0];
  HIDWORD(v261[29]) = *(_DWORD *)((char *)v194 + 3);
  v261[30] = 13;
  LOWORD(v261[31]) = 0;
  *(_DWORD *)((char *)&v261[31] + 2) = v192;
  HIWORD(v261[31]) = v193;
  v261[32] = v158;
  v261[33] = v175;
  HIDWORD(v261[34]) = *(_DWORD *)((char *)v191 + 3);
  HIDWORD(v261[37]) = *(_DWORD *)((char *)v190 + 3);
  v261[35] = v176;
  v261[36] = 15;
  v261[38] = 15;
  LOWORD(v261[39]) = 0;
  LOBYTE(v261[2]) = v154;
  LOBYTE(v261[5]) = 0;
  LOWORD(v261[7]) = 0;
  LOBYTE(v261[10]) = v155;
  LOBYTE(v261[13]) = 0;
  LOBYTE(v261[18]) = v156;
  LOBYTE(v261[21]) = 0;
  LOBYTE(v261[26]) = v157;
  LOBYTE(v261[29]) = 0;
  LOBYTE(v261[34]) = v174;
  LOBYTE(v261[37]) = 0;
  memcpy((char *)v116 + v136, v261, 0x13AuLL);
  v109((char *)v116 + v117[36], v180, v111);
  long long v137 = (char *)v116 + v117[40];
  LOBYTE(v117) = v189;
  char v138 = v188;
  char v139 = v187;
  uint64_t v141 = v152;
  uint64_t v140 = v153;
  uint64_t v142 = v151;
  *(void *)long long v137 = v153;
  *((void *)v137 + 1) = v142;
  v137[16] = (char)v117;
  *((void *)v137 + 3) = v141;
  *((void *)v137 + 4) = 14;
  v137[40] = v138;
  *((void *)v137 + 6) = 14;
  v137[56] = 0;
  v137[57] = v139;
  uint64_t v143 = v179;
  uint64_t v144 = v162;
  sub_1D7E764DC(v179, v162, v148);
  swift_bridgeObjectRetain();
  sub_1D7E767F8((uint64_t)v258);
  sub_1D7E768D8((uint64_t)v260);
  sub_1D7E768D8((uint64_t)v261);
  sub_1D7E764DC(v140, v142, (char)v117);
  swift_bridgeObjectRetain();
  LOBYTE(v117) = v164;
  sub_1D7E764DC(v143, v144, v164);
  swift_bridgeObjectRetain();
  sub_1D7E767F8((uint64_t)&v224);
  sub_1D7E768D8((uint64_t)v239);
  v145 = *(void (**)(char *, uint64_t))(v166 + 8);
  v145(v159, v134);
  v145(v177, v134);
  sub_1D7E769EC((uint64_t)v239);
  v145(v181, v134);
  sub_1D7E76B00((uint64_t)&v224);
  v145(v165, v134);
  sub_1D7E764EC(v143, v144, (char)v117);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v153, v151, v189);
  swift_bridgeObjectRelease();
  v145(v180, v134);
  v262[0] = v183;
  v262[1] = v182;
  char v263 = v154;
  *(_DWORD *)v264 = v223[0];
  *(_DWORD *)&v264[3] = *(_DWORD *)((char *)v223 + 3);
  uint64_t v265 = v167;
  uint64_t v266 = 10;
  char v267 = 0;
  *(_DWORD *)v268 = v222[0];
  *(_DWORD *)&v268[3] = *(_DWORD *)((char *)v222 + 3);
  uint64_t v269 = 10;
  __int16 v270 = 0;
  __int16 v272 = v201;
  int v271 = v200;
  uint64_t v273 = v184;
  uint64_t v274 = v168;
  char v275 = v155;
  *(_DWORD *)&v276[3] = *(_DWORD *)((char *)v221 + 3);
  *(_DWORD *)v276 = v221[0];
  uint64_t v277 = v185;
  uint64_t v278 = 11;
  char v279 = 0;
  *(_DWORD *)&v280[3] = *(_DWORD *)((char *)v220 + 3);
  *(_DWORD *)v280 = v220[0];
  uint64_t v281 = 11;
  __int16 v282 = 0;
  __int16 v284 = v199;
  int v283 = v198;
  uint64_t v285 = v169;
  uint64_t v286 = v186;
  char v287 = v156;
  *(_DWORD *)&v288[3] = *(_DWORD *)((char *)v219 + 3);
  *(_DWORD *)v288 = v219[0];
  uint64_t v289 = v170;
  uint64_t v290 = 12;
  char v291 = 0;
  *(_DWORD *)v292 = v218[0];
  *(_DWORD *)&v292[3] = *(_DWORD *)((char *)v218 + 3);
  uint64_t v293 = 12;
  __int16 v294 = 0;
  __int16 v296 = v197;
  int v295 = v196;
  uint64_t v297 = v172;
  uint64_t v298 = v171;
  char v299 = v157;
  *(_DWORD *)v300 = v195[0];
  *(_DWORD *)&v300[3] = *(_DWORD *)((char *)v195 + 3);
  uint64_t v301 = v173;
  uint64_t v302 = 13;
  char v303 = 0;
  *(_DWORD *)&v304[3] = *(_DWORD *)((char *)v194 + 3);
  *(_DWORD *)v304 = v194[0];
  uint64_t v305 = 13;
  __int16 v306 = 0;
  __int16 v308 = v193;
  int v307 = v192;
  uint64_t v309 = v158;
  uint64_t v310 = v175;
  char v311 = v174;
  *(_DWORD *)v312 = v191[0];
  *(_DWORD *)&v312[3] = *(_DWORD *)((char *)v191 + 3);
  uint64_t v313 = v176;
  uint64_t v314 = 15;
  char v315 = 0;
  *(_DWORD *)v316 = v190[0];
  *(_DWORD *)&v316[3] = *(_DWORD *)((char *)v190 + 3);
  uint64_t v317 = 15;
  __int16 v318 = 0;
  sub_1D7E769EC((uint64_t)v262);
  v145(v178, v134);
  memcpy(v319, v202, 0x13AuLL);
  sub_1D7E769EC((uint64_t)v319);
  v145(v161, v134);
  v320[12] = v215;
  v320[13] = v216;
  v321[0] = v217[0];
  *(_OWORD *)((char *)v321 + 10) = *(_OWORD *)((char *)v217 + 10);
  v320[8] = v211;
  v320[9] = v212;
  v320[10] = v213;
  v320[11] = v214;
  v320[4] = v207;
  v320[5] = v208;
  v320[6] = v209;
  v320[7] = v210;
  v320[0] = v203;
  v320[1] = v204;
  v320[2] = v205;
  v320[3] = v206;
  sub_1D7E76B00((uint64_t)v320);
  v145(v160, v134);
  sub_1D7E764EC(v179, v144, v324);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6BB5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEC0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEC8);
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v30 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BED0);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v34 = (uint64_t)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v35 = sub_1D7ECA270();
  long long v13 = v1[1];
  long long v36 = *v1;
  long long v37 = v13;
  long long v38 = v1[2];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEB8);
  sub_1D7ECA3B0();
  long long v15 = v39;
  char v16 = v40[0];
  long long v32 = *(_OWORD *)&v40[8];
  uint64_t v17 = *(void *)&v40[24];
  swift_getKeyPath();
  long long v39 = v15;
  v40[0] = v16;
  *(_OWORD *)&v40[8] = v32;
  *(void *)&v40[24] = v17;
  uint64_t v18 = v6;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v19 = v36;
  char v20 = v37;
  long long v21 = v2[1];
  long long v39 = *v2;
  *(_OWORD *)char v40 = v21;
  *(_OWORD *)&v40[16] = v2[2];
  MEMORY[0x1D94822A0](&v36, v14);
  uint64_t v22 = 1;
  if (sub_1D7E76DA4(v36, 1))
  {
    int v23 = v31;
    sub_1D7E6BF1C(v2, v31);
    char v24 = sub_1D7ECA1C0();
    uint64_t v25 = v30;
    sub_1D7E76C60((uint64_t)v23, v30, &qword_1EA87BEC0);
    uint64_t v26 = v25 + *(int *)(v18 + 36);
    *(unsigned char *)uint64_t v26 = v24;
    *(_OWORD *)(v26 + 8) = 0u;
    *(_OWORD *)(v26 + 24) = 0u;
    *(unsigned char *)(v26 + 40) = 1;
    sub_1D7E76CC4((uint64_t)v23, &qword_1EA87BEC0);
    sub_1D7E76D20(v25, (uint64_t)v12, &qword_1EA87BEC8);
    uint64_t v22 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v12, v22, 1, v18);
  uint64_t v27 = v34;
  sub_1D7E76C60((uint64_t)v12, v34, &qword_1EA87BED0);
  *(void *)a1 = 0x69462D6957;
  *(void *)(a1 + 8) = 0xE500000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_1D7ED4310;
  *(void *)(a1 + 32) = v35;
  *(_OWORD *)(a1 + 40) = v19;
  *(unsigned char *)(a1 + 56) = v20;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BED8);
  sub_1D7E76C60(v27, a1 + *(int *)(v28 + 48), &qword_1EA87BED0);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D7E76CC4((uint64_t)v12, &qword_1EA87BED0);
  sub_1D7E76CC4(v27, &qword_1EA87BED0);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6BF1C@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C310);
  uint64_t v45 = *(void *)(v46 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v46);
  uint64_t v44 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v48 = (char *)&v36 - v5;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C318);
  uint64_t v39 = *(void *)(v43 - 8);
  uint64_t v6 = v39;
  uint64_t v7 = MEMORY[0x1F4188790](v43);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v42 = sub_1D7ECA120();
  uint64_t v41 = v12;
  uint64_t v40 = v13;
  long long v14 = a1[1];
  long long v56 = *a1;
  long long v57 = v14;
  long long v16 = *a1;
  long long v15 = a1[1];
  long long v58 = a1[2];
  long long v49 = v16;
  long long v50 = v15;
  long long v51 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEB8);
  sub_1D7ECA3B0();
  long long v17 = v52;
  LOBYTE(a1) = v53;
  long long v36 = v54;
  uint64_t v18 = v55;
  swift_getKeyPath();
  long long v52 = v17;
  LOBYTE(v53) = (_BYTE)a1;
  long long v54 = v36;
  uint64_t v55 = v18;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v52 = v49;
  uint64_t v53 = v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C320);
  sub_1D7E76600();
  long long v38 = v11;
  sub_1D7ECA360();
  uint64_t v42 = sub_1D7ECA120();
  uint64_t v41 = v19;
  uint64_t v40 = v20;
  long long v49 = v56;
  long long v50 = v57;
  long long v51 = v58;
  sub_1D7ECA3B0();
  long long v21 = v52;
  LOBYTE(a1) = v53;
  long long v36 = v54;
  uint64_t v22 = v55;
  swift_getKeyPath();
  long long v52 = v21;
  LOBYTE(v53) = (_BYTE)a1;
  long long v54 = v36;
  uint64_t v55 = v22;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v52 = v49;
  uint64_t v53 = v50;
  type metadata accessor for STStatusBarDataWifiType(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C370);
  sub_1D7E75B48(&qword_1EA87C378, type metadata accessor for STStatusBarDataWifiType);
  sub_1D7E767B4(&qword_1EA87C380, &qword_1EA87C370);
  int v23 = v48;
  sub_1D7ECA360();
  char v24 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  long long v37 = v9;
  uint64_t v25 = v43;
  v24(v9, v11, v43);
  uint64_t v26 = v45;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  uint64_t v28 = v44;
  uint64_t v29 = v23;
  uint64_t v30 = v46;
  v27(v44, v29, v46);
  uint64_t v31 = v47;
  v24(v47, v9, v25);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C388);
  v27(&v31[*(int *)(v32 + 48)], v28, v30);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v26 + 8);
  v33(v48, v30);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v39 + 8);
  v34(v38, v25);
  v33(v28, v30);
  return ((uint64_t (*)(char *, uint64_t))v34)(v37, v25);
}

uint64_t sub_1D7E6C4C8()
{
  return sub_1D7E6C4E4(4, (uint64_t)sub_1D7E6A144);
}

uint64_t sub_1D7E6C4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C338);
  unint64_t v5 = sub_1D7E76674();
  return MEMORY[0x1F40FC9D8](0, a1, a2, 0, v4, v5);
}

uint64_t sub_1D7E6C554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1D7ECA110();
  MEMORY[0x1F4188790](v4 - 8);
  sub_1D7ECA100();
  sub_1D7ECA0F0();
  sub_1D7ECA0E0();
  sub_1D7ECA0F0();
  sub_1D7ECA130();
  uint64_t result = sub_1D7ECA1F0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  *(void *)(a2 + 32) = a1;
  *(unsigned char *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = a1;
  *(_WORD *)(a2 + 56) = 0;
  return result;
}

uint64_t sub_1D7E6C674@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E6E100(a1);
}

uint64_t sub_1D7E6C6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v42 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEE8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v41 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEF0);
  uint64_t v44 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  uint64_t v40 = (uint64_t)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEF8);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v46 = (uint64_t)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v48 = (uint64_t)v37 - v15;
  uint64_t v45 = sub_1D7ECA270();
  *(void *)&long long v49 = a1;
  *((void *)&v49 + 1) = a2;
  LOBYTE(v50) = a3;
  uint64_t v51 = a4;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEE0);
  sub_1D7ECA3B0();
  long long v17 = v52;
  char v18 = v53;
  uint64_t v19 = v54;
  swift_getKeyPath();
  long long v52 = v17;
  LOBYTE(v53) = v18;
  uint64_t v54 = v19;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v20 = v49;
  int v43 = v50;
  *(void *)&long long v52 = a1;
  *((void *)&v52 + 1) = a2;
  LOBYTE(v53) = a3;
  uint64_t v54 = a4;
  MEMORY[0x1D94822A0](&v49, v16);
  uint64_t v21 = 1;
  if (sub_1D7E76DA4(v49, 1))
  {
    sub_1D7ECA120();
    uint64_t v38 = v23;
    uint64_t v39 = v22;
    v37[3] = v24;
    *(void *)&long long v49 = a1;
    *((void *)&v49 + 1) = a2;
    LOBYTE(v50) = a3;
    uint64_t v51 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BEE0);
    sub_1D7ECA3B0();
    long long v25 = v52;
    char v26 = v53;
    uint64_t v27 = v54;
    swift_getKeyPath();
    long long v52 = v25;
    LOBYTE(v53) = v26;
    uint64_t v54 = v27;
    sub_1D7ECA3A0();
    swift_release();
    swift_release();
    swift_release();
    long long v52 = v49;
    uint64_t v53 = v50;
    type metadata accessor for STStatusBarLocationType(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2F8);
    sub_1D7E75B48(&qword_1EA87C300, type metadata accessor for STStatusBarLocationType);
    sub_1D7E767B4(&qword_1EA87C308, &qword_1EA87C2F8);
    uint64_t v28 = (uint64_t)v41;
    sub_1D7ECA360();
    char v29 = sub_1D7ECA1C0();
    uint64_t v30 = v40;
    sub_1D7E76C60(v28, v40, &qword_1EA87BEE8);
    uint64_t v31 = v30 + *(int *)(v47 + 36);
    *(unsigned char *)uint64_t v31 = v29;
    *(_OWORD *)(v31 + 8) = 0u;
    *(_OWORD *)(v31 + 24) = 0u;
    *(unsigned char *)(v31 + 40) = 1;
    sub_1D7E76CC4(v28, &qword_1EA87BEE8);
    sub_1D7E76D20(v30, v48, &qword_1EA87BEF0);
    uint64_t v21 = 0;
  }
  uint64_t v32 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v48, v21, 1, v47);
  uint64_t v33 = v46;
  sub_1D7E76C60(v32, v46, &qword_1EA87BEF8);
  uint64_t v34 = v42;
  *uint64_t v42 = 0x6E6F697461636F4CLL;
  v34[1] = 0xE800000000000000;
  *((_OWORD *)v34 + 1) = xmmword_1D7ED4320;
  void v34[4] = v45;
  *(_OWORD *)(v34 + 5) = v20;
  *((unsigned char *)v34 + 56) = v43;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF00);
  sub_1D7E76C60(v33, (uint64_t)v34 + *(int *)(v35 + 48), &qword_1EA87BEF8);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_1D7E76CC4(v32, &qword_1EA87BEF8);
  sub_1D7E76CC4(v33, &qword_1EA87BEF8);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1D7E6CBCC@<X0>(uint64_t a1@<X8>)
{
  sub_1D7ECA120();
  uint64_t v2 = sub_1D7ECA1F0();
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  char v6 = v5 & 1;
  sub_1D7ECA120();
  uint64_t v7 = sub_1D7ECA1F0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_1D7ECA120();
  uint64_t v14 = sub_1D7ECA1F0();
  uint64_t v16 = v15;
  char v17 = v6;
  char v24 = v6;
  char v19 = v18 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v23;
  *(unsigned char *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = 2;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 2;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = v15;
  *(unsigned char *)(a1 + 144) = v18 & 1;
  *(void *)(a1 + 152) = v20;
  *(void *)(a1 + 160) = 1;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 1;
  *(_WORD *)(a1 + 184) = 0;
  sub_1D7E764DC(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6CE14@<X0>(void *a1@<X8>)
{
  return sub_1D7E6C6A0(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1D7E6CE24@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (long long *)v1;
  uint64_t v50 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF10);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v44 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF18);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  uint64_t v49 = v6;
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v46 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v45 = (uint64_t)&v43 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF20);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v52 = (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v43 - v13;
  int v47 = *(unsigned __int8 *)(v1 + 42);
  uint64_t v51 = sub_1D7ECA2C0();
  long long v15 = *(_OWORD *)(v1 + 16);
  long long v53 = *(_OWORD *)v1;
  v54[0] = v15;
  *(_OWORD *)((char *)v54 + 10) = *(_OWORD *)(v1 + 26);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF08);
  sub_1D7ECA3B0();
  long long v17 = v55;
  char v18 = v56[0];
  uint64_t v19 = *(void *)&v56[8];
  uint64_t v20 = *(void *)&v56[16];
  char v21 = v56[24];
  char v22 = v56[25];
  swift_getKeyPath();
  long long v55 = v17;
  v56[0] = v18;
  *(void *)&v56[8] = v19;
  uint64_t v23 = (uint64_t)v14;
  uint64_t v24 = v48;
  *(void *)&v56[16] = v20;
  v56[24] = v21;
  v56[25] = v22;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v25 = v53;
  char v26 = v54[0];
  long long v27 = v2[1];
  long long v55 = *v2;
  *(_OWORD *)long long v56 = v27;
  *(_OWORD *)&v56[10] = *(long long *)((char *)v2 + 26);
  uint64_t v28 = v16;
  char v29 = v47;
  MEMORY[0x1D94822A0](&v53, v28);
  uint64_t v30 = 1;
  if (sub_1D7E76DA4(v53, 1))
  {
    uint64_t v31 = v44;
    sub_1D7E6D298(v2, v44);
    if (v29) {
      char v32 = sub_1D7ECA1C0();
    }
    else {
      char v32 = sub_1D7ECA1D0();
    }
    char v33 = v32;
    uint64_t v34 = v46;
    sub_1D7E76C60(v31, v46, &qword_1EA87BF10);
    uint64_t v35 = v34 + *(int *)(v24 + 36);
    *(unsigned char *)uint64_t v35 = v33;
    *(_OWORD *)(v35 + 8) = 0u;
    *(_OWORD *)(v35 + 24) = 0u;
    *(unsigned char *)(v35 + 40) = 1;
    sub_1D7E76CC4(v31, &qword_1EA87BF10);
    uint64_t v36 = v45;
    sub_1D7E76D20(v34, v45, &qword_1EA87BF18);
    sub_1D7E76D20(v36, v23, &qword_1EA87BF18);
    uint64_t v30 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v23, v30, 1, v24);
  if (v29) {
    unint64_t v37 = 0xEB00000000303031;
  }
  else {
    unint64_t v37 = 0;
  }
  if (v29) {
    uint64_t v38 = 0x2E79726574746162;
  }
  else {
    uint64_t v38 = 0;
  }
  uint64_t v39 = v52;
  sub_1D7E76C60(v23, v52, &qword_1EA87BF20);
  uint64_t v40 = v50;
  *uint64_t v50 = 0x79726574746142;
  v40[1] = 0xE700000000000000;
  v40[2] = v38;
  v40[3] = v37;
  void v40[4] = v51;
  *(_OWORD *)(v40 + 5) = v25;
  *((unsigned char *)v40 + 56) = v26;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF28);
  sub_1D7E76C60(v39, (uint64_t)v40 + *(int *)(v41 + 48), &qword_1EA87BF20);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D7E76CC4(v23, &qword_1EA87BF20);
  sub_1D7E76CC4(v39, &qword_1EA87BF20);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6D298@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v116 = a2;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C288);
  uint64_t v119 = *(void *)(v114 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v114);
  uint64_t v101 = (char *)v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v112 = (char *)v98 - v5;
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C290);
  uint64_t v6 = MEMORY[0x1F4188790](v99);
  uint64_t v118 = (uint64_t)v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v109 = (uint64_t)v98 - v8;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C298);
  uint64_t v100 = *(void *)(v111 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v111);
  char v108 = (char *)v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v117 = (char *)v98 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2A0);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  char v115 = (char *)v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v113 = (uint64_t)v98 - v15;
  uint64_t v107 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2A8);
  uint64_t v106 = *(v107 - 1);
  MEMORY[0x1F4188790](v107);
  long long v17 = (char *)v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2B0);
  MEMORY[0x1F4188790](v103);
  uint64_t v105 = (char *)v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2B8);
  uint64_t v19 = MEMORY[0x1F4188790](v104);
  uint64_t v110 = (uint64_t)v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v102 = (uint64_t)v98 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v120 = (uint64_t)v98 - v23;
  long long v24 = a1[1];
  long long v124 = *a1;
  *(_OWORD *)long long v125 = v24;
  *(_OWORD *)&v125[10] = *(long long *)((char *)a1 + 26);
  long long v25 = a1[1];
  long long v122 = *a1;
  v123[0] = v25;
  *(_OWORD *)((char *)v123 + 10) = *(long long *)((char *)a1 + 26);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF08);
  sub_1D7ECA3B0();
  long long v27 = v126;
  char v28 = v127[0];
  uint64_t v29 = *(void *)&v127[8];
  uint64_t v30 = *(void *)&v127[16];
  char v31 = v127[24];
  char v32 = v127[25];
  swift_getKeyPath();
  long long v126 = v27;
  v127[0] = v28;
  *(void *)&v127[8] = v29;
  *(void *)&v127[16] = v30;
  v127[24] = v31;
  v127[25] = v32;
  v98[1] = v26;
  sub_1D7ECA3A0();
  swift_release();
  char v33 = v17;
  swift_release();
  swift_release();
  long long v126 = v122;
  *(void *)long long v127 = *(void *)&v123[0];
  long long v121 = xmmword_1D7ED4330;
  sub_1D7E764FC();
  sub_1D7ECA370();
  long long v34 = a1[1];
  long long v126 = *a1;
  *(_OWORD *)long long v127 = v34;
  *(_OWORD *)&v127[10] = *(long long *)((char *)a1 + 26);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF08);
  MEMORY[0x1D94822A0](&v122);
  if (BYTE8(v123[0]) == 1)
  {
    uint64_t v36 = sub_1D7ECA2F0();
  }
  else
  {
    long long v37 = a1[1];
    long long v126 = *a1;
    *(_OWORD *)long long v127 = v37;
    *(_OWORD *)&v127[10] = *(long long *)((char *)a1 + 26);
    MEMORY[0x1D94822A0](&v122, v35);
    if (*(double *)v123 >= 0.2) {
      uint64_t v36 = sub_1D7ECA2C0();
    }
    else {
      uint64_t v36 = sub_1D7ECA260();
    }
  }
  uint64_t v38 = v36;
  uint64_t KeyPath = swift_getKeyPath();
  if (v38)
  {
    *(void *)&long long v126 = v38;
    swift_retain();
    uint64_t v40 = sub_1D7ECA020();
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v106;
  uint64_t v42 = (uint64_t)v105;
  uint64_t v43 = v107;
  (*(void (**)(char *, char *, void *))(v106 + 16))(v105, v33, v107);
  swift_release();
  uint64_t v44 = (uint64_t *)(v42 + *(int *)(v103 + 36));
  *uint64_t v44 = KeyPath;
  v44[1] = v40;
  (*(void (**)(char *, void *))(v41 + 8))(v33, v43);
  uint64_t v45 = sub_1D7ECA140();
  uint64_t v46 = v102;
  sub_1D7E76C60(v42, v102, &qword_1EA87C2B0);
  int v47 = (uint64_t *)(v46 + *(int *)(v104 + 36));
  *int v47 = v45;
  v47[1] = (uint64_t)sub_1D7E76DA0;
  v47[2] = 0;
  sub_1D7E76CC4(v42, &qword_1EA87C2B0);
  sub_1D7E76D20(v46, v120, &qword_1EA87C2B8);
  if (*((unsigned char *)a1 + 42))
  {
    uint64_t v106 = sub_1D7ECA120();
    uint64_t v107 = v51;
    long long v122 = v124;
    v123[0] = *(_OWORD *)v125;
    *(_OWORD *)((char *)v123 + 10) = *(_OWORD *)&v125[10];
    sub_1D7ECA3B0();
    long long v52 = v126;
    char v53 = v127[0];
    uint64_t v54 = *(void *)&v127[8];
    uint64_t v55 = *(void *)&v127[16];
    char v56 = v127[24];
    char v57 = v127[25];
    swift_getKeyPath();
    long long v126 = v52;
    v127[0] = v53;
    *(void *)&v127[8] = v54;
    *(void *)&v127[16] = v55;
    v127[24] = v56;
    v127[25] = v57;
    sub_1D7ECA3A0();
    swift_release();
    swift_release();
    swift_release();
    long long v126 = v122;
    *(void *)long long v127 = *(void *)&v123[0];
    type metadata accessor for STStatusBarBatteryState(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2D8);
    sub_1D7E75B48(&qword_1EA87C2E0, type metadata accessor for STStatusBarBatteryState);
    sub_1D7E767B4(&qword_1EA87C2E8, &qword_1EA87C2D8);
    sub_1D7ECA360();
    uint64_t v107 = (void *)sub_1D7ECA120();
    uint64_t v106 = v58;
    long long v122 = v124;
    v123[0] = *(_OWORD *)v125;
    *(_OWORD *)((char *)v123 + 10) = *(_OWORD *)&v125[10];
    sub_1D7ECA3B0();
    long long v59 = v126;
    char v60 = v127[0];
    uint64_t v61 = *(void *)&v127[8];
    uint64_t v62 = *(void *)&v127[16];
    char v63 = v127[24];
    char v64 = v127[25];
    swift_getKeyPath();
    long long v126 = v59;
    v127[0] = v60;
    *(void *)&v127[8] = v61;
    *(void *)&v127[16] = v62;
    v127[24] = v63;
    v127[25] = v64;
    sub_1D7ECA3A0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v65 = v112;
    sub_1D7ECA380();
    uint64_t v66 = sub_1D7ECA2F0();
    uint64_t v67 = swift_getKeyPath();
    uint64_t v68 = v119;
    uint64_t v69 = *(void (**)(uint64_t, char *, uint64_t))(v119 + 16);
    uint64_t v105 = (char *)(v119 + 16);
    uint64_t v106 = (uint64_t)v69;
    uint64_t v70 = v118;
    uint64_t v71 = v114;
    v69(v118, v65, v114);
    uint64_t v72 = (uint64_t *)(v70 + *(int *)(v99 + 36));
    *uint64_t v72 = v67;
    v72[1] = v66;
    uint64_t v107 = *(void **)(v68 + 8);
    uint64_t v119 = v68 + 8;
    ((void (*)(char *, uint64_t))v107)(v65, v71);
    uint64_t v73 = v109;
    sub_1D7E76D20(v70, v109, &qword_1EA87C290);
    uint64_t v104 = sub_1D7ECA120();
    uint64_t v103 = v74;
    LODWORD(v99) = v75;
    uint64_t v102 = v76;
    long long v122 = v124;
    v123[0] = *(_OWORD *)v125;
    *(_OWORD *)((char *)v123 + 10) = *(_OWORD *)&v125[10];
    sub_1D7ECA3B0();
    long long v77 = v126;
    LOBYTE(v67) = v127[0];
    uint64_t v78 = *(void *)&v127[8];
    uint64_t v79 = *(void *)&v127[16];
    LOBYTE(v70) = v127[24];
    LOBYTE(v68) = v127[25];
    swift_getKeyPath();
    long long v126 = v77;
    v127[0] = v67;
    *(void *)&v127[8] = v78;
    *(void *)&v127[16] = v79;
    v127[24] = v70;
    v127[25] = v68;
    sub_1D7ECA3A0();
    swift_release();
    swift_release();
    swift_release();
    sub_1D7ECA380();
    uint64_t v80 = v100;
    uint64_t v81 = *(void (**)(char *, char *, uint64_t))(v100 + 16);
    char v82 = v108;
    v81(v108, v117, v111);
    uint64_t v83 = v118;
    sub_1D7E76C60(v73, v118, &qword_1EA87C290);
    uint64_t v84 = v101;
    uint64_t v85 = v114;
    char v86 = (void (*)(uint64_t, char *, uint64_t))v106;
    ((void (*)(char *, char *, uint64_t))v106)(v101, v65, v114);
    uint64_t v50 = (uint64_t)v115;
    uint64_t v87 = v82;
    uint64_t v88 = v111;
    v81(v115, v87, v111);
    uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2F0);
    sub_1D7E76C60(v83, v50 + *(int *)(v89 + 48), &qword_1EA87C290);
    v86(v50 + *(int *)(v89 + 64), v84, v85);
    uint64_t v90 = (void (*)(char *, uint64_t))v107;
    ((void (*)(char *, uint64_t))v107)(v112, v85);
    sub_1D7E76CC4(v109, &qword_1EA87C290);
    uint64_t v91 = *(void (**)(char *, uint64_t))(v80 + 8);
    v91(v117, v88);
    v90(v84, v85);
    sub_1D7E76CC4(v118, &qword_1EA87C290);
    v91(v108, v88);
    uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2C8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))(v50, 0, 1, v92);
    uint64_t v49 = v113;
    sub_1D7E76D20(v50, v113, &qword_1EA87C2A0);
  }
  else
  {
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2C8);
    uint64_t v49 = v113;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v113, 1, 1, v48);
    uint64_t v50 = (uint64_t)v115;
  }
  uint64_t v93 = v120;
  uint64_t v94 = v110;
  sub_1D7E76C60(v120, v110, &qword_1EA87C2B8);
  sub_1D7E76C60(v49, v50, &qword_1EA87C2A0);
  uint64_t v95 = v116;
  sub_1D7E76C60(v94, v116, &qword_1EA87C2B8);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C2D0);
  sub_1D7E76C60(v50, v95 + *(int *)(v96 + 48), &qword_1EA87C2A0);
  sub_1D7E76CC4(v49, &qword_1EA87C2A0);
  sub_1D7E76CC4(v93, &qword_1EA87C2B8);
  sub_1D7E76CC4(v50, &qword_1EA87C2A0);
  return sub_1D7E76CC4(v94, &qword_1EA87C2B8);
}

uint64_t sub_1D7E6E0D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E6E100(a1);
}

uint64_t sub_1D7E6E100@<X0>(uint64_t a1@<X8>)
{
  sub_1D7ECA120();
  uint64_t v2 = sub_1D7ECA1F0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_1D7ECA120();
  uint64_t v9 = sub_1D7ECA1F0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(unsigned char *)(a1 + 80) = v12 & 1;
  *(void *)(a1 + 88) = v14;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  sub_1D7E764DC(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6E280@<X0>(void *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF38);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v36 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF40);
  uint64_t v40 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39);
  uint64_t v35 = (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF48);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v42 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v38 = (char *)&v34 - v8;
  uint64_t v41 = sub_1D7ECA270();
  long long v37 = v1;
  long long v9 = v1[1];
  long long v44 = *v1;
  long long v45 = v9;
  v46[0] = v1[2];
  *(_OWORD *)((char *)v46 + 10) = *(long long *)((char *)v1 + 42);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF30);
  sub_1D7ECA3B0();
  long long v11 = v47;
  char v12 = v48;
  uint64_t v13 = *((void *)&v48 + 1);
  char v14 = v49[0];
  uint64_t v15 = *(void *)&v49[8];
  uint64_t v16 = *(void *)&v49[16];
  char v17 = v49[24];
  char v18 = v49[25];
  swift_getKeyPath();
  long long v47 = v11;
  LOBYTE(v48) = v12;
  *((void *)&v48 + 1) = v13;
  v49[0] = v14;
  *(void *)&v49[8] = v15;
  uint64_t v19 = (uint64_t)v38;
  *(void *)&unsigned char v49[16] = v16;
  v49[24] = v17;
  uint64_t v20 = v39;
  v49[25] = v18;
  uint64_t v21 = v37;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v22 = v44;
  char v23 = v45;
  long long v24 = v21[1];
  long long v47 = *v21;
  long long v48 = v24;
  *(_OWORD *)uint64_t v49 = v21[2];
  *(_OWORD *)&v49[10] = *(long long *)((char *)v21 + 42);
  MEMORY[0x1D94822A0](&v44, v10);
  uint64_t v25 = 1;
  if (sub_1D7E76DA4(v44, 1))
  {
    uint64_t v26 = v36;
    sub_1D7E6E6C4(v21, v36);
    char v27 = sub_1D7ECA1C0();
    uint64_t v28 = v35;
    sub_1D7E76C60((uint64_t)v26, v35, &qword_1EA87BF38);
    uint64_t v29 = v28 + *(int *)(v20 + 36);
    *(unsigned char *)uint64_t v29 = v27;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(unsigned char *)(v29 + 40) = 1;
    sub_1D7E76CC4((uint64_t)v26, &qword_1EA87BF38);
    sub_1D7E76D20(v28, v19, &qword_1EA87BF40);
    uint64_t v25 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v19, v25, 1, v20);
  uint64_t v30 = v42;
  sub_1D7E76C60(v19, v42, &qword_1EA87BF48);
  char v31 = v43;
  *uint64_t v43 = 0x746F6F7465756C42;
  v31[1] = 0xE900000000000068;
  *((_OWORD *)v31 + 1) = xmmword_1D7ED4340;
  v31[4] = v41;
  *(_OWORD *)(v31 + 5) = v22;
  *((unsigned char *)v31 + 56) = v23;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF50);
  sub_1D7E76C60(v30, (uint64_t)v31 + *(int *)(v32 + 48), &qword_1EA87BF48);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_1D7E76CC4(v19, &qword_1EA87BF48);
  sub_1D7E76CC4(v30, &qword_1EA87BF48);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1D7E6E6C4@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  long long v45 = a2;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C260);
  uint64_t v43 = *(void *)(v44 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v44);
  uint64_t v42 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v46 = (char *)v38 - v5;
  uint64_t v41 = sub_1D7ECA120();
  uint64_t v40 = v6;
  v38[3] = v7;
  uint64_t v39 = v8;
  long long v9 = a1[1];
  long long v58 = *a1;
  long long v59 = v9;
  long long v11 = *a1;
  long long v10 = a1[1];
  *(_OWORD *)char v60 = a1[2];
  *(_OWORD *)&v60[10] = *(long long *)((char *)a1 + 42);
  long long v47 = v11;
  long long v48 = v10;
  v49[0] = a1[2];
  *(_OWORD *)((char *)v49 + 10) = *(long long *)((char *)a1 + 42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF30);
  sub_1D7ECA3B0();
  long long v12 = v50;
  LOBYTE(a1) = v51;
  uint64_t v13 = v52;
  char v14 = v53;
  uint64_t v15 = v54;
  uint64_t v16 = v55;
  char v17 = v56;
  char v18 = v57;
  swift_getKeyPath();
  long long v50 = v12;
  LOBYTE(v51) = (_BYTE)a1;
  uint64_t v52 = v13;
  char v53 = v14;
  uint64_t v54 = v15;
  uint64_t v55 = v16;
  char v56 = v17;
  char v57 = v18;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v50 = v47;
  uint64_t v51 = v48;
  type metadata accessor for STStatusBarBluetoothState(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C268);
  sub_1D7E75B48(&qword_1EA87C270, type metadata accessor for STStatusBarBluetoothState);
  sub_1D7E767B4(&qword_1EA87C278, &qword_1EA87C268);
  sub_1D7ECA360();
  long long v47 = v58;
  long long v48 = v59;
  v49[0] = *(_OWORD *)v60;
  *(_OWORD *)((char *)v49 + 10) = *(_OWORD *)&v60[10];
  sub_1D7ECA3B0();
  long long v19 = v50;
  char v20 = v51;
  uint64_t v21 = v52;
  char v22 = v53;
  uint64_t v23 = v54;
  uint64_t v24 = v55;
  char v25 = v56;
  LOBYTE(v13) = v57;
  swift_getKeyPath();
  long long v50 = v19;
  LOBYTE(v51) = v20;
  uint64_t v52 = v21;
  char v53 = v22;
  uint64_t v54 = v23;
  uint64_t v55 = v24;
  char v56 = v25;
  char v57 = v13;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v26 = v47;
  LODWORD(v41) = v48;
  uint64_t v40 = *((void *)&v48 + 1);
  uint64_t v27 = *(void *)&v49[0];
  LODWORD(v39) = BYTE8(v49[0]);
  char v28 = BYTE9(v49[0]);
  uint64_t v29 = v43;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  char v31 = v42;
  uint64_t v32 = v46;
  uint64_t v33 = v44;
  v30(v42, v46, v44);
  uint64_t v34 = v45;
  v30(v45, v31, v33);
  uint64_t v35 = &v34[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C280) + 48)];
  *(_OWORD *)uint64_t v35 = v26;
  v35[16] = v41;
  *((void *)v35 + 3) = v40;
  *((void *)v35 + 4) = v27;
  v35[40] = v39;
  v35[41] = v28;
  v35[42] = 0;
  uint64_t v36 = *(void (**)(char *, uint64_t))(v29 + 8);
  swift_retain();
  swift_retain();
  v36(v32, v33);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v36)(v31, v33);
}

uint64_t sub_1D7E6EBD0@<X0>(uint64_t a1@<X8>)
{
  sub_1D7ECA120();
  uint64_t v2 = sub_1D7ECA1F0();
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  char v6 = v5 & 1;
  sub_1D7ECA120();
  uint64_t v7 = sub_1D7ECA1F0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_1D7ECA120();
  uint64_t v14 = sub_1D7ECA1F0();
  uint64_t v16 = v15;
  char v17 = v6;
  char v24 = v6;
  char v19 = v18 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v23;
  *(unsigned char *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = v15;
  *(unsigned char *)(a1 + 144) = v18 & 1;
  *(void *)(a1 + 152) = v20;
  *(void *)(a1 + 160) = 2;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 2;
  *(_WORD *)(a1 + 184) = 0;
  sub_1D7E764DC(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6EE28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v42 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF60);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v41 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF68);
  uint64_t v44 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  uint64_t v40 = (uint64_t)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF70);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v46 = (uint64_t)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v48 = (uint64_t)v37 - v15;
  uint64_t v45 = sub_1D7ECA260();
  *(void *)&long long v49 = a1;
  *((void *)&v49 + 1) = a2;
  LOBYTE(v50) = a3;
  uint64_t v51 = a4;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF58);
  sub_1D7ECA3B0();
  long long v17 = v52;
  char v18 = v53;
  uint64_t v19 = v54;
  swift_getKeyPath();
  long long v52 = v17;
  LOBYTE(v53) = v18;
  uint64_t v54 = v19;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  long long v20 = v49;
  int v43 = v50;
  *(void *)&long long v52 = a1;
  *((void *)&v52 + 1) = a2;
  LOBYTE(v53) = a3;
  uint64_t v54 = a4;
  MEMORY[0x1D94822A0](&v49, v16);
  uint64_t v21 = 1;
  if (sub_1D7E76DA4(v49, 1))
  {
    sub_1D7ECA120();
    uint64_t v38 = v23;
    uint64_t v39 = v22;
    v37[3] = v24;
    *(void *)&long long v49 = a1;
    *((void *)&v49 + 1) = a2;
    LOBYTE(v50) = a3;
    uint64_t v51 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF58);
    sub_1D7ECA3B0();
    long long v25 = v52;
    char v26 = v53;
    uint64_t v27 = v54;
    swift_getKeyPath();
    long long v52 = v25;
    LOBYTE(v53) = v26;
    uint64_t v54 = v27;
    sub_1D7ECA3A0();
    swift_release();
    swift_release();
    swift_release();
    long long v52 = v49;
    uint64_t v53 = v50;
    type metadata accessor for STStatusBarVoiceControlType(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C248);
    sub_1D7E75B48(&qword_1EA87C250, type metadata accessor for STStatusBarVoiceControlType);
    sub_1D7E767B4(&qword_1EA87C258, &qword_1EA87C248);
    uint64_t v28 = (uint64_t)v41;
    sub_1D7ECA360();
    char v29 = sub_1D7ECA1C0();
    uint64_t v30 = v40;
    sub_1D7E76C60(v28, v40, &qword_1EA87BF60);
    uint64_t v31 = v30 + *(int *)(v47 + 36);
    *(unsigned char *)uint64_t v31 = v29;
    *(_OWORD *)(v31 + 8) = 0u;
    *(_OWORD *)(v31 + 24) = 0u;
    *(unsigned char *)(v31 + 40) = 1;
    sub_1D7E76CC4(v28, &qword_1EA87BF60);
    sub_1D7E76D20(v30, v48, &qword_1EA87BF68);
    uint64_t v21 = 0;
  }
  uint64_t v32 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v48, v21, 1, v47);
  uint64_t v33 = v46;
  sub_1D7E76C60(v32, v46, &qword_1EA87BF70);
  uint64_t v34 = v42;
  *uint64_t v42 = 0x6F43206563696F56;
  v34[1] = 0xED00006C6F72746ELL;
  *((_OWORD *)v34 + 1) = xmmword_1D7ED4350;
  void v34[4] = v45;
  *(_OWORD *)(v34 + 5) = v20;
  *((unsigned char *)v34 + 56) = v43;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF78);
  sub_1D7E76C60(v33, (uint64_t)v34 + *(int *)(v35 + 48), &qword_1EA87BF70);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D7E76CC4(v32, &qword_1EA87BF70);
  sub_1D7E76CC4(v33, &qword_1EA87BF70);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6F384@<X0>(uint64_t a1@<X8>)
{
  sub_1D7ECA120();
  uint64_t v2 = sub_1D7ECA1F0();
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  char v6 = v5 & 1;
  sub_1D7ECA120();
  uint64_t v7 = sub_1D7ECA1F0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_1D7ECA120();
  uint64_t v14 = sub_1D7ECA1F0();
  uint64_t v16 = v15;
  char v17 = v6;
  char v24 = v6;
  char v19 = v18 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v23;
  *(unsigned char *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = v15;
  *(unsigned char *)(a1 + 144) = v18 & 1;
  *(void *)(a1 + 152) = v20;
  *(void *)(a1 + 160) = 2;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 2;
  *(_WORD *)(a1 + 184) = 0;
  sub_1D7E764DC(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_1D7E764EC(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6F5C8@<X0>(void *a1@<X8>)
{
  return sub_1D7E6EE28(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1D7E6F5D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF88);
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  MEMORY[0x1F4188790](v4);
  char v56 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF90);
  MEMORY[0x1F4188790](v6 - 8);
  char v57 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF98);
  uint64_t v60 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  uint64_t v55 = (uint64_t)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFA0);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v62 = (uint64_t)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  char v13 = (char *)v48 - v12;
  uint64_t v61 = sub_1D7ECA2A0();
  long long v14 = *(_OWORD *)(v1 + 16);
  unsigned long long v64 = *(_OWORD *)v1;
  long long v65 = v14;
  uint64_t v66 = *(void *)(v1 + 32);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BF80);
  sub_1D7ECA3B0();
  unint64_t v17 = *((void *)&v67 + 1);
  unint64_t v16 = v67;
  char v18 = v68;
  uint64_t v19 = *((void *)&v68 + 1);
  uint64_t v20 = v69;
  swift_getKeyPath();
  unsigned long long v67 = __PAIR128__(v17, v16);
  LOBYTE(v68) = v18;
  *((void *)&v68 + 1) = v19;
  uint64_t v69 = v20;
  sub_1D7ECA3A0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = *((void *)&v64 + 1);
  uint64_t v21 = v64;
  LODWORD(v23) = v65;
  long long v24 = *(_OWORD *)(v2 + 16);
  unsigned long long v67 = *(_OWORD *)v2;
  long long v68 = v24;
  uint64_t v69 = *(void *)(v2 + 32);
  MEMORY[0x1D94822A0](&v64, v15);
  char v25 = v64;
  swift_bridgeObjectRelease();
  uint64_t v26 = 1;
  if (sub_1D7E76DA4(v25, 1))
  {
    uint64_t v51 = sub_1D7ECA120();
    uint64_t v50 = v27;
    v48[1] = v28;
    uint64_t v49 = v29;
    long long v30 = *(_OWORD *)(v2 + 16);
    unsigned long long v64 = *(_OWORD *)v2;
    long long v65 = v30;
    uint64_t v66 = *(void *)(v2 + 32);
    sub_1D7ECA3B0();
    int v52 = (int)v23;
    unint64_t v32 = *((void *)&v67 + 1);
    unint64_t v31 = v67;
    char v33 = v68;
    uint64_t v53 = v22;
    uint64_t v34 = *((void *)&v68 + 1);
    uint64_t v35 = v69;
    swift_getKeyPath();
    uint64_t v54 = v21;
    unsigned long long v67 = __PAIR128__(v32, v31);
    LOBYTE(v68) = v33;
    *((void *)&v68 + 1) = v34;
    uint64_t v69 = v35;
    sub_1D7ECA3A0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v23 = v56;
    sub_1D7ECA420();
    uint64_t v36 = sub_1D7ECA140();
    uint64_t v38 = (uint64_t)v57;
    uint64_t v37 = v58;
    uint64_t v39 = v59;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v57, v23, v59);
    uint64_t v40 = (uint64_t *)(v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB0) + 36));
    *uint64_t v40 = v36;
    v40[1] = (uint64_t)sub_1D7E6FBB0;
    v40[2] = 0;
    uint64_t v41 = v23;
    LOBYTE(v23) = v52;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v41, v39);
    LOBYTE(v36) = sub_1D7ECA1C0();
    uint64_t v42 = v55;
    sub_1D7E76C60(v38, v55, &qword_1EA87BF90);
    uint64_t v43 = v42 + *(int *)(v63 + 36);
    *(unsigned char *)uint64_t v43 = v36;
    *(_OWORD *)(v43 + 8) = 0u;
    *(_OWORD *)(v43 + 24) = 0u;
    *(unsigned char *)(v43 + 40) = 1;
    uint64_t v44 = v38;
    uint64_t v22 = v53;
    uint64_t v21 = v54;
    sub_1D7E76CC4(v44, &qword_1EA87BF90);
    sub_1D7E76D20(v42, (uint64_t)v13, &qword_1EA87BF98);
    uint64_t v26 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56))(v13, v26, 1, v63);
  uint64_t v45 = v62;
  sub_1D7E76C60((uint64_t)v13, v62, &qword_1EA87BFA0);
  *(void *)a1 = 1919251285;
  *(void *)(a1 + 8) = 0xE400000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_1D7ED4360;
  *(void *)(a1 + 32) = v61;
  *(void *)(a1 + 40) = v21;
  *(void *)(a1 + 48) = v22;
  *(unsigned char *)(a1 + 56) = (_BYTE)v23;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFA8);
  sub_1D7E76C60(v45, a1 + *(int *)(v46 + 48), &qword_1EA87BFA0);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D7E76CC4((uint64_t)v13, &qword_1EA87BFA0);
  sub_1D7E76CC4(v45, &qword_1EA87BFA0);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E6FBB0()
{
  uint64_t v0 = sub_1D7ECA150();
  return MEMORY[0x1D9481F60](v0);
}

uint64_t sub_1D7E6FBDC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA320();
  return v1;
}

uint64_t sub_1D7E6FC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v18[1] = a5;
  v18[0] = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1F4188790](v18[0]);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFC0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  long long v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[4] = a1;
  v18[5] = a2;
  v18[6] = a3;
  v18[7] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFC8);
  sub_1D7E767B4(&qword_1EA87BFD0, &qword_1EA87BFC8);
  sub_1D7ECA1E0();
  v18[9] = a1;
  v18[10] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  uint64_t v15 = sub_1D7ECA320();
  (*(void (**)(uint64_t))(*(void *)v18[11] + 120))(v15);
  swift_release();
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  swift_retain();
  swift_retain();
  sub_1D7E74254(a3);
  sub_1D7E767B4(&qword_1EA87BFD8, &qword_1EA87BFC0);
  sub_1D7E75B48(&qword_1EA87BFE0, (void (*)(uint64_t))type metadata accessor for StatusBarOverrides);
  sub_1D7ECA250();
  swift_release();
  sub_1D7E742B8((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_1D7E6FEF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(char *, uint64_t)@<X8>)
{
  uint64_t v113 = a5;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0E0);
  uint64_t v147 = *(void *)(v137 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v137);
  uint64_t v136 = (char *)&v111 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v112 = (char *)&v111 - v11;
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0E8);
  uint64_t v146 = *(void *)(v135 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v135);
  uint64_t v134 = (char *)&v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  long long v133 = (char *)&v111 - v14;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0F0);
  uint64_t v154 = *(void *)(v132 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v132);
  long long v131 = (char *)&v111 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v141 = (char *)&v111 - v17;
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C0F8);
  uint64_t v153 = *(void *)(v129 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v129);
  long long v127 = (char *)&v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v140 = (char *)&v111 - v20;
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C100);
  uint64_t v152 = *(void *)(v143 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v143);
  long long v124 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  char v138 = (char *)&v111 - v23;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C108);
  uint64_t v151 = *(void *)(v130 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v130);
  long long v122 = (char *)&v111 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  v145 = (char *)&v111 - v26;
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C110);
  uint64_t v150 = *(void *)(v128 - 8);
  uint64_t v27 = MEMORY[0x1F4188790](v128);
  long long v121 = (char *)&v111 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  uint64_t v144 = (char *)&v111 - v29;
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C118);
  uint64_t v149 = *(void *)(v126 - 8);
  uint64_t v30 = MEMORY[0x1F4188790](v126);
  uint64_t v119 = (char *)&v111 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v30);
  uint64_t v142 = (char *)&v111 - v32;
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C120);
  uint64_t v148 = *(void *)(v125 - 8);
  uint64_t v33 = MEMORY[0x1F4188790](v125);
  uint64_t v118 = (char *)&v111 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v33);
  char v139 = (char *)&v111 - v35;
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C128);
  uint64_t v123 = *(void *)(v116 - 8);
  uint64_t v36 = MEMORY[0x1F4188790](v116);
  char v115 = (char *)&v111 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x1F4188790](v36);
  uint64_t v114 = (char *)&v111 - v39;
  uint64_t v40 = MEMORY[0x1F4188790](v38);
  uint64_t v117 = (char *)&v111 - v41;
  MEMORY[0x1F4188790](v40);
  uint64_t v120 = (char *)&v111 - v42;
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v43;
  LOBYTE(v197) = v44 & 1;
  int v198 = v45;
  uint64_t v191 = a1;
  uint64_t v192 = a2;
  uint64_t v193 = a3;
  uint64_t v194 = a4;
  sub_1D7E75D70();
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v46;
  LOBYTE(v197) = v47 & 1;
  int v198 = v48;
  uint64_t v187 = a1;
  uint64_t v188 = a2;
  uint64_t v189 = a3;
  uint64_t v190 = a4;
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v49;
  LOBYTE(v197) = v50 & 1;
  int v198 = v51;
  uint64_t v183 = a1;
  uint64_t v184 = a2;
  uint64_t v185 = a3;
  uint64_t v186 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C138);
  uint64_t v111 = MEMORY[0x1E4F3F110];
  sub_1D7E767B4(&qword_1EA87C140, &qword_1EA87C138);
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v52;
  LOBYTE(v197) = v53 & 1;
  int v198 = v54;
  uint64_t v179 = a1;
  uint64_t v180 = a2;
  uint64_t v181 = a3;
  uint64_t v182 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C148);
  sub_1D7E767B4(&qword_1EA87C150, &qword_1EA87C148);
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v55;
  LOBYTE(v197) = v56 & 1;
  int v198 = v57;
  uint64_t v175 = a1;
  uint64_t v176 = a2;
  uint64_t v177 = a3;
  uint64_t v178 = a4;
  sub_1D7E75E20();
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v58;
  LOBYTE(v197) = v59 & 1;
  int v198 = v60;
  uint64_t v171 = a1;
  uint64_t v172 = a2;
  uint64_t v173 = a3;
  uint64_t v174 = a4;
  sub_1D7E75E7C();
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v61;
  LOBYTE(v197) = v62 & 1;
  int v198 = v63;
  uint64_t v167 = a1;
  uint64_t v168 = a2;
  uint64_t v169 = a3;
  uint64_t v170 = a4;
  sub_1D7E75ED8();
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v64;
  LOBYTE(v197) = v65 & 1;
  int v198 = v66;
  uint64_t v163 = a1;
  uint64_t v164 = a2;
  uint64_t v165 = a3;
  uint64_t v166 = a4;
  sub_1D7E75F50();
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v67;
  LOBYTE(v197) = v68 & 1;
  int v198 = v69;
  uint64_t v159 = a1;
  uint64_t v160 = a2;
  uint64_t v161 = a3;
  uint64_t v162 = a4;
  sub_1D7E75FAC();
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v195 = sub_1D7ECA1F0();
  int v196 = v70;
  LOBYTE(v197) = v71 & 1;
  int v198 = v72;
  uint64_t v155 = a1;
  uint64_t v156 = a2;
  uint64_t v157 = a3;
  uint64_t v158 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C180);
  sub_1D7E767B4(&qword_1EA87C188, &qword_1EA87C180);
  sub_1D7ECA400();
  sub_1D7ECA120();
  uint64_t v73 = (void *)swift_allocObject();
  v73[2] = a1;
  v73[3] = a2;
  v73[4] = a3;
  v73[5] = a4;
  swift_retain();
  swift_retain();
  sub_1D7E74254(a3);
  uint64_t v74 = v112;
  sub_1D7ECA340();
  int v75 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
  uint64_t v76 = (uint64_t)v114;
  uint64_t v77 = v116;
  v75(v114, v120, v116);
  uint64_t v195 = v76;
  uint64_t v78 = v115;
  v75(v115, v117, v77);
  int v196 = v78;
  uint64_t v79 = v118;
  (*(void (**)(char *, char *, uint64_t))(v148 + 16))(v118, v139, v125);
  __int16 v197 = v79;
  uint64_t v80 = v119;
  (*(void (**)(char *, char *, uint64_t))(v149 + 16))(v119, v142, v126);
  int v198 = v80;
  uint64_t v81 = v121;
  (*(void (**)(char *, char *, uint64_t))(v150 + 16))(v121, v144, v128);
  __int16 v199 = v81;
  char v82 = v122;
  (*(void (**)(char *, char *, uint64_t))(v151 + 16))(v122, v145, v130);
  int v200 = v82;
  uint64_t v83 = v124;
  (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v124, v138, v143);
  __int16 v201 = v83;
  uint64_t v84 = v127;
  uint64_t v85 = v129;
  (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v127, v140, v129);
  v202 = v84;
  char v86 = v131;
  uint64_t v87 = v132;
  (*(void (**)(char *, char *, uint64_t))(v154 + 16))(v131, v141, v132);
  long long v203 = v86;
  uint64_t v88 = v146;
  uint64_t v90 = v133;
  uint64_t v89 = v134;
  uint64_t v91 = v135;
  (*(void (**)(char *, char *, uint64_t))(v146 + 16))(v134, v133, v135);
  long long v204 = v89;
  uint64_t v92 = v147;
  uint64_t v94 = v136;
  uint64_t v93 = v137;
  (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v136, v74, v137);
  long long v205 = v94;
  sub_1D7E68778(&v195, (uint64_t)v113);
  uint64_t v95 = *(void (**)(char *, uint64_t))(v92 + 8);
  uint64_t v147 = v92 + 8;
  uint64_t v113 = v95;
  v95(v74, v93);
  uint64_t v96 = *(char **)(v88 + 8);
  uint64_t v146 = v88 + 8;
  uint64_t v112 = v96;
  ((void (*)(char *, uint64_t))v96)(v90, v91);
  char v97 = *(char **)(v154 + 8);
  v154 += 8;
  long long v133 = v97;
  ((void (*)(char *, uint64_t))v97)(v141, v87);
  char v98 = *(char **)(v153 + 8);
  v153 += 8;
  uint64_t v141 = v98;
  ((void (*)(char *, uint64_t))v98)(v140, v85);
  uint64_t v99 = *(char **)(v152 + 8);
  v152 += 8;
  uint64_t v140 = v99;
  ((void (*)(char *, uint64_t))v99)(v138, v143);
  uint64_t v100 = *(char **)(v151 + 8);
  v151 += 8;
  char v138 = v100;
  uint64_t v101 = v130;
  ((void (*)(char *, uint64_t))v100)(v145, v130);
  uint64_t v102 = *(char **)(v150 + 8);
  v150 += 8;
  v145 = v102;
  uint64_t v103 = v128;
  ((void (*)(char *, uint64_t))v102)(v144, v128);
  uint64_t v104 = *(void (**)(char *, uint64_t))(v149 + 8);
  v149 += 8;
  uint64_t v105 = v126;
  v104(v142, v126);
  uint64_t v106 = *(void (**)(char *, uint64_t))(v148 + 8);
  v148 += 8;
  uint64_t v107 = v125;
  v106(v139, v125);
  char v108 = *(void (**)(char *, uint64_t))(v123 + 8);
  uint64_t v109 = v116;
  v108(v117, v116);
  v108(v120, v109);
  v113(v136, v137);
  ((void (*)(char *, uint64_t))v112)(v134, v135);
  ((void (*)(char *, uint64_t))v133)(v131, v132);
  ((void (*)(char *, uint64_t))v141)(v127, v129);
  ((void (*)(char *, uint64_t))v140)(v124, v143);
  ((void (*)(char *, uint64_t))v138)(v122, v101);
  ((void (*)(char *, uint64_t))v145)(v121, v103);
  v104(v119, v105);
  v106(v118, v107);
  v108(v115, v109);
  return ((uint64_t (*)(char *, uint64_t))v108)(v114, v109);
}

uint64_t sub_1D7E711E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 120))();
}

uint64_t sub_1D7E71228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7E760D0(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 128))(v6);
}

__n128 sub_1D7E712D4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v9 = v18;
  uint64_t v10 = v19;
  uint64_t v11 = v20;
  swift_getKeyPath();
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v12 = v19;
  char v13 = v20;
  __n128 result = v23;
  uint64_t v15 = v24;
  long long v16 = v21;
  long long v17 = v22;
  *(void *)a3 = v18;
  *(void *)(a3 + 8) = v12;
  *(unsigned char *)(a3 + 16) = v13;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v17;
  *(__n128 *)(a3 + 56) = result;
  *(void *)(a3 + 72) = v15;
  return result;
}

uint64_t sub_1D7E71458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v36 = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v26);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1D7ECA2E0();
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v9 = v37;
  uint64_t v8 = v38;
  uint64_t v10 = v39;
  swift_getKeyPath();
  uint64_t v37 = v9;
  uint64_t v38 = v8;
  uint64_t v39 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v7, &qword_1EA87C198);
  uint64_t v31 = v37;
  uint64_t v33 = v38;
  int v32 = v39;
  uint64_t v34 = sub_1D7ECA270();
  uint64_t v11 = v27;
  uint64_t v42 = v36;
  uint64_t v43 = v27;
  sub_1D7ECA330();
  uint64_t v12 = v37;
  uint64_t v13 = v38;
  uint64_t v14 = v39;
  swift_getKeyPath();
  uint64_t v37 = v12;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v7, &qword_1EA87C198);
  uint64_t v29 = v38;
  uint64_t v30 = v37;
  int v28 = v39;
  uint64_t v42 = v36;
  uint64_t v43 = v11;
  sub_1D7ECA330();
  uint64_t v15 = v37;
  uint64_t v16 = v38;
  uint64_t v17 = v39;
  swift_getKeyPath();
  uint64_t v37 = v15;
  uint64_t v38 = v16;
  uint64_t v39 = v17;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v7, &qword_1EA87C198);
  uint64_t v18 = v37;
  uint64_t v19 = v38;
  char v20 = v39;
  uint64_t v21 = v41;
  long long v22 = v40;
  strcpy((char *)a3, "Airplane Mode");
  *(_WORD *)(a3 + 14) = -4864;
  *(_OWORD *)(a3 + 16) = xmmword_1D7ED4370;
  uint64_t v23 = v31;
  *(void *)(a3 + 32) = v35;
  *(void *)(a3 + 40) = v23;
  *(void *)(a3 + 48) = v33;
  *(unsigned char *)(a3 + 56) = v32;
  *(void *)(a3 + 64) = 5132374;
  *(void *)(a3 + 72) = 0xE300000000000000;
  *(void *)(a3 + 80) = 0xD00000000000001FLL;
  *(void *)(a3 + 88) = 0x80000001D7ED9710;
  uint64_t v24 = v30;
  *(void *)(a3 + 96) = v34;
  *(void *)(a3 + 104) = v24;
  *(void *)(a3 + 112) = v29;
  *(unsigned char *)(a3 + 120) = v28;
  *(void *)(a3 + 128) = v18;
  *(void *)(a3 + 136) = v19;
  *(unsigned char *)(a3 + 144) = v20;
  *(_OWORD *)(a3 + 152) = v22;
  *(void *)(a3 + 168) = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E7184C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v86 = a4;
  uint64_t v85 = a3;
  uint64_t v98 = a2;
  uint64_t v109 = a5;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A8);
  MEMORY[0x1F4188790](v96);
  uint64_t v97 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1B0);
  MEMORY[0x1F4188790](v88);
  uint64_t v89 = (uint64_t)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1B8);
  MEMORY[0x1F4188790](v95);
  uint64_t v90 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1C0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v92 = (uint64_t)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1C8);
  uint64_t v12 = MEMORY[0x1F4188790](v93);
  uint64_t v91 = (uint64_t)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v94 = (uint64_t)&v84 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1D0);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v87 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1F4188790](v100);
  uint64_t v99 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1D8);
  uint64_t v19 = MEMORY[0x1F4188790](v18 - 8);
  char v108 = (char *)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v107 = (uint64_t)&v84 - v21;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1E0);
  MEMORY[0x1F4188790](v111);
  uint64_t v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v101);
  uint64_t v25 = (char *)&v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_1D7ECA280();
  uint64_t v112 = a1;
  uint64_t v113 = a2;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v27 = v114;
  uint64_t v26 = v115;
  uint64_t v28 = v116;
  swift_getKeyPath();
  uint64_t v114 = v27;
  uint64_t v115 = v26;
  uint64_t v116 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v25, &qword_1EA87C198);
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v23, &qword_1EA87C1E0);
  uint64_t v103 = v115;
  uint64_t v104 = v114;
  int v102 = v116;
  uint64_t v105 = sub_1D7ECA260();
  uint64_t v29 = v98;
  uint64_t v112 = a1;
  uint64_t v113 = v98;
  sub_1D7ECA330();
  uint64_t v30 = v114;
  uint64_t v31 = v115;
  uint64_t v32 = v116;
  swift_getKeyPath();
  uint64_t v114 = v30;
  uint64_t v115 = v31;
  uint64_t v116 = v32;
  uint64_t v33 = (uint64_t)v99;
  sub_1D7ECA3A0();
  swift_release();
  uint64_t v34 = v100;
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  uint64_t v35 = (uint64_t)v25;
  uint64_t v36 = a1;
  sub_1D7E76CC4(v35, &qword_1EA87C198);
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v23, &qword_1EA87C1E0);
  uint64_t v37 = v114;
  uint64_t v101 = v115;
  LODWORD(v111) = v116;
  uint64_t v114 = a1;
  uint64_t v115 = v29;
  uint64_t v38 = sub_1D7ECA320();
  (*(void (**)(uint64_t))(*(void *)v112 + 120))(v38);
  swift_release();
  LOBYTE(v30) = *(unsigned char *)(v33 + *(int *)(v34 + 40));
  sub_1D7E742B8(v33);
  if (sub_1D7E76DA4(v30, 1)
    && (uint64_t v114 = a1,
        uint64_t v115 = v29,
        uint64_t v39 = sub_1D7ECA320(),
        (*(void (**)(uint64_t))(*(void *)v112 + 120))(v39),
        swift_release(),
        char v40 = *(unsigned char *)(v33 + *(int *)(v34 + 36)),
        sub_1D7E742B8(v33),
        sub_1D7E76DA4(v40, 1)))
  {
    sub_1D7ECA4E0();
    swift_retain();
    swift_retain();
    uint64_t v41 = v85;
    uint64_t v42 = v86;
    sub_1D7E74254(v85);
    uint64_t v43 = sub_1D7ECA4D0();
    char v44 = (void *)swift_allocObject();
    uint64_t v45 = MEMORY[0x1E4FBCFD8];
    v44[2] = v43;
    v44[3] = v45;
    v44[4] = v36;
    v44[5] = v29;
    v44[6] = v41;
    v44[7] = v42;
    swift_retain();
    swift_retain();
    sub_1D7E74254(v41);
    uint64_t v46 = sub_1D7ECA4D0();
    char v47 = (void *)swift_allocObject();
    v47[2] = v46;
    v47[3] = v45;
    v47[4] = v36;
    v47[5] = v29;
    v47[6] = v41;
    v47[7] = v42;
    sub_1D7EC9F10();
    uint64_t v48 = v37;
    uint64_t v49 = (uint64_t)v87;
    sub_1D7ECA3C0();
    uint64_t v50 = v92;
    sub_1D7E72AFC(v49, v92);
    LOBYTE(v46) = sub_1D7ECA1C0();
    uint64_t v51 = v91;
    sub_1D7E76C60(v50, v91, &qword_1EA87C1C0);
    uint64_t v52 = v51 + *(int *)(v93 + 36);
    *(unsigned char *)uint64_t v52 = v46;
    *(_OWORD *)(v52 + 8) = 0u;
    *(_OWORD *)(v52 + 24) = 0u;
    *(unsigned char *)(v52 + 40) = 1;
    sub_1D7E76CC4(v50, &qword_1EA87C1C0);
    uint64_t v53 = v94;
    sub_1D7E76D20(v51, v94, &qword_1EA87C1C8);
    sub_1D7E76C60(v53, v89, &qword_1EA87C1C8);
    swift_storeEnumTagMultiPayload();
    sub_1D7E761A8();
    uint64_t v54 = (uint64_t)v90;
    sub_1D7ECA180();
    sub_1D7E76C60(v54, v97, &qword_1EA87C1B8);
    swift_storeEnumTagMultiPayload();
    sub_1D7E76134();
    uint64_t v55 = (uint64_t)v108;
    sub_1D7ECA180();
    sub_1D7E76CC4(v54, &qword_1EA87C1B8);
    sub_1D7E76CC4(v53, &qword_1EA87C1C8);
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1E8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v55, 0, 1, v56);
    uint64_t v57 = v107;
    sub_1D7E76D20(v55, v107, &qword_1EA87C1D8);
    uint64_t v58 = v49;
    uint64_t v37 = v48;
    sub_1D7E76CC4(v58, &qword_1EA87C1D0);
  }
  else
  {
    uint64_t v114 = a1;
    uint64_t v115 = v29;
    uint64_t v59 = sub_1D7ECA320();
    (*(void (**)(uint64_t))(*(void *)v112 + 120))(v59);
    swift_release();
    char v60 = *(unsigned char *)(v33 + *(int *)(v34 + 36));
    sub_1D7E742B8(v33);
    if (sub_1D7E76DA4(v60, 1))
    {
      uint64_t v61 = v92;
      sub_1D7E72D54(a1, v29, (uint64_t)&unk_1D7ED4ED8, MEMORY[0x1E4F3D788], v92);
      char v62 = sub_1D7ECA1C0();
      uint64_t v63 = v91;
      sub_1D7E76C60(v61, v91, &qword_1EA87C1C0);
      uint64_t v64 = v63 + *(int *)(v93 + 36);
      *(unsigned char *)uint64_t v64 = v62;
      *(_OWORD *)(v64 + 8) = 0u;
      *(_OWORD *)(v64 + 24) = 0u;
      *(unsigned char *)(v64 + 40) = 1;
      sub_1D7E76CC4(v61, &qword_1EA87C1C0);
      uint64_t v65 = v94;
      sub_1D7E76D20(v63, v94, &qword_1EA87C1C8);
      sub_1D7E76C60(v65, v89, &qword_1EA87C1C8);
      swift_storeEnumTagMultiPayload();
      sub_1D7E761A8();
      uint64_t v66 = (uint64_t)v90;
      sub_1D7ECA180();
      sub_1D7E76C60(v66, v97, &qword_1EA87C1B8);
      swift_storeEnumTagMultiPayload();
      sub_1D7E76134();
      uint64_t v55 = (uint64_t)v108;
      sub_1D7ECA180();
      sub_1D7E76CC4(v66, &qword_1EA87C1B8);
      uint64_t v67 = v65;
    }
    else
    {
      uint64_t v114 = a1;
      uint64_t v115 = v29;
      uint64_t v68 = sub_1D7ECA320();
      (*(void (**)(uint64_t))(*(void *)v112 + 120))(v68);
      swift_release();
      char v69 = *(unsigned char *)(v33 + *(int *)(v34 + 40));
      sub_1D7E742B8(v33);
      BOOL v70 = sub_1D7E76DA4(v69, 1);
      uint64_t v55 = (uint64_t)v108;
      if (!v70)
      {
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1E8);
        uint64_t v57 = v107;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v107, 1, 1, v77);
        goto LABEL_10;
      }
      uint64_t v71 = v92;
      sub_1D7E72D54(a1, v29, (uint64_t)&unk_1D7ED4F18, MEMORY[0x1E4F3D790], v92);
      char v72 = sub_1D7ECA1C0();
      uint64_t v73 = v91;
      sub_1D7E76C60(v71, v91, &qword_1EA87C1C0);
      uint64_t v74 = v73 + *(int *)(v93 + 36);
      *(unsigned char *)uint64_t v74 = v72;
      *(_OWORD *)(v74 + 8) = 0u;
      *(_OWORD *)(v74 + 24) = 0u;
      *(unsigned char *)(v74 + 40) = 1;
      sub_1D7E76CC4(v71, &qword_1EA87C1C0);
      uint64_t v75 = v94;
      sub_1D7E76D20(v73, v94, &qword_1EA87C1C8);
      sub_1D7E76C60(v75, v97, &qword_1EA87C1C8);
      swift_storeEnumTagMultiPayload();
      sub_1D7E76134();
      sub_1D7E761A8();
      sub_1D7ECA180();
      uint64_t v67 = v75;
    }
    sub_1D7E76CC4(v67, &qword_1EA87C1C8);
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1E8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v55, 0, 1, v76);
    uint64_t v57 = v107;
    sub_1D7E76D20(v55, v107, &qword_1EA87C1D8);
  }
LABEL_10:
  sub_1D7E76C60(v57, v55, &qword_1EA87C1D8);
  uint64_t v78 = v109;
  *uint64_t v109 = 0x656469727265764FLL;
  v78[1] = 0xED0000656D695420;
  *((_OWORD *)v78 + 1) = xmmword_1D7ED4380;
  uint64_t v79 = v105;
  uint64_t v81 = v103;
  uint64_t v80 = v104;
  v78[4] = v106;
  v78[5] = v80;
  v78[6] = v81;
  *((unsigned char *)v78 + 56) = v102;
  strcpy((char *)v78 + 64, "Override Date");
  *((_WORD *)v78 + 39) = -4864;
  *((_OWORD *)v78 + 5) = xmmword_1D7ED4390;
  v78[12] = v79;
  v78[13] = v37;
  v78[14] = v101;
  *((unsigned char *)v78 + 120) = v111;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1F0);
  sub_1D7E76C60(v55, (uint64_t)v78 + *(int *)(v82 + 64), &qword_1EA87C1D8);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1D7E76CC4(v57, &qword_1EA87C1D8);
  sub_1D7E76CC4(v55, &qword_1EA87C1D8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E72798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v5 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D7EC9F10();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  uint64_t v15 = sub_1D7ECA320();
  (*(void (**)(uint64_t))(*(void *)v32 + 120))(v15);
  swift_release();
  uint64_t v24 = v12;
  uint64_t v17 = *(int *)(v12 + 36);
  uint64_t v16 = (int *)(v12 + 36);
  uint64_t v18 = &v14[v17 + *(int *)(v5 + 20)];
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v25(v11, v18, v8);
  sub_1D7E742B8((uint64_t)v14);
  sub_1D7E770C8(v7);
  uint64_t v28 = v5;
  uint64_t v19 = &v7[*(int *)(v5 + 20)];
  sub_1D7E75B48(&qword_1EA87C240, MEMORY[0x1E4F27928]);
  LOBYTE(a2) = sub_1D7ECA460();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v11, v8);
  v20(v19, v8);
  uint64_t v30 = v26;
  uint64_t v31 = v27;
  uint64_t v21 = sub_1D7ECA320();
  (*(void (**)(uint64_t))(*(void *)v32 + 120))(v21);
  swift_release();
  if (a2) {
    uint64_t v16 = (int *)(v24 + 40);
  }
  v25(v29, &v14[*v16 + (uint64_t)*(int *)(v28 + 20)], v8);
  return sub_1D7E742B8((uint64_t)v14);
}

uint64_t sub_1D7E72AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v11[2] = a2;
  uint64_t v3 = sub_1D7ECA1B0();
  MEMORY[0x1F4188790](v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1D0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D7ECA120();
  v11[0] = v8;
  v11[1] = v7;
  sub_1D7E76C60(a1, (uint64_t)v6, &qword_1EA87C1D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C220);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1D7ED43A0;
  sub_1D7ECA1A0();
  sub_1D7ECA190();
  v11[3] = v9;
  sub_1D7E75B48(&qword_1EA87C228, MEMORY[0x1E4F3D798]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C230);
  sub_1D7E767B4(&qword_1EA87C238, &qword_1EA87C230);
  sub_1D7ECA520();
  return sub_1D7ECA000();
}

uint64_t sub_1D7E72D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, void (*a4)(void)@<X4>, uint64_t a5@<X8>)
{
  uint64_t v32 = a4;
  v25[2] = a3;
  uint64_t v35 = a5;
  uint64_t v34 = sub_1D7ECA1B0();
  uint64_t v30 = *(void *)(v34 - 8);
  uint64_t v31 = v30;
  MEMORY[0x1F4188790](v34);
  uint64_t v33 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1D0);
  MEMORY[0x1F4188790](v8 - 8);
  v25[1] = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1E0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1D7ECA120();
  uint64_t v28 = v17;
  uint64_t v29 = v16;
  int v26 = v18;
  uint64_t v27 = v19;
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v20 = v38;
  uint64_t v21 = v39;
  uint64_t v22 = v40;
  swift_getKeyPath();
  uint64_t v38 = v20;
  uint64_t v39 = v21;
  uint64_t v40 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v15, &qword_1EA87C198);
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v12, &qword_1EA87C1E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C220);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1D7ED43B0;
  v32();
  uint64_t v38 = v23;
  sub_1D7E75B48(&qword_1EA87C228, MEMORY[0x1E4F3D798]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C230);
  sub_1D7E767B4(&qword_1EA87C238, &qword_1EA87C230);
  sub_1D7ECA520();
  return sub_1D7ECA000();
}

double sub_1D7E73128@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v9 = v18;
  uint64_t v10 = v19;
  uint64_t v11 = v20;
  swift_getKeyPath();
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v12 = v19;
  char v13 = v20;
  uint64_t v14 = v21;
  double result = v22;
  char v16 = v23;
  char v17 = v24;
  *(void *)a3 = v18;
  *(void *)(a3 + 8) = v12;
  *(unsigned char *)(a3 + 16) = v13;
  *(void *)(a3 + 24) = v14;
  *(double *)(a3 + 32) = result;
  *(unsigned char *)(a3 + 40) = v16;
  *(unsigned char *)(a3 + 41) = v17;
  *(unsigned char *)(a3 + 42) = 1;
  return result;
}

double sub_1D7E732B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v9 = v20;
  uint64_t v10 = v21;
  uint64_t v11 = v22;
  swift_getKeyPath();
  uint64_t v20 = v9;
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v12 = v21;
  char v13 = v22;
  uint64_t v14 = v23;
  char v15 = v24;
  uint64_t v16 = v25;
  double result = v26;
  char v18 = v27;
  char v19 = v28;
  *(void *)a3 = v20;
  *(void *)(a3 + 8) = v12;
  *(unsigned char *)(a3 + 16) = v13;
  *(void *)(a3 + 24) = v14;
  *(unsigned char *)(a3 + 32) = v15;
  *(void *)(a3 + 40) = v16;
  *(double *)(a3 + 48) = result;
  *(unsigned char *)(a3 + 56) = v18;
  *(unsigned char *)(a3 + 57) = v19;
  return result;
}

uint64_t sub_1D7E73448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  uint64_t v11 = v18;
  swift_getKeyPath();
  uint64_t v16 = v9;
  uint64_t v17 = v10;
  uint64_t v18 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  uint64_t result = sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v13 = v17;
  char v14 = v18;
  uint64_t v15 = v19;
  *(void *)a3 = v16;
  *(void *)(a3 + 8) = v13;
  *(unsigned char *)(a3 + 16) = v14;
  *(void *)(a3 + 24) = v15;
  return result;
}

uint64_t sub_1D7E735B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v9 = v18;
  uint64_t v10 = v19;
  uint64_t v11 = v20;
  swift_getKeyPath();
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  uint64_t result = sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v13 = v19;
  char v14 = v20;
  uint64_t v15 = v21;
  uint64_t v16 = v22;
  *(void *)a3 = v18;
  *(void *)(a3 + 8) = v13;
  *(unsigned char *)(a3 + 16) = v14;
  *(void *)(a3 + 24) = v15;
  *(void *)(a3 + 32) = v16;
  return result;
}

uint64_t sub_1D7E73720@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C198);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1D7ECA290();
  uint64_t v65 = a1;
  uint64_t v66 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA330();
  uint64_t v10 = v67;
  uint64_t v11 = v68;
  uint64_t v12 = v69;
  swift_getKeyPath();
  uint64_t v67 = v10;
  uint64_t v68 = v11;
  uint64_t v69 = v12;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C1A0);
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  uint64_t v55 = v6;
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v52 = v67;
  uint64_t v51 = v68;
  int v53 = v69;
  uint64_t v62 = sub_1D7ECA2E0();
  uint64_t v65 = a1;
  uint64_t v66 = v64;
  uint64_t v56 = v9;
  sub_1D7ECA330();
  uint64_t v13 = v67;
  uint64_t v14 = v68;
  uint64_t v15 = v69;
  swift_getKeyPath();
  uint64_t v67 = v13;
  uint64_t v68 = v14;
  uint64_t v69 = v15;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v49 = v67;
  uint64_t v48 = v68;
  int v50 = v69;
  uint64_t v60 = sub_1D7ECA2B0();
  uint64_t v57 = a1;
  uint64_t v65 = a1;
  uint64_t v66 = v64;
  sub_1D7ECA330();
  uint64_t v16 = v67;
  uint64_t v17 = v68;
  uint64_t v18 = v69;
  swift_getKeyPath();
  uint64_t v67 = v16;
  uint64_t v68 = v17;
  uint64_t v69 = v18;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v45 = v67;
  uint64_t v61 = v68;
  int v46 = v69;
  uint64_t v47 = sub_1D7ECA270();
  uint64_t v65 = a1;
  uint64_t v66 = v64;
  sub_1D7ECA330();
  uint64_t v19 = v67;
  uint64_t v20 = v68;
  uint64_t v21 = v69;
  swift_getKeyPath();
  uint64_t v67 = v19;
  uint64_t v68 = v20;
  uint64_t v69 = v21;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v58 = v67;
  uint64_t v59 = v68;
  int v43 = v69;
  uint64_t v44 = sub_1D7ECA2C0();
  uint64_t v22 = v64;
  uint64_t v65 = v57;
  uint64_t v66 = v64;
  sub_1D7ECA330();
  uint64_t v23 = v67;
  uint64_t v24 = v68;
  uint64_t v25 = v69;
  swift_getKeyPath();
  uint64_t v67 = v23;
  uint64_t v68 = v24;
  uint64_t v69 = v25;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v41 = v67;
  uint64_t v40 = v68;
  int v39 = v69;
  uint64_t v42 = sub_1D7ECA2F0();
  uint64_t v65 = v57;
  uint64_t v66 = v22;
  sub_1D7ECA330();
  uint64_t v26 = v67;
  uint64_t v27 = v68;
  uint64_t v28 = v69;
  swift_getKeyPath();
  uint64_t v67 = v26;
  uint64_t v68 = v27;
  uint64_t v69 = v28;
  sub_1D7ECA3A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1D7ECA3A0();
  swift_release();
  sub_1D7E76CC4((uint64_t)v8, &qword_1EA87C198);
  uint64_t v29 = v67;
  uint64_t v30 = v68;
  char v31 = v69;
  *(_DWORD *)(a3 + 57) = v67;
  *(_DWORD *)(a3 + 60) = *(_DWORD *)((char *)&v67 + 3);
  *(_DWORD *)(a3 + 121) = v65;
  *(_DWORD *)(a3 + 124) = *(_DWORD *)((char *)&v65 + 3);
  *(_DWORD *)(a3 + 185) = *(_DWORD *)v72;
  *(_DWORD *)(a3 + 188) = *(_DWORD *)&v72[3];
  *(_DWORD *)(a3 + 252) = *(_DWORD *)&v71[3];
  *(_DWORD *)(a3 + 249) = *(_DWORD *)v71;
  int v32 = *(_DWORD *)v70;
  *(_DWORD *)(a3 + 316) = *(_DWORD *)&v70[3];
  *(_DWORD *)(a3 + 313) = v32;
  strcpy((char *)a3, "Rotation Lock");
  *(_WORD *)(a3 + 14) = -4864;
  *(_OWORD *)(a3 + 16) = xmmword_1D7ED43C0;
  uint64_t v33 = v52;
  *(void *)(a3 + 32) = v54;
  *(void *)(a3 + 40) = v33;
  *(void *)(a3 + 48) = v51;
  *(unsigned char *)(a3 + 56) = v53;
  *(void *)(a3 + 64) = 0x6D72616C41;
  *(void *)(a3 + 72) = 0xE500000000000000;
  *(_OWORD *)(a3 + 80) = xmmword_1D7ED43D0;
  uint64_t v34 = v49;
  *(void *)(a3 + 96) = v62;
  *(void *)(a3 + 104) = v34;
  *(void *)(a3 + 112) = v48;
  *(unsigned char *)(a3 + 120) = v50;
  *(void *)(a3 + 128) = 0x746E6564757453;
  *(void *)(a3 + 136) = 0xE700000000000000;
  *(_OWORD *)(a3 + 144) = xmmword_1D7ED43E0;
  uint64_t v35 = v45;
  *(void *)(a3 + 160) = v60;
  *(void *)(a3 + 168) = v35;
  *(void *)(a3 + 176) = v61;
  *(unsigned char *)(a3 + 184) = v46;
  *(void *)(a3 + 192) = 0x79616C50726941;
  *(void *)(a3 + 200) = 0xE700000000000000;
  *(_OWORD *)(a3 + 208) = xmmword_1D7ED43F0;
  uint64_t v36 = v58;
  *(void *)(a3 + 224) = v47;
  *(void *)(a3 + 232) = v36;
  *(void *)(a3 + 240) = v59;
  *(unsigned char *)(a3 + 248) = v43;
  *(void *)(a3 + 256) = 0x79616C50726143;
  *(void *)(a3 + 264) = 0xE700000000000000;
  *(_OWORD *)(a3 + 272) = xmmword_1D7ED4400;
  *(void *)(a3 + 288) = v44;
  *(void *)(a3 + 296) = v41;
  *(void *)(a3 + 304) = v40;
  *(unsigned char *)(a3 + 312) = v39;
  *(void *)(a3 + 320) = 0xD000000000000010;
  *(void *)(a3 + 328) = 0x80000001D7ED96F0;
  *(_OWORD *)(a3 + 336) = xmmword_1D7ED4410;
  *(void *)(a3 + 352) = v42;
  *(void *)(a3 + 360) = v29;
  *(void *)(a3 + 368) = v30;
  *(unsigned char *)(a3 + 376) = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E7400C()
{
  type metadata accessor for StatusBarOverrideData(0);
  sub_1D7ECA310();
  return v1;
}

uint64_t sub_1D7E74060@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E6FC20(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_1D7E7406C@<X0>(void *a1@<X8>)
{
  type metadata accessor for StatusBarOverrideData(0);
  sub_1D7E79FE4();
  uint64_t result = sub_1D7ECA310();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = 0;
  a1[3] = 0;
  return result;
}

uint64_t sub_1D7E740C8(uint64_t a1)
{
  unint64_t v2 = sub_1D7E75CF8();
  return MEMORY[0x1F40F8C48](a1, v2);
}

uint64_t sub_1D7E74114(uint64_t a1)
{
  unint64_t v2 = sub_1D7E75CF8();
  return MEMORY[0x1F40F8C40](a1, v2);
}

uint64_t sub_1D7E74168()
{
  return sub_1D7ECA570();
}

uint64_t sub_1D7E74194()
{
  return sub_1D7ECA580();
}

uint64_t sub_1D7E741DC()
{
  return sub_1D7ECA580();
}

BOOL sub_1D7E74220(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1D7E74234@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1D7E74244(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1D7E74254(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1D7E74264(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1D7E74274@<X0>(void (*a1)(char *, uint64_t)@<X8>)
{
  return sub_1D7E6FEF4(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_1D7E74284(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v2 + 32);
  if (v3) {
    return v3(a2);
  }
  return result;
}

uint64_t sub_1D7E742B8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D7E74314()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E74330()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E7434C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E74368()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E74384()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E743A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E743BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E743D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1D7E743F4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1D7E74414()
{
  unint64_t result = qword_1EA87BFE8;
  if (!qword_1EA87BFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87BFE8);
  }
  return result;
}

uint64_t sub_1D7E74468()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for StatusBarOverrideToggle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for StatusBarOverrideToggle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for StatusBarOverrideToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarOverrideToggle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarOverrideToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrideToggle(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrideToggle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrideToggle()
{
  return &type metadata for StatusBarOverrideToggle;
}

uint64_t destroy for StatusBarCellularOverrideView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StatusBarCellularOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarCellularOverrideView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarCellularOverrideView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarCellularOverrideView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarCellularOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarCellularOverrideView()
{
  return &type metadata for StatusBarCellularOverrideView;
}

uint64_t destroy for StatusBarWiFiOverrideView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for StatusBarWiFiOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarWiFiOverrideView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarWiFiOverrideView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarWiFiOverrideView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarWiFiOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarWiFiOverrideView()
{
  return &type metadata for StatusBarWiFiOverrideView;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for StatusBarLocationOverrideView()
{
  return &type metadata for StatusBarLocationOverrideView;
}

uint64_t initializeWithCopy for StatusBarBatteryOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarBatteryOverrideView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  return a1;
}

__n128 __swift_memcpy43_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarBatteryOverrideView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarBatteryOverrideView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 43)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarBatteryOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 42) = 0;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 43) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 43) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarBatteryOverrideView()
{
  return &type metadata for StatusBarBatteryOverrideView;
}

uint64_t initializeWithCopy for StatusBarBluetoothOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarBluetoothOverrideView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarBluetoothOverrideView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarBluetoothOverrideView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 58)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarBluetoothOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 58) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 58) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarBluetoothOverrideView()
{
  return &type metadata for StatusBarBluetoothOverrideView;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1D7E751F8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarVoiceControlOverrideView()
{
  return &type metadata for StatusBarVoiceControlOverrideView;
}

uint64_t destroy for StatusBarUserOverrideView()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StatusBarUserOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarUserOverrideView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarUserOverrideView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarUserOverrideView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarUserOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarUserOverrideView()
{
  return &type metadata for StatusBarUserOverrideView;
}

uint64_t destroy for StatusBarDataOverridesView(uint64_t a1)
{
  swift_release();
  uint64_t result = swift_release();
  if (*(void *)(a1 + 16))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for StatusBarDataOverridesView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  return a1;
}

void *assignWithCopy for StatusBarDataOverridesView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (!a1[2])
  {
    if (v4)
    {
      uint64_t v6 = a2[3];
      a1[2] = v4;
      a1[3] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for StatusBarDataOverridesView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarDataOverridesView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarDataOverridesView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarDataOverridesView()
{
  return &type metadata for StatusBarDataOverridesView;
}

ValueMetadata *type metadata accessor for StatusBarDataOverridesView_Previews()
{
  return &type metadata for StatusBarDataOverridesView_Previews;
}

uint64_t sub_1D7E75738()
{
  return sub_1D7E767B4(&qword_1EA87BFF0, &qword_1EA87BFF8);
}

uint64_t sub_1D7E75774()
{
  return sub_1D7E767B4(&qword_1EA87C000, &qword_1EA87C008);
}

uint64_t sub_1D7E757B0()
{
  return sub_1D7E767B4(&qword_1EA87C010, &qword_1EA87C018);
}

uint64_t sub_1D7E757EC()
{
  return sub_1D7E767B4(&qword_1EA87C020, &qword_1EA87C028);
}

uint64_t sub_1D7E75828()
{
  return sub_1D7E767B4(&qword_1EA87C030, &qword_1EA87C038);
}

uint64_t sub_1D7E75864()
{
  return sub_1D7E767B4(&qword_1EA87C040, &qword_1EA87C048);
}

uint64_t sub_1D7E758A0()
{
  return sub_1D7E767B4(&qword_1EA87C050, &qword_1EA87C058);
}

uint64_t sub_1D7E758DC()
{
  return sub_1D7E767B4(&qword_1EA87C060, &qword_1EA87C068);
}

uint64_t sub_1D7E75918()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1D7E759EC()
{
  unint64_t result = qword_1EA87C070;
  if (!qword_1EA87C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C070);
  }
  return result;
}

void type metadata accessor for STStatusBarVoiceControlType(uint64_t a1)
{
}

void type metadata accessor for STStatusBarBluetoothState(uint64_t a1)
{
}

void type metadata accessor for STStatusBarBatteryState(uint64_t a1)
{
}

void type metadata accessor for STStatusBarLocationType(uint64_t a1)
{
}

void type metadata accessor for STStatusBarDataWifiType(uint64_t a1)
{
}

void type metadata accessor for STStatusBarDataCellularType(uint64_t a1)
{
}

void sub_1D7E75AB8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1D7E75B00()
{
  return sub_1D7E75B48(&qword_1EA87C0A8, type metadata accessor for STStatusBarDataCellularType);
}

uint64_t sub_1D7E75B48(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1D7E75B90()
{
  return sub_1D7E75B48(&qword_1EA87C0B0, type metadata accessor for STStatusBarDataWifiType);
}

uint64_t sub_1D7E75BD8()
{
  return sub_1D7E75B48(&qword_1EA87C0B8, type metadata accessor for STStatusBarLocationType);
}

uint64_t sub_1D7E75C20()
{
  return sub_1D7E75B48(&qword_1EA87C0C0, type metadata accessor for STStatusBarBatteryState);
}

uint64_t sub_1D7E75C68()
{
  return sub_1D7E75B48(&qword_1EA87C0C8, type metadata accessor for STStatusBarBluetoothState);
}

uint64_t sub_1D7E75CB0()
{
  return sub_1D7E75B48(&qword_1EA87C0D0, type metadata accessor for STStatusBarVoiceControlType);
}

unint64_t sub_1D7E75CF8()
{
  unint64_t result = qword_1EA87C0D8;
  if (!qword_1EA87C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C0D8);
  }
  return result;
}

double sub_1D7E75D4C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_1D7E712D4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1).n128_u64[0];
  return result;
}

unint64_t sub_1D7E75D70()
{
  unint64_t result = qword_1EA87C130;
  if (!qword_1EA87C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C130);
  }
  return result;
}

double sub_1D7E75DC4@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_1D7E712D4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1).n128_u64[0];
  return result;
}

uint64_t sub_1D7E75DE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E71458(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1D7E75DF0@<X0>(void *a1@<X8>)
{
  return sub_1D7E7184C(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_1D7E75DFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E73448(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1D7E75E20()
{
  unint64_t result = qword_1EA87C158;
  if (!qword_1EA87C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C158);
  }
  return result;
}

double sub_1D7E75E74@<D0>(uint64_t a1@<X8>)
{
  return sub_1D7E73128(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1D7E75E7C()
{
  unint64_t result = qword_1EA87C160;
  if (!qword_1EA87C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C160);
  }
  return result;
}

double sub_1D7E75ED0@<D0>(uint64_t a1@<X8>)
{
  return sub_1D7E732B4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1D7E75ED8()
{
  unint64_t result = qword_1EA87C168;
  if (!qword_1EA87C168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C168);
  }
  return result;
}

uint64_t sub_1D7E75F2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E73448(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1D7E75F50()
{
  unint64_t result = qword_1EA87C170;
  if (!qword_1EA87C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C170);
  }
  return result;
}

uint64_t sub_1D7E75FA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E735B4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1D7E75FAC()
{
  unint64_t result = qword_1EA87C178;
  if (!qword_1EA87C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C178);
  }
  return result;
}

uint64_t sub_1D7E76000@<X0>(uint64_t a1@<X8>)
{
  return sub_1D7E73720(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D7E7605C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  uint64_t v0 = sub_1D7ECA320();
  (*(void (**)(uint64_t))(*(void *)v2 + 152))(v0);
  return swift_release();
}

uint64_t sub_1D7E760D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1D7E76134()
{
  unint64_t result = qword_1EA87C1F8;
  if (!qword_1EA87C1F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C1B8);
    sub_1D7E761A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C1F8);
  }
  return result;
}

unint64_t sub_1D7E761A8()
{
  unint64_t result = qword_1EA87C200;
  if (!qword_1EA87C200)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C1C8);
    sub_1D7E76224();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C200);
  }
  return result;
}

unint64_t sub_1D7E76224()
{
  unint64_t result = qword_1EA87C208;
  if (!qword_1EA87C208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C1C0);
    sub_1D7E767B4(&qword_1EA87C210, &qword_1EA87C218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C208);
  }
  return result;
}

uint64_t sub_1D7E762C0@<X0>(char *a1@<X8>)
{
  return sub_1D7E72798(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t objectdestroy_67Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1D7E76324(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v17 = *(void *)(v1 + 32);
  uint64_t v16 = v17;
  uint64_t v18 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87BFB8);
  sub_1D7ECA320();
  long long v3 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))(*(void *)v19 + 136))(&v17);
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for StatusBarOverrides(0);
  uint64_t v7 = *(int *)(v6 + 36);
  uint64_t v8 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v9 = v5 + v7 + *(int *)(v8 + 20);
  uint64_t v10 = sub_1D7EC9F10();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v9, a1, v10);
  v3(&v17, 0);
  swift_release();
  uint64_t v17 = v16;
  uint64_t v18 = v2;
  sub_1D7ECA320();
  uint64_t v12 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))(*(void *)v19 + 136))(&v17);
  v11(v13 + *(int *)(v6 + 40) + (uint64_t)*(int *)(v8 + 20), a1, v10);
  v12(&v17, 0);
  return swift_release();
}

uint64_t sub_1D7E764DC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1D7E764EC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_1D7E764FC()
{
  unint64_t result = qword_1EA87C2C0;
  if (!qword_1EA87C2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C2C0);
  }
  return result;
}

uint64_t sub_1D7E76550@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D7ECA090();
  *a1 = result;
  return result;
}

uint64_t sub_1D7E7657C()
{
  return sub_1D7ECA0A0();
}

uint64_t sub_1D7E765A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D7ECA0B0();
  *a1 = result;
  return result;
}

uint64_t sub_1D7E765D4()
{
  return sub_1D7ECA0C0();
}

unint64_t sub_1D7E76600()
{
  unint64_t result = qword_1EA87C328;
  if (!qword_1EA87C328)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C320);
    sub_1D7E76674();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C328);
  }
  return result;
}

unint64_t sub_1D7E76674()
{
  unint64_t result = qword_1EA87C330;
  if (!qword_1EA87C330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C338);
    sub_1D7E76714();
    sub_1D7E767B4(&qword_1EA87C360, &qword_1EA87C368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C330);
  }
  return result;
}

unint64_t sub_1D7E76714()
{
  unint64_t result = qword_1EA87C340;
  if (!qword_1EA87C340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C348);
    sub_1D7E767B4(&qword_1EA87C350, &qword_1EA87C358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C340);
  }
  return result;
}

uint64_t sub_1D7E767B4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D7E767F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 136);
  char v7 = *(unsigned char *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 200);
  uint64_t v11 = *(void *)(a1 + 192);
  char v9 = *(unsigned char *)(a1 + 208);
  sub_1D7E764DC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v11, v10, v9);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1D7E768D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 136);
  char v7 = *(unsigned char *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 200);
  uint64_t v11 = *(void *)(a1 + 192);
  char v9 = *(unsigned char *)(a1 + 208);
  uint64_t v13 = *(void *)(a1 + 264);
  uint64_t v14 = *(void *)(a1 + 256);
  char v12 = *(unsigned char *)(a1 + 272);
  sub_1D7E764DC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v11, v10, v9);
  swift_bridgeObjectRetain();
  sub_1D7E764DC(v14, v13, v12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1D7E769EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 136);
  char v7 = *(unsigned char *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 200);
  uint64_t v11 = *(void *)(a1 + 192);
  char v9 = *(unsigned char *)(a1 + 208);
  uint64_t v13 = *(void *)(a1 + 264);
  uint64_t v14 = *(void *)(a1 + 256);
  char v12 = *(unsigned char *)(a1 + 272);
  sub_1D7E764EC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v11, v10, v9);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v14, v13, v12);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1D7E76B00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 136);
  char v7 = *(unsigned char *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 200);
  uint64_t v11 = *(void *)(a1 + 192);
  char v9 = *(unsigned char *)(a1 + 208);
  sub_1D7E764EC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_1D7E764EC(v11, v10, v9);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1D7E76BE0()
{
  unint64_t result = qword_1EA87C3F8;
  if (!qword_1EA87C3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C3F8);
  }
  return result;
}

uint64_t sub_1D7E76C34(uint64_t a1)
{
  return a1;
}

uint64_t sub_1D7E76C60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1D7E76CC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D7E76D20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

BOOL sub_1D7E76DA4(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_1D7E76DB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D7E76DC8()
{
  return sub_1D7ECA580();
}

uint64_t sub_1D7E76E10()
{
  return sub_1D7ECA570();
}

uint64_t sub_1D7E76E3C()
{
  return sub_1D7ECA580();
}

uint64_t sub_1D7E76E80(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_1D7ECA4A0();
  }
  else {
    return 0;
  }
}

uint64_t sub_1D7E76EC8(void *a1, id a2)
{
  a1[1] = objc_msgSend(a2, sel_status);
  a1[2] = objc_msgSend(a2, sel_displayValue);
  a1[3] = objc_msgSend(a2, sel_type);
  id v4 = objc_msgSend(a2, sel_string);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1D7ECA480();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  a1[4] = v6;
  a1[5] = v8;
  id v9 = objc_msgSend(a2, sel_badgeString);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_1D7ECA480();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  uint64_t result = swift_bridgeObjectRelease();
  a1[6] = v11;
  a1[7] = v13;
  return result;
}

uint64_t sub_1D7E76FC8()
{
  return *v0;
}

uint64_t sub_1D7E76FD0(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*sub_1D7E76FD8())()
{
  return nullsub_1;
}

double sub_1D7E76FF8@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_1D7ED5220;
  *(void *)&double result = 10;
  *(_OWORD *)(a1 + 24) = xmmword_1D7ED5230;
  *(void *)(a1 + 40) = 0xE700000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  return result;
}

uint64_t sub_1D7E77028(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  long long v5 = a2[3];
  v8[2] = a2[2];
  v8[3] = v5;
  return sub_1D7E7A038(v7, v8) & 1;
}

double sub_1D7E77074@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)&double result = 5;
  *(_OWORD *)(a1 + 8) = xmmword_1D7ED5240;
  *(void *)(a1 + 24) = 0;
  return result;
}

BOOL sub_1D7E7708C(void *a1, void *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2) {
    return 0;
  }
  return a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t sub_1D7E770C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = sub_1D7EC9F50();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x1F4188790](v2);
  long long v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1D7EC9F80();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C420);
  MEMORY[0x1F4188790](v9 - 8);
  char v31 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_1D7EC9F10();
  uint64_t v11 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v36 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C428);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C430);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1D7EC9EC0();
  uint64_t v19 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v21 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  *a1 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v18, 1, 1, v5);
  uint64_t v22 = sub_1D7EC9F90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 1, 1, v22);
  uint64_t v23 = (uint64_t)v31;
  sub_1D7EC9EB0();
  sub_1D7EC9E90();
  sub_1D7EC9E60();
  sub_1D7EC9E80();
  sub_1D7EC9E70();
  sub_1D7EC9EA0();
  uint64_t v25 = v34;
  uint64_t v24 = v35;
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v4, *MEMORY[0x1E4F27B20], v35);
  sub_1D7EC9F60();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v24);
  sub_1D7EC9F70();
  uint64_t v26 = v33;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v23, 1, v26) == 1)
  {
    uint64_t v27 = v36;
    sub_1D7EC9F00();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v32);
    sub_1D7E7A12C(v23);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v32);
    uint64_t v27 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v36, v23, v26);
  }
  uint64_t v28 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  return (*(uint64_t (**)(unsigned char *, char *, uint64_t))(v11 + 32))(&v37[*(int *)(v28 + 20)], v27, v26);
}

id sub_1D7E77648()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 0);
  id result = objc_msgSend(v0, sel_setTimeStyle_, 1);
  qword_1EA87ED80 = (uint64_t)v0;
  return result;
}

id sub_1D7E776AC()
{
  id result = sub_1D7E776CC();
  qword_1EA87ED88 = (uint64_t)result;
  return result;
}

id sub_1D7E776CC()
{
  uint64_t v0 = sub_1D7EC9E50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1D7EC9F40();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  uint64_t v9 = self;
  uint64_t v10 = (void *)sub_1D7ECA470();
  id v11 = objc_msgSend(self, sel_currentLocale);
  sub_1D7EC9F30();

  uint64_t v12 = (void *)sub_1D7EC9F20();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v13 = objc_msgSend(v9, sel_dateFormatFromTemplate_options_locale_, v10, 0, v12);

  if (v13)
  {
    sub_1D7ECA480();
  }
  id v14 = objc_allocWithZone(NSString);
  uint64_t v15 = (void *)sub_1D7ECA470();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v14, sel_initWithString_, v15);

  id v17 = v16;
  sub_1D7EC9E40();
  uint64_t v18 = (void *)sub_1D7EC9E30();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v1 + 8);
  v19(v3, v0);
  id v20 = objc_msgSend(v17, sel_rangeOfCharacterFromSet_, v18);
  uint64_t v22 = v21;

  uint64_t v23 = sub_1D7EC9E20();
  id v34 = v8;
  if (v20 != (id)v23)
  {
    do
    {
      uint64_t v24 = (void *)sub_1D7ECA470();
      id v25 = objc_msgSend(v17, sel_stringByReplacingCharactersInRange_withString_, v20, v22, v24);

      sub_1D7ECA480();
      id v26 = objc_allocWithZone(NSString);
      uint64_t v27 = (void *)sub_1D7ECA470();
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(v26, sel_initWithString_, v27);

      id v17 = v28;
      sub_1D7EC9E40();
      uint64_t v29 = (void *)sub_1D7EC9E30();
      v19(v3, v0);
      id v20 = objc_msgSend(v17, sel_rangeOfCharacterFromSet_, v29);
      uint64_t v22 = v30;
    }
    while (v20 != (id)sub_1D7EC9E20());
  }
  id v31 = v34;
  objc_msgSend(v34, sel_setDateFormat_, v17);

  return v31;
}

id sub_1D7E77AB8(SEL *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *v3;
  sub_1D7E7A9D0((uint64_t)v3, (uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
  if (v7 == 2)
  {
    sub_1D7E7AAA4((uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
    sub_1D7E7A534(0, &qword_1EA87C438);
    return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (v7)
  {
    uint64_t v9 = (void *)sub_1D7EC9ED0();
    id v8 = objc_msgSend(self, *a1, v9);

    sub_1D7E7AAA4((uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
  }
  else
  {
    sub_1D7E7AAA4((uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
    return 0;
  }
  return v8;
}

uint64_t sub_1D7E77C3C(uint64_t a1, void *a2, void *a3, void **a4, uint64_t a5)
{
  v31[1] = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C420);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1D7EC9F10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  id v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)v31 - v17;
  self;
  uint64_t v19 = swift_dynamicCastObjCClass();
  if (v19)
  {
    id v20 = (void *)v19;
    id v21 = a2;
    id v22 = objc_msgSend(v20, sel_dateValue);
    sub_1D7EC9EF0();

    uint64_t v23 = a1 + *(int *)(type metadata accessor for StatusBarOverrides.TimeAndDate(0) + 20);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(v23, v16, v12);
  }
  if (*a3 != -1) {
    swift_once();
  }
  id v25 = *a4;
  id v26 = objc_msgSend(a2, sel_stringValue);
  uint64_t v27 = v18;
  if (!v26)
  {
    sub_1D7ECA480();
    id v26 = (id)sub_1D7ECA470();
    swift_bridgeObjectRelease();
  }
  id v28 = objc_msgSend(v25, sel_dateFromString_, v26);

  if (v28)
  {
    sub_1D7EC9EF0();

    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v29(v11, v16, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v29(v27, v11, v12);
      uint64_t v30 = a1 + *(int *)(type metadata accessor for StatusBarOverrides.TimeAndDate(0) + 20);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(v30, v27, v12);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  return sub_1D7E7A12C((uint64_t)v11);
}

uint64_t sub_1D7E77F58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2) {
    return sub_1D7EC9EE0();
  }
  else {
    return 0;
  }
}

void sub_1D7E77F80(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 24) = 0;
}

uint64_t sub_1D7E77F94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (*((void *)a1 + 1) != *((void *)a2 + 1) || *((double *)a1 + 2) != *((double *)a2 + 2)) {
    return 0;
  }
  if ((a2[24] ^ a1[24])) {
    return 0;
  }
  return a1[25] ^ a2[25] ^ 1u;
}

id sub_1D7E77FF0()
{
  id v1 = (id)*v0;
  if (v1 == 2)
  {
    sub_1D7E7A534(0, &qword_1EA87C450);
    return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (*v0)
  {
    if (v0[16] == 2)
    {
      sub_1D7E7A534(0, &qword_1EA87C448);
      id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      if (!v0[16])
      {
        uint64_t v2 = 0;
LABEL_10:
        id v1 = objc_msgSend(self, sel_entryWithState_batteryEntry_, *((void *)v0 + 1), v2);

        return v1;
      }
      id v3 = sub_1D7E7A210(*((id *)v0 + 3), v0[40] & 1, v0[41] & 1, *((double *)v0 + 4));
    }
    uint64_t v2 = v3;
    goto LABEL_10;
  }
  return v1;
}

void sub_1D7E78100(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 1;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 40) = 0;
}

BOOL sub_1D7E78120(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 10) = *(long long *)((char *)a1 + 26);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 10) = *(long long *)((char *)a2 + 26);
  return sub_1D7E7A4AC((unsigned __int8 *)&v5, (unsigned __int8 *)&v7);
}

void sub_1D7E7816C(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

BOOL sub_1D7E78178(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
}

void sub_1D7E781A4(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0xE000000000000000;
}

uint64_t sub_1D7E781B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (*((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2)) {
    return 1;
  }
  else {
    return sub_1D7ECA550();
  }
}

id sub_1D7E781FC()
{
  uint64_t v1 = v0;
  long long v2 = &selRef_encodeObject_forKey_;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA9418]), sel_init);
  if (*(unsigned char *)v0 == 2)
  {
    sub_1D7E7A534(0, &qword_1EA87C410);
    id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (*(unsigned char *)v0)
  {
    uint64_t v5 = *(void *)(v0 + 8);
    uint64_t v61 = *(void *)(v0 + 16);
    uint64_t v7 = *(void *)(v0 + 48);
    unint64_t v6 = *(void *)(v0 + 56);
    uint64_t v8 = *(void *)(v0 + 24);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1D7E76E80(v7, v6);
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)sub_1D7ECA470();
    swift_bridgeObjectRelease();
    if (v10)
    {
      uint64_t v12 = (void *)sub_1D7ECA470();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
    }
    long long v2 = &selRef_encodeObject_forKey_;
    LOBYTE(v60) = 0;
    LOBYTE(v59) = 0;
    BYTE2(v58) = 0;
    LOWORD(v58) = 0;
    id v4 = objc_msgSend(self, sel_entryWithType_stringValue_crossfadeStringValue_badgeStringValue_wifiCalling_callForwarding_showsSOSWhenDisabled_sosAvailable_isBootstrapCellular_status_lowDataMode_rawValue_displayValue_displayRawValue_, v8, v11, 0, v12, 0, 0, v58, v5, v59, 0, v61, v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(v3, sel_setCellularEntry_, v4);

  if (*(unsigned char *)(v0 + 64))
  {
    if (*(unsigned char *)(v0 + 64) == 2)
    {
      sub_1D7E7A534(0, &qword_1EA87C410);
      id v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 72);
      uint64_t v62 = *(void *)(v0 + 80);
      uint64_t v16 = *(void *)(v0 + 112);
      unint64_t v15 = *(void *)(v0 + 120);
      uint64_t v17 = *(void *)(v0 + 88);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1D7E76E80(v16, v15);
      uint64_t v19 = v18;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      id v20 = (void *)sub_1D7ECA470();
      swift_bridgeObjectRelease();
      if (v19)
      {
        id v21 = (void *)sub_1D7ECA470();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v21 = 0;
      }
      long long v2 = &selRef_encodeObject_forKey_;
      LOBYTE(v60) = 0;
      LOBYTE(v59) = 0;
      BYTE2(v58) = 0;
      LOWORD(v58) = 0;
      id v13 = objc_msgSend(self, sel_entryWithType_stringValue_crossfadeStringValue_badgeStringValue_wifiCalling_callForwarding_showsSOSWhenDisabled_sosAvailable_isBootstrapCellular_status_lowDataMode_rawValue_displayValue_displayRawValue_, v17, v20, 0, v21, 0, 0, v58, v14, v59, 0, v62, v60);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v13 = 0;
  }
  objc_msgSend(v3, sel_setSecondaryCellularEntry_, v13);

  if (*(unsigned char *)(v0 + 128))
  {
    if (*(unsigned char *)(v0 + 128) == 2) {
      id v22 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v22 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v23 = 0;
  }
  objc_msgSend(v3, sel_setAirplaneModeEntry_, v23);

  if (*(unsigned char *)(v1 + 129))
  {
    if (*(unsigned char *)(v1 + 129) == 2) {
      id v24 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v24 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    id v25 = v24;
  }
  else
  {
    id v25 = 0;
  }
  objc_msgSend(v3, sel_setVpnEntry_, v25);

  if (*(unsigned char *)(v1 + 136))
  {
    if (*(unsigned char *)(v1 + 136) == 2)
    {
      sub_1D7E7A534(0, &qword_1EA87C418);
      id v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      id v26 = objc_msgSend(self, sel_entryWithType_status_lowDataMode_rawValue_displayValue_displayRawValue_, *(void *)(v1 + 160), *(void *)(v1 + 144), 0, 0, *(void *)(v1 + 152), 0);
    }
    id v27 = v26;
  }
  else
  {
    id v27 = 0;
  }
  objc_msgSend(v3, sel_setWifiEntry_, v27);

  id v28 = (int *)type metadata accessor for StatusBarOverrides(0);
  id v29 = sub_1D7E77AB8((SEL *)&selRef_entryForTimeWithDateValue_);
  objc_msgSend(v3, sel_setTimeEntry_, v29);

  id v30 = sub_1D7E77AB8((SEL *)&selRef_entryForShortTimeWithDateValue_);
  objc_msgSend(v3, sel_setShortTimeEntry_, v30);

  id v31 = sub_1D7E77AB8((SEL *)&selRef_entryForDateWithDateValue_);
  objc_msgSend(v3, sel_setDateEntry_, v31);

  uint64_t v32 = v1 + v28[11];
  if (*(unsigned char *)v32)
  {
    if (*(unsigned char *)v32 == 2)
    {
      sub_1D7E7A534(0, &qword_1EA87C440);
      id v33 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      id v33 = objc_msgSend(self, sel_entryWithType_, *(void *)(v32 + 8));
    }
    id v34 = v33;
  }
  else
  {
    id v34 = 0;
  }
  objc_msgSend(v3, sel_setLocationEntry_, v34);

  uint64_t v35 = v1 + v28[12];
  if (*(unsigned char *)v35)
  {
    if (*(unsigned char *)v35 == 2)
    {
      sub_1D7E7A534(0, &qword_1EA87C448);
      id v36 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      id v36 = sub_1D7E7A210(*(id *)(v35 + 8), *(unsigned char *)(v35 + 24), *(unsigned char *)(v35 + 25), *(double *)(v35 + 16));
    }
    uint64_t v37 = v36;
  }
  else
  {
    uint64_t v37 = 0;
  }
  objc_msgSend(v3, sel_setMainBatteryEntry_, v37);

  id v38 = sub_1D7E77FF0();
  objc_msgSend(v3, sel_setBluetoothEntry_, v38);

  uint64_t v39 = v1 + v28[14];
  if (*(unsigned char *)v39)
  {
    if (*(unsigned char *)v39 == 2)
    {
      sub_1D7E7A534(0, &qword_1EA87C458);
      id v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      id v40 = objc_msgSend(self, sel_entryWithType_, *(void *)(v39 + 8));
    }
    id v41 = v40;
  }
  else
  {
    id v41 = 0;
  }
  objc_msgSend(v3, sel_setVoiceControlEntry_, v41);

  if (*(unsigned char *)(v1 + v28[15]) == 2)
  {
    sub_1D7E7A534(0, &qword_1EA87C438);
    id v42 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (*(unsigned char *)(v1 + v28[15]))
  {
    swift_bridgeObjectRetain();
    int v43 = (void *)sub_1D7ECA470();
    id v42 = objc_msgSend(self, sel_entryWithStringValue_, v43);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v42 = 0;
  }
  objc_msgSend(v3, sel_setPersonNameEntry_, v42);

  if (*(unsigned char *)(v1 + v28[16]))
  {
    if (*(unsigned char *)(v1 + v28[16]) == 2) {
      id v44 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v44 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    uint64_t v45 = v44;
  }
  else
  {
    uint64_t v45 = 0;
  }
  objc_msgSend(v3, sel_setRotationLockEntry_, v45);

  if (*(unsigned char *)(v1 + v28[17]))
  {
    if (*(unsigned char *)(v1 + v28[17]) == 2) {
      id v46 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v46 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    uint64_t v47 = v46;
  }
  else
  {
    uint64_t v47 = 0;
  }
  objc_msgSend(v3, sel_setAlarmEntry_, v47);

  if (*(unsigned char *)(v1 + v28[18]))
  {
    if (*(unsigned char *)(v1 + v28[18]) == 2) {
      id v48 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v48 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    uint64_t v49 = v48;
  }
  else
  {
    uint64_t v49 = 0;
  }
  objc_msgSend(v3, sel_setStudentEntry_, v49);

  if (*(unsigned char *)(v1 + v28[19]))
  {
    if (*(unsigned char *)(v1 + v28[19]) == 2) {
      id v50 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v50 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    uint64_t v51 = v50;
  }
  else
  {
    uint64_t v51 = 0;
  }
  objc_msgSend(v3, sel_setAirPlayEntry_, v51);

  if (*(unsigned char *)(v1 + v28[20]))
  {
    if (*(unsigned char *)(v1 + v28[20]) == 2) {
      id v52 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v52 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    int v53 = v52;
  }
  else
  {
    int v53 = 0;
  }
  objc_msgSend(v3, sel_setCarPlayEntry_, v53);

  if (*(unsigned char *)(v1 + v28[21]))
  {
    if (*(unsigned char *)(v1 + v28[21]) == 2) {
      id v54 = objc_msgSend(self, sel_disabledEntry);
    }
    else {
      id v54 = [objc_allocWithZone(MEMORY[0x1E4FA9488]) v2[159]];
    }
    uint64_t v55 = v54;
  }
  else
  {
    uint64_t v55 = 0;
  }
  objc_msgSend(v3, sel_setLiquidDetectionEntry_, v55);

  id v56 = objc_msgSend(v3, sel_immutableCopy);
  return v56;
}

void sub_1D7E78C9C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v123 = (char *)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v124 = (uint64_t)&v117 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v117 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v121 = (uint64_t)&v117 - v12;
  id v13 = (int *)type metadata accessor for StatusBarOverrides(0);
  uint64_t v120 = (unsigned char *)(a2 + v13[9]);
  sub_1D7E770C8(v120);
  long long v122 = (unsigned char *)(a2 + v13[10]);
  sub_1D7E770C8(v122);
  uint64_t v14 = a2 + v13[11];
  *(unsigned char *)uint64_t v14 = 0;
  uint64_t v125 = (char *)v14;
  *(void *)(v14 + 8) = 0;
  uint64_t v15 = a2 + v13[12];
  *(unsigned char *)uint64_t v15 = 0;
  *(void *)(v15 + 8) = 0;
  *(void *)(v15 + 16) = 0x3FF0000000000000;
  *(_WORD *)(v15 + 24) = 0;
  uint64_t v16 = a2 + v13[13];
  *(unsigned char *)uint64_t v16 = 0;
  *(void *)(v16 + 8) = 1;
  *(unsigned char *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  *(void *)(v16 + 32) = 0x3FF0000000000000;
  *(_WORD *)(v16 + 40) = 0;
  uint64_t v17 = a2 + v13[14];
  *(unsigned char *)uint64_t v17 = 0;
  uint64_t v126 = (_OWORD *)v16;
  long long v127 = (char *)v17;
  *(void *)(v17 + 8) = 0;
  uint64_t v18 = a2 + v13[15];
  *(unsigned char *)uint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
  *(void *)(v18 + 8) = 0;
  *(void *)(v18 + 16) = 0xE000000000000000;
  uint64_t v128 = v18;
  uint64_t v129 = v13[16];
  *(unsigned char *)(a2 + v129) = 0;
  uint64_t v130 = v13[17];
  *(unsigned char *)(a2 + v130) = 0;
  uint64_t v131 = v13[18];
  *(unsigned char *)(a2 + v131) = 0;
  uint64_t v132 = v13[19];
  *(unsigned char *)(a2 + v132) = 0;
  uint64_t v133 = v13[20];
  *(unsigned char *)(a2 + v133) = 0;
  uint64_t v134 = v13[21];
  *(unsigned char *)(a2 + v134) = 0;
  id v20 = objc_msgSend(a1, sel_cellularEntry);
  long long v21 = xmmword_1D7ED5220;
  long long v22 = xmmword_1D7ED5230;
  *(_OWORD *)&v135[8] = xmmword_1D7ED5220;
  *(_OWORD *)&v135[24] = xmmword_1D7ED5230;
  unint64_t v23 = 0xE700000000000000;
  *(void *)&v135[40] = 0xE700000000000000;
  uint64_t v136 = 0;
  unint64_t v137 = 0xE000000000000000;
  long long v118 = xmmword_1D7ED5220;
  long long v117 = xmmword_1D7ED5230;
  if (v20)
  {
    id v24 = v20;
    if (objc_msgSend(v20, sel_isEnabled)) {
      char v25 = 1;
    }
    else {
      char v25 = 2;
    }
    v135[0] = v25;
    id v26 = v24;
    sub_1D7E76EC8(v135, v26);

    char v27 = v135[0];
    long long v21 = *(_OWORD *)&v135[8];
    long long v22 = *(_OWORD *)&v135[24];
    unint64_t v29 = *(void *)&v135[40];
    uint64_t v28 = v136;
    unint64_t v30 = v137;
  }
  else
  {
    uint64_t v28 = 0;
    char v27 = 0;
    unint64_t v30 = 0xE000000000000000;
    unint64_t v29 = 0xE700000000000000;
  }
  *(unsigned char *)a2 = v27;
  *(_OWORD *)(a2 + 8) = v21;
  *(_OWORD *)(a2 + 24) = v22;
  *(void *)(a2 + 40) = v29;
  *(void *)(a2 + 48) = v28;
  *(void *)(a2 + 56) = v30;
  id v31 = objc_msgSend(a1, sel_secondaryCellularEntry, (void)v117, *((void *)&v117 + 1), (void)v118, *((void *)&v118 + 1));
  long long v32 = v118;
  long long v33 = v117;
  *(_OWORD *)&v135[8] = v118;
  *(_OWORD *)&v135[24] = v117;
  *(void *)&v135[40] = 0xE700000000000000;
  uint64_t v136 = 0;
  unint64_t v137 = 0xE000000000000000;
  if (v31)
  {
    id v34 = v31;
    if (objc_msgSend(v31, sel_isEnabled)) {
      char v35 = 1;
    }
    else {
      char v35 = 2;
    }
    v135[0] = v35;
    id v36 = v34;
    sub_1D7E76EC8(v135, v36);

    char v37 = v135[0];
    long long v32 = *(_OWORD *)&v135[8];
    long long v33 = *(_OWORD *)&v135[24];
    unint64_t v23 = *(void *)&v135[40];
    uint64_t v38 = v136;
    unint64_t v19 = v137;
  }
  else
  {
    uint64_t v38 = 0;
    char v37 = 0;
  }
  *(unsigned char *)(a2 + 64) = v37;
  *(_OWORD *)(a2 + 72) = v32;
  *(_OWORD *)(a2 + 88) = v33;
  *(void *)(a2 + 104) = v23;
  *(void *)(a2 + 112) = v38;
  *(void *)(a2 + 120) = v19;
  id v39 = objc_msgSend(a1, sel_airplaneModeEntry);
  if (v39)
  {
    id v40 = v39;
    unsigned int v41 = objc_msgSend(v39, sel_isEnabled);

    if (v41) {
      char v42 = 1;
    }
    else {
      char v42 = 2;
    }
  }
  else
  {
    char v42 = 0;
  }
  *(unsigned char *)(a2 + 128) = v42;
  id v43 = objc_msgSend(a1, sel_vpnEntry);
  uint64_t v119 = v11;
  if (v43)
  {
    id v44 = v43;
    unsigned int v45 = objc_msgSend(v43, sel_isEnabled);

    if (v45) {
      char v46 = 1;
    }
    else {
      char v46 = 2;
    }
  }
  else
  {
    char v46 = 0;
  }
  *(unsigned char *)(a2 + 129) = v46;
  id v47 = objc_msgSend(a1, sel_wifiEntry);
  id v48 = v47;
  if (v47)
  {
    if (objc_msgSend(v47, sel_isEnabled)) {
      char v49 = 1;
    }
    else {
      char v49 = 2;
    }
    id v50 = v48;
    uint64_t v51 = (uint64_t)objc_msgSend(v50, sel_status);
    uint64_t v52 = (uint64_t)objc_msgSend(v50, sel_displayValue);
    id v48 = objc_msgSend(v50, sel_type);
  }
  else
  {
    char v49 = 0;
    uint64_t v51 = 5;
    uint64_t v52 = 3;
  }
  *(unsigned char *)(a2 + 136) = v49;
  *(void *)(a2 + 144) = v51;
  *(void *)(a2 + 152) = v52;
  *(void *)(a2 + 160) = v48;
  id v53 = objc_msgSend(a1, sel_timeEntry);
  id v54 = v119;
  sub_1D7E770C8(v119);
  if (v53)
  {
    if (objc_msgSend(v53, (SEL)&selRef_entryForDisplayItemWithIdentifier_)) {
      char v55 = 1;
    }
    else {
      char v55 = 2;
    }
    *id v54 = v55;
    id v56 = v53;
    sub_1D7E77C3C((uint64_t)v54, v56, &qword_1EA87DF20, (void **)&qword_1EA87ED80, (uint64_t)sub_1D7E77648);
  }
  else
  {
    *id v54 = 0;
  }
  uint64_t v57 = (uint64_t)v54;
  uint64_t v58 = v121;
  sub_1D7E7A968(v57, v121, type metadata accessor for StatusBarOverrides.TimeAndDate);

  sub_1D7E7A1AC(v58, (uint64_t)v120);
  id v59 = objc_msgSend(a1, sel_dateEntry);
  uint64_t v60 = v123;
  sub_1D7E770C8(v123);
  if (v59)
  {
    if (objc_msgSend(v59, (SEL)&selRef_entryForDisplayItemWithIdentifier_)) {
      char v61 = 1;
    }
    else {
      char v61 = 2;
    }
    *uint64_t v60 = v61;
    id v62 = v59;
    sub_1D7E77C3C((uint64_t)v60, v62, qword_1EA87DF28, (void **)&qword_1EA87ED88, (uint64_t)sub_1D7E776AC);
  }
  else
  {
    *uint64_t v60 = 0;
  }
  uint64_t v63 = (uint64_t)v60;
  uint64_t v64 = v124;
  sub_1D7E7A968(v63, v124, type metadata accessor for StatusBarOverrides.TimeAndDate);

  sub_1D7E7A1AC(v64, (uint64_t)v122);
  id v65 = objc_msgSend(a1, sel_locationEntry);
  if (v65)
  {
    uint64_t v66 = v65;
    if (objc_msgSend(v65, (SEL)&selRef_entryForDisplayItemWithIdentifier_)) {
      char v67 = 1;
    }
    else {
      char v67 = 2;
    }
    id v68 = objc_msgSend(v66, sel_type);
  }
  else
  {
    id v68 = 0;
    char v67 = 0;
  }
  uint64_t v69 = v125;
  *uint64_t v125 = v67;
  *((void *)v69 + 1) = v68;
  id v70 = objc_msgSend(a1, sel_mainBatteryEntry);
  id v71 = v70;
  if (v70)
  {
    if (objc_msgSend(v70, (SEL)&selRef_entryForDisplayItemWithIdentifier_)) {
      char v72 = 1;
    }
    else {
      char v72 = 2;
    }
    id v73 = v71;
    id v71 = objc_msgSend(v73, sel_state);
    double v74 = (double)(uint64_t)objc_msgSend(v73, sel_capacity) / 100.0;
    unsigned __int8 v75 = objc_msgSend(v73, sel_saverModeActive);
    unsigned __int8 v76 = objc_msgSend(v73, sel_prominentlyShowsDetailString);
  }
  else
  {
    unsigned __int8 v76 = 0;
    unsigned __int8 v75 = 0;
    char v72 = 0;
    double v74 = 1.0;
  }
  *(unsigned char *)uint64_t v15 = v72;
  *(void *)(v15 + 8) = v71;
  *(double *)(v15 + 16) = v74;
  *(unsigned char *)(v15 + 24) = v75;
  *(unsigned char *)(v15 + 25) = v76;
  id v77 = objc_msgSend(a1, sel_bluetoothEntry);
  sub_1D7E7A33C(v77, (uint64_t)v135);

  long long v78 = *(_OWORD *)&v135[16];
  uint64_t v79 = v126;
  *uint64_t v126 = *(_OWORD *)v135;
  v79[1] = v78;
  *(_OWORD *)((char *)v79 + 26) = *(_OWORD *)&v135[26];
  id v80 = objc_msgSend(a1, sel_voiceControlEntry);
  if (v80)
  {
    uint64_t v81 = v80;
    if (objc_msgSend(v80, (SEL)&selRef_entryForDisplayItemWithIdentifier_)) {
      char v82 = 1;
    }
    else {
      char v82 = 2;
    }
    id v83 = objc_msgSend(v81, sel_type);
  }
  else
  {
    id v83 = 0;
    char v82 = 0;
  }
  uint64_t v84 = v127;
  *long long v127 = v82;
  *((void *)v84 + 1) = v83;
  id v85 = objc_msgSend(a1, sel_personNameEntry);
  uint64_t v86 = v85;
  if (v85)
  {
    if (objc_msgSend(v85, (SEL)&selRef_entryForDisplayItemWithIdentifier_)) {
      char v87 = 1;
    }
    else {
      char v87 = 2;
    }
    id v88 = v86;
    id v89 = objc_msgSend(v88, sel_stringValue);
    uint64_t v86 = (void *)sub_1D7ECA480();
    unint64_t v91 = v90;
  }
  else
  {
    char v87 = 0;
    unint64_t v91 = 0xE000000000000000;
  }
  uint64_t v92 = v128;
  swift_bridgeObjectRelease();
  *(unsigned char *)uint64_t v92 = v87;
  *(void *)(v92 + 8) = v86;
  *(void *)(v92 + 16) = v91;
  id v93 = objc_msgSend(a1, sel_rotationLockEntry);
  if (v93)
  {
    uint64_t v94 = v93;
    unsigned int v95 = objc_msgSend(v93, (SEL)&selRef_entryForDisplayItemWithIdentifier_);

    if (v95) {
      char v96 = 1;
    }
    else {
      char v96 = 2;
    }
  }
  else
  {
    char v96 = 0;
  }
  *(unsigned char *)(a2 + v129) = v96;
  id v97 = objc_msgSend(a1, sel_alarmEntry);
  if (v97)
  {
    uint64_t v98 = v97;
    unsigned int v99 = objc_msgSend(v97, (SEL)&selRef_entryForDisplayItemWithIdentifier_);

    if (v99) {
      char v100 = 1;
    }
    else {
      char v100 = 2;
    }
  }
  else
  {
    char v100 = 0;
  }
  *(unsigned char *)(a2 + v130) = v100;
  id v101 = objc_msgSend(a1, sel_studentEntry);
  if (v101)
  {
    int v102 = v101;
    unsigned int v103 = objc_msgSend(v101, (SEL)&selRef_entryForDisplayItemWithIdentifier_);

    if (v103) {
      char v104 = 1;
    }
    else {
      char v104 = 2;
    }
  }
  else
  {
    char v104 = 0;
  }
  *(unsigned char *)(a2 + v131) = v104;
  id v105 = objc_msgSend(a1, sel_airPlayEntry);
  if (v105)
  {
    uint64_t v106 = v105;
    unsigned int v107 = objc_msgSend(v105, (SEL)&selRef_entryForDisplayItemWithIdentifier_);

    if (v107) {
      char v108 = 1;
    }
    else {
      char v108 = 2;
    }
  }
  else
  {
    char v108 = 0;
  }
  *(unsigned char *)(a2 + v132) = v108;
  id v109 = objc_msgSend(a1, sel_carPlayEntry);
  if (v109)
  {
    uint64_t v110 = v109;
    unsigned int v111 = objc_msgSend(v109, (SEL)&selRef_entryForDisplayItemWithIdentifier_);

    if (v111) {
      char v112 = 1;
    }
    else {
      char v112 = 2;
    }
  }
  else
  {
    char v112 = 0;
  }
  *(unsigned char *)(a2 + v133) = v112;
  id v113 = objc_msgSend(a1, sel_liquidDetectionEntry);
  if (v113)
  {
    uint64_t v114 = v113;
    unsigned int v115 = objc_msgSend(v113, (SEL)&selRef_entryForDisplayItemWithIdentifier_);

    if (v115) {
      char v116 = 1;
    }
    else {
      char v116 = 2;
    }
  }
  else
  {
    char v116 = 0;
  }
  *(unsigned char *)(a2 + v134) = v116;
}

uint64_t sub_1D7E796E8@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_1D7ED5220;
  *(_OWORD *)(a1 + 24) = xmmword_1D7ED5230;
  *(void *)(a1 + 40) = 0xE700000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = xmmword_1D7ED5220;
  *(_OWORD *)(a1 + 88) = xmmword_1D7ED5230;
  *(void *)(a1 + 104) = 0xE700000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0xE000000000000000;
  *(_WORD *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 144) = xmmword_1D7ED5240;
  *(void *)(a1 + 160) = 0;
  long long v2 = (int *)type metadata accessor for StatusBarOverrides(0);
  sub_1D7E770C8((unsigned char *)(a1 + v2[9]));
  uint64_t result = sub_1D7E770C8((unsigned char *)(a1 + v2[10]));
  uint64_t v4 = a1 + v2[11];
  *(unsigned char *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  uint64_t v5 = a1 + v2[12];
  *(unsigned char *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0;
  *(void *)(v5 + 16) = 0x3FF0000000000000;
  *(_WORD *)(v5 + 24) = 0;
  uint64_t v6 = a1 + v2[13];
  *(unsigned char *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 1;
  *(unsigned char *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = 0x3FF0000000000000;
  *(_WORD *)(v6 + 40) = 0;
  uint64_t v7 = a1 + v2[14];
  *(unsigned char *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  uint64_t v8 = a1 + v2[15];
  *(unsigned char *)uint64_t v8 = 0;
  *(void *)(v8 + 8) = 0;
  *(void *)(v8 + 16) = 0xE000000000000000;
  *(unsigned char *)(a1 + v2[16]) = 0;
  *(unsigned char *)(a1 + v2[17]) = 0;
  *(unsigned char *)(a1 + v2[18]) = 0;
  *(unsigned char *)(a1 + v2[19]) = 0;
  *(unsigned char *)(a1 + v2[20]) = 0;
  *(unsigned char *)(a1 + v2[21]) = 0;
  return result;
}

uint64_t (*sub_1D7E79828())()
{
  return j__swift_endAccess;
}

uint64_t sub_1D7E79888@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 160))();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides;
  swift_beginAccess();
  return sub_1D7E7A9D0(v3, a1, type metadata accessor for StatusBarOverrides);
}

uint64_t sub_1D7E79934(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v4 = v1;
  uint64_t v5 = a1;
  (*(void (**)(void))(*(void *)v1 + 168))();
  swift_release();
  return sub_1D7E7AAA4(a1, type metadata accessor for StatusBarOverrides);
}

void (*sub_1D7E799E8(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 160))();
  swift_release();
  v3[5] = OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_1D7E7AD04(&qword_1EA87C460, (void (*)(uint64_t))type metadata accessor for StatusBarOverrideData);
  sub_1D7EC9FD0();
  swift_release();
  v3[7] = sub_1D7E79828();
  return sub_1D7E79B08;
}

void sub_1D7E79B08(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  void *v1 = v1[4];
  swift_getKeyPath();
  sub_1D7EC9FC0();
  swift_release();
  free(v1);
}

uint64_t sub_1D7E79B94(void *a1)
{
  uint64_t v3 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7E78C9C(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))(*(void *)v1 + 128))(v5);
}

uint64_t sub_1D7E79C38()
{
  uint64_t v1 = type metadata accessor for StatusBarOverrides(0);
  long long v2 = (int *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v4 = 0;
  *(_OWORD *)(v4 + 8) = xmmword_1D7ED5220;
  *(_OWORD *)(v4 + 24) = xmmword_1D7ED5230;
  *((void *)v4 + 5) = 0xE700000000000000;
  *((void *)v4 + 6) = 0;
  *((void *)v4 + 7) = 0xE000000000000000;
  v4[64] = 0;
  *(_OWORD *)(v4 + 72) = xmmword_1D7ED5220;
  *(_OWORD *)(v4 + 88) = xmmword_1D7ED5230;
  *((void *)v4 + 13) = 0xE700000000000000;
  *((void *)v4 + 14) = 0;
  *((void *)v4 + 15) = 0xE000000000000000;
  *((_WORD *)v4 + 64) = 0;
  v4[136] = 0;
  *((_OWORD *)v4 + 9) = xmmword_1D7ED5240;
  *((void *)v4 + 20) = 0;
  sub_1D7E770C8(&v4[v2[11]]);
  sub_1D7E770C8(&v4[v2[12]]);
  uint64_t v5 = &v4[v2[13]];
  *uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v4[v2[14]];
  *uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0x3FF0000000000000;
  *((_WORD *)v6 + 12) = 0;
  uint64_t v7 = &v4[v2[15]];
  *uint64_t v7 = 0;
  *((void *)v7 + 1) = 1;
  v7[16] = 0;
  *((void *)v7 + 3) = 0;
  *((void *)v7 + 4) = 0x3FF0000000000000;
  *((_WORD *)v7 + 20) = 0;
  uint64_t v8 = &v4[v2[16]];
  char *v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v4[v2[17]];
  char *v9 = 0;
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0xE000000000000000;
  v4[v2[18]] = 0;
  v4[v2[19]] = 0;
  v4[v2[20]] = 0;
  v4[v2[21]] = 0;
  v4[v2[22]] = 0;
  v4[v2[23]] = 0;
  return (*(uint64_t (**)(char *))(*(void *)v0 + 128))(v4);
}

uint64_t sub_1D7E79DD8()
{
  return sub_1D7EC9FB0();
}

uint64_t sub_1D7E79E60()
{
  return sub_1D7EC9FA0();
}

uint64_t sub_1D7E79F20()
{
  sub_1D7E7AAA4(v0 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides, type metadata accessor for StatusBarOverrides);
  uint64_t v1 = v0 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData___observationRegistrar;
  uint64_t v2 = sub_1D7EC9FF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1D7E79FE4()
{
  uint64_t v0 = swift_allocObject();
  sub_1D7E796E8(v0 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides);
  sub_1D7EC9FE0();
  return v0;
}

uint64_t sub_1D7E7A038(void *a1, void *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1] || a1[2] != a2[2] || a1[3] != a2[3]) {
    return 0;
  }
  if (a1[4] == a2[4] && a1[5] == a2[5] || (char v4 = sub_1D7ECA550(), result = 0, (v4 & 1) != 0))
  {
    if (a1[6] == a2[6] && a1[7] == a2[7])
    {
      return 1;
    }
    else
    {
      return sub_1D7ECA550();
    }
  }
  return result;
}

uint64_t type metadata accessor for StatusBarOverrides.TimeAndDate(uint64_t a1)
{
  return sub_1D7E7AB24(a1, (uint64_t *)&unk_1EA87E960);
}

uint64_t sub_1D7E7A12C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StatusBarOverrides(uint64_t a1)
{
  return sub_1D7E7AB24(a1, (uint64_t *)&unk_1EA87E950);
}

uint64_t sub_1D7E7A1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_1D7E7A210(id result, char a2, char a3, double a4)
{
  double v4 = a4 * 100.0;
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v4 < 9.22337204e18)
  {
    id v7 = result;
    uint64_t v8 = (uint64_t)v4;
    uint64_t v12 = sub_1D7ECA530();
    uint64_t v13 = v9;
    swift_bridgeObjectRetain();
    sub_1D7ECA490();
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)sub_1D7ECA470();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(self, sel_entryWithCapacity_state_saverMode_prominentlyShowsDetailString_detailString_, v8, v7, a2 & 1, a3 & 1, v10, v12, v13);

    return v11;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_1D7E7A33C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = 1;
  if (a1)
  {
    if (objc_msgSend(a1, sel_isEnabled)) {
      char v5 = 1;
    }
    else {
      char v5 = 2;
    }
    id v6 = a1;
    uint64_t v3 = (uint64_t)objc_msgSend(v6, sel_state);
    id v7 = objc_msgSend(v6, sel_batteryEntry);
    id v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, sel_isEnabled)) {
        char v9 = 1;
      }
      else {
        char v9 = 2;
      }
      id v10 = v8;
      id v8 = objc_msgSend(v10, sel_state);
      double v11 = (double)(uint64_t)objc_msgSend(v10, sel_capacity) / 100.0;
      unsigned __int8 v12 = objc_msgSend(v10, sel_saverModeActive);
      unsigned __int8 v13 = objc_msgSend(v10, sel_prominentlyShowsDetailString);

      id v6 = v10;
    }
    else
    {
      unsigned __int8 v13 = 0;
      unsigned __int8 v12 = 0;
      char v9 = 0;
      double v11 = 1.0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
    unsigned __int8 v12 = 0;
    id v8 = 0;
    char v9 = 0;
    char v5 = 0;
    double v11 = 1.0;
  }
  *(unsigned char *)a2 = v5;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v8;
  *(double *)(a2 + 32) = v11;
  *(unsigned char *)(a2 + 40) = v12;
  *(unsigned char *)(a2 + 41) = v13;
}

BOOL sub_1D7E7A4AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && *((void *)a1 + 1) == *((void *)a2 + 1)
      && a1[16] == a2[16]
      && *((void *)a1 + 3) == *((void *)a2 + 3)
      && *((double *)a1 + 4) == *((double *)a2 + 4)
      && ((a1[40] ^ a2[40]) & 1) == 0
      && (a1[41] & 1) == (a2[41] & 1);
}

uint64_t sub_1D7E7A534(uint64_t a1, unint64_t *a2)
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

BOOL sub_1D7E7A570(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  BOOL result = 0;
  if (*((void *)a1 + 1) != *((void *)a2 + 1)
    || *((void *)a1 + 2) != *((void *)a2 + 2)
    || *((void *)a1 + 3) != *((void *)a2 + 3))
  {
    return result;
  }
  uint64_t v5 = *((void *)a1 + 6);
  uint64_t v6 = *((void *)a1 + 7);
  uint64_t v7 = *((void *)a2 + 6);
  uint64_t v8 = *((void *)a2 + 7);
  if (*((void *)a1 + 4) != *((void *)a2 + 4) || *((void *)a1 + 5) != *((void *)a2 + 5))
  {
    char v9 = sub_1D7ECA550();
    BOOL result = 0;
    if ((v9 & 1) == 0) {
      return result;
    }
  }
  if (v5 != v7 || v6 != v8)
  {
    char v10 = sub_1D7ECA550();
    BOOL result = 0;
    if ((v10 & 1) == 0) {
      return result;
    }
  }
  long long v11 = *((_OWORD *)a1 + 5);
  v38[0] = *((_OWORD *)a1 + 4);
  v38[1] = v11;
  long long v12 = *((_OWORD *)a1 + 7);
  void v38[2] = *((_OWORD *)a1 + 6);
  v38[3] = v12;
  long long v13 = *((_OWORD *)a2 + 5);
  v39[0] = *((_OWORD *)a2 + 4);
  v39[1] = v13;
  long long v14 = *((_OWORD *)a2 + 7);
  v39[2] = *((_OWORD *)a2 + 6);
  v39[3] = v14;
  if ((sub_1D7E7A038(v38, v39) & 1) == 0 || a1[128] != a2[128] || a1[129] != a2[129] || a1[136] != a2[136]) {
    return 0;
  }
  BOOL result = 0;
  if (*((void *)a1 + 18) != *((void *)a2 + 18)
    || *((void *)a1 + 19) != *((void *)a2 + 19)
    || *((void *)a1 + 20) != *((void *)a2 + 20))
  {
    return result;
  }
  uint64_t v15 = type metadata accessor for StatusBarOverrides(0);
  if (a1[*(int *)(v15 + 36)] != a2[*(int *)(v15 + 36)]) {
    return 0;
  }
  uint64_t v16 = (int *)v15;
  type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  if ((sub_1D7EC9EE0() & 1) == 0) {
    return 0;
  }
  if (a1[v16[10]] != a2[v16[10]]) {
    return 0;
  }
  if ((sub_1D7EC9EE0() & 1) == 0) {
    return 0;
  }
  uint64_t v17 = v16[11];
  uint64_t v18 = &a1[v17];
  int v19 = a1[v17];
  id v20 = &a2[v17];
  if (v19 != *v20) {
    return 0;
  }
  if (*((void *)v18 + 1) != *((void *)v20 + 1)) {
    return 0;
  }
  uint64_t v21 = v16[12];
  long long v22 = &a1[v21];
  int v23 = a1[v21];
  id v24 = &a2[v21];
  if (v23 != *v24) {
    return 0;
  }
  BOOL result = 0;
  if (*((void *)v22 + 1) != *((void *)v24 + 1)
    || *((double *)v22 + 2) != *((double *)v24 + 2)
    || ((v24[24] ^ v22[24]) & 1) != 0
    || ((v24[25] ^ v22[25]) & 1) != 0)
  {
    return result;
  }
  uint64_t v25 = v16[13];
  id v26 = &a1[v25];
  int v27 = a1[v25];
  uint64_t v28 = &a2[v25];
  if (v27 != *v28) {
    return 0;
  }
  BOOL result = 0;
  if (*((void *)v26 + 1) != *((void *)v28 + 1)) {
    return result;
  }
  if (v26[16] != v28[16]) {
    return result;
  }
  BOOL result = 0;
  if (*((void *)v26 + 3) != *((void *)v28 + 3)
    || *((double *)v26 + 4) != *((double *)v28 + 4)
    || ((v26[40] ^ v28[40]) & 1) != 0
    || ((v26[41] ^ v28[41]) & 1) != 0)
  {
    return result;
  }
  uint64_t v29 = v16[14];
  unint64_t v30 = &a1[v29];
  int v31 = a1[v29];
  long long v32 = &a2[v29];
  if (v31 != *v32) {
    return 0;
  }
  if (*((void *)v30 + 1) != *((void *)v32 + 1)) {
    return 0;
  }
  uint64_t v33 = v16[15];
  id v34 = &a1[v33];
  int v35 = a1[v33];
  id v36 = &a2[v33];
  if (v35 != *v36) {
    return 0;
  }
  if (*((void *)v34 + 1) == *((void *)v36 + 1) && *((void *)v34 + 2) == *((void *)v36 + 2)
    || (char v37 = sub_1D7ECA550(), result = 0, (v37 & 1) != 0))
  {
    if (a1[v16[16]] == a2[v16[16]]
      && a1[v16[17]] == a2[v16[17]]
      && a1[v16[18]] == a2[v16[18]]
      && a1[v16[19]] == a2[v16[19]]
      && a1[v16[20]] == a2[v16[20]])
    {
      return a1[v16[21]] == a2[v16[21]];
    }
    return 0;
  }
  return result;
}

uint64_t sub_1D7E7A968(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1D7E7A9D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1D7E7AA38()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = v1 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides;
  swift_beginAccess();
  sub_1D7E7CD48(v2, v3);
  return swift_endAccess();
}

uint64_t sub_1D7E7AAA4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for StatusBarOverrideData(uint64_t a1)
{
  return sub_1D7E7AB24(a1, qword_1EA87E970);
}

uint64_t sub_1D7E7AB24(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1D7E7AB60()
{
  unint64_t result = qword_1EA87C468;
  if (!qword_1EA87C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C468);
  }
  return result;
}

unint64_t sub_1D7E7ABB4(uint64_t a1)
{
  unint64_t result = sub_1D7E7ABDC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7ABDC()
{
  unint64_t result = qword_1EA87C470;
  if (!qword_1EA87C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C470);
  }
  return result;
}

unint64_t sub_1D7E7AC30(uint64_t a1)
{
  unint64_t result = sub_1D7E7AC58();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7AC58()
{
  unint64_t result = qword_1EA87C478;
  if (!qword_1EA87C478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C478);
  }
  return result;
}

uint64_t sub_1D7E7ACAC(uint64_t a1)
{
  uint64_t result = sub_1D7E7AD04(&qword_1EA87C480, (void (*)(uint64_t))type metadata accessor for StatusBarOverrides.TimeAndDate);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1D7E7AD04(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1D7E7AD4C(uint64_t a1)
{
  unint64_t result = sub_1D7E7AD74();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7AD74()
{
  unint64_t result = qword_1EA87C488;
  if (!qword_1EA87C488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C488);
  }
  return result;
}

unint64_t sub_1D7E7ADC8(uint64_t a1)
{
  unint64_t result = sub_1D7E7ADF0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7ADF0()
{
  unint64_t result = qword_1EA87C490;
  if (!qword_1EA87C490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C490);
  }
  return result;
}

unint64_t sub_1D7E7AE44(uint64_t a1)
{
  unint64_t result = sub_1D7E7AE6C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7AE6C()
{
  unint64_t result = qword_1EA87C498;
  if (!qword_1EA87C498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C498);
  }
  return result;
}

unint64_t sub_1D7E7AEC0(uint64_t a1)
{
  unint64_t result = sub_1D7E7AEE8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7AEE8()
{
  unint64_t result = qword_1EA87C4A0;
  if (!qword_1EA87C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C4A0);
  }
  return result;
}

unint64_t sub_1D7E7AF3C(uint64_t a1)
{
  unint64_t result = sub_1D7E7AF64();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1D7E7AF64()
{
  unint64_t result = qword_1EA87C4A8;
  if (!qword_1EA87C4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C4A8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StatusBarOverride(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StatusBarOverride(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D7E7B124);
      case 4:
        *(_DWORD *)(result + 1) = v6;
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
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1D7E7B14C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1D7E7B154(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverride()
{
  return &type metadata for StatusBarOverride;
}

void *sub_1D7E7B16C(uint64_t a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    *(void *)(a1 + 56) = a2[7];
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    uint64_t v8 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    *(void *)(a1 + 112) = v8;
    *(void *)(a1 + 120) = a2[15];
    *(_WORD *)(a1 + 128) = *((_WORD *)a2 + 64);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
    uint64_t v9 = a3[9];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    *(unsigned char *)(a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v12 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    uint64_t v13 = *(int *)(v12 + 20);
    uint64_t v36 = v11 + v13;
    uint64_t v37 = v10 + v13;
    uint64_t v14 = sub_1D7EC9F10();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v37, v36, v14);
    uint64_t v16 = a3[10];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    *uint64_t v17 = *v18;
    v15((uint64_t)&v17[*(int *)(v12 + 20)], (uint64_t)&v18[*(int *)(v12 + 20)], v14);
    uint64_t v19 = a3[12];
    *(_OWORD *)((char *)v4 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
    id v20 = (_OWORD *)((char *)v4 + v19);
    uint64_t v21 = (_OWORD *)((char *)a2 + v19);
    *id v20 = *v21;
    *(_OWORD *)((char *)v20 + 10) = *(_OWORD *)((char *)v21 + 10);
    uint64_t v22 = a3[13];
    uint64_t v23 = a3[14];
    id v24 = (_OWORD *)((char *)v4 + v22);
    uint64_t v25 = (_OWORD *)((char *)a2 + v22);
    long long v26 = v25[1];
    *id v24 = *v25;
    v24[1] = v26;
    *(_OWORD *)((char *)v24 + 26) = *(_OWORD *)((char *)v25 + 26);
    *(_OWORD *)((char *)v4 + v23) = *(_OWORD *)((char *)a2 + v23);
    uint64_t v27 = a3[15];
    uint64_t v28 = a3[16];
    uint64_t v29 = (char *)v4 + v27;
    unint64_t v30 = (char *)a2 + v27;
    *uint64_t v29 = *v30;
    uint64_t v31 = *((void *)v30 + 2);
    *((void *)v29 + 1) = *((void *)v30 + 1);
    *((void *)v29 + 2) = v31;
    *((unsigned char *)v4 + v28) = *((unsigned char *)a2 + v28);
    uint64_t v32 = a3[18];
    *((unsigned char *)v4 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *((unsigned char *)v4 + v32) = *((unsigned char *)a2 + v32);
    uint64_t v33 = a3[20];
    *((unsigned char *)v4 + a3[19]) = *((unsigned char *)a2 + a3[19]);
    *((unsigned char *)v4 + v33) = *((unsigned char *)a2 + v33);
    *((unsigned char *)v4 + a3[21]) = *((unsigned char *)a2 + a3[21]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1D7E7B3DC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v6 = v4 + *(int *)(v5 + 20);
  uint64_t v7 = sub_1D7EC9F10();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + *(int *)(a2 + 40) + *(int *)(v5 + 20), v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7E7B4CC(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v34 = (unsigned char *)(v10 + v12);
  int v35 = (unsigned char *)(v9 + v12);
  uint64_t v13 = sub_1D7EC9F10();
  uint64_t v14 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v35, v34, v13);
  uint64_t v15 = a3[10];
  uint64_t v16 = (unsigned char *)(a1 + v15);
  uint64_t v17 = (unsigned char *)(a2 + v15);
  unsigned char *v16 = *v17;
  v14(&v16[*(int *)(v11 + 20)], &v17[*(int *)(v11 + 20)], v13);
  uint64_t v18 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  uint64_t v19 = (_OWORD *)(a1 + v18);
  id v20 = (_OWORD *)(a2 + v18);
  _OWORD *v19 = *v20;
  *(_OWORD *)((char *)v19 + 10) = *(_OWORD *)((char *)v20 + 10);
  uint64_t v21 = a3[13];
  uint64_t v22 = a3[14];
  uint64_t v23 = (_OWORD *)(a1 + v21);
  id v24 = (_OWORD *)(a2 + v21);
  long long v25 = v24[1];
  _OWORD *v23 = *v24;
  v23[1] = v25;
  *(_OWORD *)((char *)v23 + 26) = *(_OWORD *)((char *)v24 + 26);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  uint64_t v26 = a3[15];
  uint64_t v27 = a3[16];
  uint64_t v28 = a1 + v26;
  uint64_t v29 = a2 + v26;
  *(unsigned char *)uint64_t v28 = *(unsigned char *)v29;
  uint64_t v30 = *(void *)(v29 + 16);
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  *(void *)(v28 + 16) = v30;
  *(unsigned char *)(a1 + v27) = *(unsigned char *)(a2 + v27);
  uint64_t v31 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v31) = *(unsigned char *)(a2 + v31);
  uint64_t v32 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v32) = *(unsigned char *)(a2 + v32);
  *(unsigned char *)(a1 + a3[21]) = *(unsigned char *)(a2 + a3[21]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1D7E7B6EC(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  uint64_t v6 = a3[9];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  uint64_t v9 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v10 = *(int *)(v9 + 20);
  uint64_t v11 = (unsigned char *)(v7 + v10);
  uint64_t v12 = (unsigned char *)(v8 + v10);
  uint64_t v13 = sub_1D7EC9F10();
  uint64_t v14 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  uint64_t v15 = a3[10];
  uint64_t v16 = (unsigned char *)(a1 + v15);
  uint64_t v17 = (unsigned char *)(a2 + v15);
  unsigned char *v16 = *v17;
  v14(&v16[*(int *)(v9 + 20)], &v17[*(int *)(v9 + 20)], v13);
  uint64_t v18 = a3[11];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(unsigned char *)uint64_t v19 = *(unsigned char *)v20;
  *(void *)(v19 + 8) = *(void *)(v20 + 8);
  uint64_t v21 = a3[12];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  *(unsigned char *)(v22 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v22 + 25) = *(unsigned char *)(v23 + 25);
  uint64_t v24 = a3[13];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  *(unsigned char *)(v25 + 16) = *(unsigned char *)(v26 + 16);
  *(void *)(v25 + 24) = *(void *)(v26 + 24);
  *(void *)(v25 + 32) = *(void *)(v26 + 32);
  *(unsigned char *)(v25 + 40) = *(unsigned char *)(v26 + 40);
  *(unsigned char *)(v25 + 41) = *(unsigned char *)(v26 + 41);
  uint64_t v27 = a3[14];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(unsigned char *)uint64_t v28 = *(unsigned char *)v29;
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  uint64_t v30 = a3[15];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  *(unsigned char *)uint64_t v31 = *(unsigned char *)v32;
  *(void *)(v31 + 8) = *(void *)(v32 + 8);
  *(void *)(v31 + 16) = *(void *)(v32 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + a3[20]) = *(unsigned char *)(a2 + a3[20]);
  *(unsigned char *)(a1 + a3[21]) = *(unsigned char *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_1D7E7B9F0(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  uint64_t v10 = a3[9];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v13 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v14 = *(int *)(v13 + 20);
  uint64_t v15 = (unsigned char *)(v11 + v14);
  uint64_t v16 = (unsigned char *)(v12 + v14);
  uint64_t v17 = sub_1D7EC9F10();
  uint64_t v18 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32);
  v18(v15, v16, v17);
  uint64_t v19 = a3[10];
  uint64_t v20 = (unsigned char *)(a1 + v19);
  uint64_t v21 = (unsigned char *)(a2 + v19);
  *uint64_t v20 = *v21;
  v18(&v20[*(int *)(v13 + 20)], &v21[*(int *)(v13 + 20)], v17);
  uint64_t v22 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  uint64_t v23 = (_OWORD *)(a1 + v22);
  uint64_t v24 = (_OWORD *)(a2 + v22);
  _OWORD *v23 = *v24;
  *(_OWORD *)((char *)v23 + 10) = *(_OWORD *)((char *)v24 + 10);
  uint64_t v25 = a3[13];
  uint64_t v26 = a3[14];
  uint64_t v27 = (_OWORD *)(a1 + v25);
  uint64_t v28 = (_OWORD *)(a2 + v25);
  long long v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  *(_OWORD *)((char *)v27 + 26) = *(_OWORD *)((char *)v28 + 26);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  uint64_t v30 = a3[15];
  uint64_t v31 = a3[16];
  uint64_t v32 = a1 + v30;
  uint64_t v33 = a2 + v30;
  *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  *(void *)(v32 + 16) = *(void *)(v33 + 16);
  *(unsigned char *)(a1 + v31) = *(unsigned char *)(a2 + v31);
  uint64_t v34 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v34) = *(unsigned char *)(a2 + v34);
  uint64_t v35 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  *(unsigned char *)(a1 + a3[21]) = *(unsigned char *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_1D7E7BBB8(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = (unsigned char *)(v9 + v12);
  uint64_t v14 = (unsigned char *)(v10 + v12);
  uint64_t v15 = sub_1D7EC9F10();
  uint64_t v16 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  uint64_t v17 = a3[10];
  uint64_t v18 = (unsigned char *)(a1 + v17);
  uint64_t v19 = (unsigned char *)(a2 + v17);
  *uint64_t v18 = *v19;
  v16(&v18[*(int *)(v11 + 20)], &v19[*(int *)(v11 + 20)], v15);
  uint64_t v20 = a3[11];
  uint64_t v21 = a3[12];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  uint64_t v24 = a1 + v21;
  uint64_t v25 = a2 + v21;
  *(unsigned char *)uint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  *(unsigned char *)(v24 + 24) = *(unsigned char *)(v25 + 24);
  *(unsigned char *)(v24 + 25) = *(unsigned char *)(v25 + 25);
  uint64_t v26 = a3[13];
  uint64_t v27 = a3[14];
  uint64_t v28 = a1 + v26;
  uint64_t v29 = a2 + v26;
  *(unsigned char *)uint64_t v28 = *(unsigned char *)v29;
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  *(unsigned char *)(v28 + 16) = *(unsigned char *)(v29 + 16);
  *(void *)(v28 + 24) = *(void *)(v29 + 24);
  *(void *)(v28 + 32) = *(void *)(v29 + 32);
  *(unsigned char *)(v28 + 40) = *(unsigned char *)(v29 + 40);
  *(unsigned char *)(v28 + 41) = *(unsigned char *)(v29 + 41);
  uint64_t v30 = a1 + v27;
  uint64_t v31 = a2 + v27;
  *(unsigned char *)uint64_t v30 = *(unsigned char *)v31;
  *(void *)(v30 + 8) = *(void *)(v31 + 8);
  uint64_t v32 = a3[15];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  *(unsigned char *)uint64_t v33 = *(unsigned char *)v34;
  uint64_t v36 = *(void *)(v34 + 8);
  uint64_t v35 = *(void *)(v34 + 16);
  *(void *)(v33 + 8) = v36;
  *(void *)(v33 + 16) = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(unsigned char *)(a1 + v37) = *(unsigned char *)(a2 + v37);
  uint64_t v38 = a3[19];
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  *(unsigned char *)(a1 + v38) = *(unsigned char *)(a2 + v38);
  uint64_t v39 = a3[21];
  *(unsigned char *)(a1 + a3[20]) = *(unsigned char *)(a2 + a3[20]);
  *(unsigned char *)(a1 + v39) = *(unsigned char *)(a2 + v39);
  return a1;
}

uint64_t sub_1D7E7BE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D7E7BE4C);
}

uint64_t sub_1D7E7BE4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1D7E7BEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D7E7BF10);
}

uint64_t sub_1D7E7BF10(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1D7E7BFB8()
{
  uint64_t result = type metadata accessor for StatusBarOverrides.TimeAndDate(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for StatusBarOverrides.Cellular()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StatusBarOverrides.Cellular(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v3;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarOverrides.Cellular(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarOverrides.Cellular(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.Cellular(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.Cellular(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Cellular()
{
  return &type metadata for StatusBarOverrides.Cellular;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.WiFi(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[32]) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.WiFi(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.WiFi()
{
  return &type metadata for StatusBarOverrides.WiFi;
}

uint64_t *sub_1D7E7C378(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_1D7EC9F10();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1D7E7C444(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1D7EC9F10();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

unsigned char *sub_1D7E7C4AC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1D7EC9F10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1D7E7C528(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1D7EC9F10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1D7E7C5A4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1D7EC9F10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_1D7E7C620(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1D7EC9F10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_1D7E7C69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D7E7C6B0);
}

uint64_t sub_1D7E7C6B0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *a1;
    if (v4 >= 3) {
      return v4 - 2;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_1D7EC9F10();
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1D7E7C758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D7E7C76C);
}

unsigned char *sub_1D7E7C76C(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 253)
  {
    *__n128 result = a2 + 2;
  }
  else
  {
    uint64_t v7 = sub_1D7EC9F10();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1D7E7C810()
{
  uint64_t result = sub_1D7EC9F10();
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

ValueMetadata *type metadata accessor for StatusBarOverrides.Location()
{
  return &type metadata for StatusBarOverrides.Location;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.Battery(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 26)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.Battery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 26) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 26) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Battery()
{
  return &type metadata for StatusBarOverrides.Battery;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.Bluetooth(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 42)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.Bluetooth(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 42) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 42) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Bluetooth()
{
  return &type metadata for StatusBarOverrides.Bluetooth;
}

uint64_t _s14SystemStatusUI18StatusBarOverridesV8LocationVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[16]) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s14SystemStatusUI18StatusBarOverridesV8LocationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.VoiceControl()
{
  return &type metadata for StatusBarOverrides.VoiceControl;
}

uint64_t destroy for StatusBarOverrides.User()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14SystemStatusUI18StatusBarOverridesV4UserVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarOverrides.User(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarOverrides.User(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.User(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.User(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.User()
{
  return &type metadata for StatusBarOverrides.User;
}

uint64_t sub_1D7E7CC60()
{
  return type metadata accessor for StatusBarOverrideData(0);
}

uint64_t sub_1D7E7CC68()
{
  uint64_t result = type metadata accessor for StatusBarOverrides(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1D7EC9FF0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

void type metadata accessor for STStatusBarDataNetworkStatus(uint64_t a1)
{
}

uint64_t sub_1D7E7CD48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t variable initialization expression of STUIStatusBarDataOverridesViewController.overridesController()
{
  return 0;
}

id variable initialization expression of STUIStatusBarDataOverridesViewController.statusBarOverridesStatusDomain()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4FA94F0]);
  return objc_msgSend(v0, sel_init);
}

id variable initialization expression of STUIStatusBarDataOverridesViewController.statusBarOverridesStatusDomainPublisher()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4FA94F8]);
  return objc_msgSend(v0, sel_init);
}

Swift::Void __swiftcall STUIStatusBarDataOverridesViewController.viewDidLoad()()
{
  unint64_t v1 = v0;
  v48.receiver = v0;
  v48.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  objc_msgSendSuper2(&v48, sel_viewDidLoad);
  type metadata accessor for StatusBarOverrideData(0);
  uint64_t v2 = sub_1D7E79FE4();
  uint64_t v3 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain;
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v46 = sub_1D7E7D700;
  uint64_t v47 = v5;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v43 = 1107296256;
  id v44 = sub_1D7E7D74C;
  unsigned int v45 = &block_descriptor;
  uint64_t v6 = _Block_copy(&aBlock);
  id v7 = v4;
  swift_release();
  objc_msgSend(v7, sel_observeDataWithBlock_, v6);
  _Block_release(v6);

  id v8 = objc_msgSend(*(id *)&v0[v3], sel_data);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_customOverrides);

    if (v10)
    {
      (*(void (**)(id))(*(void *)v2 + 144))(v10);
    }
  }
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v11 = sub_1D7E7400C();
  uint64_t v13 = (uint64_t)v12;
  uint64_t aBlock = v11;
  uint64_t v43 = v14;
  id v44 = v12;
  unsigned int v45 = v15;
  id v16 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C4C0));
  swift_retain();
  swift_retain();
  uint64_t v39 = v13;
  sub_1D7E74254(v13);
  uint64_t v17 = (void *)sub_1D7ECA160();
  uint64_t v18 = *(void **)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController];
  *(void *)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController] = v17;
  id v19 = v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C4D0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1D7ED5860;
  id v21 = objc_msgSend(v19, sel_view);
  if (!v21)
  {
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v22 = (uint64_t)v21;
  uint64_t v23 = sub_1D7E7A534(0, &qword_1EA87C4D8);
  unsigned int v45 = (void *)v23;
  uint64_t aBlock = v22;
  id v24 = objc_msgSend(v1, sel_view);
  if (v24)
  {
    *((void *)&v41 + 1) = v23;
    *(void *)&long long v40 = v24;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  sub_1D7E7A534(0, &qword_1EA87C4E0);
  *(void *)(v20 + 32) = sub_1D7E7DA4C(&aBlock, 3, 0, &v40, 3, 1.0, 0.0);
  id v25 = objc_msgSend(v19, sel_view);
  if (!v25) {
    goto LABEL_25;
  }
  unsigned int v45 = (void *)v23;
  uint64_t aBlock = (uint64_t)v25;
  id v26 = objc_msgSend(v1, sel_view);
  if (v26)
  {
    *((void *)&v41 + 1) = v23;
    *(void *)&long long v40 = v26;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  *(void *)(v20 + 40) = sub_1D7E7DA4C(&aBlock, 5, 0, &v40, 5, 1.0, 0.0);
  id v27 = objc_msgSend(v19, sel_view);
  if (!v27) {
    goto LABEL_26;
  }
  unsigned int v45 = (void *)v23;
  uint64_t aBlock = (uint64_t)v27;
  id v28 = objc_msgSend(v1, sel_view);
  if (v28)
  {
    *((void *)&v41 + 1) = v23;
    *(void *)&long long v40 = v28;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  *(void *)(v20 + 48) = sub_1D7E7DA4C(&aBlock, 6, 0, &v40, 6, 1.0, 0.0);
  id v29 = objc_msgSend(v19, sel_view);
  if (!v29) {
    goto LABEL_27;
  }
  unsigned int v45 = (void *)v23;
  uint64_t aBlock = (uint64_t)v29;
  id v30 = objc_msgSend(v1, sel_view);
  if (v30)
  {
    *((void *)&v41 + 1) = v23;
    *(void *)&long long v40 = v30;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  *(void *)(v20 + 56) = sub_1D7E7DA4C(&aBlock, 4, 0, &v40, 4, 1.0, 0.0);
  uint64_t aBlock = v20;
  sub_1D7ECA4C0();
  id v31 = objc_msgSend(v19, sel_view);
  if (!v31) {
    goto LABEL_28;
  }
  uint64_t v32 = v31;
  objc_msgSend(v31, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v33 = objc_msgSend(v1, sel_view);
  if (!v33)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v34 = v33;
  id v35 = objc_msgSend(v19, sel_view);
  if (v35)
  {
    uint64_t v36 = v35;
    objc_msgSend(v34, sel_addSubview_, v35);

    objc_msgSend(v1, sel_addChildViewController_, v19);
    objc_msgSend(v19, sel_didMoveToParentViewController_, v1);
    uint64_t v37 = self;
    uint64_t v38 = (void *)sub_1D7ECA4B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_activateConstraints_, v38);
    swift_release();
    swift_release();

    sub_1D7E74264(v39);
    swift_release();
    return;
  }
LABEL_30:
  __break(1u);
}

uint64_t type metadata accessor for STUIStatusBarDataOverridesViewController()
{
  return self;
}

uint64_t sub_1D7E7D430()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D7E7D468(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1D7ECA430();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1D7ECA450();
  uint64_t v8 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7E7A534(0, &qword_1EA87C4F0);
  uint64_t v11 = (void *)sub_1D7ECA500();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_1D7E7E640;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D7E7D708;
  aBlock[3] = &block_descriptor_24;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = a1;
  swift_retain();
  swift_release();
  sub_1D7ECA440();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1D7E7E774();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA87C500);
  sub_1D7E7E7CC();
  sub_1D7ECA520();
  MEMORY[0x1D9482420](0, v10, v7, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

uint64_t sub_1D7E7D700(void *a1)
{
  return sub_1D7E7D468(a1, v1);
}

uint64_t sub_1D7E7D708(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1D7E7D74C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
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

uint64_t sub_1D7E7D7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4 - 8);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1D9483100](a2 + 16);
  if (result)
  {
    uint64_t v8 = (void *)result;
    uint64_t v9 = *(void **)(result
                  + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher);
    sub_1D7E760D0(a1, (uint64_t)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v11 = swift_allocObject();
    sub_1D7E7E2A8((uint64_t)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_1D7E7E30C;
    *(void *)(v12 + 24) = v11;
    aBlock[4] = sub_1D7E7E5D8;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D7E7DA00;
    aBlock[3] = &block_descriptor_18;
    uint64_t v13 = _Block_copy(aBlock);
    id v14 = v9;
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_updateDataWithBlock_, v13);

    _Block_release(v13);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v8) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1D7E7D9F8(uint64_t a1)
{
  return sub_1D7E7D7D0(a1, v1);
}

void sub_1D7E7DA00(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_1D7E7DA4C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  uint64_t v14 = sub_1D7ECA540();
  uint64_t v15 = a4[3];
  if (v15)
  {
    uint64_t v16 = __swift_project_boxed_opaque_existential_0(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    MEMORY[0x1F4188790](v16);
    uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_1D7ECA540();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_, v14, a2, a3, v21, a5, a6, a7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v22;
}

id STUIStatusBarDataOverridesViewController.__deallocating_deinit()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain], sel_invalidate);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id STUIStatusBarDataOverridesViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1D7ECA470();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id STUIStatusBarDataOverridesViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController] = 0;
  uint64_t v6 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain;
  id v7 = objc_allocWithZone(MEMORY[0x1E4FA94F0]);
  uint64_t v8 = v3;
  *(void *)&v3[v6] = objc_msgSend(v7, sel_init);
  uint64_t v9 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher;
  *(void *)&v8[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA94F8]), sel_init);

  if (a2)
  {
    unint64_t v10 = (void *)sub_1D7ECA470();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, v10, a3);

  return v11;
}

id STUIStatusBarDataOverridesViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id STUIStatusBarDataOverridesViewController.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController] = 0;
  uint64_t v3 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain;
  id v4 = objc_allocWithZone(MEMORY[0x1E4FA94F0]);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher;
  *(void *)&v5[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA94F8]), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
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

uint64_t sub_1D7E7E144()
{
  uint64_t v1 = (int *)(type metadata accessor for StatusBarOverrides(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v1[11];
  uint64_t v8 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  uint64_t v9 = v6 + v7 + *(int *)(v8 + 20);
  uint64_t v10 = sub_1D7EC9F10();
  id v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11(v6 + v1[12] + (uint64_t)*(int *)(v8 + 20), v10);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1D7E7E2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1D7E7E30C(void *a1)
{
  type metadata accessor for StatusBarOverrides(0);
  id v17 = sub_1D7E781FC();
  id v2 = objc_msgSend(self, sel_entryKeys);
  uint64_t v3 = sub_1D7ECA4F0();

  int64_t v4 = 0;
  uint64_t v16 = v3 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  uint64_t v7 = v6 & *(void *)(v3 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_24;
    }
    int64_t v9 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      return;
    }
    if (v9 >= v8) {
      goto LABEL_28;
    }
    uint64_t v10 = *(void *)(v16 + 8 * v9);
    ++v4;
    if (!v10)
    {
      int64_t v4 = v9 + 1;
      if (v9 + 1 >= v8) {
        goto LABEL_28;
      }
      uint64_t v10 = *(void *)(v16 + 8 * v4);
      if (!v10)
      {
        int64_t v4 = v9 + 2;
        if (v9 + 2 >= v8) {
          goto LABEL_28;
        }
        uint64_t v10 = *(void *)(v16 + 8 * v4);
        if (!v10) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v7 = (v10 - 1) & v10;
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_1D7ECA470();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v17, sel_entryForKey_, v12);
    id v14 = objc_msgSend(a1, sel_customOverrides);
    id v15 = objc_msgSend(v14, sel_entryForKey_, v12);

    if (v13)
    {
      if (v15 && objc_msgSend(v15, sel_isEqual_, v13)) {
        goto LABEL_6;
      }
    }
    else if (!v15)
    {
      goto LABEL_7;
    }
    objc_msgSend(a1, sel_setEntry_forKey_, v13, v12, v16);
LABEL_6:

LABEL_7:
  }
  int64_t v11 = v9 + 3;
  if (v11 < v8)
  {
    uint64_t v10 = *(void *)(v16 + 8 * v11);
    if (!v10)
    {
      while (1)
      {
        int64_t v4 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_32;
        }
        if (v4 >= v8) {
          goto LABEL_28;
        }
        uint64_t v10 = *(void *)(v16 + 8 * v4);
        ++v11;
        if (v10) {
          goto LABEL_23;
        }
      }
    }
    int64_t v4 = v11;
    goto LABEL_23;
  }
LABEL_28:
  swift_release();
}

uint64_t sub_1D7E7E5C8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D7E7E5D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D7E7E600()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1D7E7E640()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = *(void **)(v0 + 24);
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1D9483100](v3);
  if (v4)
  {
    uint64_t v5 = (char *)v4;
    if (v2)
    {
      id v6 = objc_msgSend(v2, sel_customOverrides);
      if (v6)
      {
        uint64_t v7 = v6;
        int64_t v8 = *(void **)&v5[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController];
        if (v8)
        {
          id v9 = v8;
          sub_1D7ECA170();

          uint64_t v10 = sub_1D7E6FBDC();
          swift_release();
          swift_release();
          sub_1D7E74264(v11);
          (*(void (**)(void *))(*(void *)v10 + 144))(v7);

          swift_release();
          return;
        }
      }
    }
  }
}

unint64_t sub_1D7E7E774()
{
  unint64_t result = qword_1EA87C4F8;
  if (!qword_1EA87C4F8)
  {
    sub_1D7ECA430();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C4F8);
  }
  return result;
}

unint64_t sub_1D7E7E7CC()
{
  unint64_t result = qword_1EA87C508;
  if (!qword_1EA87C508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA87C500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA87C508);
  }
  return result;
}

id STUIBackgroundActivityIdentifierForStyleOverride(uint64_t a1)
{
  id v3 = 0;
  if (a1 >= 0x200000)
  {
    if (a1 <= 0x7FFFFFFF)
    {
      if (a1 <= 0x3FFFFFF)
      {
        if (a1 < 0x800000)
        {
          if (a1 == 0x200000)
          {
            uint64_t v5 = (id *)MEMORY[0x1E4FA9638];
          }
          else
          {
            if (a1 != 0x400000) {
              goto LABEL_94;
            }
            uint64_t v5 = (id *)MEMORY[0x1E4FA95B8];
          }
        }
        else
        {
          switch(a1)
          {
            case 0x800000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA95B0];
              break;
            case 0x1000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA96D8];
              break;
            case 0x2000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA9608];
              break;
            default:
              goto LABEL_94;
          }
        }
        goto LABEL_93;
      }
      if (a1 <= 0xFFFFFFF)
      {
        if (a1 == 0x4000000)
        {
          uint64_t v5 = (id *)MEMORY[0x1E4FA9600];
        }
        else
        {
          if (a1 != 0x8000000) {
            goto LABEL_94;
          }
          uint64_t v5 = (id *)MEMORY[0x1E4FA95D0];
        }
        goto LABEL_93;
      }
      if (a1 == 0x10000000)
      {
        uint64_t v5 = (id *)MEMORY[0x1E4FA96C8];
        goto LABEL_93;
      }
      if (a1 == 0x20000000)
      {
        uint64_t v5 = (id *)MEMORY[0x1E4FA9670];
        goto LABEL_93;
      }
      uint64_t v6 = 0x40000000;
    }
    else
    {
      if (a1 > 0xFFFFFFFFFLL)
      {
        if (a1 > 0x7FFFFFFFFFLL)
        {
          switch(a1)
          {
            case 0x8000000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA96C0];
              break;
            case 0x10000000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA96A0];
              break;
            case 0x20000000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA9658];
              break;
            default:
              goto LABEL_94;
          }
        }
        else
        {
          switch(a1)
          {
            case 0x1000000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA9598];
              break;
            case 0x2000000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA9618];
              break;
            case 0x4000000000:
              uint64_t v5 = (id *)MEMORY[0x1E4FA95C8];
              break;
            default:
              goto LABEL_94;
          }
        }
        goto LABEL_93;
      }
      if (a1 > 0x1FFFFFFFFLL)
      {
        if (a1 != 0x200000000)
        {
          if (a1 == 0x400000000)
          {
            uint64_t v5 = (id *)MEMORY[0x1E4FA9660];
          }
          else
          {
            if (a1 != 0x800000000) {
              goto LABEL_94;
            }
            uint64_t v5 = (id *)MEMORY[0x1E4FA9678];
          }
          goto LABEL_93;
        }
        goto LABEL_63;
      }
      if (a1 == 0x80000000)
      {
        uint64_t v5 = (id *)MEMORY[0x1E4FA96A8];
        goto LABEL_93;
      }
      uint64_t v6 = 0x100000000;
    }
    if (a1 != v6) {
      goto LABEL_94;
    }
LABEL_63:
    uint64_t v5 = (id *)MEMORY[0x1E4FA9698];
    goto LABEL_93;
  }
  if (a1 > 2047)
  {
    if (a1 >= 0x10000)
    {
      if (a1 < 0x40000)
      {
        if (a1 == 0x10000)
        {
          uint64_t v5 = (id *)MEMORY[0x1E4FA95E8];
        }
        else
        {
          if (a1 != 0x20000) {
            goto LABEL_94;
          }
          uint64_t v5 = (id *)MEMORY[0x1E4FA96E0];
        }
      }
      else
      {
        switch(a1)
        {
          case 0x40000:
            uint64_t v5 = (id *)MEMORY[0x1E4FA95A0];
            break;
          case 0x80000:
            uint64_t v5 = (id *)MEMORY[0x1E4FA95F0];
            break;
          case 0x100000:
            uint64_t v5 = (id *)MEMORY[0x1E4FA9680];
            break;
          default:
            goto LABEL_94;
        }
      }
    }
    else if (a1 < 0x2000)
    {
      if (a1 == 2048)
      {
        uint64_t v5 = (id *)MEMORY[0x1E4FA95C0];
      }
      else
      {
        if (a1 != 4096) {
          goto LABEL_94;
        }
        uint64_t v5 = (id *)MEMORY[0x1E4FA95E0];
      }
    }
    else
    {
      switch(a1)
      {
        case 0x2000:
          uint64_t v5 = (id *)MEMORY[0x1E4FA96B0];
          break;
        case 0x4000:
          uint64_t v5 = (id *)MEMORY[0x1E4FA9690];
          break;
        case 0x8000:
          uint64_t v5 = (id *)MEMORY[0x1E4FA95F8];
          break;
        default:
          goto LABEL_94;
      }
    }
    goto LABEL_93;
  }
  if (a1 <= 63)
  {
    uint64_t v4 = a1 - 1;
    uint64_t v5 = (id *)MEMORY[0x1E4FA9620];
    switch(v4)
    {
      case 0:
        goto LABEL_93;
      case 1:
        uint64_t v5 = (id *)MEMORY[0x1E4FA9630];
        goto LABEL_93;
      case 2:
      case 4:
      case 5:
      case 6:
        goto LABEL_94;
      case 3:
        uint64_t v5 = (id *)MEMORY[0x1E4FA9668];
        goto LABEL_93;
      case 7:
        uint64_t v5 = (id *)MEMORY[0x1E4FA96B8];
        goto LABEL_93;
      default:
        if (MEMORY[0x1E4FA9620] == 16)
        {
          uint64_t v5 = (id *)MEMORY[0x1E4FA9628];
        }
        else
        {
          if (MEMORY[0x1E4FA9620] != 32) {
            goto LABEL_94;
          }
          uint64_t v5 = (id *)MEMORY[0x1E4FA9688];
        }
        break;
    }
    goto LABEL_93;
  }
  if (a1 > 255)
  {
    switch(a1)
    {
      case 256:
        uint64_t v5 = (id *)MEMORY[0x1E4FA95A8];
        break;
      case 512:
        uint64_t v5 = (id *)MEMORY[0x1E4FA96D0];
        break;
      case 1024:
        uint64_t v5 = (id *)MEMORY[0x1E4FA9610];
        break;
      default:
        goto LABEL_94;
    }
    goto LABEL_93;
  }
  if (a1 == 64 || a1 == 128)
  {
    uint64_t v5 = (id *)MEMORY[0x1E4FA9640];
LABEL_93:
    id v3 = *v5;
  }
LABEL_94:
  return v3;
}

uint64_t STUIStyleOverrideForBackgroundActivityIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4FA9620]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9630]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9668]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96B8]])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9628]])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9688]])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9640]])
  {
    uint64_t v2 = 128;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95A8]])
  {
    uint64_t v2 = 256;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96D0]])
  {
    uint64_t v2 = 512;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9610]])
  {
    uint64_t v2 = 1024;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95C0]])
  {
    uint64_t v2 = 2048;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95E0]])
  {
    uint64_t v2 = 4096;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96B0]])
  {
    uint64_t v2 = 0x2000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9690]])
  {
    uint64_t v2 = 0x4000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95F8]])
  {
    uint64_t v2 = 0x8000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95E8]])
  {
    uint64_t v2 = 0x10000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96E0]])
  {
    uint64_t v2 = 0x20000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95A0]])
  {
    uint64_t v2 = 0x40000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95F0]])
  {
    uint64_t v2 = 0x80000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9680]])
  {
    uint64_t v2 = 0x100000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9638]])
  {
    uint64_t v2 = 0x200000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95B8]])
  {
    uint64_t v2 = 0x400000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95B0]])
  {
    uint64_t v2 = 0x800000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96D8]])
  {
    uint64_t v2 = 0x1000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9608]])
  {
    uint64_t v2 = 0x2000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9600]])
  {
    uint64_t v2 = 0x4000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95D0]])
  {
    uint64_t v2 = 0x8000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96C8]])
  {
    uint64_t v2 = 0x10000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9670]])
  {
    uint64_t v2 = 0x20000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9698]])
  {
    uint64_t v2 = 0x40000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96A8]])
  {
    uint64_t v2 = 0x80000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9660]])
  {
    uint64_t v2 = 0x400000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9678]])
  {
    uint64_t v2 = 0x800000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9598]])
  {
    uint64_t v2 = 0x1000000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9618]])
  {
    uint64_t v2 = 0x2000000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA95C8]])
  {
    uint64_t v2 = 0x4000000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96C0]])
  {
    uint64_t v2 = 0x8000000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA96A0]])
  {
    uint64_t v2 = 0x10000000000;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9658]])
  {
    uint64_t v2 = 0x20000000000;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v10 = __STUIBackgroundActivityIdentifiersForStyleOverrides_block_invoke;
  uint64_t v11 = &unk_1E6AA36A0;
  id v3 = v2;
  id v12 = v3;
  uint64_t v4 = v9;
  if (a1)
  {
    char v13 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(void *))v10)(v4);
          if (v13) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  return v3;
}

void __STUIBackgroundActivityIdentifiersForStyleOverrides_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  STUIBackgroundActivityIdentifierForStyleOverride(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_safeAddObject:", v3);
}

BOOL STUIBackgroundActivityIdentiferRepresentsStyleOverride(void *a1)
{
  return STUIStyleOverrideForBackgroundActivityIdentifier(a1) != 0;
}

void _UIDebugShowLayoutItem(void *a1, void *a2)
{
  void v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "_ui_view");
  id v6 = v3;
  if ((id)v5 == v3
    || (unint64_t v7 = (void *)v5,
        objc_getAssociatedObject(v3, &_UIDebugView),
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    if (v4)
    {
LABEL_4:
      [v4 alphaComponent];
      id v9 = [v4 colorWithAlphaComponent:v8 * 0.25];
      [v6 setBackgroundColor:v9];

      [v6 _currentScreenScale];
      double v11 = 1.0 / v10;
      id v12 = [v6 layer];
      [v12 setBorderWidth:v11];

      uint64_t v13 = [v4 CGColor];
      id v14 = [v6 layer];
      [v14 setBorderColor:v13];

      goto LABEL_9;
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setUserInteractionEnabled:0];
    objc_setAssociatedObject(v3, &_UIDebugView, v6, 0);
    id v29 = [v6 topAnchor];
    id v28 = [v3 topAnchor];
    id v27 = [v29 constraintEqualToAnchor:v28];
    v30[0] = v27;
    id v26 = [v6 leftAnchor];
    uint64_t v25 = [v3 leftAnchor];
    uint64_t v24 = [v26 constraintEqualToAnchor:v25];
    v30[1] = v24;
    id v15 = [v6 rightAnchor];
    uint64_t v16 = [v3 rightAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    v30[2] = v17;
    uint64_t v18 = [v6 bottomAnchor];
    uint64_t v19 = [v3 bottomAnchor];
    uint64_t v20 = [v18 constraintEqualToAnchor:v19];
    v30[3] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

    id v22 = objc_msgSend(v3, "_ui_superview");
    [v22 addSubview:v6];

    [MEMORY[0x1E4F28DC8] activateConstraints:v21];
    if (v4) {
      goto LABEL_4;
    }
  }
  if (v6 == v3)
  {
    [v3 setBackgroundColor:0];
    uint64_t v23 = [v3 layer];
    [v23 setBorderColor:0];
  }
  else
  {
    [v6 removeFromSuperview];
    objc_setAssociatedObject(v3, &_UIDebugView, 0, 0);
  }
LABEL_9:
}

id __UIKitUserDefaults()
{
  if (qword_1EC05EFB8 != -1) {
    dispatch_once(&qword_1EC05EFB8, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)qword_1EC05EFB0;
  return v0;
}

id _reorderedPlacementsFromGroupForLegacyLayout(void *a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = ___reorderedPlacementsFromGroupForLegacyLayout_block_invoke;
  v9[3] = &unk_1E6AA38B0;
  id v10 = v5;
  char v11 = a2;
  id v6 = v5;
  unint64_t v7 = [a1 sortedArrayUsingComparator:v9];

  return v7;
}

void sub_1D7E8A3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7E8B044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 224), 8);
  _Block_object_dispose((const void *)(v55 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t ___reorderedPlacementsFromGroupForLegacyLayout_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [a2 identifier];
  unint64_t v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = [v6 identifier];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL && v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v13 = 1;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v13 = -1;
  }
  uint64_t v14 = -1;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v14 = 1;
  }
  if (v8 < v11) {
    return v14;
  }
  else {
    return v13;
  }
}

void sub_1D7E91B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

__CFString *STUIStatusBarDisplayItemEnabilityStatusDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E6AA3C88[a1];
  }
}

__CFString *STUIStatusBarDisplayItemVisibilityStatusDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E6AA3CA8[a1];
  }
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1D7E94CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1D7E95D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1D7E97F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo(void *a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v17 = 0;
  v18[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo_block_invoke;
  v10[3] = &unk_1E6AA4160;
  uint64_t v13 = &v14;
  id v6 = v3;
  id v11 = v6;
  id v7 = v4;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_1D7E9A348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id result = STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  return result;
}

id STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (Class Superclass = class_getSuperclass((Class)a1)) != 0
    && (id v8 = Superclass,
        ClassMethod = class_getClassMethod((Class)a1, sel_visualProviderSubclassForScreen_visualProviderInfo_),
        ClassMethod == class_getClassMethod(v8, sel_visualProviderSubclassForScreen_visualProviderInfo_)))
  {
    id v10 = a1;
  }
  else
  {
    id v10 = [a1 visualProviderSubclassForScreen:v5 visualProviderInfo:v6];
  }
  id v11 = v10;

  return v11;
}

id STUIStatusBarDefaultAnimation(void *a1, void *a2, long long *a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__3;
  void v30[4] = __Block_byref_object_dispose__3;
  id v31 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4010000000;
  v27[3] = "";
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v28 = *MEMORY[0x1E4F1DB28];
  long long v29 = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __STUIStatusBarDefaultAnimation_block_invoke;
  v20[3] = &unk_1E6AA41D8;
  v20[4] = v30;
  v20[5] = v27;
  long long v14 = *a3;
  long long v15 = a3[1];
  long long v23 = a3[2];
  long long v22 = v15;
  long long v21 = v14;
  double v24 = a4;
  double v25 = a5;
  double v26 = a6;
  uint64_t v16 = +[STUIStatusBarAnimation animationWithBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __STUIStatusBarDefaultAnimation_block_invoke_3;
  v19[3] = &unk_1E6AA3E90;
  void v19[4] = v27;
  [v16 setPrepareBlock:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __STUIStatusBarDefaultAnimation_block_invoke_4;
  v18[3] = &unk_1E6AA3FF8;
  v18[4] = v30;
  STUIStatusBarAddDefaultAnimationReposition(v11, v16, v12, v18);
  [v16 setDelaysAnimatingItems:1];
  [v16 setPriority:-100];
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v30, 8);

  return v16;
}

void sub_1D7E9A6D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __STUIStatusBarDefaultAnimation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a2 type];
  id v10 = [v7 region];
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (v9 == 2)
  {
    objc_msgSend(v7, "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
    long long v14 = (void *)MEMORY[0x1E4FB1EB0];
    double v15 = *(double *)(a1 + 104);
LABEL_7:
    double v18 = *(double *)(a1 + 112);
    goto LABEL_8;
  }
  [v7 setAlpha:0.0];
  long long v16 = *(_OWORD *)(a1 + 64);
  v27[0] = *(_OWORD *)(a1 + 48);
  v27[1] = v16;
  v27[2] = *(_OWORD *)(a1 + 80);
  [v7 setTransform:v27];
  long long v14 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v17 = 104;
  if (v9 == 1) {
    uint64_t v17 = 96;
  }
  double v15 = *(double *)(a1 + v17);
  if (v9 != 1) {
    goto LABEL_7;
  }
  double v18 = 0.3;
LABEL_8:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __STUIStatusBarDefaultAnimation_block_invoke_2;
  v21[3] = &unk_1E6AA41B0;
  id v22 = v7;
  uint64_t v23 = v9;
  long long v19 = *(_OWORD *)(a1 + 64);
  long long v24 = *(_OWORD *)(a1 + 48);
  long long v25 = v19;
  long long v26 = *(_OWORD *)(a1 + 80);
  id v20 = v7;
  [v14 animateWithDuration:0 delay:v21 options:v8 animations:v15 completion:v18];
}

uint64_t __STUIStatusBarDefaultAnimation_block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  double v4 = 0.0;
  if (*(void *)(v3 + 8) == 1) {
    double v4 = 1.0;
  }
  [v2 setAlpha:v4];
  id v5 = (_OWORD *)(a1 + 48);
  id v6 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40) == 1) {
    id v5 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  }
  long long v7 = v5[1];
  v9[0] = *v5;
  v9[1] = v7;
  void v9[2] = v5[2];
  return [v6 setTransform:v9];
}

uint64_t __STUIStatusBarDefaultAnimation_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 type] == 2)
  {
    id v6 = [v5 region];
    int v7 = [v6 isEnabled];

    if (v7)
    {
      [v5 absoluteFrame];
      id v8 = *(void **)(*(void *)(a1 + 32) + 8);
      _OWORD v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      uint64_t v13 = 1;
      [v5 setFloating:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

uint64_t __STUIStatusBarDefaultAnimation_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 region];
  double v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

id STUIStatusBarDefaultScaleAnimation(void *a1, void *a2, CGFloat a3)
{
  id v5 = a2;
  id v6 = a1;
  CGAffineTransformMakeScale(&v9, a3, a3);
  int v7 = STUIStatusBarDefaultAnimation(v6, v5, (long long *)&v9, 0.15, 0.1, 0.0);

  return v7;
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id STUIStatusBarBSSettingsRepositionAnimation(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9 = a2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __STUIStatusBarBSSettingsRepositionAnimation_block_invoke;
  v17[3] = &unk_1E6AA42C0;
  id v18 = v9;
  char v19 = a3;
  id v10 = v9;
  id v11 = a5;
  id v12 = a4;
  id v13 = a1;
  long long v14 = _Block_copy(v17);
  double v15 = STUIStatusBarInternalRepositionAnimation(v13, a3, v14, v12, v11);

  return v15;
}

void __STUIStatusBarBSSettingsRepositionAnimation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x1E4F4F680];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 40);
  id v13 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __STUIStatusBarBSSettingsRepositionAnimation_block_invoke_2;
  v14[3] = &unk_1E6AA4200;
  id v15 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __STUIStatusBarBSSettingsRepositionAnimation_block_invoke_3;
  v12[3] = &unk_1E6AA4200;
  id v10 = v6;
  id v11 = v5;
  [v7 tryAnimatingWithSettings:v8 fromCurrentState:v9 actions:v14 completion:v12];
}

uint64_t __STUIStatusBarBSSettingsRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __STUIStatusBarBSSettingsRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void STUIStatusBarGetLeadingAndTrailingParts(int a1, double *a2, double *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (CGRectIsEmpty(*(CGRect *)&a4)) {
    goto LABEL_4;
  }
  v19.origin.x = a4;
  v19.origin.y = a5;
  v19.size.width = a6;
  v19.size.height = a7;
  if (CGRectGetMinX(v19) > a8
    || (v20.origin.x = a4, v20.origin.y = a5, v20.size.width = a6, v20.size.height = a7, CGRectGetMaxX(v20) < a8))
  {
LABEL_4:
    if (a2) {
      *a2 = 0.0;
    }
    double v16 = 0.0;
    if (a3) {
LABEL_7:
    }
      *a3 = v16;
  }
  else
  {
    v21.origin.x = a4;
    v21.origin.y = a5;
    v21.size.width = a6;
    v21.size.height = a7;
    double v17 = a8 - CGRectGetMinX(v21);
    v22.origin.x = a4;
    v22.origin.y = a5;
    v22.size.width = a6;
    v22.size.height = a7;
    double v16 = CGRectGetMaxX(v22) - a8;
    if (a2)
    {
      if (a1) {
        double v18 = v16;
      }
      else {
        double v18 = v17;
      }
      *a2 = v18;
    }
    if (a3)
    {
      if (a1) {
        double v16 = v17;
      }
      goto LABEL_7;
    }
  }
}

id _STUIStatusBar_BackgroundActivity_Log()
{
  if (_STUIStatusBar_BackgroundActivity_Log_onceToken != -1) {
    dispatch_once(&_STUIStatusBar_BackgroundActivity_Log_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_STUIStatusBar_BackgroundActivity_Log___StatusBarBackground_LOG;
  return v0;
}

id UIStatusBarCreateHUDDualSignalView(void *a1, void *a2, double a3, double a4, CGFloat a5)
{
  id v9 = a2;
  id v10 = a1;
  [v10 size];
  double v12 = v11;
  [v9 size];
  if (v12 >= v13) {
    double v13 = v12;
  }
  CGFloat v14 = v13 * 3.0;
  [v10 size];
  double v16 = v15;
  [v9 size];
  v33.height = (v16 + v17 + 3.0) * 3.0;
  v33.width = v14;
  UIGraphicsBeginImageContextWithOptions(v33, 0, a5);
  [v10 size];
  CGFloat v19 = (v14 - v18 * 3.0) * 0.5;
  [v10 size];
  double v21 = v20 * 3.0;
  [v10 size];
  objc_msgSend(v10, "drawInRect:blendMode:alpha:", 0, v19, 0.0, v21, v22 * 3.0, a3);
  [v9 size];
  CGFloat v24 = (v14 - v23 * 3.0) * 0.5;
  [v10 size];
  double v26 = v25;

  [v9 size];
  double v28 = v27 * 3.0;
  [v9 size];
  objc_msgSend(v9, "drawInRect:blendMode:alpha:", 0, v24, (v26 + 3.0) * 3.0, v28, v29 * 3.0, a4);

  id v30 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v30;
}

id DashBoardFrameworkBundle()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  uint64_t v1 = [v0 objectAtIndex:0];

  uint64_t v2 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:v1];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"PrivateFrameworks/DashBoard.framework"];

  double v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v3];

  return v4;
}

id STUILegacyDataFromData(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4FB22F0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = objc_msgSend(v1, "existingEntryKeys", 0);
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
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v1 valueForKey:v8];
        id v10 = STUILegacyDataEntryFromDataEntry(v9);
        [v2 setValue:v10 forKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

id STUILegacyDataEntryFromDataEntry(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v3 = 0;
    goto LABEL_9;
  }
  if (![v1 isMemberOfClass:objc_opt_class()])
  {
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      objc_msgSend(MEMORY[0x1E4FB2318], "entryWithBoolValue:", objc_msgSend(v1, "BOOLValue"));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = (void *)MEMORY[0x1E4FB2360];
      uint64_t v6 = [v1 stringValue];
      uint64_t v7 = [v5 entryWithStringValue:v6];
LABEL_20:
      id v3 = (id)v7;
LABEL_21:

      goto LABEL_8;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2340]);
      objc_msgSend(v3, "setRawValue:", objc_msgSend(v1, "rawValue"));
      objc_msgSend(v3, "setDisplayValue:", objc_msgSend(v1, "displayValue"));
      objc_msgSend(v3, "setDisplayRawValue:", objc_msgSend(v1, "displayRawValue"));
      goto LABEL_8;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FB2338];
      uint64_t v6 = [v1 imageName];
      uint64_t v7 = [v8 entryWithImageNamed:v6];
      goto LABEL_20;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v9 = (void *)MEMORY[0x1E4FB2320];
      uint64_t v6 = [v1 imageName];
      uint64_t v7 = objc_msgSend(v9, "entryWithImageNamed:BOOLValue:", v6, objc_msgSend(v1, "BOOLValue"));
      goto LABEL_20;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v10 = (void *)MEMORY[0x1E4FB2358];
      uint64_t v6 = [v1 focusName];
      double v11 = [v1 imageName];
      objc_msgSend(v10, "entryWithFocusName:imageNamed:BOOLValue:", v6, v11, objc_msgSend(v1, "BOOLValue"));
      id v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_21;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2328]);
      objc_msgSend(v3, "setRawValue:", objc_msgSend(v1, "rawValue"));
      objc_msgSend(v3, "setDisplayValue:", objc_msgSend(v1, "displayValue"));
      objc_msgSend(v3, "setDisplayRawValue:", objc_msgSend(v1, "displayRawValue"));
      objc_msgSend(v3, "setStatus:", objc_msgSend(v1, "status"));
      objc_msgSend(v3, "setLowDataModeActive:", objc_msgSend(v1, "lowDataModeActive"));
      objc_msgSend(v3, "setType:", objc_msgSend(v1, "type"));
      long long v12 = [v1 string];
      [v3 setString:v12];

      long long v13 = [v1 crossfadeString];
      [v3 setCrossfadeString:v13];

      long long v14 = [v1 badgeString];
      [v3 setBadgeString:v14];

      objc_msgSend(v3, "setWifiCallingEnabled:", objc_msgSend(v1, "wifiCallingEnabled"));
      objc_msgSend(v3, "setCallForwardingEnabled:", objc_msgSend(v1, "callForwardingEnabled"));
      objc_msgSend(v3, "setShowsSOSWhenDisabled:", objc_msgSend(v1, "showsSOSWhenDisabled"));
      objc_msgSend(v3, "setSosAvailable:", objc_msgSend(v1, "sosAvailable"));
      objc_msgSend(v3, "setIsBootstrapCellular:", objc_msgSend(v1, "isBootstrapCellular"));
      goto LABEL_8;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2380]);
      objc_msgSend(v3, "setRawValue:", objc_msgSend(v1, "rawValue"));
      objc_msgSend(v3, "setDisplayValue:", objc_msgSend(v1, "displayValue"));
      objc_msgSend(v3, "setDisplayRawValue:", objc_msgSend(v1, "displayRawValue"));
      objc_msgSend(v3, "setStatus:", objc_msgSend(v1, "status"));
      objc_msgSend(v3, "setLowDataModeActive:", objc_msgSend(v1, "lowDataModeActive"));
LABEL_29:
      objc_msgSend(v3, "setType:", objc_msgSend(v1, "type"));
      goto LABEL_8;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2308]);
      objc_msgSend(v3, "setCapacity:", objc_msgSend(v1, "capacity"));
      objc_msgSend(v3, "setState:", objc_msgSend(v1, "state"));
      objc_msgSend(v3, "setSaverModeActive:", objc_msgSend(v1, "saverModeActive"));
      objc_msgSend(v3, "setProminentlyShowsDetailString:", objc_msgSend(v1, "prominentlyShowsDetailString"));
LABEL_32:
      uint64_t v6 = [v1 detailString];
      [v3 setDetailString:v6];
      goto LABEL_21;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2310]);
      objc_msgSend(v3, "setState:", objc_msgSend(v1, "state"));
      uint64_t v6 = [v1 batteryEntry];
      double v11 = STUILegacyDataEntryFromDataEntry();
      [v3 setBatteryEntry:v11];
      goto LABEL_24;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2370]);
      objc_msgSend(v3, "setColor:", objc_msgSend(v1, "color"));
      objc_msgSend(v3, "setSunlightMode:", objc_msgSend(v1, "sunlightMode"));
      goto LABEL_8;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB22F8]);
      objc_msgSend(v3, "setType:", objc_msgSend(v1, "type"));
      uint64_t v6 = [v1 displayId];
      [v3 setDisplayId:v6];
      goto LABEL_21;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB2368]);
      objc_msgSend(v3, "setConnectionCount:", objc_msgSend(v1, "connectionCount"));
      goto LABEL_8;
    }
    if ([v1 isMemberOfClass:objc_opt_class()])
    {
      long long v15 = (objc_class *)MEMORY[0x1E4FB2348];
    }
    else
    {
      if (![v1 isMemberOfClass:objc_opt_class()])
      {
        if ([v1 isMemberOfClass:objc_opt_class()])
        {
          id v3 = objc_alloc_init(MEMORY[0x1E4FB2350]);
          objc_msgSend(v3, "setUnlockFailureCount:", objc_msgSend(v1, "unlockFailureCount"));
          goto LABEL_8;
        }
        if (![v1 isMemberOfClass:objc_opt_class()])
        {
          id v3 = 0;
          goto LABEL_8;
        }
        id v3 = objc_alloc_init(MEMORY[0x1E4FB2300]);
        double v16 = [v1 backgroundActivityIdentifier];
        [v3 setType:STUILegacyBackgroundActivityTypeFromBackgroundActivityIdentifier(v16)];

        [v1 displayStartDate];
        objc_msgSend(v3, "setDisplayStartDate:");
        goto LABEL_32;
      }
      long long v15 = (objc_class *)MEMORY[0x1E4FB2378];
    }
    id v3 = objc_alloc_init(v15);
    goto LABEL_29;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4FB2330]);
LABEL_7:
  id v3 = v2;
LABEL_8:
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v1, "isEnabled"));
LABEL_9:

  return v3;
}

uint64_t STUILegacyBackgroundActivityTypeFromBackgroundActivityIdentifier(void *a1)
{
  id v1 = a1;
  if ([(id)*MEMORY[0x1E4FA9670] isEqualToString:v1])
  {
    uint64_t v2 = 0;
  }
  else if ([(id)*MEMORY[0x1E4FA9678] isEqualToString:v1])
  {
    uint64_t v2 = 1;
  }
  else if ([(id)*MEMORY[0x1E4FA95D0] isEqualToString:v1])
  {
    uint64_t v2 = 2;
  }
  else if ([(id)*MEMORY[0x1E4FA96C8] isEqualToString:v1])
  {
    uint64_t v2 = 3;
  }
  else if ([(id)*MEMORY[0x1E4FA95C8] isEqualToString:v1])
  {
    uint64_t v2 = 4;
  }
  else if ([(id)*MEMORY[0x1E4FA96C0] isEqualToString:v1])
  {
    uint64_t v2 = 5;
  }
  else if ([(id)*MEMORY[0x1E4FA9620] isEqualToString:v1])
  {
    uint64_t v2 = 6;
  }
  else if ([(id)*MEMORY[0x1E4FA9628] isEqualToString:v1])
  {
    uint64_t v2 = 7;
  }
  else if ([(id)*MEMORY[0x1E4FA9598] isEqualToString:v1])
  {
    uint64_t v2 = 8;
  }
  else if ([(id)*MEMORY[0x1E4FA9618] isEqualToString:v1])
  {
    uint64_t v2 = 9;
  }
  else if ([(id)*MEMORY[0x1E4FA96E0] isEqualToString:v1])
  {
    uint64_t v2 = 10;
  }
  else if ([(id)*MEMORY[0x1E4FA96D8] isEqualToString:v1])
  {
    uint64_t v2 = 11;
  }
  else if ([(id)*MEMORY[0x1E4FA9608] isEqualToString:v1])
  {
    uint64_t v2 = 12;
  }
  else if ([(id)*MEMORY[0x1E4FA9600] isEqualToString:v1])
  {
    uint64_t v2 = 13;
  }
  else if ([(id)*MEMORY[0x1E4FA9640] isEqualToString:v1])
  {
    uint64_t v2 = 14;
  }
  else if ([(id)*MEMORY[0x1E4FA95C0] isEqualToString:v1])
  {
    uint64_t v2 = 15;
  }
  else if ([(id)*MEMORY[0x1E4FA9658] isEqualToString:v1])
  {
    uint64_t v2 = 16;
  }
  else if ([(id)*MEMORY[0x1E4FA9668] isEqualToString:v1])
  {
    uint64_t v2 = 17;
  }
  else if ([(id)*MEMORY[0x1E4FA9610] isEqualToString:v1])
  {
    uint64_t v2 = 18;
  }
  else if ([(id)*MEMORY[0x1E4FA9698] isEqualToString:v1])
  {
    uint64_t v2 = 19;
  }
  else if ([(id)*MEMORY[0x1E4FA96A8] isEqualToString:v1])
  {
    uint64_t v2 = 20;
  }
  else if ([(id)*MEMORY[0x1E4FA96A0] isEqualToString:v1])
  {
    uint64_t v2 = 21;
  }
  else if ([(id)*MEMORY[0x1E4FA9660] isEqualToString:v1])
  {
    uint64_t v2 = 22;
  }
  else if ([(id)*MEMORY[0x1E4FA96D0] isEqualToString:v1])
  {
    uint64_t v2 = 23;
  }
  else if ([(id)*MEMORY[0x1E4FA9688] isEqualToString:v1])
  {
    uint64_t v2 = 24;
  }
  else if ([(id)*MEMORY[0x1E4FA9690] isEqualToString:v1])
  {
    uint64_t v2 = 25;
  }
  else if ([(id)*MEMORY[0x1E4FA9680] isEqualToString:v1])
  {
    uint64_t v2 = 26;
  }
  else if ([(id)*MEMORY[0x1E4FA95B8] isEqualToString:v1])
  {
    uint64_t v2 = 27;
  }
  else if ([(id)*MEMORY[0x1E4FA95B0] isEqualToString:v1])
  {
    uint64_t v2 = 28;
  }
  else if ([(id)*MEMORY[0x1E4FA96B0] isEqualToString:v1])
  {
    uint64_t v2 = 29;
  }
  else if ([(id)*MEMORY[0x1E4FA95F8] isEqualToString:v1])
  {
    uint64_t v2 = 30;
  }
  else if ([(id)*MEMORY[0x1E4FA9638] isEqualToString:v1])
  {
    uint64_t v2 = 31;
  }
  else if ([(id)*MEMORY[0x1E4FA95E0] isEqualToString:v1])
  {
    uint64_t v2 = 32;
  }
  else if ([(id)*MEMORY[0x1E4FA95A8] isEqualToString:v1])
  {
    uint64_t v2 = 33;
  }
  else if ([(id)*MEMORY[0x1E4FA96B8] isEqualToString:v1])
  {
    uint64_t v2 = 34;
  }
  else if ([(id)*MEMORY[0x1E4FA95A0] isEqualToString:v1])
  {
    uint64_t v2 = 35;
  }
  else if ([(id)*MEMORY[0x1E4FA95E8] isEqualToString:v1])
  {
    uint64_t v2 = 36;
  }
  else if ([(id)*MEMORY[0x1E4FA95F0] isEqualToString:v1])
  {
    uint64_t v2 = 37;
  }
  else
  {
    uint64_t v2 = 30;
  }

  return v2;
}

void sub_1D7EA68A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7EA6BD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *_STUIStatusBarCycleAnimationStateDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6AA4640[a1];
  }
}

void sub_1D7EAAAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1D7EACC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7EACDE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1D7EAD44C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D7EAD86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7EB03EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__CFString *_STUIStatusBarAnimationTypeDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E6AA4918[a1];
  }
}

id STUIStatusBarRunningAnimations()
{
  return (id)_statusBarRunningAnimations;
}

void sub_1D7EB236C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7EB2E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

id STUIStatusBarDelayedDataEntryKeys()
{
  return (id)_statusBarDelayedDataEntryKeys;
}

void sub_1D7EB47B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double centerOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  double v9 = MinX + CGRectGetWidth(v11) * 0.5;
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetMinY(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return v9;
}

void sub_1D7EB731C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7EB7E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1D7EB8874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

void sub_1D7EB8D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7EB944C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7EBAAEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1D7EBB0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *STUIStatusBarFontStyleDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6AA4D40[a1];
  }
}

__CFString *STUIStatusBarModeDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E6AA50D8[a1];
  }
}

__CFString *_UIStatusBarResolvedStyleDescription(uint64_t a1)
{
  id result = @"default";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      id result = @"lightContent";
      break;
    case 2:
      id result = @"darkContent";
      break;
    case 3:
      goto LABEL_6;
    case 4:
      id result = @"inherited";
      break;
    default:
      if (a1 == 64)
      {
        id result = @"automaticLightBias";
      }
      else if (a1 == 128)
      {
        id result = @"automaticDarkBias";
      }
      else
      {
LABEL_6:
        id result = @"(unknown)";
      }
      break;
  }
  return result;
}

__CFString *sensorActivityScreenIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1 || ([v1 _isEmbeddedScreen] & 1) != 0 || (objc_msgSend(v2, "_isCarScreen") & 1) != 0)
  {
    id v3 = &stru_1F2F86950;
  }
  else
  {
    id v3 = [v2 _displayID];
  }

  return v3;
}

void *STUIStatusBarActionGestureDefaultAllowedTouchTypes()
{
  return &unk_1F2F9CAF8;
}

uint64_t _UIBackgroundLuminanceLevelForStyle(uint64_t a1)
{
  if (a1 >> 6 == 2) {
    return 1;
  }
  else {
    return 2 * (a1 >> 6 == 1);
  }
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1D7EC42D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void *STUIStatusBarActionGestureTouchTypesIncludingIndirectPointer()
{
  return &unk_1F2F9CB10;
}

id STUIStatusBarGetLowestPrioritizedItem(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 priority];
        if (v9 < v6)
        {
          uint64_t v10 = v9;
          id v11 = v8;

          uint64_t v4 = v11;
          uint64_t v6 = v10;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __STUIStatusBarGetPriorityComparator_block_invoke()
{
  uint64_t v0 = (void *)STUIStatusBarGetPriorityComparator_priorityComparator;
  STUIStatusBarGetPriorityComparator_priorityComparator = (uint64_t)&__block_literal_global_3;
}

void ___privateFrameworksHaveModifications_block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = BSPathForSystemDirectory();
  id v1 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v2 = [v0 stringByAppendingPathComponent:@"Frameworks"];
  uint64_t v3 = [v1 fileURLWithPath:v2 isDirectory:1];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = [v0 stringByAppendingPathComponent:@"PrivateFrameworks"];
  uint64_t v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [&unk_1F2F9CB28 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(&unk_1F2F9CB28);
      }
      byte_1EC05EF69 = checkFramework(v3, *(void *)(*((void *)&v19 + 1) + 8 * v10));
      if (byte_1EC05EF69) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [&unk_1F2F9CB28 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (!byte_1EC05EF69)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v11 = [&unk_1F2F9CB40 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
LABEL_13:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(&unk_1F2F9CB40);
          }
          byte_1EC05EF69 = checkFramework(v6, *(void *)(*((void *)&v15 + 1) + 8 * v14));
          if (byte_1EC05EF69) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [&unk_1F2F9CB40 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v12) {
              goto LABEL_13;
            }
            break;
          }
        }
      }
    }
  }
}

BOOL checkFramework(void *a1, uint64_t a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 URLByAppendingPathComponent:a2];
  uint64_t v3 = [v2 URLByAppendingPathExtension:@"framework"];

  uint64_t v5 = *MEMORY[0x1E4F1C528];
  v15[0] = *MEMORY[0x1E4F1C540];
  uint64_t v4 = v15[0];
  v15[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v7 = [v3 resourceValuesForKeys:v6 error:0];

  uint64_t v8 = [v7 objectForKeyedSubscript:v4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v5];
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    BOOL v13 = 0;
  }
  else
  {
    [v9 timeIntervalSinceDate:v8];
    BOOL v13 = v12 > 60.0;
  }

  return v13;
}

void sub_1D7EC835C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

__CFString *_STUIStringFromUILegibilityStyle(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown _UILegibilityStyle #%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6AA5188[a1];
  }
  return v1;
}

__CFString *_STUIStringFromStatusBarLegacyStyle(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown UIStatusBarStyle #%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6AA51A0[a1];
  }
  return v1;
}

uint64_t sub_1D7EC9E20()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1D7EC9E30()
{
  return MEMORY[0x1F40E3340]();
}

uint64_t sub_1D7EC9E40()
{
  return MEMORY[0x1F40E3358]();
}

uint64_t sub_1D7EC9E50()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1D7EC9E60()
{
  return MEMORY[0x1F40E3908]();
}

uint64_t sub_1D7EC9E70()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1D7EC9E80()
{
  return MEMORY[0x1F40E3978]();
}

uint64_t sub_1D7EC9E90()
{
  return MEMORY[0x1F40E3990]();
}

uint64_t sub_1D7EC9EA0()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_1D7EC9EB0()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1D7EC9EC0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1D7EC9ED0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D7EC9EE0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1D7EC9EF0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D7EC9F00()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1D7EC9F10()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D7EC9F20()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1D7EC9F30()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1D7EC9F40()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1D7EC9F50()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1D7EC9F60()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1D7EC9F70()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1D7EC9F80()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1D7EC9F90()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1D7EC9FA0()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1D7EC9FB0()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1D7EC9FC0()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1D7EC9FD0()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1D7EC9FE0()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1D7EC9FF0()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1D7ECA000()
{
  return MEMORY[0x1F40F7E50]();
}

uint64_t sub_1D7ECA010()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1D7ECA020()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_1D7ECA030()
{
  return MEMORY[0x1F40F88C8]();
}

uint64_t sub_1D7ECA040()
{
  return MEMORY[0x1F40F88D8]();
}

uint64_t sub_1D7ECA050()
{
  return MEMORY[0x1F40F8930]();
}

uint64_t sub_1D7ECA060()
{
  return MEMORY[0x1F40F8C38]();
}

uint64_t sub_1D7ECA090()
{
  return MEMORY[0x1F40F9570]();
}

uint64_t sub_1D7ECA0A0()
{
  return MEMORY[0x1F40F9588]();
}

uint64_t sub_1D7ECA0B0()
{
  return MEMORY[0x1F40F9688]();
}

uint64_t sub_1D7ECA0C0()
{
  return MEMORY[0x1F40F9690]();
}

uint64_t sub_1D7ECA0D0()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1D7ECA0E0()
{
  return MEMORY[0x1F40F9A60]();
}

uint64_t sub_1D7ECA0F0()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1D7ECA100()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1D7ECA110()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1D7ECA120()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1D7ECA130()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1D7ECA140()
{
  return MEMORY[0x1F40F9CB8]();
}

uint64_t sub_1D7ECA150()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1D7ECA160()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1D7ECA170()
{
  return MEMORY[0x1F40F9E28]();
}

uint64_t sub_1D7ECA180()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1D7ECA190()
{
  return MEMORY[0x1F40FA028]();
}

uint64_t sub_1D7ECA1A0()
{
  return MEMORY[0x1F40FA038]();
}

uint64_t sub_1D7ECA1B0()
{
  return MEMORY[0x1F40FA040]();
}

uint64_t sub_1D7ECA1C0()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1D7ECA1D0()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1D7ECA1E0()
{
  return MEMORY[0x1F40FB198]();
}

uint64_t sub_1D7ECA1F0()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1D7ECA200()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1D7ECA210()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1D7ECA220()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1D7ECA230()
{
  return MEMORY[0x1F40FB910]();
}

uint64_t sub_1D7ECA240()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1D7ECA250()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_1D7ECA260()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_1D7ECA270()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_1D7ECA280()
{
  return MEMORY[0x1F40FC370]();
}

uint64_t sub_1D7ECA290()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_1D7ECA2A0()
{
  return MEMORY[0x1F40FC3A8]();
}

uint64_t sub_1D7ECA2B0()
{
  return MEMORY[0x1F40FC3C0]();
}

uint64_t sub_1D7ECA2C0()
{
  return MEMORY[0x1F40FC3E0]();
}

uint64_t sub_1D7ECA2D0()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1D7ECA2E0()
{
  return MEMORY[0x1F40FC408]();
}

uint64_t sub_1D7ECA2F0()
{
  return MEMORY[0x1F40FC428]();
}

uint64_t sub_1D7ECA300()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1D7ECA310()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1D7ECA320()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1D7ECA330()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1D7ECA340()
{
  return MEMORY[0x1F40FC780]();
}

uint64_t sub_1D7ECA350()
{
  return MEMORY[0x1F40FC838]();
}

uint64_t sub_1D7ECA360()
{
  return MEMORY[0x1F40FC840]();
}

uint64_t sub_1D7ECA370()
{
  return MEMORY[0x1F40FC860]();
}

uint64_t sub_1D7ECA380()
{
  return MEMORY[0x1F40FC8A0]();
}

uint64_t sub_1D7ECA390()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1D7ECA3A0()
{
  return MEMORY[0x1F40FC930]();
}

uint64_t sub_1D7ECA3B0()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_1D7ECA3C0()
{
  return MEMORY[0x1F40FC950]();
}

uint64_t sub_1D7ECA3D0()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1D7ECA3E0()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1D7ECA400()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1D7ECA410()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_1D7ECA420()
{
  return MEMORY[0x1F40FCE08]();
}

uint64_t sub_1D7ECA430()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D7ECA440()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D7ECA450()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D7ECA460()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D7ECA470()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D7ECA480()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D7ECA490()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D7ECA4A0()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1D7ECA4B0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D7ECA4C0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D7ECA4D0()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1D7ECA4E0()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1D7ECA4F0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D7ECA500()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1D7ECA510()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1D7ECA520()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D7ECA530()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D7ECA540()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1D7ECA550()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D7ECA560()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D7ECA570()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D7ECA580()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1F410C398]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSPathForSystemDirectory()
{
  return MEMORY[0x1F410C4C8]();
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

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
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

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
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
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1F40DF330]();
}

uint64_t CTFontGetUIFontDesign()
{
  return MEMORY[0x1F40DF590]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t STSystemStatusLogBundleLoading()
{
  return MEMORY[0x1F415CB28]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4166B88]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
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
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIRectFill(CGRect rect)
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

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
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

uint64_t _StatusBar_UIBlockBasedCAAction()
{
  return MEMORY[0x1F4166F38]();
}

uint64_t _StatusBar_UIGetAnimationCurveSpline()
{
  return MEMORY[0x1F4166F40]();
}

uint64_t _StatusBar_UIGetDurationOfSpringAnimation()
{
  return MEMORY[0x1F4166F48]();
}

uint64_t _StatusBar_UITimeSizeForLabel()
{
  return MEMORY[0x1F4166F50]();
}

uint64_t _UIStatusBarHostedInSpringBoard()
{
  return MEMORY[0x1F4167098]();
}

uint64_t _UIStatusBarResolvedStyleFromStyle()
{
  return MEMORY[0x1F41670A0]();
}

uint64_t _UIStatusBarStyleFromLegibilityStyle()
{
  return MEMORY[0x1F41670A8]();
}

uint64_t _UIStatusBarStyleFromResolvedStyle()
{
  return MEMORY[0x1F41670B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814E0](cls, protocol);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}