void __initializeApplicationIdentifierMaps_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void v18[3];
  void v19[3];
  void v20[5];
  void v21[5];
  void v22[3];
  void v23[3];
  void v24[5];
  void v25[7];

  v25[5] = *MEMORY[0x263EF8340];
  v24[0] = @"IDS";
  v0 = [NSNumber numberWithInt:1];
  v25[0] = v0;
  v24[1] = @"TLT";
  v1 = [NSNumber numberWithInt:0];
  v25[1] = v1;
  v24[2] = @"CK";
  v2 = [NSNumber numberWithInt:2];
  v25[2] = v2;
  v24[3] = @"MP";
  v3 = [NSNumber numberWithInt:3];
  v25[3] = v3;
  v24[4] = @"FT";
  v4 = [NSNumber numberWithInt:4];
  v25[4] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
  v6 = (void *)kApplicationIdentifierMap;
  kApplicationIdentifierMap = v5;

  v22[0] = @"IDS";
  v22[1] = @"MP";
  v23[0] = @"im";
  v23[1] = @"mp1";
  v22[2] = @"FT";
  v23[2] = @"ftm";
  v7 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v8 = (void *)kApplicationIdentifierToUriPrefixMap;
  kApplicationIdentifierToUriPrefixMap = v7;

  v9 = [NSNumber numberWithInt:1];
  v20[0] = v9;
  v21[0] = @"IDS";
  v10 = [NSNumber numberWithInt:0];
  v20[1] = v10;
  v21[1] = @"TLT";
  v11 = [NSNumber numberWithInt:2];
  v20[2] = v11;
  v21[2] = @"CK";
  v12 = [NSNumber numberWithInt:3];
  v20[3] = v12;
  v21[3] = @"MP";
  v13 = [NSNumber numberWithInt:4];
  v20[4] = v13;
  v21[4] = @"FT";
  v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
  v15 = (void *)kApplicationEnumMap;
  kApplicationEnumMap = v14;

  v18[0] = @"IDS";
  v18[1] = @"FT";
  v19[0] = @"com.apple.madrid";
  v19[1] = @"com.apple.private.alloy.facetime.multi";
  v18[2] = @"MP";
  v19[2] = @"com.apple.private.alloy.multiplex1";
  v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v17 = (void *)kApplicationIDSServiceMap;
  kApplicationIDSServiceMap = v16;
}

void sub_226347940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

__CFString *KTValidateTypeGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Peer";
  }
  else {
    return off_26479E5E0[a1 - 1];
  }
}

__CFString *KTResultGetString(unint64_t a1)
{
  if (a1 > 3) {
    return @"OK";
  }
  else {
    return off_26479E610[a1];
  }
}

__CFString *KTUIStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC) {
    return @"Unavailable";
  }
  else {
    return off_26479E630[a1 - 1];
  }
}

__CFString *KTStaticKeyPeerValidateResultGetString(unint64_t a1)
{
  if (a1 > 5) {
    return @"Pending";
  }
  else {
    return off_26479E698[a1];
  }
}

void sub_22634B51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_22634B8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22634BC80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22634C394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22634CA60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *KTOptInGetString(uint64_t a1)
{
  v1 = @"Off";
  if (a1 == 1) {
    v1 = @"On";
  }
  if (a1 == 2) {
    return @"Pending";
  }
  else {
    return v1;
  }
}

void sub_226350930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *KTAccountStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_26479EB28[a1 - 1];
  }
}

__CFString *KTSystemStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"OK";
  }
  else {
    return off_26479EB58[a1 - 1];
  }
}

__CFString *KTSelfStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"OK";
  }
  else {
    return off_26479EB80[a1 - 1];
  }
}

__CFString *KTIDSAccountStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"IDSAccountStatusInvalid";
  }
  else {
    return off_26479EBA0[a1 - 1];
  }
}

void sub_2263542A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_226358184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
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

void sub_226359390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_22635A920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_226360008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
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

void sub_226360560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22636452C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2263658B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226365CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226366410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_226368A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22636A81C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22636A9D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22636D54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_22636DAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2263741E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2263743E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2263744A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2263745BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2263753A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
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

