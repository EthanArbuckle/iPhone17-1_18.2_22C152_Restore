void sub_100004854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000048B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePointerViewCornerCurve];
}

void sub_1000048F0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (unsigned __int8 *)WeakRetained;
    [WeakRetained[16] presentationValue];
    id WeakRetained = (id *)v8;
    int v2 = v8[144];
    int v4 = v3 > 0.0;
    v8[144] = v4;
    if (v2 != v4)
    {
      v5 = [v8 delegate];
      char v6 = objc_opt_respondsToSelector();

      id WeakRetained = (id *)v8;
      if (v6)
      {
        v7 = [v8 delegate];
        [v7 pointerShapeViewVisibilityDidChange:v8];

        id WeakRetained = (id *)v8;
      }
    }
  }
}

id sub_1000049B4(uint64_t a1, void *a2, const void *a3)
{
  [a2 _handleAccessibilityPointerPreferencesDidChange];
  id result = (id)CFEqual(a3, kAXSZoomTouchEnabledNotification);
  if (result)
  {
    return [a2 _axRegisterForZoomUpdatesIfNecessary];
  }
  return result;
}

void sub_1000051B4(uint64_t a1, void *a2)
{
  double v3 = a2;
  id v4 = [*(id *)(a1 + 32) shapeType];
  v5 = *(void **)(a1 + 40);
  if (v4 == (id)4)
  {
    [v5 _beginRequiringShapeMorphingViewForReason:@"CustomShape"];
    char v6 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [*(id *)(a1 + 32) path]);
    objc_msgSend(v6, "setUsesEvenOddFillRule:", objc_msgSend(*(id *)(a1 + 32), "usesEvenOddFillRule"));
    v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v9 = v3[2](v3, @"shapeMorphing");
    [v7 _setShapeMorphingViewPath:v6 animated:v8 completion:v9];
  }
  else
  {
    [v5 expectedShapeBoundsForPointerShape:*(void *)(a1 + 32)];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [*(id *)(a1 + 40) _cornerRadiusForPointerShape:*(void *)(a1 + 32)];
    v19 = *(void **)(a1 + 40);
    if (v19[4])
    {
      v20 = objc_msgSend(v19, "_bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, v18);
      v21 = *(void **)(a1 + 40);
      uint64_t v22 = *(unsigned __int8 *)(a1 + 48);
      v23 = v3[2](v3, @"shapeMorphing");
      [v21 _setShapeMorphingViewPath:v20 animated:v22 completion:v23];
    }
    else
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000054CC;
      v30[3] = &unk_1000449F8;
      v30[4] = v19;
      double v32 = v11;
      double v33 = v13;
      double v34 = v15;
      double v35 = v17;
      double v36 = v18;
      id v31 = *(id *)(a1 + 32);
      v24 = objc_retainBlock(v30);
      if (*(unsigned char *)(a1 + 48))
      {
        ++*(void *)(*(void *)(a1 + 40) + 104);
        v25 = v3[2](v3, @"pointerViewAnimations");
        v26 = [*(id *)(*(void *)(a1 + 40) + 96) standardShapeAnimationSettings];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100005564;
        v28[3] = &unk_100044A20;
        v28[4] = *(void *)(a1 + 40);
        id v29 = v25;
        id v27 = v25;
        +[UIView _animateUsingSpringBehavior:v26 tracking:0 animations:v24 completion:v28];
      }
      else
      {
        +[UIView _performWithoutRetargetingAnimations:v24];
      }
    }
    [*(id *)(a1 + 40) _endRequiringShapeMorphingViewForReason:@"CustomShape"];
  }
}

id sub_1000054CC(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 16) layer];
  [v2 setCornerRadius:*(double *)(a1 + 80)];

  double v3 = *(void **)(*(void *)(a1 + 32) + 120);
  [v3 value];
  [v3 setValue:1.0 - v4];
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _applyAXPointerStyleForPointerShape:v6];
}

uint64_t sub_100005564(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000558C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100005D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100005D98(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [WeakRetained _endRequiringShapeMorphingViewForReason:*(void *)(a1 + 32)];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, a2, a2 ^ 1);
  }
  return _objc_release_x1();
}

void sub_1000064A8(id a1)
{
  +[CALayer cornerCurveExpansionFactor:kCACornerCurveContinuous];
  qword_1000558C0 = v1;
}

BOOL sub_100006D4C(id a1, CAFilter *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v5 = [(CAFilter *)a2 name];
  unsigned int v6 = [v5 isEqualToString:@"InvertColorsDoubleInvert"];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

void sub_1000070AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

uint64_t sub_1000070F0(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    [WeakRetained _axPointerZoomScaleFactor];
    if (vabdd_f64(v2, v4[9]) > 0.00000011920929)
    {
      v4[9] = v2;
      if (!_AXSPointerScaleWithZoomLevelEnabled()) {
        [v4 _handleAccessibilityPointerPreferencesDidChange];
      }
    }
  }
  return _objc_release_x1();
}

void sub_100007178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [sub_100007C98() sharedInstance];
    double v2 = [v1 zoomPreferredCurrentLensMode];
    double v3 = sub_100007F14();
    WeakRetained[80] = [v2 isEqualToString:v3];
  }
}

uint64_t sub_10000745C()
{
  uint64_t v2 = 0;
  double v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100055FF0;
  uint64_t v5 = qword_100055FF0;
  if (!qword_100055FF0)
  {
    long long v6 = *(_OWORD *)off_100044B78;
    long long v7 = *(_OWORD *)&off_100044B88;
    v3[3] = _sl_dlopen();
    qword_100055FF0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_10000756C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007584(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055FF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007614()
{
  uint64_t v1 = 0;
  uint64_t result = sub_10000745C();
  if (!result) {
    sub_100027FA4(&v1);
  }
  return result;
}

id sub_100007668()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100055FF8;
  uint64_t v7 = qword_100055FF8;
  if (!qword_100055FF8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000774C;
    v3[3] = &unk_100044BC8;
    v3[4] = &v4;
    sub_10000774C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100007734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000774C(uint64_t a1)
{
  sub_100007614();
  Class result = objc_getClass("ZoomServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100028024();
  }
  qword_100055FF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000077A4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100056000;
  uint64_t v6 = qword_100056000;
  if (!qword_100056000)
  {
    id v1 = (void *)sub_100007614();
    v4[3] = (uint64_t)dlsym(v1, "ZWAttributeKeyZoomLevel");
    qword_100056000 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000787C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007894(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100007614();
  Class result = dlsym(v2, "ZWAttributeKeyZoomLevel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100056000 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1000078E4()
{
  uint64_t v0 = (void **)sub_1000077A4();
  if (!v0) {
    sub_1000280A0();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_100007918()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100056008;
  uint64_t v6 = qword_100056008;
  if (!qword_100056008)
  {
    id v1 = (void *)sub_100007614();
    v4[3] = (uint64_t)dlsym(v1, "ZWAttributeKeyInStandbyMode");
    qword_100056008 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000079F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007A08(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100007614();
  Class result = dlsym(v2, "ZWAttributeKeyInStandbyMode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100056008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007A58()
{
  uint64_t v0 = (void **)sub_100007918();
  if (!v0) {
    sub_100028118();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_100007A8C()
{
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100056010;
  uint64_t v5 = qword_100056010;
  if (!qword_100056010)
  {
    long long v6 = *(_OWORD *)off_100044BE8;
    long long v7 = *(_OWORD *)&off_100044BF8;
    v3[3] = _sl_dlopen();
    qword_100056010 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100007B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007BB4(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100056010 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007C44()
{
  id v1 = 0;
  uint64_t result = sub_100007A8C();
  if (!result) {
    sub_100028190(&v1);
  }
  return result;
}

id sub_100007C98()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100056018;
  uint64_t v7 = qword_100056018;
  if (!qword_100056018)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100007D7C;
    v3[3] = &unk_100044BC8;
    v3[4] = &v4;
    sub_100007D7C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100007D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100007D7C(uint64_t a1)
{
  sub_100007C44();
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100028210();
  }
  qword_100056018 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007DD4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100056020;
  uint64_t v6 = qword_100056020;
  if (!qword_100056020)
  {
    id v1 = (void *)sub_100007C44();
    v4[3] = (uint64_t)dlsym(v1, "AXZoomLensModeWindowAnchored");
    qword_100056020 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007EC4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100007C44();
  Class result = dlsym(v2, "AXZoomLensModeWindowAnchored");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100056020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007F14()
{
  uint64_t v0 = (void **)sub_100007DD4();
  if (!v0) {
    sub_10002828C();
  }
  id v1 = *v0;
  return v1;
}

id sub_10000825C(uint64_t a1, void *a2)
{
  return [a2 _handleAccessibilityPointerSizePreferencesDidChange];
}

void sub_1000086B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_10000870C(id *a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] mutableCopy];
  uint64_t v5 = v4;
  if (a2 != 2) {
    a2 = a2 == 1;
  }
  [v4 setPreferredPointerMaterialLuminance:a2];
  PSIntensityForLuminanceAndUsage();
  objc_msgSend(v5, "setPointerVisualIntensity:");
  [a1[5] setActiveHoverRegion:v5];
  if (WeakRetained)
  {
    id v6 = (id)WeakRetained[16];
    id v7 = objc_loadWeakRetained(a1 + 7);

    if (v6 == v7) {
      [WeakRetained _updatePointerWithOptions:0 updateHandlerCollection:0];
    }
  }
}

BOOL sub_100008A04(id a1, PUIDPointerClient *a2, PUIDSourceHandlesDisplayChangesGracefully *a3)
{
  return 1;
}

void sub_100008AA4(uint64_t a1)
{
}

id sub_1000090E0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!v2)
  {
    BKSHIDEventGetPointerAttributes();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v3 = [v2 source];

  return v3;
}

void sub_1000093C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000093DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (sub_1000090E0(*((void *)WeakRetained + 9), *((void **)WeakRetained + 10)) == 11 && !v3[291]) {
      [v3 _performRecenteringForActiveFocusRegion];
    }
  }
  return _objc_release_x1();
}

id sub_1000099A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustDecelerationTargetForProjectedPosition:liftOffPointerPosition:pointerVelocity:hitTestContexts:locationsInsideHitTestContexts:projectedDisplayContext:withLookupGenerationID:", a2, a3, *(void *)(*(void *)(a1 + 32) + 48), *(void *)(a1 + 88), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

id *sub_100009C48(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)objc_msgSend(result[4], "_adjustDecelerationTargetForProjectedPosition:liftOffPointerPosition:pointerVelocity:hitTestContexts:locationsInsideHitTestContexts:projectedDisplayContext:withLookupGenerationID:", result[5], result[6], result[7], result[14], *((double *)result + 8), *((double *)result + 9), *((double *)result + 10), *((double *)result + 11), *((double *)result + 12), *((double *)result + 13));
  }
  return result;
}

void sub_10000A084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A0B0(uint64_t a1, double a2, double a3)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 64));
  double v15 = WeakRetained;
  if (WeakRetained && WeakRetained[17] == *(void *)(a1 + 72) && (BSPointEqualToPoint() & 1) == 0)
  {
    id v9 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", objc_msgSend(*(id *)(a1 + 32), "contextID"), a2, a3);
    LODWORD(v10) = [*(id *)(a1 + 40) pid];
    double v11 = sub_100011504(*(id **)(a1 + 48));
    unsigned int v12 = [v11 pid];

    if (v10 == v12) {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v10 = v10;
    }
    double v13 = +[BKSMousePointerService sharedInstance];
    double v14 = sub_1000113C0(v15[6]);
    [v13 setContextRelativePointerPosition:v9 withInitialVelocity:0 onDisplay:v14 withDecelerationRate:v10 restrictingToPID:*(double *)(a1 + 96)];

    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v7);
  }
}

BOOL sub_10000A85C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if (IOHIDEventGetType() != 17)
  {
LABEL_19:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  if (v4)
  {
    if (([v4 options] & 0x400) != 0)
    {
LABEL_20:
      BOOL v7 = 1;
      goto LABEL_21;
    }
    [v4 acceleratedRelativePositionX];
    if (BSFloatIsZero())
    {
      [v4 acceleratedRelativePositionY];
      int v5 = BSFloatIsZero() ^ 1;
      if (!a3) {
        goto LABEL_12;
      }
    }
    else
    {
      int v5 = 1;
      if (!a3) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    int v5 = 0;
    if (!a3) {
      goto LABEL_12;
    }
  }
  if (!v5)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    int v5 = IntegerValue != IOHIDEventGetIntegerValue();
  }
LABEL_12:
  BOOL v7 = v5 != 0;
  if (!v5)
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v9 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        CFIndex v11 = Count;
        CFIndex v12 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v9, v12);
          unsigned int v13 = IOHIDEventGetType() - 2;
          if (v13 < 6 && ((0x3Du >> v13) & 1) != 0) {
            goto LABEL_20;
          }
          if (v11 == ++v12) {
            goto LABEL_19;
          }
        }
      }
    }
    goto LABEL_19;
  }
LABEL_21:

  return v7;
}

BOOL sub_10000A99C(void *a1)
{
  id v1 = [a1 hitTestContexts];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

CFArrayRef sub_10000A9D8()
{
  if (IOHIDEventGetType() != 17) {
    return 0;
  }
  CFArrayRef result = (const __CFArray *)IOHIDEventGetChildren();
  if (!result) {
    return result;
  }
  CFArrayRef v1 = result;
  CFIndex Count = CFArrayGetCount(result);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFArrayGetValueAtIndex(v1, v4);
    if (IOHIDEventGetType() == 11) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return (const __CFArray *)(IOHIDEventGetIntegerValue() & 1);
}

uint64_t sub_10000AA74()
{
  if (IOHIDEventGetType() != 17) {
    return 0;
  }
  uint64_t result = IOHIDEventGetChildren();
  if (!result) {
    return result;
  }
  CFArrayRef v1 = (const __CFArray *)result;
  CFIndex Count = CFArrayGetCount((CFArrayRef)result);
  CFIndex v3 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = 0;
  do
  {
    CFArrayGetValueAtIndex(v1, v4);
    BOOL v5 = IOHIDEventGetType() == 11;
    uint64_t result = v5;
    BOOL v5 = v5 || v3 == v4++;
  }
  while (!v5);
  return result;
}

void sub_10000AC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AC48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[291])
  {
    BOOL v2 = WeakRetained;
    [WeakRetained _unhidePointerForReason:@"provisional unhide after delay"];
    [v2 _startProvisionalPromotionTimer];
    id WeakRetained = v2;
    v2[292] = 1;
  }
}

void sub_10000AE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AE1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 291))
  {
    *((unsigned char *)WeakRetained + 292) = 0;
    CFIndex v3 = PSLogAutohide();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFIndex v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Promoting to visible based on touch duration", v4, 2u);
    }
  }
}

void sub_10000B04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B068(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v4 = [WeakRetained isActiveOnMainDisplay];

  if (v4)
  {
    int v5 = *(_DWORD *)(a1 + 40);
    CFStringRef v6 = @"autohide after delay for unknown source";
    if (v5 == 11) {
      CFStringRef v6 = @"autohide after delay for mouse";
    }
    if (v5 == 12) {
      CFStringRef v7 = @"autohide after delay for trackpad";
    }
    else {
      CFStringRef v7 = v6;
    }
    id v9 = objc_loadWeakRetained(v2);
    [v9 _hidePointerForReason:v7];
  }
  else
  {
    uint64_t v8 = PSLogAutohide();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Timer fired while not on main display, pointer not hiding", buf, 2u);
    }
  }
}

