void sub_19D90B364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D90DDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D90EA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D90ECF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TRILogCategory_ClientFramework()
{
  if (_MergedGlobals_19 != -1) {
    dispatch_once(&_MergedGlobals_19, &__block_literal_global_24);
  }
  v0 = (void *)qword_1EB3B7980;
  return v0;
}

void sub_19D912914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
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

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
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

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id TRIValidateRampId(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"NSString<TRIRampId> * _Nullable TRIValidateRampId(NSString * _Nonnull __strong)"];
    [v5 handleFailureInFunction:v6, @"TRIStrongTypingProtocols.m", 61, @"Invalid parameter not satisfying: %@", @"rampId" file lineNumber description];
  }
  if ([v1 triIsPathSafePlausibleUniqueId])
  {
    id v2 = v1;
  }
  else
  {
    v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v1;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for a ramp ID: %@", buf, 0xCu);
    }

    id v2 = 0;
  }

  return v2;
}

void sub_19D914044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D91459C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D916794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D918630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_19D918D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  if (v12) {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  _Unwind_Resume(a1);
}

void sub_19D9194A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19D919818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19D919D18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19D91A0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19D91A77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19D91AB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19D91AF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19D91B280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19D91B6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19D91BA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19D91BE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19D91C284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19D91C638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19D91C81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D91CA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

unint64_t TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor))
  {
    uint64_t v1 = (void *)[MEMORY[0x1E4FB05D8] allocDescriptorForName:@"TRIPersistedNetworkBehavior_DiscretionaryBehavior" valueNames:"Discretionary" values:&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_values count:3 enumVerifier:TRIPersistedNetworkBehavior_DiscretionaryBehavior_IsValidValue extraTextFormatInfo:&unk_19D98B7EC];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor);
}

BOOL TRIPersistedNetworkBehavior_DiscretionaryBehavior_IsValidValue(int a1)
{
  return (a1 - 1) < 3;
}

unint64_t TRIPurgeabilityLevel_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&TRIPurgeabilityLevel_EnumDescriptor_descriptor))
  {
    uint64_t v1 = (void *)[MEMORY[0x1E4FB05D8] allocDescriptorForName:@"TRIPurgeabilityLevel" valueNames:"LowDisk" values:&TRIPurgeabilityLevel_EnumDescriptor_values count:4 enumVerifier:TRIPurgeabilityLevel_IsValidValue];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&TRIPurgeabilityLevel_EnumDescriptor_descriptor, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&TRIPurgeabilityLevel_EnumDescriptor_descriptor);
}

BOOL TRIPurgeabilityLevel_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

void sub_19D91F638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_19D91FB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_19D9200F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_19D9216F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_19D923F68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    uint64_t v15 = *MEMORY[0x1E4FB0670];
    a10 = *MEMORY[0x1E4FB0668];
    a11 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&a10 count:2];
    uint64_t v17 = [v14 name];
    int v18 = [v16 containsObject:v17];

    if (v18)
    {
      if (!*v12)
      {
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = (void *)[v19 initWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
        uint64_t v21 = [*(id *)(v13 + 8) streamError];
        v22 = (void *)v21;
        if (v21) {
          v23 = (void *)v21;
        }
        else {
          v23 = v20;
        }
        objc_storeStrong(v12, v23);
      }
      if (v11) {
        objc_storeStrong(v11, *v12);
      }

      objc_end_catch();
      JUMPOUT(0x19D923ECCLL);
    }
    objc_exception_throw(v14);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D9244DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(exception_object);
    uint64_t v14 = *MEMORY[0x1E4FB0670];
    a10 = *MEMORY[0x1E4FB0668];
    a11 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&a10 count:2];
    uint64_t v16 = [v13 name];
    int v17 = [v15 containsObject:v16];

    if (v17)
    {
      int v18 = (id *)(v12 + 24);
      if (!*(void *)(v12 + 24))
      {
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = (void *)[v19 initWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
        uint64_t v21 = [*(id *)(v12 + 8) streamError];
        v22 = (void *)v21;
        if (v21) {
          v23 = (void *)v21;
        }
        else {
          v23 = v20;
        }
        objc_storeStrong(v18, v23);
      }
      if (v11) {
        objc_storeStrong(v11, *v18);
      }

      objc_end_catch();
      JUMPOUT(0x19D9244A8);
    }
    objc_exception_throw(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D9247D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *TRIFBCloudKitContainerStringForValue(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E596A798[(char)a1];
  }
}

uint64_t TRIFBCloudKitContainerIsValidValue(int a1)
{
  BOOL v1 = a1 == 1 || a1 == 0;
  return a1 == 2 || v1;
}

__CFString *TRIFBCloudKitAssetSourceStringForValue(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E596A7B0[(char)a1];
  }
}

uint64_t TRIFBCloudKitAssetSourceIsValidValue(int a1)
{
  BOOL v1 = a1 == 1 || a1 == 0;
  return a1 == 2 || v1;
}

__CFString *TRIFBFilesystemAssetTypeStringForValue(int a1)
{
  BOOL v1 = @"TRIFBFilesystemAssetType_FILE";
  if (a1 != 1) {
    BOOL v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"TRIFBFilesystemAssetType_DIR";
  }
}

BOOL TRIFBFilesystemAssetTypeIsValidValue(unsigned int a1)
{
  return a1 < 2;
}

__CFString *TRIFBLevelStringForValue(unsigned int a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_1E596A7C8[(char)a1];
  }
}

uint64_t TRIFBLevelIsValidValue(int a1)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

__CFString *TRIFBSourceStringForValue(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E596A800[(char)a1];
  }
}

uint64_t TRIFBSourceIsValidValue(int a1)
{
  BOOL v1 = a1 == 1 || a1 == 0;
  return a1 == 2 || v1;
}

void sub_19D926A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *makeNSString(NSString *a1, AFBBufRef *a2, const char *a3)
{
  v5 = a1;
  v6 = a2;
  [(AFBBufRef *)v6 retainBuf];
  v7 = (__CFString *)CFStringCreateWithCStringNoCopy(0, a3, 0x8000100u, (CFAllocatorRef)[(AFBBufRef *)v6 deallocator]);
  if (!v7)
  {
    [(AFBBufRef *)v6 releaseBuf];
    uint64_t v9 = [[NSString alloc] initWithFormat:@"%@ unable to decode null-terminated string as UTF-8", v5];
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F4D890] reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }

  return v7;
}

void sub_19D926B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D926C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D926D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D927070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9271A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D927238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9273D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9274E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D927624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(apple::aiml::flatbuffers2::FlatBufferBuilder *this, int a2)
{
  if (!*((unsigned char *)this + 70)) {
    __assert_rtn("EndTable", "flatbuffers.h", 1450, "nested");
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 4uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(this, 4uLL);
  uint64_t v4 = *((void *)this + 6);
  *(_DWORD *)(v4 - 4) = 0;
  v4 -= 4;
  *((void *)this + 6) = v4;
  uint64_t v5 = *((void *)this + 4) - v4 + *((void *)this + 5);
  if ((unsigned __int16)(*((_WORD *)this + 34) + 2) <= 4u) {
    unint64_t v6 = 4;
  }
  else {
    unint64_t v6 = (unsigned __int16)(*((_WORD *)this + 34) + 2);
  }
  *((_WORD *)this + 34) = v6;
  apple::aiml::flatbuffers2::vector_downward::ensure_space(this, v6);
  v7 = (void *)(*((void *)this + 6) - v6);
  *((void *)this + 6) = v7;
  bzero(v7, v6);
  unsigned __int16 v8 = v5 - a2;
  if ((v5 - a2) >= 0x10000) {
    __assert_rtn("EndTable", "flatbuffers.h", 1465, "table_object_size < 0x10000");
  }
  uint64_t v9 = (unsigned __int16 *)*((void *)this + 6);
  if (!v9) {
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  }
  v9[1] = v8;
  *uint64_t v9 = *((_WORD *)this + 34);
  unint64_t v10 = *((void *)this + 7);
  if (!v10) {
    __assert_rtn("scratch_end", "flatbuffers.h", 1026, "scratch_");
  }
  uint64_t v11 = *((unsigned int *)this + 16);
  unint64_t v12 = v10 - 8 * v11;
  if (v11)
  {
    id v13 = (int *)(v10 - 8 * v11);
    do
    {
      uint64_t v14 = *((unsigned __int16 *)v13 + 2);
      if (*(unsigned __int16 *)((char *)v9 + v14)) {
        __assert_rtn("EndTable", "flatbuffers.h", 1476, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      }
      int v15 = *v13;
      v13 += 2;
      *(unsigned __int16 *)((char *)v9 + v14) = v5 - v15;
    }
    while ((unint64_t)v13 < v10);
  }
  *((void *)this + 7) = v12;
  *((_DWORD *)this + 16) = 0;
  *((_WORD *)this + 34) = 0;
  uint64_t v17 = *((void *)this + 4);
  unint64_t v16 = *((void *)this + 5);
  LODWORD(v18) = v17 - v9 + v16;
  if (*((unsigned char *)this + 81))
  {
    if (!v16) {
      __assert_rtn("scratch_data", "flatbuffers.h", 1021, "buf_");
    }
    if (v16 < v12)
    {
      size_t v19 = *v9;
      uint64_t v20 = v16 + v17;
      uint64_t v21 = (unsigned int *)*((void *)this + 5);
      while (1)
      {
        uint64_t v18 = *v21;
        if (v19 == *(unsigned __int16 *)(v20 - v18) && !memcmp((const void *)(v20 - v18), v9, v19)) {
          break;
        }
        if ((unint64_t)++v21 >= v12)
        {
          LODWORD(v18) = v17 - v9 + v16;
          goto LABEL_21;
        }
      }
      uint64_t v9 = (unsigned __int16 *)((char *)v9 + (v17 - v9 + v16 - v5));
      *((void *)this + 6) = v9;
    }
  }
LABEL_21:
  if (v18 == v17 + v16 - v9)
  {
    apple::aiml::flatbuffers2::vector_downward::ensure_space(this, 4uLL);
    v22 = (_DWORD *)*((void *)this + 7);
    _DWORD *v22 = v18;
    *((void *)this + 7) = v22 + 1;
    uint64_t v17 = *((void *)this + 4);
    unint64_t v16 = *((void *)this + 5);
  }
  *(_DWORD *)(v16 + v17 - v5) = v18 - v5;
  *((unsigned char *)this + 70) = 0;
  return v5;
}

void sub_19D9279EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    unint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    unint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D9279BCLL);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

void sub_19D927C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D927E00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    unint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    unint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D927DD0);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D927FB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    unint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    unint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D927F88);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D928410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D928614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::Offset<void>>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, unint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a2 >> 62) {
      std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = (char *)operator new(4 * a2);
    bzero(v6, 4 * a2);
    uint64_t v7 = 0;
    unsigned __int16 v8 = &v6[4 * a2];
    do
    {
      uint64_t v9 = *(void *)(a3 + 24);
      uint64_t v18 = v7;
      if (!v9) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      *(_DWORD *)&v6[4 * v7++] = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v9 + 48))(v9, &v18);
    }
    while (a2 != v7);
  }
  else
  {
    unsigned __int16 v8 = 0;
    unint64_t v6 = 0;
  }
  uint64_t v10 = v8 - v6;
  if (v8 == v6) {
    uint64_t v11 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<void>,std::allocator<apple::aiml::flatbuffers2::Offset<void>>>(std::vector<apple::aiml::flatbuffers2::Offset<void>> const&)::t;
  }
  else {
    uint64_t v11 = v6;
  }
  uint64_t v12 = v10 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, v10 >> 2, 4uLL);
  if (v6 != v8)
  {
    id v13 = v11 - 4;
    uint64_t v14 = v12;
    do
    {
      int v15 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(a1, *(_DWORD *)&v13[4 * v14]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a1, v15);
      --v14;
    }
    while (v14);
  }
  uint64_t v16 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, v12);
  if (v6) {
    operator delete(v6);
  }
  return v16;
}