void sub_226375850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_226375C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2263761A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2263766B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226376C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226377184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2263776E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226377C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2263780B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226378590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226378A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_226378E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22637922C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_226379610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2263799F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_226379E2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226379FF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 56));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22637A178(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22637A710(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22637AE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

const char *sub_22637E2DC()
{
  return "KC877N55J7";
}

uint64_t TransparencyTeamID.getter()
{
  return 0x35354E373738434BLL;
}

uint64_t sub_22637E304()
{
  return 0;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.env.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.env.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.env.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.app.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.app.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.app.modify())()
{
  return nullsub_1;
}

uint64_t sub_22637E424()
{
  return 0;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.patLogBeginMs.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.patLogBeginMs.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.patLogBeginMs.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.tltLogBeginMs.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.tltLogBeginMs.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.tltLogBeginMs.modify())()
{
  return nullsub_1;
}

uint64_t sub_22637E4A8@<X0>(uint64_t a1@<X8>)
{
  return sub_22637FA04(MEMORY[0x263F07490], a1);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.fetchTime.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22637FA98(type metadata accessor for TransparencySWSysdiagnose.PublicKeybag, &qword_26812D600, a1);
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1)
{
  return sub_226381974(a1, qword_26812E370);
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

uint64_t TransparencySWSysdiagnose.PublicKeybag.fetchTime.setter(uint64_t a1)
{
  return sub_22637FB28(a1, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag, &qword_26812D600);
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.fetchTime.modify())()
{
  return nullsub_1;
}

uint64_t sub_22637E5AC()
{
  return 0;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.trustedAppSPKI.getter()
{
  type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);

  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.trustedAppSPKI.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.trustedAppSPKI.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.init(env:app:patLogBeginMs:tltLogBeginMs:fetchTime:trustedAppSPKI:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v19 = a9 + *(int *)(v18 + 32);
  uint64_t v20 = sub_226388508();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = *(int *)(v18 + 36);
  *(void *)(a9 + v21) = 0;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 40) = a6 & 1;
  *(void *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 56) = a8 & 1;
  sub_22638090C(a10, v19, &qword_26812D600);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a9 + v21) = a11;
  return result;
}

BOOL sub_22637E78C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22637E7A4()
{
  return sub_226388638();
}

uint64_t sub_22637E7D4()
{
  uint64_t result = 7761509;
  switch(*v0)
  {
    case 1:
      uint64_t result = 7368801;
      break;
    case 2:
      uint64_t result = 0x6542676F4C746170;
      break;
    case 3:
      uint64_t result = 0x6542676F4C746C74;
      break;
    case 4:
      uint64_t result = 0x6D69546863746566;
      break;
    case 5:
      uint64_t result = 0x4164657473757274;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22637E8A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_226387CA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_22637E8CC(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_22637E8D8(uint64_t a1)
{
  unint64_t v2 = sub_22637EC44();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22637E914(uint64_t a1)
{
  unint64_t v2 = sub_22637EC44();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D688);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22637EC44();
  sub_226388668();
  char v17 = 0;
  sub_2263885B8();
  if (!v2)
  {
    char v16 = 1;
    sub_2263885B8();
    char v15 = 2;
    sub_2263885E8();
    char v14 = 3;
    sub_2263885E8();
    uint64_t v9 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    char v13 = 4;
    sub_226388508();
    sub_22637F1B8(&qword_26812D5F8, MEMORY[0x263F07490]);
    sub_2263885D8();
    uint64_t v12 = *(void *)(v3 + *(int *)(v9 + 36));
    v11[15] = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26812D678);
    sub_22637F200(&qword_26812D680);
    sub_2263885D8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_22637EC44()
{
  unint64_t result = qword_26812E1D0;
  if (!qword_26812E1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812E1D0);
  }
  return result;
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

uint64_t TransparencySWSysdiagnose.PublicKeybag.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
  MEMORY[0x270FA5388]();
  v27 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812DCB0);
  uint64_t v26 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0) - 8;
  MEMORY[0x270FA5388]();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)v8 + 4) = 0;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  v8[40] = 1;
  *((void *)v8 + 6) = 0;
  v8[56] = 1;
  uint64_t v9 = (uint64_t)&v8[*(int *)(v6 + 40)];
  uint64_t v10 = sub_226388508();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = *(int *)(v6 + 44);
  *(void *)&v8[v11] = 0;
  uint64_t v12 = a1[3];
  v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_22637EC44();
  uint64_t v13 = v30;
  sub_226388658();
  if (!v13)
  {
    uint64_t v30 = v9;
    uint64_t v24 = v11;
    uint64_t v15 = v26;
    uint64_t v14 = (uint64_t)v27;
    char v37 = 0;
    *(void *)v8 = sub_226388558();
    *((void *)v8 + 1) = v16;
    char v36 = 1;
    *((void *)v8 + 2) = sub_226388558();
    *((void *)v8 + 3) = v18;
    char v35 = 2;
    *((void *)v8 + 4) = sub_226388588();
    v8[40] = v19 & 1;
    char v34 = 3;
    *((void *)v8 + 6) = sub_226388588();
    v8[56] = v20 & 1;
    char v33 = 4;
    sub_22637F1B8(&qword_26812DCB8, MEMORY[0x263F07490]);
    sub_226388578();
    sub_22638090C(v14, v30, &qword_26812D600);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26812D678);
    char v32 = 5;
    sub_22637F200(&qword_26812DCC0);
    uint64_t v21 = v28;
    sub_226388578();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v21);
    uint64_t v22 = v31;
    uint64_t v23 = v24;
    swift_bridgeObjectRelease();
    *(void *)&v8[v23] = v22;
    sub_2263807AC((uint64_t)v8, v25, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return sub_2263806F8((uint64_t)v8, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
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

uint64_t sub_22637F1B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22637F200(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26812D678);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22637F264@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWSysdiagnose.PublicKeybag.init(from:)(a1, a2);
}

uint64_t sub_22637F27C(void *a1)
{
  return TransparencySWSysdiagnose.PublicKeybag.encode(to:)(a1);
}

uint64_t sub_22637F294()
{
  return 2;
}

uint64_t TransparencySWSysdiagnose.Reachability.network.getter()
{
  return *v0;
}

uint64_t TransparencySWSysdiagnose.Reachability.network.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.Reachability.network.modify())()
{
  return nullsub_1;
}

Transparency::TransparencySWSysdiagnose::Reachability __swiftcall TransparencySWSysdiagnose.Reachability.init(network:)(Transparency::TransparencySWSysdiagnose::Reachability network)
{
  v1->network.value = network.network.value;
  return network;
}

uint64_t sub_22637F2D4()
{
  return 1;
}

uint64_t sub_22637F2DC()
{
  return sub_226388648();
}

uint64_t sub_22637F320()
{
  return sub_226388638();
}

uint64_t sub_22637F348()
{
  return sub_226388648();
}

uint64_t sub_22637F388()
{
  return 0x6B726F7774656ELL;
}

uint64_t sub_22637F3A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6B726F7774656ELL && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_226388618();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_22637F438(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22637F444(uint64_t a1)
{
  unint64_t v2 = sub_22637F5F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22637F480(uint64_t a1)
{
  unint64_t v2 = sub_22637F5F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TransparencySWSysdiagnose.Reachability.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D690);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22637F5F0();
  sub_226388668();
  sub_2263885C8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_22637F5F0()
{
  unint64_t result = qword_26812E408;
  if (!qword_26812E408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812E408);
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.Reachability.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812DCC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22637F5F0();
  sub_226388658();
  if (!v2)
  {
    char v9 = sub_226388568();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_22637F794@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TransparencySWSysdiagnose.Reachability.init(from:)(a1, a2);
}

uint64_t sub_22637F7AC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D690);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22637F5F0();
  sub_226388668();
  sub_2263885C8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.state.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.flags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWSysdiagnose.StateMachine.flags.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.flags.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.pendingFlags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWSysdiagnose.StateMachine.pendingFlags.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.pendingFlags.modify())()
{
  return nullsub_1;
}

void sub_22637F9A8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void TransparencySWSysdiagnose.StateMachine.reachability.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

unsigned char *TransparencySWSysdiagnose.StateMachine.reachability.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 32) = *result;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.reachability.modify())()
{
  return nullsub_1;
}

uint64_t sub_22637F9EC@<X0>(uint64_t a1@<X8>)
{
  return sub_22637FA04(type metadata accessor for TransparencySWSysdiagnose.PublicKeybag, a1);
}

uint64_t sub_22637FA04@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);

  return v4(a2, 1, 1, v3);
}

uint64_t TransparencySWSysdiagnose.StateMachine.publicKeybag.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22637FA98(type metadata accessor for TransparencySWSysdiagnose.StateMachine, &qword_26812D638, a1);
}

uint64_t sub_22637FA98@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return sub_226380884(v3 + *(int *)(v6 + 32), a3, a2);
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.StateMachine(uint64_t a1)
{
  return sub_226381974(a1, (uint64_t *)&unk_26812E1C0);
}

uint64_t TransparencySWSysdiagnose.StateMachine.publicKeybag.setter(uint64_t a1)
{
  return sub_22637FB28(a1, type metadata accessor for TransparencySWSysdiagnose.StateMachine, &qword_26812D638);
}

