void sub_217C0D6EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C0D7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t stringFromTransform(void *a1, uint64_t a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @", %@ = {{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}", a2, *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14],
           a1[15]);
}

void sub_217C10F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 64));
  objc_destroyWeak((id *)(v20 - 56));
  _Unwind_Resume(a1);
}

uint64_t __NUUILogger_block_invoke()
{
  return MEMORY[0x270F4E548]();
}

void AlwaysApplyPerFrameHDRDisplayMetadata()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v0 BOOLForKey:@"debugTryDolbyInEdit"];
}

void sub_217C138F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _commonInit(void *a1)
{
  id v1 = a1;
  id v2 = [v1 layer];
  [v2 addObserver:v1 forKeyPath:@"readyForDisplay" options:4 context:PlayerLayerReadyForDisplayObservationContext];
}

uint64_t __NUUILogger_block_invoke_81()
{
  return MEMORY[0x270F4E548]();
}

id NUMediaTimingFunctionForUIAnimationCurve(unint64_t a1)
{
  if (a1 > 3)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x263F15808], "functionWithName:", **((void **)&unk_2642C2EA0 + a1), v1);
  }
  return v3;
}

id NUAssertLogger()
{
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_413);
  }
  id v0 = (void *)*MEMORY[0x263F586E8];

  return v0;
}

uint64_t __NUAssertLogger_block_invoke()
{
  return MEMORY[0x270F4E548]();
}

id NUAssertLogger_153()
{
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_123);
  }
  id v0 = (void *)*MEMORY[0x263F586E8];

  return v0;
}

uint64_t __NULogger_block_invoke()
{
  return MEMORY[0x270F4E548]();
}

uint64_t __NUAssertLogger_block_invoke_177()
{
  return MEMORY[0x270F4E548]();
}

void sub_217C18AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_217C18FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy__273(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__274(uint64_t a1)
{
}

uint64_t NSStringFromCATransform3D(void *a1)
{
  return [NSString stringWithFormat:@"{%.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g}", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]];
}

id NUAssertLogger_418()
{
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_459);
  }
  id v0 = (void *)*MEMORY[0x263F586E8];

  return v0;
}

uint64_t __NUAssertLogger_block_invoke_428()
{
  return MEMORY[0x270F4E548]();
}

void sub_217C1BC70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t __NUUILogger_block_invoke_437()
{
  return MEMORY[0x270F4E548]();
}

void sub_217C1CC58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217C1CD94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217C1E168(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__477(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__478(uint64_t a1)
{
}

void sub_217C1E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217C1EBA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __NUUILogger_block_invoke_594()
{
  return MEMORY[0x270F4E548]();
}

void _NUViewCommonInit(void *a1)
{
  id v1 = a1;
  id v2 = [v1 layer];
  objc_msgSend(v2, "setAnchorPoint:", 0.5, 0.5);
  [v2 setMasksToBounds:0];
  v3 = (void *)*((void *)v1 + 56);
  *((void *)v1 + 56) = v2;
  id v14 = v2;

  v4 = +[_NUContainerLayer layer];
  [v4 setMasksToBounds:1];
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);
  [v1 bounds];
  objc_msgSend(v4, "setFrame:");
  [v14 addSublayer:v4];
  uint64_t v5 = (void *)*((void *)v1 + 53);
  *((void *)v1 + 53) = v4;
  id v6 = v4;

  v7 = +[_NUTiledBackfillLayer layer];
  objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.5);
  id v8 = [MEMORY[0x263F1C550] yellowColor];
  objc_msgSend(v7, "setDebugColor:", objc_msgSend(v8, "CGColor"));

  [v6 addSublayer:v7];
  uint64_t v9 = (void *)*((void *)v1 + 51);
  *((void *)v1 + 51) = v7;
  id v10 = v7;

  uint64_t v11 = +[_NUTiledROILayer layer];
  objc_msgSend(v11, "setAnchorPoint:", 0.5, 0.5);
  id v12 = [MEMORY[0x263F1C550] redColor];
  objc_msgSend(v11, "setDebugColor:", objc_msgSend(v12, "CGColor"));

  [v6 addSublayer:v11];
  uint64_t v13 = (void *)*((void *)v1 + 52);
  *((void *)v1 + 52) = v11;

  *((unsigned char *)v1 + 441) = 1;
}