void sub_10000B288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B2AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[320] = 0;
  }
}

id *sub_10000B558(id *result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return (id *)[result[4] _invalidateHoverRegionsForAllPointerClientsExcludingPointerClient:0 hoverRegion:0];
  }
  return result;
}

void sub_10000BBF8(uint64_t a1, _OWORD *a2)
{
  if ([*(id *)(a1 + 32) hoverRegionGenerationID] == *(id *)(a1 + 64))
  {
    unsigned int v4 = *(void **)(a1 + 32);
    long long v5 = a2[5];
    v14[4] = a2[4];
    v14[5] = v5;
    long long v6 = a2[7];
    v14[6] = a2[6];
    v14[7] = v6;
    long long v7 = a2[1];
    v14[0] = *a2;
    v14[1] = v7;
    long long v8 = a2[3];
    v14[2] = a2[2];
    v14[3] = v8;
    [v4 setTransformFromClientContextToDisplay:v14];
    [*(id *)(a1 + 32) setActiveHoverRegion:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setPreviousPointerEventActiveHoverRegionHitTestState:0];
    [*(id *)(a1 + 32) invalidateAutomaticRegionExitTimer];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000BDA8;
    v13[3] = &unk_100044DA0;
    v13[4] = *(void *)(a1 + 48);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000BE78;
    v11[3] = &unk_100044A70;
    id v12 = *(id *)(a1 + 56);
    +[SBC2GroupCompletion perform:v13 finalCompletion:v11];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      id v10 = +[NSError errorWithDomain:@"PUIDPointerControllerErrorDomain" code:-5003 userInfo:0];
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    }
  }
}

void sub_10000BDA8(uint64_t a1, void *a2)
{
  CFIndex v3 = a2;
  long long v6 = objc_alloc_init(PUIDPointerStateUpdateHandlerCollection);
  unsigned int v4 = v3[2](v3, @"portalSourceTransition");
  [(PUIDPointerStateUpdateHandlerCollection *)v6 setPortalSourceTransitionCompletion:v4];

  long long v5 = v3[2](v3, @"contentMatchMoveSource");

  [(PUIDPointerStateUpdateHandlerCollection *)v6 setContentMatchMoveSourceTransitionCompletion:v5];
  [*(id *)(a1 + 32) _updatePointerWithOptions:0 updateHandlerCollection:v6];
}

uint64_t sub_10000BE78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

id sub_10000D3A4(id a1, NSNumber *a2)
{
  [(NSNumber *)a2 integerValue];
  return (id)PSPointerAutohideReasonToString();
}

id sub_10000D554(id a1, NSNumber *a2)
{
  NSInteger v2 = [(NSNumber *)a2 integerValue];
  return (id)_PSPointerForceVisibleReasonToString(v2);
}

BOOL sub_10000D830(id a1, PUIDPointerClient *a2, PUIDSourceHandlesDisplayChangesGracefully *a3)
{
  return [(PUIDSourceHandlesDisplayChangesGracefully *)a3 shouldBeInvalidatedIfPointerLeavesDisplay];
}

void sub_10000DCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000DCE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePeriodicRefreshTimerAction];
}

void sub_10000DE98(void *a1, long long *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DF58;
  block[3] = &unk_100044E70;
  long long v2 = a2[5];
  long long v13 = a2[4];
  long long v14 = v2;
  long long v3 = a2[7];
  long long v15 = a2[6];
  long long v16 = v3;
  long long v4 = a2[1];
  long long v9 = *a2;
  long long v10 = v4;
  long long v5 = a2[3];
  long long v11 = a2[2];
  long long v12 = v5;
  long long v6 = (void *)a1[5];
  uint64_t v17 = a1[6];
  block[4] = a1[4];
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10000DF58(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&a.m31 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&a.m33 = v2;
  long long v3 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&a.m41 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&a.m43 = v3;
  long long v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&a.m11 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&a.m13 = v4;
  long long v5 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&a.m21 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&a.m23 = v5;
  memset(&b, 0, sizeof(b));
  if (CATransform3DEqualToTransform(&a, &b))
  {
    long long v12 = +[NSAssertionHandler currentHandler];
    uint64_t v13 = *(void *)(a1 + 176);
    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = +[NSString stringWithFormat:@"setting value received from BKSHIDServicesGetCALayerTransform()"];
    [v12 handleFailureInMethod:v13, v14, @"PUIDPointerController.m", 1649, @"invalid transform (all 0s) from: %@", v15 object file lineNumber description];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v7 = *(uint64_t (**)(uint64_t, CATransform3D *))(result + 16);
    long long v8 = *(_OWORD *)(a1 + 128);
    *(_OWORD *)&a.m31 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)&a.m33 = v8;
    long long v9 = *(_OWORD *)(a1 + 160);
    *(_OWORD *)&a.m41 = *(_OWORD *)(a1 + 144);
    *(_OWORD *)&a.m43 = v9;
    long long v10 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&a.m11 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&a.m13 = v10;
    long long v11 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)&a.m21 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&a.m23 = v11;
    return v7(result, &a);
  }
  return result;
}

void sub_10000E684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E6A8(uint64_t a1, _OWORD *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((*(void *)(a1 + 48) || WeakRetained[299])
      && [*(id *)(a1 + 32) hoverRegionGenerationID] == *(id *)(a1 + 56))
    {
      long long v6 = *(void **)(a1 + 32);
      if (v6) {
        [v6 transformFromClientContextToDisplay];
      }
      else {
        memset(&a, 0, sizeof(a));
      }
      long long v7 = a2[5];
      *(_OWORD *)&v16.m31 = a2[4];
      *(_OWORD *)&v16.m33 = v7;
      long long v8 = a2[7];
      *(_OWORD *)&v16.m41 = a2[6];
      *(_OWORD *)&v16.m43 = v8;
      long long v9 = a2[1];
      *(_OWORD *)&v16.m11 = *a2;
      *(_OWORD *)&v16.m13 = v9;
      long long v10 = a2[3];
      *(_OWORD *)&v16.m21 = a2[2];
      *(_OWORD *)&v16.m23 = v10;
      if (!CATransform3DEqualToTransform(&a, &v16))
      {
        long long v11 = *(void **)(a1 + 32);
        long long v12 = a2[5];
        *(_OWORD *)&v16.m31 = a2[4];
        *(_OWORD *)&v16.m33 = v12;
        long long v13 = a2[7];
        *(_OWORD *)&v16.m41 = a2[6];
        *(_OWORD *)&v16.m43 = v13;
        long long v14 = a2[1];
        *(_OWORD *)&v16.m11 = *a2;
        *(_OWORD *)&v16.m13 = v14;
        long long v15 = a2[3];
        *(_OWORD *)&v16.m21 = a2[2];
        *(_OWORD *)&v16.m23 = v15;
        [v11 setTransformFromClientContextToDisplay:&v16];
        [v5 _updatePointerWithOptions:0 updateHandlerCollection:0];
      }
    }
    if (*((void *)v5 + 30) == 2) {
      *((void *)v5 + 30) = 0;
    }
    *((unsigned char *)v5 + 298) = 0;
    if (*((unsigned char *)v5 + 299) && !*((void *)v5 + 35)) {
      [v5 _beginPeriodicClientTransformRefreshTimer];
    }
  }
}

void sub_10000EDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_10000EE0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000EE1C(uint64_t a1)
{
}

void sub_10000EE24(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  long long v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v7];
  if (!v6)
  {
    long long v6 = +[NSMutableSet set];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v6 forKey:v7];
  }
  [v6 addObject:v5];
}

void sub_10000EEDC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  long long v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v7];
  if (!v6)
  {
    long long v6 = +[NSMutableSet set];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v6 forKey:v7];
  }
  [v6 addObject:v5];
}

void sub_100010940(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x330]);
  _Unwind_Resume(a1);
}

void sub_10001098C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 30) != 1)
  {
    [v5 invalidateAutomaticRegionExitTimer];
    [v5 setActiveHoverRegion:0];
    [v4 _updatePointerWithOptions:0 updateHandlerCollection:0];
  }
}

uint64_t sub_100010A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = PSLogMaterial();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000283D4(v6);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 297) = 0;
  [*(id *)(a1 + 32) _updatePointerWithOptions:0 updateHandlerCollection:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

void sub_100010AA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 300) = 0;
    CFArrayRef v1 = (void *)*((void *)WeakRetained + 28);
    *((void *)WeakRetained + 28) = 0;

    if (*((void *)WeakRetained + 9))
    {
      int v2 = IOHIDEventGetIntegerValue() != 0;
      if (v2 == [*((id *)WeakRetained + 15) isPressed]) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if ([*((id *)WeakRetained + 15) isPressed]) {
LABEL_4:
    }
      [WeakRetained _updatePointerWithOptions:0 updateHandlerCollection:0];
  }
LABEL_5:
}

uint64_t sub_100010CDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BKSHIDServicesGetCALayerTransform();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(v1 + 16))(v1, &v3);
}

void sub_100011104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100011120(uint64_t a1)
{
  objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return _objc_release_x1();
}

id sub_1000113C0(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v2 = [WeakRetained hardwareIdentifier];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

id *sub_100011418(id *result)
{
  if (result) {
    return (id *)[result[3] _contextId];
  }
  return result;
}

id *sub_100011428(id *result)
{
  if (result) {
    return (id *)[result[5] _contextId];
  }
  return result;
}

double sub_100011438@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    uint64_t v3 = [*(id *)(a1 + 24) screen];
    memset(&v10, 0, sizeof(v10));
    [v3 _rotation];
    CGAffineTransformMakeRotation(&v9, -v4);
    UIIntegralTransform();
    [v3 scale];
    CGAffineTransform v7 = v10;
    CGAffineTransformScale(&m, &v7, v5, v5);
    CGAffineTransform v10 = m;
    CATransform3DMakeAffineTransform((CATransform3D *)a2, &m);
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

id sub_100011504(id *a1)
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 9);
    id v1 = [WeakRetained systemPointerInteractionContextForDisplayContext:v1];
  }
  return v1;
}

id *sub_10001155C(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

id *sub_10001158C(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = sub_100011504(a1);
    if (v2)
    {
      uint64_t v1 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained(v1 + 9);
      uint64_t v1 = [WeakRetained overridingHoverRegionClientsForDisplayContext:v1];
    }
  }
  return v1;
}

id sub_1000116EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v4 = [v2 appendObject:WeakRetained withName:@"display"];

  id v5 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"pointerRenderingController"];
  long long v6 = *(void **)(a1 + 32);
  CGAffineTransform v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "puid_description");
  id v8 = [v6 appendObject:v7 withName:@"pointerRenderingWindow"];

  id v9 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"systemPointerRenderingController"];
  CGAffineTransform v10 = *(void **)(a1 + 32);
  long long v11 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "puid_description");
  id v12 = [v10 appendObject:v11 withName:@"systemPointerWindow"];

  id v13 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"pointerEventStream"];
  id v14 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"touchStream"];
  return [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"systemPointerClient"];
}

id *sub_100011838(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

uint64_t sub_100011874(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t sub_10001188C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t sub_1000118A4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t sub_1000118BC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

uint64_t sub_1000118D4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

uint64_t sub_1000118EC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

uint64_t sub_100011904(uint64_t result)
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

id *sub_10001191C(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 9, a2);
  }
  return result;
}

void sub_100012074(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = +[PSPointerClientDefaultServiceSpecification domainName];
  [v5 setDomain:v3];

  id v4 = +[PSPointerClientDefaultServiceSpecification serviceName];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

void sub_100012114(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = +[PSPointerClientDefaultLaunchingServiceSpecification domainName];
  [v5 setDomain:v3];

  id v4 = +[PSPointerClientDefaultLaunchingServiceSpecification serviceName];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

void sub_1000122CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nonLaunchingServiceConnectionForPointerClient:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    long long v11 = [v2 remoteTarget];
    id v4 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    id v5 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    long long v6 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 112)];
    CGAffineTransform v7 = +[NSNumber numberWithDouble:*(double *)(a1 + 88)];
    id v8 = +[NSNumber numberWithDouble:*(double *)(a1 + 96)];
    id v9 = +[NSNumber numberWithDouble:*(double *)(a1 + 104)];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000124D8;
    v15[3] = &unk_100045028;
    CGAffineTransform v10 = &v16;
    id v16 = *(id *)(a1 + 48);
    [v11 adjustedDecelerationTargetPointerPosition:v4 velocity:v5 inContextID:v6 cursorRegionLookupRadius:v7 cursorRegionLookupResolution:v8 lookupConeAngle:v9 completion:v15];

LABEL_5:
    goto LABEL_6;
  }
  if (*(void *)(a1 + 48))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012600;
    block[3] = &unk_100045050;
    CGAffineTransform v10 = &v13;
    id v13 = *(id *)(a1 + 48);
    long long v14 = *(_OWORD *)(a1 + 56);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    goto LABEL_5;
  }
LABEL_6:
}

void sub_1000124D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000125B4;
    block[3] = &unk_100045000;
    id v10 = *(id *)(a1 + 32);
    id v8 = v5;
    id v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_1000125B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "bs_CGPointValue");
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

void sub_100012600(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1001 userInfo:0];
  (*(void (**)(uint64_t, id, double, double))(v2 + 16))(v2, v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_10001276C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nonLaunchingServiceConnectionForPointerClient:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 remoteTarget];
    [v4 invalidatedPortalSourceCollections:*(void *)(a1 + 48) matchMoveSources:*(void *)(a1 + 56)];
  }
  else
  {
    id v4 = PSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - failed to find connection in order to invalidate sources", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100012BD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PSPointerClientDefaultServiceSpecification interface];
  [v3 setInterface:v4];

  uint64_t v5 = [[_PUIDXPCClientControllerTarget alloc] initWithConnection:*(void *)(a1 + 32) proxyInterface:*(void *)(a1 + 40)];
  [v3 setInterfaceTarget:v5];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 56)];
  int v6 = +[PSPointerClientDefaultServiceSpecification serviceQuality];
  [v3 setServiceQuality:v6];

  objc_initWeak(&location, *(id *)(a1 + 40));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100012D3C;
  long long v11 = &unk_1000450C8;
  objc_copyWeak(&v12, &location);
  uint64_t v7 = objc_retainBlock(&v8);
  objc_msgSend(v3, "setInterruptionHandler:", v7, v8, v9, v10, v11);
  [v3 setInvalidationHandler:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_100012D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012D3C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleDisconnectForNonLaunchingConnection:v5];
  }
}

void sub_100012DA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained xpcClientContextController:*(void *)(a1 + 32) didAddPointerClient:*(void *)(a1 + 40)];
}