uint64_t sub_22637FB28(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return sub_22638090C(a1, v3 + *(int *)(v6 + 32), a3);
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.publicKeybag.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.containerPath.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TransparencySWSysdiagnose.StateMachine(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.containerPath.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TransparencySWSysdiagnose.StateMachine(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.containerPath.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.init(state:flags:pendingFlags:publicKeybag:containerPath:reachability:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  char v16 = *a8;
  uint64_t v17 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  uint64_t v18 = a9 + *(int *)(v17 + 32);
  uint64_t v19 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  char v20 = (void *)(a9 + *(int *)(v17 + 36));
  *char v20 = 0;
  v20[1] = 0;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(unsigned char *)(a9 + 32) = v16;
  sub_22638090C(a5, v18, &qword_26812D638);
  uint64_t result = swift_bridgeObjectRelease();
  *char v20 = a6;
  v20[1] = a7;
  return result;
}

uint64_t sub_22637FD84()
{
  uint64_t result = 0x6574617473;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7367616C66;
      break;
    case 2:
      uint64_t result = 0x46676E69646E6570;
      break;
    case 3:
      uint64_t result = 0x6962616863616572;
      break;
    case 4:
      uint64_t result = 0x654B63696C627570;
      break;
    case 5:
      uint64_t result = 0x656E6961746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22637FE64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_226387F58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22637FE8C(uint64_t a1)
{
  unint64_t v2 = sub_2263801DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22637FEC8(uint64_t a1)
{
  unint64_t v2 = sub_2263801DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TransparencySWSysdiagnose.StateMachine.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D620);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2263801DC();
  sub_226388668();
  LOBYTE(v11) = 0;
  sub_2263885B8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + 16);
    HIBYTE(v10) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26812D678);
    sub_22637F200(&qword_26812D680);
    sub_2263885D8();
    uint64_t v11 = *(void *)(v3 + 24);
    HIBYTE(v10) = 2;
    sub_2263885D8();
    LOBYTE(v11) = *(unsigned char *)(v3 + 32);
    HIBYTE(v10) = 3;
    sub_226380230();
    sub_2263885D8();
    type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
    LOBYTE(v11) = 4;
    type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    sub_22637F1B8(&qword_26812D630, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
    sub_2263885D8();
    LOBYTE(v11) = 5;
    sub_2263885B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_2263801DC()
{
  unint64_t result = qword_26812DF00;
  if (!qword_26812DF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DF00);
  }
  return result;
}

unint64_t sub_226380230()
{
  unint64_t result = qword_26812D648;
  if (!qword_26812D648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812D648);
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.StateMachine.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
  MEMORY[0x270FA5388]();
  uint64_t v28 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812DCD0);
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0) - 8;
  MEMORY[0x270FA5388]();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  v8[32] = 3;
  uint64_t v9 = (uint64_t)&v8[*(int *)(v6 + 40)];
  uint64_t v10 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = &v8[*(int *)(v6 + 44)];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = a1[3];
  uint64_t v30 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_2263801DC();
  uint64_t v13 = v31;
  sub_226388658();
  if (!v13)
  {
    uint64_t v31 = v10;
    uint64_t v24 = v11;
    uint64_t v25 = v9;
    uint64_t v15 = v27;
    uint64_t v14 = (uint64_t)v28;
    LOBYTE(v33) = 0;
    uint64_t v16 = v29;
    *(void *)v8 = sub_226388558();
    *((void *)v8 + 1) = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26812D678);
    char v32 = 1;
    sub_22637F200(&qword_26812DCC0);
    sub_226388578();
    *((void *)v8 + 2) = v33;
    char v32 = 2;
    sub_226388578();
    *((void *)v8 + 3) = v33;
    char v32 = 3;
    sub_226380758();
    sub_226388578();
    v8[32] = v33;
    LOBYTE(v33) = 4;
    sub_22637F1B8(&qword_26812DCE0, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
    sub_226388578();
    sub_22638090C(v14, v25, &qword_26812D638);
    LOBYTE(v33) = 5;
    uint64_t v19 = sub_226388558();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
    uint64_t v22 = (uint64_t *)v24;
    swift_bridgeObjectRelease();
    *uint64_t v22 = v19;
    v22[1] = v21;
    sub_2263807AC((uint64_t)v8, v26, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return sub_2263806F8((uint64_t)v8, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
}

uint64_t sub_2263806F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_226380758()
{
  unint64_t result = qword_26812DCD8;
  if (!qword_26812DCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DCD8);
  }
  return result;
}

uint64_t sub_2263807AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226380814@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWSysdiagnose.StateMachine.init(from:)(a1, a2);
}

uint64_t sub_22638082C(void *a1)
{
  return TransparencySWSysdiagnose.StateMachine.encode(to:)(a1);
}

uint64_t sub_226380844@<X0>(uint64_t a1@<X8>)
{
  return sub_22637FA04(type metadata accessor for TransparencySWSysdiagnose.StateMachine, a1);
}

uint64_t TransparencySWSysdiagnose.stateMachine.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226380884(v1, a1, &qword_26812D650);
}

uint64_t sub_226380884(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t TransparencySWSysdiagnose.stateMachine.setter(uint64_t a1)
{
  return sub_22638090C(a1, v1, &qword_26812D650);
}

uint64_t sub_22638090C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t (*TransparencySWSysdiagnose.stateMachine.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.fallback.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TransparencySWSysdiagnose(0);
  return sub_226380884(v1 + *(int *)(v3 + 20), a1, &qword_26812D600);
}

uint64_t type metadata accessor for TransparencySWSysdiagnose(uint64_t a1)
{
  return sub_226381974(a1, qword_26812E120);
}

uint64_t TransparencySWSysdiagnose.fallback.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TransparencySWSysdiagnose(0);
  return sub_22638090C(a1, v1 + *(int *)(v3 + 20), &qword_26812D600);
}

uint64_t (*TransparencySWSysdiagnose.fallback.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.init(stateMachine:fallback:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a3, 1, 1, v6);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for TransparencySWSysdiagnose(0) + 20);
  uint64_t v8 = sub_226388508();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_22638090C(a1, a3, &qword_26812D650);
  return sub_22638090C(a2, v7, &qword_26812D600);
}

BOOL sub_226380B60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_226380B78()
{
  return sub_226388648();
}

uint64_t sub_226380BC0()
{
  return sub_226388648();
}

uint64_t sub_226380C04()
{
  if (*v0) {
    return 0x6B6361626C6C6166;
  }
  else {
    return 0x63614D6574617473;
  }
}

uint64_t sub_226380C48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_226388238(a1, a2);
  *a3 = result;
  return result;
}

void sub_226380C70(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_226380C7C(uint64_t a1)
{
  unint64_t v2 = sub_226380EF4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_226380CB8(uint64_t a1)
{
  unint64_t v2 = sub_226380EF4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TransparencySWSysdiagnose.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D618);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226380EF4();
  sub_226388668();
  v8[15] = 0;
  type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  sub_22637F1B8(&qword_26812D610, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.StateMachine);
  sub_2263885D8();
  if (!v1)
  {
    type metadata accessor for TransparencySWSysdiagnose(0);
    v8[14] = 1;
    sub_226388508();
    sub_22637F1B8(&qword_26812D5F8, MEMORY[0x263F07490]);
    sub_2263885D8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_226380EF4()
{
  unint64_t result = qword_26812DD58;
  if (!qword_26812DD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DD58);
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
  MEMORY[0x270FA5388]();
  uint64_t v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
  MEMORY[0x270FA5388]();
  uint64_t v22 = (uint64_t)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812DCE8);
  uint64_t v20 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TransparencySWSysdiagnose(0) - 8;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (uint64_t)&v9[*(int *)(v7 + 28)];
  uint64_t v12 = sub_226388508();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226380EF4();
  uint64_t v13 = v24;
  sub_226388658();
  if (!v13)
  {
    uint64_t v24 = v11;
    uint64_t v15 = v20;
    uint64_t v14 = (uint64_t)v21;
    char v26 = 0;
    sub_22637F1B8(&qword_26812DCF0, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.StateMachine);
    sub_226388578();
    sub_22638090C(v22, (uint64_t)v9, &qword_26812D650);
    char v25 = 1;
    sub_22637F1B8(&qword_26812DCB8, MEMORY[0x263F07490]);
    uint64_t v16 = v23;
    sub_226388578();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v16);
    uint64_t v17 = v19;
    sub_22638090C(v14, v24, &qword_26812D600);
    sub_2263807AC((uint64_t)v9, v17, type metadata accessor for TransparencySWSysdiagnose);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_2263806F8((uint64_t)v9, type metadata accessor for TransparencySWSysdiagnose);
}

uint64_t sub_22638135C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWSysdiagnose.init(from:)(a1, a2);
}

uint64_t sub_226381374(void *a1)
{
  return TransparencySWSysdiagnose.encode(to:)(a1);
}

uint64_t TransparencySWSysdiagnose.json()()
{
  sub_2263884B8();
  MEMORY[0x270FA5388]();
  sub_2263884F8();
  swift_allocObject();
  sub_2263884E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812D698);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22638E0E0;
  sub_2263884A8();
  sub_226388498();
  sub_22637F1B8(&qword_26812D628, MEMORY[0x263F06130]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812D668);
  sub_2263823CC(&qword_26812D670, &qword_26812D668);
  sub_226388538();
  sub_2263884C8();
  type metadata accessor for TransparencySWSysdiagnose(0);
  sub_22637F1B8(&qword_26812D660, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose);
  uint64_t v0 = sub_2263884D8();
  swift_release();
  return v0;
}

Transparency::SWTFollowUpType_optional __swiftcall SWTFollowUpType.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_226388548();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

void *static SWTFollowUpType.allCases.getter()
{
  return &unk_26DA092D0;
}

uint64_t SWTFollowUpType.rawValue.getter()
{
  if (*v0) {
    return 0x6B726F4665657274;
  }
  else {
    return 0x6B6361626C6C6F72;
  }
}

uint64_t sub_226381684(char *a1, char *a2)
{
  return sub_226381690(*a1, *a2);
}

