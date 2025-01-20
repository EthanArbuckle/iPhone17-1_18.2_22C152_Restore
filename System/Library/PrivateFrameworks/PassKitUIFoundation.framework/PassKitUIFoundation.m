void PKCategoryVisualizationRendererStateDestroy(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 16) = 0;
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 24) = 0;
  }
}

double simd_matrix4x4(float32x4_t a1)
{
  _S3 = a1.i32[1];
  _S5 = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  float v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

void *PKTextureLoaderResultCreateDefaultPrivate2DTexture(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 && v6)
  {
    if (*(void *)(a1 + 32))
    {
      id v9 = *(id *)a1;
      if (v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x263F12A50]);
        [v10 setPixelFormat:*(void *)(a1 + 32)];
        [v10 setStorageMode:2];
        [v10 setWidth:*(void *)(a1 + 8)];
        [v10 setHeight:*(void *)(a1 + 16)];
        v8 = (void *)[v5 newTextureWithDescriptor:v10];
        if (v8)
        {
          uint64_t v11 = *(void *)(a1 + 24);
          uint64_t v12 = [v9 length];
          memset(v15, 0, sizeof(v15));
          long long v16 = *(_OWORD *)(a1 + 8);
          uint64_t v17 = 1;
          [v7 copyFromBuffer:v9 sourceOffset:0 sourceBytesPerRow:v11 sourceBytesPerImage:v12 sourceSize:&v16 toTexture:v8 destinationSlice:0 destinationLevel:0 destinationOrigin:v15];
          id v13 = v8;
        }
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

void sub_21EECBA00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

double PKMakeFloat4FromCGColor(CGColor *a1)
{
  v2 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v2, kCGRenderingIntentDefault, a1, 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  if (!CopyByMatchingToColorSpace) {
    return 0.0;
  }
  id v5 = (float64x2_t *)Components;
  size_t NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
  unint64_t v7 = 0;
  if (NumberOfComponents == 4) {
    unint64_t v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v5), v5[1]).u64[0];
  }
  double v9 = *(double *)&v7;
  CGColorRelease(CopyByMatchingToColorSpace);
  return v9;
}

void sub_21EECD194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EECE9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _LAPolicyContainerForPKPolicy(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = 1004;
      break;
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 1005;
      break;
    case 3:
      uint64_t result = 1006;
      break;
    case 4:
      uint64_t result = 1005;
      break;
    case 5:
    case 6:
    case 7:
      uint64_t result = 0;
      break;
    case 8:
      PKUserIntentIsAvailable();
      uint64_t result = 1015;
      break;
    case 9:
      uint64_t result = 0;
      break;
    case 10:
      uint64_t result = 1004;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_21EECEBA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EECF4E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21EED0250(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EED0420(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EED0638(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EED0D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EED3F00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void _AccessPreflightContext(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = a2;
    os_unfair_lock_lock(&_AccessPreflightContext_lock);
    double v4 = CACurrentMediaTime();
    id v5 = (void *)_AccessPreflightContext_context;
    if (!_AccessPreflightContext_context
      || (double v6 = *(double *)&_AccessPreflightContext_lastCreatedTime,
          int v7 = [(id)_AccessPreflightContext_context useLocationBasedAuthorization],
          (id v5 = (void *)_AccessPreflightContext_context) == 0)
      || ((v8 = v7 ^ a1, v4 - v6 < 5.0) ? (BOOL v9 = v8 == 0) : (BOOL v9 = 0), !v9))
    {
      [v5 invalidate];
      _AccessPreflightContext_lastCreatedTime = *(void *)&v4;
      id v10 = [[PKAuthenticatorPreflightContext alloc] initForLocationBasedAuthorization:a1];
      uint64_t v11 = (void *)_AccessPreflightContext_context;
      _AccessPreflightContext_context = (uint64_t)v10;

      uint64_t v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v23 = _AccessPreflightContext_context;
        _os_log_impl(&dword_21EEBD000, v12, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): creating preflight context.", buf, 0xCu);
      }

      id v5 = (void *)_AccessPreflightContext_context;
    }
    id v13 = v5;
    [v13 incrementValidReferenceCount];
    os_unfair_lock_unlock(&_AccessPreflightContext_lock);
    v14 = (void *)[objc_alloc(MEMORY[0x263F5BE38]) initWithBlock:&__block_literal_global_548];
    v15 = [v13 context];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = ___AccessPreflightContext_block_invoke_2;
    v19[3] = &unk_2644F8C58;
    id v20 = v14;
    id v21 = v13;
    long long v16 = (void (*)(void *, void *, void *))v3[2];
    id v17 = v13;
    id v18 = v14;
    v16(v3, v15, v19);
  }
}

void _AccessAuthenticatorStateCache(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    double v4 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&_AccessAuthenticatorStateCache_lock);
    if (!_AccessAuthenticatorStateCache_cache)
    {
      id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v3 = (void *)_AccessAuthenticatorStateCache_cache;
      _AccessAuthenticatorStateCache_cache = (uint64_t)v2;
    }
    v4[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&_AccessAuthenticatorStateCache_lock);
    uint64_t v1 = v4;
  }
}