void sub_19D9288AC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D928B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double apple::aiml::flatbuffers2::FlatBufferBuilder::Release(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 71)) {
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  }
  int v2 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)this = *(void *)a2;
  *((unsigned char *)this + 8) = v2;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = v3;
  *((void *)this + 4) = v5;
  *((void *)this + 5) = (v3 + v4 - v5);
  if (v2)
  {
    *(void *)a2 = 0;
    *(unsigned char *)(a2 + 8) = 0;
  }
  double result = 0.0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  return result;
}

void sub_19D928E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::GetBufferPointer(apple::aiml::flatbuffers2::FlatBufferBuilder *this)
{
  if (!*((unsigned char *)this + 71)) {
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  }
  uint64_t result = *((void *)this + 6);
  if (!result) {
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  }
  return result;
}

void sub_19D928F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92910C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9291B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D929358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D929434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9296CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9298A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D929C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D929ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D929F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A2D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92A964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92ADC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92B024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92B0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92B254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92B3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92B50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92B7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92B978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92BB50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D92BB20);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D92BD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92BFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92C23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92C420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D92C3F0);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D92C5D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D92C5A8);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D92C800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92C9D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D92C9A8);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D92CEF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92D11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92D4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92D748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92D82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92D934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92DA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92DADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92DBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92DD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92DE00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92DF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E0F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92E81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92EBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92EDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D92EE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92EFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92F268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92F488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92F658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92F8A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92FAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D92FCC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D92FC90);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D92FE78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D92FE48);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D930030(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D930000);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D930258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D930854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D930AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D930E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9310CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9311B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D931288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D931360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D9314A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D9315C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D931684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9317B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9318B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93197C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D931AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D931D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D931DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D931E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93201C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93218C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9322C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D932480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9326C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D932C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D932FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  _Unwind_Resume(a1);
}

void sub_19D933234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D9334C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D9338DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D9339EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D933F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

FactorLevel *FactorLevel::level_as_string_val(FactorLevel *this)
{
  BOOL v1 = &this[-*(int *)this->var0];
  unsigned int v2 = *(unsigned __int16 *)v1->var0;
  if (v2 >= 7
    && *(_WORD *)v1[6].var0
    && (v2 >= 9 ? (BOOL v3 = this[*(unsigned __int16 *)v1[6].var0].var0[0] == 2) : (BOOL v3 = 0),
        v3 && (uint64_t v4 = *(unsigned __int16 *)v1[8].var0) != 0))
  {
    return &this[v4 + *(unsigned int *)this[v4].var0];
  }
  else
  {
    return 0;
  }
}

void sub_19D9340C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9348AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9349F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D934FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D935110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9351BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9352DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D935388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9354A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D935B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D935D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D935ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D935F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D936120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9363AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D936544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D936938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D936B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D936DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D937028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D937290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9374F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D937760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9379C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D937C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D937E08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D937DD8);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D938030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D938278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9384C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D938698(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    uint64_t v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E4F28568];
    id v13 = (void *)[[NSString alloc] initWithUTF8String:(*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12)];
    a11 = (uint64_t)v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F4D888] code:3 userInfo:v14];
    [*(id *)(v11 + 8) setError:v16];

    __cxa_end_catch();
    JUMPOUT(0x19D938668);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D938C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D939048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__638(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__639(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_19D939304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9397F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9398D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D9399AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D939F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93A074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93A158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93A2E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93A5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93A7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93A97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

FastFactorLevels *FastFactorLevels::source_as_treatment_id(FastFactorLevels *this)
{
  BOOL v1 = &this[-*(int *)this->var0];
  unsigned int v2 = *(unsigned __int16 *)v1->var0;
  if (v2 >= 7
    && *(_WORD *)v1[6].var0
    && (v2 >= 9 ? (BOOL v3 = this[*(unsigned __int16 *)v1[6].var0].var0[0] == 1) : (BOOL v3 = 0),
        v3 && (uint64_t v4 = *(unsigned __int16 *)v1[8].var0) != 0))
  {
    return &this[v4 + *(unsigned int *)this[v4].var0];
  }
  else
  {
    return 0;
  }
}

void sub_19D93AAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93AC30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93ADB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93AEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93B018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93B11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93B1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93B314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93B41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93B618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93BABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93BBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93BCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93BD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93C108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93C2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19D93C3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93C5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93C7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93CA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93CCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93CEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93D154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93D750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93D99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93DD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93DFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93E0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93E184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93E254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93E32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93E404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19D93E528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93E590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93E7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93E874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93EABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93EC40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93EEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedBool>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, unint64_t a2, uint64_t a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a2, 1uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(a1, a2);
  unint64_t v6 = *((void *)a1 + 6) - a2;
  *((void *)a1 + 6) = v6;
  if (a2)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(a3 + 24);
      uint64_t v10 = v6 + v7;
      uint64_t v11 = v7;
      if (!v8) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v8 + 48))(v8, &v11, &v10);
      ++v7;
    }
    while (a2 != v7);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a2);
}

void sub_19D93F298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93F4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93F540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93F75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93F814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93FA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93FBD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D93FE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedInt64>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 8 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a2 & 0x1FFFFFFFFFFFFFFFLL, 8uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(a1, v6);
  uint64_t v7 = *((void *)a1 + 6) - 8 * a2;
  *((void *)a1 + 6) = v7;
  if (a2)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(a3 + 24);
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      if (!v9) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v9 + 48))(v9, &v12, &v11);
      v7 += 8;
      ++v8;
    }
    while (a2 != v8);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a2);
}

void sub_19D940238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D940480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9404F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D94070C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9407C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D940A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D940B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D940E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedDouble>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 8 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a2 & 0x1FFFFFFFFFFFFFFFLL, 8uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(a1, v6);
  uint64_t v7 = *((void *)a1 + 6) - 8 * a2;
  *((void *)a1 + 6) = v7;
  if (a2)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(a3 + 24);
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      if (!v9) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v9 + 48))(v9, &v12, &v11);
      v7 += 8;
      ++v8;
    }
    while (a2 != v8);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a2);
}

void sub_19D9411E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(uint64_t this)
{
  if (*(unsigned char *)(this + 70)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
  }
  if (*(_DWORD *)(this + 64)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
  }
  return this;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::Align(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((void *)this + 9) < a2) {
    *((void *)this + 9) = a2;
  }
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

unint64_t apple::aiml::flatbuffers2::vector_downward::fill(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t result = apple::aiml::flatbuffers2::vector_downward::ensure_space(this, a2);
  *((void *)this + 6) -= a2;
  if (a2)
  {
    uint64_t v5 = 0;
    do
      *(unsigned char *)(*((void *)this + 6) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::vector_downward::ensure_space(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unsigned int v2 = (char *)*((void *)this + 6);
  unint64_t v3 = *((void *)this + 7);
  if ((unint64_t)v2 < v3
    || (unint64_t v6 = (unsigned __int8 *)*((void *)this + 5), v7 = v3 - v6, v3 < (unint64_t)v6))
  {
    __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
  }
  unint64_t v8 = *((void *)this + 4);
  if ((unint64_t)&v2[-v3] < a2)
  {
    unsigned int v9 = v8 - v2 + v6;
    if (v8) {
      unint64_t v10 = v8 >> 1;
    }
    else {
      unint64_t v10 = *((void *)this + 2);
    }
    if (v10 <= a2) {
      unint64_t v10 = a2;
    }
    unint64_t v11 = (v8 + *((void *)this + 3) + v10 - 1) & -*((void *)this + 3);
    *((void *)this + 4) = v11;
    uint64_t v12 = *(void *)this;
    if (v6)
    {
      if (v12)
      {
        id v13 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 32))(v12);
      }
      else
      {
        id v15 = &unk_1EEFB62D0;
        id v13 = apple::aiml::flatbuffers2::Allocator::reallocate_downward((apple::aiml::flatbuffers2::Allocator *)&v15, v6, v8, v11, v9, (v3 - v6));
      }
    }
    else
    {
      if (!v12)
      {
        id v15 = &unk_1EEFB62D0;
        operator new[]();
      }
      id v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v12 + 16))(v12, v11);
    }
    LODWORD(v6) = v13;
    unint64_t v8 = *((void *)this + 4);
    unsigned int v2 = &v13[v8 - v9];
    *((void *)this + 5) = v13;
    *((void *)this + 6) = v2;
    *((void *)this + 7) = &v13[v7];
  }
  if ((v8 - v2 + v6) >= 0x7FFFFFFF) {
    __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  return a2;
}

char *apple::aiml::flatbuffers2::Allocator::reallocate_downward(apple::aiml::flatbuffers2::Allocator *this, unsigned __int8 *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
  }
  uint64_t v12 = (char *)(*(uint64_t (**)(apple::aiml::flatbuffers2::Allocator *, unint64_t))(*(void *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(apple::aiml::flatbuffers2::Allocator *, unsigned __int8 *, unint64_t))(*(void *)this + 24))(this, a2, a3);
  return v12;
}

void apple::aiml::flatbuffers2::DefaultAllocator::~DefaultAllocator(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
}

void apple::aiml::flatbuffers2::DefaultAllocator::allocate(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
}

void apple::aiml::flatbuffers2::DefaultAllocator::deallocate(apple::aiml::flatbuffers2::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2) {
    JUMPOUT(0x19F3ACBB0);
  }
}

apple::aiml::flatbuffers2::vector_downward *apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(apple::aiml::flatbuffers2::vector_downward *this, uint64_t a2, int a3)
{
  char v3 = a3;
  uint64_t v5 = this;
  if (a3 || *((unsigned char *)this + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v5, 1uLL);
    unint64_t v6 = (unsigned char *)(*((void *)v5 + 6) - 1);
    *((void *)v5 + 6) = v6;
    unsigned char *v6 = v3;
    uint64_t v7 = (*((_DWORD *)v5 + 8) - *((_DWORD *)v5 + 12) + *((_DWORD *)v5 + 10));
    this = (apple::aiml::flatbuffers2::vector_downward *)apple::aiml::flatbuffers2::vector_downward::ensure_space(v5, 8uLL);
    **((void **)v5 + 7) = v7 | (a2 << 32);
    *((void *)v5 + 7) += 8;
    ++*((_DWORD *)v5 + 16);
    unsigned int v8 = *((unsigned __int16 *)v5 + 34);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *((_WORD *)v5 + 34) = v8;
  }
  return this;
}