uint64_t sub_226381690(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x6B726F4665657274;
  }
  else {
    uint64_t v2 = 0x6B6361626C6C6F72;
  }
  if (a2) {
    uint64_t v3 = 0x6B726F4665657274;
  }
  else {
    uint64_t v3 = 0x6B6361626C6C6F72;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_226388618();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_226381710()
{
  return sub_226388648();
}

uint64_t sub_226381788()
{
  sub_226388518();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2263817E4()
{
  return sub_226388648();
}

Transparency::SWTFollowUpType_optional sub_226381858(Swift::String *a1)
{
  return SWTFollowUpType.init(rawValue:)(*a1);
}

void sub_226381864(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6B6361626C6C6F72;
  if (*v1) {
    uint64_t v2 = 0x6B726F4665657274;
  }
  *a1 = v2;
  a1[1] = 0xE800000000000000;
}

void sub_22638189C(void *a1@<X8>)
{
  *a1 = &unk_26DA093D8;
}

uint64_t TransparencySWIssue.issue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWIssue.posted.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TransparencySWIssue(0) + 20);
  uint64_t v4 = sub_226388508();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for TransparencySWIssue(uint64_t a1)
{
  return sub_226381974(a1, (uint64_t *)&unk_26812E630);
}

uint64_t sub_226381974(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TransparencySWIssue.slh.getter()
{
  type metadata accessor for TransparencySWIssue(0);

  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWIssue.init(issue:posted:slh:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t v8 = type metadata accessor for TransparencySWIssue(0);
  uint64_t v9 = (char *)a5 + *(int *)(v8 + 20);
  uint64_t v10 = sub_226388508();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
  *(void *)((char *)a5 + *(int *)(v8 + 24)) = a4;
  return result;
}

uint64_t sub_226381A74()
{
  uint64_t v1 = 0x646574736F70;
  if (*v0 != 1) {
    uint64_t v1 = 6843507;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6575737369;
  }
}

uint64_t sub_226381AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_226388344(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_226381AE8(uint64_t a1)
{
  unint64_t v2 = sub_226381D9C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_226381B24(uint64_t a1)
{
  unint64_t v2 = sub_226381D9C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TransparencySWIssue.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812DCF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226381D9C();
  sub_226388668();
  char v14 = 0;
  sub_2263885F8();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for TransparencySWIssue(0);
    char v13 = 1;
    sub_226388508();
    sub_22637F1B8(&qword_26812D5F8, MEMORY[0x263F07490]);
    sub_226388608();
    uint64_t v12 = *(void *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26812DD00);
    sub_226382274(&qword_26812DD08, (void (*)(void))sub_226381DF0);
    sub_226388608();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_226381D9C()
{
  unint64_t result = qword_26812E670[0];
  if (!qword_26812E670[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812E670);
  }
  return result;
}

unint64_t sub_226381DF0()
{
  unint64_t result = qword_26812DD10;
  if (!qword_26812DD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DD10);
  }
  return result;
}

uint64_t TransparencySWIssue.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v24 = sub_226388508();
  uint64_t v22 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812DD18);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TransparencySWIssue(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (uint64_t *)((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226381D9C();
  uint64_t v10 = (uint64_t)v26;
  sub_226388658();
  if (v10) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v26 = a1;
  uint64_t v11 = v4;
  uint64_t v13 = v23;
  uint64_t v12 = v24;
  uint64_t v20 = v9;
  char v30 = 0;
  uint64_t v14 = sub_226388598();
  uint64_t v15 = v20;
  *uint64_t v20 = v14;
  v15[1] = v16;
  char v29 = 1;
  sub_22637F1B8(&qword_26812DCB8, MEMORY[0x263F07490]);
  sub_2263885A8();
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))((char *)v15 + *(int *)(v7 + 20), v11, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26812DD00);
  char v28 = 2;
  sub_226382274(&qword_26812DD20, (void (*)(void))sub_2263822E4);
  sub_2263885A8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v25);
  uint64_t v18 = (uint64_t)v20;
  uint64_t v17 = v21;
  *(uint64_t *)((char *)v20 + *(int *)(v7 + 24)) = v27;
  sub_2263807AC(v18, v17, type metadata accessor for TransparencySWIssue);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return sub_2263806F8(v18, type metadata accessor for TransparencySWIssue);
}

uint64_t sub_226382274(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26812DD00);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2263822E4()
{
  unint64_t result = qword_26812DD28;
  if (!qword_26812DD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DD28);
  }
  return result;
}

unint64_t sub_22638233C()
{
  unint64_t result = qword_26812DD30;
  if (!qword_26812DD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DD30);
  }
  return result;
}

uint64_t sub_226382390()
{
  return sub_2263823CC(&qword_26812DD38, (uint64_t *)&unk_26812DD40);
}

uint64_t sub_2263823CC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_226382410@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWIssue.init(from:)(a1, a2);
}

uint64_t sub_226382428(void *a1)
{
  return TransparencySWIssue.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for TransparencySWSysdiagnose(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v42 = v8;
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      uint64_t v12 = a2[3];
      a1[2] = a2[2];
      a1[3] = v12;
      *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
      uint64_t v13 = *(int *)(v7 + 32);
      uint64_t v14 = (uint64_t *)((char *)a1 + v13);
      uint64_t v45 = v7;
      v46 = (uint64_t *)((char *)a2 + v13);
      uint64_t v15 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
      uint64_t v16 = *(void *)(v15 - 8);
      v43 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v43(v46, 1, v15))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
        memcpy(v14, v46, *(void *)(*(void *)(v17 - 8) + 64));
        uint64_t v18 = v42;
      }
      else
      {
        uint64_t v41 = v15;
        uint64_t v19 = v46[1];
        void *v14 = *v46;
        v14[1] = v19;
        uint64_t v20 = v46[3];
        v14[2] = v46[2];
        v14[3] = v20;
        v14[4] = v46[4];
        *((unsigned char *)v14 + 40) = *((unsigned char *)v46 + 40);
        v14[6] = v46[6];
        *((unsigned char *)v14 + 56) = *((unsigned char *)v46 + 56);
        uint64_t v21 = *(int *)(v15 + 32);
        v44 = v14;
        __dst = (char *)v14 + v21;
        uint64_t v22 = (char *)v46 + v21;
        uint64_t v23 = sub_226388508();
        uint64_t v24 = *(void *)(v23 - 8);
        uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v25(v22, 1, v23))
        {
          uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
          memcpy(__dst, v22, *(void *)(*(void *)(v26 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v24 + 16))(__dst, v22, v23);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
        }
        uint64_t v18 = v42;
        *(void *)((char *)v44 + *(int *)(v41 + 36)) = *(void *)((char *)v46 + *(int *)(v41 + 36));
        uint64_t v27 = *(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56);
        swift_bridgeObjectRetain();
        v27(v44, 0, 1, v41);
      }
      uint64_t v28 = *(int *)(v45 + 36);
      char v29 = (uint64_t *)((char *)a1 + v28);
      char v30 = (uint64_t *)((char *)a2 + v28);
      uint64_t v31 = v30[1];
      void *v29 = *v30;
      v29[1] = v31;
      char v32 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v18 + 56);
      swift_bridgeObjectRetain();
      v32(a1, 0, 1, v45);
    }
    uint64_t v33 = *(int *)(a3 + 20);
    char v34 = (char *)a1 + v33;
    char v35 = (char *)a2 + v33;
    uint64_t v36 = sub_226388508();
    uint64_t v37 = *(void *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
      memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
  }
  return a1;
}

uint64_t destroy for TransparencySWSysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = a1 + *(int *)(v4 + 32);
    uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = v5 + *(int *)(v6 + 32);
      uint64_t v8 = sub_226388508();
      uint64_t v9 = *(void *)(v8 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = a1 + *(int *)(a2 + 20);
  uint64_t v11 = sub_226388508();
  uint64_t v14 = *(void *)(v11 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v10, 1, v11);
  if (!result)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
    return v13(v10, v11);
  }
  return result;
}

void *initializeWithCopy for TransparencySWSysdiagnose(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v43 = v7;
    uint64_t v44 = a3;
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v10 = a2[3];
    a1[2] = a2[2];
    a1[3] = v10;
    *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v11 = *(int *)(v6 + 32);
    uint64_t v12 = (void *)((char *)a1 + v11);
    uint64_t v45 = (void *)((char *)a2 + v11);
    uint64_t v13 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48);
    uint64_t v16 = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15(v45, 1, v16))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
      memcpy(v12, v45, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v40 = v14;
      uint64_t v41 = v12;
      uint64_t v18 = v45[1];
      *uint64_t v12 = *v45;
      v12[1] = v18;
      uint64_t v19 = v45[3];
      v12[2] = v45[2];
      v12[3] = v19;
      v12[4] = v45[4];
      *((unsigned char *)v12 + 40) = *((unsigned char *)v45 + 40);
      v12[6] = v45[6];
      *((unsigned char *)v12 + 56) = *((unsigned char *)v45 + 56);
      uint64_t v42 = v16;
      uint64_t v20 = *(int *)(v16 + 32);
      __dst = (char *)v12 + v20;
      uint64_t v21 = (char *)v45 + v20;
      uint64_t v22 = sub_226388508();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v24(v21, 1, v22))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
        memcpy(__dst, v21, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(__dst, v21, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
      }
      *(void *)((char *)v41 + *(int *)(v42 + 36)) = *(void *)((char *)v45 + *(int *)(v42 + 36));
      uint64_t v26 = *(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56);
      swift_bridgeObjectRetain();
      v26(v41, 0, 1, v42);
    }
    uint64_t v27 = *(int *)(v6 + 36);
    uint64_t v28 = (void *)((char *)a1 + v27);
    char v29 = (void *)((char *)a2 + v27);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = *(void (**)(void *, void, uint64_t, uint64_t))(v43 + 56);
    swift_bridgeObjectRetain();
    v31(a1, 0, 1, v6);
    a3 = v44;
  }
  uint64_t v32 = *(int *)(a3 + 20);
  uint64_t v33 = (char *)a1 + v32;
  char v34 = (char *)a2 + v32;
  uint64_t v35 = sub_226388508();
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  return a1;
}