void sub_100012DF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PSPointerClientDefaultLaunchingServiceSpecification interface];
  [v3 setInterface:v4];

  id v5 = [[_PUIDXPCClientControllerTarget alloc] initWithConnection:*(void *)(a1 + 32) proxyInterface:*(void *)(a1 + 40)];
  [v3 setInterfaceTarget:v5];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 56)];
  int v6 = +[PSPointerClientDefaultLaunchingServiceSpecification serviceQuality];
  [v3 setServiceQuality:v6];

  objc_initWeak(&location, *(id *)(a1 + 40));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100012F60;
  long long v11 = &unk_1000450C8;
  objc_copyWeak(&v12, &location);
  uint64_t v7 = objc_retainBlock(&v8);
  objc_msgSend(v3, "setInterruptionHandler:", v7, v8, v9, v10, v11);
  [v3 setInvalidationHandler:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_100012F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012F60(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleDisconnectForLaunchingConnection:v5];
  }
}

void sub_100012FC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained xpcClientContextController:*(void *)(a1 + 32) didAddPointerClient:*(void *)(a1 + 40)];
}

void sub_100013180(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  int v6 = [WeakRetained xpcClientContextController:v3 createPointerPortalSourceCollectionForDisplay:v4 client:v5 error:&v9];
  id v7 = v9;

  uint64_t v8 = a1[7];
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v6, v7);
  }
}

uint64_t sub_100013374(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained xpcClientContextController:a1[4] invalidatePointerPortalSourceCollection:a1[5] forClient:a1[6]];

  uint64_t result = a1[7];
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100013568(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(a1 + 32) integerValue];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  if (!v2)
  {
    long long v11 = 0;
LABEL_21:
    id v4 = 0;
    goto LABEL_22;
  }
  id v4 = 0;
  uint64_t v5 = v2;
  while (1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v25 = 0;
    id v9 = [WeakRetained xpcClientContextController:v6 createContentMatchMoveSourceForDisplay:v7 client:v8 error:&v25];
    id v10 = v25;
    long long v11 = v10;
    if (!v9) {
      break;
    }
    if (!v4) {
      id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v2];
    }
    [v4 addObject:v9];

    if (!--v5)
    {
      long long v11 = 0;
      goto LABEL_22;
    }
  }
  if (v10 && [v4 count])
  {
    id v12 = PSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = [v4 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v13;
      __int16 v29 = 2048;
      id v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - error creating match move sources, invlidating %lu source(s)", buf, 0x16u);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(WeakRetained, "xpcClientContextController:invalidateContentMatchMoveSource:forClient:", *(void *)(a1 + 40), *(void *)(*((void *)&v21 + 1) + 8 * (void)v19), *(void *)(a1 + 56), (void)v21);
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v17);
    }

    goto LABEL_21;
  }
LABEL_22:
  uint64_t v20 = *(void *)(a1 + 64);
  if (v20) {
    (*(void (**)(uint64_t, id, void *))(v20 + 16))(v20, v4, v11);
  }
}

void sub_100013920(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(WeakRetained, "xpcClientContextController:invalidateContentMatchMoveSource:forClient:", *(void *)(a1 + 32), *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), *(void *)(a1 + 48), (void)v9);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
}

void sub_100013BB0(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isNumericDataValid] & 1) != 0 || !*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    if (WeakRetained)
    {
      [WeakRetained xpcClientContextController:*(void *)(a1 + 40) didUpdateHoverRegion:*(void *)(a1 + 32) forClient:*(void *)(a1 + 48) transitionCompletion:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 56);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      }
    }
    _objc_release_x1();
  }
  else
  {
    uint64_t v2 = PSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100028418(v2);
    }

    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v4 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1003 userInfo:0];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
    }
  }
}

void sub_100013DEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "xpcClientContextController:autohidePointerForReason:forClient:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "integerValue"), *(void *)(a1 + 48));
}

void sub_100014030(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained xpcClientContextController:a1[4] setPointerPersistentlyHiddenForReasons:a1[5] forClient:a1[6]];
}

void sub_100014264(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained xpcClientContextController:a1[4] setPointerPersistentlyVisibleForReasons:a1[5] forClient:a1[6]];
}

void sub_10001440C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "xpcClientContextController:didSetSystemPointerInteractionContextID:display:forClient:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue"), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_1000145F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "xpcClientContextController:didSetOverridesHoverRegions:display:forClient:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_100014784(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "xpcClientContextController:setWantsServiceKeepAlive:forClient:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(void *)(a1 + 48));
}

void sub_100014884(uint64_t a1)
{
  uint64_t v2 = PSLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 _clientInteractionState];
    id v4 = PSPointerClientInteractionStateToString();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v3;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Client interaction state changing to %{public}@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "copy", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) remoteTarget];
        long long v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) _clientInteractionState]);
        [v10 clientInteractionStateDidChange:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void sub_100014ADC(uint64_t a1)
{
  uint64_t v2 = PSLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 _pointerVisibilityState];
    id v4 = PSPointerVisibilityStateToString();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v3;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Pointer visibility state finished changing to %{public}@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "copy", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) remoteTarget];
        long long v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) _pointerVisibilityState]);
        [v10 pointerVisibilityStateDidChange:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void sub_100014D74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained xpcClientContextController:*(void *)(a1 + 32) didRemovePointerClient:*(void *)(a1 + 40)];
}

void sub_100014EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained xpcClientContextController:*(void *)(a1 + 32) didRemovePointerClient:*(void *)(a1 + 40)];
}

void sub_1000154BC(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained createPointerPortalSourceCollectionForDisplay:a1[5] completion:a1[6]];
}

void sub_1000155D0(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained invalidatePointerPortalSourceCollection:a1[5] completion:a1[6]];
}

void sub_100015704(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained createContentMatchMoveSourcesForDisplay:a1[5] countValue:a1[6] completion:a1[7]];
}

void sub_10001581C(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained invalidateContentMatchMoveSources:a1[5] completion:a1[6]];
}

void sub_100015930(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained setActiveHoverRegion:a1[5] transitionCompletion:a1[6]];
}

void sub_100015A18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained autohidePointerForReason:*(void *)(a1 + 40)];
}

void sub_100015B00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained setPointerPersistentlyHiddenForReasons:*(void *)(a1 + 40)];
}

void sub_100015BE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained setPointerPersistentlyVisibleForReasons:*(void *)(a1 + 40)];
}

void sub_100015CFC(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained setSystemPointerInteractionContextID:a1[5] display:a1[6]];
}

void sub_100015E10(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained setOverridesHoverRegions:a1[5] display:a1[6]];
}

void sub_100015EF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained setWantsServiceKeepAlive:*(void *)(a1 + 40)];
}

void sub_100016104(id a1)
{
}

void sub_100016114(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t start(int a1, char **a2)
{
  _set_user_dir_suffix();
  BSSetMainThreadPriorityFixedForUI();
  pthread_self();
  BSPthreadSetFixedPriority();
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

uint64_t sub_10001663C(uint64_t a1)
{
  if (IOHIDEventGetType() != 17)
  {
    IOHIDEventGetChildren();
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        id v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = sub_10001663C(*(void *)(*((void *)&v9 + 1) + 8 * (void)v6));
          if (v7)
          {
            a1 = v7;
            goto LABEL_12;
          }
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    a1 = 0;
LABEL_12:
  }
  return a1;
}

id *sub_10001A38C(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

id *sub_10001A39C(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 1, a2);
  }
  return result;
}

id *sub_10001A3AC(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

id *sub_10001A3DC(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 2, a2);
  }
  return result;
}

void sub_10001A4A4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)FBSWorkspaceSceneUpdateResponse);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id *sub_10001A870(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_10001A974(id a1)
{
  pthread_self();
  BSPthreadSetFixedPriority();
}

id sub_10001A9A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setEventFetchThreadPriorityWhenPossible];
}

void sub_10001AAB4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  id v4 = [v2 appendObject:WeakRetained withName:@"display"];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  id v7 = [v5 appendPointer:v6 withName:@"pointerRenderingScene"];

  uint64_t v8 = *(void **)(a1 + 32);
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v9 = [v8 appendPointer:v10 withName:@"systemPointerScene"];
}

uint64_t sub_10001AE14()
{
  if (BSFloatEqualToFloat()) {
    return 1;
  }
  return BSFloatEqualToFloat();
}

void sub_10001B964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a67);
  _Unwind_Resume(a1);
}

void sub_10001B9BC(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  long long v11 = [v7 window];

  if (!v11)
  {
    long long v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10001BB48;
    id v17 = &unk_100044C88;
    id v18 = WeakRetained;
    id v19 = v7;
    +[UIView performWithoutAnimation:&v14];
  }
  long long v12 = objc_msgSend(v8, "shape", v14, v15, v16, v17, v18);
  [v7 setPointerShape:v12 animated:v11 != 0 completion:0];

  long long v13 = [v8 shape];
  [v13 bounds];
  objc_msgSend(v7, "setBounds:");

  if (v9)
  {
    [WeakRetained _removeRecordOfAccessory:v9];
    [a1[4] removeObjectForKey:v9];
  }
  [WeakRetained _recordAccessory:v8 withShapeView:v7];
  [a1[5] setObject:v7 forKeyedSubscript:v8];
}

id sub_10001BB48(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
}

void sub_10001BB54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BC2C;
  v10[3] = &unk_100044C88;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v10 completion:0];
}

id sub_10001BC2C(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 finalTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [v3 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_10001BC8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 alpha];
  if (BSFloatGreaterThanFloat())
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001BDD4;
    v10[3] = &unk_100044C88;
    id v11 = v6;
    id v12 = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001BE34;
    v8[3] = &unk_1000452A8;
    v8[4] = *(void *)(a1 + 40);
    id v9 = v12;
    +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v10 completion:v8];
  }
}

id sub_10001BDD4(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 initialTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [v3 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_10001BE34(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 8) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) _visibleShapeViewForAccessory:*(void *)(a1 + 40)];
    if (v2)
    {
      id v3 = v2;
      [v2 removeFromSuperview];
      [*(id *)(a1 + 32) _removeRecordOfAccessory:*(void *)(a1 + 40)];
      id v2 = v3;
    }
  }
}

id sub_10001C078(uint64_t a1)
{
  [*(id *)(a1 + 32) setIntensity:1.0];
  [*(id *)(a1 + 32) setAlpha:0.0];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", CGPointZero.x, CGPointZero.y);
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 initialTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  return [v3 setTransform:v5];
}

void sub_10001DF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id *a30,id *a31,id *a32,uint64_t a33,id *location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(location);
  objc_destroyWeak(a32);
  objc_destroyWeak(a31);
  objc_destroyWeak(a30);
  objc_destroyWeak((id *)&STACK[0x7D0]);
  objc_destroyWeak(a25);
  objc_destroyWeak((id *)&STACK[0x550]);
  _Unwind_Resume(a1);
}

id sub_10001DF94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 88))
  {
    [*(id *)(v2 + 40) setPath:0];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 48) layer];
    [v3 setContents:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
  }
  else
  {
    id v4 = [*(id *)(v2 + 48) layer];
    [v4 setContents:0];

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    uint64_t v7 = [*(id *)(v5 + 88) path];
    [v6 setPath:v7];

    [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:0.0];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 64) layer];
    [v8 setValue:&__kCFBooleanTrue forKeyPath:@"filters.alphaThreshold.enabled"];
  }
  id v9 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v10 = *(void *)(a1 + 48);
  return [v9 setPath:v10];
}

void sub_10001E0F8(id *a1, int a2, double a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 13);
  if (WeakRetained)
  {
    uint64_t v7 = objc_alloc_init(_PUIDPointerShapeMorphingAnimationProxy);
    [a1[4] applyForTime:v7 presentationObject:0 modelObject:a3];
    memset(&v65, 0, sizeof(v65));
    id v8 = [a1[4] keyPath];
    id v9 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v8];
    uint64_t v10 = v9;
    if (v9) {
      [v9 CATransform3DValue];
    }
    else {
      memset(&v65, 0, sizeof(v65));
    }

    if (a2)
    {
      id v11 = WeakRetained[3];
      if (v11) {
        [v11 transform3D];
      }
      else {
        memset(&a, 0, sizeof(a));
      }
      CATransform3D b = v65;
      if (CATransform3DEqualToTransform(&a, &b))
      {
        id v12 = WeakRetained[3];
        CATransform3DMakeTranslation(&v62, -1.0, -1.0, 0.0);
        [v12 setTransform3D:&v62];
      }
    }
    id v13 = WeakRetained[3];
    CATransform3D b = v65;
    [v13 setTransform3D:&b];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[5] applyForTime:v7 presentationObject:0 modelObject:a3];
    memset(&b, 0, sizeof(b));
    long long v14 = [a1[5] keyPath];
    uint64_t v15 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v14];
    id v16 = v15;
    if (v15) {
      [v15 CATransform3DValue];
    }
    else {
      memset(&b, 0, sizeof(b));
    }

    if (a2)
    {
      id v17 = WeakRetained[7];
      if (v17) {
        [v17 transform3D];
      }
      else {
        memset(&v61, 0, sizeof(v61));
      }
      CATransform3D v60 = b;
      if (CATransform3DEqualToTransform(&v61, &v60))
      {
        id v18 = WeakRetained[7];
        CATransform3DMakeTranslation(&v59, -1.0, -1.0, 0.0);
        [v18 setTransform3D:&v59];
      }
    }
    id v19 = WeakRetained[7];
    CATransform3D v60 = b;
    [v19 setTransform3D:&v60];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[6] applyForTime:v7 presentationObject:0 modelObject:a3];
    memset(&v60, 0, sizeof(v60));
    uint64_t v20 = [a1[6] keyPath];
    long long v21 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v20];
    long long v22 = v21;
    if (v21) {
      [v21 CATransform3DValue];
    }
    else {
      memset(&v60, 0, sizeof(v60));
    }

    if (a2)
    {
      id v23 = WeakRetained[2];
      if (v23) {
        [v23 transform3D];
      }
      else {
        memset(&v58, 0, sizeof(v58));
      }
      CATransform3D v57 = v60;
      if (CATransform3DEqualToTransform(&v58, &v57))
      {
        id v24 = WeakRetained[2];
        CATransform3DMakeTranslation(&v56, -1.0, -1.0, 0.0);
        [v24 setTransform3D:&v56];
      }
    }
    id v25 = WeakRetained[2];
    CATransform3D v57 = v60;
    [v25 setTransform3D:&v57];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[7] applyForTime:v7 presentationObject:0 modelObject:a3];
    v26 = [a1[7] keyPath];
    id v27 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v26];
    [v27 doubleValue];
    double v29 = v28;

    if (a2)
    {
      [WeakRetained[2] alpha];
      if (BSFloatEqualToFloat()) {
        [WeakRetained[2] setAlpha:1.0 - v29];
      }
    }
    [WeakRetained[2] setAlpha:v29];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[8] applyForTime:v7 presentationObject:0 modelObject:a3];
    id v30 = [a1[8] keyPath];
    id v31 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v30];
    [v31 doubleValue];
    double v33 = v32;

    if (a2)
    {
      [WeakRetained[11] alpha];
      if (BSFloatEqualToFloat()) {
        [WeakRetained[11] setAlpha:1.0 - v33];
      }
    }
    [WeakRetained[11] setAlpha:v33];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[9] applyForTime:v7 presentationObject:0 modelObject:a3];
    double v34 = [a1[9] keyPath];
    double v35 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v34];
    [v35 doubleValue];
    double v37 = v36;

    if (a2)
    {
      [WeakRetained[5] alpha];
      if (BSFloatEqualToFloat()) {
        [WeakRetained[5] setAlpha:1.0 - v37];
      }
    }
    [WeakRetained[5] setAlpha:v37];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[10] applyForTime:v7 presentationObject:0 modelObject:a3];
    v38 = [a1[10] keyPath];
    v39 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v38];
    [v39 doubleValue];
    double v41 = v40;

    if (a2)
    {
      [WeakRetained[3] alpha];
      if (BSFloatEqualToFloat()) {
        [WeakRetained[3] setAlpha:1.0 - v41];
      }
    }
    [WeakRetained[3] setAlpha:v41];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[11] applyForTime:v7 presentationObject:0 modelObject:a3];
    v42 = [a1[11] keyPath];
    v43 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v42];
    [v43 doubleValue];
    double v45 = v44;

    if (a2)
    {
      [WeakRetained[7] alpha];
      if (BSFloatEqualToFloat()) {
        [WeakRetained[7] setAlpha:1.0 - v45];
      }
    }
    [WeakRetained[7] setAlpha:v45];
    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
    [a1[12] applyForTime:v7 presentationObject:0 modelObject:a3];
    v46 = [a1[12] keyPath];
    v47 = [(_PUIDPointerShapeMorphingAnimationProxy *)v7 valueForKeyPath:v46];

    if (a2)
    {
      v48 = [WeakRetained[8] layer];
      v49 = [a1[12] keyPath];
      v50 = [v48 valueForKeyPath:v49];
      unsigned int v51 = [v47 isEqual:v50];

      if (v51)
      {
        v52 = [WeakRetained[8] layer];
        v53 = [a1[12] keyPath];
        [v52 setValue:&off_100048208 forKeyPath:v53];
      }
    }
    v54 = [WeakRetained[8] layer];
    v55 = [a1[12] keyPath];
    [v54 setValue:v47 forKeyPath:v55];

    [(_PUIDPointerShapeMorphingAnimationProxy *)v7 reset];
  }
}