apple::aiml::flatbuffers2::FlatBufferBuilder *apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(apple::aiml::flatbuffers2::FlatBufferBuilder *result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)result;
    int v5 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(result, a3);
    return (apple::aiml::flatbuffers2::FlatBufferBuilder *)apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(v4, a2, v5);
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4 = result;
  if (a3 || *(unsigned char *)(result + 80))
  {
    unsigned int v5 = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>(result, a3);
    unint64_t result = apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)v4, 8uLL);
    **(void **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(void *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2) {
      LOWORD(v6) = a2;
    }
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unsigned int a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 4uLL);
  if (!a2
    || (unsigned int v4 = *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10), v5 = v4 >= a2, v6 = v4 - a2, !v5))
  {
    __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
  }
  return v6 + 4;
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>(uint64_t a1, int a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 4uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 4uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = a2;
  v4 -= 4;
  *(void *)(a1 + 48) = v4;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(apple::aiml::flatbuffers2::DetachedBuffer *this)
{
  char v3 = (_OWORD *)((char *)this + 16);
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    uint64_t v4 = *(void *)this;
    if (*(void *)this) {
      (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    }
    else {
      MEMORY[0x19F3ACBB0](v2, 0x1000C8077774924);
    }
  }
  if (*((unsigned char *)this + 8) && *(void *)this) {
    (*(void (**)(void))(**(void **)this + 8))(*(void *)this);
  }
  *(void *)this = 0;
  *((unsigned char *)this + 8) = 0;
  _OWORD *v3 = 0u;
  v3[1] = 0u;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 8uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL);
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(v6 - 8) = a3;
  v6 -= 8;
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = (*(_DWORD *)(a1 + 32) - v6 + *(_DWORD *)(a1 + 40));
  unint64_t result = apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL);
  **(void **)(a1 + 56) = v7 | (a2 << 32);
  *(void *)(a1 + 56) += 8;
  ++*(_DWORD *)(a1 + 64);
  unsigned int v9 = *(unsigned __int16 *)(a1 + 68);
  if (v9 <= a2) {
    LOWORD(v9) = a2;
  }
  *(_WORD *)(a1 + 68) = v9;
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = a3;
  unint64_t v10 = (unsigned int *)result;
  while (2)
  {
    v118 = a2 - 1;
    v114 = a2 - 3;
    v115 = a2 - 2;
    unint64_t v11 = v10;
    v124 = a2;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v10 = v11;
          uint64_t v12 = (char *)a2 - (char *)v11;
          uint64_t v13 = a2 - v11;
          if (v6 || !v5)
          {
            switch(v13)
            {
              case 0:
              case 1:
                return result;
              case 2:
                uint64_t v51 = *(a2 - 1);
                uint64_t v52 = *(void *)(*(void *)v8 + 40) + *(void *)(*(void *)v8 + 32);
                uint64_t v53 = *v10;
                unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v52 - v51), (const FactorMetadataKeyValue *)(v52 - v53));
                if (result)
                {
                  *unint64_t v10 = v51;
                  *(a2 - 1) = v53;
                }
                break;
              case 3:
                uint64_t v54 = *(void *)(*(void *)v8 + 32);
                uint64_t v55 = *(void *)(*(void *)v8 + 40);
                unint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v10 + 1, v118, v54, v55);
                break;
              case 4:
                unint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v10 + 1, v10 + 2, v118, v8);
                break;
              case 5:
                unint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v10 + 1, v10 + 2, v10 + 3, v118, v8);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          v126 = v10;
          if (v12 <= 95)
          {
            v56 = v10 + 1;
            BOOL v58 = v10 == a2 || v56 == a2;
            if (a5)
            {
              if (!v58)
              {
                uint64_t v59 = 0;
                uint64_t v60 = *(void *)(*(void *)v8 + 40) + *(void *)(*(void *)v8 + 32);
                v61 = v10;
                do
                {
                  uint64_t v63 = *v61;
                  uint64_t v62 = v61[1];
                  v61 = v56;
                  unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v60 - v62), (const FactorMetadataKeyValue *)(v60 - v63));
                  if (result)
                  {
                    uint64_t v64 = v59;
                    while (1)
                    {
                      *(unsigned int *)((char *)v126 + v64 + 4) = v63;
                      if (!v64) {
                        break;
                      }
                      uint64_t v63 = *(unsigned int *)((char *)v126 + v64 - 4);
                      unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v60 - v62), (const FactorMetadataKeyValue *)(v60 - v63));
                      v64 -= 4;
                      if ((result & 1) == 0)
                      {
                        v65 = (unsigned int *)((char *)v126 + v64 + 4);
                        goto LABEL_84;
                      }
                    }
                    v65 = v126;
LABEL_84:
                    unsigned int *v65 = v62;
                  }
                  v56 = v61 + 1;
                  v59 += 4;
                }
                while (v61 + 1 != a2);
              }
            }
            else if (!v58)
            {
              uint64_t v110 = *(void *)(*(void *)v8 + 40) + *(void *)(*(void *)v8 + 32);
              do
              {
                uint64_t v112 = *v10;
                uint64_t v111 = v10[1];
                unint64_t v10 = v56;
                unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v110 - v111), (const FactorMetadataKeyValue *)(v110 - v112));
                if (result)
                {
                  v113 = v10;
                  do
                  {
                    unsigned int *v113 = v112;
                    uint64_t v112 = *(v113 - 2);
                    unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v110 - v111), (const FactorMetadataKeyValue *)(v110 - v112));
                    --v113;
                  }
                  while ((result & 1) != 0);
                  unsigned int *v113 = v111;
                }
                v56 = v10 + 1;
              }
              while (v10 + 1 != a2);
            }
            return result;
          }
          if (!a4)
          {
            if (v10 != a2)
            {
              unint64_t v116 = v12;
              uint64_t v117 = v13;
              int64_t v66 = (unint64_t)(v13 - 2) >> 1;
              int64_t v67 = v66;
              do
              {
                int64_t v68 = v67;
                if (v66 >= v67)
                {
                  uint64_t v69 = *(void *)a3;
                  int64_t v122 = v68;
                  uint64_t v70 = (2 * v68) | 1;
                  v71 = v126;
                  v72 = &v126[v70];
                  uint64_t v73 = 2 * v68 + 2;
                  if (v73 < v13)
                  {
                    uint64_t v74 = *v72;
                    uint64_t v78 = *(void *)(v69 + 32);
                    uint64_t v77 = *(void *)(v69 + 40);
                    uint64_t v76 = v72[1];
                    BOOL v75 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v77 + v78 - v74), (const FactorMetadataKeyValue *)(v77 + v78 - v76));
                    if (v75) {
                      ++v72;
                    }
                    else {
                      LODWORD(v76) = v74;
                    }
                    v71 = v126;
                    if (v75) {
                      uint64_t v70 = v73;
                    }
                  }
                  else
                  {
                    LODWORD(v76) = *v72;
                    uint64_t v78 = *(void *)(v69 + 32);
                    uint64_t v77 = *(void *)(v69 + 40);
                  }
                  int64_t v68 = v122;
                  v79 = &v71[v122];
                  uint64_t v80 = v77 + v78;
                  uint64_t v119 = *v79;
                  v81 = (const FactorMetadataKeyValue *)(v80 - v119);
                  unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v80 - v76), (const FactorMetadataKeyValue *)(v80 - v119));
                  if ((result & 1) == 0)
                  {
                    do
                    {
                      unsigned int *v79 = v76;
                      v79 = v72;
                      if (v66 < v70) {
                        break;
                      }
                      uint64_t v82 = (2 * v70) | 1;
                      v72 = &v126[v82];
                      uint64_t v70 = 2 * v70 + 2;
                      if (v70 < v13)
                      {
                        uint64_t v76 = *v72;
                        v83 = v81;
                        int64_t v84 = v66;
                        uint64_t v85 = v72[1];
                        BOOL v86 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v80 - v76), (const FactorMetadataKeyValue *)(v80 - v85));
                        if (v86) {
                          LODWORD(v76) = v85;
                        }
                        int64_t v66 = v84;
                        v81 = v83;
                        uint64_t v13 = v117;
                        if (v86) {
                          ++v72;
                        }
                        else {
                          uint64_t v70 = v82;
                        }
                      }
                      else
                      {
                        LODWORD(v76) = *v72;
                        uint64_t v70 = v82;
                      }
                      unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v80 - v76), v81);
                    }
                    while (!result);
                    int64_t v68 = v122;
                    unsigned int *v79 = v119;
                  }
                }
                int64_t v67 = v68 - 1;
              }
              while (v68);
              uint64_t v87 = v116 >> 2;
              v88 = v124;
              v89 = v126;
              v90 = (uint64_t *)a3;
              do
              {
                v125 = v88;
                uint64_t v91 = 0;
                unsigned int v120 = *v89;
                uint64_t v92 = *v90;
                uint64_t v93 = v87 - 2;
                if (v87 < 2) {
                  uint64_t v93 = v87 - 1;
                }
                uint64_t v94 = v93 >> 1;
                do
                {
                  v95 = &v89[v91 + 1];
                  uint64_t v96 = (2 * v91) | 1;
                  uint64_t v97 = 2 * v91 + 2;
                  if (v97 >= v87)
                  {
                    unsigned int v101 = *v95;
                    uint64_t v91 = (2 * v91) | 1;
                  }
                  else
                  {
                    uint64_t v98 = *v95;
                    uint64_t v99 = *(void *)(v92 + 40) + *(void *)(v92 + 32);
                    uint64_t v100 = v95[1];
                    unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v99 - v98), (const FactorMetadataKeyValue *)(v99 - v100));
                    if (result) {
                      unsigned int v101 = v100;
                    }
                    else {
                      unsigned int v101 = v98;
                    }
                    if (result)
                    {
                      ++v95;
                      uint64_t v91 = v97;
                    }
                    else
                    {
                      uint64_t v91 = v96;
                    }
                  }
                  unsigned int *v89 = v101;
                  v89 = v95;
                }
                while (v91 <= v94);
                v102 = v125 - 1;
                if (v95 == v125 - 1)
                {
                  v88 = v125 - 1;
                  unsigned int *v95 = v120;
                }
                else
                {
                  unsigned int *v95 = *v102;
                  v88 = v125 - 1;
                  unsigned int *v102 = v120;
                  uint64_t v103 = (char *)v95 - (char *)v126 + 4;
                  if (v103 >= 5)
                  {
                    unint64_t v104 = (((unint64_t)v103 >> 2) - 2) >> 1;
                    v105 = &v126[v104];
                    uint64_t v106 = *v105;
                    uint64_t v107 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
                    uint64_t v108 = *v95;
                    unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v107 - v106), (const FactorMetadataKeyValue *)(v107 - v108));
                    if (result)
                    {
                      do
                      {
                        unsigned int *v95 = v106;
                        v95 = v105;
                        if (!v104) {
                          break;
                        }
                        unint64_t v104 = (v104 - 1) >> 1;
                        v105 = &v126[v104];
                        uint64_t v106 = *v105;
                        unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v107 - v106), (const FactorMetadataKeyValue *)(v107 - v108));
                      }
                      while ((result & 1) != 0);
                      unsigned int *v95 = v108;
                    }
                  }
                }
                BOOL v109 = v87-- <= 2;
                v90 = (uint64_t *)a3;
                v89 = v126;
              }
              while (!v109);
            }
            return result;
          }
          unint64_t v14 = (unint64_t)v13 >> 1;
          id v15 = &v10[(unint64_t)v13 >> 1];
          uint64_t v16 = *(void *)(*(void *)v8 + 32);
          uint64_t v17 = *(void *)(*(void *)v8 + 40);
          if ((unint64_t)v12 < 0x201)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v15, v10, v118, v16, v17);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v15, v118, v16, v17);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10 + 1, v15 - 1, v115, *(void *)(*(void *)v8 + 32), *(void *)(*(void *)v8 + 40));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10 + 2, &v10[v14 + 1], v114, *(void *)(*(void *)v8 + 32), *(void *)(*(void *)v8 + 40));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v15 - 1, v15, &v10[v14 + 1], *(void *)(*(void *)v8 + 32), *(void *)(*(void *)v8 + 40));
            unsigned int v18 = *v10;
            *unint64_t v10 = *v15;
            *id v15 = v18;
          }
          --a4;
          uint64_t v19 = *(void *)v8;
          uint64_t v20 = *v10;
          if (a5) {
            break;
          }
          uint64_t v23 = *(void *)(v19 + 32);
          uint64_t v22 = *(void *)(v19 + 40);
          uint64_t v24 = v22 + v23;
          v25 = (FactorMetadataKeyValue *)(v22 + v23 - v20);
          if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v22 + v23 - *(v10 - 1)), v25))
          {
            uint64_t v21 = a4;
            goto LABEL_14;
          }
          unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v22 + v23 - v20), (const FactorMetadataKeyValue *)(v24 - *v118));
          if (result)
          {
            unint64_t v11 = v10;
            do
            {
              unsigned int v42 = v11[1];
              ++v11;
              unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v22 + v23 - v20), (const FactorMetadataKeyValue *)(v24 - v42));
            }
            while ((result & 1) == 0);
          }
          else
          {
            v43 = v10 + 1;
            do
            {
              unint64_t v11 = v43;
              if (v43 >= v124) {
                break;
              }
              ++v43;
              unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - *v11));
            }
            while (!result);
          }
          v44 = v124;
          if (v11 < v124)
          {
            v44 = v124;
            do
            {
              unsigned int v45 = *--v44;
              unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - v45));
            }
            while ((result & 1) != 0);
          }
          if (v11 < v44)
          {
            unsigned int v46 = *v11;
            unsigned int v47 = *v44;
            do
            {
              unsigned int *v11 = v47;
              unsigned int *v44 = v46;
              do
              {
                unsigned int v48 = v11[1];
                ++v11;
                unsigned int v46 = v48;
              }
              while (!FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - v48)));
              do
              {
                unsigned int v49 = *--v44;
                unsigned int v47 = v49;
                unint64_t result = FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - v49));
              }
              while ((result & 1) != 0);
            }
            while (v11 < v44);
          }
          v50 = v11 - 1;
          BOOL v5 = v11 - 1 >= v10;
          BOOL v6 = v11 - 1 == v10;
          if (v11 - 1 != v10) {
            *unint64_t v10 = *v50;
          }
          a5 = 0;
          unsigned int *v50 = v20;
          uint64_t v8 = a3;
          a2 = v124;
        }
        uint64_t v21 = a4;
        uint64_t v23 = *(void *)(v19 + 32);
        uint64_t v22 = *(void *)(v19 + 40);