uint64_t assignWithCopy for TransparencySWSysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v7[6];
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_2263806F8(a1, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
      goto LABEL_7;
    }
    uint64_t v84 = a3;
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v21 = *(int *)(v6 + 32);
    uint64_t v22 = a1 + v21;
    uint64_t v23 = a2 + v21;
    uint64_t v24 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
    int v27 = v26(v22, 1, v24);
    int v28 = v26(v23, 1, v24);
    if (v27)
    {
      if (!v28)
      {
        *(void *)uint64_t v22 = *(void *)v23;
        *(void *)(v22 + 8) = *(void *)(v23 + 8);
        *(void *)(v22 + 16) = *(void *)(v23 + 16);
        *(void *)(v22 + 24) = *(void *)(v23 + 24);
        uint64_t v29 = *(void *)(v23 + 32);
        *(unsigned char *)(v22 + 40) = *(unsigned char *)(v23 + 40);
        *(void *)(v22 + 32) = v29;
        uint64_t v30 = *(void *)(v23 + 48);
        *(unsigned char *)(v22 + 56) = *(unsigned char *)(v23 + 56);
        *(void *)(v22 + 48) = v30;
        uint64_t v31 = *(int *)(v24 + 32);
        __srca = (void *)(v22 + v31);
        uint64_t v32 = (const void *)(v23 + v31);
        uint64_t v33 = sub_226388508();
        uint64_t v73 = *(void *)(v33 - 8);
        __dsta = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v73 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__dsta(v32, 1, v33))
        {
          uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
          memcpy(__srca, v32, *(void *)(*(void *)(v34 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, const void *, uint64_t))(v73 + 16))(__srca, v32, v33);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v73 + 56))(__srca, 0, 1, v33);
        }
        a3 = v84;
        *(void *)(v22 + *(int *)(v24 + 36)) = *(void *)(v23 + *(int *)(v24 + 36));
        v58 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56);
        swift_bridgeObjectRetain();
        v58(v22, 0, 1, v24);
        goto LABEL_31;
      }
      goto LABEL_16;
    }
    if (v28)
    {
      sub_2263806F8(v22, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
LABEL_16:
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
      memcpy((void *)v22, (const void *)v23, *(void *)(*(void *)(v43 - 8) + 64));
      a3 = v84;
LABEL_31:
      uint64_t v59 = *(int *)(v6 + 36);
      v60 = (void *)(a1 + v59);
      v61 = (void *)(a2 + v59);
      void *v60 = *v61;
      v60[1] = v61[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    *(void *)uint64_t v22 = *(void *)v23;
    *(void *)(v22 + 8) = *(void *)(v23 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v22 + 16) = *(void *)(v23 + 16);
    *(void *)(v22 + 24) = *(void *)(v23 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v49 = *(void *)(v23 + 32);
    *(unsigned char *)(v22 + 40) = *(unsigned char *)(v23 + 40);
    *(void *)(v22 + 32) = v49;
    uint64_t v50 = *(void *)(v23 + 48);
    *(unsigned char *)(v22 + 56) = *(unsigned char *)(v23 + 56);
    *(void *)(v22 + 48) = v50;
    uint64_t v51 = *(int *)(v24 + 32);
    v52 = (void *)(v22 + v51);
    __srcb = (void *)(v23 + v51);
    uint64_t v53 = sub_226388508();
    uint64_t v77 = *(void *)(v53 - 8);
    v79 = v52;
    v54 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v77 + 48);
    LODWORD(v52) = v54(v52, 1, v53);
    int v55 = v54(__srcb, 1, v53);
    if (v52)
    {
      if (!v55)
      {
        (*(void (**)(void *, void *, uint64_t))(v77 + 16))(v79, __srcb, v53);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v77 + 56))(v79, 0, 1, v53);
        goto LABEL_30;
      }
      size_t v56 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      v57 = v79;
    }
    else
    {
      if (!v55)
      {
        (*(void (**)(void *, void *, uint64_t))(v77 + 24))(v79, __srcb, v53);
        goto LABEL_30;
      }
      (*(void (**)(void *, uint64_t))(v77 + 8))(v79, v53);
      size_t v56 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      v57 = v79;
    }
    memcpy(v57, __srcb, v56);
LABEL_30:
    a3 = v84;
    *(void *)(v22 + *(int *)(v24 + 36)) = *(void *)(v23 + *(int *)(v24 + 36));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  if (v10)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_32;
  }
  __src = v7;
  uint64_t v83 = a3;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v78 = v6;
  uint64_t v11 = *(int *)(v6 + 32);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48);
  uint64_t v17 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v17))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    uint64_t v19 = __src;
    a3 = v83;
  }
  else
  {
    *uint64_t v12 = *v13;
    v12[1] = v13[1];
    v12[2] = v13[2];
    v12[3] = v13[3];
    uint64_t v35 = v13[4];
    *((unsigned char *)v12 + 40) = *((unsigned char *)v13 + 40);
    v12[4] = v35;
    uint64_t v36 = v13[6];
    *((unsigned char *)v12 + 56) = *((unsigned char *)v13 + 56);
    v12[6] = v36;
    v72 = v12;
    uint64_t v74 = v17;
    uint64_t v37 = *(int *)(v17 + 32);
    __dst = (char *)v12 + v37;
    uint64_t v38 = (char *)v13 + v37;
    uint64_t v39 = sub_226388508();
    uint64_t v40 = *(void *)(v39 - 8);
    uint64_t v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v41(v38, 1, v39))
    {
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
      memcpy(__dst, v38, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(__dst, v38, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(__dst, 0, 1, v39);
    }
    uint64_t v19 = __src;
    a3 = v83;
    *(void *)((char *)v72 + *(int *)(v74 + 36)) = *(void *)((char *)v13 + *(int *)(v74 + 36));
    uint64_t v44 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56);
    swift_bridgeObjectRetain();
    v44(v72, 0, 1, v74);
  }
  uint64_t v45 = *(int *)(v78 + 36);
  v46 = (void *)(a1 + v45);
  v47 = (void *)(a2 + v45);
  void *v46 = *v47;
  v46[1] = v47[1];
  v48 = (void (*)(uint64_t, void, uint64_t, uint64_t))v19[7];
  swift_bridgeObjectRetain();
  v48(a1, 0, 1, v78);
LABEL_32:
  uint64_t v62 = *(int *)(a3 + 20);
  v63 = (void *)(a1 + v62);
  v64 = (void *)(a2 + v62);
  uint64_t v65 = sub_226388508();
  uint64_t v66 = *(void *)(v65 - 8);
  v67 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v66 + 48);
  int v68 = v67(v63, 1, v65);
  int v69 = v67(v64, 1, v65);
  if (!v68)
  {
    if (!v69)
    {
      (*(void (**)(void *, void *, uint64_t))(v66 + 24))(v63, v64, v65);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v66 + 8))(v63, v65);
    goto LABEL_37;
  }
  if (v69)
  {
LABEL_37:
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v63, v64, *(void *)(*(void *)(v70 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v66 + 16))(v63, v64, v65);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
  return a1;
}