uint64_t sub_10001E904(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

void sub_10001E91C(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 18;
    uint64_t v7 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 18);
    uint64_t v4 = *(void *)&v7[8]._os_unfair_lock_opaque;
    uint64_t v5 = *(void *)(a1 + 56);
    os_unfair_lock_unlock(v3);
    id WeakRetained = v7;
    if (v4 == v5)
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      [v6 value];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      id WeakRetained = v7;
    }
  }
}

void sub_10001E9D4(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 18);
    uint64_t v2 = *(void *)&WeakRetained[8]._os_unfair_lock_opaque;
    uint64_t v3 = *(void *)(a1 + 120);
    os_unfair_lock_unlock(WeakRetained + 18);
    if (v2 == v3)
    {
      uint64_t v4 = objc_alloc_init(_PUIDPointerShapeMorphingAnimationProxy);
      id v5 = objc_loadWeakRetained((id *)(a1 + 112));
      [v5 presentationValue];
      double v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "applyForTime:presentationObject:modelObject:", v4, 0);
      id v8 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
      id v9 = [*(id *)(a1 + 32) keyPath];
      uint64_t v10 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v9];
      id v11 = [*(id *)(a1 + 32) keyPath];
      [v8 _setPresentationValue:v10 forKey:v11];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 40) applyForTime:v4 presentationObject:0 modelObject:v7];
      id v12 = *(void **)&WeakRetained[14]._os_unfair_lock_opaque;
      id v13 = [*(id *)(a1 + 40) keyPath];
      long long v14 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v13];
      uint64_t v15 = [*(id *)(a1 + 40) keyPath];
      [v12 _setPresentationValue:v14 forKey:v15];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 48) applyForTime:v4 presentationObject:0 modelObject:v7];
      id v16 = *(void **)&WeakRetained[4]._os_unfair_lock_opaque;
      id v17 = [*(id *)(a1 + 48) keyPath];
      id v18 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v17];
      id v19 = [*(id *)(a1 + 48) keyPath];
      [v16 _setPresentationValue:v18 forKey:v19];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 56) applyForTime:v4 presentationObject:0 modelObject:v7];
      uint64_t v20 = *(void **)&WeakRetained[4]._os_unfair_lock_opaque;
      long long v21 = [*(id *)(a1 + 56) keyPath];
      long long v22 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v21];
      id v23 = [*(id *)(a1 + 56) keyPath];
      [v20 _setPresentationValue:v22 forKey:v23];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 64) applyForTime:v4 presentationObject:0 modelObject:v7];
      id v24 = *(void **)&WeakRetained[22]._os_unfair_lock_opaque;
      id v25 = [*(id *)(a1 + 64) keyPath];
      v26 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v25];
      id v27 = [*(id *)(a1 + 64) keyPath];
      [v24 _setPresentationValue:v26 forKey:v27];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 72) applyForTime:v4 presentationObject:0 modelObject:v7];
      double v28 = *(void **)&WeakRetained[10]._os_unfair_lock_opaque;
      double v29 = [*(id *)(a1 + 72) keyPath];
      id v30 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v29];
      id v31 = [*(id *)(a1 + 72) keyPath];
      [v28 _setPresentationValue:v30 forKey:v31];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 80) applyForTime:v4 presentationObject:0 modelObject:v7];
      double v32 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
      double v33 = [*(id *)(a1 + 80) keyPath];
      double v34 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v33];
      double v35 = [*(id *)(a1 + 80) keyPath];
      [v32 _setPresentationValue:v34 forKey:v35];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 88) applyForTime:v4 presentationObject:0 modelObject:v7];
      double v36 = *(void **)&WeakRetained[14]._os_unfair_lock_opaque;
      double v37 = [*(id *)(a1 + 88) keyPath];
      v38 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v37];
      v39 = [*(id *)(a1 + 88) keyPath];
      [v36 _setPresentationValue:v38 forKey:v39];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
      [*(id *)(a1 + 96) applyForTime:v4 presentationObject:0 modelObject:v7];
      double v40 = *(void **)&WeakRetained[16]._os_unfair_lock_opaque;
      double v41 = [*(id *)(a1 + 96) keyPath];
      v42 = [(_PUIDPointerShapeMorphingAnimationProxy *)v4 valueForKeyPath:v41];
      v43 = [*(id *)(a1 + 96) keyPath];
      [v40 _setPresentationValue:v42 forKey:v43];

      [(_PUIDPointerShapeMorphingAnimationProxy *)v4 reset];
    }
  }
}

id sub_10001EEF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:1.0];
}

void sub_10001EEFC(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_6;
  }
  uint64_t v3 = (void *)*((void *)WeakRetained + 1);
  if (v3 == *(void **)(a1 + 32))
  {
    *((void *)WeakRetained + 1) = 0;

    id WeakRetained = v9;
  }
  uint64_t v4 = (os_unfair_lock_s *)(WeakRetained + 72);
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 18);
  uint64_t v5 = *((void *)v9 + 4);
  uint64_t v6 = *(void *)(a1 + 56);
  os_unfair_lock_unlock(v4);
  if (v5 == v6)
  {
    [v9 _resetToStableStateWithPath:*((void *)v9 + 12)];
    uint64_t v7 = 1;
  }
  else
  {
LABEL_6:
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v7);
  }
}

void sub_10001F084(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) setPath:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 88) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v15 = *(_OWORD *)&CATransform3DIdentity.m33;
  long long v20 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v14 = v20;
  long long v21 = v15;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v22 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v12 = v22;
  long long v23 = v13;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v16 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v10 = v16;
  long long v17 = v11;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v18 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v8 = v18;
  long long v19 = v9;
  [v2 setTransform3D:&v16];
  [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  long long v20 = v14;
  long long v21 = v15;
  long long v22 = v12;
  long long v23 = v13;
  long long v16 = v10;
  long long v17 = v11;
  long long v18 = v8;
  long long v19 = v9;
  [v3 setTransform3D:&v16];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  long long v20 = v14;
  long long v21 = v15;
  long long v22 = v12;
  long long v23 = v13;
  long long v16 = v10;
  long long v17 = v11;
  long long v18 = v8;
  long long v19 = v9;
  [v4 setTransform3D:&v16];
  [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 40) setPath:0];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 48) layer];
  [v5 setContents:0];

  [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:0.0];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 64) layer];
  [v6 setValue:&__kCFBooleanFalse forKeyPath:@"filters.alphaThreshold.enabled"];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 64) layer];
  [v7 setValue:&off_1000481B8 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_10002070C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(v32);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_100020794(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[30] value];
    [v3 _updatePointerShapePosition:1 onAxis:1 isModel:v2];
    id WeakRetained = v3;
  }
}

void sub_10002088C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[30] presentationValue];
    [v3 _updatePointerShapePosition:1 onAxis:0 isModel:v2];
    id WeakRetained = v3;
  }
}

void sub_100020984(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[31] value];
    [v3 _updatePointerShapePosition:2 onAxis:1 isModel:v2];
    id WeakRetained = v3;
  }
}

void sub_100020A7C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[31] presentationValue];
    [v3 _updatePointerShapePosition:2 onAxis:0 isModel:v2];
    id WeakRetained = v3;
  }
}

void sub_100020CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020D10(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    [WeakRetained[30] value];
    [v5[30] setValue:v3 + (*(double *)(a1 + 40) - *(double *)(a1 + 56)) * 0.5];
    [v5[31] value];
    [v5[31] setValue:v4 + (*(double *)(a1 + 48) - *(double *)(a1 + 64)) * 0.5];
    id WeakRetained = v5;
  }
}

uint64_t sub_1000233BC(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = 1;
  if (fabs(a3) == INFINITY)
  {
    long long v10 = PSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100028730();
    }

    uint64_t v9 = 0;
  }
  if (fabs(a4) == INFINITY)
  {
    long long v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100028660();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

void sub_100023520(uint64_t a1, void *a2)
{
  double v3 = a2;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100023AB8;
  v49[3] = &unk_1000453F8;
  double v4 = *(void **)(a1 + 40);
  v49[4] = *(void *)(a1 + 32);
  id v50 = v4;
  long long v51 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = objc_retainBlock(v49);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100023B1C;
  v47[3] = &unk_100045420;
  v47[4] = *(void *)(a1 + 32);
  long long v48 = *(_OWORD *)(a1 + 64);
  uint64_t v6 = objc_retainBlock(v47);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100023B38;
  v45[3] = &unk_100045420;
  v45[4] = *(void *)(a1 + 32);
  long long v46 = *(_OWORD *)(a1 + 64);
  id v7 = objc_retainBlock(v45);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100023B54;
  v44[3] = &unk_100045190;
  v44[4] = *(void *)(a1 + 32);
  id v8 = objc_retainBlock(v44);
  uint64_t v9 = v8;
  if (!*(unsigned char *)(a1 + 88))
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100023BA8;
    v35[3] = &unk_100045448;
    double v36 = v5;
    double v37 = v6;
    v38 = v7;
    id v39 = v9;
    +[UIView _performWithoutRetargetingAnimations:v35];

    long long v12 = v36;
    goto LABEL_25;
  }
  double v34 = v8;
  uint64_t v10 = *(void *)(a1 + 80);
  long long v11 = *(void **)(*(void *)(a1 + 32) + 256);
  if ((v10 & 4) == 0)
  {
    long long v12 = [v11 systemPointerPositionAnimationSettings];
    long long v13 = *(void **)(a1 + 32);
    goto LABEL_7;
  }
  long long v12 = [v11 systemPointerPositionHighQualityFrequencyAnimationSettings];
  long long v13 = *(void **)(a1 + 32);
  if (v13[37])
  {
LABEL_7:
    long long v14 = v3[2](v3, @"modelPositionAnimations");
    long long v15 = [v13 _positionAnimationCountIncrementingCompletionWrapper:v14];

    +[UIView _animateUsingSpringBehavior:v12 tracking:0 animations:v5 completion:v15];
    goto LABEL_8;
  }
  ((void (*)(void *))v5[2])(v5);
LABEL_8:
  long long v16 = *(void **)(a1 + 40);
  unsigned __int8 v17 = [*(id *)(*(void *)(a1 + 32) + 24) isPointerUnderlayingContent];
  id v18 = v16;
  long long v19 = v18;
  if ((v17 & 1) != 0 || ([v18 bounds], v20 == CGSizeZero.width) && v21 == CGSizeZero.height) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v21 / v20 > 7.9 || v20 / v21 > 7.9;
  }

  double v42 = 0.0;
  double v43 = 0.0;
  double v40 = 0.0;
  double v41 = 0.0;
  [*(id *)(a1 + 32) _relativePositionAnimationParametersUsingSystemPointerPositionSettings:v12 forTextContent:v22 outXDamping:&v43 outXResponse:&v42 outYDamping:&v41 outYResponse:&v40];
  if ((BSFloatIsZero() & 1) == 0)
  {
    id v24 = *(void **)(a1 + 32);
LABEL_21:
    v26 = v3[2](v3, @"relativePositionXAnimations");
    id v27 = [v24 _positionAnimationCountIncrementingCompletionWrapper:v26];

    id v25 = v6;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v43, v42, 0.0, 0.0, 0.0, 0.0);
    double v28 = *(void **)(a1 + 32);
    double v29 = v3[2](v3, @"relativePositionYAnimations");
    id v30 = [v28 _positionAnimationCountIncrementingCompletionWrapper:v29];

    +[UIView _animateUsingSpringWithDampingRatio:0 response:v7 tracking:v30 dampingRatioSmoothing:v41 responseSmoothing:v40 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
    goto LABEL_22;
  }
  int IsZero = BSFloatIsZero();
  id v24 = *(void **)(a1 + 32);
  if ((v10 & 4) == 0 || !IsZero || v24[37]) {
    goto LABEL_21;
  }
  id v25 = v6;
  ((void (*)(void *))v6[2])(v6);
  ((void (*)(void *))v7[2])(v7);
LABEL_22:
  uint64_t v9 = v34;
  id v31 = [*(id *)(*(void *)(a1 + 32) + 200) materialStyle];
  if (v31 != [*(id *)(*(void *)(a1 + 32) + 24) pointerMaterialLuminance])
  {
    double v32 = [*(id *)(*(void *)(a1 + 32) + 256) materialTransitionAnimationSettings];
    double v33 = v3[2](v3, @"pointerMaterialTransitionAnimations");
    +[UIView _animateUsingSpringBehavior:v32 tracking:0 animations:v34 completion:v33];
  }
  uint64_t v6 = v25;
LABEL_25:
}

id sub_100023AB8(double *a1)
{
  double v2 = (void *)*((void *)a1 + 4);
  double v3 = (void *)v2[26];
  [v2 _samplingBoundsForPointerShape:*((void *)a1 + 5)];
  objc_msgSend(v3, "setBounds:");
  double v4 = *(void **)(*((void *)a1 + 4) + 264);
  double v5 = a1[6];
  double v6 = a1[7];
  return objc_msgSend(v4, "setPosition:", v5, v6);
}

id sub_100023B1C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) setValue:*(double *)(a1 + 40)];
}

id sub_100023B38(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) setValue:*(double *)(a1 + 48)];
}

id sub_100023B54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 200);
  id v3 = [*(id *)(v1 + 24) pointerMaterialLuminance];
  return [v2 setMaterialStyle:v3];
}

uint64_t sub_100023BA8(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();
  double v2 = *(uint64_t (**)(void))(a1[7] + 16);
  return v2();
}