LABEL_14:
        uint64_t v26 = 0;
        uint64_t v27 = v22 + v23;
        v28 = (const FactorMetadataKeyValue *)(v22 + v23 - v20);
        do
          uint64_t v29 = v10[++v26];
        while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v29), v28));
        uint64_t v30 = &v10[v26];
        v31 = v124;
        if (v26 == 1)
        {
          v31 = v124;
          do
          {
            if (v30 >= v31) {
              break;
            }
            unsigned int v33 = *--v31;
          }
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v33), v28));
        }
        else
        {
          do
            unsigned int v32 = *--v31;
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v32), v28));
        }
        if (v30 >= v31)
        {
          v40 = v30 - 1;
        }
        else
        {
          unsigned int v34 = *v31;
          unsigned int v35 = v29;
          v36 = v30;
          v37 = v31;
          do
          {
            unsigned int *v36 = v34;
            unsigned int *v37 = v35;
            do
            {
              unsigned int v38 = v36[1];
              ++v36;
              unsigned int v35 = v38;
            }
            while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v38), v28));
            do
            {
              unsigned int v39 = *--v37;
              unsigned int v34 = v39;
            }
            while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v39), v28));
          }
          while (v36 < v37);
          v40 = v36 - 1;
          unint64_t v10 = v126;
        }
        a4 = v21;
        if (v40 != v10) {
          *unint64_t v10 = *v40;
        }
        unsigned int *v40 = v20;
        uint64_t v8 = a3;
        a2 = v124;
        if (v30 >= v31) {
          break;
        }
LABEL_35:
        unint64_t result = std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *,false>(v10, v40, a3, a4, a5 & 1);
        a5 = 0;
        unint64_t v11 = v40 + 1;
      }
      BOOL v41 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v40, a3);
      unint64_t v11 = v40 + 1;
      unint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v40 + 1, v124, a3);
      if (result) {
        break;
      }
      if (!v41) {
        goto LABEL_35;
      }
    }
    a2 = v40;
    if (!v41) {
      continue;
    }
    return result;
  }
}

BOOL std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(_DWORD *a1, _DWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *a2;
  uint64_t v9 = a5 + a4;
  unint64_t v10 = (FactorMetadataKeyValue *)(a5 + a4 - v8);
  uint64_t v11 = *a1;
  uint64_t v12 = (const FactorMetadataKeyValue *)(a5 + a4 - v11);
  BOOL v13 = FactorMetadataKeyValue::KeyCompareLessThan(v10, v12);
  uint64_t v14 = *a3;
  BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v14), v10);
  if (v13)
  {
    if (result)
    {
      *a1 = v14;
    }
    else
    {
      *a1 = v8;
      *a2 = v11;
      uint64_t v18 = *a3;
      BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v18), v12);
      if (!result) {
        return result;
      }
      *a2 = v18;
    }
    *a3 = v11;
  }
  else if (result)
  {
    *a2 = v14;
    *a3 = v8;
    uint64_t v16 = *a2;
    uint64_t v17 = *a1;
    BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v16), (const FactorMetadataKeyValue *)(v9 - v17));
    if (result)
    {
      *a1 = v16;
      *a2 = v17;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = *(a2 - 1);
      uint64_t v9 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      uint64_t v10 = *a1;
      if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v8), (const FactorMetadataKeyValue *)(v9 - v10)))
      {
        *a1 = v8;
        *(a2 - 1) = v10;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a2 - 1, *(void *)(*(void *)a3 + 32), *(void *)(*(void *)a3 + 40));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, *(void *)(*(void *)a3 + 32), *(void *)(*(void *)a3 + 40));
      uint64_t v12 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      int v13 = 0;
      uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      uint64_t v15 = 12;
      break;
  }
  while (1)
  {
    uint64_t v16 = *v12;
    uint64_t v17 = *v11;
    if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17)))
    {
      uint64_t v18 = v15;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v18) = v17;
        uint64_t v19 = v18 - 4;
        if (v18 == 4) {
          break;
        }
        uint64_t v17 = *(unsigned int *)((char *)a1 + v18 - 8);
        BOOL v20 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17));
        uint64_t v18 = v19;
        if (!v20)
        {
          uint64_t v21 = (unsigned int *)((char *)a1 + v19);
          goto LABEL_12;
        }
      }
      uint64_t v21 = a1;
LABEL_12:
      *uint64_t v21 = v16;
      if (++v13 == 8) {
        return v12 + 1 == a2;
      }
    }
    uint64_t v11 = v12;
    v15 += 4;
    if (++v12 == a2) {
      return 1;
    }
  }
}

BOOL FactorMetadataKeyValue::KeyCompareLessThan(FactorMetadataKeyValue *this, const FactorMetadataKeyValue *a2)
{
  uint64_t v2 = &this[*(unsigned __int16 *)this[-*(int *)this->var0 + 4].var0];
  char v3 = &v2[*(unsigned int *)v2->var0];
  uint64_t v4 = &a2[*(unsigned __int16 *)a2[-*(int *)a2->var0 + 4].var0];
  uint64_t v5 = *(unsigned int *)v4->var0;
  unsigned int v8 = *(_DWORD *)v3->var0;
  uint64_t v6 = v3 + 4;
  unsigned int v7 = v8;
  unsigned int v9 = *(_DWORD *)v4[v5].var0;
  if (v9 >= v8) {
    size_t v10 = v7;
  }
  else {
    size_t v10 = v9;
  }
  int v11 = memcmp(v6, &v4[v5 + 4], v10);
  if (v11) {
    return v11 < 0;
  }
  else {
    return v7 < v9;
  }
}

BOOL std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, uint64_t a5)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a2, a3, *(void *)(*(void *)a5 + 32), *(void *)(*(void *)a5 + 40));
  uint64_t v10 = *a4;
  uint64_t v11 = *(void *)(*(void *)a5 + 40) + *(void *)(*(void *)a5 + 32);
  uint64_t v12 = *a3;
  BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v11 - v10), (const FactorMetadataKeyValue *)(v11 - v12));
  if (result)
  {
    *a3 = v10;
    *a4 = v12;
    uint64_t v14 = *a3;
    uint64_t v15 = *a2;
    BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v11 - v14), (const FactorMetadataKeyValue *)(v11 - v15));
    if (result)
    {
      *a2 = v14;
      *a3 = v15;
      uint64_t v16 = *a2;
      uint64_t v17 = *a1;
      BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v11 - v16), (const FactorMetadataKeyValue *)(v11 - v17));
      if (result)
      {
        *a1 = v16;
        *a2 = v17;
      }
    }
  }
  return result;
}