void sub_21EED4774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EED4BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EED569C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EED5AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EED65A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MatchLayerGeometry(void *a1, void *a2)
{
  if (a1)
  {
    if (a2)
    {
      id v3 = a2;
      id v4 = a1;
      [v3 transform];
      [v4 setTransform:&v6];
      [v3 anchorPoint];
      objc_msgSend(v4, "setAnchorPoint:");
      [v3 position];
      objc_msgSend(v4, "setPosition:");
      [v3 bounds];
      objc_msgSend(v4, "setBounds:");
      uint64_t v5 = [v3 isGeometryFlipped];

      [v4 setGeometryFlipped:v5];
    }
  }
}

id CloneShapeLayer(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (objc_class *)MEMORY[0x263F15880];
    id v2 = a1;
    id v3 = objc_alloc_init(v1);
    [v2 bounds];
    objc_msgSend(v3, "setBounds:");
    [v2 position];
    objc_msgSend(v3, "setPosition:");
    [v2 anchorPoint];
    objc_msgSend(v3, "setAnchorPoint:");
    [v2 opacity];
    objc_msgSend(v3, "setOpacity:");
    [v2 transform];
    [v3 setTransform:&v9];
    objc_msgSend(v3, "setGeometryFlipped:", objc_msgSend(v2, "isGeometryFlipped"));
    objc_msgSend(v3, "setPath:", objc_msgSend(v2, "path"));
    objc_msgSend(v3, "setFillColor:", objc_msgSend(v2, "fillColor"));
    id v4 = [v2 fillRule];
    [v3 setFillRule:v4];

    uint64_t v5 = [v2 lineCap];
    [v3 setLineCap:v5];

    uint64_t v6 = [v2 lineJoin];
    [v3 setLineJoin:v6];

    [v2 lineWidth];
    objc_msgSend(v3, "setLineWidth:");
    [v2 miterLimit];
    objc_msgSend(v3, "setMiterLimit:");
    objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v2, "strokeColor"));
    [v2 strokeStart];
    objc_msgSend(v3, "setStrokeStart:");
    [v2 strokeEnd];
    objc_msgSend(v3, "setStrokeEnd:");
    int v7 = [v2 actions];

    [v3 setActions:v7];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_21EED8718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21EED89E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EED8BBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EED8CCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EED8FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21EED9528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_21EEDA1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id location)
{
  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EEDAA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PKTextureLoaderResultGetSRGBMatchedFormat(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t result = *(void *)(result + 40);
  if (!result) {
    return result;
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (((unint64_t)(v2 - 30) > 0x32 || ((1 << (v2 - 30)) & 0x4010000000001) == 0)
    && v2 != 10)
  {
    return 0;
  }
  CFStringRef Name = CGColorSpaceGetName((CGColorSpaceRef)result);
  if (Name)
  {
    CFStringRef v6 = Name;
    if (CFEqual(Name, (CFStringRef)*MEMORY[0x263F002D8])) {
      goto LABEL_15;
    }
    if (CFEqual(v6, (CFStringRef)*MEMORY[0x263F002C8])) {
      return *(void *)(v1 + 32);
    }
  }
  int v7 = *(const void **)(v1 + 40);
  int v8 = (const void *)PKColorSpaceStandardRGB();
  if (!CFEqual(v7, v8))
  {
    id v10 = *(const void **)(v1 + 40);
    uint64_t v11 = (const void *)PKColorSpaceStandardLinearRGB();
    if (!CFEqual(v10, v11)) {
      return 0;
    }
    return *(void *)(v1 + 32);
  }
LABEL_15:
  uint64_t v9 = *(void *)(v1 + 32);
  if (v9 > 69)
  {
    if (v9 != 70)
    {
      if (v9 == 80) {
        return 81;
      }
      return 0;
    }
    return 71;
  }
  else
  {
    if (v9 != 10)
    {
      if (v9 == 30) {
        return 31;
      }
      return 0;
    }
    return 11;
  }
}

__n128 PKCategoryVisualizationRendererStateCopy@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  bzero((void *)(a2 + 16), 0x27C0uLL);
  *(void *)a2 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a2 + 8) = v4;
  long long v5 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 144) = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v7;
  long long v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v8;
  *(void *)(a2 + 288) = *(void *)(a1 + 288);
  *(void *)(a2 + 10160) = *(void *)(a1 + 10160);
  *(void *)(a2 + 10168) = *(void *)(a1 + 10168);
  *(_DWORD *)(a2 + 10176) = *(_DWORD *)(a1 + 10176);
  *(unsigned char *)(a2 + 10180) = *(unsigned char *)(a1 + 10180);
  long long v9 = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 224) = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 240) = v9;
  long long v10 = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 256) = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 272) = v10;
  long long v11 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 176) = v11;
  long long v12 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 208) = v12;
  __memcpy_chk();
  id v13 = malloc_type_malloc(8 * v4, 0x19F71B0FuLL);
  *(void *)(a2 + 16) = v13;
  uint64_t v14 = *(void *)(a1 + 8);
  if (v14)
  {
    v15 = *(uint64_t **)(a1 + 16);
    uint64_t v16 = *(void *)(a1 + 8);
    do
    {
      uint64_t v17 = *v15++;
      *v13++ = v17;
      --v16;
    }
    while (v16);
  }
  *(void *)(a2 + 24) = malloc_type_malloc(16 * v14, 0x1000040451B5BE8uLL);
  if (*(void *)(a1 + 8))
  {
    unint64_t v19 = 0;
    do
    {
      __n128 result = *(__n128 *)(*(void *)(a1 + 24) + 16 * v19);
      *(__n128 *)(*(void *)(a2 + 24) + 16 * v19++) = result;
    }
    while (v19 < *(void *)(a1 + 8));
  }
  return result;
}