void sub_100023C18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != v3)
  {
    double v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    (*(void (**)(uint64_t, const __CFString *))(a2 + 16))(a2, @"portalTransitionAnimations");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 _transitionFromPointerPortalSourceView:v3 toPointerPortalSourceView:v2 animated:v5 completion:v6];
  }
}

void sub_100023CBC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) portalSourceTransitionCompletion];
  if (v1)
  {
    id v2 = v1;
    v1[2](v1, 1, 0);
    uint64_t v1 = (void (**)(void, void, void))v2;
  }
}

void sub_100023D14(uint64_t a1, void (**a2)(id, const __CFString *))
{
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(void **)(*(void *)(a1 + 32) + 200);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  id v7 = a2 + 2;
  id v6 = (void (*)(void))a2[2];
  id v8 = a2;
  uint64_t v9 = v6();
  [v4 setPointerShape:v3 animated:v5 completion:v9];

  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = *(void **)(*(void *)(a1 + 32) + 272);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 48);
  (*v7)(v8, @"specularEffectPointerShape");
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [v11 setPointerShape:v10 animated:v12 completion:v13];
}

void sub_100023E00(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) shapeTransitionCompletion];
  if (v1)
  {
    id v2 = v1;
    v1[2](v1, 1, 0);
    uint64_t v1 = (void (**)(void, void, void))v2;
  }
}

void sub_100023E58(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = 0;
  if (*(void *)(a1 + 48) == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 256) visibleToHiddenPointerBlurRadius];
    uint64_t v4 = v5;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) pointerVisualIntensity];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7 == 1)
  {
    double v9 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = v6;
    double v9 = 1.0;
    if (v7 == 3)
    {
      if (BSFloatGreaterThanFloat())
      {
        double v10 = v8 + 0.15;
        id v11 = [*(id *)(*(void *)(a1 + 32) + 24) pointerMaterialLuminance];
        uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 256);
        if (v11 == (id)2) {
          [v12 minFlexibleRectLightLuminanceIntensity];
        }
        else {
          [v12 minFlexibleRectDarkLuminanceIntensity];
        }
        double v14 = v13;
        [*(id *)(a1 + 40) bounds];
        double Width = CGRectGetWidth(v58);
        [*(id *)(a1 + 40) bounds];
        double Height = CGRectGetHeight(v59);
        if (Width >= Height) {
          double v17 = Width;
        }
        else {
          double v17 = Height;
        }
        [*(id *)(*(void *)(a1 + 32) + 256) systemPointerSize];
        double v19 = v18;
        [*(id *)(*(void *)(a1 + 32) + 256) systemPointerPressedScale];
        double v21 = v19 * v20;
        [*(id *)(*(void *)(a1 + 32) + 256) flexibleRectIntensityReductionRange];
        double v23 = (v17 - v21) / v22;
        double v9 = 1.0;
        double v8 = fmax(v14, fmin(1.0 - v23 + v14 * v23, v10));
      }
    }
    else if (v7 == 2 && BSFloatGreaterThanFloat())
    {
      double v8 = v8 + 0.15;
    }
  }
  if (*(void *)(a1 + 48) != *(void *)(a1 + 56)
    || ([*(id *)(*(void *)(a1 + 32) + 200) blurRadius], !BSFloatEqualToFloat())
    || ([*(id *)(*(void *)(a1 + 32) + 272) blurRadius], !BSFloatEqualToFloat())
    || ([*(id *)(*(void *)(a1 + 32) + 200) intensity], !BSFloatEqualToFloat())
    || ([*(id *)(*(void *)(a1 + 32) + 200) feather], (BSFloatEqualToFloat() & 1) == 0))
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10002458C;
    v57[3] = &unk_100045500;
    v57[4] = *(void *)(a1 + 32);
    v57[5] = v4;
    *(double *)&v57[6] = v9;
    v57[7] = 0;
    *(double *)&v57[8] = v8;
    id v24 = objc_retainBlock(v57);
    long long v25 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v56.CATransform3D a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v56.c = v25;
    *(_OWORD *)&v56.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    uint64_t v26 = *(void *)(a1 + 48);
    if (v26 == 1)
    {
      [*(id *)(*(void *)(a1 + 32) + 256) visibleToHiddenPointerScale];
      CGAffineTransformMakeScale(&v55, v33, v33);
      CGAffineTransform v56 = v55;
    }
    else if (v26 == 2)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) contentHoverInverseScale];
      double v28 = v27;
      int IsZero = BSFloatIsZero();
      if ([*(id *)(*(void *)(a1 + 32) + 24) isPointerUnderlayingContent])
      {
        if (IsZero) {
          double v30 = 1.0;
        }
        else {
          double v30 = 1.0 / v28;
        }
        [*(id *)(*(void *)(a1 + 32) + 256) underlayingPointerPressedScaleFactor];
        double v32 = v31 / v30;
      }
      else
      {
        [*(id *)(*(void *)(a1 + 32) + 256) systemPointerPressedScale];
      }
      CGAffineTransformMakeScale(&v56, v32, v32);
    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    long long v52 = *(_OWORD *)&v56.a;
    v51[2] = sub_100024620;
    v51[3] = &unk_100045528;
    v51[4] = *(void *)(a1 + 32);
    long long v53 = *(_OWORD *)&v56.c;
    long long v54 = *(_OWORD *)&v56.tx;
    double v34 = objc_retainBlock(v51);
    if (!*(unsigned char *)(a1 + 72))
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100024780;
      v47[3] = &unk_100045550;
      long long v48 = v24;
      v49 = v34;
      +[UIView _performWithoutRetargetingAnimations:v47];

      v38 = v48;
LABEL_63:

      goto LABEL_64;
    }
    uint64_t v35 = *(void *)(a1 + 56);
    if (*(void *)(a1 + 48) == 1)
    {
      if (v35 != 1)
      {
        if ((*(unsigned char *)(a1 + 64) & 8) != 0
          && [*(id *)(*(void *)(a1 + 32) + 256) supportsTeleporting])
        {
          double v36 = PSLogAutohide();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v55.a) = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Using teleport hiding animation", (uint8_t *)&v55, 2u);
          }

          *(unsigned char *)(*(void *)(a1 + 32) + 313) = 1;
          uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 256) visibleToHiddenTeleportingAnimationSettings];
        }
        else
        {
          uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 256) visibleToHiddenAnimationSettings];
        }
        goto LABEL_49;
      }
    }
    else if (v35 == 1)
    {
      uint64_t v39 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v39 + 313))
      {
        double v40 = PSLogAutohide();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v55.a) = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Using teleport unhide animation", (uint8_t *)&v55, 2u);
        }

        *(unsigned char *)(*(void *)(a1 + 32) + 313) = 0;
        uint64_t v41 = [*(id *)(*(void *)(a1 + 32) + 256) hiddenToVisibleTeleportingAnimationSettings];
      }
      else
      {
        uint64_t v41 = [*(id *)(v39 + 256) hiddenToVisibleAnimationSettings];
      }
      v38 = (void *)v41;
LABEL_52:
      if (*(void *)(a1 + 48) != 1 && *(void *)(a1 + 56) == 1)
      {
        [*(id *)(*(void *)(a1 + 32) + 200) presentationIntensity];
        if (BSFloatIsZero())
        {
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1000246A0;
          v50[3] = &unk_100045190;
          v50[4] = *(void *)(a1 + 32);
          +[UIView _performWithoutRetargetingAnimations:v50];
        }
      }
      double v42 = v3[2](v3, @"visibilityAnimations");
      +[UIView _animateUsingSpringBehavior:v38 tracking:0 animations:v24 completion:v42];

      uint64_t v43 = *(void *)(a1 + 56);
      if (*(void *)(a1 + 48) == 1)
      {
        if (v43 != 1)
        {
          uint64_t v44 = [*(id *)(*(void *)(a1 + 32) + 256) visibleToHiddenScaleAnimationSettings];
LABEL_62:
          double v45 = (void *)v44;
          long long v46 = v3[2](v3, @"visibilityScaleAnimations");
          +[UIView _animateUsingSpringBehavior:v45 tracking:0 animations:v34 completion:v46];

          goto LABEL_63;
        }
      }
      else if (v43 == 1)
      {
        uint64_t v44 = [*(id *)(*(void *)(a1 + 32) + 256) hiddenToVisibleScaleAnimationSettings];
        goto LABEL_62;
      }
      uint64_t v44 = [*(id *)(*(void *)(a1 + 32) + 256) pressedScaleAnimationSettings];
      goto LABEL_62;
    }
    uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 256) visibleIntensityAnimationSettings];
LABEL_49:
    v38 = (void *)v37;
    goto LABEL_52;
  }
LABEL_64:
}

id sub_10002458C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) setBlurRadius:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 272) setBlurRadius:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 304) setAlpha:*(double *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 200) setFeather:*(double *)(a1 + 56)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  double v3 = *(double *)(a1 + 64);
  return [v2 setIntensity:v3];
}

id sub_100024620(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 72);
  [v2 setTransform:&v7];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 272);
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 72);
  return [v4 setTransform:&v7];
}

id sub_1000246A0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) hiddenToVisiblePointerBlurRadius];
  double v3 = v2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "setBlurRadius:");
  [*(id *)(*(void *)(a1 + 32) + 272) setBlurRadius:v3];
  [*(id *)(*(void *)(a1 + 32) + 256) hiddenToVisiblePointerScale];
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeScale(&v9, v4, v4);
  long long v5 = *(void **)(*(void *)(a1 + 32) + 200);
  CGAffineTransform v8 = v9;
  [v5 setTransform:&v8];
  double v6 = *(void **)(*(void *)(a1 + 32) + 272);
  CGAffineTransform v8 = v9;
  return [v6 setTransform:&v8];
}

uint64_t sub_100024780(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_1000247CC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) visibilityTransitionCompletion];
  if (v1)
  {
    id v2 = v1;
    v1[2](v1, 1, 0);
    uint64_t v1 = (void (**)(void, void, void))v2;
  }
}

void sub_100024824(uint64_t a1, void *a2)
{
  double v3 = a2;
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 24) isPressed];
  CGFloat v5 = 1.0;
  if (v4) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "contentHoverInverseScale", 1.0);
  }
  memset(&v39, 0, sizeof(v39));
  CATransform3DMakeScale(&v38, v5, v5, 1.0);
  CATransform3DTranslate(&v39, &v38, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), 0.0);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100024B74;
  v34[3] = &unk_1000455A0;
  id v35 = *(id *)(a1 + 40);
  id v36 = *(id *)(a1 + 48);
  CATransform3D v37 = v39;
  double v6 = objc_retainBlock(v34);
  long long v7 = *(void **)(a1 + 40);
  if (v7 != *(void **)(a1 + 48))
  {
    CGAffineTransform v8 = [v7 superview];

    if (!v8) {
      [*(id *)(a1 + 56) addSubview:*(void *)(a1 + 40)];
    }
  }
  CGAffineTransform v9 = (long long *)(*(void *)(a1 + 32) + 64);
  long long v10 = *v9;
  long long v11 = *(_OWORD *)(*(void *)(a1 + 32) + 80);
  long long v12 = *(_OWORD *)(*(void *)(a1 + 32) + 112);
  *(_OWORD *)&a.m21 = *(_OWORD *)(*(void *)(a1 + 32) + 96);
  *(_OWORD *)&a.m23 = v12;
  *(_OWORD *)&a.m11 = v10;
  *(_OWORD *)&a.m13 = v11;
  long long v13 = v9[4];
  long long v14 = v9[5];
  long long v15 = v9[7];
  *(_OWORD *)&a.m41 = v9[6];
  *(_OWORD *)&a.m43 = v15;
  *(_OWORD *)&a.m31 = v13;
  *(_OWORD *)&a.m33 = v14;
  CATransform3D b = v39;
  if (!CATransform3DEqualToTransform(&a, &b) || *(void *)(a1 + 40) != *(void *)(a1 + 48))
  {
    long long v16 = (_OWORD *)(*(void *)(a1 + 32) + 64);
    long long v17 = *(_OWORD *)&v39.m11;
    long long v18 = *(_OWORD *)&v39.m13;
    long long v19 = *(_OWORD *)&v39.m23;
    v16[2] = *(_OWORD *)&v39.m21;
    v16[3] = v19;
    *long long v16 = v17;
    v16[1] = v18;
    long long v20 = *(_OWORD *)&v39.m31;
    long long v21 = *(_OWORD *)&v39.m33;
    long long v22 = *(_OWORD *)&v39.m43;
    v16[6] = *(_OWORD *)&v39.m41;
    v16[7] = v22;
    v16[4] = v20;
    v16[5] = v21;
    if (*(unsigned char *)(a1 + 80))
    {
      double v23 = v3[2](v3, @"contentMatchMoveAnimations");
      id v24 = [*(id *)(*(void *)(a1 + 32) + 256) focusedContentPositionAnimationSettings];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100024C0C;
      v28[3] = &unk_1000455C8;
      id v29 = *(id *)(a1 + 40);
      id v30 = *(id *)(a1 + 48);
      id v31 = v23;
      id v25 = v23;
      +[UIView _animateUsingSpringBehavior:v24 tracking:0 animations:v6 completion:v28];
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100024C74;
      v26[3] = &unk_100045210;
      double v27 = v6;
      +[UIView _performWithoutRetargetingAnimations:v26];
      id v25 = v27;
    }
  }
}

id sub_100024B74(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = *(void **)(a1 + 40);
  if (v2 != v3)
  {
    long long v4 = *(_OWORD *)&CATransform3DIdentity.m33;
    long long v17 = *(_OWORD *)&CATransform3DIdentity.m31;
    long long v18 = v4;
    long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
    long long v19 = *(_OWORD *)&CATransform3DIdentity.m41;
    long long v20 = v5;
    long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
    long long v13 = *(_OWORD *)&CATransform3DIdentity.m11;
    long long v14 = v6;
    long long v7 = *(_OWORD *)&CATransform3DIdentity.m23;
    long long v15 = *(_OWORD *)&CATransform3DIdentity.m21;
    long long v16 = v7;
    [v3 setTransform3D:&v13];
    id v2 = *(void **)(a1 + 32);
  }
  long long v8 = *(_OWORD *)(a1 + 128);
  long long v17 = *(_OWORD *)(a1 + 112);
  long long v18 = v8;
  long long v9 = *(_OWORD *)(a1 + 160);
  long long v19 = *(_OWORD *)(a1 + 144);
  long long v20 = v9;
  long long v10 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 48);
  long long v14 = v10;
  long long v11 = *(_OWORD *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v16 = v11;
  return [v2 setTransform3D:&v13];
}

uint64_t sub_100024C0C(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    long long v5 = (void *)a1[4];
    long long v4 = (void *)a1[5];
    if (v5 != v4) {
      [v4 removeFromSuperview];
    }
  }
  long long v6 = *(uint64_t (**)(void))(a1[6] + 16);
  return v6();
}

uint64_t sub_100024C74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100024C84(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) contentMatchMoveSourceTransitionCompletion];
  if (v1)
  {
    id v2 = v1;
    v1[2](v1, 1, 0);
    uint64_t v1 = (void (**)(void, void, void))v2;
  }
}