BOOL std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, uint64_t a6)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a2, a3, a4, a6);
  uint64_t v12 = *a5;
  uint64_t v13 = *(void *)(*(void *)a6 + 40) + *(void *)(*(void *)a6 + 32);
  uint64_t v14 = *a4;
  BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v12), (const FactorMetadataKeyValue *)(v13 - v14));
  if (result)
  {
    *a4 = v12;
    *a5 = v14;
    uint64_t v16 = *a4;
    uint64_t v17 = *a3;
    BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v16), (const FactorMetadataKeyValue *)(v13 - v17));
    if (result)
    {
      *a3 = v16;
      *a4 = v17;
      uint64_t v18 = *a3;
      uint64_t v19 = *a2;
      BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v18), (const FactorMetadataKeyValue *)(v13 - v19));
      if (result)
      {
        *a2 = v18;
        *a3 = v19;
        uint64_t v20 = *a2;
        uint64_t v21 = *a1;
        BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v20), (const FactorMetadataKeyValue *)(v13 - v21));
        if (result)
        {
          *a1 = v20;
          *a2 = v21;
        }
      }
    }
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  *((unsigned char *)this + 70) = 1;
  uint64_t v6 = a3 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, 4uLL);
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, int a2)
{
  if (!*((unsigned char *)this + 70)) {
    __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
  }
  *((unsigned char *)this + 70) = 0;
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, a2);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((void *)this + 9) < a3) {
    *((void *)this + 9) = a3;
  }
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = a3;
  uint64_t v10 = (unsigned int *)result;
  while (2)
  {
    v118 = a2 - 1;
    v114 = a2 - 3;
    v115 = a2 - 2;
    uint64_t v11 = v10;
    v124 = a2;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v10 = v11;
          uint64_t v12 = (char *)a2 - (char *)v11;
          uint64_t v13 = a2 - v11;
          if (v6 || !v5)
          {
            switch(v13)
            {
              case 0:
              case 1:
                return result;
              case 2:
                uint64_t v51 = *(a2 - 1);
                uint64_t v52 = *(void *)(*(void *)v8 + 40) + *(void *)(*(void *)v8 + 32);
                uint64_t v53 = *v10;
                BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v52 - v51), (const FactorMetadataKeyValue *)(v52 - v53));
                if (result)
                {
                  *uint64_t v10 = v51;
                  *(a2 - 1) = v53;
                }
                break;
              case 3:
                uint64_t v54 = *(void *)(*(void *)v8 + 32);
                uint64_t v55 = *(void *)(*(void *)v8 + 40);
                BOOL result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v10 + 1, v118, v54, v55);
                break;
              case 4:
                BOOL result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v10 + 1, v10 + 2, v118, v8);
                break;
              case 5:
                BOOL result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v10 + 1, v10 + 2, v10 + 3, v118, v8);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          v126 = v10;
          if (v12 <= 95)
          {
            v56 = v10 + 1;
            BOOL v58 = v10 == a2 || v56 == a2;
            if (a5)
            {
              if (!v58)
              {
                uint64_t v59 = 0;
                uint64_t v60 = *(void *)(*(void *)v8 + 40) + *(void *)(*(void *)v8 + 32);
                v61 = v10;
                do
                {
                  uint64_t v63 = *v61;
                  uint64_t v62 = v61[1];
                  v61 = v56;
                  BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v60 - v62), (const FactorMetadataKeyValue *)(v60 - v63));
                  if (result)
                  {
                    uint64_t v64 = v59;
                    while (1)
                    {
                      *(unsigned int *)((char *)v126 + v64 + 4) = v63;
                      if (!v64) {
                        break;
                      }
                      uint64_t v63 = *(unsigned int *)((char *)v126 + v64 - 4);
                      BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v60 - v62), (const FactorMetadataKeyValue *)(v60 - v63));
                      v64 -= 4;
                      if ((result & 1) == 0)
                      {
                        v65 = (unsigned int *)((char *)v126 + v64 + 4);
                        goto LABEL_84;
                      }
                    }
                    v65 = v126;
LABEL_84:
                    unsigned int *v65 = v62;
                  }
                  v56 = v61 + 1;
                  v59 += 4;
                }
                while (v61 + 1 != a2);
              }
            }
            else if (!v58)
            {
              uint64_t v110 = *(void *)(*(void *)v8 + 40) + *(void *)(*(void *)v8 + 32);
              do
              {
                uint64_t v112 = *v10;
                uint64_t v111 = v10[1];
                uint64_t v10 = v56;
                BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v110 - v111), (const FactorMetadataKeyValue *)(v110 - v112));
                if (result)
                {
                  v113 = v10;
                  do
                  {
                    unsigned int *v113 = v112;
                    uint64_t v112 = *(v113 - 2);
                    BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v110 - v111), (const FactorMetadataKeyValue *)(v110 - v112));
                    --v113;
                  }
                  while ((result & 1) != 0);
                  unsigned int *v113 = v111;
                }
                v56 = v10 + 1;
              }
              while (v10 + 1 != a2);
            }
            return result;
          }
          if (!a4)
          {
            if (v10 != a2)
            {
              unint64_t v116 = v12;
              uint64_t v117 = v13;
              int64_t v66 = (unint64_t)(v13 - 2) >> 1;
              int64_t v67 = v66;
              do
              {
                int64_t v68 = v67;
                if (v66 >= v67)
                {
                  uint64_t v69 = *(void *)a3;
                  int64_t v122 = v68;
                  uint64_t v70 = (2 * v68) | 1;
                  v71 = v126;
                  v72 = &v126[v70];
                  uint64_t v73 = 2 * v68 + 2;
                  if (v73 < v13)
                  {
                    uint64_t v74 = *v72;
                    uint64_t v78 = *(void *)(v69 + 32);
                    uint64_t v77 = *(void *)(v69 + 40);
                    uint64_t v76 = v72[1];
                    BOOL v75 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v77 + v78 - v74), (const FactorMetadataKeyValue *)(v77 + v78 - v76));
                    if (v75) {
                      ++v72;
                    }
                    else {
                      LODWORD(v76) = v74;
                    }
                    v71 = v126;
                    if (v75) {
                      uint64_t v70 = v73;
                    }
                  }
                  else
                  {
                    LODWORD(v76) = *v72;
                    uint64_t v78 = *(void *)(v69 + 32);
                    uint64_t v77 = *(void *)(v69 + 40);
                  }
                  int64_t v68 = v122;
                  v79 = &v71[v122];
                  uint64_t v80 = v77 + v78;
                  uint64_t v119 = *v79;
                  v81 = (const FactorMetadataKeyValue *)(v80 - v119);
                  BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v80 - v76), (const FactorMetadataKeyValue *)(v80 - v119));
                  if ((result & 1) == 0)
                  {
                    do
                    {
                      unsigned int *v79 = v76;
                      v79 = v72;
                      if (v66 < v70) {
                        break;
                      }
                      uint64_t v82 = (2 * v70) | 1;
                      v72 = &v126[v82];
                      uint64_t v70 = 2 * v70 + 2;
                      if (v70 < v13)
                      {
                        uint64_t v76 = *v72;
                        v83 = v81;
                        int64_t v84 = v66;
                        uint64_t v85 = v72[1];
                        BOOL v86 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v80 - v76), (const FactorMetadataKeyValue *)(v80 - v85));
                        if (v86) {
                          LODWORD(v76) = v85;
                        }
                        int64_t v66 = v84;
                        v81 = v83;
                        uint64_t v13 = v117;
                        if (v86) {
                          ++v72;
                        }
                        else {
                          uint64_t v70 = v82;
                        }
                      }
                      else
                      {
                        LODWORD(v76) = *v72;
                        uint64_t v70 = v82;
                      }
                      BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v80 - v76), v81);
                    }
                    while (!result);
                    int64_t v68 = v122;
                    unsigned int *v79 = v119;
                  }
                }
                int64_t v67 = v68 - 1;
              }
              while (v68);
              uint64_t v87 = v116 >> 2;
              v88 = v124;
              v89 = v126;
              v90 = (uint64_t *)a3;
              do
              {
                v125 = v88;
                uint64_t v91 = 0;
                unsigned int v120 = *v89;
                uint64_t v92 = *v90;
                uint64_t v93 = v87 - 2;
                if (v87 < 2) {
                  uint64_t v93 = v87 - 1;
                }
                uint64_t v94 = v93 >> 1;
                do
                {
                  v95 = &v89[v91 + 1];
                  uint64_t v96 = (2 * v91) | 1;
                  uint64_t v97 = 2 * v91 + 2;
                  if (v97 >= v87)
                  {
                    unsigned int v101 = *v95;
                    uint64_t v91 = (2 * v91) | 1;
                  }
                  else
                  {
                    uint64_t v98 = *v95;
                    uint64_t v99 = *(void *)(v92 + 40) + *(void *)(v92 + 32);
                    uint64_t v100 = v95[1];
                    BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v99 - v98), (const FactorMetadataKeyValue *)(v99 - v100));
                    if (result) {
                      unsigned int v101 = v100;
                    }
                    else {
                      unsigned int v101 = v98;
                    }
                    if (result)
                    {
                      ++v95;
                      uint64_t v91 = v97;
                    }
                    else
                    {
                      uint64_t v91 = v96;
                    }
                  }
                  unsigned int *v89 = v101;
                  v89 = v95;
                }
                while (v91 <= v94);
                v102 = v125 - 1;
                if (v95 == v125 - 1)
                {
                  v88 = v125 - 1;
                  unsigned int *v95 = v120;
                }
                else
                {
                  unsigned int *v95 = *v102;
                  v88 = v125 - 1;
                  unsigned int *v102 = v120;
                  uint64_t v103 = (char *)v95 - (char *)v126 + 4;
                  if (v103 >= 5)
                  {
                    unint64_t v104 = (((unint64_t)v103 >> 2) - 2) >> 1;
                    v105 = &v126[v104];
                    uint64_t v106 = *v105;
                    uint64_t v107 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
                    uint64_t v108 = *v95;
                    BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v107 - v106), (const FactorMetadataKeyValue *)(v107 - v108));
                    if (result)
                    {
                      do
                      {
                        unsigned int *v95 = v106;
                        v95 = v105;
                        if (!v104) {
                          break;
                        }
                        unint64_t v104 = (v104 - 1) >> 1;
                        v105 = &v126[v104];
                        uint64_t v106 = *v105;
                        BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v107 - v106), (const FactorMetadataKeyValue *)(v107 - v108));
                      }
                      while ((result & 1) != 0);
                      unsigned int *v95 = v108;
                    }
                  }
                }
                BOOL v109 = v87-- <= 2;
                v90 = (uint64_t *)a3;
                v89 = v126;
              }
              while (!v109);
            }
            return result;
          }
          unint64_t v14 = (unint64_t)v13 >> 1;
          uint64_t v15 = &v10[(unint64_t)v13 >> 1];
          uint64_t v16 = *(void *)(*(void *)v8 + 32);
          uint64_t v17 = *(void *)(*(void *)v8 + 40);
          if ((unint64_t)v12 < 0x201)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v15, v10, v118, v16, v17);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10, v15, v118, v16, v17);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10 + 1, v15 - 1, v115, *(void *)(*(void *)v8 + 32), *(void *)(*(void *)v8 + 40));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v10 + 2, &v10[v14 + 1], v114, *(void *)(*(void *)v8 + 32), *(void *)(*(void *)v8 + 40));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v15 - 1, v15, &v10[v14 + 1], *(void *)(*(void *)v8 + 32), *(void *)(*(void *)v8 + 40));
            unsigned int v18 = *v10;
            *uint64_t v10 = *v15;
            *uint64_t v15 = v18;
          }
          --a4;
          uint64_t v19 = *(void *)v8;
          uint64_t v20 = *v10;
          if (a5) {
            break;
          }
          uint64_t v23 = *(void *)(v19 + 32);
          uint64_t v22 = *(void *)(v19 + 40);
          uint64_t v24 = v22 + v23;
          v25 = (FactorMetadataKeyValue *)(v22 + v23 - v20);
          if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v22 + v23 - *(v10 - 1)), v25))
          {
            uint64_t v21 = a4;
            goto LABEL_14;
          }
          BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v22 + v23 - v20), (const FactorMetadataKeyValue *)(v24 - *v118));
          if (result)
          {
            uint64_t v11 = v10;
            do
            {
              unsigned int v42 = v11[1];
              ++v11;
              BOOL result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v22 + v23 - v20), (const FactorMetadataKeyValue *)(v24 - v42));
            }
            while ((result & 1) == 0);
          }
          else
          {
            v43 = v10 + 1;
            do
            {
              uint64_t v11 = v43;
              if (v43 >= v124) {
                break;
              }
              ++v43;
              BOOL result = FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - *v11));
            }
            while (!result);
          }
          v44 = v124;
          if (v11 < v124)
          {
            v44 = v124;
            do
            {
              unsigned int v45 = *--v44;
              BOOL result = FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - v45));
            }
            while ((result & 1) != 0);
          }
          if (v11 < v44)
          {
            unsigned int v46 = *v11;
            unsigned int v47 = *v44;
            do
            {
              unsigned int *v11 = v47;
              unsigned int *v44 = v46;
              do
              {
                unsigned int v48 = v11[1];
                ++v11;
                unsigned int v46 = v48;
              }
              while (!FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - v48)));
              do
              {
                unsigned int v49 = *--v44;
                unsigned int v47 = v49;
                BOOL result = FactorMetadataKeyValue::KeyCompareLessThan(v25, (const FactorMetadataKeyValue *)(v24 - v49));
              }
              while ((result & 1) != 0);
            }
            while (v11 < v44);
          }
          v50 = v11 - 1;
          BOOL v5 = v11 - 1 >= v10;
          BOOL v6 = v11 - 1 == v10;
          if (v11 - 1 != v10) {
            *uint64_t v10 = *v50;
          }
          a5 = 0;
          unsigned int *v50 = v20;
          uint64_t v8 = a3;
          a2 = v124;
        }
        uint64_t v21 = a4;
        uint64_t v23 = *(void *)(v19 + 32);
        uint64_t v22 = *(void *)(v19 + 40);