uint64_t PKCompareCircleDataByCreated(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a1 + 28);
  float v3 = *(float *)(a2 + 28);
  if (v2 < v3) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = -1;
  }
  if (v2 == v3) {
    return 0;
  }
  else {
    return v4;
  }
}

void sub_21EEDFFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(v11);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

void sub_21EEE0160(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EEE09F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EEE105C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EEE1174(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EEE12B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EEE1590(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EEE2EB0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void LayerApplyColor(void *a1, void *a2, char a3, int a4)
{
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v8 presentationLayer];
  id v11 = (id)v9;
  if (v9) {
    long long v10 = (void *)v9;
  }
  else {
    long long v10 = v8;
  }
  LayerApplyColor(v8, v10, v7, a3, a4);
}

void ShapeLayerApplyColor(void *a1, void *a2, char a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = [v7 presentationLayer];
  long long v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v7;
  }
  id v23 = v7;
  id v12 = v11;
  id v13 = v8;
  if (v13)
  {
    if ((a3 & 4) != 0)
    {
      uint64_t v14 = CGColorRetain((CGColorRef)[v23 strokeColor]);
      v15 = CGColorRetain((CGColorRef)[v12 strokeColor]);
      id v16 = [v13 colorWithAlphaComponent:CGColorGetAlpha(v14)];
      uint64_t v17 = CGColorRetain((CGColorRef)[v16 CGColor]);

      if (a4) {
        LayerAnimateColor(v23, @"strokeColor", (uint64_t)v15, (uint64_t)v17);
      }
      [v23 setStrokeColor:v17];
      CGColorRelease(v14);
      CGColorRelease(v15);
      CGColorRelease(v17);
    }
    id v18 = v23;
    if ((a3 & 8) != 0)
    {
      unint64_t v19 = CGColorRetain((CGColorRef)[v23 fillColor]);
      id v20 = CGColorRetain((CGColorRef)[v12 fillColor]);
      id v21 = [v13 colorWithAlphaComponent:CGColorGetAlpha(v19)];
      v22 = CGColorRetain((CGColorRef)[v21 CGColor]);

      if (a4) {
        LayerAnimateColor(v23, @"fillColor", (uint64_t)v20, (uint64_t)v22);
      }
      [v23 setFillColor:v22];
      CGColorRelease(v19);
      CGColorRelease(v20);
      CGColorRelease(v22);
      id v18 = v23;
    }
    LayerApplyColor(v18, v12, v13, a3, a4);
  }
}

void LayerApplyColor(void *a1, void *a2, void *a3, char a4, int a5)
{
  id v19 = a1;
  id v9 = a2;
  id v10 = a3;
  if (v10)
  {
    if (a4)
    {
      id v11 = CGColorRetain((CGColorRef)[v19 backgroundColor]);
      id v12 = CGColorRetain((CGColorRef)[v9 backgroundColor]);
      id v13 = [v10 colorWithAlphaComponent:CGColorGetAlpha(v11)];
      uint64_t v14 = CGColorRetain((CGColorRef)[v13 CGColor]);

      if (a5) {
        LayerAnimateColor(v19, @"backgroundColor", (uint64_t)v12, (uint64_t)v14);
      }
      [v19 setBackgroundColor:v14];
      CGColorRelease(v11);
      CGColorRelease(v12);
      CGColorRelease(v14);
    }
    if ((a4 & 2) != 0)
    {
      v15 = CGColorRetain((CGColorRef)[v19 borderColor]);
      id v16 = CGColorRetain((CGColorRef)[v9 borderColor]);
      id v17 = [v10 colorWithAlphaComponent:CGColorGetAlpha(v15)];
      id v18 = CGColorRetain((CGColorRef)[v17 CGColor]);

      if (a5) {
        LayerAnimateColor(v19, @"borderColor", (uint64_t)v16, (uint64_t)v18);
      }
      [v19 setBorderColor:v18];
      CGColorRelease(v15);
      CGColorRelease(v16);
      CGColorRelease(v18);
    }
  }
}

void LayerAnimateColor(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a1;
  [v8 removeAnimationForKey:v7];
  id v9 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:v7];
  [v9 setAdditive:0];
  [v9 setFromValue:a3];
  [v9 setToValue:a4];
  [v8 addAnimation:v9 forKey:v7];
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x270EFB7A8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x270EFB900](a, b);
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
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

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5D68](space);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x270EE67F0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x270EE6840](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B20](original, attributes);
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x270EE9BE0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x270EE9BF8](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromURL(CFURLRef fileURL)
{
  return (CFArrayRef)MEMORY[0x270EE9CD0](fileURL);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x270EE9CD8](fontURL, *(void *)&scope, error);
}