void sub_217C20C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 64), 8);
  _Unwind_Resume(a1);
}

CGFloat NUBoundingRectForRotatedRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGRectGetWidth(*(CGRect *)&a1);
  __sincos_stret(a5);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetHeight(v11);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetWidth(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return a1;
}

double NURectCenterRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  double rect_8 = CGRectGetMinX(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  double Width = CGRectGetWidth(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double rect_8a = rect_8 + (Width - CGRectGetWidth(v23)) * 0.5;
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  CGRectGetMinY(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetHeight(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetHeight(v26);
  return rect_8a;
}

double NUEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = a1 + a6;
  double v9 = a3 - (a8 + a6);
  double v10 = v9 * 0.5;
  if (v9 > 0.0) {
    double v10 = -0.0;
  }
  return v8 + v10;
}

void NUMaxRectInRotatedRect(double a1, double a2, double a3, double a4, double a5)
{
  if (a3 > 0.0 && a4 > 0.0) {
    fabs(__sincos_stret(a5).__sinval);
  }
}

double NURectGetMidpoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

void NUFitScaleForImageRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (a3 > 0.0 && a4 > 0.0)
  {
    v16.origin.x = a5;
    v16.origin.y = a6;
    v16.size.width = a7;
    v16.size.height = a8;
    CGRectGetWidth(v16);
    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    CGRectGetWidth(v17);
    v18.origin.x = a5;
    v18.origin.y = a6;
    v18.size.width = a7;
    v18.size.height = a8;
    CGRectGetHeight(v18);
    v19.origin.x = a1;
    v19.origin.y = a2;
    v19.size.width = a3;
    v19.size.height = a4;
    CGRectGetHeight(v19);
  }
}

__n128 CATransform3DFromDouble4x4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  long long v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v4;
  __n128 result = *(__n128 *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(__n128 *)(a2 + 112) = result;
  return result;
}

__n128 CATransform3DToDouble4x4@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 112);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  a2[2] = v4;
  a2[3] = v5;
  a2[4] = v6;
  a2[5] = v7;
  a2[6] = v8;
  a2[7] = v9;
  return result;
}

__n128 Double4x4MakeTranslation@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *((void *)&v3 + 1) = 1.0;
  *(_OWORD *)a2 = xmmword_217C25300;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = xmmword_217C25310;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = xmmword_217C25300;
  *(__n128 *)(a2 + 96) = result;
  *(_OWORD *)(a2 + 112) = v3;
  return result;
}

double Double4x4MakeScale@<D0>(unint64_t *a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q3>)
{
  *(void *)&long long v3 = 0;
  *((void *)&v3 + 1) = a1[1];
  double result = 0.0;
  a3.n128_u64[0] = a1[2];
  *(_OWORD *)a2 = *a1;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(__n128 *)(a2 + 80) = a3;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = xmmword_217C25310;
  return result;
}

double Double4x4MakeRotation@<D0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  float64x2_t v4 = a1[1];
  float64x2_t v5 = vmulq_f64(v4, v4);
  v5.f64[0] = 1.0 / sqrt(v5.f64[0] + vaddvq_f64(vmulq_f64(*a1, *a1)));
  float64x2_t v15 = vmulq_n_f64(*a1, v5.f64[0]);
  double v16 = vmulq_f64(v4, v5).f64[0];
  __double2 v6 = __sincos_stret(a3);
  float64x2_t v7 = v15;
  *(double *)&long long v8 = v6.__cosval + vmuld_n_f64(v7.f64[0], v7.f64[0]) * (1.0 - v6.__cosval);
  double v9 = vmuld_n_f64(v16, v15.f64[0]);
  double v10 = vmuld_lane_f64(v6.__sinval, v15, 1);
  v11.f64[0] = -(v6.__sinval * v16);
  float64x2_t v12 = vmulq_laneq_f64(v7, v7, 1);
  *((void *)&v8 + 1) = vmlad_n_f64(v6.__sinval * v16, 1.0 - v6.__cosval, v12.f64[0]);
  *(_OWORD *)a2 = v8;
  *(_OWORD *)(a2 + 16) = COERCE_UNSIGNED_INT64(-(v10 - v9 * (1.0 - v6.__cosval)));
  v11.f64[1] = v6.__cosval;
  *(double *)&long long v8 = vmuld_lane_f64(v16, v15, 1);
  *(float64x2_t *)(a2 + 32) = vmlaq_n_f64(v11, v12, 1.0 - v6.__cosval);
  *(_OWORD *)(a2 + 48) = COERCE_UNSIGNED_INT64(v6.__sinval * v15.f64[0] + *(double *)&v8 * (1.0 - v6.__cosval));
  *(double *)&long long v13 = v10 + v9 * (1.0 - v6.__cosval);
  *((double *)&v13 + 1) = -(v6.__sinval * v15.f64[0] - *(double *)&v8 * (1.0 - v6.__cosval));
  *(_OWORD *)(a2 + 64) = v13;
  *(_OWORD *)(a2 + 80) = COERCE_UNSIGNED_INT64(v6.__cosval + vmuld_n_f64(v16, v16) * (1.0 - v6.__cosval));
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + 112) = xmmword_217C25310;
  return result;
}