void sub_100024CDC(uint64_t a1, void *a2)
{
  double v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) overlayEffectStyle];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(id *)(v5 + 8) != v4)
  {
    *(void *)(v5 + 8) = v4;
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v29.CATransform3D a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v29.c = v6;
    *(_OWORD *)&v29.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(v7 + 8))
    {
      [*(id *)(v7 + 200) expectedShapeBoundsForPointerShape:*(void *)(a1 + 40)];
      if (v8 >= v9) {
        double v10 = v8;
      }
      else {
        double v10 = v9;
      }
      double v11 = 0.0;
      double v12 = fmax(v10, 0.0);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 8);
      if (v14 == 2)
      {
        [*(id *)(v13 + 256) specularProminentLongestSideBaseMultiplier];
        double v15 = v18;
        [*(id *)(*(void *)(a1 + 32) + 256) specularProminentOpacityMultiplier];
      }
      else
      {
        double v15 = 0.0;
        if (v14 == 1)
        {
          [*(id *)(v13 + 256) specularStandardLongestSideBaseMultiplier];
          double v15 = v16;
          [*(id *)(*(void *)(a1 + 32) + 256) specularStandardOpacityMultiplier];
        }
      }
      double v19 = v12 * v15;
      if (v12 * v15 > 1.0) {
        double v19 = 1.0;
      }
      double v20 = fmax(v19, 0.0);
      double v17 = v11 * v20;
      CGAffineTransformMakeScale(&v29, v20 + 1.0, v20 + 1.0);
      uint64_t v7 = *(void *)(a1 + 32);
    }
    else
    {
      double v17 = 0.0;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100024F6C;
    v27[3] = &unk_100045618;
    v27[4] = v7;
    *(double *)&v27[5] = v17;
    CGAffineTransform v28 = v29;
    long long v21 = objc_retainBlock(v27);
    long long v22 = v21;
    if (*(unsigned char *)(a1 + 48))
    {
      double v23 = [*(id *)(*(void *)(a1 + 32) + 256) specularOpacityAnimationSettings];
      id v24 = v3[2](v3, @"specularAnimations");
      +[UIView _animateUsingSpringBehavior:v23 tracking:0 animations:v22 completion:v24];
    }
    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100024FEC;
      v25[3] = &unk_100045210;
      uint64_t v26 = v21;
      +[UIView performWithoutAnimation:v25];
      double v23 = v26;
    }
  }
}

id sub_100024F6C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 280) setHidden:*(double *)(a1 + 40) == 0.0];
  [*(id *)(*(void *)(a1 + 32) + 264) setAlpha:*(double *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 264);
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  return [v2 setTransform:v5];
}

uint64_t sub_100024FEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100024FFC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) overlayEffectTransitionCompletion];
  if (v1)
  {
    id v2 = v1;
    v1[2](v1, 1, 0);
    uint64_t v1 = (void (**)(void, void, void))v2;
  }
}

uint64_t sub_1000256E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100025844(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  [v5 value];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    int v6 = *(unsigned __int8 *)(a1 + 40);
    char v7 = BSFloatEqualToFloat();
    if (!v6 || (v7 & 1) != 0)
    {
      [v5 invalidate];
      id v9 = objc_alloc_init((Class)UIViewFloatAnimatableProperty);

      [v9 setValue:a3];
      id v5 = v9;
    }
    else
    {
      double v8 = [*(id *)(*(void *)(a1 + 32) + 256) rampingExitAnimationSettings];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100025990;
      v11[3] = &unk_100045640;
      id v5 = v5;
      id v12 = v5;
      double v13 = a3;
      +[UIView _animateUsingSpringBehavior:v8 tracking:0 animations:v11 completion:0];
    }
  }
  return v5;
}

id sub_100025990(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(double *)(a1 + 40)];
}

id sub_1000262FC(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

BOOL sub_100026340(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v3 = [v2 name];
    unsigned __int8 v4 = [v3 isEqualToString:@"opacityPair"];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

BOOL sub_1000263BC(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 name],
        int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:@"opacityPair"],
        v6,
        v7))
  {
    BOOL v8 = 1;
    *a4 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id sub_100026448(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKeyPath:@"_PUIDPointerLayerKeyOpacityPairGenerationID"];
  id v2 = *(void **)(a1 + 32);
  long long v3 = [*(id *)(a1 + 48) presentationLayer];
  unsigned __int8 v4 = v3;
  if (!v3) {
    long long v3 = *(void **)(a1 + 48);
  }
  [v3 opacity];
  id v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v2 setValue:v5 forKeyPath:@"filters.opacityPair.inputAmount"];

  int v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v6 _setVelocity:v7 forKey:@"filters.opacityPair.inputAmount"];
}

void sub_1000264FC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setValue:v3 forKeyPath:@"filters.opacityPair.inputAmount"];
}

uint64_t sub_100026584(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) valueForKeyPath:@"_PUIDPointerLayerKeyOpacityPairGenerationID"];
  unsigned int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) filters];
    id v5 = [v4 indexOfObjectPassingTest:&stru_100045730];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = v5;
      id v7 = [v4 mutableCopy];
      [v7 removeObjectAtIndex:v6];
      [*(id *)(a1 + 32) setFilters:v7];
    }
    [*(id *)(a1 + 32) setValue:0 forKeyPath:@"_PUIDPointerLayerKeyOpacityPairGenerationID"];
  }
  BOOL v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v8();
}

BOOL sub_100026674(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 name],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:@"opacityPair"],
        v6,
        v7))
  {
    BOOL v8 = 1;
    *a4 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t sub_100026700(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000267BC(double a1, uint64_t a2, void *a3, char a4, int a5)
{
  if ((a4 & 2) != 0) {
    unsigned int v7 = @"position.y";
  }
  else {
    unsigned int v7 = @"position.x";
  }
  if (a5)
  {
    BOOL v8 = v7;
    id v9 = a3;
    id v11 = [v9 layer];

    id v10 = +[NSNumber numberWithDouble:a1];
    [v11 setValue:v10 forKeyPath:v8];
  }
  else
  {
    v7;
    id v10 = a3;
    id v11 = +[NSNumber numberWithDouble:a1];
    objc_msgSend(v10, "_setPresentationValue:forKey:");
  }
}

void sub_10002712C(uint64_t a1, _DWORD *a2)
{
  switch(*a2)
  {
    case 0:
      CA_CGPointApplyTransform();
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 160), 0, v3, v4);
      break;
    case 1:
      CA_CGPointApplyTransform();
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 160), 0, v5, v6);
      break;
    case 2:
      CA_CGPointApplyTransform();
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CA_CGPointApplyTransform();
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 160), 0, v8, v10, v11, v12);
      break;
    case 3:
      CA_CGPointApplyTransform();
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CA_CGPointApplyTransform();
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CA_CGPointApplyTransform();
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 160), 0, v14, v16, v18, v20, v21, v22);
      break;
    case 4:
      double v23 = *(CGPath **)(a1 + 160);
      CGPathCloseSubpath(v23);
      break;
    default:
      return;
  }
}

void sub_10002739C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_10002746C(id a1)
{
  qword_100056038 = +[NSBundle bundleForClass:objc_opt_class()];
  _objc_release_x1();
}

id sub_100027980(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGFloat v3 = BSStringFromCGRect();
  id v4 = [v2 appendObject:v3 withName:@"_contentBounds"];

  CGFloat v6 = *(void **)(a1 + 32);
  CGFloat v5 = *(void **)(a1 + 40);
  double v7 = +[NSString stringWithFormat:@" m11: %f \n m12: %f \n m13: %f \n m14: %f \n m21: %f \n m22: %f \n m23: %f \n m24: %f \n m31: %f \n m32: %f \n m33: %f \n m34: %f \n m41: %f \n m42: %f \n m43: %f \n m44: %f \n", v5[5], v5[6], v5[7], v5[8], v5[9], v5[10], v5[11], v5[12], v5[13], v5[14], v5[15], v5[16], v5[17], v5[18], v5[19], v5[20]];
  id v8 = [v6 appendObject:v7 withName:@"_clientCoordinateSpaceTransformToDisplay"];

  id v9 = [*(id *)(a1 + 32) appendFloat:@"_contentHoverInverseScale" withName:*(double *)(*(void *)(a1 + 40) + 168)];
  id v10 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 176) withName:@"_contentMatchMoveSource"];
  CGFloat v11 = *(void **)(a1 + 32);
  CGFloat v12 = *(void **)(*(void *)(a1 + 40) + 184);
  if (v12)
  {
    [v12 CGPointValue];
    double v13 = BSStringFromCGPoint();
    id v14 = [v11 appendObject:v13 withName:@"_contentSlipValue"];
  }
  else
  {
    id v15 = [*(id *)(a1 + 32) appendObject:@"<nil>" withName:@"_contentSlipValue"];
  }
  CGFloat v16 = *(void **)(a1 + 32);
  double v17 = BSStringFromCGPoint();
  id v18 = [v16 appendObject:v17 withName:@"_modelPointerReferencePosition"];

  id v19 = [*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 208) withName:@"_overlayEffectStyle"];
  id v20 = [*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 216) withName:@"_pointerMaterialLuminance"];
  id v21 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 224) withName:@"_pointerPortalSourceCollection"];
  id v22 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 232) withName:@"_pointerShape"];
  double v23 = *(void **)(a1 + 32);
  id v24 = *(void **)(*(void *)(a1 + 40) + 240);
  if (v24)
  {
    [v24 CGPointValue];
    id v25 = BSStringFromCGPoint();
    id v26 = [v23 appendObject:v25 withName:@"_pointerSlipValue"];
  }
  else
  {
    id v27 = [*(id *)(a1 + 32) appendObject:@"<nil>" withName:@"_pointerSlipValue"];
  }
  id v28 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 248) withName:@"_debugRequestingClientString"];
  id v29 = [*(id *)(a1 + 32) appendFloat:@"_pointerVisualIntensity" withName:*(double *)(*(void *)(a1 + 40) + 256)];
  id v30 = [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 264) withName:@"_pointerAutoHidden"];
  id v31 = [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 265) withName:@"_pointerUnderlayingContent"];
  id v32 = [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 266) withName:@"_pressed"];
  return [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 267) withName:@"_suppressPointerMirroring"];
}

void sub_100027EB4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Changed material Alpha: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100027F2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Changed material Style: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100027FA4(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ZoomServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PUIDAXSoftLinking.m", 11, @"%s", *a1);

  __break(1u);
}

void sub_100028024()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getZoomServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PUIDAXSoftLinking.m", 12, @"Unable to find class %s", "ZoomServices");

  __break(1u);
}

void sub_1000280A0()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (((typeof (ZWAttributeKeyZoomLevel) (*)(void))0)()) getZWAttributeKeyZoomLevel(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PUIDAXSoftLinking.m", 13, @"%s", dlerror());

  __break(1u);
}

void sub_100028118()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (((typeof (ZWAttributeKeyInStandbyMode) (*)(void))0)()) getZWAttributeKeyInStandbyMode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PUIDAXSoftLinking.m", 14, @"%s", dlerror());

  __break(1u);
}

void sub_100028190(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PUIDAXSoftLinking.m", 16, @"%s", *a1);

  __break(1u);
}

void sub_100028210()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getAXSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PUIDAXSoftLinking.m", 17, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void sub_10002828C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (((typeof (AXZoomLensModeWindowAnchored) (*)(void))0)()) getAXZoomLensModeWindowAnchored(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PUIDAXSoftLinking.m", 18, @"%s", dlerror());

  __break(1u);
}

void sub_100028304(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[PUIDPointerController xpcClientContextController:didUpdateHoverRegion:forClient:transitionCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s - Hover region update from %@ disallowed while context-locked.", (uint8_t *)&v2, 0x16u);
}

void sub_100028390(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Deferring material changes", v1, 2u);
}

void sub_1000283D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Resuming material changes", v1, 2u);
}

void sub_100028418(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Region contains invalid numeric values, rejecting region.", v1, 2u);
}

void sub_10002845C()
{
  sub_100016130();
  sub_100016114((void *)&_mh_execute_header, v0, v1, "Ignoring autohide request because missing pointerClient from connection (%@)", v2, v3, v4, v5, v6);
}

void sub_1000284C4()
{
  sub_100016130();
  sub_100016114((void *)&_mh_execute_header, v0, v1, "Ignoring persistent hide request because missing pointerClient from connection (%@)", v2, v3, v4, v5, v6);
}

void sub_10002852C()
{
  sub_100016130();
  sub_100016114((void *)&_mh_execute_header, v0, v1, "Ignoring persistent show request because missing pointerClient from connection (%@)", v2, v3, v4, v5, v6);
}

void sub_100028594()
{
  sub_100016130();
  __int16 v2 = 2114;
  CFStringRef v3 = @"com.apple.pointerui.set-system-cursor-interaction-context";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring request to override hover regions from client missing entitlement %{public}@", v1, 0x16u);
}

void sub_10002861C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping pointer UI update due to invalid position.", v1, 2u);
}

void sub_100028660()
{
  sub_100027384();
  sub_10002739C((void *)&_mh_execute_header, v0, v1, "Got Inf from: %@.y \n%@");
}

void sub_1000286C8()
{
  sub_100027384();
  sub_10002739C((void *)&_mh_execute_header, v0, v1, "Got NaN from: %@.y \n%@");
}

void sub_100028730()
{
  sub_100027384();
  sub_10002739C((void *)&_mh_execute_header, v0, v1, "Got Inf from: %@.x \n%@");
}

void sub_100028798()
{
  sub_100027384();
  sub_10002739C((void *)&_mh_execute_header, v0, v1, "Got NaN from: %@.x \n%@");
}

uint64_t BKSHIDEventGetConciseDescription()
{
  return _BKSHIDEventGetConciseDescription();
}

uint64_t BKSHIDEventGetPointerAttributes()
{
  return _BKSHIDEventGetPointerAttributes();
}

uint64_t BKSHIDServicesGetCALayerTransform()
{
  return _BKSHIDServicesGetCALayerTransform();
}

uint64_t BSDegreesToRadians()
{
  return _BSDegreesToRadians();
}

uint64_t BSDispatchQueueCreateWithFixedPriority()
{
  return _BSDispatchQueueCreateWithFixedPriority();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return _BSDispatchQueueCreateWithQualityOfService();
}

uint64_t BSEqualObjects()
{
  return _BSEqualObjects();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return _BSFloatApproximatelyEqualToFloat();
}

uint64_t BSFloatEqualToFloat()
{
  return _BSFloatEqualToFloat();
}

uint64_t BSFloatGreaterThanFloat()
{
  return _BSFloatGreaterThanFloat();
}

uint64_t BSFloatIsOne()
{
  return _BSFloatIsOne();
}

uint64_t BSFloatIsZero()
{
  return _BSFloatIsZero();
}

uint64_t BSFloatLessThanFloat()
{
  return _BSFloatLessThanFloat();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return _BSFloatLessThanOrEqualToFloat();
}

uint64_t BSMonotonicReferencedTimeFromMachTime()
{
  return _BSMonotonicReferencedTimeFromMachTime();
}

uint64_t BSPointEqualToPoint()
{
  return _BSPointEqualToPoint();
}

uint64_t BSPointRoundForScale()
{
  return _BSPointRoundForScale();
}

uint64_t BSPthreadSetFixedPriority()
{
  return _BSPthreadSetFixedPriority();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return _BSSetMainThreadPriorityFixedForUI();
}