void GLKQuaternionRotateVector3Array(GLKQuaternion quaternion, GLKVector3 *vectors, size_t vectorCount)
{
}

uint64_t LAUIPhysicalButtonNormalizedFrame()
{
  return MEMORY[0x270F47930]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t PKAnalyticsSendEvent()
{
  return MEMORY[0x270F51BD0]();
}

uint64_t PKColorGetRelativeLuminance()
{
  return MEMORY[0x270F51C10]();
}

uint64_t PKColorSpaceStandardLinearRGB()
{
  return MEMORY[0x270F51C18]();
}

uint64_t PKColorSpaceStandardRGB()
{
  return MEMORY[0x270F51C20]();
}

uint64_t PKEqualObjects()
{
  return MEMORY[0x270F51CC0]();
}

uint64_t PKFloatRoundToPixelWithScale()
{
  return MEMORY[0x270F51CE8]();
}

uint64_t PKFrontFaceCameraIsWithinScreen()
{
  return MEMORY[0x270F51D00]();
}

uint64_t PKIsPad()
{
  return MEMORY[0x270F51D60]();
}

uint64_t PKLayerNullActions()
{
  return MEMORY[0x270F51D88]();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return MEMORY[0x270F51DA0]();
}

uint64_t PKMagicCurve()
{
  return MEMORY[0x270F51DA8]();
}

uint64_t PKPassFrontFaceContentSize()
{
  return MEMORY[0x270F51E38]();
}

uint64_t PKPassKitUIFoundationBundle()
{
  return MEMORY[0x270F51E58]();
}

uint64_t PKPaymentPassScaleFactor()
{
  return MEMORY[0x270F51EA8]();
}

uint64_t PKPearlIsAvailable()
{
  return MEMORY[0x270F51ED8]();
}

uint64_t PKRunningInViewService()
{
  return MEMORY[0x270F51F18]();
}

uint64_t PKScreenScale()
{
  return MEMORY[0x270F51F30]();
}

uint64_t PKSizeAlignedInRectWithScale()
{
  return MEMORY[0x270F51F48]();
}

uint64_t PKSizeAspectFit()
{
  return MEMORY[0x270F51F50]();
}

uint64_t PKSizeRoundToPixelWithScale()
{
  return MEMORY[0x270F51F68]();
}

uint64_t PKSizeScaleAspectFit()
{
  return MEMORY[0x270F51F70]();
}

uint64_t PKSystemApertureIsAvailable()
{
  return MEMORY[0x270F51F80]();
}

uint64_t PKTimeProfileBegin()
{
  return MEMORY[0x270F51F98]();
}

uint64_t PKTimeProfileEnd()
{
  return MEMORY[0x270F51FA0]();
}

uint64_t PKUserIntentIsAvailable()
{
  return MEMORY[0x270F51FD8]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKCreateCGImage(NSURL *a1)
{
  return MEMORY[0x270F51FF8](a1);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x270EDEF28](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDEFE8](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x270EDF158](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

unint64_t vImageConverter_GetNumberOfDestinationBuffers(const vImageConverterRef converter)
{
  return MEMORY[0x270EDF160](converter);
}

unint64_t vImageConverter_GetNumberOfSourceBuffers(const vImageConverterRef converter)
{
  return MEMORY[0x270EDF168](converter);
}

vImage_Error vImageConverter_MustOperateOutOfPlace(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, vImage_Flags flags)
{
  return MEMORY[0x270EDF170](converter, srcs, dests, *(void *)&flags);
}

void vImageConverter_Release(vImageConverterRef converter)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}