LABEL_14:
        uint64_t v26 = 0;
        uint64_t v27 = v22 + v23;
        v28 = (const FactorMetadataKeyValue *)(v22 + v23 - v20);
        do
          uint64_t v29 = v10[++v26];
        while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v29), v28));
        uint64_t v30 = &v10[v26];
        v31 = v124;
        if (v26 == 1)
        {
          v31 = v124;
          do
          {
            if (v30 >= v31) {
              break;
            }
            unsigned int v33 = *--v31;
          }
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v33), v28));
        }
        else
        {
          do
            unsigned int v32 = *--v31;
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v32), v28));
        }
        if (v30 >= v31)
        {
          v40 = v30 - 1;
        }
        else
        {
          unsigned int v34 = *v31;
          unsigned int v35 = v29;
          v36 = v30;
          v37 = v31;
          do
          {
            unsigned int *v36 = v34;
            unsigned int *v37 = v35;
            do
            {
              unsigned int v38 = v36[1];
              ++v36;
              unsigned int v35 = v38;
            }
            while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v38), v28));
            do
            {
              unsigned int v39 = *--v37;
              unsigned int v34 = v39;
            }
            while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v27 - v39), v28));
          }
          while (v36 < v37);
          v40 = v36 - 1;
          uint64_t v10 = v126;
        }
        a4 = v21;
        if (v40 != v10) {
          *uint64_t v10 = *v40;
        }
        unsigned int *v40 = v20;
        uint64_t v8 = a3;
        a2 = v124;
        if (v30 >= v31) {
          break;
        }
LABEL_35:
        BOOL result = std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *,false>(v10, v40, a3, a4, a5 & 1);
        a5 = 0;
        uint64_t v11 = v40 + 1;
      }
      BOOL v41 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *>(v10, v40, a3);
      uint64_t v11 = v40 + 1;
      BOOL result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *>(v40 + 1, v124, a3);
      if (result) {
        break;
      }
      if (!v41) {
        goto LABEL_35;
      }
    }
    a2 = v40;
    if (!v41) {
      continue;
    }
    return result;
  }
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *>(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = *(a2 - 1);
      uint64_t v9 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      uint64_t v10 = *a1;
      if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v8), (const FactorMetadataKeyValue *)(v9 - v10)))
      {
        *a1 = v8;
        *(a2 - 1) = v10;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a2 - 1, *(void *)(*(void *)a3 + 32), *(void *)(*(void *)a3 + 40));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, *(void *)(*(void *)a3 + 32), *(void *)(*(void *)a3 + 40));
      uint64_t v12 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      int v13 = 0;
      uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      uint64_t v15 = 12;
      break;
  }
  while (1)
  {
    uint64_t v16 = *v12;
    uint64_t v17 = *v11;
    if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17)))
    {
      uint64_t v18 = v15;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v18) = v17;
        uint64_t v19 = v18 - 4;
        if (v18 == 4) {
          break;
        }
        uint64_t v17 = *(unsigned int *)((char *)a1 + v18 - 8);
        BOOL v20 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17));
        uint64_t v18 = v19;
        if (!v20)
        {
          uint64_t v21 = (unsigned int *)((char *)a1 + v19);
          goto LABEL_12;
        }
      }
      uint64_t v21 = a1;
LABEL_12:
      *uint64_t v21 = v16;
      if (++v13 == 8) {
        return v12 + 1 == a2;
      }
    }
    uint64_t v11 = v12;
    v15 += 4;
    if (++v12 == a2) {
      return 1;
    }
  }
}