_OWORD *initializeWithTake for TransparencySWSysdiagnose(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    long long v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v10 = *(int *)(v6 + 32);
    uint64_t v11 = (_OWORD *)((char *)a1 + v10);
    uint64_t v12 = (_OWORD *)((char *)a2 + v10);
    uint64_t v13 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      long long v16 = v12[1];
      *uint64_t v11 = *v12;
      v11[1] = v16;
      *((void *)v11 + 4) = *((void *)v12 + 4);
      *((unsigned char *)v11 + 40) = *((unsigned char *)v12 + 40);
      *((void *)v11 + 6) = *((void *)v12 + 6);
      *((unsigned char *)v11 + 56) = *((unsigned char *)v12 + 56);
      uint64_t v17 = *(int *)(v13 + 32);
      uint64_t v29 = a3;
      __dst = (char *)v11 + v17;
      uint64_t v18 = (char *)v12 + v17;
      uint64_t v19 = sub_226388508();
      uint64_t v28 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v18, 1, v19))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
        memcpy(__dst, v18, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 32))(__dst, v18, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v19);
      }
      *(void *)((char *)v11 + *(int *)(v13 + 36)) = *(void *)((char *)v12 + *(int *)(v13 + 36));
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      a3 = v29;
    }
    *(_OWORD *)((char *)a1 + *(int *)(v6 + 36)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 36));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = sub_226388508();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

uint64_t assignWithTake for TransparencySWSysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_2263806F8(a1, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
      goto LABEL_7;
    }
    uint64_t v70 = a3;
    uint64_t v19 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v19;
    swift_bridgeObjectRelease();
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    swift_bridgeObjectRelease();
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v20 = *(int *)(v6 + 32);
    uint64_t v21 = a1 + v20;
    uint64_t v22 = a2 + v20;
    uint64_t v23 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
    int v26 = v25(v21, 1, v23);
    int v27 = v25(v22, 1, v23);
    if (v26)
    {
      if (!v27)
      {
        long long v28 = *(_OWORD *)(v22 + 16);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
        *(_OWORD *)(v21 + 16) = v28;
        *(void *)(v21 + 32) = *(void *)(v22 + 32);
        *(unsigned char *)(v21 + 40) = *(unsigned char *)(v22 + 40);
        *(void *)(v21 + 48) = *(void *)(v22 + 48);
        *(unsigned char *)(v21 + 56) = *(unsigned char *)(v22 + 56);
        uint64_t v29 = *(int *)(v23 + 32);
        __dst = (void *)(v21 + v29);
        uint64_t v30 = (const void *)(v22 + v29);
        uint64_t v31 = sub_226388508();
        uint64_t v32 = *(void *)(v31 - 8);
        if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
        {
          uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
          memcpy(__dst, v30, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, const void *, uint64_t))(v32 + 32))(__dst, v30, v31);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(__dst, 0, 1, v31);
        }
        *(void *)(v21 + *(int *)(v23 + 36)) = *(void *)(v22 + *(int *)(v23 + 36));
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
        goto LABEL_25;
      }
LABEL_16:
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
      memcpy((void *)v21, (const void *)v22, *(void *)(*(void *)(v39 - 8) + 64));
LABEL_25:
      a3 = v70;
LABEL_26:
      uint64_t v49 = *(int *)(v6 + 36);
      uint64_t v50 = (void *)(a1 + v49);
      uint64_t v51 = (uint64_t *)(a2 + v49);
      uint64_t v53 = *v51;
      uint64_t v52 = v51[1];
      *uint64_t v50 = v53;
      v50[1] = v52;
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    if (v27)
    {
      sub_2263806F8(v21, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
      goto LABEL_16;
    }
    uint64_t v40 = *(void *)(v22 + 8);
    *(void *)uint64_t v21 = *(void *)v22;
    *(void *)(v21 + 8) = v40;
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void *)(v22 + 24);
    *(void *)(v21 + 16) = *(void *)(v22 + 16);
    *(void *)(v21 + 24) = v41;
    swift_bridgeObjectRelease();
    *(void *)(v21 + 32) = *(void *)(v22 + 32);
    *(unsigned char *)(v21 + 40) = *(unsigned char *)(v22 + 40);
    *(void *)(v21 + 48) = *(void *)(v22 + 48);
    *(unsigned char *)(v21 + 56) = *(unsigned char *)(v22 + 56);
    uint64_t v42 = *(int *)(v23 + 32);
    uint64_t v43 = (void *)(v21 + v42);
    __dstb = (void *)(v22 + v42);
    uint64_t v44 = sub_226388508();
    uint64_t v65 = *(void *)(v44 - 8);
    uint64_t v66 = v43;
    uint64_t v45 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v65 + 48);
    LODWORD(v43) = v45(v43, 1, v44);
    int v46 = v45(__dstb, 1, v44);
    if (v43)
    {
      if (!v46)
      {
        (*(void (**)(void *, void *, uint64_t))(v65 + 32))(v66, __dstb, v44);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v65 + 56))(v66, 0, 1, v44);
        goto LABEL_40;
      }
      size_t v47 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      v48 = v66;
    }
    else
    {
      if (!v46)
      {
        (*(void (**)(void *, void *, uint64_t))(v65 + 40))(v66, __dstb, v44);
        goto LABEL_40;
      }
      (*(void (**)(void *, uint64_t))(v65 + 8))(v66, v44);
      size_t v47 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      v48 = v66;
    }
    memcpy(v48, __dstb, v47);
LABEL_40:
    a3 = v70;
    *(void *)(v21 + *(int *)(v23 + 36)) = *(void *)(v22 + *(int *)(v23 + 36));
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  if (v10)
  {
LABEL_7:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_27;
  }
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v12 = *(int *)(v6 + 32);
  uint64_t v13 = (_OWORD *)(a1 + v12);
  uint64_t v14 = (_OWORD *)(a2 + v12);
  uint64_t v15 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    long long v34 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v34;
    *((void *)v13 + 4) = *((void *)v14 + 4);
    *((unsigned char *)v13 + 40) = *((unsigned char *)v14 + 40);
    *((void *)v13 + 6) = *((void *)v14 + 6);
    *((unsigned char *)v13 + 56) = *((unsigned char *)v14 + 56);
    uint64_t v35 = *(int *)(v15 + 32);
    __dsta = (char *)v13 + v35;
    uint64_t v71 = a3;
    uint64_t v36 = (char *)v14 + v35;
    uint64_t v37 = sub_226388508();
    uint64_t v64 = *(void *)(v37 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
      memcpy(__dsta, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(__dsta, v36, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(__dsta, 0, 1, v37);
    }
    a3 = v71;
    *(void *)((char *)v13 + *(int *)(v15 + 36)) = *(void *)((char *)v14 + *(int *)(v15 + 36));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(_OWORD *)(a1 + *(int *)(v6 + 36)) = *(_OWORD *)(a2 + *(int *)(v6 + 36));
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_27:
  uint64_t v54 = *(int *)(a3 + 20);
  int v55 = (void *)(a1 + v54);
  size_t v56 = (void *)(a2 + v54);
  uint64_t v57 = sub_226388508();
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v59 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v58 + 48);
  int v60 = v59(v55, 1, v57);
  int v61 = v59(v56, 1, v57);
  if (!v60)
  {
    if (!v61)
    {
      (*(void (**)(void *, void *, uint64_t))(v58 + 40))(v55, v56, v57);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v58 + 8))(v55, v57);
    goto LABEL_32;
  }
  if (v61)
  {
LABEL_32:
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v55, v56, *(void *)(*(void *)(v62 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v58 + 32))(v55, v56, v57);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22638462C);
}

uint64_t sub_22638462C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    long long v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226384740);
}

uint64_t sub_226384740(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D650);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_22638484C()
{
  sub_22638494C(319, &qword_26812D658, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.StateMachine);
  if (v0 <= 0x3F)
  {
    sub_22638494C(319, &qword_26812D608, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_22638494C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_226388528();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[2];
    uint64_t v9 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v9;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v10 = *(int *)(a3 + 32);
    __dst = (void *)(a1 + v10);
    long long v11 = (char *)a2 + v10;
    *(void *)(a1 + 16) = v8;
    uint64_t v12 = sub_226388508();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
      memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    *(void *)((char *)v4 + *(int *)(a3 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 36));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_226388508();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(void *)(a1 + 16) = v6;
  uint64_t v11 = sub_226388508();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_226388508();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, long long *a2, uint64_t a3)
{
  long long v6 = *a2;
  long long v7 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  uint64_t v11 = sub_226388508();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)((char *)a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t assignWithTake for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_226388508();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226385300);
}

uint64_t sub_226385300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, &qword_26812D600);
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226385320);
}