id NUAssertLogger_749()
{
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_766);
  }
  id v0 = (void *)*MEMORY[0x263F586E8];

  return v0;
}

uint64_t __NUAssertLogger_block_invoke_769()
{
  return MEMORY[0x270F4E548]();
}

id NUAssertLogger_802()
{
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_817);
  }
  id v0 = (void *)*MEMORY[0x263F586E8];

  return v0;
}

uint64_t __NUAssertLogger_block_invoke_820()
{
  return MEMORY[0x270F4E548]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x270EFB928](t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
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

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
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

uint64_t NSStringFromNUPixelSize()
{
  return MEMORY[0x270F4E418]();
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t NUAbsolutePointInRect()
{
  return MEMORY[0x270F4E420]();
}

uint64_t NUAbsoluteTime()
{
  return MEMORY[0x270F4E428]();
}

uint64_t NUAlignRectToPixelGrid()
{
  return MEMORY[0x270F4E430]();
}

uint64_t NUCGRectConvertFromRectToRect()
{
  return MEMORY[0x270F4E438]();
}

uint64_t NUPixelPointToCGPoint()
{
  return MEMORY[0x270F4E478]();
}

uint64_t NUPixelRectFlipYOrigin()
{
  return MEMORY[0x270F4E480]();
}

uint64_t NUPixelRectFromCGRect()
{
  return MEMORY[0x270F4E488]();
}

uint64_t NUPixelRectIntersection()
{
  return MEMORY[0x270F4E490]();
}

uint64_t NUPixelRectOffset()
{
  return MEMORY[0x270F4E4A0]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x270F4E4B0]();
}

uint64_t NUPixelSizeEqualToSize()
{
  return MEMORY[0x270F4E4C0]();
}

uint64_t NUPixelSizeFromCGSize()
{
  return MEMORY[0x270F4E4C8]();
}

uint64_t NUPixelSizeIsEmpty()
{
  return MEMORY[0x270F4E4D0]();
}

uint64_t NUPixelSizeToCGRect()
{
  return MEMORY[0x270F4E4D8]();
}

uint64_t NUPixelSizeToCGSize()
{
  return MEMORY[0x270F4E4E0]();
}

uint64_t NURectDenormalize()
{
  return MEMORY[0x270F4E4E8]();
}

uint64_t NURectFlipYOrigin()
{
  return MEMORY[0x270F4E4F0]();
}

uint64_t NURectNormalize()
{
  return MEMORY[0x270F4E4F8]();
}

uint64_t NUScaleCompare()
{
  return MEMORY[0x270F4E500]();
}

uint64_t NUScaleEqual()
{
  return MEMORY[0x270F4E508]();
}

uint64_t NUScaleInvert()
{
  return MEMORY[0x270F4E510]();
}

uint64_t NUScaleRect()
{
  return MEMORY[0x270F4E520]();
}

uint64_t NUScaleToDouble()
{
  return MEMORY[0x270F4E528]();
}

uint64_t NUScaleToFitSizeInSize()
{
  return MEMORY[0x270F4E530]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NUAssertContinueHandler()
{
  return MEMORY[0x270F4E538]();
}

uint64_t _NUAssertFailHandler()
{
  return MEMORY[0x270F4E540]();
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}