uint64_t BSStringFromCGPoint()
{
  return _BSStringFromCGPoint();
}

uint64_t BSStringFromCGRect()
{
  return _BSStringFromCGRect();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

uint64_t CALayerGetRenderId()
{
  return _CALayerGetRenderId();
}

uint64_t CARenderServerSnapshot()
{
  return _CARenderServerSnapshot();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DConcat(retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DEqualToTransform(a, b);
}

uint64_t CATransform3DGetDecomposition_()
{
  return _CATransform3DGetDecomposition_();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return _CATransform3DInvert(retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DScale(retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DTranslate(retstr, t, tx, ty, tz);
}

uint64_t CA_CGPointApplyTransform()
{
  return _CA_CGPointApplyTransform();
}

uint64_t CA_CGRectApplyTransform()
{
  return _CA_CGRectApplyTransform();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return _CGAffineTransformIsIdentity(t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateSRGB(red, green, blue, alpha);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return _CGPathCreateCopy(path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRoundedRect(rect, cornerWidth, cornerHeight, transform);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return _CGPathEqualToPath(path1, path2);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return _CGPathRetain(path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t IOHIDEventGetChildren()
{
  return _IOHIDEventGetChildren();
}

uint64_t IOHIDEventGetFloatMultiple()
{
  return _IOHIDEventGetFloatMultiple();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetPhase()
{
  return _IOHIDEventGetPhase();
}

uint64_t IOHIDEventGetSenderID()
{
  return _IOHIDEventGetSenderID();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PSIntensityForLuminanceAndUsage()
{
  return _PSIntensityForLuminanceAndUsage();
}

uint64_t PSLogAutohide()
{
  return _PSLogAutohide();
}

uint64_t PSLogCommon()
{
  return _PSLogCommon();
}

uint64_t PSLogMaterial()
{
  return _PSLogMaterial();
}

uint64_t PSPointerAutohideReasonToString()
{
  return _PSPointerAutohideReasonToString();
}

uint64_t PSPointerClientInteractionStateToString()
{
  return _PSPointerClientInteractionStateToString();
}

uint64_t PSPointerVibrantColorMatrixForLuminance()
{
  return _PSPointerVibrantColorMatrixForLuminance();
}

uint64_t PSPointerVisibilityStateToString()
{
  return _PSPointerVisibilityStateToString();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIDistanceBetweenPoints()
{
  return _UIDistanceBetweenPoints();
}

uint64_t UIIntegralTransform()
{
  return _UIIntegralTransform();
}

uint64_t UIPointAlongLine()
{
  return _UIPointAlongLine();
}

uint64_t UIRectCenteredRect()
{
  return _UIRectCenteredRect();
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

uint64_t _AXSPointerAutoHideEnabled()
{
  return __AXSPointerAutoHideEnabled();
}

uint64_t _AXSPointerInertiaEnabled()
{
  return __AXSPointerInertiaEnabled();
}

uint64_t _AXSPointerScaleWithZoomLevelEnabled()
{
  return __AXSPointerScaleWithZoomLevelEnabled();
}

uint64_t _AXSPointerShouldShowCenterPoint()
{
  return __AXSPointerShouldShowCenterPoint();
}

uint64_t _AXSPointerSizeMultiplier()
{
  return __AXSPointerSizeMultiplier();
}

uint64_t _AXSPointerStrokeColor()
{
  return __AXSPointerStrokeColor();
}

uint64_t _AXSPointerStrokeColorValues()
{
  return __AXSPointerStrokeColorValues();
}

uint64_t _AXSPointerStrokeColorWidth()
{
  return __AXSPointerStrokeColorWidth();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

long double hypot(long double __x, long double __y)
{
  return _hypot(__x, __y);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

id objc_msgSend_BSAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 BSAnimationSettings];
}

id objc_msgSend_CATransform3DValue(void *a1, const char *a2, ...)
{
  return [a1 CATransform3DValue];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return [a1 _FBSScene];
}

id objc_msgSend__axPointerZoomScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 _axPointerZoomScaleFactor];
}

id objc_msgSend__axRegisterForZoomUpdatesIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _axRegisterForZoomUpdatesIfNecessary];
}

id objc_msgSend__axUpdateInvertColorsFilters(void *a1, const char *a2, ...)
{
  return [a1 _axUpdateInvertColorsFilters];
}

id objc_msgSend__beginPeriodicClientTransformRefreshTimer(void *a1, const char *a2, ...)
{
  return [a1 _beginPeriodicClientTransformRefreshTimer];
}

id objc_msgSend__bindingLayer(void *a1, const char *a2, ...)
{
  return [a1 _bindingLayer];
}

id objc_msgSend__cancelActiveGestureResetTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelActiveGestureResetTimer];
}

id objc_msgSend__cancelAutohideTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelAutohideTimer];
}

id objc_msgSend__cancelDelayedMouseRecenteringTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelDelayedMouseRecenteringTimer];
}

id objc_msgSend__cancelDelayedUnhideTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelDelayedUnhideTimer];
}

id objc_msgSend__cancelProvisionalPromotionTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelProvisionalPromotionTimer];
}

id objc_msgSend__clientInteractionState(void *a1, const char *a2, ...)
{
  return [a1 _clientInteractionState];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__createMatchMoveSourceView(void *a1, const char *a2, ...)
{
  return [a1 _createMatchMoveSourceView];
}

id objc_msgSend__currentPointerViewBezierPath(void *a1, const char *a2, ...)
{
  return [a1 _currentPointerViewBezierPath];
}

id objc_msgSend__decelerationRate(void *a1, const char *a2, ...)
{
  return [a1 _decelerationRate];
}

id objc_msgSend__eventFetchRunLoop(void *a1, const char *a2, ...)
{
  return [a1 _eventFetchRunLoop];
}

id objc_msgSend__handleAccessibilityPointerPreferencesDidChange(void *a1, const char *a2, ...)
{
  return [a1 _handleAccessibilityPointerPreferencesDidChange];
}

id objc_msgSend__handlePeriodicRefreshTimerAction(void *a1, const char *a2, ...)
{
  return [a1 _handlePeriodicRefreshTimerAction];
}

id objc_msgSend__hidEvent(void *a1, const char *a2, ...)
{
  return [a1 _hidEvent];
}

id objc_msgSend__identifierOfCAContext(void *a1, const char *a2, ...)
{
  return [a1 _identifierOfCAContext];
}

id objc_msgSend__performRecenteringForActiveFocusRegion(void *a1, const char *a2, ...)
{
  return [a1 _performRecenteringForActiveFocusRegion];
}

id objc_msgSend__pointerVisibilityState(void *a1, const char *a2, ...)
{
  return [a1 _pointerVisibilityState];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__resetPointerVelocity(void *a1, const char *a2, ...)
{
  return [a1 _resetPointerVelocity];
}

id objc_msgSend__restartActiveGestureResetTimer(void *a1, const char *a2, ...)
{
  return [a1 _restartActiveGestureResetTimer];
}

id objc_msgSend__restartAutohideTimer(void *a1, const char *a2, ...)
{
  return [a1 _restartAutohideTimer];
}

id objc_msgSend__restartDelayedMouseRecenteringTimer(void *a1, const char *a2, ...)
{
  return [a1 _restartDelayedMouseRecenteringTimer];
}

id objc_msgSend__rotation(void *a1, const char *a2, ...)
{
  return [a1 _rotation];
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _sceneIdentifier];
}

id objc_msgSend__setEventFetchThreadPriorityWhenPossible(void *a1, const char *a2, ...)
{
  return [a1 _setEventFetchThreadPriorityWhenPossible];
}

id objc_msgSend__startDelayedUnhideTimer(void *a1, const char *a2, ...)
{
  return [a1 _startDelayedUnhideTimer];
}

id objc_msgSend__startProvisionalPromotionTimer(void *a1, const char *a2, ...)
{
  return [a1 _startProvisionalPromotionTimer];
}

id objc_msgSend__systemPointerClients(void *a1, const char *a2, ...)
{
  return [a1 _systemPointerClients];
}

id objc_msgSend__updatePointerHiddenByEntitledClients(void *a1, const char *a2, ...)
{
  return [a1 _updatePointerHiddenByEntitledClients];
}

id objc_msgSend__updatePointerMaterial(void *a1, const char *a2, ...)
{
  return [a1 _updatePointerMaterial];
}

id objc_msgSend__updatePointerViewCornerCurve(void *a1, const char *a2, ...)
{
  return [a1 _updatePointerViewCornerCurve];
}

id objc_msgSend__updatePointerVisibleByEntitledClients(void *a1, const char *a2, ...)
{
  return [a1 _updatePointerVisibleByEntitledClients];
}

id objc_msgSend__updateServiceKeepAlive(void *a1, const char *a2, ...)
{
  return [a1 _updateServiceKeepAlive];
}

id objc_msgSend_acceleratedRelativePositionX(void *a1, const char *a2, ...)
{
  return [a1 acceleratedRelativePositionX];
}

id objc_msgSend_acceleratedRelativePositionY(void *a1, const char *a2, ...)
{
  return [a1 acceleratedRelativePositionY];
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return [a1 accessories];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeHoverRegion(void *a1, const char *a2, ...)
{
  return [a1 activeHoverRegion];
}

id objc_msgSend_activeMultilinePrefix(void *a1, const char *a2, ...)
{
  return [a1 activeMultilinePrefix];
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return [a1 affineTransform];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowPositionToPositionAnimations(void *a1, const char *a2, ...)
{
  return [a1 allowPositionToPositionAnimations];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return [a1 angle];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_autohideDurationForFocusedPointer(void *a1, const char *a2, ...)
{
  return [a1 autohideDurationForFocusedPointer];
}

id objc_msgSend_autohideDurationForFocusedPointerMouse(void *a1, const char *a2, ...)
{
  return [a1 autohideDurationForFocusedPointerMouse];
}

id objc_msgSend_autohideDurationForSystemPointer(void *a1, const char *a2, ...)
{
  return [a1 autohideDurationForSystemPointer];
}

id objc_msgSend_autohideDurationForSystemPointerMouse(void *a1, const char *a2, ...)
{
  return [a1 autohideDurationForSystemPointerMouse];
}

id objc_msgSend_automaticRegionExitDelayInterval(void *a1, const char *a2, ...)
{
  return [a1 automaticRegionExitDelayInterval];
}

id objc_msgSend_axLargeSystemPointerCenterDotSize(void *a1, const char *a2, ...)
{
  return [a1 axLargeSystemPointerCenterDotSize];
}

id objc_msgSend_backdropLayer(void *a1, const char *a2, ...)
{
  return [a1 backdropLayer];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return [a1 blueColor];
}

id objc_msgSend_blurRadius(void *a1, const char *a2, ...)
{
  return [a1 blurRadius];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_builtinDisplay(void *a1, const char *a2, ...)
{
  return [a1 builtinDisplay];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clientCoordinateSpaceTransformToDisplay(void *a1, const char *a2, ...)
{
  return [a1 clientCoordinateSpaceTransformToDisplay];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contentBounds(void *a1, const char *a2, ...)
{
  return [a1 contentBounds];
}

id objc_msgSend_contentHoverInverseScale(void *a1, const char *a2, ...)
{
  return [a1 contentHoverInverseScale];
}

id objc_msgSend_contentMatchMoveSource(void *a1, const char *a2, ...)
{
  return [a1 contentMatchMoveSource];
}

id objc_msgSend_contentMatchMoveSourceTransitionCompletion(void *a1, const char *a2, ...)
{
  return [a1 contentMatchMoveSourceTransitionCompletion];
}

id objc_msgSend_contentMatchMoveSources(void *a1, const char *a2, ...)
{
  return [a1 contentMatchMoveSources];
}

id objc_msgSend_contentPortalView(void *a1, const char *a2, ...)
{
  return [a1 contentPortalView];
}

id objc_msgSend_contentSlipValue(void *a1, const char *a2, ...)
{
  return [a1 contentSlipValue];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextClass(void *a1, const char *a2, ...)
{
  return [a1 contextClass];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return [a1 contextId];
}

id objc_msgSend_contextRelativePointerPosition(void *a1, const char *a2, ...)
{
  return [a1 contextRelativePointerPosition];
}

id objc_msgSend_coordinateSpaceSourceContextID(void *a1, const char *a2, ...)
{
  return [a1 coordinateSpaceSourceContextID];
}

id objc_msgSend_coordinateSpaceSourceLayerRenderID(void *a1, const char *a2, ...)
{
  return [a1 coordinateSpaceSourceLayerRenderID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerCurve(void *a1, const char *a2, ...)
{
  return [a1 cornerCurve];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentShapeFrame(void *a1, const char *a2, ...)
{
  return [a1 currentShapeFrame];
}

id objc_msgSend_currentTarget(void *a1, const char *a2, ...)
{
  return [a1 currentTarget];
}

id objc_msgSend_customMorphInitialVelocityProgressMultiplier(void *a1, const char *a2, ...)
{
  return [a1 customMorphInitialVelocityProgressMultiplier];
}

id objc_msgSend_customShapeMorphAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 customShapeMorphAnimationSettings];
}

id objc_msgSend_dampingRatio(void *a1, const char *a2, ...)
{
  return [a1 dampingRatio];
}

id objc_msgSend_decelerationTargetLookupConeAngleInDegrees(void *a1, const char *a2, ...)
{
  return [a1 decelerationTargetLookupConeAngleInDegrees];
}

id objc_msgSend_decelerationTargetLookupRadius(void *a1, const char *a2, ...)
{
  return [a1 decelerationTargetLookupRadius];
}

id objc_msgSend_decelerationTargetLookupResolution(void *a1, const char *a2, ...)
{
  return [a1 decelerationTargetLookupResolution];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delayBeforeRecenteringAfterMouseMovement(void *a1, const char *a2, ...)
{
  return [a1 delayBeforeRecenteringAfterMouseMovement];
}

id objc_msgSend_delayBeforeUnhidingAfterGesturing(void *a1, const char *a2, ...)
{
  return [a1 delayBeforeUnhidingAfterGesturing];
}

id objc_msgSend_delayBeforeUnhidingOnTrackpadTouchDown(void *a1, const char *a2, ...)
{
  return [a1 delayBeforeUnhidingOnTrackpadTouchDown];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 displayConfiguration];
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return [a1 displayID];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return [a1 displayIdentity];
}

id objc_msgSend_displayUUID(void *a1, const char *a2, ...)
{
  return [a1 displayUUID];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_durationToAverageVelocityForClientInteractionThreshold(void *a1, const char *a2, ...)
{
  return [a1 durationToAverageVelocityForClientInteractionThreshold];
}

id objc_msgSend_extendAutomaticBootstrapCompletion(void *a1, const char *a2, ...)
{
  return [a1 extendAutomaticBootstrapCompletion];
}

id objc_msgSend_feather(void *a1, const char *a2, ...)
{
  return [a1 feather];
}

id objc_msgSend_fillColor(void *a1, const char *a2, ...)
{
  return [a1 fillColor];
}

id objc_msgSend_fillRule(void *a1, const char *a2, ...)
{
  return [a1 fillRule];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_finalTransform(void *a1, const char *a2, ...)
{
  return [a1 finalTransform];
}

id objc_msgSend_fingerDownCount(void *a1, const char *a2, ...)
{
  return [a1 fingerDownCount];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flexibleRectIntensityReductionRange(void *a1, const char *a2, ...)
{
  return [a1 flexibleRectIntensityReductionRange];
}

id objc_msgSend_focusedContentPositionAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 focusedContentPositionAnimationSettings];
}

id objc_msgSend_focusedPointerPositionAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 focusedPointerPositionAnimationSettings];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_globalDevicePreferences(void *a1, const char *a2, ...)
{
  return [a1 globalDevicePreferences];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hiddenToVisibleAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 hiddenToVisibleAnimationSettings];
}

id objc_msgSend_hiddenToVisiblePointerBlurRadius(void *a1, const char *a2, ...)
{
  return [a1 hiddenToVisiblePointerBlurRadius];
}

id objc_msgSend_hiddenToVisiblePointerScale(void *a1, const char *a2, ...)
{
  return [a1 hiddenToVisiblePointerScale];
}

id objc_msgSend_hiddenToVisibleScaleAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 hiddenToVisibleScaleAnimationSettings];
}

id objc_msgSend_hiddenToVisibleTeleportingAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 hiddenToVisibleTeleportingAnimationSettings];
}

id objc_msgSend_hitTestBounds(void *a1, const char *a2, ...)
{
  return [a1 hitTestBounds];
}

id objc_msgSend_hitTestContexts(void *a1, const char *a2, ...)
{
  return [a1 hitTestContexts];
}

id objc_msgSend_hoverRegionGenerationID(void *a1, const char *a2, ...)
{
  return [a1 hoverRegionGenerationID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initialTransform(void *a1, const char *a2, ...)
{
  return [a1 initialTransform];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intensity(void *a1, const char *a2, ...)
{
  return [a1 intensity];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAutomaticRegionExitTimer(void *a1, const char *a2, ...)
{
  return [a1 invalidateAutomaticRegionExitTimer];
}

id objc_msgSend_isActiveOnMainDisplay(void *a1, const char *a2, ...)
{
  return [a1 isActiveOnMainDisplay];
}

id objc_msgSend_isAssertingPointerHidden(void *a1, const char *a2, ...)
{
  return [a1 isAssertingPointerHidden];
}

id objc_msgSend_isAssertingPointerVisible(void *a1, const char *a2, ...)
{
  return [a1 isAssertingPointerVisible];
}

id objc_msgSend_isDecelerationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDecelerationEnabled];
}

id objc_msgSend_isDecelerationTargetLookupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDecelerationTargetLookupEnabled];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isLatching(void *a1, const char *a2, ...)
{
  return [a1 isLatching];
}

id objc_msgSend_isNumericDataValid(void *a1, const char *a2, ...)
{
  return [a1 isNumericDataValid];
}

id objc_msgSend_isPointerAutoHidden(void *a1, const char *a2, ...)
{
  return [a1 isPointerAutoHidden];
}

id objc_msgSend_isPointerSlipEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPointerSlipEnabled];
}

id objc_msgSend_isPointerUnderlayingContent(void *a1, const char *a2, ...)
{
  return [a1 isPointerUnderlayingContent];
}

id objc_msgSend_isPressed(void *a1, const char *a2, ...)
{
  return [a1 isPressed];
}

id objc_msgSend_isUnderlappingContentAllowed(void *a1, const char *a2, ...)
{
  return [a1 isUnderlappingContentAllowed];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return [a1 isVisible];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maskPath(void *a1, const char *a2, ...)
{
  return [a1 maskPath];
}

id objc_msgSend_materialStyle(void *a1, const char *a2, ...)
{
  return [a1 materialStyle];
}

id objc_msgSend_materialTransitionAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 materialTransitionAnimationSettings];
}

id objc_msgSend_minFlexibleRectDarkLuminanceIntensity(void *a1, const char *a2, ...)
{
  return [a1 minFlexibleRectDarkLuminanceIntensity];
}

id objc_msgSend_minFlexibleRectLightLuminanceIntensity(void *a1, const char *a2, ...)
{
  return [a1 minFlexibleRectLightLuminanceIntensity];
}

id objc_msgSend_minimumVelocityThresholdForDeceleration(void *a1, const char *a2, ...)
{
  return [a1 minimumVelocityThresholdForDeceleration];
}

id objc_msgSend_minimumVelocityThresholdForExpandedDecelerationLookup(void *a1, const char *a2, ...)
{
  return [a1 minimumVelocityThresholdForExpandedDecelerationLookup];
}

id objc_msgSend_modelPointerReferencePosition(void *a1, const char *a2, ...)
{
  return [a1 modelPointerReferencePosition];
}

id objc_msgSend_mouseRecenteringAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 mouseRecenteringAnimationSettings];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orientationMatchesAngle(void *a1, const char *a2, ...)
{
  return [a1 orientationMatchesAngle];
}

id objc_msgSend_overlayEffectPortalSource(void *a1, const char *a2, ...)
{
  return [a1 overlayEffectPortalSource];
}

id objc_msgSend_overlayEffectStyle(void *a1, const char *a2, ...)
{
  return [a1 overlayEffectStyle];
}

id objc_msgSend_overlayEffectTransitionCompletion(void *a1, const char *a2, ...)
{
  return [a1 overlayEffectTransitionCompletion];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_periodicClientTransformRefreshInterval(void *a1, const char *a2, ...)
{
  return [a1 periodicClientTransformRefreshInterval];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pinnedPoint(void *a1, const char *a2, ...)
{
  return [a1 pinnedPoint];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return [a1 point];
}

id objc_msgSend_pointValue(void *a1, const char *a2, ...)
{
  return [a1 pointValue];
}

id objc_msgSend_pointerAccelerationFactor(void *a1, const char *a2, ...)
{
  return [a1 pointerAccelerationFactor];
}

id objc_msgSend_pointerAccessoryAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 pointerAccessoryAnimationSettings];
}

id objc_msgSend_pointerIsVisible(void *a1, const char *a2, ...)
{
  return [a1 pointerIsVisible];
}

id objc_msgSend_pointerLatchingAxes(void *a1, const char *a2, ...)
{
  return [a1 pointerLatchingAxes];
}

id objc_msgSend_pointerMaterialLuminance(void *a1, const char *a2, ...)
{
  return [a1 pointerMaterialLuminance];
}

id objc_msgSend_pointerPortalSource(void *a1, const char *a2, ...)
{
  return [a1 pointerPortalSource];
}

id objc_msgSend_pointerPortalSourceCollection(void *a1, const char *a2, ...)
{
  return [a1 pointerPortalSourceCollection];
}

id objc_msgSend_pointerPortalSourceCollections(void *a1, const char *a2, ...)
{
  return [a1 pointerPortalSourceCollections];
}

id objc_msgSend_pointerRecenteringAxes(void *a1, const char *a2, ...)
{
  return [a1 pointerRecenteringAxes];
}

id objc_msgSend_pointerShape(void *a1, const char *a2, ...)
{
  return [a1 pointerShape];
}

id objc_msgSend_pointerSlipValue(void *a1, const char *a2, ...)
{
  return [a1 pointerSlipValue];
}

id objc_msgSend_pointerVelocitySmoothingWeight(void *a1, const char *a2, ...)
{
  return [a1 pointerVelocitySmoothingWeight];
}

id objc_msgSend_pointerVisualIntensity(void *a1, const char *a2, ...)
{
  return [a1 pointerVisualIntensity];
}

id objc_msgSend_portalLayer(void *a1, const char *a2, ...)
{
  return [a1 portalLayer];
}

id objc_msgSend_portalSourceTransitionCompletion(void *a1, const char *a2, ...)
{
  return [a1 portalSourceTransitionCompletion];
}

id objc_msgSend_positionRecordKey(void *a1, const char *a2, ...)
{
  return [a1 positionRecordKey];
}

id objc_msgSend_positionToPositionAnimationThreshold(void *a1, const char *a2, ...)
{
  return [a1 positionToPositionAnimationThreshold];
}

id objc_msgSend_preferredPointerMaterialLuminance(void *a1, const char *a2, ...)
{
  return [a1 preferredPointerMaterialLuminance];
}

id objc_msgSend_presentationIntensity(void *a1, const char *a2, ...)
{
  return [a1 presentationIntensity];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_presentationValue(void *a1, const char *a2, ...)
{
  return [a1 presentationValue];
}

id objc_msgSend_pressedScaleAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 pressedScaleAnimationSettings];
}