uint64_t sub_226385320(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, &qword_26812D600);
}

void sub_22638532C()
{
  sub_22638494C(319, &qword_26812D608, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.Reachability(unsigned __int8 *a1, unsigned int a2)
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
  if (v6 >= 2) {
    int v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v7 = -2;
  }
  if (v7 < 0) {
    int v7 = -1;
  }
  return (v7 + 1);
}

unsigned char *storeEnumTagSinglePayload for TransparencySWSysdiagnose.Reachability(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x22638557CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.Reachability()
{
  return &type metadata for TransparencySWSysdiagnose.Reachability;
}

void *initializeBufferWithCopyOfBuffer for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = *(int *)(a3 + 32);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v33 = (uint64_t *)((char *)a2 + v8);
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v10 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v33, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
      memcpy(v9, v33, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = v33[1];
      *uint64_t v9 = *v33;
      v9[1] = v15;
      uint64_t v16 = v33[3];
      v9[2] = v33[2];
      v9[3] = v16;
      v9[4] = v33[4];
      *((unsigned char *)v9 + 40) = *((unsigned char *)v33 + 40);
      v9[6] = v33[6];
      *((unsigned char *)v9 + 56) = *((unsigned char *)v33 + 56);
      uint64_t v30 = v10;
      uint64_t v31 = v9;
      uint64_t v17 = *(int *)(v10 + 32);
      uint64_t v18 = (char *)v9 + v17;
      uint64_t v19 = (char *)v33 + v17;
      uint64_t v20 = sub_226388508();
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v29(v19, 1, v20))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      *(void *)((char *)v31 + *(int *)(v30 + 36)) = *(void *)((char *)v33 + *(int *)(v30 + 36));
      uint64_t v23 = *(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56);
      swift_bridgeObjectRetain();
      v23(v31, 0, 1, v30);
    }
    uint64_t v24 = *(int *)(a3 + 36);
    uint64_t v25 = (void *)((char *)v4 + v24);
    int v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = v4 + *(int *)(v5 + 32);
    uint64_t v7 = sub_226388508();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = v8;
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = v8[1];
    *uint64_t v7 = *v8;
    v7[1] = v14;
    uint64_t v15 = v8[3];
    v7[2] = v8[2];
    v7[3] = v15;
    v7[4] = v8[4];
    *((unsigned char *)v7 + 40) = *((unsigned char *)v8 + 40);
    v7[6] = v8[6];
    *((unsigned char *)v7 + 56) = *((unsigned char *)v8 + 56);
    uint64_t v30 = v9;
    uint64_t v31 = v7;
    uint64_t v16 = *(int *)(v9 + 32);
    uint64_t v17 = (char *)v7 + v16;
    uint64_t v18 = v12;
    uint64_t v19 = (char *)v12 + v16;
    uint64_t v20 = sub_226388508();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
      memcpy(v17, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v17, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, v20);
    }
    *(void *)((char *)v31 + *(int *)(v30 + 36)) = *(void *)((char *)v18 + *(int *)(v30 + 36));
    uint64_t v23 = *(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56);
    swift_bridgeObjectRetain();
    v23(v31, 0, 1, v30);
  }
  uint64_t v24 = *(int *)(a3 + 36);
  uint64_t v25 = (void *)(a1 + v24);
  int v26 = (void *)(a2 + v24);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_2263806F8(v7, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
      goto LABEL_7;
    }
    uint64_t v41 = a3;
    *(void *)uint64_t v7 = *(void *)v8;
    *(void *)(v7 + 8) = *(void *)(v8 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 16) = *(void *)(v8 + 16);
    *(void *)(v7 + 24) = *(void *)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void *)(v8 + 32);
    *(unsigned char *)(v7 + 40) = *(unsigned char *)(v8 + 40);
    *(void *)(v7 + 32) = v21;
    uint64_t v22 = *(void *)(v8 + 48);
    *(unsigned char *)(v7 + 56) = *(unsigned char *)(v8 + 56);
    *(void *)(v7 + 48) = v22;
    uint64_t v23 = *(int *)(v9 + 32);
    uint64_t v24 = (void *)(v7 + v23);
    uint64_t v25 = (void *)(v8 + v23);
    uint64_t v26 = sub_226388508();
    uint64_t v38 = *(void *)(v26 - 8);
    uint64_t v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v38 + 48);
    __dsta = v24;
    LODWORD(v24) = v27(v24, 1, v26);
    int v28 = v27(v25, 1, v26);
    if (v24)
    {
      if (!v28)
      {
        (*(void (**)(void *, void *, uint64_t))(v38 + 16))(__dsta, v25, v26);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v38 + 56))(__dsta, 0, 1, v26);
        goto LABEL_18;
      }
      size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      uint64_t v30 = __dsta;
    }
    else
    {
      if (!v28)
      {
        (*(void (**)(void *, void *, uint64_t))(v38 + 24))(__dsta, v25, v26);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v38 + 8))(__dsta, v26);
      size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      uint64_t v30 = __dsta;
    }
    memcpy(v30, v25, v29);
LABEL_18:
    a3 = v41;
    *(void *)(v7 + *(int *)(v9 + 36)) = *(void *)(v8 + *(int *)(v9 + 36));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v13)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
    memcpy((void *)v7, (const void *)v8, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_19;
  }
  *(void *)uint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(v8 + 32);
  *(unsigned char *)(v7 + 40) = *(unsigned char *)(v8 + 40);
  *(void *)(v7 + 32) = v14;
  uint64_t v15 = *(void *)(v8 + 48);
  *(unsigned char *)(v7 + 56) = *(unsigned char *)(v8 + 56);
  *(void *)(v7 + 48) = v15;
  uint64_t v16 = *(int *)(v9 + 32);
  __dst = (void *)(v7 + v16);
  uint64_t v37 = (const void *)(v8 + v16);
  uint64_t v17 = sub_226388508();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v36 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v36(v37, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(__dst, v37, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(__dst, v37, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
  }
  *(void *)(v7 + *(int *)(v9 + 36)) = *(void *)(v8 + *(int *)(v9 + 36));
  uint64_t v31 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  v31(v7, 0, 1, v9);
LABEL_19:
  uint64_t v32 = *(int *)(a3 + 36);
  uint64_t v33 = (void *)(a1 + v32);
  long long v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  uint64_t v10 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    long long v13 = v9[1];
    _OWORD *v8 = *v9;
    v8[1] = v13;
    *((void *)v8 + 4) = *((void *)v9 + 4);
    *((unsigned char *)v8 + 40) = *((unsigned char *)v9 + 40);
    *((void *)v8 + 6) = *((void *)v9 + 6);
    *((unsigned char *)v8 + 56) = *((unsigned char *)v9 + 56);
    uint64_t v14 = *(int *)(v10 + 32);
    __dst = (char *)v8 + v14;
    uint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = sub_226388508();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
      memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(__dst, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
    }
    *(void *)((char *)v8 + *(int *)(v10 + 36)) = *(void *)((char *)v9 + *(int *)(v10 + 36));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 36)) = *(_OWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t assignWithTake for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_2263806F8(v8, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
      goto LABEL_7;
    }
    uint64_t v39 = a3;
    uint64_t v22 = *(void *)(v9 + 8);
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = v22;
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(v9 + 24);
    *(void *)(v8 + 16) = *(void *)(v9 + 16);
    *(void *)(v8 + 24) = v23;
    swift_bridgeObjectRelease();
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
    *(unsigned char *)(v8 + 40) = *(unsigned char *)(v9 + 40);
    *(void *)(v8 + 48) = *(void *)(v9 + 48);
    *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
    uint64_t v24 = *(int *)(v10 + 32);
    uint64_t v25 = (void *)(v8 + v24);
    uint64_t v26 = (void *)(v9 + v24);
    uint64_t v27 = sub_226388508();
    uint64_t v38 = *(void *)(v27 - 8);
    int v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v38 + 48);
    __dsta = v25;
    LODWORD(v25) = v28(v25, 1, v27);
    int v29 = v28(v26, 1, v27);
    if (v25)
    {
      if (!v29)
      {
        (*(void (**)(void *, void *, uint64_t))(v38 + 32))(__dsta, v26, v27);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v38 + 56))(__dsta, 0, 1, v27);
        goto LABEL_18;
      }
      size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      uint64_t v31 = __dsta;
    }
    else
    {
      if (!v29)
      {
        (*(void (**)(void *, void *, uint64_t))(v38 + 40))(__dsta, v26, v27);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v38 + 8))(__dsta, v27);
      size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26812D600) - 8) + 64);
      uint64_t v31 = __dsta;
    }
    memcpy(v31, v26, v30);