uint64_t apple::aiml::flatbuffers2::Verifier::VerifyOffset(apple::aiml::flatbuffers2::Verifier *this, unint64_t a2)
{
  if ((a2 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v2 = *((void *)this + 1);
  if (v2 < 5 || v2 - 4 < a2) {
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)this + a2);
  if ((int)v4 < 1) {
    return 0;
  }
  if (v2 - 1 >= v4 + a2) {
    return v4;
  }
  return 0;
}

BOOL CloudKitTreatmentRecordAsset::Verify(CloudKitTreatmentRecordAsset *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (result)
  {
    BOOL v5 = &this[-*(int *)this->var0];
    unsigned int v6 = *(unsigned __int16 *)v5->var0;
    if (v6 < 5
      || !*(_WORD *)v5[4].var0
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 2)
      && v7 - 1 >= (unint64_t)this[*(unsigned __int16 *)v5[4].var0 - *(void *)a2].var0)
    {
      BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 6u);
      if (result)
      {
        if (v6 >= 7 && *(_WORD *)v5[6].var0) {
          uint64_t v8 = &this[*(unsigned __int16 *)v5[6].var0 + *(unsigned int *)this[*(unsigned __int16 *)v5[6].var0].var0];
        }
        else {
          uint64_t v8 = 0;
        }
        BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v8->var0);
        if (result)
        {
          uint64_t v9 = &this[-*(int *)this->var0];
          unsigned int v10 = *(unsigned __int16 *)v9->var0;
          if (v10 < 9
            || (!*(_WORD *)v9[8].var0
             || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
             && v11 - 4 >= (unint64_t)this[*(unsigned __int16 *)v9[8].var0 - *(void *)a2].var0)
            && (v10 < 0xB
             || (uint64_t v12 = *(unsigned __int16 *)v9[10].var0) == 0
             || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 2)
             && v13 - 1 >= (unint64_t)this[v12 - *(void *)a2].var0))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(apple::aiml::flatbuffers2::Table *this, const apple::aiml::flatbuffers2::Verifier *a2, unsigned int a3)
{
  char v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 > a3
      && (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) != 0
      && apple::aiml::flatbuffers2::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(void *)a2) != 0;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyString(apple::aiml::flatbuffers2::Verifier *a1, const unsigned __int8 *a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v6 = 0;
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString(a1, a2, 1uLL, &v6);
  if (result)
  {
    unint64_t v4 = *((void *)a1 + 1);
    return v4 >= 2 && v4 - 1 >= v6 && *(unsigned char *)(*(void *)a1 + v6) == 0;
  }
  return result;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyTableStart(apple::aiml::flatbuffers2::Verifier *this, const unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)this;
  unint64_t v3 = (unint64_t)&a2[-*(void *)this];
  if ((v3 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 1);
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(int *)a2;
  unsigned int v7 = *((_DWORD *)this + 5);
  unsigned int v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  unsigned int v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)this + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString(apple::aiml::flatbuffers2::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4 = (unint64_t)&a2[-*(void *)this];
  if ((v4 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v5 = *((void *)this + 1);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *((void *)this + 1);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

void std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E5969F38, MEMORY[0x1E4FBA1C8]);
}

void sub_19D943878(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  BOOL result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  BOOL v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x19F3ACBD0);
}

void sub_19D943B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<apple::aiml::flatbuffers2::Offset<void> ()(unsigned long)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unsigned int a2, const char *a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  *((void *)this + 7) = *((void *)this + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, 4, *((void *)this + 9));
  int v5 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(this, a2);
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, v5);
  *((unsigned char *)this + 71) = 1;
  return result;
}

void sub_19D943E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL TrialManagedAsset::Verify(TrialManagedAsset *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (!result) {
    return result;
  }
  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
  if (!result) {
    return result;
  }
  int v5 = &this[-*(int *)this->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0) {
    unint64_t v7 = &this[v6 + *(unsigned int *)this[v6].var0];
  }
  else {
    unint64_t v7 = 0;
  }
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
  if (!result) {
    return result;
  }
  unint64_t v8 = &this[-*(int *)this->var0];
  unsigned int v9 = *(unsigned __int16 *)v8->var0;
  if (v9 >= 7)
  {
    if (*(_WORD *)v8[6].var0)
    {
      BOOL result = 0;
      unint64_t v10 = *((void *)a2 + 1);
      if (v10 < 2 || v10 - 1 < (unint64_t)this[*(unsigned __int16 *)v8[6].var0 - *(void *)a2].var0) {
        return result;
      }
    }
  }
  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 8u);
  if (!result) {
    return result;
  }
  uint64_t v11 = v9 >= 9 && *(_WORD *)v8[8].var0
      ? &this[*(unsigned __int16 *)v8[8].var0 + *(unsigned int *)this[*(unsigned __int16 *)v8[8].var0].var0]
      : 0;
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v11->var0);
  if (!result) {
    return result;
  }
  unint64_t v12 = &this[-*(int *)this->var0];
  unsigned int v13 = *(unsigned __int16 *)v12->var0;
  if (v13 >= 0xB)
  {
    if (*(_WORD *)v12[10].var0)
    {
      BOOL result = 0;
      unint64_t v14 = *((void *)a2 + 1);
      if (v14 < 2 || v14 - 1 < (unint64_t)this[*(unsigned __int16 *)v12[10].var0 - *(void *)a2].var0) {
        return result;
      }
    }
  }
  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 0xCu);
  if (!result) {
    return result;
  }
  if (v13 < 0xD)
  {
    uint64_t v15 = 0;
    if (v13 < 0xB) {
      goto LABEL_31;
    }
  }
  else if (*(_WORD *)v12[12].var0)
  {
    uint64_t v15 = (CloudKitTreatmentRecordAsset *)&this[*(unsigned __int16 *)v12[12].var0
                                              + *(unsigned int *)this[*(unsigned __int16 *)v12[12].var0].var0];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (*(_WORD *)v12[10].var0)
  {
    int v16 = this[*(unsigned __int16 *)v12[10].var0].var0[0];
    goto LABEL_32;
  }
LABEL_31:
  int v16 = 0;
LABEL_32:
  BOOL result = VerifyCloudKitAssetSource(a2, v15, v16);
  if (result)
  {
    uint64_t v17 = &this[-*(int *)this->var0];
    unsigned int v18 = *(unsigned __int16 *)v17->var0;
    if (v18 < 0xF
      || (!*(_WORD *)v17[14].var0
       || (BOOL result = 0, v19 = *((void *)a2 + 1), v19 >= 2)
       && v19 - 1 >= (unint64_t)this[*(unsigned __int16 *)v17[14].var0 - *(void *)a2].var0)
      && (v18 < 0x11
       || !*(_WORD *)v17[16].var0
       || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 9)
       && v20 - 8 >= (unint64_t)this[*(unsigned __int16 *)v17[16].var0 - *(void *)a2].var0))
    {
      BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x12u);
      if (result)
      {
        if (v18 >= 0x13 && *(_WORD *)v17[18].var0) {
          uint64_t v21 = &this[*(unsigned __int16 *)v17[18].var0 + *(unsigned int *)this[*(unsigned __int16 *)v17[18].var0].var0];
        }
        else {
          uint64_t v21 = 0;
        }
        BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v21->var0);
        if (result)
        {
          uint64_t v22 = &this[-*(int *)this->var0];
          if (*(unsigned __int16 *)v22->var0 < 0x15u
            || (uint64_t v23 = *(unsigned __int16 *)v22[20].var0) == 0
            || (BOOL result = 0, v24 = *((void *)a2 + 1), v24 >= 2)
            && v24 - 1 >= (unint64_t)this[v23 - *(void *)a2].var0)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL apple::aiml::flatbuffers2::Table::VerifyOffset(apple::aiml::flatbuffers2::Table *this, const apple::aiml::flatbuffers2::Verifier *a2, unsigned int a3)
{
  unint64_t v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 <= a3
      || (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || apple::aiml::flatbuffers2::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(void *)a2) != 0;
}

BOOL VerifyCloudKitAssetSource(apple::aiml::flatbuffers2::Verifier *a1, CloudKitTreatmentRecordAsset *this, int a3)
{
  if (a3 == 2)
  {
    if (this)
    {
      BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a1, this->var0);
      if (!result) {
        return result;
      }
      --*((_DWORD *)a1 + 4);
    }
    return 1;
  }
  if (a3 != 1 || !this) {
    return 1;
  }
  return CloudKitTreatmentRecordAsset::Verify(this, a1);
}

void sub_19D9443C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MobileAssetReference::Verify(MobileAssetReference *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (result)
  {
    BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
    if (result)
    {
      int v5 = &this[-*(int *)this->var0];
      if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0) {
        unint64_t v7 = &this[v6 + *(unsigned int *)this[v6].var0];
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
      if (result)
      {
        BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 6u);
        if (result)
        {
          unint64_t v8 = &this[-*(int *)this->var0];
          if (*(unsigned __int16 *)v8->var0 >= 7u && (uint64_t v9 = *(unsigned __int16 *)v8[6].var0) != 0) {
            unint64_t v10 = &this[v9 + *(unsigned int *)this[v9].var0];
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v10->var0);
          if (result)
          {
            BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 8u);
            if (result)
            {
              uint64_t v11 = &this[-*(int *)this->var0];
              if (*(unsigned __int16 *)v11->var0 >= 9u && (uint64_t v12 = *(unsigned __int16 *)v11[8].var0) != 0) {
                unsigned int v13 = &this[v12 + *(unsigned int *)this[v12].var0];
              }
              else {
                unsigned int v13 = 0;
              }
              BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v13->var0);
              if (result)
              {
                unint64_t v14 = &this[-*(int *)this->var0];
                unsigned int v15 = *(unsigned __int16 *)v14->var0;
                if (v15 < 0xB
                  || (!*(_WORD *)v14[10].var0
                   || (BOOL result = 0, v16 = *((void *)a2 + 1), v16 >= 2)
                   && v16 - 1 >= (unint64_t)this[*(unsigned __int16 *)v14[10].var0 - *(void *)a2].var0)
                  && (v15 < 0xD
                   || (!*(_WORD *)v14[12].var0
                    || (BOOL result = 0, v17 = *((void *)a2 + 1), v17 >= 2)
                    && v17 - 1 >= (unint64_t)this[*(unsigned __int16 *)v14[12].var0 - *(void *)a2].var0)
                   && (v15 < 0xF
                    || !*(_WORD *)v14[14].var0
                    || (BOOL result = 0, v18 = *((void *)a2 + 1), v18 >= 9)
                    && v18 - 8 >= (unint64_t)this[*(unsigned __int16 *)v14[14].var0 - *(void *)a2].var0)))
                {
                  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x10u);
                  if (result)
                  {
                    if (v15 >= 0x11 && *(_WORD *)v14[16].var0) {
                      unint64_t v19 = &this[*(unsigned __int16 *)v14[16].var0
                    }
                                + *(unsigned int *)this[*(unsigned __int16 *)v14[16].var0].var0];
                    else {
                      unint64_t v19 = 0;
                    }
                    BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v19->var0);
                    if (result)
                    {
                      --*((_DWORD *)a2 + 4);
                      return 1;
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
  return result;
}

void sub_19D94480C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL FactorMetadataKeyValue::Verify(FactorMetadataKeyValue *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (result)
  {
    BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
    if (result)
    {
      int v5 = &this[-*(int *)this->var0];
      if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0) {
        unint64_t v7 = &this[v6 + *(unsigned int *)this[v6].var0];
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
      if (result)
      {
        BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 6u);
        if (result)
        {
          unint64_t v8 = &this[-*(int *)this->var0];
          if (*(unsigned __int16 *)v8->var0 >= 7u && (uint64_t v9 = *(unsigned __int16 *)v8[6].var0) != 0) {
            unint64_t v10 = &this[v9 + *(unsigned int *)this[v9].var0];
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v10->var0);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

uint64_t apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>::KeyCompare<char const*>(const char **a1, unsigned int *a2)
{
  uint64_t v2 = (int *)((char *)a2 + *a2);
  unint64_t v3 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v3 >= 5u && (uint64_t v4 = v3[2]) != 0) {
    int v5 = (char *)v2 + v4 + *(unsigned int *)((char *)v2 + v4);
  }
  else {
    int v5 = 0;
  }
  return -strcmp(v5 + 4, *a1);
}

BOOL FactorLevel::Verify(FactorLevel *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (!result) {
    return result;
  }
  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
  if (!result) {
    return result;
  }
  int v5 = &this[-*(int *)this->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0) {
    unint64_t v7 = &this[v6 + *(unsigned int *)this[v6].var0];
  }
  else {
    unint64_t v7 = 0;
  }
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
  if (!result) {
    return result;
  }
  unint64_t v8 = &this[-*(int *)this->var0];
  unsigned int v9 = *(unsigned __int16 *)v8->var0;
  if (v9 >= 7)
  {
    if (*(_WORD *)v8[6].var0)
    {
      BOOL result = 0;
      unint64_t v10 = *((void *)a2 + 1);
      if (v10 < 2 || v10 - 1 < (unint64_t)this[*(unsigned __int16 *)v8[6].var0 - *(void *)a2].var0) {
        return result;
      }
    }
  }
  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 8u);
  if (!result) {
    return result;
  }
  if (v9 < 9)
  {
    if (v9 < 7) {
      goto LABEL_33;
    }
  }
  else if (*(_WORD *)v8[8].var0)
  {
    uint64_t v11 = (TrialManagedAsset *)&this[*(unsigned __int16 *)v8[8].var0
                                   + *(unsigned int *)this[*(unsigned __int16 *)v8[8].var0].var0];
    goto LABEL_18;
  }
  uint64_t v11 = 0;
LABEL_18:
  if (*(_WORD *)v8[6].var0)
  {
    switch(this[*(unsigned __int16 *)v8[6].var0].var0[0])
    {
      case 1u:
        BOOL result = 0;
        unint64_t v15 = *((void *)a2 + 1);
        if (v15 < 2) {
          return result;
        }
        unsigned int v13 = &v11[-*(void *)a2];
        unint64_t v14 = v15 - 1;
        goto LABEL_24;
      case 2u:
        if (apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v11->var0)) {
          break;
        }
        return 0;
      case 3u:
      case 4u:
        BOOL result = 0;
        unint64_t v12 = *((void *)a2 + 1);
        if (v12 < 9) {
          return result;
        }
        unsigned int v13 = &v11[-*(void *)a2];
        unint64_t v14 = v12 - 8;
LABEL_24:
        if (v14 < (unint64_t)v13) {
          return result;
        }
        break;
      case 5u:
        if (!v11 || TrialManagedAsset::Verify(v11, a2)) {
          break;
        }
        return 0;
      case 6u:
        if (!v11) {
          break;
        }
        BOOL result = MobileAssetReference::Verify((MobileAssetReference *)v11, a2);
        if (result) {
          break;
        }
        return result;
      default:
        break;
    }
  }
LABEL_33:
  BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 0xAu);
  if (!result) {
    return result;
  }
  unint64_t v16 = 0;
  uint64_t v17 = *(int *)this->var0;
  if (*(unsigned __int16 *)this[-v17].var0 >= 0xBu)
  {
    if (!*(_WORD *)this[-v17 + 10].var0) {
      goto LABEL_38;
    }
    BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString(a2, this[*(unsigned __int16 *)this[-v17 + 10].var0+ *(unsigned int *)this[*(unsigned __int16 *)this[-v17 + 10].var0].var0].var0, 4uLL, 0);
    if (!result) {
      return result;
    }
    unint64_t v16 = 0;
    uint64_t v17 = *(int *)this->var0;
    if (*(unsigned __int16 *)this[-v17].var0 >= 0xBu)
    {
LABEL_38:
      uint64_t v18 = *(unsigned __int16 *)this[-v17 + 10].var0;
      if (v18) {
        unint64_t v16 = (FactorMetadataKeyValue *)&this[v18 + *(unsigned int *)this[v18].var0];
      }
      else {
        unint64_t v16 = 0;
      }
    }
  }
  BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<FactorMetadataKeyValue>(a2, v16);
  if (result)
  {
    unint64_t v19 = &this[-*(int *)this->var0];
    unsigned int v20 = *(unsigned __int16 *)v19->var0;
    if (v20 < 0xD
      || !*(_WORD *)v19[12].var0
      || (BOOL result = 0, v21 = *((void *)a2 + 1), v21 >= 5)
      && v21 - 4 >= (unint64_t)this[*(unsigned __int16 *)v19[12].var0 - *(void *)a2].var0)
    {
      BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0xEu);
      if (result)
      {
        uint64_t v22 = v20 >= 0xF && *(_WORD *)v19[14].var0
            ? &this[*(unsigned __int16 *)v19[14].var0 + *(unsigned int *)this[*(unsigned __int16 *)v19[14].var0].var0]
            : 0;
        BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v22->var0);
        if (result)
        {
          BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x10u);
          if (result)
          {
            uint64_t v23 = &this[-*(int *)this->var0];
            if (*(unsigned __int16 *)v23->var0 >= 0x11u && (uint64_t v24 = *(unsigned __int16 *)v23[16].var0) != 0) {
              v25 = &this[v24 + *(unsigned int *)this[v24].var0];
            }
            else {
              v25 = 0;
            }
            BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v25->var0);
            if (result)
            {
              BOOL result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x12u);
              if (result)
              {
                uint64_t v26 = &this[-*(int *)this->var0];
                if (*(unsigned __int16 *)v26->var0 >= 0x13u && (uint64_t v27 = *(unsigned __int16 *)v26[18].var0) != 0) {
                  v28 = &this[v27 + *(unsigned int *)this[v27].var0];
                }
                else {
                  v28 = 0;
                }
                BOOL result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v28->var0);
                if (result)
                {
                  uint64_t v29 = &this[-*(int *)this->var0];
                  if (*(unsigned __int16 *)v29->var0 < 0x15u
                    || (uint64_t v30 = *(unsigned __int16 *)v29[20].var0) == 0
                    || (BOOL result = 0, v31 = *((void *)a2 + 1), v31 >= 5)
                    && v31 - 4 >= (unint64_t)this[v30 - *(void *)a2].var0)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<FactorMetadataKeyValue>(apple::aiml::flatbuffers2::Verifier *a1, FactorMetadataKeyValue *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*(_DWORD *)a2->var0) {
    return 1;
  }
  unint64_t v4 = 0;
  int v5 = a2 + 4;
  do
  {
    BOOL result = FactorMetadataKeyValue::Verify(&v5[*(unsigned int *)v5->var0], a1);
    if (!result) {
      break;
    }
    ++v4;
    v5 += 4;
  }
  while (v4 < *(unsigned int *)a2->var0);
  return result;
}

uint64_t apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorLevel>>::KeyCompare<char const*>(const char **a1, unsigned int *a2)
{
  uint64_t v2 = (int *)((char *)a2 + *a2);
  unint64_t v3 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v3 >= 5u && (uint64_t v4 = v3[2]) != 0) {
    int v5 = (char *)v2 + v4 + *(unsigned int *)((char *)v2 + v4);
  }
  else {
    int v5 = 0;
  }
  return -strcmp(v5 + 4, *a1);
}

void sub_19D94506C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9452AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(unsigned long,BoxedBool *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_19D945590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D9457D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(unsigned long,BoxedInt64 *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_19D945AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D945CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(unsigned long,BoxedDouble *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_19D945FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D946FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D94A2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D94A704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D94C77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_ANEDeviceInfoClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1EB3B7840;
  uint64_t v7 = qword_1EB3B7840;
  if (!qword_1EB3B7840)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_ANEDeviceInfoClass_block_invoke;
    v3[3] = &unk_1E596AD58;
    v3[4] = &v4;
    __get_ANEDeviceInfoClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19D94CBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTIInputModeControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB3B7838)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __TextInputLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E596AD78;
    uint64_t v8 = 0;
    qword_1EB3B7838 = _sl_dlopen();
  }
  if (!qword_1EB3B7838)
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *TextInputLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"TRISystemInfo.m", 29, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("TIInputModeController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v5 = [NSString stringWithUTF8String:"Class getTIInputModeControllerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"TRISystemInfo.m", 30, @"Unable to find class %s", "TIInputModeController");

LABEL_10:
    __break(1u);
  }
  qword_1EB3B7830 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TextInputLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3B7838 = result;
  return result;
}

uint64_t __AppleNeuralEngineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB3B7848 = result;
  return result;
}

void sub_19D94DA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D94E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D9538C4(_Unwind_Exception *a1)
{
}

void sub_19D953F58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x19D953E90);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TRITripersistedEvaluationStatusRoot_FileDescriptor()
{
  uint64_t result = TRITripersistedEvaluationStatusRoot_FileDescriptor_descriptor;
  if (!TRITripersistedEvaluationStatusRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [objc_alloc(MEMORY[0x1E4FB05E0]) initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITripersistedEvaluationStatusRoot_FileDescriptor_descriptor = result;
  }
  return result;
}

uint64_t TRIPersistedFactorsState_ClearStateOneOfCase(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return MEMORY[0x1F4165050](a1, v2, 0xFFFFFFFFLL, 0);
}

void sub_19D957AB4(_Unwind_Exception *a1)
{
}

void sub_19D9582D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19D9587A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(void))(a10 + 16))();
  }
  _Unwind_Resume(exception_object);
}

void sub_19D958AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_19D958DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19D959350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_19D9597B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_19D959AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19D95A09C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19D95ACBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D95B548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D95BC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D95BE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D95BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D95C298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  CoreTelephonyLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CoreTelephonyClient");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCoreTelephonyClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v3 = [NSString stringWithUTF8String:"Class getCoreTelephonyClientClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TRICellularParameterManager.m", 29, @"Unable to find class %s", "CoreTelephonyClient");

    __break(1u);
  }
}

void CoreTelephonyLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreTelephonyLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E596B2B8;
    uint64_t v5 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *CoreTelephonyLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"TRICellularParameterManager.m", 28, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreTelephonyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreTelephonyLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCTBundleClass_block_invoke(uint64_t a1)
{
  CoreTelephonyLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CTBundle");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCTBundleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v3 = [NSString stringWithUTF8String:"Class getCTBundleClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TRICellularParameterManager.m", 30, @"Unable to find class %s", "CTBundle");

    __break(1u);
  }
}

id TRIValidateFactorPackId(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"NSString<TRIFactorPackId> * _Nullable TRIValidateFactorPackId(NSString * _Nonnull __strong)"];
    [v5 handleFailureInFunction:v6, @"TRIStrongTypingProtocols.m", 17, @"Invalid parameter not satisfying: %@", @"factorPackId" file lineNumber description];
  }
  if ([v1 triIsPathSafePlausibleUniqueId])
  {
    id v2 = v1;
  }
  else
  {
    unint64_t v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v1;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for a factor pack ID: %@", buf, 0xCu);
    }

    id v2 = 0;
  }

  return v2;
}

id TRIValidateFactorPackSetId(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"NSString<TRIFactorPackSetId> * _Nullable TRIValidateFactorPackSetId(NSString * _Nonnull __strong)"];
    [v5 handleFailureInFunction:v6, @"TRIStrongTypingProtocols.m", 28, @"Invalid parameter not satisfying: %@", @"factorPackSetId" file lineNumber description];
  }
  if ([v1 triIsPathSafePlausibleUniqueId])
  {
    id v2 = v1;
  }
  else
  {
    unint64_t v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v1;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for a factor pack set ID: %@", buf, 0xCu);
    }

    id v2 = 0;
  }

  return v2;
}

id TRIValidateAssetId(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"NSString<TRIAssetId> * _Nullable TRIValidateAssetId(NSString * _Nonnull __strong)"];
    [v5 handleFailureInFunction:v6, @"TRIStrongTypingProtocols.m", 39, @"Invalid parameter not satisfying: %@", @"assetId" file lineNumber description];
  }
  if ([v1 triIsPathSafePlausibleUniqueId])
  {
    id v2 = v1;
  }
  else
  {
    unint64_t v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v1;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for an asset ID: %@", buf, 0xCu);
    }

    id v2 = 0;
  }

  return v2;
}

id TRIValidateMLRuntimeEvaluationId(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"NSString<TRIMLRuntimeEvaluationId> * _Nullable TRIValidateMLRuntimeEvaluationId(NSString * _Nonnull __strong)"];
    [v5 handleFailureInFunction:v6, @"TRIStrongTypingProtocols.m", 50, @"Invalid parameter not satisfying: %@", @"evalId" file lineNumber description];
  }
  if ([v1 triIsPathSafePlausibleUniqueId])
  {
    id v2 = v1;
  }
  else
  {
    unint64_t v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v1;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for an MLRuntime evaluation ID: %@", buf, 0xCu);
    }

    id v2 = 0;
  }

  return v2;
}

void sub_19D96094C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D960D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D963EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D96402C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19D9641E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D964E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D964FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D965140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D9659DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19D966B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D967120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TRILogCategory_Daemon()
{
  if (qword_1EB3B7988 != -1) {
    dispatch_once(&qword_1EB3B7988, &__block_literal_global_4);
  }
  v0 = (void *)qword_1EB3B7990;
  return v0;
}

id TRILogCategory_Server()
{
  if (qword_1EB3B7998 != -1) {
    dispatch_once(&qword_1EB3B7998, &__block_literal_global_6);
  }
  v0 = (void *)qword_1EB3B79A0;
  return v0;
}

id TRILogCategory_Backtrace()
{
  if (qword_1EB3B79A8 != -1) {
    dispatch_once(&qword_1EB3B79A8, &__block_literal_global_9);
  }
  v0 = (void *)qword_1EB3B79B0;
  return v0;
}

id TRILogCategory_XCTest()
{
  if (qword_1EB3B79B8 != -1) {
    dispatch_once(&qword_1EB3B79B8, &__block_literal_global_12);
  }
  v0 = (void *)qword_1EB3B79C0;
  return v0;
}

id TRILogCategory_InternalTool()
{
  if (qword_1EB3B79C8 != -1) {
    dispatch_once(&qword_1EB3B79C8, &__block_literal_global_15_0);
  }
  v0 = (void *)qword_1EB3B79D0;
  return v0;
}

id TRILogCategory_Archiving()
{
  if (qword_1EB3B79D8 != -1) {
    dispatch_once(&qword_1EB3B79D8, &__block_literal_global_18);
  }
  v0 = (void *)qword_1EB3B79E0;
  return v0;
}

__CFString *TRILoggedNamespaceName(void *a1)
{
  id v1 = a1;
  if (+[TRINamespaceLogPolicy shouldPrivacyFilterNamespace:v1 policy:1])
  {
    uint64_t v2 = @"<private>";
  }
  else
  {
    uint64_t v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_19D96A75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D96AC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D971A5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(exception_object);
    unint64_t v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [v18 name];
      LODWORD(buf) = 138412546;
      *(void *)((char *)&buf + 4) = v17;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v20;
      _os_log_impl(&dword_19D909000, v19, OS_LOG_TYPE_DEFAULT, "could not evaluate BMLT assignment expression \"%@\" -- %@", (uint8_t *)&buf, 0x16u);
    }
    if (v16)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      a11 = *MEMORY[0x1E4F28568];
      uint64_t v22 = [NSString stringWithFormat:@"Failed to evaluate targeting expression. Please verify parameters are valid for expression %@ with parameters %@"];
      a12 = (uint64_t)v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a12 forKeys:&a11 count:1];
      *uint64_t v16 = (id)[v21 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v23];
    }
    [v15 _logBMLTCustomTargetingWithResult:0];

    objc_end_catch();
    JUMPOUT(0x19D971A10);
  }
  _Unwind_Resume(exception_object);
}

void sub_19D982194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TRITripersistedAllocationStatusRoot_FileDescriptor()
{
  uint64_t result = TRITripersistedAllocationStatusRoot_FileDescriptor_descriptor;
  if (!TRITripersistedAllocationStatusRoot_FileDescriptor_descriptor)
  {
    uint64_t result = [objc_alloc(MEMORY[0x1E4FB05E0]) initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    TRITripersistedAllocationStatusRoot_FileDescriptor_descriptor = result;
  }
  return result;
}

void sub_19D98407C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D984438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t AFBIsValidUTF8()
{
  return MEMORY[0x1F410A190]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
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

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1F40F7130]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

uint64_t TRIDeploymentEnvironment_EnumDescriptor()
{
  return MEMORY[0x1F4165030]();
}

uint64_t TRINamespace_NamespaceId_EnumDescriptor()
{
  return MEMORY[0x1F4165040]();
}

uint64_t TRIPBFieldTag()
{
  return MEMORY[0x1F4165048]();
}

uint64_t TRIProject_ProjectId_IsValidValue()
{
  return MEMORY[0x1F4165058]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_copy_path()
{
  return MEMORY[0x1F40CB548]();
}

uint64_t container_create_or_lookup_app_group_paths_for_current_user()
{
  return MEMORY[0x1F40CB568]();
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1F40CB578]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1F40CB618]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1F40CDF68](*(void *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Accounts(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___ACAccountStore(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Accounts)) {
    return dlopenHelper_Accounts(result);
  }
  return result;
}