id objc_msgSend_previousPointerEventActiveHoverRegionHitTestState(void *a1, const char *a2, ...)
{
  return [a1 previousPointerEventActiveHoverRegionHitTestState];
}

id objc_msgSend_psDisplay(void *a1, const char *a2, ...)
{
  return [a1 psDisplay];
}

id objc_msgSend_rampingExitAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 rampingExitAnimationSettings];
}

id objc_msgSend_recenteringAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 recenteringAnimationSettings];
}

id objc_msgSend_registerInterestInZoomAttributes(void *a1, const char *a2, ...)
{
  return [a1 registerInterestInZoomAttributes];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return [a1 remoteProcess];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return [a1 remoteTarget];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_restrictingToPID(void *a1, const char *a2, ...)
{
  return [a1 restrictingToPID];
}

id objc_msgSend_rootSettings(void *a1, const char *a2, ...)
{
  return [a1 rootSettings];
}

id objc_msgSend_rootWindowTransform(void *a1, const char *a2, ...)
{
  return [a1 rootWindowTransform];
}

id objc_msgSend_samplingMatchMoveSource(void *a1, const char *a2, ...)
{
  return [a1 samplingMatchMoveSource];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return [a1 serviceQuality];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setDefaultValues(void *a1, const char *a2, ...)
{
  return [a1 setDefaultValues];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return [a1 shape];
}

id objc_msgSend_shapeLayer(void *a1, const char *a2, ...)
{
  return [a1 shapeLayer];
}

id objc_msgSend_shapeTransitionCompletion(void *a1, const char *a2, ...)
{
  return [a1 shapeTransitionCompletion];
}

id objc_msgSend_shapeType(void *a1, const char *a2, ...)
{
  return [a1 shapeType];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldAutohideAfterHitTestContextLoss(void *a1, const char *a2, ...)
{
  return [a1 shouldAutohideAfterHitTestContextLoss];
}

id objc_msgSend_shouldPeriodicallyRefreshClientTransform(void *a1, const char *a2, ...)
{
  return [a1 shouldPeriodicallyRefreshClientTransform];
}

id objc_msgSend_shouldPointerSuppressMirroring(void *a1, const char *a2, ...)
{
  return [a1 shouldPointerSuppressMirroring];
}

id objc_msgSend_shouldPointerUnderlayContent(void *a1, const char *a2, ...)
{
  return [a1 shouldPointerUnderlayContent];
}

id objc_msgSend_shouldRecenterAfterLiftingFinger(void *a1, const char *a2, ...)
{
  return [a1 shouldRecenterAfterLiftingFinger];
}

id objc_msgSend_shouldRecenterOnButtonDown(void *a1, const char *a2, ...)
{
  return [a1 shouldRecenterOnButtonDown];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceContextID(void *a1, const char *a2, ...)
{
  return [a1 sourceContextID];
}

id objc_msgSend_sourceLayerRenderID(void *a1, const char *a2, ...)
{
  return [a1 sourceLayerRenderID];
}

id objc_msgSend_specularOpacityAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 specularOpacityAnimationSettings];
}

id objc_msgSend_specularProminentLongestSideBaseMultiplier(void *a1, const char *a2, ...)
{
  return [a1 specularProminentLongestSideBaseMultiplier];
}

id objc_msgSend_specularProminentOpacityMultiplier(void *a1, const char *a2, ...)
{
  return [a1 specularProminentOpacityMultiplier];
}

id objc_msgSend_specularStandardLongestSideBaseMultiplier(void *a1, const char *a2, ...)
{
  return [a1 specularStandardLongestSideBaseMultiplier];
}

id objc_msgSend_specularStandardOpacityMultiplier(void *a1, const char *a2, ...)
{
  return [a1 specularStandardOpacityMultiplier];
}

id objc_msgSend_standardShapeAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 standardShapeAnimationSettings];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportsTeleporting(void *a1, const char *a2, ...)
{
  return [a1 supportsTeleporting];
}

id objc_msgSend_suppressPointerMirroring(void *a1, const char *a2, ...)
{
  return [a1 suppressPointerMirroring];
}

id objc_msgSend_systemInteractionsDecelerationTargetLookupRadius(void *a1, const char *a2, ...)
{
  return [a1 systemInteractionsDecelerationTargetLookupRadius];
}

id objc_msgSend_systemPointerPositionAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 systemPointerPositionAnimationSettings];
}

id objc_msgSend_systemPointerPositionHighQualityFrequencyAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 systemPointerPositionHighQualityFrequencyAnimationSettings];
}

id objc_msgSend_systemPointerPressedScale(void *a1, const char *a2, ...)
{
  return [a1 systemPointerPressedScale];
}

id objc_msgSend_systemPointerSize(void *a1, const char *a2, ...)
{
  return [a1 systemPointerSize];
}

id objc_msgSend_systemShape(void *a1, const char *a2, ...)
{
  return [a1 systemShape];
}

id objc_msgSend_tapToClickButtonDownTime(void *a1, const char *a2, ...)
{
  return [a1 tapToClickButtonDownTime];
}

id objc_msgSend_textContentPointerPositionAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 textContentPointerPositionAnimationSettings];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_tokenForCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 tokenForCurrentProcess];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transform3D(void *a1, const char *a2, ...)
{
  return [a1 transform3D];
}

id objc_msgSend_transformFromClientContextToDisplay(void *a1, const char *a2, ...)
{
  return [a1 transformFromClientContextToDisplay];
}

id objc_msgSend_underlayingPointerPressedScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 underlayingPointerPressedScaleFactor];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_usesEvenOddFillRule(void *a1, const char *a2, ...)
{
  return [a1 usesEvenOddFillRule];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_velocityThresholdForClientInteraction(void *a1, const char *a2, ...)
{
  return [a1 velocityThresholdForClientInteraction];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibilityTransitionCompletion(void *a1, const char *a2, ...)
{
  return [a1 visibilityTransitionCompletion];
}

id objc_msgSend_visibleIntensityAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 visibleIntensityAnimationSettings];
}

id objc_msgSend_visibleToHiddenAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 visibleToHiddenAnimationSettings];
}

id objc_msgSend_visibleToHiddenPointerBlurRadius(void *a1, const char *a2, ...)
{
  return [a1 visibleToHiddenPointerBlurRadius];
}

id objc_msgSend_visibleToHiddenPointerScale(void *a1, const char *a2, ...)
{
  return [a1 visibleToHiddenPointerScale];
}

id objc_msgSend_visibleToHiddenScaleAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 visibleToHiddenScaleAnimationSettings];
}

id objc_msgSend_visibleToHiddenTeleportingAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 visibleToHiddenTeleportingAnimationSettings];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_zTransitionOpacityAnimationSettings(void *a1, const char *a2, ...)
{
  return [a1 zTransitionOpacityAnimationSettings];
}

id objc_msgSend_zoomLevel(void *a1, const char *a2, ...)
{
  return [a1 zoomLevel];
}

id objc_msgSend_zoomPreferredCurrentLensMode(void *a1, const char *a2, ...)
{
  return [a1 zoomPreferredCurrentLensMode];
}