LABEL_18:
    a3 = v39;
    *(void *)(v8 + *(int *)(v10 + 36)) = *(void *)(v9 + *(int *)(v10 + 36));
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D638);
    memcpy((void *)v8, (const void *)v9, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_19;
  }
  long long v15 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v15;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(unsigned char *)(v8 + 40) = *(unsigned char *)(v9 + 40);
  *(void *)(v8 + 48) = *(void *)(v9 + 48);
  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  uint64_t v16 = *(int *)(v10 + 32);
  __dst = (void *)(v8 + v16);
  uint64_t v17 = (const void *)(v9 + v16);
  uint64_t v18 = sub_226388508();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26812D600);
    memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(__dst, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  *(void *)(v8 + *(int *)(v10 + 36)) = *(void *)(v9 + *(int *)(v10 + 36));
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_19:
  uint64_t v32 = *(int *)(a3 + 36);
  uint64_t v33 = (void *)(a1 + v32);
  long long v34 = (uint64_t *)(a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *uint64_t v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226386878);
}

uint64_t sub_226386878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, &qword_26812D638);
}

uint64_t __swift_get_extra_inhabitant_index_8Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 == 2147483646)
  {
    unint64_t v5 = *(void *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    int v6 = v5 - 1;
    if (v6 < 0) {
      int v6 = -1;
    }
    return (v6 + 1);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 32);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226386954);
}

uint64_t sub_226386954(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, &qword_26812D638);
}

uint64_t __swift_store_extra_inhabitant_index_9Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = v8;
    uint64_t v11 = v6 + *(int *)(a4 + 32);
    return v9(v11, a2, a2, v10);
  }
  return result;
}

void sub_226386A08()
{
  sub_22638494C(319, &qword_26812D640, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for SWTFollowUpType()
{
  return &type metadata for SWTFollowUpType;
}

uint64_t *initializeBufferWithCopyOfBuffer for TransparencySWIssue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_226388508();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TransparencySWIssue(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_226388508();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TransparencySWIssue(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226388508();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TransparencySWIssue(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226388508();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for TransparencySWIssue(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226388508();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for TransparencySWIssue(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_226388508();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWIssue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226386F48);
}

uint64_t sub_226386F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_226388508();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TransparencySWIssue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22638700C);
}

uint64_t sub_22638700C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_226388508();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2263870B4()
{
  uint64_t result = sub_226388508();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TransparencySWIssue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TransparencySWIssue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x2263872B4);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWIssue.CodingKeys()
{
  return &type metadata for TransparencySWIssue.CodingKeys;
}

uint64_t _s12Transparency15SWTFollowUpTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s12Transparency15SWTFollowUpTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x226387448);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_226387470(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_226387478(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.CodingKeys;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.StateMachine.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.StateMachine.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.Reachability.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for TransparencySWSysdiagnose.Reachability.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22638759CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2263875C4()
{
  return 0;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.Reachability.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.Reachability.CodingKeys;
}

uint64_t _s12Transparency25TransparencySWSysdiagnoseV12StateMachineV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s12Transparency25TransparencySWSysdiagnoseV12StateMachineV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x226387738);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_226387760(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.PublicKeybag.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.PublicKeybag.CodingKeys;
}

unint64_t sub_22638777C()
{
  unint64_t result = qword_26812EB80[0];
  if (!qword_26812EB80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812EB80);
  }
  return result;
}

unint64_t sub_2263877D4()
{
  unint64_t result = qword_26812EC90[0];
  if (!qword_26812EC90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812EC90);
  }
  return result;
}

unint64_t sub_22638782C()
{
  unint64_t result = qword_26812EDA0[0];
  if (!qword_26812EDA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812EDA0);
  }
  return result;
}

unint64_t sub_226387884()
{
  unint64_t result = qword_26812EEB0[0];
  if (!qword_26812EEB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812EEB0);
  }
  return result;
}

unint64_t sub_2263878DC()
{
  unint64_t result = qword_26812F0C0[0];
  if (!qword_26812F0C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812F0C0);
  }
  return result;
}

unint64_t sub_226387934()
{
  unint64_t result = qword_26812F1D0;
  if (!qword_26812F1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812F1D0);
  }
  return result;
}

unint64_t sub_22638798C()
{
  unint64_t result = qword_26812F1D8[0];
  if (!qword_26812F1D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812F1D8);
  }
  return result;
}

unint64_t sub_2263879E4()
{
  unint64_t result = qword_26812DD70[0];
  if (!qword_26812DD70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812DD70);
  }
  return result;
}

unint64_t sub_226387A3C()
{
  unint64_t result = qword_26812DD68;
  if (!qword_26812DD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DD68);
  }
  return result;
}

unint64_t sub_226387A94()
{
  unint64_t result = qword_26812DF10[0];
  if (!qword_26812DF10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812DF10);
  }
  return result;
}

unint64_t sub_226387AEC()
{
  unint64_t result = qword_26812DF08;
  if (!qword_26812DF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812DF08);
  }
  return result;
}

unint64_t sub_226387B44()
{
  unint64_t result = qword_26812E420[0];
  if (!qword_26812E420[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812E420);
  }
  return result;
}

unint64_t sub_226387B9C()
{
  unint64_t result = qword_26812E418;
  if (!qword_26812E418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812E418);
  }
  return result;
}

unint64_t sub_226387BF4()
{
  unint64_t result = qword_26812E1E0[0];
  if (!qword_26812E1E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26812E1E0);
  }
  return result;
}

unint64_t sub_226387C4C()
{
  unint64_t result = qword_26812E1D8;
  if (!qword_26812E1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26812E1D8);
  }
  return result;
}

uint64_t sub_226387CA0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7761509 && a2 == 0xE300000000000000;
  if (v2 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7368801 && a2 == 0xE300000000000000 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6542676F4C746170 && a2 == 0xED0000734D6E6967 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6542676F4C746C74 && a2 == 0xED0000734D6E6967 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D69546863746566 && a2 == 0xE900000000000065 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4164657473757274 && a2 == 0xEE00494B50537070)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_226388618();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_226387F58(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
  if (v2 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7367616C66 && a2 == 0xE500000000000000 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x46676E69646E6570 && a2 == 0xEC0000007367616CLL || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6962616863616572 && a2 == 0xEC0000007974696CLL || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xEC00000067616279 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656E6961746E6F63 && a2 == 0xED00006874615072)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_226388618();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_226388238(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x63614D6574617473 && a2 == 0xEC000000656E6968;
  if (v2 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B6361626C6C6166 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_226388618();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_226388344(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6575737369 && a2 == 0xE500000000000000;
  if (v2 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646574736F70 && a2 == 0xE600000000000000 || (sub_226388618() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 6843507 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_226388618();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_226388498()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_2263884A8()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_2263884B8()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_2263884C8()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_2263884D8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2263884E8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2263884F8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_226388508()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_226388518()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_226388528()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_226388538()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_226388548()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_226388558()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_226388568()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_226388578()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_226388588()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_226388598()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2263885A8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2263885B8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2263885C8()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_2263885D8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2263885E8()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_2263885F8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_226388608()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_226388618()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_226388628()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226388638()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226388648()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_226388658()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_226388668()
{
  return MEMORY[0x270F9FD98]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x270EE4CB8](keysToFetch, applicationID, userName, hostName);
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

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PCSPublicIdentityCopyPublicKeyInfo()
{
  return MEMORY[0x270F584F8]();
}

uint64_t PCSPublicIdentityCreateWithPublicKeyInfo()
{
  return MEMORY[0x270F58500]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x270ED8BC8]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x270ED8BD0]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x270ED8BD8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}